
.686
.model flat

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,20
	mov	dword ptr [ebp-4],2
	mov	dword ptr [ebp-8],3
	mov	dword ptr [ebp-12],4
	mov	dword ptr [ebp-16],5
	cdq
	mov	eax,[ebp-8]
	idiv	dword ptr [ebp-4]
	cdq
	mov	eax,[ebp-8]
	idiv	dword ptr [ebp-4]
	imul	eax,eax
	cdq
	mov	eax,[ebp-16]
	idiv	dword ptr [ebp-12]
	cdq
	mov	eax,[ebp-16]
	idiv	dword ptr [ebp-12]
	imul	eax,eax
	add	eax,eax
	mov	[ebp-20],eax
	cmp	dword ptr [ebp-20],2
	je	label0000
	mov	eax,1
	add	esp,20
	pop	ebp
	ret
label0000:
	cdq
	mov	eax,[ebp-12]
	idiv	dword ptr [ebp-4]
	mov	[ebp-12],eax
	cmp	dword ptr [ebp-12],2
	je	label0001
	mov	eax,2
	add	esp,20
	pop	ebp
	ret
label0001:
	cdq
	mov	eax,[ebp-16]
	idiv	dword ptr [ebp-8]
	mov	[ebp-16],edx
	cmp	dword ptr [ebp-16],2
	je	label0002
	mov	eax,3
	add	esp,20
	pop	ebp
	ret
label0002:
	mov	eax,0
	add	esp,20
	pop	ebp
	ret
_test endp	

end
