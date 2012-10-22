
.686
.model flat
.xmm

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,16
	push	edi
	mov	edi,0
	mov	[ebp-16],edi
label0000:
	mov	edi,[ebp-16]
	cmp	edi,8
	mov	[ebp-16],edi
	jge	label0002
	mov	edi,[ebp-16]
	cmp	edi,4
	mov	[ebp-16],edi
	jne	label0003
	jmp	label0002
label0003:
	mov	edi,[ebp-16]
	inc	edi
	mov	[ebp-16],edi
	jmp	label0000
label0002:
	mov	edi,[ebp-16]
	cmp	edi,4
	setne	al
	movzx	eax,al
	pop	edi
	add	esp,16
	pop	ebp
	ret
_test endp	

end
