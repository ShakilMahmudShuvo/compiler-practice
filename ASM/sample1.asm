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
V sdword ?
I sdword ?
R sdword ?
output_msg_1 byte "Current = ", 0Ah, 0
output_msg_2 byte "Resistance = ", 0Ah, 0
output_msg_3 byte "Voltage = ", 0


.code
main proc
    INVOKE printf, ADDR output_msg_format, ADDR output_msg_1
    INVOKE scanf, ADDR input_integer_format, ADDR I

    INVOKE printf, ADDR output_msg_format, ADDR output_msg_2
    INVOKE scanf, ADDR input_integer_format, ADDR R

    mov eax, I
    mov edx, R
    mul edx
    mov V, eax

    INVOKE printf, ADDR output_msg_format, ADDR output_msg_3
    INVOKE printf, ADDR output_integer_msg_format, V

    ret
main endp
end