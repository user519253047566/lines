# Winlinez / Color Linez for Win32 v1.21 — reverse-engineering reference

Everything in this document was derived from **`WINLINEZ.EXE` itself** (static
analysis: disassembly, decompilation, embedded strings, embedded resources and
data tables). The README/HISTORY files that shipped with the game were **not**
used as a source. The executable was **never run**.

Confidence tags used below:

- **[observed]** read directly from code, data or resources.
- **[inferred]** a reasoned interpretation of observed code (e.g. what a field is for).
- **[unknown]** not decoded.

Companion artifacts (regenerable, see [How to reproduce](#how-to-reproduce)):

| File | Contents |
| --- | --- |
| [re/ghidra-out/decompiled.c](./re/ghidra-out/decompiled.c) | Decompiled C for every function, with the names used in this document |
| [re/ghidra-out/listing.asm](./re/ghidra-out/listing.asm) | Full annotated x86 listing of the code section |
| [re/ghidra-out/functions.txt](./re/ghidra-out/functions.txt) | Function address/size map |
| [re/ghidra-out/resources.txt](./re/ghidra-out/resources.txt) | Decoded menu, accelerators, dialogs, bitmap headers |
| [re/ghidra-scripts/](./re/ghidra-scripts) | The scripts that produced the above |

---

## 1. Identity

| Item | Value | Tag |
| --- | --- | --- |
| File | `WINLINEZ.EXE`, 61,440 bytes | observed |
| SHA-256 | `f6d8a0b60030aace4b1891a49e42863bb765fda0977d843258550732ed2045fc` | observed |
| Format | 32-bit x86 Windows PE, image base `0x400000`, entry point `0x410000` | observed |
| Sections | `.text 0x410000 (0x3400)`, `.data 0x420000 (0x8e00)`, `.bss 0x430000 (0x1200)`, `.idata 0x440000`, `.reloc 0x450000`, `.rsrc 0x460000 (0x2000)` | observed |
| Version resource | Product "Color Linez for Win32", internal name "Color linez", original filename "Winlinez.exe", **FileVersion 1.21**, company "m53group", "Copyright © Ivan Golubev 1998" | observed |
| About dialog credits | "Copyright (c) GAMOS LTD. 1992. Russia"; Programming: Olga Demina; Graphics: Igor Ivkin & Gennady Denisov; Win32 programming, advanced graphics: Ivan Golubev (1998-1999); Special thanks to Andrew Wizard; "This game was written as a present to my brother's birthday!"; "version 1.21" | observed |
| Embedded string at `0x41001d` | `(c) 1998-1999 Ivan Golubev` / `http://members.xoom.com/m53group` (inside `.text`, not referenced by any decoded code) | observed |
| Imports | Only `GDI32`, `USER32`, `KERNEL32` — 70 functions. **No C runtime, no `winmm`/sound API.** | observed |
| Code style | No standard prologues, register-based argument passing (`EAX`/`EDX`/`ECX`/`EBX`), no CRT: it looks like hand-written assembly | inferred |

Notable imports and what they tell us:

- Drawing: `BitBlt`, `CreateCompatibleDC`, `CreateDIBitmap`, `CreatePalette`/`SelectPalette`/`RealizePalette` (256-colour palette sprite sheet), `CreatePen`, `LineTo`, `MoveToEx`, `FillRect`, `DrawTextA`, `CreateFontA`.
- Timing: `SetTimer`/`KillTimer` (one 50 ms timer), `Sleep` (blocking animation delays), `GetTickCount` (RNG seed).
- Persistence: `_lopen`, `_lcreat`, `_lread`, `_lwrite`, `_lclose` (high-score file only).
- UI: `DialogBoxParamA` (modal), `CreateDialogParamA` (modeless statistics window), `MessageBoxA`, `MessageBeep`, `CheckMenuItem`, `LoadAcceleratorsA`.
- The only audio is `MessageBeep(0x40)` on an impossible move.

---

## 2. Program structure

Flow [observed]: `entry (0x410000)` → `WinMain (0x410178)` → registers window class
`LinezWindow`, creates the window, runs a standard message loop (modeless dialog
via `IsDialogMessageA`, then `TranslateAcceleratorA`) → `WndProc (0x41187e)` holds
nearly all game control flow.

Ghidra's automatic analysis stopped after `WinMain` because `WndProc` is only
referenced through a data pointer; the code from `0x4102f9` to `0x41307e` had to be
disassembled with a script (see [Method](#13-method-and-limitations)). All names
below are analyst-assigned.

### Function map

| Address | Name | Role |
| --- | --- | --- |
| `0x4100a8` | `uint_to_decimal` | unsigned int → decimal string (`EAX`=value, `EDX`=dest) |
| `0x4100e9` | `str_len` | strlen |
| `0x410128` | `str_copy` | strcpy (`EAX`=dest, `EDX`=src) |
| `0x410144` | `rand_below` | `rand() % EAX` (see [RNG](#48-random-numbers)) |
| `0x410171` | `srand` | stores seed |
| `0x410178` | `WinMain` | window class, window, message loop |
| `0x4102f9` | `draw_board` | board outline + all 81 cells |
| `0x41042d` | `draw_cell_frame` | blit one cell sprite at a given animation frame |
| `0x4104a5` | `init_next_queue` | fills the 3-colour "next" queue |
| `0x4104c4` | `find_path` | wave-propagation (BFS) pathfinder |
| `0x4107a1` | `pixel_to_cell` | mouse position → board cell |
| `0x4107ec` | `mark_lines_at` | finds/marks lines of ≥5 through a cell |
| `0x410976` | `remove_marked_cells` | vanish animation + removed-ball statistics |
| `0x410a3a` | `count_empty_cells` | free squares |
| `0x410a71` | `spawn_ball` | place the next queued ball |
| `0x410bc6` | `line_score` | points for a cleared line |
| `0x410c5d` | `draw_next_preview` | the 3-ball "Next" preview |
| `0x410d72` | `draw_score_box` | numeric score box |
| `0x410e5a` | `draw_top_bar` | the 43-px top bar |
| `0x41106b` / `0x411196` | `draw_king_figure` / `draw_pretender_figure` | side figures + gauges |
| `0x411313` | `add_score_and_animate` | add points, animate king/pretender gauges |
| `0x411481` | `new_game_setup` | reset board and start a game |
| `0x411525` | `finish_game_and_restart` | end-of-game animation, then new game |
| `0x411640` / `0x41172d` | `load_high_scores` / `save_high_scores` | high-score file I/O |
| `0x4117c5` | `record_high_score` | rank the score, ask for a name |
| `0x41187e` | `WndProc` | main window procedure |
| `0x4121b5` | `RulesDlgProc` | Rules dialog |
| `0x412279` | `HighScoresDlgProc` | High Scores dialog |
| `0x412454` | `EnterNameDlgProc` | name entry ("Congratulations") |
| `0x41260f` | `AboutDlgProc` | About dialog |
| `0x41277c` | `StatisticsDlgProc` | modeless statistics window |
| `0x412a50` | `load_sprite_sheet` | unpack + palette + DIB bitmap |
| `0x412b5d`, `0x412b9d` | `alloc_and_unpack_sprites`, `unpack` | decompressor (internals `0x412c1a`–`0x412ef3`) |
| `0x413080` | `str_append` | strcat |

---

## 3. Data model [observed unless noted]

Key globals (`.bss`/`.data`):

| Address | Name | Meaning |
| --- | --- | --- |
| `0x430040` | `board[81]` | 9×9 cells, row-major `y*9+x` |
| `0x430150` | `next_colors[3]` | queue of the next three ball colours |
| `0x430144` | `score` | current score (32-bit) |
| `0x430160` | `king_score` | score the player must beat (top of high-score table) |
| `0x430184` | `phase` | 0 = chasing the king, 1 = king beaten |
| `0x430010` | `selection_state` | 0 nothing selected, 1 a ball is selected |
| `0x430141`/`0x430142` | `selected_col`/`selected_row` | the selected ball |
| `0x430240` | `removed_counts[8]` | balls removed per colour (index 1–7) |
| `0x430188` | `high_score_table` | 10 × 16-byte entries (14-byte name, `u16` score at +14) |
| `0x42002c` | `king_name` | king's name buffer |
| `0x42003c` | `pretender_label` | constant "Pretender" label drawn under the player figure |
| `0x42004c` | `player_name` | editable name buffer, initially "Pretender" |
| `0x420000` | `line_directions` | direction vectors, see [lines](#45-line-detection) |
| `0x420108` | `packed_sprite_sheet` | compressed sprite sheet (~35 KB) |

### Cell encoding

| Value | Meaning |
| --- | --- |
| `0` | empty |
| `1`–`7` | ball colour (**7 colours**, see [spawning](#46-spawning-new-balls)) |
| `value | 0x40` | temporarily flagged for removal (mask `0x3f` recovers the colour) |
| `8`–`0x59` | temporary wave numbers during pathfinding; always cleared afterwards |

---

## 4. Game rules

### 4.1 Board and pieces

- **9 × 9** board [observed: loops to 9, 81 bytes].
- **7 ball colours** [observed: colours are `rand_below(7)+1`].
- A 3-ball queue `next_colors` is always maintained; it can be hidden but is
  always generated.

### 4.2 Starting a game (`new_game_setup`)

1. Clear all 81 cells and the 8 `removed_counts`.
2. Fill the queue with 3 random colours (`init_next_queue`).
3. Draw the board.
4. Call `spawn_ball` **5 times** → the opening position has **5 balls**.
   (Each call consumes the queue, so the preview ends up showing 3 fresh colours.)
5. `score = 0`, `phase = 0`; redraw score boxes and preview.

### 4.3 Input and selection (`WndProc`, left mouse button only)

- No keyboard play; mouse only. (Keyboard is limited to the menu accelerators.)
- **Click = press and release on the same cell.** The press must be on the board.
- Hit test: `col = (x - board_x) / 36`, `row = (y - board_y) / 36` with C-style
  truncation toward zero, accepted for `0..8` [observed]. Consequently the ~35 px
  band just left of and above the board also maps to column/row 0. The drawn
  cells are offset +2 px from `board_x/board_y`, so the click grid and drawn grid
  differ by 2 px.
- State machine:
  - **Nothing selected**: clicking a ball selects it; clicking an empty cell does nothing.
  - **Ball selected**: clicking **any ball** (including the selected one) redraws
    the old ball idle and selects the clicked ball — **there is no click-to-deselect**.
    Clicking an **empty** cell attempts a move.
- A selected ball animates continuously: a 50 ms timer (`SetTimer`, id `0x1000`)
  increments a tick and draws sprite frame `tick % 6` at the selected cell (a
  6-frame bounce). The timer does nothing while the window is minimised.

### 4.4 Moving a ball (`find_path`)

- Movement is **4-directional** (up/down/left/right), through **empty cells only**.
  No diagonal moves; no jumping over balls.
- Algorithm [observed]: a Lee/BFS wave. The source cell is marked `8`; each pass
  marks every empty orthogonal neighbour of the current wave with `wave+1`
  (scanning up, left, down, right). It stops when the destination is marked or
  the wave counter reaches `0x5a`. If unreachable, all marks are cleared, the
  board is restored, and the move is rejected.
- Path reconstruction walks back from the destination preferring **up, then left,
  then down, then right** among cells whose wave number is one lower. (Only
  affects the animated route, not legality.)
- **Unreachable destination**: `MessageBeep(MB_ICONASTERISK = 0x40)`; the ball
  stays selected; **no turn is consumed**.
- **Reachable**: the ball hops cell-by-cell along the path. Each hop clears the
  previous cell, sets the new cell, draws bounce frame `i % 6`, then `Sleep(50 ms)`
  (UI thread blocks; no input is processed). After the last hop the remaining
  bounce frames are drawn back-to-back, with no delay, until the frame index wraps to 0.

### 4.5 Line detection (`mark_lines_at`)

Run on the moved ball's destination (and on each spawned ball).

- Four axes from `line_directions`: `(-1,0)`, `(-1,-1)`, `(0,-1)`, `(+1,-1)` =
  horizontal, "\\" diagonal, vertical, "/" diagonal. Both directions of each axis
  are scanned.
- For each axis: `count = 1 + (contiguous same-colour cells forward) + (… backward)`.
  Only cells **exactly equal to the colour** count (empty cells and other colours stop the run).
- If `count >= 5` the whole run is flagged (`|0x40`) and `count` is added to a
  running `total`. Otherwise any flags set on that axis are undone.
- If `total > 0` the origin cell is flagged too. The function returns `total`.
- Quirks [observed]:
  - The origin is counted once **per qualifying axis**, so a ball completing two
    lines (a "cross") returns `total = n1 + n2` — the shared ball is counted twice.
  - Each direction scans at most **7** steps, so a full 9-ball line completed by
    a ball at an **end** of the line leaves the far-end ball behind.
  - Minimum line length is **5**; longer runs (6–9) clear entirely.

### 4.6 Spawning new balls (`spawn_ball`)

Called three times after a move that does **not** clear a line (and five times at game start).

For each call [observed]:

1. Count empty cells `E`. If `E == 0`, stop.
2. `k = rand_below(E)`; pick the **k-th empty cell scanning rows top→bottom, left→right**.
3. Place `next_colors[0]` there; shift the queue (`[0]←[1]`, `[1]←[2]`) and set
   `[2] = rand_below(7) + 1`.
4. Spawn animation: frame **6** (small ball) → 50 ms → frame **7** (medium) → 50 ms → frame **0** (full).
5. Run `mark_lines_at` for the new ball. **If a line formed, remove it
   (with the vanish animation) and place another ball from the queue; repeat until
   a ball is placed that does not form a line.**
6. A failed random selection shows `MessageBox("Report me!", "Error")` (defensive, "can't happen").

Consequences:

- A spawn that completes a line is removed **without awarding any score**
  (`line_score`/`add_score_and_animate` are only used for the player's move),
  and the spawn "continues" with the next queued ball.
- Removed spawn balls still add to the **removed-ball statistics** (§7).

### 4.7 Turn resolution (after a successful move)

```
move ball along path
total = mark_lines_at(destination)
if total > 0:
    remove_marked_cells()                     # vanish animation + stats
    score += line_score(total)                # animated gauge update
    # NO new balls are spawned; the player moves again
else:
    spawn_ball() x3                           # §4.6
    if no empty cells remain:
        MessageBox("Game over!", "Color linez", MB_OK | MB_ICONEXCLAMATION)
        record_high_score(); finish_game_and_restart()
    else:
        redraw Next preview; refresh Statistics window if open
```

### 4.7a Scoring (`line_score`)

For a move that clears `n = total` (see double-counting above):

```
score(n) = 10 + 2 · (n − 5)²        for n ≥ 5
```

| n | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| points | 10 | 12 | 18 | 28 | 42 | 60 | 82 | 108 |

(The code computes it iteratively: start `10`, add `2, 6, 10, 14, …` per extra ball.)
Score is a 32-bit value on screen but is stored as a 16-bit value in the high-score table.

### 4.7b Game over

The game ends **only when the board has no empty cell after the three spawns**.
There is no check for "no legal moves" otherwise. A clearing move can never end the game.

### 4.8 Random numbers

`rand_below(n)`: `seed = seed × 0x41C64E6D + 0x3039` (mod 2³²), result
`((seed >> 16) & 0x7fff) % n` — the classic ANSI-C LCG. Seeded **once**, from
`GetTickCount()` at window creation. Modulo bias is present.

---

## 5. King vs. Pretender (the score meta-game)

The window shows two figures with a vertical gauge each [observed layout,
inferred meaning]: the **King** (left margin; name from the top high-score entry)
and the **Pretender** (right margin; the player, labelled "Pretender").
The goal is to beat `king_score` (the top high-score entry).

On every scoring move `add_score_and_animate(delta)`:

- `score += delta`; refresh the numeric box.
- **Phase 0** (`score ≤ king_score`): Pretender gauge target
  `125 − score·125/king_score` (clamped ≥ 0); it moves 1 px per 25 ms.
- When `score > king_score` (strict): crowning animation — 6 frame steps at
  150 ms on both figures, then 3 × (frame −1, 150 ms, frame +1, 150 ms); then `phase = 1`.
- **Phase 1**: King gauge target `(score − king_score)·125/king_score` (clamped ≤ 125),
  rising 1 px per 25 ms (so it fills when the score reaches 2 × the old king score).

At game end / New game (`finish_game_and_restart`): if `phase == 1`, the king's
name buffer ← `player_name`, `king_score ← score`, then the king figure is
animated back (6 × 150 ms; gauge shrinking 4 px per 15 ms); the Pretender figure
animates down and its gauge returns to 125 (4 px per 15 ms); then
`new_game_setup`. This is purely presentational; it does not affect the board rules.

---

## 6. High scores

- Table of **10** entries. **Default** (no file): entry 0 = name **"Handicap"**,
  score **100** (this is the default king); entries 1–9 = **"- Empty -"**, score 0.
- File: `winlines.res` is tried first, then `lines.res`. On save, `winlines.res`
  is opened for write, else `lines.res`, else `winlines.res` is created.
  (The README shipped in the zip describes the opposite priority for saving;
  the executable's code, which is authoritative here, tries `winlines.res` first.)
  Record layout (10 × 16 bytes = 160 bytes): `u8 name_length`, `13 name bytes`,
  `u16 score` (little-endian). Names are limited to 13 characters.
- `king_score` / `king_name` are loaded from entry 0.
- **Ranking** (`record_high_score`): first entry whose stored score is **strictly less**
  than the new score; **ties rank below** existing entries. Not ranked → nothing happens.
  Zero never ranks against the default table.
- If ranked: lower entries shift down (the 10th is dropped), the **Congratulations**
  dialog asks "Enter you name:" (sic) into an edit box **pre-filled with the
  `player_name` buffer** (initially "Pretender", afterwards the last entered name);
  then the **High Scores** dialog is shown.
- Name validation (OK button **and** the window close button — the dialog cannot be cancelled):
  empty → "You must enter some name"; length ≥ 14 → "Name too long";
  any byte ≥ 0x80 → "You can use only latin characters" (all via a message box titled "Error").
- `record_high_score` runs at game over **and** when choosing File → New (so
  restarting mid-game can still record the score). **Exiting does not record the
  current game.**
- The file is rewritten on window destroy only if the table changed.
- High Scores dialog rows: `"<rank>. <name>"` left, score right-aligned, 10 rows 16 px apart, font "MS Sans Serif" 18.

---

## 7. Menus, shortcuts, dialogs, statistics [observed in resources]

### Menu (resource 1100)

| Menu | Item | Command | Shortcut |
| --- | --- | --- | --- |
| File | New | `0x100` | F4 |
| File | Show high scores | `0x101` | — |
| File | Exit | `0x102` | Alt+X |
| Options | Next (check mark, **initially checked**) | `0x200` | F3 |
| Options | Show statistics | `0x201` | F5 |
| Help | Rules | `0x300` | F1 |
| Help | About ... | `0x301` | — |

- **Options → Next** toggles the preview. Off: three empty-cell tiles are drawn
  in place of the queue. The queue itself is unaffected.
- **Options → Show statistics** opens/closes a modeless window placed to the right
  of the main window (`board_x + 0x154` from the window's left, 164×310 px). It
  refreshes after every turn. Closing it unchecks the menu item.
- Settings (preview on/off, statistics window) are **not persisted**.

### Statistics window

Eight rows, each with a 36×36 sprite then text:

- Row 0 (empty tile): `"<free cells> (<pct>%)"`.
- Rows 1–7 (each colour): `"<on board> (<pct>%), del-<removed total>"`.
- `pct = count × 100 / 81` (integer division); "del" is `removed_counts[colour]`
  since the game started (includes balls removed during spawning).

### Dialog text (verbatim)

- **Rules**: *The purpose of the game is to score points more than the "king" has. Your score will increase when you build up a horizontal, vertical or diagonal line consisting of five or more one-color balls. You can make these lines by moving balls across vacant squares. We wish you success.*
- **High Scores**, **Congratulations** ("Enter you name:" + edit + Ok), **About** ("Original version credits", "Credits"), **Statistics** (modeless).
- Message boxes: `Game over!` (title `Color linez`, `MB_ICONEXCLAMATION`), `Report me!` / `Error`, and the three name-validation messages above.

---

## 8. Presentation

### Window

- Class `LinezWindow`; class style `0x23` (`CS_HREDRAW | CS_VREDRAW | CS_OWNDC`);
  background **black** (`BLACK_BRUSH`); arrow cursor; icon resource 3000; menu resource 1100.
- Title **"Color linez"**; style `0xCF0000` (overlapped, caption, sysmenu, thick frame, min/max).
- Created **620 × 420** (`0x26c × 0x1a4`), centred on the screen. `WM_GETMINMAXINFO`
  sets the **minimum tracking size to 620 × 420**; the window is resizable.
- Nothing is drawn while minimised.

### Layout formulas (recomputed on `WM_SIZE`)

```
board_x   = (clientW − 0x148) / 2
board_y   = (clientH − 0x178) / 2 + 0x2e
cell      = 36 × 36 px, drawn at (board_x + 2 + 36·col, board_y + 2 + 36·row)
preview_x = (clientW − 0x6c) / 2 ,  preview_y = 5          (3 sprites of 36 px)
score box (current) x = clientW − 0x60                      (64 × 16, white text on black, bevelled)
score box (king)    x = 0x18
king figure x       = ((clientW − 0x148)/2 − 0x3a) / 2      (centred in left margin)
pretender figure x  = (margin + 0x148) + (margin − 0x3a)/2  (centred in right margin)
figures y base      = (clientH − 0xea) / 2 + 0xea
```

- **Top bar**: 43 px (`0x2b`) tall, filled with `COLOR_3DFACE`, with light/dark
  3-D lines at the top and bottom; labels **"Next"** (right-aligned, left of the
  preview) and **"Colors"** (left-aligned, right of the preview) drawn with an
  embossed look (3-D-shadow colour text, then white text offset by −1,−1).
- **Board outline**: pens: `RGB(85,85,85)` and the stock white pen, drawn around a
  327-px square; fonts: "MS Sans Serif", heights 18 (high scores) and 16 (statistics).
- Overall look: a black playing field with bevelled grey panels, in the classic Win9x style.

### Sprite sheet (all coordinates inside the sheet bitmap)

The sheet is an 8-bit paletted bitmap **stored compressed in `.data` at `0x420108`**,
unpacked at startup into a buffer of `0x4a000` bytes, then converted with
`CreatePalette` + `CreateDIBitmap` and selected into a memory DC [observed].
The compression format was **not decoded**, so the exact image dimensions and
palette are [unknown]; the sheet is 512 px wide if the buffer size is an exact
`512 × 592` 8-bit image [inferred].

Observed blit sources:

| Use | Source rect (x, y, w×h) |
| --- | --- |
| Ball / tile sprite | `x = colour·36`, `y = 225 + frame·36`, 36×36; colour 0 = empty tile |
| Frames 0–5 | idle / bounce cycle (selected ball, path hops) |
| Frame 6 (`y = 441`) | small ball: spawn step 1 **and** the Next preview |
| Frame 7 | medium ball: spawn step 2 |
| Frames 8, 9 | vanish animation |
| Gauge pole | `(420, 100)`, 45×125 (height clipped to the gauge level) |
| Figure background | `(1, 100)`, 72×100; gauge base `(1, 201)`, 58×9 |
| King figure frames | `x = frame·73 + 1`, `y = 0`, 72×100 |
| Pretender frames | `x = frame·51 + 23`, `y = 100`, 50×65 |

### Animation timing summary

| Animation | Timing |
| --- | --- |
| Selected-ball bounce | timer 50 ms, 6 frames |
| Path hop | 50 ms per cell |
| Spawn | frames 6, 7, 0 at 50 ms each step |
| Vanish | frames 8, 9, clear; 50 ms each |
| Gauge movement | 25 ms per pixel |
| King/Pretender crowning | 150 ms steps |
| New-game reset | 150 ms frame steps; 15 ms per 4-px gauge step |

All animation is done with blocking `Sleep` on the UI thread.

---

## 9. Not decoded / open items

- The **sprite-sheet compression** and therefore the true bitmap size, palette,
  and artwork were not decoded.
- Exact **vertical position** of the two score boxes (taken from `score_box_y = 10`
  and a register argument; treated as [inferred]).
- Precise left/right **placement text** for king/pretender names (drawn
  centred under the figures with `DT_CENTER`; offsets in `draw_king_figure` /
  `draw_pretender_figure`).
- Behaviour was derived statically; no runtime tracing confirmed timing or visuals.

---

## 10. Browser recreation: status of [index.html](./index.html)

[index.html](./index.html) is a single-page HTML/JavaScript recreation built from the
rules above. The balls, tiles and window chrome are newly drawn and the king and
pretender use the supplied cat images in [assets/](./assets) (keep that folder
next to `index.html`); none of the original game's graphics are used. Verification done in a browser
(automated, with real mouse input): scoring table, line detection incl. the cross
and 9-in-a-row quirks, pathfinding, spawn/turn flow, game over, name validation,
high-score ranking/persistence, King/Pretender crowning and reset, statistics,
menus and F1/F3/F4/F5 shortcuts, and phone/desktop layouts.

Implemented as in the original:

- [x] 9×9 board, **7** ball colours, 5 balls at start, 3-ball queue and "Next" preview (toggle F3).
- [x] Mouse/tap only; press and release on the same cell; re-clicking a ball re-selects (no deselect); the original's truncating hit-test.
- [x] 4-neighbour wave pathfinder; no path → beep, keep selection, no turn consumed.
- [x] Lines of ≥5 on 4 axes with the original counting quirks; score `10 + 2(n−5)²`; **no spawn** after a clearing move.
- [x] 3 spawns at uniform-random empty cells; a spawn that makes a line is removed for 0 points and replaced by the next queued ball.
- [x] Game over only when the board is full after spawning.
- [x] Statistics window (free %, on-board %, removed counts), Rules, About, High Scores dialogs.
- [x] 10-entry high-score table (13-char names, strict-greater ranking, default "Handicap"/100), name dialog and its validation, recorded at game over and on File → New (not on exit).
- [x] King vs Pretender gauges, crowning and reset animations with the original timings.
- [x] Animations: bounce (6 frames/50 ms), hop per cell (50 ms), spawn grow (small → medium → full), vanish; input ignored while animating.
- [x] Menu File/Options/Help, accelerators F1, F3, F4, F5, Alt+X.

### Deliberate differences from the original

| Area | Original | index.html |
| --- | --- | --- |
| Artwork | original sprite sheet (not decoded) | balls, tiles and window chrome newly drawn; the King ("Handicap") and Pretender are the supplied cat portraits in [assets/](./assets) (`handicap.jpg`, `pretender.jpg`), scaled to fit a 128×120 box on top of the pole. The original's frame animation is approximated: the dethroned king slumps and fades, the pretender rises, hops and sparkles |
| Layout | window recomputed from client size | same formulas at 612×374 (scaled to fit), always centred in the browser; while the Statistics window is open the pair is centred together. On narrow portrait screens a compact layout puts the king and pretender under the board so cells stay ≥ ~38 px |
| High-score storage | `winlines.res`/`lines.res` file, written on exit | `localStorage`, written immediately when the table changes |
| Exit | closes the window | shows a "Color linez" icon; click it to start again |
| Input during animation | queued by Windows | ignored |
| Sound | `MessageBeep` | short square-wave beep (Web Audio) |
| Dialog text | original wording | rules/About text reworded; the "Enter you name:" label, error messages and "Game over!" keep the original wording |
| Statistics window | fixed offset beside the main window | beside the window when there is room, otherwise bottom-right |
| Score-box vertical position, king/pretender name placement | see §9 | chosen to match the original layout visually |

---

## 11. Method and limitations

Tooling: REA 6.8.0 with the Ghidra 12.1.4 provider (static only).

1. REA opened the executable and reported 105 procedures — but 70 are import
   stubs and only ~5 were real code: Ghidra's auto-analysis never reached the
   ~7 KB of game code after `WinMain` (hand-written code, `WndProc` reachable only
   through a data pointer, REA Evidence `ev_8f1bb491…` shows `0x41187e` undecodable).
2. A Ghidra headless script (`DumpLinez.java`) swept the undefined code,
   created ~50 functions, re-ran analysis, applied the names used here, then dumped
   a listing and decompiled C.
3. REA `inspect_pe_resources` rejected this PE (`PE section raw bytes overlap
   headers`), so resources were read from the loaded image with REA `read_bytes`
   and decoded by `parse-resources.js`.
4. Key facts were cross-checked in raw assembly where the decompiler lost
   register-passed arguments (scoring input, spawn loop, high-score ranking).

REA evidence references (session-scoped): binary overview `ev_af57beee37240dd6…`,
string inventory `ev_b770ae8f40de3a8e…`, direction table `ev_2dd4516ce8a24898…`,
string area `ev_ddda3d057ccf91ce…`, resource bytes `ev_2693f8c461289c32…`.
(REA's own xrefs for the string "Handicap" were empty in the original session
because the referencing code was undecoded; the reference is the immediate at
`0x4116bd` in `load_high_scores`.)

### How to reproduce

PowerShell, with Ghidra 12.1.x and a JDK 25 installed (paths as on this machine):

```powershell
$gh  = "$env:LOCALAPPDATA\Programs\REA\ghidra_12.1.4_PUBLIC"
$env:JAVA_HOME = "$env:LOCALAPPDATA\Programs\REA\jdk-25.0.5+8"
$proj = Join-Path $env:TEMP 'linez-proj'; New-Item -ItemType Directory $proj | Out-Null
& "$gh\support\analyzeHeadless.bat" $proj linez -import C:\dev\lines\WINLINEZ.EXE `
  -scriptPath C:\dev\lines\re\ghidra-scripts -postScript DumpLinez.java C:\dev\lines\re\ghidra-out -deleteProject
Remove-Item $proj -Recurse -Force
```

Resources: read bytes `0x460000` (length 8192) with REA `read_bytes`, save the
JSON, then `node re\ghidra-scripts\parse-resources.js <json> re\ghidra-out\resources.txt`.

REA 6.8.0 only accepts Ghidra **12.1.x**; Ghidra 12.2 is rejected as `unsupported_version`.
