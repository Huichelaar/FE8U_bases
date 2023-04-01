@ Largely mimics 0xB9B38, but grabs base chapterID.
.thumb

push  {r4-r5, r14}
mov   r4, r0

@ Not sure what this does.
ldr   r0, [r4, #0x54]
mov   r1, #0x0
mov   r2, #0x0
ldr   r3, =MapMU_80BE108
bl    GOTO_R3

@ Grab base chapterID.
ldr   r5, =gGMData
ldrb  r2, [r5, #0x11]
ldr   r0, =WLC_baseChapterIDStart
lsl   r0, #0x5
lsr   r0, #0x5
add   r0, r2

@ Set memory slot 10 to actual next chapter.
ldr   r1, =gChapterData
ldrb  r2, [r1, #0xE]
ldr   r3, =gEventSlot+10*4
str   r2, [r3]

@ Set current chapter to base chapter.
strb  r0, [r1, #0xE]

@ Hide WM cursor?
ldr   r1, =gGMData
mov   r0, #0x0
strb  r0, [r1, #0x1]

@ Remove map sprites?
ldr   r3, =0x80C1AB1
bl    GOTO_R3

pop   {r4-r5}
pop   {r0}
bx    r0
GOTO_R3:
bx    r3
