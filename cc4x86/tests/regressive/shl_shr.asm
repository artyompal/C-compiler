
.686
.model flat

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
	mov	dword ptr [ebp-4],-16
	mov	dword ptr [ebp-8],-16
	sar	dword ptr [ebp-4],4
	cmp	dword ptr [ebp-4],-1
	je	label0000
	mov	eax,1
	add	esp,8
	pop	ebp
	ret
label0000:
	shr	dword ptr [ebp-8],4
	cmp	dword ptr [ebp-8],4079
	je	label0001
	mov	eax,2
	add	esp,8
	pop	ebp
	ret
label0001:
	mov	dword ptr [ebp-4],1073741824
	mov	dword ptr [ebp-8],1073741824
	sal	dword ptr [ebp-4],1
	cmp	dword ptr [ebp-4],0
	jge	label0002
	mov	eax,3
	add	esp,8
	pop	ebp
	ret
label0002:
	shl	dword ptr [ebp-8],1
	cmp	dword ptr [ebp-8],2147483647
	je	label0003
	mov	eax,4
	add	esp,8
	pop	ebp
	ret
label0003:
	mov	dword ptr [ebp-4],1
	mov	dword ptr [ebp-8],1
	mov	ecx,3
	add	ecx,[ebp-8]
	shl	dword ptr [ebp-4],cl
	cmp	dword ptr [ebp-4],16
	je	label0004
	mov	eax,5
	add	esp,8
	pop	ebp
	ret
label0004:
	mov	ecx,5
	add	ecx,[ebp-8]
	sal	dword ptr [ebp-4],cl
	cmp	dword ptr [ebp-4],64
	je	label0005
	mov	eax,6
	add	esp,8
	pop	ebp
	ret
label0005:
	mov	eax,0
	add	esp,8
	pop	ebp
	ret
_test endp	

end
