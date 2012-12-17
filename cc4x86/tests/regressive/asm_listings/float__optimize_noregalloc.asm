
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
        movss   sse1,dword ptr [___unnamed_float_3]
        movsd   sse2,qword ptr [___unnamed_double_4]
        cvtss2sd        sse3,sse1
        addsd   sse3,sse2
; start of inline function eq
        movsd   sse4,qword ptr [___unnamed_double_5]
; start of inline function fabs
        movsd   sse29,sse3
        subsd   sse29,sse4
        cvtsd2ss        sse30,sse29
        movss   sse34,dword ptr [___unnamed_float_0]
        comiss  sse34,sse30
        ja      label0008
        movss   sse117,sse30
        jmp     label0009
label0008:
        movss   sse36,sse30
        xorps   sse36,dword ptr [___unnamed_float4_1]
        movss   sse117,sse36
label0009:
; end of inline function fabs
        movss   sse32,dword ptr [___unnamed_float_2]
        comiss  sse117,sse32
        setb    byte2
        movzx   dword62,byte2
; end of inline function eq
        cmp     dword62,0
        jne     label0000
        mov     dword11,1
        set_retval      dword11
        destroy_stack_frame
        ret
label0000:
        cvtss2sd        sse5,sse1
        subsd   sse5,sse2
; start of inline function eq
        movsd   sse6,qword ptr [___unnamed_double_6]
; start of inline function fabs
        movsd   sse40,sse5
        subsd   sse40,sse6
        cvtsd2ss        sse41,sse40
        movss   sse116,sse41
        movss   sse45,dword ptr [___unnamed_float_0]
        comiss  sse45,sse116
        ja      label000c
        movss   sse117,sse116
        jmp     label000d
label000c:
        movss   sse47,sse116
        xorps   sse47,dword ptr [___unnamed_float4_1]
        movss   sse117,sse47
label000d:
; end of inline function fabs
        movss   sse43,dword ptr [___unnamed_float_2]
        comiss  sse117,sse43
        setb    byte5
        movzx   dword75,byte5
; end of inline function eq
        cmp     dword75,0
        jne     label0001
        mov     dword18,2
        set_retval      dword18
        destroy_stack_frame
        ret
label0001:
        cvtss2sd        sse7,sse1
        mulsd   sse7,sse2
; start of inline function eq
        movsd   sse8,qword ptr [___unnamed_double_7]
; start of inline function fabs
        movsd   sse51,sse7
        subsd   sse51,sse8
        cvtsd2ss        sse52,sse51
        movss   sse116,sse52
        movss   sse56,dword ptr [___unnamed_float_0]
        comiss  sse56,sse116
        ja      label0010
        movss   sse117,sse116
        jmp     label0011
label0010:
        movss   sse58,sse116
        xorps   sse58,dword ptr [___unnamed_float4_1]
        movss   sse117,sse58
label0011:
; end of inline function fabs
        movss   sse54,dword ptr [___unnamed_float_2]
        comiss  sse117,sse54
        setb    byte8
        movzx   dword88,byte8
; end of inline function eq
        cmp     dword88,0
        jne     label0002
        mov     dword25,3
        set_retval      dword25
        destroy_stack_frame
        ret
label0002:
        cvtss2sd        sse9,sse1
        divsd   sse9,sse2
; start of inline function eq
        movsd   sse10,qword ptr [___unnamed_double_8]
; start of inline function fabs
        movsd   sse62,sse9
        subsd   sse62,sse10
        cvtsd2ss        sse63,sse62
        movss   sse116,sse63
        movss   sse67,dword ptr [___unnamed_float_0]
        comiss  sse67,sse116
        ja      label0014
        movss   sse117,sse116
        jmp     label0015
label0014:
        movss   sse69,sse116
        xorps   sse69,dword ptr [___unnamed_float4_1]
        movss   sse117,sse69
label0015:
; end of inline function fabs
        movss   sse65,dword ptr [___unnamed_float_2]
        comiss  sse117,sse65
        setb    byte11
        movzx   dword101,byte11
; end of inline function eq
        cmp     dword101,0
        jne     label0003
        mov     dword32,4
        set_retval      dword32
        destroy_stack_frame
        ret
label0003:
        movss   sse11,dword ptr [___unnamed_float_3]
        movss   sse12,sse1
        addss   sse12,sse11
; start of inline function eq
        movsd   sse13,qword ptr [___unnamed_double_9]
        cvtss2sd        sse14,sse12
; start of inline function fabs
        movsd   sse72,sse14
        subsd   sse72,sse13
        cvtsd2ss        sse73,sse72
        movss   sse77,dword ptr [___unnamed_float_0]
        comiss  sse77,sse73
        ja      label0018
        movss   sse117,sse73
        jmp     label0019
label0018:
        movss   sse79,sse73
        xorps   sse79,dword ptr [___unnamed_float4_1]
        movss   sse117,sse79
label0019:
; end of inline function fabs
        movss   sse75,dword ptr [___unnamed_float_2]
        comiss  sse117,sse75
        setb    byte14
        movzx   dword114,byte14
; end of inline function eq
        cmp     dword114,0
        jne     label0004
        mov     dword38,5
        set_retval      dword38
        destroy_stack_frame
        ret
label0004:
        movss   sse15,dword ptr [___unnamed_float_10]
        movss   sse16,sse12
        subss   sse16,sse15
; start of inline function eq
        movsd   sse17,qword ptr [___unnamed_double_4]
        cvtss2sd        sse18,sse16
; start of inline function fabs
        movsd   sse82,sse18
        subsd   sse82,sse17
        cvtsd2ss        sse83,sse82
        movss   sse116,sse83
        movss   sse87,dword ptr [___unnamed_float_0]
        comiss  sse87,sse116
        ja      label001c
        movss   sse117,sse116
        jmp     label001d
label001c:
        movss   sse89,sse116
        xorps   sse89,dword ptr [___unnamed_float4_1]
        movss   sse117,sse89
label001d:
; end of inline function fabs
        movss   sse85,dword ptr [___unnamed_float_2]
        comiss  sse117,sse85
        setb    byte17
        movzx   dword127,byte17
; end of inline function eq
        cmp     dword127,0
        jne     label0005
        mov     dword44,6
        set_retval      dword44
        destroy_stack_frame
        ret
label0005:
        movss   sse19,dword ptr [___unnamed_float_3]
        movss   sse20,sse16
        mulss   sse20,sse19
; start of inline function eq
        movsd   sse21,qword ptr [___unnamed_double_7]
        cvtss2sd        sse22,sse20
; start of inline function fabs
        movsd   sse92,sse22
        subsd   sse92,sse21
        cvtsd2ss        sse93,sse92
        movss   sse97,dword ptr [___unnamed_float_0]
        comiss  sse97,sse93
        ja      label0020
        movss   sse117,sse93
        jmp     label0021
label0020:
        movss   sse99,sse93
        xorps   sse99,dword ptr [___unnamed_float4_1]
        movss   sse117,sse99
label0021:
; end of inline function fabs
        movss   sse95,dword ptr [___unnamed_float_2]
        comiss  sse117,sse95
        setb    byte20
        movzx   dword140,byte20
; end of inline function eq
        cmp     dword140,0
        jne     label0006
        mov     dword50,7
        set_retval      dword50
        destroy_stack_frame
        ret
label0006:
        movss   sse23,dword ptr [___unnamed_float_11]
        movss   sse24,sse20
        mulss   sse24,sse23
; start of inline function eq
        movsd   sse25,qword ptr [___unnamed_double_12]
        cvtss2sd        sse26,sse24
; start of inline function fabs
        movsd   sse102,sse26
        subsd   sse102,sse25
        cvtsd2ss        sse103,sse102
        movss   sse107,dword ptr [___unnamed_float_0]
        comiss  sse107,sse103
        ja      label0024
        movss   sse117,sse103
        jmp     label0025
label0024:
        movss   sse109,sse103
        xorps   sse109,dword ptr [___unnamed_float4_1]
        movss   sse117,sse109
label0025:
; end of inline function fabs
        movss   sse105,dword ptr [___unnamed_float_2]
        comiss  sse117,sse105
        setb    byte23
        movzx   dword153,byte23
; end of inline function eq
        cmp     dword153,0
        jne     label0007
        mov     dword56,8
        set_retval      dword56
        destroy_stack_frame
        ret
label0007:
        mov     dword57,0
        set_retval      dword57
        destroy_stack_frame
        ret
_test endp

end
