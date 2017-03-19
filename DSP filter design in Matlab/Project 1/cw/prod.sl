     .FILE	"C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/prod.c"
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
     NOTE "Invocation line: unknown"


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


	SECTION .text GLOBAL
	SECFLAGS ALLOC,NOWRITE,EXECINSTR
	SECTYPE PROGBITS
TextStart_prod


;***********************************************************************
;
; Function _signalenergy, ; Stack frame size: 24 (0 from LLT)
;
; Calling Convention: 1
;
; Parameter a   passed in register r0 
;
; Called by:   _main
;
;***********************************************************************

	GLOBAL	_signalenergy
	ALIGN	16
_signalenergy	TYPE	func OPT_SPEED
	SIZE _signalenergy,F_signalenergy_end-_signalenergy,16
;PRAGMA stack_effect _signalenergy,32
DW1
F_signalenergy_blockstart
 [
    clr      d0                         ;[8,16]
    clr      d4                         ;[15,16]
    clr      d1                         ;[12,16]
    clr      d2                         ;[13,16]
    push     d6                         ;[6,16]
    push     d7                         ;[6,16]
 ]
DW_2
DW2
 [
    clr      d3                         ;[14,16]
    push     r6                         ;[6,16]
    push     r7                         ;[6,16]
 ]
DW_3
DW3
 [
    doensh3  #9                         ;[0,0] @II1
    adda     #<24,sp                    ;[6,16]
 ]
DW_4
DW4
 [
    tfra     r0,r1                      ;[19,16]
    move.w   d0,(sp-20)                 ;[8,16]
 ]
DW5
    move.4f  (r1)+,d8:d9:d10:d11  ;[19,16] 0%=0
    LOOPSTART3                   
DW6
 [
    mac      d8,d8,d1                   ;[19,16] 1%=1
    mac      d9,d9,d2                   ;[20,16] 1%=1
    mac      d10,d10,d3                 ;[21,16] 1%=1
    mac      d11,d11,d4                 ;[19,16] 1%=1
    move.4f  (r1)+,d8:d9:d10:d11        ;[19,16] 0%=0
 ]
    LOOPEND3                     
DW7
 [
    mac      d9,d9,d2                   ;[20,16] 1%=1
    mac      d10,d10,d3                 ;[21,16] 1%=1
    mac      d11,d11,d4                 ;[19,16] 1%=1
    mac      d8,d8,d1                   ;[19,16] 1%=1
    move.f   #32767,d13                 ;[31,16]
 ]
DW8
 [
    add      d1,d2,d8                   ;[25,16]
    add      d3,d4,d9                   ;[26,16]
 ]
DW9
    add      d8,d9,d10            ;[27,16]
DW10
    rnd      d10,d11              ;[29,16]
DW11
 [
    cmpgt    d11,d13                    ;[31,16]
    asrw     d11,d12                    ;[29,16]
 ]
DW12
 [
    move.l   d12,(sp-24)                ;[29,16]
    bt       <L7                        ;[31,16]
 ]
    FALIGN                       
L9
DW13
 [
    doen3    #<40                       ;[0,1]
    dosetup3 L31                        ;[0,1]
 ]
DW14
    tfra     r0,r1                ;[34,16]
    FALIGN                       
    LOOPSTART3                   
L31
DW15
    move.w   (r1),d1              ;[34,16]
DW16
    tstgt    d1                   ;[34,16]
DW17
    IFF add      #<1,d1           ;[34,16]
DW18
    asr      d1,d1                ;[34,16]
DW19
    move.w   d1,(r1)+             ;[34,16]
    LOOPEND3                     
DW20
 [
    inc      d0                         ;[35,16]
    clr      d2                         ;[37,16]
    clr      d3                         ;[38,16]
    clr      d4                         ;[39,16]
    doensh3  #9                         ;[0,0] @II1
    tfra     r0,r1                      ;[44,16]
 ]
DW21
 [
    clr      d5                         ;[40,16]
    move.4f  (r1)+,d8:d9:d10:d11        ;[44,16] 0%=0
 ]
    LOOPSTART3                   
DW22
 [
    mac      d8,d8,d2                   ;[44,16] 1%=1
    mac      d9,d9,d3                   ;[45,16] 1%=1
    mac      d10,d10,d4                 ;[46,16] 1%=1
    mac      d11,d11,d5                 ;[44,16] 1%=1
    move.4f  (r1)+,d8:d9:d10:d11        ;[44,16] 0%=0
 ]
    LOOPEND3                     
DW23
 [
    mac      d9,d9,d3                   ;[45,16] 1%=1
    mac      d10,d10,d4                 ;[46,16] 1%=1
    mac      d11,d11,d5                 ;[44,16] 1%=1
    mac      d8,d8,d2                   ;[44,16] 1%=1
 ]
DW24
 [
    add      d2,d3,d8                   ;[50,16]
    add      d4,d5,d9                   ;[51,16]
 ]
DW25
    add      d8,d9,d10            ;[52,16]
DW26
    rnd      d10,d11              ;[54,16]
DW27
 [
    cmpgt    d11,d13                    ;[55,16]
    asrw     d11,d12                    ;[54,16]
 ]
DW28
    bf       <L9                  ;[55,16]
DW29
 [
    move.l   d12,(sp-24)                ;[0,1]
    move.w   d0,(sp-20)                 ;[0,1]
 ]
L7
DW30
 [
    moveu.l  #v116,d14                  ;[57,16]
    move.l   d0,(sp-8)                  ;[57,16]
 ]
DW31
    jsrd     _printf              ;[57,16]
DW32
    move.l   d14,(sp-4)           ;[57,16]
DW33
 [
    move.l   (sp-24),d12                ;[58,16]
    moveu.l  #v117,d15                  ;[58,16]
 ]
DW34
    jsrd     _printf              ;[58,16]
DW35
 [
    move.l   d12,(sp-8)                 ;[58,16]
    move.l   d15,(sp-4)                 ;[58,16]
 ]
DW36
    move.l   #v119,r1             ;[60,16]
DW37
    jsrd     _fopen               ;[60,16]
DW38
    move.l   #v118,r0             ;[60,16]
DW39
 [
    move.w   (sp-20),d0                 ;[61,16]
    moveu.l  #v120,d1                   ;[61,16]
 ]
DW40
 [
    move.l   r0,(sp-16)                 ;[60,16]
    move.l   d0,(sp-8)                  ;[61,16]
 ]
DW41
    jsrd     _fprintf             ;[61,16]
DW42
    move.l   d1,(sp-4)            ;[61,16]
DW43
    move.l   (sp-16),d2           ;[62,16]
DW44
    tsteq    d2                   ;[62,16]
DW45
    nop                           ;[0,0] TBIT stall
DW46
    IFT moveu.l  #v121,d3         ;[63,16]
DW47
    IFT jsrd     _printf          ;[63,16]
DW48
    IFT move.l   d3,(sp-4)        ;[63,16]
DW49
    jsrd     _fclose              ;[64,16]
DW50
    move.l   (sp-16),r0           ;[64,16]
DW51
    move.l   #v119,r1             ;[66,16]
DW52
    jsrd     _fopen               ;[66,16]
DW53
    move.l   #v122,r0             ;[66,16]
DW54
 [
    move.l   (sp-24),d12                ;[67,16]
    moveu.l  #v120,d4                   ;[67,16]
 ]
DW55
 [
    move.l   r0,(sp-16)                 ;[66,16]
    move.l   d12,(sp-8)                 ;[67,16]
 ]
DW56
    jsrd     _fprintf             ;[67,16]
DW57
    move.l   d4,(sp-4)            ;[67,16]
DW58
    move.l   (sp-16),d5           ;[68,16]
DW59
    tsteq    d5                   ;[68,16]
DW60
    nop                           ;[0,0] TBIT stall
DW61
    IFT moveu.l  #v121,d6         ;[69,16]
DW62
    IFT jsrd     _printf          ;[69,16]
DW63
    IFT move.l   d6,(sp-4)        ;[69,16]
DW64
    jsrd     _fclose              ;[70,16]
DW65
    move.l   (sp-16),r0           ;[70,16]
DW66
    suba     #<24,sp              ;[71,16]
DW_67
DW67
 [
    pop      r6                         ;[71,16]
    pop      r7                         ;[71,16]
 ]
DW_68
DW68
 [
    pop      d6                         ;[71,16]
    pop      d7                         ;[71,16]
 ]
DW_69
DW69
    rts                           ;[71,16]
F_signalenergy_blockend
DW70

	GLOBAL	F_signalenergy_end
F_signalenergy_end
FuncEnd_signalenergy

TextEnd_prod
	ENDSEC

	section	.debug_info debug global
	dcl	DebugInfoEnd_prod-DebugInfoStart_prod	;Debug Info section length
DebugInfoStart_prod:
	dcw	$2
	dcl	DebugAbbrevStart_prod
	dcb	$4
A2_prod:
		;Tag DW_TAG_compile_unit
	dcb	$1
	dcb	$1	;Attribute DW_AT_language
	dcl	TextStart_prod	;Attribute DW_AT_low_pc
	dcl	TextEnd_prod	;Attribute DW_AT_high_pc
	dcl	DebugLineStart_prod-4	;Attribute DW_AT_stmt_list
	dcl	DebugMacroStart_prod	;Attribute DW_AT_macro_info
	dcb	"C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/prod.c",0		;Attribute DW_AT_name
	dcb	"StarCore C Compiler MSWin32 Version 308 Build 22",0		;Attribute DW_AT_producer
	dcb	"C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/cw",0		;Attribute DW_AT_comp_dir
	dcl	DebugFlowGraphStart_prod	;Attribute DW_AT_flow_graph
	dcl	DebugFlowBlocksStart_prod	;Attribute DW_AT_flow_blocks
	dcl	DebugVarsReadWriteStart_prod	;Attribute DW_AT_vars_rwdi
n1_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_encoding
	dcb	"int",0		;Attribute DW_AT_name
n2_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$1	;Attribute DW_AT_byte_size
	dcb	$6	;Attribute DW_AT_encoding
	dcb	"char",0		;Attribute DW_AT_name
n3_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$1	;Attribute DW_AT_byte_size
	dcb	$8	;Attribute DW_AT_encoding
	dcb	"unsigned char",0		;Attribute DW_AT_name
n4_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$7	;Attribute DW_AT_encoding
	dcb	"unsigned int",0		;Attribute DW_AT_name
n5_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$7	;Attribute DW_AT_encoding
	dcb	"unsigned long",0		;Attribute DW_AT_name
n6_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$4	;Attribute DW_AT_encoding
	dcb	"float",0		;Attribute DW_AT_name
n7_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$8	;Attribute DW_AT_byte_size
	dcb	$4	;Attribute DW_AT_encoding
	dcb	"double",0		;Attribute DW_AT_name
n8_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$4	;Attribute DW_AT_encoding
	dcb	"long double",0		;Attribute DW_AT_name
n9_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$0	;Attribute DW_AT_byte_size
	dcb	$0	;Attribute DW_AT_encoding
	dcb	"void",0		;Attribute DW_AT_name
n10_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$0	;Attribute DW_AT_encoding
	dcb	"label array",0		;Attribute DW_AT_name
n13_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$2	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_encoding
	dcb	"short",0		;Attribute DW_AT_name
n14_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$2	;Attribute DW_AT_byte_size
	dcb	$7	;Attribute DW_AT_encoding
	dcb	"unsigned short",0		;Attribute DW_AT_name
n15_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_encoding
	dcb	"long",0		;Attribute DW_AT_name
n16_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$8	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_encoding
	dcb	"long long",0		;Attribute DW_AT_name
n17_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$8	;Attribute DW_AT_byte_size
	dcb	$7	;Attribute DW_AT_encoding
	dcb	"unsigned long long",0		;Attribute DW_AT_name
n20_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$2	;Attribute DW_AT_byte_size
	dcb	$0	;Attribute DW_AT_encoding
	dcb	"word16",0		;Attribute DW_AT_name
n21_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$0	;Attribute DW_AT_encoding
	dcb	"word32",0		;Attribute DW_AT_name
n22_prod:
		;Tag DW_TAG_base_type
	dcb	$4
	dcl	$8	;Attribute DW_AT_byte_size
	dcb	$0	;Attribute DW_AT_encoding
	dcb	"word64",0		;Attribute DW_AT_name
n27_prod:
		;Tag DW_TAG_pointer_type
	dcb	$5
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n3_prod	;Attribute DW_AT_type
t1_prod:
		;Tag DW_TAG_structure_type
	dcb	$6
	dcl	$18	;Attribute DW_AT_byte_size
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$0
	dcb	"_cnt",0		;Attribute DW_AT_name
	dcl	n1_prod	;Attribute DW_AT_type
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$4
	dcb	"_flag",0		;Attribute DW_AT_name
	dcl	n1_prod	;Attribute DW_AT_type
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$8
	dcb	"_file",0		;Attribute DW_AT_name
	dcl	n1_prod	;Attribute DW_AT_type
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$c
	dcb	"_bufsiz",0		;Attribute DW_AT_name
	dcl	n1_prod	;Attribute DW_AT_type
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$10
	dcb	"_buffer",0		;Attribute DW_AT_name
	dcl	n27_prod	;Attribute DW_AT_type
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$14
	dcb	"_ptr",0		;Attribute DW_AT_name
	dcl	n27_prod	;Attribute DW_AT_type
	dcb	$0	;End of List
t2_prod:
		;Tag DW_TAG_structure_type
	dcb	$6
	dcl	$8	;Attribute DW_AT_byte_size
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$0
	dcb	"msb",0		;Attribute DW_AT_name
	dcl	n15_prod	;Attribute DW_AT_type
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$4
	dcb	"lsb",0		;Attribute DW_AT_name
	dcl	n5_prod	;Attribute DW_AT_type
	dcb	$0	;End of List
n29_prod:
		;Tag DW_TAG_array_type
	dcb	$8
	dcl	$3	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
		;Tag DW_TAG_subrange_type
	dcb	$9
	dcb	$2	;Attribute DW_AT_upper_bound
	dcb	$0	;End of List
t3_prod:
		;Tag DW_TAG_structure_type
	dcb	$a
	dcl	$8	;Attribute DW_AT_byte_size
	dcb	"Word40",0		;Attribute DW_AT_name
		;Tag DW_TAG_member
	dcb	$7
	dcl	$4	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$0
	dcb	"body",0		;Attribute DW_AT_name
	dcl	n5_prod	;Attribute DW_AT_type
		;Tag DW_TAG_member
	dcb	$7
	dcl	$3	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$4
	dcb	"gap",0		;Attribute DW_AT_name
	dcl	n29_prod	;Attribute DW_AT_type
		;Tag DW_TAG_member
	dcb	$7
	dcl	$1	;Attribute DW_AT_byte_size
	dcb	$5	;Attribute DW_AT_data_member_location
	dcb	$c
	dcl	$7
	dcb	"ext",0		;Attribute DW_AT_name
	dcl	n2_prod	;Attribute DW_AT_type
	dcb	$0	;End of List
n30_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$18	;Attribute DW_AT_byte_size
	dcl	t1_prod	;Attribute DW_AT_type
	dcb	"FILE",0		;Attribute DW_AT_name
n31_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$2	;Attribute DW_AT_byte_size
	dcl	n13_prod	;Attribute DW_AT_type
	dcb	"Word16",0		;Attribute DW_AT_name
n32_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n4_prod	;Attribute DW_AT_type
	dcb	"size_t",0		;Attribute DW_AT_name
n33_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n15_prod	;Attribute DW_AT_type
	dcb	"Word32",0		;Attribute DW_AT_name
n34_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$2	;Attribute DW_AT_byte_size
	dcl	n14_prod	;Attribute DW_AT_type
	dcb	"UWord16",0		;Attribute DW_AT_name
n35_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n5_prod	;Attribute DW_AT_type
	dcb	"UWord32",0		;Attribute DW_AT_name
n36_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$8	;Attribute DW_AT_byte_size
	dcl	t2_prod	;Attribute DW_AT_type
	dcb	"Word64",0		;Attribute DW_AT_name
n37_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$8	;Attribute DW_AT_byte_size
	dcl	t3_prod	;Attribute DW_AT_type
	dcb	"Word40",0		;Attribute DW_AT_name
n38_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$1	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
	dcb	"Word8",0		;Attribute DW_AT_name
n39_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n15_prod	;Attribute DW_AT_type
	dcb	"Vector_Type32",0		;Attribute DW_AT_name
n40_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$2	;Attribute DW_AT_byte_size
	dcl	n13_prod	;Attribute DW_AT_type
	dcb	"Vector_Component16",0		;Attribute DW_AT_name
n41_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$1	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
	dcb	"Vector_Component8",0		;Attribute DW_AT_name
n42_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$1	;Attribute DW_AT_byte_size
	dcl	n3_prod	;Attribute DW_AT_type
	dcb	"Vector_ComponentU8",0		;Attribute DW_AT_name
n43_prod:
		;Tag DW_TAG_typedef
	dcb	$b
	dcl	$8	;Attribute DW_AT_byte_size
	dcl	t3_prod	;Attribute DW_AT_type
	dcb	"Vector_Type40",0		;Attribute DW_AT_name
n23_prod:
		;Tag DW_TAG_pointer_type
	dcb	$5
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n9_prod	;Attribute DW_AT_type
n138_prod:
		;Tag DW_TAG_pointer_type
	dcb	$5
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
n140_prod:
		;Tag DW_TAG_pointer_type
	dcb	$5
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	t1_prod	;Attribute DW_AT_type
n152_prod:
		;Tag DW_TAG_pointer_type
	dcb	$5
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n13_prod	;Attribute DW_AT_type
n155_prod:
		;Tag DW_TAG_array_type
	dcb	$8
	dcl	$9	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
		;Tag DW_TAG_subrange_type
	dcb	$9
	dcb	$8	;Attribute DW_AT_upper_bound
	dcb	$0	;End of List
n156_prod:
		;Tag DW_TAG_array_type
	dcb	$8
	dcl	$4	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
		;Tag DW_TAG_subrange_type
	dcb	$9
	dcb	$3	;Attribute DW_AT_upper_bound
	dcb	$0	;End of List
n157_prod:
		;Tag DW_TAG_array_type
	dcb	$8
	dcl	$10	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
		;Tag DW_TAG_subrange_type
	dcb	$9
	dcb	$f	;Attribute DW_AT_upper_bound
	dcb	$0	;End of List
n159_prod:
		;Tag DW_TAG_array_type
	dcb	$8
	dcl	$50	;Attribute DW_AT_byte_size
	dcl	n13_prod	;Attribute DW_AT_type
		;Tag DW_TAG_subrange_type
	dcb	$9
	dcb	$27	;Attribute DW_AT_upper_bound
	dcb	$0	;End of List
n160_prod:
		;Tag DW_TAG_array_type
	dcb	$8
	dcl	$11	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
		;Tag DW_TAG_subrange_type
	dcb	$9
	dcb	$10	;Attribute DW_AT_upper_bound
	dcb	$0	;End of List
n161_prod:
		;Tag DW_TAG_array_type
	dcb	$8
	dcl	$14	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
		;Tag DW_TAG_subrange_type
	dcb	$9
	dcb	$13	;Attribute DW_AT_upper_bound
	dcb	$0	;End of List
n162_prod:
		;Tag DW_TAG_array_type
	dcb	$8
	dcl	$13	;Attribute DW_AT_byte_size
	dcl	n2_prod	;Attribute DW_AT_type
		;Tag DW_TAG_subrange_type
	dcb	$9
	dcb	$12	;Attribute DW_AT_upper_bound
	dcb	$0	;End of List
lsignalenergy_module15_prod:
sibling_0_prod:
		;Tag DW_TAG_subprogram
	dcb	$c
	dcl	_signalenergy	;Attribute DW_AT_low_pc
	dcl	F_signalenergy_end	;Attribute DW_AT_high_pc
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$6	;Attribute DW_AT_decl_line
	dcl	n13_prod	;Attribute DW_AT_type
	dcb	"signalenergy",0		;Attribute DW_AT_name
	dcb	$1	;Attribute DW_AT_external
	dcw	$18	;Attribute DW_AT_sp_offset
	dcl	Frame_base__signalenergy_prod	;Attribute DW_AT_frame_base
	dcw	Call_1_end_prod-Call_1_beg_prod	;Attribute DW_AT_calling
Call_1_beg_prod:
	dcb	$e2
	dcl	_printf	;Calling Name
	dcb	$e1
	dcl	DW31	;Calling Address
	dcb	$e2
	dcl	_printf	;Calling Name
	dcb	$e1
	dcl	DW34	;Calling Address
	dcb	$e2
	dcl	_fopen	;Calling Name
	dcb	$e1
	dcl	DW37	;Calling Address
	dcb	$e2
	dcl	_fprintf	;Calling Name
	dcb	$e1
	dcl	DW41	;Calling Address
	dcb	$e2
	dcl	_printf	;Calling Name
	dcb	$e1
	dcl	DW47	;Calling Address
	dcb	$e2
	dcl	_fclose	;Calling Name
	dcb	$e1
	dcl	DW49	;Calling Address
	dcb	$e2
	dcl	_fopen	;Calling Name
	dcb	$e1
	dcl	DW52	;Calling Address
	dcb	$e2
	dcl	_fprintf	;Calling Name
	dcb	$e1
	dcl	DW56	;Calling Address
	dcb	$e2
	dcl	_printf	;Calling Name
	dcb	$e1
	dcl	DW62	;Calling Address
	dcb	$e2
	dcl	_fclose	;Calling Name
	dcb	$e1
	dcl	DW64	;Calling Address
	dcb	$e3
	dcl	DW69	;Return Address
Call_1_end_prod:
	dcl	_signalenergy_glb_ref_end_prod-_signalenergy_glb_ref_start_prod	;Attribute DW_AT_global_ref_list
_signalenergy_glb_ref_start_prod:
_signalenergy_glb_ref_end_prod:
	dcl	sibling_1_prod	;Attribute DW_AT_sibling
aprod__signalenergy_v123:
		;Tag DW_TAG_formal_parameter
	dcb	$d
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$6	;Attribute DW_AT_decl_line
	dcl	n152_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_prodv123_0	;Attribute DW_AT_location
	dcb	"a",0		;Attribute DW_AT_name
aprod__signalenergy_v124:
		;Tag DW_TAG_variable
	dcb	$e
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$a	;Attribute DW_AT_decl_line
	dcl	n140_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_prodv124_1	;Attribute DW_AT_location
	dcb	"fp",0		;Attribute DW_AT_name
aprod__signalenergy_v125:
		;Tag DW_TAG_variable
	dcb	$e
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$9	;Attribute DW_AT_decl_line
	dcl	n15_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_prodv125_2	;Attribute DW_AT_location
	dcb	"energy3",0		;Attribute DW_AT_name
aprod__signalenergy_v126:
		;Tag DW_TAG_variable
	dcb	$e
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$9	;Attribute DW_AT_decl_line
	dcl	n15_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_prodv126_3	;Attribute DW_AT_location
	dcb	"energy2",0		;Attribute DW_AT_name
aprod__signalenergy_v127:
		;Tag DW_TAG_variable
	dcb	$e
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$9	;Attribute DW_AT_decl_line
	dcl	n15_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_prodv127_4	;Attribute DW_AT_location
	dcb	"energy1",0		;Attribute DW_AT_name
aprod__signalenergy_v128:
		;Tag DW_TAG_variable
	dcb	$e
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$9	;Attribute DW_AT_decl_line
	dcl	n15_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_prodv128_5	;Attribute DW_AT_location
	dcb	"energy0",0		;Attribute DW_AT_name
aprod__signalenergy_v129:
		;Tag DW_TAG_variable
	dcb	$e
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$8	;Attribute DW_AT_decl_line
	dcl	n13_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_prodv129_6	;Attribute DW_AT_location
	dcb	"scalefactor",0		;Attribute DW_AT_name
aprod__signalenergy_v130:
		;Tag DW_TAG_variable
	dcb	$e
	dcw	$10	;Attribute DW_AT_decl_file
	dcw	$8	;Attribute DW_AT_decl_line
	dcl	n13_prod	;Attribute DW_AT_type
	dcb	$0	;Attribute DW_AT_external
	dcb	$0	;Attribute DW_AT_declaration
	dcl	Loc_prod_optimized_away	;Attribute DW_AT_location
	dcb	"i",0		;Attribute DW_AT_name
	dcb	$0	;End of List
sibling_1_prod:
	dcb	$0	;Null Entry
DebugInfoEnd_prod:
	endsec

	section	.debug_macinfo debug 
DebugMacroStart_prod:
	dcl	$0
DebugMacroEnd_prod:
	endsec

	section	.debug_abbrev debug
	global DebugAbbrevStart_prod
DebugAbbrevStart_prod:
		;DW_TAG_compile_unit
	dcb	$1	;Code
	dcb	$11	;Tag
	dcb	$1
	dcb	$13	;Attrib DW_AT_language
	dcb	$b	;Form DW_FORM_data1
	dcb	$11	;Attrib DW_AT_low_pc
	dcb	$1	;Form DW_FORM_addr
	dcb	$12	;Attrib DW_AT_high_pc
	dcb	$1	;Form DW_FORM_addr
	dcb	$10	;Attrib DW_AT_stmt_list
	dcb	$6	;Form DW_FORM_data4
	dcb	$43	;Attrib DW_AT_macro_info
	dcb	$6	;Form DW_FORM_data4
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$25	;Attrib DW_AT_producer
	dcb	$8	;Form DW_FORM_string
	dcb	$1b	;Attrib DW_AT_comp_dir
	dcb	$8	;Form DW_FORM_string
	dcb	$83	;Attrib DW_AT_flow_graph
	dcb	$40
	dcb	$1	;Form DW_FORM_addr
	dcb	$84	;Attrib DW_AT_flow_blocks
	dcb	$40
	dcb	$1	;Form DW_FORM_addr
	dcb	$8a	;Attrib DW_AT_vars_rwdi
	dcb	$40
	dcb	$1	;Form DW_FORM_addr
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_subprogram
	dcb	$2	;Code
	dcb	$2e	;Tag
	dcb	$1
	dcb	$11	;Attrib DW_AT_low_pc
	dcb	$1	;Form DW_FORM_addr
	dcb	$12	;Attrib DW_AT_high_pc
	dcb	$1	;Form DW_FORM_addr
	dcb	$3a	;Attrib DW_AT_decl_file
	dcb	$5	;Form DW_FORM_data2
	dcb	$3b	;Attrib DW_AT_decl_line
	dcb	$5	;Form DW_FORM_data2
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$3f	;Attrib DW_AT_external
	dcb	$c	;Form DW_FORM_flag
	dcb	$82	;Attrib DW_AT_sp_offset
	dcb	$40
	dcb	$5	;Form DW_FORM_data2
	dcb	$40	;Attrib DW_AT_frame_base
	dcb	$6	;Form DW_FORM_data4
	dcb	$81	;Attrib DW_AT_calling
	dcb	$40
	dcb	$3	;Form DW_FORM_block2
	dcb	$a0	;Attrib DW_AT_global_ref_list
	dcb	$40
	dcb	$4	;Form DW_FORM_block4
	dcb	$1	;Attrib DW_AT_sibling
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_variable
	dcb	$3	;Code
	dcb	$34	;Tag
	dcb	$0
	dcb	$3a	;Attrib DW_AT_decl_file
	dcb	$5	;Form DW_FORM_data2
	dcb	$3b	;Attrib DW_AT_decl_line
	dcb	$5	;Form DW_FORM_data2
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$3f	;Attrib DW_AT_external
	dcb	$c	;Form DW_FORM_flag
	dcb	$3c	;Attrib DW_AT_declaration
	dcb	$c	;Form DW_FORM_flag
	dcb	$2	;Attrib DW_AT_location
	dcb	$6	;Form DW_FORM_data4
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_base_type
	dcb	$4	;Code
	dcb	$24	;Tag
	dcb	$0
	dcb	$b	;Attrib DW_AT_byte_size
	dcb	$6	;Form DW_FORM_data4
	dcb	$3e	;Attrib DW_AT_encoding
	dcb	$b	;Form DW_FORM_data1
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_pointer_type
	dcb	$5	;Code
	dcb	$f	;Tag
	dcb	$0
	dcb	$b	;Attrib DW_AT_byte_size
	dcb	$6	;Form DW_FORM_data4
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_structure_type
	dcb	$6	;Code
	dcb	$13	;Tag
	dcb	$1
	dcb	$b	;Attrib DW_AT_byte_size
	dcb	$6	;Form DW_FORM_data4
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_member
	dcb	$7	;Code
	dcb	$d	;Tag
	dcb	$0
	dcb	$b	;Attrib DW_AT_byte_size
	dcb	$6	;Form DW_FORM_data4
	dcb	$38	;Attrib DW_AT_data_member_location
	dcb	$9	;Form DW_FORM_block
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_array_type
	dcb	$8	;Code
	dcb	$1	;Tag
	dcb	$1
	dcb	$b	;Attrib DW_AT_byte_size
	dcb	$6	;Form DW_FORM_data4
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_subrange_type
	dcb	$9	;Code
	dcb	$21	;Tag
	dcb	$0
	dcb	$2f	;Attrib DW_AT_upper_bound
	dcb	$d	;Form DW_FORM_sdata
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_structure_type
	dcb	$a	;Code
	dcb	$13	;Tag
	dcb	$1
	dcb	$b	;Attrib DW_AT_byte_size
	dcb	$6	;Form DW_FORM_data4
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_typedef
	dcb	$b	;Code
	dcb	$16	;Tag
	dcb	$0
	dcb	$b	;Attrib DW_AT_byte_size
	dcb	$6	;Form DW_FORM_data4
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_subprogram
	dcb	$c	;Code
	dcb	$2e	;Tag
	dcb	$1
	dcb	$11	;Attrib DW_AT_low_pc
	dcb	$1	;Form DW_FORM_addr
	dcb	$12	;Attrib DW_AT_high_pc
	dcb	$1	;Form DW_FORM_addr
	dcb	$3a	;Attrib DW_AT_decl_file
	dcb	$5	;Form DW_FORM_data2
	dcb	$3b	;Attrib DW_AT_decl_line
	dcb	$5	;Form DW_FORM_data2
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$3f	;Attrib DW_AT_external
	dcb	$c	;Form DW_FORM_flag
	dcb	$82	;Attrib DW_AT_sp_offset
	dcb	$40
	dcb	$5	;Form DW_FORM_data2
	dcb	$40	;Attrib DW_AT_frame_base
	dcb	$6	;Form DW_FORM_data4
	dcb	$81	;Attrib DW_AT_calling
	dcb	$40
	dcb	$3	;Form DW_FORM_block2
	dcb	$a0	;Attrib DW_AT_global_ref_list
	dcb	$40
	dcb	$4	;Form DW_FORM_block4
	dcb	$1	;Attrib DW_AT_sibling
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_formal_parameter
	dcb	$d	;Code
	dcb	$5	;Tag
	dcb	$0
	dcb	$3a	;Attrib DW_AT_decl_file
	dcb	$5	;Form DW_FORM_data2
	dcb	$3b	;Attrib DW_AT_decl_line
	dcb	$5	;Form DW_FORM_data2
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$3f	;Attrib DW_AT_external
	dcb	$c	;Form DW_FORM_flag
	dcb	$3c	;Attrib DW_AT_declaration
	dcb	$c	;Form DW_FORM_flag
	dcb	$2	;Attrib DW_AT_location
	dcb	$6	;Form DW_FORM_data4
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$0
	dcb	$0	;Form 
		;DW_TAG_variable
	dcb	$e	;Code
	dcb	$34	;Tag
	dcb	$0
	dcb	$3a	;Attrib DW_AT_decl_file
	dcb	$5	;Form DW_FORM_data2
	dcb	$3b	;Attrib DW_AT_decl_line
	dcb	$5	;Form DW_FORM_data2
	dcb	$49	;Attrib DW_AT_type
	dcb	$10	;Form DW_FORM_ref_addr
	dcb	$3f	;Attrib DW_AT_external
	dcb	$c	;Form DW_FORM_flag
	dcb	$3c	;Attrib DW_AT_declaration
	dcb	$c	;Form DW_FORM_flag
	dcb	$2	;Attrib DW_AT_location
	dcb	$6	;Form DW_FORM_data4
	dcb	$3	;Attrib DW_AT_name
	dcb	$8	;Form DW_FORM_string
	dcb	$0
	dcb	$0	;Form 
	dcb	$0
	endsec



	section	.debug_line debug
	dcl	DebugLineEnd_prod-DebugLineStart_prod
DebugLineStart_prod:
	dcw	$2
	dcl	DebugLinePrologEnd_prod-DebugLinePrologStart_prod
DebugLinePrologStart_prod:
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
DebugLinePrologEnd_prod:

__dbg_ln__signalenergy_start:
	dcb	$0
	dcb	$5
	dcb	$2	;DW_LNE_set_address
	dcl	_signalenergy
	dcb	$4	;DW_LNS_set_file
	dcb	$10
	dcb	$7	;DW_LNS_set_basic_block
	dcb	33	;line+=7 to 8, addr=DW1
	dcb	$b	;DW_LNS_negate_eos
	dcb	33	;line+=7 to 15, addr=DW1
	dcb	23	;line+=-3 to 12, addr=DW1
	dcb	27	;line+=1 to 13, addr=DW1
	dcb	$b	;DW_LNS_negate_eos
	dcb	19	;line+=-7 to 6, addr=DW1
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26	;line+=0 to 6, addr=DW1
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	34+25*(DW2-DW1)/2	;line+=8 to 14, addr=DW2
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	18	;line+=-8 to 6, addr=DW2
	dcb	$b	;DW_LNS_negate_eos
	dcb	26+25*(DW3-DW2)/2	;line+=0 to 6, addr=DW3
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$3	;DW_LNS_advance_line
	dcb	$d	;line+=13 to 19
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	DW4-DW3	;addr=DW4
	dcb	$1	;DW_LNS_copy
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	15	;line+=-11 to 8, addr=DW4
	dcb	$b	;DW_LNS_negate_eos
	dcb	37+25*(DW5-DW4)/2	;line+=11 to 19, addr=DW5
	dcb	$7	;DW_LNS_set_basic_block
	dcb	26+25*(DW6-DW5)/2	;line+=0 to 19, addr=DW6
	dcb	$6	;DW_LNS_negate_stmt
	dcb	27	;line+=1 to 20, addr=DW6
	dcb	27	;line+=1 to 21, addr=DW6
	dcb	$6	;DW_LNS_negate_stmt
	dcb	24	;line+=-2 to 19, addr=DW6
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	27+25*(DW7-DW6)/2	;line+=1 to 20, addr=DW7
	dcb	27	;line+=1 to 21, addr=DW7
	dcb	$b	;DW_LNS_negate_eos
	dcb	24	;line+=-2 to 19, addr=DW7
	dcb	$b	;DW_LNS_negate_eos
	dcb	26	;line+=0 to 19, addr=DW7
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	38	;line+=12 to 31, addr=DW7
	dcb	$b	;DW_LNS_negate_eos
	dcb	20+25*(DW8-DW7)/2	;line+=-6 to 25, addr=DW8
	dcb	27	;line+=1 to 26, addr=DW8
	dcb	27+25*(DW9-DW8)/2	;line+=1 to 27, addr=DW9
	dcb	$b	;DW_LNS_negate_eos
	dcb	28+25*(DW10-DW9)/2	;line+=2 to 29, addr=DW10
	dcb	$6	;DW_LNS_negate_stmt
	dcb	28+25*(DW11-DW10)/2	;line+=2 to 31, addr=DW11
	dcb	24	;line+=-2 to 29, addr=DW11
	dcb	$b	;DW_LNS_negate_eos
	dcb	26+25*(DW12-DW11)/2	;line+=0 to 29, addr=DW12
	dcb	28	;line+=2 to 31, addr=DW12
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	DW14-DW12	;addr=DW14
	dcb	$1d	;special opcode: line+=3 to 34
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	DW15-DW14	;addr=DW15
	dcb	$1a	;special opcode: line+=0 to 34
	dcb	26+25*(DW16-DW15)/2	;line+=0 to 34, addr=DW16
	dcb	26+25*(DW17-DW16)/2	;line+=0 to 34, addr=DW17
	dcb	26+25*(DW18-DW17)/2	;line+=0 to 34, addr=DW18
	dcb	$b	;DW_LNS_negate_eos
	dcb	26+25*(DW19-DW18)/2	;line+=0 to 34, addr=DW19
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$6	;DW_LNS_negate_stmt
	dcb	27+25*(DW20-DW19)/2	;line+=1 to 35, addr=DW20
	dcb	28	;line+=2 to 37, addr=DW20
	dcb	27	;line+=1 to 38, addr=DW20
	dcb	27	;line+=1 to 39, addr=DW20
	dcb	$b	;DW_LNS_negate_eos
	dcb	31	;line+=5 to 44, addr=DW20
	dcb	$b	;DW_LNS_negate_eos
	dcb	22+25*(DW21-DW20)/2	;line+=-4 to 40, addr=DW21
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	30	;line+=4 to 44, addr=DW21
	dcb	$7	;DW_LNS_set_basic_block
	dcb	26+25*(DW22-DW21)/2	;line+=0 to 44, addr=DW22
	dcb	$6	;DW_LNS_negate_stmt
	dcb	27	;line+=1 to 45, addr=DW22
	dcb	27	;line+=1 to 46, addr=DW22
	dcb	$6	;DW_LNS_negate_stmt
	dcb	24	;line+=-2 to 44, addr=DW22
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	27+25*(DW23-DW22)/2	;line+=1 to 45, addr=DW23
	dcb	27	;line+=1 to 46, addr=DW23
	dcb	$b	;DW_LNS_negate_eos
	dcb	24	;line+=-2 to 44, addr=DW23
	dcb	$b	;DW_LNS_negate_eos
	dcb	26	;line+=0 to 44, addr=DW23
	dcb	$6	;DW_LNS_negate_stmt
	dcb	32+25*(DW24-DW23)/2	;line+=6 to 50, addr=DW24
	dcb	27	;line+=1 to 51, addr=DW24
	dcb	27+25*(DW25-DW24)/2	;line+=1 to 52, addr=DW25
	dcb	$b	;DW_LNS_negate_eos
	dcb	28+25*(DW26-DW25)/2	;line+=2 to 54, addr=DW26
	dcb	27+25*(DW27-DW26)/2	;line+=1 to 55, addr=DW27
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	25	;line+=-1 to 54, addr=DW27
	dcb	27+25*(DW28-DW27)/2	;line+=1 to 55, addr=DW28
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	DW30-DW28	;addr=DW30
	dcb	$1c	;special opcode: line+=2 to 57
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26	;line+=0 to 57, addr=DW30
	dcb	26+25*(DW31-DW30)/2	;line+=0 to 57, addr=DW31
	dcb	$b	;DW_LNS_negate_eos
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW32-DW31)/2	;line+=0 to 57, addr=DW32
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW33-DW32)/2	;line+=1 to 58, addr=DW33
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26	;line+=0 to 58, addr=DW33
	dcb	26+25*(DW34-DW33)/2	;line+=0 to 58, addr=DW34
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW35-DW34)/2	;line+=0 to 58, addr=DW35
	dcb	$b	;DW_LNS_negate_eos
	dcb	26	;line+=0 to 58, addr=DW35
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	28+25*(DW36-DW35)/2	;line+=2 to 60, addr=DW36
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW37-DW36)/2	;line+=0 to 60, addr=DW37
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW38-DW37)/2	;line+=0 to 60, addr=DW38
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW39-DW38)/2	;line+=1 to 61, addr=DW39
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26	;line+=0 to 61, addr=DW39
	dcb	$b	;DW_LNS_negate_eos
	dcb	25+25*(DW40-DW39)/2	;line+=-1 to 60, addr=DW40
	dcb	$b	;DW_LNS_negate_eos
	dcb	27	;line+=1 to 61, addr=DW40
	dcb	26+25*(DW41-DW40)/2	;line+=0 to 61, addr=DW41
	dcb	$b	;DW_LNS_negate_eos
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW42-DW41)/2	;line+=0 to 61, addr=DW42
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW43-DW42)/2	;line+=1 to 62, addr=DW43
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW44-DW43)/2	;line+=0 to 62, addr=DW44
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	DW46-DW44	;addr=DW46
	dcb	$1b	;special opcode: line+=1 to 63
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW47-DW46)/2	;line+=0 to 63, addr=DW47
	dcb	$b	;DW_LNS_negate_eos
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW48-DW47)/2	;line+=0 to 63, addr=DW48
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW49-DW48)/2	;line+=1 to 64, addr=DW49
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW50-DW49)/2	;line+=0 to 64, addr=DW50
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	28+25*(DW51-DW50)/2	;line+=2 to 66, addr=DW51
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW52-DW51)/2	;line+=0 to 66, addr=DW52
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW53-DW52)/2	;line+=0 to 66, addr=DW53
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW54-DW53)/2	;line+=1 to 67, addr=DW54
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26	;line+=0 to 67, addr=DW54
	dcb	$b	;DW_LNS_negate_eos
	dcb	25+25*(DW55-DW54)/2	;line+=-1 to 66, addr=DW55
	dcb	$b	;DW_LNS_negate_eos
	dcb	27	;line+=1 to 67, addr=DW55
	dcb	26+25*(DW56-DW55)/2	;line+=0 to 67, addr=DW56
	dcb	$b	;DW_LNS_negate_eos
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW57-DW56)/2	;line+=0 to 67, addr=DW57
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW58-DW57)/2	;line+=1 to 68, addr=DW58
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW59-DW58)/2	;line+=0 to 68, addr=DW59
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	DW61-DW59	;addr=DW61
	dcb	$1b	;special opcode: line+=1 to 69
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW62-DW61)/2	;line+=0 to 69, addr=DW62
	dcb	$b	;DW_LNS_negate_eos
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW63-DW62)/2	;line+=0 to 69, addr=DW63
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW64-DW63)/2	;line+=1 to 70, addr=DW64
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	26+25*(DW65-DW64)/2	;line+=0 to 70, addr=DW65
	dcb	$7	;DW_LNS_set_basic_block
	dcb	$b	;DW_LNS_negate_eos
	dcb	$6	;DW_LNS_negate_stmt
	dcb	$a	;DW_LNS_negate_delay_slot
	dcb	27+25*(DW66-DW65)/2	;line+=1 to 71, addr=DW66
	dcb	$6	;DW_LNS_negate_stmt
	dcb	26+25*(DW67-DW66)/2	;line+=0 to 71, addr=DW67
	dcb	26+25*(DW68-DW67)/2	;line+=0 to 71, addr=DW68
	dcb	$b	;DW_LNS_negate_eos
	dcb	26+25*(DW69-DW68)/2	;line+=0 to 71, addr=DW69
	dcb	$9	;DW_LNS_fixed_advance_pc
	dcw	FuncEnd_signalenergy-DW69	;addr=FuncEnd_signalenergy
	dcb	$3	;DW_LNS_advance_line
	dcb	$b9	;Reset line number: line-=71 to 0
	dcb	$7f
	dcb	$0
	dcb	$1
	dcb	$1	;DW_LNE_end_sequence

__dbg_ln__signalenergy_end:
;PRAGMA remove_block __dbg_ln__signalenergy_start,__dbg_ln__signalenergy_end-__dbg_ln__signalenergy_start,_signalenergy
DebugLineEnd_prod:
	endsec

	section	.debug_pubnames debug
	dcl	DebugPubNamesEnd_prod-DebugPubNamesStart_prod	;Public Names section length
DebugPubNamesStart_prod:
	dcw	$2	;DWARF version
	dcl	DebugInfoStart_prod-4	;Compilation unit info start
	dcl	DebugInfoEnd_prod-DebugInfoStart_prod	;Compilation unit info length
	dcl	$0
DebugPubNamesEnd_prod:
	endsec

	section	.debug_aranges debug
	dcl	DebugAddressRangesEnd_prod-DebugAddressRangesStart_prod	;Address Ranges section length
DebugAddressRangesStart_prod:
	dcw	$2	;DWARF version
	dcl	DebugInfoStart_prod-4	;Compilation unit info start
	dcb	$4	;Size of Address
	dcb	$0	;Size of Segment Descriptor
	dcl	$0
	dcl	TextStart_prod	;Compilation unit C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/prod.c start
	dcl	TextEnd_prod-TextStart_prod	;Compilation unit C:/Documents and Settings/Sorin/Desktop/Tema PSC/442G_Iepure_Albert/src/prod.c length
	dcl	$0
	dcl	$0
DebugAddressRangesEnd_prod:
	endsec

	section	.debug_loc debug
Loc_prod_optimized_away:
	dcl	$0	;Optimized away
	dcl	$0	;List end
Frame_base__signalenergy_prod:
	dcl	_signalenergy	;Start Address
	dcl	DW3	;End Address
	dcw	Loc_10_end_prod-*-2	;Location
Loc_10_beg_prod:
	dcb	$70	;DW_OP_breg0, Sp
	dcb	$78	;-8
Loc_10_end_prod:
	dcl	DW3	;Start Address
	dcl	DW4	;End Address
	dcw	Loc_11_end_prod-*-2	;Location
Loc_11_beg_prod:
	dcb	$70	;DW_OP_breg0, Sp
	dcb	$70	;-16
Loc_11_end_prod:
	dcl	DW4	;Start Address
	dcl	DW67	;End Address
	dcw	Loc_12_end_prod-*-2	;Location
Loc_12_beg_prod:
	dcb	$70	;DW_OP_breg0, Sp
	dcb	$58	;-40
Loc_12_end_prod:
	dcl	DW67	;Start Address
	dcl	DW68	;End Address
	dcw	Loc_13_end_prod-*-2	;Location
Loc_13_beg_prod:
	dcb	$70	;DW_OP_breg0, Sp
	dcb	$70	;-16
Loc_13_end_prod:
	dcl	DW68	;Start Address
	dcl	DW69	;End Address
	dcw	Loc_14_end_prod-*-2	;Location
Loc_14_beg_prod:
	dcb	$70	;DW_OP_breg0, Sp
	dcb	$78	;-8
Loc_14_end_prod:
	dcl	DW69	;Start Address
	dcl	F_signalenergy_end	;End Address
	dcw	Loc_15_end_prod-*-2	;Location
Loc_15_beg_prod:
	dcb	$50	;DW_OP_reg0, Sp
Loc_15_end_prod:
	dcl	$0	;List end
	dcl	$0
Loc_prodv123_0:			;v123
	dcl	DW1	;Start Address
	dcl	DW29	;End Address
	dcw	Loc_16_end_prod-*-2	;Location
Loc_16_beg_prod:
	dcb	$61	;DW_OP_reg17, r0
Loc_16_end_prod:
	dcl	$0	;List End
	dcl	$0
Loc_prodv124_1:			;v124
	dcl	DW60	;Start Address
	dcl	DW66	;End Address
	dcw	Loc_17_end_prod-*-2	;Location
Loc_17_beg_prod:
	dcb	$91	;DW_OP_fbreg
	dcb	$18	;24
Loc_17_end_prod:
	dcl	DW59	;Start Address
	dcl	DW60	;End Address
	dcw	Loc_18_end_prod-*-2	;Location
Loc_18_beg_prod:
	dcb	$56	;DW_OP_reg6, d5
Loc_18_end_prod:
	dcl	DW56	;Start Address
	dcl	DW59	;End Address
	dcw	Loc_19_end_prod-*-2	;Location
Loc_19_beg_prod:
	dcb	$91	;DW_OP_fbreg
	dcb	$18	;24
Loc_19_end_prod:
	dcl	DW53	;Start Address
	dcl	DW56	;End Address
	dcw	Loc_20_end_prod-*-2	;Location
Loc_20_beg_prod:
	dcb	$61	;DW_OP_reg17, r0
Loc_20_end_prod:
	dcl	DW45	;Start Address
	dcl	DW51	;End Address
	dcw	Loc_21_end_prod-*-2	;Location
Loc_21_beg_prod:
	dcb	$91	;DW_OP_fbreg
	dcb	$18	;24
Loc_21_end_prod:
	dcl	DW44	;Start Address
	dcl	DW45	;End Address
	dcw	Loc_22_end_prod-*-2	;Location
Loc_22_beg_prod:
	dcb	$53	;DW_OP_reg3, d2
Loc_22_end_prod:
	dcl	DW41	;Start Address
	dcl	DW44	;End Address
	dcw	Loc_23_end_prod-*-2	;Location
Loc_23_beg_prod:
	dcb	$91	;DW_OP_fbreg
	dcb	$18	;24
Loc_23_end_prod:
	dcl	DW38	;Start Address
	dcl	DW41	;End Address
	dcw	Loc_24_end_prod-*-2	;Location
Loc_24_beg_prod:
	dcb	$61	;DW_OP_reg17, r0
Loc_24_end_prod:
	dcl	$0	;List End
	dcl	$0
Loc_prodv125_2:			;v125
	dcl	DW22	;Start Address
	dcl	DW25	;End Address
	dcw	Loc_25_end_prod-*-2	;Location
Loc_25_beg_prod:
	dcb	$56	;DW_OP_reg6, d5
Loc_25_end_prod:
	dcl	DW2	;Start Address
	dcl	DW9	;End Address
	dcw	Loc_26_end_prod-*-2	;Location
Loc_26_beg_prod:
	dcb	$55	;DW_OP_reg5, d4
Loc_26_end_prod:
	dcl	$0	;List End
	dcl	$0
Loc_prodv126_3:			;v126
	dcl	DW21	;Start Address
	dcl	DW25	;End Address
	dcw	Loc_27_end_prod-*-2	;Location
Loc_27_beg_prod:
	dcb	$55	;DW_OP_reg5, d4
Loc_27_end_prod:
	dcl	DW25	;Start Address
	dcl	DW26	;End Address
	dcw	Loc_28_end_prod-*-2	;Location
Loc_28_beg_prod:
	dcb	$5a	;DW_OP_reg10, d9
Loc_28_end_prod:
	dcl	DW9	;Start Address
	dcl	DW10	;End Address
	dcw	Loc_29_end_prod-*-2	;Location
Loc_29_beg_prod:
	dcb	$5a	;DW_OP_reg10, d9
Loc_29_end_prod:
	dcl	DW3	;Start Address
	dcl	DW9	;End Address
	dcw	Loc_30_end_prod-*-2	;Location
Loc_30_beg_prod:
	dcb	$54	;DW_OP_reg4, d3
Loc_30_end_prod:
	dcl	$0	;List End
	dcl	$0
Loc_prodv127_4:			;v127
	dcl	DW21	;Start Address
	dcl	DW25	;End Address
	dcw	Loc_31_end_prod-*-2	;Location
Loc_31_beg_prod:
	dcb	$54	;DW_OP_reg4, d3
Loc_31_end_prod:
	dcl	DW2	;Start Address
	dcl	DW9	;End Address
	dcw	Loc_32_end_prod-*-2	;Location
Loc_32_beg_prod:
	dcb	$53	;DW_OP_reg3, d2
Loc_32_end_prod:
	dcl	$0	;List End
	dcl	$0
Loc_prodv128_5:			;v128
	dcl	DW36	;Start Address
	dcl	DW55	;End Address
	dcw	Loc_33_end_prod-*-2	;Location
Loc_33_beg_prod:
	dcb	$91	;DW_OP_fbreg
	dcb	$10	;16
Loc_33_end_prod:
	dcl	DW55	;Start Address
	dcl	DW56	;End Address
	dcw	Loc_34_end_prod-*-2	;Location
Loc_34_beg_prod:
	dcb	$5d	;DW_OP_reg13, d12
Loc_34_end_prod:
	dcl	DW30	;Start Address
	dcl	DW34	;End Address
	dcw	Loc_35_end_prod-*-2	;Location
Loc_35_beg_prod:
	dcb	$91	;DW_OP_fbreg
	dcb	$10	;16
Loc_35_end_prod:
	dcl	DW34	;Start Address
	dcl	DW36	;End Address
	dcw	Loc_36_end_prod-*-2	;Location
Loc_36_beg_prod:
	dcb	$5d	;DW_OP_reg13, d12
Loc_36_end_prod:
	dcl	DW21	;Start Address
	dcl	DW25	;End Address
	dcw	Loc_37_end_prod-*-2	;Location
Loc_37_beg_prod:
	dcb	$53	;DW_OP_reg3, d2
Loc_37_end_prod:
	dcl	DW26	;Start Address
	dcl	DW27	;End Address
	dcw	Loc_38_end_prod-*-2	;Location
Loc_38_beg_prod:
	dcb	$5b	;DW_OP_reg11, d10
Loc_38_end_prod:
	dcl	DW25	;Start Address
	dcl	DW26	;End Address
	dcw	Loc_39_end_prod-*-2	;Location
Loc_39_beg_prod:
	dcb	$59	;DW_OP_reg9, d8
Loc_39_end_prod:
	dcl	DW12	;Start Address
	dcl	DW13	;End Address
	dcw	Loc_40_end_prod-*-2	;Location
Loc_40_beg_prod:
	dcb	$5d	;DW_OP_reg13, d12
Loc_40_end_prod:
	dcl	DW10	;Start Address
	dcl	DW11	;End Address
	dcw	Loc_41_end_prod-*-2	;Location
Loc_41_beg_prod:
	dcb	$5b	;DW_OP_reg11, d10
Loc_41_end_prod:
	dcl	DW9	;Start Address
	dcl	DW10	;End Address
	dcw	Loc_42_end_prod-*-2	;Location
Loc_42_beg_prod:
	dcb	$59	;DW_OP_reg9, d8
Loc_42_end_prod:
	dcl	DW2	;Start Address
	dcl	DW9	;End Address
	dcw	Loc_43_end_prod-*-2	;Location
Loc_43_beg_prod:
	dcb	$52	;DW_OP_reg2, d1
Loc_43_end_prod:
	dcl	$0	;List End
	dcl	$0
Loc_prodv129_6:			;v129
	dcl	DW31	;Start Address
	dcl	DW40	;End Address
	dcw	Loc_44_end_prod-*-2	;Location
Loc_44_beg_prod:
	dcb	$91	;DW_OP_fbreg
	dcb	$14	;20
Loc_44_end_prod:
	dcl	DW40	;Start Address
	dcl	DW41	;End Address
	dcw	Loc_45_end_prod-*-2	;Location
Loc_45_beg_prod:
	dcb	$51	;DW_OP_reg1, d0
Loc_45_end_prod:
	dcl	DW6	;Start Address
	dcl	DW31	;End Address
	dcw	Loc_46_end_prod-*-2	;Location
Loc_46_beg_prod:
	dcb	$51	;DW_OP_reg1, d0
Loc_46_end_prod:
	dcl	DW5	;Start Address
	dcl	DW6	;End Address
	dcw	Loc_47_end_prod-*-2	;Location
Loc_47_beg_prod:
	dcb	$91	;DW_OP_fbreg
	dcb	$14	;20
Loc_47_end_prod:
	dcl	DW2	;Start Address
	dcl	DW5	;End Address
	dcw	Loc_48_end_prod-*-2	;Location
Loc_48_beg_prod:
	dcb	$51	;DW_OP_reg1, d0
Loc_48_end_prod:
	dcl	$0	;List End
	dcl	$0
	endsec


	section	.debug_frame debug
DebugFrameStart_prod:
	dcl	CommonInfoEntryStandardEnd_prod-CommonInfoEntryStandardStart_prod	;Standard CIE
CommonInfoEntryStandardStart_prod:
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
CommonInfoEntryStandardEnd_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc3_prod-CommonInfoEntryNonStandardStart_cc3_prod	;NonStandard_cc3 CIE
CommonInfoEntryNonStandardStart_cc3_prod:
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
CommonInfoEntryNonStandardEnd_cc3_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc4_prod-CommonInfoEntryNonStandardStart_cc4_prod	;NonStandard_cc4 CIE
CommonInfoEntryNonStandardStart_cc4_prod:
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
CommonInfoEntryNonStandardEnd_cc4_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc5_prod-CommonInfoEntryNonStandardStart_cc5_prod	;NonStandard_cc5 CIE
CommonInfoEntryNonStandardStart_cc5_prod:
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
CommonInfoEntryNonStandardEnd_cc5_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc6_prod-CommonInfoEntryNonStandardStart_cc6_prod	;NonStandard_cc6 CIE
CommonInfoEntryNonStandardStart_cc6_prod:
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
CommonInfoEntryNonStandardEnd_cc6_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc7_prod-CommonInfoEntryNonStandardStart_cc7_prod	;NonStandard_cc7 CIE
CommonInfoEntryNonStandardStart_cc7_prod:
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
CommonInfoEntryNonStandardEnd_cc7_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc8_prod-CommonInfoEntryNonStandardStart_cc8_prod	;NonStandard_cc8 CIE
CommonInfoEntryNonStandardStart_cc8_prod:
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
CommonInfoEntryNonStandardEnd_cc8_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc9_prod-CommonInfoEntryNonStandardStart_cc9_prod	;NonStandard_cc9 CIE
CommonInfoEntryNonStandardStart_cc9_prod:
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
CommonInfoEntryNonStandardEnd_cc9_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc10_prod-CommonInfoEntryNonStandardStart_cc10_prod	;NonStandard_cc10 CIE
CommonInfoEntryNonStandardStart_cc10_prod:
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
CommonInfoEntryNonStandardEnd_cc10_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc11_prod-CommonInfoEntryNonStandardStart_cc11_prod	;NonStandard_cc11 CIE
CommonInfoEntryNonStandardStart_cc11_prod:
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
CommonInfoEntryNonStandardEnd_cc11_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc12_prod-CommonInfoEntryNonStandardStart_cc12_prod	;NonStandard_cc12 CIE
CommonInfoEntryNonStandardStart_cc12_prod:
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
CommonInfoEntryNonStandardEnd_cc12_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc13_prod-CommonInfoEntryNonStandardStart_cc13_prod	;NonStandard_cc13 CIE
CommonInfoEntryNonStandardStart_cc13_prod:
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
CommonInfoEntryNonStandardEnd_cc13_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc14_prod-CommonInfoEntryNonStandardStart_cc14_prod	;NonStandard_cc14 CIE
CommonInfoEntryNonStandardStart_cc14_prod:
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
CommonInfoEntryNonStandardEnd_cc14_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc15_prod-CommonInfoEntryNonStandardStart_cc15_prod	;NonStandard_cc15 CIE
CommonInfoEntryNonStandardStart_cc15_prod:
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
CommonInfoEntryNonStandardEnd_cc15_prod:
	dcl	CommonInfoEntryNonStandardEnd_cc16_prod-CommonInfoEntryNonStandardStart_cc16_prod	;NonStandard_cc16 CIE
CommonInfoEntryNonStandardStart_cc16_prod:
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
CommonInfoEntryNonStandardEnd_cc16_prod:
	dcl	_DE__signalenergy_prod_End-_DE__signalenergy_prod_Start
_DE__signalenergy_prod_Start:
	dcl	CommonInfoEntryStandardStart_prod-4	;CIE_ptr std
	dcl	_signalenergy	;initial_location
	dcl	F_signalenergy_end-_signalenergy	;address_range
	dcb	$3	;DW_CFA_advance_loc2: (DW2-DW1)/2
	dcw	(DW2-DW1)/2
	dcb	$87	;DW_CFA_offset, Reg #7
	dcb	$0	;Offset from CFA
	dcb	$88	;DW_CFA_offset, Reg #8
	dcb	$1	;Offset from CFA
	dcb	$e	;DW_CFA_def_cfa_offset: 2
	dcb	$2
	dcb	$3	;DW_CFA_advance_loc2: (DW3-DW2)/2
	dcw	(DW3-DW2)/2
	dcb	$97	;DW_CFA_offset, Reg #23
	dcb	$2	;Offset from CFA
	dcb	$98	;DW_CFA_offset, Reg #24
	dcb	$3	;Offset from CFA
	dcb	$e	;DW_CFA_def_cfa_offset: 4
	dcb	$4
	dcb	$3	;DW_CFA_advance_loc2: (DW4-DW3)/2
	dcw	(DW4-DW3)/2
	dcb	$e	;DW_CFA_def_cfa_offset: 4 + 6
	dcb	$a
	dcb	$3	;DW_CFA_advance_loc2: (DW67-DW4)/2
	dcw	(DW67-DW4)/2
	dcb	$e	;DW_CFA_def_cfa_offset: 10 + -6
	dcb	$4
	dcb	$3	;DW_CFA_advance_loc2: (DW68-DW67)/2
	dcw	(DW68-DW67)/2
	dcb	$d7	;DW_CFA_restore, Reg #23
	dcb	$d8	;DW_CFA_restore, Reg #24
	dcb	$e	;DW_CFA_def_cfa_offset: 2
	dcb	$2
	dcb	$3	;DW_CFA_advance_loc2: (DW69-DW68)/2
	dcw	(DW69-DW68)/2
	dcb	$c7	;DW_CFA_restore, Reg #7
	dcb	$c8	;DW_CFA_restore, Reg #8
	dcb	$e	;DW_CFA_def_cfa_offset: 0
	dcb	$0
	dcb	$0	;DW_CFA_nop
	dcb	$0	;DW_CFA_nop
_DE__signalenergy_prod_End:
	endsec


	section	.debug_flow_graph debug
DebugFlowGraphStart_prod:
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW1",0	
	dcb	"DW5",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$1	;Number Of Strings
	dcb	"DW6",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW6",0	
	dcb	"DW6",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"DW6",0	
	dcb	"DW7",0	
	dcb	$7	;DW_FG_PRED
	dcb	$2	;Number Of Strings
	dcb	"DW6",0	
	dcb	"DW1",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW7",0	
	dcb	"DW12",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"DW30",0	
	dcb	"DW13",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW6",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW13",0	
	dcb	"DW14",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$1	;Number Of Strings
	dcb	"DW15",0	
	dcb	$7	;DW_FG_PRED
	dcb	$2	;Number Of Strings
	dcb	"DW7",0	
	dcb	"DW23",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW15",0	
	dcb	"DW19",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"DW15",0	
	dcb	"DW20",0	
	dcb	$7	;DW_FG_PRED
	dcb	$2	;Number Of Strings
	dcb	"DW13",0	
	dcb	"DW15",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW20",0	
	dcb	"DW21",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$1	;Number Of Strings
	dcb	"DW22",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW15",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW22",0	
	dcb	"DW22",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"DW22",0	
	dcb	"DW23",0	
	dcb	$7	;DW_FG_PRED
	dcb	$2	;Number Of Strings
	dcb	"DW22",0	
	dcb	"DW20",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW23",0	
	dcb	"DW28",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"DW13",0	
	dcb	"DW29",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW22",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW29",0	
	dcb	"DW29",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$1	;Number Of Strings
	dcb	"DW30",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW23",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW30",0	
	dcb	"DW32",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_printf",0	
	dcb	"DW33",0	
	dcb	$7	;DW_FG_PRED
	dcb	$2	;Number Of Strings
	dcb	"DW29",0	
	dcb	"DW7",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW33",0	
	dcb	"DW35",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_printf",0	
	dcb	"DW36",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW30",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW36",0	
	dcb	"DW38",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fopen",0	
	dcb	"DW39",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW33",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW39",0	
	dcb	"DW42",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fprintf",0	
	dcb	"DW43",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW36",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW43",0	
	dcb	"DW48",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_printf",0	
	dcb	"DW49",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW39",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW49",0	
	dcb	"DW50",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fclose",0	
	dcb	"DW51",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW43",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW51",0	
	dcb	"DW53",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fopen",0	
	dcb	"DW54",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW49",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW54",0	
	dcb	"DW57",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fprintf",0	
	dcb	"DW58",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW51",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW58",0	
	dcb	"DW63",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_printf",0	
	dcb	"DW64",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW54",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW64",0	
	dcb	"DW65",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$2	;Number Of Strings
	dcb	"_fclose",0	
	dcb	"DW66",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW58",0	
	dcb	$5	;DW_FG_BLOCK
	dcb	"DW66",0	
	dcb	"DW69",0	
	dcb	$6	;DW_FG_SUCC
	dcb	$1	;Number Of Strings
	dcb	"@NONE@",0	
	dcb	$7	;DW_FG_PRED
	dcb	$1	;Number Of Strings
	dcb	"DW64",0	
	dcb	$8

	endsec

	section	.debug_flow_blocks debug
DebugFlowBlocksStart_prod:
	dcb	$8	;DW_FG_END

	endsec

	section	.debug_vars_read_write debug
DebugVarsReadWriteStart_prod:
	dcb	$2	;DW_RWDI_ROUTINE
	dcb	"_signalenergy",0	
	dcb	$8

	endsec
