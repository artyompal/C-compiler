
.686
.model flat
.xmm

.data

___unnamed_float_0	dd	040000000h
public	___unnamed_float_0
___unnamed_float_1	dd	03f800000h
public	___unnamed_float_1
___unnamed_float_2	dd	040400000h
public	___unnamed_float_2
___unnamed_float_3	dd	040800000h
public	___unnamed_float_3

.code

_test proc
	create_stack_frame
; start of inline function test1
	movss	sse17,dword ptr [___unnamed_float_1]
	movss	sse18,sse17
	addss	sse18,dword ptr [___unnamed_float_0]
	movss	sse17,sse18
	movss	sse19,sse17
; end of inline function test1
	movss	sse2,sse19
	comiss	sse2,dword ptr [___unnamed_float_2]
	je	label0000
	mov	dword3,1
	set_retval	dword3
	destroy_stack_frame
	ret
label0000:
; start of inline function test2
	movss	sse20,dword ptr [___unnamed_float_0]
	movss	sse21,sse20
	addss	sse21,dword ptr [___unnamed_float_0]
; end of inline function test2
	movss	sse5,sse21
	comiss	sse5,dword ptr [___unnamed_float_3]
	je	label0001
	mov	dword6,2
	set_retval	dword6
	destroy_stack_frame
	ret
label0001:
	mov	dword7,0
	set_retval	dword7
	destroy_stack_frame
	ret
_test endp	

end
