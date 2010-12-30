
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
	movss	xmm7,dword ptr [___unnamed_float_3]
	movsd	xmm6,qword ptr [___unnamed_double_4]
	cvtss2sd	xmm5,xmm7
	addsd	xmm5,xmm6
	movsd	xmm0,qword ptr [___unnamed_double_5]
	movsd	qword ptr [ebp-28],xmm0
	movsd	qword ptr [ebp-36],xmm5
; start of inline function eq
	movsd	xmm0,qword ptr [ebp-36]
	subsd	xmm0,qword ptr [ebp-28]
	cvtsd2ss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
; start of inline function fabs
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,dword ptr [ebp-40]
	ja	label0008
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-44],xmm0
	jmp	label0009
label0008:
	movss	xmm0,dword ptr [ebp-40]
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-44],xmm0
label0009:
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-48],xmm0
label000a:
; end of inline function fabs
	movss	xmm0,dword ptr [ebp-48]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	setb	al
	movzx	eax,al
	mov	[ebp-52],eax
label000b:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0000
	mov	eax,1
	add	esp,52
	pop	ebp
	ret
label0000:
	cvtss2sd	xmm0,xmm7
	subsd	xmm0,xmm6
	movsd	xmm5,xmm0
	movsd	xmm0,qword ptr [___unnamed_double_6]
	movsd	qword ptr [ebp-28],xmm0
	movsd	qword ptr [ebp-36],xmm5
; start of inline function eq
	movsd	xmm0,qword ptr [ebp-36]
	subsd	xmm0,qword ptr [ebp-28]
	cvtsd2ss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
; start of inline function fabs
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,dword ptr [ebp-40]
	ja	label000c
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-44],xmm0
	jmp	label000d
label000c:
	movss	xmm0,dword ptr [ebp-40]
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-44],xmm0
label000d:
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-48],xmm0
label000e:
; end of inline function fabs
	movss	xmm0,dword ptr [ebp-48]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	setb	al
	movzx	eax,al
	mov	[ebp-52],eax
label000f:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0001
	mov	eax,2
	add	esp,52
	pop	ebp
	ret
label0001:
	cvtss2sd	xmm0,xmm7
	mulsd	xmm0,xmm6
	movsd	xmm5,xmm0
	movsd	xmm0,qword ptr [___unnamed_double_7]
	movsd	qword ptr [ebp-28],xmm0
	movsd	qword ptr [ebp-36],xmm5
; start of inline function eq
	movsd	xmm0,qword ptr [ebp-36]
	subsd	xmm0,qword ptr [ebp-28]
	cvtsd2ss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
; start of inline function fabs
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,dword ptr [ebp-40]
	ja	label0010
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-44],xmm0
	jmp	label0011
label0010:
	movss	xmm0,dword ptr [ebp-40]
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-44],xmm0
label0011:
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-48],xmm0
label0012:
; end of inline function fabs
	movss	xmm0,dword ptr [ebp-48]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	setb	al
	movzx	eax,al
	mov	[ebp-52],eax
label0013:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0002
	mov	eax,3
	add	esp,52
	pop	ebp
	ret
label0002:
	cvtss2sd	xmm0,xmm7
	divsd	xmm0,xmm6
	movsd	xmm5,xmm0
	movsd	xmm0,qword ptr [___unnamed_double_8]
	movsd	qword ptr [ebp-28],xmm0
	movsd	qword ptr [ebp-36],xmm5
; start of inline function eq
	movsd	xmm0,qword ptr [ebp-36]
	subsd	xmm0,qword ptr [ebp-28]
	cvtsd2ss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
; start of inline function fabs
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,dword ptr [ebp-40]
	ja	label0014
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-44],xmm0
	jmp	label0015
label0014:
	movss	xmm0,dword ptr [ebp-40]
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-44],xmm0
label0015:
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-48],xmm0
label0016:
; end of inline function fabs
	movss	xmm0,dword ptr [ebp-48]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	setb	al
	movzx	eax,al
	mov	[ebp-52],eax
label0017:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0003
	mov	eax,4
	add	esp,52
	pop	ebp
	ret
label0003:
	movss	xmm0,dword ptr [___unnamed_float_3]
	movss	xmm1,xmm7
	addss	xmm1,xmm0
	movss	xmm7,xmm1
	movsd	xmm0,qword ptr [___unnamed_double_9]
	movsd	qword ptr [ebp-28],xmm0
	cvtss2sd	xmm0,xmm7
	movsd	qword ptr [ebp-36],xmm0
; start of inline function eq
	movsd	xmm0,qword ptr [ebp-36]
	subsd	xmm0,qword ptr [ebp-28]
	cvtsd2ss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
; start of inline function fabs
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,dword ptr [ebp-40]
	ja	label0018
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-44],xmm0
	jmp	label0019
label0018:
	movss	xmm0,dword ptr [ebp-40]
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-44],xmm0
label0019:
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-48],xmm0
label001a:
; end of inline function fabs
	movss	xmm0,dword ptr [ebp-48]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	setb	al
	movzx	eax,al
	mov	[ebp-52],eax
label001b:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0004
	mov	eax,5
	add	esp,52
	pop	ebp
	ret
label0004:
	movss	xmm0,dword ptr [___unnamed_float_10]
	movss	xmm1,xmm7
	subss	xmm1,xmm0
	movss	xmm7,xmm1
	movsd	xmm0,qword ptr [___unnamed_double_11]
	movsd	qword ptr [ebp-28],xmm0
	cvtss2sd	xmm0,xmm7
	movsd	qword ptr [ebp-36],xmm0
; start of inline function eq
	movsd	xmm0,qword ptr [ebp-36]
	subsd	xmm0,qword ptr [ebp-28]
	cvtsd2ss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
; start of inline function fabs
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,dword ptr [ebp-40]
	ja	label001c
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-44],xmm0
	jmp	label001d
label001c:
	movss	xmm0,dword ptr [ebp-40]
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-44],xmm0
label001d:
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-48],xmm0
label001e:
; end of inline function fabs
	movss	xmm0,dword ptr [ebp-48]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	setb	al
	movzx	eax,al
	mov	[ebp-52],eax
label001f:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0005
	mov	eax,6
	add	esp,52
	pop	ebp
	ret
label0005:
	movss	xmm0,dword ptr [___unnamed_float_3]
	movss	xmm1,xmm7
	mulss	xmm1,xmm0
	movss	xmm7,xmm1
	movsd	xmm0,qword ptr [___unnamed_double_12]
	movsd	qword ptr [ebp-28],xmm0
	cvtss2sd	xmm0,xmm7
	movsd	qword ptr [ebp-36],xmm0
; start of inline function eq
	movsd	xmm0,qword ptr [ebp-36]
	subsd	xmm0,qword ptr [ebp-28]
	cvtsd2ss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
; start of inline function fabs
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,dword ptr [ebp-40]
	ja	label0020
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-44],xmm0
	jmp	label0021
label0020:
	movss	xmm0,dword ptr [ebp-40]
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-44],xmm0
label0021:
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-48],xmm0
label0022:
; end of inline function fabs
	movss	xmm0,dword ptr [ebp-48]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	setb	al
	movzx	eax,al
	mov	[ebp-52],eax
label0023:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0006
	mov	eax,7
	add	esp,52
	pop	ebp
	ret
label0006:
	movss	xmm0,dword ptr [___unnamed_float_13]
	movss	xmm1,xmm7
	divss	xmm1,xmm0
	movss	xmm7,xmm1
	movsd	xmm0,qword ptr [___unnamed_double_14]
	movsd	qword ptr [ebp-28],xmm0
	cvtss2sd	xmm0,xmm7
	movsd	qword ptr [ebp-36],xmm0
; start of inline function eq
	movsd	xmm0,qword ptr [ebp-36]
	subsd	xmm0,qword ptr [ebp-28]
	cvtsd2ss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
; start of inline function fabs
	movss	xmm0,dword ptr [___unnamed_float_0]
	comiss	xmm0,dword ptr [ebp-40]
	ja	label0024
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-44],xmm0
	jmp	label0025
label0024:
	movss	xmm0,dword ptr [ebp-40]
	xorps	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-44],xmm0
label0025:
	movss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [ebp-48],xmm0
label0026:
; end of inline function fabs
	movss	xmm0,dword ptr [ebp-48]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	setb	al
	movzx	eax,al
	mov	[ebp-52],eax
label0027:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0007
	mov	eax,8
	add	esp,52
	pop	ebp
	ret
label0007:
	mov	eax,0
	add	esp,52
	pop	ebp
	ret
_test endp	

end
