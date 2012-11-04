
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword8,0
        jmp     label0002
label0000:
        jmp     label0001
label0001:
        cmp     dword8,1
        setne   byte1
        movzx   dword5,byte1
        set_retval      dword5
        destroy_stack_frame
        ret
label0002:
        inc     dword8
        jmp     label0000
_test endp

end
