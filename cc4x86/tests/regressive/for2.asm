
.686
.model flat

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,16
	push	edi
	push	esi
	push	ebx
	mov	edi,0
	mov	esi,0
label0000:
label0001:
	cmp	esi,8
	jge	label0002
	cmp	esi,4
	jne	label0003
	jmp	label0002
label0003:
	inc	esi
	inc	esi
	inc	edi
	jmp	label0001
label0002:
	cmp	esi,4
	jne	label0004
	cmp	edi,2
	jne	label0004
	mov	ebx,0
	jmp	label0005
label0004:
	mov	ebx,1
label0005:
	mov	eax,ebx
	pop	ebx
	pop	esi
	pop	edi
	add	esp,16
	pop	ebp
	ret
_test endp	

end
