
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
	create_stack_frame
	lea	dword1,[ebp+12]
	mov	dword2,[dword1]
	lea	dword3,[ebp+16]
	mov	dword4,[dword3]
	fld	dword ptr [dword2]
	fadd	dword ptr [dword4]
	lea	dword5,[ebp+8]
	mov	dword6,[dword5]
	fstp	dword ptr [dword6]
	lea	dword7,[ebp+12]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+16]
	mov	dword10,4
	add	dword10,[dword9]
	fld	dword ptr [dword8]
	fadd	dword ptr [dword10]
	lea	dword11,[ebp+8]
	mov	dword12,4
	add	dword12,[dword11]
	fstp	dword ptr [dword12]
	destroy_stack_frame
	ret
_vec2f_add endp	

_vec2f_subtract proc
	create_stack_frame
	lea	dword1,[ebp+12]
	mov	dword2,[dword1]
	lea	dword3,[ebp+16]
	mov	dword4,[dword3]
	fld	dword ptr [dword2]
	fsub	dword ptr [dword4]
	lea	dword5,[ebp+8]
	mov	dword6,[dword5]
	fstp	dword ptr [dword6]
	lea	dword7,[ebp+12]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+16]
	mov	dword10,4
	add	dword10,[dword9]
	fld	dword ptr [dword8]
	fsub	dword ptr [dword10]
	lea	dword11,[ebp+8]
	mov	dword12,4
	add	dword12,[dword11]
	fstp	dword ptr [dword12]
	destroy_stack_frame
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	create_stack_frame
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
	destroy_stack_frame
	ret
_vec2f_mul endp	

_vec4f_assign proc
	create_stack_frame
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
	destroy_stack_frame
	ret
_vec4f_assign endp	

_vec4f_add proc
	create_stack_frame
	lea	dword1,[ebp+12]
	mov	dword2,[dword1]
	lea	dword3,[ebp+16]
	mov	dword4,[dword3]
	fld	dword ptr [dword2]
	fadd	dword ptr [dword4]
	lea	dword5,[ebp+8]
	mov	dword6,[dword5]
	fstp	dword ptr [dword6]
	lea	dword7,[ebp+12]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+16]
	mov	dword10,4
	add	dword10,[dword9]
	fld	dword ptr [dword8]
	fadd	dword ptr [dword10]
	lea	dword11,[ebp+8]
	mov	dword12,4
	add	dword12,[dword11]
	fstp	dword ptr [dword12]
	lea	dword13,[ebp+12]
	mov	dword14,8
	add	dword14,[dword13]
	lea	dword15,[ebp+16]
	mov	dword16,8
	add	dword16,[dword15]
	fld	dword ptr [dword14]
	fadd	dword ptr [dword16]
	lea	dword17,[ebp+8]
	mov	dword18,8
	add	dword18,[dword17]
	fstp	dword ptr [dword18]
	lea	dword19,[ebp+12]
	mov	dword20,12
	add	dword20,[dword19]
	lea	dword21,[ebp+16]
	mov	dword22,12
	add	dword22,[dword21]
	fld	dword ptr [dword20]
	fadd	dword ptr [dword22]
	lea	dword23,[ebp+8]
	mov	dword24,12
	add	dword24,[dword23]
	fstp	dword ptr [dword24]
	destroy_stack_frame
	ret
_vec4f_add endp	

_vec4f_subtract proc
	create_stack_frame
	lea	dword1,[ebp+12]
	mov	dword2,[dword1]
	lea	dword3,[ebp+16]
	mov	dword4,[dword3]
	fld	dword ptr [dword2]
	fsub	dword ptr [dword4]
	lea	dword5,[ebp+8]
	mov	dword6,[dword5]
	fstp	dword ptr [dword6]
	lea	dword7,[ebp+12]
	mov	dword8,4
	add	dword8,[dword7]
	lea	dword9,[ebp+16]
	mov	dword10,4
	add	dword10,[dword9]
	fld	dword ptr [dword8]
	fsub	dword ptr [dword10]
	lea	dword11,[ebp+8]
	mov	dword12,4
	add	dword12,[dword11]
	fstp	dword ptr [dword12]
	lea	dword13,[ebp+12]
	mov	dword14,8
	add	dword14,[dword13]
	lea	dword15,[ebp+16]
	mov	dword16,8
	add	dword16,[dword15]
	fld	dword ptr [dword14]
	fsub	dword ptr [dword16]
	lea	dword17,[ebp+8]
	mov	dword18,8
	add	dword18,[dword17]
	fstp	dword ptr [dword18]
	lea	dword19,[ebp+12]
	mov	dword20,12
	add	dword20,[dword19]
	lea	dword21,[ebp+16]
	mov	dword22,12
	add	dword22,[dword21]
	fld	dword ptr [dword20]
	fsub	dword ptr [dword22]
	lea	dword23,[ebp+8]
	mov	dword24,12
	add	dword24,[dword23]
	fstp	dword ptr [dword24]
	destroy_stack_frame
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	create_stack_frame
	lea	dword1,[ebp+8]
	mov	dword2,4
	add	dword2,[dword1]
	lea	dword3,[ebp+12]
	mov	dword4,4
	add	dword4,[dword3]
	fld	dword ptr [dword2]
	fmul	dword ptr [dword4]
	lea	dword5,[ebp+8]
	mov	dword6,[dword5]
	lea	dword7,[ebp+12]
	mov	dword8,[dword7]
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
	destroy_stack_frame
	ret
_vec4f_dot endp	

_vec4f_mul proc
	create_stack_frame
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
	destroy_stack_frame
	ret
_vec4f_mul endp	

.data

___unnamed_float_0	dd	0.000100
public	___unnamed_float_0

.code

_vec4f_is_equal proc
	create_stack_frame
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
	push_all
	lea	dword4,[ebp-16]
	push_arg	dword4
	lea	dword5,[ebp-16]
	push_arg	dword5
	call	_vec4f_dot
	restore_stack	8
	pop_all
	lea	dword6,[ebp-20]
	fstp	dword ptr [dword6]
	lea	dword7,[ebp-20]
	fld	dword ptr [dword7]
	lea	dword8,dword ptr [___unnamed_float_0]
	fld	qword ptr [dword8]
	fucomip	st,st(1)
	fstp	st
	seta	byte1
	movzx	dword9,byte1
	mov	eax,dword9
	destroy_stack_frame
	ret
_vec4f_is_equal endp	

_matrix4f_make_identity proc
	create_stack_frame
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
	destroy_stack_frame
	ret
_matrix4f_make_identity endp	

_matrix4f_make_perspective proc
	create_stack_frame
	lea	dword1,[ebp+20]
	lea	dword2,[ebp+12]
	fld	dword ptr [dword1]
	fmul	dword ptr [dword2]
	lea	dword3,[ebp-4]
	fstp	dword ptr [dword3]
	lea	dword4,[ebp-4]
	lea	dword5,[ebp+24]
	fld	dword ptr [dword4]
	fmul	dword ptr [dword5]
	lea	dword6,[ebp-8]
	fstp	dword ptr [dword6]
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
	lea	dword34,[ebp+12]
	fld	dword ptr [dword33]
	fsub	dword ptr [dword34]
	lea	dword35,[ebp+16]
	fdivr	dword ptr [dword35]
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
	destroy_stack_frame
	ret
_matrix4f_make_perspective endp	

.data

___unnamed_float_1	dd	2.000000
public	___unnamed_float_1

.code

_matrix4f_make_viewport proc
	create_stack_frame
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,[ebp+12]
	lea	dword4,dword ptr [___unnamed_float_1]
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
	lea	dword16,dword ptr [___unnamed_float_1]
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
	lea	dword34,dword ptr [___unnamed_float_1]
	fld	dword ptr [dword34]
	fdivr	dword ptr [dword33]
	fstp	dword ptr [dword32]
	lea	dword35,[ebp+8]
	mov	dword36,52
	add	dword36,[dword35]
	lea	dword37,[ebp+16]
	lea	dword38,dword ptr [___unnamed_float_1]
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
	destroy_stack_frame
	ret
_matrix4f_make_viewport endp	

_matrix4f_mul proc
	create_stack_frame
	lea	dword1,[ebp+12]
	mov	dword2,4
	add	dword2,[dword1]
	lea	dword3,[ebp+16]
	mov	dword4,16
	add	dword4,[dword3]
	fld	dword ptr [dword2]
	fmul	dword ptr [dword4]
	lea	dword5,[ebp+12]
	mov	dword6,[dword5]
	lea	dword7,[ebp+16]
	mov	dword8,[dword7]
	fld	dword ptr [dword6]
	fmul	dword ptr [dword8]
	faddp
	lea	dword9,[ebp+12]
	mov	dword10,8
	add	dword10,[dword9]
	lea	dword11,[ebp+16]
	mov	dword12,32
	add	dword12,[dword11]
	fld	dword ptr [dword10]
	fmul	dword ptr [dword12]
	faddp
	lea	dword13,[ebp+12]
	mov	dword14,12
	add	dword14,[dword13]
	lea	dword15,[ebp+16]
	mov	dword16,48
	add	dword16,[dword15]
	fld	dword ptr [dword14]
	fmul	dword ptr [dword16]
	faddp
	lea	dword17,[ebp+8]
	mov	dword18,[dword17]
	fstp	dword ptr [dword18]
	lea	dword19,[ebp+16]
	mov	dword20,4
	add	dword20,[dword19]
	lea	dword21,[ebp+12]
	mov	dword22,[dword21]
	fld	dword ptr [dword22]
	fmul	dword ptr [dword20]
	lea	dword23,[ebp+12]
	mov	dword24,4
	add	dword24,[dword23]
	lea	dword25,[ebp+16]
	mov	dword26,20
	add	dword26,[dword25]
	fld	dword ptr [dword24]
	fmul	dword ptr [dword26]
	faddp
	lea	dword27,[ebp+12]
	mov	dword28,8
	add	dword28,[dword27]
	lea	dword29,[ebp+16]
	mov	dword30,36
	add	dword30,[dword29]
	fld	dword ptr [dword28]
	fmul	dword ptr [dword30]
	faddp
	lea	dword31,[ebp+12]
	mov	dword32,12
	add	dword32,[dword31]
	lea	dword33,[ebp+16]
	mov	dword34,52
	add	dword34,[dword33]
	fld	dword ptr [dword32]
	fmul	dword ptr [dword34]
	faddp
	lea	dword35,[ebp+8]
	mov	dword36,4
	add	dword36,[dword35]
	fstp	dword ptr [dword36]
	lea	dword37,[ebp+16]
	mov	dword38,8
	add	dword38,[dword37]
	lea	dword39,[ebp+12]
	mov	dword40,[dword39]
	fld	dword ptr [dword40]
	fmul	dword ptr [dword38]
	lea	dword41,[ebp+12]
	mov	dword42,4
	add	dword42,[dword41]
	lea	dword43,[ebp+16]
	mov	dword44,24
	add	dword44,[dword43]
	fld	dword ptr [dword42]
	fmul	dword ptr [dword44]
	faddp
	lea	dword45,[ebp+12]
	mov	dword46,8
	add	dword46,[dword45]
	lea	dword47,[ebp+16]
	mov	dword48,40
	add	dword48,[dword47]
	fld	dword ptr [dword46]
	fmul	dword ptr [dword48]
	faddp
	lea	dword49,[ebp+12]
	mov	dword50,12
	add	dword50,[dword49]
	lea	dword51,[ebp+16]
	mov	dword52,56
	add	dword52,[dword51]
	fld	dword ptr [dword50]
	fmul	dword ptr [dword52]
	faddp
	lea	dword53,[ebp+8]
	mov	dword54,8
	add	dword54,[dword53]
	fstp	dword ptr [dword54]
	lea	dword55,[ebp+16]
	mov	dword56,12
	add	dword56,[dword55]
	lea	dword57,[ebp+12]
	mov	dword58,[dword57]
	fld	dword ptr [dword58]
	fmul	dword ptr [dword56]
	lea	dword59,[ebp+12]
	mov	dword60,4
	add	dword60,[dword59]
	lea	dword61,[ebp+16]
	mov	dword62,28
	add	dword62,[dword61]
	fld	dword ptr [dword60]
	fmul	dword ptr [dword62]
	faddp
	lea	dword63,[ebp+12]
	mov	dword64,8
	add	dword64,[dword63]
	lea	dword65,[ebp+16]
	mov	dword66,44
	add	dword66,[dword65]
	fld	dword ptr [dword64]
	fmul	dword ptr [dword66]
	faddp
	lea	dword67,[ebp+12]
	mov	dword68,12
	add	dword68,[dword67]
	lea	dword69,[ebp+16]
	mov	dword70,60
	add	dword70,[dword69]
	fld	dword ptr [dword68]
	fmul	dword ptr [dword70]
	faddp
	lea	dword71,[ebp+8]
	mov	dword72,12
	add	dword72,[dword71]
	fstp	dword ptr [dword72]
	lea	dword73,[ebp+12]
	mov	dword74,16
	add	dword74,[dword73]
	lea	dword75,[ebp+16]
	mov	dword76,[dword75]
	fld	dword ptr [dword74]
	fmul	dword ptr [dword76]
	lea	dword77,[ebp+12]
	mov	dword78,20
	add	dword78,[dword77]
	lea	dword79,[ebp+16]
	mov	dword80,16
	add	dword80,[dword79]
	fld	dword ptr [dword78]
	fmul	dword ptr [dword80]
	faddp
	lea	dword81,[ebp+12]
	mov	dword82,24
	add	dword82,[dword81]
	lea	dword83,[ebp+16]
	mov	dword84,32
	add	dword84,[dword83]
	fld	dword ptr [dword82]
	fmul	dword ptr [dword84]
	faddp
	lea	dword85,[ebp+12]
	mov	dword86,28
	add	dword86,[dword85]
	lea	dword87,[ebp+16]
	mov	dword88,48
	add	dword88,[dword87]
	fld	dword ptr [dword86]
	fmul	dword ptr [dword88]
	faddp
	lea	dword89,[ebp+8]
	mov	dword90,16
	add	dword90,[dword89]
	fstp	dword ptr [dword90]
	lea	dword91,[ebp+12]
	mov	dword92,16
	add	dword92,[dword91]
	lea	dword93,[ebp+16]
	mov	dword94,4
	add	dword94,[dword93]
	fld	dword ptr [dword92]
	fmul	dword ptr [dword94]
	lea	dword95,[ebp+12]
	mov	dword96,20
	add	dword96,[dword95]
	lea	dword97,[ebp+16]
	mov	dword98,20
	add	dword98,[dword97]
	fld	dword ptr [dword96]
	fmul	dword ptr [dword98]
	faddp
	lea	dword99,[ebp+12]
	mov	dword100,24
	add	dword100,[dword99]
	lea	dword101,[ebp+16]
	mov	dword102,36
	add	dword102,[dword101]
	fld	dword ptr [dword100]
	fmul	dword ptr [dword102]
	faddp
	lea	dword103,[ebp+12]
	mov	dword104,28
	add	dword104,[dword103]
	lea	dword105,[ebp+16]
	mov	dword106,52
	add	dword106,[dword105]
	fld	dword ptr [dword104]
	fmul	dword ptr [dword106]
	faddp
	lea	dword107,[ebp+8]
	mov	dword108,20
	add	dword108,[dword107]
	fstp	dword ptr [dword108]
	lea	dword109,[ebp+12]
	mov	dword110,16
	add	dword110,[dword109]
	lea	dword111,[ebp+16]
	mov	dword112,8
	add	dword112,[dword111]
	fld	dword ptr [dword110]
	fmul	dword ptr [dword112]
	lea	dword113,[ebp+12]
	mov	dword114,20
	add	dword114,[dword113]
	lea	dword115,[ebp+16]
	mov	dword116,24
	add	dword116,[dword115]
	fld	dword ptr [dword114]
	fmul	dword ptr [dword116]
	faddp
	lea	dword117,[ebp+12]
	mov	dword118,24
	add	dword118,[dword117]
	lea	dword119,[ebp+16]
	mov	dword120,40
	add	dword120,[dword119]
	fld	dword ptr [dword118]
	fmul	dword ptr [dword120]
	faddp
	lea	dword121,[ebp+12]
	mov	dword122,28
	add	dword122,[dword121]
	lea	dword123,[ebp+16]
	mov	dword124,56
	add	dword124,[dword123]
	fld	dword ptr [dword122]
	fmul	dword ptr [dword124]
	faddp
	lea	dword125,[ebp+8]
	mov	dword126,24
	add	dword126,[dword125]
	fstp	dword ptr [dword126]
	lea	dword127,[ebp+12]
	mov	dword128,16
	add	dword128,[dword127]
	lea	dword129,[ebp+16]
	mov	dword130,12
	add	dword130,[dword129]
	fld	dword ptr [dword128]
	fmul	dword ptr [dword130]
	lea	dword131,[ebp+12]
	mov	dword132,20
	add	dword132,[dword131]
	lea	dword133,[ebp+16]
	mov	dword134,28
	add	dword134,[dword133]
	fld	dword ptr [dword132]
	fmul	dword ptr [dword134]
	faddp
	lea	dword135,[ebp+12]
	mov	dword136,24
	add	dword136,[dword135]
	lea	dword137,[ebp+16]
	mov	dword138,44
	add	dword138,[dword137]
	fld	dword ptr [dword136]
	fmul	dword ptr [dword138]
	faddp
	lea	dword139,[ebp+12]
	mov	dword140,28
	add	dword140,[dword139]
	lea	dword141,[ebp+16]
	mov	dword142,60
	add	dword142,[dword141]
	fld	dword ptr [dword140]
	fmul	dword ptr [dword142]
	faddp
	lea	dword143,[ebp+8]
	mov	dword144,28
	add	dword144,[dword143]
	fstp	dword ptr [dword144]
	lea	dword145,[ebp+12]
	mov	dword146,32
	add	dword146,[dword145]
	lea	dword147,[ebp+16]
	mov	dword148,[dword147]
	fld	dword ptr [dword146]
	fmul	dword ptr [dword148]
	lea	dword149,[ebp+12]
	mov	dword150,36
	add	dword150,[dword149]
	lea	dword151,[ebp+16]
	mov	dword152,16
	add	dword152,[dword151]
	fld	dword ptr [dword150]
	fmul	dword ptr [dword152]
	faddp
	lea	dword153,[ebp+12]
	mov	dword154,40
	add	dword154,[dword153]
	lea	dword155,[ebp+16]
	mov	dword156,32
	add	dword156,[dword155]
	fld	dword ptr [dword154]
	fmul	dword ptr [dword156]
	faddp
	lea	dword157,[ebp+12]
	mov	dword158,44
	add	dword158,[dword157]
	lea	dword159,[ebp+16]
	mov	dword160,48
	add	dword160,[dword159]
	fld	dword ptr [dword158]
	fmul	dword ptr [dword160]
	faddp
	lea	dword161,[ebp+8]
	mov	dword162,32
	add	dword162,[dword161]
	fstp	dword ptr [dword162]
	lea	dword163,[ebp+12]
	mov	dword164,32
	add	dword164,[dword163]
	lea	dword165,[ebp+16]
	mov	dword166,4
	add	dword166,[dword165]
	fld	dword ptr [dword164]
	fmul	dword ptr [dword166]
	lea	dword167,[ebp+12]
	mov	dword168,36
	add	dword168,[dword167]
	lea	dword169,[ebp+16]
	mov	dword170,20
	add	dword170,[dword169]
	fld	dword ptr [dword168]
	fmul	dword ptr [dword170]
	faddp
	lea	dword171,[ebp+12]
	mov	dword172,40
	add	dword172,[dword171]
	lea	dword173,[ebp+16]
	mov	dword174,36
	add	dword174,[dword173]
	fld	dword ptr [dword172]
	fmul	dword ptr [dword174]
	faddp
	lea	dword175,[ebp+12]
	mov	dword176,44
	add	dword176,[dword175]
	lea	dword177,[ebp+16]
	mov	dword178,52
	add	dword178,[dword177]
	fld	dword ptr [dword176]
	fmul	dword ptr [dword178]
	faddp
	lea	dword179,[ebp+8]
	mov	dword180,36
	add	dword180,[dword179]
	fstp	dword ptr [dword180]
	lea	dword181,[ebp+12]
	mov	dword182,32
	add	dword182,[dword181]
	lea	dword183,[ebp+16]
	mov	dword184,8
	add	dword184,[dword183]
	fld	dword ptr [dword182]
	fmul	dword ptr [dword184]
	lea	dword185,[ebp+12]
	mov	dword186,36
	add	dword186,[dword185]
	lea	dword187,[ebp+16]
	mov	dword188,24
	add	dword188,[dword187]
	fld	dword ptr [dword186]
	fmul	dword ptr [dword188]
	faddp
	lea	dword189,[ebp+12]
	mov	dword190,40
	add	dword190,[dword189]
	lea	dword191,[ebp+16]
	mov	dword192,40
	add	dword192,[dword191]
	fld	dword ptr [dword190]
	fmul	dword ptr [dword192]
	faddp
	lea	dword193,[ebp+12]
	mov	dword194,44
	add	dword194,[dword193]
	lea	dword195,[ebp+16]
	mov	dword196,56
	add	dword196,[dword195]
	fld	dword ptr [dword194]
	fmul	dword ptr [dword196]
	faddp
	lea	dword197,[ebp+8]
	mov	dword198,40
	add	dword198,[dword197]
	fstp	dword ptr [dword198]
	lea	dword199,[ebp+12]
	mov	dword200,32
	add	dword200,[dword199]
	lea	dword201,[ebp+16]
	mov	dword202,12
	add	dword202,[dword201]
	fld	dword ptr [dword200]
	fmul	dword ptr [dword202]
	lea	dword203,[ebp+12]
	mov	dword204,36
	add	dword204,[dword203]
	lea	dword205,[ebp+16]
	mov	dword206,28
	add	dword206,[dword205]
	fld	dword ptr [dword204]
	fmul	dword ptr [dword206]
	faddp
	lea	dword207,[ebp+12]
	mov	dword208,40
	add	dword208,[dword207]
	lea	dword209,[ebp+16]
	mov	dword210,44
	add	dword210,[dword209]
	fld	dword ptr [dword208]
	fmul	dword ptr [dword210]
	faddp
	lea	dword211,[ebp+12]
	mov	dword212,44
	add	dword212,[dword211]
	lea	dword213,[ebp+16]
	mov	dword214,60
	add	dword214,[dword213]
	fld	dword ptr [dword212]
	fmul	dword ptr [dword214]
	faddp
	lea	dword215,[ebp+8]
	mov	dword216,44
	add	dword216,[dword215]
	fstp	dword ptr [dword216]
	lea	dword217,[ebp+12]
	mov	dword218,48
	add	dword218,[dword217]
	lea	dword219,[ebp+16]
	mov	dword220,[dword219]
	fld	dword ptr [dword218]
	fmul	dword ptr [dword220]
	lea	dword221,[ebp+12]
	mov	dword222,52
	add	dword222,[dword221]
	lea	dword223,[ebp+16]
	mov	dword224,16
	add	dword224,[dword223]
	fld	dword ptr [dword222]
	fmul	dword ptr [dword224]
	faddp
	lea	dword225,[ebp+12]
	mov	dword226,56
	add	dword226,[dword225]
	lea	dword227,[ebp+16]
	mov	dword228,32
	add	dword228,[dword227]
	fld	dword ptr [dword226]
	fmul	dword ptr [dword228]
	faddp
	lea	dword229,[ebp+12]
	mov	dword230,60
	add	dword230,[dword229]
	lea	dword231,[ebp+16]
	mov	dword232,48
	add	dword232,[dword231]
	fld	dword ptr [dword230]
	fmul	dword ptr [dword232]
	faddp
	lea	dword233,[ebp+8]
	mov	dword234,48
	add	dword234,[dword233]
	fstp	dword ptr [dword234]
	lea	dword235,[ebp+12]
	mov	dword236,48
	add	dword236,[dword235]
	lea	dword237,[ebp+16]
	mov	dword238,4
	add	dword238,[dword237]
	fld	dword ptr [dword236]
	fmul	dword ptr [dword238]
	lea	dword239,[ebp+12]
	mov	dword240,52
	add	dword240,[dword239]
	lea	dword241,[ebp+16]
	mov	dword242,20
	add	dword242,[dword241]
	fld	dword ptr [dword240]
	fmul	dword ptr [dword242]
	faddp
	lea	dword243,[ebp+12]
	mov	dword244,56
	add	dword244,[dword243]
	lea	dword245,[ebp+16]
	mov	dword246,36
	add	dword246,[dword245]
	fld	dword ptr [dword244]
	fmul	dword ptr [dword246]
	faddp
	lea	dword247,[ebp+12]
	mov	dword248,60
	add	dword248,[dword247]
	lea	dword249,[ebp+16]
	mov	dword250,52
	add	dword250,[dword249]
	fld	dword ptr [dword248]
	fmul	dword ptr [dword250]
	faddp
	lea	dword251,[ebp+8]
	mov	dword252,52
	add	dword252,[dword251]
	fstp	dword ptr [dword252]
	lea	dword253,[ebp+12]
	mov	dword254,48
	add	dword254,[dword253]
	lea	dword255,[ebp+16]
	mov	dword256,8
	add	dword256,[dword255]
	fld	dword ptr [dword254]
	fmul	dword ptr [dword256]
	lea	dword257,[ebp+12]
	mov	dword258,52
	add	dword258,[dword257]
	lea	dword259,[ebp+16]
	mov	dword260,24
	add	dword260,[dword259]
	fld	dword ptr [dword258]
	fmul	dword ptr [dword260]
	faddp
	lea	dword261,[ebp+12]
	mov	dword262,56
	add	dword262,[dword261]
	lea	dword263,[ebp+16]
	mov	dword264,40
	add	dword264,[dword263]
	fld	dword ptr [dword262]
	fmul	dword ptr [dword264]
	faddp
	lea	dword265,[ebp+12]
	mov	dword266,60
	add	dword266,[dword265]
	lea	dword267,[ebp+16]
	mov	dword268,56
	add	dword268,[dword267]
	fld	dword ptr [dword266]
	fmul	dword ptr [dword268]
	faddp
	lea	dword269,[ebp+8]
	mov	dword270,56
	add	dword270,[dword269]
	fstp	dword ptr [dword270]
	lea	dword271,[ebp+12]
	mov	dword272,48
	add	dword272,[dword271]
	lea	dword273,[ebp+16]
	mov	dword274,12
	add	dword274,[dword273]
	fld	dword ptr [dword272]
	fmul	dword ptr [dword274]
	lea	dword275,[ebp+12]
	mov	dword276,52
	add	dword276,[dword275]
	lea	dword277,[ebp+16]
	mov	dword278,28
	add	dword278,[dword277]
	fld	dword ptr [dword276]
	fmul	dword ptr [dword278]
	faddp
	lea	dword279,[ebp+12]
	mov	dword280,56
	add	dword280,[dword279]
	lea	dword281,[ebp+16]
	mov	dword282,44
	add	dword282,[dword281]
	fld	dword ptr [dword280]
	fmul	dword ptr [dword282]
	faddp
	lea	dword283,[ebp+12]
	mov	dword284,60
	add	dword284,[dword283]
	lea	dword285,[ebp+16]
	mov	dword286,60
	add	dword286,[dword285]
	fld	dword ptr [dword284]
	fmul	dword ptr [dword286]
	faddp
	lea	dword287,[ebp+8]
	mov	dword288,60
	add	dword288,[dword287]
	fstp	dword ptr [dword288]
	destroy_stack_frame
	ret
_matrix4f_mul endp	

_matrix4f_transform proc
	create_stack_frame
	lea	dword1,[ebp+12]
	mov	dword2,4
	add	dword2,[dword1]
	lea	dword3,[ebp+16]
	mov	dword4,16
	add	dword4,[dword3]
	fld	dword ptr [dword2]
	fmul	dword ptr [dword4]
	lea	dword5,[ebp+12]
	mov	dword6,[dword5]
	lea	dword7,[ebp+16]
	mov	dword8,[dword7]
	fld	dword ptr [dword6]
	fmul	dword ptr [dword8]
	faddp
	lea	dword9,[ebp+12]
	mov	dword10,8
	add	dword10,[dword9]
	lea	dword11,[ebp+16]
	mov	dword12,32
	add	dword12,[dword11]
	fld	dword ptr [dword10]
	fmul	dword ptr [dword12]
	faddp
	lea	dword13,[ebp+12]
	mov	dword14,12
	add	dword14,[dword13]
	lea	dword15,[ebp+16]
	mov	dword16,48
	add	dword16,[dword15]
	fld	dword ptr [dword14]
	fmul	dword ptr [dword16]
	faddp
	lea	dword17,[ebp+8]
	mov	dword18,[dword17]
	fstp	dword ptr [dword18]
	lea	dword19,[ebp+16]
	mov	dword20,4
	add	dword20,[dword19]
	lea	dword21,[ebp+12]
	mov	dword22,[dword21]
	fld	dword ptr [dword22]
	fmul	dword ptr [dword20]
	lea	dword23,[ebp+12]
	mov	dword24,4
	add	dword24,[dword23]
	lea	dword25,[ebp+16]
	mov	dword26,20
	add	dword26,[dword25]
	fld	dword ptr [dword24]
	fmul	dword ptr [dword26]
	faddp
	lea	dword27,[ebp+12]
	mov	dword28,8
	add	dword28,[dword27]
	lea	dword29,[ebp+16]
	mov	dword30,36
	add	dword30,[dword29]
	fld	dword ptr [dword28]
	fmul	dword ptr [dword30]
	faddp
	lea	dword31,[ebp+12]
	mov	dword32,12
	add	dword32,[dword31]
	lea	dword33,[ebp+16]
	mov	dword34,52
	add	dword34,[dword33]
	fld	dword ptr [dword32]
	fmul	dword ptr [dword34]
	faddp
	lea	dword35,[ebp+8]
	mov	dword36,4
	add	dword36,[dword35]
	fstp	dword ptr [dword36]
	lea	dword37,[ebp+16]
	mov	dword38,8
	add	dword38,[dword37]
	lea	dword39,[ebp+12]
	mov	dword40,[dword39]
	fld	dword ptr [dword40]
	fmul	dword ptr [dword38]
	lea	dword41,[ebp+12]
	mov	dword42,4
	add	dword42,[dword41]
	lea	dword43,[ebp+16]
	mov	dword44,24
	add	dword44,[dword43]
	fld	dword ptr [dword42]
	fmul	dword ptr [dword44]
	faddp
	lea	dword45,[ebp+12]
	mov	dword46,8
	add	dword46,[dword45]
	lea	dword47,[ebp+16]
	mov	dword48,40
	add	dword48,[dword47]
	fld	dword ptr [dword46]
	fmul	dword ptr [dword48]
	faddp
	lea	dword49,[ebp+12]
	mov	dword50,12
	add	dword50,[dword49]
	lea	dword51,[ebp+16]
	mov	dword52,56
	add	dword52,[dword51]
	fld	dword ptr [dword50]
	fmul	dword ptr [dword52]
	faddp
	lea	dword53,[ebp+8]
	mov	dword54,8
	add	dword54,[dword53]
	fstp	dword ptr [dword54]
	lea	dword55,[ebp+16]
	mov	dword56,12
	add	dword56,[dword55]
	lea	dword57,[ebp+12]
	mov	dword58,[dword57]
	fld	dword ptr [dword58]
	fmul	dword ptr [dword56]
	lea	dword59,[ebp+12]
	mov	dword60,4
	add	dword60,[dword59]
	lea	dword61,[ebp+16]
	mov	dword62,28
	add	dword62,[dword61]
	fld	dword ptr [dword60]
	fmul	dword ptr [dword62]
	faddp
	lea	dword63,[ebp+12]
	mov	dword64,8
	add	dword64,[dword63]
	lea	dword65,[ebp+16]
	mov	dword66,44
	add	dword66,[dword65]
	fld	dword ptr [dword64]
	fmul	dword ptr [dword66]
	faddp
	lea	dword67,[ebp+12]
	mov	dword68,12
	add	dword68,[dword67]
	lea	dword69,[ebp+16]
	mov	dword70,60
	add	dword70,[dword69]
	fld	dword ptr [dword68]
	fmul	dword ptr [dword70]
	faddp
	lea	dword71,[ebp+8]
	mov	dword72,12
	add	dword72,[dword71]
	fstp	dword ptr [dword72]
	destroy_stack_frame
	ret
_matrix4f_transform endp	

_matrix4f_transpose proc
	create_stack_frame
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
	destroy_stack_frame
	ret
_matrix4f_transpose endp	

.data

___unnamed_float_2	dd	-1.000000
public	___unnamed_float_2

.code

_rasterizer_init proc
	create_stack_frame
	lea	dword1,dword ptr [__dbgprintf]
	lea	dword2,[ebp+8]
	mov	dword3,[dword2]
	mov	[dword1],dword3
	lea	dword4,dword ptr [__width]
	lea	dword5,[ebp+12]
	mov	dword6,[dword5]
	mov	[dword4],dword6
	lea	dword7,dword ptr [__height]
	lea	dword8,[ebp+16]
	mov	dword9,[dword8]
	mov	[dword7],dword9
	lea	dword10,dword ptr [__pitch]
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
	lea	dword18,dword ptr [__mvproj_matrix]
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
	lea	dword23,dword ptr [__viewport_matrix]
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
	lea	dword25,dword ptr [__clip_z_near_base]
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
	lea	dword30,dword ptr [___unnamed_float_2]
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
	lea	dword32,dword ptr [__clip_z_near_norm]
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
	lea	dword34,dword ptr [__clip_z_far_base]
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
	lea	dword38,dword ptr [___unnamed_float_2]
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
	lea	dword41,dword ptr [__clip_z_far_norm]
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
	lea	dword42,[ebp+12]
	fild	dword ptr [dword42]
	fld1
	fdivrp
	lea	dword43,dword ptr [___unnamed_float_2]
	fld	dword ptr [dword43]
	faddp
	push_argp
	lea	dword44,dword ptr [__clip_plane_left_base]
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
	lea	dword45,dword ptr [__clip_plane_left_norm]
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
	lea	dword46,[ebp+12]
	fild	dword ptr [dword46]
	fld1
	fdivrp
	fld1
	fsubrp
	push_argp
	lea	dword47,dword ptr [__clip_plane_right_base]
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
	lea	dword48,dword ptr [___unnamed_float_2]
	fld	dword ptr [dword48]
	push_argp
	lea	dword49,dword ptr [__clip_plane_right_norm]
	push_arg	dword49
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	lea	dword50,[ebp+16]
	fild	dword ptr [dword50]
	fld1
	fdivrp
	lea	dword51,dword ptr [___unnamed_float_2]
	fld	dword ptr [dword51]
	faddp
	push_argp
	fldz
	push_argp
	lea	dword52,dword ptr [__clip_plane_top_base]
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
	lea	dword53,dword ptr [__clip_plane_top_norm]
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
	lea	dword54,dword ptr [__clip_plane_bottom_base]
	push_arg	dword54
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	fldz
	push_argp
	lea	dword55,dword ptr [___unnamed_float_2]
	fld	dword ptr [dword55]
	push_argp
	fldz
	push_argp
	lea	dword56,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword56
	call	_vec4f_assign
	restore_stack	20
	pop_all
	destroy_stack_frame
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	create_stack_frame
	lea	dword1,dword ptr [__videomem]
	lea	dword2,[ebp+8]
	mov	dword3,[dword2]
	mov	[dword1],dword3
	destroy_stack_frame
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	create_stack_frame
	lea	dword1,[ebp+8]
	mov	dword2,[dword1]
	lea	dword3,dword ptr [__mvproj_matrix]
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
	destroy_stack_frame
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	create_stack_frame
	lea	dword1,dword ptr [__color]
	lea	dword2,[ebp+8]
	mov	dword3,[dword2]
	mov	[dword1],dword3
	destroy_stack_frame
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	create_stack_frame
	lea	dword1,dword ptr [__texture_data]
	lea	dword2,[ebp+8]
	mov	dword3,[dword2]
	mov	[dword1],dword3
	lea	dword4,dword ptr [__texture_width]
	lea	dword5,[ebp+12]
	mov	dword6,[dword5]
	mov	[dword4],dword6
	lea	dword7,dword ptr [__texture_height]
	lea	dword8,[ebp+16]
	mov	dword9,[dword8]
	mov	[dword7],dword9
	destroy_stack_frame
	ret
_rasterizer_set_texture endp	

__tex2d proc
	create_stack_frame
	lea	dword1,dword ptr [__texture_width]
	mov	dword2,1
	mov	dword3,[dword1]
	sub	dword3,dword2
	int2float	dword3
	lea	dword4,[ebp+8]
	fmul	dword ptr [dword4]
	float2int	dword5
	lea	dword6,[ebp-4]
	mov	[dword6],dword5
	lea	dword7,dword ptr [__texture_height]
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
	lea	dword14,dword ptr [__texture_width]
	mov	dword15,[dword13]
	imul	dword15,[dword14]
	lea	dword16,[ebp-4]
	add	dword15,[dword16]
	mov	dword17,2
	sal	dword15,dword17
	lea	dword18,dword ptr [__texture_data]
	add	dword15,[dword18]
	mov	eax,[dword15]
	destroy_stack_frame
	ret
__tex2d endp	

.data

___unnamed_float_3	dd	255.000000
public	___unnamed_float_3

.code

__rasterize_horiz_line proc
	create_stack_frame
	lea	dword1,dword ptr [__pitch]
	lea	dword2,[ebp+16]
	mov	dword3,[dword1]
	imul	dword3,[dword2]
	lea	dword4,dword ptr [__videomem]
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
	lea	dword26,[ebp-40]
	fild	dword ptr [dword26]
	lea	dword27,dword ptr [___unnamed_float_3]
	fld	dword ptr [dword27]
	fdivp
	lea	dword28,[ebp-44]
	fstp	dword ptr [dword28]
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
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	create_stack_frame
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
	destroy_stack_frame
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	create_stack_frame
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
	destroy_stack_frame
	ret
__rasterize_triangle_1i endp	

__rasterize_triangle_2i proc
	create_stack_frame
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
	lea	dword63,dword ptr [__height]
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
	destroy_stack_frame
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
	lea	dword130,[ebp+8]
	mov	dword131,[dword130]
	mov	dword132,4
	add	dword131,dword132
	lea	dword133,[ebp-16]
	mov	dword134,[dword133]
	sub	dword134,[dword131]
	int2float	dword134
	lea	dword135,[ebp+12]
	mov	dword136,8
	add	dword136,[dword135]
	lea	dword137,[ebp+8]
	mov	dword138,8
	add	dword138,[dword137]
	fld	dword ptr [dword136]
	fsub	dword ptr [dword138]
	fmulp
	lea	dword139,[ebp+12]
	mov	dword140,[dword139]
	mov	dword141,4
	add	dword140,dword141
	lea	dword142,[ebp+8]
	mov	dword143,[dword142]
	mov	dword144,4
	add	dword143,dword144
	mov	dword145,[dword140]
	sub	dword145,[dword143]
	int2float	dword145
	fdivp
	lea	dword146,[ebp+8]
	mov	dword147,8
	add	dword147,[dword146]
	fadd	dword ptr [dword147]
	lea	dword148,[ebp-20]
	fstp	dword ptr [dword148]
	lea	dword149,[ebp+8]
	mov	dword150,[dword149]
	mov	dword151,4
	add	dword150,dword151
	lea	dword152,[ebp-16]
	mov	dword153,[dword152]
	sub	dword153,[dword150]
	int2float	dword153
	lea	dword154,[ebp+16]
	mov	dword155,8
	add	dword155,[dword154]
	lea	dword156,[ebp+8]
	mov	dword157,8
	add	dword157,[dword156]
	fld	dword ptr [dword155]
	fsub	dword ptr [dword157]
	fmulp
	lea	dword158,[ebp+16]
	mov	dword159,[dword158]
	mov	dword160,4
	add	dword159,dword160
	lea	dword161,[ebp+8]
	mov	dword162,[dword161]
	mov	dword163,4
	add	dword162,dword163
	mov	dword164,[dword159]
	sub	dword164,[dword162]
	int2float	dword164
	fdivp
	lea	dword165,[ebp+8]
	mov	dword166,8
	add	dword166,[dword165]
	fadd	dword ptr [dword166]
	lea	dword167,[ebp-28]
	fstp	dword ptr [dword167]
	lea	dword168,[ebp+8]
	mov	dword169,[dword168]
	mov	dword170,4
	add	dword169,dword170
	lea	dword171,[ebp-16]
	mov	dword172,[dword171]
	sub	dword172,[dword169]
	int2float	dword172
	lea	dword173,[ebp+12]
	mov	dword174,8
	add	dword174,[dword173]
	mov	dword175,4
	add	dword174,dword175
	lea	dword176,[ebp+8]
	mov	dword177,8
	add	dword177,[dword176]
	mov	dword178,4
	add	dword177,dword178
	fld	dword ptr [dword174]
	fsub	dword ptr [dword177]
	fmulp
	lea	dword179,[ebp+12]
	mov	dword180,[dword179]
	mov	dword181,4
	add	dword180,dword181
	lea	dword182,[ebp+8]
	mov	dword183,[dword182]
	mov	dword184,4
	add	dword183,dword184
	mov	dword185,[dword180]
	sub	dword185,[dword183]
	int2float	dword185
	fdivp
	lea	dword186,[ebp+8]
	mov	dword187,8
	add	dword187,[dword186]
	mov	dword188,4
	add	dword187,dword188
	fadd	dword ptr [dword187]
	lea	dword189,[ebp-24]
	fstp	dword ptr [dword189]
	lea	dword190,[ebp+8]
	mov	dword191,[dword190]
	mov	dword192,4
	add	dword191,dword192
	lea	dword193,[ebp-16]
	mov	dword194,[dword193]
	sub	dword194,[dword191]
	int2float	dword194
	lea	dword195,[ebp+16]
	mov	dword196,8
	add	dword196,[dword195]
	mov	dword197,4
	add	dword196,dword197
	lea	dword198,[ebp+8]
	mov	dword199,8
	add	dword199,[dword198]
	mov	dword200,4
	add	dword199,dword200
	fld	dword ptr [dword196]
	fsub	dword ptr [dword199]
	fmulp
	lea	dword201,[ebp+16]
	mov	dword202,[dword201]
	mov	dword203,4
	add	dword202,dword203
	lea	dword204,[ebp+8]
	mov	dword205,[dword204]
	mov	dword206,4
	add	dword205,dword206
	mov	dword207,[dword202]
	sub	dword207,[dword205]
	int2float	dword207
	fdivp
	lea	dword208,[ebp+8]
	mov	dword209,8
	add	dword209,[dword208]
	mov	dword210,4
	add	dword209,dword210
	fadd	dword ptr [dword209]
	lea	dword211,[ebp-32]
	fstp	dword ptr [dword211]
	lea	dword212,[ebp-12]
	lea	dword213,[ebp-8]
	mov	dword214,[dword212]
	sub	dword214,[dword213]
	int2float	dword214
	lea	dword215,[ebp-28]
	lea	dword216,[ebp-20]
	fld	dword ptr [dword215]
	fsub	dword ptr [dword216]
	fdivrp
	lea	dword217,[ebp-36]
	fstp	dword ptr [dword217]
	lea	dword218,[ebp-12]
	lea	dword219,[ebp-8]
	mov	dword220,[dword218]
	sub	dword220,[dword219]
	int2float	dword220
	lea	dword221,[ebp-32]
	lea	dword222,[ebp-24]
	fld	dword ptr [dword221]
	fsub	dword ptr [dword222]
	fdivrp
	lea	dword223,[ebp-40]
	fstp	dword ptr [dword223]
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
	lea	dword256,[ebp+12]
	mov	dword257,[dword256]
	mov	dword258,4
	add	dword257,dword258
	lea	dword259,[ebp+8]
	mov	dword260,[dword259]
	mov	dword261,4
	add	dword260,dword261
	mov	dword262,[dword257]
	sub	dword262,[dword260]
	int2float	dword262
	lea	dword263,[ebp+16]
	mov	dword264,8
	add	dword264,[dword263]
	lea	dword265,[ebp+8]
	mov	dword266,8
	add	dword266,[dword265]
	fld	dword ptr [dword264]
	fsub	dword ptr [dword266]
	fmulp
	lea	dword267,[ebp+16]
	mov	dword268,[dword267]
	mov	dword269,4
	add	dword268,dword269
	lea	dword270,[ebp+8]
	mov	dword271,[dword270]
	mov	dword272,4
	add	dword271,dword272
	mov	dword273,[dword268]
	sub	dword273,[dword271]
	int2float	dword273
	fdivp
	lea	dword274,[ebp+8]
	mov	dword275,8
	add	dword275,[dword274]
	fadd	dword ptr [dword275]
	lea	dword276,[ebp-28]
	fstp	dword ptr [dword276]
	lea	dword277,[ebp+12]
	mov	dword278,[dword277]
	mov	dword279,4
	add	dword278,dword279
	lea	dword280,[ebp+8]
	mov	dword281,[dword280]
	mov	dword282,4
	add	dword281,dword282
	mov	dword283,[dword278]
	sub	dword283,[dword281]
	int2float	dword283
	lea	dword284,[ebp+16]
	mov	dword285,8
	add	dword285,[dword284]
	mov	dword286,4
	add	dword285,dword286
	lea	dword287,[ebp+8]
	mov	dword288,8
	add	dword288,[dword287]
	mov	dword289,4
	add	dword288,dword289
	fld	dword ptr [dword285]
	fsub	dword ptr [dword288]
	fmulp
	lea	dword290,[ebp+16]
	mov	dword291,[dword290]
	mov	dword292,4
	add	dword291,dword292
	lea	dword293,[ebp+8]
	mov	dword294,[dword293]
	mov	dword295,4
	add	dword294,dword295
	mov	dword296,[dword291]
	sub	dword296,[dword294]
	int2float	dword296
	fdivp
	lea	dword297,[ebp+8]
	mov	dword298,8
	add	dword298,[dword297]
	mov	dword299,4
	add	dword298,dword299
	fadd	dword ptr [dword298]
	lea	dword300,[ebp-32]
	fstp	dword ptr [dword300]
	lea	dword301,[ebp+12]
	mov	dword302,8
	add	dword302,[dword301]
	lea	dword303,[ebp-28]
	fld	dword ptr [dword303]
	fsub	dword ptr [dword302]
	lea	dword304,[ebp+12]
	mov	dword305,[dword304]
	lea	dword306,[ebp-12]
	mov	dword307,[dword306]
	sub	dword307,[dword305]
	int2float	dword307
	fdivp
	lea	dword308,[ebp-36]
	fstp	dword ptr [dword308]
	lea	dword309,[ebp+12]
	mov	dword310,8
	add	dword310,[dword309]
	mov	dword311,4
	add	dword310,dword311
	lea	dword312,[ebp-32]
	fld	dword ptr [dword312]
	fsub	dword ptr [dword310]
	lea	dword313,[ebp+12]
	mov	dword314,[dword313]
	lea	dword315,[ebp-12]
	mov	dword316,[dword315]
	sub	dword316,[dword314]
	int2float	dword316
	fdivp
	lea	dword317,[ebp-40]
	fstp	dword ptr [dword317]
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
	lea	dword383,[ebp+12]
	mov	dword384,[dword383]
	mov	dword385,4
	add	dword384,dword385
	lea	dword386,[ebp-16]
	mov	dword387,[dword386]
	sub	dword387,[dword384]
	int2float	dword387
	lea	dword388,[ebp+16]
	mov	dword389,8
	add	dword389,[dword388]
	lea	dword390,[ebp+12]
	mov	dword391,8
	add	dword391,[dword390]
	fld	dword ptr [dword389]
	fsub	dword ptr [dword391]
	fmulp
	lea	dword392,[ebp+16]
	mov	dword393,[dword392]
	mov	dword394,4
	add	dword393,dword394
	lea	dword395,[ebp+12]
	mov	dword396,[dword395]
	mov	dword397,4
	add	dword396,dword397
	mov	dword398,[dword393]
	sub	dword398,[dword396]
	int2float	dword398
	fdivp
	lea	dword399,[ebp+12]
	mov	dword400,8
	add	dword400,[dword399]
	fadd	dword ptr [dword400]
	lea	dword401,[ebp-20]
	fstp	dword ptr [dword401]
	lea	dword402,[ebp+8]
	mov	dword403,[dword402]
	mov	dword404,4
	add	dword403,dword404
	lea	dword405,[ebp-16]
	mov	dword406,[dword405]
	sub	dword406,[dword403]
	int2float	dword406
	lea	dword407,[ebp+16]
	mov	dword408,8
	add	dword408,[dword407]
	lea	dword409,[ebp+8]
	mov	dword410,8
	add	dword410,[dword409]
	fld	dword ptr [dword408]
	fsub	dword ptr [dword410]
	fmulp
	lea	dword411,[ebp+16]
	mov	dword412,[dword411]
	mov	dword413,4
	add	dword412,dword413
	lea	dword414,[ebp+8]
	mov	dword415,[dword414]
	mov	dword416,4
	add	dword415,dword416
	mov	dword417,[dword412]
	sub	dword417,[dword415]
	int2float	dword417
	fdivp
	lea	dword418,[ebp+8]
	mov	dword419,8
	add	dword419,[dword418]
	fadd	dword ptr [dword419]
	lea	dword420,[ebp-28]
	fstp	dword ptr [dword420]
	lea	dword421,[ebp+12]
	mov	dword422,[dword421]
	mov	dword423,4
	add	dword422,dword423
	lea	dword424,[ebp-16]
	mov	dword425,[dword424]
	sub	dword425,[dword422]
	int2float	dword425
	lea	dword426,[ebp+16]
	mov	dword427,8
	add	dword427,[dword426]
	mov	dword428,4
	add	dword427,dword428
	lea	dword429,[ebp+12]
	mov	dword430,8
	add	dword430,[dword429]
	mov	dword431,4
	add	dword430,dword431
	fld	dword ptr [dword427]
	fsub	dword ptr [dword430]
	fmulp
	lea	dword432,[ebp+16]
	mov	dword433,[dword432]
	mov	dword434,4
	add	dword433,dword434
	lea	dword435,[ebp+12]
	mov	dword436,[dword435]
	mov	dword437,4
	add	dword436,dword437
	mov	dword438,[dword433]
	sub	dword438,[dword436]
	int2float	dword438
	fdivp
	lea	dword439,[ebp+12]
	mov	dword440,8
	add	dword440,[dword439]
	mov	dword441,4
	add	dword440,dword441
	fadd	dword ptr [dword440]
	lea	dword442,[ebp-24]
	fstp	dword ptr [dword442]
	lea	dword443,[ebp+8]
	mov	dword444,[dword443]
	mov	dword445,4
	add	dword444,dword445
	lea	dword446,[ebp-16]
	mov	dword447,[dword446]
	sub	dword447,[dword444]
	int2float	dword447
	lea	dword448,[ebp+16]
	mov	dword449,8
	add	dword449,[dword448]
	mov	dword450,4
	add	dword449,dword450
	lea	dword451,[ebp+8]
	mov	dword452,8
	add	dword452,[dword451]
	mov	dword453,4
	add	dword452,dword453
	fld	dword ptr [dword449]
	fsub	dword ptr [dword452]
	fmulp
	lea	dword454,[ebp+16]
	mov	dword455,[dword454]
	mov	dword456,4
	add	dword455,dword456
	lea	dword457,[ebp+8]
	mov	dword458,[dword457]
	mov	dword459,4
	add	dword458,dword459
	mov	dword460,[dword455]
	sub	dword460,[dword458]
	int2float	dword460
	fdivp
	lea	dword461,[ebp+8]
	mov	dword462,8
	add	dword462,[dword461]
	mov	dword463,4
	add	dword462,dword463
	fadd	dword ptr [dword462]
	lea	dword464,[ebp-32]
	fstp	dword ptr [dword464]
	lea	dword465,[ebp-12]
	lea	dword466,[ebp-8]
	mov	dword467,[dword465]
	sub	dword467,[dword466]
	int2float	dword467
	lea	dword468,[ebp-28]
	lea	dword469,[ebp-20]
	fld	dword ptr [dword468]
	fsub	dword ptr [dword469]
	fdivrp
	lea	dword470,[ebp-36]
	fstp	dword ptr [dword470]
	lea	dword471,[ebp-12]
	lea	dword472,[ebp-8]
	mov	dword473,[dword471]
	sub	dword473,[dword472]
	int2float	dword473
	lea	dword474,[ebp-32]
	lea	dword475,[ebp-24]
	fld	dword ptr [dword474]
	fsub	dword ptr [dword475]
	fdivrp
	lea	dword476,[ebp-40]
	fstp	dword ptr [dword476]
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
	destroy_stack_frame
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	create_stack_frame
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
	push_all
	lea	dword21,[ebp+20]
	push_arg	dword ptr [dword21]
	lea	dword22,[ebp-24]
	push_arg	dword22
	call	_vec4f_dot
	restore_stack	8
	pop_all
	lea	dword23,[ebp-52]
	fstp	dword ptr [dword23]
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
	push_all
	lea	dword28,[ebp+20]
	push_arg	dword ptr [dword28]
	lea	dword29,[ebp-24]
	push_arg	dword29
	call	_vec4f_dot
	restore_stack	8
	pop_all
	lea	dword30,[ebp-56]
	fstp	dword ptr [dword30]
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
	push_all
	lea	dword55,[ebp+20]
	push_arg	dword ptr [dword55]
	lea	dword56,[ebp-24]
	push_arg	dword56
	call	_vec4f_dot
	restore_stack	8
	pop_all
	push_all
	lea	dword57,[ebp+20]
	push_arg	dword ptr [dword57]
	lea	dword58,[ebp-40]
	push_arg	dword58
	call	_vec4f_dot
	restore_stack	8
	pop_all
	fdivp
	lea	dword59,[ebp-60]
	fstp	dword ptr [dword59]
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
	destroy_stack_frame
	ret
__clip_on_plain endp	

__clip_poligon proc
	create_stack_frame
	push_all
	lea	dword1,dword ptr [__clip_z_far_norm]
	push_arg	dword1
	lea	dword2,dword ptr [__clip_z_far_base]
	push_arg	dword2
	lea	dword3,[ebp+8]
	push_arg	dword ptr [dword3]
	lea	dword4,[ebp-196]
	push_arg	dword4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword5,dword ptr [__clip_z_near_norm]
	push_arg	dword5
	lea	dword6,dword ptr [__clip_z_near_base]
	push_arg	dword6
	lea	dword7,[ebp-196]
	push_arg	dword7
	lea	dword8,[ebp+8]
	push_arg	dword ptr [dword8]
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword9,dword ptr [__clip_plane_left_norm]
	push_arg	dword9
	lea	dword10,dword ptr [__clip_plane_left_base]
	push_arg	dword10
	lea	dword11,[ebp+8]
	push_arg	dword ptr [dword11]
	lea	dword12,[ebp-196]
	push_arg	dword12
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword13,dword ptr [__clip_plane_right_norm]
	push_arg	dword13
	lea	dword14,dword ptr [__clip_plane_right_base]
	push_arg	dword14
	lea	dword15,[ebp-196]
	push_arg	dword15
	lea	dword16,[ebp+8]
	push_arg	dword ptr [dword16]
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword17,dword ptr [__clip_plane_top_norm]
	push_arg	dword17
	lea	dword18,dword ptr [__clip_plane_top_base]
	push_arg	dword18
	lea	dword19,[ebp+8]
	push_arg	dword ptr [dword19]
	lea	dword20,[ebp-196]
	push_arg	dword20
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword21,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword21
	lea	dword22,dword ptr [__clip_plane_bottom_base]
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
	destroy_stack_frame
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	create_stack_frame
	push_all
	lea	dword1,dword ptr [__viewport_matrix]
	push_arg	dword1
	lea	dword2,[ebp+12]
	push_arg	dword ptr [dword2]
	lea	dword3,[ebp-16]
	push_arg	dword3
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	lea	dword4,[ebp-16]
	mov	dword5,12
	add	dword4,dword5
	fld1
	fdiv	dword ptr [dword4]
	lea	dword6,[ebp-20]
	fstp	dword ptr [dword6]
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
	lea	dword23,dword ptr [__width]
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
	lea	dword30,dword ptr [__height]
	mov	dword31,[dword29]
	cmp	dword31,[dword30]
	jl	label0000
label0001:
	mov	dword32,0
	mov	dword33,0
	mov	[dword32],dword33
label0000:
	destroy_stack_frame
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	create_stack_frame
	push_all
	lea	dword1,[ebp+8]
	push_arg	dword ptr [dword1]
	call	__clip_poligon
	restore_stack	4
	pop_all
	cmp	eax,0
	jne	label0000
	destroy_stack_frame
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
	destroy_stack_frame
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	create_stack_frame
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
	lea	dword8,dword ptr [__mvproj_matrix]
	push_arg	dword8
	lea	dword9,[ebp-16]
	push_arg	dword9
	lea	dword10,[ebp+8]
	push_arg	dword ptr [dword10]
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	destroy_stack_frame
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	create_stack_frame
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
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
