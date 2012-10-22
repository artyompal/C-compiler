
.686
.model flat
.xmm

.data

___unnamed_float_0	dd	00h
public	___unnamed_float_0
align 16
___unnamed_float_1	dd	080000000h, 00h, 00h, 00h
public	___unnamed_float_1
___unnamed_float_2	dd	03a83126fh
public	___unnamed_float_2
___unnamed_float_3	dd	040000000h
public	___unnamed_float_3
___unnamed_double_4	dq	04008000000000000h
public	___unnamed_double_4
___unnamed_double_5	dq	04014000000000000h
public	___unnamed_double_5
___unnamed_double_6	dq	0bff0000000000000h
public	___unnamed_double_6
___unnamed_double_7	dq	04018000000000000h
public	___unnamed_double_7
___unnamed_double_8	dq	03fe54fdf3b645a1dh
public	___unnamed_double_8
___unnamed_double_9	dq	04010000000000000h
public	___unnamed_double_9
___unnamed_float_10	dd	03f800000h
public	___unnamed_float_10
___unnamed_double_11	dq	04008000000000000h
public	___unnamed_double_11
___unnamed_double_12	dq	04018000000000000h
public	___unnamed_double_12
___unnamed_float_13	dd	040400000h
public	___unnamed_float_13
___unnamed_double_14	dq	04000000000000000h
public	___unnamed_double_14

.code

_test proc
	create_stack_frame
	movss	sse112,dword ptr [___unnamed_float_3]
	movsd	sse113,qword ptr [___unnamed_double_4]
	cvtss2sd	sse114,sse112
	addsd	sse114,sse113
; start of inline function eq
	movsd	sse116,qword ptr [___unnamed_double_5]
	movsd	sse115,sse114
; start of inline function fabs
	movsd	sse29,sse115
	subsd	sse29,sse116
	cvtsd2ss	sse117,sse29
	movss	sse34,dword ptr [___unnamed_float_0]
	comiss	sse34,sse117
	ja	label0008
	movss	sse118,sse117
	jmp	label0009
label0008:
	movss	sse36,sse117
	xorps	sse36,dword ptr [___unnamed_float_1]
	movss	sse118,sse36
label0009:
	movss	sse119,sse118
; end of inline function fabs
	movss	sse31,sse119
	comiss	sse31,dword ptr [___unnamed_float_2]
	setb	byte2
	movzx	dword163,byte2
; end of inline function eq
	cmp	dword163,0
	jne	label0000
	mov	dword11,1
	set_retval	dword11
	destroy_stack_frame
	ret
label0000:
	cvtss2sd	sse5,sse112
	subsd	sse5,sse113
	movsd	sse114,sse5
; start of inline function eq
	movsd	sse116,qword ptr [___unnamed_double_6]
	movsd	sse115,sse114
; start of inline function fabs
	movsd	sse40,sse115
	subsd	sse40,sse116
	cvtsd2ss	sse41,sse40
	movss	sse117,sse41
	movss	sse45,dword ptr [___unnamed_float_0]
	comiss	sse45,sse117
	ja	label000c
	movss	sse118,sse117
	jmp	label000d
label000c:
	movss	sse47,sse117
	xorps	sse47,dword ptr [___unnamed_float_1]
	movss	sse118,sse47
label000d:
	movss	sse119,sse118
; end of inline function fabs
	movss	sse42,sse119
	comiss	sse42,dword ptr [___unnamed_float_2]
	setb	byte5
	movzx	dword75,byte5
	mov	dword163,dword75
; end of inline function eq
	cmp	dword163,0
	jne	label0001
	mov	dword18,2
	set_retval	dword18
	destroy_stack_frame
	ret
label0001:
	cvtss2sd	sse7,sse112
	mulsd	sse7,sse113
	movsd	sse114,sse7
; start of inline function eq
	movsd	sse116,qword ptr [___unnamed_double_7]
	movsd	sse115,sse114
; start of inline function fabs
	movsd	sse51,sse115
	subsd	sse51,sse116
	cvtsd2ss	sse52,sse51
	movss	sse117,sse52
	movss	sse56,dword ptr [___unnamed_float_0]
	comiss	sse56,sse117
	ja	label0010
	movss	sse118,sse117
	jmp	label0011
label0010:
	movss	sse58,sse117
	xorps	sse58,dword ptr [___unnamed_float_1]
	movss	sse118,sse58
label0011:
	movss	sse119,sse118
; end of inline function fabs
	movss	sse53,sse119
	comiss	sse53,dword ptr [___unnamed_float_2]
	setb	byte8
	movzx	dword88,byte8
	mov	dword163,dword88
; end of inline function eq
	cmp	dword163,0
	jne	label0002
	mov	dword25,3
	set_retval	dword25
	destroy_stack_frame
	ret
label0002:
	cvtss2sd	sse9,sse112
	divsd	sse9,sse113
	movsd	sse114,sse9
; start of inline function eq
	movsd	sse116,qword ptr [___unnamed_double_8]
	movsd	sse115,sse114
; start of inline function fabs
	movsd	sse62,sse115
	subsd	sse62,sse116
	cvtsd2ss	sse63,sse62
	movss	sse117,sse63
	movss	sse67,dword ptr [___unnamed_float_0]
	comiss	sse67,sse117
	ja	label0014
	movss	sse118,sse117
	jmp	label0015
label0014:
	movss	sse69,sse117
	xorps	sse69,dword ptr [___unnamed_float_1]
	movss	sse118,sse69
label0015:
	movss	sse119,sse118
; end of inline function fabs
	movss	sse64,sse119
	comiss	sse64,dword ptr [___unnamed_float_2]
	setb	byte11
	movzx	dword101,byte11
	mov	dword163,dword101
; end of inline function eq
	cmp	dword163,0
	jne	label0003
	mov	dword32,4
	set_retval	dword32
	destroy_stack_frame
	ret
label0003:
	addss	sse112,dword ptr [___unnamed_float_3]
; start of inline function eq
	movsd	sse116,qword ptr [___unnamed_double_9]
	cvtss2sd	sse14,sse112
	movsd	sse115,sse14
; start of inline function fabs
	movsd	sse72,sse115
	subsd	sse72,sse116
	cvtsd2ss	sse73,sse72
	movss	sse117,sse73
	movss	sse77,dword ptr [___unnamed_float_0]
	comiss	sse77,sse117
	ja	label0018
	movss	sse118,sse117
	jmp	label0019
label0018:
	movss	sse79,sse117
	xorps	sse79,dword ptr [___unnamed_float_1]
	movss	sse118,sse79
label0019:
	movss	sse119,sse118
; end of inline function fabs
	movss	sse74,sse119
	comiss	sse74,dword ptr [___unnamed_float_2]
	setb	byte14
	movzx	dword114,byte14
	mov	dword163,dword114
; end of inline function eq
	cmp	dword163,0
	jne	label0004
	mov	dword38,5
	set_retval	dword38
	destroy_stack_frame
	ret
label0004:
	subss	sse112,dword ptr [___unnamed_float_10]
; start of inline function eq
	movsd	sse116,qword ptr [___unnamed_double_11]
	cvtss2sd	sse18,sse112
	movsd	sse115,sse18
; start of inline function fabs
	movsd	sse82,sse115
	subsd	sse82,sse116
	cvtsd2ss	sse83,sse82
	movss	sse117,sse83
	movss	sse87,dword ptr [___unnamed_float_0]
	comiss	sse87,sse117
	ja	label001c
	movss	sse118,sse117
	jmp	label001d
label001c:
	movss	sse89,sse117
	xorps	sse89,dword ptr [___unnamed_float_1]
	movss	sse118,sse89
label001d:
	movss	sse119,sse118
; end of inline function fabs
	movss	sse84,sse119
	comiss	sse84,dword ptr [___unnamed_float_2]
	setb	byte17
	movzx	dword127,byte17
	mov	dword163,dword127
; end of inline function eq
	cmp	dword163,0
	jne	label0005
	mov	dword44,6
	set_retval	dword44
	destroy_stack_frame
	ret
label0005:
	mulss	sse112,dword ptr [___unnamed_float_3]
; start of inline function eq
	movsd	sse116,qword ptr [___unnamed_double_12]
	cvtss2sd	sse22,sse112
	movsd	sse115,sse22
; start of inline function fabs
	movsd	sse92,sse115
	subsd	sse92,sse116
	cvtsd2ss	sse93,sse92
	movss	sse117,sse93
	movss	sse97,dword ptr [___unnamed_float_0]
	comiss	sse97,sse117
	ja	label0020
	movss	sse118,sse117
	jmp	label0021
label0020:
	movss	sse99,sse117
	xorps	sse99,dword ptr [___unnamed_float_1]
	movss	sse118,sse99
label0021:
	movss	sse119,sse118
; end of inline function fabs
	movss	sse94,sse119
	comiss	sse94,dword ptr [___unnamed_float_2]
	setb	byte20
	movzx	dword140,byte20
	mov	dword163,dword140
; end of inline function eq
	cmp	dword163,0
	jne	label0006
	mov	dword50,7
	set_retval	dword50
	destroy_stack_frame
	ret
label0006:
	divss	sse112,dword ptr [___unnamed_float_13]
; start of inline function eq
	movsd	sse116,qword ptr [___unnamed_double_14]
	cvtss2sd	sse26,sse112
	movsd	sse115,sse26
; start of inline function fabs
	movsd	sse102,sse115
	subsd	sse102,sse116
	cvtsd2ss	sse103,sse102
	movss	sse117,sse103
	movss	sse107,dword ptr [___unnamed_float_0]
	comiss	sse107,sse117
	ja	label0024
	movss	sse118,sse117
	jmp	label0025
label0024:
	movss	sse109,sse117
	xorps	sse109,dword ptr [___unnamed_float_1]
	movss	sse118,sse109
label0025:
	movss	sse119,sse118
; end of inline function fabs
	movss	sse104,sse119
	comiss	sse104,dword ptr [___unnamed_float_2]
	setb	byte23
	movzx	dword153,byte23
	mov	dword163,dword153
; end of inline function eq
	cmp	dword163,0
	jne	label0007
	mov	dword56,8
	set_retval	dword56
	destroy_stack_frame
	ret
label0007:
	mov	dword57,0
	set_retval	dword57
	destroy_stack_frame
	ret
_test endp	

end
