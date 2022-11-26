.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
input_integer_format byte "%d",0
output_msg_format byte "%s",0
output_integer_msg_format byte "%d", 0Ah, 0
output_msg byte "To Print:", 0Ah, 0
number sdword ?
a sdword 10
count sdword 0

.code
main proc
    mov a, -1

    LOOP_:
        add a, 1
        ; INVOKE printf, ADDR output_integer_msg_format, count
        cmp a, 10
        jge EXIT_

        cmp a, 5
        je INC_COUNT_
        
        cmp a, 7
        jge COUNT_APP_
        jmp COUNT_AMM_

    INC_COUNT_:
        add count, 1
        jmp LOOP_
    COUNT_APP_:
        add a, 1
        mov eax, a
        mov count, eax
        jmp LOOP_
    COUNT_AMM_:
        sub a, 1
        mov eax, a
        mov count, eax
        jmp LOOP_

    EXIT_:
    ret
main endp
end