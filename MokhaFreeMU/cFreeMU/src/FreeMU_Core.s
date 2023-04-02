	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"FreeMU_Core.c"
	.text
	.align	1
	.global	pFMU_MainLoop
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_MainLoop, %function
pFMU_MainLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L3
	movs	r4, r0
	bl	.L5
	cmp	r0, #0
	bne	.L1
	movs	r1, #1
	movs	r0, r4
	ldr	r3, .L3+4
	bl	.L5
.L1:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L4:
	.align	2
.L3:
	.word	MU_Exists
	.word	ProcGoto
	.size	pFMU_MainLoop, .-pFMU_MainLoop
	.align	1
	.global	pFMU_HanleContinueMove
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_HanleContinueMove, %function
pFMU_HanleContinueMove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ sp needed
	bx	lr
	.size	pFMU_HanleContinueMove, .-pFMU_HanleContinueMove
	.align	1
	.global	pFMU_MoveUnit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_MoveUnit, %function
pFMU_MoveUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r2, #240
	movs	r5, #16
	movs	r4, #17
	ldr	r3, .L37
	ldr	r7, .L37+4
	movs	r6, r0
	ldrh	r3, [r3, #4]
	ldr	r0, [r7]
	sub	sp, sp, #20
	ldrsb	r5, [r0, r5]
	ldrsb	r4, [r0, r4]
	tst	r3, r2
	beq	.L8
	lsls	r2, r3, #27
	bpl	.L9
	adds	r5, r5, #1
.L35:
	lsls	r5, r5, #24
	asrs	r5, r5, #24
.L8:
	lsls	r3, r5, #24
	str	r3, [sp, #8]
	lsls	r3, r4, #24
	str	r3, [sp, #12]
	movs	r3, r4
	ands	r3, r5
	lsrs	r3, r3, #31
	str	r3, [sp, #4]
	ldr	r3, .L37+8
	ldrh	r2, [r3]
	movs	r3, #1
	cmp	r5, r2
	bgt	.L14
	movs	r3, #0
.L14:
	ldr	r2, [sp, #4]
	tst	r2, r3
	beq	.L21
	ldr	r3, .L37+8
	ldrh	r2, [r3, #2]
	movs	r3, #1
	cmp	r4, r2
	bgt	.L15
	movs	r3, #0
.L15:
	lsls	r3, r3, #24
	bne	.L12
.L21:
	movs	r3, r6
	adds	r3, r3, #45
	strb	r4, [r3]
.L12:
	movs	r2, r4
	movs	r1, r5
	ldr	r3, .L37+12
	bl	.L5
	cmp	r0, #0
	beq	.L16
	ldr	r3, .L37+8
	ldrh	r1, [r3]
	movs	r2, #1
	cmp	r5, r1
	bgt	.L19
	movs	r2, #0
.L19:
	ldr	r1, [sp, #4]
	tst	r1, r2
	beq	.L22
	ldrh	r2, [r3, #2]
	movs	r3, #1
	cmp	r4, r2
	bgt	.L20
	movs	r3, #0
.L20:
	lsls	r3, r3, #24
	bne	.L7
.L22:
	ldr	r3, [sp, #12]
	lsrs	r2, r3, #24
	ldr	r3, [sp, #8]
	ldr	r0, [r7]
	lsrs	r1, r3, #24
	ldr	r4, .L37+16
	movs	r3, #16
	bl	.L39
.L7:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L9:
	lsls	r2, r3, #26
	bpl	.L10
	subs	r5, r5, #1
	b	.L35
.L10:
	lsls	r2, r3, #25
	bpl	.L11
	subs	r4, r4, #1
.L36:
	lsls	r4, r4, #24
	asrs	r4, r4, #24
	b	.L8
.L11:
	lsls	r3, r3, #24
	bpl	.L8
	adds	r4, r4, #1
	b	.L36
.L16:
	movs	r1, #2
	movs	r0, r6
	ldr	r3, .L37+20
	bl	.L5
	b	.L7
.L38:
	.align	2
.L37:
	.word	gKeyState
	.word	gActiveUnit
	.word	gMapSize
	.word	FMU_CanUnitBeOnPos
	.word	MuCtr_StartMoveTowards
	.word	ProcGoto
	.size	pFMU_MoveUnit, .-pFMU_MoveUnit
	.align	1
	.global	pFMU_HandleKeyMisc
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_HandleKeyMisc, %function
pFMU_HandleKeyMisc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L51
	ldrh	r3, [r3, #4]
	movs	r1, #4
	lsls	r2, r3, #31
	bmi	.L50
	movs	r1, #5
	lsls	r2, r3, #30
	bmi	.L50
	movs	r1, #6
	lsls	r2, r3, #22
	bmi	.L50
	movs	r1, #7
	lsls	r2, r3, #23
	bmi	.L50
	movs	r1, #8
	lsls	r2, r3, #29
	bmi	.L50
	lsls	r3, r3, #28
	bpl	.L40
	movs	r1, #9
.L50:
	ldr	r3, .L51+4
	bl	.L5
.L40:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L52:
	.align	2
.L51:
	.word	gKeyState
	.word	ProcGoto
	.size	pFMU_HandleKeyMisc, .-pFMU_HandleKeyMisc
	.align	1
	.global	pFMU_HandleSave
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_HandleSave, %function
pFMU_HandleSave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r4, r0
	adds	r4, r4, #41
	ldrb	r3, [r4]
	ldr	r2, .L55
	adds	r3, r3, #1
	lsls	r3, r3, #24
	ldrb	r2, [r2]
	lsrs	r3, r3, #24
	strb	r3, [r4]
	cmp	r2, r3
	bcs	.L53
	ldr	r3, .L55+4
	movs	r1, #14
	bl	.L5
	movs	r3, #0
	strb	r3, [r4]
.L53:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L56:
	.align	2
.L55:
	.word	TimerDelay
	.word	ProcGoto
	.size	pFMU_HandleSave, .-pFMU_HandleSave
	.align	1
	.global	pFMU_PressA
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_PressA, %function
pFMU_PressA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L63
	ldrh	r3, [r3, #4]
	movs	r5, r0
	ldr	r4, .L63+4
	lsls	r3, r3, #31
	bmi	.L58
.L57:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L60:
	movs	r0, r5
	adds	r4, r4, #4
	bl	.L5
	cmp	r0, #0
	bne	.L57
.L58:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L60
	b	.L57
.L64:
	.align	2
.L63:
	.word	gKeyState
	.word	FMU_FunctionList_OnPressA
	.size	pFMU_PressA, .-pFMU_PressA
	.align	1
	.global	pFMU_PressB
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_PressB, %function
pFMU_PressB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L71
	ldrh	r3, [r3, #4]
	movs	r5, r0
	ldr	r4, .L71+4
	lsls	r3, r3, #30
	bmi	.L66
.L65:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L68:
	movs	r0, r5
	adds	r4, r4, #4
	bl	.L5
	cmp	r0, #0
	bne	.L65
.L66:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L68
	b	.L65
.L72:
	.align	2
.L71:
	.word	gKeyState
	.word	FMU_FunctionList_OnPressB
	.size	pFMU_PressB, .-pFMU_PressB
	.align	1
	.global	pFMU_PressL
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_PressL, %function
pFMU_PressL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L79
	ldrh	r3, [r3, #4]
	movs	r5, r0
	ldr	r4, .L79+4
	lsls	r3, r3, #22
	bmi	.L74
.L73:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L76:
	movs	r0, r5
	adds	r4, r4, #4
	bl	.L5
	cmp	r0, #0
	bne	.L73
.L74:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L76
	b	.L73
.L80:
	.align	2
.L79:
	.word	gKeyState
	.word	FMU_FunctionList_OnPressL
	.size	pFMU_PressL, .-pFMU_PressL
	.align	1
	.global	pFMU_PressR
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_PressR, %function
pFMU_PressR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L87
	ldrh	r3, [r3, #4]
	movs	r5, r0
	ldr	r4, .L87+4
	lsls	r3, r3, #23
	bmi	.L82
.L81:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L84:
	movs	r0, r5
	adds	r4, r4, #4
	bl	.L5
	cmp	r0, #0
	bne	.L81
.L82:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L84
	b	.L81
.L88:
	.align	2
.L87:
	.word	gKeyState
	.word	FMU_FunctionList_OnPressR
	.size	pFMU_PressR, .-pFMU_PressR
	.align	1
	.global	pFMU_PressStart
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_PressStart, %function
pFMU_PressStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L95
	ldrh	r3, [r3, #4]
	movs	r5, r0
	ldr	r4, .L95+4
	lsls	r3, r3, #28
	bmi	.L90
.L89:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L92:
	movs	r0, r5
	adds	r4, r4, #4
	bl	.L5
	cmp	r0, #0
	bne	.L89
.L90:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L92
	b	.L89
.L96:
	.align	2
.L95:
	.word	gKeyState
	.word	FMU_FunctionList_OnPressStart
	.size	pFMU_PressStart, .-pFMU_PressStart
	.align	1
	.global	pFMU_PressSelect
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_PressSelect, %function
pFMU_PressSelect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L103
	ldrh	r3, [r3, #4]
	movs	r5, r0
	ldr	r4, .L103+4
	lsls	r3, r3, #29
	bmi	.L98
.L97:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L100:
	movs	r0, r5
	adds	r4, r4, #4
	bl	.L5
	cmp	r0, #0
	bne	.L97
.L98:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L100
	b	.L97
.L104:
	.align	2
.L103:
	.word	gKeyState
	.word	FMU_FunctionList_OnPressSelect
	.size	pFMU_PressSelect, .-pFMU_PressSelect
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L5:
	bx	r3
.L39:
	bx	r4
