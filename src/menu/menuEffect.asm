@ Executed when new menu option is selected.
.thumb

push  {r14}
ldr   r0, =gProc_WorldMap
ldr   r3, =ProcFind
bl    GOTO_R3

mov   r1, #0xE              @ Valni uses this label to load its chapter.
ldr   r3, =ProcGoto
bl    GOTO_R3

mov   r0, #0x17             @ Unk, end menu, play beep sound, clear menu graphics.
pop   {r1}
bx    r1
GOTO_R3:
bx  r3
