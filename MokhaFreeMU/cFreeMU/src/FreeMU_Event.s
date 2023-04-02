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
	.file	"FreeMU_Event.c"
	.text
	.align	1
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	RunMapDoorEventTemplate, %function
RunMapDoorEventTemplate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r3, .L12
	movs	r4, r0
	movs	r5, r1
	bl	.L14
	str	r0, [sp, #4]
	ldr	r0, .L12+4
	ldrh	r3, [r0, #2]
	movs	r2, #1
	cmp	r5, r3
	bgt	.L2
	movs	r2, #0
.L2:
	lsrs	r3, r4, #31
	ldrh	r0, [r0]
	ands	r2, r3
	lsrs	r3, r5, #31
	ands	r3, r2
	movs	r2, #1
	cmp	r4, r0
	bgt	.L3
	movs	r2, #0
.L3:
	movs	r0, r3
	ands	r0, r2
	tst	r3, r2
	bne	.L8
	ldr	r3, .L12+8
	ldr	r3, [r3]
	lsls	r2, r5, #2
	ldr	r3, [r2, r3]
	ldr	r2, .L12+12
	ldrb	r7, [r3, r4]
.L5:
	ldrb	r3, [r2]
	cmp	r3, #0
	beq	.L4
	ldr	r1, [sp, #4]
	cmp	r3, r1
	bne	.L6
	ldrb	r3, [r2, #1]
	rsbs	r6, r3, #0
	adcs	r6, r6, r3
	subs	r3, r3, r7
	movs	r1, r3
	rsbs	r3, r1, #0
	adcs	r3, r3, r1
	orrs	r6, r3
	beq	.L6
	movs	r0, r4
	movs	r1, r5
	ldr	r3, .L12+16
	bl	.L14
	movs	r0, r6
.L4:
	@ sp needed
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L6:
	adds	r2, r2, #2
	b	.L5
.L8:
	movs	r0, #0
	b	.L4
.L13:
	.align	2
.L12:
	.word	GetLocationEventCommandAt
	.word	gMapSize
	.word	gMapTerrain
	.word	HookListFMU_LocationBasedEventDoor
	.word	RunLocationEvents
	.size	RunMapDoorEventTemplate, .-RunMapDoorEventTemplate
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	RunTalkEventTemplate, %function
RunTalkEventTemplate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, r0
	ldr	r0, .L33
	ldrh	r3, [r0, #2]
	movs	r5, #1
	cmp	r2, r3
	bgt	.L17
	movs	r5, #0
.L17:
	lsrs	r3, r2, #31
	ands	r3, r5
	lsrs	r5, r1, #31
	tst	r5, r3
	beq	.L16
	ldrh	r0, [r0]
	movs	r3, #1
	cmp	r1, r0
	bgt	.L18
	movs	r3, #0
.L18:
	lsls	r3, r3, #24
	beq	.L16
.L20:
	movs	r0, #0
.L19:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L16:
	ldr	r3, .L33+4
	ldr	r3, [r3]
	lsls	r2, r2, #2
	ldr	r3, [r2, r3]
	ldrb	r0, [r3, r1]
	cmp	r0, #0
	beq	.L20
	ldr	r3, .L33+8
	bl	.L14
	ldr	r3, [r0]
	ldrb	r5, [r3, #4]
	movs	r0, r4
	movs	r1, r5
	ldr	r3, .L33+12
	bl	.L14
	cmp	r0, #0
	beq	.L20
	movs	r0, r4
	movs	r1, r5
	ldr	r3, .L33+16
	bl	.L14
	movs	r0, #1
	b	.L19
.L34:
	.align	2
.L33:
	.word	gMapSize
	.word	gMapUnit
	.word	GetUnit
	.word	134758249
	.word	134758321
	.size	RunTalkEventTemplate, .-RunTalkEventTemplate
	.align	1
	.global	pFMU_RunMiscBasedEvents
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_RunMiscBasedEvents, %function
pFMU_RunMiscBasedEvents:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L36
	@ sp needed
	ldr	r3, [r3]
	ldrb	r1, [r3, #17]
	ldrb	r0, [r3, #16]
	ldr	r3, .L36+4
	bl	.L14
	pop	{r4}
	pop	{r0}
	bx	r0
.L37:
	.align	2
.L36:
	.word	gActiveUnit
	.word	RunMiscBasedEvents
	.size	pFMU_RunMiscBasedEvents, .-pFMU_RunMiscBasedEvents
	.align	1
	.global	FMUmisc_RunMapEvents
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	FMUmisc_RunMapEvents, %function
FMUmisc_RunMapEvents:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r5, #16
	movs	r6, #17
	ldr	r3, .L56
	ldr	r3, [r3]
	ldrsb	r5, [r3, r5]
	ldrsb	r6, [r3, r6]
	movs	r0, r5
	movs	r1, r6
	ldr	r3, .L56+4
	bl	.L14
	ldr	r1, .L56+8
	ldrh	r4, [r1]
	movs	r2, r6
	mov	ip, r4
	ands	r2, r5
	movs	r4, #1
	str	r0, [sp, #4]
	lsls	r3, r5, #24
	lsls	r7, r6, #24
	lsrs	r2, r2, #31
	cmp	r5, ip
	bgt	.L41
	movs	r4, #0
.L41:
	tst	r2, r4
	beq	.L49
	ldrh	r1, [r1, #2]
	movs	r2, #1
	cmp	r6, r1
	bgt	.L42
	movs	r2, #0
.L42:
	movs	r4, #0
	lsls	r2, r2, #24
	cmp	r2, r4
	bne	.L39
.L49:
	ldr	r2, .L56+12
	ldr	r2, [r2]
	lsls	r1, r6, #2
	ldr	r2, [r1, r2]
	ldrb	r2, [r2, r5]
	ldr	r1, .L56+16
	str	r2, [sp]
.L43:
	ldrb	r2, [r1]
	cmp	r2, #0
	bne	.L45
	movs	r2, #255
	lsls	r2, r2, #24
	lsrs	r4, r3, #24
	adds	r3, r3, r2
	movs	r1, r6
	asrs	r0, r3, #24
	bl	RunMapDoorEventTemplate
	cmp	r0, #0
	beq	.L46
.L47:
	movs	r4, #1
	b	.L39
.L45:
	ldr	r0, [sp, #4]
	cmp	r2, r0
	bne	.L44
	ldrb	r2, [r1, #1]
	ldr	r0, [sp]
	rsbs	r4, r2, #0
	adcs	r4, r4, r2
	subs	r2, r2, r0
	movs	r0, r2
	rsbs	r2, r0, #0
	adcs	r2, r2, r0
	orrs	r4, r2
	beq	.L44
	movs	r1, r6
	movs	r0, r5
	ldr	r3, .L56+20
	bl	.L14
.L39:
	@ sp needed
	movs	r0, r4
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L44:
	adds	r1, r1, #2
	b	.L43
.L46:
	adds	r4, r4, #1
	lsls	r0, r4, #24
	movs	r1, r6
	asrs	r0, r0, #24
	bl	RunMapDoorEventTemplate
	cmp	r0, #0
	bne	.L47
	movs	r3, #255
	lsls	r3, r3, #24
	lsrs	r4, r7, #24
	adds	r7, r7, r3
	movs	r0, r5
	asrs	r1, r7, #24
	bl	RunMapDoorEventTemplate
	cmp	r0, #0
	bne	.L47
	adds	r4, r4, #1
	lsls	r1, r4, #24
	movs	r0, r5
	asrs	r1, r1, #24
	bl	RunMapDoorEventTemplate
	movs	r4, r0
	b	.L39
.L57:
	.align	2
.L56:
	.word	gActiveUnit
	.word	GetLocationEventCommandAt
	.word	gMapSize
	.word	gMapTerrain
	.word	HookListFMU_LocationBasedEvent
	.word	RunLocationEvents
	.size	FMUmisc_RunMapEvents, .-FMUmisc_RunMapEvents
	.align	1
	.global	FMU_RunTrapASMC
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	FMU_RunTrapASMC, %function
FMU_RunTrapASMC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r6, #16
	movs	r7, #17
	movs	r5, r0
	ldr	r3, .L66
	ldr	r3, [r3]
	ldr	r4, .L66+4
	ldrsb	r6, [r3, r6]
	ldrsb	r7, [r3, r7]
.L59:
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L61
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L60
	ldr	r3, .L66+8
	movs	r1, r7
	movs	r0, r6
	bl	.L14
	ldrb	r3, [r4]
	ldrb	r2, [r0, #2]
	cmp	r2, r3
	bne	.L60
	movs	r0, r5
	ldr	r3, [r4, #4]
	bl	.L14
	movs	r0, #1
.L61:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L60:
	adds	r4, r4, #8
	b	.L59
.L67:
	.align	2
.L66:
	.word	gActiveUnit
	.word	HookListFMU_TrapList_OnPressA
	.word	GetTrapAt
	.size	FMU_RunTrapASMC, .-FMU_RunTrapASMC
	.align	1
	.global	FMU_RunTrapASMC_Auto
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	FMU_RunTrapASMC_Auto, %function
FMU_RunTrapASMC_Auto:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r6, #16
	movs	r7, #17
	movs	r5, r0
	ldr	r3, .L76
	ldr	r3, [r3]
	ldr	r4, .L76+4
	ldrsb	r6, [r3, r6]
	ldrsb	r7, [r3, r7]
.L69:
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L71
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L70
	ldr	r3, .L76+8
	movs	r1, r7
	movs	r0, r6
	bl	.L14
	ldrb	r3, [r4]
	ldrb	r2, [r0, #2]
	cmp	r2, r3
	bne	.L70
	movs	r0, r5
	ldr	r3, [r4, #4]
	bl	.L14
	movs	r0, #1
.L71:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L70:
	adds	r4, r4, #8
	b	.L69
.L77:
	.align	2
.L76:
	.word	gActiveUnit
	.word	HookListFMU_TrapList_Auto
	.word	GetTrapAt
	.size	FMU_RunTrapASMC_Auto, .-FMU_RunTrapASMC_Auto
	.align	1
	.global	pFMU_RunLocBasedAsmcAuto
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	pFMU_RunLocBasedAsmcAuto, %function
pFMU_RunLocBasedAsmcAuto:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r6, r0
	movs	r1, #0
	movs	r2, #16
	ldr	r5, .L93
	ldr	r3, [r5]
	adds	r6, r6, #44
	ldrsb	r1, [r6, r1]
	ldrsb	r2, [r3, r2]
	movs	r4, r0
	cmp	r1, r2
	bne	.L79
	movs	r2, r0
	adds	r2, r2, #46
	ldrb	r2, [r2]
	ldrb	r3, [r3, #17]
	lsls	r2, r2, #24
	lsls	r3, r3, #24
	asrs	r2, r2, #24
	asrs	r3, r3, #24
	cmp	r2, r3
	beq	.L78
.L79:
	movs	r0, r4
	bl	FMU_RunTrapASMC_Auto
	ldr	r3, [r5]
	cmp	r0, #0
	beq	.L81
.L92:
	ldrb	r2, [r3, #16]
	strb	r2, [r6]
	movs	r2, r4
	ldrb	r3, [r3, #17]
	adds	r2, r2, #46
	strb	r3, [r2]
	movs	r1, #14
	movs	r0, r4
	ldr	r3, .L93+4
	bl	.L14
.L78:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L81:
	ldrb	r1, [r3, #17]
	ldrb	r0, [r3, #16]
	ldr	r3, .L93+8
	bl	.L14
	cmp	r0, #0
	beq	.L78
	ldr	r3, [r5]
	b	.L92
.L94:
	.align	2
.L93:
	.word	gActiveUnit
	.word	ProcGoto
	.word	RunMiscBasedEvents
	.size	pFMU_RunLocBasedAsmcAuto, .-pFMU_RunLocBasedAsmcAuto
	.align	1
	.global	FMUmisc_RunTalkEvents
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	FMUmisc_RunTalkEvents, %function
FMUmisc_RunTalkEvents:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r6, #16
	movs	r4, #17
	ldr	r3, .L99
	ldr	r3, [r3]
	ldrsb	r6, [r3, r6]
	ldrsb	r4, [r3, r4]
	ldr	r3, [r0, #48]
	lsls	r7, r6, #24
	ldr	r3, [r3]
	lsrs	r7, r7, #24
	ldrb	r5, [r3, #4]
	subs	r1, r7, #1
	lsls	r1, r1, #24
	movs	r2, r4
	movs	r0, r5
	asrs	r1, r1, #24
	bl	RunTalkEventTemplate
	cmp	r0, #0
	beq	.L96
.L98:
	movs	r0, #1
.L97:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L96:
	adds	r7, r7, #1
	lsls	r1, r7, #24
	movs	r2, r4
	movs	r0, r5
	asrs	r1, r1, #24
	bl	RunTalkEventTemplate
	cmp	r0, #0
	bne	.L98
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	subs	r2, r4, #1
	lsls	r2, r2, #24
	movs	r1, r6
	movs	r0, r5
	asrs	r2, r2, #24
	bl	RunTalkEventTemplate
	cmp	r0, #0
	bne	.L98
	adds	r4, r4, #1
	lsls	r2, r4, #24
	movs	r1, r6
	movs	r0, r5
	asrs	r2, r2, #24
	bl	RunTalkEventTemplate
	b	.L97
.L100:
	.align	2
.L99:
	.word	gActiveUnit
	.size	FMUmisc_RunTalkEvents, .-FMUmisc_RunTalkEvents
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L14:
	bx	r3
