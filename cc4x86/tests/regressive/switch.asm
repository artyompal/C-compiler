
.686
.model flat
.xmm

.code

_test_case proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	edi
	mov	edi,3
	cmp	edi,1
	je	label0001
	cmp	edi,2
	je	label0001
	cmp	edi,3
	je	label0003
	jmp	label0004
label0001:
	mov	eax,-1
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0003:
	mov	eax,0
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0004:
	mov	eax,1
	pop	edi
	add	esp,8
	pop	ebp
	ret
_test_case endp	

_test_case2 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	edi
	mov	edi,3
	cmp	edi,0
	je	label0001
	cmp	edi,1
	je	label0002
	cmp	edi,2
	je	label0002
	cmp	edi,3
	je	label0002
	jmp	label0005
label0001:
	mov	eax,-1
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0002:
	mov	eax,0
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0005:
	mov	eax,1
	pop	edi
	add	esp,8
	pop	ebp
	ret
_test_case2 endp	

_test_default proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	edi
	mov	edi,100
	cmp	edi,1
	je	label0001
	cmp	edi,2
	je	label0001
	jmp	label0003
label0001:
	mov	eax,-1
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0003:
	mov	eax,0
	pop	edi
	add	esp,8
	pop	ebp
	ret
_test_default endp	

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,36
	push	edi
	push	esi
	push	ebx
; start of inline function test_case
	mov	dword ptr [ebp-4],3
	mov	edi,[ebp-4]
	cmp	edi,1
	je	label0004
	cmp	edi,2
	je	label0004
	cmp	edi,3
	je	label0006
	jmp	label0007
label0004:
	mov	esi,-1
	jmp	label0008
label0006:
	mov	esi,0
	jmp	label0008
label0007:
	mov	esi,1
	jmp	label0008
label0008:
; end of inline function test_case
	cmp	esi,0
	je	label0000
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,36
	pop	ebp
	ret
label0000:
; start of inline function test_case2
	mov	dword ptr [ebp-16],3
	mov	ebx,[ebp-16]
	cmp	ebx,0
	je	label000a
	cmp	ebx,1
	je	label000b
	cmp	ebx,2
	je	label000b
	cmp	ebx,3
	je	label000b
	jmp	label000e
label000a:
	mov	edx,-1
	jmp	label000f
label000b:
	mov	edx,0
	jmp	label000f
label000e:
	mov	edx,1
	jmp	label000f
label000f:
; end of inline function test_case2
	cmp	edx,0
	je	label0001
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,36
	pop	ebp
	ret
label0001:
; start of inline function test_default
	mov	dword ptr [ebp-28],100
	mov	eax,[ebp-28]
	mov	[ebp-32],eax
	cmp	dword ptr [ebp-32],1
	je	label0011
	cmp	dword ptr [ebp-32],2
	je	label0011
	jmp	label0013
label0011:
	mov	ecx,-1
	jmp	label0016
label0013:
	mov	ecx,0
	jmp	label0016
label0016:
; end of inline function test_default
	cmp	ecx,0
	je	label0002
	mov	eax,1
	pop	ebx
	pop	esi
	pop	edi
	add	esp,36
	pop	ebp
	ret
label0002:
	mov	eax,0
	pop	ebx
	pop	esi
	pop	edi
	add	esp,36
	pop	ebp
	ret
_test endp	

end
