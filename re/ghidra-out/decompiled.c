// ==== entry @ 00410000 ====

void entry(void)

{
  LPSTR pCVar1;
  HMODULE pHVar2;
  WPARAM uExitCode;
  int iVar3;
  
  iVar3 = 10;
  pCVar1 = GetCommandLineA();
  pHVar2 = GetModuleHandleA((LPCSTR)0x0);
  uExitCode = WinMain(pHVar2,0,pCVar1,iVar3);
                    /* WARNING: Subroutine does not return */
  ExitProcess(uExitCode);
}


// ==== uint_to_decimal @ 004100a8 ====

void __fastcall uint_to_decimal(undefined4 param_1,char *param_2)

{
  uint uVar1;
  bool bVar2;
  char cVar3;
  uint in_EAX;
  uint uVar4;
  char cVar5;
  
  uVar4 = 1000000000;
  cVar5 = '\n';
  bVar2 = false;
  do {
    uVar1 = in_EAX / uVar4;
    in_EAX = in_EAX % uVar4;
    cVar3 = (char)uVar1;
    if (((cVar3 != '\0') || (cVar5 == '\x01')) || (bVar2)) {
      *param_2 = cVar3 + '0';
      param_2 = param_2 + 1;
      bVar2 = true;
    }
    uVar4 = uVar4 / 10;
    cVar5 = cVar5 + -1;
  } while (cVar5 != '\0');
  *param_2 = '\0';
  return;
}


// ==== str_len @ 004100e9 ====

int str_len(void)

{
  char cVar1;
  char *in_EAX;
  uint uVar2;
  
  uVar2 = 0xffffffff;
  do {
    if (uVar2 == 0) break;
    uVar2 = uVar2 - 1;
    cVar1 = *in_EAX;
    in_EAX = in_EAX + 1;
  } while (cVar1 != '\0');
  return ~uVar2 - 1;
}


// ==== str_copy @ 00410128 ====

undefined1 * str_copy(void)

{
  undefined1 *in_EAX;
  int iVar1;
  undefined1 *extraout_EDX;
  undefined1 *puVar2;
  undefined1 *puVar3;
  
  iVar1 = str_len();
  puVar2 = extraout_EDX;
  puVar3 = in_EAX;
  for (iVar1 = iVar1 + 1; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  return in_EAX;
}


// ==== rand_below @ 00410144 ====

undefined8 __fastcall rand_below(undefined4 param_1,undefined4 param_2)

{
  uint in_EAX;
  
  rng_seed = rng_seed * 0x41c64e6d + 0x3039;
  return CONCAT44(param_2,(rng_seed >> 0x10 & 0x7fff) % in_EAX);
}


// ==== srand @ 00410171 ====

void srand(void)

{
  undefined4 in_EAX;
  
  rng_seed = in_EAX;
  return;
}


// ==== WinMain @ 00410178 ====

WPARAM WinMain(HINSTANCE param_1,undefined4 param_2,undefined4 param_3,int param_4)

{
  ATOM AVar1;
  HWND hWnd;
  BOOL BVar2;
  int iVar3;
  WNDCLASSA local_54;
  tagMSG local_2c;
  
  hInstance = param_1;
  local_54.hInstance = param_1;
  local_54.lpszClassName = s_LinezWindow_00420020;
  local_54.lpfnWndProc = WndProc;
  local_54.style = 0x23;
  local_54.hIcon = LoadIconA(param_1,&DAT_00000bb8);
  local_54.hCursor = LoadCursorA((HINSTANCE)0x0,&DAT_00007f00);
  local_54.lpszMenuName = &DAT_0000044c;
  local_54.cbClsExtra = 0;
  local_54.cbWndExtra = 0;
  local_54.hbrBackground = GetStockObject(4);
  AVar1 = RegisterClassA(&local_54);
  if (AVar1 == 0) {
    local_2c.wParam = 0;
  }
  else {
    board_x = 0x92;
    board_y = 0x44;
    screen_w = GetSystemMetrics(0);
    screen_h = GetSystemMetrics(1);
    hWnd = CreateWindowExA(0,s_LinezWindow_00420020,s_Color_linez_00420090,0xcf0000,
                           (screen_w + -0x26c) / 2,(screen_h + -0x1a4) / 2,0x26c,0x1a4,(HWND)0x0,
                           (HMENU)0x0,param_1,(LPVOID)0x0);
    hMainWnd = hWnd;
    hAccel = LoadAcceleratorsA(param_1,&DAT_0000044c);
    ShowWindow(hWnd,param_4);
    UpdateWindow(hWnd);
    while (BVar2 = GetMessageA(&local_2c,(HWND)0x0,0,0), BVar2 != 0) {
      if (((hStatsDlg == (HWND)0x0) || (BVar2 = IsDialogMessageA(hStatsDlg,&local_2c), BVar2 == 0))
         && (iVar3 = TranslateAcceleratorA(hWnd,hAccel,&local_2c), iVar3 == 0)) {
        TranslateMessage(&local_2c);
        DispatchMessageA(&local_2c);
      }
    }
  }
  return local_2c.wParam;
}


// ==== draw_board @ 004102f9 ====

void draw_board(void)

{
  HDC in_EAX;
  HPEN h;
  HGDIOBJ h_00;
  HGDIOBJ h_01;
  int iVar1;
  int iVar2;
  
  h = CreatePen(0,1,0x555555);
  h_00 = SelectObject(in_EAX,h);
  MoveToEx(in_EAX,board_x,board_y + 0x147,(LPPOINT)0x0);
  LineTo(in_EAX,board_x + 0x147,board_y + 0x147);
  LineTo(in_EAX,board_x + 0x147,board_y);
  h_01 = GetStockObject(6);
  SelectObject(in_EAX,h_01);
  LineTo(in_EAX,board_x,board_y);
  LineTo(in_EAX,board_x,board_y + 0x148);
  SelectObject(in_EAX,h_00);
  DeleteObject(h);
  for (iVar2 = 0; iVar2 < 9; iVar2 = iVar2 + 1) {
    for (iVar1 = 0; iVar1 < 9; iVar1 = iVar1 + 1) {
      BitBlt(in_EAX,iVar1 * 0x24 + board_x + 2,iVar2 * 0x24 + board_y + 2,0x24,0x24,hSpriteDC,
             (uint)(byte)(&board)[iVar2 * 9 + iVar1] * 0x24,0xe1,0xcc0020);
    }
  }
  return;
}


// ==== noop @ 00410426 ====

void noop(void)

{
  return;
}


// ==== draw_cell_frame @ 0041042d ====

void __fastcall draw_cell_frame(int param_1,int param_2)

{
  HDC in_EAX;
  int unaff_EBX;
  
  BitBlt(in_EAX,param_2 * 0x24 + board_x + 2,unaff_EBX * 0x24 + board_y + 2,0x24,0x24,hSpriteDC,
         (uint)((&board)[unaff_EBX * 9 + param_2] & 0x3f) * 0x24,param_1 * 0x24 + 0xe1,0xcc0020);
  return;
}


// ==== init_next_queue @ 004104a5 ====

void __fastcall init_next_queue(undefined4 param_1)

{
  undefined4 extraout_ECX;
  int iVar1;
  undefined8 uVar2;
  
  for (iVar1 = 0; iVar1 < 3; iVar1 = iVar1 + 1) {
    uVar2 = rand_below(param_1,iVar1);
    iVar1 = (int)((ulonglong)uVar2 >> 0x20);
    (&next_colors)[iVar1] = (char)uVar2 + '\x01';
    param_1 = extraout_ECX;
  }
  return;
}


// ==== find_path @ 004104c4 ====

undefined4 __fastcall find_path(byte param_1,byte param_2)

{
  undefined1 uVar1;
  byte in_AL;
  char cVar2;
  byte bVar7;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  undefined3 uVar8;
  uint uVar6;
  byte bVar9;
  byte unaff_BL;
  int iVar10;
  
  iVar3 = (uint)in_AL + (uint)param_2 * 9;
  uVar1 = (&board)[iVar3];
  (&board)[iVar3] = 8;
  bVar9 = 8;
  do {
    bVar7 = bVar9;
    for (iVar3 = 0; iVar3 < 9; iVar3 = iVar3 + 1) {
      for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
        if ((&board)[iVar4 + iVar3 * 9] == bVar7) {
          if ((iVar3 != 0) && (iVar10 = (iVar3 + -1) * 9 + iVar4, (&board)[iVar10] == '\0')) {
            (&board)[iVar10] = bVar7 + 1;
          }
          if ((iVar4 != 0) &&
             (iVar10 = iVar3 * 9 + iVar4, *(char *)((int)&hPalette + iVar10 + 3) == '\0')) {
            *(byte *)((int)&hPalette + iVar10 + 3) = bVar7 + 1;
          }
          if ((iVar3 != 8) && (iVar10 = (iVar3 + 1) * 9 + iVar4, (&board)[iVar10] == '\0')) {
            (&board)[iVar10] = bVar7 + 1;
          }
          if ((iVar4 != 8) && (iVar10 = iVar3 * 9 + iVar4, (&DAT_00430041)[iVar10] == '\0')) {
            (&DAT_00430041)[iVar10] = bVar7 + 1;
          }
        }
      }
    }
    bVar9 = bVar7 + 1;
  } while (((&board)[(uint)unaff_BL + (uint)param_1 * 9] != bVar9) && (bVar9 < 0x5a));
  if (bVar9 == 0x5a) {
    for (iVar3 = 0; iVar3 < 9; iVar3 = iVar3 + 1) {
      for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
        iVar10 = iVar3 * 9 + iVar4;
        if (7 < (byte)(&board)[iVar10]) {
          (&board)[iVar10] = 0;
        }
      }
    }
    (&board)[(uint)param_2 * 9 + (uint)in_AL] = uVar1;
    uVar5 = 0;
  }
  else {
    uVar6 = (uint)CONCAT11(param_1,unaff_BL);
    path_len = bVar7 - 6;
    for (iVar3 = 0; iVar3 < (int)(uint)path_len; iVar3 = iVar3 + 1) {
      iVar4 = (uint)path_len - iVar3;
      bVar7 = (byte)(uVar6 >> 8);
      (&path_xy)[iVar4 * 2] = bVar7;
      cVar2 = (char)uVar6;
      (&DAT_00430093)[iVar4 * 2] = cVar2;
      if ((bVar7 == 0) || ((uint)(byte)(&board)[(bVar7 - 1) * 9 + (uVar6 & 0xff)] != bVar9 - 1)) {
        uVar8 = (undefined3)(uVar6 >> 8);
        if (((uVar6 & 0xff) == 0) ||
           ((uint)*(byte *)((uVar6 & 0xff) + 0x43003f + (uVar6 >> 8) * 9) != bVar9 - 1)) {
          if ((bVar7 == 8) || ((uint)(byte)(&board)[(uVar6 & 0xff) + (bVar7 + 1) * 9] != bVar9 - 1))
          {
            if (((uVar6 & 0xff) != 8) &&
               ((uint)(byte)(&DAT_00430041)[(uint)bVar7 * 9 + (uVar6 & 0xff)] == bVar9 - 1)) {
              uVar6 = CONCAT31(uVar8,cVar2 + '\x01');
            }
          }
          else {
            uVar6 = (uint)CONCAT11(bVar7 + 1,cVar2);
          }
        }
        else {
          uVar6 = CONCAT31(uVar8,cVar2 + -1);
        }
      }
      else {
        uVar6 = (uint)CONCAT11(bVar7 - 1,cVar2);
      }
      bVar9 = bVar9 - 1;
    }
    for (iVar3 = 0; iVar3 < 9; iVar3 = iVar3 + 1) {
      for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
        iVar10 = iVar3 * 9 + iVar4;
        if (7 < (byte)(&board)[iVar10]) {
          (&board)[iVar10] = 0;
        }
      }
    }
    (&board)[(uint)in_AL + (uint)param_2 * 9] = uVar1;
    uVar5 = 1;
  }
  return uVar5;
}


// ==== pixel_to_cell @ 004107a1 ====

undefined4 __fastcall pixel_to_cell(int *param_1,int param_2)

{
  int in_EAX;
  int iVar1;
  int *unaff_EBX;
  
  iVar1 = (in_EAX - board_x) / 0x24;
  *unaff_EBX = iVar1;
  if ((-1 < iVar1) && (iVar1 < 9)) {
    iVar1 = (param_2 - board_y) / 0x24;
    *param_1 = iVar1;
    if ((-1 < iVar1) && (iVar1 < 9)) {
      return 1;
    }
  }
  return 0;
}


// ==== mark_lines_at @ 004107ec ====

int __fastcall mark_lines_at(undefined4 param_1,int param_2)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  byte unaff_BL;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int local_18;
  
  local_18 = 0;
  iVar6 = 0;
  do {
    if (3 < iVar6) {
      if (local_18 != 0) {
        (&board)[param_2 * 9 + in_EAX] = unaff_BL | 0x40;
      }
      return local_18;
    }
    iVar4 = 1;
    iVar1 = param_2;
    iVar2 = in_EAX;
    iVar3 = iVar4;
    for (; iVar4 < 8; iVar4 = iVar4 + 1) {
      iVar2 = iVar2 + (&line_directions)[iVar6 * 2];
      iVar1 = iVar1 + (&DAT_00420004)[iVar6 * 2];
      if ((((iVar2 < 0) || (8 < iVar2)) || (iVar1 < 0)) ||
         ((8 < iVar1 || (iVar5 = iVar1 * 9 + iVar2, (&board)[iVar5] != unaff_BL)))) break;
      iVar3 = iVar3 + 1;
      (&board)[iVar5] = (&board)[iVar5] | 0x40;
    }
    iVar1 = param_2;
    iVar2 = in_EAX;
    for (iVar4 = 1; iVar4 < 8; iVar4 = iVar4 + 1) {
      iVar2 = iVar2 - (&line_directions)[iVar6 * 2];
      iVar1 = iVar1 - (&DAT_00420004)[iVar6 * 2];
      if (((iVar2 < 0) || (8 < iVar2)) ||
         ((iVar1 < 0 || ((8 < iVar1 || (iVar5 = iVar1 * 9 + iVar2, (&board)[iVar5] != unaff_BL))))))
      break;
      iVar3 = iVar3 + 1;
      (&board)[iVar5] = (&board)[iVar5] | 0x40;
    }
    if (iVar3 < 5) {
      iVar1 = param_2;
      iVar2 = in_EAX;
      for (iVar3 = 1; iVar3 < 8; iVar3 = iVar3 + 1) {
        iVar2 = iVar2 + (&line_directions)[iVar6 * 2];
        iVar1 = iVar1 + (&DAT_00420004)[iVar6 * 2];
        if ((((iVar2 < 0) || (8 < iVar2)) || (iVar1 < 0)) || (8 < iVar1)) break;
        (&board)[iVar1 * 9 + iVar2] = (&board)[iVar1 * 9 + iVar2] & 0x3f;
      }
      iVar1 = param_2;
      iVar2 = in_EAX;
      for (iVar3 = 1; iVar3 < 8; iVar3 = iVar3 + 1) {
        iVar2 = iVar2 - (&line_directions)[iVar6 * 2];
        iVar1 = iVar1 - (&DAT_00420004)[iVar6 * 2];
        if (((iVar2 < 0) || (8 < iVar2)) || ((iVar1 < 0 || (8 < iVar1)))) break;
        (&board)[iVar1 * 9 + iVar2] = (&board)[iVar1 * 9 + iVar2] & 0x3f;
      }
    }
    else {
      local_18 = local_18 + iVar3;
    }
    iVar6 = iVar6 + 1;
  } while( true );
}


// ==== remove_marked_cells @ 00410976 ====

void remove_marked_cells(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int local_24;
  int local_20;
  byte local_1c;
  
  iVar2 = 8;
  local_20 = 0;
  for (local_24 = 0; local_24 < 3; local_24 = local_24 + 1) {
    for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
      for (iVar3 = 0; iVar3 < 9; iVar3 = iVar3 + 1) {
        iVar1 = iVar4 * 9 + iVar3;
        if (((&board)[iVar1] & 0x40) != 0) {
          if (iVar2 == 0) {
            local_1c = (&board)[iVar1] & 0x3f;
            (&board)[iVar1] = 0;
            local_20 = local_20 + 1;
          }
          draw_cell_frame(iVar2,iVar3);
        }
      }
    }
    Sleep(0x32);
    if (local_24 == 0) {
      iVar2 = 9;
    }
    else if (local_24 == 1) {
      iVar2 = 0;
    }
  }
  (&removed_counts)[local_1c] = (&removed_counts)[local_1c] + local_20;
  if (hStatsDlg != (HWND)0x0) {
    InvalidateRect(hStatsDlg,(RECT *)0x0,0);
  }
  noop();
  return;
}


// ==== count_empty_cells @ 00410a3a ====

undefined8 __fastcall count_empty_cells(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = 0;
  for (iVar3 = 0; iVar3 < 9; iVar3 = iVar3 + 1) {
    for (iVar2 = 0; iVar2 < 9; iVar2 = iVar2 + 1) {
      if ((&board)[iVar3 * 9 + iVar2] == '\0') {
        iVar1 = iVar1 + 1;
      }
    }
  }
  return CONCAT44(param_2,iVar1);
}


// ==== spawn_ball @ 00410a71 ====

void __fastcall spawn_ball(undefined4 param_1,uint param_2)

{
  bool bVar1;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  undefined4 uVar2;
  undefined4 extraout_ECX_02;
  undefined4 extraout_ECX_03;
  undefined4 extraout_ECX_04;
  int iVar3;
  uint extraout_EDX;
  uint extraout_EDX_00;
  int unaff_ESI;
  int iVar4;
  undefined8 uVar5;
  
  bVar1 = true;
  do {
    uVar5 = count_empty_cells(param_1,param_2);
    if ((int)uVar5 == 0) break;
    uVar5 = rand_below(extraout_ECX,(int)uVar5);
    iVar3 = (int)(short)uVar5;
    for (iVar4 = 0; iVar4 < 9; iVar4 = iVar4 + 1) {
      for (unaff_ESI = 0; unaff_ESI < 9; unaff_ESI = unaff_ESI + 1) {
        if (((&board)[iVar4 * 9 + unaff_ESI] == '\0') && (iVar3 == 0)) goto LAB_00410af5;
        if ((&board)[iVar4 * 9 + unaff_ESI] == '\0') {
          iVar3 = iVar3 + -1;
        }
        if (((&board)[iVar4 * 9 + unaff_ESI] == '\0') && (iVar3 == 0)) goto LAB_00410af5;
      }
    }
LAB_00410af5:
    uVar2 = extraout_ECX_00;
    if (8 < iVar4) {
      MessageBoxA((HWND)0x0,s_Report_me__00428ca4,s_Error_00420078,0);
      uVar2 = extraout_ECX_01;
    }
    iVar3 = iVar4 * 9 + unaff_ESI;
    (&board)[iVar3] = next_colors;
    next_colors = DAT_00430151;
    DAT_00430151 = DAT_00430152;
    uVar5 = rand_below(uVar2,iVar3);
    DAT_00430152 = (char)uVar5 + '\x01';
    draw_cell_frame(6,unaff_ESI);
    Sleep(0x32);
    draw_cell_frame(7,unaff_ESI);
    Sleep(0x32);
    draw_cell_frame(0,unaff_ESI);
    iVar3 = mark_lines_at(extraout_ECX_02,iVar4);
    if (iVar3 == 0) {
      param_2 = extraout_EDX & 0xffffff00;
      bVar1 = false;
      param_1 = extraout_ECX_03;
    }
    else {
      remove_marked_cells();
      param_1 = extraout_ECX_04;
      param_2 = extraout_EDX_00;
    }
  } while (bVar1);
  noop();
  return;
}


// ==== line_score @ 00410bc6 ====

undefined8 __fastcall line_score(undefined4 param_1,undefined4 param_2)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = 10;
  iVar2 = 2;
  for (iVar1 = in_EAX + -5; iVar1 != 0; iVar1 = iVar1 + -1) {
    iVar3 = iVar3 + iVar2;
    iVar2 = iVar2 + 4;
  }
  return CONCAT44(param_2,iVar3);
}


// ==== draw_bevel @ 00410be4 ====

void __fastcall draw_bevel(int param_1,int param_2,int param_3,HGDIOBJ param_4,HGDIOBJ param_5)

{
  HDC in_EAX;
  HGDIOBJ h;
  int unaff_EBX;
  
  h = SelectObject(in_EAX,param_4);
  MoveToEx(in_EAX,param_2,param_3,(LPPOINT)0x0);
  LineTo(in_EAX,param_2,unaff_EBX);
  LineTo(in_EAX,param_1,unaff_EBX);
  SelectObject(in_EAX,param_5);
  MoveToEx(in_EAX,param_2 + 1,param_3,(LPPOINT)0x0);
  LineTo(in_EAX,param_1,param_3);
  LineTo(in_EAX,param_1,unaff_EBX);
  SelectObject(in_EAX,h);
  return;
}


// ==== draw_next_preview @ 00410c5d ====

void draw_next_preview(void)

{
  HDC in_EAX;
  int iVar1;
  
  if (next_visible != '\0') {
    BitBlt(in_EAX,preview_x,preview_y,0x24,0x24,hSpriteDC,(uint)next_colors * 0x24,0x1b9,0xcc0020);
    BitBlt(in_EAX,preview_x + 0x24,preview_y,0x24,0x24,hSpriteDC,(uint)DAT_00430151 * 0x24,0x1b9,
           0xcc0020);
    BitBlt(in_EAX,preview_x + 0x48,preview_y,0x24,0x24,hSpriteDC,(uint)DAT_00430152 * 0x24,0x1b9,
           0xcc0020);
    noop();
    return;
  }
  for (iVar1 = 0; iVar1 < 3; iVar1 = iVar1 + 1) {
    BitBlt(in_EAX,iVar1 * 0x24 + preview_x,preview_y,0x24,0x24,hSpriteDC,0,0xe1,0xcc0020);
  }
  noop();
  return;
}


// ==== draw_score_box @ 00410d72 ====

void __fastcall draw_score_box(undefined4 param_1,int param_2)

{
  HDC in_EAX;
  HBRUSH hbr;
  DWORD DVar1;
  undefined4 extraout_ECX;
  int unaff_EBX;
  RECT local_40;
  char local_30 [16];
  HPEN local_20;
  HPEN local_1c;
  int local_18;
  int local_14;
  undefined4 local_10;
  
  local_40.left = param_2 + 4;
  local_40.right = param_2 + 0x44;
  local_40.top = unaff_EBX + 4;
  local_40.bottom = unaff_EBX + 0x14;
  local_18 = local_40.right;
  local_14 = local_40.bottom;
  local_10 = param_1;
  hbr = GetStockObject(4);
  FillRect(in_EAX,&local_40,hbr);
  DVar1 = GetSysColor(0x14);
  local_20 = CreatePen(0,1,DVar1);
  DVar1 = GetSysColor(0x10);
  local_1c = CreatePen(0,1,DVar1);
  draw_bevel(param_2 + 0x47,param_2,unaff_EBX + 0x17,local_20,local_1c);
  draw_bevel(local_18,param_2 + 3,local_14,local_1c,local_20);
  SetTextColor(in_EAX,0xffffff);
  SetBkMode(in_EAX,1);
  uint_to_decimal(extraout_ECX,local_30);
  local_40.right = local_40.right + -8;
  DrawTextA(in_EAX,local_30,-1,&local_40,2);
  return;
}


// ==== draw_top_bar @ 00410e5a ====

void __fastcall draw_top_bar(undefined4 param_1,HDC param_2)

{
  HWND in_EAX;
  DWORD DVar1;
  HPEN h;
  HPEN h_00;
  tagRECT local_2c;
  HGDIOBJ local_1c;
  HBRUSH local_18;
  
  GetClientRect(in_EAX,&local_2c);
  local_2c.bottom = local_2c.top + 0x2b;
  DVar1 = GetSysColor(0xf);
  local_18 = CreateSolidBrush(DVar1);
  FillRect(param_2,&local_2c,local_18);
  DVar1 = GetSysColor(0x14);
  h = CreatePen(0,1,DVar1);
  DVar1 = GetSysColor(0x10);
  h_00 = CreatePen(0,1,DVar1);
  local_1c = SelectObject(param_2,h_00);
  MoveToEx(param_2,0,0,(LPPOINT)0x0);
  LineTo(param_2,local_2c.right + 1,0);
  SelectObject(param_2,h);
  MoveToEx(param_2,0,1,(LPPOINT)0x0);
  LineTo(param_2,local_2c.right + 1,1);
  SelectObject(param_2,h_00);
  MoveToEx(param_2,0,0x2b,(LPPOINT)0x0);
  LineTo(param_2,local_2c.right + 1,0x2b);
  SelectObject(param_2,h);
  MoveToEx(param_2,0,0x2a,(LPPOINT)0x0);
  LineTo(param_2,local_2c.right + 1,0x2a);
  DVar1 = GetSysColor(0x10);
  SetTextColor(param_2,DVar1);
  SetBkMode(param_2,1);
  local_2c.right = preview_x + -0xf;
  local_2c.left = preview_x + -0x4f;
  local_2c.top = 0xf;
  local_2c.bottom = 0x1f;
  DrawTextA(param_2,&DAT_00428caf,4,&local_2c,2);
  local_2c.top = local_2c.top + -1;
  local_2c.right = local_2c.right + -1;
  SetTextColor(param_2,0xffffff);
  DrawTextA(param_2,&DAT_00428cb4,4,&local_2c,2);
  DVar1 = GetSysColor(0x10);
  SetTextColor(param_2,DVar1);
  local_2c.left = preview_x + 0x7d;
  local_2c.right = preview_x + 0xbd;
  local_2c.top = 0xf;
  local_2c.bottom = 0x1f;
  DrawTextA(param_2,s_Colors_00428cb9,6,&local_2c,0);
  local_2c.top = local_2c.top + -1;
  local_2c.left = local_2c.left + -1;
  SetTextColor(param_2,0xffffff);
  DrawTextA(param_2,s_Colors_00428cc0,6,&local_2c,0);
  draw_score_box(king_score,0x18);
  SelectObject(param_2,local_1c);
  DeleteObject(h);
  DeleteObject(h_00);
  DeleteObject(local_18);
  return;
}


// ==== draw_king_figure @ 0041106b ====

void __fastcall draw_king_figure(undefined4 param_1,char param_2)

{
  HDC in_EAX;
  HBRUSH hbr;
  RECT local_20;
  
  if (param_2 != '\0') {
    BitBlt(in_EAX,king_x,king_y + -9,0x3a,9,hSpriteDC,1,0xc9,0xcc0020);
    BitBlt(in_EAX,king_x + 6,king_y + -0x86 + king_gauge,0x2d,0x7d - king_gauge,hSpriteDC,0x1a4,100,
           0xcc0020);
    local_20.left = king_x + -0x10;
    local_20.right = king_x + 0x4a;
    local_20.top = king_y + 8;
    local_20.bottom = king_y + 0x18;
    SetTextColor(in_EAX,0xffffff);
    hbr = GetStockObject(4);
    FillRect(in_EAX,&local_20,hbr);
    DrawTextA(in_EAX,&king_name,-1,&local_20,1);
  }
  BitBlt(in_EAX,king_x + -1,king_y + -0xea + king_gauge,0x48,100,hSpriteDC,
         (uint)king_frame * 0x49 + 1,0,0xcc0020);
  return;
}


// ==== draw_pretender_figure @ 00411196 ====

void __fastcall draw_pretender_figure(undefined4 param_1,char param_2)

{
  HDC in_EAX;
  HBRUSH hbr;
  char unaff_BL;
  RECT local_20;
  
  if (param_2 != '\0') {
    BitBlt(in_EAX,pretender_x,pretender_y + -9,0x3a,9,hSpriteDC,1,0xc9,0xcc0020);
    BitBlt(in_EAX,pretender_x + 6,pretender_y + -0x86 + pretender_gauge,0x2d,0x7d - pretender_gauge,
           hSpriteDC,0x1a4,100,0xcc0020);
    local_20.left = pretender_x + -0x10;
    local_20.right = pretender_x + 0x4a;
    local_20.top = pretender_y + 8;
    local_20.bottom = pretender_y + 0x18;
    SetTextColor(in_EAX,0xffffff);
    hbr = GetStockObject(4);
    FillRect(in_EAX,&local_20,hbr);
    DrawTextA(in_EAX,pretender_label,-1,&local_20,1);
  }
  if ((pretender_frame == 0) || (unaff_BL != '\0')) {
    BitBlt(in_EAX,pretender_x + -10,pretender_y + -0xea + pretender_gauge,0x48,100,hSpriteDC,1,100,
           0xcc0020);
  }
  if (pretender_frame != 0) {
    BitBlt(in_EAX,pretender_x + -10,pretender_y + pretender_gauge + -0xe4,0x32,0x41,hSpriteDC,
           (uint)pretender_frame * 0x33 + 0x17,100,0xcc0020);
  }
  return;
}


// ==== add_score_and_animate @ 00411313 ====

void __fastcall add_score_and_animate(undefined4 param_1,int param_2)

{
  int iVar1;
  undefined4 extraout_ECX;
  undefined4 uVar2;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  int extraout_ECX_02;
  undefined4 extraout_ECX_03;
  int extraout_ECX_04;
  int iVar3;
  
  score = score + param_2;
  draw_score_box(score,score_box_x);
  if (phase == 0) {
    iVar1 = 0x7d - (score * 0x7d) / king_score;
    if (iVar1 < 0) {
      iVar1 = 0;
    }
    while (iVar3 = pretender_gauge, iVar1 != pretender_gauge) {
      pretender_gauge = pretender_gauge + -1;
      draw_pretender_figure(iVar3,'\0');
      Sleep(0x19);
    }
    if (king_score < score) {
      iVar1 = pretender_gauge;
      for (iVar3 = 0; iVar3 < 6; iVar3 = iVar3 + 1) {
        king_frame = king_frame + '\x01';
        pretender_frame = pretender_frame + '\x01';
        draw_king_figure(iVar1,'\0');
        draw_pretender_figure(extraout_ECX_01,'\0');
        Sleep(0x96);
        iVar1 = extraout_ECX_02;
      }
      for (iVar3 = 0; iVar3 < 3; iVar3 = iVar3 + 1) {
        pretender_frame = pretender_frame + -1;
        draw_pretender_figure(iVar1,'\0');
        Sleep(0x96);
        pretender_frame = pretender_frame + '\x01';
        draw_pretender_figure(extraout_ECX_03,'\0');
        Sleep(0x96);
        iVar1 = extraout_ECX_04;
      }
      phase = 1;
    }
  }
  else {
    iVar1 = ((score - king_score) * 0x7d) / king_score;
    uVar2 = extraout_ECX;
    if (0x7d < iVar1) {
      iVar1 = 0x7d;
    }
    while (iVar1 != king_gauge) {
      king_gauge = king_gauge + 1;
      draw_king_figure(uVar2,'\0');
      Sleep(0x19);
      uVar2 = extraout_ECX_00;
    }
  }
  return;
}


// ==== new_game_setup @ 00411481 ====

void new_game_setup(void)

{
  int iVar1;
  int extraout_ECX;
  int iVar2;
  uint extraout_EDX;
  uint extraout_EDX_00;
  uint uVar3;
  
  for (iVar1 = 0; iVar1 < 9; iVar1 = iVar1 + 1) {
    for (iVar2 = 0; iVar2 < 9; iVar2 = iVar2 + 1) {
      (&board)[iVar1 * 9 + iVar2] = 0;
    }
  }
  for (iVar1 = 0; iVar1 < 8; iVar1 = iVar1 + 1) {
    (&removed_counts)[iVar1] = 0;
  }
  init_next_queue(iVar1);
  draw_board();
  iVar1 = 0;
  uVar3 = extraout_EDX;
  while (iVar1 < 5) {
    spawn_ball(iVar1,uVar3);
    uVar3 = extraout_EDX_00;
    iVar1 = extraout_ECX + 1;
  }
  score = 0;
  phase = 0;
  draw_score_box(king_score,0x18);
  draw_score_box(score,score_box_x);
  draw_next_preview();
  return;
}


// ==== finish_game_and_restart @ 00411525 ====

void __fastcall finish_game_and_restart(undefined4 param_1)

{
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  undefined4 extraout_ECX_02;
  undefined4 extraout_ECX_03;
  int iVar1;
  
  if (phase != 0) {
    str_copy();
    king_score = score;
    draw_king_figure(extraout_ECX,'\x01');
    param_1 = extraout_ECX_00;
    for (iVar1 = 0; iVar1 < 6; iVar1 = iVar1 + 1) {
      king_frame = king_frame + -1;
      draw_king_figure(param_1,'\0');
      Sleep(0x96);
      param_1 = extraout_ECX_01;
    }
    while (king_gauge != 0) {
      iVar1 = king_gauge + -4;
      king_gauge = iVar1;
      if (iVar1 < 0) {
        king_gauge = 0;
      }
      draw_king_figure(iVar1,'\0');
      Sleep(0xf);
      param_1 = extraout_ECX_02;
    }
  }
  if (pretender_frame != '\0') {
    for (iVar1 = 0; iVar1 < 6; iVar1 = iVar1 + 1) {
      pretender_frame = pretender_frame + -1;
      draw_pretender_figure(param_1,'\0');
      Sleep(0x96);
      param_1 = extraout_ECX_03;
    }
  }
  while (pretender_gauge != 0x7d) {
    iVar1 = pretender_gauge + 4;
    pretender_gauge = iVar1;
    if (0x7d < iVar1) {
      pretender_gauge = 0x7d;
    }
    draw_pretender_figure(iVar1,'\0');
    Sleep(0xf);
  }
  new_game_setup();
  if (hStatsDlg == (HWND)0x0) {
    return;
  }
  InvalidateRect(hStatsDlg,(RECT *)0x0,0);
  noop();
  return;
}


// ==== load_high_scores @ 00411640 ====

void load_high_scores(void)

{
  HFILE hFile;
  int extraout_ECX;
  int iVar1;
  byte local_1c [4];
  
  hFile = _lopen(s_winlines_res_0042005c,0);
  if (hFile == -1) {
    hFile = _lopen(s_lines_res_0042006c,0);
  }
  if (hFile == -1) {
    str_copy();
    DAT_00430196 = 100;
    for (iVar1 = 1; iVar1 < 10; iVar1 = iVar1 + 1) {
      str_copy();
      *(undefined2 *)((int)&DAT_00430196 + extraout_ECX) = 0;
    }
  }
  else {
    for (iVar1 = 0; iVar1 < 10; iVar1 = iVar1 + 1) {
      _lread(hFile,local_1c,1);
      _lread(hFile,&high_score_table + iVar1 * 0x10,0xd);
      (&high_score_table)[(uint)local_1c[0] + iVar1 * 0x10] = 0;
      _lread(hFile,&DAT_00430196 + iVar1 * 8,2);
    }
    _lclose(hFile);
  }
  king_score = (uint)DAT_00430196;
  str_copy();
  high_scores_dirty = 0;
  noop();
  return;
}


// ==== save_high_scores @ 0041172d ====

void save_high_scores(void)

{
  HFILE hFile;
  int iVar1;
  int iVar2;
  CHAR local_18 [4];
  
  if (high_scores_dirty != 0) {
    hFile = _lopen(s_winlines_res_0042005c,1);
    if (hFile == -1) {
      hFile = _lopen(s_lines_res_0042006c,1);
    }
    if (hFile == -1) {
      hFile = _lcreat(s_winlines_res_0042005c,0);
    }
    for (iVar2 = 0; iVar2 < 10; iVar2 = iVar2 + 1) {
      iVar1 = str_len();
      local_18[0] = (CHAR)iVar1;
      _lwrite(hFile,local_18,1);
      _lwrite(hFile,&high_score_table + iVar2 * 0x10,0xd);
      _lwrite(hFile,(LPCCH)(&DAT_00430196 + iVar2 * 8),2);
    }
    _lclose(hFile);
  }
  return;
}


// ==== record_high_score @ 004117c5 ====

void record_high_score(void)

{
  HWND in_EAX;
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar2 = 0;
  while ((iVar2 < 10 && (score <= (int)(uint)(ushort)(&DAT_00430196)[iVar2 * 8]))) {
    iVar2 = iVar2 + 1;
  }
  if (iVar2 != 10) {
    high_scores_dirty = 1;
    for (iVar1 = 9; iVar1 != iVar2; iVar1 = iVar1 + -1) {
      iVar3 = iVar1 * 0x10;
      *(undefined4 *)(&high_score_table + iVar3) = (&pretender_y)[iVar1 * 4];
      *(undefined4 *)(iVar3 + 0x43018c) = (&pretender_gauge)[iVar1 * 4];
      *(undefined4 *)(iVar3 + 0x430190) = *(undefined4 *)(&pretender_frame + iVar3);
      *(undefined4 *)(iVar3 + 0x430194) = (&phase)[iVar1 * 4];
    }
    DialogBoxParamA(hInstance,&DAT_000003ea,in_EAX,EnterNameDlgProc,0);
    str_copy();
    (&DAT_00430196)[iVar2 * 8] = (undefined2)score;
    DialogBoxParamA(hInstance,&DAT_000003e9,in_EAX,HighScoresDlgProc,0);
    noop();
    return;
  }
  return;
}


// ==== WndProc @ 0041187e ====

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

LRESULT WndProc(HWND param_1,uint param_2,WPARAM param_3,uint param_4)

{
  int iVar1;
  byte bVar2;
  ushort uVar3;
  BOOL BVar4;
  LRESULT LVar5;
  HDC hdc;
  int iVar6;
  UINT UVar7;
  HMENU pHVar8;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  int extraout_ECX_02;
  undefined4 extraout_ECX_03;
  undefined4 extraout_ECX_04;
  undefined4 extraout_ECX_05;
  undefined4 extraout_ECX_06;
  undefined4 uVar9;
  undefined4 extraout_ECX_07;
  int iVar10;
  uint extraout_EDX;
  undefined4 extraout_EDX_00;
  uint extraout_EDX_01;
  uint uVar11;
  int iVar12;
  HDC unaff_EDI;
  undefined8 uVar13;
  LPCSTR lpTemplateName;
  UINT UVar14;
  code *lpDialogFunc;
  tagPAINTSTRUCT tStack_78;
  tagRECT local_38;
  undefined4 local_28;
  undefined4 local_24;
  int local_20;
  int local_1c;
  int local_18;
  int local_14;
  
  BVar4 = IsIconic(param_1);
  if (BVar4 == 0) {
    unaff_EDI = GetDC(param_1);
  }
  uVar3 = (ushort)(param_4 >> 0x10);
  if (param_2 < 0x24) {
    if (param_2 < 2) {
      if (param_2 == 1) {
        load_sprite_sheet();
        _DAT_00430004 = local_28;
        _DAT_00430008 = local_24;
        hSpriteDC = CreateCompatibleDC(unaff_EDI);
        hOldBitmap = SelectObject(hSpriteDC,_hSpriteBitmap);
        load_high_scores();
        SetTimer(param_1,0x1000,0x32,(TIMERPROC)0x0);
        anim_tick = 0;
        selection_state = 0;
        GetClientRect(param_1,&local_38);
        score_box_x = local_38.right + -0x60;
        score_box_y = 10;
        preview_x = (local_38.right + -0x6c) / 2;
        preview_y = 5;
        next_visible = 1;
        king_x = ((local_38.right + -0x148) / 2 + -0x3a) / 2;
        king_y = (local_38.bottom + -0xea) / 2 + 0xea;
        king_gauge = 0;
        king_frame = 0;
        iVar6 = (local_38.right + -0x148) / 2;
        pretender_x = iVar6 + 0x148 + (iVar6 + -0x3a) / 2;
        pretender_gauge = 0x7d;
        pretender_frame = 0;
        pretender_y = king_y;
        GetTickCount();
        srand();
        new_game_setup();
        return 0;
      }
    }
    else {
      if (param_2 < 3) {
        save_high_scores();
        if (hStatsDlg != (HWND)0x0) {
          DestroyWindow(hStatsDlg);
        }
        SelectObject(hSpriteDC,hOldBitmap);
        DeleteDC(hSpriteDC);
        DeleteObject(_hSpriteBitmap);
        DeleteObject(hPalette);
        KillTimer(param_1,0x1000);
        PostQuitMessage(0);
        return 0;
      }
      if (4 < param_2) {
        if (param_2 < 6) {
          board_x = (int)((param_4 & 0xffff) - 0x148) / 2;
          board_y = (int)(uVar3 - 0x178) / 2 + 0x2e;
          GetClientRect(param_1,&local_38);
          king_y = (local_38.bottom + -0xea) / 2 + 0xea;
          iVar6 = (local_38.right + -0x148) / 2;
          score_box_x = local_38.right + -0x60;
          preview_x = (local_38.right + -0x6c) / 2;
          king_x = ((local_38.right + -0x148) / 2 + -0x3a) / 2;
          pretender_x = iVar6 + 0x148 + (iVar6 + -0x3a) / 2;
          pretender_y = king_y;
          return 0;
        }
        if (param_2 == 0xf) {
          BVar4 = IsIconic(param_1);
          if (BVar4 != 0) {
            return 0;
          }
          hdc = BeginPaint(param_1,&tStack_78);
          SelectPalette(hdc,hPalette,0);
          RealizePalette(hdc);
          draw_board();
          draw_top_bar(extraout_ECX,hdc);
          draw_score_box(score,score_box_x);
          draw_next_preview();
          draw_king_figure(extraout_ECX_00,'\x01');
          draw_pretender_figure(extraout_ECX_01,'\x01');
          EndPaint(param_1,&tStack_78);
          return 0;
        }
      }
    }
    goto LAB_00411900;
  }
  if (param_2 < 0x25) {
    *(undefined4 *)(param_4 + 0x18) = 0x26c;
    *(undefined4 *)(param_4 + 0x1c) = 0x1a4;
    return 0;
  }
  if (param_2 < 0x113) {
    if (param_2 != 0x111) goto LAB_00411900;
    uVar3 = (ushort)param_3;
    if (uVar3 < 0x200) {
      if (uVar3 < 0x101) {
        if (uVar3 != 0x100) {
          return 0;
        }
        selection_state = 0;
        goto LAB_00411ddb;
      }
      if (0x101 < uVar3) {
        if (uVar3 != 0x102) {
          return 0;
        }
        DestroyWindow(param_1);
        return 0;
      }
      lpDialogFunc = HighScoresDlgProc;
      lpTemplateName = &DAT_000003e9;
    }
    else {
      if (uVar3 < 0x201) {
        next_visible = next_visible ^ 1;
        UVar7 = (uint)next_visible << 3;
        UVar14 = 0x200;
        pHVar8 = GetMenu(param_1);
        CheckMenuItem(pHVar8,UVar14,UVar7);
        draw_next_preview();
        return 0;
      }
      if (uVar3 < 0x300) {
        if (uVar3 != 0x201) {
          return 0;
        }
        stats_visible = stats_visible ^ 1;
        if (stats_visible == 0) {
          DestroyWindow(hStatsDlg);
          hStatsDlg = (HWND)0x0;
        }
        else {
          hStatsDlg = CreateDialogParamA(hInstance,&DAT_000003ec,param_1,StatisticsDlgProc,0);
        }
        UVar7 = (uint)stats_visible << 3;
        UVar14 = 0x201;
        pHVar8 = GetMenu(param_1);
        CheckMenuItem(pHVar8,UVar14,UVar7);
        return 0;
      }
      if (uVar3 < 0x301) {
        lpDialogFunc = RulesDlgProc;
        lpTemplateName = &DAT_000003e8;
      }
      else {
        if (uVar3 != 0x301) {
          return 0;
        }
        lpDialogFunc = AboutDlgProc;
        lpTemplateName = &DAT_000003eb;
      }
    }
    DialogBoxParamA(hInstance,lpTemplateName,param_1,lpDialogFunc,0);
  }
  else {
    if (param_2 < 0x114) {
      anim_tick = anim_tick + 1;
      BVar4 = IsIconic(param_1);
      if (BVar4 != 0) {
        return 0;
      }
      if (selection_state != 1) {
        return 0;
      }
      draw_cell_frame((int)anim_tick % 6,(uint)selected_col);
      return 0;
    }
    if (param_2 < 0x201) {
LAB_00411900:
      LVar5 = DefWindowProcA(param_1,param_2,param_3,param_4);
      return LVar5;
    }
    if (param_2 < 0x202) {
      iVar6 = pixel_to_cell(&mouse_down_row,(uint)uVar3);
      if (iVar6 == 0) {
        mouse_down_outside = 1;
        return 0;
      }
      mouse_down_outside = 0;
      return 0;
    }
    if (param_2 != 0x202) goto LAB_00411900;
    iVar6 = pixel_to_cell(&local_1c,(uint)uVar3);
    if (iVar6 == 0) {
      return 0;
    }
    if (mouse_down_outside != '\0') {
      return 0;
    }
    if (mouse_down_col != local_20) {
      return 0;
    }
    if (mouse_down_row != local_1c) {
      return 0;
    }
    iVar6 = mouse_down_row * 8 + local_1c + local_20;
    if (selection_state == 0) {
      if ((&board)[iVar6] == '\0') {
        return 0;
      }
      anim_tick = 3;
      selection_state = 1;
      selected_col = (undefined1)local_20;
      selected_row = (byte)local_1c;
      return 0;
    }
    if (selection_state != 1) {
      return 0;
    }
    if ((&board)[iVar6] != '\0') {
      draw_cell_frame(0,(uint)selected_col);
      anim_tick = anim_tick | 3;
      selected_col = (undefined1)local_20;
      selected_row = (byte)local_1c;
      return 0;
    }
    _moving_color = (uint)(byte)(&board)[(uint)selected_col + (uint)selected_row * 9];
    iVar6 = find_path((byte)local_1c,selected_row);
    if (iVar6 == 0) {
      MessageBeep(0x40);
      return 0;
    }
    iVar6 = 0;
    selection_state = 0;
    iVar12 = 0;
    while( true ) {
      iVar1 = path_len - 1;
      local_14 = iVar6 % 6;
      iVar10 = local_14;
      if (iVar1 <= iVar12) break;
      local_18 = iVar12 * 2;
      bVar2 = (&DAT_00430095)[local_18];
      (&board)[(uint)(byte)(&DAT_00430094)[local_18] * 9 + (uint)bVar2] = 0;
      draw_cell_frame(0,(uint)bVar2);
      bVar2 = (&DAT_00430097)[local_18];
      (&board)[(uint)(byte)(&DAT_00430096)[local_18] * 9 + (uint)bVar2] = moving_color;
      draw_cell_frame(local_14,(uint)bVar2);
      iVar6 = iVar6 + 1;
      Sleep(0x32);
      iVar12 = iVar12 + 1;
    }
    while (iVar10 != 0) {
      draw_cell_frame(iVar6 % 6,(uint)(byte)(&DAT_00430095)[iVar12 * 2]);
      iVar6 = iVar6 + 1;
      iVar1 = extraout_ECX_02;
      iVar10 = iVar6 % 6;
    }
    iVar12 = mark_lines_at(iVar1,(uint)(byte)(&DAT_00430094)[iVar12 * 2]);
    iVar6 = 0;
    uVar9 = extraout_ECX_03;
    uVar11 = extraout_EDX;
    if (iVar12 != 0) {
      remove_marked_cells();
      uVar13 = line_score(extraout_ECX_04,extraout_EDX_00);
      add_score_and_animate(extraout_ECX_05,(int)uVar13);
      return 0;
    }
    for (; iVar6 < 3; iVar6 = iVar6 + 1) {
      spawn_ball(uVar9,uVar11);
      uVar9 = extraout_ECX_06;
      uVar11 = extraout_EDX_01;
    }
    uVar13 = count_empty_cells(uVar9,uVar11);
    if ((int)uVar13 != 0) {
      draw_next_preview();
      if (hStatsDlg == (HWND)0x0) {
        return 0;
      }
      InvalidateRect(hStatsDlg,(RECT *)0x0,0);
      return 0;
    }
    MessageBoxA(param_1,s_Game_over__00428cda,s_Color_linez_00420090,0x30);
LAB_00411ddb:
    record_high_score();
    finish_game_and_restart(extraout_ECX_07);
  }
  return 0;
}


// ==== RulesDlgProc @ 004121b5 ====

undefined4 RulesDlgProc(HWND param_1,uint param_2,short param_3)

{
  tagPAINTSTRUCT tStack_54;
  tagRECT local_14;
  
  if (param_2 < 0x10) {
    if (param_2 != 0xf) {
      return 0;
    }
    BeginPaint(param_1,&tStack_54);
    EndPaint(param_1,&tStack_54);
  }
  else {
    if (0x10 < param_2) {
      if (param_2 < 0x110) {
        return 0;
      }
      if (param_2 < 0x111) {
        SetFocus(param_1);
        GetWindowRect(param_1,&local_14);
        MoveWindow(param_1,(screen_w - (local_14.right - local_14.left)) / 2,
                   (screen_h - (local_14.bottom - local_14.top)) / 2,local_14.right - local_14.left,
                   local_14.bottom - local_14.top,1);
        return 1;
      }
      if (param_2 != 0x111) {
        return 0;
      }
      if (param_3 != 0x100) {
        return 0;
      }
    }
    EndDialog(param_1,0);
  }
  return 1;
}


// ==== HighScoresDlgProc @ 00412279 ====

undefined4 HighScoresDlgProc(HWND param_1,uint param_2,short param_3)

{
  int iVar1;
  HDC hdc;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  undefined4 extraout_ECX_02;
  undefined4 extraout_ECX_03;
  undefined4 uVar2;
  int iVar3;
  tagPAINTSTRUCT tStack_7c;
  char local_3c [20];
  tagRECT local_28;
  HGDIOBJ local_18;
  HFONT local_14;
  
  if (param_2 < 0x10) {
    if (param_2 != 0xf) {
      return 0;
    }
    hdc = BeginPaint(param_1,&tStack_7c);
    local_14 = CreateFontA(0x12,0,0,0,400,0,0,0,0,0,0,0,0,s_MS_Sans_Serif_00420080);
    local_18 = SelectObject(hdc,local_14);
    SetBkMode(hdc,1);
    SetTextColor(hdc,0);
    GetClientRect(param_1,&local_28);
    local_28.left = local_28.left + 0x10;
    local_28.right = local_28.right + -0x10;
    uVar2 = extraout_ECX;
    iVar1 = local_28.top;
    for (iVar3 = 0; local_28.top = iVar1 + 0x10, iVar3 < 10; iVar3 = iVar3 + 1) {
      local_28.bottom = iVar1 + 0x20;
      uint_to_decimal(uVar2,local_3c);
      str_append(extraout_ECX_00,&DAT_00428ce5);
      str_append(extraout_ECX_01,&high_score_table + iVar3 * 0x10);
      DrawTextA(hdc,local_3c,-1,&local_28,0);
      uint_to_decimal(extraout_ECX_02,local_3c);
      DrawTextA(hdc,local_3c,-1,&local_28,2);
      uVar2 = extraout_ECX_03;
      iVar1 = local_28.top;
    }
    SelectObject(hdc,local_18);
    DeleteObject(local_14);
    EndPaint(param_1,&tStack_7c);
  }
  else {
    if (0x10 < param_2) {
      if (param_2 < 0x110) {
        return 0;
      }
      if (param_2 < 0x111) {
        SetFocus(param_1);
        GetWindowRect(param_1,&local_28);
        MoveWindow(param_1,(screen_w - (local_28.right - local_28.left)) / 2,
                   (screen_h - (local_28.bottom - local_28.top)) / 2,local_28.right - local_28.left,
                   local_28.bottom - local_28.top,1);
        return 1;
      }
      if (param_2 != 0x111) {
        return 0;
      }
      if (param_3 != 0x100) {
        return 0;
      }
    }
    EndDialog(param_1,0);
  }
  return 1;
}


// ==== EnterNameDlgProc @ 00412454 ====

undefined4 EnterNameDlgProc(HWND param_1,uint param_2,short param_3)

{
  int iVar1;
  uint uVar2;
  uint extraout_EDX;
  uint extraout_EDX_00;
  char *lpText;
  tagPAINTSTRUCT tStack_70;
  byte local_30 [20];
  tagRECT local_1c;
  
  if (param_2 < 0x10) {
    if (param_2 == 0xf) {
      BeginPaint(param_1,&tStack_70);
      EndPaint(param_1,&tStack_70);
      return 1;
    }
    return 0;
  }
  if (param_2 < 0x11) {
    GetDlgItemTextA(param_1,0x101,(LPSTR)local_30,0x10);
    iVar1 = str_len();
    if (iVar1 == 0) {
LAB_00412528:
      lpText = s_You_must_enter_some_name_0042009c;
      goto LAB_00412576;
    }
    uVar2 = str_len();
    if (uVar2 < 0xe) {
      do {
        uVar2 = str_len();
        if (uVar2 <= extraout_EDX) {
LAB_00412586:
          str_copy();
          EndDialog(param_1,0);
          return 1;
        }
      } while ((local_30[extraout_EDX] & 0x80) == 0);
LAB_0041256a:
      lpText = s_You_can_use_only_latin_character_004200c8;
      goto LAB_00412576;
    }
  }
  else {
    if (param_2 < 0x110) {
      return 0;
    }
    if (param_2 < 0x111) {
      SetFocus(param_1);
      GetWindowRect(param_1,&local_1c);
      SetDlgItemTextA(param_1,0x101,player_name);
      MoveWindow(param_1,(screen_w - (local_1c.right - local_1c.left)) / 2,
                 (screen_h - (local_1c.bottom - local_1c.top)) / 2,local_1c.right - local_1c.left,
                 local_1c.bottom - local_1c.top,1);
      return 1;
    }
    if (param_2 != 0x111) {
      return 0;
    }
    if (param_3 != 0x100) {
      return 0;
    }
    GetDlgItemTextA(param_1,0x101,(LPSTR)local_30,0x10);
    iVar1 = str_len();
    if (iVar1 == 0) goto LAB_00412528;
    uVar2 = str_len();
    if (uVar2 < 0xe) {
      do {
        uVar2 = str_len();
        if (uVar2 <= extraout_EDX_00) goto LAB_00412586;
      } while ((local_30[extraout_EDX_00] & 0x80) == 0);
      goto LAB_0041256a;
    }
  }
  lpText = s_Name_too_long_004200b8;
LAB_00412576:
  MessageBoxA(param_1,lpText,s_Error_00420078,0);
  return 1;
}


// ==== AboutDlgProc @ 0041260f ====

undefined4 AboutDlgProc(HWND param_1,uint param_2,short param_3)

{
  HDC hdc;
  HBITMAP h;
  HDC hdc_00;
  tagPAINTSTRUCT tStack_68;
  tagRECT local_28;
  HBITMAP local_18;
  HGDIOBJ local_14;
  
  if (param_2 < 0x10) {
    if (param_2 != 0xf) {
      return 0;
    }
    hdc = BeginPaint(param_1,&tStack_68);
    local_18 = LoadBitmapA(hInstance,&DAT_000007d0);
    h = LoadBitmapA(hInstance,&DAT_000007d1);
    hdc_00 = CreateCompatibleDC(hdc);
    local_14 = SelectObject(hdc_00,h);
    BitBlt(hdc,10,0x20,0x43,0x32,hdc_00,0,0,0x8800c6);
    SelectObject(hdc_00,local_18);
    BitBlt(hdc,10,0x20,0x43,0x32,hdc_00,0,0,0xee0086);
    SelectObject(hdc_00,local_14);
    DeleteDC(hdc_00);
    DeleteObject(h);
    DeleteObject(local_18);
    EndPaint(param_1,&tStack_68);
  }
  else {
    if (0x10 < param_2) {
      if (param_2 < 0x110) {
        return 0;
      }
      if (param_2 < 0x111) {
        SetFocus(param_1);
        GetWindowRect(param_1,&local_28);
        MoveWindow(param_1,(screen_w - (local_28.right - local_28.left)) / 2,
                   (screen_h - (local_28.bottom - local_28.top)) / 2,local_28.right - local_28.left,
                   local_28.bottom - local_28.top,1);
        return 1;
      }
      if (param_2 != 0x111) {
        return 0;
      }
      if (param_3 != 0x100) {
        return 0;
      }
    }
    EndDialog(param_1,0);
  }
  return 1;
}


// ==== StatisticsDlgProc @ 0041277c ====

undefined4 StatisticsDlgProc(HWND param_1,uint param_2)

{
  HDC hdc;
  DWORD color;
  HMENU hMenu;
  undefined4 uVar1;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  undefined4 extraout_ECX_02;
  undefined4 extraout_ECX_03;
  undefined4 extraout_ECX_04;
  undefined4 extraout_ECX_05;
  undefined4 extraout_ECX_06;
  int iVar2;
  int iVar3;
  UINT uIDCheckItem;
  UINT uCheck;
  char local_d8 [64];
  tagPAINTSTRUCT local_98;
  int aiStack_58 [8];
  char local_38 [16];
  tagRECT local_28;
  HGDIOBJ local_18;
  HFONT local_14;
  
  if (param_2 < 0x10) {
    if (param_2 != 0xf) {
      return 0;
    }
    hdc = BeginPaint(param_1,&local_98);
    for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
      aiStack_58[iVar3] = 0;
    }
    for (iVar3 = 0; iVar3 < 9; iVar3 = iVar3 + 1) {
      for (iVar2 = 0; iVar2 < 9; iVar2 = iVar2 + 1) {
        aiStack_58[(byte)(&board)[iVar3 * 9 + iVar2]] =
             aiStack_58[(byte)(&board)[iVar3 * 9 + iVar2]] + 1;
      }
    }
    local_14 = CreateFontA(0x10,0,0,0,400,0,0,0,0,0,0,0,0,s_MS_Sans_Serif_00420080);
    local_18 = SelectObject(hdc,local_14);
    color = GetSysColor(0xf);
    SetBkColor(hdc,color);
    SetTextColor(hdc,0);
    GetClientRect(param_1,&local_28);
    local_28.left = local_28.left + 0x2c;
    local_28.bottom = local_28.top + 0x23;
    for (iVar3 = 0; iVar3 < 8; iVar3 = iVar3 + 1) {
      BitBlt(hdc,local_28.left + -0x2c,local_28.top,0x24,0x24,hSpriteDC,iVar3 * 0x24,0xe1,0xcc0020);
      uint_to_decimal(extraout_ECX,local_d8);
      str_append(extraout_ECX_00,&DAT_00428ce8);
      uint_to_decimal(0x51,local_38);
      str_append(extraout_ECX_01,local_38);
      str_append(extraout_ECX_02,&DAT_00428ceb);
      uVar1 = extraout_ECX_03;
      if (iVar3 != 0) {
        str_append(extraout_ECX_03,s___del__00428cee);
        uint_to_decimal(extraout_ECX_04,local_38);
        str_append(extraout_ECX_05,local_38);
        uVar1 = extraout_ECX_06;
      }
      str_append(uVar1,s__00428cf5);
      DrawTextA(hdc,local_d8,-1,&local_28,0x24);
      local_28.top = local_28.top + 0x24;
      local_28.bottom = local_28.bottom + 0x24;
    }
    SelectObject(hdc,local_18);
    DeleteObject(local_14);
    EndPaint(param_1,&local_98);
  }
  else if (param_2 < 0x11) {
    DestroyWindow(param_1);
    hStatsDlg = 0;
    stats_visible = 0;
    uCheck = 0;
    uIDCheckItem = 0x201;
    hMenu = GetMenu(hMainWnd);
    CheckMenuItem(hMenu,uIDCheckItem,uCheck);
  }
  else {
    if (param_2 != 0x110) {
      return 0;
    }
    GetWindowRect(hMainWnd,&local_28);
    MoveWindow(param_1,board_x + 0x154 + local_28.left,local_28.top + 0x20,0xa4,0x136,0);
    SetFocus(hMainWnd);
  }
  return 1;
}


// ==== FUN_00412a4d @ 00412a4d ====

undefined4 __fastcall FUN_00412a4d(int param_1,undefined4 param_2)

{
  uint uVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  byte bVar4;
  char *in_EAX;
  HGLOBAL pvVar5;
  uint *puVar6;
  HPALETTE pHVar7;
  HBITMAP pHVar8;
  undefined4 unaff_EBX;
  int iVar9;
  BITMAPINFOHEADER *pbmi;
  int unaff_EBP;
  uint *puVar10;
  
  bVar4 = (byte)in_EAX;
  *in_EAX = *in_EAX + bVar4;
  *(char *)(param_1 + 0x56) = *(char *)(param_1 + 0x56) + (char)param_2;
  *(undefined4 *)(unaff_EBP + -0x10) = param_2;
  *(undefined4 *)(unaff_EBP + -0x14) = unaff_EBX;
  *(uint *)(unaff_EBP + -4) =
       CONCAT31((int3)((uint)in_EAX >> 8),(bVar4 + (byte)param_1) - CARRY1(bVar4,(byte)param_1));
  *(int *)(unaff_EBP + -0x1c) = param_1;
  DAT_00430f6e = 0;
  pvVar5 = alloc_and_unpack_sprites();
  if (pvVar5 != (HGLOBAL)0x0) {
    *(HGLOBAL *)(unaff_EBP + -0x18) = pvVar5;
    uVar2 = *(undefined4 *)((int)pvVar5 + 0x12);
    puVar3 = *(undefined4 **)(unaff_EBP + -0x1c);
    *puVar3 = uVar2;
    puVar3[1] = uVar2;
    iVar9 = *(int *)((int)pvVar5 + 0x2e);
    if (iVar9 == 0) {
      iVar9 = 1 << (*(byte *)((int)pvVar5 + 0x1c) & 0x1f);
    }
    *(int *)(unaff_EBP + -8) = iVar9;
    puVar6 = GlobalAlloc(0,iVar9 * 4 + 4);
    if (puVar6 != (uint *)0x0) {
      *(uint **)(unaff_EBP + -0xc) = puVar6;
      *(undefined2 *)puVar6 = 0x300;
      *(short *)((int)puVar6 + 2) = (short)*(undefined4 *)(unaff_EBP + -8);
      iVar9 = *(int *)(unaff_EBP + -8);
      puVar10 = (uint *)(*(int *)(unaff_EBP + -0x18) + 0x36);
      do {
        puVar6 = puVar6 + 1;
        uVar1 = *puVar10;
        *puVar6 = uVar1 & 0xff00ff00 | (uVar1 & 0xff) << 0x10 | uVar1 >> 0x10 & 0xff;
        iVar9 = iVar9 + -1;
        puVar10 = puVar10 + 1;
      } while (iVar9 != 0);
      pHVar7 = CreatePalette(*(LOGPALETTE **)(unaff_EBP + -0xc));
      puVar3 = *(undefined4 **)(unaff_EBP + -0x14);
      *puVar3 = pHVar7;
      GlobalFree(*(HGLOBAL *)(unaff_EBP + -0xc));
      SelectPalette(*(HDC *)(unaff_EBP + -4),(HPALETTE)*puVar3,0);
      RealizePalette(*(HDC *)(unaff_EBP + -4));
      pbmi = (BITMAPINFOHEADER *)(*(int *)(unaff_EBP + -0x18) + 0xe);
      pHVar8 = CreateDIBitmap(*(HDC *)(unaff_EBP + -4),pbmi,4,
                              (void *)(*(int *)(*(int *)(unaff_EBP + -0x18) + 10) +
                                      *(int *)(unaff_EBP + -0x18)),(BITMAPINFO *)pbmi,0);
      GlobalFree(*(HGLOBAL *)(unaff_EBP + -0x18));
      if (pHVar8 != (HBITMAP)0x0) {
        **(undefined4 **)(unaff_EBP + -0x10) = pHVar8;
        return 1;
      }
    }
  }
  return 0;
}


// ==== FUN_00412a4f @ 00412a4f ====

undefined4 __fastcall FUN_00412a4f(int param_1,undefined4 param_2)

{
  uint uVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  undefined4 in_EAX;
  HGLOBAL pvVar4;
  uint *puVar5;
  HPALETTE pHVar6;
  HBITMAP pHVar7;
  undefined4 unaff_EBX;
  int iVar8;
  BITMAPINFOHEADER *pbmi;
  int unaff_EBP;
  uint *puVar9;
  
  *(char *)(param_1 + 0x56) = *(char *)(param_1 + 0x56) + (char)param_2;
  *(undefined4 *)(unaff_EBP + -0x10) = param_2;
  *(undefined4 *)(unaff_EBP + -0x14) = unaff_EBX;
  *(uint *)(unaff_EBP + -4) =
       CONCAT31((int3)((uint)in_EAX >> 8),
                ((byte)in_EAX + (byte)param_1) - CARRY1((byte)in_EAX,(byte)param_1));
  *(int *)(unaff_EBP + -0x1c) = param_1;
  DAT_00430f6e = 0;
  pvVar4 = alloc_and_unpack_sprites();
  if (pvVar4 != (HGLOBAL)0x0) {
    *(HGLOBAL *)(unaff_EBP + -0x18) = pvVar4;
    uVar2 = *(undefined4 *)((int)pvVar4 + 0x12);
    puVar3 = *(undefined4 **)(unaff_EBP + -0x1c);
    *puVar3 = uVar2;
    puVar3[1] = uVar2;
    iVar8 = *(int *)((int)pvVar4 + 0x2e);
    if (iVar8 == 0) {
      iVar8 = 1 << (*(byte *)((int)pvVar4 + 0x1c) & 0x1f);
    }
    *(int *)(unaff_EBP + -8) = iVar8;
    puVar5 = GlobalAlloc(0,iVar8 * 4 + 4);
    if (puVar5 != (uint *)0x0) {
      *(uint **)(unaff_EBP + -0xc) = puVar5;
      *(undefined2 *)puVar5 = 0x300;
      *(short *)((int)puVar5 + 2) = (short)*(undefined4 *)(unaff_EBP + -8);
      iVar8 = *(int *)(unaff_EBP + -8);
      puVar9 = (uint *)(*(int *)(unaff_EBP + -0x18) + 0x36);
      do {
        puVar5 = puVar5 + 1;
        uVar1 = *puVar9;
        *puVar5 = uVar1 & 0xff00ff00 | (uVar1 & 0xff) << 0x10 | uVar1 >> 0x10 & 0xff;
        iVar8 = iVar8 + -1;
        puVar9 = puVar9 + 1;
      } while (iVar8 != 0);
      pHVar6 = CreatePalette(*(LOGPALETTE **)(unaff_EBP + -0xc));
      puVar3 = *(undefined4 **)(unaff_EBP + -0x14);
      *puVar3 = pHVar6;
      GlobalFree(*(HGLOBAL *)(unaff_EBP + -0xc));
      SelectPalette(*(HDC *)(unaff_EBP + -4),(HPALETTE)*puVar3,0);
      RealizePalette(*(HDC *)(unaff_EBP + -4));
      pbmi = (BITMAPINFOHEADER *)(*(int *)(unaff_EBP + -0x18) + 0xe);
      pHVar7 = CreateDIBitmap(*(HDC *)(unaff_EBP + -4),pbmi,4,
                              (void *)(*(int *)(*(int *)(unaff_EBP + -0x18) + 10) +
                                      *(int *)(unaff_EBP + -0x18)),(BITMAPINFO *)pbmi,0);
      GlobalFree(*(HGLOBAL *)(unaff_EBP + -0x18));
      if (pHVar7 != (HBITMAP)0x0) {
        **(undefined4 **)(unaff_EBP + -0x10) = pHVar7;
        return 1;
      }
    }
  }
  return 0;
}


// ==== load_sprite_sheet @ 00412a50 ====

undefined4 load_sprite_sheet(void)

{
  uint uVar1;
  undefined4 uVar2;
  undefined4 *puVar3;
  HGLOBAL pvVar4;
  uint *puVar5;
  HPALETTE pHVar6;
  HBITMAP pHVar7;
  int iVar8;
  uint *puVar9;
  undefined1 *puVar10;
  
  puVar10 = &stack0xfffffffc;
  DAT_00430f6e = 0;
  pvVar4 = alloc_and_unpack_sprites();
  if (pvVar4 != (HGLOBAL)0x0) {
    *(HGLOBAL *)(puVar10 + -0x18) = pvVar4;
    uVar2 = *(undefined4 *)((int)pvVar4 + 0x12);
    puVar3 = *(undefined4 **)(puVar10 + -0x1c);
    *puVar3 = uVar2;
    puVar3[1] = uVar2;
    iVar8 = *(int *)((int)pvVar4 + 0x2e);
    if (iVar8 == 0) {
      iVar8 = 1 << (*(byte *)((int)pvVar4 + 0x1c) & 0x1f);
    }
    *(int *)(puVar10 + -8) = iVar8;
    puVar5 = GlobalAlloc(0,iVar8 * 4 + 4);
    if (puVar5 != (uint *)0x0) {
      *(uint **)(puVar10 + -0xc) = puVar5;
      *(undefined2 *)puVar5 = 0x300;
      *(short *)((int)puVar5 + 2) = (short)*(undefined4 *)(puVar10 + -8);
      iVar8 = *(int *)(puVar10 + -8);
      puVar9 = (uint *)(*(int *)(puVar10 + -0x18) + 0x36);
      do {
        puVar5 = puVar5 + 1;
        uVar1 = *puVar9;
        *puVar5 = uVar1 & 0xff00ff00 | (uVar1 & 0xff) << 0x10 | uVar1 >> 0x10 & 0xff;
        iVar8 = iVar8 + -1;
        puVar9 = puVar9 + 1;
      } while (iVar8 != 0);
      pHVar6 = CreatePalette(*(LOGPALETTE **)(puVar10 + -0xc));
      puVar3 = *(undefined4 **)(puVar10 + -0x14);
      *puVar3 = pHVar6;
      GlobalFree(*(HGLOBAL *)(puVar10 + -0xc));
      SelectPalette(*(HDC *)(puVar10 + -4),(HPALETTE)*puVar3,0);
      RealizePalette(*(HDC *)(puVar10 + -4));
      pHVar7 = CreateDIBitmap(*(HDC *)(puVar10 + -4),
                              (BITMAPINFOHEADER *)(*(int *)(puVar10 + -0x18) + 0xe),4,
                              (void *)(*(int *)(*(int *)(puVar10 + -0x18) + 10) +
                                      *(int *)(puVar10 + -0x18)),
                              (BITMAPINFO *)(*(int *)(puVar10 + -0x18) + 0xe),0);
      GlobalFree(*(HGLOBAL *)(puVar10 + -0x18));
      if (pHVar7 != (HBITMAP)0x0) {
        **(undefined4 **)(puVar10 + -0x10) = pHVar7;
        return 1;
      }
    }
  }
  return 0;
}


// ==== alloc_and_unpack_sprites @ 00412b5d ====

HGLOBAL alloc_and_unpack_sprites(void)

{
  HGLOBAL pvVar1;
  undefined4 extraout_ECX;
  uint extraout_EDX;
  
  pvVar1 = GlobalAlloc(0,0x4a000);
  if (pvVar1 != (HGLOBAL)0x0) {
    unpack(extraout_ECX,extraout_EDX);
  }
  return pvVar1;
}


// ==== FUN_00412b7c @ 00412b7c ====

uint __fastcall FUN_00412b7c(undefined4 param_1,uint param_2)

{
  ushort *puVar1;
  undefined1 *puVar2;
  char cVar5;
  uint uVar3;
  undefined4 uVar4;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  undefined4 extraout_ECX_02;
  uint extraout_EDX;
  undefined4 extraout_EDX_00;
  undefined4 extraout_EDX_01;
  undefined4 extraout_EDX_02;
  undefined1 *unaff_EBX;
  ushort *unaff_ESI;
  undefined1 *puVar7;
  undefined1 *unaff_EDI;
  byte bVar8;
  undefined4 uVar6;
  
  cVar5 = (char)((uint)param_1 >> 8);
  if (cVar5 != '\b') {
    FUN_00412c66(CONCAT31((int3)((uint)param_1 >> 8),cVar5));
    param_2 = extraout_EDX;
  }
  uVar3 = param_2 & 0xffff;
  puVar1 = unaff_ESI + 1;
  if ((ushort)(*unaff_ESI ^ (ushort)param_2) == 0xffff) {
    for (; uVar3 != 0; uVar3 = uVar3 - 1) {
      *unaff_EDI = (char)*puVar1;
      unaff_EDI = unaff_EDI + 1;
      puVar1 = (ushort *)((int)puVar1 + 1);
    }
    uVar4 = 0x800;
    while (bVar8 = 0, DAT_00430f6e == 0) {
      FUN_00412c57(uVar4);
      DAT_00430f6e = DAT_00430f6e << 1 | bVar8;
      FUN_00412d9f(extraout_ECX);
      uVar4 = extraout_ECX_00;
      uVar6 = extraout_EDX_00;
      while( true ) {
        while (param_2 = FUN_00412c7e(uVar4,(byte)uVar6), (char)(param_2 >> 8) == '\0') {
          *unaff_EDI = (char)param_2;
          uVar4 = extraout_ECX_01;
          uVar6 = extraout_EDX_01;
          unaff_EDI = unaff_EDI + 1;
        }
        uVar4 = extraout_ECX_01;
        if (param_2 == 0x100) break;
        puVar2 = (undefined1 *)(param_2 - 0xfe);
        FUN_00412d17(extraout_ECX_01,(byte)extraout_EDX_01);
        puVar7 = unaff_EDI + -1 + -(int)unaff_EBX;
        if (((unaff_EDI + -1 < unaff_EBX) || (puVar7 < DAT_00431170)) &&
           (unaff_EBX = DAT_00431170 + -(int)puVar7, unaff_EBX < puVar2)) {
          puVar2 = puVar2 + -(int)unaff_EBX;
          for (; unaff_EBX != (undefined1 *)0x0; unaff_EBX = unaff_EBX + -1) {
            *unaff_EDI = *puVar7;
            puVar7 = puVar7 + 1;
            unaff_EDI = unaff_EDI + 1;
          }
          unaff_EBX = (undefined1 *)0x0;
          puVar7 = DAT_00431170;
        }
        for (; uVar4 = extraout_ECX_02, uVar6 = extraout_EDX_02, puVar2 != (undefined1 *)0x0;
            puVar2 = puVar2 + -1) {
          *unaff_EDI = *puVar7;
          puVar7 = puVar7 + 1;
          unaff_EDI = unaff_EDI + 1;
        }
      }
    }
    return param_2;
  }
  uVar3 = FUN_00412ee9();
  return uVar3;
}


// ==== unpack @ 00412b9d ====

uint __fastcall unpack(undefined4 param_1,uint param_2)

{
  undefined1 *puVar1;
  undefined4 uVar2;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  undefined4 extraout_ECX_02;
  undefined4 extraout_EDX;
  undefined4 extraout_EDX_00;
  undefined4 extraout_EDX_01;
  undefined1 *unaff_EBX;
  undefined1 *puVar4;
  undefined1 *unaff_EDI;
  byte bVar5;
  undefined4 uVar3;
  
  DAT_00430f6e = 0;
  uVar2 = CONCAT22((short)((uint)param_1 >> 0x10),CONCAT11(8,(char)param_1));
  DAT_00431170 = unaff_EDI;
  while (bVar5 = 0, DAT_00430f6e == 0) {
    FUN_00412c57(uVar2);
    DAT_00430f6e = DAT_00430f6e << 1 | bVar5;
    FUN_00412d9f(extraout_ECX);
    uVar2 = extraout_ECX_00;
    uVar3 = extraout_EDX;
    while( true ) {
      while (param_2 = FUN_00412c7e(uVar2,(byte)uVar3), (char)(param_2 >> 8) == '\0') {
        *unaff_EDI = (char)param_2;
        uVar2 = extraout_ECX_01;
        uVar3 = extraout_EDX_00;
        unaff_EDI = unaff_EDI + 1;
      }
      uVar2 = extraout_ECX_01;
      if (param_2 == 0x100) break;
      puVar1 = (undefined1 *)(param_2 - 0xfe);
      FUN_00412d17(extraout_ECX_01,(byte)extraout_EDX_00);
      puVar4 = unaff_EDI + -1 + -(int)unaff_EBX;
      if (((unaff_EDI + -1 < unaff_EBX) || (puVar4 < DAT_00431170)) &&
         (unaff_EBX = DAT_00431170 + -(int)puVar4, unaff_EBX < puVar1)) {
        puVar1 = puVar1 + -(int)unaff_EBX;
        for (; unaff_EBX != (undefined1 *)0x0; unaff_EBX = unaff_EBX + -1) {
          *unaff_EDI = *puVar4;
          puVar4 = puVar4 + 1;
          unaff_EDI = unaff_EDI + 1;
        }
        unaff_EBX = (undefined1 *)0x0;
        puVar4 = DAT_00431170;
      }
      for (; uVar2 = extraout_ECX_02, uVar3 = extraout_EDX_01, puVar1 != (undefined1 *)0x0;
          puVar1 = puVar1 + -1) {
        *unaff_EDI = *puVar4;
        puVar4 = puVar4 + 1;
        unaff_EDI = unaff_EDI + 1;
      }
    }
  }
  return param_2;
}


// ==== FUN_00412c1a @ 00412c1a ====

undefined2 __fastcall FUN_00412c1a(undefined4 param_1)

{
  undefined2 uVar1;
  undefined2 uVar2;
  undefined4 extraout_ECX;
  
  if ((byte)param_1 < 9) {
    uVar1 = FUN_00412c66(param_1);
    return uVar1;
  }
  uVar1 = FUN_00412c1f(CONCAT31((int3)((uint)param_1 >> 8),8));
  uVar2 = FUN_00412c1f(CONCAT31((int3)((uint)extraout_ECX >> 8),(byte)param_1 - 8));
  return CONCAT11((char)uVar2,(char)uVar1);
}


// ==== FUN_00412c1f @ 00412c1f ====

undefined2 __fastcall FUN_00412c1f(undefined4 param_1)

{
  undefined2 uVar1;
  
  uVar1 = FUN_00412c66(param_1);
  return uVar1;
}


// ==== FUN_00412c57 @ 00412c57 ====

void __fastcall FUN_00412c57(undefined4 param_1)

{
  if ((char)((uint)param_1 >> 8) != '\x01') {
    return;
  }
  return;
}


// ==== FUN_00412c5e @ 00412c5e ====

void FUN_00412c5e(void)

{
  return;
}


// ==== FUN_00412c66 @ 00412c66 ====

void __fastcall FUN_00412c66(undefined4 param_1)

{
  if ((byte)((uint)param_1 >> 8) <= (byte)param_1) {
    FUN_00412c5e();
  }
  return;
}


// ==== FUN_00412c7e @ 00412c7e ====

uint __fastcall FUN_00412c7e(undefined4 param_1,byte param_2)

{
  byte bVar1;
  ushort uVar2;
  short sVar3;
  undefined4 uVar4;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  uint uVar5;
  
  sVar3 = *(short *)(&DAT_00430600 + (uint)param_2 * 2);
  uVar5 = (uint)sVar3;
  if ((int)uVar5 < 0) {
    FUN_00412ceb(param_1);
    uVar4 = extraout_ECX_00;
  }
  else {
    uVar4 = CONCAT31((int3)((uint)param_1 >> 8),(&DAT_004304a0)[uVar5]);
  }
  if ((char)uVar4 == '\0') {
    return 1;
  }
  FUN_00412c66(uVar4);
  if (uVar5 < 0x109) {
    return uVar5;
  }
  if (uVar5 != 0x11d) {
    bVar1 = (char)sVar3 - 1;
    sVar3 = (short)CONCAT31((int3)((uint)extraout_ECX >> 8),bVar1 >> 2) + -1;
    uVar2 = FUN_00412c1a(CONCAT22((short)((uint)extraout_ECX >> 0x10),sVar3));
    return (uint)uVar2 +
           (uint)(ushort)(((ushort)(byte)((bVar1 & 3) + 4) << ((byte)sVar3 & 0x1f)) + 0x101) &
           0xffff;
  }
  return 0x200;
}


// ==== FUN_00412ceb @ 00412ceb ====

void __fastcall FUN_00412ceb(undefined4 param_1)

{
  uint uVar1;
  int iVar2;
  uint uVar3;
  undefined1 extraout_DL;
  ushort unaff_BX;
  undefined4 unaff_ESI;
  
  iVar2 = FUN_00412c66(CONCAT31((int3)((uint)param_1 >> 8),8));
  uVar3 = CONCAT31((int3)((uint)unaff_ESI >> 8),extraout_DL);
  do {
    uVar1 = uVar3 & 1;
    uVar3 = uVar3 >> 1 & 0x7fff;
    unaff_BX = *(ushort *)((uint)(ushort)((~unaff_BX & 0xfffe | (ushort)(uVar1 != 0)) << 1) + iVar2)
    ;
  } while ((short)unaff_BX < 0);
  return;
}


// ==== FUN_00412d17 @ 00412d17 ====

void __fastcall FUN_00412d17(undefined4 param_1,byte param_2)

{
  short sVar1;
  undefined4 uVar2;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  
  sVar1 = *(short *)(&DAT_00430800 + (uint)param_2 * 2);
  if (sVar1 < 0) {
    FUN_00412ceb(param_1);
    uVar2 = extraout_ECX_00;
  }
  else {
    uVar2 = CONCAT31((int3)((uint)param_1 >> 8),(&DAT_004305e0)[sVar1]);
  }
  FUN_00412c66(uVar2);
  if (3 < (byte)sVar1) {
    FUN_00412c1a(CONCAT22((short)((uint)extraout_ECX >> 0x10),
                          (short)CONCAT31((int3)((uint)extraout_ECX >> 8),(byte)sVar1 >> 1) + -1));
  }
  return;
}


// ==== FUN_00412d9f @ 00412d9f ====

uint __fastcall FUN_00412d9f(undefined4 param_1)

{
  byte bVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  undefined2 extraout_var;
  int iVar4;
  uint uVar5;
  undefined2 extraout_var_00;
  undefined2 extraout_var_01;
  undefined2 extraout_var_02;
  undefined4 extraout_ECX;
  undefined4 extraout_ECX_00;
  undefined4 extraout_ECX_01;
  uint extraout_ECX_02;
  uint extraout_ECX_03;
  uint extraout_ECX_04;
  undefined3 uVar8;
  undefined4 extraout_ECX_05;
  uint uVar6;
  uint extraout_ECX_06;
  uint extraout_ECX_07;
  uint uVar7;
  undefined4 extraout_ECX_08;
  uint extraout_EDX;
  uint extraout_EDX_00;
  uint extraout_EDX_01;
  uint extraout_EDX_02;
  uint extraout_EDX_03;
  uint extraout_EDX_04;
  uint uVar9;
  undefined1 *puVar10;
  byte *pbVar11;
  undefined1 *puVar12;
  bool bVar13;
  longlong lVar14;
  
  uVar2 = FUN_00412c1a(CONCAT31((int3)((uint)param_1 >> 8),2));
  iVar4 = CONCAT22(extraout_var,uVar2) + -1;
  if (iVar4 < 0) {
    uVar5 = FUN_00412b7c(extraout_ECX,extraout_EDX);
    return uVar5;
  }
  if (CONCAT22(extraout_var,uVar2) == 1) {
    puVar10 = &DAT_004304a0;
    for (iVar4 = 0x90; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = 8;
      puVar10 = puVar10 + 1;
    }
    for (iVar4 = 0x70; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = 9;
      puVar10 = puVar10 + 1;
    }
    for (iVar4 = 0x18; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = 7;
      puVar10 = puVar10 + 1;
    }
    for (iVar4 = 8; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = 8;
      puVar10 = puVar10 + 1;
    }
    DAT_00430f4a = 0x20;
    puVar10 = &DAT_004305e0;
    for (iVar4 = 0x20; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = 5;
      puVar10 = puVar10 + 1;
    }
    DAT_00430f62 = 0x120;
    uVar5 = extraout_EDX;
  }
  else {
    if (iVar4 != 1) {
      uVar5 = FUN_00412ee9();
      return uVar5;
    }
    uVar2 = FUN_00412c1a(CONCAT31((int3)((uint)extraout_ECX >> 8),5));
    DAT_00430f62 = CONCAT22(extraout_var_00,uVar2) + 0x101;
    uVar2 = FUN_00412c1a(CONCAT31((int3)((uint)extraout_ECX_00 >> 8),5));
    DAT_00430f4a = CONCAT22(extraout_var_01,uVar2) + 1;
    puVar10 = &DAT_00430f4e;
    for (iVar4 = 0x13; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar10 = 0;
      puVar10 = puVar10 + 1;
    }
    uVar2 = FUN_00412c1a(CONCAT31((int3)((uint)extraout_ECX_01 >> 8),4));
    pbVar11 = &DAT_004200ec;
    uVar5 = extraout_ECX_02;
    do {
      uVar3 = FUN_00412c1a(CONCAT31((int3)(uVar5 >> 8),3));
      (&DAT_00430f4e)[*pbVar11] = (char)uVar3;
      pbVar11 = pbVar11 + 1;
      uVar5 = extraout_ECX_03;
    } while (pbVar11 < (byte *)(CONCAT22(extraout_var_02,uVar2) + 0x4200f0));
    lVar14 = FUN_00412ef3(extraout_ECX_03,extraout_EDX_00);
    uVar5 = (uint)((ulonglong)lVar14 >> 0x20);
    uVar9 = DAT_00430f62 + DAT_00430f4a;
    uVar6 = extraout_ECX_03;
    pbVar11 = &DAT_004304a0;
    do {
      while( true ) {
        bVar1 = (&DAT_00430f70)[(uVar5 & 0xff) * 2];
        FUN_00412c66(CONCAT31((int3)(uVar6 >> 8),(&DAT_00430f4e)[bVar1]));
        if (0xf < bVar1) break;
        *pbVar11 = bVar1;
        uVar9 = uVar9 - 1;
        uVar6 = extraout_ECX_04;
        uVar5 = extraout_EDX_01;
        pbVar11 = pbVar11 + 1;
        if (uVar9 == 0) goto LAB_00412e99;
      }
      uVar8 = (undefined3)(extraout_ECX_04 >> 8);
      if (bVar1 < 0x11) {
        uVar2 = FUN_00412c1a(CONCAT31(uVar8,2));
        bVar1 = (char)uVar2 + 3;
        uVar6 = CONCAT31((int3)((uint)extraout_ECX_05 >> 8),pbVar11[-1]);
        uVar5 = extraout_EDX_02;
      }
      else {
        if (bVar1 < 0x12) {
          uVar2 = FUN_00412c1a(CONCAT31(uVar8,3));
          bVar1 = (char)uVar2 + 3;
          uVar6 = extraout_ECX_06;
          uVar5 = extraout_EDX_03;
        }
        else {
          uVar2 = FUN_00412c1a(CONCAT31(uVar8,7));
          bVar1 = (char)uVar2 + 0xb;
          uVar6 = extraout_ECX_07;
          uVar5 = extraout_EDX_04;
        }
        uVar6 = uVar6 & 0xffffff00;
      }
      uVar7 = (uint)bVar1;
      bVar13 = uVar9 < uVar7;
      uVar9 = uVar9 - uVar7;
      if (bVar13) {
        return 1;
      }
      for (; uVar7 != 0; uVar7 = uVar7 - 1) {
        *pbVar11 = (byte)uVar6;
        pbVar11 = pbVar11 + 1;
      }
    } while (uVar9 != 0);
LAB_00412e99:
    puVar10 = &DAT_004304a0 + DAT_00430f62;
    puVar12 = &DAT_004305e0;
    for (iVar4 = DAT_00430f4a; iVar4 != 0; iVar4 = iVar4 + -1) {
      *puVar12 = *puVar10;
      puVar10 = puVar10 + 1;
      puVar12 = puVar12 + 1;
    }
  }
  lVar14 = FUN_00412ef3(0,uVar5);
  lVar14 = FUN_00412ef3(extraout_ECX_08,(uint)((ulonglong)lVar14 >> 0x20));
  return (uint)lVar14;
}


// ==== FUN_00412ee9 @ 00412ee9 ====

undefined4 FUN_00412ee9(void)

{
  return 1;
}


// ==== FUN_00412ef3 @ 00412ef3 ====

longlong __fastcall FUN_00412ef3(undefined4 param_1,uint param_2)

{
  ushort uVar1;
  char cVar2;
  short sVar3;
  ushort uVar4;
  int in_EAX;
  uint uVar5;
  byte bVar9;
  int iVar6;
  int iVar7;
  int iVar8;
  ushort uVar10;
  ushort *puVar11;
  int unaff_EBP;
  byte *unaff_ESI;
  short *psVar12;
  byte *pbVar13;
  undefined4 *unaff_EDI;
  undefined4 *puVar14;
  ushort *puVar15;
  
  if (in_EAX == 0) {
    return (ulonglong)param_2 << 0x20;
  }
  puVar14 = &DAT_00430f28;
  DAT_00430f24 = in_EAX;
  DAT_00430f66 = unaff_EDI;
  for (iVar6 = 8; iVar7 = DAT_00430f24, pbVar13 = unaff_ESI, iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar14 = 0;
    puVar14 = puVar14 + 1;
  }
  do {
    psVar12 = (short *)((int)&DAT_00430f28 + (uint)*pbVar13 * 2);
    *psVar12 = *psVar12 + 1;
    iVar7 = iVar7 + -1;
    pbVar13 = pbVar13 + 1;
  } while (iVar7 != 0);
  sVar3 = 0;
  DAT_00430f02 = 0;
  iVar7 = 0xf;
  iVar6 = 2;
  do {
    iVar8 = iVar6;
    sVar3 = (sVar3 + *(short *)((int)&DAT_00430f28 + iVar8)) * 2;
    *(short *)((int)&DAT_00430f02 + iVar8) = sVar3;
    iVar7 = iVar7 + -1;
    iVar6 = iVar8 + 2;
  } while (iVar7 != 0);
  if (*(short *)((int)&DAT_00430f02 + iVar8) != 0) {
    iVar6 = 0xf;
    uVar10 = 0;
    psVar12 = (short *)((int)&DAT_00430f28 + 2);
    do {
      uVar10 = uVar10 + *psVar12;
      iVar6 = iVar6 + -1;
      psVar12 = psVar12 + 1;
    } while (iVar6 != 0);
    if (1 < uVar10) {
      return CONCAT44(param_2,1);
    }
  }
  iVar6 = DAT_00430f24;
  pbVar13 = unaff_ESI;
  psVar12 = &DAT_00430260;
  do {
    uVar5 = (uint)*pbVar13;
    sVar3 = 0;
    if (uVar5 != 0) {
      sVar3 = *(short *)(&DAT_00430f00 + uVar5 * 2);
      *(short *)(&DAT_00430f00 + uVar5 * 2) = sVar3 + 1;
    }
    *psVar12 = sVar3;
    iVar6 = iVar6 + -1;
    pbVar13 = pbVar13 + 1;
    psVar12 = psVar12 + 1;
  } while (iVar6 != 0);
  iVar6 = 0;
  iVar7 = DAT_00430f24;
  pbVar13 = unaff_ESI;
  puVar15 = &DAT_00430260;
  do {
    while( true ) {
      iVar8 = CONCAT31((int3)((uint)iVar6 >> 8),*pbVar13) + -1;
      if ((-1 < iVar8) && (iVar8 != 0)) break;
      puVar15 = puVar15 + 1;
      iVar6 = 0;
      iVar7 = iVar7 + -1;
      pbVar13 = pbVar13 + 1;
      if (iVar7 == 0) goto LAB_00412fcc;
    }
    uVar10 = *puVar15;
    uVar4 = 0;
    do {
      iVar6 = iVar8;
      uVar1 = uVar10 & 1;
      uVar10 = uVar10 >> 1;
      uVar4 = uVar4 << 1 | (ushort)(uVar1 != 0);
      iVar8 = iVar6 + -1;
    } while (iVar6 + -1 != 0 && uVar10 != 0);
    bVar9 = ((byte)iVar6 & 0x1f) % 0x11;
    *puVar15 = uVar4 << bVar9 | (ushort)(CONCAT12((uVar10 & 1) != 0,uVar4) >> 0x11 - bVar9);
    iVar7 = iVar7 + -1;
    pbVar13 = pbVar13 + 1;
    puVar15 = puVar15 + 1;
  } while (iVar7 != 0);
LAB_00412fcc:
  puVar14 = DAT_00430f66;
  for (iVar6 = 0x80; iVar7 = DAT_00430f24, iVar6 != 0; iVar6 = iVar6 + -1) {
    *puVar14 = 0;
    puVar14 = puVar14 + 1;
  }
  DAT_00430f24 = 0;
  iVar7 = iVar7 + -1;
  puVar15 = &DAT_00430260 + iVar7;
  iVar6 = 0;
  pbVar13 = unaff_ESI + iVar7;
  do {
    puVar14 = DAT_00430f66;
    bVar9 = *pbVar13;
    iVar8 = CONCAT31((int3)((uint)iVar6 >> 8),bVar9);
    if (bVar9 != 0) {
      if (bVar9 < 9) {
        iVar8 = 1 << (bVar9 + 1 & 0x1f);
        iVar6 = (uint)*puVar15 << 1;
        do {
          *(ushort *)(iVar6 + (int)puVar14) = (ushort)iVar7;
          iVar6 = iVar6 + iVar8;
        } while ((byte)((uint)iVar6 >> 8) < 2);
      }
      else {
        cVar2 = bVar9 - 8;
        uVar10 = *puVar15;
        iVar8 = CONCAT22((short)((uint)iVar6 >> 0x10),uVar10);
        puVar11 = (ushort *)((uVar10 & 0xff) * 2 + (int)DAT_00430f66);
        bVar9 = 1;
        do {
          uVar5 = DAT_00430f24;
          if (*puVar11 == 0) {
            *puVar11 = ~(ushort)(DAT_00430f24 >> 1);
            DAT_00430f24 = DAT_00430f24 + 4;
            *(undefined2 *)(unaff_EBP + uVar5) = 0;
            *(undefined2 *)(unaff_EBP + 2 + uVar5) = 0;
          }
          puVar11 = (ushort *)(~(int)(short)*puVar11 * 2 + unaff_EBP);
          if ((bVar9 & (byte)(uVar10 >> 8)) != 0) {
            puVar11 = puVar11 + 1;
          }
          bVar9 = bVar9 << 1;
          cVar2 = cVar2 + -1;
        } while (cVar2 != '\0');
        *puVar11 = (ushort)iVar7;
      }
    }
    puVar15 = puVar15 + -1;
    iVar7 = iVar7 + -1;
    iVar6 = iVar8;
    pbVar13 = pbVar13 + -1;
  } while (-1 < iVar7);
  return CONCAT44(param_2,iVar8);
}


// ==== FUN_0041307f @ 0041307f ====

char * __fastcall FUN_0041307f(int param_1,char *param_2)

{
  char cVar1;
  char *in_EAX;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  
  *(char *)(param_1 + 0x56) = *(char *)(param_1 + 0x56) + (char)param_2;
  iVar2 = -1;
  pcVar3 = in_EAX;
  do {
    pcVar4 = pcVar3;
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    pcVar4 = pcVar3 + 1;
    cVar1 = *pcVar3;
    pcVar3 = pcVar4;
  } while (cVar1 != '\0');
  pcVar4 = pcVar4 + -1;
  do {
    cVar1 = *param_2;
    *pcVar4 = cVar1;
    if (cVar1 == '\0') {
      return in_EAX;
    }
    cVar1 = param_2[1];
    param_2 = param_2 + 2;
    pcVar4[1] = cVar1;
    pcVar4 = pcVar4 + 2;
  } while (cVar1 != '\0');
  return in_EAX;
}


// ==== str_append @ 00413080 ====

char * __fastcall str_append(undefined4 param_1,char *param_2)

{
  char cVar1;
  char *in_EAX;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  
  iVar2 = -1;
  pcVar3 = in_EAX;
  do {
    pcVar4 = pcVar3;
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    pcVar4 = pcVar3 + 1;
    cVar1 = *pcVar3;
    pcVar3 = pcVar4;
  } while (cVar1 != '\0');
  pcVar4 = pcVar4 + -1;
  do {
    cVar1 = *param_2;
    *pcVar4 = cVar1;
    if (cVar1 == '\0') {
      return in_EAX;
    }
    cVar1 = param_2[1];
    param_2 = param_2 + 2;
    pcVar4[1] = cVar1;
    pcVar4 = pcVar4 + 2;
  } while (cVar1 != '\0');
  return in_EAX;
}


