
.686
.model flat
.xmm

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,12
	mov	dword ptr [ebp-4],2
	mov	dword ptr [ebp-8],2
	mov	eax,[ebp-4]
	imul	eax,[ebp-8]
	mov	[ebp-12],eax
	cmp	dword ptr [ebp-12],4
	jne	label0000
	mov	eax,0
	add	esp,12
	pop	ebp
	ret
label0000:
	mov	eax,1
	add	esp,12
	pop	ebp
	ret
	add	esp,12
	pop	ebp
	ret
_test endp	

end
