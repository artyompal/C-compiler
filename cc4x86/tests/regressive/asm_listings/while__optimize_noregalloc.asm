
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword23,0
label0000:
        mov     dword4,dword23
        inc     dword23
        cmp     dword4,10
        jge     label0001
        jmp     label0000
label0001:
        cmp     dword23,11
        je      label0002
        mov     dword8,1
        set_retval      dword8
        destroy_stack_frame
        ret
label0002:
        mov     dword24,1
        mov     dword25,0
label0003:
        mov     dword15,dword24
        sal     dword15,1
        mov     dword24,dword15
        inc     dword25
        cmp     dword24,65536
        jl      label0003
        cmp     dword25,16
        je      label0006
        mov     dword21,2
        set_retval      dword21
        destroy_stack_frame
        ret
label0006:
        mov     dword22,0
        set_retval      dword22
        destroy_stack_frame
        ret
_test endp

end
