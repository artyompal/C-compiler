
.686
.model flat

.data

___unnamed_string_0	db	115, 105, 109, 112, 108, 101, 46, 99, 0
public	___unnamed_string_0
_test_name	dd	offset ___unnamed_string_0
public	_test_name

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,12
	push	edi
	push	esi
	push	ebx
	mov	edi,2
	mov	esi,2
	mov	ebx,edi
	imul	ebx,esi
	cmp	ebx,4
	jne	label0000
	mov	eax,0
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
label0000:
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
label0001:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
_test endp	

end
