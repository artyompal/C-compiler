
.686
.model flat

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,4
	mov	dword ptr [ebp-4],0
	jmp	label0002
label0000:
	jmp	label0001
label0001:
	cmp	dword ptr [ebp-4],1
	setne	byte1
	movzx	eax,byte1
	add	esp,4
	pop	ebp
	ret
label0002:
	inc	dword ptr [ebp-4]
	jmp	label0000
_test endp	

end
