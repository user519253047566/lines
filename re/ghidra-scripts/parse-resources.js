// Parses the PE resource tree from a hex dump of the loaded .rsrc section.
// usage: node parse-resources.js <evidence-json-file> <output-file> [section base RVA, default 0x60000]
const fs = require('fs');

const [evidenceFile, outFile, baseArg] = process.argv.slice(2);
const baseRva = baseArg ? parseInt(baseArg, 16) : 0x60000;
const raw = fs.readFileSync(evidenceFile, 'utf8');
const evidence = JSON.parse(raw.slice(raw.indexOf('{')));
const buf = Buffer.from(evidence.normalized_result.bytes_hex, 'hex');

const typeNames = { 1: 'CURSOR', 2: 'BITMAP', 3: 'ICON', 4: 'MENU', 5: 'DIALOG', 6: 'STRING', 9: 'ACCELERATOR', 10: 'RCDATA', 14: 'GROUP_ICON', 16: 'VERSION' };
const out = [];
const entries = [];

function readDir(off, path) {
  const named = buf.readUInt16LE(off + 12);
  const ids = buf.readUInt16LE(off + 14);
  for (let i = 0; i < named + ids; i++) {
    const e = off + 16 + i * 8;
    const name = buf.readUInt32LE(e);
    const target = buf.readUInt32LE(e + 4);
    const label = (name & 0x80000000) ? 'name@' + (name & 0x7fffffff) : String(name);
    if (target & 0x80000000) readDir(target & 0x7fffffff, [...path, label]);
    else entries.push({ path: [...path, label], rva: buf.readUInt32LE(target), size: buf.readUInt32LE(target + 4) });
  }
}
readDir(0, []);

out.push('Resource entries:');
for (const e of entries) {
  const t = Number(e.path[0]);
  out.push(`${(typeNames[t] || 'type' + t).padEnd(12)} id=${e.path[1]} lang=${e.path[2]} rva=0x${e.rva.toString(16)} size=${e.size}`);
}

const data = (e) => buf.subarray(e.rva - baseRva, e.rva - baseRva + e.size);
const wstr = (b, st) => { let s = ''; for (;;) { const c = b.readUInt16LE(st.p); st.p += 2; if (c === 0) break; s += String.fromCharCode(c); } return s; };

for (const e of entries.filter((x) => x.path[0] === '4')) {
  const b = data(e);
  out.push('', `MENU id=${e.path[1]}`);
  const st = { p: 4 };
  const walk = (depth) => {
    while (st.p < b.length) {
      const flags = b.readUInt16LE(st.p); st.p += 2;
      if (flags & 0x10) {
        const s = wstr(b, st);
        out.push('  '.repeat(depth) + `POPUP '${s}' flags=0x${flags.toString(16)}`);
        walk(depth + 1);
      } else {
        const id = b.readUInt16LE(st.p); st.p += 2;
        const s = wstr(b, st).replace(/\t/g, '\\t');
        out.push('  '.repeat(depth) + `ITEM id=0x${id.toString(16)} '${s}' flags=0x${flags.toString(16)}`);
      }
      if (flags & 0x80) return;
    }
  };
  walk(1);
}

for (const e of entries.filter((x) => x.path[0] === '9')) {
  const b = data(e);
  out.push('', `ACCELERATOR id=${e.path[1]}`);
  for (let o = 0; o + 8 <= b.length; o += 8) {
    const f = b[o]; const key = b.readUInt16LE(o + 2); const cmd = b.readUInt16LE(o + 4);
    const mods = []; if (f & 1) mods.push('VIRTKEY'); if (f & 4) mods.push('SHIFT'); if (f & 8) mods.push('CTRL'); if (f & 16) mods.push('ALT');
    out.push(`  flags=0x${f.toString(16)} [${mods.join('+')}] key=0x${key.toString(16)} cmd=0x${cmd.toString(16)}`);
    if (f & 0x80) break;
  }
}

const classNames = { 0x80: 'BUTTON', 0x81: 'EDIT', 0x82: 'STATIC', 0x83: 'LISTBOX', 0x84: 'SCROLLBAR', 0x85: 'COMBOBOX' };
for (const e of entries.filter((x) => x.path[0] === '5')) {
  const b = data(e);
  const ex = b.readUInt16LE(0) === 1 && b.readUInt16LE(2) === 0xffff;
  out.push('', `DIALOG${ex ? 'EX' : ''} id=${e.path[1]}`);
  const st = { p: 0 };
  let style;
  if (ex) { style = b.readUInt32LE(12); st.p = 16; } else { style = b.readUInt32LE(0); st.p = 8; }
  const cdit = b.readUInt16LE(st.p); st.p += 2;
  const [x, y, cx, cy] = [0, 2, 4, 6].map((d) => b.readInt16LE(st.p + d)); st.p += 8;
  const skipOrd = () => { const v = b.readUInt16LE(st.p); if (v === 0xffff) st.p += 4; else if (v === 0) st.p += 2; else wstr(b, st); };
  skipOrd(); skipOrd();
  const title = wstr(b, st);
  if (style & 0x40) { st.p += ex ? 6 : 2; wstr(b, st); }
  out.push(`  style=0x${style.toString(16)} pos=(${x},${y}) size=(${cx},${cy}) controls=${cdit} title='${title}'`);
  for (let i = 0; i < cdit; i++) {
    st.p = (st.p + 3) & ~3;
    let cs;
    if (ex) { cs = b.readUInt32LE(st.p + 8); st.p += 12; } else { cs = b.readUInt32LE(st.p); st.p += 8; }
    const [px, py, pcx, pcy] = [0, 2, 4, 6].map((d) => b.readInt16LE(st.p + d)); st.p += 8;
    const cid = b.readUInt16LE(st.p); st.p += ex ? 4 : 2;
    let cname;
    if (b.readUInt16LE(st.p) === 0xffff) { cname = classNames[b.readUInt16LE(st.p + 2)]; st.p += 4; } else cname = wstr(b, st);
    let ttl;
    if (b.readUInt16LE(st.p) === 0xffff) { ttl = '#' + b.readUInt16LE(st.p + 2); st.p += 4; } else ttl = wstr(b, st);
    const extra = b.readUInt16LE(st.p); st.p += 2 + extra;
    out.push(`  - ${cname} id=${cid} pos=(${px},${py}) size=(${pcx},${pcy}) style=0x${cs.toString(16)} text='${ttl.replace(/\r/g, '\\r').replace(/\n/g, '\\n')}'`);
  }
}

for (const e of entries.filter((x) => x.path[0] === '2')) {
  const b = data(e);
  out.push('', `BITMAP id=${e.path[1]}: ${b.readInt32LE(4)}x${b.readInt32LE(8)}, ${b.readUInt16LE(14)} bpp, ${e.size} bytes`);
}

fs.writeFileSync(outFile, out.join('\n') + '\n');
console.log(out.join('\n'));
