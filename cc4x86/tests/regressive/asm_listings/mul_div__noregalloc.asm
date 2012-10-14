
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
	xor_edx_edx	dword12
	div	dword11,[ebp-4]
	mov	dword15,[ebp-8]
	xor_edx_edx	dword16
	div	dword15,[ebp-4]
	mul	dword11,dword15
	mov	dword19,[ebp-16]
	xor_edx_edx	dword20
	div	dword19,[ebp-12]
	mov	dword23,[ebp-16]
	xor_edx_edx	dword24
	div	dword23,[ebp-12]
	mul	dword19,dword23
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
	xor_edx_edx	dword32
	div	dword31,[ebp-4]
	mov	[ebp-12],dword31
	cmp	dword ptr [ebp-12],2
	je	label0001
	mov	dword35,2
	set_retval	dword35
	destroy_stack_frame
	ret
label0001:
	mov	dword38,[ebp-16]
	xor_edx_edx	dword39
	div	dword38,[ebp-8]
	mov	[ebp-16],dword39
	cmp	dword ptr [ebp-16],2
	je	label0002
	mov	dword42,3
	set_retval	dword42
	destroy_stack_frame
	ret
label0002:
	mov	dword45,[ebp-4]
	mul	dword45,[ebp-8]
	mov	[ebp-12],dword45
	cmp	dword ptr [ebp-12],6
	je	label0003
	mov	dword49,4
	set_retval	dword49
	destroy_stack_frame
	ret
label0003:
	mov	dword52,[ebp-4]
	mov	[ebp-16],dword52
	mov	dword55,[ebp-16]
	mul	dword55,[ebp-8]
	mov	[ebp-16],dword55
	cmp	dword ptr [ebp-16],6
	je	label0004
	mov	dword58,5
	set_retval	dword58
	destroy_stack_frame
	ret
label0004:
	mov	dword ptr [ebp-4],65536
	mov	dword ptr [ebp-8],65536
	mov	dword65,[ebp-4]
	mul	dword65,[ebp-8]
	cmp	dword65,0
	je	label0005
	mov	dword67,6
	set_retval	dword67
	destroy_stack_frame
	ret
label0005:
	mov	dword ptr [ebp-4],2
	mov	dword ptr [ebp-8],3
	mov	dword ptr [ebp-12],4
	mov	dword ptr [ebp-16],5
	mov	dword78,[ebp-8]
	xor_edx_edx	dword79
	div	dword78,[ebp-4]
	mov	dword82,[ebp-12]
	xor_edx_edx	dword83
	div	dword82,[ebp-4]
	mul	dword78,dword82
	mov	[ebp-20],dword78
	cmp	dword ptr [ebp-20],2
	je	label0006
	mov	dword87,7
	set_retval	dword87
	destroy_stack_frame
	ret
label0006:
	mov	dword88,0
	set_retval	dword88
	destroy_stack_frame
	ret
_test endp	

end
