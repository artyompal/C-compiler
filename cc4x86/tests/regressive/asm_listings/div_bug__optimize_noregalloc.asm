
.686
.model flat
.xmm

.code

_test proc
	create_stack_frame
	mov	dword21,2
	mov	dword ptr [ebp-12],1
	mov	dword23,4
	cdq	dword12
	idiv	dword23,dword21
	add	dword23,[ebp-12]
	lea	dword18,[dword23-3]
	set_retval	dword18
	destroy_stack_frame
	ret
_test endp	

end
