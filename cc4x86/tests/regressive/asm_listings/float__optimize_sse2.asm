
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
        cvtss2sd        xmm5,xmm7
        addsd   xmm5,xmm6
; start of inline function eq
        movsd   xmm4,qword ptr [___unnamed_double_5]
; start of inline function fabs
        subsd   xmm5,xmm4
        cvtsd2ss        xmm5,xmm5
        movss   xmm4,dword ptr [___unnamed_float_0]
        comiss  xmm4,xmm5
        ja      label0008
        jmp     label0009
        movss   xmm5,dword ptr [ebp-40]
label0008:
        movss   xmm4,xmm5
        xorps   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm4
label0009:
; end of inline function fabs
        movss   xmm4,xmm5
        comiss  xmm4,dword ptr [___unnamed_float_2]
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
        cvtss2sd        xmm4,xmm7
        subsd   xmm4,xmm6
        movsd   xmm5,xmm4
; start of inline function eq
        movsd   xmm4,qword ptr [___unnamed_double_6]
; start of inline function fabs
        subsd   xmm5,xmm4
        cvtsd2ss        xmm4,xmm5
        movss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_0]
        comiss  xmm4,xmm5
        ja      label000c
        jmp     label000d
        movss   xmm5,dword ptr [ebp-40]
label000c:
        movss   xmm4,xmm5
        xorps   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm4
label000d:
; end of inline function fabs
        movss   xmm4,xmm5
        comiss  xmm4,dword ptr [___unnamed_float_2]
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
        cvtss2sd        xmm4,xmm7
        mulsd   xmm4,xmm6
        movsd   xmm5,xmm4
; start of inline function eq
        movsd   xmm4,qword ptr [___unnamed_double_7]
; start of inline function fabs
        subsd   xmm5,xmm4
        cvtsd2ss        xmm4,xmm5
        movss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_0]
        comiss  xmm4,xmm5
        ja      label0010
        jmp     label0011
        movss   xmm5,dword ptr [ebp-40]
label0010:
        movss   xmm4,xmm5
        xorps   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm4
label0011:
; end of inline function fabs
        movss   xmm4,xmm5
        comiss  xmm4,dword ptr [___unnamed_float_2]
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
        cvtss2sd        xmm4,xmm7
        divsd   xmm4,xmm6
        movsd   xmm5,xmm4
; start of inline function eq
        movsd   xmm4,qword ptr [___unnamed_double_8]
; start of inline function fabs
        subsd   xmm5,xmm4
        cvtsd2ss        xmm4,xmm5
        movss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_0]
        comiss  xmm4,xmm5
        ja      label0014
        jmp     label0015
        movss   xmm5,dword ptr [ebp-40]
label0014:
        movss   xmm4,xmm5
        xorps   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm4
label0015:
; end of inline function fabs
        movss   xmm4,xmm5
        comiss  xmm4,dword ptr [___unnamed_float_2]
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
        addss   xmm7,dword ptr [___unnamed_float_3]
; start of inline function eq
        movsd   xmm4,qword ptr [___unnamed_double_9]
        cvtss2sd        xmm5,xmm7
; start of inline function fabs
        subsd   xmm5,xmm4
        cvtsd2ss        xmm4,xmm5
        movss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_0]
        comiss  xmm4,xmm5
        ja      label0018
        jmp     label0019
        movss   xmm5,dword ptr [ebp-40]
label0018:
        movss   xmm4,xmm5
        xorps   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm4
label0019:
; end of inline function fabs
        movss   xmm4,xmm5
        comiss  xmm4,dword ptr [___unnamed_float_2]
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
        subss   xmm7,dword ptr [___unnamed_float_10]
; start of inline function eq
        movsd   xmm4,qword ptr [___unnamed_double_11]
        cvtss2sd        xmm5,xmm7
; start of inline function fabs
        subsd   xmm5,xmm4
        cvtsd2ss        xmm4,xmm5
        movss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_0]
        comiss  xmm4,xmm5
        ja      label001c
        jmp     label001d
        movss   xmm5,dword ptr [ebp-40]
label001c:
        movss   xmm4,xmm5
        xorps   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm4
label001d:
; end of inline function fabs
        movss   xmm4,xmm5
        comiss  xmm4,dword ptr [___unnamed_float_2]
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
        mulss   xmm7,dword ptr [___unnamed_float_3]
; start of inline function eq
        movsd   xmm4,qword ptr [___unnamed_double_12]
        cvtss2sd        xmm5,xmm7
; start of inline function fabs
        subsd   xmm5,xmm4
        cvtsd2ss        xmm4,xmm5
        movss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_0]
        comiss  xmm4,xmm5
        ja      label0020
        jmp     label0021
        movss   xmm5,dword ptr [ebp-40]
label0020:
        movss   xmm4,xmm5
        xorps   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm4
label0021:
; end of inline function fabs
        movss   xmm4,xmm5
        comiss  xmm4,dword ptr [___unnamed_float_2]
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
        divss   xmm7,dword ptr [___unnamed_float_13]
; start of inline function eq
        movsd   xmm4,qword ptr [___unnamed_double_14]
        cvtss2sd        xmm5,xmm7
; start of inline function fabs
        subsd   xmm5,xmm4
        cvtsd2ss        xmm4,xmm5
        movss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_0]
        comiss  xmm4,xmm5
        ja      label0024
        jmp     label0025
        movss   xmm5,dword ptr [ebp-40]
label0024:
        movss   xmm4,xmm5
        xorps   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm5,xmm4
label0025:
; end of inline function fabs
        movss   xmm4,xmm5
        comiss  xmm4,dword ptr [___unnamed_float_2]
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
