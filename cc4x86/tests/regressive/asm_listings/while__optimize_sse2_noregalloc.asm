
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword24,0
label0000:
        mov     dword4,dword24
        inc     dword24
        cmp     dword4,10
        jge     label0001
        jmp     label0000
label0001:
        cmp     dword24,11
        je      label0002
        mov     dword8,1
        set_retval      dword8
        destroy_stack_frame
        ret
label0002:
        mov     dword25,1
        mov     dword26,0
label0003:
        mov     dword15,dword25
        sal     dword15,1
        mov     dword25,dword15
        inc     dword26
        cmp     dword25,65536
        jl      label0003
        cmp     dword26,16
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
