
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword21,2
        mov     dword ptr [ebp-12],1
        mov     dword11,4
        cdq     dword12,dword11
        idiv    dword11,dword21
        add     dword11,[ebp-12]
        mov     dword18,dword11
        sub     dword18,3
        set_retval      dword18
        destroy_stack_frame
        ret
_test endp

end
