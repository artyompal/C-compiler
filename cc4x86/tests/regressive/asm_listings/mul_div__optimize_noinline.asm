
.686
.model flat
.xmm

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,64
	push	edi
	push	esi
	push	ebx
	mov	edi,2
	mov	esi,3
	mov	eax,4
	mov	[ebp-24],eax
	mov	eax,5
	mov	[ebp-28],eax
	mov	eax,esi
	xor	edx,edx
	div	edi
	mov	[ebp-32],eax
	mov	eax,esi
	xor	edx,edx
	div	edi
	mov	[ebp-36],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-36]
	mul	ecx
	mov	[ebp-32],eax
	mov	edx,[ebp-28]
	mov	eax,edx
	xor	edx,edx
	mov	ebx,[ebp-24]
	div	ebx
	mov	[ebp-40],eax
	mov	edx,[ebp-28]
	mov	eax,edx
	xor	edx,edx
	mov	ebx,[ebp-24]
	div	ebx
	mov	[ebp-44],eax
	mov	eax,[ebp-40]
	mov	ecx,[ebp-44]
	mul	ecx
	mov	[ebp-40],eax
	mov	eax,[ebp-32]
	mov	edx,[ebp-40]
	add	eax,edx
	cmp	eax,2
	mov	[ebp-48],edi
	mov	[ebp-52],esi
	je	label0000
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
label0000:
	xor	edx,edx
	mov	eax,[ebp-24]
	mov	edi,[ebp-48]
	div	edi
	cmp	eax,2
	mov	[ebp-48],edi
	je	label0001
	mov	eax,2
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
label0001:
	mov	edi,[ebp-28]
	mov	eax,edi
	xor	edx,edx
	mov	esi,[ebp-52]
	div	esi
	mov	eax,edx
	cmp	eax,2
	mov	[ebp-52],esi
	je	label0002
	mov	eax,3
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
label0002:
	mov	edi,[ebp-48]
	mov	eax,edi
	mov	esi,[ebp-52]
	mul	esi
	mov	[ebp-56],eax
	mov	ecx,[ebp-56]
	mov	eax,ecx
	cmp	eax,6
	mov	[ebp-48],edi
	mov	[ebp-52],esi
	je	label0003
	mov	eax,4
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
label0003:
	mov	edi,[ebp-48]
	mov	eax,edi
	mov	esi,[ebp-52]
	mul	esi
	cmp	eax,6
	je	label0004
	mov	eax,5
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
label0004:
	mov	edi,65536
	mov	esi,65536
	mov	eax,edi
	mul	esi
	cmp	eax,0
	je	label0005
	mov	eax,6
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
label0005:
	mov	edi,2
	mov	esi,3
	mov	eax,4
	mov	[ebp-24],eax
	mov	eax,5
	mov	eax,esi
	xor	edx,edx
	div	edi
	mov	[ebp-60],eax
	mov	esi,[ebp-24]
	mov	eax,esi
	xor	edx,edx
	div	edi
	mov	[ebp-64],eax
	mov	eax,[ebp-60]
	mov	edi,[ebp-64]
	mul	edi
	mov	[ebp-60],eax
	mov	edx,[ebp-60]
	mov	eax,edx
	cmp	eax,2
	je	label0006
	mov	eax,7
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
label0006:
	mov	eax,0
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
_test endp	

end
