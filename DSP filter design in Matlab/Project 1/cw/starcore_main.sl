;***********************************************************************
;
; StarCore C Compiler MSWin32 Version 308 Build 22
; Version date Mar  7 2008 10:59:36 (zro03-ws254)
;
; Compilation date :	Fri Dec 07 17:03:20 2012
; File Name :		starcore_main.sl
; Invocation line: scc -g -ge -env C:\Program Files\Freescale\CodeWarrior for StarCore 3.2\StarCore_Support\compiler -be -arch sc140 -sc -mod -u0 -Og -O2 -s -Xlnk -w -Xlnk -n -o C:\Documents and Settings\Sorin\Desktop\Tema PSC\442G_Iepure_Albert\bin\project.eld test_Data\C_for_SC_Simulator\ObjectCode\starcore_main.obj test_Data\C_for_SC_Simulator\ObjectCode\prod.obj
;
;***********************************************************************
     .FILE	"C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/starcore_main.c"
;%%%%%%%%%%%%%   Source Files:  %%%%%%%%%%%%%
;file 1 "C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/starcore_main.c"
;file 2 "C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/functions.h"
;file 3 "C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/constants.h"
;file 4 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/ansi_parms.h"
;file 5 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/cstddef"
;file 6 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/stddef.h"
;file 7 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/ioprim.h"
;file 8 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/cstdarg"
;file 9 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/cstdio"
;file 10 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/os_enum.h"
;file 11 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/ansi_prefix_StarCore.h"
;file 12 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/mslGlobals.h"
;file 13 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/msl_c_version.h"
;file 14 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/stdio.h"
;file 15 "C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include/prototype.h"
;file 16 "C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/prod.c"
;file 17 "D:/_build/eb22_3x00_sp8_pre4/_library/src/host/prototype.c"
;file 18 "D:/_build/eb22_3x00_sp8_pre4/_library/include/prototype.h"
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     OPT BE
     IF !@DEF('.slld') 
     DEFINE .slld '0'                ; tell the assembler if the support for long long & double was enabled
     ENDIF 
;PRAGMA opt_mw_info 1
     NOTE "SCC Version 308 Build 22"
     NOTE "MW FrontEnd (mwfe:V.18) for the Enterprise Compiler ( V4.0 ),  compiled the Feb 28 2008 at 20:55:25"
     NOTE "Saxo Tools Linker Icode Optimizer V4.0, version of Mar  6 2008 18:43:18, internal Icode, icode-2-170[EB22SP8/EB22SP8] for SC"
     NOTE "StarCore LLT Version Engineering Build 22 SP8, Compiled on Mar  7 2008 10:59:36 (zro03-ws254) [Internal release version: MDCR_270.5-3_Fri Mar 7 10:49:00 EEDT 2008 ]"
     NOTE "Invocation line: scc -g -ge -env C:\Program Files\Freescale\CodeWarrior for StarCore 3.2\StarCore_Support\compiler -be -arch sc140 -sc -mod -u0 -Og -O2 -s -Xlnk -w -Xlnk -n -o C:\Documents and Settings\Sorin\Desktop\Tema PSC\442G_Iepure_Albert\bin\project.eld test_Data\C_for_SC_Simulator\ObjectCode\starcore_main.obj test_Data\C_for_SC_Simulator\ObjectCode\prod.obj "


;PRAGMA dictionary v110 _fp
;PRAGMA dictionary v111 _a
;PRAGMA dictionary v123 _a
;PRAGMA dictionary v124 _fp
;PRAGMA dictionary v125 _energy3
;PRAGMA dictionary v126 _energy2
;PRAGMA dictionary v127 _energy1
;PRAGMA dictionary v128 _energy0
;PRAGMA dictionary v129 _scalefactor
;PRAGMA dictionary v130 _i

	SECTION	.data	GLOBAL
	SECFLAGS ALLOC,WRITE,NOEXECINSTR
	ALIGN	1

	SECTYPE PROGBITS
v122	TYPE VARIABLE REF_BY_ADDR
	SIZE v122,20,1
    DCB      "../signalenergy.dat",0 
v117	TYPE VARIABLE REF_BY_ADDR
	SIZE v117,20,1
    DCB      "Signal's energy %d",10,0 
v118	TYPE VARIABLE REF_BY_ADDR
	SIZE v118,19,1
    DCB      "../scalefactor.dat",0 
v116	TYPE VARIABLE REF_BY_ADDR
	SIZE v116,17,1
    DCB      "scalefactor: %d",10,0 
v109	TYPE VARIABLE REF_BY_ADDR
	SIZE v109,16,1
    DCB      10,"Could not open",0 
v121	TYPE VARIABLE REF_BY_ADDR
	SIZE v121,16,1
    DCB      10,"Could not open",0 
v107	TYPE VARIABLE REF_BY_ADDR
	SIZE v107,9,1
    DCB      "../a.dat",0        
v108	TYPE VARIABLE REF_BY_ADDR
	SIZE v108,4,1
    DCB      "r+b",0             
v119	TYPE VARIABLE REF_BY_ADDR
	SIZE v119,4,1
    DCB      "w+b",0             
v120	TYPE VARIABLE REF_BY_ADDR
	SIZE v120,3,1
    DCB      "%d",0              

	ENDSEC


	SECTION .text GLOBAL
	SECFLAGS ALLOC,NOWRITE,EXECINSTR
	SECTYPE PROGBITS
TextStart_starcore_main


;***********************************************************************
;
; Function _main, ; Stack frame size: 96 (0 from LLT)
;
; Calling Convention: 1
;
; Returned value  ret_main   passed in register d0 
;
;***********************************************************************

	GLOBAL	_main
	ALIGN	16
_main	TYPE	func OPT_SPEED
	SIZE _main,F_main_end-_main,16
;PRAGMA stack_effect _main,104
_mainOptimized_away_inline_blocks
DW71
F_main_blockstart
 [
    push     r6                         ;[6,1]
    push     r7                         ;[6,1]
 ]
DW_72
DW72
    move.w   #96,r6               ;[6,1]
DW73
    move.l   #v108,r1             ;[12,1]
DW74
    jsrd     _fopen               ;[12,1]
DW75
 [
    adda     r6,sp                      ;[6,1]
    move.l   #v107,r0                   ;[12,1]
 ]
DW_76
DW76
 [
    move.l   r0,(sp-16)                 ;[12,1]
    move.l   r0,(sp-8)                  ;[13,1]
 ]
DW77
 [
    move.w   #40,d0                     ;[13,1]
    move.w   #<2,d1                     ;[13,1]
 ]
DW78
    jsrd     _fread               ;[13,1]
DW79
 [
    move.l   d0,(sp-4)                  ;[13,1]
    adda     #>-96,sp,r0                ;[13,1]
 ]
DW80
    move.l   (sp-16),d2           ;[14,1]
DW81
    tsteq    d2                   ;[14,1]
DW82
    nop                           ;[0,0] TBIT stall
DW83
    IFT moveu.l  #v109,d3         ;[15,1]
DW84
    IFT jsrd     _printf          ;[15,1]
DW85
    IFT move.l   d3,(sp-4)        ;[15,1]
DW86
    jsrd     _fclose              ;[16,1]
DW87
    move.l   (sp-16),r0           ;[16,1]
DW88
    jsrd     _signalenergy        ;[18,1]
DW89
    adda     #>-96,sp,r0          ;[18,1]
DW90
 [
    clr      d0                         ;[19,1]
    move.w   #96,r7                     ;[19,1]
 ]
DW91
    nop                           ;[0,0] AGU stall
DW92
    suba     r7,sp                ;[19,1]
DW_93
DW93
 [
    pop      r6                         ;[19,1]
    pop      r7                         ;[19,1]
 ]
DW_94
DW94
    rts                           ;[19,1]
F_main_blockend
DW95

	GLOBAL	F_main_end
F_main_end
FuncEnd_main

TextEnd_starcore_main
	ENDSEC

	section	.debug_info debug global
	dcl	DebugInfoEnd_starcore_main-DebugInfoStart_starcore_main	;Debug Info section length
DebugInfoStart_starcore_main:
	dcw	$2
	dcl	DebugAbbrevStart_prod
	dcb	$4
A1_starcore_main:
		;Tag DW_TAG_compile_unit
	dcb	$1
	dcb	$1	;Attribute DW_AT_language
	dcl	TextStart_starcore_main	;Attribute DW_AT_low_pc
	dcl	TextEnd_starcore_main	;Attribute DW_AT_high_pc
	dcl	DebugLineStart_starcore_main-4	;Attribute DW_AT_stmt_list
	dcl	DebugMacroStart_starcore_main	;Attribute DW_AT_macro_info
	dcb	"C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/starcore_main.c",0		;Attribute DW_AT_name
	dcb	"StarCore C Compiler MSWin32 Version 308 Build 22",0		;Attribute DW_AT_producer
	dcb	"C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/cw",0		;Attribute DW_AT_comp_dir
	dcl	DebugFlowGraphStart_starcore_main	;Attribute DW_AT_flow_graph
	dcl	DebugFlowBlocksStart_starcore_main	;Attribute DW_AT_flow_blocks
	dcl	DebugVarsReadWriteStart_starcore_main	;Attribute DW_AT_vars_rwdi
lmain_module0_starcore_main:
		;Tag DW_TAG_subprogram
	dcb	$2
	dcl	_main	;Attribute DW_AT_low_pc
	dcl	F_main_end	;Attribute DW_AT_high_pc
	dcw	$1	;Attribute DW_AT_decl_file
	dcw	$6	;Attribute DW_AT_decl_line
	dcl	n1_prod	;Attribute DW_AT_type
	dcb	"main",0		;Attribute DW_AT_name
	dcb	$1	;Attribute DW_AT_external
	dcw	$60	;Attribute DW_AT_sp_offset
	dcl	Frame_base__main_starcore_main	;Attribute DW_AT_frame_base
	dcw	Call_0_end_starcore_main-Call_0_beg_starcore_main	;Attribute DW_AT_calling
Call_0_beg_starcore_main:
	dcb	$e2
	dcl	_fopen	;Calling Name
	dcb	$e1
	dcl	DW74	;Calling Address
	dcb	$e2
	dcl	_fread	;Calling Name
	dcb	$e1
	dcl	DW78	;Calling Address
	dcb	$e2
	dcl	_printf	;Calling Name
	dcb	$e1
	dcl	DW84	;Calling Address
	dcb	$e2
	dcl	_fclose	;Calling Name
	dcb	$e1
	dcl	DW86	;Calling Address
	dcb	$e2
	dcl	_signalenergy	;Calling Name
	dcb	$e1
	dcl	DW88	;Calling Address
	dcb	$e3
	dcl	DW94	;Return Address
Call_0_end_starcore_main:
	dcl	_main_glb_ref_end_starcore_main-_main_glb_ref_start_starcore_main	;Attribute DW_AT_global_ref_list
_main_glb_ref_start_starcore_main:
_main_glb_ref_end_starcore_main:
	dcl	sibling_0_starcore_main	;Attribute DW_AT_sibling
astarcore_main__main_v110:
		;Tag DW_TAG_variable
	dcb	$3
	dcw	$1	;Attribute DW_AT_decl_file
	dcw	$a	;Attribute DW_AT_decl_line
	dcl	n140_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_starcore_mainv110_1	;Attribute DW_AT_location
	dcb	"fp",0		;Attribute DW_AT_name
astarcore_main__main_v111:
		;Tag DW_TAG_variable
	dcb	$3
	dcw	$1	;Attribute DW_AT_decl_file
	dcw	$8	;Attribute DW_AT_decl_line
	dcl	n159_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_starcore_mainv111_2	;Attribute DW_AT_location
	dcb	"a",0		;Attribute DW_AT_name
	dcb	$0	;End of List
sibling_0_starcore_main:
	dcb	$0	;Null Entry
DebugInfoEnd_starcore_main:
	endsec

	section	.debug_macinfo debug 
DebugMacroStart_starcore_main:
	dcl	$0
DebugMacroEnd_starcore_main:
	endsec

	section	.debug_line debug
	dcl	DebugLineEnd_starcore_main-DebugLineStart_starcore_main
DebugLineStart_starcore_main:
	dcw	$2
	dcl	DebugLinePrologEnd_starcore_main-DebugLinePrologStart_starcore_main
DebugLinePrologStart_starcore_main:
	dcb	$2
	dcb	$1
	dcb	$fffffff4
	dcb	$19
	dcb	$e
	dcb	$0
	dcb	$1
	dcb	$1
	dcb	$1
	dcb	$1
	dcb	$0
	dcb	$0
	dcb	$0
	dcb	$1
	dcb	$0
	dcb	$0
	dcb	$0
	dcb	$1
	dcb	"C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src",0		;Include directories list
	dcb	"C:/Program Files/Freescale/CodeWarrior for StarCore 3.2/StarCore_Support/compiler/include",0	
	dcb	"D:/_build/eb22_3x00_sp8_pre4/_library/src/host",0	
	dcb	"D:/_build/eb22_3x00_sp8_pre4/_library/include",0	
	dcb	$0
	dcb	"starcore_main.c",0		;File names list
	dcb	$1	;Index in Include directories list
	dcb	$ae	;Last modification time: 1354892462
	dcb	$89
	dcb	$88
	dcb	$86
	dcb	$5
	dcb	$ca	;File length: 330
	dcb	$2
	dcb	"functions.h",0	
	dcb	$1	;Index in Include directories list
	dcb	$8c	;Last modification time: 1353235212
	dcb	$f6
	dcb	$a2
	dcb	$85
	dcb	$5
	dcb	$26	;File length: 38
	dcb	"constants.h",0	
	dcb	$1	;Index in Include directories list
	dcb	$be	;Last modification time: 1353232702
	dcb	$e2
	dcb	$a2
	dcb	$85
	dcb	$5
	dcb	$3f	;File length: 63
	dcb	"ansi_parms.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$98	;Last modification time: 1208179224
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$a2	;File length: 10146
	dcb	$4f
	dcb	"cstddef",0	
	dcb	$2	;Index in Include directories list
	dcb	$98	;Last modification time: 1208179224
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$91	;File length: 785
	dcb	$6
	dcb	"stddef.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$9a	;Last modification time: 1208179226
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$81	;File length: 385
	dcb	$3
	dcb	"ioprim.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$98	;Last modification time: 1208179224
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$fb	;File length: 10875
	dcb	$54
	dcb	"cstdarg",0	
	dcb	$2	;Index in Include directories list
	dcb	$98	;Last modification time: 1208179224
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$84	;File length: 1668
	dcb	$d
	dcb	"cstdio",0	
	dcb	$2	;Index in Include directories list
	dcb	$98	;Last modification time: 1208179224
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$e3	;File length: 6371
	dcb	$31
	dcb	"os_enum.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$9a	;Last modification time: 1208179226
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$bc	;File length: 1212
	dcb	$9
	dcb	"ansi_prefix_StarCore.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$98	;Last modification time: 1208179224
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$fb	;File length: 4987
	dcb	$26
	dcb	"mslGlobals.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$9a	;Last modification time: 1208179226
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$ba	;File length: 186
	dcb	$1
	dcb	"msl_c_version.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$9a	;Last modification time: 1208179226
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$ad	;File length: 1325
	dcb	$a
	dcb	"stdio.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$9a	;Last modification time: 1208179226
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$dd	;File length: 1373
	dcb	$a
	dcb	"prototype.h",0	
	dcb	$2	;Index in Include directories list
	dcb	$9a	;Last modification time: 1208179226
	dcb	$b4
	dcb	$8d
	dcb	$c0
	dcb	$4
	dcb	$c1	;File length: 54337
	dcb	$a8
	dcb	$3
	dcb	"prod.c",0	
	dcb	$1	;Index in Include directories list
	dcb	$9a	;Last modification time: 1354892570
	dcb	$8a
	dcb	$88
	dcb	$86
	dcb	$5
	dcb	$ed	;File length: 1517
	dcb	$b
	dcb	"prototype.c",0	
	dcb	$3	;Index in Include directories list
	dcb	$0	;Last modification time: 0
	dcb	$0	;File length: 0
	dcb	"prototype.h",0	
	dcb	$4	;Index in Include directories list
	dcb	$0	;Last modification time: 0
	dcb	$0	;File length: 0
	dcb	$0
DebugLinePrologEnd_starcore_main:

__dbg_ln__main_start:
	dcb	$0
	dcb	$5
	dcb	$2	;DW_LNE_set_address
	dcl	_main
	dcb	$4	;DW_LNS_set_file
	dcb	$1
	dcb	$7	;DW_LNS_set_basic_block
	dcb	31	;line+=5 to 6, addr=DW71
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26	;line+=0 to 6, addr=DW71
	dcb	26+25*(DW72-DW71)/2	;line+=0 to 6, addr=DW72
	dcb	$6	;DW_LNS_negate_stmt
	dcb	32+25*(DW73-DW72)/2	;line+=6 to 12, addr=DW73
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW74-DW73)/2	;line+=0 to 12, addr=DW74
	dcb	$b	;DW_LNS_negate_eos
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	20+25*(DW75-DW74)/2	;line+=-6 to 6, addr=DW75
	dcb	$b	;DW_LNS_negate_eos
	dcb	32	;line+=6 to 12, addr=DW75
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW76-DW75)/2	;line+=0 to 12, addr=DW76
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	27	;line+=1 to 13, addr=DW76
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW77-DW76)/2	;line+=0 to 13, addr=DW77
	dcb	26+25*(DW78-DW77)/2	;line+=0 to 13, addr=DW78
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW79-DW78)/2	;line+=0 to 13, addr=DW79
	dcb	$b	;DW_LNS_negate_eos
	dcb	26	;line+=0 to 13, addr=DW79
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW80-DW79)/2	;line+=1 to 14, addr=DW80
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW81-DW80)/2	;line+=0 to 14, addr=DW81
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	DW83-DW81	;addr=DW83
	dcb	$1b	;special opcode: line+=1 to 15
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW84-DW83)/2	;line+=0 to 15, addr=DW84
	dcb	$b	;DW_LNS_negate_eos
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW85-DW84)/2	;line+=0 to 15, addr=DW85
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW86-DW85)/2	;line+=1 to 16, addr=DW86
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW87-DW86)/2	;line+=0 to 16, addr=DW87
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	28+25*(DW88-DW87)/2	;line+=2 to 18, addr=DW88
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW89-DW88)/2	;line+=0 to 18, addr=DW89
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW90-DW89)/2	;line+=1 to 19, addr=DW90
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26	;line+=0 to 19, addr=DW90
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	DW92-DW90	;addr=DW92
	dcb	$1a	;special opcode: line+=0 to 19
	dcb	26+25*(DW93-DW92)/2	;line+=0 to 19, addr=DW93
	dcb	$b	;DW_LNS_negate_eos
	dcb	26+25*(DW94-DW93)/2	;line+=0 to 19, addr=DW94
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	FuncEnd_main-DW94	;addr=FuncEnd_main
	dcb	$3	;DW_LNS_advance_line
	dcb	$6d	;Reset line number: line-=19 to 0
	dcb	$0
	dcb	$1
	dcb	$1	;DW_LNE_end_sequence

__dbg_ln__main_end:
;PRAGMA remove_block __dbg_ln__main_start,__dbg_ln__main_end-__dbg_ln__main_start,_main
DebugLineEnd_starcore_main:
	endsec

	section	.debug_aranges debug
	dcl	DebugAddressRangesEnd_starcore_main-DebugAddressRangesStart_starcore_main	;Address Ranges section length
DebugAddressRangesStart_starcore_main:
	dcw	$2	;DWARF version
	dcl	DebugInfoStart_starcore_main-4	;Compilation unit info start
	dcb	$4	;Size of Address
	dcb	$0	;Size of Segment Descriptor
	dcl	$0
	dcl	TextStart_starcore_main	;Compilation unit C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/starcore_main.c start
	dcl	TextEnd_starcore_main-TextStart_starcore_main	;Compilation unit C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/starcore_main.c length
	dcl	$0
	dcl	$0
DebugAddressRangesEnd_starcore_main:
	endsec

	section	.debug_loc debug
Loc_starcore_main_optimized_away:
	dcl	$0	;Optimized away
	dcl	$0	;List end
Frame_base__main_starcore_main:
	dcl	_main	;Start Address
	dcl	DW72	;End Address
	dcw	Loc_0_end_starcore_main-*-2	;Location
Loc_0_beg_starcore_main:
	dcb	$50	;DW_OP_reg0, Sp
Loc_0_end_starcore_main:
	dcl	DW72	;Start Address
	dcl	DW76	;End Address
	dcw	Loc_1_end_starcore_main-*-2	;Location
Loc_1_beg_starcore_main:
	dcb	$70	;DW_OP_breg0, Sp
	dcb	$78	;-8
Loc_1_end_starcore_main:
	dcl	DW76	;Start Address
	dcl	DW93	;End Address
	dcw	Loc_2_end_starcore_main-*-2	;Location
Loc_2_beg_starcore_main:
	dcb	$70	;DW_OP_breg0, Sp
	dcb	$98	;-104
	dcb	$7f
Loc_2_end_starcore_main:
	dcl	DW93	;Start Address
	dcl	DW94	;End Address
	dcw	Loc_3_end_starcore_main-*-2	;Location
Loc_3_beg_starcore_main:
	dcb	$70	;DW_OP_breg0, Sp
	dcb	$78	;-8
Loc_3_end_starcore_main:
	dcl	DW94	;Start Address
	dcl	F_main_end	;End Address
	dcw	Loc_4_end_starcore_main-*-2	;Location
Loc_4_beg_starcore_main:
	dcb	$50	;DW_OP_reg0, Sp
Loc_4_end_starcore_main:
	dcl	$0	;List end
	dcl	$0
Loc_starcore_mainv110_1:			;v110
	dcl	DW82	;Start Address
	dcl	DW88	;End Address
	dcw	Loc_5_end_starcore_main-*-2	;Location
Loc_5_beg_starcore_main:
	dcb	$91	;DW_OP_fbreg
	dcb	$d8	;88
	dcb	$0
Loc_5_end_starcore_main:
	dcl	DW81	;Start Address
	dcl	DW82	;End Address
	dcw	Loc_6_end_starcore_main-*-2	;Location
Loc_6_beg_starcore_main:
	dcb	$53	;DW_OP_reg3, d2
Loc_6_end_starcore_main:
	dcl	DW77	;Start Address
	dcl	DW81	;End Address
	dcw	Loc_7_end_starcore_main-*-2	;Location
Loc_7_beg_starcore_main:
	dcb	$91	;DW_OP_fbreg
	dcb	$d8	;88
	dcb	$0
Loc_7_end_starcore_main:
	dcl	DW75	;Start Address
	dcl	DW77	;End Address
	dcw	Loc_8_end_starcore_main-*-2	;Location
Loc_8_beg_starcore_main:
	dcb	$61	;DW_OP_reg17, r0
Loc_8_end_starcore_main:
	dcl	$0	;List End
	dcl	$0
Loc_starcore_mainv111_2:			;v111
	dcl	DW73	;Start Address
	dcl	DW90	;End Address
	dcw	Loc_9_end_starcore_main-*-2	;Location
Loc_9_beg_starcore_main:
	dcb	$91	;DW_OP_fbreg
	dcb	$8	;8
Loc_9_end_starcore_main:
	dcl	$0	;List End
	dcl	$0
	endsec


	section	.debug_frame debug
DebugFrameStart_starcore_main:
	dcl	CommonInfoEntryStandardEnd_starcore_main-CommonInfoEntryStandardStart_starcore_main	;Standard CIE
CommonInfoEntryStandardStart_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$8	;DW_CFA_same_value
	dcb	$7	;Reg #7
	dcb	$8	;DW_CFA_same_value
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$8	;DW_CFA_same_value
	dcb	$17	;Reg #23
	dcb	$8	;DW_CFA_same_value
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryStandardEnd_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc3_starcore_main-CommonInfoEntryNonStandardStart_cc3_starcore_main	;NonStandard_cc3 CIE
CommonInfoEntryNonStandardStart_cc3_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$8	;DW_CFA_same_value
	dcb	$7	;Reg #7
	dcb	$8	;DW_CFA_same_value
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$8	;DW_CFA_same_value
	dcb	$17	;Reg #23
	dcb	$8	;DW_CFA_same_value
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc3_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc4_starcore_main-CommonInfoEntryNonStandardStart_cc4_starcore_main	;NonStandard_cc4 CIE
CommonInfoEntryNonStandardStart_cc4_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$8	;DW_CFA_same_value
	dcb	$7	;Reg #7
	dcb	$8	;DW_CFA_same_value
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$8	;DW_CFA_same_value
	dcb	$17	;Reg #23
	dcb	$8	;DW_CFA_same_value
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc4_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc5_starcore_main-CommonInfoEntryNonStandardStart_cc5_starcore_main	;NonStandard_cc5 CIE
CommonInfoEntryNonStandardStart_cc5_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$8	;DW_CFA_same_value
	dcb	$7	;Reg #7
	dcb	$8	;DW_CFA_same_value
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$8	;DW_CFA_same_value
	dcb	$17	;Reg #23
	dcb	$8	;DW_CFA_same_value
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc5_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc6_starcore_main-CommonInfoEntryNonStandardStart_cc6_starcore_main	;NonStandard_cc6 CIE
CommonInfoEntryNonStandardStart_cc6_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$8	;DW_CFA_same_value
	dcb	$7	;Reg #7
	dcb	$8	;DW_CFA_same_value
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$8	;DW_CFA_same_value
	dcb	$17	;Reg #23
	dcb	$8	;DW_CFA_same_value
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc6_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc7_starcore_main-CommonInfoEntryNonStandardStart_cc7_starcore_main	;NonStandard_cc7 CIE
CommonInfoEntryNonStandardStart_cc7_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$8	;DW_CFA_same_value
	dcb	$3	;Reg #3
	dcb	$8	;DW_CFA_same_value
	dcb	$4	;Reg #4
	dcb	$8	;DW_CFA_same_value
	dcb	$5	;Reg #5
	dcb	$8	;DW_CFA_same_value
	dcb	$6	;Reg #6
	dcb	$7	;DW_CFA_undefined
	dcb	$7	;Reg #7
	dcb	$7	;DW_CFA_undefined
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$7	;DW_CFA_undefined
	dcb	$17	;Reg #23
	dcb	$7	;DW_CFA_undefined
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc7_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc8_starcore_main-CommonInfoEntryNonStandardStart_cc8_starcore_main	;NonStandard_cc8 CIE
CommonInfoEntryNonStandardStart_cc8_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$8	;DW_CFA_same_value
	dcb	$3	;Reg #3
	dcb	$8	;DW_CFA_same_value
	dcb	$4	;Reg #4
	dcb	$8	;DW_CFA_same_value
	dcb	$5	;Reg #5
	dcb	$8	;DW_CFA_same_value
	dcb	$6	;Reg #6
	dcb	$7	;DW_CFA_undefined
	dcb	$7	;Reg #7
	dcb	$7	;DW_CFA_undefined
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$7	;DW_CFA_undefined
	dcb	$17	;Reg #23
	dcb	$7	;DW_CFA_undefined
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc8_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc9_starcore_main-CommonInfoEntryNonStandardStart_cc9_starcore_main	;NonStandard_cc9 CIE
CommonInfoEntryNonStandardStart_cc9_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$8	;DW_CFA_same_value
	dcb	$3	;Reg #3
	dcb	$8	;DW_CFA_same_value
	dcb	$4	;Reg #4
	dcb	$8	;DW_CFA_same_value
	dcb	$5	;Reg #5
	dcb	$8	;DW_CFA_same_value
	dcb	$6	;Reg #6
	dcb	$7	;DW_CFA_undefined
	dcb	$7	;Reg #7
	dcb	$7	;DW_CFA_undefined
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$7	;DW_CFA_undefined
	dcb	$17	;Reg #23
	dcb	$7	;DW_CFA_undefined
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc9_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc10_starcore_main-CommonInfoEntryNonStandardStart_cc10_starcore_main	;NonStandard_cc10 CIE
CommonInfoEntryNonStandardStart_cc10_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$8	;DW_CFA_same_value
	dcb	$3	;Reg #3
	dcb	$8	;DW_CFA_same_value
	dcb	$4	;Reg #4
	dcb	$8	;DW_CFA_same_value
	dcb	$5	;Reg #5
	dcb	$8	;DW_CFA_same_value
	dcb	$6	;Reg #6
	dcb	$7	;DW_CFA_undefined
	dcb	$7	;Reg #7
	dcb	$7	;DW_CFA_undefined
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$7	;DW_CFA_undefined
	dcb	$17	;Reg #23
	dcb	$7	;DW_CFA_undefined
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc10_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc11_starcore_main-CommonInfoEntryNonStandardStart_cc11_starcore_main	;NonStandard_cc11 CIE
CommonInfoEntryNonStandardStart_cc11_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$7	;DW_CFA_undefined
	dcb	$7	;Reg #7
	dcb	$7	;DW_CFA_undefined
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$7	;DW_CFA_undefined
	dcb	$17	;Reg #23
	dcb	$7	;DW_CFA_undefined
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc11_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc12_starcore_main-CommonInfoEntryNonStandardStart_cc12_starcore_main	;NonStandard_cc12 CIE
CommonInfoEntryNonStandardStart_cc12_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$7	;DW_CFA_undefined
	dcb	$7	;Reg #7
	dcb	$7	;DW_CFA_undefined
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$7	;DW_CFA_undefined
	dcb	$17	;Reg #23
	dcb	$7	;DW_CFA_undefined
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc12_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc13_starcore_main-CommonInfoEntryNonStandardStart_cc13_starcore_main	;NonStandard_cc13 CIE
CommonInfoEntryNonStandardStart_cc13_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$7	;DW_CFA_undefined
	dcb	$7	;Reg #7
	dcb	$7	;DW_CFA_undefined
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$7	;DW_CFA_undefined
	dcb	$17	;Reg #23
	dcb	$7	;DW_CFA_undefined
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc13_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc14_starcore_main-CommonInfoEntryNonStandardStart_cc14_starcore_main	;NonStandard_cc14 CIE
CommonInfoEntryNonStandardStart_cc14_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$7	;DW_CFA_undefined
	dcb	$2	;Reg #2
	dcb	$7	;DW_CFA_undefined
	dcb	$3	;Reg #3
	dcb	$7	;DW_CFA_undefined
	dcb	$4	;Reg #4
	dcb	$7	;DW_CFA_undefined
	dcb	$5	;Reg #5
	dcb	$7	;DW_CFA_undefined
	dcb	$6	;Reg #6
	dcb	$8	;DW_CFA_same_value
	dcb	$7	;Reg #7
	dcb	$8	;DW_CFA_same_value
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$7	;DW_CFA_undefined
	dcb	$12	;Reg #18
	dcb	$7	;DW_CFA_undefined
	dcb	$13	;Reg #19
	dcb	$7	;DW_CFA_undefined
	dcb	$14	;Reg #20
	dcb	$7	;DW_CFA_undefined
	dcb	$15	;Reg #21
	dcb	$7	;DW_CFA_undefined
	dcb	$16	;Reg #22
	dcb	$8	;DW_CFA_same_value
	dcb	$17	;Reg #23
	dcb	$8	;DW_CFA_same_value
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc14_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc15_starcore_main-CommonInfoEntryNonStandardStart_cc15_starcore_main	;NonStandard_cc15 CIE
CommonInfoEntryNonStandardStart_cc15_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$7	;DW_CFA_undefined
	dcb	$1	;Reg #1
	dcb	$8	;DW_CFA_same_value
	dcb	$2	;Reg #2
	dcb	$8	;DW_CFA_same_value
	dcb	$3	;Reg #3
	dcb	$8	;DW_CFA_same_value
	dcb	$4	;Reg #4
	dcb	$8	;DW_CFA_same_value
	dcb	$5	;Reg #5
	dcb	$8	;DW_CFA_same_value
	dcb	$6	;Reg #6
	dcb	$8	;DW_CFA_same_value
	dcb	$7	;Reg #7
	dcb	$8	;DW_CFA_same_value
	dcb	$8	;Reg #8
	dcb	$7	;DW_CFA_undefined
	dcb	$9	;Reg #9
	dcb	$7	;DW_CFA_undefined
	dcb	$a	;Reg #10
	dcb	$7	;DW_CFA_undefined
	dcb	$b	;Reg #11
	dcb	$7	;DW_CFA_undefined
	dcb	$c	;Reg #12
	dcb	$7	;DW_CFA_undefined
	dcb	$d	;Reg #13
	dcb	$7	;DW_CFA_undefined
	dcb	$e	;Reg #14
	dcb	$7	;DW_CFA_undefined
	dcb	$f	;Reg #15
	dcb	$7	;DW_CFA_undefined
	dcb	$10	;Reg #16
	dcb	$7	;DW_CFA_undefined
	dcb	$11	;Reg #17
	dcb	$8	;DW_CFA_same_value
	dcb	$12	;Reg #18
	dcb	$8	;DW_CFA_same_value
	dcb	$13	;Reg #19
	dcb	$8	;DW_CFA_same_value
	dcb	$14	;Reg #20
	dcb	$8	;DW_CFA_same_value
	dcb	$15	;Reg #21
	dcb	$8	;DW_CFA_same_value
	dcb	$16	;Reg #22
	dcb	$8	;DW_CFA_same_value
	dcb	$17	;Reg #23
	dcb	$8	;DW_CFA_same_value
	dcb	$18	;Reg #24
	dcb	$7	;DW_CFA_undefined
	dcb	$19	;Reg #25
	dcb	$7	;DW_CFA_undefined
	dcb	$1a	;Reg #26
	dcb	$7	;DW_CFA_undefined
	dcb	$1b	;Reg #27
	dcb	$7	;DW_CFA_undefined
	dcb	$1c	;Reg #28
	dcb	$7	;DW_CFA_undefined
	dcb	$1d	;Reg #29
	dcb	$7	;DW_CFA_undefined
	dcb	$1e	;Reg #30
	dcb	$7	;DW_CFA_undefined
	dcb	$1f	;Reg #31
	dcb	$7	;DW_CFA_undefined
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc15_starcore_main:
	dcl	CommonInfoEntryNonStandardEnd_cc16_starcore_main-CommonInfoEntryNonStandardStart_cc16_starcore_main	;NonStandard_cc16 CIE
CommonInfoEntryNonStandardStart_cc16_starcore_main:
	dcl	$ffffffff	;CIE_id
	dcb	$1	;version
	dcb	$0	;augmentation
	dcb	$2	;code_alignment_factor
	dcb	$4	;data_alignment_factor
	dcb	$0	;return address (irrelevant)
	dcb	$c	;DW_CFA_def_cfa
	dcb	$0	;SP register, # 0
	dcb	$0	;SP offset
	dcb	$8	;DW_CFA_same_value
	dcb	$1	;Reg #1
	dcb	$8	;DW_CFA_same_value
	dcb	$2	;Reg #2
	dcb	$8	;DW_CFA_same_value
	dcb	$3	;Reg #3
	dcb	$8	;DW_CFA_same_value
	dcb	$4	;Reg #4
	dcb	$8	;DW_CFA_same_value
	dcb	$5	;Reg #5
	dcb	$8	;DW_CFA_same_value
	dcb	$6	;Reg #6
	dcb	$8	;DW_CFA_same_value
	dcb	$7	;Reg #7
	dcb	$8	;DW_CFA_same_value
	dcb	$8	;Reg #8
	dcb	$8	;DW_CFA_same_value
	dcb	$9	;Reg #9
	dcb	$8	;DW_CFA_same_value
	dcb	$a	;Reg #10
	dcb	$8	;DW_CFA_same_value
	dcb	$b	;Reg #11
	dcb	$8	;DW_CFA_same_value
	dcb	$c	;Reg #12
	dcb	$8	;DW_CFA_same_value
	dcb	$d	;Reg #13
	dcb	$8	;DW_CFA_same_value
	dcb	$e	;Reg #14
	dcb	$8	;DW_CFA_same_value
	dcb	$f	;Reg #15
	dcb	$8	;DW_CFA_same_value
	dcb	$10	;Reg #16
	dcb	$8	;DW_CFA_same_value
	dcb	$11	;Reg #17
	dcb	$8	;DW_CFA_same_value
	dcb	$12	;Reg #18
	dcb	$8	;DW_CFA_same_value
	dcb	$13	;Reg #19
	dcb	$8	;DW_CFA_same_value
	dcb	$14	;Reg #20
	dcb	$8	;DW_CFA_same_value
	dcb	$15	;Reg #21
	dcb	$8	;DW_CFA_same_value
	dcb	$16	;Reg #22
	dcb	$8	;DW_CFA_same_value
	dcb	$17	;Reg #23
	dcb	$8	;DW_CFA_same_value
	dcb	$18	;Reg #24
	dcb	$8	;DW_CFA_same_value
	dcb	$19	;Reg #25
	dcb	$8	;DW_CFA_same_value
	dcb	$1a	;Reg #26
	dcb	$8	;DW_CFA_same_value
	dcb	$1b	;Reg #27
	dcb	$8	;DW_CFA_same_value
	dcb	$1c	;Reg #28
	dcb	$8	;DW_CFA_same_value
	dcb	$1d	;Reg #29
	dcb	$8	;DW_CFA_same_value
	dcb	$1e	;Reg #30
	dcb	$8	;DW_CFA_same_value
	dcb	$1f	;Reg #31
	dcb	$8	;DW_CFA_same_value
	dcb	$20	;Reg #32
	dcb	$7	;DW_CFA_undefined
	dcb	$0	;Reg #0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
CommonInfoEntryNonStandardEnd_cc16_starcore_main:
	dcl	_DE__main_starcore_main_End-_DE__main_starcore_main_Start
_DE__main_starcore_main_Start:
	dcl	CommonInfoEntryStandardStart_starcore_main-4	;CIE_ptr std
	dcl	_main	;initial_location
	dcl	F_main_end-_main	;address_range
	dcb	$3	;DW_CFA_advance_loc2: (DW72-DW71)/2
	dcw	(DW72-DW71)/2
	dcb	$97	;DW_CFA_offset, Reg #23
	dcb	$0	;Offset from CFA
	dcb	$98	;DW_CFA_offset, Reg #24
	dcb	$1	;Offset from CFA
	dcb	$e	;DW_CFA_def_cfa_offset: 2
	dcb	$2
	dcb	$3	;DW_CFA_advance_loc2: (DW76-DW72)/2
	dcw	(DW76-DW72)/2
	dcb	$e	;DW_CFA_def_cfa_offset: 2 + 24
	dcb	$1a
	dcb	$3	;DW_CFA_advance_loc2: (DW93-DW76)/2
	dcw	(DW93-DW76)/2
	dcb	$e	;DW_CFA_def_cfa_offset: 26 + -24
	dcb	$2
	dcb	$3	;DW_CFA_advance_loc2: (DW94-DW93)/2
	dcw	(DW94-DW93)/2
	dcb	$d7	;DW_CFA_restore, Reg #23
	dcb	$d8	;DW_CFA_restore, Reg #24
	dcb	$e	;DW_CFA_def_cfa_offset: 0
	dcb	$0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
_DE__main_starcore_main_End:
	endsec


	section	.debug_flow_graph debug
DebugFlowGraphStart_starcore_main:
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW71",0	
	dcb	"DW75",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fopen",0	
	dcb	"DW76",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW76",0	
	dcb	"DW79",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fread",0	
	dcb	"DW80",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW71",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW80",0	
	dcb	"DW85",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_printf",0	
	dcb	"DW86",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW76",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW86",0	
	dcb	"DW87",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fclose",0	
	dcb	"DW88",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW80",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW88",0	
	dcb	"DW89",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_signalenergy",0	
	dcb	"DW90",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW86",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW90",0	
	dcb	"DW94",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$1	;Number Of Strings
	dcb	"@NONE@",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW88",0	
	dcb	$8

	endsec

	section	.debug_flow_blocks debug
DebugFlowBlocksStart_starcore_main:
	dcb	$8	;DW_FG_END

	endsec

	section	.debug_vars_read_write debug
DebugVarsReadWriteStart_starcore_main:
	dcb	$2	;DW_RWDI_ROUTINE
	dcb	"_main",0	
	dcb	$8

	endsec
