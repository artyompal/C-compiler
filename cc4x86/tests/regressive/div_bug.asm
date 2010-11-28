
.686
.model flat

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,20
	push	edi
	push	esi
	mov	edi,4
	mov	esi,2
	mov	dword ptr [ebp-12],1
	lea	eax,[ebp-12]
	mov	[ebp-16],eax
	cdq
	mov	eax,edi
	idiv	esi
	mov	ecx,[ebp-16]
	add	eax,[ecx]
	mov	[ebp-20],eax
	mov	eax,[ebp-20]
	sub	eax,3
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
_test endp	

end
