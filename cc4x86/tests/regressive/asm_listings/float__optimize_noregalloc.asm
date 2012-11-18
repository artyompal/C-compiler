
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
        create_stack_frame
        cvtss2sd        sse3,dword ptr [___unnamed_float_3]
        addsd   sse3,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        movsd   sse29,sse3
        subsd   sse29,qword ptr [___unnamed_double_5]
        cvtsd2ss        sse30,sse29
        movss   sse34,dword ptr [___unnamed_float_0]
        comiss  sse34,sse30
        ja      label0008
        movss   sse118,sse30
        jmp     label0009
label0008:
        movss   sse36,sse30
        xorps   sse36,dword ptr [___unnamed_float_1]
        movss   sse118,sse36
label0009:
; end of inline function fabs
        comiss  sse118,dword ptr [___unnamed_float_2]
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
        cvtss2sd        sse5,dword ptr [___unnamed_float_3]
        subsd   sse5,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        movsd   sse40,sse5
        subsd   sse40,qword ptr [___unnamed_double_6]
        cvtsd2ss        sse41,sse40
        movss   sse117,sse41
        movss   sse45,dword ptr [___unnamed_float_0]
        comiss  sse45,sse117
        ja      label000c
        movss   sse118,sse117
        jmp     label000d
label000c:
        movss   sse47,sse117
        xorps   sse47,dword ptr [___unnamed_float_1]
        movss   sse118,sse47
label000d:
; end of inline function fabs
        comiss  sse118,dword ptr [___unnamed_float_2]
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
        cvtss2sd        sse7,dword ptr [___unnamed_float_3]
        mulsd   sse7,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        movsd   sse51,sse7
        subsd   sse51,qword ptr [___unnamed_double_7]
        cvtsd2ss        sse52,sse51
        movss   sse117,sse52
        movss   sse56,dword ptr [___unnamed_float_0]
        comiss  sse56,sse117
        ja      label0010
        movss   sse118,sse117
        jmp     label0011
label0010:
        movss   sse58,sse117
        xorps   sse58,dword ptr [___unnamed_float_1]
        movss   sse118,sse58
label0011:
; end of inline function fabs
        comiss  sse118,dword ptr [___unnamed_float_2]
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
        cvtss2sd        sse9,dword ptr [___unnamed_float_3]
        divsd   sse9,qword ptr [___unnamed_double_4]
; start of inline function eq
; start of inline function fabs
        movsd   sse62,sse9
        subsd   sse62,qword ptr [___unnamed_double_8]
        cvtsd2ss        sse63,sse62
        movss   sse117,sse63
        movss   sse67,dword ptr [___unnamed_float_0]
        comiss  sse67,sse117
        ja      label0014
        movss   sse118,sse117
        jmp     label0015
label0014:
        movss   sse69,sse117
        xorps   sse69,dword ptr [___unnamed_float_1]
        movss   sse118,sse69
label0015:
; end of inline function fabs
        comiss  sse118,dword ptr [___unnamed_float_2]
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
        movss   sse12,dword ptr [___unnamed_float_3]
        addss   sse12,dword ptr [___unnamed_float_3]
; start of inline function eq
        cvtss2sd        sse14,sse12
; start of inline function fabs
        movsd   sse72,sse14
        subsd   sse72,qword ptr [___unnamed_double_9]
        cvtsd2ss        sse73,sse72
        movss   sse117,sse73
        movss   sse77,dword ptr [___unnamed_float_0]
        comiss  sse77,sse117
        ja      label0018
        movss   sse118,sse117
        jmp     label0019
label0018:
        movss   sse79,sse117
        xorps   sse79,dword ptr [___unnamed_float_1]
        movss   sse118,sse79
label0019:
; end of inline function fabs
        comiss  sse118,dword ptr [___unnamed_float_2]
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
        movss   sse16,sse12
        subss   sse16,dword ptr [___unnamed_float_10]
; start of inline function eq
        cvtss2sd        sse18,sse16
; start of inline function fabs
        movsd   sse82,sse18
        subsd   sse82,qword ptr [___unnamed_double_11]
        cvtsd2ss        sse83,sse82
        movss   sse87,dword ptr [___unnamed_float_0]
        comiss  sse87,sse83
        ja      label001c
        movss   sse118,sse83
        jmp     label001d
label001c:
        movss   sse89,sse83
        xorps   sse89,dword ptr [___unnamed_float_1]
        movss   sse118,sse89
label001d:
; end of inline function fabs
        comiss  sse118,dword ptr [___unnamed_float_2]
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
        movss   sse20,sse16
        mulss   sse20,dword ptr [___unnamed_float_3]
; start of inline function eq
        cvtss2sd        sse22,sse20
; start of inline function fabs
        movsd   sse92,sse22
        subsd   sse92,qword ptr [___unnamed_double_12]
        cvtsd2ss        sse93,sse92
        movss   sse97,dword ptr [___unnamed_float_0]
        comiss  sse97,sse93
        ja      label0020
        movss   sse118,sse93
        jmp     label0021
label0020:
        movss   sse99,sse93
        xorps   sse99,dword ptr [___unnamed_float_1]
        movss   sse118,sse99
label0021:
; end of inline function fabs
        comiss  sse118,dword ptr [___unnamed_float_2]
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
        movss   sse24,sse20
        divss   sse24,dword ptr [___unnamed_float_13]
; start of inline function eq
        cvtss2sd        sse26,sse24
; start of inline function fabs
        movsd   sse102,sse26
        subsd   sse102,qword ptr [___unnamed_double_14]
        cvtsd2ss        sse103,sse102
        movss   sse107,dword ptr [___unnamed_float_0]
        comiss  sse107,sse103
        ja      label0024
        movss   sse118,sse103
        jmp     label0025
label0024:
        movss   sse109,sse103
        xorps   sse109,dword ptr [___unnamed_float_1]
        movss   sse118,sse109
label0025:
; end of inline function fabs
        comiss  sse118,dword ptr [___unnamed_float_2]
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
