
.686
.model flat

.data

___unnamed_string_0	db	119, 104, 105, 108, 101, 95, 98, 114, 101, 97, 107, 46, 99, 0
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
	mov	edi,0
label0000:
	cmp	edi,10
	jge	label0001
	cmp	edi,5
	jne	label0002
	jmp	label0001
label0002:
	inc	edi
	jmp	label0000
label0001:
	cmp	edi,5
	je	label0003
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
label0003:
	mov	esi,0
	mov	ebx,0
label0004:
	cmp	esi,50
	jne	label0007
	add	esi,50
	jmp	label0005
label0007:
	inc	esi
	inc	ebx
label0005:
	cmp	esi,100
	jl	label0004
label0006:
	cmp	ebx,50
	je	label0008
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
label0008:
	mov	eax,0
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
_test endp	

end
