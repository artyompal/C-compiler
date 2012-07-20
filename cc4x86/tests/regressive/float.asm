
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
	push	ebp
	mov	ebp,esp
	sub	esp,52
	push	edi
	movss	xmm7,dword ptr [___unnamed_float_3]
	movsd	xmm0,qword ptr [___unnamed_double_4]
	movsd	qword ptr [ebp-12],xmm0
	cvtss2sd	xmm0,xmm7
	addsd	xmm0,qword ptr [ebp-12]
	movsd	qword ptr [ebp-20],xmm0
; start of inline function eq
	movsd	xmm6,qword ptr [___unnamed_double_5]
	movsd	xmm5,qword ptr [ebp-20]
; start of inline function fabs
	movsd	xmm0,xmm5
	subsd	xmm0,xmm6
	cvtsd2ss	xmm6,xmm0
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,xmm6
	ja	label0008
	movss	xmm5,xmm6
	jmp	label0009
label0008:
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	xmm5,xmm0
label0009:
	movss	xmm6,xmm5
; end of inline function fabs
	movss	xmm0,xmm6
	comiss	xmm0,dword ptr [___unnamed_float_2]
	setb	al
	movzx	eax,al
; end of inline function eq
	cmp	eax,0
	jne	label0000
	mov	eax,1
	pop	edi
	add	esp,52
	pop	ebp
	ret
label0000:
	cvtss2sd	xmm0,xmm7
	subsd	xmm0,qword ptr [ebp-12]
	movsd	qword ptr [ebp-20],xmm0
; start of inline function eq
	movsd	xmm6,qword ptr [___unnamed_double_6]
	movsd	xmm5,qword ptr [ebp-20]
; start of inline function fabs
	movsd	xmm0,xmm5
	subsd	xmm0,xmm6
	cvtsd2ss	xmm1,xmm0
	movss	xmm6,xmm1
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,xmm6
	ja	label000c
	movss	xmm5,xmm6
	jmp	label000d
label000c:
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	xmm5,xmm0
label000d:
	movss	xmm6,xmm5
; end of inline function fabs
	movss	xmm0,xmm6
	comiss	xmm0,dword ptr [___unnamed_float_2]
	setb	al
	movzx	eax,al
	mov	edi,eax
; end of inline function eq
	cmp	edi,0
	jne	label0001
	mov	eax,2
	pop	edi
	add	esp,52
	pop	ebp
	ret
label0001:
	cvtss2sd	xmm0,xmm7
	mulsd	xmm0,qword ptr [ebp-12]
	movsd	qword ptr [ebp-20],xmm0
; start of inline function eq
	movsd	xmm6,qword ptr [___unnamed_double_7]
	movsd	xmm0,qword ptr [ebp-20]
	movsd	xmm5,xmm0
; start of inline function fabs
	movsd	xmm0,xmm5
	subsd	xmm0,xmm6
	cvtsd2ss	xmm1,xmm0
	movss	xmm6,xmm1
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,xmm6
	ja	label0010
	movss	xmm5,xmm6
	jmp	label0011
label0010:
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	xmm5,xmm0
label0011:
	movss	xmm6,xmm5
; end of inline function fabs
	movss	xmm0,xmm6
	comiss	xmm0,dword ptr [___unnamed_float_2]
	setb	al
	movzx	eax,al
	mov	edi,eax
; end of inline function eq
	cmp	edi,0
	jne	label0002
	mov	eax,3
	pop	edi
	add	esp,52
	pop	ebp
	ret
label0002:
	cvtss2sd	xmm0,xmm7
	divsd	xmm0,qword ptr [ebp-12]
	movsd	qword ptr [ebp-20],xmm0
; start of inline function eq
	movsd	xmm6,qword ptr [___unnamed_double_8]
	movsd	xmm0,qword ptr [ebp-20]
	movsd	xmm5,xmm0
; start of inline function fabs
	movsd	xmm0,xmm5
	subsd	xmm0,xmm6
	cvtsd2ss	xmm1,xmm0
	movss	xmm6,xmm1
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,xmm6
	ja	label0014
	movss	xmm5,xmm6
	jmp	label0015
label0014:
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	xmm5,xmm0
label0015:
	movss	xmm6,xmm5
; end of inline function fabs
	movss	xmm0,xmm6
	comiss	xmm0,dword ptr [___unnamed_float_2]
	setb	al
	movzx	eax,al
	mov	edi,eax
; end of inline function eq
	cmp	edi,0
	jne	label0003
	mov	eax,4
	pop	edi
	add	esp,52
	pop	ebp
	ret
label0003:
	addss	xmm7,dword ptr [___unnamed_float_3]
; start of inline function eq
	movsd	xmm6,qword ptr [___unnamed_double_9]
	cvtss2sd	xmm0,xmm7
	movsd	xmm5,xmm0
; start of inline function fabs
	movsd	xmm0,xmm5
	subsd	xmm0,xmm6
	cvtsd2ss	xmm1,xmm0
	movss	xmm6,xmm1
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,xmm6
	ja	label0018
	movss	xmm5,xmm6
	jmp	label0019
label0018:
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	xmm5,xmm0
label0019:
	movss	xmm6,xmm5
; end of inline function fabs
	movss	xmm0,xmm6
	comiss	xmm0,dword ptr [___unnamed_float_2]
	setb	al
	movzx	eax,al
	mov	edi,eax
; end of inline function eq
	cmp	edi,0
	jne	label0004
	mov	eax,5
	pop	edi
	add	esp,52
	pop	ebp
	ret
label0004:
	subss	xmm7,dword ptr [___unnamed_float_10]
; start of inline function eq
	movsd	xmm6,qword ptr [___unnamed_double_11]
	cvtss2sd	xmm0,xmm7
	movsd	xmm5,xmm0
; start of inline function fabs
	movsd	xmm0,xmm5
	subsd	xmm0,xmm6
	cvtsd2ss	xmm1,xmm0
	movss	xmm6,xmm1
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,xmm6
	ja	label001c
	movss	xmm5,xmm6
	jmp	label001d
label001c:
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	xmm5,xmm0
label001d:
	movss	xmm6,xmm5
; end of inline function fabs
	movss	xmm0,xmm6
	comiss	xmm0,dword ptr [___unnamed_float_2]
	setb	al
	movzx	eax,al
	mov	edi,eax
; end of inline function eq
	cmp	edi,0
	jne	label0005
	mov	eax,6
	pop	edi
	add	esp,52
	pop	ebp
	ret
label0005:
	mulss	xmm7,dword ptr [___unnamed_float_3]
; start of inline function eq
	movsd	xmm6,qword ptr [___unnamed_double_12]
	cvtss2sd	xmm0,xmm7
	movsd	xmm5,xmm0
; start of inline function fabs
	movsd	xmm0,xmm5
	subsd	xmm0,xmm6
	cvtsd2ss	xmm1,xmm0
	movss	xmm6,xmm1
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,xmm6
	ja	label0020
	movss	xmm5,xmm6
	jmp	label0021
label0020:
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	xmm5,xmm0
label0021:
	movss	xmm6,xmm5
; end of inline function fabs
	movss	xmm0,xmm6
	comiss	xmm0,dword ptr [___unnamed_float_2]
	setb	al
	movzx	eax,al
	mov	edi,eax
; end of inline function eq
	cmp	edi,0
	jne	label0006
	mov	eax,7
	pop	edi
	add	esp,52
	pop	ebp
	ret
label0006:
	divss	xmm7,dword ptr [___unnamed_float_13]
; start of inline function eq
	movsd	xmm6,qword ptr [___unnamed_double_14]
	cvtss2sd	xmm0,xmm7
	movsd	xmm7,xmm0
; start of inline function fabs
	movsd	xmm0,xmm7
	subsd	xmm0,xmm6
	cvtsd2ss	xmm1,xmm0
	movss	xmm7,xmm1
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,xmm7
	ja	label0024
	movss	xmm6,xmm7
	jmp	label0025
label0024:
	movss	xmm0,xmm7
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	xmm6,xmm0
label0025:
	movss	xmm7,xmm6
; end of inline function fabs
	movss	xmm0,xmm7
	comiss	xmm0,dword ptr [___unnamed_float_2]
	setb	al
	movzx	eax,al
	mov	edi,eax
; end of inline function eq
	cmp	edi,0
	jne	label0007
	mov	eax,8
	pop	edi
	add	esp,52
	pop	ebp
	ret
label0007:
	mov	eax,0
	pop	edi
	add	esp,52
	pop	ebp
	ret
_test endp	

end
