
.686
.model flat
.xmm

.data

___unnamed_float_0	dd	03a83126fh
public	___unnamed_float_0
___unnamed_float_1	dd	040000000h
public	___unnamed_float_1
___unnamed_double_2	dq	04008000000000000h
public	___unnamed_double_2
___unnamed_double_3	dq	04014000000000000h
public	___unnamed_double_3
___unnamed_double_4	dq	0bff0000000000000h
public	___unnamed_double_4
___unnamed_double_5	dq	04018000000000000h
public	___unnamed_double_5
___unnamed_double_6	dq	03fe54fdf3b645a1dh
public	___unnamed_double_6
___unnamed_double_7	dq	04010000000000000h
public	___unnamed_double_7
___unnamed_double_8	dq	04008000000000000h
public	___unnamed_double_8
___unnamed_double_9	dq	04018000000000000h
public	___unnamed_double_9
___unnamed_float_10	dd	040400000h
public	___unnamed_float_10
___unnamed_double_11	dq	04000000000000000h
public	___unnamed_double_11

.code

_fabs proc
	create_stack_frame
	fldz
	fld	dword ptr [ebp+8]
	fucomip	st,st(1)
	fstp	st
	jb	label0000
	fld	dword ptr [ebp+8]
	fstp	dword ptr [ebp-4]
	jmp	label0001
label0000:
	fld	dword ptr [ebp+8]
	fldz
	fsubrp
	fstp	dword ptr [ebp-4]
label0001:
	set_retval	dword ptr [ebp-4]
	destroy_stack_frame
	ret
_fabs endp	

_eq proc
	create_stack_frame
	push_all
	fld	qword ptr [ebp+8]
	fsub	qword ptr [ebp+16]
	push_arg	sse1,4
	call	_fabs
	restore_stack	4
	pop_all
	read_retvalp
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	byte1
	movzx	dword4,byte1
	set_retval	dword4
	destroy_stack_frame
	ret
_eq endp	

_test proc
	create_stack_frame
	fld	dword ptr [___unnamed_float_1]
	fstp	dword ptr [ebp-4]
	fld	qword ptr [___unnamed_double_2]
	fstp	qword ptr [ebp-12]
	fld	dword ptr [ebp-4]
	fadd	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
	push_all
	fld	qword ptr [___unnamed_double_3]
	push_arg	sse5,8
	push_arg	dword ptr [ebp-20],8
	call	_eq
	restore_stack	16
	pop_all
	read_retval	dword10
	cmp	dword10,0
	jne	label0000
	mov	dword11,1
	set_retval	dword11
	destroy_stack_frame
	ret
label0000:
	fld	dword ptr [ebp-4]
	fsub	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
	push_all
	fld	qword ptr [___unnamed_double_4]
	push_arg	sse8,8
	push_arg	dword ptr [ebp-20],8
	call	_eq
	restore_stack	16
	pop_all
	read_retval	dword17
	cmp	dword17,0
	jne	label0001
	mov	dword18,2
	set_retval	dword18
	destroy_stack_frame
	ret
label0001:
	fld	dword ptr [ebp-4]
	fmul	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
	push_all
	fld	qword ptr [___unnamed_double_5]
	push_arg	sse11,8
	push_arg	dword ptr [ebp-20],8
	call	_eq
	restore_stack	16
	pop_all
	read_retval	dword24
	cmp	dword24,0
	jne	label0002
	mov	dword25,3
	set_retval	dword25
	destroy_stack_frame
	ret
label0002:
	fld	dword ptr [ebp-4]
	fdiv	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
	push_all
	fld	qword ptr [___unnamed_double_6]
	push_arg	sse14,8
	push_arg	dword ptr [ebp-20],8
	call	_eq
	restore_stack	16
	pop_all
	read_retval	dword31
	cmp	dword31,0
	jne	label0003
	mov	dword32,4
	set_retval	dword32
	destroy_stack_frame
	ret
label0003:
	fld	dword ptr [___unnamed_float_1]
	fld	dword ptr [ebp-4]
	faddp
	fstp	dword ptr [ebp-4]
	push_all
	fld	qword ptr [___unnamed_double_7]
	push_arg	sse16,8
	fld	dword ptr [ebp-4]
	push_arg	sse17,8
	call	_eq
	restore_stack	16
	pop_all
	read_retval	dword37
	cmp	dword37,0
	jne	label0004
	mov	dword38,5
	set_retval	dword38
	destroy_stack_frame
	ret
label0004:
	fld1
	fld	dword ptr [ebp-4]
	fsubrp
	fstp	dword ptr [ebp-4]
	push_all
	fld	qword ptr [___unnamed_double_8]
	push_arg	sse19,8
	fld	dword ptr [ebp-4]
	push_arg	sse20,8
	call	_eq
	restore_stack	16
	pop_all
	read_retval	dword42
	cmp	dword42,0
	jne	label0005
	mov	dword43,6
	set_retval	dword43
	destroy_stack_frame
	ret
label0005:
	fld	dword ptr [___unnamed_float_1]
	fld	dword ptr [ebp-4]
	fmulp
	fstp	dword ptr [ebp-4]
	push_all
	fld	qword ptr [___unnamed_double_9]
	push_arg	sse22,8
	fld	dword ptr [ebp-4]
	push_arg	sse23,8
	call	_eq
	restore_stack	16
	pop_all
	read_retval	dword48
	cmp	dword48,0
	jne	label0006
	mov	dword49,7
	set_retval	dword49
	destroy_stack_frame
	ret
label0006:
	fld	dword ptr [___unnamed_float_10]
	fld	dword ptr [ebp-4]
	fdivrp
	fstp	dword ptr [ebp-4]
	push_all
	fld	qword ptr [___unnamed_double_11]
	push_arg	sse25,8
	fld	dword ptr [ebp-4]
	push_arg	sse26,8
	call	_eq
	restore_stack	16
	pop_all
	read_retval	dword54
	cmp	dword54,0
	jne	label0007
	mov	dword55,8
	set_retval	dword55
	destroy_stack_frame
	ret
label0007:
	mov	dword56,0
	set_retval	dword56
	destroy_stack_frame
	ret
_test endp	

end
