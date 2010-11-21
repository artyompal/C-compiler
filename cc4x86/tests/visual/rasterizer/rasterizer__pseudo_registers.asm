
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
___unnamed_float_0	dd	0.000100
public	___unnamed_float_0
___unnamed_float_1	dd	2.000000
public	___unnamed_float_1
___unnamed_float_2	dd	-1.000000
public	___unnamed_float_2
___unnamed_float_3	dd	255.000000
public	___unnamed_float_3

.code

_vec2f_add proc
	create_stack_frame
	mov	dword16,[ebp+16]
	mov	dword15,[ebp+12]
	mov	dword14,[ebp+8]
	fld	dword ptr [dword15]
	fadd	dword ptr [dword16]
	fstp	dword ptr [dword14]
	fld	dword ptr [dword15+4]
	fadd	dword ptr [dword16+4]
	fstp	dword ptr [dword14+4]
	destroy_stack_frame
	ret
_vec2f_add endp	

_vec2f_subtract proc
	create_stack_frame
	mov	dword16,[ebp+16]
	mov	dword15,[ebp+12]
	mov	dword14,[ebp+8]
	fld	dword ptr [dword15]
	fsub	dword ptr [dword16]
	fstp	dword ptr [dword14]
	fld	dword ptr [dword15+4]
	fsub	dword ptr [dword16+4]
	fstp	dword ptr [dword14+4]
	destroy_stack_frame
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	create_stack_frame
	mov	dword7,[ebp+8]
	fld	dword ptr [dword7]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword7]
	fld	dword ptr [dword7+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword7+4]
	destroy_stack_frame
	ret
_vec2f_mul endp	

_vec4f_assign proc
	create_stack_frame
	mov	dword13,[ebp+8]
	fld	dword ptr [ebp+12]
	fstp	dword ptr [dword13]
	fld	dword ptr [ebp+16]
	fstp	dword ptr [dword13+4]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [dword13+8]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [dword13+12]
	destroy_stack_frame
	ret
_vec4f_assign endp	

_vec4f_add proc
	create_stack_frame
	mov	dword28,[ebp+16]
	mov	dword27,[ebp+12]
	mov	dword26,[ebp+8]
	fld	dword ptr [dword27]
	fadd	dword ptr [dword28]
	fstp	dword ptr [dword26]
	fld	dword ptr [dword27+4]
	fadd	dword ptr [dword28+4]
	fstp	dword ptr [dword26+4]
	fld	dword ptr [dword27+8]
	fadd	dword ptr [dword28+8]
	fstp	dword ptr [dword26+8]
	fld	dword ptr [dword27+12]
	fadd	dword ptr [dword28+12]
	fstp	dword ptr [dword26+12]
	destroy_stack_frame
	ret
_vec4f_add endp	

_vec4f_subtract proc
	create_stack_frame
	mov	dword28,[ebp+16]
	mov	dword27,[ebp+12]
	mov	dword26,[ebp+8]
	fld	dword ptr [dword27]
	fsub	dword ptr [dword28]
	fstp	dword ptr [dword26]
	fld	dword ptr [dword27+4]
	fsub	dword ptr [dword28+4]
	fstp	dword ptr [dword26+4]
	fld	dword ptr [dword27+8]
	fsub	dword ptr [dword28+8]
	fstp	dword ptr [dword26+8]
	fld	dword ptr [dword27+12]
	fsub	dword ptr [dword28+12]
	fstp	dword ptr [dword26+12]
	destroy_stack_frame
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	create_stack_frame
	mov	dword19,[ebp+12]
	mov	dword18,[ebp+8]
	fld	dword ptr [dword18+4]
	fmul	dword ptr [dword19+4]
	fld	dword ptr [dword18]
	fmul	dword ptr [dword19]
	faddp
	fld	dword ptr [dword18+8]
	fmul	dword ptr [dword19+8]
	faddp
	fld	dword ptr [dword18+12]
	fmul	dword ptr [dword19+12]
	faddp
	set_retvalp
	destroy_stack_frame
	ret
_vec4f_dot endp	

_vec4f_mul proc
	create_stack_frame
	mov	dword13,[ebp+8]
	fld	dword ptr [dword13]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword13]
	fld	dword ptr [dword13+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword13+4]
	fld	dword ptr [dword13+8]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword13+8]
	fld	dword ptr [dword13+12]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword13+12]
	destroy_stack_frame
	ret
_vec4f_mul endp	

_vec4f_is_equal proc
	create_stack_frame
	push_all
	push_arg	dword ptr [ebp+12],4
	push_arg	dword ptr [ebp+8],4
	lea	dword3,[ebp-16]
	push_arg	dword3,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword4,[ebp-16]
	push_arg	dword4,4
	lea	dword5,[ebp-16]
	push_arg	dword5,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-20]
	fld	qword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	byte1
	movzx	dword9,byte1
	set_retval	dword9
	destroy_stack_frame
	ret
_vec4f_is_equal endp	

_matrix4f_make_identity proc
	create_stack_frame
	mov	dword34,[ebp+8]
	fld1
	fstp	dword ptr [dword34]
	fldz
	fstp	dword ptr [dword34+4]
	fldz
	fstp	dword ptr [dword34+8]
	fldz
	fstp	dword ptr [dword34+12]
	fldz
	fstp	dword ptr [dword34+16]
	fld1
	fstp	dword ptr [dword34+20]
	fldz
	fstp	dword ptr [dword34+24]
	fldz
	fstp	dword ptr [dword34+28]
	fldz
	fstp	dword ptr [dword34+32]
	fldz
	fstp	dword ptr [dword34+36]
	fld1
	fstp	dword ptr [dword34+40]
	fldz
	fstp	dword ptr [dword34+44]
	fldz
	fstp	dword ptr [dword34+48]
	fldz
	fstp	dword ptr [dword34+52]
	fldz
	fstp	dword ptr [dword34+56]
	fld1
	fstp	dword ptr [dword34+60]
	destroy_stack_frame
	ret
_matrix4f_make_identity endp	

_matrix4f_make_perspective proc
	create_stack_frame
	mov	dword51,[ebp+8]
	fld	dword ptr [ebp+20]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp-4]
	fmul	dword ptr [ebp+24]
	fstp	dword ptr [ebp-8]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-8]
	fstp	dword ptr [dword51]
	fldz
	fstp	dword ptr [dword51+4]
	fldz
	fstp	dword ptr [dword51+8]
	fldz
	fstp	dword ptr [dword51+12]
	fldz
	fstp	dword ptr [dword51+16]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-4]
	fstp	dword ptr [dword51+20]
	fldz
	fstp	dword ptr [dword51+24]
	fldz
	fstp	dword ptr [dword51+28]
	fldz
	fstp	dword ptr [dword51+32]
	fldz
	fstp	dword ptr [dword51+36]
	fld	dword ptr [ebp+16]
	fsub	dword ptr [ebp+12]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [dword51+40]
	fld1
	fstp	dword ptr [dword51+44]
	fldz
	fstp	dword ptr [dword51+48]
	fldz
	fstp	dword ptr [dword51+52]
	fld	dword ptr [ebp+12]
	fmul	dword ptr [ebp+16]
	fld	dword ptr [ebp+12]
	fsub	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [dword51+56]
	fldz
	fstp	dword ptr [dword51+60]
	destroy_stack_frame
	ret
_matrix4f_make_perspective endp	

_matrix4f_make_viewport proc
	create_stack_frame
	mov	dword45,[ebp+8]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [dword45]
	fldz
	fstp	dword ptr [dword45+4]
	fldz
	fstp	dword ptr [dword45+8]
	fldz
	fstp	dword ptr [dword45+12]
	fldz
	fstp	dword ptr [dword45+16]
	fld	dword ptr [ebp+16]
	fldz
	fsubrp
	fld	dword ptr [___unnamed_float_1]
	fdivp
	fstp	dword ptr [dword45+20]
	fldz
	fstp	dword ptr [dword45+24]
	fldz
	fstp	dword ptr [dword45+28]
	fldz
	fstp	dword ptr [dword45+32]
	fldz
	fstp	dword ptr [dword45+36]
	fld	dword ptr [ebp+24]
	fsub	dword ptr [ebp+20]
	fstp	dword ptr [dword45+40]
	fldz
	fstp	dword ptr [dword45+44]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [dword45+48]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [dword45+52]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [dword45+56]
	fld1
	fstp	dword ptr [dword45+60]
	destroy_stack_frame
	ret
_matrix4f_make_viewport endp	

_matrix4f_mul proc
	create_stack_frame
	mov	dword292,[ebp+8]
	mov	dword291,[ebp+16]
	mov	dword290,[ebp+12]
	fld	dword ptr [dword290+4]
	fmul	dword ptr [dword291+16]
	fld	dword ptr [dword290]
	fmul	dword ptr [dword291]
	faddp
	fld	dword ptr [dword290+8]
	fmul	dword ptr [dword291+32]
	faddp
	fld	dword ptr [dword290+12]
	fmul	dword ptr [dword291+48]
	faddp
	fstp	dword ptr [dword292]
	fld	dword ptr [dword290]
	fmul	dword ptr [dword291+4]
	fld	dword ptr [dword290+4]
	fmul	dword ptr [dword291+20]
	faddp
	fld	dword ptr [dword290+8]
	fmul	dword ptr [dword291+36]
	faddp
	fld	dword ptr [dword290+12]
	fmul	dword ptr [dword291+52]
	faddp
	fstp	dword ptr [dword292+4]
	fld	dword ptr [dword290]
	fmul	dword ptr [dword291+8]
	fld	dword ptr [dword290+4]
	fmul	dword ptr [dword291+24]
	faddp
	fld	dword ptr [dword290+8]
	fmul	dword ptr [dword291+40]
	faddp
	fld	dword ptr [dword290+12]
	fmul	dword ptr [dword291+56]
	faddp
	fstp	dword ptr [dword292+8]
	fld	dword ptr [dword290]
	fmul	dword ptr [dword291+12]
	fld	dword ptr [dword290+4]
	fmul	dword ptr [dword291+28]
	faddp
	fld	dword ptr [dword290+8]
	fmul	dword ptr [dword291+44]
	faddp
	fld	dword ptr [dword290+12]
	fmul	dword ptr [dword291+60]
	faddp
	fstp	dword ptr [dword292+12]
	fld	dword ptr [dword290+16]
	fmul	dword ptr [dword291]
	fld	dword ptr [dword290+20]
	fmul	dword ptr [dword291+16]
	faddp
	fld	dword ptr [dword290+24]
	fmul	dword ptr [dword291+32]
	faddp
	fld	dword ptr [dword290+28]
	fmul	dword ptr [dword291+48]
	faddp
	fstp	dword ptr [dword292+16]
	fld	dword ptr [dword290+16]
	fmul	dword ptr [dword291+4]
	fld	dword ptr [dword290+20]
	fmul	dword ptr [dword291+20]
	faddp
	fld	dword ptr [dword290+24]
	fmul	dword ptr [dword291+36]
	faddp
	fld	dword ptr [dword290+28]
	fmul	dword ptr [dword291+52]
	faddp
	fstp	dword ptr [dword292+20]
	fld	dword ptr [dword290+16]
	fmul	dword ptr [dword291+8]
	fld	dword ptr [dword290+20]
	fmul	dword ptr [dword291+24]
	faddp
	fld	dword ptr [dword290+24]
	fmul	dword ptr [dword291+40]
	faddp
	fld	dword ptr [dword290+28]
	fmul	dword ptr [dword291+56]
	faddp
	fstp	dword ptr [dword292+24]
	fld	dword ptr [dword290+16]
	fmul	dword ptr [dword291+12]
	fld	dword ptr [dword290+20]
	fmul	dword ptr [dword291+28]
	faddp
	fld	dword ptr [dword290+24]
	fmul	dword ptr [dword291+44]
	faddp
	fld	dword ptr [dword290+28]
	fmul	dword ptr [dword291+60]
	faddp
	fstp	dword ptr [dword292+28]
	fld	dword ptr [dword290+32]
	fmul	dword ptr [dword291]
	fld	dword ptr [dword290+36]
	fmul	dword ptr [dword291+16]
	faddp
	fld	dword ptr [dword290+40]
	fmul	dword ptr [dword291+32]
	faddp
	fld	dword ptr [dword290+44]
	fmul	dword ptr [dword291+48]
	faddp
	fstp	dword ptr [dword292+32]
	fld	dword ptr [dword290+32]
	fmul	dword ptr [dword291+4]
	fld	dword ptr [dword290+36]
	fmul	dword ptr [dword291+20]
	faddp
	fld	dword ptr [dword290+40]
	fmul	dword ptr [dword291+36]
	faddp
	fld	dword ptr [dword290+44]
	fmul	dword ptr [dword291+52]
	faddp
	fstp	dword ptr [dword292+36]
	fld	dword ptr [dword290+32]
	fmul	dword ptr [dword291+8]
	fld	dword ptr [dword290+36]
	fmul	dword ptr [dword291+24]
	faddp
	fld	dword ptr [dword290+40]
	fmul	dword ptr [dword291+40]
	faddp
	fld	dword ptr [dword290+44]
	fmul	dword ptr [dword291+56]
	faddp
	fstp	dword ptr [dword292+40]
	fld	dword ptr [dword290+32]
	fmul	dword ptr [dword291+12]
	fld	dword ptr [dword290+36]
	fmul	dword ptr [dword291+28]
	faddp
	fld	dword ptr [dword290+40]
	fmul	dword ptr [dword291+44]
	faddp
	fld	dword ptr [dword290+44]
	fmul	dword ptr [dword291+60]
	faddp
	fstp	dword ptr [dword292+44]
	fld	dword ptr [dword290+48]
	fmul	dword ptr [dword291]
	fld	dword ptr [dword290+52]
	fmul	dword ptr [dword291+16]
	faddp
	fld	dword ptr [dword290+56]
	fmul	dword ptr [dword291+32]
	faddp
	fld	dword ptr [dword290+60]
	fmul	dword ptr [dword291+48]
	faddp
	fstp	dword ptr [dword292+48]
	fld	dword ptr [dword290+48]
	fmul	dword ptr [dword291+4]
	fld	dword ptr [dword290+52]
	fmul	dword ptr [dword291+20]
	faddp
	fld	dword ptr [dword290+56]
	fmul	dword ptr [dword291+36]
	faddp
	fld	dword ptr [dword290+60]
	fmul	dword ptr [dword291+52]
	faddp
	fstp	dword ptr [dword292+52]
	fld	dword ptr [dword290+48]
	fmul	dword ptr [dword291+8]
	fld	dword ptr [dword290+52]
	fmul	dword ptr [dword291+24]
	faddp
	fld	dword ptr [dword290+56]
	fmul	dword ptr [dword291+40]
	faddp
	fld	dword ptr [dword290+60]
	fmul	dword ptr [dword291+56]
	faddp
	fstp	dword ptr [dword292+56]
	fld	dword ptr [dword290+48]
	fmul	dword ptr [dword291+12]
	fld	dword ptr [dword290+52]
	fmul	dword ptr [dword291+28]
	faddp
	fld	dword ptr [dword290+56]
	fmul	dword ptr [dword291+44]
	faddp
	fld	dword ptr [dword290+60]
	fmul	dword ptr [dword291+60]
	faddp
	fstp	dword ptr [dword292+60]
	destroy_stack_frame
	ret
_matrix4f_mul endp	

_matrix4f_transform proc
	create_stack_frame
	mov	dword76,[ebp+8]
	mov	dword75,[ebp+16]
	mov	dword74,[ebp+12]
	fld	dword ptr [dword74+4]
	fmul	dword ptr [dword75+16]
	fld	dword ptr [dword74]
	fmul	dword ptr [dword75]
	faddp
	fld	dword ptr [dword74+8]
	fmul	dword ptr [dword75+32]
	faddp
	fld	dword ptr [dword74+12]
	fmul	dword ptr [dword75+48]
	faddp
	fstp	dword ptr [dword76]
	fld	dword ptr [dword74]
	fmul	dword ptr [dword75+4]
	fld	dword ptr [dword74+4]
	fmul	dword ptr [dword75+20]
	faddp
	fld	dword ptr [dword74+8]
	fmul	dword ptr [dword75+36]
	faddp
	fld	dword ptr [dword74+12]
	fmul	dword ptr [dword75+52]
	faddp
	fstp	dword ptr [dword76+4]
	fld	dword ptr [dword74]
	fmul	dword ptr [dword75+8]
	fld	dword ptr [dword74+4]
	fmul	dword ptr [dword75+24]
	faddp
	fld	dword ptr [dword74+8]
	fmul	dword ptr [dword75+40]
	faddp
	fld	dword ptr [dword74+12]
	fmul	dword ptr [dword75+56]
	faddp
	fstp	dword ptr [dword76+8]
	fld	dword ptr [dword74]
	fmul	dword ptr [dword75+12]
	fld	dword ptr [dword74+4]
	fmul	dword ptr [dword75+28]
	faddp
	fld	dword ptr [dword74+8]
	fmul	dword ptr [dword75+44]
	faddp
	fld	dword ptr [dword74+12]
	fmul	dword ptr [dword75+60]
	faddp
	fstp	dword ptr [dword76+12]
	destroy_stack_frame
	ret
_matrix4f_transform endp	

_matrix4f_transpose proc
	create_stack_frame
	mov	dword26,[ebp+8]
	fld	dword ptr [dword26+16]
	fstp	dword ptr [dword26+4]
	fld	dword ptr [dword26+32]
	fstp	dword ptr [dword26+8]
	fld	dword ptr [dword26+48]
	fstp	dword ptr [dword26+12]
	fld	dword ptr [dword26+36]
	fstp	dword ptr [dword26+24]
	fld	dword ptr [dword26+52]
	fstp	dword ptr [dword26+28]
	fld	dword ptr [dword26+56]
	fstp	dword ptr [dword26+44]
	destroy_stack_frame
	ret
_matrix4f_transpose endp	

_rasterizer_init proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__dbgprintf],dword3
	mov	dword6,[ebp+12]
	mov	dword ptr [__width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__height],dword9
	mov	dword12,[ebp+20]
	mov	dword ptr [__pitch],dword12
	push_all
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	push_arg	sse1,4
	push_arg	dword ptr [ebp+32],4
	push_arg	dword ptr [ebp+28],4
	push_arg	dword ptr [ebp+24],4
	lea	dword18,dword ptr [__mvproj_matrix]
	push_arg	dword18,4
	call	_matrix4f_make_perspective
	restore_stack	20
	pop_all
	push_all
	push_arg	dword ptr [ebp+28],4
	push_arg	dword ptr [ebp+24],4
	fild	dword ptr [ebp+16]
	push_arg	sse20,4
	fild	dword ptr [ebp+12]
	push_arg	sse20,4
	lea	dword23,dword ptr [__viewport_matrix]
	push_arg	dword23,4
	call	_matrix4f_make_viewport
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse2,4
	push_arg	dword ptr [ebp+24],4
	fldz
	push_arg	sse3,4
	fldz
	push_arg	sse4,4
	lea	dword25,dword ptr [__clip_z_near_base]
	push_arg	dword25,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	fld	dword ptr [ebp+24]
	fld	dword ptr [ebp+28]
	fucomip	st,st(1)
	fstp	st
	jbe	label0000
	fld1
	fstp	dword ptr [ebp-4]
	jmp	label0001
label0000:
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-4]
label0001:
	push_all
	fld1
	push_arg	sse7,4
	push_arg	dword ptr [ebp-4],4
	fldz
	push_arg	sse8,4
	fldz
	push_arg	sse9,4
	lea	dword32,dword ptr [__clip_z_near_norm]
	push_arg	dword32,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse10,4
	push_arg	dword ptr [ebp+28],4
	fldz
	push_arg	sse11,4
	fldz
	push_arg	sse12,4
	lea	dword34,dword ptr [__clip_z_far_base]
	push_arg	dword34,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	fld	dword ptr [ebp+24]
	fld	dword ptr [ebp+28]
	fucomip	st,st(1)
	fstp	st
	jbe	label0002
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-8]
	jmp	label0003
label0002:
	fld1
	fstp	dword ptr [ebp-8]
label0003:
	push_all
	fld1
	push_arg	sse15,4
	push_arg	dword ptr [ebp-8],4
	fldz
	push_arg	sse16,4
	fldz
	push_arg	sse17,4
	lea	dword41,dword ptr [__clip_z_far_norm]
	push_arg	dword41,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse18,4
	fldz
	push_arg	sse19,4
	fldz
	push_arg	sse20,4
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	push_arg	sse24,4
	lea	dword44,dword ptr [__clip_plane_left_base]
	push_arg	dword44,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse25,4
	fldz
	push_arg	sse26,4
	fldz
	push_arg	sse27,4
	fld1
	push_arg	sse28,4
	lea	dword45,dword ptr [__clip_plane_left_norm]
	push_arg	dword45,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse29,4
	fldz
	push_arg	sse30,4
	fldz
	push_arg	sse31,4
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld1
	fsubrp
	push_arg	sse35,4
	lea	dword47,dword ptr [__clip_plane_right_base]
	push_arg	dword47,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse36,4
	fldz
	push_arg	sse37,4
	fldz
	push_arg	sse38,4
	fld	dword ptr [___unnamed_float_2]
	push_arg	sse39,4
	lea	dword49,dword ptr [__clip_plane_right_norm]
	push_arg	dword49,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse40,4
	fldz
	push_arg	sse41,4
	fild	dword ptr [ebp+16]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	push_arg	sse45,4
	fldz
	push_arg	sse46,4
	lea	dword52,dword ptr [__clip_plane_top_base]
	push_arg	dword52,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse47,4
	fldz
	push_arg	sse48,4
	fld1
	push_arg	sse49,4
	fldz
	push_arg	sse50,4
	lea	dword53,dword ptr [__clip_plane_top_norm]
	push_arg	dword53,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse51,4
	fldz
	push_arg	sse52,4
	fld1
	push_arg	sse53,4
	fldz
	push_arg	sse54,4
	lea	dword54,dword ptr [__clip_plane_bottom_base]
	push_arg	dword54,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse55,4
	fldz
	push_arg	sse56,4
	fld	dword ptr [___unnamed_float_2]
	push_arg	sse57,4
	fldz
	push_arg	sse58,4
	lea	dword56,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword56,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	destroy_stack_frame
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__videomem],dword3
	destroy_stack_frame
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	create_stack_frame
	mov	dword2,[ebp+8]
	mov	dword4,[dword2]
	mov	dword5,[dword2+4]
	mov	dword ptr [__mvproj_matrix],dword4
	mov	dword ptr [__mvproj_matrix+4],dword5
	mov	dword4,[dword2+8]
	mov	dword5,[dword2+12]
	mov	dword ptr [__mvproj_matrix+8],dword4
	mov	dword ptr [__mvproj_matrix+12],dword5
	mov	dword4,[dword2+16]
	mov	dword5,[dword2+20]
	mov	dword ptr [__mvproj_matrix+16],dword4
	mov	dword ptr [__mvproj_matrix+20],dword5
	mov	dword4,[dword2+24]
	mov	dword5,[dword2+28]
	mov	dword ptr [__mvproj_matrix+24],dword4
	mov	dword ptr [__mvproj_matrix+28],dword5
	mov	dword4,[dword2+32]
	mov	dword5,[dword2+36]
	mov	dword ptr [__mvproj_matrix+32],dword4
	mov	dword ptr [__mvproj_matrix+36],dword5
	mov	dword4,[dword2+40]
	mov	dword5,[dword2+44]
	mov	dword ptr [__mvproj_matrix+40],dword4
	mov	dword ptr [__mvproj_matrix+44],dword5
	mov	dword4,[dword2+48]
	mov	dword5,[dword2+52]
	mov	dword ptr [__mvproj_matrix+48],dword4
	mov	dword ptr [__mvproj_matrix+52],dword5
	mov	dword4,[dword2+56]
	mov	dword5,[dword2+60]
	mov	dword ptr [__mvproj_matrix+56],dword4
	mov	dword ptr [__mvproj_matrix+60],dword5
	destroy_stack_frame
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__color],dword3
	destroy_stack_frame
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__texture_data],dword3
	mov	dword6,[ebp+12]
	mov	dword ptr [__texture_width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__texture_height],dword9
	destroy_stack_frame
	ret
_rasterizer_set_texture endp	

__tex2d proc
	create_stack_frame
	mov	dword3,dword ptr [__texture_width]
	dec	dword3
	int2float	dword3
	fmul	dword ptr [ebp+8]
	float2int	dword17
	mov	dword9,dword ptr [__texture_height]
	dec	dword9
	int2float	dword9
	fmul	dword ptr [ebp+12]
	float2int	dword18
	mov	dword15,dword18
	imul	dword15,dword ptr [__texture_width]
	add	dword15,dword17
	sal	dword15,2
	add	dword15,dword ptr [__texture_data]
	set_retval	dword ptr [dword15]
	destroy_stack_frame
	ret
__tex2d endp	

__rasterize_horiz_line proc
	create_stack_frame
	mov	dword86,[ebp+8]
	mov	dword81,dword ptr [__pitch]
	imul	dword81,[ebp+16]
	add	dword81,dword ptr [__videomem]
	mov	dword7,dword86
	sal	dword7,2
	add	dword81,dword7
	mov	dword84,[ebp+12]
	sal	dword84,2
	add	dword84,dword81
	mov	dword15,dword86
	sal	dword15,2
	sub	dword84,dword15
label0000:
	push_all
	push_arg	dword ptr [ebp+24],4
	push_arg	dword ptr [ebp+20],4
	call	__tex2d
	restore_stack	8
	pop_all
	read_retval	dword82
	mov	dword23,dword82
	sar	dword23,24
	and	dword23,255
	mov	[ebp-40],dword23
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	dword83,[dword81]
	mov	dword36,dword83
	and	dword36,65280
	sar	dword36,8
	mov	[ebp-32],dword36
	mov	dword41,dword83
	and	dword41,255
	mov	[ebp-36],dword41
	mov	dword45,dword82
	and	dword45,65280
	sar	dword45,8
	mov	[ebp-20],dword45
	mov	dword50,dword82
	and	dword50,255
	mov	[ebp-24],dword50
	fild	dword ptr [ebp-20]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-32]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword56
	mov	[ebp-20],dword56
	fild	dword ptr [ebp-24]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-36]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword62
	mov	[ebp-24],dword62
	mov	dword85,[ebp-20]
	sal	dword85,8
	add	dword85,[ebp-24]
	mov	[dword81],dword85
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	dword81,4
	cmp	dword81,dword84
	jl	label0000
label0002:
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	create_stack_frame
	mov	dword7,[ebp+16]
	mov	dword6,[ebp+12]
	mov	dword5,[ebp+8]
	cmp	dword5,dword6
	jg	label0000
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	push_arg	dword ptr [ebp+24],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword7,4
	push_arg	dword6,4
	push_arg	dword5,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0001
label0000:
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	push_arg	dword ptr [ebp+32],4
	push_arg	dword ptr [ebp+28],4
	push_arg	dword7,4
	push_arg	dword5,4
	push_arg	dword6,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0001:
	destroy_stack_frame
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	create_stack_frame
	mov	dword72,[ebp+24]
	mov	dword71,[ebp+20]
	mov	dword70,[ebp+12]
	mov	dword69,[ebp+8]
	mov	dword68,[ebp+16]
	cmp	dword69,dword70
	jge	label0000
	cmp	dword68,dword70
	jle	label0001
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	push_arg	dword ptr [dword72+4],4
	push_arg	dword ptr [dword72],4
	push_arg	dword71,4
	push_arg	dword68,4
	push_arg	dword69,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0002
label0001:
	cmp	dword68,dword69
	jge	label0003
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	mov	dword22,[ebp+32]
	push_arg	dword ptr [dword22+4],4
	mov	dword24,[ebp+32]
	push_arg	dword ptr [dword24],4
	push_arg	dword71,4
	push_arg	dword70,4
	push_arg	dword68,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0004
label0003:
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	push_arg	dword ptr [dword72+4],4
	push_arg	dword ptr [dword72],4
	push_arg	dword71,4
	push_arg	dword70,4
	push_arg	dword69,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0004:
label0002:
	jmp	label0005
label0000:
	cmp	dword68,dword70
	jge	label0006
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_arg	sse1,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_arg	sse2,4
	mov	dword43,[ebp+32]
	push_arg	dword ptr [dword43+4],4
	mov	dword45,[ebp+32]
	push_arg	dword ptr [dword45],4
	push_arg	dword71,4
	push_arg	dword69,4
	push_arg	dword68,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0007
label0006:
	cmp	dword68,dword69
	jle	label0008
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_arg	sse3,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_arg	sse4,4
	mov	dword55,[ebp+28]
	push_arg	dword ptr [dword55+4],4
	mov	dword57,[ebp+28]
	push_arg	dword ptr [dword57],4
	push_arg	dword71,4
	push_arg	dword68,4
	push_arg	dword70,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0009
label0008:
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_arg	sse5,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_arg	sse6,4
	mov	dword64,[ebp+28]
	push_arg	dword ptr [dword64+4],4
	mov	dword66,[ebp+28]
	push_arg	dword ptr [dword66],4
	push_arg	dword71,4
	push_arg	dword69,4
	push_arg	dword70,4
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
	mov	dword477,[ebp+16]
	mov	dword476,[ebp+12]
	mov	dword475,[ebp+8]
	mov	dword7,[dword475+4]
	cmp	dword7,[dword476+4]
	jle	label0000
	mov	[ebp-4],dword475
	mov	dword475,dword476
	mov	dword476,[ebp-4]
label0000:
	mov	dword23,[dword475+4]
	cmp	dword23,[dword477+4]
	jle	label0001
	mov	[ebp-4],dword475
	mov	dword475,dword477
	mov	dword477,[ebp-4]
label0001:
	mov	dword39,[dword476+4]
	cmp	dword39,[dword477+4]
	jle	label0002
	mov	[ebp-4],dword476
	mov	dword476,dword477
	mov	dword477,[ebp-4]
label0002:
	mov	dword55,[dword475+4]
	cmp	dword55,[dword477+4]
	jne	label0003
	cmp	dword ptr [dword475+4],0
	jl	label0004
	mov	dword64,[dword475+4]
	cmp	dword64,dword ptr [__height]
	jge	label0004
	push_all
	fldz
	push_arg	sse1,4
	fldz
	push_arg	sse2,4
	mov	dword66,8
	add	dword66,dword477
	push_arg	dword66,4
	mov	dword68,8
	add	dword68,dword476
	push_arg	dword68,4
	mov	dword70,8
	add	dword70,dword475
	push_arg	dword70,4
	push_arg	dword ptr [dword475+4],4
	push_arg	dword ptr [dword477],4
	push_arg	dword ptr [dword476],4
	push_arg	dword ptr [dword475],4
	call	__rasterize_triangle_1i
	restore_stack	36
	pop_all
label0004:
	destroy_stack_frame
	ret
label0003:
	mov	dword84,[dword475+4]
	mov	[ebp-16],dword84
label0005:
label0006:
	mov	dword89,[dword476+4]
	cmp	dword89,[ebp-16]
	jle	label0007
	mov	dword94,[ebp-16]
	sub	dword94,[dword475+4]
	mov	dword99,[dword476]
	sub	dword99,[dword475]
	imul	dword94,dword99
	mov	dword106,[dword476+4]
	sub	dword106,[dword475+4]
	mov	eax,dword94
	cdq
	idiv	dword106
	add	eax,[dword475]
	mov	[ebp-8],eax
	mov	dword114,[ebp-16]
	sub	dword114,[dword475+4]
	mov	dword119,[dword477]
	sub	dword119,[dword475]
	imul	dword114,dword119
	mov	dword126,[dword477+4]
	sub	dword126,[dword475+4]
	mov	eax,dword114
	cdq
	idiv	dword126
	add	eax,[dword475]
	mov	[ebp-12],eax
	mov	dword134,[ebp-16]
	sub	dword134,[dword475+4]
	int2float	dword134
	fld	dword ptr [dword476+8]
	fsub	dword ptr [dword475+8]
	fmulp
	mov	dword145,[dword476+4]
	sub	dword145,[dword475+4]
	int2float	dword145
	fdivp
	fadd	dword ptr [dword475+8]
	fstp	dword ptr [ebp-20]
	mov	dword153,[ebp-16]
	sub	dword153,[dword475+4]
	int2float	dword153
	fld	dword ptr [dword477+8]
	fsub	dword ptr [dword475+8]
	fmulp
	mov	dword164,[dword477+4]
	sub	dword164,[dword475+4]
	int2float	dword164
	fdivp
	fadd	dword ptr [dword475+8]
	fstp	dword ptr [ebp-28]
	mov	dword172,[ebp-16]
	sub	dword172,[dword475+4]
	int2float	dword172
	mov	dword174,8
	add	dword174,dword476
	add	dword174,4
	mov	dword177,8
	add	dword177,dword475
	add	dword177,4
	fld	dword ptr [dword174]
	fsub	dword ptr [dword177]
	fmulp
	mov	dword185,[dword476+4]
	sub	dword185,[dword475+4]
	int2float	dword185
	fdivp
	mov	dword187,8
	add	dword187,dword475
	add	dword187,4
	fadd	dword ptr [dword187]
	fstp	dword ptr [ebp-24]
	mov	dword194,[ebp-16]
	sub	dword194,[dword475+4]
	int2float	dword194
	mov	dword196,8
	add	dword196,dword477
	add	dword196,4
	mov	dword199,8
	add	dword199,dword475
	add	dword199,4
	fld	dword ptr [dword196]
	fsub	dword ptr [dword199]
	fmulp
	mov	dword207,[dword477+4]
	sub	dword207,[dword475+4]
	int2float	dword207
	fdivp
	mov	dword209,8
	add	dword209,dword475
	add	dword209,4
	fadd	dword ptr [dword209]
	fstp	dword ptr [ebp-32]
	mov	dword214,[ebp-12]
	sub	dword214,[ebp-8]
	int2float	dword214
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	dword220,[ebp-12]
	sub	dword220,[ebp-8]
	int2float	dword220
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40],4
	push_arg	dword ptr [ebp-36],4
	push_arg	dword ptr [ebp-32],4
	push_arg	dword ptr [ebp-28],4
	push_arg	dword ptr [ebp-24],4
	push_arg	dword ptr [ebp-20],4
	push_arg	dword ptr [ebp-16],4
	push_arg	dword ptr [ebp-12],4
	push_arg	dword ptr [ebp-8],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	inc	dword ptr [ebp-16]
	jmp	label0006
label0007:
	mov	dword240,[dword476+4]
	sub	dword240,[dword475+4]
	mov	dword245,[dword477]
	sub	dword245,[dword475]
	imul	dword240,dword245
	mov	dword252,[dword477+4]
	sub	dword252,[dword475+4]
	mov	eax,dword240
	cdq
	idiv	dword252
	add	eax,[dword475]
	mov	[ebp-12],eax
	mov	dword262,[dword476+4]
	sub	dword262,[dword475+4]
	int2float	dword262
	fld	dword ptr [dword477+8]
	fsub	dword ptr [dword475+8]
	fmulp
	mov	dword273,[dword477+4]
	sub	dword273,[dword475+4]
	int2float	dword273
	fdivp
	fadd	dword ptr [dword475+8]
	fstp	dword ptr [ebp-28]
	mov	dword283,[dword476+4]
	sub	dword283,[dword475+4]
	int2float	dword283
	mov	dword285,8
	add	dword285,dword477
	add	dword285,4
	mov	dword288,8
	add	dword288,dword475
	add	dword288,4
	fld	dword ptr [dword285]
	fsub	dword ptr [dword288]
	fmulp
	mov	dword296,[dword477+4]
	sub	dword296,[dword475+4]
	int2float	dword296
	fdivp
	mov	dword298,8
	add	dword298,dword475
	add	dword298,4
	fadd	dword ptr [dword298]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [dword476+8]
	mov	dword307,[ebp-12]
	sub	dword307,[dword476]
	int2float	dword307
	fdivp
	fstp	dword ptr [ebp-36]
	mov	dword310,8
	add	dword310,dword476
	add	dword310,4
	fld	dword ptr [ebp-32]
	fsub	dword ptr [dword310]
	mov	dword316,[ebp-12]
	sub	dword316,[dword476]
	int2float	dword316
	fdivp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40],4
	push_arg	dword ptr [ebp-36],4
	mov	dword321,8
	add	dword321,dword476
	add	dword321,4
	push_arg	dword ptr [dword321],4
	push_arg	dword ptr [dword476+8],4
	push_arg	dword ptr [ebp-32],4
	push_arg	dword ptr [ebp-28],4
	push_arg	dword ptr [dword476+4],4
	push_arg	dword ptr [dword476],4
	push_arg	dword ptr [ebp-12],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	mov	dword336,1
	add	dword336,[dword476+4]
	mov	[ebp-16],dword336
label0008:
label0009:
	mov	dword342,[dword477+4]
	cmp	dword342,[ebp-16]
	jle	label000a
	mov	dword347,[ebp-16]
	sub	dword347,[dword476+4]
	mov	dword352,[dword477]
	sub	dword352,[dword476]
	imul	dword347,dword352
	mov	dword359,[dword477+4]
	sub	dword359,[dword476+4]
	mov	eax,dword347
	cdq
	idiv	dword359
	add	eax,[dword476]
	mov	[ebp-8],eax
	mov	dword367,[ebp-16]
	sub	dword367,[dword475+4]
	mov	dword372,[dword477]
	sub	dword372,[dword475]
	imul	dword367,dword372
	mov	dword379,[dword477+4]
	sub	dword379,[dword475+4]
	mov	eax,dword367
	cdq
	idiv	dword379
	add	eax,[dword475]
	mov	[ebp-12],eax
	mov	dword387,[ebp-16]
	sub	dword387,[dword476+4]
	int2float	dword387
	fld	dword ptr [dword477+8]
	fsub	dword ptr [dword476+8]
	fmulp
	mov	dword398,[dword477+4]
	sub	dword398,[dword476+4]
	int2float	dword398
	fdivp
	fadd	dword ptr [dword476+8]
	fstp	dword ptr [ebp-20]
	mov	dword406,[ebp-16]
	sub	dword406,[dword475+4]
	int2float	dword406
	fld	dword ptr [dword477+8]
	fsub	dword ptr [dword475+8]
	fmulp
	mov	dword417,[dword477+4]
	sub	dword417,[dword475+4]
	int2float	dword417
	fdivp
	fadd	dword ptr [dword475+8]
	fstp	dword ptr [ebp-28]
	mov	dword425,[ebp-16]
	sub	dword425,[dword476+4]
	int2float	dword425
	mov	dword427,8
	add	dword427,dword477
	add	dword427,4
	mov	dword430,8
	add	dword430,dword476
	add	dword430,4
	fld	dword ptr [dword427]
	fsub	dword ptr [dword430]
	fmulp
	mov	dword438,[dword477+4]
	sub	dword438,[dword476+4]
	int2float	dword438
	fdivp
	mov	dword440,8
	add	dword440,dword476
	add	dword440,4
	fadd	dword ptr [dword440]
	fstp	dword ptr [ebp-24]
	mov	dword447,[ebp-16]
	sub	dword447,[dword475+4]
	int2float	dword447
	mov	dword449,8
	add	dword449,dword477
	add	dword449,4
	mov	dword452,8
	add	dword452,dword475
	add	dword452,4
	fld	dword ptr [dword449]
	fsub	dword ptr [dword452]
	fmulp
	mov	dword460,[dword477+4]
	sub	dword460,[dword475+4]
	int2float	dword460
	fdivp
	mov	dword462,8
	add	dword462,dword475
	add	dword462,4
	fadd	dword ptr [dword462]
	fstp	dword ptr [ebp-32]
	mov	dword467,[ebp-12]
	sub	dword467,[ebp-8]
	int2float	dword467
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	dword473,[ebp-12]
	sub	dword473,[ebp-8]
	int2float	dword473
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40],4
	push_arg	dword ptr [ebp-36],4
	push_arg	dword ptr [ebp-32],4
	push_arg	dword ptr [ebp-28],4
	push_arg	dword ptr [ebp-24],4
	push_arg	dword ptr [ebp-20],4
	push_arg	dword ptr [ebp-16],4
	push_arg	dword ptr [ebp-12],4
	push_arg	dword ptr [ebp-8],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	inc	dword ptr [ebp-16]
	jmp	label0009
label000a:
	destroy_stack_frame
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	create_stack_frame
	mov	dword101,[ebp+8]
	mov	dword ptr [dword101+192],0
	mov	dword102,[ebp+12]
	mov	dword103,[ebp+12]
	add	dword103,24
label0000:
label0001:
	mov	dword12,[ebp+12]
	imul	dword13,[dword12+192],24
	mov	dword15,[ebp+12]
	add	dword15,dword13
	cmp	dword15,dword103
	jle	label0002
	push_all
	push_arg	dword ptr [ebp+16],4
	mov	dword19,dword102
	push_arg	dword19,4
	lea	dword20,[ebp-24]
	push_arg	dword20,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword22,[ebp-24]
	push_arg	dword22,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fstp	dword ptr [ebp-52]
	push_all
	push_arg	dword ptr [ebp+16],4
	mov	dword26,dword103
	push_arg	dword26,4
	lea	dword27,[ebp-24]
	push_arg	dword27,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword29,[ebp-24]
	push_arg	dword29,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fstp	dword ptr [ebp-56]
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	mov	dword34,[dword101+192]
	inc	dword ptr [dword101+192]
	imul	dword34,24
	mov	dword37,dword101
	add	dword37,dword34
	mov	dword40,[dword102]
	mov	dword41,[dword102+4]
	mov	[dword37],dword40
	mov	[dword37+4],dword41
	mov	dword40,[dword102+8]
	mov	dword41,[dword102+12]
	mov	[dword37+8],dword40
	mov	[dword37+12],dword41
	mov	dword40,[dword102+16]
	mov	dword41,[dword102+20]
	mov	[dword37+16],dword40
	mov	[dword37+20],dword41
label0003:
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jbe	label0006
	fldz
	fld	dword ptr [ebp-56]
	fucomip	st,st(1)
	fstp	st
	jb	label0005
label0006:
	fldz
	fld	dword ptr [ebp-56]
	fucomip	st,st(1)
	fstp	st
	jb	label0004
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jae	label0004
label0005:
	push_all
	mov	dword47,dword102
	push_arg	dword47,4
	push_arg	dword ptr [ebp+16],4
	lea	dword49,[ebp-24]
	push_arg	dword49,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	mov	dword51,dword102
	push_arg	dword51,4
	mov	dword53,dword103
	push_arg	dword53,4
	lea	dword54,[ebp-40]
	push_arg	dword54,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword56,[ebp-24]
	push_arg	dword56,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword58,[ebp-40]
	push_arg	dword58,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fdivp
	fstp	dword ptr [ebp-60]
	push_all
	push_arg	dword ptr [ebp-60],4
	lea	dword61,[ebp-40]
	push_arg	dword61,4
	call	_vec4f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword62,[ebp-40]
	push_arg	dword62,4
	mov	dword64,dword102
	push_arg	dword64,4
	imul	dword67,[dword101+192],24
	mov	dword69,dword101
	add	dword69,dword67
	push_arg	dword69,4
	call	_vec4f_add
	restore_stack	12
	pop_all
	push_all
	mov	dword71,16
	add	dword71,dword102
	push_arg	dword71,4
	mov	dword73,16
	add	dword73,dword103
	push_arg	dword73,4
	lea	dword74,[ebp-48]
	push_arg	dword74,4
	call	_vec2f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp-60],4
	lea	dword76,[ebp-48]
	push_arg	dword76,4
	call	_vec2f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword77,[ebp-48]
	push_arg	dword77,4
	mov	dword79,16
	add	dword79,dword102
	push_arg	dword79,4
	imul	dword82,[dword101+192],24
	mov	dword84,dword101
	add	dword84,dword82
	add	dword84,16
	push_arg	dword84,4
	call	_vec2f_add
	restore_stack	12
	pop_all
	inc	dword ptr [dword101+192]
label0004:
	add	dword102,24
	add	dword103,24
	jmp	label0001
label0002:
	mov	dword92,[dword101+192]
	inc	dword ptr [dword101+192]
	imul	dword92,24
	mov	dword95,dword101
	add	dword95,dword92
	mov	dword98,[dword101]
	mov	dword99,[dword101+4]
	mov	[dword95],dword98
	mov	[dword95+4],dword99
	mov	dword98,[dword101+8]
	mov	dword99,[dword101+12]
	mov	[dword95+8],dword98
	mov	[dword95+12],dword99
	mov	dword98,[dword101+16]
	mov	dword99,[dword101+20]
	mov	[dword95+16],dword98
	mov	[dword95+20],dword99
	destroy_stack_frame
	ret
__clip_on_plain endp	

__clip_poligon proc
	create_stack_frame
	mov	dword30,[ebp+8]
	push_all
	lea	dword1,dword ptr [__clip_z_far_norm]
	push_arg	dword1,4
	lea	dword2,dword ptr [__clip_z_far_base]
	push_arg	dword2,4
	push_arg	dword30,4
	lea	dword4,[ebp-196]
	push_arg	dword4,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword5,dword ptr [__clip_z_near_norm]
	push_arg	dword5,4
	lea	dword6,dword ptr [__clip_z_near_base]
	push_arg	dword6,4
	lea	dword7,[ebp-196]
	push_arg	dword7,4
	push_arg	dword30,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword9,dword ptr [__clip_plane_left_norm]
	push_arg	dword9,4
	lea	dword10,dword ptr [__clip_plane_left_base]
	push_arg	dword10,4
	push_arg	dword30,4
	lea	dword12,[ebp-196]
	push_arg	dword12,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword13,dword ptr [__clip_plane_right_norm]
	push_arg	dword13,4
	lea	dword14,dword ptr [__clip_plane_right_base]
	push_arg	dword14,4
	lea	dword15,[ebp-196]
	push_arg	dword15,4
	push_arg	dword30,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword17,dword ptr [__clip_plane_top_norm]
	push_arg	dword17,4
	lea	dword18,dword ptr [__clip_plane_top_base]
	push_arg	dword18,4
	push_arg	dword30,4
	lea	dword20,[ebp-196]
	push_arg	dword20,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword21,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword21,4
	lea	dword22,dword ptr [__clip_plane_bottom_base]
	push_arg	dword22,4
	lea	dword23,[ebp-196]
	push_arg	dword23,4
	push_arg	dword30,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	cmp	dword ptr [dword30+192],1
	setg	byte1
	movzx	dword28,byte1
	set_retval	dword28
	destroy_stack_frame
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	create_stack_frame
	mov	dword33,[ebp+8]
	push_all
	lea	dword1,dword ptr [__viewport_matrix]
	push_arg	dword1,4
	push_arg	dword ptr [ebp+12],4
	lea	dword3,[ebp-16]
	push_arg	dword3,4
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	lea	dword4,[ebp-16]
	add	dword4,12
	fld1
	fdiv	dword ptr [dword4]
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [ebp-20]
	float2int	dword9
	mov	[dword33],dword9
	lea	dword12,[ebp-16]
	add	dword12,4
	fld	dword ptr [dword12]
	fmul	dword ptr [ebp-20]
	float2int	dword15
	mov	[dword33+4],dword15
	cmp	dword ptr [dword33],0
	jl	label0001
	mov	dword24,[dword33]
	cmp	dword24,dword ptr [__width]
	jge	label0001
	cmp	dword ptr [dword33+4],0
	jl	label0001
	mov	dword31,[dword33+4]
	cmp	dword31,dword ptr [__height]
	jl	label0000
label0001:
	mov	dword ptr ds:[0],0
label0000:
	destroy_stack_frame
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	create_stack_frame
	mov	dword54,[ebp+8]
	push_all
	push_arg	dword54,4
	call	__clip_poligon
	restore_stack	4
	pop_all
	read_retval	dword2
	cmp	dword2,0
	jne	label0000
	destroy_stack_frame
	ret
label0000:
	cmp	dword ptr [dword54+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword53,0
label0002:
label0003:
	mov	dword13,[dword54+192]
	cmp	dword13,dword53
	jle	label0004
	push_all
	mov	dword15,dword54
	imul	dword17,dword53,24
	add	dword15,dword17
	push_arg	dword15,4
	lea	dword18,[ebp-132]
	mov	dword21,dword53
	sal	dword21,4
	add	dword18,dword21
	push_arg	dword18,4
	call	__transform_to_screen_space
	restore_stack	8
	pop_all
	lea	dword22,[ebp-132]
	mov	dword25,dword53
	sal	dword25,4
	add	dword22,dword25
	add	dword22,8
	mov	dword28,dword54
	imul	dword30,dword53,24
	add	dword28,dword30
	add	dword28,16
	mov	dword32,[dword28]
	mov	dword33,[dword28+4]
	mov	[dword22],dword32
	mov	[dword22+4],dword33
	inc	dword53
	jmp	label0003
label0004:
	mov	dword53,2
label0005:
label0006:
	mov	dword40,[dword54+192]
	dec	dword40
	cmp	dword40,dword53
	jle	label0007
	push_all
	lea	dword42,[ebp-132]
	mov	dword45,dword53
	sal	dword45,4
	add	dword42,dword45
	push_arg	dword42,4
	mov	dword48,dword53
	dec	dword48
	sal	dword48,4
	lea	dword50,[ebp-132]
	add	dword50,dword48
	push_arg	dword50,4
	lea	dword51,[ebp-132]
	push_arg	dword51,4
	call	__rasterize_triangle_2i
	restore_stack	12
	pop_all
	inc	dword53
	jmp	label0006
label0007:
	destroy_stack_frame
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	create_stack_frame
	mov	dword11,[ebp+12]
	push_all
	fld1
	push_arg	sse1,4
	push_arg	dword ptr [dword11+8],4
	push_arg	dword ptr [dword11+4],4
	push_arg	dword ptr [dword11],4
	lea	dword7,[ebp-16]
	push_arg	dword7,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	lea	dword8,dword ptr [__mvproj_matrix]
	push_arg	dword8,4
	lea	dword9,[ebp-16]
	push_arg	dword9,4
	push_arg	dword ptr [ebp+8],4
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	destroy_stack_frame
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	create_stack_frame
	push_all
	push_arg	dword ptr [ebp+8],4
	lea	dword2,[ebp-196]
	push_arg	dword2,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword3,[ebp-196]
	add	dword3,16
	mov	dword6,[ebp+20]
	mov	dword7,[dword6]
	mov	dword8,[dword6+4]
	mov	[dword3],dword7
	mov	[dword3+4],dword8
	push_all
	push_arg	dword ptr [ebp+12],4
	lea	dword10,[ebp-196]
	add	dword10,24
	push_arg	dword10,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword12,[ebp-196]
	add	dword12,24
	add	dword12,16
	mov	dword16,[ebp+24]
	mov	dword17,[dword16]
	mov	dword18,[dword16+4]
	mov	[dword12],dword17
	mov	[dword12+4],dword18
	push_all
	push_arg	dword ptr [ebp+16],4
	lea	dword20,[ebp-196]
	add	dword20,48
	push_arg	dword20,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword22,[ebp-196]
	add	dword22,48
	add	dword22,16
	mov	dword26,[ebp+28]
	mov	dword27,[dword26]
	mov	dword28,[dword26+4]
	mov	[dword22],dword27
	mov	[dword22+4],dword28
	lea	dword29,[ebp-196]
	add	dword29,72
	mov	dword32,[ebp-196]
	mov	dword33,[ebp-192]
	mov	[dword29],dword32
	mov	[dword29+4],dword33
	mov	dword32,[ebp-188]
	mov	dword33,[ebp-184]
	mov	[dword29+8],dword32
	mov	[dword29+12],dword33
	mov	dword32,[ebp-180]
	mov	dword33,[ebp-176]
	mov	[dword29+16],dword32
	mov	[dword29+20],dword33
	lea	dword34,[ebp-196]
	add	dword34,192
	mov	dword ptr [dword34],4
	push_all
	lea	dword37,[ebp-196]
	push_arg	dword37,4
	call	__rasterize_polygon_4f
	restore_stack	4
	pop_all
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
