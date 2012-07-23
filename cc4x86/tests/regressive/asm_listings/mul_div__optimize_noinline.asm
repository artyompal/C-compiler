
.686
.model flat
.xmm

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,20
	push	edi
	push	esi
	mov	dword ptr [ebp-4],2
	mov	dword ptr [ebp-8],3
	mov	dword ptr [ebp-12],4
	mov	dword ptr [ebp-16],5
	mov	eax,[ebp-8]
	xor	edx,edx
	div	dword ptr [ebp-4]
	mov	edi,eax
	mov	eax,[ebp-8]
	xor	edx,edx
	div	dword ptr [ebp-4]
	mul	eax
	mov	eax,[ebp-16]
	xor	edx,edx
	div	dword ptr [ebp-12]
	mov	esi,eax
	mov	eax,[ebp-16]
	xor	edx,edx
	div	dword ptr [ebp-12]
	mul	eax
	add	edi,esi
	mov	[ebp-20],edi
	cmp	dword ptr [ebp-20],2
	je	label0000
	mov	eax,1
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
label0000:
	mov	eax,[ebp-12]
	xor	edx,edx
	div	dword ptr [ebp-4]
	mov	[ebp-12],eax
	cmp	dword ptr [ebp-12],2
	je	label0001
	mov	eax,2
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
label0001:
	mov	eax,[ebp-16]
	xor	edx,edx
	div	dword ptr [ebp-8]
	mov	[ebp-16],edx
	cmp	dword ptr [ebp-16],2
	je	label0002
	mov	eax,3
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
label0002:
	mov	eax,[ebp-4]
	mul	dword ptr [ebp-8]
	mov	[ebp-12],eax
	cmp	dword ptr [ebp-12],6
	je	label0003
	mov	eax,4
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
label0003:
	mov	eax,[ebp-4]
	mov	[ebp-16],eax
	mov	eax,[ebp-16]
	mul	dword ptr [ebp-8]
	mov	[ebp-16],eax
	cmp	dword ptr [ebp-16],6
	je	label0004
	mov	eax,5
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
label0004:
	mov	dword ptr [ebp-4],65536
	mov	dword ptr [ebp-8],65536
	mov	eax,[ebp-4]
	mul	dword ptr [ebp-8]
	cmp	eax,0
	je	label0005
	mov	eax,6
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
label0005:
	mov	eax,0
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
_test endp	

end
