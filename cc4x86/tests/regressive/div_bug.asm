
.686
.model flat

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,20
	mov	dword ptr [ebp-4],4
	mov	dword ptr [ebp-8],2
	mov	dword ptr [ebp-12],1
	lea	eax,[ebp-12]
	mov	[ebp-16],eax
	mov	eax,[ebp-4]
	cdq
	idiv	dword ptr [ebp-8]
	mov	eax,[ebp-16]
	add	eax,[eax]
	mov	[ebp-20],eax
	mov	eax,[ebp-20]
	sub	eax,3
	add	esp,20
	pop	ebp
	ret
_test endp	

end
