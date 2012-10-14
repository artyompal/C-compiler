
.686
.model flat
.xmm

.code

_test proc
	create_stack_frame
	mov	dword ptr [ebp-4],4
	mov	dword ptr [ebp-8],2
	mov	dword ptr [ebp-12],1
	lea	dword8,[ebp-12]
	mov	[ebp-16],dword8
	mov	dword11,[ebp-4]
	cdq	dword12
	idiv	dword11,[ebp-8]
	mov	dword14,[ebp-16]
	add	dword11,[dword14]
	mov	[ebp-20],dword11
	mov	dword18,[ebp-20]
	sub	dword18,3
	set_retval	dword18
	destroy_stack_frame
	ret
_test endp	

end
