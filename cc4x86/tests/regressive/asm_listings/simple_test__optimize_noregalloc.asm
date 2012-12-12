
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword13,2
        mov     dword14,2
        mov     dword7,dword13
        imul    dword7,dword14
        mov     dword15,dword7
        cmp     dword15,4
        jne     label0000
        mov     dword11,0
        set_retval      dword11
        destroy_stack_frame
        ret
label0000:
        mov     dword12,1
        set_retval      dword12
        destroy_stack_frame
        ret
_test endp

end
