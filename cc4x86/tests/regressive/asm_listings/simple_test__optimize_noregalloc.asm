
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword7,2
        imul    dword7,2
        cmp     dword7,4
        jne     label0000
        set_retval      0
        destroy_stack_frame
        ret
label0000:
        set_retval      1
        destroy_stack_frame
        ret
_test endp

end
