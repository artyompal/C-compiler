
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
___unnamed_float_3	dd	040800000h
public	___unnamed_float_3

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,20
; start of inline function test1
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-4],xmm0
	movss	xmm0,dword ptr [ebp-4]
	movss	dword ptr [ebp-8],xmm0
	movss	xmm0,dword ptr [ebp-8]
	addss	xmm0,dword ptr [___unnamed_float_0]
	movss	dword ptr [ebp-8],xmm0
	movss	xmm0,dword ptr [ebp-8]
	movss	dword ptr [ebp-4],xmm0
	movss	xmm0,dword ptr [ebp-4]
	movss	dword ptr [ebp-12],xmm0
; end of inline function test1
	movss	xmm0,dword ptr [ebp-12]
	comiss	xmm0,dword ptr [___unnamed_float_2]
	je	label0000
	mov	eax,1
	add	esp,20
	pop	ebp
	ret
label0000:
; start of inline function test2
	movss	xmm0,dword ptr [___unnamed_float_0]
	movss	dword ptr [ebp-16],xmm0
	movss	xmm0,dword ptr [ebp-16]
	addss	xmm0,dword ptr [___unnamed_float_0]
	movss	dword ptr [ebp-20],xmm0
; end of inline function test2
	movss	xmm0,dword ptr [ebp-20]
	comiss	xmm0,dword ptr [___unnamed_float_3]
	je	label0001
	mov	eax,2
	add	esp,20
	pop	ebp
	ret
label0001:
	mov	eax,0
	add	esp,20
	pop	ebp
	ret
_test endp	

end
