
.686
.model flat
.xmm

.data

___unnamed_float_0	dd	040000000h
public	___unnamed_float_0
___unnamed_float_1	dd	03f800000h
public	___unnamed_float_1
___unnamed_float_2	dd	040400000h
public	___unnamed_float_2

.code

_test2 proc
	push	ebp
	mov	ebp,esp
	sub	esp,4
	movss	xmm7,dword ptr [ebp+8]
	movss	xmm6,xmm7
	movss	xmm0,dword ptr [___unnamed_float_0]
	movss	xmm1,xmm6
	addss	xmm1,xmm0
	movss	xmm6,xmm1
	movss	xmm7,xmm6
	movss	xmm0,xmm7
	add	esp,4
	pop	ebp
	ret
_test2 endp	

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,16
	push	edi
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-8],xmm0
; start of inline function test2
	movss	xmm0,dword ptr [ebp-8]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_0]
	movss	xmm1,dword ptr [ebp-12]
	addss	xmm1,xmm0
	movss	dword ptr [ebp-12],xmm1
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [ebp-8],xmm0
	movss	xmm0,dword ptr [ebp-8]
	movss	dword ptr [ebp-16],xmm0
label0002:
; end of inline function test2
	movss	xmm0,dword ptr [ebp-16]
	movss	xmm1,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm1
	jne	label0000
	mov	edi,0
	jmp	label0001
label0000:
	mov	edi,1
label0001:
	mov	eax,edi
	pop	edi
	add	esp,16
	pop	ebp
	ret
_test endp	

end
