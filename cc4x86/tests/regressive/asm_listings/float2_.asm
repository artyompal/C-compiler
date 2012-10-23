
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

_test1 proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        fld     dword ptr [ebp+8]
        fstp    dword ptr [ebp-4]
        fld     dword ptr [___unnamed_float_0]
        fld     dword ptr [ebp-4]
        faddp
        fstp    dword ptr [ebp-4]
        fld     dword ptr [ebp-4]
        fstp    dword ptr [ebp+8]
        fld     dword ptr [ebp+8]
        add     esp,4
        pop     ebp
        ret
_test1 endp     

_test2 proc
        push    ebp
        mov     ebp,esp
        fld     dword ptr [___unnamed_float_0]
        fadd    dword ptr [ebp+8]
        pop     ebp
        ret
_test2 endp     

_test proc
        push    ebp
        mov     ebp,esp
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        call    _test1
        add     esp,4
        fld     dword ptr [___unnamed_float_1]
        fucomip st,st(1)
        fstp    st
        je      label0000
        mov     eax,1
        pop     ebp
        ret
label0000:
        fld     dword ptr [___unnamed_float_0]
        fstp    dword ptr [esp-4]
        sub     esp,4
        call    _test2
        add     esp,4
        fld     dword ptr [___unnamed_float_2]
        fucomip st,st(1)
        fstp    st
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
