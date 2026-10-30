import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.address.Address;
import ghidra.program.model.address.AddressSet;
import ghidra.program.model.listing.CodeUnit;
import ghidra.program.model.listing.Data;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.RefType;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/*
 * Finishes disassembly of WINLINEZ.EXE code that Ghidra's default analysis did not reach
 * (the hand-written code after WinMain and the window procedure referenced only by a data
 * pointer), then dumps functions, a listing and decompiler output.
 * Args: <output directory>
 */
public class DumpLinez extends GhidraScript {
    private static final long CODE_START = 0x4102f9L;
    private static final long CODE_END = 0x4130e6L;
    private static final long WND_PROC = 0x41187eL;

    // Names are analyst-assigned from reading the code; see WINLINEZ-REVERSE-ENGINEERING.md.
    private static final Object[][] FUNCTION_NAMES = {
        {0x4100a8L, "uint_to_decimal"}, {0x4100e9L, "str_len"}, {0x410128L, "str_copy"},
        {0x410144L, "rand_below"}, {0x410171L, "srand"}, {0x410178L, "WinMain"},
        {0x4102f9L, "draw_board"}, {0x410426L, "noop"}, {0x41042dL, "draw_cell_frame"},
        {0x4104a5L, "init_next_queue"}, {0x4104c4L, "find_path"}, {0x4107a1L, "pixel_to_cell"},
        {0x4107ecL, "mark_lines_at"}, {0x410976L, "remove_marked_cells"}, {0x410a3aL, "count_empty_cells"},
        {0x410a71L, "spawn_ball"}, {0x410bc6L, "line_score"}, {0x410be4L, "draw_bevel"},
        {0x410c5dL, "draw_next_preview"}, {0x410d72L, "draw_score_box"}, {0x410e5aL, "draw_top_bar"},
        {0x41106bL, "draw_king_figure"}, {0x411196L, "draw_pretender_figure"}, {0x411313L, "add_score_and_animate"},
        {0x411481L, "new_game_setup"}, {0x411525L, "finish_game_and_restart"}, {0x411640L, "load_high_scores"},
        {0x41172dL, "save_high_scores"}, {0x4117c5L, "record_high_score"}, {0x41187eL, "WndProc"},
        {0x4121b5L, "RulesDlgProc"}, {0x412279L, "HighScoresDlgProc"}, {0x412454L, "EnterNameDlgProc"},
        {0x41260fL, "AboutDlgProc"}, {0x41277cL, "StatisticsDlgProc"}, {0x412a50L, "load_sprite_sheet"},
        {0x412b5dL, "alloc_and_unpack_sprites"}, {0x412b9dL, "unpack"}, {0x413080L, "str_append"}
    };

    private static final Object[][] DATA_NAMES = {
        {0x420000L, "line_directions"}, {0x42002cL, "king_name"}, {0x42003cL, "pretender_label"},
        {0x42004cL, "player_name"}, {0x420108L, "packed_sprite_sheet"}, {0x430000L, "rng_seed"},
        {0x43000cL, "anim_tick"}, {0x430010L, "selection_state"}, {0x430018L, "moving_color"},
        {0x43001cL, "mouse_down_col"}, {0x430020L, "mouse_down_row"}, {0x430024L, "mouse_down_outside"},
        {0x430028L, "hInstance"}, {0x43002cL, "screen_w"}, {0x430030L, "screen_h"},
        {0x430034L, "hAccel"}, {0x430038L, "hSpriteBitmap"}, {0x43003cL, "hPalette"},
        {0x430040L, "board"}, {0x430092L, "path_xy"}, {0x430136L, "path_len"},
        {0x430138L, "board_x"}, {0x43013cL, "board_y"}, {0x430141L, "selected_col"},
        {0x430142L, "selected_row"}, {0x430144L, "score"}, {0x430148L, "score_box_x"},
        {0x43014cL, "score_box_y"}, {0x430150L, "next_colors"}, {0x430154L, "preview_x"},
        {0x430158L, "preview_y"}, {0x43015cL, "next_visible"}, {0x430160L, "king_score"},
        {0x430164L, "king_x"}, {0x430168L, "king_y"}, {0x43016cL, "king_gauge"},
        {0x430170L, "king_frame"}, {0x430174L, "pretender_x"}, {0x430178L, "pretender_y"},
        {0x43017cL, "pretender_gauge"}, {0x430180L, "pretender_frame"}, {0x430184L, "phase"},
        {0x430188L, "high_score_table"}, {0x430228L, "high_scores_dirty"}, {0x43022cL, "hOldBitmap"},
        {0x430230L, "hSpriteDC"}, {0x430234L, "hStatsDlg"}, {0x430238L, "stats_visible"},
        {0x43023cL, "hMainWnd"}, {0x430240L, "removed_counts"}
    };

    private void applyNames() throws Exception {
        for (Object[] entry : FUNCTION_NAMES) {
            Function f = getFunctionAt(toAddr((Long) entry[0]));
            if (f != null) {
                f.setName((String) entry[1], ghidra.program.model.symbol.SourceType.USER_DEFINED);
            }
        }
        for (Object[] entry : DATA_NAMES) {
            createLabel(toAddr((Long) entry[0]), (String) entry[1], true);
        }
    }

    @Override
    protected void run() throws Exception {
        String outDir = getScriptArgs().length > 0 ? getScriptArgs()[0] : "C:\\dev\\lines\\re\\ghidra-out";
        new File(outDir).mkdirs();
        Listing listing = currentProgram.getListing();
        Address start = toAddr(CODE_START);
        Address end = toAddr(CODE_END);

        disassemble(toAddr(WND_PROC));
        if (getFunctionAt(toAddr(WND_PROC)) == null) {
            createFunction(toAddr(WND_PROC), "WndProc");
        }

        List<String> undecodable = new ArrayList<>();
        for (int pass = 0; pass < 3; pass++) {
            Address cur = start;
            while (cur != null && cur.compareTo(end) <= 0) {
                CodeUnit cu = listing.getCodeUnitContaining(cur);
                boolean defined = cu instanceof Instruction || (cu instanceof Data && ((Data) cu).isDefined());
                if (defined) {
                    cur = cu.getMaxAddress().next();
                    continue;
                }
                if (disassemble(cur)) {
                    if (getFunctionContaining(cur) == null) {
                        createFunction(cur, null);
                    }
                    CodeUnit after = listing.getCodeUnitAt(cur);
                    cur = after == null ? cur.next() : after.getMaxAddress().next();
                } else {
                    undecodable.add(cur.toString());
                    cur = cur.next();
                }
            }

            AddressSet range = new AddressSet(start, end);
            for (Instruction ins : listing.getInstructions(range, true)) {
                for (Reference ref : ins.getReferencesFrom()) {
                    RefType type = ref.getReferenceType();
                    Address to = ref.getToAddress();
                    if (type.isCall() && to.isMemoryAddress() && to.compareTo(start) >= 0 && to.compareTo(end) <= 0
                            && getFunctionAt(to) == null) {
                        disassemble(to);
                        createFunction(to, null);
                    }
                }
            }
        }

        analyzeAll(currentProgram);
        applyNames();

        try (PrintWriter pw = new PrintWriter(new File(outDir, "functions.txt"), "UTF-8")) {
            for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
                if (f.isExternal() || f.isThunk()) {
                    continue;
                }
                pw.println(String.format("%s\t%s\t%s-%s\tsize=%d\tcallers=%d", f.getEntryPoint(), f.getName(),
                        f.getBody().getMinAddress(), f.getBody().getMaxAddress(), f.getBody().getNumAddresses(),
                        f.getSymbol().getReferenceCount()));
            }
            pw.println("# undecodable sweep starts: " + undecodable.size());
            for (String u : undecodable) {
                pw.println("# " + u);
            }
        }

        AddressSet text = new AddressSet(toAddr(0x410000L), toAddr(0x4133ffL));
        try (PrintWriter pw = new PrintWriter(new File(outDir, "listing.asm"), "UTF-8")) {
            for (CodeUnit cu : listing.getCodeUnits(text, true)) {
                Function f = getFunctionAt(cu.getMinAddress());
                if (f != null) {
                    pw.println();
                    pw.println("; ---- " + f.getName() + " ----");
                }
                String bytes;
                try {
                    StringBuilder sb = new StringBuilder();
                    for (byte b : cu.getBytes()) {
                        sb.append(String.format("%02x", b & 0xff));
                    }
                    bytes = sb.toString();
                } catch (Exception e) {
                    bytes = "";
                }
                pw.println(String.format("%s  %-24s %s", cu.getMinAddress(), bytes, cu.toString()));
            }
        }

        DecompInterface decomp = new DecompInterface();
        decomp.openProgram(currentProgram);
        try (PrintWriter pw = new PrintWriter(new File(outDir, "decompiled.c"), "UTF-8")) {
            for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
                if (f.isExternal() || f.isThunk()) {
                    continue;
                }
                DecompileResults r = decomp.decompileFunction(f, 90, monitor);
                pw.println("// ==== " + f.getName() + " @ " + f.getEntryPoint() + " ====");
                if (r != null && r.decompileCompleted() && r.getDecompiledFunction() != null) {
                    pw.println(r.getDecompiledFunction().getC());
                } else {
                    pw.println("// decompile failed: " + (r == null ? "null" : r.getErrorMessage()));
                }
            }
        }
        decomp.dispose();
        println("DumpLinez finished: " + outDir);
    }
}
