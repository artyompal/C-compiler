
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
	mov	dword16,[ebp+16]
	mov	dword15,[ebp+12]
	mov	dword14,[ebp+8]
	fld	dword ptr [dword15]
	fadd	dword ptr [dword16]
	fstp	dword ptr [dword14]
	fld	dword ptr [dword15+4]
	fadd	dword ptr [dword16+4]
	fstp	dword ptr [dword14+4]
	destroy_stack_frame	0
	ret
_vec2f_add endp	

_vec2f_subtract proc
	create_stack_frame	0
	mov	dword16,[ebp+16]
	mov	dword15,[ebp+12]
	mov	dword14,[ebp+8]
	fld	dword ptr [dword15]
	fsub	dword ptr [dword16]
	fstp	dword ptr [dword14]
	fld	dword ptr [dword15+4]
	fsub	dword ptr [dword16+4]
	fstp	dword ptr [dword14+4]
	destroy_stack_frame	0
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	create_stack_frame	0
	mov	dword8,[ebp+8]
	fld	dword ptr [dword8]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword8]
	fld	dword ptr [dword8+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword8+4]
	destroy_stack_frame	0
	ret
_vec2f_mul endp	

_vec4f_assign proc
	create_stack_frame	0
	mov	dword14,[ebp+8]
	fld	dword ptr [ebp+12]
	fstp	dword ptr [dword14]
	fld	dword ptr [ebp+16]
	fstp	dword ptr [dword14+4]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [dword14+8]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [dword14+12]
	destroy_stack_frame	0
	ret
_vec4f_assign endp	

_vec4f_add proc
	create_stack_frame	0
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
	destroy_stack_frame	0
	ret
_vec4f_add endp	

_vec4f_subtract proc
	create_stack_frame	0
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
	destroy_stack_frame	0
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	create_stack_frame	0
	mov	dword19,[ebp+12]
	mov	dword18,[ebp+8]
	fld	dword ptr [dword18]
	fmul	dword ptr [dword19]
	fld	dword ptr [dword18+4]
	fmul	dword ptr [dword19+4]
	faddp
	fld	dword ptr [dword18+8]
	fmul	dword ptr [dword19+8]
	faddp
	fld	dword ptr [dword18+12]
	fmul	dword ptr [dword19+12]
	faddp
	destroy_stack_frame	0
	ret
_vec4f_dot endp	

_vec4f_mul proc
	create_stack_frame	0
	mov	dword14,[ebp+8]
	fld	dword ptr [dword14]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword14]
	fld	dword ptr [dword14+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword14+4]
	fld	dword ptr [dword14+8]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword14+8]
	fld	dword ptr [dword14+12]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword14+12]
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
	push_arg	dword ptr [ebp+12]
	push_arg	dword ptr [ebp+8]
	lea	dword3,[ebp-16]
	push_arg	dword3
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword5,[ebp-16]
	push_arg	dword5
	lea	dword6,[ebp-16]
	push_arg	dword6
	call	_vec4f_dot
	restore_stack	8
	pop_all
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-20]
	fld	[___unnamed_float_0]
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
	destroy_stack_frame	0
	ret
_matrix4f_make_identity endp	

_matrix4f_make_perspective proc
	create_stack_frame	8
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
	destroy_stack_frame	8
	ret
_matrix4f_make_perspective endp	

.data

___unnamed_float_1	dd	2.000000
public	___unnamed_float_1

.code

_matrix4f_make_viewport proc
	create_stack_frame	0
	mov	dword45,[ebp+8]
	fld	[___unnamed_float_1]
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
	fld	[___unnamed_float_1]
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
	fld	[___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [dword45+48]
	fld	[___unnamed_float_1]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [dword45+52]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [dword45+56]
	fld1
	fstp	dword ptr [dword45+60]
	destroy_stack_frame	0
	ret
_matrix4f_make_viewport endp	

_matrix4f_mul proc
	create_stack_frame	0
	mov	dword292,[ebp+8]
	mov	dword291,[ebp+16]
	mov	dword290,[ebp+12]
	fld	dword ptr [dword290]
	fmul	dword ptr [dword291]
	fld	dword ptr [dword290+4]
	fmul	dword ptr [dword291+16]
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
	destroy_stack_frame	0
	ret
_matrix4f_mul endp	

_matrix4f_transform proc
	create_stack_frame	0
	mov	dword76,[ebp+8]
	mov	dword75,[ebp+16]
	mov	dword74,[ebp+12]
	fld	dword ptr [dword74]
	fmul	dword ptr [dword75]
	fld	dword ptr [dword74+4]
	fmul	dword ptr [dword75+16]
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
	destroy_stack_frame	0
	ret
_matrix4f_transform endp	

_matrix4f_transpose proc
	create_stack_frame	0
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
	destroy_stack_frame	0
	ret
_matrix4f_transpose endp	

.data

___unnamed_float_2	dd	-1.000000
public	___unnamed_float_2

.code

_rasterizer_init proc
	create_stack_frame	8
	mov	dword3,[ebp+8]
	mov	[__dbgprintf],dword3
	mov	dword6,[ebp+12]
	mov	[__width],dword6
	mov	dword9,[ebp+16]
	mov	[__height],dword9
	mov	dword12,[ebp+20]
	mov	[__pitch],dword12
	push_all
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	push_argp
	push_arg	dword ptr [ebp+32]
	push_arg	dword ptr [ebp+28]
	push_arg	dword ptr [ebp+24]
	lea	dword18,[__mvproj_matrix]
	push_arg	dword18
	call	_matrix4f_make_perspective
	restore_stack	20
	pop_all
	push_all
	push_arg	dword ptr [ebp+28]
	push_arg	dword ptr [ebp+24]
	fild	dword ptr [ebp+16]
	push_argp
	fild	dword ptr [ebp+12]
	push_argp
	lea	dword23,[__viewport_matrix]
	push_arg	dword23
	call	_matrix4f_make_viewport
	restore_stack	20
	pop_all
	push_all
	fld1
	push_argp
	push_arg	dword ptr [ebp+24]
	fldz
	push_argp
	fldz
	push_argp
	lea	dword25,[__clip_z_near_base]
	push_arg	dword25
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
	fld	[___unnamed_float_2]
	fstp	dword ptr [ebp-4]
label0001:
	push_all
	fld1
	push_argp
	push_arg	dword ptr [ebp-4]
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
	push_arg	dword ptr [ebp+28]
	fldz
	push_argp
	fldz
	push_argp
	lea	dword34,[__clip_z_far_base]
	push_arg	dword34
	call	_vec4f_assign
	restore_stack	20
	pop_all
	fld	dword ptr [ebp+24]
	fld	dword ptr [ebp+28]
	fucomip	st,st(1)
	fstp	st
	jbe	label0002
	fld	[___unnamed_float_2]
	fstp	dword ptr [ebp-8]
	jmp	label0003
label0002:
	fld1
	fstp	dword ptr [ebp-8]
label0003:
	push_all
	fld1
	push_argp
	push_arg	dword ptr [ebp-8]
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
	fld	[___unnamed_float_2]
	fld1
	fild	dword ptr [ebp+12]
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
	fild	dword ptr [ebp+12]
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
	fld	[___unnamed_float_2]
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
	fld	[___unnamed_float_2]
	fld1
	fild	dword ptr [ebp+16]
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
	fld	[___unnamed_float_2]
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
	mov	dword3,[ebp+8]
	mov	[__videomem],dword3
	destroy_stack_frame	0
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	create_stack_frame	0
	mov	dword2,[ebp+8]
	lea	dword3,[__mvproj_matrix]
	mov	dword4,[dword2]
	mov	dword5,[dword2+4]
	mov	[__mvproj_matrix],dword4
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
	mov	dword3,[ebp+8]
	mov	[__color],dword3
	destroy_stack_frame	0
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	create_stack_frame	0
	mov	dword3,[ebp+8]
	mov	[__texture_data],dword3
	mov	dword6,[ebp+12]
	mov	[__texture_width],dword6
	mov	dword9,[ebp+16]
	mov	[__texture_height],dword9
	destroy_stack_frame	0
	ret
_rasterizer_set_texture endp	

__tex2d proc
	create_stack_frame	8
	mov	dword3,[__texture_width]
	dec	dword3
	int2float	dword3
	fmul	dword ptr [ebp+8]
	float2int	dword20
	mov	dword9,[__texture_height]
	dec	dword9
	int2float	dword9
	fmul	dword ptr [ebp+12]
	float2int	dword21
	mov	dword15,dword21
	imul	dword15,[__texture_width]
	add	dword15,dword20
	sal	dword15,2
	add	dword15,[__texture_data]
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
	mov	dword85,[ebp+8]
	mov	dword80,[__pitch]
	imul	dword80,[ebp+16]
	add	dword80,[__videomem]
	mov	dword7,dword85
	sal	dword7,2
	add	dword80,dword7
	mov	dword83,[ebp+12]
	sal	dword83,2
	add	dword83,dword80
	mov	dword15,dword85
	sal	dword15,2
	sub	dword83,dword15
label0000:
	push_all
	push_arg	dword ptr [ebp+24]
	push_arg	dword ptr [ebp+20]
	call	__tex2d
	restore_stack	8
	pop_all
	mov	dword81,eax
	mov	dword22,dword81
	sar	dword22,24
	and	dword22,255
	mov	[ebp-40],dword22
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	[___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	dword82,[dword80]
	mov	dword35,dword82
	and	dword35,65280
	sar	dword35,8
	mov	[ebp-32],dword35
	mov	dword40,dword82
	and	dword40,255
	mov	[ebp-36],dword40
	mov	dword44,dword81
	and	dword44,65280
	sar	dword44,8
	mov	[ebp-20],dword44
	mov	dword49,dword81
	and	dword49,255
	mov	[ebp-24],dword49
	fild	dword ptr [ebp-20]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-32]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword55
	mov	[ebp-20],dword55
	fild	dword ptr [ebp-24]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-36]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword61
	mov	[ebp-24],dword61
	mov	dword84,[ebp-20]
	sal	dword84,8
	add	dword84,[ebp-24]
	mov	[dword80],dword84
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	dword80,4
	cmp	dword80,dword83
	jl	label0000
label0002:
	destroy_stack_frame	44
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	create_stack_frame	0
	mov	dword21,[ebp+16]
	mov	dword20,[ebp+12]
	mov	dword19,[ebp+8]
	cmp	dword19,dword20
	jg	label0000
	push_all
	push_arg	dword ptr [ebp+40]
	push_arg	dword ptr [ebp+36]
	push_arg	dword ptr [ebp+24]
	push_arg	dword ptr [ebp+20]
	push_arg	dword21
	push_arg	dword20
	push_arg	dword19
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0001
label0000:
	push_all
	push_arg	dword ptr [ebp+40]
	push_arg	dword ptr [ebp+36]
	push_arg	dword ptr [ebp+32]
	push_arg	dword ptr [ebp+28]
	push_arg	dword21
	push_arg	dword19
	push_arg	dword20
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0001:
	destroy_stack_frame	0
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	create_stack_frame	0
	mov	dword75,[ebp+24]
	mov	dword74,[ebp+20]
	mov	dword73,[ebp+12]
	mov	dword72,[ebp+8]
	mov	dword71,[ebp+16]
	cmp	dword72,dword73
	jge	label0000
	cmp	dword71,dword73
	jle	label0001
	push_all
	push_arg	dword ptr [ebp+40]
	push_arg	dword ptr [ebp+36]
	push_arg	dword ptr [dword75+4]
	push_arg	dword ptr [dword75]
	push_arg	dword74
	push_arg	dword71
	push_arg	dword72
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0002
label0001:
	cmp	dword71,dword72
	jge	label0003
	push_all
	push_arg	dword ptr [ebp+40]
	push_arg	dword ptr [ebp+36]
	mov	dword22,[ebp+32]
	push_arg	dword ptr [dword22+4]
	mov	dword24,[ebp+32]
	push_arg	dword ptr [dword24]
	push_arg	dword74
	push_arg	dword73
	push_arg	dword71
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0004
label0003:
	push_all
	push_arg	dword ptr [ebp+40]
	push_arg	dword ptr [ebp+36]
	push_arg	dword ptr [dword75+4]
	push_arg	dword ptr [dword75]
	push_arg	dword74
	push_arg	dword73
	push_arg	dword72
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0004:
label0002:
	jmp	label0005
label0000:
	cmp	dword71,dword73
	jge	label0006
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_argp
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_argp
	mov	dword43,[ebp+32]
	push_arg	dword ptr [dword43+4]
	mov	dword45,[ebp+32]
	push_arg	dword ptr [dword45]
	push_arg	dword74
	push_arg	dword72
	push_arg	dword71
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0007
label0006:
	cmp	dword71,dword72
	jle	label0008
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_argp
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_argp
	mov	dword55,[ebp+28]
	push_arg	dword ptr [dword55+4]
	mov	dword57,[ebp+28]
	push_arg	dword ptr [dword57]
	push_arg	dword74
	push_arg	dword71
	push_arg	dword73
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0009
label0008:
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_argp
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_argp
	mov	dword64,[ebp+28]
	push_arg	dword ptr [dword64+4]
	mov	dword66,[ebp+28]
	push_arg	dword ptr [dword66]
	push_arg	dword74
	push_arg	dword72
	push_arg	dword73
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
	mov	dword490,[ebp+16]
	mov	dword489,[ebp+12]
	mov	dword488,[ebp+8]
	mov	dword7,[dword488+4]
	cmp	dword7,[dword489+4]
	jle	label0000
	mov	[ebp-4],dword488
	mov	dword488,dword489
	mov	dword489,[ebp-4]
label0000:
	mov	dword23,[dword488+4]
	cmp	dword23,[dword490+4]
	jle	label0001
	mov	[ebp-4],dword488
	mov	dword488,dword490
	mov	dword490,[ebp-4]
label0001:
	mov	dword39,[dword489+4]
	cmp	dword39,[dword490+4]
	jle	label0002
	mov	[ebp-4],dword489
	mov	dword489,dword490
	mov	dword490,[ebp-4]
label0002:
	mov	dword55,[dword488+4]
	cmp	dword55,[dword490+4]
	jne	label0003
	cmp	dword ptr [dword488+4],0
	jl	label0004
	mov	dword64,[dword488+4]
	cmp	dword64,[__height]
	jge	label0004
	push_all
	fldz
	push_argp
	fldz
	push_argp
	mov	dword66,8
	add	dword66,dword490
	push_arg	dword66
	mov	dword68,8
	add	dword68,dword489
	push_arg	dword68
	mov	dword70,8
	add	dword70,dword488
	push_arg	dword70
	push_arg	dword ptr [dword488+4]
	push_arg	dword ptr [dword490]
	push_arg	dword ptr [dword489]
	push_arg	dword ptr [dword488]
	call	__rasterize_triangle_1i
	restore_stack	36
	pop_all
label0004:
	destroy_stack_frame	40
	ret
label0003:
	mov	dword84,[dword488+4]
	mov	[ebp-16],dword84
label0005:
label0006:
	mov	dword89,[dword489+4]
	cmp	dword89,[ebp-16]
	jl	label0007
	mov	dword94,[ebp-16]
	sub	dword94,[dword488+4]
	mov	dword99,[dword489]
	sub	dword99,[dword488]
	imul	dword94,dword99
	mov	dword106,[dword489+4]
	sub	dword106,[dword488+4]
	mov	eax,dword94
	cdq
	idiv	dword106
	add	eax,[dword488]
	mov	[ebp-8],eax
	mov	dword114,[ebp-16]
	sub	dword114,[dword488+4]
	mov	dword119,[dword490]
	sub	dword119,[dword488]
	imul	dword114,dword119
	mov	dword126,[dword490+4]
	sub	dword126,[dword488+4]
	mov	eax,dword114
	cdq
	idiv	dword126
	add	eax,[dword488]
	mov	[ebp-12],eax
	mov	dword135,[ebp-16]
	sub	dword135,[dword488+4]
	int2float	dword135
	fld	dword ptr [dword489+8]
	fsub	dword ptr [dword488+8]
	fmulp
	mov	dword146,[dword489+4]
	sub	dword146,[dword488+4]
	int2float	dword146
	fdivp
	fadd	dword ptr [dword488+8]
	fstp	dword ptr [ebp-20]
	mov	dword154,[ebp-16]
	sub	dword154,[dword488+4]
	int2float	dword154
	fld	dword ptr [dword490+8]
	fsub	dword ptr [dword488+8]
	fmulp
	mov	dword165,[dword490+4]
	sub	dword165,[dword488+4]
	int2float	dword165
	fdivp
	fadd	dword ptr [dword488+8]
	fstp	dword ptr [ebp-28]
	mov	dword173,[ebp-16]
	sub	dword173,[dword488+4]
	int2float	dword173
	mov	dword175,8
	add	dword175,dword489
	add	dword175,4
	mov	dword178,8
	add	dword178,dword488
	add	dword178,4
	fld	dword ptr [dword175]
	fsub	dword ptr [dword178]
	fmulp
	mov	dword186,[dword489+4]
	sub	dword186,[dword488+4]
	int2float	dword186
	fdivp
	mov	dword188,8
	add	dword188,dword488
	add	dword188,4
	fadd	dword ptr [dword188]
	fstp	dword ptr [ebp-24]
	mov	dword195,[ebp-16]
	sub	dword195,[dword488+4]
	int2float	dword195
	mov	dword197,8
	add	dword197,dword490
	add	dword197,4
	mov	dword200,8
	add	dword200,dword488
	add	dword200,4
	fld	dword ptr [dword197]
	fsub	dword ptr [dword200]
	fmulp
	mov	dword208,[dword490+4]
	sub	dword208,[dword488+4]
	int2float	dword208
	fdivp
	mov	dword210,8
	add	dword210,dword488
	add	dword210,4
	fadd	dword ptr [dword210]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	mov	dword217,[ebp-12]
	sub	dword217,[ebp-8]
	int2float	dword217
	fdivp
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	mov	dword223,[ebp-12]
	sub	dword223,[ebp-8]
	int2float	dword223
	fdivp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40]
	push_arg	dword ptr [ebp-36]
	push_arg	dword ptr [ebp-32]
	push_arg	dword ptr [ebp-28]
	push_arg	dword ptr [ebp-24]
	push_arg	dword ptr [ebp-20]
	push_arg	dword ptr [ebp-16]
	push_arg	dword ptr [ebp-12]
	push_arg	dword ptr [ebp-8]
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	inc	dword ptr [ebp-16]
	jmp	label0006
label0007:
	mov	dword240,[dword489+4]
	sub	dword240,[dword488+4]
	mov	dword245,[dword490]
	sub	dword245,[dword488]
	imul	dword240,dword245
	mov	dword252,[dword490+4]
	sub	dword252,[dword488+4]
	mov	eax,dword240
	cdq
	idiv	dword252
	add	eax,[dword488]
	mov	[ebp-12],eax
	mov	dword263,[dword489+4]
	sub	dword263,[dword488+4]
	int2float	dword263
	fld	dword ptr [dword490+8]
	fsub	dword ptr [dword488+8]
	fmulp
	mov	dword274,[dword490+4]
	sub	dword274,[dword488+4]
	int2float	dword274
	fdivp
	fadd	dword ptr [dword488+8]
	fstp	dword ptr [ebp-28]
	mov	dword284,[dword489+4]
	sub	dword284,[dword488+4]
	int2float	dword284
	mov	dword286,8
	add	dword286,dword490
	add	dword286,4
	mov	dword289,8
	add	dword289,dword488
	add	dword289,4
	fld	dword ptr [dword286]
	fsub	dword ptr [dword289]
	fmulp
	mov	dword297,[dword490+4]
	sub	dword297,[dword488+4]
	int2float	dword297
	fdivp
	mov	dword299,8
	add	dword299,dword488
	add	dword299,4
	fadd	dword ptr [dword299]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [dword489+8]
	mov	dword308,[ebp-12]
	sub	dword308,[dword489]
	int2float	dword308
	fdivp
	fstp	dword ptr [ebp-36]
	mov	dword312,8
	add	dword312,dword489
	add	dword312,4
	fld	dword ptr [ebp-32]
	fsub	dword ptr [dword312]
	mov	dword317,[ebp-12]
	sub	dword317,[dword489]
	int2float	dword317
	fdivp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40]
	push_arg	dword ptr [ebp-36]
	mov	dword321,8
	add	dword321,dword489
	add	dword321,4
	push_arg	dword ptr [dword321]
	push_arg	dword ptr [dword489+8]
	push_arg	dword ptr [ebp-32]
	push_arg	dword ptr [ebp-28]
	push_arg	dword ptr [dword489+4]
	push_arg	dword ptr [dword489]
	push_arg	dword ptr [ebp-12]
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	mov	dword336,1
	add	dword336,[dword489+4]
	mov	[ebp-16],dword336
label0008:
label0009:
	mov	dword342,[dword490+4]
	cmp	dword342,[ebp-16]
	jl	label000a
	mov	dword347,[ebp-16]
	sub	dword347,[dword489+4]
	mov	dword352,[dword490]
	sub	dword352,[dword489]
	imul	dword347,dword352
	mov	dword359,[dword490+4]
	sub	dword359,[dword489+4]
	mov	eax,dword347
	cdq
	idiv	dword359
	add	eax,[dword489]
	mov	[ebp-8],eax
	mov	dword367,[ebp-16]
	sub	dword367,[dword488+4]
	mov	dword372,[dword490]
	sub	dword372,[dword488]
	imul	dword367,dword372
	mov	dword379,[dword490+4]
	sub	dword379,[dword488+4]
	mov	eax,dword367
	cdq
	idiv	dword379
	add	eax,[dword488]
	mov	[ebp-12],eax
	mov	dword388,[ebp-16]
	sub	dword388,[dword489+4]
	int2float	dword388
	fld	dword ptr [dword490+8]
	fsub	dword ptr [dword489+8]
	fmulp
	mov	dword399,[dword490+4]
	sub	dword399,[dword489+4]
	int2float	dword399
	fdivp
	fadd	dword ptr [dword489+8]
	fstp	dword ptr [ebp-20]
	mov	dword407,[ebp-16]
	sub	dword407,[dword488+4]
	int2float	dword407
	fld	dword ptr [dword490+8]
	fsub	dword ptr [dword488+8]
	fmulp
	mov	dword418,[dword490+4]
	sub	dword418,[dword488+4]
	int2float	dword418
	fdivp
	fadd	dword ptr [dword488+8]
	fstp	dword ptr [ebp-28]
	mov	dword426,[ebp-16]
	sub	dword426,[dword489+4]
	int2float	dword426
	mov	dword428,8
	add	dword428,dword490
	add	dword428,4
	mov	dword431,8
	add	dword431,dword489
	add	dword431,4
	fld	dword ptr [dword428]
	fsub	dword ptr [dword431]
	fmulp
	mov	dword439,[dword490+4]
	sub	dword439,[dword489+4]
	int2float	dword439
	fdivp
	mov	dword441,8
	add	dword441,dword489
	add	dword441,4
	fadd	dword ptr [dword441]
	fstp	dword ptr [ebp-24]
	mov	dword448,[ebp-16]
	sub	dword448,[dword488+4]
	int2float	dword448
	mov	dword450,8
	add	dword450,dword490
	add	dword450,4
	mov	dword453,8
	add	dword453,dword488
	add	dword453,4
	fld	dword ptr [dword450]
	fsub	dword ptr [dword453]
	fmulp
	mov	dword461,[dword490+4]
	sub	dword461,[dword488+4]
	int2float	dword461
	fdivp
	mov	dword463,8
	add	dword463,dword488
	add	dword463,4
	fadd	dword ptr [dword463]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	mov	dword470,[ebp-12]
	sub	dword470,[ebp-8]
	int2float	dword470
	fdivp
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	mov	dword476,[ebp-12]
	sub	dword476,[ebp-8]
	int2float	dword476
	fdivp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40]
	push_arg	dword ptr [ebp-36]
	push_arg	dword ptr [ebp-32]
	push_arg	dword ptr [ebp-28]
	push_arg	dword ptr [ebp-24]
	push_arg	dword ptr [ebp-20]
	push_arg	dword ptr [ebp-16]
	push_arg	dword ptr [ebp-12]
	push_arg	dword ptr [ebp-8]
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	inc	dword ptr [ebp-16]
	jmp	label0009
label000a:
	destroy_stack_frame	40
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	create_stack_frame	60
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
	jl	label0002
	push_all
	push_arg	dword ptr [ebp+16]
	mov	dword19,dword102
	push_arg	dword19
	lea	dword20,[ebp-24]
	push_arg	dword20
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20]
	lea	dword23,[ebp-24]
	push_arg	dword23
	call	_vec4f_dot
	restore_stack	8
	pop_all
	fstp	dword ptr [ebp-52]
	push_all
	push_arg	dword ptr [ebp+16]
	mov	dword26,dword103
	push_arg	dword26
	lea	dword27,[ebp-24]
	push_arg	dword27
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20]
	lea	dword30,[ebp-24]
	push_arg	dword30
	call	_vec4f_dot
	restore_stack	8
	pop_all
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
	push_arg	dword47
	push_arg	dword ptr [ebp+16]
	lea	dword49,[ebp-24]
	push_arg	dword49
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	mov	dword51,dword102
	push_arg	dword51
	mov	dword53,dword103
	push_arg	dword53
	lea	dword54,[ebp-40]
	push_arg	dword54
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20]
	lea	dword57,[ebp-24]
	push_arg	dword57
	call	_vec4f_dot
	restore_stack	8
	pop_all
	push_all
	push_arg	dword ptr [ebp+20]
	lea	dword59,[ebp-40]
	push_arg	dword59
	call	_vec4f_dot
	restore_stack	8
	pop_all
	fdivp
	fstp	dword ptr [ebp-60]
	push_all
	push_arg	dword ptr [ebp-60]
	lea	dword61,[ebp-40]
	push_arg	dword61
	call	_vec4f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword62,[ebp-40]
	push_arg	dword62
	mov	dword64,dword102
	push_arg	dword64
	imul	dword67,[dword101+192],24
	mov	dword69,dword101
	add	dword69,dword67
	push_arg	dword69
	call	_vec4f_add
	restore_stack	12
	pop_all
	push_all
	mov	dword71,16
	add	dword71,dword102
	push_arg	dword71
	mov	dword73,16
	add	dword73,dword103
	push_arg	dword73
	lea	dword74,[ebp-48]
	push_arg	dword74
	call	_vec2f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp-60]
	lea	dword76,[ebp-48]
	push_arg	dword76
	call	_vec2f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword77,[ebp-48]
	push_arg	dword77
	mov	dword79,16
	add	dword79,dword102
	push_arg	dword79
	imul	dword82,[dword101+192],24
	mov	dword84,dword101
	add	dword84,dword82
	add	dword84,16
	push_arg	dword84
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
	destroy_stack_frame	60
	ret
__clip_on_plain endp	

__clip_poligon proc
	create_stack_frame	196
	mov	dword30,[ebp+8]
	push_all
	lea	dword1,[__clip_z_far_norm]
	push_arg	dword1
	lea	dword2,[__clip_z_far_base]
	push_arg	dword2
	push_arg	dword30
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
	push_arg	dword30
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword9,[__clip_plane_left_norm]
	push_arg	dword9
	lea	dword10,[__clip_plane_left_base]
	push_arg	dword10
	push_arg	dword30
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
	push_arg	dword30
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword17,[__clip_plane_top_norm]
	push_arg	dword17
	lea	dword18,[__clip_plane_top_base]
	push_arg	dword18
	push_arg	dword30
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
	push_arg	dword30
	call	__clip_on_plain
	restore_stack	16
	pop_all
	cmp	dword ptr [dword30+192],1
	setg	byte1
	movzx	dword28,byte1
	mov	eax,dword28
	destroy_stack_frame	196
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	create_stack_frame	20
	mov	dword35,[ebp+8]
	push_all
	lea	dword1,[__viewport_matrix]
	push_arg	dword1
	push_arg	dword ptr [ebp+12]
	lea	dword3,[ebp-16]
	push_arg	dword3
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	fld1
	lea	dword5,[ebp-16]
	add	dword5,12
	fdiv	dword ptr [dword5]
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [ebp-20]
	float2int	dword9
	mov	[dword35],dword9
	lea	dword12,[ebp-16]
	add	dword12,4
	fld	dword ptr [dword12]
	fmul	dword ptr [ebp-20]
	float2int	dword15
	mov	[dword35+4],dword15
	cmp	dword ptr [dword35],0
	jl	label0001
	mov	dword24,[dword35]
	cmp	dword24,[__width]
	jge	label0001
	cmp	dword ptr [dword35+4],0
	jl	label0001
	mov	dword31,[dword35+4]
	cmp	dword31,[__height]
	jl	label0000
label0001:
	mov	dword ptr ds:[0],0
label0000:
	destroy_stack_frame	20
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	create_stack_frame	136
	mov	dword54,[ebp+8]
	push_all
	push_arg	dword54
	call	__clip_poligon
	restore_stack	4
	pop_all
	cmp	eax,0
	jne	label0000
	destroy_stack_frame	136
	ret
label0000:
	cmp	dword ptr [dword54+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword53,0
label0002:
label0003:
	mov	dword12,[dword54+192]
	cmp	dword12,dword53
	jl	label0004
	push_all
	mov	dword14,dword54
	imul	dword16,dword53,24
	add	dword14,dword16
	push_arg	dword14
	lea	dword17,[ebp-132]
	mov	dword20,dword53
	sal	dword20,4
	add	dword17,dword20
	push_arg	dword17
	call	__transform_to_screen_space
	restore_stack	8
	pop_all
	lea	dword21,[ebp-132]
	mov	dword24,dword53
	sal	dword24,4
	add	dword21,dword24
	add	dword21,8
	mov	dword27,dword54
	imul	dword29,dword53,24
	add	dword27,dword29
	add	dword27,16
	mov	dword31,[dword27]
	mov	dword32,[dword27+4]
	mov	[dword21],dword31
	mov	[dword21+4],dword32
	inc	dword53
	jmp	label0003
label0004:
	mov	dword53,2
label0005:
label0006:
	mov	dword39,[dword54+192]
	dec	dword39
	cmp	dword39,dword53
	jl	label0007
	push_all
	lea	dword41,[ebp-132]
	mov	dword44,dword53
	sal	dword44,4
	add	dword41,dword44
	push_arg	dword41
	mov	dword47,dword53
	dec	dword47
	sal	dword47,4
	lea	dword49,[ebp-132]
	add	dword49,dword47
	push_arg	dword49
	lea	dword50,[ebp-132]
	push_arg	dword50
	call	__rasterize_triangle_2i
	restore_stack	12
	pop_all
	inc	dword53
	jmp	label0006
label0007:
	destroy_stack_frame	136
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	create_stack_frame	16
	mov	dword12,[ebp+12]
	push_all
	fld1
	push_argp
	push_arg	dword ptr [dword12+8]
	push_arg	dword ptr [dword12+4]
	push_arg	dword ptr [dword12]
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
	push_arg	dword ptr [ebp+8]
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	destroy_stack_frame	16
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	create_stack_frame	196
	push_all
	push_arg	dword ptr [ebp+8]
	lea	dword2,[ebp-196]
	push_arg	dword2
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
	push_arg	dword ptr [ebp+12]
	lea	dword10,[ebp-196]
	add	dword10,24
	push_arg	dword10
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
	push_arg	dword ptr [ebp+16]
	lea	dword20,[ebp-196]
	add	dword20,48
	push_arg	dword20
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
	push_arg	dword37
	call	__rasterize_polygon_4f
	restore_stack	4
	pop_all
	destroy_stack_frame	196
	ret
_rasterizer_triangle3f endp	

end
