
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword7,1
        dec     dword7
        set_retval      dword7
        destroy_stack_frame
        ret
_test endp

end
