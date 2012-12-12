
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
        movss   sse111,sse1
        movsd   sse2,qword ptr [___unnamed_double_4]
        movsd   sse112,sse2
        cvtss2sd        sse3,sse111
        addsd   sse3,sse112
        movsd   sse113,sse3
; start of inline function eq
        movsd   sse4,qword ptr [___unnamed_double_5]
        movsd   sse114,sse4
        movsd   sse27,sse113
        movsd   sse115,sse27
; start of inline function fabs
        movsd   sse29,sse115
        subsd   sse29,sse114
        cvtsd2ss        sse30,sse29
        movss   sse116,sse30
        movss   sse34,dword ptr [___unnamed_float_0]
        comiss  sse34,sse116
        ja      label0008
        movss   sse35,sse116
        movss   sse117,sse35
        jmp     label0009
label0008:
        movss   sse36,sse116
        xorps   sse36,dword ptr [___unnamed_float4_1]
        movss   sse117,sse36
label0009:
        movss   sse37,sse117
        movss   sse118,sse37
; end of inline function fabs
        movss   sse31,sse118
        movss   sse32,dword ptr [___unnamed_float_2]
        comiss  sse31,sse32
        setb    byte2
        movzx   dword62,byte2
        mov     dword162,dword62
; end of inline function eq
        mov     dword10,dword162
        cmp     dword10,0
        jne     label0000
        mov     dword11,1
        set_retval      dword11
        destroy_stack_frame
        ret
label0000:
        cvtss2sd        sse5,sse111
        subsd   sse5,sse112
        movsd   sse113,sse5
; start of inline function eq
        movsd   sse6,qword ptr [___unnamed_double_6]
        movsd   sse114,sse6
        movsd   sse38,sse113
        movsd   sse115,sse38
; start of inline function fabs
        movsd   sse40,sse115
        subsd   sse40,sse114
        cvtsd2ss        sse41,sse40
        movss   sse116,sse41
        movss   sse45,dword ptr [___unnamed_float_0]
        comiss  sse45,sse116
        ja      label000c
        movss   sse46,sse116
        movss   sse117,sse46
        jmp     label000d
label000c:
        movss   sse47,sse116
        xorps   sse47,dword ptr [___unnamed_float4_1]
        movss   sse117,sse47
label000d:
        movss   sse48,sse117
        movss   sse118,sse48
; end of inline function fabs
        movss   sse42,sse118
        movss   sse43,dword ptr [___unnamed_float_2]
        comiss  sse42,sse43
        setb    byte5
        movzx   dword75,byte5
        mov     dword162,dword75
; end of inline function eq
        mov     dword17,dword162
        cmp     dword17,0
        jne     label0001
        mov     dword18,2
        set_retval      dword18
        destroy_stack_frame
        ret
label0001:
        cvtss2sd        sse7,sse111
        mulsd   sse7,sse112
        movsd   sse113,sse7
; start of inline function eq
        movsd   sse8,qword ptr [___unnamed_double_7]
        movsd   sse114,sse8
        movsd   sse49,sse113
        movsd   sse115,sse49
; start of inline function fabs
        movsd   sse51,sse115
        subsd   sse51,sse114
        cvtsd2ss        sse52,sse51
        movss   sse116,sse52
        movss   sse56,dword ptr [___unnamed_float_0]
        comiss  sse56,sse116
        ja      label0010
        movss   sse57,sse116
        movss   sse117,sse57
        jmp     label0011
label0010:
        movss   sse58,sse116
        xorps   sse58,dword ptr [___unnamed_float4_1]
        movss   sse117,sse58
label0011:
        movss   sse59,sse117
        movss   sse118,sse59
; end of inline function fabs
        movss   sse53,sse118
        movss   sse54,dword ptr [___unnamed_float_2]
        comiss  sse53,sse54
        setb    byte8
        movzx   dword88,byte8
        mov     dword162,dword88
; end of inline function eq
        mov     dword24,dword162
        cmp     dword24,0
        jne     label0002
        mov     dword25,3
        set_retval      dword25
        destroy_stack_frame
        ret
label0002:
        cvtss2sd        sse9,sse111
        divsd   sse9,sse112
        movsd   sse113,sse9
; start of inline function eq
        movsd   sse10,qword ptr [___unnamed_double_8]
        movsd   sse114,sse10
        movsd   sse60,sse113
        movsd   sse115,sse60
; start of inline function fabs
        movsd   sse62,sse115
        subsd   sse62,sse114
        cvtsd2ss        sse63,sse62
        movss   sse116,sse63
        movss   sse67,dword ptr [___unnamed_float_0]
        comiss  sse67,sse116
        ja      label0014
        movss   sse68,sse116
        movss   sse117,sse68
        jmp     label0015
label0014:
        movss   sse69,sse116
        xorps   sse69,dword ptr [___unnamed_float4_1]
        movss   sse117,sse69
label0015:
        movss   sse70,sse117
        movss   sse118,sse70
; end of inline function fabs
        movss   sse64,sse118
        movss   sse65,dword ptr [___unnamed_float_2]
        comiss  sse64,sse65
        setb    byte11
        movzx   dword101,byte11
        mov     dword162,dword101
; end of inline function eq
        mov     dword31,dword162
        cmp     dword31,0
        jne     label0003
        mov     dword32,4
        set_retval      dword32
        destroy_stack_frame
        ret
label0003:
        movss   sse11,dword ptr [___unnamed_float_3]
        movss   sse12,sse111
        addss   sse12,sse11
        movss   sse111,sse12
; start of inline function eq
        movsd   sse13,qword ptr [___unnamed_double_9]
        movsd   sse114,sse13
        cvtss2sd        sse14,sse111
        movsd   sse115,sse14
; start of inline function fabs
        movsd   sse72,sse115
        subsd   sse72,sse114
        cvtsd2ss        sse73,sse72
        movss   sse116,sse73
        movss   sse77,dword ptr [___unnamed_float_0]
        comiss  sse77,sse116
        ja      label0018
        movss   sse78,sse116
        movss   sse117,sse78
        jmp     label0019
label0018:
        movss   sse79,sse116
        xorps   sse79,dword ptr [___unnamed_float4_1]
        movss   sse117,sse79
label0019:
        movss   sse80,sse117
        movss   sse118,sse80
; end of inline function fabs
        movss   sse74,sse118
        movss   sse75,dword ptr [___unnamed_float_2]
        comiss  sse74,sse75
        setb    byte14
        movzx   dword114,byte14
        mov     dword162,dword114
; end of inline function eq
        mov     dword37,dword162
        cmp     dword37,0
        jne     label0004
        mov     dword38,5
        set_retval      dword38
        destroy_stack_frame
        ret
label0004:
        movss   sse15,dword ptr [___unnamed_float_10]
        movss   sse16,sse111
        subss   sse16,sse15
        movss   sse111,sse16
; start of inline function eq
        movsd   sse17,qword ptr [___unnamed_double_4]
        movsd   sse114,sse17
        cvtss2sd        sse18,sse111
        movsd   sse115,sse18
; start of inline function fabs
        movsd   sse82,sse115
        subsd   sse82,sse114
        cvtsd2ss        sse83,sse82
        movss   sse116,sse83
        movss   sse87,dword ptr [___unnamed_float_0]
        comiss  sse87,sse116
        ja      label001c
        movss   sse88,sse116
        movss   sse117,sse88
        jmp     label001d
label001c:
        movss   sse89,sse116
        xorps   sse89,dword ptr [___unnamed_float4_1]
        movss   sse117,sse89
label001d:
        movss   sse90,sse117
        movss   sse118,sse90
; end of inline function fabs
        movss   sse84,sse118
        movss   sse85,dword ptr [___unnamed_float_2]
        comiss  sse84,sse85
        setb    byte17
        movzx   dword127,byte17
        mov     dword162,dword127
; end of inline function eq
        mov     dword43,dword162
        cmp     dword43,0
        jne     label0005
        mov     dword44,6
        set_retval      dword44
        destroy_stack_frame
        ret
label0005:
        movss   sse19,dword ptr [___unnamed_float_3]
        movss   sse20,sse111
        mulss   sse20,sse19
        movss   sse111,sse20
; start of inline function eq
        movsd   sse21,qword ptr [___unnamed_double_7]
        movsd   sse114,sse21
        cvtss2sd        sse22,sse111
        movsd   sse115,sse22
; start of inline function fabs
        movsd   sse92,sse115
        subsd   sse92,sse114
        cvtsd2ss        sse93,sse92
        movss   sse116,sse93
        movss   sse97,dword ptr [___unnamed_float_0]
        comiss  sse97,sse116
        ja      label0020
        movss   sse98,sse116
        movss   sse117,sse98
        jmp     label0021
label0020:
        movss   sse99,sse116
        xorps   sse99,dword ptr [___unnamed_float4_1]
        movss   sse117,sse99
label0021:
        movss   sse100,sse117
        movss   sse118,sse100
; end of inline function fabs
        movss   sse94,sse118
        movss   sse95,dword ptr [___unnamed_float_2]
        comiss  sse94,sse95
        setb    byte20
        movzx   dword140,byte20
        mov     dword162,dword140
; end of inline function eq
        mov     dword49,dword162
        cmp     dword49,0
        jne     label0006
        mov     dword50,7
        set_retval      dword50
        destroy_stack_frame
        ret
label0006:
        movss   sse23,dword ptr [___unnamed_float_11]
        movss   sse24,sse111
        mulss   sse24,sse23
        movss   sse111,sse24
; start of inline function eq
        movsd   sse25,qword ptr [___unnamed_double_12]
        movsd   sse114,sse25
        cvtss2sd        sse26,sse111
        movsd   sse115,sse26
; start of inline function fabs
        movsd   sse102,sse115
        subsd   sse102,sse114
        cvtsd2ss        sse103,sse102
        movss   sse116,sse103
        movss   sse107,dword ptr [___unnamed_float_0]
        comiss  sse107,sse116
        ja      label0024
        movss   sse108,sse116
        movss   sse117,sse108
        jmp     label0025
label0024:
        movss   sse109,sse116
        xorps   sse109,dword ptr [___unnamed_float4_1]
        movss   sse117,sse109
label0025:
        movss   sse110,sse117
        movss   sse118,sse110
; end of inline function fabs
        movss   sse104,sse118
        movss   sse105,dword ptr [___unnamed_float_2]
        comiss  sse104,sse105
        setb    byte23
        movzx   dword153,byte23
        mov     dword162,dword153
; end of inline function eq
        mov     dword55,dword162
        cmp     dword55,0
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
