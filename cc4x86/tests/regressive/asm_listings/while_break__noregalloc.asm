
.686
.model flat
.xmm

.code

_test proc
	create_stack_frame
	mov	dword ptr [ebp-4],0
label0000:
	cmp	dword ptr [ebp-4],10
	jge	label0001
	cmp	dword ptr [ebp-4],5
	jne	label0002
	jmp	label0001
label0002:
	inc	dword ptr [ebp-4]
	jmp	label0000
label0001:
	cmp	dword ptr [ebp-4],5
	je	label0003
	mov	dword10,1
	set_retval	dword10
	destroy_stack_frame
	ret
label0003:
	mov	dword ptr [ebp-8],0
	mov	dword ptr [ebp-12],0
label0004:
	cmp	dword ptr [ebp-8],50
	jne	label0007
	mov	dword19,[ebp-8]
	add	dword19,50
	mov	[ebp-8],dword19
	jmp	label0005
label0007:
	inc	dword ptr [ebp-8]
	inc	dword ptr [ebp-12]
label0005:
	cmp	dword ptr [ebp-8],100
	jl	label0004
	cmp	dword ptr [ebp-12],50
	je	label0008
	mov	dword26,1
	set_retval	dword26
	destroy_stack_frame
	ret
label0008:
	mov	dword27,0
	set_retval	dword27
	destroy_stack_frame
	ret
_test endp	

end
