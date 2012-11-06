
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword12,0
label0000:
        cmp     dword12,8
        jge     label0002
        cmp     dword12,4
        jne     label0003
        jmp     label0002
label0003:
        inc     dword12
        jmp     label0000
label0002:
        cmp     dword12,4
        setne   byte1
        movzx   dword10,byte1
        set_retval      dword10
        destroy_stack_frame
        ret
_test endp

end
