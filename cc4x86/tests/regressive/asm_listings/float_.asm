
.686
.model flat
.xmm

.data

___unnamed_float_0      dd      03a83126fh
public  ___unnamed_float_0
___unnamed_float_1      dd      040000000h
public  ___unnamed_float_1
___unnamed_double_2     dq      04008000000000000h
public  ___unnamed_double_2
___unnamed_double_3     dq      04014000000000000h
public  ___unnamed_double_3
___unnamed_double_4     dq      0bff0000000000000h
public  ___unnamed_double_4
___unnamed_double_5     dq      04018000000000000h
public  ___unnamed_double_5
___unnamed_double_6     dq      03fe54fdf3b645a1dh
public  ___unnamed_double_6
___unnamed_double_7     dq      04010000000000000h
public  ___unnamed_double_7
___unnamed_double_8     dq      04008000000000000h
public  ___unnamed_double_8
___unnamed_double_9     dq      04018000000000000h
public  ___unnamed_double_9
___unnamed_float_10     dd      040400000h
public  ___unnamed_float_10
___unnamed_double_11    dq      04000000000000000h
public  ___unnamed_double_11

.code

_fabs proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        fldz
        fld     dword ptr [ebp+8]
        fucomip st,st(1)
        fstp    st
        jb      label0000
        fld     dword ptr [ebp+8]
        fstp    dword ptr [ebp-4]
        jmp     label0001
label0000:
        fld     dword ptr [ebp+8]
        fldz
        fsubrp
        fstp    dword ptr [ebp-4]
label0001:
        fld     dword ptr [ebp-4]
        add     esp,4
        pop     ebp
        ret
_fabs endp      

_eq proc
        push    ebp
        mov     ebp,esp
        fld     qword ptr [ebp+8]
        fsub    qword ptr [ebp+16]
        fstp    dword ptr [esp-4]
        sub     esp,4
        call    _fabs
        add     esp,4
        fld     dword ptr [___unnamed_float_0]
        fucomip st,st(1)
        fstp    st
        seta    al
        movzx   eax,al
        pop     ebp
        ret
_eq endp        

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
        fld     dword ptr [___unnamed_float_1]
        fstp    dword ptr [ebp-4]
        fld     qword ptr [___unnamed_double_2]
        fstp    qword ptr [ebp-12]
        fld     dword ptr [ebp-4]
        fadd    qword ptr [ebp-12]
        fstp    qword ptr [ebp-20]
        fld     qword ptr [___unnamed_double_3]
        fstp    qword ptr [esp-8]
        sub     esp,8
        fld     qword ptr [ebp-20]
        fstp    qword ptr [esp-8]
        sub     esp,8
        call    _eq
        add     esp,16
        cmp     eax,0
        jne     label0000
        mov     eax,1
        add     esp,20
        pop     ebp
        ret
label0000:
        fld     dword ptr [ebp-4]
        fsub    qword ptr [ebp-12]
        fstp    qword ptr [ebp-20]
        fld     qword ptr [___unnamed_double_4]
        fstp    qword ptr [esp-8]
        sub     esp,8
        fld     qword ptr [ebp-20]
        fstp    qword ptr [esp-8]
        sub     esp,8
        call    _eq
        add     esp,16
        cmp     eax,0
        jne     label0001
        mov     eax,2
        add     esp,20
        pop     ebp
        ret
label0001:
        fld     dword ptr [ebp-4]
        fmul    qword ptr [ebp-12]
        fstp    qword ptr [ebp-20]
        fld     qword ptr [___unnamed_double_5]
        fstp    qword ptr [esp-8]
        sub     esp,8
        fld     qword ptr [ebp-20]
        fstp    qword ptr [esp-8]
        sub     esp,8
        call    _eq
        add     esp,16
        cmp     eax,0
        jne     label0002
        mov     eax,3
        add     esp,20
        pop     ebp
        ret
label0002:
        fld     dword ptr [ebp-4]
        fdiv    qword ptr [ebp-12]
        fstp    qword ptr [ebp-20]
        fld     qword ptr [___unnamed_double_6]
        fstp    qword ptr [esp-8]
        sub     esp,8
        fld     qword ptr [ebp-20]
        fstp    qword ptr [esp-8]
        sub     esp,8
        call    _eq
        add     esp,16
        cmp     eax,0
        jne     label0003
        mov     eax,4
        add     esp,20
        pop     ebp
        ret
label0003:
        fld     dword ptr [___unnamed_float_1]
        fld     dword ptr [ebp-4]
        faddp
        fstp    dword ptr [ebp-4]
        fld     qword ptr [___unnamed_double_7]
        fstp    qword ptr [esp-8]
        sub     esp,8
        fld     dword ptr [ebp-4]
        fstp    qword ptr [esp-8]
        sub     esp,8
        call    _eq
        add     esp,16
        cmp     eax,0
        jne     label0004
        mov     eax,5
        add     esp,20
        pop     ebp
        ret
label0004:
        fld1
        fld     dword ptr [ebp-4]
        fsubrp
        fstp    dword ptr [ebp-4]
        fld     qword ptr [___unnamed_double_8]
        fstp    qword ptr [esp-8]
        sub     esp,8
        fld     dword ptr [ebp-4]
        fstp    qword ptr [esp-8]
        sub     esp,8
        call    _eq
        add     esp,16
        cmp     eax,0
        jne     label0005
        mov     eax,6
        add     esp,20
        pop     ebp
        ret
label0005:
        fld     dword ptr [___unnamed_float_1]
        fld     dword ptr [ebp-4]
        fmulp
        fstp    dword ptr [ebp-4]
        fld     qword ptr [___unnamed_double_9]
        fstp    qword ptr [esp-8]
        sub     esp,8
        fld     dword ptr [ebp-4]
        fstp    qword ptr [esp-8]
        sub     esp,8
        call    _eq
        add     esp,16
        cmp     eax,0
        jne     label0006
        mov     eax,7
        add     esp,20
        pop     ebp
        ret
label0006:
        fld     dword ptr [___unnamed_float_10]
        fld     dword ptr [ebp-4]
        fdivrp
        fstp    dword ptr [ebp-4]
        fld     qword ptr [___unnamed_double_11]
        fstp    qword ptr [esp-8]
        sub     esp,8
        fld     dword ptr [ebp-4]
        fstp    qword ptr [esp-8]
        sub     esp,8
        call    _eq
        add     esp,16
        cmp     eax,0
        jne     label0007
        mov     eax,8
        add     esp,20
        pop     ebp
        ret
label0007:
        mov     eax,0
        add     esp,20
        pop     ebp
        ret
_test endp      

end
