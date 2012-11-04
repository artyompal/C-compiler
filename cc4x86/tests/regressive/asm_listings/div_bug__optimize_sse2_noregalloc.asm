
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword21,2
        mov     dword ptr [ebp-12],1
        lea     dword8,[ebp-12]
        mov     dword11,4
        cdq     dword12,dword11
        idiv    dword11,dword21
        add     dword11,[dword8]
        lea     dword18,[dword11-3]
        set_retval      dword18
        destroy_stack_frame
        ret
_test endp

end
