
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword16,2
        imul    dword16,2
        cmp     dword16,4
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
