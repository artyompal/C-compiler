
.686
.model flat

.data

__dbgprintf	dd	?
public	__dbgprintf
__width	dd	?
public	__width
__height	dd	?
public	__height
__pitch	dd	?
public	__pitch
__color	dd	?
public	__color
__videomem	dd	?
public	__videomem
__mvproj_matrix	db	 64 dup (?)
public	__mvproj_matrix
__viewport_matrix	db	 64 dup (?)
public	__viewport_matrix
__clip_z_near_base	db	 16 dup (?)
public	__clip_z_near_base
__clip_z_near_norm	db	 16 dup (?)
public	__clip_z_near_norm
__clip_z_far_base	db	 16 dup (?)
public	__clip_z_far_base
__clip_z_far_norm	db	 16 dup (?)
public	__clip_z_far_norm
__clip_plane_left_base	db	 16 dup (?)
public	__clip_plane_left_base
__clip_plane_left_norm	db	 16 dup (?)
public	__clip_plane_left_norm
__clip_plane_right_base	db	 16 dup (?)
public	__clip_plane_right_base
__clip_plane_right_norm	db	 16 dup (?)
public	__clip_plane_right_norm
__clip_plane_top_base	db	 16 dup (?)
public	__clip_plane_top_base
__clip_plane_top_norm	db	 16 dup (?)
public	__clip_plane_top_norm
__clip_plane_bottom_base	db	 16 dup (?)
public	__clip_plane_bottom_base
__clip_plane_bottom_norm	db	 16 dup (?)
public	__clip_plane_bottom_norm
__texture_data	dd	?
public	__texture_data
__texture_width	dd	?
public	__texture_width
__texture_height	dd	?
public	__texture_height

.code

_vec2f_add proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	mov	dword4,[dword3]
	lea	dword5,[ebp+16]
	mov	dword6,[dword5]
	fld	dword ptr [dword4]
	fadd	dword ptr [dword6]
	fstp	dword ptr [dword2]
	lea	dword7,[ebp+8]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+12]
	mov	dword10,4
	add	dword10,[dword9]
	lea	dword11,[ebp+16]
	mov	dword12,4
	add	dword12,[dword11]
	fld	dword ptr [dword10]
	fadd	dword ptr [dword12]
	fstp	dword ptr [dword8]
	destroy_stack_frame	0
	ret
_vec2f_add endp	

_vec2f_subtract proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	mov	dword4,[dword3]
	lea	dword5,[ebp+16]
	mov	dword6,[dword5]
	fld	dword ptr [dword4]
	fsub	dword ptr [dword6]
	fstp	dword ptr [dword2]
	lea	dword7,[ebp+8]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+12]
	mov	dword10,4
	add	dword10,[dword9]
	lea	dword11,[ebp+16]
	mov	dword12,4
	add	dword12,[dword11]
	fld	dword ptr [dword10]
	fsub	dword ptr [dword12]
	fstp	dword ptr [dword8]
	destroy_stack_frame	0
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	fld	dword ptr [dword2]
	fmul	dword ptr [dword3]
	fstp	dword ptr [dword2]
	lea	dword4,[ebp+8]
	mov	dword5,4
	add	dword5,[dword4]
	lea	dword6,[ebp+12]
	fld	dword ptr [dword5]
	fmul	dword ptr [dword6]
	fstp	dword ptr [dword5]
	destroy_stack_frame	0
	ret
_vec2f_mul endp	

_vec4f_assign proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	fld	dword ptr [dword3]
	fstp	dword ptr [dword2]
	lea	dword4,[ebp+8]
	mov	dword5,4
	add	dword5,[dword4]
	lea	dword6,[ebp+16]
	fld	dword ptr [dword6]
	fstp	dword ptr [dword5]
	lea	dword7,[ebp+8]
	mov	dword8,8
	add	dword8,[dword7]
	lea	dword9,[ebp+20]
	fld	dword ptr [dword9]
	fstp	dword ptr [dword8]
	lea	dword10,[ebp+8]
	mov	dword11,12
	add	dword11,[dword10]
	lea	dword12,[ebp+24]
	fld	dword ptr [dword12]
	fstp	dword ptr [dword11]
	destroy_stack_frame	0
	ret
_vec4f_assign endp	

_vec4f_add proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	mov	dword4,[dword3]
	lea	dword5,[ebp+16]
	mov	dword6,[dword5]
	fld	dword ptr [dword4]
	fadd	dword ptr [dword6]
	fstp	dword ptr [dword2]
	lea	dword7,[ebp+8]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+12]
	mov	dword10,4
	add	dword10,[dword9]
	lea	dword11,[ebp+16]
	mov	dword12,4
	add	dword12,[dword11]
	fld	dword ptr [dword10]
	fadd	dword ptr [dword12]
	fstp	dword ptr [dword8]
	lea	dword13,[ebp+8]
	mov	dword14,8
	add	dword14,[dword13]
	lea	dword15,[ebp+12]
	mov	dword16,8
	add	dword16,[dword15]
	lea	dword17,[ebp+16]
	mov	dword18,8
	add	dword18,[dword17]
	fld	dword ptr [dword16]
	fadd	dword ptr [dword18]
	fstp	dword ptr [dword14]
	lea	dword19,[ebp+8]
	mov	dword20,12
	add	dword20,[dword19]
	lea	dword21,[ebp+12]
	mov	dword22,12
	add	dword22,[dword21]
	lea	dword23,[ebp+16]
	mov	dword24,12
	add	dword24,[dword23]
	fld	dword ptr [dword22]
	fadd	dword ptr [dword24]
	fstp	dword ptr [dword20]
	destroy_stack_frame	0
	ret
_vec4f_add endp	

_vec4f_subtract proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	mov	dword4,[dword3]
	lea	dword5,[ebp+16]
	mov	dword6,[dword5]
	fld	dword ptr [dword4]
	fsub	dword ptr [dword6]
	fstp	dword ptr [dword2]
	lea	dword7,[ebp+8]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+12]
	mov	dword10,4
	add	dword10,[dword9]
	lea	dword11,[ebp+16]
	mov	dword12,4
	add	dword12,[dword11]
	fld	dword ptr [dword10]
	fsub	dword ptr [dword12]
	fstp	dword ptr [dword8]
	lea	dword13,[ebp+8]
	mov	dword14,8
	add	dword14,[dword13]
	lea	dword15,[ebp+12]
	mov	dword16,8
	add	dword16,[dword15]
	lea	dword17,[ebp+16]
	mov	dword18,8
	add	dword18,[dword17]
	fld	dword ptr [dword16]
	fsub	dword ptr [dword18]
	fstp	dword ptr [dword14]
	lea	dword19,[ebp+8]
	mov	dword20,12
	add	dword20,[dword19]
	lea	dword21,[ebp+12]
	mov	dword22,12
	add	dword22,[dword21]
	lea	dword23,[ebp+16]
	mov	dword24,12
	add	dword24,[dword23]
	fld	dword ptr [dword22]
	fsub	dword ptr [dword24]
	fstp	dword ptr [dword20]
	destroy_stack_frame	0
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	mov	dword4,[dword3]
	fld	dword ptr [dword2]
	fmul	dword ptr [dword4]
	lea	dword5,[ebp+8]
	mov	dword6,4
	add	dword6,[dword5]
	lea	dword7,[ebp+12]
	mov	dword8,4
	add	dword8,[dword7]
	fld	dword ptr [dword6]
	fmul	dword ptr [dword8]
	faddp
	lea	dword9,[ebp+8]
	mov	dword10,8
	add	dword10,[dword9]
	lea	dword11,[ebp+12]
	mov	dword12,8
	add	dword12,[dword11]
	fld	dword ptr [dword10]
	fmul	dword ptr [dword12]
	faddp
	lea	dword13,[ebp+8]
	mov	dword14,12
	add	dword14,[dword13]
	lea	dword15,[ebp+12]
	mov	dword16,12
	add	dword16,[dword15]
	fld	dword ptr [dword14]
	fmul	dword ptr [dword16]
	faddp
	destroy_stack_frame	0
	ret
_vec4f_dot endp	

_vec4f_mul proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	fld	dword ptr [dword2]
	fmul	dword ptr [dword3]
	fstp	dword ptr [dword2]
	lea	dword4,[ebp+8]
	mov	dword5,4
	add	dword5,[dword4]
	lea	dword6,[ebp+12]
	fld	dword ptr [dword5]
	fmul	dword ptr [dword6]
	fstp	dword ptr [dword5]
	lea	dword7,[ebp+8]
	mov	dword8,8
	add	dword8,[dword7]
	lea	dword9,[ebp+12]
	fld	dword ptr [dword8]
	fmul	dword ptr [dword9]
	fstp	dword ptr [dword8]
	lea	dword10,[ebp+8]
	mov	dword11,12
	add	dword11,[dword10]
	lea	dword12,[ebp+12]
	fld	dword ptr [dword11]
	fmul	dword ptr [dword12]
	fstp	dword ptr [dword11]
	destroy_stack_frame	0
	ret
_vec4f_mul endp	

.data

___unnamed_float_0	dd	0.000100
public	___unnamed_float_0

.code

_vec4f_is_equal proc
	create_stack_frame	20
	push_all
	lea	dword1,[ebp+12]
	push_arg	dword ptr [dword1]
	lea	dword2,[ebp+8]
	push_arg	dword ptr [dword2]
	lea	dword3,[ebp-16]
	push_arg	dword3
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	lea	dword4,[ebp-20]
	push_all
	lea	dword5,[ebp-16]
	push_arg	dword5
	lea	dword6,[ebp-16]
	push_arg	dword6
	call	_vec4f_dot
	restore_stack	8
	pop_all
	fstp	dword ptr [dword4]
	lea	dword7,[ebp-20]
	lea	dword8,[___unnamed_float_0]
	fld	qword ptr [dword8]
	fld	qword ptr [dword7]
	fucomip	st,st(1)
	fstp	st
	setb	byte1
	movzx	dword9,byte1
	mov	eax,dword9
	destroy_stack_frame	20
	ret
_vec4f_is_equal endp	

_matrix4f_make_identity proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	fld1
	fstp	dword ptr [dword2]
	lea	dword3,[ebp+8]
	mov	dword4,4
	add	dword4,[dword3]
	fldz
	fstp	dword ptr [dword4]
	lea	dword5,[ebp+8]
	mov	dword6,8
	add	dword6,[dword5]
	fldz
	fstp	dword ptr [dword6]
	lea	dword7,[ebp+8]
	mov	dword8,12
	add	dword8,[dword7]
	fldz
	fstp	dword ptr [dword8]
	lea	dword9,[ebp+8]
	mov	dword10,16
	add	dword10,[dword9]
	fldz
	fstp	dword ptr [dword10]
	lea	dword11,[ebp+8]
	mov	dword12,20
	add	dword12,[dword11]
	fld1
	fstp	dword ptr [dword12]
	lea	dword13,[ebp+8]
	mov	dword14,24
	add	dword14,[dword13]
	fldz
	fstp	dword ptr [dword14]
	lea	dword15,[ebp+8]
	mov	dword16,28
	add	dword16,[dword15]
	fldz
	fstp	dword ptr [dword16]
	lea	dword17,[ebp+8]
	mov	dword18,32
	add	dword18,[dword17]
	fldz
	fstp	dword ptr [dword18]
	lea	dword19,[ebp+8]
	mov	dword20,36
	add	dword20,[dword19]
	fldz
	fstp	dword ptr [dword20]
	lea	dword21,[ebp+8]
	mov	dword22,40
	add	dword22,[dword21]
	fld1
	fstp	dword ptr [dword22]
	lea	dword23,[ebp+8]
	mov	dword24,44
	add	dword24,[dword23]
	fldz
	fstp	dword ptr [dword24]
	lea	dword25,[ebp+8]
	mov	dword26,48
	add	dword26,[dword25]
	fldz
	fstp	dword ptr [dword26]
	lea	dword27,[ebp+8]
	mov	dword28,52
	add	dword28,[dword27]
	fldz
	fstp	dword ptr [dword28]
	lea	dword29,[ebp+8]
	mov	dword30,56
	add	dword30,[dword29]
	fldz
	fstp	dword ptr [dword30]
	lea	dword31,[ebp+8]
	mov	dword32,60
	add	dword32,[dword31]
	fld1
	fstp	dword ptr [dword32]
	destroy_stack_frame	0
	ret
_matrix4f_make_identity endp	

_matrix4f_make_perspective proc
	create_stack_frame	8
	lea	dword1,[ebp-4]
	lea	dword2,[ebp+20]
	lea	dword3,[ebp+12]
	fld	dword ptr [dword2]
	fmul	dword ptr [dword3]
	fstp	dword ptr [dword1]
	lea	dword4,[ebp-8]
	lea	dword5,[ebp-4]
	lea	dword6,[ebp+24]
	fld	dword ptr [dword5]
	fmul	dword ptr [dword6]
	fstp	dword ptr [dword4]
	lea	dword7,[ebp+8]
	mov	dword8,[dword7]
	lea	dword9,[ebp+12]
	lea	dword10,[ebp-8]
	fld	dword ptr [dword9]
	fdiv	dword ptr [dword10]
	fstp	dword ptr [dword8]
	lea	dword11,[ebp+8]
	mov	dword12,4
	add	dword12,[dword11]
	fldz
	fstp	dword ptr [dword12]
	lea	dword13,[ebp+8]
	mov	dword14,8
	add	dword14,[dword13]
	fldz
	fstp	dword ptr [dword14]
	lea	dword15,[ebp+8]
	mov	dword16,12
	add	dword16,[dword15]
	fldz
	fstp	dword ptr [dword16]
	lea	dword17,[ebp+8]
	mov	dword18,16
	add	dword18,[dword17]
	fldz
	fstp	dword ptr [dword18]
	lea	dword19,[ebp+8]
	mov	dword20,20
	add	dword20,[dword19]
	lea	dword21,[ebp+12]
	lea	dword22,[ebp-4]
	fld	dword ptr [dword21]
	fdiv	dword ptr [dword22]
	fstp	dword ptr [dword20]
	lea	dword23,[ebp+8]
	mov	dword24,24
	add	dword24,[dword23]
	fldz
	fstp	dword ptr [dword24]
	lea	dword25,[ebp+8]
	mov	dword26,28
	add	dword26,[dword25]
	fldz
	fstp	dword ptr [dword26]
	lea	dword27,[ebp+8]
	mov	dword28,32
	add	dword28,[dword27]
	fldz
	fstp	dword ptr [dword28]
	lea	dword29,[ebp+8]
	mov	dword30,36
	add	dword30,[dword29]
	fldz
	fstp	dword ptr [dword30]
	lea	dword31,[ebp+8]
	mov	dword32,40
	add	dword32,[dword31]
	lea	dword33,[ebp+16]
	lea	dword34,[ebp+16]
	lea	dword35,[ebp+12]
	fld	dword ptr [dword34]
	fsub	dword ptr [dword35]
	fdivr	dword ptr [dword33]
	fstp	dword ptr [dword32]
	lea	dword36,[ebp+8]
	mov	dword37,44
	add	dword37,[dword36]
	fld1
	fstp	dword ptr [dword37]
	lea	dword38,[ebp+8]
	mov	dword39,48
	add	dword39,[dword38]
	fldz
	fstp	dword ptr [dword39]
	lea	dword40,[ebp+8]
	mov	dword41,52
	add	dword41,[dword40]
	fldz
	fstp	dword ptr [dword41]
	lea	dword42,[ebp+8]
	mov	dword43,56
	add	dword43,[dword42]
	lea	dword44,[ebp+12]
	lea	dword45,[ebp+16]
	fld	dword ptr [dword44]
	fmul	dword ptr [dword45]
	lea	dword46,[ebp+12]
	lea	dword47,[ebp+16]
	fld	dword ptr [dword46]
	fsub	dword ptr [dword47]
	fdivp
	fstp	dword ptr [dword43]
	lea	dword48,[ebp+8]
	mov	dword49,60
	add	dword49,[dword48]
	fldz
	fstp	dword ptr [dword49]
	destroy_stack_frame	8
	ret
_matrix4f_make_perspective endp	

.data

___unnamed_float_1	dd	2.000000
public	___unnamed_float_1

.code

_matrix4f_make_viewport proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	lea	dword4,[___unnamed_float_1]
	fld	dword ptr [dword4]
	fdivr	dword ptr [dword3]
	fstp	dword ptr [dword2]
	lea	dword5,[ebp+8]
	mov	dword6,4
	add	dword6,[dword5]
	fldz
	fstp	dword ptr [dword6]
	lea	dword7,[ebp+8]
	mov	dword8,8
	add	dword8,[dword7]
	fldz
	fstp	dword ptr [dword8]
	lea	dword9,[ebp+8]
	mov	dword10,12
	add	dword10,[dword9]
	fldz
	fstp	dword ptr [dword10]
	lea	dword11,[ebp+8]
	mov	dword12,16
	add	dword12,[dword11]
	fldz
	fstp	dword ptr [dword12]
	lea	dword13,[ebp+8]
	mov	dword14,20
	add	dword14,[dword13]
	lea	dword15,[ebp+16]
	fld	dword ptr [dword15]
	fldz
	fsubrp
	lea	dword16,[___unnamed_float_1]
	fld	dword ptr [dword16]
	fdivp
	fstp	dword ptr [dword14]
	lea	dword17,[ebp+8]
	mov	dword18,24
	add	dword18,[dword17]
	fldz
	fstp	dword ptr [dword18]
	lea	dword19,[ebp+8]
	mov	dword20,28
	add	dword20,[dword19]
	fldz
	fstp	dword ptr [dword20]
	lea	dword21,[ebp+8]
	mov	dword22,32
	add	dword22,[dword21]
	fldz
	fstp	dword ptr [dword22]
	lea	dword23,[ebp+8]
	mov	dword24,36
	add	dword24,[dword23]
	fldz
	fstp	dword ptr [dword24]
	lea	dword25,[ebp+8]
	mov	dword26,40
	add	dword26,[dword25]
	lea	dword27,[ebp+24]
	lea	dword28,[ebp+20]
	fld	dword ptr [dword27]
	fsub	dword ptr [dword28]
	fstp	dword ptr [dword26]
	lea	dword29,[ebp+8]
	mov	dword30,44
	add	dword30,[dword29]
	fldz
	fstp	dword ptr [dword30]
	lea	dword31,[ebp+8]
	mov	dword32,48
	add	dword32,[dword31]
	lea	dword33,[ebp+12]
	lea	dword34,[___unnamed_float_1]
	fld	dword ptr [dword34]
	fdivr	dword ptr [dword33]
	fstp	dword ptr [dword32]
	lea	dword35,[ebp+8]
	mov	dword36,52
	add	dword36,[dword35]
	lea	dword37,[ebp+16]
	lea	dword38,[___unnamed_float_1]
	fld	dword ptr [dword38]
	fdivr	dword ptr [dword37]
	fstp	dword ptr [dword36]
	lea	dword39,[ebp+8]
	mov	dword40,56
	add	dword40,[dword39]
	lea	dword41,[ebp+20]
	fld	dword ptr [dword41]
	fstp	dword ptr [dword40]
	lea	dword42,[ebp+8]
	mov	dword43,60
	add	dword43,[dword42]
	fld1
	fstp	dword ptr [dword43]
	destroy_stack_frame	0
	ret
_matrix4f_make_viewport endp	

_matrix4f_mul proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	mov	dword4,[dword3]
	lea	dword5,[ebp+16]
	mov	dword6,[dword5]
	fld	dword ptr [dword4]
	fmul	dword ptr [dword6]
	lea	dword7,[ebp+12]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+16]
	mov	dword10,16
	add	dword10,[dword9]
	fld	dword ptr [dword8]
	fmul	dword ptr [dword10]
	faddp
	lea	dword11,[ebp+12]
	mov	dword12,8
	add	dword12,[dword11]
	lea	dword13,[ebp+16]
	mov	dword14,32
	add	dword14,[dword13]
	fld	dword ptr [dword12]
	fmul	dword ptr [dword14]
	faddp
	lea	dword15,[ebp+12]
	mov	dword16,12
	add	dword16,[dword15]
	lea	dword17,[ebp+16]
	mov	dword18,48
	add	dword18,[dword17]
	fld	dword ptr [dword16]
	fmul	dword ptr [dword18]
	faddp
	fstp	dword ptr [dword2]
	lea	dword19,[ebp+8]
	mov	dword20,4
	add	dword20,[dword19]
	lea	dword21,[ebp+12]
	mov	dword22,[dword21]
	lea	dword23,[ebp+16]
	mov	dword24,4
	add	dword24,[dword23]
	fld	dword ptr [dword22]
	fmul	dword ptr [dword24]
	lea	dword25,[ebp+12]
	mov	dword26,4
	add	dword26,[dword25]
	lea	dword27,[ebp+16]
	mov	dword28,20
	add	dword28,[dword27]
	fld	dword ptr [dword26]
	fmul	dword ptr [dword28]
	faddp
	lea	dword29,[ebp+12]
	mov	dword30,8
	add	dword30,[dword29]
	lea	dword31,[ebp+16]
	mov	dword32,36
	add	dword32,[dword31]
	fld	dword ptr [dword30]
	fmul	dword ptr [dword32]
	faddp
	lea	dword33,[ebp+12]
	mov	dword34,12
	add	dword34,[dword33]
	lea	dword35,[ebp+16]
	mov	dword36,52
	add	dword36,[dword35]
	fld	dword ptr [dword34]
	fmul	dword ptr [dword36]
	faddp
	fstp	dword ptr [dword20]
	lea	dword37,[ebp+8]
	mov	dword38,8
	add	dword38,[dword37]
	lea	dword39,[ebp+12]
	mov	dword40,[dword39]
	lea	dword41,[ebp+16]
	mov	dword42,8
	add	dword42,[dword41]
	fld	dword ptr [dword40]
	fmul	dword ptr [dword42]
	lea	dword43,[ebp+12]
	mov	dword44,4
	add	dword44,[dword43]
	lea	dword45,[ebp+16]
	mov	dword46,24
	add	dword46,[dword45]
	fld	dword ptr [dword44]
	fmul	dword ptr [dword46]
	faddp
	lea	dword47,[ebp+12]
	mov	dword48,8
	add	dword48,[dword47]
	lea	dword49,[ebp+16]
	mov	dword50,40
	add	dword50,[dword49]
	fld	dword ptr [dword48]
	fmul	dword ptr [dword50]
	faddp
	lea	dword51,[ebp+12]
	mov	dword52,12
	add	dword52,[dword51]
	lea	dword53,[ebp+16]
	mov	dword54,56
	add	dword54,[dword53]
	fld	dword ptr [dword52]
	fmul	dword ptr [dword54]
	faddp
	fstp	dword ptr [dword38]
	lea	dword55,[ebp+8]
	mov	dword56,12
	add	dword56,[dword55]
	lea	dword57,[ebp+12]
	mov	dword58,[dword57]
	lea	dword59,[ebp+16]
	mov	dword60,12
	add	dword60,[dword59]
	fld	dword ptr [dword58]
	fmul	dword ptr [dword60]
	lea	dword61,[ebp+12]
	mov	dword62,4
	add	dword62,[dword61]
	lea	dword63,[ebp+16]
	mov	dword64,28
	add	dword64,[dword63]
	fld	dword ptr [dword62]
	fmul	dword ptr [dword64]
	faddp
	lea	dword65,[ebp+12]
	mov	dword66,8
	add	dword66,[dword65]
	lea	dword67,[ebp+16]
	mov	dword68,44
	add	dword68,[dword67]
	fld	dword ptr [dword66]
	fmul	dword ptr [dword68]
	faddp
	lea	dword69,[ebp+12]
	mov	dword70,12
	add	dword70,[dword69]
	lea	dword71,[ebp+16]
	mov	dword72,60
	add	dword72,[dword71]
	fld	dword ptr [dword70]
	fmul	dword ptr [dword72]
	faddp
	fstp	dword ptr [dword56]
	lea	dword73,[ebp+8]
	mov	dword74,16
	add	dword74,[dword73]
	lea	dword75,[ebp+12]
	mov	dword76,16
	add	dword76,[dword75]
	lea	dword77,[ebp+16]
	mov	dword78,[dword77]
	fld	dword ptr [dword76]
	fmul	dword ptr [dword78]
	lea	dword79,[ebp+12]
	mov	dword80,20
	add	dword80,[dword79]
	lea	dword81,[ebp+16]
	mov	dword82,16
	add	dword82,[dword81]
	fld	dword ptr [dword80]
	fmul	dword ptr [dword82]
	faddp
	lea	dword83,[ebp+12]
	mov	dword84,24
	add	dword84,[dword83]
	lea	dword85,[ebp+16]
	mov	dword86,32
	add	dword86,[dword85]
	fld	dword ptr [dword84]
	fmul	dword ptr [dword86]
	faddp
	lea	dword87,[ebp+12]
	mov	dword88,28
	add	dword88,[dword87]
	lea	dword89,[ebp+16]
	mov	dword90,48
	add	dword90,[dword89]
	fld	dword ptr [dword88]
	fmul	dword ptr [dword90]
	faddp
	fstp	dword ptr [dword74]
	lea	dword91,[ebp+8]
	mov	dword92,20
	add	dword92,[dword91]
	lea	dword93,[ebp+12]
	mov	dword94,16
	add	dword94,[dword93]
	lea	dword95,[ebp+16]
	mov	dword96,4
	add	dword96,[dword95]
	fld	dword ptr [dword94]
	fmul	dword ptr [dword96]
	lea	dword97,[ebp+12]
	mov	dword98,20
	add	dword98,[dword97]
	lea	dword99,[ebp+16]
	mov	dword100,20
	add	dword100,[dword99]
	fld	dword ptr [dword98]
	fmul	dword ptr [dword100]
	faddp
	lea	dword101,[ebp+12]
	mov	dword102,24
	add	dword102,[dword101]
	lea	dword103,[ebp+16]
	mov	dword104,36
	add	dword104,[dword103]
	fld	dword ptr [dword102]
	fmul	dword ptr [dword104]
	faddp
	lea	dword105,[ebp+12]
	mov	dword106,28
	add	dword106,[dword105]
	lea	dword107,[ebp+16]
	mov	dword108,52
	add	dword108,[dword107]
	fld	dword ptr [dword106]
	fmul	dword ptr [dword108]
	faddp
	fstp	dword ptr [dword92]
	lea	dword109,[ebp+8]
	mov	dword110,24
	add	dword110,[dword109]
	lea	dword111,[ebp+12]
	mov	dword112,16
	add	dword112,[dword111]
	lea	dword113,[ebp+16]
	mov	dword114,8
	add	dword114,[dword113]
	fld	dword ptr [dword112]
	fmul	dword ptr [dword114]
	lea	dword115,[ebp+12]
	mov	dword116,20
	add	dword116,[dword115]
	lea	dword117,[ebp+16]
	mov	dword118,24
	add	dword118,[dword117]
	fld	dword ptr [dword116]
	fmul	dword ptr [dword118]
	faddp
	lea	dword119,[ebp+12]
	mov	dword120,24
	add	dword120,[dword119]
	lea	dword121,[ebp+16]
	mov	dword122,40
	add	dword122,[dword121]
	fld	dword ptr [dword120]
	fmul	dword ptr [dword122]
	faddp
	lea	dword123,[ebp+12]
	mov	dword124,28
	add	dword124,[dword123]
	lea	dword125,[ebp+16]
	mov	dword126,56
	add	dword126,[dword125]
	fld	dword ptr [dword124]
	fmul	dword ptr [dword126]
	faddp
	fstp	dword ptr [dword110]
	lea	dword127,[ebp+8]
	mov	dword128,28
	add	dword128,[dword127]
	lea	dword129,[ebp+12]
	mov	dword130,16
	add	dword130,[dword129]
	lea	dword131,[ebp+16]
	mov	dword132,12
	add	dword132,[dword131]
	fld	dword ptr [dword130]
	fmul	dword ptr [dword132]
	lea	dword133,[ebp+12]
	mov	dword134,20
	add	dword134,[dword133]
	lea	dword135,[ebp+16]
	mov	dword136,28
	add	dword136,[dword135]
	fld	dword ptr [dword134]
	fmul	dword ptr [dword136]
	faddp
	lea	dword137,[ebp+12]
	mov	dword138,24
	add	dword138,[dword137]
	lea	dword139,[ebp+16]
	mov	dword140,44
	add	dword140,[dword139]
	fld	dword ptr [dword138]
	fmul	dword ptr [dword140]
	faddp
	lea	dword141,[ebp+12]
	mov	dword142,28
	add	dword142,[dword141]
	lea	dword143,[ebp+16]
	mov	dword144,60
	add	dword144,[dword143]
	fld	dword ptr [dword142]
	fmul	dword ptr [dword144]
	faddp
	fstp	dword ptr [dword128]
	lea	dword145,[ebp+8]
	mov	dword146,32
	add	dword146,[dword145]
	lea	dword147,[ebp+12]
	mov	dword148,32
	add	dword148,[dword147]
	lea	dword149,[ebp+16]
	mov	dword150,[dword149]
	fld	dword ptr [dword148]
	fmul	dword ptr [dword150]
	lea	dword151,[ebp+12]
	mov	dword152,36
	add	dword152,[dword151]
	lea	dword153,[ebp+16]
	mov	dword154,16
	add	dword154,[dword153]
	fld	dword ptr [dword152]
	fmul	dword ptr [dword154]
	faddp
	lea	dword155,[ebp+12]
	mov	dword156,40
	add	dword156,[dword155]
	lea	dword157,[ebp+16]
	mov	dword158,32
	add	dword158,[dword157]
	fld	dword ptr [dword156]
	fmul	dword ptr [dword158]
	faddp
	lea	dword159,[ebp+12]
	mov	dword160,44
	add	dword160,[dword159]
	lea	dword161,[ebp+16]
	mov	dword162,48
	add	dword162,[dword161]
	fld	dword ptr [dword160]
	fmul	dword ptr [dword162]
	faddp
	fstp	dword ptr [dword146]
	lea	dword163,[ebp+8]
	mov	dword164,36
	add	dword164,[dword163]
	lea	dword165,[ebp+12]
	mov	dword166,32
	add	dword166,[dword165]
	lea	dword167,[ebp+16]
	mov	dword168,4
	add	dword168,[dword167]
	fld	dword ptr [dword166]
	fmul	dword ptr [dword168]
	lea	dword169,[ebp+12]
	mov	dword170,36
	add	dword170,[dword169]
	lea	dword171,[ebp+16]
	mov	dword172,20
	add	dword172,[dword171]
	fld	dword ptr [dword170]
	fmul	dword ptr [dword172]
	faddp
	lea	dword173,[ebp+12]
	mov	dword174,40
	add	dword174,[dword173]
	lea	dword175,[ebp+16]
	mov	dword176,36
	add	dword176,[dword175]
	fld	dword ptr [dword174]
	fmul	dword ptr [dword176]
	faddp
	lea	dword177,[ebp+12]
	mov	dword178,44
	add	dword178,[dword177]
	lea	dword179,[ebp+16]
	mov	dword180,52
	add	dword180,[dword179]
	fld	dword ptr [dword178]
	fmul	dword ptr [dword180]
	faddp
	fstp	dword ptr [dword164]
	lea	dword181,[ebp+8]
	mov	dword182,40
	add	dword182,[dword181]
	lea	dword183,[ebp+12]
	mov	dword184,32
	add	dword184,[dword183]
	lea	dword185,[ebp+16]
	mov	dword186,8
	add	dword186,[dword185]
	fld	dword ptr [dword184]
	fmul	dword ptr [dword186]
	lea	dword187,[ebp+12]
	mov	dword188,36
	add	dword188,[dword187]
	lea	dword189,[ebp+16]
	mov	dword190,24
	add	dword190,[dword189]
	fld	dword ptr [dword188]
	fmul	dword ptr [dword190]
	faddp
	lea	dword191,[ebp+12]
	mov	dword192,40
	add	dword192,[dword191]
	lea	dword193,[ebp+16]
	mov	dword194,40
	add	dword194,[dword193]
	fld	dword ptr [dword192]
	fmul	dword ptr [dword194]
	faddp
	lea	dword195,[ebp+12]
	mov	dword196,44
	add	dword196,[dword195]
	lea	dword197,[ebp+16]
	mov	dword198,56
	add	dword198,[dword197]
	fld	dword ptr [dword196]
	fmul	dword ptr [dword198]
	faddp
	fstp	dword ptr [dword182]
	lea	dword199,[ebp+8]
	mov	dword200,44
	add	dword200,[dword199]
	lea	dword201,[ebp+12]
	mov	dword202,32
	add	dword202,[dword201]
	lea	dword203,[ebp+16]
	mov	dword204,12
	add	dword204,[dword203]
	fld	dword ptr [dword202]
	fmul	dword ptr [dword204]
	lea	dword205,[ebp+12]
	mov	dword206,36
	add	dword206,[dword205]
	lea	dword207,[ebp+16]
	mov	dword208,28
	add	dword208,[dword207]
	fld	dword ptr [dword206]
	fmul	dword ptr [dword208]
	faddp
	lea	dword209,[ebp+12]
	mov	dword210,40
	add	dword210,[dword209]
	lea	dword211,[ebp+16]
	mov	dword212,44
	add	dword212,[dword211]
	fld	dword ptr [dword210]
	fmul	dword ptr [dword212]
	faddp
	lea	dword213,[ebp+12]
	mov	dword214,44
	add	dword214,[dword213]
	lea	dword215,[ebp+16]
	mov	dword216,60
	add	dword216,[dword215]
	fld	dword ptr [dword214]
	fmul	dword ptr [dword216]
	faddp
	fstp	dword ptr [dword200]
	lea	dword217,[ebp+8]
	mov	dword218,48
	add	dword218,[dword217]
	lea	dword219,[ebp+12]
	mov	dword220,48
	add	dword220,[dword219]
	lea	dword221,[ebp+16]
	mov	dword222,[dword221]
	fld	dword ptr [dword220]
	fmul	dword ptr [dword222]
	lea	dword223,[ebp+12]
	mov	dword224,52
	add	dword224,[dword223]
	lea	dword225,[ebp+16]
	mov	dword226,16
	add	dword226,[dword225]
	fld	dword ptr [dword224]
	fmul	dword ptr [dword226]
	faddp
	lea	dword227,[ebp+12]
	mov	dword228,56
	add	dword228,[dword227]
	lea	dword229,[ebp+16]
	mov	dword230,32
	add	dword230,[dword229]
	fld	dword ptr [dword228]
	fmul	dword ptr [dword230]
	faddp
	lea	dword231,[ebp+12]
	mov	dword232,60
	add	dword232,[dword231]
	lea	dword233,[ebp+16]
	mov	dword234,48
	add	dword234,[dword233]
	fld	dword ptr [dword232]
	fmul	dword ptr [dword234]
	faddp
	fstp	dword ptr [dword218]
	lea	dword235,[ebp+8]
	mov	dword236,52
	add	dword236,[dword235]
	lea	dword237,[ebp+12]
	mov	dword238,48
	add	dword238,[dword237]
	lea	dword239,[ebp+16]
	mov	dword240,4
	add	dword240,[dword239]
	fld	dword ptr [dword238]
	fmul	dword ptr [dword240]
	lea	dword241,[ebp+12]
	mov	dword242,52
	add	dword242,[dword241]
	lea	dword243,[ebp+16]
	mov	dword244,20
	add	dword244,[dword243]
	fld	dword ptr [dword242]
	fmul	dword ptr [dword244]
	faddp
	lea	dword245,[ebp+12]
	mov	dword246,56
	add	dword246,[dword245]
	lea	dword247,[ebp+16]
	mov	dword248,36
	add	dword248,[dword247]
	fld	dword ptr [dword246]
	fmul	dword ptr [dword248]
	faddp
	lea	dword249,[ebp+12]
	mov	dword250,60
	add	dword250,[dword249]
	lea	dword251,[ebp+16]
	mov	dword252,52
	add	dword252,[dword251]
	fld	dword ptr [dword250]
	fmul	dword ptr [dword252]
	faddp
	fstp	dword ptr [dword236]
	lea	dword253,[ebp+8]
	mov	dword254,56
	add	dword254,[dword253]
	lea	dword255,[ebp+12]
	mov	dword256,48
	add	dword256,[dword255]
	lea	dword257,[ebp+16]
	mov	dword258,8
	add	dword258,[dword257]
	fld	dword ptr [dword256]
	fmul	dword ptr [dword258]
	lea	dword259,[ebp+12]
	mov	dword260,52
	add	dword260,[dword259]
	lea	dword261,[ebp+16]
	mov	dword262,24
	add	dword262,[dword261]
	fld	dword ptr [dword260]
	fmul	dword ptr [dword262]
	faddp
	lea	dword263,[ebp+12]
	mov	dword264,56
	add	dword264,[dword263]
	lea	dword265,[ebp+16]
	mov	dword266,40
	add	dword266,[dword265]
	fld	dword ptr [dword264]
	fmul	dword ptr [dword266]
	faddp
	lea	dword267,[ebp+12]
	mov	dword268,60
	add	dword268,[dword267]
	lea	dword269,[ebp+16]
	mov	dword270,56
	add	dword270,[dword269]
	fld	dword ptr [dword268]
	fmul	dword ptr [dword270]
	faddp
	fstp	dword ptr [dword254]
	lea	dword271,[ebp+8]
	mov	dword272,60
	add	dword272,[dword271]
	lea	dword273,[ebp+12]
	mov	dword274,48
	add	dword274,[dword273]
	lea	dword275,[ebp+16]
	mov	dword276,12
	add	dword276,[dword275]
	fld	dword ptr [dword274]
	fmul	dword ptr [dword276]
	lea	dword277,[ebp+12]
	mov	dword278,52
	add	dword278,[dword277]
	lea	dword279,[ebp+16]
	mov	dword280,28
	add	dword280,[dword279]
	fld	dword ptr [dword278]
	fmul	dword ptr [dword280]
	faddp
	lea	dword281,[ebp+12]
	mov	dword282,56
	add	dword282,[dword281]
	lea	dword283,[ebp+16]
	mov	dword284,44
	add	dword284,[dword283]
	fld	dword ptr [dword282]
	fmul	dword ptr [dword284]
	faddp
	lea	dword285,[ebp+12]
	mov	dword286,60
	add	dword286,[dword285]
	lea	dword287,[ebp+16]
	mov	dword288,60
	add	dword288,[dword287]
	fld	dword ptr [dword286]
	fmul	dword ptr [dword288]
	faddp
	fstp	dword ptr [dword272]
	destroy_stack_frame	0
	ret
_matrix4f_mul endp	

_matrix4f_transform proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	mov	dword4,[dword3]
	lea	dword5,[ebp+16]
	mov	dword6,[dword5]
	fld	dword ptr [dword4]
	fmul	dword ptr [dword6]
	lea	dword7,[ebp+12]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+16]
	mov	dword10,16
	add	dword10,[dword9]
	fld	dword ptr [dword8]
	fmul	dword ptr [dword10]
	faddp
	lea	dword11,[ebp+12]
	mov	dword12,8
	add	dword12,[dword11]
	lea	dword13,[ebp+16]
	mov	dword14,32
	add	dword14,[dword13]
	fld	dword ptr [dword12]
	fmul	dword ptr [dword14]
	faddp
	lea	dword15,[ebp+12]
	mov	dword16,12
	add	dword16,[dword15]
	lea	dword17,[ebp+16]
	mov	dword18,48
	add	dword18,[dword17]
	fld	dword ptr [dword16]
	fmul	dword ptr [dword18]
	faddp
	fstp	dword ptr [dword2]
	lea	dword19,[ebp+8]
	mov	dword20,4
	add	dword20,[dword19]
	lea	dword21,[ebp+12]
	mov	dword22,[dword21]
	lea	dword23,[ebp+16]
	mov	dword24,4
	add	dword24,[dword23]
	fld	dword ptr [dword22]
	fmul	dword ptr [dword24]
	lea	dword25,[ebp+12]
	mov	dword26,4
	add	dword26,[dword25]
	lea	dword27,[ebp+16]
	mov	dword28,20
	add	dword28,[dword27]
	fld	dword ptr [dword26]
	fmul	dword ptr [dword28]
	faddp
	lea	dword29,[ebp+12]
	mov	dword30,8
	add	dword30,[dword29]
	lea	dword31,[ebp+16]
	mov	dword32,36
	add	dword32,[dword31]
	fld	dword ptr [dword30]
	fmul	dword ptr [dword32]
	faddp
	lea	dword33,[ebp+12]
	mov	dword34,12
	add	dword34,[dword33]
	lea	dword35,[ebp+16]
	mov	dword36,52
	add	dword36,[dword35]
	fld	dword ptr [dword34]
	fmul	dword ptr [dword36]
	faddp
	fstp	dword ptr [dword20]
	lea	dword37,[ebp+8]
	mov	dword38,8
	add	dword38,[dword37]
	lea	dword39,[ebp+12]
	mov	dword40,[dword39]
	lea	dword41,[ebp+16]
	mov	dword42,8
	add	dword42,[dword41]
	fld	dword ptr [dword40]
	fmul	dword ptr [dword42]
	lea	dword43,[ebp+12]
	mov	dword44,4
	add	dword44,[dword43]
	lea	dword45,[ebp+16]
	mov	dword46,24
	add	dword46,[dword45]
	fld	dword ptr [dword44]
	fmul	dword ptr [dword46]
	faddp
	lea	dword47,[ebp+12]
	mov	dword48,8
	add	dword48,[dword47]
	lea	dword49,[ebp+16]
	mov	dword50,40
	add	dword50,[dword49]
	fld	dword ptr [dword48]
	fmul	dword ptr [dword50]
	faddp
	lea	dword51,[ebp+12]
	mov	dword52,12
	add	dword52,[dword51]
	lea	dword53,[ebp+16]
	mov	dword54,56
	add	dword54,[dword53]
	fld	dword ptr [dword52]
	fmul	dword ptr [dword54]
	faddp
	fstp	dword ptr [dword38]
	lea	dword55,[ebp+8]
	mov	dword56,12
	add	dword56,[dword55]
	lea	dword57,[ebp+12]
	mov	dword58,[dword57]
	lea	dword59,[ebp+16]
	mov	dword60,12
	add	dword60,[dword59]
	fld	dword ptr [dword58]
	fmul	dword ptr [dword60]
	lea	dword61,[ebp+12]
	mov	dword62,4
	add	dword62,[dword61]
	lea	dword63,[ebp+16]
	mov	dword64,28
	add	dword64,[dword63]
	fld	dword ptr [dword62]
	fmul	dword ptr [dword64]
	faddp
	lea	dword65,[ebp+12]
	mov	dword66,8
	add	dword66,[dword65]
	lea	dword67,[ebp+16]
	mov	dword68,44
	add	dword68,[dword67]
	fld	dword ptr [dword66]
	fmul	dword ptr [dword68]
	faddp
	lea	dword69,[ebp+12]
	mov	dword70,12
	add	dword70,[dword69]
	lea	dword71,[ebp+16]
	mov	dword72,60
	add	dword72,[dword71]
	fld	dword ptr [dword70]
	fmul	dword ptr [dword72]
	faddp
	fstp	dword ptr [dword56]
	destroy_stack_frame	0
	ret
_matrix4f_transform endp	

_matrix4f_transpose proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,4
	add	dword2,[dword1]
	lea	dword3,[ebp+8]
	mov	dword4,16
	add	dword4,[dword3]
	fld	dword ptr [dword4]
	fstp	dword ptr [dword2]
	lea	dword5,[ebp+8]
	mov	dword6,8
	add	dword6,[dword5]
	lea	dword7,[ebp+8]
	mov	dword8,32
	add	dword8,[dword7]
	fld	dword ptr [dword8]
	fstp	dword ptr [dword6]
	lea	dword9,[ebp+8]
	mov	dword10,12
	add	dword10,[dword9]
	lea	dword11,[ebp+8]
	mov	dword12,48
	add	dword12,[dword11]
	fld	dword ptr [dword12]
	fstp	dword ptr [dword10]
	lea	dword13,[ebp+8]
	mov	dword14,24
	add	dword14,[dword13]
	lea	dword15,[ebp+8]
	mov	dword16,36
	add	dword16,[dword15]
	fld	dword ptr [dword16]
	fstp	dword ptr [dword14]
	lea	dword17,[ebp+8]
	mov	dword18,28
	add	dword18,[dword17]
	lea	dword19,[ebp+8]
	mov	dword20,52
	add	dword20,[dword19]
	fld	dword ptr [dword20]
	fstp	dword ptr [dword18]
	lea	dword21,[ebp+8]
	mov	dword22,44
	add	dword22,[dword21]
	lea	dword23,[ebp+8]
	mov	dword24,56
	add	dword24,[dword23]
	fld	dword ptr [dword24]
	fstp	dword ptr [dword22]
	destroy_stack_frame	0
	ret
_matrix4f_transpose endp	

.data

___unnamed_float_2	dd	-1.000000
public	___unnamed_float_2

.code

_rasterizer_init proc
	create_stack_frame	8
	lea	dword1,[__dbgprintf]
	lea	dword2,[ebp+8]
	mov	dword3,[dword2]
	mov	[dword1],dword3
	lea	dword4,[__width]
	lea	dword5,[ebp+12]
	mov	dword6,[dword5]
	mov	[dword4],dword6
	lea	dword7,[__height]
	lea	dword8,[ebp+16]
	mov	dword9,[dword8]
	mov	[dword7],dword9
	lea	dword10,[__pitch]
	lea	dword11,[ebp+20]
	mov	dword12,[dword11]
	mov	[dword10],dword12
	push_all
	lea	dword13,[ebp+12]
	fild	dword ptr [dword13]
	lea	dword14,[ebp+16]
	fild	dword ptr [dword14]
	fdivp
	push_argp
	lea	dword15,[ebp+32]
	push_arg	dword ptr [dword15]
	lea	dword16,[ebp+28]
	push_arg	dword ptr [dword16]
	lea	dword17,[ebp+24]
	push_arg	dword ptr [dword17]
	lea	dword18,[__mvproj_matrix]
	push_arg	dword18
	call	_matrix4f_make_perspective
	restore_stack	20
	pop_all
	push_all
	lea	dword19,[ebp+28]
	push_arg	dword ptr [dword19]
	lea	dword20,[ebp+24]
	push_arg	dword ptr [dword20]
	lea	dword21,[ebp+16]
	fild	dword ptr [dword21]
	push_argp
	lea	dword22,[ebp+12]
	fild	dword ptr [dword22]
	push_argp
	lea	dword23,[__viewport_matrix]
	push_arg	dword23
	call	_matrix4f_make_viewport
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	lea	dword24,[ebp+24]
	push_arg	dword ptr [dword24]
	fldz
	push_argp
	fldz
	push_argp
	lea	dword25,[__clip_z_near_base]
	push_arg	dword25
	call	_vec4f_assign
	restore_stack	20
	pop_all
	lea	dword26,[ebp+28]
	lea	dword27,[ebp+24]
	fld	dword ptr [dword27]
	fld	dword ptr [dword26]
	fucomip	st,st(1)
	fstp	st
	jbe	label0000
	lea	dword28,[ebp-4]
	fld1
	fstp	dword ptr [dword28]
	jmp	label0001
label0000:
	lea	dword29,[ebp-4]
	lea	dword30,[___unnamed_float_2]
	fld	dword ptr [dword30]
	fstp	dword ptr [dword29]
label0001:
	push_all
	fld1
	push_argp
	lea	dword31,[ebp-4]
	push_arg	dword ptr [dword31]
	fldz
	push_argp
	fldz
	push_argp
	lea	dword32,[__clip_z_near_norm]
	push_arg	dword32
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	lea	dword33,[ebp+28]
	push_arg	dword ptr [dword33]
	fldz
	push_argp
	fldz
	push_argp
	lea	dword34,[__clip_z_far_base]
	push_arg	dword34
	call	_vec4f_assign
	restore_stack	20
	pop_all
	lea	dword35,[ebp+28]
	lea	dword36,[ebp+24]
	fld	dword ptr [dword36]
	fld	dword ptr [dword35]
	fucomip	st,st(1)
	fstp	st
	jbe	label0002
	lea	dword37,[ebp-8]
	lea	dword38,[___unnamed_float_2]
	fld	dword ptr [dword38]
	fstp	dword ptr [dword37]
	jmp	label0003
label0002:
	lea	dword39,[ebp-8]
	fld1
	fstp	dword ptr [dword39]
label0003:
	push_all
	fld1
	push_argp
	lea	dword40,[ebp-8]
	push_arg	dword ptr [dword40]
	fldz
	push_argp
	fldz
	push_argp
	lea	dword41,[__clip_z_far_norm]
	push_arg	dword41
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	fldz
	push_argp
	lea	dword42,[___unnamed_float_2]
	fld	dword ptr [dword42]
	fld1
	lea	dword43,[ebp+12]
	fild	dword ptr [dword43]
	fdivp
	faddp
	push_argp
	lea	dword44,[__clip_plane_left_base]
	push_arg	dword44
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	fldz
	push_argp
	fld1
	push_argp
	lea	dword45,[__clip_plane_left_norm]
	push_arg	dword45
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	fldz
	push_argp
	fld1
	fld1
	lea	dword46,[ebp+12]
	fild	dword ptr [dword46]
	fdivp
	fsubp
	push_argp
	lea	dword47,[__clip_plane_right_base]
	push_arg	dword47
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	fldz
	push_argp
	lea	dword48,[___unnamed_float_2]
	fld	dword ptr [dword48]
	push_argp
	lea	dword49,[__clip_plane_right_norm]
	push_arg	dword49
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	lea	dword50,[___unnamed_float_2]
	fld	dword ptr [dword50]
	fld1
	lea	dword51,[ebp+16]
	fild	dword ptr [dword51]
	fdivp
	faddp
	push_argp
	fldz
	push_argp
	lea	dword52,[__clip_plane_top_base]
	push_arg	dword52
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	fld1
	push_argp
	fldz
	push_argp
	lea	dword53,[__clip_plane_top_norm]
	push_arg	dword53
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	fld1
	push_argp
	fldz
	push_argp
	lea	dword54,[__clip_plane_bottom_base]
	push_arg	dword54
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	lea	dword55,[___unnamed_float_2]
	fld	dword ptr [dword55]
	push_argp
	fldz
	push_argp
	lea	dword56,[__clip_plane_bottom_norm]
	push_arg	dword56
	call	_vec4f_assign
	restore_stack	20
	pop_all
	destroy_stack_frame	8
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	create_stack_frame	0
	lea	dword1,[__videomem]
	lea	dword2,[ebp+8]
	mov	dword3,[dword2]
	mov	[dword1],dword3
	destroy_stack_frame	0
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[__mvproj_matrix]
	mov	dword4,[dword2]
	mov	dword5,[dword2+4]
	mov	[dword3],dword4
	mov	[dword3+4],dword5
	mov	dword4,[dword2+8]
	mov	dword5,[dword2+12]
	mov	[dword3+8],dword4
	mov	[dword3+12],dword5
	mov	dword4,[dword2+16]
	mov	dword5,[dword2+20]
	mov	[dword3+16],dword4
	mov	[dword3+20],dword5
	mov	dword4,[dword2+24]
	mov	dword5,[dword2+28]
	mov	[dword3+24],dword4
	mov	[dword3+28],dword5
	mov	dword4,[dword2+32]
	mov	dword5,[dword2+36]
	mov	[dword3+32],dword4
	mov	[dword3+36],dword5
	mov	dword4,[dword2+40]
	mov	dword5,[dword2+44]
	mov	[dword3+40],dword4
	mov	[dword3+44],dword5
	mov	dword4,[dword2+48]
	mov	dword5,[dword2+52]
	mov	[dword3+48],dword4
	mov	[dword3+52],dword5
	mov	dword4,[dword2+56]
	mov	dword5,[dword2+60]
	mov	[dword3+56],dword4
	mov	[dword3+60],dword5
	destroy_stack_frame	0
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	create_stack_frame	0
	lea	dword1,[__color]
	lea	dword2,[ebp+8]
	mov	dword3,[dword2]
	mov	[dword1],dword3
	destroy_stack_frame	0
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	create_stack_frame	0
	lea	dword1,[__texture_data]
	lea	dword2,[ebp+8]
	mov	dword3,[dword2]
	mov	[dword1],dword3
	lea	dword4,[__texture_width]
	lea	dword5,[ebp+12]
	mov	dword6,[dword5]
	mov	[dword4],dword6
	lea	dword7,[__texture_height]
	lea	dword8,[ebp+16]
	mov	dword9,[dword8]
	mov	[dword7],dword9
	destroy_stack_frame	0
	ret
_rasterizer_set_texture endp	

__tex2d proc
	create_stack_frame	8
	lea	dword1,[__texture_width]
	mov	dword2,1
	mov	dword3,[dword1]
	sub	dword3,dword2
	int2float	dword3
	lea	dword4,[ebp+8]
	fmul	dword ptr [dword4]
	float2int	dword5
	lea	dword6,[ebp-4]
	mov	[dword6],dword5
	lea	dword7,[__texture_height]
	mov	dword8,1
	mov	dword9,[dword7]
	sub	dword9,dword8
	int2float	dword9
	lea	dword10,[ebp+12]
	fmul	dword ptr [dword10]
	float2int	dword11
	lea	dword12,[ebp-8]
	mov	[dword12],dword11
	lea	dword13,[ebp-8]
	lea	dword14,[__texture_width]
	mov	dword15,[dword13]
	imul	dword15,[dword14]
	lea	dword16,[ebp-4]
	add	dword15,[dword16]
	mov	dword17,2
	sal	dword15,dword17
	lea	dword18,[__texture_data]
	add	dword15,[dword18]
	mov	eax,[dword15]
	destroy_stack_frame	8
	ret
__tex2d endp	

.data

___unnamed_float_3	dd	255.000000
public	___unnamed_float_3

.code

__rasterize_horiz_line proc
	create_stack_frame	44
	lea	dword1,[__pitch]
	lea	dword2,[ebp+16]
	mov	dword3,[dword1]
	imul	dword3,[dword2]
	lea	dword4,[__videomem]
	add	dword3,[dword4]
	lea	dword5,[ebp+8]
	mov	dword6,2
	mov	dword7,[dword5]
	sal	dword7,dword6
	add	dword3,dword7
	lea	dword8,[ebp-4]
	mov	[dword8],dword3
	lea	dword9,[ebp+12]
	mov	dword10,2
	mov	dword11,[dword9]
	sal	dword11,dword10
	lea	dword12,[ebp-4]
	add	dword11,[dword12]
	lea	dword13,[ebp+8]
	mov	dword14,2
	mov	dword15,[dword13]
	sal	dword15,dword14
	sub	dword11,dword15
	lea	dword16,[ebp-8]
	mov	[dword16],dword11
label0000:
	push_all
	lea	dword17,[ebp+24]
	push_arg	dword ptr [dword17]
	lea	dword18,[ebp+20]
	push_arg	dword ptr [dword18]
	call	__tex2d
	restore_stack	8
	pop_all
	lea	dword19,[ebp-12]
	mov	[dword19],eax
	lea	dword20,[ebp-12]
	mov	dword21,24
	mov	dword22,[dword20]
	sar	dword22,dword21
	mov	dword23,255
	and	dword22,dword23
	lea	dword24,[ebp-40]
	mov	[dword24],dword22
	lea	dword25,[ebp-40]
	cmp	dword ptr [dword25],0
	je	label0003
	lea	dword26,[ebp-44]
	lea	dword27,[ebp-40]
	fild	dword ptr [dword27]
	lea	dword28,[___unnamed_float_3]
	fld	dword ptr [dword28]
	fdivp
	fstp	dword ptr [dword26]
	lea	dword29,[ebp-4]
	mov	dword30,[dword29]
	lea	dword31,[ebp-28]
	mov	dword32,[dword30]
	mov	[dword31],dword32
	lea	dword33,[ebp-28]
	mov	dword34,65280
	mov	dword35,[dword33]
	and	dword35,dword34
	mov	dword36,8
	sar	dword35,dword36
	lea	dword37,[ebp-32]
	mov	[dword37],dword35
	lea	dword38,[ebp-28]
	mov	dword39,255
	mov	dword40,[dword38]
	and	dword40,dword39
	lea	dword41,[ebp-36]
	mov	[dword41],dword40
	lea	dword42,[ebp-12]
	mov	dword43,65280
	mov	dword44,[dword42]
	and	dword44,dword43
	mov	dword45,8
	sar	dword44,dword45
	lea	dword46,[ebp-20]
	mov	[dword46],dword44
	lea	dword47,[ebp-12]
	mov	dword48,255
	mov	dword49,[dword47]
	and	dword49,dword48
	lea	dword50,[ebp-24]
	mov	[dword50],dword49
	lea	dword51,[ebp-20]
	fild	dword ptr [dword51]
	lea	dword52,[ebp-44]
	fmul	dword ptr [dword52]
	lea	dword53,[ebp-32]
	fild	dword ptr [dword53]
	fld1
	lea	dword54,[ebp-44]
	fsub	dword ptr [dword54]
	fmulp
	faddp
	float2int	dword55
	lea	dword56,[ebp-20]
	mov	[dword56],dword55
	lea	dword57,[ebp-24]
	fild	dword ptr [dword57]
	lea	dword58,[ebp-44]
	fmul	dword ptr [dword58]
	lea	dword59,[ebp-36]
	fild	dword ptr [dword59]
	fld1
	lea	dword60,[ebp-44]
	fsub	dword ptr [dword60]
	fmulp
	faddp
	float2int	dword61
	lea	dword62,[ebp-24]
	mov	[dword62],dword61
	lea	dword63,[ebp-20]
	mov	dword64,8
	mov	dword65,[dword63]
	sal	dword65,dword64
	lea	dword66,[ebp-24]
	add	dword65,[dword66]
	lea	dword67,[ebp-16]
	mov	[dword67],dword65
	lea	dword68,[ebp-4]
	mov	dword69,[dword68]
	lea	dword70,[ebp-16]
	mov	dword71,[dword70]
	mov	[dword69],dword71
label0003:
	lea	dword72,[ebp+20]
	lea	dword73,[ebp+28]
	fld	dword ptr [dword72]
	fadd	dword ptr [dword73]
	fstp	dword ptr [dword72]
	lea	dword74,[ebp+24]
	lea	dword75,[ebp+32]
	fld	dword ptr [dword74]
	fadd	dword ptr [dword75]
	fstp	dword ptr [dword74]
label0001:
	lea	dword76,[ebp-4]
	add	dword ptr [dword76],4
	lea	dword77,[ebp-8]
	mov	dword78,[dword76]
	cmp	dword78,[dword77]
	jl	label0000
label0002:
	destroy_stack_frame	44
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	lea	dword2,[ebp+12]
	mov	dword3,[dword1]
	cmp	dword3,[dword2]
	jg	label0000
	push_all
	lea	dword4,[ebp+40]
	push_arg	dword ptr [dword4]
	lea	dword5,[ebp+36]
	push_arg	dword ptr [dword5]
	lea	dword6,[ebp+24]
	push_arg	dword ptr [dword6]
	lea	dword7,[ebp+20]
	push_arg	dword ptr [dword7]
	lea	dword8,[ebp+16]
	push_arg	dword ptr [dword8]
	lea	dword9,[ebp+12]
	push_arg	dword ptr [dword9]
	lea	dword10,[ebp+8]
	push_arg	dword ptr [dword10]
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0001
label0000:
	push_all
	lea	dword11,[ebp+40]
	push_arg	dword ptr [dword11]
	lea	dword12,[ebp+36]
	push_arg	dword ptr [dword12]
	lea	dword13,[ebp+32]
	push_arg	dword ptr [dword13]
	lea	dword14,[ebp+28]
	push_arg	dword ptr [dword14]
	lea	dword15,[ebp+16]
	push_arg	dword ptr [dword15]
	lea	dword16,[ebp+8]
	push_arg	dword ptr [dword16]
	lea	dword17,[ebp+12]
	push_arg	dword ptr [dword17]
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0001:
	destroy_stack_frame	0
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	create_stack_frame	0
	lea	dword1,[ebp+8]
	lea	dword2,[ebp+12]
	mov	dword3,[dword1]
	cmp	dword3,[dword2]
	jge	label0000
	lea	dword4,[ebp+16]
	lea	dword5,[ebp+12]
	mov	dword6,[dword4]
	cmp	dword6,[dword5]
	jle	label0001
	push_all
	lea	dword7,[ebp+40]
	push_arg	dword ptr [dword7]
	lea	dword8,[ebp+36]
	push_arg	dword ptr [dword8]
	lea	dword9,[ebp+24]
	mov	dword10,4
	add	dword10,[dword9]
	push_arg	dword ptr [dword10]
	lea	dword11,[ebp+24]
	mov	dword12,[dword11]
	push_arg	dword ptr [dword12]
	lea	dword13,[ebp+20]
	push_arg	dword ptr [dword13]
	lea	dword14,[ebp+16]
	push_arg	dword ptr [dword14]
	lea	dword15,[ebp+8]
	push_arg	dword ptr [dword15]
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0002
label0001:
	lea	dword16,[ebp+16]
	lea	dword17,[ebp+8]
	mov	dword18,[dword16]
	cmp	dword18,[dword17]
	jge	label0003
	push_all
	lea	dword19,[ebp+40]
	push_arg	dword ptr [dword19]
	lea	dword20,[ebp+36]
	push_arg	dword ptr [dword20]
	lea	dword21,[ebp+32]
	mov	dword22,4
	add	dword22,[dword21]
	push_arg	dword ptr [dword22]
	lea	dword23,[ebp+32]
	mov	dword24,[dword23]
	push_arg	dword ptr [dword24]
	lea	dword25,[ebp+20]
	push_arg	dword ptr [dword25]
	lea	dword26,[ebp+12]
	push_arg	dword ptr [dword26]
	lea	dword27,[ebp+16]
	push_arg	dword ptr [dword27]
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0004
label0003:
	push_all
	lea	dword28,[ebp+40]
	push_arg	dword ptr [dword28]
	lea	dword29,[ebp+36]
	push_arg	dword ptr [dword29]
	lea	dword30,[ebp+24]
	mov	dword31,4
	add	dword31,[dword30]
	push_arg	dword ptr [dword31]
	lea	dword32,[ebp+24]
	mov	dword33,[dword32]
	push_arg	dword ptr [dword33]
	lea	dword34,[ebp+20]
	push_arg	dword ptr [dword34]
	lea	dword35,[ebp+12]
	push_arg	dword ptr [dword35]
	lea	dword36,[ebp+8]
	push_arg	dword ptr [dword36]
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0004:
label0002:
	jmp	label0005
label0000:
	lea	dword37,[ebp+16]
	lea	dword38,[ebp+12]
	mov	dword39,[dword37]
	cmp	dword39,[dword38]
	jge	label0006
	push_all
	lea	dword40,[ebp+40]
	fld	dword ptr [dword40]
	fldz
	fsubrp
	push_argp
	lea	dword41,[ebp+36]
	fld	dword ptr [dword41]
	fldz
	fsubrp
	push_argp
	lea	dword42,[ebp+32]
	mov	dword43,4
	add	dword43,[dword42]
	push_arg	dword ptr [dword43]
	lea	dword44,[ebp+32]
	mov	dword45,[dword44]
	push_arg	dword ptr [dword45]
	lea	dword46,[ebp+20]
	push_arg	dword ptr [dword46]
	lea	dword47,[ebp+8]
	push_arg	dword ptr [dword47]
	lea	dword48,[ebp+16]
	push_arg	dword ptr [dword48]
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0007
label0006:
	lea	dword49,[ebp+16]
	lea	dword50,[ebp+8]
	mov	dword51,[dword49]
	cmp	dword51,[dword50]
	jle	label0008
	push_all
	lea	dword52,[ebp+40]
	fld	dword ptr [dword52]
	fldz
	fsubrp
	push_argp
	lea	dword53,[ebp+36]
	fld	dword ptr [dword53]
	fldz
	fsubrp
	push_argp
	lea	dword54,[ebp+28]
	mov	dword55,4
	add	dword55,[dword54]
	push_arg	dword ptr [dword55]
	lea	dword56,[ebp+28]
	mov	dword57,[dword56]
	push_arg	dword ptr [dword57]
	lea	dword58,[ebp+20]
	push_arg	dword ptr [dword58]
	lea	dword59,[ebp+16]
	push_arg	dword ptr [dword59]
	lea	dword60,[ebp+12]
	push_arg	dword ptr [dword60]
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0009
label0008:
	push_all
	lea	dword61,[ebp+40]
	fld	dword ptr [dword61]
	fldz
	fsubrp
	push_argp
	lea	dword62,[ebp+36]
	fld	dword ptr [dword62]
	fldz
	fsubrp
	push_argp
	lea	dword63,[ebp+28]
	mov	dword64,4
	add	dword64,[dword63]
	push_arg	dword ptr [dword64]
	lea	dword65,[ebp+28]
	mov	dword66,[dword65]
	push_arg	dword ptr [dword66]
	lea	dword67,[ebp+20]
	push_arg	dword ptr [dword67]
	lea	dword68,[ebp+8]
	push_arg	dword ptr [dword68]
	lea	dword69,[ebp+12]
	push_arg	dword ptr [dword69]
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0009:
label0007:
label0005:
	destroy_stack_frame	0
	ret
__rasterize_triangle_1i endp	

__rasterize_triangle_2i proc
	create_stack_frame	40
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	mov	dword3,4
	add	dword2,dword3
	lea	dword4,[ebp+12]
	mov	dword5,[dword4]
	mov	dword6,4
	add	dword5,dword6
	mov	dword7,[dword2]
	cmp	dword7,[dword5]
	jle	label0000
	lea	dword8,[ebp-4]
	lea	dword9,[ebp+8]
	mov	dword10,[dword9]
	mov	[dword8],dword10
	lea	dword11,[ebp+8]
	lea	dword12,[ebp+12]
	mov	dword13,[dword12]
	mov	[dword11],dword13
	lea	dword14,[ebp+12]
	lea	dword15,[ebp-4]
	mov	dword16,[dword15]
	mov	[dword14],dword16
label0000:
	lea	dword17,[ebp+8]
	mov	dword18,[dword17]
	mov	dword19,4
	add	dword18,dword19
	lea	dword20,[ebp+16]
	mov	dword21,[dword20]
	mov	dword22,4
	add	dword21,dword22
	mov	dword23,[dword18]
	cmp	dword23,[dword21]
	jle	label0001
	lea	dword24,[ebp-4]
	lea	dword25,[ebp+8]
	mov	dword26,[dword25]
	mov	[dword24],dword26
	lea	dword27,[ebp+8]
	lea	dword28,[ebp+16]
	mov	dword29,[dword28]
	mov	[dword27],dword29
	lea	dword30,[ebp+16]
	lea	dword31,[ebp-4]
	mov	dword32,[dword31]
	mov	[dword30],dword32
label0001:
	lea	dword33,[ebp+12]
	mov	dword34,[dword33]
	mov	dword35,4
	add	dword34,dword35
	lea	dword36,[ebp+16]
	mov	dword37,[dword36]
	mov	dword38,4
	add	dword37,dword38
	mov	dword39,[dword34]
	cmp	dword39,[dword37]
	jle	label0002
	lea	dword40,[ebp-4]
	lea	dword41,[ebp+12]
	mov	dword42,[dword41]
	mov	[dword40],dword42
	lea	dword43,[ebp+12]
	lea	dword44,[ebp+16]
	mov	dword45,[dword44]
	mov	[dword43],dword45
	lea	dword46,[ebp+16]
	lea	dword47,[ebp-4]
	mov	dword48,[dword47]
	mov	[dword46],dword48
label0002:
	lea	dword49,[ebp+8]
	mov	dword50,[dword49]
	mov	dword51,4
	add	dword50,dword51
	lea	dword52,[ebp+16]
	mov	dword53,[dword52]
	mov	dword54,4
	add	dword53,dword54
	mov	dword55,[dword50]
	cmp	dword55,[dword53]
	jne	label0003
	lea	dword56,[ebp+8]
	mov	dword57,[dword56]
	mov	dword58,4
	add	dword57,dword58
	mov	dword59,0
	cmp	[dword57],dword59
	jl	label0004
	lea	dword60,[ebp+8]
	mov	dword61,[dword60]
	mov	dword62,4
	add	dword61,dword62
	lea	dword63,[__height]
	mov	dword64,[dword61]
	cmp	dword64,[dword63]
	jge	label0004
	push_all
	fldz
	push_argp
	fldz
	push_argp
	lea	dword65,[ebp+16]
	mov	dword66,8
	add	dword66,[dword65]
	push_arg	dword66
	lea	dword67,[ebp+12]
	mov	dword68,8
	add	dword68,[dword67]
	push_arg	dword68
	lea	dword69,[ebp+8]
	mov	dword70,8
	add	dword70,[dword69]
	push_arg	dword70
	lea	dword71,[ebp+8]
	mov	dword72,[dword71]
	mov	dword73,4
	add	dword72,dword73
	push_arg	dword ptr [dword72]
	lea	dword74,[ebp+16]
	mov	dword75,[dword74]
	push_arg	dword ptr [dword75]
	lea	dword76,[ebp+12]
	mov	dword77,[dword76]
	push_arg	dword ptr [dword77]
	lea	dword78,[ebp+8]
	mov	dword79,[dword78]
	push_arg	dword ptr [dword79]
	call	__rasterize_triangle_1i
	restore_stack	36
	pop_all
label0004:
	destroy_stack_frame	40
	ret
label0003:
	lea	dword80,[ebp+8]
	mov	dword81,[dword80]
	mov	dword82,4
	add	dword81,dword82
	lea	dword83,[ebp-16]
	mov	dword84,[dword81]
	mov	[dword83],dword84
label0005:
label0006:
	lea	dword85,[ebp+12]
	mov	dword86,[dword85]
	mov	dword87,4
	add	dword86,dword87
	lea	dword88,[ebp-16]
	mov	dword89,[dword86]
	cmp	dword89,[dword88]
	jl	label0007
	lea	dword90,[ebp+8]
	mov	dword91,[dword90]
	mov	dword92,4
	add	dword91,dword92
	lea	dword93,[ebp-16]
	mov	dword94,[dword93]
	sub	dword94,[dword91]
	lea	dword95,[ebp+12]
	mov	dword96,[dword95]
	lea	dword97,[ebp+8]
	mov	dword98,[dword97]
	mov	dword99,[dword96]
	sub	dword99,[dword98]
	imul	dword94,dword99
	lea	dword100,[ebp+12]
	mov	dword101,[dword100]
	mov	dword102,4
	add	dword101,dword102
	lea	dword103,[ebp+8]
	mov	dword104,[dword103]
	mov	dword105,4
	add	dword104,dword105
	mov	dword106,[dword101]
	sub	dword106,[dword104]
	mov	eax,dword94
	cdq
	idiv	dword106
	lea	dword107,[ebp+8]
	mov	dword108,[dword107]
	add	eax,[dword108]
	lea	dword109,[ebp-8]
	mov	[dword109],eax
	lea	dword110,[ebp+8]
	mov	dword111,[dword110]
	mov	dword112,4
	add	dword111,dword112
	lea	dword113,[ebp-16]
	mov	dword114,[dword113]
	sub	dword114,[dword111]
	lea	dword115,[ebp+16]
	mov	dword116,[dword115]
	lea	dword117,[ebp+8]
	mov	dword118,[dword117]
	mov	dword119,[dword116]
	sub	dword119,[dword118]
	imul	dword114,dword119
	lea	dword120,[ebp+16]
	mov	dword121,[dword120]
	mov	dword122,4
	add	dword121,dword122
	lea	dword123,[ebp+8]
	mov	dword124,[dword123]
	mov	dword125,4
	add	dword124,dword125
	mov	dword126,[dword121]
	sub	dword126,[dword124]
	mov	eax,dword114
	cdq
	idiv	dword126
	lea	dword127,[ebp+8]
	mov	dword128,[dword127]
	add	eax,[dword128]
	lea	dword129,[ebp-12]
	mov	[dword129],eax
	lea	dword130,[ebp-20]
	lea	dword131,[ebp+8]
	mov	dword132,[dword131]
	mov	dword133,4
	add	dword132,dword133
	lea	dword134,[ebp-16]
	mov	dword135,[dword134]
	sub	dword135,[dword132]
	int2float	dword135
	lea	dword136,[ebp+12]
	mov	dword137,8
	add	dword137,[dword136]
	lea	dword138,[ebp+8]
	mov	dword139,8
	add	dword139,[dword138]
	fld	dword ptr [dword137]
	fsub	dword ptr [dword139]
	fmulp
	lea	dword140,[ebp+12]
	mov	dword141,[dword140]
	mov	dword142,4
	add	dword141,dword142
	lea	dword143,[ebp+8]
	mov	dword144,[dword143]
	mov	dword145,4
	add	dword144,dword145
	mov	dword146,[dword141]
	sub	dword146,[dword144]
	int2float	dword146
	fdivp
	lea	dword147,[ebp+8]
	mov	dword148,8
	add	dword148,[dword147]
	fadd	dword ptr [dword148]
	fstp	dword ptr [dword130]
	lea	dword149,[ebp-28]
	lea	dword150,[ebp+8]
	mov	dword151,[dword150]
	mov	dword152,4
	add	dword151,dword152
	lea	dword153,[ebp-16]
	mov	dword154,[dword153]
	sub	dword154,[dword151]
	int2float	dword154
	lea	dword155,[ebp+16]
	mov	dword156,8
	add	dword156,[dword155]
	lea	dword157,[ebp+8]
	mov	dword158,8
	add	dword158,[dword157]
	fld	dword ptr [dword156]
	fsub	dword ptr [dword158]
	fmulp
	lea	dword159,[ebp+16]
	mov	dword160,[dword159]
	mov	dword161,4
	add	dword160,dword161
	lea	dword162,[ebp+8]
	mov	dword163,[dword162]
	mov	dword164,4
	add	dword163,dword164
	mov	dword165,[dword160]
	sub	dword165,[dword163]
	int2float	dword165
	fdivp
	lea	dword166,[ebp+8]
	mov	dword167,8
	add	dword167,[dword166]
	fadd	dword ptr [dword167]
	fstp	dword ptr [dword149]
	lea	dword168,[ebp-24]
	lea	dword169,[ebp+8]
	mov	dword170,[dword169]
	mov	dword171,4
	add	dword170,dword171
	lea	dword172,[ebp-16]
	mov	dword173,[dword172]
	sub	dword173,[dword170]
	int2float	dword173
	lea	dword174,[ebp+12]
	mov	dword175,8
	add	dword175,[dword174]
	mov	dword176,4
	add	dword175,dword176
	lea	dword177,[ebp+8]
	mov	dword178,8
	add	dword178,[dword177]
	mov	dword179,4
	add	dword178,dword179
	fld	dword ptr [dword175]
	fsub	dword ptr [dword178]
	fmulp
	lea	dword180,[ebp+12]
	mov	dword181,[dword180]
	mov	dword182,4
	add	dword181,dword182
	lea	dword183,[ebp+8]
	mov	dword184,[dword183]
	mov	dword185,4
	add	dword184,dword185
	mov	dword186,[dword181]
	sub	dword186,[dword184]
	int2float	dword186
	fdivp
	lea	dword187,[ebp+8]
	mov	dword188,8
	add	dword188,[dword187]
	mov	dword189,4
	add	dword188,dword189
	fadd	dword ptr [dword188]
	fstp	dword ptr [dword168]
	lea	dword190,[ebp-32]
	lea	dword191,[ebp+8]
	mov	dword192,[dword191]
	mov	dword193,4
	add	dword192,dword193
	lea	dword194,[ebp-16]
	mov	dword195,[dword194]
	sub	dword195,[dword192]
	int2float	dword195
	lea	dword196,[ebp+16]
	mov	dword197,8
	add	dword197,[dword196]
	mov	dword198,4
	add	dword197,dword198
	lea	dword199,[ebp+8]
	mov	dword200,8
	add	dword200,[dword199]
	mov	dword201,4
	add	dword200,dword201
	fld	dword ptr [dword197]
	fsub	dword ptr [dword200]
	fmulp
	lea	dword202,[ebp+16]
	mov	dword203,[dword202]
	mov	dword204,4
	add	dword203,dword204
	lea	dword205,[ebp+8]
	mov	dword206,[dword205]
	mov	dword207,4
	add	dword206,dword207
	mov	dword208,[dword203]
	sub	dword208,[dword206]
	int2float	dword208
	fdivp
	lea	dword209,[ebp+8]
	mov	dword210,8
	add	dword210,[dword209]
	mov	dword211,4
	add	dword210,dword211
	fadd	dword ptr [dword210]
	fstp	dword ptr [dword190]
	lea	dword212,[ebp-36]
	lea	dword213,[ebp-28]
	lea	dword214,[ebp-20]
	fld	dword ptr [dword213]
	fsub	dword ptr [dword214]
	lea	dword215,[ebp-12]
	lea	dword216,[ebp-8]
	mov	dword217,[dword215]
	sub	dword217,[dword216]
	int2float	dword217
	fdivp
	fstp	dword ptr [dword212]
	lea	dword218,[ebp-40]
	lea	dword219,[ebp-32]
	lea	dword220,[ebp-24]
	fld	dword ptr [dword219]
	fsub	dword ptr [dword220]
	lea	dword221,[ebp-12]
	lea	dword222,[ebp-8]
	mov	dword223,[dword221]
	sub	dword223,[dword222]
	int2float	dword223
	fdivp
	fstp	dword ptr [dword218]
	push_all
	lea	dword224,[ebp-40]
	push_arg	dword ptr [dword224]
	lea	dword225,[ebp-36]
	push_arg	dword ptr [dword225]
	lea	dword226,[ebp-32]
	push_arg	dword ptr [dword226]
	lea	dword227,[ebp-28]
	push_arg	dword ptr [dword227]
	lea	dword228,[ebp-24]
	push_arg	dword ptr [dword228]
	lea	dword229,[ebp-20]
	push_arg	dword ptr [dword229]
	lea	dword230,[ebp-16]
	push_arg	dword ptr [dword230]
	lea	dword231,[ebp-12]
	push_arg	dword ptr [dword231]
	lea	dword232,[ebp-8]
	push_arg	dword ptr [dword232]
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	lea	dword233,[ebp-16]
	inc	dword ptr [dword233]
	jmp	label0006
label0007:
	lea	dword234,[ebp+12]
	mov	dword235,[dword234]
	mov	dword236,4
	add	dword235,dword236
	lea	dword237,[ebp+8]
	mov	dword238,[dword237]
	mov	dword239,4
	add	dword238,dword239
	mov	dword240,[dword235]
	sub	dword240,[dword238]
	lea	dword241,[ebp+16]
	mov	dword242,[dword241]
	lea	dword243,[ebp+8]
	mov	dword244,[dword243]
	mov	dword245,[dword242]
	sub	dword245,[dword244]
	imul	dword240,dword245
	lea	dword246,[ebp+16]
	mov	dword247,[dword246]
	mov	dword248,4
	add	dword247,dword248
	lea	dword249,[ebp+8]
	mov	dword250,[dword249]
	mov	dword251,4
	add	dword250,dword251
	mov	dword252,[dword247]
	sub	dword252,[dword250]
	mov	eax,dword240
	cdq
	idiv	dword252
	lea	dword253,[ebp+8]
	mov	dword254,[dword253]
	add	eax,[dword254]
	lea	dword255,[ebp-12]
	mov	[dword255],eax
	lea	dword256,[ebp-28]
	lea	dword257,[ebp+12]
	mov	dword258,[dword257]
	mov	dword259,4
	add	dword258,dword259
	lea	dword260,[ebp+8]
	mov	dword261,[dword260]
	mov	dword262,4
	add	dword261,dword262
	mov	dword263,[dword258]
	sub	dword263,[dword261]
	int2float	dword263
	lea	dword264,[ebp+16]
	mov	dword265,8
	add	dword265,[dword264]
	lea	dword266,[ebp+8]
	mov	dword267,8
	add	dword267,[dword266]
	fld	dword ptr [dword265]
	fsub	dword ptr [dword267]
	fmulp
	lea	dword268,[ebp+16]
	mov	dword269,[dword268]
	mov	dword270,4
	add	dword269,dword270
	lea	dword271,[ebp+8]
	mov	dword272,[dword271]
	mov	dword273,4
	add	dword272,dword273
	mov	dword274,[dword269]
	sub	dword274,[dword272]
	int2float	dword274
	fdivp
	lea	dword275,[ebp+8]
	mov	dword276,8
	add	dword276,[dword275]
	fadd	dword ptr [dword276]
	fstp	dword ptr [dword256]
	lea	dword277,[ebp-32]
	lea	dword278,[ebp+12]
	mov	dword279,[dword278]
	mov	dword280,4
	add	dword279,dword280
	lea	dword281,[ebp+8]
	mov	dword282,[dword281]
	mov	dword283,4
	add	dword282,dword283
	mov	dword284,[dword279]
	sub	dword284,[dword282]
	int2float	dword284
	lea	dword285,[ebp+16]
	mov	dword286,8
	add	dword286,[dword285]
	mov	dword287,4
	add	dword286,dword287
	lea	dword288,[ebp+8]
	mov	dword289,8
	add	dword289,[dword288]
	mov	dword290,4
	add	dword289,dword290
	fld	dword ptr [dword286]
	fsub	dword ptr [dword289]
	fmulp
	lea	dword291,[ebp+16]
	mov	dword292,[dword291]
	mov	dword293,4
	add	dword292,dword293
	lea	dword294,[ebp+8]
	mov	dword295,[dword294]
	mov	dword296,4
	add	dword295,dword296
	mov	dword297,[dword292]
	sub	dword297,[dword295]
	int2float	dword297
	fdivp
	lea	dword298,[ebp+8]
	mov	dword299,8
	add	dword299,[dword298]
	mov	dword300,4
	add	dword299,dword300
	fadd	dword ptr [dword299]
	fstp	dword ptr [dword277]
	lea	dword301,[ebp-36]
	lea	dword302,[ebp-28]
	lea	dword303,[ebp+12]
	mov	dword304,8
	add	dword304,[dword303]
	fld	dword ptr [dword302]
	fsub	dword ptr [dword304]
	lea	dword305,[ebp+12]
	mov	dword306,[dword305]
	lea	dword307,[ebp-12]
	mov	dword308,[dword307]
	sub	dword308,[dword306]
	int2float	dword308
	fdivp
	fstp	dword ptr [dword301]
	lea	dword309,[ebp-40]
	lea	dword310,[ebp-32]
	lea	dword311,[ebp+12]
	mov	dword312,8
	add	dword312,[dword311]
	mov	dword313,4
	add	dword312,dword313
	fld	dword ptr [dword310]
	fsub	dword ptr [dword312]
	lea	dword314,[ebp+12]
	mov	dword315,[dword314]
	lea	dword316,[ebp-12]
	mov	dword317,[dword316]
	sub	dword317,[dword315]
	int2float	dword317
	fdivp
	fstp	dword ptr [dword309]
	push_all
	lea	dword318,[ebp-40]
	push_arg	dword ptr [dword318]
	lea	dword319,[ebp-36]
	push_arg	dword ptr [dword319]
	lea	dword320,[ebp+12]
	mov	dword321,8
	add	dword321,[dword320]
	mov	dword322,4
	add	dword321,dword322
	push_arg	dword ptr [dword321]
	lea	dword323,[ebp+12]
	mov	dword324,8
	add	dword324,[dword323]
	push_arg	dword ptr [dword324]
	lea	dword325,[ebp-32]
	push_arg	dword ptr [dword325]
	lea	dword326,[ebp-28]
	push_arg	dword ptr [dword326]
	lea	dword327,[ebp+12]
	mov	dword328,[dword327]
	mov	dword329,4
	add	dword328,dword329
	push_arg	dword ptr [dword328]
	lea	dword330,[ebp+12]
	mov	dword331,[dword330]
	push_arg	dword ptr [dword331]
	lea	dword332,[ebp-12]
	push_arg	dword ptr [dword332]
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	lea	dword333,[ebp+12]
	mov	dword334,[dword333]
	mov	dword335,4
	add	dword334,dword335
	mov	dword336,1
	add	dword336,[dword334]
	lea	dword337,[ebp-16]
	mov	[dword337],dword336
label0008:
label0009:
	lea	dword338,[ebp+16]
	mov	dword339,[dword338]
	mov	dword340,4
	add	dword339,dword340
	lea	dword341,[ebp-16]
	mov	dword342,[dword339]
	cmp	dword342,[dword341]
	jl	label000a
	lea	dword343,[ebp+12]
	mov	dword344,[dword343]
	mov	dword345,4
	add	dword344,dword345
	lea	dword346,[ebp-16]
	mov	dword347,[dword346]
	sub	dword347,[dword344]
	lea	dword348,[ebp+16]
	mov	dword349,[dword348]
	lea	dword350,[ebp+12]
	mov	dword351,[dword350]
	mov	dword352,[dword349]
	sub	dword352,[dword351]
	imul	dword347,dword352
	lea	dword353,[ebp+16]
	mov	dword354,[dword353]
	mov	dword355,4
	add	dword354,dword355
	lea	dword356,[ebp+12]
	mov	dword357,[dword356]
	mov	dword358,4
	add	dword357,dword358
	mov	dword359,[dword354]
	sub	dword359,[dword357]
	mov	eax,dword347
	cdq
	idiv	dword359
	lea	dword360,[ebp+12]
	mov	dword361,[dword360]
	add	eax,[dword361]
	lea	dword362,[ebp-8]
	mov	[dword362],eax
	lea	dword363,[ebp+8]
	mov	dword364,[dword363]
	mov	dword365,4
	add	dword364,dword365
	lea	dword366,[ebp-16]
	mov	dword367,[dword366]
	sub	dword367,[dword364]
	lea	dword368,[ebp+16]
	mov	dword369,[dword368]
	lea	dword370,[ebp+8]
	mov	dword371,[dword370]
	mov	dword372,[dword369]
	sub	dword372,[dword371]
	imul	dword367,dword372
	lea	dword373,[ebp+16]
	mov	dword374,[dword373]
	mov	dword375,4
	add	dword374,dword375
	lea	dword376,[ebp+8]
	mov	dword377,[dword376]
	mov	dword378,4
	add	dword377,dword378
	mov	dword379,[dword374]
	sub	dword379,[dword377]
	mov	eax,dword367
	cdq
	idiv	dword379
	lea	dword380,[ebp+8]
	mov	dword381,[dword380]
	add	eax,[dword381]
	lea	dword382,[ebp-12]
	mov	[dword382],eax
	lea	dword383,[ebp-20]
	lea	dword384,[ebp+12]
	mov	dword385,[dword384]
	mov	dword386,4
	add	dword385,dword386
	lea	dword387,[ebp-16]
	mov	dword388,[dword387]
	sub	dword388,[dword385]
	int2float	dword388
	lea	dword389,[ebp+16]
	mov	dword390,8
	add	dword390,[dword389]
	lea	dword391,[ebp+12]
	mov	dword392,8
	add	dword392,[dword391]
	fld	dword ptr [dword390]
	fsub	dword ptr [dword392]
	fmulp
	lea	dword393,[ebp+16]
	mov	dword394,[dword393]
	mov	dword395,4
	add	dword394,dword395
	lea	dword396,[ebp+12]
	mov	dword397,[dword396]
	mov	dword398,4
	add	dword397,dword398
	mov	dword399,[dword394]
	sub	dword399,[dword397]
	int2float	dword399
	fdivp
	lea	dword400,[ebp+12]
	mov	dword401,8
	add	dword401,[dword400]
	fadd	dword ptr [dword401]
	fstp	dword ptr [dword383]
	lea	dword402,[ebp-28]
	lea	dword403,[ebp+8]
	mov	dword404,[dword403]
	mov	dword405,4
	add	dword404,dword405
	lea	dword406,[ebp-16]
	mov	dword407,[dword406]
	sub	dword407,[dword404]
	int2float	dword407
	lea	dword408,[ebp+16]
	mov	dword409,8
	add	dword409,[dword408]
	lea	dword410,[ebp+8]
	mov	dword411,8
	add	dword411,[dword410]
	fld	dword ptr [dword409]
	fsub	dword ptr [dword411]
	fmulp
	lea	dword412,[ebp+16]
	mov	dword413,[dword412]
	mov	dword414,4
	add	dword413,dword414
	lea	dword415,[ebp+8]
	mov	dword416,[dword415]
	mov	dword417,4
	add	dword416,dword417
	mov	dword418,[dword413]
	sub	dword418,[dword416]
	int2float	dword418
	fdivp
	lea	dword419,[ebp+8]
	mov	dword420,8
	add	dword420,[dword419]
	fadd	dword ptr [dword420]
	fstp	dword ptr [dword402]
	lea	dword421,[ebp-24]
	lea	dword422,[ebp+12]
	mov	dword423,[dword422]
	mov	dword424,4
	add	dword423,dword424
	lea	dword425,[ebp-16]
	mov	dword426,[dword425]
	sub	dword426,[dword423]
	int2float	dword426
	lea	dword427,[ebp+16]
	mov	dword428,8
	add	dword428,[dword427]
	mov	dword429,4
	add	dword428,dword429
	lea	dword430,[ebp+12]
	mov	dword431,8
	add	dword431,[dword430]
	mov	dword432,4
	add	dword431,dword432
	fld	dword ptr [dword428]
	fsub	dword ptr [dword431]
	fmulp
	lea	dword433,[ebp+16]
	mov	dword434,[dword433]
	mov	dword435,4
	add	dword434,dword435
	lea	dword436,[ebp+12]
	mov	dword437,[dword436]
	mov	dword438,4
	add	dword437,dword438
	mov	dword439,[dword434]
	sub	dword439,[dword437]
	int2float	dword439
	fdivp
	lea	dword440,[ebp+12]
	mov	dword441,8
	add	dword441,[dword440]
	mov	dword442,4
	add	dword441,dword442
	fadd	dword ptr [dword441]
	fstp	dword ptr [dword421]
	lea	dword443,[ebp-32]
	lea	dword444,[ebp+8]
	mov	dword445,[dword444]
	mov	dword446,4
	add	dword445,dword446
	lea	dword447,[ebp-16]
	mov	dword448,[dword447]
	sub	dword448,[dword445]
	int2float	dword448
	lea	dword449,[ebp+16]
	mov	dword450,8
	add	dword450,[dword449]
	mov	dword451,4
	add	dword450,dword451
	lea	dword452,[ebp+8]
	mov	dword453,8
	add	dword453,[dword452]
	mov	dword454,4
	add	dword453,dword454
	fld	dword ptr [dword450]
	fsub	dword ptr [dword453]
	fmulp
	lea	dword455,[ebp+16]
	mov	dword456,[dword455]
	mov	dword457,4
	add	dword456,dword457
	lea	dword458,[ebp+8]
	mov	dword459,[dword458]
	mov	dword460,4
	add	dword459,dword460
	mov	dword461,[dword456]
	sub	dword461,[dword459]
	int2float	dword461
	fdivp
	lea	dword462,[ebp+8]
	mov	dword463,8
	add	dword463,[dword462]
	mov	dword464,4
	add	dword463,dword464
	fadd	dword ptr [dword463]
	fstp	dword ptr [dword443]
	lea	dword465,[ebp-36]
	lea	dword466,[ebp-28]
	lea	dword467,[ebp-20]
	fld	dword ptr [dword466]
	fsub	dword ptr [dword467]
	lea	dword468,[ebp-12]
	lea	dword469,[ebp-8]
	mov	dword470,[dword468]
	sub	dword470,[dword469]
	int2float	dword470
	fdivp
	fstp	dword ptr [dword465]
	lea	dword471,[ebp-40]
	lea	dword472,[ebp-32]
	lea	dword473,[ebp-24]
	fld	dword ptr [dword472]
	fsub	dword ptr [dword473]
	lea	dword474,[ebp-12]
	lea	dword475,[ebp-8]
	mov	dword476,[dword474]
	sub	dword476,[dword475]
	int2float	dword476
	fdivp
	fstp	dword ptr [dword471]
	push_all
	lea	dword477,[ebp-40]
	push_arg	dword ptr [dword477]
	lea	dword478,[ebp-36]
	push_arg	dword ptr [dword478]
	lea	dword479,[ebp-32]
	push_arg	dword ptr [dword479]
	lea	dword480,[ebp-28]
	push_arg	dword ptr [dword480]
	lea	dword481,[ebp-24]
	push_arg	dword ptr [dword481]
	lea	dword482,[ebp-20]
	push_arg	dword ptr [dword482]
	lea	dword483,[ebp-16]
	push_arg	dword ptr [dword483]
	lea	dword484,[ebp-12]
	push_arg	dword ptr [dword484]
	lea	dword485,[ebp-8]
	push_arg	dword ptr [dword485]
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	lea	dword486,[ebp-16]
	inc	dword ptr [dword486]
	jmp	label0009
label000a:
	destroy_stack_frame	40
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	create_stack_frame	60
	lea	dword1,[ebp+8]
	mov	dword2,192
	add	dword2,[dword1]
	mov	dword3,0
	mov	[dword2],dword3
	lea	dword4,[ebp+12]
	mov	dword5,[dword4]
	lea	dword6,[ebp-4]
	mov	[dword6],dword5
	lea	dword7,[ebp+12]
	mov	dword8,[dword7]
	mov	dword9,24
	add	dword8,dword9
	lea	dword10,[ebp-8]
	mov	[dword10],dword8
label0000:
label0001:
	lea	dword11,[ebp+12]
	mov	dword12,192
	add	dword12,[dword11]
	mov	dword13,24
	imul	dword13,[dword12]
	lea	dword14,[ebp+12]
	mov	dword15,[dword14]
	add	dword15,dword13
	lea	dword16,[ebp-8]
	cmp	dword15,[dword16]
	jl	label0002
	push_all
	lea	dword17,[ebp+16]
	push_arg	dword ptr [dword17]
	lea	dword18,[ebp-4]
	mov	dword19,[dword18]
	push_arg	dword19
	lea	dword20,[ebp-24]
	push_arg	dword20
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	lea	dword21,[ebp-52]
	push_all
	lea	dword22,[ebp+20]
	push_arg	dword ptr [dword22]
	lea	dword23,[ebp-24]
	push_arg	dword23
	call	_vec4f_dot
	restore_stack	8
	pop_all
	fstp	dword ptr [dword21]
	push_all
	lea	dword24,[ebp+16]
	push_arg	dword ptr [dword24]
	lea	dword25,[ebp-8]
	mov	dword26,[dword25]
	push_arg	dword26
	lea	dword27,[ebp-24]
	push_arg	dword27
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	lea	dword28,[ebp-56]
	push_all
	lea	dword29,[ebp+20]
	push_arg	dword ptr [dword29]
	lea	dword30,[ebp-24]
	push_arg	dword30
	call	_vec4f_dot
	restore_stack	8
	pop_all
	fstp	dword ptr [dword28]
	lea	dword31,[ebp-52]
	fldz
	fld	dword ptr [dword31]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	lea	dword32,[ebp+8]
	mov	dword33,192
	add	dword33,[dword32]
	mov	dword34,[dword33]
	inc	dword ptr [dword33]
	mov	dword35,24
	imul	dword34,dword35
	lea	dword36,[ebp+8]
	mov	dword37,[dword36]
	add	dword37,dword34
	lea	dword38,[ebp-4]
	mov	dword39,[dword38]
	mov	dword40,[dword39]
	mov	dword41,[dword39+4]
	mov	[dword37],dword40
	mov	[dword37+4],dword41
	mov	dword40,[dword39+8]
	mov	dword41,[dword39+12]
	mov	[dword37+8],dword40
	mov	[dword37+12],dword41
	mov	dword40,[dword39+16]
	mov	dword41,[dword39+20]
	mov	[dword37+16],dword40
	mov	[dword37+20],dword41
label0003:
	lea	dword42,[ebp-52]
	fldz
	fld	dword ptr [dword42]
	fucomip	st,st(1)
	fstp	st
	jbe	label0006
	lea	dword43,[ebp-56]
	fldz
	fld	dword ptr [dword43]
	fucomip	st,st(1)
	fstp	st
	jb	label0005
label0006:
	lea	dword44,[ebp-56]
	fldz
	fld	dword ptr [dword44]
	fucomip	st,st(1)
	fstp	st
	jb	label0004
	lea	dword45,[ebp-52]
	fldz
	fld	dword ptr [dword45]
	fucomip	st,st(1)
	fstp	st
	jae	label0004
label0005:
	push_all
	lea	dword46,[ebp-4]
	mov	dword47,[dword46]
	push_arg	dword47
	lea	dword48,[ebp+16]
	push_arg	dword ptr [dword48]
	lea	dword49,[ebp-24]
	push_arg	dword49
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword50,[ebp-4]
	mov	dword51,[dword50]
	push_arg	dword51
	lea	dword52,[ebp-8]
	mov	dword53,[dword52]
	push_arg	dword53
	lea	dword54,[ebp-40]
	push_arg	dword54
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	lea	dword55,[ebp-60]
	push_all
	lea	dword56,[ebp+20]
	push_arg	dword ptr [dword56]
	lea	dword57,[ebp-24]
	push_arg	dword57
	call	_vec4f_dot
	restore_stack	8
	pop_all
	push_all
	lea	dword58,[ebp+20]
	push_arg	dword ptr [dword58]
	lea	dword59,[ebp-40]
	push_arg	dword59
	call	_vec4f_dot
	restore_stack	8
	pop_all
	fdivp
	fstp	dword ptr [dword55]
	push_all
	lea	dword60,[ebp-60]
	push_arg	dword ptr [dword60]
	lea	dword61,[ebp-40]
	push_arg	dword61
	call	_vec4f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword62,[ebp-40]
	push_arg	dword62
	lea	dword63,[ebp-4]
	mov	dword64,[dword63]
	push_arg	dword64
	lea	dword65,[ebp+8]
	mov	dword66,192
	add	dword66,[dword65]
	mov	dword67,24
	imul	dword67,[dword66]
	lea	dword68,[ebp+8]
	mov	dword69,[dword68]
	add	dword69,dword67
	push_arg	dword69
	call	_vec4f_add
	restore_stack	12
	pop_all
	push_all
	lea	dword70,[ebp-4]
	mov	dword71,16
	add	dword71,[dword70]
	push_arg	dword71
	lea	dword72,[ebp-8]
	mov	dword73,16
	add	dword73,[dword72]
	push_arg	dword73
	lea	dword74,[ebp-48]
	push_arg	dword74
	call	_vec2f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword75,[ebp-60]
	push_arg	dword ptr [dword75]
	lea	dword76,[ebp-48]
	push_arg	dword76
	call	_vec2f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword77,[ebp-48]
	push_arg	dword77
	lea	dword78,[ebp-4]
	mov	dword79,16
	add	dword79,[dword78]
	push_arg	dword79
	lea	dword80,[ebp+8]
	mov	dword81,192
	add	dword81,[dword80]
	mov	dword82,24
	imul	dword82,[dword81]
	lea	dword83,[ebp+8]
	mov	dword84,[dword83]
	add	dword84,dword82
	mov	dword85,16
	add	dword84,dword85
	push_arg	dword84
	call	_vec2f_add
	restore_stack	12
	pop_all
	lea	dword86,[ebp+8]
	mov	dword87,192
	add	dword87,[dword86]
	inc	dword ptr [dword87]
label0004:
	lea	dword88,[ebp-4]
	add	dword ptr [dword88],24
	lea	dword89,[ebp-8]
	add	dword ptr [dword89],24
	jmp	label0001
label0002:
	lea	dword90,[ebp+8]
	mov	dword91,192
	add	dword91,[dword90]
	mov	dword92,[dword91]
	inc	dword ptr [dword91]
	mov	dword93,24
	imul	dword92,dword93
	lea	dword94,[ebp+8]
	mov	dword95,[dword94]
	add	dword95,dword92
	lea	dword96,[ebp+8]
	mov	dword97,[dword96]
	mov	dword98,[dword97]
	mov	dword99,[dword97+4]
	mov	[dword95],dword98
	mov	[dword95+4],dword99
	mov	dword98,[dword97+8]
	mov	dword99,[dword97+12]
	mov	[dword95+8],dword98
	mov	[dword95+12],dword99
	mov	dword98,[dword97+16]
	mov	dword99,[dword97+20]
	mov	[dword95+16],dword98
	mov	[dword95+20],dword99
	destroy_stack_frame	60
	ret
__clip_on_plain endp	

__clip_poligon proc
	create_stack_frame	196
	push_all
	lea	dword1,[__clip_z_far_norm]
	push_arg	dword1
	lea	dword2,[__clip_z_far_base]
	push_arg	dword2
	lea	dword3,[ebp+8]
	push_arg	dword ptr [dword3]
	lea	dword4,[ebp-196]
	push_arg	dword4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword5,[__clip_z_near_norm]
	push_arg	dword5
	lea	dword6,[__clip_z_near_base]
	push_arg	dword6
	lea	dword7,[ebp-196]
	push_arg	dword7
	lea	dword8,[ebp+8]
	push_arg	dword ptr [dword8]
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword9,[__clip_plane_left_norm]
	push_arg	dword9
	lea	dword10,[__clip_plane_left_base]
	push_arg	dword10
	lea	dword11,[ebp+8]
	push_arg	dword ptr [dword11]
	lea	dword12,[ebp-196]
	push_arg	dword12
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword13,[__clip_plane_right_norm]
	push_arg	dword13
	lea	dword14,[__clip_plane_right_base]
	push_arg	dword14
	lea	dword15,[ebp-196]
	push_arg	dword15
	lea	dword16,[ebp+8]
	push_arg	dword ptr [dword16]
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword17,[__clip_plane_top_norm]
	push_arg	dword17
	lea	dword18,[__clip_plane_top_base]
	push_arg	dword18
	lea	dword19,[ebp+8]
	push_arg	dword ptr [dword19]
	lea	dword20,[ebp-196]
	push_arg	dword20
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword21,[__clip_plane_bottom_norm]
	push_arg	dword21
	lea	dword22,[__clip_plane_bottom_base]
	push_arg	dword22
	lea	dword23,[ebp-196]
	push_arg	dword23
	lea	dword24,[ebp+8]
	push_arg	dword ptr [dword24]
	call	__clip_on_plain
	restore_stack	16
	pop_all
	lea	dword25,[ebp+8]
	mov	dword26,192
	add	dword26,[dword25]
	mov	dword27,1
	cmp	[dword26],dword27
	setg	byte1
	movzx	dword28,byte1
	mov	eax,dword28
	destroy_stack_frame	196
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	create_stack_frame	20
	push_all
	lea	dword1,[__viewport_matrix]
	push_arg	dword1
	lea	dword2,[ebp+12]
	push_arg	dword ptr [dword2]
	lea	dword3,[ebp-16]
	push_arg	dword3
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	lea	dword4,[ebp-20]
	fld1
	lea	dword5,[ebp-16]
	mov	dword6,12
	add	dword5,dword6
	fdiv	dword ptr [dword5]
	fstp	dword ptr [dword4]
	lea	dword7,[ebp-16]
	lea	dword8,[ebp-20]
	fld	dword ptr [dword7]
	fmul	dword ptr [dword8]
	float2int	dword9
	lea	dword10,[ebp+8]
	mov	dword11,[dword10]
	mov	[dword11],dword9
	lea	dword12,[ebp-16]
	mov	dword13,4
	add	dword12,dword13
	lea	dword14,[ebp-20]
	fld	dword ptr [dword12]
	fmul	dword ptr [dword14]
	float2int	dword15
	lea	dword16,[ebp+8]
	mov	dword17,4
	add	dword17,[dword16]
	mov	[dword17],dword15
	lea	dword18,[ebp+8]
	mov	dword19,[dword18]
	mov	dword20,0
	cmp	[dword19],dword20
	jl	label0001
	lea	dword21,[ebp+8]
	mov	dword22,[dword21]
	lea	dword23,[__width]
	mov	dword24,[dword22]
	cmp	dword24,[dword23]
	jge	label0001
	lea	dword25,[ebp+8]
	mov	dword26,4
	add	dword26,[dword25]
	mov	dword27,0
	cmp	[dword26],dword27
	jl	label0001
	lea	dword28,[ebp+8]
	mov	dword29,4
	add	dword29,[dword28]
	lea	dword30,[__height]
	mov	dword31,[dword29]
	cmp	dword31,[dword30]
	jl	label0000
label0001:
	mov	dword32,0
	mov	dword33,0
	mov	[dword32],dword33
label0000:
	destroy_stack_frame	20
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	create_stack_frame	136
	push_all
	lea	dword1,[ebp+8]
	push_arg	dword ptr [dword1]
	call	__clip_poligon
	restore_stack	4
	pop_all
	cmp	eax,0
	jne	label0000
	destroy_stack_frame	136
	ret
label0000:
	lea	dword2,[ebp+8]
	mov	dword3,192
	add	dword3,[dword2]
	mov	dword4,8
	cmp	[dword3],dword4
	jle	label0001
	mov	dword5,0
	mov	dword6,0
	mov	[dword5],dword6
label0001:
	lea	dword7,[ebp-136]
	mov	dword8,0
	mov	[dword7],dword8
label0002:
label0003:
	lea	dword9,[ebp+8]
	mov	dword10,192
	add	dword10,[dword9]
	lea	dword11,[ebp-136]
	mov	dword12,[dword10]
	cmp	dword12,[dword11]
	jl	label0004
	push_all
	lea	dword13,[ebp+8]
	mov	dword14,[dword13]
	lea	dword15,[ebp-136]
	mov	dword16,24
	imul	dword16,[dword15]
	add	dword14,dword16
	push_arg	dword14
	lea	dword17,[ebp-132]
	lea	dword18,[ebp-136]
	mov	dword19,4
	mov	dword20,[dword18]
	sal	dword20,dword19
	add	dword17,dword20
	push_arg	dword17
	call	__transform_to_screen_space
	restore_stack	8
	pop_all
	lea	dword21,[ebp-132]
	lea	dword22,[ebp-136]
	mov	dword23,4
	mov	dword24,[dword22]
	sal	dword24,dword23
	add	dword21,dword24
	mov	dword25,8
	add	dword21,dword25
	lea	dword26,[ebp+8]
	mov	dword27,[dword26]
	lea	dword28,[ebp-136]
	mov	dword29,24
	imul	dword29,[dword28]
	add	dword27,dword29
	mov	dword30,16
	add	dword27,dword30
	mov	dword31,[dword27]
	mov	dword32,[dword27+4]
	mov	[dword21],dword31
	mov	[dword21+4],dword32
	lea	dword33,[ebp-136]
	inc	dword ptr [dword33]
	jmp	label0003
label0004:
	lea	dword34,[ebp-136]
	mov	dword35,2
	mov	[dword34],dword35
label0005:
label0006:
	lea	dword36,[ebp+8]
	mov	dword37,192
	add	dword37,[dword36]
	mov	dword38,1
	mov	dword39,[dword37]
	sub	dword39,dword38
	lea	dword40,[ebp-136]
	cmp	dword39,[dword40]
	jl	label0007
	push_all
	lea	dword41,[ebp-132]
	lea	dword42,[ebp-136]
	mov	dword43,4
	mov	dword44,[dword42]
	sal	dword44,dword43
	add	dword41,dword44
	push_arg	dword41
	lea	dword45,[ebp-136]
	mov	dword46,1
	mov	dword47,[dword45]
	sub	dword47,dword46
	mov	dword48,4
	sal	dword47,dword48
	lea	dword49,[ebp-132]
	add	dword49,dword47
	push_arg	dword49
	lea	dword50,[ebp-132]
	push_arg	dword50
	call	__rasterize_triangle_2i
	restore_stack	12
	pop_all
	lea	dword51,[ebp-136]
	inc	dword ptr [dword51]
	jmp	label0006
label0007:
	destroy_stack_frame	136
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	create_stack_frame	16
	push_all
	fld1
	push_argp
	lea	dword1,[ebp+12]
	mov	dword2,8
	add	dword2,[dword1]
	push_arg	dword ptr [dword2]
	lea	dword3,[ebp+12]
	mov	dword4,4
	add	dword4,[dword3]
	push_arg	dword ptr [dword4]
	lea	dword5,[ebp+12]
	mov	dword6,[dword5]
	push_arg	dword ptr [dword6]
	lea	dword7,[ebp-16]
	push_arg	dword7
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	lea	dword8,[__mvproj_matrix]
	push_arg	dword8
	lea	dword9,[ebp-16]
	push_arg	dword9
	lea	dword10,[ebp+8]
	push_arg	dword ptr [dword10]
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	destroy_stack_frame	16
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	create_stack_frame	196
	push_all
	lea	dword1,[ebp+8]
	push_arg	dword ptr [dword1]
	lea	dword2,[ebp-196]
	push_arg	dword2
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword3,[ebp-196]
	mov	dword4,16
	add	dword3,dword4
	lea	dword5,[ebp+20]
	mov	dword6,[dword5]
	mov	dword7,[dword6]
	mov	dword8,[dword6+4]
	mov	[dword3],dword7
	mov	[dword3+4],dword8
	push_all
	lea	dword9,[ebp+12]
	push_arg	dword ptr [dword9]
	lea	dword10,[ebp-196]
	mov	dword11,24
	add	dword10,dword11
	push_arg	dword10
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword12,[ebp-196]
	mov	dword13,24
	add	dword12,dword13
	mov	dword14,16
	add	dword12,dword14
	lea	dword15,[ebp+24]
	mov	dword16,[dword15]
	mov	dword17,[dword16]
	mov	dword18,[dword16+4]
	mov	[dword12],dword17
	mov	[dword12+4],dword18
	push_all
	lea	dword19,[ebp+16]
	push_arg	dword ptr [dword19]
	lea	dword20,[ebp-196]
	mov	dword21,48
	add	dword20,dword21
	push_arg	dword20
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword22,[ebp-196]
	mov	dword23,48
	add	dword22,dword23
	mov	dword24,16
	add	dword22,dword24
	lea	dword25,[ebp+28]
	mov	dword26,[dword25]
	mov	dword27,[dword26]
	mov	dword28,[dword26+4]
	mov	[dword22],dword27
	mov	[dword22+4],dword28
	lea	dword29,[ebp-196]
	mov	dword30,72
	add	dword29,dword30
	lea	dword31,[ebp-196]
	mov	dword32,[dword31]
	mov	dword33,[dword31+4]
	mov	[dword29],dword32
	mov	[dword29+4],dword33
	mov	dword32,[dword31+8]
	mov	dword33,[dword31+12]
	mov	[dword29+8],dword32
	mov	[dword29+12],dword33
	mov	dword32,[dword31+16]
	mov	dword33,[dword31+20]
	mov	[dword29+16],dword32
	mov	[dword29+20],dword33
	lea	dword34,[ebp-196]
	mov	dword35,192
	add	dword34,dword35
	mov	dword36,4
	mov	[dword34],dword36
	push_all
	lea	dword37,[ebp-196]
	push_arg	dword37
	call	__rasterize_polygon_4f
	restore_stack	4
	pop_all
	destroy_stack_frame	196
	ret
_rasterizer_triangle3f endp	

end
