
.686
.model flat

.data

___unnamed_string_0	db	100, 105, 118, 95, 98, 117, 103, 46, 99, 0
public	___unnamed_string_0
_test_name	dd	offset ___unnamed_string_0
public	_test_name

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,20
	push	edi
	push	esi
	mov	edi,2
	mov	dword ptr [ebp-12],1
	mov	eax,4
	cdq
	idiv	edi
	add	eax,[ebp-12]
	mov	esi,eax
	lea	eax,[esi-3]
	pop	esi
	pop	edi
	add	esp,20
	pop	ebp
	ret
_test endp	

end
