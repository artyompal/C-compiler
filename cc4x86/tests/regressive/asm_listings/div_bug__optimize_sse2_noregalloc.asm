
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword21,2
        mov     dword ptr [ebp-12],1
        lea     dword8,[ebp-12]
        mov     dword22,dword8
        mov     dword11,4
        cdq     dword12,dword11
        idiv    dword11,dword21
        mov     dword14,dword22
        add     dword11,[dword14]
        mov     dword23,dword11
        lea     dword18,[dword23-3]
        set_retval      dword18
        destroy_stack_frame
        ret
_test endp      

end
