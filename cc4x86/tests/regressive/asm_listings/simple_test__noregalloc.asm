
.686
.model flat
.xmm

.code

_test proc
	create_stack_frame
	mov	dword ptr [ebp-4],2
	mov	dword ptr [ebp-8],2
	mov	dword7,[ebp-4]
	imul	dword7,[ebp-8]
	mov	[ebp-12],dword7
	cmp	dword ptr [ebp-12],4
	jne	label0000
	mov	dword11,0
	set_retval	dword11
	destroy_stack_frame
	ret
label0000:
	mov	dword12,1
	set_retval	dword12
	destroy_stack_frame
	ret
	destroy_stack_frame
	ret
_test endp	

end
