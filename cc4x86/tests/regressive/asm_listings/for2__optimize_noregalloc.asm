
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword23,0
        mov     dword22,0
label0001:
        cmp     dword22,8
        jge     label0002
        cmp     dword22,4
        jne     label0003
        jmp     label0002
label0003:
        inc     dword22
        inc     dword22
        inc     dword23
        jmp     label0001
label0002:
        cmp     dword22,4
        jne     label0004
        cmp     dword23,2
        jne     label0004
        mov     dword25,0
        jmp     label0005
label0004:
        mov     dword25,1
label0005:
        set_retval      dword25
        destroy_stack_frame
        ret
_test endp

end
