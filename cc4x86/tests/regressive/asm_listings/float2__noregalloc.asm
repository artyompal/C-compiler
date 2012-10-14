
.686
.model flat
.xmm

.data

___unnamed_float_0	dd	040000000h
public	___unnamed_float_0
___unnamed_float_1	dd	040400000h
public	___unnamed_float_1
___unnamed_float_2	dd	040800000h
public	___unnamed_float_2

.code

_test1 proc
	create_stack_frame
	fld	dword ptr [ebp+8]
	fstp	dword ptr [ebp-4]
	fld	dword ptr [___unnamed_float_0]
	fld	dword ptr [ebp-4]
	faddp
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp-4]
	fstp	dword ptr [ebp+8]
	set_retval	dword ptr [ebp+8]
	destroy_stack_frame
	ret
_test1 endp	

_test2 proc
	create_stack_frame
	fld	dword ptr [___unnamed_float_0]
	fadd	dword ptr [ebp+8]
	set_retvalp
	destroy_stack_frame
	ret
_test2 endp	

_test proc
	create_stack_frame
	push_all
	fld1
	push_arg	sse1,4
	call	_test1
	restore_stack	4
	pop_all
	read_retvalp
	fld	dword ptr [___unnamed_float_1]
	fucomip	st,st(1)
	fstp	st
	je	label0000
	mov	dword2,1
	set_retval	dword2
	destroy_stack_frame
	ret
label0000:
	push_all
	fld	dword ptr [___unnamed_float_0]
	push_arg	sse4,4
	call	_test2
	restore_stack	4
	pop_all
	read_retvalp
	fld	dword ptr [___unnamed_float_2]
	fucomip	st,st(1)
	fstp	st
	je	label0001
	mov	dword5,2
	set_retval	dword5
	destroy_stack_frame
	ret
label0001:
	mov	dword6,0
	set_retval	dword6
	destroy_stack_frame
	ret
_test endp	

end
