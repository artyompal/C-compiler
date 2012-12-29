
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
        movss   xmm0,dword ptr [___unnamed_float_0]
        movss   dword ptr [ebp-4],xmm0
        mov     eax,[ebp-4]
        mov     [ebp-8],eax
        mov     eax,[ebp-8]
        sub     eax,1065353216
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
