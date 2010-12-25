
.686
.model flat
.xmm

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
	mov	eax,esi
	sal	eax,1
	mov	esi,eax
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
