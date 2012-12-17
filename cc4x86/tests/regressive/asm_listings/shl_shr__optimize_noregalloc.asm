
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword7,-16
        sar     dword7,4
        cmp     dword7,-1
        je      label0000
        mov     dword9,1
        set_retval      dword9
        destroy_stack_frame
        ret
label0000:
        mov     dword12,-16
        shr     dword12,4
        cmp     dword12,268435455
        je      label0001
        mov     dword14,2
        set_retval      dword14
        destroy_stack_frame
        ret
label0001:
        mov     dword21,1073741824
        sal     dword21,1
        cmp     dword21,0
        jl      label0002
        mov     dword23,3
        set_retval      dword23
        destroy_stack_frame
        ret
label0002:
        mov     dword26,1073741824
        shl     dword26,1
        cmp     dword26,-2147483648
        je      label0003
        mov     dword28,4
        set_retval      dword28
        destroy_stack_frame
        ret
label0003:
        mov     dword34,3
        inc     dword34
        mov     dword36,1
        shl     dword36,dword34
        cmp     dword36,16
        je      label0004
        mov     dword38,5
        set_retval      dword38
        destroy_stack_frame
        ret
label0004:
        mov     dword40,5
        inc     dword40
        mov     dword42,1
        sal     dword42,dword40
        cmp     dword42,64
        je      label0005
        mov     dword45,6
        set_retval      dword45
        destroy_stack_frame
        ret
label0005:
        mov     dword46,0
        set_retval      dword46
        destroy_stack_frame
        ret
_test endp

end
