
.686
.model flat
.xmm

.code

_f proc
	create_stack_frame
	mov	dword3,[ebp+8]
	add	dword3,[ebp+12]
	set_retval	dword3
	destroy_stack_frame
	ret
_f endp	

_g proc
	create_stack_frame
	mov	dword3,[ebp+8]
	sub	dword3,[ebp+12]
	set_retval	dword3
	destroy_stack_frame
	ret
_g endp	

_test proc
	create_stack_frame
	mov	dword ptr [ebp-4],2
	mov	dword ptr [ebp-8],3
	mov	dword7,[ebp-4]
	cmp	dword7,[ebp-8]
	jle	label0000
	push_all
	push_arg	dword ptr [ebp-8],4
	push_arg	dword ptr [ebp-4],4
	call	_f
	restore_stack	8
	pop_all
	read_retval	dword10
	mov	[ebp-12],dword10
	jmp	label0001
label0000:
	push_all
	push_arg	dword ptr [ebp-8],4
	push_arg	dword ptr [ebp-4],4
	call	_g
	restore_stack	8
	pop_all
	read_retval	dword14
	mov	[ebp-12],dword14
label0001:
	mov	dword17,1
	add	dword17,[ebp-12]
	set_retval	dword17
	destroy_stack_frame
	ret
_test endp	

end
