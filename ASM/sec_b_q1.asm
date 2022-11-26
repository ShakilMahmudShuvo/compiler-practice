; D = 30;
; W = 100;
; C = 10 + W - D;
; if(D>0) {print(C)};
; ;

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
D sdword 30
W sdword 100
result sdword ?

.code
main proc
    mov eax, D
    mov edx, W
    add edx, 10
    sub edx, eax
    mov result, edx
    cmp D, 0
    jle EXIT_

    INVOKE printf, ADDR output_integer_msg_format, result

    EXIT_:
    ret
main endp
end