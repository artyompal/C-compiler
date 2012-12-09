
.686
.model flat
.xmm

.data

___unnamed_float_0      dd      00h
public  ___unnamed_float_0
align 16
___unnamed_float4_1     dd      080000000h, 00h, 00h, 00h
public  ___unnamed_float4_1
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
___unnamed_float_11     dd      03eaaaaabh
public  ___unnamed_float_11
___unnamed_double_12    dq      04000000000000000h
public  ___unnamed_double_12

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,56
        cvtss2sd        xmm0,dword ptr [___unnamed_float_3]
        addsd   xmm0,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        subsd   xmm0,qword ptr [___unnamed_double_5]
        cvtsd2ss        xmm0,xmm0
        movss   xmm1,dword ptr [___unnamed_float_0]
        comiss  xmm1,xmm0
        ja      label0008
        jmp     label0009
label0008:
        xorps   xmm0,dword ptr [___unnamed_float4_1]
label0009:
; end of inline function fabs
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0000
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        cvtss2sd        xmm0,dword ptr [___unnamed_float_3]
        subsd   xmm0,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        subsd   xmm0,qword ptr [___unnamed_double_6]
        cvtsd2ss        xmm0,xmm0
        movss   xmm1,dword ptr [___unnamed_float_0]
        comiss  xmm1,xmm0
        ja      label000c
        jmp     label000d
label000c:
        xorps   xmm0,dword ptr [___unnamed_float4_1]
label000d:
; end of inline function fabs
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0001
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
label0001:
        cvtss2sd        xmm0,dword ptr [___unnamed_float_3]
        mulsd   xmm0,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        subsd   xmm0,qword ptr [___unnamed_double_7]
        cvtsd2ss        xmm0,xmm0
        movss   xmm1,dword ptr [___unnamed_float_0]
        comiss  xmm1,xmm0
        ja      label0010
        jmp     label0011
label0010:
        xorps   xmm0,dword ptr [___unnamed_float4_1]
label0011:
; end of inline function fabs
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0002
        mov     eax,3
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        cvtss2sd        xmm0,dword ptr [___unnamed_float_3]
        divsd   xmm0,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        subsd   xmm0,qword ptr [___unnamed_double_8]
        cvtsd2ss        xmm0,xmm0
        movss   xmm1,dword ptr [___unnamed_float_0]
        comiss  xmm1,xmm0
        ja      label0014
        jmp     label0015
label0014:
        xorps   xmm0,dword ptr [___unnamed_float4_1]
label0015:
; end of inline function fabs
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0003
        mov     eax,4
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        movss   xmm0,dword ptr [___unnamed_float_3]
        addss   xmm0,dword ptr [___unnamed_float_3]
; start of inline function eq
        cvtss2sd        xmm1,xmm0
        movss   dword ptr [ebp-56],xmm0
        movsd   xmm0,xmm1
; start of inline function fabs
        subsd   xmm0,qword ptr [___unnamed_double_9]
        cvtsd2ss        xmm0,xmm0
        movss   xmm1,dword ptr [___unnamed_float_0]
        comiss  xmm1,xmm0
        ja      label0018
        jmp     label0019
label0018:
        xorps   xmm0,dword ptr [___unnamed_float4_1]
label0019:
; end of inline function fabs
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0004
        mov     eax,5
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        movss   xmm0,dword ptr [ebp-56]
        subss   xmm0,dword ptr [___unnamed_float_10]
; start of inline function eq
        cvtss2sd        xmm1,xmm0
        movss   dword ptr [ebp-56],xmm0
        movsd   xmm0,xmm1
; start of inline function fabs
        subsd   xmm0,qword ptr [___unnamed_double_4]
        cvtsd2ss        xmm0,xmm0
        movss   xmm1,dword ptr [___unnamed_float_0]
        comiss  xmm1,xmm0
        ja      label001c
        jmp     label001d
label001c:
        xorps   xmm0,dword ptr [___unnamed_float4_1]
label001d:
; end of inline function fabs
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0005
        mov     eax,6
        mov     esp,ebp
        pop     ebp
        ret
label0005:
        movss   xmm0,dword ptr [ebp-56]
        mulss   xmm0,dword ptr [___unnamed_float_3]
; start of inline function eq
        cvtss2sd        xmm1,xmm0
        movss   dword ptr [ebp-56],xmm0
        movsd   xmm0,xmm1
; start of inline function fabs
        subsd   xmm0,qword ptr [___unnamed_double_7]
        cvtsd2ss        xmm0,xmm0
        movss   xmm1,dword ptr [___unnamed_float_0]
        comiss  xmm1,xmm0
        ja      label0020
        jmp     label0021
label0020:
        xorps   xmm0,dword ptr [___unnamed_float4_1]
label0021:
; end of inline function fabs
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0006
        mov     eax,7
        mov     esp,ebp
        pop     ebp
        ret
label0006:
        movss   xmm0,dword ptr [ebp-56]
        mulss   xmm0,dword ptr [___unnamed_float_11]
; start of inline function eq
        cvtss2sd        xmm0,xmm0
; start of inline function fabs
        subsd   xmm0,qword ptr [___unnamed_double_12]
        cvtsd2ss        xmm0,xmm0
        movss   xmm1,dword ptr [___unnamed_float_0]
        comiss  xmm1,xmm0
        ja      label0024
        jmp     label0025
label0024:
        xorps   xmm0,dword ptr [___unnamed_float4_1]
label0025:
; end of inline function fabs
        comiss  xmm0,dword ptr [___unnamed_float_2]
        setb    al
        movzx   eax,al
; end of inline function eq
        cmp     eax,0
        jne     label0007
        mov     eax,8
        mov     esp,ebp
        pop     ebp
        ret
label0007:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
