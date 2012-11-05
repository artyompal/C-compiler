
.686
.model flat
.xmm

.data

___unnamed_float_0      dd      040000000h
public  ___unnamed_float_0
___unnamed_float_1      dd      040400000h
public  ___unnamed_float_1
___unnamed_float_2      dd      040800000h
public  ___unnamed_float_2

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
; start of inline function test1
        fld1
        fstp    dword ptr [ebp-4]
        fld     dword ptr [ebp-4]
        fstp    dword ptr [ebp-8]
        fld     dword ptr [___unnamed_float_0]
        fld     dword ptr [ebp-8]
        faddp
        fstp    dword ptr [ebp-8]
        fld     dword ptr [ebp-8]
        fstp    dword ptr [ebp-4]
        fld     dword ptr [ebp-4]
        fstp    dword ptr [ebp-12]
; end of inline function test1
        fld     dword ptr [ebp-12]
        fld     dword ptr [___unnamed_float_1]
        fucomip st,st(1)
        fstp    st
        je      label0000
        mov     eax,1
        add     esp,20
        pop     ebp
        ret
label0000:
; start of inline function test2
        fld     dword ptr [___unnamed_float_0]
        fstp    dword ptr [ebp-16]
        fld     dword ptr [___unnamed_float_0]
        fadd    dword ptr [ebp-16]
        fstp    dword ptr [ebp-20]
; end of inline function test2
        fld     dword ptr [ebp-20]
        fld     dword ptr [___unnamed_float_2]
        fucomip st,st(1)
        fstp    st
        je      label0001
        mov     eax,2
        add     esp,20
        pop     ebp
        ret
label0001:
        mov     eax,0
        add     esp,20
        pop     ebp
        ret
_test endp

end
