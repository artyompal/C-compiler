
.686
.model flat
.xmm

.code

_test proc
	create_stack_frame
	mov	dword ptr [ebp-4],0
label0000:
	mov	dword4,[ebp-4]
	inc	dword ptr [ebp-4]
	cmp	dword4,10
	jge	label0001
	jmp	label0000
label0001:
	cmp	dword ptr [ebp-4],11
	je	label0002
	mov	dword8,1
	set_retval	dword8
	destroy_stack_frame
	ret
label0002:
	mov	dword ptr [ebp-8],1
	mov	dword ptr [ebp-12],0
label0003:
	mov	dword15,[ebp-8]
	sal	dword15,1
	mov	[ebp-8],dword15
	inc	dword ptr [ebp-12]
	cmp	dword ptr [ebp-8],65536
	jl	label0003
	cmp	dword ptr [ebp-12],16
	je	label0006
	mov	dword21,1
	set_retval	dword21
	destroy_stack_frame
	ret
label0006:
	mov	dword22,0
	set_retval	dword22
	destroy_stack_frame
	ret
_test endp	

end
