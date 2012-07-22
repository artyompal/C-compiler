
.686
.model flat
.xmm

.code

_f proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	add	eax,[ebp+12]
	pop	ebp
	ret
_f endp	

_g proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	sub	eax,[ebp+12]
	pop	ebp
	ret
_g endp	

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,36
	push	edi
	push	esi
	push	ebx
	mov	edi,2
	cmp	edi,3
	jle	label0000
; start of inline function f
	mov	esi,edi
	lea	edi,[esi+3]
; end of inline function f
	mov	esi,edi
	jmp	label0001
label0000:
; start of inline function g
	mov	dword ptr [ebp-28],3
	mov	edi,ebx
	mov	eax,edi
	sub	eax,[ebp-28]
	mov	[ebp-36],eax
; end of inline function g
	mov	eax,[ebp-36]
	mov	esi,eax
label0001:
	mov	eax,1
	add	eax,esi
	pop	ebx
	pop	esi
	pop	edi
	add	esp,36
	pop	ebp
	ret
_test endp	

end
