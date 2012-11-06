
.686
.model flat
.xmm

.data

___unnamed_float_0      dd      040000000h
public  ___unnamed_float_0
___unnamed_float_1      dd      03f800000h
public  ___unnamed_float_1
___unnamed_float_2      dd      040400000h
public  ___unnamed_float_2
___unnamed_float_3      dd      040800000h
public  ___unnamed_float_3

.code

_test1 proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        movss   xmm0,dword ptr [ebp+8]
        movss   dword ptr [ebp-4],xmm0
        movss   xmm0,dword ptr [ebp-4]
        addss   xmm0,dword ptr [___unnamed_float_0]
        movss   dword ptr [ebp-4],xmm0
        movss   xmm0,dword ptr [ebp-4]
        movss   dword ptr [ebp+8],xmm0
        movss   xmm0,dword ptr [ebp+8]
        add     esp,4
        pop     ebp
        ret
_test1 endp

_test2 proc
        push    ebp
        mov     ebp,esp
        movss   xmm0,dword ptr [ebp+8]
        addss   xmm0,dword ptr [___unnamed_float_0]
        pop     ebp
        ret
_test2 endp

_test proc
        push    ebp
        mov     ebp,esp
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        call    _test1
        add     esp,4
        comiss  xmm0,dword ptr [___unnamed_float_2]
        je      label0000
        mov     eax,1
        pop     ebp
        ret
label0000:
        movss   xmm0,dword ptr [___unnamed_float_0]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        call    _test2
        add     esp,4
        comiss  xmm0,dword ptr [___unnamed_float_3]
        je      label0001
        mov     eax,2
        pop     ebp
        ret
label0001:
        mov     eax,0
        pop     ebp
        ret
_test endp

end
