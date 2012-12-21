
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
        create_stack_frame
        cvtss2sd        double3,dword ptr [___unnamed_float_3]
        addsd   double3,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        movsd   double29,double3
        subsd   double29,qword ptr [___unnamed_double_5]
        cvtsd2ss        float30,double29
        movss   float34,dword ptr [___unnamed_float_0]
        comiss  float34,float30
        ja      label0008
        movss   float117,float30
        jmp     label0009
label0008:
        movss   float36,float30
        xorps   float36,dword ptr [___unnamed_float4_1]
        movss   float117,float36
label0009:
; end of inline function fabs
        comiss  float117,dword ptr [___unnamed_float_2]
        setb    byte2
        movzx   dword62,byte2
; end of inline function eq
        cmp     dword62,0
        jne     label0000
        set_retval      1
        destroy_stack_frame
        ret
label0000:
        cvtss2sd        double5,dword ptr [___unnamed_float_3]
        subsd   double5,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        movsd   double40,double5
        subsd   double40,qword ptr [___unnamed_double_6]
        cvtsd2ss        float41,double40
        movss   float116,float41
        movss   float45,dword ptr [___unnamed_float_0]
        comiss  float45,float116
        ja      label000c
        movss   float117,float116
        jmp     label000d
label000c:
        movss   float47,float116
        xorps   float47,dword ptr [___unnamed_float4_1]
        movss   float117,float47
label000d:
; end of inline function fabs
        comiss  float117,dword ptr [___unnamed_float_2]
        setb    byte5
        movzx   dword75,byte5
; end of inline function eq
        cmp     dword75,0
        jne     label0001
        set_retval      2
        destroy_stack_frame
        ret
label0001:
        cvtss2sd        double7,dword ptr [___unnamed_float_3]
        mulsd   double7,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        movsd   double51,double7
        subsd   double51,qword ptr [___unnamed_double_7]
        cvtsd2ss        float52,double51
        movss   float116,float52
        movss   float56,dword ptr [___unnamed_float_0]
        comiss  float56,float116
        ja      label0010
        movss   float117,float116
        jmp     label0011
label0010:
        movss   float58,float116
        xorps   float58,dword ptr [___unnamed_float4_1]
        movss   float117,float58
label0011:
; end of inline function fabs
        comiss  float117,dword ptr [___unnamed_float_2]
        setb    byte8
        movzx   dword88,byte8
; end of inline function eq
        cmp     dword88,0
        jne     label0002
        set_retval      3
        destroy_stack_frame
        ret
label0002:
        cvtss2sd        double9,dword ptr [___unnamed_float_3]
        divsd   double9,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        movsd   double62,double9
        subsd   double62,qword ptr [___unnamed_double_8]
        cvtsd2ss        float63,double62
        movss   float116,float63
        movss   float67,dword ptr [___unnamed_float_0]
        comiss  float67,float116
        ja      label0014
        movss   float117,float116
        jmp     label0015
label0014:
        movss   float69,float116
        xorps   float69,dword ptr [___unnamed_float4_1]
        movss   float117,float69
label0015:
; end of inline function fabs
        comiss  float117,dword ptr [___unnamed_float_2]
        setb    byte11
        movzx   dword101,byte11
; end of inline function eq
        cmp     dword101,0
        jne     label0003
        set_retval      4
        destroy_stack_frame
        ret
label0003:
        movss   float12,dword ptr [___unnamed_float_3]
        addss   float12,dword ptr [___unnamed_float_3]
; start of inline function eq
        cvtss2sd        double14,float12
; start of inline function fabs
        movsd   double72,double14
        subsd   double72,qword ptr [___unnamed_double_9]
        cvtsd2ss        float73,double72
        movss   float77,dword ptr [___unnamed_float_0]
        comiss  float77,float73
        ja      label0018
        movss   float117,float73
        jmp     label0019
label0018:
        movss   float79,float73
        xorps   float79,dword ptr [___unnamed_float4_1]
        movss   float117,float79
label0019:
; end of inline function fabs
        comiss  float117,dword ptr [___unnamed_float_2]
        setb    byte14
        movzx   dword114,byte14
; end of inline function eq
        cmp     dword114,0
        jne     label0004
        set_retval      5
        destroy_stack_frame
        ret
label0004:
        movss   float16,float12
        subss   float16,dword ptr [___unnamed_float_10]
; start of inline function eq
        cvtss2sd        double18,float16
; start of inline function fabs
        movsd   double82,double18
        subsd   double82,qword ptr [___unnamed_double_4]
        cvtsd2ss        float83,double82
        movss   float116,float83
        movss   float87,dword ptr [___unnamed_float_0]
        comiss  float87,float116
        ja      label001c
        movss   float117,float116
        jmp     label001d
label001c:
        movss   float89,float116
        xorps   float89,dword ptr [___unnamed_float4_1]
        movss   float117,float89
label001d:
; end of inline function fabs
        comiss  float117,dword ptr [___unnamed_float_2]
        setb    byte17
        movzx   dword127,byte17
; end of inline function eq
        cmp     dword127,0
        jne     label0005
        set_retval      6
        destroy_stack_frame
        ret
label0005:
        movss   float20,float16
        mulss   float20,dword ptr [___unnamed_float_3]
; start of inline function eq
        cvtss2sd        double22,float20
; start of inline function fabs
        movsd   double92,double22
        subsd   double92,qword ptr [___unnamed_double_7]
        cvtsd2ss        float93,double92
        movss   float97,dword ptr [___unnamed_float_0]
        comiss  float97,float93
        ja      label0020
        movss   float117,float93
        jmp     label0021
label0020:
        movss   float99,float93
        xorps   float99,dword ptr [___unnamed_float4_1]
        movss   float117,float99
label0021:
; end of inline function fabs
        comiss  float117,dword ptr [___unnamed_float_2]
        setb    byte20
        movzx   dword140,byte20
; end of inline function eq
        cmp     dword140,0
        jne     label0006
        set_retval      7
        destroy_stack_frame
        ret
label0006:
        movss   float24,float20
        mulss   float24,dword ptr [___unnamed_float_11]
; start of inline function eq
        cvtss2sd        double26,float24
; start of inline function fabs
        movsd   double102,double26
        subsd   double102,qword ptr [___unnamed_double_12]
        cvtsd2ss        float103,double102
        movss   float107,dword ptr [___unnamed_float_0]
        comiss  float107,float103
        ja      label0024
        movss   float117,float103
        jmp     label0025
label0024:
        movss   float109,float103
        xorps   float109,dword ptr [___unnamed_float4_1]
        movss   float117,float109
label0025:
; end of inline function fabs
        comiss  float117,dword ptr [___unnamed_float_2]
        setb    byte23
        movzx   dword153,byte23
; end of inline function eq
        cmp     dword153,0
        jne     label0007
        set_retval      8
        destroy_stack_frame
        ret
label0007:
        set_retval      0
        destroy_stack_frame
        ret
_test endp

end
