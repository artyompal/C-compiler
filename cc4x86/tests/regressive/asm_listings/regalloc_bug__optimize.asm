
.686
.model flat
.xmm

.code

_f proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	mov	edi,[ebp+12]
	mov	esi,[ebp+8]
	add	esi,edi
	mov	eax,esi
	pop	esi
	pop	edi
	pop	ebp
	ret
_f endp	

_g proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	mov	edi,[ebp+12]
	mov	esi,[ebp+8]
	sub	esi,edi
	mov	eax,esi
	pop	esi
	pop	edi
	pop	ebp
	ret
_g endp	

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,44
	push	edi
	push	esi
	mov	edi,2
	cmp	edi,3
	mov	[ebp-40],edi
	jle	label0000
; start of inline function f
	mov	esi,[ebp-40]
	mov	edi,esi
	lea	edi,[edi+3]
; end of inline function f
	mov	[ebp-44],edi
	jmp	label0001
label0000:
; start of inline function g
	lea	edi,[esi-3]
; end of inline function g
	mov	edi,[ebp-44]
	mov	[ebp-44],edi
label0001:
	mov	eax,1
	add	eax,edi
	pop	esi
	pop	edi
	add	esp,44
	pop	ebp
	ret
_test endp	

end
