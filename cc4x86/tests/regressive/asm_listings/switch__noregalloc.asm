
.686
.model flat
.xmm

.code

_test_case proc
	create_stack_frame
	mov	dword ptr [ebp-4],3
	mov	dword5,[ebp-4]
	mov	[ebp-8],dword5
	cmp	dword ptr [ebp-8],1
	je	label0001
	cmp	dword ptr [ebp-8],2
	je	label0001
	cmp	dword ptr [ebp-8],3
	je	label0003
	jmp	label0004
label0001:
	mov	dword12,-1
	set_retval	dword12
	destroy_stack_frame
	ret
label0003:
	mov	dword13,0
	set_retval	dword13
	destroy_stack_frame
	ret
label0004:
	mov	dword14,1
	set_retval	dword14
	destroy_stack_frame
	ret
	destroy_stack_frame
	ret
_test_case endp	

_test_case2 proc
	create_stack_frame
	mov	dword ptr [ebp-4],3
	mov	dword5,[ebp-4]
	mov	[ebp-8],dword5
	cmp	dword ptr [ebp-8],0
	je	label0001
	cmp	dword ptr [ebp-8],1
	je	label0002
	cmp	dword ptr [ebp-8],2
	je	label0002
	cmp	dword ptr [ebp-8],3
	je	label0002
	jmp	label0005
label0001:
	mov	dword14,-1
	set_retval	dword14
	destroy_stack_frame
	ret
label0002:
	mov	dword15,0
	set_retval	dword15
	destroy_stack_frame
	ret
label0005:
	mov	dword16,1
	set_retval	dword16
	destroy_stack_frame
	ret
	destroy_stack_frame
	ret
_test_case2 endp	

_test_default proc
	create_stack_frame
	mov	dword ptr [ebp-4],100
	mov	dword5,[ebp-4]
	mov	[ebp-8],dword5
	cmp	dword ptr [ebp-8],1
	je	label0001
	cmp	dword ptr [ebp-8],2
	je	label0001
	jmp	label0003
label0001:
	mov	dword14,-1
	set_retval	dword14
	destroy_stack_frame
	ret
label0003:
	mov	dword15,0
	set_retval	dword15
	destroy_stack_frame
	ret
	mov	dword16,1
	set_retval	dword16
	destroy_stack_frame
	ret
	destroy_stack_frame
	ret
_test_default endp	

_test proc
	create_stack_frame
	push_all
	call	_test_case
	pop_all
	read_retval	dword1
	cmp	dword1,0
	je	label0000
	mov	dword3,1
	set_retval	dword3
	destroy_stack_frame
	ret
label0000:
	push_all
	call	_test_case2
	pop_all
	read_retval	dword4
	cmp	dword4,0
	je	label0001
	mov	dword6,1
	set_retval	dword6
	destroy_stack_frame
	ret
label0001:
	push_all
	call	_test_default
	pop_all
	read_retval	dword7
	cmp	dword7,0
	je	label0002
	mov	dword9,1
	set_retval	dword9
	destroy_stack_frame
	ret
label0002:
	mov	dword10,0
	set_retval	dword10
	destroy_stack_frame
	ret
_test endp	

end
