
.686
.model flat

.data

___unnamed_string_0	db	103, 111, 116, 111, 46, 99, 0
public	___unnamed_string_0
_test_name	dd	offset ___unnamed_string_0
public	_test_name

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,4
	push	edi
	mov	edi,0
	jmp	label0002
label0000:
	jmp	label0001
label0001:
	cmp	edi,1
	setne	al
	movzx	eax,al
	pop	edi
	add	esp,4
	pop	ebp
	ret
label0002:
	inc	edi
	jmp	label0000
_test endp	

end
