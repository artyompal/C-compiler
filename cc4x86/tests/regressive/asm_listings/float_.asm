
.686
.model flat
.xmm

.data

___unnamed_float_0      dd      00h
public  ___unnamed_float_0
align 16
___unnamed_float_1      dd      080000000h, 00h, 00h, 00h
public  ___unnamed_float_1
___unnamed_float_2      dd      03a83126fh
public  ___unnamed_float_2
___unnamed_float_3      dd      040000000h
public  ___unnamed_float_3
___unnamed_double_4     dq      04008000000000000h
public  ___unnamed_double_4
___unnamed_double_5     dq      04014000000000000h
public  ___unnamed_double_5
___unnamed_double_6     dq      0bff0000000000000h
public  ___unnamed_double_6
___unnamed_double_7     dq      04018000000000000h
public  ___unnamed_double_7
___unnamed_double_8     dq      03fe54fdf3b645a1dh
public  ___unnamed_double_8
___unnamed_double_9     dq      04010000000000000h
public  ___unnamed_double_9
___unnamed_float_10     dd      03f800000h
public  ___unnamed_float_10
___unnamed_double_11    dq      04008000000000000h
public  ___unnamed_double_11
___unnamed_double_12    dq      04018000000000000h
public  ___unnamed_double_12
___unnamed_float_13     dd      03eaaaaabh
public  ___unnamed_float_13
___unnamed_double_14    dq      04000000000000000h
public  ___unnamed_double_14

.code

_fabs proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,dword ptr [ebp+8]
        ja      label0000
        movss   xmm0,dword ptr [ebp+8]
        movss   dword ptr [ebp-4],xmm0
        jmp     label0001
label0000:
        movss   xmm0,dword ptr [ebp+8]
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-4],xmm0
label0001:
        movss   xmm0,dword ptr [ebp-4]
        add     esp,4
        pop     ebp
        ret
_fabs endp

_eq proc
        push    ebp
        mov     ebp,esp
        movsd   xmm0,qword ptr [ebp+8]
        subsd   xmm0,qword ptr [ebp+16]
        cvtsd2ss        xmm0,xmm0
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        call    _fabs
        add     esp,4
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
        pop     ebp
        ret
_eq endp

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
        movss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [ebp-4],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_4]
        movsd   qword ptr [ebp-12],xmm0
        cvtss2sd        xmm0,dword ptr [ebp-4]
        addsd   xmm0,qword ptr [ebp-12]
        movsd   qword ptr [ebp-20],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_5]
        movsd   qword ptr [esp-8],xmm0
        sub     esp,8
        movsd   xmm0,qword ptr [ebp-20]
        movsd   qword ptr [esp-8],xmm0
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
        cvtss2sd        xmm0,dword ptr [ebp-4]
        subsd   xmm0,qword ptr [ebp-12]
        movsd   qword ptr [ebp-20],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_6]
        movsd   qword ptr [esp-8],xmm0
        sub     esp,8
        movsd   xmm0,qword ptr [ebp-20]
        movsd   qword ptr [esp-8],xmm0
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
        cvtss2sd        xmm0,dword ptr [ebp-4]
        mulsd   xmm0,qword ptr [ebp-12]
        movsd   qword ptr [ebp-20],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_7]
        movsd   qword ptr [esp-8],xmm0
        sub     esp,8
        movsd   xmm0,qword ptr [ebp-20]
        movsd   qword ptr [esp-8],xmm0
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
        cvtss2sd        xmm0,dword ptr [ebp-4]
        divsd   xmm0,qword ptr [ebp-12]
        movsd   qword ptr [ebp-20],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_8]
        movsd   qword ptr [esp-8],xmm0
        sub     esp,8
        movsd   xmm0,qword ptr [ebp-20]
        movsd   qword ptr [esp-8],xmm0
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
        movss   xmm0,dword ptr [ebp-4]
        addss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [ebp-4],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_9]
        movsd   qword ptr [esp-8],xmm0
        sub     esp,8
        cvtss2sd        xmm0,dword ptr [ebp-4]
        movsd   qword ptr [esp-8],xmm0
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
        movss   xmm0,dword ptr [ebp-4]
        subss   xmm0,dword ptr [___unnamed_float_10]
        movss   dword ptr [ebp-4],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_11]
        movsd   qword ptr [esp-8],xmm0
        sub     esp,8
        cvtss2sd        xmm0,dword ptr [ebp-4]
        movsd   qword ptr [esp-8],xmm0
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
        movss   xmm0,dword ptr [ebp-4]
        mulss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [ebp-4],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_12]
        movsd   qword ptr [esp-8],xmm0
        sub     esp,8
        cvtss2sd        xmm0,dword ptr [ebp-4]
        movsd   qword ptr [esp-8],xmm0
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
        movss   xmm0,dword ptr [ebp-4]
        mulss   xmm0,dword ptr [___unnamed_float_13]
        movss   dword ptr [ebp-4],xmm0
        movsd   xmm0,qword ptr [___unnamed_double_14]
        movsd   qword ptr [esp-8],xmm0
        sub     esp,8
        cvtss2sd        xmm0,dword ptr [ebp-4]
        movsd   qword ptr [esp-8],xmm0
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
