
.686
.model flat
.xmm

.data

___unnamed_float_0      dd      03f800000h
public  ___unnamed_float_0

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,ecx
        sub     eax,1065353216
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
