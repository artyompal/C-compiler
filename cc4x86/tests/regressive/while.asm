
.686
.model flat

.data

___unnamed_string_0	db	119, 104, 105, 108, 101, 46, 99, 0
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
	mov	eax,edi
	inc	edi
	cmp	eax,10
	jge	label0001
	jmp	label0000
label0001:
	cmp	edi,11
	je	label0002
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
label0002:
	mov	esi,1
	mov	ebx,0
label0003:
	sal	esi,1
	inc	ebx
label0004:
	cmp	esi,65536
	jl	label0003
label0005:
	cmp	ebx,16
	je	label0006
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
label0006:
	mov	eax,0
	pop	ebx
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
_test endp	

end
