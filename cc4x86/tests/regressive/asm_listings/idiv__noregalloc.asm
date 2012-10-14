
.686
.model flat
.xmm

.code

_test proc
	create_stack_frame
	mov	dword ptr [ebp-4],2
	mov	dword ptr [ebp-8],3
	mov	dword ptr [ebp-12],4
	mov	dword ptr [ebp-16],5
	mov	dword11,[ebp-8]
	cdq	dword12
	idiv	dword11,[ebp-4]
	mov	dword15,[ebp-8]
	cdq	dword16
	idiv	dword15,[ebp-4]
	imul	dword11,dword15
	mov	dword19,[ebp-16]
	cdq	dword20
	idiv	dword19,[ebp-12]
	mov	dword23,[ebp-16]
	cdq	dword24
	idiv	dword23,[ebp-12]
	imul	dword19,dword23
	add	dword11,dword19
	mov	[ebp-20],dword11
	cmp	dword ptr [ebp-20],2
	je	label0000
	mov	dword28,1
	set_retval	dword28
	destroy_stack_frame
	ret
label0000:
	mov	dword31,[ebp-12]
	cdq	dword32
	idiv	dword31,[ebp-4]
	mov	[ebp-12],dword31
	cmp	dword ptr [ebp-12],2
	je	label0001
	mov	dword35,2
	set_retval	dword35
	destroy_stack_frame
	ret
label0001:
	mov	dword38,[ebp-16]
	cdq	dword39
	idiv	dword38,[ebp-8]
	mov	[ebp-16],dword39
	cmp	dword ptr [ebp-16],2
	je	label0002
	mov	dword42,3
	set_retval	dword42
	destroy_stack_frame
	ret
label0002:
	mov	dword43,0
	set_retval	dword43
	destroy_stack_frame
	ret
_test endp	

end
