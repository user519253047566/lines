
; ---- entry ----
00410000  6a0a                     PUSH 0xa
00410002  e848320000               CALL 0x0041324f
00410007  50                       PUSH EAX
00410008  6a00                     PUSH 0x0
0041000a  e846320000               CALL 0x00413255
0041000f  6a00                     PUSH 0x0
00410011  50                       PUSH EAX
00410012  e861010000               CALL 0x00410178
00410017  50                       PUSH EAX
00410018  e82c320000               CALL 0x00413249
0041001d  0d0a3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d0d0a28632920313939382d31393939204976616e20476f6c756265762020202020200d0a687474703a2f2f6d656d626572732e786f6f6d2e636f6d2f6d353367726f75700d0a3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d3d000000 ds "\r\n================================\r\n(c) 1998-1999 Ivan Golubev      \r\nhttp://members.xoom.com/m53group\r\n================================"

; ---- uint_to_decimal ----
004100a8  53                       PUSH EBX
004100a9  51                       PUSH ECX
004100aa  52                       PUSH EDX
004100ab  57                       PUSH EDI
004100ac  8bfa                     MOV EDI,EDX
004100ae  b30a                     MOV BL,0xa
004100b0  b900ca9a3b               MOV ECX,0x3b9aca00
004100b5  32ff                     XOR BH,BH
004100b7  33d2                     XOR EDX,EDX
004100b9  f7f1                     DIV ECX
004100bb  52                       PUSH EDX
004100bc  0ac0                     OR AL,AL
004100be  7509                     JNZ 0x004100c9
004100c0  80fb01                   CMP BL,0x1
004100c3  7404                     JZ 0x004100c9
004100c5  84ff                     TEST BH,BH
004100c7  7407                     JZ 0x004100d0
004100c9  0430                     ADD AL,0x30
004100cb  8807                     MOV byte ptr [EDI],AL
004100cd  47                       INC EDI
004100ce  b701                     MOV BH,0x1
004100d0  8bc1                     MOV EAX,ECX
004100d2  b90a000000               MOV ECX,0xa
004100d7  33d2                     XOR EDX,EDX
004100d9  f7f1                     DIV ECX
004100db  8bc8                     MOV ECX,EAX
004100dd  58                       POP EAX
004100de  fecb                     DEC BL
004100e0  75d5                     JNZ 0x004100b7
004100e2  881f                     MOV byte ptr [EDI],BL
004100e4  5f                       POP EDI
004100e5  5a                       POP EDX
004100e6  59                       POP ECX
004100e7  5b                       POP EBX
004100e8  c3                       RET

; ---- str_len ----
004100e9  51                       PUSH ECX
004100ea  57                       PUSH EDI
004100eb  8bf8                     MOV EDI,EAX
004100ed  b9ffffffff               MOV ECX,0xffffffff
004100f2  32c0                     XOR AL,AL
004100f4  f2ae                     SCASB.REPNE ES:EDI
004100f6  f7d1                     NOT ECX
004100f8  8d41ff                   LEA EAX,[ECX + -0x1]
004100fb  5f                       POP EDI
004100fc  59                       POP ECX
004100fd  c3                       RET
004100fe  50                       ?? 50h    P
004100ff  51                       ?? 51h    Q
00410100  52                       ?? 52h    R
00410101  56                       ?? 56h    V
00410102  57                       ?? 57h    W
00410103  8b                       ?? 8Bh
00410104  f0                       ?? F0h
00410105  8b                       ?? 8Bh
00410106  fa                       ?? FAh
00410107  b9                       ?? B9h
00410108  ff                       ?? FFh
00410109  ff                       ?? FFh
0041010a  ff                       ?? FFh
0041010b  ff                       ?? FFh
0041010c  32                       ?? 32h    2
0041010d  c0                       ?? C0h
0041010e  f2                       ?? F2h
0041010f  ae                       ?? AEh
00410110  4f                       ?? 4Fh    O
00410111  8b                       ?? 8Bh
00410112  d7                       ?? D7h
00410113  8b                       ?? 8Bh
00410114  fe                       ?? FEh
00410115  b9                       ?? B9h
00410116  ff                       ?? FFh
00410117  ff                       ?? FFh
00410118  ff                       ?? FFh
00410119  ff                       ?? FFh
0041011a  f2                       ?? F2h
0041011b  ae                       ?? AEh
0041011c  f7                       ?? F7h
0041011d  d1                       ?? D1h
0041011e  8b                       ?? 8Bh
0041011f  fa                       ?? FAh
00410120  f3                       ?? F3h
00410121  a4                       ?? A4h
00410122  5f                       ?? 5Fh    _
00410123  5e                       ?? 5Eh    ^
00410124  5a                       ?? 5Ah    Z
00410125  59                       ?? 59h    Y
00410126  58                       ?? 58h    X
00410127  c3                       ?? C3h

; ---- str_copy ----
00410128  50                       PUSH EAX
00410129  51                       PUSH ECX
0041012a  56                       PUSH ESI
0041012b  57                       PUSH EDI
0041012c  8bf8                     MOV EDI,EAX
0041012e  8bc2                     MOV EAX,EDX
00410130  e8b4ffffff               CALL 0x004100e9
00410135  8bc8                     MOV ECX,EAX
00410137  41                       INC ECX
00410138  8bf2                     MOV ESI,EDX
0041013a  f3a4                     MOVSB.REP ES:EDI,ESI
0041013c  5f                       POP EDI
0041013d  5e                       POP ESI
0041013e  59                       POP ECX
0041013f  58                       POP EAX
00410140  c3                       RET
00410141  00                       ?? 00h
00410142  00                       ?? 00h
00410143  00                       ?? 00h

; ---- rand_below ----
00410144  51                       PUSH ECX
00410145  52                       PUSH EDX
00410146  6915000043006d4ec641     IMUL EDX,dword ptr [0x00430000],0x41c64e6d
00410150  81c239300000             ADD EDX,0x3039
00410156  891500004300             MOV dword ptr [0x00430000],EDX
0041015c  8bc8                     MOV ECX,EAX
0041015e  8bc2                     MOV EAX,EDX
00410160  33d2                     XOR EDX,EDX
00410162  c1e810                   SHR EAX,0x10
00410165  25ff7f0000               AND EAX,0x7fff
0041016a  f7f1                     DIV ECX
0041016c  8bc2                     MOV EAX,EDX
0041016e  5a                       POP EDX
0041016f  59                       POP ECX
00410170  c3                       RET

; ---- srand ----
00410171  a300004300               MOV [0x00430000],EAX
00410176  c3                       RET
00410177  00                       ?? 00h

; ---- WinMain ----
00410178  53                       PUSH EBX
00410179  56                       PUSH ESI
0041017a  57                       PUSH EDI
0041017b  55                       PUSH EBP
0041017c  83ec44                   SUB ESP,0x44
0041017f  8b7c2458                 MOV EDI,dword ptr [ESP + 0x58]
00410183  893d28004300             MOV dword ptr [0x00430028],EDI
00410189  897c2410                 MOV dword ptr [ESP + 0x10],EDI
0041018d  c744242420004200         MOV dword ptr [ESP + 0x24],0x420020
00410195  c74424047e184100         MOV dword ptr [ESP + 0x4],0x41187e
0041019d  c7042423000000           MOV dword ptr [ESP],0x23
004101a4  68b80b0000               PUSH 0xbb8
004101a9  57                       PUSH EDI
004101aa  e894300000               CALL 0x00413243
004101af  89442414                 MOV dword ptr [ESP + 0x14],EAX
004101b3  68007f0000               PUSH 0x7f00
004101b8  6a00                     PUSH 0x0
004101ba  e87e300000               CALL 0x0041323d
004101bf  89442418                 MOV dword ptr [ESP + 0x18],EAX
004101c3  c74424204c040000         MOV dword ptr [ESP + 0x20],0x44c
004101cb  31ed                     XOR EBP,EBP
004101cd  896c2408                 MOV dword ptr [ESP + 0x8],EBP
004101d1  896c240c                 MOV dword ptr [ESP + 0xc],EBP
004101d5  6a04                     PUSH 0x4
004101d7  e85b300000               CALL 0x00413237
004101dc  8944241c                 MOV dword ptr [ESP + 0x1c],EAX
004101e0  89e0                     MOV EAX,ESP
004101e2  50                       PUSH EAX
004101e3  e849300000               CALL 0x00413231
004101e8  6685c0                   TEST AX,AX
004101eb  7507                     JNZ 0x004101f4
004101ed  31c0                     XOR EAX,EAX
004101ef  e9fb000000               JMP 0x004102ef
004101f4  c7053801430092000000     MOV dword ptr [0x00430138],0x92
004101fe  c7053c01430044000000     MOV dword ptr [0x0043013c],0x44
00410208  55                       PUSH EBP
00410209  e81d300000               CALL 0x0041322b
0041020e  a32c004300               MOV [0x0043002c],EAX
00410213  6a01                     PUSH 0x1
00410215  e811300000               CALL 0x0041322b
0041021a  a330004300               MOV [0x00430030],EAX
0041021f  55                       PUSH EBP
00410220  57                       PUSH EDI
00410221  55                       PUSH EBP
00410222  55                       PUSH EBP
00410223  68a4010000               PUSH 0x1a4
00410228  686c020000               PUSH 0x26c
0041022d  8d905cfeffff             LEA EDX,[EAX + 0xfffffe5c]
00410233  89d0                     MOV EAX,EDX
00410235  c1fa1f                   SAR EDX,0x1f
00410238  2bc2                     SUB EAX,EDX
0041023a  d1f8                     SAR EAX,0x1
0041023c  50                       PUSH EAX
0041023d  8b152c004300             MOV EDX,dword ptr [0x0043002c]
00410243  81ea6c020000             SUB EDX,0x26c
00410249  89d0                     MOV EAX,EDX
0041024b  c1fa1f                   SAR EDX,0x1f
0041024e  2bc2                     SUB EAX,EDX
00410250  d1f8                     SAR EAX,0x1
00410252  50                       PUSH EAX
00410253  680000cf00               PUSH 0xcf0000
00410258  6890004200               PUSH 0x420090
0041025d  6820004200               PUSH 0x420020
00410262  55                       PUSH EBP
00410263  e8bd2f0000               CALL 0x00413225
00410268  89c6                     MOV ESI,EAX
0041026a  89c3                     MOV EBX,EAX
0041026c  a33c024300               MOV [0x0043023c],EAX
00410271  684c040000               PUSH 0x44c
00410276  57                       PUSH EDI
00410277  e8a32f0000               CALL 0x0041321f
0041027c  a334004300               MOV [0x00430034],EAX
00410281  8b4c2464                 MOV ECX,dword ptr [ESP + 0x64]
00410285  51                       PUSH ECX
00410286  56                       PUSH ESI
00410287  e88d2f0000               CALL 0x00413219
0041028c  56                       PUSH ESI
0041028d  e8812f0000               CALL 0x00413213
00410292  6a00                     PUSH 0x0
00410294  6a00                     PUSH 0x0
00410296  6a00                     PUSH 0x0
00410298  8d442434                 LEA EAX,[ESP + 0x34]
0041029c  50                       PUSH EAX
0041029d  e86b2f0000               CALL 0x0041320d
004102a2  85c0                     TEST EAX,EAX
004102a4  7445                     JZ 0x004102eb
004102a6  8b3534024300             MOV ESI,dword ptr [0x00430234]
004102ac  85f6                     TEST ESI,ESI
004102ae  740f                     JZ 0x004102bf
004102b0  8d442428                 LEA EAX,[ESP + 0x28]
004102b4  50                       PUSH EAX
004102b5  56                       PUSH ESI
004102b6  e84c2f0000               CALL 0x00413207
004102bb  85c0                     TEST EAX,EAX
004102bd  75d3                     JNZ 0x00410292
004102bf  8d442428                 LEA EAX,[ESP + 0x28]
004102c3  50                       PUSH EAX
004102c4  8b2d34004300             MOV EBP,dword ptr [0x00430034]
004102ca  55                       PUSH EBP
004102cb  53                       PUSH EBX
004102cc  e8302f0000               CALL 0x00413201
004102d1  85c0                     TEST EAX,EAX
004102d3  75bd                     JNZ 0x00410292
004102d5  8d442428                 LEA EAX,[ESP + 0x28]
004102d9  50                       PUSH EAX
004102da  e81c2f0000               CALL 0x004131fb
004102df  8d442428                 LEA EAX,[ESP + 0x28]
004102e3  50                       PUSH EAX
004102e4  e80c2f0000               CALL 0x004131f5
004102e9  eba7                     JMP 0x00410292
004102eb  8b442430                 MOV EAX,dword ptr [ESP + 0x30]
004102ef  83c444                   ADD ESP,0x44
004102f2  5d                       POP EBP
004102f3  5f                       POP EDI
004102f4  5e                       POP ESI
004102f5  5b                       POP EBX
004102f6  c21000                   RET 0x10

; ---- draw_board ----
004102f9  53                       PUSH EBX
004102fa  51                       PUSH ECX
004102fb  52                       PUSH EDX
004102fc  56                       PUSH ESI
004102fd  57                       PUSH EDI
004102fe  55                       PUSH EBP
004102ff  89c7                     MOV EDI,EAX
00410301  6855555500               PUSH 0x555555
00410306  6a01                     PUSH 0x1
00410308  6a00                     PUSH 0x0
0041030a  e8e02e0000               CALL 0x004131ef
0041030f  89c3                     MOV EBX,EAX
00410311  50                       PUSH EAX
00410312  57                       PUSH EDI
00410313  e8d12e0000               CALL 0x004131e9
00410318  89c6                     MOV ESI,EAX
0041031a  6a00                     PUSH 0x0
0041031c  a13c014300               MOV EAX,[0x0043013c]
00410321  0547010000               ADD EAX,0x147
00410326  50                       PUSH EAX
00410327  8b1538014300             MOV EDX,dword ptr [0x00430138]
0041032d  52                       PUSH EDX
0041032e  57                       PUSH EDI
0041032f  e8af2e0000               CALL 0x004131e3
00410334  a13c014300               MOV EAX,[0x0043013c]
00410339  0547010000               ADD EAX,0x147
0041033e  50                       PUSH EAX
0041033f  a138014300               MOV EAX,[0x00430138]
00410344  0547010000               ADD EAX,0x147
00410349  50                       PUSH EAX
0041034a  57                       PUSH EDI
0041034b  e88d2e0000               CALL 0x004131dd
00410350  8b0d3c014300             MOV ECX,dword ptr [0x0043013c]
00410356  51                       PUSH ECX
00410357  a138014300               MOV EAX,[0x00430138]
0041035c  0547010000               ADD EAX,0x147
00410361  50                       PUSH EAX
00410362  57                       PUSH EDI
00410363  e8752e0000               CALL 0x004131dd
00410368  6a06                     PUSH 0x6
0041036a  e8c82e0000               CALL 0x00413237
0041036f  50                       PUSH EAX
00410370  57                       PUSH EDI
00410371  e8732e0000               CALL 0x004131e9
00410376  8b2d3c014300             MOV EBP,dword ptr [0x0043013c]
0041037c  55                       PUSH EBP
0041037d  a138014300               MOV EAX,[0x00430138]
00410382  50                       PUSH EAX
00410383  57                       PUSH EDI
00410384  e8542e0000               CALL 0x004131dd
00410389  a13c014300               MOV EAX,[0x0043013c]
0041038e  0548010000               ADD EAX,0x148
00410393  50                       PUSH EAX
00410394  8b1538014300             MOV EDX,dword ptr [0x00430138]
0041039a  52                       PUSH EDX
0041039b  57                       PUSH EDI
0041039c  e83c2e0000               CALL 0x004131dd
004103a1  56                       PUSH ESI
004103a2  57                       PUSH EDI
004103a3  e8412e0000               CALL 0x004131e9
004103a8  53                       PUSH EBX
004103a9  e8292e0000               CALL 0x004131d7
004103ae  31f6                     XOR ESI,ESI
004103b0  eb6b                     JMP 0x0041041d
004103b2  682000cc00               PUSH 0xcc0020
004103b7  68e1000000               PUSH 0xe1
004103bc  89f2                     MOV EDX,ESI
004103be  89f0                     MOV EAX,ESI
004103c0  c1e003                   SHL EAX,0x3
004103c3  01f0                     ADD EAX,ESI
004103c5  31f2                     XOR EDX,ESI
004103c7  8a940340004300           MOV DL,byte ptr [EBX + EAX*0x1 + 0x430040]
004103ce  89d0                     MOV EAX,EDX
004103d0  c1e003                   SHL EAX,0x3
004103d3  01d0                     ADD EAX,EDX
004103d5  c1e002                   SHL EAX,0x2
004103d8  50                       PUSH EAX
004103d9  8b0d30024300             MOV ECX,dword ptr [0x00430230]
004103df  51                       PUSH ECX
004103e0  6a24                     PUSH 0x24
004103e2  6a24                     PUSH 0x24
004103e4  8b0d3c014300             MOV ECX,dword ptr [0x0043013c]
004103ea  83c102                   ADD ECX,0x2
004103ed  89f0                     MOV EAX,ESI
004103ef  c1e003                   SHL EAX,0x3
004103f2  01f0                     ADD EAX,ESI
004103f4  c1e002                   SHL EAX,0x2
004103f7  01c8                     ADD EAX,ECX
004103f9  50                       PUSH EAX
004103fa  8b0d38014300             MOV ECX,dword ptr [0x00430138]
00410400  83c102                   ADD ECX,0x2
00410403  89d8                     MOV EAX,EBX
00410405  c1e003                   SHL EAX,0x3
00410408  01d8                     ADD EAX,EBX
0041040a  c1e002                   SHL EAX,0x2
0041040d  01c8                     ADD EAX,ECX
0041040f  50                       PUSH EAX
00410410  57                       PUSH EDI
00410411  e8bb2d0000               CALL 0x004131d1
00410416  43                       INC EBX
00410417  83fb09                   CMP EBX,0x9
0041041a  7c96                     JL 0x004103b2
0041041c  46                       INC ESI
0041041d  83fe09                   CMP ESI,0x9
00410420  7d04                     JGE 0x00410426
00410422  31db                     XOR EBX,EBX
00410424  ebf1                     JMP 0x00410417

; ---- noop ----
00410426  5d                       POP EBP
00410427  5f                       POP EDI
00410428  5e                       POP ESI
00410429  5a                       POP EDX
0041042a  59                       POP ECX
0041042b  5b                       POP EBX
0041042c  c3                       RET

; ---- draw_cell_frame ----
0041042d  56                       PUSH ESI
0041042e  89c6                     MOV ESI,EAX
00410430  682000cc00               PUSH 0xcc0020
00410435  89c8                     MOV EAX,ECX
00410437  c1e003                   SHL EAX,0x3
0041043a  01c8                     ADD EAX,ECX
0041043c  c1e002                   SHL EAX,0x2
0041043f  05e1000000               ADD EAX,0xe1
00410444  50                       PUSH EAX
00410445  89d9                     MOV ECX,EBX
00410447  89d8                     MOV EAX,EBX
00410449  c1e003                   SHL EAX,0x3
0041044c  01d8                     ADD EAX,EBX
0041044e  8a840240004300           MOV AL,byte ptr [EDX + EAX*0x1 + 0x430040]
00410455  243f                     AND AL,0x3f
00410457  31d9                     XOR ECX,EBX
00410459  88c1                     MOV CL,AL
0041045b  89c8                     MOV EAX,ECX
0041045d  c1e003                   SHL EAX,0x3
00410460  01c8                     ADD EAX,ECX
00410462  c1e002                   SHL EAX,0x2
00410465  50                       PUSH EAX
00410466  8b0d30024300             MOV ECX,dword ptr [0x00430230]
0041046c  51                       PUSH ECX
0041046d  6a24                     PUSH 0x24
0041046f  6a24                     PUSH 0x24
00410471  8b0d3c014300             MOV ECX,dword ptr [0x0043013c]
00410477  83c102                   ADD ECX,0x2
0041047a  89d8                     MOV EAX,EBX
0041047c  c1e003                   SHL EAX,0x3
0041047f  01d8                     ADD EAX,EBX
00410481  c1e002                   SHL EAX,0x2
00410484  01c8                     ADD EAX,ECX
00410486  50                       PUSH EAX
00410487  8b1d38014300             MOV EBX,dword ptr [0x00430138]
0041048d  83c302                   ADD EBX,0x2
00410490  89d0                     MOV EAX,EDX
00410492  c1e003                   SHL EAX,0x3
00410495  01d0                     ADD EAX,EDX
00410497  c1e002                   SHL EAX,0x2
0041049a  01d8                     ADD EAX,EBX
0041049c  50                       PUSH EAX
0041049d  56                       PUSH ESI
0041049e  e82e2d0000               CALL 0x004131d1
004104a3  5e                       POP ESI
004104a4  c3                       RET

; ---- init_next_queue ----
004104a5  52                       PUSH EDX
004104a6  31d2                     XOR EDX,EDX
004104a8  eb13                     JMP 0x004104bd
004104aa  b807000000               MOV EAX,0x7
004104af  e890fcffff               CALL 0x00410144
004104b4  fec0                     INC AL
004104b6  888250014300             MOV byte ptr [EDX + 0x430150],AL
004104bc  42                       INC EDX
004104bd  83fa03                   CMP EDX,0x3
004104c0  7ce8                     JL 0x004104aa
004104c2  5a                       POP EDX
004104c3  c3                       RET

; ---- find_path ----
004104c4  56                       PUSH ESI
004104c5  57                       PUSH EDI
004104c6  83ec14                   SUB ESP,0x14
004104c9  880424                   MOV byte ptr [ESP],AL
004104cc  8854240c                 MOV byte ptr [ESP + 0xc],DL
004104d0  885c2404                 MOV byte ptr [ESP + 0x4],BL
004104d4  884c2408                 MOV byte ptr [ESP + 0x8],CL
004104d8  b108                     MOV CL,0x8
004104da  31d2                     XOR EDX,EDX
004104dc  8a54240c                 MOV DL,byte ptr [ESP + 0xc]
004104e0  89d0                     MOV EAX,EDX
004104e2  c1e003                   SHL EAX,0x3
004104e5  01c2                     ADD EDX,EAX
004104e7  31c0                     XOR EAX,EAX
004104e9  8a0424                   MOV AL,byte ptr [ESP]
004104ec  01d0                     ADD EAX,EDX
004104ee  8a9040004300             MOV DL,byte ptr [EAX + 0x430040]
004104f4  88542410                 MOV byte ptr [ESP + 0x10],DL
004104f8  888840004300             MOV byte ptr [EAX + 0x430040],CL
004104fe  31d2                     XOR EDX,EDX
00410500  eb01                     JMP 0x00410503
00410502  42                       INC EDX
00410503  83fa09                   CMP EDX,0x9
00410506  0f8dbe000000             JGE 0x004105ca
0041050c  31c0                     XOR EAX,EAX
0041050e  eb01                     JMP 0x00410511
00410510  40                       INC EAX
00410511  83f809                   CMP EAX,0x9
00410514  7dec                     JGE 0x00410502
00410516  89d3                     MOV EBX,EDX
00410518  c1e303                   SHL EBX,0x3
0041051b  01d3                     ADD EBX,EDX
0041051d  0fb6b40340004300         MOVZX ESI,byte ptr [EBX + EAX*0x1 + 0x430040]
00410525  31db                     XOR EBX,EBX
00410527  88cb                     MOV BL,CL
00410529  39de                     CMP ESI,EBX
0041052b  75e3                     JNZ 0x00410510
0041052d  85d2                     TEST EDX,EDX
0041052f  7421                     JZ 0x00410552
00410531  8d72ff                   LEA ESI,[EDX + -0x1]
00410534  89f3                     MOV EBX,ESI
00410536  c1e303                   SHL EBX,0x3
00410539  01f3                     ADD EBX,ESI
0041053b  01c3                     ADD EBX,EAX
0041053d  0fb6b340004300           MOVZX ESI,byte ptr [EBX + 0x430040]
00410544  85f6                     TEST ESI,ESI
00410546  750a                     JNZ 0x00410552
00410548  88cd                     MOV CH,CL
0041054a  fec5                     INC CH
0041054c  88ab40004300             MOV byte ptr [EBX + 0x430040],CH
00410552  85c0                     TEST EAX,EAX
00410554  741e                     JZ 0x00410574
00410556  89d3                     MOV EBX,EDX
00410558  c1e303                   SHL EBX,0x3
0041055b  01d3                     ADD EBX,EDX
0041055d  01c3                     ADD EBX,EAX
0041055f  0fb6b33f004300           MOVZX ESI,byte ptr [EBX + 0x43003f]
00410566  85f6                     TEST ESI,ESI
00410568  750a                     JNZ 0x00410574
0041056a  88cd                     MOV CH,CL
0041056c  fec5                     INC CH
0041056e  88ab3f004300             MOV byte ptr [EBX + 0x43003f],CH
00410574  83fa08                   CMP EDX,0x8
00410577  7421                     JZ 0x0041059a
00410579  8d7201                   LEA ESI,[EDX + 0x1]
0041057c  89f3                     MOV EBX,ESI
0041057e  c1e303                   SHL EBX,0x3
00410581  01f3                     ADD EBX,ESI
00410583  01c3                     ADD EBX,EAX
00410585  0fb6b340004300           MOVZX ESI,byte ptr [EBX + 0x430040]
0041058c  85f6                     TEST ESI,ESI
0041058e  750a                     JNZ 0x0041059a
00410590  88cd                     MOV CH,CL
00410592  fec5                     INC CH
00410594  88ab40004300             MOV byte ptr [EBX + 0x430040],CH
0041059a  83f808                   CMP EAX,0x8
0041059d  0f846dffffff             JZ 0x00410510
004105a3  89d3                     MOV EBX,EDX
004105a5  c1e303                   SHL EBX,0x3
004105a8  01d3                     ADD EBX,EDX
004105aa  01c3                     ADD EBX,EAX
004105ac  0fb6b341004300           MOVZX ESI,byte ptr [EBX + 0x430041]
004105b3  85f6                     TEST ESI,ESI
004105b5  0f8555ffffff             JNZ 0x00410510
004105bb  88cd                     MOV CH,CL
004105bd  fec5                     INC CH
004105bf  88ab41004300             MOV byte ptr [EBX + 0x430041],CH
004105c5  e946ffffff               JMP 0x00410510
004105ca  31d2                     XOR EDX,EDX
004105cc  8a542408                 MOV DL,byte ptr [ESP + 0x8]
004105d0  89d0                     MOV EAX,EDX
004105d2  c1e003                   SHL EAX,0x3
004105d5  01c2                     ADD EDX,EAX
004105d7  31c0                     XOR EAX,EAX
004105d9  8a442404                 MOV AL,byte ptr [ESP + 0x4]
004105dd  fec1                     INC CL
004105df  01d0                     ADD EAX,EDX
004105e1  31d2                     XOR EDX,EDX
004105e3  8a9040004300             MOV DL,byte ptr [EAX + 0x430040]
004105e9  31c0                     XOR EAX,EAX
004105eb  88c8                     MOV AL,CL
004105ed  39c2                     CMP EDX,EAX
004105ef  7409                     JZ 0x004105fa
004105f1  83f85a                   CMP EAX,0x5a
004105f4  0f8c04ffffff             JL 0x004104fe
004105fa  31c0                     XOR EAX,EAX
004105fc  88c8                     MOV AL,CL
004105fe  83f85a                   CMP EAX,0x5a
00410601  7558                     JNZ 0x0041065b
00410603  31d2                     XOR EDX,EDX
00410605  eb01                     JMP 0x00410608
00410607  42                       INC EDX
00410608  83fa09                   CMP EDX,0x9
0041060b  7d29                     JGE 0x00410636
0041060d  31c0                     XOR EAX,EAX
0041060f  eb01                     JMP 0x00410612
00410611  40                       INC EAX
00410612  83f809                   CMP EAX,0x9
00410615  7df0                     JGE 0x00410607
00410617  89d3                     MOV EBX,EDX
00410619  c1e303                   SHL EBX,0x3
0041061c  01d3                     ADD EBX,EDX
0041061e  01c3                     ADD EBX,EAX
00410620  0fb6b340004300           MOVZX ESI,byte ptr [EBX + 0x430040]
00410627  83fe07                   CMP ESI,0x7
0041062a  7ee5                     JLE 0x00410611
0041062c  30ed                     XOR CH,CH
0041062e  88ab40004300             MOV byte ptr [EBX + 0x430040],CH
00410634  ebdb                     JMP 0x00410611
00410636  31d2                     XOR EDX,EDX
00410638  8a54240c                 MOV DL,byte ptr [ESP + 0xc]
0041063c  89d0                     MOV EAX,EDX
0041063e  c1e003                   SHL EAX,0x3
00410641  01d0                     ADD EAX,EDX
00410643  31d2                     XOR EDX,EDX
00410645  8a1424                   MOV DL,byte ptr [ESP]
00410648  01d0                     ADD EAX,EDX
0041064a  8a542410                 MOV DL,byte ptr [ESP + 0x10]
0041064e  889040004300             MOV byte ptr [EAX + 0x430040],DL
00410654  31c0                     XOR EAX,EAX
00410656  e940010000               JMP 0x0041079b
0041065b  8a442404                 MOV AL,byte ptr [ESP + 0x4]
0041065f  8a642408                 MOV AH,byte ptr [ESP + 0x8]
00410663  88ca                     MOV DL,CL
00410665  80ea07                   SUB DL,0x7
00410668  881536014300             MOV byte ptr [0x00430136],DL
0041066e  31d2                     XOR EDX,EDX
00410670  e97e000000               JMP 0x004106f3
00410675  0fb6f8                   MOVZX EDI,AL
00410678  85ff                     TEST EDI,EDI
0041067a  7423                     JZ 0x0041069f
0041067c  0fb6f4                   MOVZX ESI,AH
0041067f  89f3                     MOV EBX,ESI
00410681  c1e303                   SHL EBX,0x3
00410684  01f3                     ADD EBX,ESI
00410686  8a9c1f3f004300           MOV BL,byte ptr [EDI + EBX*0x1 + 0x43003f]
0041068d  81e3ff000000             AND EBX,0xff
00410693  0fb6f1                   MOVZX ESI,CL
00410696  4e                       DEC ESI
00410697  39f3                     CMP EBX,ESI
00410699  7504                     JNZ 0x0041069f
0041069b  fec8                     DEC AL
0041069d  eb51                     JMP 0x004106f0
0041069f  31db                     XOR EBX,EBX
004106a1  88e3                     MOV BL,AH
004106a3  83fb08                   CMP EBX,0x8
004106a6  7423                     JZ 0x004106cb
004106a8  8d7301                   LEA ESI,[EBX + 0x1]
004106ab  89f3                     MOV EBX,ESI
004106ad  c1e303                   SHL EBX,0x3
004106b0  01de                     ADD ESI,EBX
004106b2  31db                     XOR EBX,EBX
004106b4  88c3                     MOV BL,AL
004106b6  0fb6b41e40004300         MOVZX ESI,byte ptr [ESI + EBX*0x1 + 0x430040]
004106be  31db                     XOR EBX,EBX
004106c0  88cb                     MOV BL,CL
004106c2  4b                       DEC EBX
004106c3  39de                     CMP ESI,EBX
004106c5  7504                     JNZ 0x004106cb
004106c7  fec4                     INC AH
004106c9  eb25                     JMP 0x004106f0
004106cb  0fb6f8                   MOVZX EDI,AL
004106ce  83ff08                   CMP EDI,0x8
004106d1  741d                     JZ 0x004106f0
004106d3  0fb6f4                   MOVZX ESI,AH
004106d6  89f3                     MOV EBX,ESI
004106d8  c1e303                   SHL EBX,0x3
004106db  01f3                     ADD EBX,ESI
004106dd  0fb6b41f41004300         MOVZX ESI,byte ptr [EDI + EBX*0x1 + 0x430041]
004106e5  31db                     XOR EBX,EBX
004106e7  88cb                     MOV BL,CL
004106e9  4b                       DEC EBX
004106ea  39de                     CMP ESI,EBX
004106ec  7502                     JNZ 0x004106f0
004106ee  fec0                     INC AL
004106f0  fec9                     DEC CL
004106f2  42                       INC EDX
004106f3  31db                     XOR EBX,EBX
004106f5  8a1d36014300             MOV BL,byte ptr [0x00430136]
004106fb  39da                     CMP EDX,EBX
004106fd  7d46                     JGE 0x00410745
004106ff  29d3                     SUB EBX,EDX
00410701  88245d92004300           MOV byte ptr [EBX*0x2 + 0x430092],AH
00410708  88045d93004300           MOV byte ptr [EBX*0x2 + 0x430093],AL
0041070f  31db                     XOR EBX,EBX
00410711  88e3                     MOV BL,AH
00410713  85db                     TEST EBX,EBX
00410715  0f845affffff             JZ 0x00410675
0041071b  8d73ff                   LEA ESI,[EBX + -0x1]
0041071e  89f3                     MOV EBX,ESI
00410720  c1e303                   SHL EBX,0x3
00410723  01f3                     ADD EBX,ESI
00410725  0fb6f0                   MOVZX ESI,AL
00410728  8a9c1e40004300           MOV BL,byte ptr [ESI + EBX*0x1 + 0x430040]
0041072f  81e3ff000000             AND EBX,0xff
00410735  0fb6f1                   MOVZX ESI,CL
00410738  4e                       DEC ESI
00410739  39f3                     CMP EBX,ESI
0041073b  0f8534ffffff             JNZ 0x00410675
00410741  fecc                     DEC AH
00410743  ebab                     JMP 0x004106f0
00410745  31d2                     XOR EDX,EDX
00410747  eb01                     JMP 0x0041074a
00410749  42                       INC EDX
0041074a  83fa09                   CMP EDX,0x9
0041074d  7d29                     JGE 0x00410778
0041074f  31c0                     XOR EAX,EAX
00410751  eb01                     JMP 0x00410754
00410753  40                       INC EAX
00410754  83f809                   CMP EAX,0x9
00410757  7df0                     JGE 0x00410749
00410759  89d3                     MOV EBX,EDX
0041075b  c1e303                   SHL EBX,0x3
0041075e  01d3                     ADD EBX,EDX
00410760  01c3                     ADD EBX,EAX
00410762  0fb6b340004300           MOVZX ESI,byte ptr [EBX + 0x430040]
00410769  83fe07                   CMP ESI,0x7
0041076c  7ee5                     JLE 0x00410753
0041076e  30c9                     XOR CL,CL
00410770  888b40004300             MOV byte ptr [EBX + 0x430040],CL
00410776  ebdb                     JMP 0x00410753
00410778  31d2                     XOR EDX,EDX
0041077a  8a54240c                 MOV DL,byte ptr [ESP + 0xc]
0041077e  89d0                     MOV EAX,EDX
00410780  c1e003                   SHL EAX,0x3
00410783  01c2                     ADD EDX,EAX
00410785  31c0                     XOR EAX,EAX
00410787  8a0424                   MOV AL,byte ptr [ESP]
0041078a  01d0                     ADD EAX,EDX
0041078c  8a542410                 MOV DL,byte ptr [ESP + 0x10]
00410790  889040004300             MOV byte ptr [EAX + 0x430040],DL
00410796  b801000000               MOV EAX,0x1
0041079b  83c414                   ADD ESP,0x14
0041079e  5f                       POP EDI
0041079f  5e                       POP ESI
004107a0  c3                       RET

; ---- pixel_to_cell ----
004107a1  56                       PUSH ESI
004107a2  57                       PUSH EDI
004107a3  89d6                     MOV ESI,EDX
004107a5  8b1538014300             MOV EDX,dword ptr [0x00430138]
004107ab  29d0                     SUB EAX,EDX
004107ad  89c2                     MOV EDX,EAX
004107af  bf24000000               MOV EDI,0x24
004107b4  c1fa1f                   SAR EDX,0x1f
004107b7  f7ff                     IDIV EDI
004107b9  8903                     MOV dword ptr [EBX],EAX
004107bb  85c0                     TEST EAX,EAX
004107bd  7c05                     JL 0x004107c4
004107bf  83f808                   CMP EAX,0x8
004107c2  7e05                     JLE 0x004107c9
004107c4  31c0                     XOR EAX,EAX
004107c6  5f                       POP EDI
004107c7  5e                       POP ESI
004107c8  c3                       RET
004107c9  a13c014300               MOV EAX,[0x0043013c]
004107ce  89f2                     MOV EDX,ESI
004107d0  29c2                     SUB EDX,EAX
004107d2  89d0                     MOV EAX,EDX
004107d4  c1fa1f                   SAR EDX,0x1f
004107d7  f7ff                     IDIV EDI
004107d9  8901                     MOV dword ptr [ECX],EAX
004107db  85c0                     TEST EAX,EAX
004107dd  7ce5                     JL 0x004107c4
004107df  83f808                   CMP EAX,0x8
004107e2  7fe0                     JG 0x004107c4
004107e4  b801000000               MOV EAX,0x1
004107e9  5f                       POP EDI
004107ea  5e                       POP ESI
004107eb  c3                       RET

; ---- mark_lines_at ----
004107ec  51                       PUSH ECX
004107ed  56                       PUSH ESI
004107ee  57                       PUSH EDI
004107ef  55                       PUSH EBP
004107f0  83ec08                   SUB ESP,0x8
004107f3  50                       PUSH EAX
004107f4  52                       PUSH EDX
004107f5  885c240c                 MOV byte ptr [ESP + 0xc],BL
004107f9  31d2                     XOR EDX,EDX
004107fb  89542408                 MOV dword ptr [ESP + 0x8],EDX
004107ff  31ff                     XOR EDI,EDI
00410801  e92a010000               JMP 0x00410930
00410806  45                       INC EBP
00410807  808e4000430040           OR byte ptr [ESI + 0x430040],0x40
0041080e  43                       INC EBX
0041080f  83fb08                   CMP EBX,0x8
00410812  7d35                     JGE 0x00410849
00410814  0314fd00004200           ADD EDX,dword ptr [EDI*0x8 + 0x420000]
0041081b  0304fd04004200           ADD EAX,dword ptr [EDI*0x8 + 0x420004]
00410822  85d2                     TEST EDX,EDX
00410824  7c23                     JL 0x00410849
00410826  83fa08                   CMP EDX,0x8
00410829  7f1e                     JG 0x00410849
0041082b  85c0                     TEST EAX,EAX
0041082d  7c1a                     JL 0x00410849
0041082f  83f808                   CMP EAX,0x8
00410832  7f15                     JG 0x00410849
00410834  89c6                     MOV ESI,EAX
00410836  c1e603                   SHL ESI,0x3
00410839  01c6                     ADD ESI,EAX
0041083b  01d6                     ADD ESI,EDX
0041083d  8a8e40004300             MOV CL,byte ptr [ESI + 0x430040]
00410843  3a4c240c                 CMP CL,byte ptr [ESP + 0xc]
00410847  74bd                     JZ 0x00410806
00410849  8b542404                 MOV EDX,dword ptr [ESP + 0x4]
0041084d  8b0424                   MOV EAX,dword ptr [ESP]
00410850  bb01000000               MOV EBX,0x1
00410855  eb09                     JMP 0x00410860
00410857  45                       INC EBP
00410858  808e4000430040           OR byte ptr [ESI + 0x430040],0x40
0041085f  43                       INC EBX
00410860  83fb08                   CMP EBX,0x8
00410863  7d35                     JGE 0x0041089a
00410865  2b14fd00004200           SUB EDX,dword ptr [EDI*0x8 + 0x420000]
0041086c  2b04fd04004200           SUB EAX,dword ptr [EDI*0x8 + 0x420004]
00410873  85d2                     TEST EDX,EDX
00410875  7c23                     JL 0x0041089a
00410877  83fa08                   CMP EDX,0x8
0041087a  7f1e                     JG 0x0041089a
0041087c  85c0                     TEST EAX,EAX
0041087e  7c1a                     JL 0x0041089a
00410880  83f808                   CMP EAX,0x8
00410883  7f15                     JG 0x0041089a
00410885  89c6                     MOV ESI,EAX
00410887  c1e603                   SHL ESI,0x3
0041088a  01c6                     ADD ESI,EAX
0041088c  01d6                     ADD ESI,EDX
0041088e  8a8e40004300             MOV CL,byte ptr [ESI + 0x430040]
00410894  3a4c240c                 CMP CL,byte ptr [ESP + 0xc]
00410898  74bd                     JZ 0x00410857
0041089a  83fd05                   CMP EBP,0x5
0041089d  0f8d88000000             JGE 0x0041092b
004108a3  8b542404                 MOV EDX,dword ptr [ESP + 0x4]
004108a7  8b0424                   MOV EAX,dword ptr [ESP]
004108aa  bb01000000               MOV EBX,0x1
004108af  eb10                     JMP 0x004108c1
004108b1  89c6                     MOV ESI,EAX
004108b3  c1e603                   SHL ESI,0x3
004108b6  01c6                     ADD ESI,EAX
004108b8  80a432400043003f         AND byte ptr [EDX + ESI*0x1 + 0x430040],0x3f
004108c0  43                       INC EBX
004108c1  83fb08                   CMP EBX,0x8
004108c4  7d20                     JGE 0x004108e6
004108c6  0314fd00004200           ADD EDX,dword ptr [EDI*0x8 + 0x420000]
004108cd  0304fd04004200           ADD EAX,dword ptr [EDI*0x8 + 0x420004]
004108d4  85d2                     TEST EDX,EDX
004108d6  7c0e                     JL 0x004108e6
004108d8  83fa08                   CMP EDX,0x8
004108db  7f09                     JG 0x004108e6
004108dd  85c0                     TEST EAX,EAX
004108df  7c05                     JL 0x004108e6
004108e1  83f808                   CMP EAX,0x8
004108e4  7ecb                     JLE 0x004108b1
004108e6  8b542404                 MOV EDX,dword ptr [ESP + 0x4]
004108ea  8b0424                   MOV EAX,dword ptr [ESP]
004108ed  bb01000000               MOV EBX,0x1
004108f2  eb10                     JMP 0x00410904
004108f4  89c6                     MOV ESI,EAX
004108f6  c1e603                   SHL ESI,0x3
004108f9  01c6                     ADD ESI,EAX
004108fb  80a432400043003f         AND byte ptr [EDX + ESI*0x1 + 0x430040],0x3f
00410903  43                       INC EBX
00410904  83fb08                   CMP EBX,0x8
00410907  7d26                     JGE 0x0041092f
00410909  2b14fd00004200           SUB EDX,dword ptr [EDI*0x8 + 0x420000]
00410910  2b04fd04004200           SUB EAX,dword ptr [EDI*0x8 + 0x420004]
00410917  85d2                     TEST EDX,EDX
00410919  7c14                     JL 0x0041092f
0041091b  83fa08                   CMP EDX,0x8
0041091e  7f0f                     JG 0x0041092f
00410920  85c0                     TEST EAX,EAX
00410922  7c0b                     JL 0x0041092f
00410924  83f808                   CMP EAX,0x8
00410927  7ecb                     JLE 0x004108f4
00410929  eb04                     JMP 0x0041092f
0041092b  016c2408                 ADD dword ptr [ESP + 0x8],EBP
0041092f  47                       INC EDI
00410930  83ff04                   CMP EDI,0x4
00410933  7d13                     JGE 0x00410948
00410935  bd01000000               MOV EBP,0x1
0041093a  8b542404                 MOV EDX,dword ptr [ESP + 0x4]
0041093e  8b0424                   MOV EAX,dword ptr [ESP]
00410941  89eb                     MOV EBX,EBP
00410943  e9c7feffff               JMP 0x0041080f
00410948  837c240800               CMP dword ptr [ESP + 0x8],0x0
0041094d  741b                     JZ 0x0041096a
0041094f  8a5c240c                 MOV BL,byte ptr [ESP + 0xc]
00410953  80cb40                   OR BL,0x40
00410956  8b1424                   MOV EDX,dword ptr [ESP]
00410959  89d0                     MOV EAX,EDX
0041095b  c1e003                   SHL EAX,0x3
0041095e  01d0                     ADD EAX,EDX
00410960  03442404                 ADD EAX,dword ptr [ESP + 0x4]
00410964  889840004300             MOV byte ptr [EAX + 0x430040],BL
0041096a  8b442408                 MOV EAX,dword ptr [ESP + 0x8]
0041096e  83c410                   ADD ESP,0x10
00410971  5d                       POP EBP
00410972  5f                       POP EDI
00410973  5e                       POP ESI
00410974  59                       POP ECX
00410975  c3                       RET

; ---- remove_marked_cells ----
00410976  53                       PUSH EBX
00410977  51                       PUSH ECX
00410978  52                       PUSH EDX
00410979  56                       PUSH ESI
0041097a  57                       PUSH EDI
0041097b  55                       PUSH EBP
0041097c  83ec0c                   SUB ESP,0xc
0041097f  50                       PUSH EAX
00410980  bd08000000               MOV EBP,0x8
00410985  31d2                     XOR EDX,EDX
00410987  89542408                 MOV dword ptr [ESP + 0x8],EDX
0041098b  89542404                 MOV dword ptr [ESP + 0x4],EDX
0041098f  e96e000000               JMP 0x00410a02
00410994  47                       INC EDI
00410995  83ff09                   CMP EDI,0x9
00410998  7d50                     JGE 0x004109ea
0041099a  31f6                     XOR ESI,ESI
0041099c  eb01                     JMP 0x0041099f
0041099e  46                       INC ESI
0041099f  83fe09                   CMP ESI,0x9
004109a2  7df0                     JGE 0x00410994
004109a4  89f8                     MOV EAX,EDI
004109a6  c1e003                   SHL EAX,0x3
004109a9  01f8                     ADD EAX,EDI
004109ab  01f0                     ADD EAX,ESI
004109ad  8a9040004300             MOV DL,byte ptr [EAX + 0x430040]
004109b3  f6c240                   TEST DL,0x40
004109b6  74e6                     JZ 0x0041099e
004109b8  85ed                     TEST EBP,EBP
004109ba  7513                     JNZ 0x004109cf
004109bc  80e23f                   AND DL,0x3f
004109bf  8854240c                 MOV byte ptr [ESP + 0xc],DL
004109c3  30f6                     XOR DH,DH
004109c5  88b040004300             MOV byte ptr [EAX + 0x430040],DH
004109cb  ff442408                 INC dword ptr [ESP + 0x8]
004109cf  89e9                     MOV ECX,EBP
004109d1  89fb                     MOV EBX,EDI
004109d3  89f2                     MOV EDX,ESI
004109d5  8b0424                   MOV EAX,dword ptr [ESP]
004109d8  e850faffff               CALL 0x0041042d
004109dd  ebbf                     JMP 0x0041099e
004109df  bd09000000               MOV EBP,0x9
004109e4  eb18                     JMP 0x004109fe
004109e6  31ed                     XOR EBP,EBP
004109e8  eb14                     JMP 0x004109fe
004109ea  6a32                     PUSH 0x32
004109ec  e8da270000               CALL 0x004131cb
004109f1  8b442404                 MOV EAX,dword ptr [ESP + 0x4]
004109f5  85c0                     TEST EAX,EAX
004109f7  76e6                     JBE 0x004109df
004109f9  83f801                   CMP EAX,0x1
004109fc  74e8                     JZ 0x004109e6
004109fe  ff442404                 INC dword ptr [ESP + 0x4]
00410a02  837c240403               CMP dword ptr [ESP + 0x4],0x3
00410a07  7d04                     JGE 0x00410a0d
00410a09  31ff                     XOR EDI,EDI
00410a0b  eb88                     JMP 0x00410995
00410a0d  31c0                     XOR EAX,EAX
00410a0f  8a44240c                 MOV AL,byte ptr [ESP + 0xc]
00410a13  8b542408                 MOV EDX,dword ptr [ESP + 0x8]
00410a17  01148540024300           ADD dword ptr [EAX*0x4 + 0x430240],EDX
00410a1e  8b3d34024300             MOV EDI,dword ptr [0x00430234]
00410a24  85ff                     TEST EDI,EDI
00410a26  740a                     JZ 0x00410a32
00410a28  6a00                     PUSH 0x0
00410a2a  6a00                     PUSH 0x0
00410a2c  57                       PUSH EDI
00410a2d  e893270000               CALL 0x004131c5
00410a32  83c410                   ADD ESP,0x10
00410a35  e9ecf9ffff               JMP 0x00410426

; ---- count_empty_cells ----
00410a3a  51                       PUSH ECX
00410a3b  52                       PUSH EDX
00410a3c  56                       PUSH ESI
00410a3d  31c9                     XOR ECX,ECX
00410a3f  31f6                     XOR ESI,ESI
00410a41  eb01                     JMP 0x00410a44
00410a43  46                       INC ESI
00410a44  83fe09                   CMP ESI,0x9
00410a47  7d22                     JGE 0x00410a6b
00410a49  31d2                     XOR EDX,EDX
00410a4b  eb01                     JMP 0x00410a4e
00410a4d  42                       INC EDX
00410a4e  83fa09                   CMP EDX,0x9
00410a51  7df0                     JGE 0x00410a43
00410a53  89f0                     MOV EAX,ESI
00410a55  c1e003                   SHL EAX,0x3
00410a58  01f0                     ADD EAX,ESI
00410a5a  8a840240004300           MOV AL,byte ptr [EDX + EAX*0x1 + 0x430040]
00410a61  25ff000000               AND EAX,0xff
00410a66  75e5                     JNZ 0x00410a4d
00410a68  41                       INC ECX
00410a69  ebe2                     JMP 0x00410a4d
00410a6b  89c8                     MOV EAX,ECX
00410a6d  5e                       POP ESI
00410a6e  5a                       POP EDX
00410a6f  59                       POP ECX
00410a70  c3                       RET

; ---- spawn_ball ----
00410a71  53                       PUSH EBX
00410a72  51                       PUSH ECX
00410a73  52                       PUSH EDX
00410a74  56                       PUSH ESI
00410a75  57                       PUSH EDI
00410a76  55                       PUSH EBP
00410a77  83ec08                   SUB ESP,0x8
00410a7a  89c5                     MOV EBP,EAX
00410a7c  c644240401               MOV byte ptr [ESP + 0x4],0x1
00410a81  e8b4ffffff               CALL 0x00410a3a
00410a86  89c2                     MOV EDX,EAX
00410a88  85c0                     TEST EAX,EAX
00410a8a  0f842e010000             JZ 0x00410bbe
00410a90  98                       CWDE
00410a91  e8aef6ffff               CALL 0x00410144
00410a96  0fbfd0                   MOVSX EDX,AX
00410a99  31ff                     XOR EDI,EDI
00410a9b  eb01                     JMP 0x00410a9e
00410a9d  47                       INC EDI
00410a9e  83ff09                   CMP EDI,0x9
00410aa1  7d52                     JGE 0x00410af5
00410aa3  31f6                     XOR ESI,ESI
00410aa5  eb01                     JMP 0x00410aa8
00410aa7  46                       INC ESI
00410aa8  83fe09                   CMP ESI,0x9
00410aab  7df0                     JGE 0x00410a9d
00410aad  89f8                     MOV EAX,EDI
00410aaf  c1e003                   SHL EAX,0x3
00410ab2  01f8                     ADD EAX,EDI
00410ab4  8a840640004300           MOV AL,byte ptr [ESI + EAX*0x1 + 0x430040]
00410abb  25ff000000               AND EAX,0xff
00410ac0  7504                     JNZ 0x00410ac6
00410ac2  85d2                     TEST EDX,EDX
00410ac4  742f                     JZ 0x00410af5
00410ac6  89f8                     MOV EAX,EDI
00410ac8  c1e003                   SHL EAX,0x3
00410acb  01f8                     ADD EAX,EDI
00410acd  8a840640004300           MOV AL,byte ptr [ESI + EAX*0x1 + 0x430040]
00410ad4  25ff000000               AND EAX,0xff
00410ad9  7501                     JNZ 0x00410adc
00410adb  4a                       DEC EDX
00410adc  89f8                     MOV EAX,EDI
00410ade  c1e003                   SHL EAX,0x3
00410ae1  01f8                     ADD EAX,EDI
00410ae3  8a840640004300           MOV AL,byte ptr [ESI + EAX*0x1 + 0x430040]
00410aea  25ff000000               AND EAX,0xff
00410aef  75b6                     JNZ 0x00410aa7
00410af1  85d2                     TEST EDX,EDX
00410af3  75b2                     JNZ 0x00410aa7
00410af5  83ff08                   CMP EDI,0x8
00410af8  7e13                     JLE 0x00410b0d
00410afa  6a00                     PUSH 0x0
00410afc  6878004200               PUSH 0x420078
00410b01  68a48c4200               PUSH 0x428ca4
00410b06  6a00                     PUSH 0x0
00410b08  e8b2260000               CALL 0x004131bf
00410b0d  89f8                     MOV EAX,EDI
00410b0f  c1e003                   SHL EAX,0x3
00410b12  01f8                     ADD EAX,EDI
00410b14  01f0                     ADD EAX,ESI
00410b16  890424                   MOV dword ptr [ESP],EAX
00410b19  a050014300               MOV AL,[0x00430150]
00410b1e  8b1424                   MOV EDX,dword ptr [ESP]
00410b21  888240004300             MOV byte ptr [EDX + 0x430040],AL
00410b27  a051014300               MOV AL,[0x00430151]
00410b2c  a250014300               MOV [0x00430150],AL
00410b31  a052014300               MOV AL,[0x00430152]
00410b36  a251014300               MOV [0x00430151],AL
00410b3b  b807000000               MOV EAX,0x7
00410b40  e8fff5ffff               CALL 0x00410144
00410b45  fec0                     INC AL
00410b47  a252014300               MOV [0x00430152],AL
00410b4c  b906000000               MOV ECX,0x6
00410b51  89fb                     MOV EBX,EDI
00410b53  89f2                     MOV EDX,ESI
00410b55  89e8                     MOV EAX,EBP
00410b57  e8d1f8ffff               CALL 0x0041042d
00410b5c  6a32                     PUSH 0x32
00410b5e  e868260000               CALL 0x004131cb
00410b63  b907000000               MOV ECX,0x7
00410b68  89fb                     MOV EBX,EDI
00410b6a  89f2                     MOV EDX,ESI
00410b6c  89e8                     MOV EAX,EBP
00410b6e  e8baf8ffff               CALL 0x0041042d
00410b73  6a32                     PUSH 0x32
00410b75  e851260000               CALL 0x004131cb
00410b7a  31c9                     XOR ECX,ECX
00410b7c  89fb                     MOV EBX,EDI
00410b7e  89f2                     MOV EDX,ESI
00410b80  89e8                     MOV EAX,EBP
00410b82  e8a6f8ffff               CALL 0x0041042d
00410b87  31db                     XOR EBX,EBX
00410b89  8b0424                   MOV EAX,dword ptr [ESP]
00410b8c  8a9840004300             MOV BL,byte ptr [EAX + 0x430040]
00410b92  89fa                     MOV EDX,EDI
00410b94  89f0                     MOV EAX,ESI
00410b96  e851fcffff               CALL 0x004107ec
00410b9b  85c0                     TEST EAX,EAX
00410b9d  7409                     JZ 0x00410ba8
00410b9f  89e8                     MOV EAX,EBP
00410ba1  e8d0fdffff               CALL 0x00410976
00410ba6  eb06                     JMP 0x00410bae
00410ba8  30d2                     XOR DL,DL
00410baa  88542404                 MOV byte ptr [ESP + 0x4],DL
00410bae  807c240400               CMP byte ptr [ESP + 0x4],0x0
00410bb3  0f85c8feffff             JNZ 0x00410a81
00410bb9  b801000000               MOV EAX,0x1
00410bbe  83c408                   ADD ESP,0x8
00410bc1  e960f8ffff               JMP 0x00410426

; ---- line_score ----
00410bc6  53                       PUSH EBX
00410bc7  52                       PUSH EDX
00410bc8  bb0a000000               MOV EBX,0xa
00410bcd  ba02000000               MOV EDX,0x2
00410bd2  83e805                   SUB EAX,0x5
00410bd5  7408                     JZ 0x00410bdf
00410bd7  01d3                     ADD EBX,EDX
00410bd9  83c204                   ADD EDX,0x4
00410bdc  48                       DEC EAX
00410bdd  ebf6                     JMP 0x00410bd5
00410bdf  89d8                     MOV EAX,EBX
00410be1  5a                       POP EDX
00410be2  5b                       POP EBX
00410be3  c3                       RET

; ---- draw_bevel ----
00410be4  56                       PUSH ESI
00410be5  57                       PUSH EDI
00410be6  55                       PUSH EBP
00410be7  83ec04                   SUB ESP,0x4
00410bea  89c6                     MOV ESI,EAX
00410bec  89d5                     MOV EBP,EDX
00410bee  89cf                     MOV EDI,ECX
00410bf0  8b542418                 MOV EDX,dword ptr [ESP + 0x18]
00410bf4  52                       PUSH EDX
00410bf5  50                       PUSH EAX
00410bf6  e8ee250000               CALL 0x004131e9
00410bfb  890424                   MOV dword ptr [ESP],EAX
00410bfe  6a00                     PUSH 0x0
00410c00  8b4c2418                 MOV ECX,dword ptr [ESP + 0x18]
00410c04  51                       PUSH ECX
00410c05  55                       PUSH EBP
00410c06  56                       PUSH ESI
00410c07  e8d7250000               CALL 0x004131e3
00410c0c  53                       PUSH EBX
00410c0d  55                       PUSH EBP
00410c0e  56                       PUSH ESI
00410c0f  e8c9250000               CALL 0x004131dd
00410c14  53                       PUSH EBX
00410c15  57                       PUSH EDI
00410c16  56                       PUSH ESI
00410c17  e8c1250000               CALL 0x004131dd
00410c1c  8b44241c                 MOV EAX,dword ptr [ESP + 0x1c]
00410c20  50                       PUSH EAX
00410c21  56                       PUSH ESI
00410c22  e8c2250000               CALL 0x004131e9
00410c27  6a00                     PUSH 0x0
00410c29  8b542418                 MOV EDX,dword ptr [ESP + 0x18]
00410c2d  52                       PUSH EDX
00410c2e  45                       INC EBP
00410c2f  55                       PUSH EBP
00410c30  56                       PUSH ESI
00410c31  e8ad250000               CALL 0x004131e3
00410c36  8b4c2414                 MOV ECX,dword ptr [ESP + 0x14]
00410c3a  51                       PUSH ECX
00410c3b  57                       PUSH EDI
00410c3c  56                       PUSH ESI
00410c3d  e89b250000               CALL 0x004131dd
00410c42  53                       PUSH EBX
00410c43  57                       PUSH EDI
00410c44  56                       PUSH ESI
00410c45  e893250000               CALL 0x004131dd
00410c4a  8b3c24                   MOV EDI,dword ptr [ESP]
00410c4d  57                       PUSH EDI
00410c4e  56                       PUSH ESI
00410c4f  e895250000               CALL 0x004131e9
00410c54  83c404                   ADD ESP,0x4
00410c57  5d                       POP EBP
00410c58  5f                       POP EDI
00410c59  5e                       POP ESI
00410c5a  c20c00                   RET 0xc

; ---- draw_next_preview ----
00410c5d  53                       PUSH EBX
00410c5e  51                       PUSH ECX
00410c5f  52                       PUSH EDX
00410c60  56                       PUSH ESI
00410c61  57                       PUSH EDI
00410c62  55                       PUSH EBP
00410c63  89c6                     MOV ESI,EAX
00410c65  803d5c01430000           CMP byte ptr [0x0043015c],0x0
00410c6c  0f84bc000000             JZ 0x00410d2e
00410c72  682000cc00               PUSH 0xcc0020
00410c77  68b9010000               PUSH 0x1b9
00410c7c  31d2                     XOR EDX,EDX
00410c7e  8a1550014300             MOV DL,byte ptr [0x00430150]
00410c84  89d0                     MOV EAX,EDX
00410c86  c1e003                   SHL EAX,0x3
00410c89  01d0                     ADD EAX,EDX
00410c8b  c1e002                   SHL EAX,0x2
00410c8e  50                       PUSH EAX
00410c8f  8b1530024300             MOV EDX,dword ptr [0x00430230]
00410c95  52                       PUSH EDX
00410c96  6a24                     PUSH 0x24
00410c98  6a24                     PUSH 0x24
00410c9a  8b1d58014300             MOV EBX,dword ptr [0x00430158]
00410ca0  53                       PUSH EBX
00410ca1  8b0d54014300             MOV ECX,dword ptr [0x00430154]
00410ca7  51                       PUSH ECX
00410ca8  56                       PUSH ESI
00410ca9  e823250000               CALL 0x004131d1
00410cae  682000cc00               PUSH 0xcc0020
00410cb3  68b9010000               PUSH 0x1b9
00410cb8  31d2                     XOR EDX,EDX
00410cba  8a1551014300             MOV DL,byte ptr [0x00430151]
00410cc0  89d0                     MOV EAX,EDX
00410cc2  c1e003                   SHL EAX,0x3
00410cc5  01d0                     ADD EAX,EDX
00410cc7  c1e002                   SHL EAX,0x2
00410cca  50                       PUSH EAX
00410ccb  8b3d30024300             MOV EDI,dword ptr [0x00430230]
00410cd1  57                       PUSH EDI
00410cd2  6a24                     PUSH 0x24
00410cd4  6a24                     PUSH 0x24
00410cd6  8b2d58014300             MOV EBP,dword ptr [0x00430158]
00410cdc  55                       PUSH EBP
00410cdd  a154014300               MOV EAX,[0x00430154]
00410ce2  83c024                   ADD EAX,0x24
00410ce5  50                       PUSH EAX
00410ce6  56                       PUSH ESI
00410ce7  e8e5240000               CALL 0x004131d1
00410cec  682000cc00               PUSH 0xcc0020
00410cf1  68b9010000               PUSH 0x1b9
00410cf6  31d2                     XOR EDX,EDX
00410cf8  8a1552014300             MOV DL,byte ptr [0x00430152]
00410cfe  89d0                     MOV EAX,EDX
00410d00  c1e003                   SHL EAX,0x3
00410d03  01d0                     ADD EAX,EDX
00410d05  c1e002                   SHL EAX,0x2
00410d08  50                       PUSH EAX
00410d09  a130024300               MOV EAX,[0x00430230]
00410d0e  50                       PUSH EAX
00410d0f  6a24                     PUSH 0x24
00410d11  6a24                     PUSH 0x24
00410d13  8b1558014300             MOV EDX,dword ptr [0x00430158]
00410d19  52                       PUSH EDX
00410d1a  a154014300               MOV EAX,[0x00430154]
00410d1f  83c048                   ADD EAX,0x48
00410d22  50                       PUSH EAX
00410d23  56                       PUSH ESI
00410d24  e8a8240000               CALL 0x004131d1
00410d29  e9f8f6ffff               JMP 0x00410426
00410d2e  31db                     XOR EBX,EBX
00410d30  eb36                     JMP 0x00410d68
00410d32  682000cc00               PUSH 0xcc0020
00410d37  68e1000000               PUSH 0xe1
00410d3c  6a00                     PUSH 0x0
00410d3e  8b0d30024300             MOV ECX,dword ptr [0x00430230]
00410d44  51                       PUSH ECX
00410d45  6a24                     PUSH 0x24
00410d47  6a24                     PUSH 0x24
00410d49  8b3d58014300             MOV EDI,dword ptr [0x00430158]
00410d4f  57                       PUSH EDI
00410d50  89d8                     MOV EAX,EBX
00410d52  c1e003                   SHL EAX,0x3
00410d55  01d8                     ADD EAX,EBX
00410d57  c1e002                   SHL EAX,0x2
00410d5a  030554014300             ADD EAX,dword ptr [0x00430154]
00410d60  50                       PUSH EAX
00410d61  56                       PUSH ESI
00410d62  e86a240000               CALL 0x004131d1
00410d67  43                       INC EBX
00410d68  83fb03                   CMP EBX,0x3
00410d6b  7cc5                     JL 0x00410d32
00410d6d  e9b4f6ffff               JMP 0x00410426

; ---- draw_score_box ----
00410d72  56                       PUSH ESI
00410d73  57                       PUSH EDI
00410d74  55                       PUSH EBP
00410d75  83ec34                   SUB ESP,0x34
00410d78  89c6                     MOV ESI,EAX
00410d7a  89d7                     MOV EDI,EDX
00410d7c  89dd                     MOV EBP,EBX
00410d7e  894c2430                 MOV dword ptr [ESP + 0x30],ECX
00410d82  8d4204                   LEA EAX,[EDX + 0x4]
00410d85  890424                   MOV dword ptr [ESP],EAX
00410d88  8d4244                   LEA EAX,[EDX + 0x44]
00410d8b  89442428                 MOV dword ptr [ESP + 0x28],EAX
00410d8f  89442408                 MOV dword ptr [ESP + 0x8],EAX
00410d93  8d4304                   LEA EAX,[EBX + 0x4]
00410d96  89442404                 MOV dword ptr [ESP + 0x4],EAX
00410d9a  8d4314                   LEA EAX,[EBX + 0x14]
00410d9d  8944242c                 MOV dword ptr [ESP + 0x2c],EAX
00410da1  8944240c                 MOV dword ptr [ESP + 0xc],EAX
00410da5  6a04                     PUSH 0x4
00410da7  e88b240000               CALL 0x00413237
00410dac  50                       PUSH EAX
00410dad  8d442404                 LEA EAX,[ESP + 0x4]
00410db1  50                       PUSH EAX
00410db2  56                       PUSH ESI
00410db3  e801240000               CALL 0x004131b9
00410db8  6a14                     PUSH 0x14
00410dba  e8f4230000               CALL 0x004131b3
00410dbf  50                       PUSH EAX
00410dc0  6a01                     PUSH 0x1
00410dc2  6a00                     PUSH 0x0
00410dc4  e826240000               CALL 0x004131ef
00410dc9  89442420                 MOV dword ptr [ESP + 0x20],EAX
00410dcd  6a10                     PUSH 0x10
00410dcf  e8df230000               CALL 0x004131b3
00410dd4  50                       PUSH EAX
00410dd5  6a01                     PUSH 0x1
00410dd7  6a00                     PUSH 0x0
00410dd9  e811240000               CALL 0x004131ef
00410dde  89442424                 MOV dword ptr [ESP + 0x24],EAX
00410de2  50                       PUSH EAX
00410de3  8b5c2424                 MOV EBX,dword ptr [ESP + 0x24]
00410de7  53                       PUSH EBX
00410de8  8d4517                   LEA EAX,[EBP + 0x17]
00410deb  50                       PUSH EAX
00410dec  8d4f47                   LEA ECX,[EDI + 0x47]
00410def  89eb                     MOV EBX,EBP
00410df1  89fa                     MOV EDX,EDI
00410df3  89f0                     MOV EAX,ESI
00410df5  e8eafdffff               CALL 0x00410be4
00410dfa  8b4c2420                 MOV ECX,dword ptr [ESP + 0x20]
00410dfe  51                       PUSH ECX
00410dff  8b442428                 MOV EAX,dword ptr [ESP + 0x28]
00410e03  50                       PUSH EAX
00410e04  8b542434                 MOV EDX,dword ptr [ESP + 0x34]
00410e08  52                       PUSH EDX
00410e09  8d5d03                   LEA EBX,[EBP + 0x3]
00410e0c  8d5703                   LEA EDX,[EDI + 0x3]
00410e0f  8b4c2434                 MOV ECX,dword ptr [ESP + 0x34]
00410e13  89f0                     MOV EAX,ESI
00410e15  e8cafdffff               CALL 0x00410be4
00410e1a  68ffffff00               PUSH 0xffffff
00410e1f  56                       PUSH ESI
00410e20  e888230000               CALL 0x004131ad
00410e25  6a01                     PUSH 0x1
00410e27  56                       PUSH ESI
00410e28  e87a230000               CALL 0x004131a7
00410e2d  8d542410                 LEA EDX,[ESP + 0x10]
00410e31  8b442430                 MOV EAX,dword ptr [ESP + 0x30]
00410e35  e86ef2ffff               CALL 0x004100a8
00410e3a  6a02                     PUSH 0x2
00410e3c  8d442404                 LEA EAX,[ESP + 0x4]
00410e40  50                       PUSH EAX
00410e41  6aff                     PUSH -0x1
00410e43  8d44241c                 LEA EAX,[ESP + 0x1c]
00410e47  50                       PUSH EAX
00410e48  56                       PUSH ESI
00410e49  836c241c08               SUB dword ptr [ESP + 0x1c],0x8
00410e4e  e84e230000               CALL 0x004131a1
00410e53  83c434                   ADD ESP,0x34
00410e56  5d                       POP EBP
00410e57  5f                       POP EDI
00410e58  5e                       POP ESI
00410e59  c3                       RET

; ---- draw_top_bar ----
00410e5a  53                       PUSH EBX
00410e5b  51                       PUSH ECX
00410e5c  56                       PUSH ESI
00410e5d  57                       PUSH EDI
00410e5e  55                       PUSH EBP
00410e5f  83ec18                   SUB ESP,0x18
00410e62  89d6                     MOV ESI,EDX
00410e64  89e1                     MOV ECX,ESP
00410e66  51                       PUSH ECX
00410e67  50                       PUSH EAX
00410e68  e82e230000               CALL 0x0041319b
00410e6d  8b442404                 MOV EAX,dword ptr [ESP + 0x4]
00410e71  83c02b                   ADD EAX,0x2b
00410e74  8944240c                 MOV dword ptr [ESP + 0xc],EAX
00410e78  6a0f                     PUSH 0xf
00410e7a  e834230000               CALL 0x004131b3
00410e7f  50                       PUSH EAX
00410e80  e810230000               CALL 0x00413195
00410e85  89442414                 MOV dword ptr [ESP + 0x14],EAX
00410e89  50                       PUSH EAX
00410e8a  8d442404                 LEA EAX,[ESP + 0x4]
00410e8e  50                       PUSH EAX
00410e8f  56                       PUSH ESI
00410e90  e824230000               CALL 0x004131b9
00410e95  6a14                     PUSH 0x14
00410e97  e817230000               CALL 0x004131b3
00410e9c  50                       PUSH EAX
00410e9d  6a01                     PUSH 0x1
00410e9f  6a00                     PUSH 0x0
00410ea1  e849230000               CALL 0x004131ef
00410ea6  89c5                     MOV EBP,EAX
00410ea8  6a10                     PUSH 0x10
00410eaa  e804230000               CALL 0x004131b3
00410eaf  50                       PUSH EAX
00410eb0  6a01                     PUSH 0x1
00410eb2  6a00                     PUSH 0x0
00410eb4  e836230000               CALL 0x004131ef
00410eb9  89c7                     MOV EDI,EAX
00410ebb  50                       PUSH EAX
00410ebc  56                       PUSH ESI
00410ebd  e827230000               CALL 0x004131e9
00410ec2  89442410                 MOV dword ptr [ESP + 0x10],EAX
00410ec6  6a00                     PUSH 0x0
00410ec8  6a00                     PUSH 0x0
00410eca  6a00                     PUSH 0x0
00410ecc  56                       PUSH ESI
00410ecd  e811230000               CALL 0x004131e3
00410ed2  6a00                     PUSH 0x0
00410ed4  8b44240c                 MOV EAX,dword ptr [ESP + 0xc]
00410ed8  40                       INC EAX
00410ed9  50                       PUSH EAX
00410eda  56                       PUSH ESI
00410edb  e8fd220000               CALL 0x004131dd
00410ee0  55                       PUSH EBP
00410ee1  56                       PUSH ESI
00410ee2  e802230000               CALL 0x004131e9
00410ee7  6a00                     PUSH 0x0
00410ee9  6a01                     PUSH 0x1
00410eeb  6a00                     PUSH 0x0
00410eed  56                       PUSH ESI
00410eee  e8f0220000               CALL 0x004131e3
00410ef3  6a01                     PUSH 0x1
00410ef5  8b44240c                 MOV EAX,dword ptr [ESP + 0xc]
00410ef9  40                       INC EAX
00410efa  50                       PUSH EAX
00410efb  56                       PUSH ESI
00410efc  e8dc220000               CALL 0x004131dd
00410f01  57                       PUSH EDI
00410f02  56                       PUSH ESI
00410f03  e8e1220000               CALL 0x004131e9
00410f08  6a00                     PUSH 0x0
00410f0a  6a2b                     PUSH 0x2b
00410f0c  6a00                     PUSH 0x0
00410f0e  56                       PUSH ESI
00410f0f  e8cf220000               CALL 0x004131e3
00410f14  6a2b                     PUSH 0x2b
00410f16  8b44240c                 MOV EAX,dword ptr [ESP + 0xc]
00410f1a  40                       INC EAX
00410f1b  50                       PUSH EAX
00410f1c  56                       PUSH ESI
00410f1d  e8bb220000               CALL 0x004131dd
00410f22  55                       PUSH EBP
00410f23  56                       PUSH ESI
00410f24  e8c0220000               CALL 0x004131e9
00410f29  6a00                     PUSH 0x0
00410f2b  6a2a                     PUSH 0x2a
00410f2d  6a00                     PUSH 0x0
00410f2f  56                       PUSH ESI
00410f30  e8ae220000               CALL 0x004131e3
00410f35  6a2a                     PUSH 0x2a
00410f37  8b44240c                 MOV EAX,dword ptr [ESP + 0xc]
00410f3b  40                       INC EAX
00410f3c  50                       PUSH EAX
00410f3d  56                       PUSH ESI
00410f3e  e89a220000               CALL 0x004131dd
00410f43  6a10                     PUSH 0x10
00410f45  e869220000               CALL 0x004131b3
00410f4a  50                       PUSH EAX
00410f4b  56                       PUSH ESI
00410f4c  e85c220000               CALL 0x004131ad
00410f51  6a01                     PUSH 0x1
00410f53  56                       PUSH ESI
00410f54  e84e220000               CALL 0x004131a7
00410f59  a154014300               MOV EAX,[0x00430154]
00410f5e  83e80f                   SUB EAX,0xf
00410f61  89442408                 MOV dword ptr [ESP + 0x8],EAX
00410f65  a154014300               MOV EAX,[0x00430154]
00410f6a  83e84f                   SUB EAX,0x4f
00410f6d  890424                   MOV dword ptr [ESP],EAX
00410f70  bb0f000000               MOV EBX,0xf
00410f75  895c2404                 MOV dword ptr [ESP + 0x4],EBX
00410f79  c744240c1f000000         MOV dword ptr [ESP + 0xc],0x1f
00410f81  6a02                     PUSH 0x2
00410f83  8d442404                 LEA EAX,[ESP + 0x4]
00410f87  50                       PUSH EAX
00410f88  6a04                     PUSH 0x4
00410f8a  68af8c4200               PUSH 0x428caf
00410f8f  56                       PUSH ESI
00410f90  e80c220000               CALL 0x004131a1
00410f95  68ffffff00               PUSH 0xffffff
00410f9a  56                       PUSH ESI
00410f9b  ff4c240c                 DEC dword ptr [ESP + 0xc]
00410f9f  ff4c2410                 DEC dword ptr [ESP + 0x10]
00410fa3  e805220000               CALL 0x004131ad
00410fa8  6a02                     PUSH 0x2
00410faa  8d442404                 LEA EAX,[ESP + 0x4]
00410fae  50                       PUSH EAX
00410faf  6a04                     PUSH 0x4
00410fb1  68b48c4200               PUSH 0x428cb4
00410fb6  56                       PUSH ESI
00410fb7  e8e5210000               CALL 0x004131a1
00410fbc  6a10                     PUSH 0x10
00410fbe  e8f0210000               CALL 0x004131b3
00410fc3  50                       PUSH EAX
00410fc4  56                       PUSH ESI
00410fc5  e8e3210000               CALL 0x004131ad
00410fca  a154014300               MOV EAX,[0x00430154]
00410fcf  83c07d                   ADD EAX,0x7d
00410fd2  890424                   MOV dword ptr [ESP],EAX
00410fd5  a154014300               MOV EAX,[0x00430154]
00410fda  05bd000000               ADD EAX,0xbd
00410fdf  89442408                 MOV dword ptr [ESP + 0x8],EAX
00410fe3  895c2404                 MOV dword ptr [ESP + 0x4],EBX
00410fe7  c744240c1f000000         MOV dword ptr [ESP + 0xc],0x1f
00410fef  6a00                     PUSH 0x0
00410ff1  8d442404                 LEA EAX,[ESP + 0x4]
00410ff5  50                       PUSH EAX
00410ff6  6a06                     PUSH 0x6
00410ff8  68b98c4200               PUSH 0x428cb9
00410ffd  56                       PUSH ESI
00410ffe  e89e210000               CALL 0x004131a1
00411003  68ffffff00               PUSH 0xffffff
00411008  56                       PUSH ESI
00411009  ff4c240c                 DEC dword ptr [ESP + 0xc]
0041100d  ff4c2408                 DEC dword ptr [ESP + 0x8]
00411011  e897210000               CALL 0x004131ad
00411016  6a00                     PUSH 0x0
00411018  8d442404                 LEA EAX,[ESP + 0x4]
0041101c  50                       PUSH EAX
0041101d  6a06                     PUSH 0x6
0041101f  68c08c4200               PUSH 0x428cc0
00411024  56                       PUSH ESI
00411025  e877210000               CALL 0x004131a1
0041102a  8b0d60014300             MOV ECX,dword ptr [0x00430160]
00411030  bb0a000000               MOV EBX,0xa
00411035  ba18000000               MOV EDX,0x18
0041103a  89f0                     MOV EAX,ESI
0041103c  e831fdffff               CALL 0x00410d72
00411041  8b5c2410                 MOV EBX,dword ptr [ESP + 0x10]
00411045  53                       PUSH EBX
00411046  56                       PUSH ESI
00411047  e89d210000               CALL 0x004131e9
0041104c  55                       PUSH EBP
0041104d  e885210000               CALL 0x004131d7
00411052  57                       PUSH EDI
00411053  e87f210000               CALL 0x004131d7
00411058  8b4c2414                 MOV ECX,dword ptr [ESP + 0x14]
0041105c  51                       PUSH ECX
0041105d  e875210000               CALL 0x004131d7
00411062  83c418                   ADD ESP,0x18
00411065  5d                       POP EBP
00411066  5f                       POP EDI
00411067  5e                       POP ESI
00411068  59                       POP ECX
00411069  5b                       POP EBX
0041106a  c3                       RET

; ---- draw_king_figure ----
0041106b  53                       PUSH EBX
0041106c  51                       PUSH ECX
0041106d  56                       PUSH ESI
0041106e  57                       PUSH EDI
0041106f  83ec10                   SUB ESP,0x10
00411072  89c3                     MOV EBX,EAX
00411074  84d2                     TEST DL,DL
00411076  0f84cd000000             JZ 0x00411149
0041107c  682000cc00               PUSH 0xcc0020
00411081  68c9000000               PUSH 0xc9
00411086  6a01                     PUSH 0x1
00411088  8b1530024300             MOV EDX,dword ptr [0x00430230]
0041108e  52                       PUSH EDX
0041108f  6a09                     PUSH 0x9
00411091  6a3a                     PUSH 0x3a
00411093  a168014300               MOV EAX,[0x00430168]
00411098  83e809                   SUB EAX,0x9
0041109b  50                       PUSH EAX
0041109c  8b0d64014300             MOV ECX,dword ptr [0x00430164]
004110a2  51                       PUSH ECX
004110a3  53                       PUSH EBX
004110a4  e828210000               CALL 0x004131d1
004110a9  682000cc00               PUSH 0xcc0020
004110ae  6a64                     PUSH 0x64
004110b0  68a4010000               PUSH 0x1a4
004110b5  8b3530024300             MOV ESI,dword ptr [0x00430230]
004110bb  56                       PUSH ESI
004110bc  b87d000000               MOV EAX,0x7d
004110c1  8b3d6c014300             MOV EDI,dword ptr [0x0043016c]
004110c7  29f8                     SUB EAX,EDI
004110c9  50                       PUSH EAX
004110ca  6a2d                     PUSH 0x2d
004110cc  a168014300               MOV EAX,[0x00430168]
004110d1  2d86000000               SUB EAX,0x86
004110d6  01f8                     ADD EAX,EDI
004110d8  50                       PUSH EAX
004110d9  a164014300               MOV EAX,[0x00430164]
004110de  83c006                   ADD EAX,0x6
004110e1  50                       PUSH EAX
004110e2  53                       PUSH EBX
004110e3  e8e9200000               CALL 0x004131d1
004110e8  a164014300               MOV EAX,[0x00430164]
004110ed  83e810                   SUB EAX,0x10
004110f0  890424                   MOV dword ptr [ESP],EAX
004110f3  a164014300               MOV EAX,[0x00430164]
004110f8  83c04a                   ADD EAX,0x4a
004110fb  89442408                 MOV dword ptr [ESP + 0x8],EAX
004110ff  a168014300               MOV EAX,[0x00430168]
00411104  83c008                   ADD EAX,0x8
00411107  89442404                 MOV dword ptr [ESP + 0x4],EAX
0041110b  a168014300               MOV EAX,[0x00430168]
00411110  83c018                   ADD EAX,0x18
00411113  8944240c                 MOV dword ptr [ESP + 0xc],EAX
00411117  68ffffff00               PUSH 0xffffff
0041111c  53                       PUSH EBX
0041111d  e88b200000               CALL 0x004131ad
00411122  6a04                     PUSH 0x4
00411124  e80e210000               CALL 0x00413237
00411129  50                       PUSH EAX
0041112a  8d442404                 LEA EAX,[ESP + 0x4]
0041112e  50                       PUSH EAX
0041112f  53                       PUSH EBX
00411130  e884200000               CALL 0x004131b9
00411135  6a01                     PUSH 0x1
00411137  8d442404                 LEA EAX,[ESP + 0x4]
0041113b  50                       PUSH EAX
0041113c  6aff                     PUSH -0x1
0041113e  682c004200               PUSH 0x42002c
00411143  53                       PUSH EBX
00411144  e858200000               CALL 0x004131a1
00411149  682000cc00               PUSH 0xcc0020
0041114e  6a00                     PUSH 0x0
00411150  31d2                     XOR EDX,EDX
00411152  8a1570014300             MOV DL,byte ptr [0x00430170]
00411158  89d0                     MOV EAX,EDX
0041115a  c1e003                   SHL EAX,0x3
0041115d  01d0                     ADD EAX,EDX
0041115f  c1e003                   SHL EAX,0x3
00411162  01d0                     ADD EAX,EDX
00411164  40                       INC EAX
00411165  50                       PUSH EAX
00411166  a130024300               MOV EAX,[0x00430230]
0041116b  50                       PUSH EAX
0041116c  6a64                     PUSH 0x64
0041116e  6a48                     PUSH 0x48
00411170  a168014300               MOV EAX,[0x00430168]
00411175  2dea000000               SUB EAX,0xea
0041117a  03056c014300             ADD EAX,dword ptr [0x0043016c]
00411180  50                       PUSH EAX
00411181  a164014300               MOV EAX,[0x00430164]
00411186  48                       DEC EAX
00411187  50                       PUSH EAX
00411188  53                       PUSH EBX
00411189  e843200000               CALL 0x004131d1
0041118e  83c410                   ADD ESP,0x10
00411191  5f                       POP EDI
00411192  5e                       POP ESI
00411193  59                       POP ECX
00411194  5b                       POP EBX
00411195  c3                       RET

; ---- draw_pretender_figure ----
00411196  51                       PUSH ECX
00411197  56                       PUSH ESI
00411198  57                       PUSH EDI
00411199  55                       PUSH EBP
0041119a  83ec10                   SUB ESP,0x10
0041119d  89c6                     MOV ESI,EAX
0041119f  84d2                     TEST DL,DL
004111a1  0f84cd000000             JZ 0x00411274
004111a7  682000cc00               PUSH 0xcc0020
004111ac  68c9000000               PUSH 0xc9
004111b1  6a01                     PUSH 0x1
004111b3  8b1530024300             MOV EDX,dword ptr [0x00430230]
004111b9  52                       PUSH EDX
004111ba  6a09                     PUSH 0x9
004111bc  6a3a                     PUSH 0x3a
004111be  a178014300               MOV EAX,[0x00430178]
004111c3  83e809                   SUB EAX,0x9
004111c6  50                       PUSH EAX
004111c7  8b0d74014300             MOV ECX,dword ptr [0x00430174]
004111cd  51                       PUSH ECX
004111ce  56                       PUSH ESI
004111cf  e8fd1f0000               CALL 0x004131d1
004111d4  682000cc00               PUSH 0xcc0020
004111d9  6a64                     PUSH 0x64
004111db  68a4010000               PUSH 0x1a4
004111e0  8b3d30024300             MOV EDI,dword ptr [0x00430230]
004111e6  57                       PUSH EDI
004111e7  b87d000000               MOV EAX,0x7d
004111ec  8b2d7c014300             MOV EBP,dword ptr [0x0043017c]
004111f2  29e8                     SUB EAX,EBP
004111f4  50                       PUSH EAX
004111f5  6a2d                     PUSH 0x2d
004111f7  a178014300               MOV EAX,[0x00430178]
004111fc  2d86000000               SUB EAX,0x86
00411201  01e8                     ADD EAX,EBP
00411203  50                       PUSH EAX
00411204  a174014300               MOV EAX,[0x00430174]
00411209  83c006                   ADD EAX,0x6
0041120c  50                       PUSH EAX
0041120d  56                       PUSH ESI
0041120e  e8be1f0000               CALL 0x004131d1
00411213  a174014300               MOV EAX,[0x00430174]
00411218  83e810                   SUB EAX,0x10
0041121b  890424                   MOV dword ptr [ESP],EAX
0041121e  a174014300               MOV EAX,[0x00430174]
00411223  83c04a                   ADD EAX,0x4a
00411226  89442408                 MOV dword ptr [ESP + 0x8],EAX
0041122a  a178014300               MOV EAX,[0x00430178]
0041122f  83c008                   ADD EAX,0x8
00411232  89442404                 MOV dword ptr [ESP + 0x4],EAX
00411236  a178014300               MOV EAX,[0x00430178]
0041123b  83c018                   ADD EAX,0x18
0041123e  8944240c                 MOV dword ptr [ESP + 0xc],EAX
00411242  68ffffff00               PUSH 0xffffff
00411247  56                       PUSH ESI
00411248  e8601f0000               CALL 0x004131ad
0041124d  6a04                     PUSH 0x4
0041124f  e8e31f0000               CALL 0x00413237
00411254  50                       PUSH EAX
00411255  8d442404                 LEA EAX,[ESP + 0x4]
00411259  50                       PUSH EAX
0041125a  56                       PUSH ESI
0041125b  e8591f0000               CALL 0x004131b9
00411260  6a01                     PUSH 0x1
00411262  8d442404                 LEA EAX,[ESP + 0x4]
00411266  50                       PUSH EAX
00411267  6aff                     PUSH -0x1
00411269  683c004200               PUSH 0x42003c
0041126e  56                       PUSH ESI
0041126f  e82d1f0000               CALL 0x004131a1
00411274  31c0                     XOR EAX,EAX
00411276  a080014300               MOV AL,[0x00430180]
0041127b  85c0                     TEST EAX,EAX
0041127d  7404                     JZ 0x00411283
0041127f  84db                     TEST BL,BL
00411281  7434                     JZ 0x004112b7
00411283  682000cc00               PUSH 0xcc0020
00411288  6a64                     PUSH 0x64
0041128a  6a01                     PUSH 0x1
0041128c  8b1d30024300             MOV EBX,dword ptr [0x00430230]
00411292  53                       PUSH EBX
00411293  6a64                     PUSH 0x64
00411295  6a48                     PUSH 0x48
00411297  a178014300               MOV EAX,[0x00430178]
0041129c  2dea000000               SUB EAX,0xea
004112a1  03057c014300             ADD EAX,dword ptr [0x0043017c]
004112a7  50                       PUSH EAX
004112a8  a174014300               MOV EAX,[0x00430174]
004112ad  83e80a                   SUB EAX,0xa
004112b0  50                       PUSH EAX
004112b1  56                       PUSH ESI
004112b2  e81a1f0000               CALL 0x004131d1
004112b7  31d2                     XOR EDX,EDX
004112b9  8a1580014300             MOV DL,byte ptr [0x00430180]
004112bf  85d2                     TEST EDX,EDX
004112c1  0f84a7f6ffff             JZ 0x0041096e
004112c7  682000cc00               PUSH 0xcc0020
004112cc  6a64                     PUSH 0x64
004112ce  89d0                     MOV EAX,EDX
004112d0  c1e002                   SHL EAX,0x2
004112d3  29d0                     SUB EAX,EDX
004112d5  89c2                     MOV EDX,EAX
004112d7  c1e004                   SHL EAX,0x4
004112da  01d0                     ADD EAX,EDX
004112dc  83c017                   ADD EAX,0x17
004112df  50                       PUSH EAX
004112e0  8b3d30024300             MOV EDI,dword ptr [0x00430230]
004112e6  57                       PUSH EDI
004112e7  6a41                     PUSH 0x41
004112e9  6a32                     PUSH 0x32
004112eb  a178014300               MOV EAX,[0x00430178]
004112f0  2dea000000               SUB EAX,0xea
004112f5  03057c014300             ADD EAX,dword ptr [0x0043017c]
004112fb  83c006                   ADD EAX,0x6
004112fe  50                       PUSH EAX
004112ff  a174014300               MOV EAX,[0x00430174]
00411304  83e80a                   SUB EAX,0xa
00411307  50                       PUSH EAX
00411308  56                       PUSH ESI
00411309  e8c31e0000               CALL 0x004131d1
0041130e  e95bf6ffff               JMP 0x0041096e

; ---- add_score_and_animate ----
00411313  53                       PUSH EBX
00411314  51                       PUSH ECX
00411315  56                       PUSH ESI
00411316  57                       PUSH EDI
00411317  55                       PUSH EBP
00411318  89c6                     MOV ESI,EAX
0041131a  8b1d44014300             MOV EBX,dword ptr [0x00430144]
00411320  01d3                     ADD EBX,EDX
00411322  891d44014300             MOV dword ptr [0x00430144],EBX
00411328  89d9                     MOV ECX,EBX
0041132a  8b1d4c014300             MOV EBX,dword ptr [0x0043014c]
00411330  8b1548014300             MOV EDX,dword ptr [0x00430148]
00411336  e837faffff               CALL 0x00410d72
0041133b  833d8401430000           CMP dword ptr [0x00430184],0x0
00411342  7457                     JZ 0x0041139b
00411344  a144014300               MOV EAX,[0x00430144]
00411349  8b2d60014300             MOV EBP,dword ptr [0x00430160]
0041134f  29e8                     SUB EAX,EBP
00411351  89c7                     MOV EDI,EAX
00411353  c1e705                   SHL EDI,0x5
00411356  29c7                     SUB EDI,EAX
00411358  c1e702                   SHL EDI,0x2
0041135b  01c7                     ADD EDI,EAX
0041135d  89f8                     MOV EAX,EDI
0041135f  89fa                     MOV EDX,EDI
00411361  c1fa1f                   SAR EDX,0x1f
00411364  f7fd                     IDIV EBP
00411366  89c7                     MOV EDI,EAX
00411368  83f87d                   CMP EAX,0x7d
0041136b  7e05                     JLE 0x00411372
0041136d  bf7d000000               MOV EDI,0x7d
00411372  8b156c014300             MOV EDX,dword ptr [0x0043016c]
00411378  39d7                     CMP EDI,EDX
0041137a  0f84e5fcffff             JZ 0x00411065
00411380  8d5a01                   LEA EBX,[EDX + 0x1]
00411383  891d6c014300             MOV dword ptr [0x0043016c],EBX
00411389  31d2                     XOR EDX,EDX
0041138b  89f0                     MOV EAX,ESI
0041138d  e8d9fcffff               CALL 0x0041106b
00411392  6a19                     PUSH 0x19
00411394  e8321e0000               CALL 0x004131cb
00411399  ebd7                     JMP 0x00411372
0041139b  a144014300               MOV EAX,[0x00430144]
004113a0  89c7                     MOV EDI,EAX
004113a2  c1e705                   SHL EDI,0x5
004113a5  29c7                     SUB EDI,EAX
004113a7  c1e702                   SHL EDI,0x2
004113aa  01c7                     ADD EDI,EAX
004113ac  89f8                     MOV EAX,EDI
004113ae  89fa                     MOV EDX,EDI
004113b0  c1fa1f                   SAR EDX,0x1f
004113b3  f73d60014300             IDIV dword ptr [0x00430160]
004113b9  bf7d000000               MOV EDI,0x7d
004113be  29c7                     SUB EDI,EAX
004113c0  85ff                     TEST EDI,EDI
004113c2  7d02                     JGE 0x004113c6
004113c4  31ff                     XOR EDI,EDI
004113c6  8b0d7c014300             MOV ECX,dword ptr [0x0043017c]
004113cc  39cf                     CMP EDI,ECX
004113ce  741d                     JZ 0x004113ed
004113d0  8d69ff                   LEA EBP,[ECX + -0x1]
004113d3  892d7c014300             MOV dword ptr [0x0043017c],EBP
004113d9  31db                     XOR EBX,EBX
004113db  31d2                     XOR EDX,EDX
004113dd  89f0                     MOV EAX,ESI
004113df  e8b2fdffff               CALL 0x00411196
004113e4  6a19                     PUSH 0x19
004113e6  e8e01d0000               CALL 0x004131cb
004113eb  ebd9                     JMP 0x004113c6
004113ed  a144014300               MOV EAX,[0x00430144]
004113f2  3b0560014300             CMP EAX,dword ptr [0x00430160]
004113f8  0f8e67fcffff             JLE 0x00411065
004113fe  31ff                     XOR EDI,EDI
00411400  eb2b                     JMP 0x0041142d
00411402  fe0570014300             INC byte ptr [0x00430170]
00411408  fe0580014300             INC byte ptr [0x00430180]
0041140e  31d2                     XOR EDX,EDX
00411410  89f0                     MOV EAX,ESI
00411412  e854fcffff               CALL 0x0041106b
00411417  31db                     XOR EBX,EBX
00411419  31d2                     XOR EDX,EDX
0041141b  89f0                     MOV EAX,ESI
0041141d  e874fdffff               CALL 0x00411196
00411422  6896000000               PUSH 0x96
00411427  e89f1d0000               CALL 0x004131cb
0041142c  47                       INC EDI
0041142d  83ff06                   CMP EDI,0x6
00411430  7cd0                     JL 0x00411402
00411432  31ff                     XOR EDI,EDI
00411434  eb37                     JMP 0x0041146d
00411436  fe0d80014300             DEC byte ptr [0x00430180]
0041143c  31db                     XOR EBX,EBX
0041143e  31d2                     XOR EDX,EDX
00411440  89f0                     MOV EAX,ESI
00411442  e84ffdffff               CALL 0x00411196
00411447  6896000000               PUSH 0x96
0041144c  e87a1d0000               CALL 0x004131cb
00411451  fe0580014300             INC byte ptr [0x00430180]
00411457  31db                     XOR EBX,EBX
00411459  31d2                     XOR EDX,EDX
0041145b  89f0                     MOV EAX,ESI
0041145d  e834fdffff               CALL 0x00411196
00411462  6896000000               PUSH 0x96
00411467  e85f1d0000               CALL 0x004131cb
0041146c  47                       INC EDI
0041146d  83ff03                   CMP EDI,0x3
00411470  7cc4                     JL 0x00411436
00411472  c7058401430001000000     MOV dword ptr [0x00430184],0x1
0041147c  e9e4fbffff               JMP 0x00411065

; ---- new_game_setup ----
00411481  53                       PUSH EBX
00411482  51                       PUSH ECX
00411483  52                       PUSH EDX
00411484  56                       PUSH ESI
00411485  89c6                     MOV ESI,EAX
00411487  31c9                     XOR ECX,ECX
00411489  eb17                     JMP 0x004114a2
0041148b  89c8                     MOV EAX,ECX
0041148d  c1e003                   SHL EAX,0x3
00411490  01c8                     ADD EAX,ECX
00411492  30db                     XOR BL,BL
00411494  889c0240004300           MOV byte ptr [EDX + EAX*0x1 + 0x430040],BL
0041149b  42                       INC EDX
0041149c  83fa09                   CMP EDX,0x9
0041149f  7cea                     JL 0x0041148b
004114a1  41                       INC ECX
004114a2  83f909                   CMP ECX,0x9
004114a5  7d04                     JGE 0x004114ab
004114a7  31d2                     XOR EDX,EDX
004114a9  ebf1                     JMP 0x0041149c
004114ab  31c9                     XOR ECX,ECX
004114ad  eb0a                     JMP 0x004114b9
004114af  31d2                     XOR EDX,EDX
004114b1  89148d40024300           MOV dword ptr [ECX*0x4 + 0x430240],EDX
004114b8  41                       INC ECX
004114b9  83f908                   CMP ECX,0x8
004114bc  7cf1                     JL 0x004114af
004114be  e8e2efffff               CALL 0x004104a5
004114c3  89f0                     MOV EAX,ESI
004114c5  e82feeffff               CALL 0x004102f9
004114ca  31c9                     XOR ECX,ECX
004114cc  eb08                     JMP 0x004114d6
004114ce  89f0                     MOV EAX,ESI
004114d0  e89cf5ffff               CALL 0x00410a71
004114d5  41                       INC ECX
004114d6  83f905                   CMP ECX,0x5
004114d9  7cf3                     JL 0x004114ce
004114db  31db                     XOR EBX,EBX
004114dd  891d44014300             MOV dword ptr [0x00430144],EBX
004114e3  891d84014300             MOV dword ptr [0x00430184],EBX
004114e9  8b0d60014300             MOV ECX,dword ptr [0x00430160]
004114ef  bb0a000000               MOV EBX,0xa
004114f4  ba18000000               MOV EDX,0x18
004114f9  89f0                     MOV EAX,ESI
004114fb  e872f8ffff               CALL 0x00410d72
00411500  8b0d44014300             MOV ECX,dword ptr [0x00430144]
00411506  8b1d4c014300             MOV EBX,dword ptr [0x0043014c]
0041150c  8b1548014300             MOV EDX,dword ptr [0x00430148]
00411512  89f0                     MOV EAX,ESI
00411514  e859f8ffff               CALL 0x00410d72
00411519  89f0                     MOV EAX,ESI
0041151b  e83df7ffff               CALL 0x00410c5d
00411520  5e                       POP ESI
00411521  5a                       POP EDX
00411522  59                       POP ECX
00411523  5b                       POP EBX
00411524  c3                       RET

; ---- finish_game_and_restart ----
00411525  53                       PUSH EBX
00411526  51                       PUSH ECX
00411527  52                       PUSH EDX
00411528  56                       PUSH ESI
00411529  57                       PUSH EDI
0041152a  55                       PUSH EBP
0041152b  89c6                     MOV ESI,EAX
0041152d  833d8401430000           CMP dword ptr [0x00430184],0x0
00411534  0f847b000000             JZ 0x004115b5
0041153a  ba4c004200               MOV EDX,0x42004c
0041153f  b82c004200               MOV EAX,0x42002c
00411544  e8dfebffff               CALL 0x00410128
00411549  8b3d44014300             MOV EDI,dword ptr [0x00430144]
0041154f  893d60014300             MOV dword ptr [0x00430160],EDI
00411555  ba01000000               MOV EDX,0x1
0041155a  89f0                     MOV EAX,ESI
0041155c  e80afbffff               CALL 0x0041106b
00411561  31ff                     XOR EDI,EDI
00411563  eb1a                     JMP 0x0041157f
00411565  fe0d70014300             DEC byte ptr [0x00430170]
0041156b  31d2                     XOR EDX,EDX
0041156d  89f0                     MOV EAX,ESI
0041156f  e8f7faffff               CALL 0x0041106b
00411574  6896000000               PUSH 0x96
00411579  e84d1c0000               CALL 0x004131cb
0041157e  47                       INC EDI
0041157f  83ff06                   CMP EDI,0x6
00411582  7ce1                     JL 0x00411565
00411584  8b1d6c014300             MOV EBX,dword ptr [0x0043016c]
0041158a  85db                     TEST EBX,EBX
0041158c  7427                     JZ 0x004115b5
0041158e  8d4bfc                   LEA ECX,[EBX + -0x4]
00411591  890d6c014300             MOV dword ptr [0x0043016c],ECX
00411597  85c9                     TEST ECX,ECX
00411599  7d08                     JGE 0x004115a3
0041159b  31ed                     XOR EBP,EBP
0041159d  892d6c014300             MOV dword ptr [0x0043016c],EBP
004115a3  31d2                     XOR EDX,EDX
004115a5  89f0                     MOV EAX,ESI
004115a7  e8bffaffff               CALL 0x0041106b
004115ac  6a0f                     PUSH 0xf
004115ae  e8181c0000               CALL 0x004131cb
004115b3  ebcf                     JMP 0x00411584
004115b5  0fb63d80014300           MOVZX EDI,byte ptr [0x00430180]
004115bc  85ff                     TEST EDI,EDI
004115be  7425                     JZ 0x004115e5
004115c0  31ff                     XOR EDI,EDI
004115c2  eb1c                     JMP 0x004115e0
004115c4  fe0d80014300             DEC byte ptr [0x00430180]
004115ca  31db                     XOR EBX,EBX
004115cc  31d2                     XOR EDX,EDX
004115ce  89f0                     MOV EAX,ESI
004115d0  e8c1fbffff               CALL 0x00411196
004115d5  6896000000               PUSH 0x96
004115da  e8ec1b0000               CALL 0x004131cb
004115df  47                       INC EDI
004115e0  83ff06                   CMP EDI,0x6
004115e3  7cdf                     JL 0x004115c4
004115e5  bd7d000000               MOV EBP,0x7d
004115ea  a17c014300               MOV EAX,[0x0043017c]
004115ef  83f87d                   CMP EAX,0x7d
004115f2  7428                     JZ 0x0041161c
004115f4  8d4804                   LEA ECX,[EAX + 0x4]
004115f7  890d7c014300             MOV dword ptr [0x0043017c],ECX
004115fd  83f97d                   CMP ECX,0x7d
00411600  7e06                     JLE 0x00411608
00411602  892d7c014300             MOV dword ptr [0x0043017c],EBP
00411608  31db                     XOR EBX,EBX
0041160a  31d2                     XOR EDX,EDX
0041160c  89f0                     MOV EAX,ESI
0041160e  e883fbffff               CALL 0x00411196
00411613  6a0f                     PUSH 0xf
00411615  e8b11b0000               CALL 0x004131cb
0041161a  ebce                     JMP 0x004115ea
0041161c  89f0                     MOV EAX,ESI
0041161e  e85efeffff               CALL 0x00411481
00411623  8b1534024300             MOV EDX,dword ptr [0x00430234]
00411629  85d2                     TEST EDX,EDX
0041162b  0f84f5edffff             JZ 0x00410426
00411631  6a00                     PUSH 0x0
00411633  6a00                     PUSH 0x0
00411635  52                       PUSH EDX
00411636  e88a1b0000               CALL 0x004131c5
0041163b  e9e6edffff               JMP 0x00410426

; ---- load_high_scores ----
00411640  53                       PUSH EBX
00411641  51                       PUSH ECX
00411642  52                       PUSH EDX
00411643  56                       PUSH ESI
00411644  57                       PUSH EDI
00411645  55                       PUSH EBP
00411646  83ec04                   SUB ESP,0x4
00411649  6a00                     PUSH 0x0
0041164b  685c004200               PUSH 0x42005c
00411650  e83a1b0000               CALL 0x0041318f
00411655  89c6                     MOV ESI,EAX
00411657  83f8ff                   CMP EAX,-0x1
0041165a  750e                     JNZ 0x0041166a
0041165c  6a00                     PUSH 0x0
0041165e  686c004200               PUSH 0x42006c
00411663  e8271b0000               CALL 0x0041318f
00411668  89c6                     MOV ESI,EAX
0041166a  83feff                   CMP ESI,-0x1
0041166d  744e                     JZ 0x004116bd
0041166f  31db                     XOR EBX,EBX
00411671  eb3d                     JMP 0x004116b0
00411673  6a01                     PUSH 0x1
00411675  8d442404                 LEA EAX,[ESP + 0x4]
00411679  50                       PUSH EAX
0041167a  56                       PUSH ESI
0041167b  e8091b0000               CALL 0x00413189
00411680  6a0d                     PUSH 0xd
00411682  89df                     MOV EDI,EBX
00411684  c1e704                   SHL EDI,0x4
00411687  bd88014300               MOV EBP,0x430188
0041168c  01fd                     ADD EBP,EDI
0041168e  55                       PUSH EBP
0041168f  56                       PUSH ESI
00411690  e8f41a0000               CALL 0x00413189
00411695  31c0                     XOR EAX,EAX
00411697  8a0424                   MOV AL,byte ptr [ESP]
0041169a  30d2                     XOR DL,DL
0041169c  88940788014300           MOV byte ptr [EDI + EAX*0x1 + 0x430188],DL
004116a3  6a02                     PUSH 0x2
004116a5  83c50e                   ADD EBP,0xe
004116a8  55                       PUSH EBP
004116a9  56                       PUSH ESI
004116aa  e8da1a0000               CALL 0x00413189
004116af  43                       INC EBX
004116b0  83fb0a                   CMP EBX,0xa
004116b3  7cbe                     JL 0x00411673
004116b5  56                       PUSH ESI
004116b6  e8c81a0000               CALL 0x00413183
004116bb  eb44                     JMP 0x00411701
004116bd  bac78c4200               MOV EDX,0x428cc7
004116c2  b888014300               MOV EAX,0x430188
004116c7  e85ceaffff               CALL 0x00410128
004116cc  66c705960143006400       MOV word ptr [0x00430196],0x64
004116d5  bb01000000               MOV EBX,0x1
004116da  eb20                     JMP 0x004116fc
004116dc  89d9                     MOV ECX,EBX
004116de  c1e104                   SHL ECX,0x4
004116e1  b888014300               MOV EAX,0x430188
004116e6  01c8                     ADD EAX,ECX
004116e8  bad08c4200               MOV EDX,0x428cd0
004116ed  e836eaffff               CALL 0x00410128
004116f2  31f6                     XOR ESI,ESI
004116f4  6689b196014300           MOV word ptr [ECX + 0x430196],SI
004116fb  43                       INC EBX
004116fc  83fb0a                   CMP EBX,0xa
004116ff  7cdb                     JL 0x004116dc
00411701  31c0                     XOR EAX,EAX
00411703  66a196014300             MOV AX,[0x00430196]
00411709  a360014300               MOV [0x00430160],EAX
0041170e  ba88014300               MOV EDX,0x430188
00411713  b82c004200               MOV EAX,0x42002c
00411718  e80beaffff               CALL 0x00410128
0041171d  31d2                     XOR EDX,EDX
0041171f  891528024300             MOV dword ptr [0x00430228],EDX
00411725  83c404                   ADD ESP,0x4
00411728  e9f9ecffff               JMP 0x00410426

; ---- save_high_scores ----
0041172d  53                       PUSH EBX
0041172e  51                       PUSH ECX
0041172f  52                       PUSH EDX
00411730  56                       PUSH ESI
00411731  57                       PUSH EDI
00411732  83ec04                   SUB ESP,0x4
00411735  833d2802430000           CMP dword ptr [0x00430228],0x0
0041173c  0f847b000000             JZ 0x004117bd
00411742  6a01                     PUSH 0x1
00411744  685c004200               PUSH 0x42005c
00411749  e8411a0000               CALL 0x0041318f
0041174e  89c7                     MOV EDI,EAX
00411750  83f8ff                   CMP EAX,-0x1
00411753  750e                     JNZ 0x00411763
00411755  6a01                     PUSH 0x1
00411757  686c004200               PUSH 0x42006c
0041175c  e82e1a0000               CALL 0x0041318f
00411761  89c7                     MOV EDI,EAX
00411763  83ffff                   CMP EDI,-0x1
00411766  750e                     JNZ 0x00411776
00411768  6a00                     PUSH 0x0
0041176a  685c004200               PUSH 0x42005c
0041176f  e8091a0000               CALL 0x0041317d
00411774  89c7                     MOV EDI,EAX
00411776  31f6                     XOR ESI,ESI
00411778  eb38                     JMP 0x004117b2
0041177a  89f3                     MOV EBX,ESI
0041177c  c1e304                   SHL EBX,0x4
0041177f  81c388014300             ADD EBX,0x430188
00411785  89d8                     MOV EAX,EBX
00411787  e85de9ffff               CALL 0x004100e9
0041178c  880424                   MOV byte ptr [ESP],AL
0041178f  6a01                     PUSH 0x1
00411791  8d442404                 LEA EAX,[ESP + 0x4]
00411795  50                       PUSH EAX
00411796  57                       PUSH EDI
00411797  e8db190000               CALL 0x00413177
0041179c  6a0d                     PUSH 0xd
0041179e  53                       PUSH EBX
0041179f  57                       PUSH EDI
004117a0  e8d2190000               CALL 0x00413177
004117a5  6a02                     PUSH 0x2
004117a7  83c30e                   ADD EBX,0xe
004117aa  53                       PUSH EBX
004117ab  57                       PUSH EDI
004117ac  e8c6190000               CALL 0x00413177
004117b1  46                       INC ESI
004117b2  83fe0a                   CMP ESI,0xa
004117b5  7cc3                     JL 0x0041177a
004117b7  57                       PUSH EDI
004117b8  e8c6190000               CALL 0x00413183
004117bd  83c404                   ADD ESP,0x4
004117c0  e962ecffff               JMP 0x00410427

; ---- record_high_score ----
004117c5  53                       PUSH EBX
004117c6  51                       PUSH ECX
004117c7  52                       PUSH EDX
004117c8  56                       PUSH ESI
004117c9  57                       PUSH EDI
004117ca  55                       PUSH EBP
004117cb  89c5                     MOV EBP,EAX
004117cd  31db                     XOR EBX,EBX
004117cf  8b1544014300             MOV EDX,dword ptr [0x00430144]
004117d5  eb01                     JMP 0x004117d8
004117d7  43                       INC EBX
004117d8  83fb0a                   CMP EBX,0xa
004117db  7d15                     JGE 0x004117f2
004117dd  89d8                     MOV EAX,EBX
004117df  c1e004                   SHL EAX,0x4
004117e2  668b8096014300           MOV AX,word ptr [EAX + 0x430196]
004117e9  25ffff0000               AND EAX,0xffff
004117ee  39d0                     CMP EAX,EDX
004117f0  7de5                     JGE 0x004117d7
004117f2  83fb0a                   CMP EBX,0xa
004117f5  0f842becffff             JZ 0x00410426
004117fb  c7052802430001000000     MOV dword ptr [0x00430228],0x1
00411805  b809000000               MOV EAX,0x9
0041180a  eb16                     JMP 0x00411822
0041180c  89c6                     MOV ESI,EAX
0041180e  c1e604                   SHL ESI,0x4
00411811  8dbe88014300             LEA EDI,[ESI + 0x430188]
00411817  8db678014300             LEA ESI,[ESI + 0x430178]
0041181d  a5                       MOVSD ES:EDI,ESI
0041181e  a5                       MOVSD ES:EDI,ESI
0041181f  a5                       MOVSD ES:EDI,ESI
00411820  a5                       MOVSD ES:EDI,ESI
00411821  48                       DEC EAX
00411822  39d8                     CMP EAX,EBX
00411824  75e6                     JNZ 0x0041180c
00411826  6a00                     PUSH 0x0
00411828  6854244100               PUSH 0x412454
0041182d  55                       PUSH EBP
0041182e  68ea030000               PUSH 0x3ea
00411833  8b3528004300             MOV ESI,dword ptr [0x00430028]
00411839  56                       PUSH ESI
0041183a  e832190000               CALL 0x00413171
0041183f  c1e304                   SHL EBX,0x4
00411842  b888014300               MOV EAX,0x430188
00411847  01d8                     ADD EAX,EBX
00411849  ba4c004200               MOV EDX,0x42004c
0041184e  e8d5e8ffff               CALL 0x00410128
00411853  66a144014300             MOV AX,[0x00430144]
00411859  66898396014300           MOV word ptr [EBX + 0x430196],AX
00411860  6a00                     PUSH 0x0
00411862  6879224100               PUSH 0x412279
00411867  55                       PUSH EBP
00411868  68e9030000               PUSH 0x3e9
0041186d  8b3d28004300             MOV EDI,dword ptr [0x00430028]
00411873  57                       PUSH EDI
00411874  e8f8180000               CALL 0x00413171
00411879  e9a8ebffff               JMP 0x00410426

; ---- WndProc ----
0041187e  53                       PUSH EBX
0041187f  56                       PUSH ESI
00411880  57                       PUSH EDI
00411881  55                       PUSH EBP
00411882  83ec68                   SUB ESP,0x68
00411885  8b9c2480000000           MOV EBX,dword ptr [ESP + 0x80]
0041188c  8bb42488000000           MOV ESI,dword ptr [ESP + 0x88]
00411893  8b54247c                 MOV EDX,dword ptr [ESP + 0x7c]
00411897  52                       PUSH EDX
00411898  e8ce180000               CALL 0x0041316b
0041189d  85c0                     TEST EAX,EAX
0041189f  0f850c000000             JNZ 0x004118b1
004118a5  8b4c247c                 MOV ECX,dword ptr [ESP + 0x7c]
004118a9  51                       PUSH ECX
004118aa  e8b6180000               CALL 0x00413165
004118af  89c7                     MOV EDI,EAX
004118b1  83fb24                   CMP EBX,0x24
004118b4  0f82c5080000             JC 0x0041217f
004118ba  0f8642070000             JBE 0x00412002
004118c0  81fb13010000             CMP EBX,0x113
004118c6  0f82a2080000             JC 0x0041216e
004118cc  0f863e050000             JBE 0x00411e10
004118d2  81fb01020000             CMP EBX,0x201
004118d8  0f8222000000             JC 0x00411900
004118de  89f0                     MOV EAX,ESI
004118e0  c1e810                   SHR EAX,0x10
004118e3  25ffff0000               AND EAX,0xffff
004118e8  81fb01020000             CMP EBX,0x201
004118ee  0f861e020000             JBE 0x00411b12
004118f4  81fb02020000             CMP EBX,0x202
004118fa  0f8448020000             JZ 0x00411b48
00411900  56                       PUSH ESI
00411901  8b8c2488000000           MOV ECX,dword ptr [ESP + 0x88]
00411908  51                       PUSH ECX
00411909  53                       PUSH EBX
0041190a  8bb42488000000           MOV ESI,dword ptr [ESP + 0x88]
00411911  56                       PUSH ESI
00411912  e848180000               CALL 0x0041315f
00411917  e968010000               JMP 0x00411a84
0041191c  bb3c004300               MOV EBX,0x43003c
00411921  ba38004300               MOV EDX,0x430038
00411926  8d4c2450                 LEA ECX,[ESP + 0x50]
0041192a  89f8                     MOV EAX,EDI
0041192c  e81f110000               CALL 0x00412a50
00411931  8b442450                 MOV EAX,dword ptr [ESP + 0x50]
00411935  a304004300               MOV [0x00430004],EAX
0041193a  8b442454                 MOV EAX,dword ptr [ESP + 0x54]
0041193e  a308004300               MOV [0x00430008],EAX
00411943  57                       PUSH EDI
00411944  e810180000               CALL 0x00413159
00411949  a330024300               MOV [0x00430230],EAX
0041194e  8b2d38004300             MOV EBP,dword ptr [0x00430038]
00411954  55                       PUSH EBP
00411955  50                       PUSH EAX
00411956  e88e180000               CALL 0x004131e9
0041195b  a32c024300               MOV [0x0043022c],EAX
00411960  e8dbfcffff               CALL 0x00411640
00411965  6a00                     PUSH 0x0
00411967  6a32                     PUSH 0x32
00411969  6800100000               PUSH 0x1000
0041196e  8b842488000000           MOV EAX,dword ptr [ESP + 0x88]
00411975  50                       PUSH EAX
00411976  e8d8170000               CALL 0x00413153
0041197b  31d2                     XOR EDX,EDX
0041197d  89150c004300             MOV dword ptr [0x0043000c],EDX
00411983  891510004300             MOV dword ptr [0x00430010],EDX
00411989  8d442440                 LEA EAX,[ESP + 0x40]
0041198d  50                       PUSH EAX
0041198e  8b8c2480000000           MOV ECX,dword ptr [ESP + 0x80]
00411995  51                       PUSH ECX
00411996  e800180000               CALL 0x0041319b
0041199b  8b442448                 MOV EAX,dword ptr [ESP + 0x48]
0041199f  83e860                   SUB EAX,0x60
004119a2  a348014300               MOV [0x00430148],EAX
004119a7  c7054c0143000a000000     MOV dword ptr [0x0043014c],0xa
004119b1  8b542448                 MOV EDX,dword ptr [ESP + 0x48]
004119b5  83ea6c                   SUB EDX,0x6c
004119b8  89d0                     MOV EAX,EDX
004119ba  c1fa1f                   SAR EDX,0x1f
004119bd  2bc2                     SUB EAX,EDX
004119bf  d1f8                     SAR EAX,0x1
004119c1  a354014300               MOV [0x00430154],EAX
004119c6  c7055801430005000000     MOV dword ptr [0x00430158],0x5
004119d0  c6055c01430001           MOV byte ptr [0x0043015c],0x1
004119d7  8b542448                 MOV EDX,dword ptr [ESP + 0x48]
004119db  81ea48010000             SUB EDX,0x148
004119e1  89d0                     MOV EAX,EDX
004119e3  c1fa1f                   SAR EDX,0x1f
004119e6  2bc2                     SUB EAX,EDX
004119e8  d1f8                     SAR EAX,0x1
004119ea  8d50c6                   LEA EDX,[EAX + -0x3a]
004119ed  89d0                     MOV EAX,EDX
004119ef  c1fa1f                   SAR EDX,0x1f
004119f2  2bc2                     SUB EAX,EDX
004119f4  d1f8                     SAR EAX,0x1
004119f6  a364014300               MOV [0x00430164],EAX
004119fb  8b54244c                 MOV EDX,dword ptr [ESP + 0x4c]
004119ff  81eaea000000             SUB EDX,0xea
00411a05  89d0                     MOV EAX,EDX
00411a07  c1fa1f                   SAR EDX,0x1f
00411a0a  2bc2                     SUB EAX,EDX
00411a0c  d1f8                     SAR EAX,0x1
00411a0e  05ea000000               ADD EAX,0xea
00411a13  a368014300               MOV [0x00430168],EAX
00411a18  31c0                     XOR EAX,EAX
00411a1a  a36c014300               MOV [0x0043016c],EAX
00411a1f  30c0                     XOR AL,AL
00411a21  a270014300               MOV [0x00430170],AL
00411a26  8b542448                 MOV EDX,dword ptr [ESP + 0x48]
00411a2a  81ea48010000             SUB EDX,0x148
00411a30  89d0                     MOV EAX,EDX
00411a32  c1fa1f                   SAR EDX,0x1f
00411a35  2bc2                     SUB EAX,EDX
00411a37  d1f8                     SAR EAX,0x1
00411a39  89c5                     MOV EBP,EAX
00411a3b  8d50c6                   LEA EDX,[EAX + -0x3a]
00411a3e  89d0                     MOV EAX,EDX
00411a40  c1fa1f                   SAR EDX,0x1f
00411a43  2bc2                     SUB EAX,EDX
00411a45  d1f8                     SAR EAX,0x1
00411a47  81c548010000             ADD EBP,0x148
00411a4d  01c5                     ADD EBP,EAX
00411a4f  892d74014300             MOV dword ptr [0x00430174],EBP
00411a55  a168014300               MOV EAX,[0x00430168]
00411a5a  a378014300               MOV [0x00430178],EAX
00411a5f  c7057c0143007d000000     MOV dword ptr [0x0043017c],0x7d
00411a69  30e4                     XOR AH,AH
00411a6b  882580014300             MOV byte ptr [0x00430180],AH
00411a71  e8d7160000               CALL 0x0041314d
00411a76  e8f6e6ffff               CALL 0x00410171
00411a7b  89f8                     MOV EAX,EDI
00411a7d  e8fff9ffff               CALL 0x00411481
00411a82  31c0                     XOR EAX,EAX
00411a84  83c468                   ADD ESP,0x68
00411a87  e966e8ffff               JMP 0x004102f2
00411a8c  8b74247c                 MOV ESI,dword ptr [ESP + 0x7c]
00411a90  56                       PUSH ESI
00411a91  e8d5160000               CALL 0x0041316b
00411a96  85c0                     TEST EAX,EAX
00411a98  75e8                     JNZ 0x00411a82
00411a9a  89e0                     MOV EAX,ESP
00411a9c  50                       PUSH EAX
00411a9d  56                       PUSH ESI
00411a9e  e8a4160000               CALL 0x00413147
00411aa3  89c7                     MOV EDI,EAX
00411aa5  6a00                     PUSH 0x0
00411aa7  8b2d3c004300             MOV EBP,dword ptr [0x0043003c]
00411aad  55                       PUSH EBP
00411aae  50                       PUSH EAX
00411aaf  e88d160000               CALL 0x00413141
00411ab4  57                       PUSH EDI
00411ab5  e881160000               CALL 0x0041313b
00411aba  89f8                     MOV EAX,EDI
00411abc  e838e8ffff               CALL 0x004102f9
00411ac1  89fa                     MOV EDX,EDI
00411ac3  89f0                     MOV EAX,ESI
00411ac5  e890f3ffff               CALL 0x00410e5a
00411aca  8b0d44014300             MOV ECX,dword ptr [0x00430144]
00411ad0  8b1d4c014300             MOV EBX,dword ptr [0x0043014c]
00411ad6  8b1548014300             MOV EDX,dword ptr [0x00430148]
00411adc  89f8                     MOV EAX,EDI
00411ade  e88ff2ffff               CALL 0x00410d72
00411ae3  89f8                     MOV EAX,EDI
00411ae5  e873f1ffff               CALL 0x00410c5d
00411aea  ba01000000               MOV EDX,0x1
00411aef  89f8                     MOV EAX,EDI
00411af1  e875f5ffff               CALL 0x0041106b
00411af6  bb01000000               MOV EBX,0x1
00411afb  89da                     MOV EDX,EBX
00411afd  89f8                     MOV EAX,EDI
00411aff  e892f6ffff               CALL 0x00411196
00411b04  89e0                     MOV EAX,ESP
00411b06  50                       PUSH EAX
00411b07  56                       PUSH ESI
00411b08  e828160000               CALL 0x00413135
00411b0d  e970ffffff               JMP 0x00411a82
00411b12  31d2                     XOR EDX,EDX
00411b14  6689c2                   MOV DX,AX
00411b17  31c0                     XOR EAX,EAX
00411b19  6689f0                   MOV AX,SI
00411b1c  b920004300               MOV ECX,0x430020
00411b21  bb1c004300               MOV EBX,0x43001c
00411b26  e876ecffff               CALL 0x004107a1
00411b2b  85c0                     TEST EAX,EAX
00411b2d  750c                     JNZ 0x00411b3b
00411b2f  c6052400430001           MOV byte ptr [0x00430024],0x1
00411b36  e947ffffff               JMP 0x00411a82
00411b3b  30db                     XOR BL,BL
00411b3d  881d24004300             MOV byte ptr [0x00430024],BL
00411b43  e93affffff               JMP 0x00411a82
00411b48  31d2                     XOR EDX,EDX
00411b4a  6689c2                   MOV DX,AX
00411b4d  31c0                     XOR EAX,EAX
00411b4f  6689f0                   MOV AX,SI
00411b52  8d4c245c                 LEA ECX,[ESP + 0x5c]
00411b56  8d5c2458                 LEA EBX,[ESP + 0x58]
00411b5a  e842ecffff               CALL 0x004107a1
00411b5f  85c0                     TEST EAX,EAX
00411b61  0f841bffffff             JZ 0x00411a82
00411b67  803d2400430000           CMP byte ptr [0x00430024],0x0
00411b6e  0f850effffff             JNZ 0x00411a82
00411b74  a11c004300               MOV EAX,[0x0043001c]
00411b79  8b742458                 MOV ESI,dword ptr [ESP + 0x58]
00411b7d  39f0                     CMP EAX,ESI
00411b7f  0f85fdfeffff             JNZ 0x00411a82
00411b85  a120004300               MOV EAX,[0x00430020]
00411b8a  8b6c245c                 MOV EBP,dword ptr [ESP + 0x5c]
00411b8e  39e8                     CMP EAX,EBP
00411b90  0f85ecfeffff             JNZ 0x00411a82
00411b96  c1e003                   SHL EAX,0x3
00411b99  01e8                     ADD EAX,EBP
00411b9b  01f0                     ADD EAX,ESI
00411b9d  8b1d10004300             MOV EBX,dword ptr [0x00430010]
00411ba3  85db                     TEST EBX,EBX
00411ba5  753c                     JNZ 0x00411be3
00411ba7  8a8040004300             MOV AL,byte ptr [EAX + 0x430040]
00411bad  25ff000000               AND EAX,0xff
00411bb2  0f84cafeffff             JZ 0x00411a82
00411bb8  c7051000430001000000     MOV dword ptr [0x00430010],0x1
00411bc2  8a442458                 MOV AL,byte ptr [ESP + 0x58]
00411bc6  a241014300               MOV [0x00430141],AL
00411bcb  8a44245c                 MOV AL,byte ptr [ESP + 0x5c]
00411bcf  a242014300               MOV [0x00430142],AL
00411bd4  c7050c00430003000000     MOV dword ptr [0x0043000c],0x3
00411bde  e99ffeffff               JMP 0x00411a82
00411be3  83fb01                   CMP EBX,0x1
00411be6  0f8596feffff             JNZ 0x00411a82
00411bec  8a8040004300             MOV AL,byte ptr [EAX + 0x430040]
00411bf2  25ff000000               AND EAX,0xff
00411bf7  7437                     JZ 0x00411c30
00411bf9  31db                     XOR EBX,EBX
00411bfb  8a1d42014300             MOV BL,byte ptr [0x00430142]
00411c01  31d2                     XOR EDX,EDX
00411c03  8a1541014300             MOV DL,byte ptr [0x00430141]
00411c09  31c9                     XOR ECX,ECX
00411c0b  89f8                     MOV EAX,EDI
00411c0d  e81be8ffff               CALL 0x0041042d
00411c12  8a442458                 MOV AL,byte ptr [ESP + 0x58]
00411c16  a241014300               MOV [0x00430141],AL
00411c1b  8a44245c                 MOV AL,byte ptr [ESP + 0x5c]
00411c1f  a242014300               MOV [0x00430142],AL
00411c24  800d0c00430003           OR byte ptr [0x0043000c],0x3
00411c2b  e952feffff               JMP 0x00411a82
00411c30  31d2                     XOR EDX,EDX
00411c32  8a1542014300             MOV DL,byte ptr [0x00430142]
00411c38  89d0                     MOV EAX,EDX
00411c3a  c1e003                   SHL EAX,0x3
00411c3d  8d1c02                   LEA EBX,[EDX + EAX*0x1]
00411c40  31c0                     XOR EAX,EAX
00411c42  a041014300               MOV AL,[0x00430141]
00411c47  8a9c0340004300           MOV BL,byte ptr [EBX + EAX*0x1 + 0x430040]
00411c4e  81e3ff000000             AND EBX,0xff
00411c54  891d18004300             MOV dword ptr [0x00430018],EBX
00411c5a  31c9                     XOR ECX,ECX
00411c5c  8a4c245c                 MOV CL,byte ptr [ESP + 0x5c]
00411c60  31db                     XOR EBX,EBX
00411c62  8a5c2458                 MOV BL,byte ptr [ESP + 0x58]
00411c66  e859e8ffff               CALL 0x004104c4
00411c6b  85c0                     TEST EAX,EAX
00411c6d  750c                     JNZ 0x00411c7b
00411c6f  6a40                     PUSH 0x40
00411c71  e8b9140000               CALL 0x0041312f
00411c76  e907feffff               JMP 0x00411a82
00411c7b  31f6                     XOR ESI,ESI
00411c7d  893510004300             MOV dword ptr [0x00430010],ESI
00411c83  31ed                     XOR EBP,EBP
00411c85  eb79                     JMP 0x00411d00
00411c87  8d442d00                 LEA EAX,[EBP + EBP*0x1]
00411c8b  89442460                 MOV dword ptr [ESP + 0x60],EAX
00411c8f  31db                     XOR EBX,EBX
00411c91  8a9894004300             MOV BL,byte ptr [EAX + 0x430094]
00411c97  89da                     MOV EDX,EBX
00411c99  89d8                     MOV EAX,EBX
00411c9b  c1e003                   SHL EAX,0x3
00411c9e  01d8                     ADD EAX,EBX
00411ca0  31da                     XOR EDX,EBX
00411ca2  8b4c2460                 MOV ECX,dword ptr [ESP + 0x60]
00411ca6  8a9195004300             MOV DL,byte ptr [ECX + 0x430095]
00411cac  30c9                     XOR CL,CL
00411cae  888c0240004300           MOV byte ptr [EDX + EAX*0x1 + 0x430040],CL
00411cb5  31c9                     XOR ECX,ECX
00411cb7  89f8                     MOV EAX,EDI
00411cb9  e86fe7ffff               CALL 0x0041042d
00411cbe  31db                     XOR EBX,EBX
00411cc0  8b442460                 MOV EAX,dword ptr [ESP + 0x60]
00411cc4  8a9896004300             MOV BL,byte ptr [EAX + 0x430096]
00411cca  89da                     MOV EDX,EBX
00411ccc  89d8                     MOV EAX,EBX
00411cce  c1e003                   SHL EAX,0x3
00411cd1  01d8                     ADD EAX,EBX
00411cd3  31da                     XOR EDX,EBX
00411cd5  8b4c2460                 MOV ECX,dword ptr [ESP + 0x60]
00411cd9  8a9197004300             MOV DL,byte ptr [ECX + 0x430097]
00411cdf  8a0d18004300             MOV CL,byte ptr [0x00430018]
00411ce5  888c0240004300           MOV byte ptr [EDX + EAX*0x1 + 0x430040],CL
00411cec  8b4c2464                 MOV ECX,dword ptr [ESP + 0x64]
00411cf0  89f8                     MOV EAX,EDI
00411cf2  e836e7ffff               CALL 0x0041042d
00411cf7  6a32                     PUSH 0x32
00411cf9  46                       INC ESI
00411cfa  e8cc140000               CALL 0x004131cb
00411cff  45                       INC EBP
00411d00  31c0                     XOR EAX,EAX
00411d02  a036014300               MOV AL,[0x00430136]
00411d07  8d48ff                   LEA ECX,[EAX + -0x1]
00411d0a  bb06000000               MOV EBX,0x6
00411d0f  89f0                     MOV EAX,ESI
00411d11  89f2                     MOV EDX,ESI
00411d13  c1fa1f                   SAR EDX,0x1f
00411d16  f7fb                     IDIV EBX
00411d18  89542464                 MOV dword ptr [ESP + 0x64],EDX
00411d1c  39cd                     CMP EBP,ECX
00411d1e  0f8c63ffffff             JL 0x00411c87
00411d24  85d2                     TEST EDX,EDX
00411d26  7441                     JZ 0x00411d69
00411d28  bb06000000               MOV EBX,0x6
00411d2d  89f0                     MOV EAX,ESI
00411d2f  89f2                     MOV EDX,ESI
00411d31  c1fa1f                   SAR EDX,0x1f
00411d34  f7fb                     IDIV EBX
00411d36  31db                     XOR EBX,EBX
00411d38  8a1c6d94004300           MOV BL,byte ptr [EBP*0x2 + 0x430094]
00411d3f  8a046d95004300           MOV AL,byte ptr [EBP*0x2 + 0x430095]
00411d46  25ff000000               AND EAX,0xff
00411d4b  89d1                     MOV ECX,EDX
00411d4d  89c2                     MOV EDX,EAX
00411d4f  89f8                     MOV EAX,EDI
00411d51  e8d7e6ffff               CALL 0x0041042d
00411d56  46                       INC ESI
00411d57  bb06000000               MOV EBX,0x6
00411d5c  89f0                     MOV EAX,ESI
00411d5e  89f2                     MOV EDX,ESI
00411d60  c1fa1f                   SAR EDX,0x1f
00411d63  f7fb                     IDIV EBX
00411d65  85d2                     TEST EDX,EDX
00411d67  75bf                     JNZ 0x00411d28
00411d69  31db                     XOR EBX,EBX
00411d6b  8a1d18004300             MOV BL,byte ptr [0x00430018]
00411d71  31d2                     XOR EDX,EDX
00411d73  8a146d94004300           MOV DL,byte ptr [EBP*0x2 + 0x430094]
00411d7a  31c0                     XOR EAX,EAX
00411d7c  8a046d95004300           MOV AL,byte ptr [EBP*0x2 + 0x430095]
00411d83  e864eaffff               CALL 0x004107ec
00411d88  89c5                     MOV EBP,EAX
00411d8a  85c0                     TEST EAX,EAX
00411d8c  7424                     JZ 0x00411db2
00411d8e  89f8                     MOV EAX,EDI
00411d90  e8e1ebffff               CALL 0x00410976
00411d95  89e8                     MOV EAX,EBP
00411d97  e82aeeffff               CALL 0x00410bc6
00411d9c  89c2                     MOV EDX,EAX
00411d9e  89f8                     MOV EAX,EDI
00411da0  e86ef5ffff               CALL 0x00411313
00411da5  e9d8fcffff               JMP 0x00411a82
00411daa  89f8                     MOV EAX,EDI
00411dac  e8c0ecffff               CALL 0x00410a71
00411db1  45                       INC EBP
00411db2  83fd03                   CMP EBP,0x3
00411db5  7cf3                     JL 0x00411daa
00411db7  e87eecffff               CALL 0x00410a3a
00411dbc  85c0                     TEST EAX,EAX
00411dbe  752c                     JNZ 0x00411dec
00411dc0  6a30                     PUSH 0x30
00411dc2  6890004200               PUSH 0x420090
00411dc7  68da8c4200               PUSH 0x428cda
00411dcc  8bac2488000000           MOV EBP,dword ptr [ESP + 0x88]
00411dd3  55                       PUSH EBP
00411dd4  e8e6130000               CALL 0x004131bf
00411dd9  89e8                     MOV EAX,EBP
00411ddb  e8e5f9ffff               CALL 0x004117c5
00411de0  89f8                     MOV EAX,EDI
00411de2  e83ef7ffff               CALL 0x00411525
00411de7  e996fcffff               JMP 0x00411a82
00411dec  89f8                     MOV EAX,EDI
00411dee  e86aeeffff               CALL 0x00410c5d
00411df3  8b0d34024300             MOV ECX,dword ptr [0x00430234]
00411df9  85c9                     TEST ECX,ECX
00411dfb  0f8481fcffff             JZ 0x00411a82
00411e01  6a00                     PUSH 0x0
00411e03  6a00                     PUSH 0x0
00411e05  51                       PUSH ECX
00411e06  e8ba130000               CALL 0x004131c5
00411e0b  e972fcffff               JMP 0x00411a82
00411e10  8b44247c                 MOV EAX,dword ptr [ESP + 0x7c]
00411e14  50                       PUSH EAX
00411e15  ff050c004300             INC dword ptr [0x0043000c]
00411e1b  e84b130000               CALL 0x0041316b
00411e20  85c0                     TEST EAX,EAX
00411e22  0f855afcffff             JNZ 0x00411a82
00411e28  833d1000430001           CMP dword ptr [0x00430010],0x1
00411e2f  0f854dfcffff             JNZ 0x00411a82
00411e35  bb06000000               MOV EBX,0x6
00411e3a  a10c004300               MOV EAX,[0x0043000c]
00411e3f  89c2                     MOV EDX,EAX
00411e41  c1fa1f                   SAR EDX,0x1f
00411e44  f7fb                     IDIV EBX
00411e46  31db                     XOR EBX,EBX
00411e48  8a1d42014300             MOV BL,byte ptr [0x00430142]
00411e4e  31c0                     XOR EAX,EAX
00411e50  a041014300               MOV AL,[0x00430141]
00411e55  89d1                     MOV ECX,EDX
00411e57  89c2                     MOV EDX,EAX
00411e59  89f8                     MOV EAX,EDI
00411e5b  e8cde5ffff               CALL 0x0041042d
00411e60  e91dfcffff               JMP 0x00411a82
00411e65  31c9                     XOR ECX,ECX
00411e67  890d10004300             MOV dword ptr [0x00430010],ECX
00411e6d  8b44247c                 MOV EAX,dword ptr [ESP + 0x7c]
00411e71  e965ffffff               JMP 0x00411ddb
00411e76  6a00                     PUSH 0x0
00411e78  b879224100               MOV EAX,0x412279
00411e7d  50                       PUSH EAX
00411e7e  8b942484000000           MOV EDX,dword ptr [ESP + 0x84]
00411e85  52                       PUSH EDX
00411e86  68e9030000               PUSH 0x3e9
00411e8b  8b1d28004300             MOV EBX,dword ptr [0x00430028]
00411e91  53                       PUSH EBX
00411e92  e8da120000               CALL 0x00413171
00411e97  e9e6fbffff               JMP 0x00411a82
00411e9c  8b44247c                 MOV EAX,dword ptr [ESP + 0x7c]
00411ea0  50                       PUSH EAX
00411ea1  e883120000               CALL 0x00413129
00411ea6  e9d7fbffff               JMP 0x00411a82
00411eab  8a0d5c014300             MOV CL,byte ptr [0x0043015c]
00411eb1  80f101                   XOR CL,0x1
00411eb4  880d5c014300             MOV byte ptr [0x0043015c],CL
00411eba  31c0                     XOR EAX,EAX
00411ebc  88c8                     MOV AL,CL
00411ebe  c1e003                   SHL EAX,0x3
00411ec1  50                       PUSH EAX
00411ec2  6800020000               PUSH 0x200
00411ec7  8bac2484000000           MOV EBP,dword ptr [ESP + 0x84]
00411ece  55                       PUSH EBP
00411ecf  e84f120000               CALL 0x00413123
00411ed4  50                       PUSH EAX
00411ed5  e843120000               CALL 0x0041311d
00411eda  89f8                     MOV EAX,EDI
00411edc  e87cedffff               CALL 0x00410c5d
00411ee1  e99cfbffff               JMP 0x00411a82
00411ee6  8a3d38024300             MOV BH,byte ptr [0x00430238]
00411eec  80f701                   XOR BH,0x1
00411eef  883d38024300             MOV byte ptr [0x00430238],BH
00411ef5  31c0                     XOR EAX,EAX
00411ef7  88f8                     MOV AL,BH
00411ef9  85c0                     TEST EAX,EAX
00411efb  7516                     JNZ 0x00411f13
00411efd  8b1d34024300             MOV EBX,dword ptr [0x00430234]
00411f03  53                       PUSH EBX
00411f04  e820120000               CALL 0x00413129
00411f09  31c9                     XOR ECX,ECX
00411f0b  890d34024300             MOV dword ptr [0x00430234],ECX
00411f11  eb26                     JMP 0x00411f39
00411f13  6a00                     PUSH 0x0
00411f15  b87c274100               MOV EAX,0x41277c
00411f1a  50                       PUSH EAX
00411f1b  8b842484000000           MOV EAX,dword ptr [ESP + 0x84]
00411f22  50                       PUSH EAX
00411f23  68ec030000               PUSH 0x3ec
00411f28  8b1528004300             MOV EDX,dword ptr [0x00430028]
00411f2e  52                       PUSH EDX
00411f2f  e8e3110000               CALL 0x00413117
00411f34  a334024300               MOV [0x00430234],EAX
00411f39  31c0                     XOR EAX,EAX
00411f3b  a038024300               MOV AL,[0x00430238]
00411f40  c1e003                   SHL EAX,0x3
00411f43  50                       PUSH EAX
00411f44  6801020000               PUSH 0x201
00411f49  8bb42484000000           MOV ESI,dword ptr [ESP + 0x84]
00411f50  56                       PUSH ESI
00411f51  e8cd110000               CALL 0x00413123
00411f56  50                       PUSH EAX
00411f57  e8c1110000               CALL 0x0041311d
00411f5c  e921fbffff               JMP 0x00411a82
00411f61  6a00                     PUSH 0x0
00411f63  b8b5214100               MOV EAX,0x4121b5
00411f68  50                       PUSH EAX
00411f69  8bbc2484000000           MOV EDI,dword ptr [ESP + 0x84]
00411f70  57                       PUSH EDI
00411f71  68e8030000               PUSH 0x3e8
00411f76  8b2d28004300             MOV EBP,dword ptr [0x00430028]
00411f7c  55                       PUSH EBP
00411f7d  e910ffffff               JMP 0x00411e92
00411f82  6a00                     PUSH 0x0
00411f84  b80f264100               MOV EAX,0x41260f
00411f89  50                       PUSH EAX
00411f8a  8b8c2484000000           MOV ECX,dword ptr [ESP + 0x84]
00411f91  51                       PUSH ECX
00411f92  68eb030000               PUSH 0x3eb
00411f97  8b3528004300             MOV ESI,dword ptr [0x00430028]
00411f9d  56                       PUSH ESI
00411f9e  e9effeffff               JMP 0x00411e92
00411fa3  8b842484000000           MOV EAX,dword ptr [ESP + 0x84]
00411faa  663d0002                 CMP AX,0x200
00411fae  7228                     JC 0x00411fd8
00411fb0  0f86f5feffff             JBE 0x00411eab
00411fb6  663d0003                 CMP AX,0x300
00411fba  720d                     JC 0x00411fc9
00411fbc  76a3                     JBE 0x00411f61
00411fbe  663d0103                 CMP AX,0x301
00411fc2  74be                     JZ 0x00411f82
00411fc4  e9b9faffff               JMP 0x00411a82
00411fc9  663d0102                 CMP AX,0x201
00411fcd  0f8413ffffff             JZ 0x00411ee6
00411fd3  e9aafaffff               JMP 0x00411a82
00411fd8  663d0101                 CMP AX,0x101
00411fdc  7215                     JC 0x00411ff3
00411fde  0f8692feffff             JBE 0x00411e76
00411fe4  663d0201                 CMP AX,0x102
00411fe8  0f84aefeffff             JZ 0x00411e9c
00411fee  e98ffaffff               JMP 0x00411a82
00411ff3  663d0001                 CMP AX,0x100
00411ff7  0f8468feffff             JZ 0x00411e65
00411ffd  e980faffff               JMP 0x00411a82
00412002  c746186c020000           MOV dword ptr [ESI + 0x18],0x26c
00412009  c7461ca4010000           MOV dword ptr [ESI + 0x1c],0x1a4
00412010  e96dfaffff               JMP 0x00411a82
00412015  31d2                     XOR EDX,EDX
00412017  6689f2                   MOV DX,SI
0041201a  81ea48010000             SUB EDX,0x148
00412020  89d0                     MOV EAX,EDX
00412022  c1fa1f                   SAR EDX,0x1f
00412025  2bc2                     SUB EAX,EDX
00412027  d1f8                     SAR EAX,0x1
00412029  a338014300               MOV [0x00430138],EAX
0041202e  c1ee10                   SHR ESI,0x10
00412031  81e6ffff0000             AND ESI,0xffff
00412037  31d2                     XOR EDX,EDX
00412039  6689f2                   MOV DX,SI
0041203c  81ea78010000             SUB EDX,0x178
00412042  89d0                     MOV EAX,EDX
00412044  c1fa1f                   SAR EDX,0x1f
00412047  2bc2                     SUB EAX,EDX
00412049  d1f8                     SAR EAX,0x1
0041204b  83c02e                   ADD EAX,0x2e
0041204e  a33c014300               MOV [0x0043013c],EAX
00412053  8d442440                 LEA EAX,[ESP + 0x40]
00412057  50                       PUSH EAX
00412058  8b942480000000           MOV EDX,dword ptr [ESP + 0x80]
0041205f  52                       PUSH EDX
00412060  e836110000               CALL 0x0041319b
00412065  8b442448                 MOV EAX,dword ptr [ESP + 0x48]
00412069  83e860                   SUB EAX,0x60
0041206c  a348014300               MOV [0x00430148],EAX
00412071  8b542448                 MOV EDX,dword ptr [ESP + 0x48]
00412075  83ea6c                   SUB EDX,0x6c
00412078  89d0                     MOV EAX,EDX
0041207a  c1fa1f                   SAR EDX,0x1f
0041207d  2bc2                     SUB EAX,EDX
0041207f  d1f8                     SAR EAX,0x1
00412081  a354014300               MOV [0x00430154],EAX
00412086  8b542448                 MOV EDX,dword ptr [ESP + 0x48]
0041208a  81ea48010000             SUB EDX,0x148
00412090  89d0                     MOV EAX,EDX
00412092  c1fa1f                   SAR EDX,0x1f
00412095  2bc2                     SUB EAX,EDX
00412097  d1f8                     SAR EAX,0x1
00412099  8d50c6                   LEA EDX,[EAX + -0x3a]
0041209c  89d0                     MOV EAX,EDX
0041209e  c1fa1f                   SAR EDX,0x1f
004120a1  2bc2                     SUB EAX,EDX
004120a3  d1f8                     SAR EAX,0x1
004120a5  a364014300               MOV [0x00430164],EAX
004120aa  8b54244c                 MOV EDX,dword ptr [ESP + 0x4c]
004120ae  81eaea000000             SUB EDX,0xea
004120b4  89d0                     MOV EAX,EDX
004120b6  c1fa1f                   SAR EDX,0x1f
004120b9  2bc2                     SUB EAX,EDX
004120bb  d1f8                     SAR EAX,0x1
004120bd  05ea000000               ADD EAX,0xea
004120c2  a368014300               MOV [0x00430168],EAX
004120c7  8b542448                 MOV EDX,dword ptr [ESP + 0x48]
004120cb  81ea48010000             SUB EDX,0x148
004120d1  89d0                     MOV EAX,EDX
004120d3  c1fa1f                   SAR EDX,0x1f
004120d6  2bc2                     SUB EAX,EDX
004120d8  d1f8                     SAR EAX,0x1
004120da  89c5                     MOV EBP,EAX
004120dc  8d50c6                   LEA EDX,[EAX + -0x3a]
004120df  89d0                     MOV EAX,EDX
004120e1  c1fa1f                   SAR EDX,0x1f
004120e4  2bc2                     SUB EAX,EDX
004120e6  d1f8                     SAR EAX,0x1
004120e8  81c548010000             ADD EBP,0x148
004120ee  01c5                     ADD EBP,EAX
004120f0  892d74014300             MOV dword ptr [0x00430174],EBP
004120f6  a168014300               MOV EAX,[0x00430168]
004120fb  a378014300               MOV [0x00430178],EAX
00412100  e97df9ffff               JMP 0x00411a82
00412105  e823f6ffff               CALL 0x0041172d
0041210a  8b1d34024300             MOV EBX,dword ptr [0x00430234]
00412110  85db                     TEST EBX,EBX
00412112  7406                     JZ 0x0041211a
00412114  53                       PUSH EBX
00412115  e80f100000               CALL 0x00413129
0041211a  8b352c024300             MOV ESI,dword ptr [0x0043022c]
00412120  56                       PUSH ESI
00412121  8b3d30024300             MOV EDI,dword ptr [0x00430230]
00412127  57                       PUSH EDI
00412128  e8bc100000               CALL 0x004131e9
0041212d  8b2d30024300             MOV EBP,dword ptr [0x00430230]
00412133  55                       PUSH EBP
00412134  e8d80f0000               CALL 0x00413111
00412139  a138004300               MOV EAX,[0x00430038]
0041213e  50                       PUSH EAX
0041213f  e893100000               CALL 0x004131d7
00412144  8b153c004300             MOV EDX,dword ptr [0x0043003c]
0041214a  52                       PUSH EDX
0041214b  e887100000               CALL 0x004131d7
00412150  6800100000               PUSH 0x1000
00412155  8b9c2480000000           MOV EBX,dword ptr [ESP + 0x80]
0041215c  53                       PUSH EBX
0041215d  e8a90f0000               CALL 0x0041310b
00412162  6a00                     PUSH 0x0
00412164  e89c0f0000               CALL 0x00413105
00412169  e914f9ffff               JMP 0x00411a82
0041216e  81fb11010000             CMP EBX,0x111
00412174  0f8429feffff             JZ 0x00411fa3
0041217a  e981f7ffff               JMP 0x00411900
0041217f  83fb02                   CMP EBX,0x2
00412182  7223                     JC 0x004121a7
00412184  0f867bffffff             JBE 0x00412105
0041218a  83fb05                   CMP EBX,0x5
0041218d  0f826df7ffff             JC 0x00411900
00412193  0f867cfeffff             JBE 0x00412015
00412199  83fb0f                   CMP EBX,0xf
0041219c  0f84eaf8ffff             JZ 0x00411a8c
004121a2  e959f7ffff               JMP 0x00411900
004121a7  83fb01                   CMP EBX,0x1
004121aa  0f846cf7ffff             JZ 0x0041191c
004121b0  e94bf7ffff               JMP 0x00411900

; ---- RulesDlgProc ----
004121b5  53                       PUSH EBX
004121b6  83ec50                   SUB ESP,0x50
004121b9  8b5c2458                 MOV EBX,dword ptr [ESP + 0x58]
004121bd  8b44245c                 MOV EAX,dword ptr [ESP + 0x5c]
004121c1  83f810                   CMP EAX,0x10
004121c4  0f82a1000000             JC 0x0041226b
004121ca  0f8686000000             JBE 0x00412256
004121d0  3d10010000               CMP EAX,0x110
004121d5  0f8295000000             JC 0x00412270
004121db  7610                     JBE 0x004121ed
004121dd  3d11010000               CMP EAX,0x111
004121e2  0f8478000000             JZ 0x00412260
004121e8  e983000000               JMP 0x00412270
004121ed  53                       PUSH EBX
004121ee  e80c0f0000               CALL 0x004130ff
004121f3  8d442440                 LEA EAX,[ESP + 0x40]
004121f7  50                       PUSH EAX
004121f8  53                       PUSH EBX
004121f9  e8fb0e0000               CALL 0x004130f9
004121fe  8b4c2448                 MOV ECX,dword ptr [ESP + 0x48]
00412202  2b4c2440                 SUB ECX,dword ptr [ESP + 0x40]
00412206  8b54244c                 MOV EDX,dword ptr [ESP + 0x4c]
0041220a  2b542444                 SUB EDX,dword ptr [ESP + 0x44]
0041220e  6a01                     PUSH 0x1
00412210  52                       PUSH EDX
00412211  51                       PUSH ECX
00412212  a130004300               MOV EAX,[0x00430030]
00412217  29d0                     SUB EAX,EDX
00412219  89c2                     MOV EDX,EAX
0041221b  c1fa1f                   SAR EDX,0x1f
0041221e  2bc2                     SUB EAX,EDX
00412220  d1f8                     SAR EAX,0x1
00412222  50                       PUSH EAX
00412223  8b152c004300             MOV EDX,dword ptr [0x0043002c]
00412229  29ca                     SUB EDX,ECX
0041222b  89d0                     MOV EAX,EDX
0041222d  c1fa1f                   SAR EDX,0x1f
00412230  2bc2                     SUB EAX,EDX
00412232  d1f8                     SAR EAX,0x1
00412234  50                       PUSH EAX
00412235  53                       PUSH EBX
00412236  e8b80e0000               CALL 0x004130f3
0041223b  b801000000               MOV EAX,0x1
00412240  eb30                     JMP 0x00412272
00412242  89e0                     MOV EAX,ESP
00412244  50                       PUSH EAX
00412245  53                       PUSH EBX
00412246  e8fc0e0000               CALL 0x00413147
0041224b  89e0                     MOV EAX,ESP
0041224d  50                       PUSH EAX
0041224e  53                       PUSH EBX
0041224f  e8e10e0000               CALL 0x00413135
00412254  ebe5                     JMP 0x0041223b
00412256  6a00                     PUSH 0x0
00412258  53                       PUSH EBX
00412259  e88f0e0000               CALL 0x004130ed
0041225e  ebdb                     JMP 0x0041223b
00412260  66817c24600001           CMP word ptr [ESP + 0x60],0x100
00412267  74ed                     JZ 0x00412256
00412269  eb05                     JMP 0x00412270
0041226b  83f80f                   CMP EAX,0xf
0041226e  74d2                     JZ 0x00412242
00412270  31c0                     XOR EAX,EAX
00412272  83c450                   ADD ESP,0x50
00412275  5b                       POP EBX
00412276  c21000                   RET 0x10

; ---- HighScoresDlgProc ----
00412279  53                       PUSH EBX
0041227a  56                       PUSH ESI
0041227b  57                       PUSH EDI
0041227c  55                       PUSH EBP
0041227d  83ec6c                   SUB ESP,0x6c
00412280  8bac2480000000           MOV EBP,dword ptr [ESP + 0x80]
00412287  8b842484000000           MOV EAX,dword ptr [ESP + 0x84]
0041228e  83f810                   CMP EAX,0x10
00412291  0f82aa010000             JC 0x00412441
00412297  0f8689010000             JBE 0x00412426
0041229d  3d10010000               CMP EAX,0x110
004122a2  0f82a2010000             JC 0x0041244a
004122a8  7610                     JBE 0x004122ba
004122aa  3d11010000               CMP EAX,0x111
004122af  0f847e010000             JZ 0x00412433
004122b5  e990010000               JMP 0x0041244a
004122ba  55                       PUSH EBP
004122bb  e83f0e0000               CALL 0x004130ff
004122c0  8d442454                 LEA EAX,[ESP + 0x54]
004122c4  50                       PUSH EAX
004122c5  55                       PUSH EBP
004122c6  e82e0e0000               CALL 0x004130f9
004122cb  8b5c245c                 MOV EBX,dword ptr [ESP + 0x5c]
004122cf  2b5c2454                 SUB EBX,dword ptr [ESP + 0x54]
004122d3  8b542460                 MOV EDX,dword ptr [ESP + 0x60]
004122d7  2b542458                 SUB EDX,dword ptr [ESP + 0x58]
004122db  6a01                     PUSH 0x1
004122dd  52                       PUSH EDX
004122de  53                       PUSH EBX
004122df  a130004300               MOV EAX,[0x00430030]
004122e4  29d0                     SUB EAX,EDX
004122e6  89c2                     MOV EDX,EAX
004122e8  c1fa1f                   SAR EDX,0x1f
004122eb  2bc2                     SUB EAX,EDX
004122ed  d1f8                     SAR EAX,0x1
004122ef  50                       PUSH EAX
004122f0  8b152c004300             MOV EDX,dword ptr [0x0043002c]
004122f6  29da                     SUB EDX,EBX
004122f8  89d0                     MOV EAX,EDX
004122fa  c1fa1f                   SAR EDX,0x1f
004122fd  2bc2                     SUB EAX,EDX
004122ff  d1f8                     SAR EAX,0x1
00412301  50                       PUSH EAX
00412302  55                       PUSH EBP
00412303  e8eb0d0000               CALL 0x004130f3
00412308  b801000000               MOV EAX,0x1
0041230d  e93a010000               JMP 0x0041244c
00412312  89e0                     MOV EAX,ESP
00412314  50                       PUSH EAX
00412315  55                       PUSH EBP
00412316  e82c0e0000               CALL 0x00413147
0041231b  89c3                     MOV EBX,EAX
0041231d  89c7                     MOV EDI,EAX
0041231f  6880004200               PUSH 0x420080
00412324  6a00                     PUSH 0x0
00412326  6a00                     PUSH 0x0
00412328  6a00                     PUSH 0x0
0041232a  6a00                     PUSH 0x0
0041232c  6a00                     PUSH 0x0
0041232e  6a00                     PUSH 0x0
00412330  6a00                     PUSH 0x0
00412332  6a00                     PUSH 0x0
00412334  6890010000               PUSH 0x190
00412339  6a00                     PUSH 0x0
0041233b  6a00                     PUSH 0x0
0041233d  6a00                     PUSH 0x0
0041233f  6a12                     PUSH 0x12
00412341  e8a10d0000               CALL 0x004130e7
00412346  89442468                 MOV dword ptr [ESP + 0x68],EAX
0041234a  50                       PUSH EAX
0041234b  53                       PUSH EBX
0041234c  e8980e0000               CALL 0x004131e9
00412351  89442464                 MOV dword ptr [ESP + 0x64],EAX
00412355  6a01                     PUSH 0x1
00412357  53                       PUSH EBX
00412358  e84a0e0000               CALL 0x004131a7
0041235d  6a00                     PUSH 0x0
0041235f  53                       PUSH EBX
00412360  e8480e0000               CALL 0x004131ad
00412365  8d442454                 LEA EAX,[ESP + 0x54]
00412369  50                       PUSH EAX
0041236a  55                       PUSH EBP
0041236b  e82b0e0000               CALL 0x0041319b
00412370  31db                     XOR EBX,EBX
00412372  8344245410               ADD dword ptr [ESP + 0x54],0x10
00412377  8344245810               ADD dword ptr [ESP + 0x58],0x10
0041237c  836c245c10               SUB dword ptr [ESP + 0x5c],0x10
00412381  eb7b                     JMP 0x004123fe
00412383  8b442458                 MOV EAX,dword ptr [ESP + 0x58]
00412387  83c010                   ADD EAX,0x10
0041238a  89442460                 MOV dword ptr [ESP + 0x60],EAX
0041238e  8d7301                   LEA ESI,[EBX + 0x1]
00412391  8d542440                 LEA EDX,[ESP + 0x40]
00412395  89f0                     MOV EAX,ESI
00412397  e80cddffff               CALL 0x004100a8
0041239c  bae58c4200               MOV EDX,0x428ce5
004123a1  8d442440                 LEA EAX,[ESP + 0x40]
004123a5  e8d60c0000               CALL 0x00413080
004123aa  c1e304                   SHL EBX,0x4
004123ad  ba88014300               MOV EDX,0x430188
004123b2  01da                     ADD EDX,EBX
004123b4  8d442440                 LEA EAX,[ESP + 0x40]
004123b8  e8c30c0000               CALL 0x00413080
004123bd  6a00                     PUSH 0x0
004123bf  8d442458                 LEA EAX,[ESP + 0x58]
004123c3  50                       PUSH EAX
004123c4  6aff                     PUSH -0x1
004123c6  8d44244c                 LEA EAX,[ESP + 0x4c]
004123ca  50                       PUSH EAX
004123cb  57                       PUSH EDI
004123cc  e8d00d0000               CALL 0x004131a1
004123d1  31c0                     XOR EAX,EAX
004123d3  668b8396014300           MOV AX,word ptr [EBX + 0x430196]
004123da  8d542440                 LEA EDX,[ESP + 0x40]
004123de  e8c5dcffff               CALL 0x004100a8
004123e3  6a02                     PUSH 0x2
004123e5  8d442458                 LEA EAX,[ESP + 0x58]
004123e9  50                       PUSH EAX
004123ea  6aff                     PUSH -0x1
004123ec  8d44244c                 LEA EAX,[ESP + 0x4c]
004123f0  50                       PUSH EAX
004123f1  57                       PUSH EDI
004123f2  e8aa0d0000               CALL 0x004131a1
004123f7  8344245810               ADD dword ptr [ESP + 0x58],0x10
004123fc  89f3                     MOV EBX,ESI
004123fe  83fb0a                   CMP EBX,0xa
00412401  7c80                     JL 0x00412383
00412403  8b5c2464                 MOV EBX,dword ptr [ESP + 0x64]
00412407  53                       PUSH EBX
00412408  57                       PUSH EDI
00412409  e8db0d0000               CALL 0x004131e9
0041240e  8b4c2468                 MOV ECX,dword ptr [ESP + 0x68]
00412412  51                       PUSH ECX
00412413  e8bf0d0000               CALL 0x004131d7
00412418  89e0                     MOV EAX,ESP
0041241a  50                       PUSH EAX
0041241b  55                       PUSH EBP
0041241c  e8140d0000               CALL 0x00413135
00412421  e9e2feffff               JMP 0x00412308
00412426  6a00                     PUSH 0x0
00412428  55                       PUSH EBP
00412429  e8bf0c0000               CALL 0x004130ed
0041242e  e9d5feffff               JMP 0x00412308
00412433  6681bc24880000000001     CMP word ptr [ESP + 0x88],0x100
0041243d  74e7                     JZ 0x00412426
0041243f  eb09                     JMP 0x0041244a
00412441  83f80f                   CMP EAX,0xf
00412444  0f84c8feffff             JZ 0x00412312
0041244a  31c0                     XOR EAX,EAX
0041244c  83c46c                   ADD ESP,0x6c
0041244f  e99edeffff               JMP 0x004102f2

; ---- EnterNameDlgProc ----
00412454  53                       PUSH EBX
00412455  56                       PUSH ESI
00412456  57                       PUSH EDI
00412457  83ec64                   SUB ESP,0x64
0041245a  8b5c2474                 MOV EBX,dword ptr [ESP + 0x74]
0041245e  8b442478                 MOV EAX,dword ptr [ESP + 0x78]
00412462  83f810                   CMP EAX,0x10
00412465  0f8291010000             JC 0x004125fc
0041246b  0f8698000000             JBE 0x00412509
00412471  3d10010000               CMP EAX,0x110
00412476  0f8289010000             JC 0x00412605
0041247c  7610                     JBE 0x0041248e
0041247e  3d11010000               CMP EAX,0x111
00412483  0f8468010000             JZ 0x004125f1
00412489  e977010000               JMP 0x00412605
0041248e  53                       PUSH EBX
0041248f  e86b0c0000               CALL 0x004130ff
00412494  8d442454                 LEA EAX,[ESP + 0x54]
00412498  50                       PUSH EAX
00412499  53                       PUSH EBX
0041249a  e85a0c0000               CALL 0x004130f9
0041249f  8b7c245c                 MOV EDI,dword ptr [ESP + 0x5c]
004124a3  2b7c2454                 SUB EDI,dword ptr [ESP + 0x54]
004124a7  8b742460                 MOV ESI,dword ptr [ESP + 0x60]
004124ab  2b742458                 SUB ESI,dword ptr [ESP + 0x58]
004124af  684c004200               PUSH 0x42004c
004124b4  6801010000               PUSH 0x101
004124b9  53                       PUSH EBX
004124ba  e8220c0000               CALL 0x004130e1
004124bf  6a01                     PUSH 0x1
004124c1  56                       PUSH ESI
004124c2  57                       PUSH EDI
004124c3  8b1530004300             MOV EDX,dword ptr [0x00430030]
004124c9  29f2                     SUB EDX,ESI
004124cb  89d0                     MOV EAX,EDX
004124cd  c1fa1f                   SAR EDX,0x1f
004124d0  2bc2                     SUB EAX,EDX
004124d2  d1f8                     SAR EAX,0x1
004124d4  50                       PUSH EAX
004124d5  8b152c004300             MOV EDX,dword ptr [0x0043002c]
004124db  29fa                     SUB EDX,EDI
004124dd  89d0                     MOV EAX,EDX
004124df  c1fa1f                   SAR EDX,0x1f
004124e2  2bc2                     SUB EAX,EDX
004124e4  d1f8                     SAR EAX,0x1
004124e6  50                       PUSH EAX
004124e7  53                       PUSH EBX
004124e8  e8060c0000               CALL 0x004130f3
004124ed  e98a000000               JMP 0x0041257c
004124f2  89e0                     MOV EAX,ESP
004124f4  50                       PUSH EAX
004124f5  53                       PUSH EBX
004124f6  e84c0c0000               CALL 0x00413147
004124fb  89e0                     MOV EAX,ESP
004124fd  50                       PUSH EAX
004124fe  53                       PUSH EBX
004124ff  e8310c0000               CALL 0x00413135
00412504  e973000000               JMP 0x0041257c
00412509  6a10                     PUSH 0x10
0041250b  8d442444                 LEA EAX,[ESP + 0x44]
0041250f  50                       PUSH EAX
00412510  6801010000               PUSH 0x101
00412515  53                       PUSH EBX
00412516  e8c00b0000               CALL 0x004130db
0041251b  8d442440                 LEA EAX,[ESP + 0x40]
0041251f  e8c5dbffff               CALL 0x004100e9
00412524  85c0                     TEST EAX,EAX
00412526  750d                     JNZ 0x00412535
00412528  50                       PUSH EAX
00412529  6878004200               PUSH 0x420078
0041252e  689c004200               PUSH 0x42009c
00412533  eb41                     JMP 0x00412576
00412535  8d442440                 LEA EAX,[ESP + 0x40]
00412539  e8abdbffff               CALL 0x004100e9
0041253e  83f80d                   CMP EAX,0xd
00412541  760e                     JBE 0x00412551
00412543  6a00                     PUSH 0x0
00412545  6878004200               PUSH 0x420078
0041254a  68b8004200               PUSH 0x4200b8
0041254f  eb25                     JMP 0x00412576
00412551  31d2                     XOR EDX,EDX
00412553  eb01                     JMP 0x00412556
00412555  42                       INC EDX
00412556  8d442440                 LEA EAX,[ESP + 0x40]
0041255a  e88adbffff               CALL 0x004100e9
0041255f  39c2                     CMP EDX,EAX
00412561  7323                     JNC 0x00412586
00412563  f644144080               TEST byte ptr [ESP + EDX*0x1 + 0x40],0x80
00412568  74eb                     JZ 0x00412555
0041256a  6a00                     PUSH 0x0
0041256c  6878004200               PUSH 0x420078
00412571  68c8004200               PUSH 0x4200c8
00412576  53                       PUSH EBX
00412577  e8430c0000               CALL 0x004131bf
0041257c  b801000000               MOV EAX,0x1
00412581  e981000000               JMP 0x00412607
00412586  8d542440                 LEA EDX,[ESP + 0x40]
0041258a  b84c004200               MOV EAX,0x42004c
0041258f  e894dbffff               CALL 0x00410128
00412594  6a00                     PUSH 0x0
00412596  53                       PUSH EBX
00412597  e8510b0000               CALL 0x004130ed
0041259c  ebde                     JMP 0x0041257c
0041259e  6a10                     PUSH 0x10
004125a0  8d442444                 LEA EAX,[ESP + 0x44]
004125a4  50                       PUSH EAX
004125a5  6801010000               PUSH 0x101
004125aa  53                       PUSH EBX
004125ab  e82b0b0000               CALL 0x004130db
004125b0  8d442440                 LEA EAX,[ESP + 0x40]
004125b4  e830dbffff               CALL 0x004100e9
004125b9  85c0                     TEST EAX,EAX
004125bb  0f8467ffffff             JZ 0x00412528
004125c1  8d442440                 LEA EAX,[ESP + 0x40]
004125c5  e81fdbffff               CALL 0x004100e9
004125ca  83f80d                   CMP EAX,0xd
004125cd  0f8770ffffff             JA 0x00412543
004125d3  31d2                     XOR EDX,EDX
004125d5  eb01                     JMP 0x004125d8
004125d7  42                       INC EDX
004125d8  8d442440                 LEA EAX,[ESP + 0x40]
004125dc  e808dbffff               CALL 0x004100e9
004125e1  39c2                     CMP EDX,EAX
004125e3  73a1                     JNC 0x00412586
004125e5  f644144080               TEST byte ptr [ESP + EDX*0x1 + 0x40],0x80
004125ea  74eb                     JZ 0x004125d7
004125ec  e979ffffff               JMP 0x0041256a
004125f1  66817c247c0001           CMP word ptr [ESP + 0x7c],0x100
004125f8  74a4                     JZ 0x0041259e
004125fa  eb09                     JMP 0x00412605
004125fc  83f80f                   CMP EAX,0xf
004125ff  0f84edfeffff             JZ 0x004124f2
00412605  31c0                     XOR EAX,EAX
00412607  83c464                   ADD ESP,0x64
0041260a  e9e4dcffff               JMP 0x004102f3

; ---- AboutDlgProc ----
0041260f  53                       PUSH EBX
00412610  56                       PUSH ESI
00412611  57                       PUSH EDI
00412612  55                       PUSH EBP
00412613  83ec58                   SUB ESP,0x58
00412616  8b7c246c                 MOV EDI,dword ptr [ESP + 0x6c]
0041261a  8b442470                 MOV EAX,dword ptr [ESP + 0x70]
0041261e  83f810                   CMP EAX,0x10
00412621  0f8242010000             JC 0x00412769
00412627  0f8624010000             JBE 0x00412751
0041262d  3d10010000               CMP EAX,0x110
00412632  0f823a010000             JC 0x00412772
00412638  7610                     JBE 0x0041264a
0041263a  3d11010000               CMP EAX,0x111
0041263f  0f8419010000             JZ 0x0041275e
00412645  e928010000               JMP 0x00412772
0041264a  57                       PUSH EDI
0041264b  e8af0a0000               CALL 0x004130ff
00412650  8d442440                 LEA EAX,[ESP + 0x40]
00412654  50                       PUSH EAX
00412655  57                       PUSH EDI
00412656  e89e0a0000               CALL 0x004130f9
0041265b  8b5c2448                 MOV EBX,dword ptr [ESP + 0x48]
0041265f  2b5c2440                 SUB EBX,dword ptr [ESP + 0x40]
00412663  8b54244c                 MOV EDX,dword ptr [ESP + 0x4c]
00412667  2b542444                 SUB EDX,dword ptr [ESP + 0x44]
0041266b  6a01                     PUSH 0x1
0041266d  52                       PUSH EDX
0041266e  53                       PUSH EBX
0041266f  a130004300               MOV EAX,[0x00430030]
00412674  29d0                     SUB EAX,EDX
00412676  89c2                     MOV EDX,EAX
00412678  c1fa1f                   SAR EDX,0x1f
0041267b  2bc2                     SUB EAX,EDX
0041267d  d1f8                     SAR EAX,0x1
0041267f  50                       PUSH EAX
00412680  8b152c004300             MOV EDX,dword ptr [0x0043002c]
00412686  29da                     SUB EDX,EBX
00412688  89d0                     MOV EAX,EDX
0041268a  c1fa1f                   SAR EDX,0x1f
0041268d  2bc2                     SUB EAX,EDX
0041268f  d1f8                     SAR EAX,0x1
00412691  50                       PUSH EAX
00412692  57                       PUSH EDI
00412693  e85b0a0000               CALL 0x004130f3
00412698  b801000000               MOV EAX,0x1
0041269d  e9d2000000               JMP 0x00412774
004126a2  89e0                     MOV EAX,ESP
004126a4  50                       PUSH EAX
004126a5  57                       PUSH EDI
004126a6  e89c0a0000               CALL 0x00413147
004126ab  89c6                     MOV ESI,EAX
004126ad  68d0070000               PUSH 0x7d0
004126b2  8b2d28004300             MOV EBP,dword ptr [0x00430028]
004126b8  55                       PUSH EBP
004126b9  e8170a0000               CALL 0x004130d5
004126be  89442450                 MOV dword ptr [ESP + 0x50],EAX
004126c2  68d1070000               PUSH 0x7d1
004126c7  a128004300               MOV EAX,[0x00430028]
004126cc  50                       PUSH EAX
004126cd  e8030a0000               CALL 0x004130d5
004126d2  89c5                     MOV EBP,EAX
004126d4  56                       PUSH ESI
004126d5  e87f0a0000               CALL 0x00413159
004126da  89c3                     MOV EBX,EAX
004126dc  55                       PUSH EBP
004126dd  50                       PUSH EAX
004126de  e8060b0000               CALL 0x004131e9
004126e3  89442454                 MOV dword ptr [ESP + 0x54],EAX
004126e7  68c6008800               PUSH 0x8800c6
004126ec  6a00                     PUSH 0x0
004126ee  6a00                     PUSH 0x0
004126f0  53                       PUSH EBX
004126f1  6a32                     PUSH 0x32
004126f3  6a43                     PUSH 0x43
004126f5  6a20                     PUSH 0x20
004126f7  6a0a                     PUSH 0xa
004126f9  56                       PUSH ESI
004126fa  e8d20a0000               CALL 0x004131d1
004126ff  8b542450                 MOV EDX,dword ptr [ESP + 0x50]
00412703  52                       PUSH EDX
00412704  53                       PUSH EBX
00412705  e8df0a0000               CALL 0x004131e9
0041270a  688600ee00               PUSH 0xee0086
0041270f  6a00                     PUSH 0x0
00412711  6a00                     PUSH 0x0
00412713  53                       PUSH EBX
00412714  6a32                     PUSH 0x32
00412716  6a43                     PUSH 0x43
00412718  6a20                     PUSH 0x20
0041271a  6a0a                     PUSH 0xa
0041271c  56                       PUSH ESI
0041271d  e8af0a0000               CALL 0x004131d1
00412722  8b4c2454                 MOV ECX,dword ptr [ESP + 0x54]
00412726  51                       PUSH ECX
00412727  53                       PUSH EBX
00412728  e8bc0a0000               CALL 0x004131e9
0041272d  53                       PUSH EBX
0041272e  e8de090000               CALL 0x00413111
00412733  55                       PUSH EBP
00412734  e89e0a0000               CALL 0x004131d7
00412739  8b742450                 MOV ESI,dword ptr [ESP + 0x50]
0041273d  56                       PUSH ESI
0041273e  e8940a0000               CALL 0x004131d7
00412743  89e0                     MOV EAX,ESP
00412745  50                       PUSH EAX
00412746  57                       PUSH EDI
00412747  e8e9090000               CALL 0x00413135
0041274c  e947ffffff               JMP 0x00412698
00412751  6a00                     PUSH 0x0
00412753  57                       PUSH EDI
00412754  e894090000               CALL 0x004130ed
00412759  e93affffff               JMP 0x00412698
0041275e  66817c24740001           CMP word ptr [ESP + 0x74],0x100
00412765  74ea                     JZ 0x00412751
00412767  eb09                     JMP 0x00412772
00412769  83f80f                   CMP EAX,0xf
0041276c  0f8430ffffff             JZ 0x004126a2
00412772  31c0                     XOR EAX,EAX
00412774  83c458                   ADD ESP,0x58
00412777  e976dbffff               JMP 0x004102f2

; ---- StatisticsDlgProc ----
0041277c  53                       PUSH EBX
0041277d  56                       PUSH ESI
0041277e  57                       PUSH EDI
0041277f  55                       PUSH EBP
00412780  81ecc8000000             SUB ESP,0xc8
00412786  8bac24dc000000           MOV EBP,dword ptr [ESP + 0xdc]
0041278d  8b8424e0000000           MOV EAX,dword ptr [ESP + 0xe0]
00412794  83f810                   CMP EAX,0x10
00412797  0f829a020000             JC 0x00412a37
0041279d  0f8661020000             JBE 0x00412a04
004127a3  3d10010000               CMP EAX,0x110
004127a8  0f8592020000             JNZ 0x00412a40
004127ae  8d8424b0000000           LEA EAX,[ESP + 0xb0]
004127b5  50                       PUSH EAX
004127b6  8b153c024300             MOV EDX,dword ptr [0x0043023c]
004127bc  52                       PUSH EDX
004127bd  e837090000               CALL 0x004130f9
004127c2  6a00                     PUSH 0x0
004127c4  6836010000               PUSH 0x136
004127c9  68a4000000               PUSH 0xa4
004127ce  8b8424c0000000           MOV EAX,dword ptr [ESP + 0xc0]
004127d5  83c020                   ADD EAX,0x20
004127d8  50                       PUSH EAX
004127d9  a138014300               MOV EAX,[0x00430138]
004127de  0554010000               ADD EAX,0x154
004127e3  038424c0000000           ADD EAX,dword ptr [ESP + 0xc0]
004127ea  50                       PUSH EAX
004127eb  55                       PUSH EBP
004127ec  e802090000               CALL 0x004130f3
004127f1  8b0d3c024300             MOV ECX,dword ptr [0x0043023c]
004127f7  51                       PUSH ECX
004127f8  e802090000               CALL 0x004130ff
004127fd  b801000000               MOV EAX,0x1
00412802  e93b020000               JMP 0x00412a42
00412807  8d442440                 LEA EAX,[ESP + 0x40]
0041280b  50                       PUSH EAX
0041280c  55                       PUSH EBP
0041280d  e835090000               CALL 0x00413147
00412812  89c7                     MOV EDI,EAX
00412814  31f6                     XOR ESI,ESI
00412816  eb0a                     JMP 0x00412822
00412818  31d2                     XOR EDX,EDX
0041281a  8994b480000000           MOV dword ptr [ESP + ESI*0x4 + 0x80],EDX
00412821  46                       INC ESI
00412822  83fe08                   CMP ESI,0x8
00412825  7cf1                     JL 0x00412818
00412827  31f6                     XOR ESI,ESI
00412829  eb21                     JMP 0x0041284c
0041282b  89f0                     MOV EAX,ESI
0041282d  c1e003                   SHL EAX,0x3
00412830  01f0                     ADD EAX,ESI
00412832  8a840240004300           MOV AL,byte ptr [EDX + EAX*0x1 + 0x430040]
00412839  25ff000000               AND EAX,0xff
0041283e  ff848480000000           INC dword ptr [ESP + EAX*0x4 + 0x80]
00412845  42                       INC EDX
00412846  83fa09                   CMP EDX,0x9
00412849  7ce0                     JL 0x0041282b
0041284b  46                       INC ESI
0041284c  83fe09                   CMP ESI,0x9
0041284f  7d04                     JGE 0x00412855
00412851  31d2                     XOR EDX,EDX
00412853  ebf1                     JMP 0x00412846
00412855  6880004200               PUSH 0x420080
0041285a  6a00                     PUSH 0x0
0041285c  6a00                     PUSH 0x0
0041285e  6a00                     PUSH 0x0
00412860  6a00                     PUSH 0x0
00412862  6a00                     PUSH 0x0
00412864  6a00                     PUSH 0x0
00412866  6a00                     PUSH 0x0
00412868  6a00                     PUSH 0x0
0041286a  6890010000               PUSH 0x190
0041286f  6a00                     PUSH 0x0
00412871  6a00                     PUSH 0x0
00412873  6a00                     PUSH 0x0
00412875  6a10                     PUSH 0x10
00412877  e86b080000               CALL 0x004130e7
0041287c  898424c4000000           MOV dword ptr [ESP + 0xc4],EAX
00412883  50                       PUSH EAX
00412884  57                       PUSH EDI
00412885  e85f090000               CALL 0x004131e9
0041288a  898424c0000000           MOV dword ptr [ESP + 0xc0],EAX
00412891  6a0f                     PUSH 0xf
00412893  e81b090000               CALL 0x004131b3
00412898  50                       PUSH EAX
00412899  57                       PUSH EDI
0041289a  e830080000               CALL 0x004130cf
0041289f  6a00                     PUSH 0x0
004128a1  57                       PUSH EDI
004128a2  e806090000               CALL 0x004131ad
004128a7  8d8424b0000000           LEA EAX,[ESP + 0xb0]
004128ae  50                       PUSH EAX
004128af  55                       PUSH EBP
004128b0  e8e6080000               CALL 0x0041319b
004128b5  838424b00000002c         ADD dword ptr [ESP + 0xb0],0x2c
004128bd  8b8424b4000000           MOV EAX,dword ptr [ESP + 0xb4]
004128c4  83c023                   ADD EAX,0x23
004128c7  898424bc000000           MOV dword ptr [ESP + 0xbc],EAX
004128ce  31f6                     XOR ESI,ESI
004128d0  eb34                     JMP 0x00412906
004128d2  baf58c4200               MOV EDX,0x428cf5
004128d7  89e0                     MOV EAX,ESP
004128d9  e8a2070000               CALL 0x00413080
004128de  6a24                     PUSH 0x24
004128e0  8d8424b4000000           LEA EAX,[ESP + 0xb4]
004128e7  50                       PUSH EAX
004128e8  6aff                     PUSH -0x1
004128ea  8d44240c                 LEA EAX,[ESP + 0xc]
004128ee  50                       PUSH EAX
004128ef  57                       PUSH EDI
004128f0  e8ac080000               CALL 0x004131a1
004128f5  838424b400000024         ADD dword ptr [ESP + 0xb4],0x24
004128fd  838424bc00000024         ADD dword ptr [ESP + 0xbc],0x24
00412905  46                       INC ESI
00412906  83fe08                   CMP ESI,0x8
00412909  0f8dca000000             JGE 0x004129d9
0041290f  682000cc00               PUSH 0xcc0020
00412914  68e1000000               PUSH 0xe1
00412919  89f0                     MOV EAX,ESI
0041291b  c1e003                   SHL EAX,0x3
0041291e  01f0                     ADD EAX,ESI
00412920  c1e002                   SHL EAX,0x2
00412923  50                       PUSH EAX
00412924  a130024300               MOV EAX,[0x00430230]
00412929  50                       PUSH EAX
0041292a  6a24                     PUSH 0x24
0041292c  6a24                     PUSH 0x24
0041292e  8b9424cc000000           MOV EDX,dword ptr [ESP + 0xcc]
00412935  52                       PUSH EDX
00412936  8b8424cc000000           MOV EAX,dword ptr [ESP + 0xcc]
0041293d  83e82c                   SUB EAX,0x2c
00412940  50                       PUSH EAX
00412941  57                       PUSH EDI
00412942  e88a080000               CALL 0x004131d1
00412947  89f3                     MOV EBX,ESI
00412949  c1e302                   SHL EBX,0x2
0041294c  8b841c80000000           MOV EAX,dword ptr [ESP + EBX*0x1 + 0x80]
00412953  89e2                     MOV EDX,ESP
00412955  e84ed7ffff               CALL 0x004100a8
0041295a  bae88c4200               MOV EDX,0x428ce8
0041295f  89e0                     MOV EAX,ESP
00412961  e81a070000               CALL 0x00413080
00412966  6b941c8000000064         IMUL EDX,dword ptr [ESP + EBX*0x1 + 0x80],0x64
0041296e  b951000000               MOV ECX,0x51
00412973  89d0                     MOV EAX,EDX
00412975  c1fa1f                   SAR EDX,0x1f
00412978  f7f9                     IDIV ECX
0041297a  8d9424a0000000           LEA EDX,[ESP + 0xa0]
00412981  e822d7ffff               CALL 0x004100a8
00412986  8d9424a0000000           LEA EDX,[ESP + 0xa0]
0041298d  89e0                     MOV EAX,ESP
0041298f  e8ec060000               CALL 0x00413080
00412994  baeb8c4200               MOV EDX,0x428ceb
00412999  89e0                     MOV EAX,ESP
0041299b  e8e0060000               CALL 0x00413080
004129a0  85f6                     TEST ESI,ESI
004129a2  0f842affffff             JZ 0x004128d2
004129a8  baee8c4200               MOV EDX,0x428cee
004129ad  89e0                     MOV EAX,ESP
004129af  e8cc060000               CALL 0x00413080
004129b4  8b8340024300             MOV EAX,dword ptr [EBX + 0x430240]
004129ba  8d9424a0000000           LEA EDX,[ESP + 0xa0]
004129c1  e8e2d6ffff               CALL 0x004100a8
004129c6  8d9424a0000000           LEA EDX,[ESP + 0xa0]
004129cd  89e0                     MOV EAX,ESP
004129cf  e8ac060000               CALL 0x00413080
004129d4  e9f9feffff               JMP 0x004128d2
004129d9  8b8c24c0000000           MOV ECX,dword ptr [ESP + 0xc0]
004129e0  51                       PUSH ECX
004129e1  57                       PUSH EDI
004129e2  e802080000               CALL 0x004131e9
004129e7  8bb424c4000000           MOV ESI,dword ptr [ESP + 0xc4]
004129ee  56                       PUSH ESI
004129ef  e8e3070000               CALL 0x004131d7
004129f4  8d442440                 LEA EAX,[ESP + 0x40]
004129f8  50                       PUSH EAX
004129f9  55                       PUSH EBP
004129fa  e836070000               CALL 0x00413135
004129ff  e9f9fdffff               JMP 0x004127fd
00412a04  55                       PUSH EBP
00412a05  e81f070000               CALL 0x00413129
00412a0a  31f6                     XOR ESI,ESI
00412a0c  893534024300             MOV dword ptr [0x00430234],ESI
00412a12  30e4                     XOR AH,AH
00412a14  882538024300             MOV byte ptr [0x00430238],AH
00412a1a  56                       PUSH ESI
00412a1b  6801020000               PUSH 0x201
00412a20  8b3d3c024300             MOV EDI,dword ptr [0x0043023c]
00412a26  57                       PUSH EDI
00412a27  e8f7060000               CALL 0x00413123
00412a2c  50                       PUSH EAX
00412a2d  e8eb060000               CALL 0x0041311d
00412a32  e9c6fdffff               JMP 0x004127fd
00412a37  83f80f                   CMP EAX,0xf
00412a3a  0f84c7fdffff             JZ 0x00412807
00412a40  31c0                     XOR EAX,EAX
00412a42  81c4c8000000             ADD ESP,0xc8
00412a48  e9a5d8ffff               JMP 0x004102f2

; ---- FUN_00412a4d ----
00412a4d  0000                     ADD byte ptr [EAX],AL

; ---- FUN_00412a4f ----
00412a4f  00                       ?? 00h

; ---- load_sprite_sheet ----
00412a50  c81c0000                 ENTER 0x1c,0x0
00412a54  51                       PUSH ECX
00412a55  56                       PUSH ESI
00412a56  57                       PUSH EDI
00412a57  8955f0                   MOV dword ptr [EBP + -0x10],EDX
00412a5a  895dec                   MOV dword ptr [EBP + -0x14],EBX
00412a5d  8945fc                   MOV dword ptr [EBP + -0x4],EAX
00412a60  894de4                   MOV dword ptr [EBP + -0x1c],ECX
00412a63  c6056e0f430000           MOV byte ptr [0x00430f6e],0x0
00412a6a  55                       PUSH EBP
00412a6b  e8ed000000               CALL 0x00412b5d
00412a70  5d                       POP EBP
00412a71  85c0                     TEST EAX,EAX
00412a73  0f84dd000000             JZ 0x00412b56
00412a79  8945e8                   MOV dword ptr [EBP + -0x18],EAX
00412a7c  83c00e                   ADD EAX,0xe
00412a7f  8b5804                   MOV EBX,dword ptr [EAX + 0x4]
00412a82  8b4808                   MOV ECX,dword ptr [EAX + 0x8]
00412a85  8b55e4                   MOV EDX,dword ptr [EBP + -0x1c]
00412a88  891a                     MOV dword ptr [EDX],EBX
00412a8a  895a04                   MOV dword ptr [EDX + 0x4],EBX
00412a8d  8b5820                   MOV EBX,dword ptr [EAX + 0x20]
00412a90  85db                     TEST EBX,EBX
00412a92  750a                     JNZ 0x00412a9e
00412a94  bb01000000               MOV EBX,0x1
00412a99  8a480e                   MOV CL,byte ptr [EAX + 0xe]
00412a9c  d3e3                     SHL EBX,CL
00412a9e  895df8                   MOV dword ptr [EBP + -0x8],EBX
00412aa1  c1e302                   SHL EBX,0x2
00412aa4  83c304                   ADD EBX,0x4
00412aa7  53                       PUSH EBX
00412aa8  6a00                     PUSH 0x0
00412aaa  e81a060000               CALL 0x004130c9
00412aaf  85c0                     TEST EAX,EAX
00412ab1  0f849f000000             JZ 0x00412b56
00412ab7  8945f4                   MOV dword ptr [EBP + -0xc],EAX
00412aba  66c7000003               MOV word ptr [EAX],0x300
00412abf  8b5df8                   MOV EBX,dword ptr [EBP + -0x8]
00412ac2  66895802                 MOV word ptr [EAX + 0x2],BX
00412ac6  8d7804                   LEA EDI,[EAX + 0x4]
00412ac9  8b75e8                   MOV ESI,dword ptr [EBP + -0x18]
00412acc  83c636                   ADD ESI,0x36
00412acf  8b4df8                   MOV ECX,dword ptr [EBP + -0x8]
00412ad2  ad                       LODSD ESI
00412ad3  8bd8                     MOV EBX,EAX
00412ad5  8bd0                     MOV EDX,EAX
00412ad7  81e3ff000000             AND EBX,0xff
00412add  c1e310                   SHL EBX,0x10
00412ae0  c1ea10                   SHR EDX,0x10
00412ae3  81e2ff000000             AND EDX,0xff
00412ae9  2500ff00ff               AND EAX,0xff00ff00
00412aee  0bc3                     OR EAX,EBX
00412af0  0bc2                     OR EAX,EDX
00412af2  ab                       STOSD ES:EDI
00412af3  e2dd                     LOOP 0x00412ad2
00412af5  ff75f4                   PUSH dword ptr [EBP + -0xc]
00412af8  e8c0050000               CALL 0x004130bd
00412afd  8b7dec                   MOV EDI,dword ptr [EBP + -0x14]
00412b00  8907                     MOV dword ptr [EDI],EAX
00412b02  ff75f4                   PUSH dword ptr [EBP + -0xc]
00412b05  e8b9050000               CALL 0x004130c3
00412b0a  6a00                     PUSH 0x0
00412b0c  ff37                     PUSH dword ptr [EDI]
00412b0e  ff75fc                   PUSH dword ptr [EBP + -0x4]
00412b11  e82b060000               CALL 0x00413141
00412b16  ff75fc                   PUSH dword ptr [EBP + -0x4]
00412b19  e81d060000               CALL 0x0041313b
00412b1e  6a00                     PUSH 0x0
00412b20  8b5de8                   MOV EBX,dword ptr [EBP + -0x18]
00412b23  83c30e                   ADD EBX,0xe
00412b26  53                       PUSH EBX
00412b27  8b45e8                   MOV EAX,dword ptr [EBP + -0x18]
00412b2a  8b400a                   MOV EAX,dword ptr [EAX + 0xa]
00412b2d  0345e8                   ADD EAX,dword ptr [EBP + -0x18]
00412b30  50                       PUSH EAX
00412b31  6a04                     PUSH 0x4
00412b33  53                       PUSH EBX
00412b34  ff75fc                   PUSH dword ptr [EBP + -0x4]
00412b37  e87b050000               CALL 0x004130b7
00412b3c  50                       PUSH EAX
00412b3d  ff75e8                   PUSH dword ptr [EBP + -0x18]
00412b40  e87e050000               CALL 0x004130c3
00412b45  58                       POP EAX
00412b46  85c0                     TEST EAX,EAX
00412b48  740c                     JZ 0x00412b56
00412b4a  8b75f0                   MOV ESI,dword ptr [EBP + -0x10]
00412b4d  8906                     MOV dword ptr [ESI],EAX
00412b4f  b801000000               MOV EAX,0x1
00412b54  eb02                     JMP 0x00412b58
00412b56  33c0                     XOR EAX,EAX
00412b58  5f                       POP EDI
00412b59  5e                       POP ESI
00412b5a  59                       POP ECX
00412b5b  c9                       LEAVE
00412b5c  c3                       RET

; ---- alloc_and_unpack_sprites ----
00412b5d  6800a00400               PUSH 0x4a000
00412b62  6a00                     PUSH 0x0
00412b64  e860050000               CALL 0x004130c9
00412b69  85c0                     TEST EAX,EAX
00412b6b  740e                     JZ 0x00412b7b
00412b6d  8bf8                     MOV EDI,EAX
00412b6f  be08014200               MOV ESI,0x420108
00412b74  50                       PUSH EAX
00412b75  e823000000               CALL 0x00412b9d
00412b7a  58                       POP EAX
00412b7b  c3                       RET

; ---- FUN_00412b7c ----
00412b7c  80fd08                   CMP CH,0x8
00412b7f  7407                     JZ 0x00412b88
00412b81  8acd                     MOV CL,CH
00412b83  e8de000000               CALL 0x00412c66
00412b88  0fb7ca                   MOVZX ECX,DX
00412b8b  66ad                     LODSW ESI
00412b8d  33c2                     XOR EAX,EDX
00412b8f  6640                     INC AX
00412b91  7405                     JZ 0x00412b98
00412b93  e951030000               JMP 0x00412ee9
00412b98  f3a4                     MOVSB.REP ES:EDI,ESI
00412b9a  58                       POP EAX
00412b9b  eb0d                     JMP 0x00412baa

; ---- unpack ----
00412b9d  c6056e0f430000           MOV byte ptr [0x00430f6e],0x0
00412ba4  893d70114300             MOV dword ptr [0x00431170],EDI
00412baa  b508                     MOV CH,0x8
00412bac  66ad                     LODSW ESI
00412bae  92                       XCHG EAX,EDX
00412baf  803d6e0f430000           CMP byte ptr [0x00430f6e],0x0
00412bb6  7560                     JNZ 0x00412c18
00412bb8  e89a000000               CALL 0x00412c57
00412bbd  d0156e0f4300             RCL byte ptr [0x00430f6e],0x1
00412bc3  e8d7010000               CALL 0x00412d9f
00412bc8  e8b1000000               CALL 0x00412c7e
00412bcd  84e4                     TEST AH,AH
00412bcf  7503                     JNZ 0x00412bd4
00412bd1  aa                       STOSB ES:EDI
00412bd2  ebf4                     JMP 0x00412bc8
00412bd4  3d00010000               CMP EAX,0x100
00412bd9  74d4                     JZ 0x00412baf
00412bdb  2dfe000000               SUB EAX,0xfe
00412be0  50                       PUSH EAX
00412be1  e831010000               CALL 0x00412d17
00412be6  91                       XCHG EAX,ECX
00412be7  59                       POP ECX
00412be8  56                       PUSH ESI
00412be9  8d77ff                   LEA ESI,[EDI + -0x1]
00412bec  2bf3                     SUB ESI,EBX
00412bee  7208                     JC 0x00412bf8
00412bf0  3b3570114300             CMP ESI,dword ptr [0x00431170]
00412bf6  731a                     JNC 0x00412c12
00412bf8  8b1d70114300             MOV EBX,dword ptr [0x00431170]
00412bfe  2bde                     SUB EBX,ESI
00412c00  3bd9                     CMP EBX,ECX
00412c02  730e                     JNC 0x00412c12
00412c04  87d9                     XCHG ECX,EBX
00412c06  2bd9                     SUB EBX,ECX
00412c08  f3a4                     MOVSB.REP ES:EDI,ESI
00412c0a  8b3570114300             MOV ESI,dword ptr [0x00431170]
00412c10  87d9                     XCHG ECX,EBX
00412c12  f3a4                     MOVSB.REP ES:EDI,ESI
00412c14  5e                       POP ESI
00412c15  91                       XCHG EAX,ECX
00412c16  ebba                     JMP 0x00412bd2
00412c18  c3                       RET
00412c19  c3                       RET

; ---- FUN_00412c1a ----
00412c1a  80f908                   CMP CL,0x8
00412c1d  7719                     JA 0x00412c38

; ---- FUN_00412c1f ----
00412c1f  53                       PUSH EBX
00412c20  33c0                     XOR EAX,EAX
00412c22  33db                     XOR EBX,EBX
00412c24  8ad9                     MOV BL,CL
00412c26  8a83fe004200             MOV AL,byte ptr [EBX + 0x4200fe]
00412c2c  22c2                     AND AL,DL
00412c2e  e833000000               CALL 0x00412c66
00412c33  5b                       POP EBX
00412c34  0fb7c0                   MOVZX EAX,AX
00412c37  c3                       RET
00412c38  53                       PUSH EBX
00412c39  33db                     XOR EBX,EBX
00412c3b  8ad9                     MOV BL,CL
00412c3d  b108                     MOV CL,0x8
00412c3f  2ad9                     SUB BL,CL
00412c41  e8d9ffffff               CALL 0x00412c1f
00412c46  8acb                     MOV CL,BL
00412c48  8ad8                     MOV BL,AL
00412c4a  e8d0ffffff               CALL 0x00412c1f
00412c4f  0af8                     OR BH,AL
00412c51  93                       XCHG EAX,EBX
00412c52  5b                       POP EBX
00412c53  0fb7c0                   MOVZX EAX,AX
00412c56  c3                       RET

; ---- FUN_00412c57 ----
00412c57  d1ea                     SHR EDX,0x1
00412c59  fecd                     DEC CH
00412c5b  7401                     JZ 0x00412c5e
00412c5d  c3                       RET

; ---- FUN_00412c5e ----
00412c5e  9c                       PUSHFD
00412c5f  8a36                     MOV DH,byte ptr [ESI]
00412c61  46                       INC ESI
00412c62  b508                     MOV CH,0x8
00412c64  9d                       POPFD
00412c65  c3                       RET

; ---- FUN_00412c66 ----
00412c66  2ae9                     SUB CH,CL
00412c68  7710                     JA 0x00412c7a
00412c6a  f6dd                     NEG CH
00412c6c  2acd                     SUB CL,CH
00412c6e  66d3ea                   SHR DX,CL
00412c71  8acd                     MOV CL,CH
00412c73  e8e6ffffff               CALL 0x00412c5e
00412c78  2ae9                     SUB CH,CL
00412c7a  66d3ea                   SHR DX,CL
00412c7d  c3                       RET

; ---- FUN_00412c7e ----
00412c7e  0fb6da                   MOVZX EBX,DL
00412c81  0fbf1c5d00064300         MOVSX EBX,word ptr [EBX*0x2 + 0x430600]
00412c89  85db                     TEST EBX,EBX
00412c8b  781c                     JS 0x00412ca9
00412c8d  8a8ba0044300             MOV CL,byte ptr [EBX + 0x4304a0]
00412c93  84c9                     TEST CL,CL
00412c95  0f844e020000             JZ 0x00412ee9
00412c9b  e8c6ffffff               CALL 0x00412c66
00412ca0  93                       XCHG EAX,EBX
00412ca1  3d09010000               CMP EAX,0x109
00412ca6  730d                     JNC 0x00412cb5
00412ca8  c3                       RET
00412ca9  b8000a4300               MOV EAX,0x430a00
00412cae  e838000000               CALL 0x00412ceb
00412cb3  ebde                     JMP 0x00412c93
00412cb5  3d1d010000               CMP EAX,0x11d
00412cba  7429                     JZ 0x00412ce5
00412cbc  2d01010000               SUB EAX,0x101
00412cc1  8ac8                     MOV CL,AL
00412cc3  d0e9                     SHR CL,0x1
00412cc5  d0e9                     SHR CL,0x1
00412cc7  6649                     DEC CX
00412cc9  66250300                 AND AX,0x3
00412ccd  0404                     ADD AL,0x4
00412ccf  66d3e0                   SHL AX,CL
00412cd2  66050101                 ADD AX,0x101
00412cd6  0fb7c0                   MOVZX EAX,AX
00412cd9  93                       XCHG EAX,EBX
00412cda  e83bffffff               CALL 0x00412c1a
00412cdf  03c3                     ADD EAX,EBX
00412ce1  0fb7c0                   MOVZX EAX,AX
00412ce4  c3                       RET
00412ce5  b800020000               MOV EAX,0x200
00412cea  c3                       RET

; ---- FUN_00412ceb ----
00412ceb  b108                     MOV CL,0x8
00412ced  e874ffffff               CALL 0x00412c66
00412cf2  56                       PUSH ESI
00412cf3  96                       XCHG EAX,ESI
00412cf4  8ac2                     MOV AL,DL
00412cf6  32c9                     XOR CL,CL
00412cf8  66f7d3                   NOT BX
00412cfb  fec1                     INC CL
00412cfd  66d1eb                   SHR BX,0x1
00412d00  66d1e8                   SHR AX,0x1
00412d03  66d1d3                   RCL BX,0x1
00412d06  66d1e3                   SHL BX,0x1
00412d09  0fb7db                   MOVZX EBX,BX
00412d0c  668b1c33                 MOV BX,word ptr [EBX + ESI*0x1]
00412d10  6685db                   TEST BX,BX
00412d13  78e3                     JS 0x00412cf8
00412d15  5e                       POP ESI
00412d16  c3                       RET

; ---- FUN_00412d17 ----
00412d17  0fb6da                   MOVZX EBX,DL
00412d1a  0fbf1c5d00084300         MOVSX EBX,word ptr [EBX*0x2 + 0x430800]
00412d22  85db                     TEST EBX,EBX
00412d24  782b                     JS 0x00412d51
00412d26  8a8be0054300             MOV CL,byte ptr [EBX + 0x4305e0]
00412d2c  e835ffffff               CALL 0x00412c66
00412d31  80fb04                   CMP BL,0x4
00412d34  721a                     JC 0x00412d50
00412d36  93                       XCHG EAX,EBX
00412d37  8ac8                     MOV CL,AL
00412d39  d0e9                     SHR CL,0x1
00412d3b  6649                     DEC CX
00412d3d  2401                     AND AL,0x1
00412d3f  0402                     ADD AL,0x2
00412d41  66d3e0                   SHL AX,CL
00412d44  93                       XCHG EAX,EBX
00412d45  e8d0feffff               CALL 0x00412c1a
00412d4a  6603d8                   ADD BX,AX
00412d4d  0fb7db                   MOVZX EBX,BX
00412d50  c3                       RET
00412d51  b8800e4300               MOV EAX,0x430e80
00412d56  e890ffffff               CALL 0x00412ceb
00412d5b  ebcf                     JMP 0x00412d2c
00412d5d  56                       PUSH ESI
00412d5e  51                       PUSH ECX
00412d5f  bfa0044300               MOV EDI,0x4304a0
00412d64  b990000000               MOV ECX,0x90
00412d69  b008                     MOV AL,0x8
00412d6b  f3aa                     STOSB.REP ES:EDI
00412d6d  b170                     MOV CL,0x70
00412d6f  fec0                     INC AL
00412d71  f3aa                     STOSB.REP ES:EDI
00412d73  b118                     MOV CL,0x18
00412d75  b007                     MOV AL,0x7
00412d77  f3aa                     STOSB.REP ES:EDI
00412d79  b108                     MOV CL,0x8
00412d7b  fec0                     INC AL
00412d7d  f3aa                     STOSB.REP ES:EDI
00412d7f  bfe0054300               MOV EDI,0x4305e0
00412d84  b120                     MOV CL,0x20
00412d86  890d4a0f4300             MOV dword ptr [0x00430f4a],ECX
00412d8c  b005                     MOV AL,0x5
00412d8e  f3aa                     STOSB.REP ES:EDI
00412d90  c705620f430020010000     MOV dword ptr [0x00430f62],0x120
00412d9a  e914010000               JMP 0x00412eb3

; ---- FUN_00412d9f ----
00412d9f  b102                     MOV CL,0x2
00412da1  e874feffff               CALL 0x00412c1a
00412da6  48                       DEC EAX
00412da7  7905                     JNS 0x00412dae
00412da9  e9cefdffff               JMP 0x00412b7c
00412dae  57                       PUSH EDI
00412daf  74ac                     JZ 0x00412d5d
00412db1  48                       DEC EAX
00412db2  7405                     JZ 0x00412db9
00412db4  e930010000               JMP 0x00412ee9
00412db9  b105                     MOV CL,0x5
00412dbb  e85afeffff               CALL 0x00412c1a
00412dc0  0501010000               ADD EAX,0x101
00412dc5  a3620f4300               MOV [0x00430f62],EAX
00412dca  b105                     MOV CL,0x5
00412dcc  e849feffff               CALL 0x00412c1a
00412dd1  40                       INC EAX
00412dd2  a34a0f4300               MOV [0x00430f4a],EAX
00412dd7  51                       PUSH ECX
00412dd8  bf4e0f4300               MOV EDI,0x430f4e
00412ddd  b913000000               MOV ECX,0x13
00412de2  32c0                     XOR AL,AL
00412de4  f3aa                     STOSB.REP ES:EDI
00412de6  59                       POP ECX
00412de7  b104                     MOV CL,0x4
00412de9  e82cfeffff               CALL 0x00412c1a
00412dee  83c004                   ADD EAX,0x4
00412df1  bfec004200               MOV EDI,0x4200ec
00412df6  8bef                     MOV EBP,EDI
00412df8  03e8                     ADD EBP,EAX
00412dfa  33db                     XOR EBX,EBX
00412dfc  b103                     MOV CL,0x3
00412dfe  e817feffff               CALL 0x00412c1a
00412e03  8a1f                     MOV BL,byte ptr [EDI]
00412e05  88834e0f4300             MOV byte ptr [EBX + 0x430f4e],AL
00412e0b  47                       INC EDI
00412e0c  3bfd                     CMP EDI,EBP
00412e0e  72ec                     JC 0x00412dfc
00412e10  56                       PUSH ESI
00412e11  51                       PUSH ECX
00412e12  bf700f4300               MOV EDI,0x430f70
00412e17  be4e0f4300               MOV ESI,0x430f4e
00412e1c  b813000000               MOV EAX,0x13
00412e21  e8cd000000               CALL 0x00412ef3
00412e26  59                       POP ECX
00412e27  5e                       POP ESI
00412e28  8b2d620f4300             MOV EBP,dword ptr [0x00430f62]
00412e2e  032d4a0f4300             ADD EBP,dword ptr [0x00430f4a]
00412e34  bfa0044300               MOV EDI,0x4304a0
00412e39  0fb6da                   MOVZX EBX,DL
00412e3c  d1e3                     SHL EBX,0x1
00412e3e  660fb69b700f4300         MOVZX BX,byte ptr [EBX + 0x430f70]
00412e46  8a8b4e0f4300             MOV CL,byte ptr [EBX + 0x430f4e]
00412e4c  e815feffff               CALL 0x00412c66
00412e51  8ac3                     MOV AL,BL
00412e53  3c10                     CMP AL,0x10
00412e55  7306                     JNC 0x00412e5d
00412e57  aa                       STOSB ES:EDI
00412e58  4d                       DEC EBP
00412e59  75de                     JNZ 0x00412e39
00412e5b  eb3c                     JMP 0x00412e99
00412e5d  770e                     JA 0x00412e6d
00412e5f  b102                     MOV CL,0x2
00412e61  e8b4fdffff               CALL 0x00412c1a
00412e66  0403                     ADD AL,0x3
00412e68  8a4fff                   MOV CL,byte ptr [EDI + -0x1]
00412e6b  eb1b                     JMP 0x00412e88
00412e6d  3c11                     CMP AL,0x11
00412e6f  770b                     JA 0x00412e7c
00412e71  b103                     MOV CL,0x3
00412e73  e8a2fdffff               CALL 0x00412c1a
00412e78  0403                     ADD AL,0x3
00412e7a  eb0a                     JMP 0x00412e86
00412e7c  b107                     MOV CL,0x7
00412e7e  e897fdffff               CALL 0x00412c1a
00412e83  83c00b                   ADD EAX,0xb
00412e86  32c9                     XOR CL,CL
00412e88  51                       PUSH ECX
00412e89  86c1                     XCHG CL,AL
00412e8b  0fb6c9                   MOVZX ECX,CL
00412e8e  2be9                     SUB EBP,ECX
00412e90  7257                     JC 0x00412ee9
00412e92  f3aa                     STOSB.REP ES:EDI
00412e94  59                       POP ECX
00412e95  85ed                     TEST EBP,EBP
00412e97  75a0                     JNZ 0x00412e39
00412e99  56                       PUSH ESI
00412e9a  51                       PUSH ECX
00412e9b  bea0044300               MOV ESI,0x4304a0
00412ea0  bfe0054300               MOV EDI,0x4305e0
00412ea5  0335620f4300             ADD ESI,dword ptr [0x00430f62]
00412eab  8b0d4a0f4300             MOV ECX,dword ptr [0x00430f4a]
00412eb1  f3a4                     MOVSB.REP ES:EDI,ESI
00412eb3  a1620f4300               MOV EAX,[0x00430f62]
00412eb8  bea0044300               MOV ESI,0x4304a0
00412ebd  bf00064300               MOV EDI,0x430600
00412ec2  bd000a4300               MOV EBP,0x430a00
00412ec7  e827000000               CALL 0x00412ef3
00412ecc  a14a0f4300               MOV EAX,[0x00430f4a]
00412ed1  bee0054300               MOV ESI,0x4305e0
00412ed6  bf00084300               MOV EDI,0x430800
00412edb  bd800e4300               MOV EBP,0x430e80
00412ee0  e80e000000               CALL 0x00412ef3
00412ee5  59                       POP ECX
00412ee6  5e                       POP ESI
00412ee7  5f                       POP EDI
00412ee8  c3                       RET

; ---- FUN_00412ee9 ----
00412ee9  b801000000               MOV EAX,0x1
00412eee  e926fdffff               JMP 0x00412c19

; ---- FUN_00412ef3 ----
00412ef3  85c0                     TEST EAX,EAX
00412ef5  74f1                     JZ 0x00412ee8
00412ef7  52                       PUSH EDX
00412ef8  a3240f4300               MOV [0x00430f24],EAX
00412efd  893d660f4300             MOV dword ptr [0x00430f66],EDI
00412f03  bf280f4300               MOV EDI,0x430f28
00412f08  57                       PUSH EDI
00412f09  b908000000               MOV ECX,0x8
00412f0e  33c0                     XOR EAX,EAX
00412f10  f3ab                     STOSD.REP ES:EDI
00412f12  5f                       POP EDI
00412f13  56                       PUSH ESI
00412f14  8b0d240f4300             MOV ECX,dword ptr [0x00430f24]
00412f1a  33c0                     XOR EAX,EAX
00412f1c  ac                       LODSB ESI
00412f1d  66ff0447                 INC word ptr [EDI + EAX*0x2]
00412f21  e2f9                     LOOP 0x00412f1c
00412f23  be000f4300               MOV ESI,0x430f00
00412f28  bb02000000               MOV EBX,0x2
00412f2d  33c0                     XOR EAX,EAX
00412f2f  66890433                 MOV word ptr [EBX + ESI*0x1],AX
00412f33  b10f                     MOV CL,0xf
00412f35  660383280f4300           ADD AX,word ptr [EBX + 0x430f28]
00412f3c  66d1e0                   SHL AX,0x1
00412f3f  43                       INC EBX
00412f40  43                       INC EBX
00412f41  66890433                 MOV word ptr [EBX + ESI*0x1],AX
00412f45  e2ee                     LOOP 0x00412f35
00412f47  66833c3300               CMP word ptr [EBX + ESI*0x1],0x0
00412f4c  7419                     JZ 0x00412f67
00412f4e  be2a0f4300               MOV ESI,0x430f2a
00412f53  b90f000000               MOV ECX,0xf
00412f58  33db                     XOR EBX,EBX
00412f5a  66ad                     LODSW ESI
00412f5c  6603d8                   ADD BX,AX
00412f5f  e2f9                     LOOP 0x00412f5a
00412f61  6683fb01                 CMP BX,0x1
00412f65  7782                     JA 0x00412ee9
00412f67  5e                       POP ESI
00412f68  56                       PUSH ESI
00412f69  8b0d240f4300             MOV ECX,dword ptr [0x00430f24]
00412f6f  bf60024300               MOV EDI,0x430260
00412f74  33c0                     XOR EAX,EAX
00412f76  ac                       LODSB ESI
00412f77  85c0                     TEST EAX,EAX
00412f79  7416                     JZ 0x00412f91
00412f7b  8bd8                     MOV EBX,EAX
00412f7d  668b045d000f4300         MOV AX,word ptr [EBX*0x2 + 0x430f00]
00412f85  6640                     INC AX
00412f87  6689045d000f4300         MOV word ptr [EBX*0x2 + 0x430f00],AX
00412f8f  6648                     DEC AX
00412f91  66ab                     STOSW ES:EDI
00412f93  e2df                     LOOP 0x00412f74
00412f95  5e                       POP ESI
00412f96  56                       PUSH ESI
00412f97  bf60024300               MOV EDI,0x430260
00412f9c  8b15240f4300             MOV EDX,dword ptr [0x00430f24]
00412fa2  ac                       LODSB ESI
00412fa3  8ac8                     MOV CL,AL
00412fa5  49                       DEC ECX
00412fa6  781d                     JS 0x00412fc5
00412fa8  741b                     JZ 0x00412fc5
00412faa  668b1f                   MOV BX,word ptr [EDI]
00412fad  33c0                     XOR EAX,EAX
00412faf  66d1eb                   SHR BX,0x1
00412fb2  66d1d0                   RCL AX,0x1
00412fb5  e0f8                     LOOPNZ 0x00412faf
00412fb7  41                       INC ECX
00412fb8  66d1eb                   SHR BX,0x1
00412fbb  66d3d0                   RCL AX,CL
00412fbe  66ab                     STOSW ES:EDI
00412fc0  4a                       DEC EDX
00412fc1  75df                     JNZ 0x00412fa2
00412fc3  eb07                     JMP 0x00412fcc
00412fc5  47                       INC EDI
00412fc6  47                       INC EDI
00412fc7  33c9                     XOR ECX,ECX
00412fc9  4a                       DEC EDX
00412fca  75d6                     JNZ 0x00412fa2
00412fcc  5e                       POP ESI
00412fcd  8b3d660f4300             MOV EDI,dword ptr [0x00430f66]
00412fd3  b980000000               MOV ECX,0x80
00412fd8  33c0                     XOR EAX,EAX
00412fda  f3ab                     STOSD.REP ES:EDI
00412fdc  bf60024300               MOV EDI,0x430260
00412fe1  8b15240f4300             MOV EDX,dword ptr [0x00430f24]
00412fe7  a3240f4300               MOV [0x00430f24],EAX
00412fec  4a                       DEC EDX
00412fed  03f2                     ADD ESI,EDX
00412fef  03fa                     ADD EDI,EDX
00412ff1  03fa                     ADD EDI,EDX
00412ff3  fd                       STD
00412ff4  ac                       LODSB ESI
00412ff5  84c0                     TEST AL,AL
00412ff7  7425                     JZ 0x0041301e
00412ff9  3c08                     CMP AL,0x8
00412ffb  7729                     JA 0x00413026
00412ffd  91                       XCHG EAX,ECX
00412ffe  b801000000               MOV EAX,0x1
00413003  41                       INC ECX
00413004  d3e0                     SHL EAX,CL
00413006  0fb71f                   MOVZX EBX,word ptr [EDI]
00413009  d1e3                     SHL EBX,0x1
0041300b  56                       PUSH ESI
0041300c  8b35660f4300             MOV ESI,dword ptr [0x00430f66]
00413012  66891433                 MOV word ptr [EBX + ESI*0x1],DX
00413016  03d8                     ADD EBX,EAX
00413018  80ff02                   CMP BH,0x2
0041301b  72f5                     JC 0x00413012
0041301d  5e                       POP ESI
0041301e  4f                       DEC EDI
0041301f  4f                       DEC EDI
00413020  4a                       DEC EDX
00413021  79d1                     JNS 0x00412ff4
00413023  fc                       CLD
00413024  5a                       POP EDX
00413025  c3                       RET
00413026  2c08                     SUB AL,0x8
00413028  8ac8                     MOV CL,AL
0041302a  668b07                   MOV AX,word ptr [EDI]
0041302d  0fb6d8                   MOVZX EBX,AL
00413030  d1e3                     SHL EBX,0x1
00413032  031d660f4300             ADD EBX,dword ptr [0x00430f66]
00413038  b501                     MOV CH,0x1
0041303a  56                       PUSH ESI
0041303b  52                       PUSH EDX
0041303c  66833b00                 CMP word ptr [EBX],0x0
00413040  7522                     JNZ 0x00413064
00413042  8b15240f4300             MOV EDX,dword ptr [0x00430f24]
00413048  8bf2                     MOV ESI,EDX
0041304a  d1ea                     SHR EDX,0x1
0041304c  f7d2                     NOT EDX
0041304e  668913                   MOV word ptr [EBX],DX
00413051  8305240f430004           ADD dword ptr [0x00430f24],0x4
00413058  33d2                     XOR EDX,EDX
0041305a  6689543500               MOV word ptr [EBP + ESI*0x1],DX
0041305f  6689543502               MOV word ptr [EBP + ESI*0x1 + 0x2],DX
00413064  0fbf1b                   MOVSX EBX,word ptr [EBX]
00413067  f7d3                     NOT EBX
00413069  d1e3                     SHL EBX,0x1
0041306b  03dd                     ADD EBX,EBP
0041306d  84e5                     TEST CH,AH
0041306f  7402                     JZ 0x00413073
00413071  43                       INC EBX
00413072  43                       INC EBX
00413073  d0e5                     SHL CH,0x1
00413075  fec9                     DEC CL
00413077  75c3                     JNZ 0x0041303c
00413079  5a                       POP EDX
0041307a  668913                   MOV word ptr [EBX],DX
0041307d  eb9e                     JMP 0x0041301d

; ---- FUN_0041307f ----
0041307f  00                       ?? 00h

; ---- str_append ----
00413080  51                       PUSH ECX
00413081  56                       PUSH ESI
00413082  57                       PUSH EDI
00413083  89c7                     MOV EDI,EAX
00413085  89d6                     MOV ESI,EDX
00413087  06                       PUSH ES
00413088  1e                       PUSH DS
00413089  07                       POP ES
0041308a  57                       PUSH EDI
0041308b  2bc9                     SUB ECX,ECX
0041308d  49                       DEC ECX
0041308e  b000                     MOV AL,0x0
00413090  f2ae                     SCASB.REPNE ES:EDI
00413092  4f                       DEC EDI
00413093  8a06                     MOV AL,byte ptr [ESI]
00413095  8807                     MOV byte ptr [EDI],AL
00413097  3c00                     CMP AL,0x0
00413099  0f8410000000             JZ 0x004130af
0041309f  8a4601                   MOV AL,byte ptr [ESI + 0x1]
004130a2  83c602                   ADD ESI,0x2
004130a5  884701                   MOV byte ptr [EDI + 0x1],AL
004130a8  83c702                   ADD EDI,0x2
004130ab  3c00                     CMP AL,0x0
004130ad  75e4                     JNZ 0x00413093
004130af  5f                       POP EDI
004130b0  07                       POP ES
004130b1  89f8                     MOV EAX,EDI
004130b3  5f                       POP EDI
004130b4  5e                       POP ESI
004130b5  59                       POP ECX
004130b6  c3                       RET

; ---- CreateDIBitmap ----
004130b7  ff25a4004400             JMP dword ptr [0x004400a4]

; ---- CreatePalette ----
004130bd  ff25ac004400             JMP dword ptr [0x004400ac]

; ---- GlobalFree ----
004130c3  ff2578024400             JMP dword ptr [0x00440278]

; ---- GlobalAlloc ----
004130c9  ff2574024400             JMP dword ptr [0x00440274]

; ---- SetBkColor ----
004130cf  ff25d8004400             JMP dword ptr [0x004400d8]

; ---- LoadBitmapA ----
004130d5  ff25f0014400             JMP dword ptr [0x004401f0]

; ---- GetDlgItemTextA ----
004130db  ff25c4014400             JMP dword ptr [0x004401c4]

; ---- SetDlgItemTextA ----
004130e1  ff2510024400             JMP dword ptr [0x00440210]

; ---- CreateFontA ----
004130e7  ff25a8004400             JMP dword ptr [0x004400a8]

; ---- EndDialog ----
004130ed  ff25b0014400             JMP dword ptr [0x004401b0]

; ---- MoveWindow ----
004130f3  ff2504024400             JMP dword ptr [0x00440204]

; ---- GetWindowRect ----
004130f9  ff25d8014400             JMP dword ptr [0x004401d8]

; ---- SetFocus ----
004130ff  ff2514024400             JMP dword ptr [0x00440214]

; ---- PostQuitMessage ----
00413105  ff2508024400             JMP dword ptr [0x00440208]

; ---- KillTimer ----
0041310b  ff25e8014400             JMP dword ptr [0x004401e8]

; ---- DeleteDC ----
00413111  ff25b8004400             JMP dword ptr [0x004400b8]

; ---- CreateDialogParamA ----
00413117  ff2594014400             JMP dword ptr [0x00440194]

; ---- CheckMenuItem ----
0041311d  ff2590014400             JMP dword ptr [0x00440190]

; ---- GetMenu ----
00413123  ff25c8014400             JMP dword ptr [0x004401c8]

; ---- DestroyWindow ----
00413129  ff25a0014400             JMP dword ptr [0x004401a0]

; ---- MessageBeep ----
0041312f  ff25fc014400             JMP dword ptr [0x004401fc]

; ---- EndPaint ----
00413135  ff25b4014400             JMP dword ptr [0x004401b4]

; ---- RealizePalette ----
0041313b  ff25cc004400             JMP dword ptr [0x004400cc]

; ---- SelectPalette ----
00413141  ff25d4004400             JMP dword ptr [0x004400d4]

; ---- BeginPaint ----
00413147  ff258c014400             JMP dword ptr [0x0044018c]

; ---- GetTickCount ----
0041314d  ff2570024400             JMP dword ptr [0x00440270]

; ---- SetTimer ----
00413153  ff2518024400             JMP dword ptr [0x00440218]

; ---- CreateCompatibleDC ----
00413159  ff25a0004400             JMP dword ptr [0x004400a0]

; ---- DefWindowProcA ----
0041315f  ff259c014400             JMP dword ptr [0x0044019c]

; ---- GetDC ----
00413165  ff25c0014400             JMP dword ptr [0x004401c0]

; ---- IsIconic ----
0041316b  ff25e4014400             JMP dword ptr [0x004401e4]

; ---- DialogBoxParamA ----
00413171  ff25a4014400             JMP dword ptr [0x004401a4]

; ---- _lwrite ----
00413177  ff2590024400             JMP dword ptr [0x00440290]

; ---- _lcreat ----
0041317d  ff2584024400             JMP dword ptr [0x00440284]

; ---- _lclose ----
00413183  ff2580024400             JMP dword ptr [0x00440280]

; ---- _lread ----
00413189  ff258c024400             JMP dword ptr [0x0044028c]

; ---- _lopen ----
0041318f  ff2588024400             JMP dword ptr [0x00440288]

; ---- CreateSolidBrush ----
00413195  ff25b4004400             JMP dword ptr [0x004400b4]

; ---- GetClientRect ----
0041319b  ff25bc014400             JMP dword ptr [0x004401bc]

; ---- DrawTextA ----
004131a1  ff25ac014400             JMP dword ptr [0x004401ac]

; ---- SetBkMode ----
004131a7  ff25dc004400             JMP dword ptr [0x004400dc]

; ---- SetTextColor ----
004131ad  ff25e0004400             JMP dword ptr [0x004400e0]

; ---- GetSysColor ----
004131b3  ff25d0014400             JMP dword ptr [0x004401d0]

; ---- FillRect ----
004131b9  ff25b8014400             JMP dword ptr [0x004401b8]

; ---- MessageBoxA ----
004131bf  ff2500024400             JMP dword ptr [0x00440200]

; ---- InvalidateRect ----
004131c5  ff25dc014400             JMP dword ptr [0x004401dc]

; ---- Sleep ----
004131cb  ff257c024400             JMP dword ptr [0x0044027c]

; ---- BitBlt ----
004131d1  ff259c004400             JMP dword ptr [0x0044009c]

; ---- DeleteObject ----
004131d7  ff25bc004400             JMP dword ptr [0x004400bc]

; ---- LineTo ----
004131dd  ff25c4004400             JMP dword ptr [0x004400c4]

; ---- MoveToEx ----
004131e3  ff25c8004400             JMP dword ptr [0x004400c8]

; ---- SelectObject ----
004131e9  ff25d0004400             JMP dword ptr [0x004400d0]

; ---- CreatePen ----
004131ef  ff25b0004400             JMP dword ptr [0x004400b0]

; ---- DispatchMessageA ----
004131f5  ff25a8014400             JMP dword ptr [0x004401a8]

; ---- TranslateMessage ----
004131fb  ff2524024400             JMP dword ptr [0x00440224]

; ---- TranslateAcceleratorA ----
00413201  ff2520024400             JMP dword ptr [0x00440220]

; ---- IsDialogMessageA ----
00413207  ff25e0014400             JMP dword ptr [0x004401e0]

; ---- GetMessageA ----
0041320d  ff25cc014400             JMP dword ptr [0x004401cc]

; ---- UpdateWindow ----
00413213  ff2528024400             JMP dword ptr [0x00440228]

; ---- ShowWindow ----
00413219  ff251c024400             JMP dword ptr [0x0044021c]

; ---- LoadAcceleratorsA ----
0041321f  ff25ec014400             JMP dword ptr [0x004401ec]

; ---- CreateWindowExA ----
00413225  ff2598014400             JMP dword ptr [0x00440198]

; ---- GetSystemMetrics ----
0041322b  ff25d4014400             JMP dword ptr [0x004401d4]

; ---- RegisterClassA ----
00413231  ff250c024400             JMP dword ptr [0x0044020c]

; ---- GetStockObject ----
00413237  ff25c0004400             JMP dword ptr [0x004400c0]

; ---- LoadCursorA ----
0041323d  ff25f4014400             JMP dword ptr [0x004401f4]

; ---- LoadIconA ----
00413243  ff25f8014400             JMP dword ptr [0x004401f8]

; ---- ExitProcess ----
00413249  ff2564024400             JMP dword ptr [0x00440264]

; ---- GetCommandLineA ----
0041324f  ff2568024400             JMP dword ptr [0x00440268]

; ---- GetModuleHandleA ----
00413255  ff256c024400             JMP dword ptr [0x0044026c]
0041325b  00                       ?? 00h
0041325c  00                       ?? 00h
0041325d  00                       ?? 00h
0041325e  00                       ?? 00h
0041325f  00                       ?? 00h
00413260  00                       ?? 00h
00413261  00                       ?? 00h
00413262  00                       ?? 00h
00413263  00                       ?? 00h
00413264  00                       ?? 00h
00413265  00                       ?? 00h
00413266  00                       ?? 00h
00413267  00                       ?? 00h
00413268  00                       ?? 00h
00413269  00                       ?? 00h
0041326a  00                       ?? 00h
0041326b  00                       ?? 00h
0041326c  00                       ?? 00h
0041326d  00                       ?? 00h
0041326e  00                       ?? 00h
0041326f  00                       ?? 00h
00413270  00                       ?? 00h
00413271  00                       ?? 00h
00413272  00                       ?? 00h
00413273  00                       ?? 00h
00413274  00                       ?? 00h
00413275  00                       ?? 00h
00413276  00                       ?? 00h
00413277  00                       ?? 00h
00413278  00                       ?? 00h
00413279  00                       ?? 00h
0041327a  00                       ?? 00h
0041327b  00                       ?? 00h
0041327c  00                       ?? 00h
0041327d  00                       ?? 00h
0041327e  00                       ?? 00h
0041327f  00                       ?? 00h
00413280  00                       ?? 00h
00413281  00                       ?? 00h
00413282  00                       ?? 00h
00413283  00                       ?? 00h
00413284  00                       ?? 00h
00413285  00                       ?? 00h
00413286  00                       ?? 00h
00413287  00                       ?? 00h
00413288  00                       ?? 00h
00413289  00                       ?? 00h
0041328a  00                       ?? 00h
0041328b  00                       ?? 00h
0041328c  00                       ?? 00h
0041328d  00                       ?? 00h
0041328e  00                       ?? 00h
0041328f  00                       ?? 00h
00413290  00                       ?? 00h
00413291  00                       ?? 00h
00413292  00                       ?? 00h
00413293  00                       ?? 00h
00413294  00                       ?? 00h
00413295  00                       ?? 00h
00413296  00                       ?? 00h
00413297  00                       ?? 00h
00413298  00                       ?? 00h
00413299  00                       ?? 00h
0041329a  00                       ?? 00h
0041329b  00                       ?? 00h
0041329c  00                       ?? 00h
0041329d  00                       ?? 00h
0041329e  00                       ?? 00h
0041329f  00                       ?? 00h
004132a0  00                       ?? 00h
004132a1  00                       ?? 00h
004132a2  00                       ?? 00h
004132a3  00                       ?? 00h
004132a4  00                       ?? 00h
004132a5  00                       ?? 00h
004132a6  00                       ?? 00h
004132a7  00                       ?? 00h
004132a8  00                       ?? 00h
004132a9  00                       ?? 00h
004132aa  00                       ?? 00h
004132ab  00                       ?? 00h
004132ac  00                       ?? 00h
004132ad  00                       ?? 00h
004132ae  00                       ?? 00h
004132af  00                       ?? 00h
004132b0  00                       ?? 00h
004132b1  00                       ?? 00h
004132b2  00                       ?? 00h
004132b3  00                       ?? 00h
004132b4  00                       ?? 00h
004132b5  00                       ?? 00h
004132b6  00                       ?? 00h
004132b7  00                       ?? 00h
004132b8  00                       ?? 00h
004132b9  00                       ?? 00h
004132ba  00                       ?? 00h
004132bb  00                       ?? 00h
004132bc  00                       ?? 00h
004132bd  00                       ?? 00h
004132be  00                       ?? 00h
004132bf  00                       ?? 00h
004132c0  00                       ?? 00h
004132c1  00                       ?? 00h
004132c2  00                       ?? 00h
004132c3  00                       ?? 00h
004132c4  00                       ?? 00h
004132c5  00                       ?? 00h
004132c6  00                       ?? 00h
004132c7  00                       ?? 00h
004132c8  00                       ?? 00h
004132c9  00                       ?? 00h
004132ca  00                       ?? 00h
004132cb  00                       ?? 00h
004132cc  00                       ?? 00h
004132cd  00                       ?? 00h
004132ce  00                       ?? 00h
004132cf  00                       ?? 00h
004132d0  00                       ?? 00h
004132d1  00                       ?? 00h
004132d2  00                       ?? 00h
004132d3  00                       ?? 00h
004132d4  00                       ?? 00h
004132d5  00                       ?? 00h
004132d6  00                       ?? 00h
004132d7  00                       ?? 00h
004132d8  00                       ?? 00h
004132d9  00                       ?? 00h
004132da  00                       ?? 00h
004132db  00                       ?? 00h
004132dc  00                       ?? 00h
004132dd  00                       ?? 00h
004132de  00                       ?? 00h
004132df  00                       ?? 00h
004132e0  00                       ?? 00h
004132e1  00                       ?? 00h
004132e2  00                       ?? 00h
004132e3  00                       ?? 00h
004132e4  00                       ?? 00h
004132e5  00                       ?? 00h
004132e6  00                       ?? 00h
004132e7  00                       ?? 00h
004132e8  00                       ?? 00h
004132e9  00                       ?? 00h
004132ea  00                       ?? 00h
004132eb  00                       ?? 00h
004132ec  00                       ?? 00h
004132ed  00                       ?? 00h
004132ee  00                       ?? 00h
004132ef  00                       ?? 00h
004132f0  00                       ?? 00h
004132f1  00                       ?? 00h
004132f2  00                       ?? 00h
004132f3  00                       ?? 00h
004132f4  00                       ?? 00h
004132f5  00                       ?? 00h
004132f6  00                       ?? 00h
004132f7  00                       ?? 00h
004132f8  00                       ?? 00h
004132f9  00                       ?? 00h
004132fa  00                       ?? 00h
004132fb  00                       ?? 00h
004132fc  00                       ?? 00h
004132fd  00                       ?? 00h
004132fe  00                       ?? 00h
004132ff  00                       ?? 00h
00413300  00                       ?? 00h
00413301  00                       ?? 00h
00413302  00                       ?? 00h
00413303  00                       ?? 00h
00413304  00                       ?? 00h
00413305  00                       ?? 00h
00413306  00                       ?? 00h
00413307  00                       ?? 00h
00413308  00                       ?? 00h
00413309  00                       ?? 00h
0041330a  00                       ?? 00h
0041330b  00                       ?? 00h
0041330c  00                       ?? 00h
0041330d  00                       ?? 00h
0041330e  00                       ?? 00h
0041330f  00                       ?? 00h
00413310  00                       ?? 00h
00413311  00                       ?? 00h
00413312  00                       ?? 00h
00413313  00                       ?? 00h
00413314  00                       ?? 00h
00413315  00                       ?? 00h
00413316  00                       ?? 00h
00413317  00                       ?? 00h
00413318  00                       ?? 00h
00413319  00                       ?? 00h
0041331a  00                       ?? 00h
0041331b  00                       ?? 00h
0041331c  00                       ?? 00h
0041331d  00                       ?? 00h
0041331e  00                       ?? 00h
0041331f  00                       ?? 00h
00413320  00                       ?? 00h
00413321  00                       ?? 00h
00413322  00                       ?? 00h
00413323  00                       ?? 00h
00413324  00                       ?? 00h
00413325  00                       ?? 00h
00413326  00                       ?? 00h
00413327  00                       ?? 00h
00413328  00                       ?? 00h
00413329  00                       ?? 00h
0041332a  00                       ?? 00h
0041332b  00                       ?? 00h
0041332c  00                       ?? 00h
0041332d  00                       ?? 00h
0041332e  00                       ?? 00h
0041332f  00                       ?? 00h
00413330  00                       ?? 00h
00413331  00                       ?? 00h
00413332  00                       ?? 00h
00413333  00                       ?? 00h
00413334  00                       ?? 00h
00413335  00                       ?? 00h
00413336  00                       ?? 00h
00413337  00                       ?? 00h
00413338  00                       ?? 00h
00413339  00                       ?? 00h
0041333a  00                       ?? 00h
0041333b  00                       ?? 00h
0041333c  00                       ?? 00h
0041333d  00                       ?? 00h
0041333e  00                       ?? 00h
0041333f  00                       ?? 00h
00413340  00                       ?? 00h
00413341  00                       ?? 00h
00413342  00                       ?? 00h
00413343  00                       ?? 00h
00413344  00                       ?? 00h
00413345  00                       ?? 00h
00413346  00                       ?? 00h
00413347  00                       ?? 00h
00413348  00                       ?? 00h
00413349  00                       ?? 00h
0041334a  00                       ?? 00h
0041334b  00                       ?? 00h
0041334c  00                       ?? 00h
0041334d  00                       ?? 00h
0041334e  00                       ?? 00h
0041334f  00                       ?? 00h
00413350  00                       ?? 00h
00413351  00                       ?? 00h
00413352  00                       ?? 00h
00413353  00                       ?? 00h
00413354  00                       ?? 00h
00413355  00                       ?? 00h
00413356  00                       ?? 00h
00413357  00                       ?? 00h
00413358  00                       ?? 00h
00413359  00                       ?? 00h
0041335a  00                       ?? 00h
0041335b  00                       ?? 00h
0041335c  00                       ?? 00h
0041335d  00                       ?? 00h
0041335e  00                       ?? 00h
0041335f  00                       ?? 00h
00413360  00                       ?? 00h
00413361  00                       ?? 00h
00413362  00                       ?? 00h
00413363  00                       ?? 00h
00413364  00                       ?? 00h
00413365  00                       ?? 00h
00413366  00                       ?? 00h
00413367  00                       ?? 00h
00413368  00                       ?? 00h
00413369  00                       ?? 00h
0041336a  00                       ?? 00h
0041336b  00                       ?? 00h
0041336c  00                       ?? 00h
0041336d  00                       ?? 00h
0041336e  00                       ?? 00h
0041336f  00                       ?? 00h
00413370  00                       ?? 00h
00413371  00                       ?? 00h
00413372  00                       ?? 00h
00413373  00                       ?? 00h
00413374  00                       ?? 00h
00413375  00                       ?? 00h
00413376  00                       ?? 00h
00413377  00                       ?? 00h
00413378  00                       ?? 00h
00413379  00                       ?? 00h
0041337a  00                       ?? 00h
0041337b  00                       ?? 00h
0041337c  00                       ?? 00h
0041337d  00                       ?? 00h
0041337e  00                       ?? 00h
0041337f  00                       ?? 00h
00413380  00                       ?? 00h
00413381  00                       ?? 00h
00413382  00                       ?? 00h
00413383  00                       ?? 00h
00413384  00                       ?? 00h
00413385  00                       ?? 00h
00413386  00                       ?? 00h
00413387  00                       ?? 00h
00413388  00                       ?? 00h
00413389  00                       ?? 00h
0041338a  00                       ?? 00h
0041338b  00                       ?? 00h
0041338c  00                       ?? 00h
0041338d  00                       ?? 00h
0041338e  00                       ?? 00h
0041338f  00                       ?? 00h
00413390  00                       ?? 00h
00413391  00                       ?? 00h
00413392  00                       ?? 00h
00413393  00                       ?? 00h
00413394  00                       ?? 00h
00413395  00                       ?? 00h
00413396  00                       ?? 00h
00413397  00                       ?? 00h
00413398  00                       ?? 00h
00413399  00                       ?? 00h
0041339a  00                       ?? 00h
0041339b  00                       ?? 00h
0041339c  00                       ?? 00h
0041339d  00                       ?? 00h
0041339e  00                       ?? 00h
0041339f  00                       ?? 00h
004133a0  00                       ?? 00h
004133a1  00                       ?? 00h
004133a2  00                       ?? 00h
004133a3  00                       ?? 00h
004133a4  00                       ?? 00h
004133a5  00                       ?? 00h
004133a6  00                       ?? 00h
004133a7  00                       ?? 00h
004133a8  00                       ?? 00h
004133a9  00                       ?? 00h
004133aa  00                       ?? 00h
004133ab  00                       ?? 00h
004133ac  00                       ?? 00h
004133ad  00                       ?? 00h
004133ae  00                       ?? 00h
004133af  00                       ?? 00h
004133b0  00                       ?? 00h
004133b1  00                       ?? 00h
004133b2  00                       ?? 00h
004133b3  00                       ?? 00h
004133b4  00                       ?? 00h
004133b5  00                       ?? 00h
004133b6  00                       ?? 00h
004133b7  00                       ?? 00h
004133b8  00                       ?? 00h
004133b9  00                       ?? 00h
004133ba  00                       ?? 00h
004133bb  00                       ?? 00h
004133bc  00                       ?? 00h
004133bd  00                       ?? 00h
004133be  00                       ?? 00h
004133bf  00                       ?? 00h
004133c0  00                       ?? 00h
004133c1  00                       ?? 00h
004133c2  00                       ?? 00h
004133c3  00                       ?? 00h
004133c4  00                       ?? 00h
004133c5  00                       ?? 00h
004133c6  00                       ?? 00h
004133c7  00                       ?? 00h
004133c8  00                       ?? 00h
004133c9  00                       ?? 00h
004133ca  00                       ?? 00h
004133cb  00                       ?? 00h
004133cc  00                       ?? 00h
004133cd  00                       ?? 00h
004133ce  00                       ?? 00h
004133cf  00                       ?? 00h
004133d0  00                       ?? 00h
004133d1  00                       ?? 00h
004133d2  00                       ?? 00h
004133d3  00                       ?? 00h
004133d4  00                       ?? 00h
004133d5  00                       ?? 00h
004133d6  00                       ?? 00h
004133d7  00                       ?? 00h
004133d8  00                       ?? 00h
004133d9  00                       ?? 00h
004133da  00                       ?? 00h
004133db  00                       ?? 00h
004133dc  00                       ?? 00h
004133dd  00                       ?? 00h
004133de  00                       ?? 00h
004133df  00                       ?? 00h
004133e0  00                       ?? 00h
004133e1  00                       ?? 00h
004133e2  00                       ?? 00h
004133e3  00                       ?? 00h
004133e4  00                       ?? 00h
004133e5  00                       ?? 00h
004133e6  00                       ?? 00h
004133e7  00                       ?? 00h
004133e8  00                       ?? 00h
004133e9  00                       ?? 00h
004133ea  00                       ?? 00h
004133eb  00                       ?? 00h
004133ec  00                       ?? 00h
004133ed  00                       ?? 00h
004133ee  00                       ?? 00h
004133ef  00                       ?? 00h
004133f0  00                       ?? 00h
004133f1  00                       ?? 00h
004133f2  00                       ?? 00h
004133f3  00                       ?? 00h
004133f4  00                       ?? 00h
004133f5  00                       ?? 00h
004133f6  00                       ?? 00h
004133f7  00                       ?? 00h
004133f8  00                       ?? 00h
004133f9  00                       ?? 00h
004133fa  00                       ?? 00h
004133fb  00                       ?? 00h
004133fc  00                       ?? 00h
004133fd  00                       ?? 00h
004133fe  00                       ?? 00h
004133ff  00                       ?? 00h
