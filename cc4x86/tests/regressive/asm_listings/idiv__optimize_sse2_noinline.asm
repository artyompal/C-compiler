
.686
.model flat
.xmm

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,40
	push	edi
	push	esi
	push	ebx
	mov	edi,2
	mov	esi,3
	mov	eax,4
	mov	ebx,5
	mov	[ebp-24],eax
	mov	eax,3
	cdq
	idiv	edi
	mov	[ebp-28],eax
	mov	eax,3
	cdq
	idiv	edi
	mov	[ebp-32],eax
	mov	eax,[ebp-28]
	mov	edx,[ebp-32]
	imul	eax,edx
	mov	[ebp-28],eax
	mov	eax,ebx
	cdq
	mov	ecx,[ebp-24]
	idiv	ecx
	mov	[ebp-36],eax
	mov	eax,ebx
	cdq
	mov	ecx,[ebp-24]
	idiv	ecx
	mov	[ebp-40],eax
	mov	eax,[ebp-36]
	mov	edx,[ebp-40]
	imul	eax,edx
	mov	[ebp-36],eax
	mov	eax,[ebp-28]
	mov	ecx,[ebp-36]
	add	eax,ecx
	cmp	eax,2
	je	label0000
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,40
	pop	ebp
	ret
label0000:
	cdq
	mov	eax,[ebp-24]
	idiv	edi
	cmp	eax,2
	je	label0001
	mov	eax,2
	pop	ebx
	pop	esi
	pop	edi
	add	esp,40
	pop	ebp
	ret
label0001:
	mov	eax,ebx
	cdq
	idiv	esi
	mov	ebx,edx
	cmp	ebx,2
	je	label0002
	mov	eax,3
	pop	ebx
	pop	esi
	pop	edi
	add	esp,40
	pop	ebp
	ret
label0002:
	mov	eax,0
	pop	ebx
	pop	esi
	pop	edi
	add	esp,40
	pop	ebp
	ret
_test endp	

end
