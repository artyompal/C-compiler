
.686
.model flat
.xmm

.code

_test proc
	create_stack_frame
	mov	dword ptr [ebp-4],-16
	mov	dword ptr [ebp-8],-16
	mov	dword7,[ebp-4]
	sar	dword7,4
	cmp	dword7,-1
	je	label0000
	mov	dword9,1
	set_retval	dword9
	destroy_stack_frame
	ret
label0000:
	mov	dword12,[ebp-8]
	shr	dword12,4
	cmp	dword12,268435455
	je	label0001
	mov	dword14,2
	set_retval	dword14
	destroy_stack_frame
	ret
label0001:
	mov	dword ptr [ebp-4],1073741824
	mov	dword ptr [ebp-8],1073741824
	mov	dword21,[ebp-4]
	sal	dword21,1
	cmp	dword21,0
	jl	label0002
	mov	dword23,3
	set_retval	dword23
	destroy_stack_frame
	ret
label0002:
	mov	dword26,[ebp-8]
	shl	dword26,1
	cmp	dword26,-2147483648
	je	label0003
	mov	dword28,4
	set_retval	dword28
	destroy_stack_frame
	ret
label0003:
	mov	dword ptr [ebp-4],1
	mov	dword ptr [ebp-8],1
	mov	dword34,3
	add	dword34,[ebp-8]
	mov	dword36,[ebp-4]
	shl	dword36,dword34
	cmp	dword36,16
	je	label0004
	mov	dword38,5
	set_retval	dword38
	destroy_stack_frame
	ret
label0004:
	mov	dword40,5
	add	dword40,[ebp-8]
	mov	dword42,[ebp-4]
	sal	dword42,dword40
	mov	[ebp-4],dword42
	cmp	dword ptr [ebp-4],64
	je	label0005
	mov	dword45,6
	set_retval	dword45
	destroy_stack_frame
	ret
label0005:
	mov	dword46,0
	set_retval	dword46
	destroy_stack_frame
	ret
_test endp	

end
