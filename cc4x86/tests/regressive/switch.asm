
.686
.model flat

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
	je	label0002
	cmp	edi,3
	je	label0003
	jmp	label0004
label0001:
label0002:
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
label0000:
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
	je	label0003
	cmp	edi,3
	je	label0004
	jmp	label0005
label0001:
	mov	eax,-1
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0002:
label0003:
label0004:
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
label0000:
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
	je	label0002
	jmp	label0003
label0001:
label0002:
	mov	eax,-1
	pop	edi
	add	esp,8
	pop	ebp
	ret
label0003:
label0004:
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
label0000:
	pop	edi
	add	esp,8
	pop	ebp
	ret
_test_default endp	

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,36
; start of inline function test_case
	mov	dword ptr [ebp-4],3
	mov	eax,[ebp-4]
	mov	[ebp-8],eax
	cmp	dword ptr [ebp-8],1
	je	label0004
	cmp	dword ptr [ebp-8],2
	je	label0005
	cmp	dword ptr [ebp-8],3
	je	label0006
	jmp	label0007
label0004:
label0005:
	mov	eax,-1
	mov	[ebp-12],eax
	jmp	label0008
label0006:
	mov	eax,0
	mov	[ebp-12],eax
	jmp	label0008
label0007:
	mov	eax,1
	mov	[ebp-12],eax
	jmp	label0008
label0003:
label0008:
; end of inline function test_case
	mov	eax,[ebp-12]
	cmp	eax,0
	je	label0000
	mov	eax,1
	add	esp,36
	pop	ebp
	ret
label0000:
; start of inline function test_case2
	mov	dword ptr [ebp-16],3
	mov	eax,[ebp-16]
	mov	[ebp-20],eax
	cmp	dword ptr [ebp-20],0
	je	label000a
	cmp	dword ptr [ebp-20],1
	je	label000b
	cmp	dword ptr [ebp-20],2
	je	label000c
	cmp	dword ptr [ebp-20],3
	je	label000d
	jmp	label000e
label000a:
	mov	eax,-1
	mov	[ebp-24],eax
	jmp	label000f
label000b:
label000c:
label000d:
	mov	eax,0
	mov	[ebp-24],eax
	jmp	label000f
label000e:
	mov	eax,1
	mov	[ebp-24],eax
	jmp	label000f
label0009:
label000f:
; end of inline function test_case2
	mov	eax,[ebp-24]
	cmp	eax,0
	je	label0001
	mov	eax,1
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
	je	label0012
	jmp	label0013
label0011:
label0012:
	mov	eax,-1
	mov	[ebp-36],eax
	jmp	label0016
label0013:
label0014:
	mov	eax,0
	mov	[ebp-36],eax
	jmp	label0016
label0015:
	mov	eax,1
	mov	[ebp-36],eax
	jmp	label0016
label0010:
label0016:
; end of inline function test_default
	mov	eax,[ebp-36]
	cmp	eax,0
	je	label0002
	mov	eax,1
	add	esp,36
	pop	ebp
	ret
label0002:
	mov	eax,0
	add	esp,36
	pop	ebp
	ret
_test endp	

end
