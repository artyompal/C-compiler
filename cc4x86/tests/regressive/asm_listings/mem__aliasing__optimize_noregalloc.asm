
.686
.model flat
.xmm

.data

___unnamed_float_0      dd      03f800000h
public  ___unnamed_float_0

.code

_test proc
        create_stack_frame
        mov     dword8,dword9
        sub     dword8,1065353216
        set_retval      dword8
        destroy_stack_frame
        ret
_test endp

end
