
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword28,0
label0000:
        cmp     dword28,10
        jge     label0001
        cmp     dword28,5
        jne     label0002
        jmp     label0001
label0002:
        inc     dword28
        jmp     label0000
label0001:
        cmp     dword28,5
        je      label0003
        mov     dword10,1
        set_retval      dword10
        destroy_stack_frame
        ret
label0003:
        mov     dword29,0
        mov     dword30,0
label0004:
        cmp     dword29,50
        jne     label0007
        mov     dword19,dword29
        add     dword19,50
        mov     dword29,dword19
        jmp     label0005
label0007:
        inc     dword29
        inc     dword30
label0005:
        cmp     dword29,100
        jl      label0004
        cmp     dword30,50
        je      label0008
        mov     dword26,1
        set_retval      dword26
        destroy_stack_frame
        ret
label0008:
        mov     dword27,0
        set_retval      dword27
        destroy_stack_frame
        ret
_test endp

end
