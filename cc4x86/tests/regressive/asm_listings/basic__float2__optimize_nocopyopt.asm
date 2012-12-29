
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

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
; start of inline function test1
        movss   xmm0,dword ptr [___unnamed_float_1]
        addss   xmm0,dword ptr [___unnamed_float_0]
; end of inline function test1
        comiss  xmm0,dword ptr [___unnamed_float_2]
        je      label0000
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0000:
; start of inline function test2
        movss   xmm0,dword ptr [___unnamed_float_0]
        addss   xmm0,dword ptr [___unnamed_float_0]
; end of inline function test2
        comiss  xmm0,dword ptr [___unnamed_float_3]
        je      label0001
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
label0001:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
