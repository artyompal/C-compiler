
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
___unnamed_float_13     dd      040400000h
public  ___unnamed_float_13
___unnamed_double_14    dq      04000000000000000h
public  ___unnamed_double_14

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,52
        movss   xmm7,dword ptr [___unnamed_float_3]
        movsd   xmm6,qword ptr [___unnamed_double_4]
        cvtss2sd        xmm0,xmm7
        addsd   xmm0,xmm6
; start of inline function eq
        movsd   xmm5,qword ptr [___unnamed_double_5]
; start of inline function fabs
        subsd   xmm0,xmm5
        cvtsd2ss        xmm0,xmm0
        movss   xmm5,xmm0
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,xmm5
        ja      label0008
        jmp     label0009
        movss   xmm5,dword ptr [ebp-40]
label0008:
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm0
label0009:
; end of inline function fabs
        movss   xmm0,xmm5
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0000
        mov     eax,1
        add     esp,52
        pop     ebp
        ret
label0000:
        cvtss2sd        xmm0,xmm7
        subsd   xmm0,xmm6
; start of inline function eq
        movsd   xmm5,qword ptr [___unnamed_double_6]
; start of inline function fabs
        subsd   xmm0,xmm5
        cvtsd2ss        xmm0,xmm0
        movss   xmm5,xmm0
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,xmm5
        ja      label000c
        jmp     label000d
        movss   xmm5,dword ptr [ebp-40]
label000c:
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm0
label000d:
; end of inline function fabs
        movss   xmm0,xmm5
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0001
        mov     eax,2
        add     esp,52
        pop     ebp
        ret
label0001:
        cvtss2sd        xmm0,xmm7
        mulsd   xmm0,xmm6
; start of inline function eq
        movsd   xmm5,qword ptr [___unnamed_double_7]
; start of inline function fabs
        subsd   xmm0,xmm5
        cvtsd2ss        xmm0,xmm0
        movss   xmm5,xmm0
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,xmm5
        ja      label0010
        jmp     label0011
        movss   xmm5,dword ptr [ebp-40]
label0010:
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm0
label0011:
; end of inline function fabs
        movss   xmm0,xmm5
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0002
        mov     eax,3
        add     esp,52
        pop     ebp
        ret
label0002:
        cvtss2sd        xmm0,xmm7
        divsd   xmm0,xmm6
; start of inline function eq
        movsd   xmm5,qword ptr [___unnamed_double_8]
; start of inline function fabs
        subsd   xmm0,xmm5
        cvtsd2ss        xmm0,xmm0
        movss   xmm5,xmm0
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,xmm5
        ja      label0014
        jmp     label0015
        movss   xmm5,dword ptr [ebp-40]
label0014:
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm0
label0015:
; end of inline function fabs
        movss   xmm0,xmm5
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0003
        mov     eax,4
        add     esp,52
        pop     ebp
        ret
label0003:
        movss   xmm0,xmm7
        addss   xmm0,dword ptr [___unnamed_float_3]
        movss   xmm7,xmm0
; start of inline function eq
        movsd   xmm5,qword ptr [___unnamed_double_9]
        cvtss2sd        xmm0,xmm7
; start of inline function fabs
        subsd   xmm0,xmm5
        cvtsd2ss        xmm0,xmm0
        movss   xmm5,xmm0
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,xmm5
        ja      label0018
        jmp     label0019
        movss   xmm5,dword ptr [ebp-40]
label0018:
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm0
label0019:
; end of inline function fabs
        movss   xmm0,xmm5
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0004
        mov     eax,5
        add     esp,52
        pop     ebp
        ret
label0004:
        movss   xmm0,xmm7
        subss   xmm0,dword ptr [___unnamed_float_10]
        movss   xmm7,xmm0
; start of inline function eq
        movsd   xmm5,qword ptr [___unnamed_double_11]
        cvtss2sd        xmm0,xmm7
; start of inline function fabs
        subsd   xmm0,xmm5
        cvtsd2ss        xmm0,xmm0
        movss   xmm5,xmm0
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,xmm5
        ja      label001c
        jmp     label001d
        movss   xmm5,dword ptr [ebp-40]
label001c:
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm0
label001d:
; end of inline function fabs
        movss   xmm0,xmm5
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0005
        mov     eax,6
        add     esp,52
        pop     ebp
        ret
label0005:
        movss   xmm0,xmm7
        mulss   xmm0,dword ptr [___unnamed_float_3]
        movss   xmm7,xmm0
; start of inline function eq
        movsd   xmm5,qword ptr [___unnamed_double_12]
        cvtss2sd        xmm0,xmm7
; start of inline function fabs
        subsd   xmm0,xmm5
        cvtsd2ss        xmm0,xmm0
        movss   xmm5,xmm0
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,xmm5
        ja      label0020
        jmp     label0021
        movss   xmm5,dword ptr [ebp-40]
label0020:
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm0
label0021:
; end of inline function fabs
        movss   xmm0,xmm5
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0006
        mov     eax,7
        add     esp,52
        pop     ebp
        ret
label0006:
        movss   xmm0,xmm7
        divss   xmm0,dword ptr [___unnamed_float_13]
        movss   xmm7,xmm0
; start of inline function eq
        movsd   xmm5,qword ptr [___unnamed_double_14]
        cvtss2sd        xmm0,xmm7
; start of inline function fabs
        subsd   xmm0,xmm5
        cvtsd2ss        xmm0,xmm0
        movss   xmm5,xmm0
        movss   xmm0,dword ptr [___unnamed_float_0]
        comiss  xmm0,xmm5
        ja      label0024
        jmp     label0025
        movss   xmm5,dword ptr [ebp-40]
label0024:
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm0
label0025:
; end of inline function fabs
        movss   xmm0,xmm5
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0007
        mov     eax,8
        add     esp,52
        pop     ebp
        ret
label0007:
        mov     eax,0
        add     esp,52
        pop     ebp
        ret
_test endp      

end
