
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
	sub	esp,40
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
	mov	dword ptr [ebp-32],3
	mov	edi,ebx
	mov	eax,edi
	sub	eax,[ebp-32]
	mov	[ebp-40],eax
; end of inline function g
	mov	eax,[ebp-40]
	mov	esi,eax
label0001:
	cmp	esi,-1
	jne	label0002
	mov	edi,0
	jmp	label0003
label0002:
	mov	edi,esi
label0003:
	mov	eax,edi
	pop	ebx
	pop	esi
	pop	edi
	add	esp,40
	pop	ebp
	ret
_test endp	

end
