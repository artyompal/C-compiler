
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
	cmp	edi,10
	mov	[ebp-16],edi
	jge	label0001
	mov	edi,[ebp-16]
	cmp	edi,5
	mov	[ebp-16],edi
	jne	label0002
	jmp	label0001
label0002:
	mov	edi,[ebp-16]
	inc	edi
	mov	[ebp-16],edi
	jmp	label0000
label0001:
	mov	edi,[ebp-16]
	cmp	edi,5
	je	label0003
	mov	eax,1
	pop	esi
	pop	edi
	add	esp,24
	pop	ebp
	ret
label0003:
	mov	edi,0
	mov	esi,0
	mov	[ebp-20],edi
	mov	[ebp-24],esi
label0004:
	mov	edi,[ebp-20]
	cmp	edi,50
	mov	[ebp-20],edi
	jne	label0007
	mov	edi,[ebp-20]
	add	edi,50
	mov	[ebp-20],edi
	jmp	label0005
label0007:
	mov	edi,[ebp-20]
	inc	edi
	mov	esi,[ebp-24]
	inc	esi
	mov	[ebp-20],edi
	mov	[ebp-24],esi
label0005:
	mov	edi,[ebp-20]
	cmp	edi,100
	mov	[ebp-20],edi
	jl	label0004
	mov	esi,[ebp-24]
	cmp	esi,50
	je	label0008
	mov	eax,1
	pop	esi
	pop	edi
	add	esp,24
	pop	ebp
	ret
label0008:
	mov	eax,0
	pop	esi
	pop	edi
	add	esp,24
	pop	ebp
	ret
_test endp	

end
