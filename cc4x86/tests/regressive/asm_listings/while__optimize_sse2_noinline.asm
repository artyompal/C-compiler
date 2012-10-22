
.686
.model flat
.xmm

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,24
	push	edi
	push	esi
	mov	edi,0
	mov	[ebp-16],edi
label0000:
	mov	edi,[ebp-16]
	mov	eax,edi
	inc	edi
	cmp	eax,10
	mov	[ebp-16],edi
	jge	label0001
	jmp	label0000
label0001:
	mov	edi,[ebp-16]
	cmp	edi,11
	je	label0002
	mov	eax,1
	pop	esi
	pop	edi
	add	esp,24
	pop	ebp
	ret
label0002:
	mov	edi,1
	mov	esi,0
	mov	[ebp-20],edi
	mov	[ebp-24],esi
label0003:
	mov	edi,[ebp-20]
	sal	edi,1
	mov	esi,[ebp-24]
	inc	esi
	cmp	edi,65536
	mov	[ebp-20],edi
	mov	[ebp-24],esi
	jl	label0003
	mov	esi,[ebp-24]
	cmp	esi,16
	je	label0006
	mov	eax,2
	pop	esi
	pop	edi
	add	esp,24
	pop	ebp
	ret
label0006:
	mov	eax,0
	pop	esi
	pop	edi
	add	esp,24
	pop	ebp
	ret
_test endp	

end
