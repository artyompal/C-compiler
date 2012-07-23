
.686
.model flat
.xmm

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	edi
	push	esi
	mov	edi,-16
	mov	esi,-16
	mov	eax,edi
	sar	eax,4
	cmp	eax,-1
	je	label0000
	mov	eax,1
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0000:
	mov	eax,edi
	shr	eax,4
	cmp	eax,268435455
	je	label0001
	mov	eax,2
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0001:
	mov	edi,1073741824
	mov	esi,1073741824
	mov	eax,edi
	sal	eax,1
	cmp	eax,0
	jl	label0002
	mov	eax,3
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0002:
	mov	eax,edi
	shl	eax,1
	cmp	eax,-2147483648
	je	label0003
	mov	eax,4
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0003:
	mov	edi,1
	mov	esi,1
	mov	ecx,3
	add	ecx,esi
	mov	eax,edi
	shl	eax,cl
	cmp	eax,16
	je	label0004
	mov	eax,5
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0004:
	mov	ecx,5
	add	ecx,edi
	sal	edi,cl
	cmp	edi,64
	je	label0005
	mov	eax,6
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0005:
	mov	eax,0
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
_test endp	

end
