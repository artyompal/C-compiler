
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
	mov	dword11,[ebp+12]
	mov	[ebp-24],dword11
	mov	dword10,[ebp+8]
	mov	[ebp-28],dword10
	lea	dword3,[ebp-16]
	mov	[ebp-32],dword3
; start of inline function vec4f_subtract
	mov	dword14,[ebp-28]
	mov	dword16,[ebp-24]
	fld	dword ptr [dword14]
	fsub	dword ptr [dword16]
	mov	dword18,[ebp-32]
	fstp	dword ptr [dword18]
	mov	dword20,[ebp-28]
	mov	dword22,[ebp-24]
	fld	dword ptr [dword20+4]
	fsub	dword ptr [dword22+4]
	mov	dword24,[ebp-32]
	fstp	dword ptr [dword24+4]
	mov	dword26,[ebp-28]
	mov	dword28,[ebp-24]
	fld	dword ptr [dword26+8]
	fsub	dword ptr [dword28+8]
	mov	dword30,[ebp-32]
	fstp	dword ptr [dword30+8]
	mov	dword32,[ebp-28]
	mov	dword34,[ebp-24]
	fld	dword ptr [dword32+12]
	fsub	dword ptr [dword34+12]
	mov	dword36,[ebp-32]
	fstp	dword ptr [dword36+12]
label0000:
; end of inline function vec4f_subtract
	lea	dword4,[ebp-16]
	mov	[ebp-36],dword4
	lea	dword5,[ebp-16]
	mov	[ebp-40],dword5
; start of inline function vec4f_dot
	mov	dword39,[ebp-40]
	mov	dword41,[ebp-36]
	fld	dword ptr [dword39+4]
	fmul	dword ptr [dword41+4]
	mov	dword43,[ebp-40]
	mov	dword45,[ebp-36]
	fld	dword ptr [dword43]
	fmul	dword ptr [dword45]
	faddp
	mov	dword47,[ebp-40]
	mov	dword49,[ebp-36]
	fld	dword ptr [dword47+8]
	fmul	dword ptr [dword49+8]
	faddp
	mov	dword51,[ebp-40]
	mov	dword53,[ebp-36]
	fld	dword ptr [dword51+12]
	fmul	dword ptr [dword53+12]
	faddp
	fstp	dword ptr [ebp-44]
label0001:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-44]
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
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [ebp-32]
	mov	dword219,[ebp+32]
	mov	[ebp-36],dword219
	mov	dword218,[ebp+28]
	mov	[ebp-40],dword218
	mov	dword217,[ebp+24]
	mov	[ebp-44],dword217
	lea	dword18,dword ptr [__mvproj_matrix]
	mov	[ebp-48],dword18
; start of inline function matrix4f_make_perspective
	fld	dword ptr [ebp-36]
	fmul	dword ptr [ebp-44]
	fstp	dword ptr [ebp-52]
	fld	dword ptr [ebp-52]
	fmul	dword ptr [ebp-32]
	fstp	dword ptr [ebp-56]
	mov	dword228,[ebp-48]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-56]
	fstp	dword ptr [dword228]
	mov	dword232,[ebp-48]
	fldz
	fstp	dword ptr [dword232+4]
	mov	dword234,[ebp-48]
	fldz
	fstp	dword ptr [dword234+8]
	mov	dword236,[ebp-48]
	fldz
	fstp	dword ptr [dword236+12]
	mov	dword238,[ebp-48]
	fldz
	fstp	dword ptr [dword238+16]
	mov	dword240,[ebp-48]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-52]
	fstp	dword ptr [dword240+20]
	mov	dword244,[ebp-48]
	fldz
	fstp	dword ptr [dword244+24]
	mov	dword246,[ebp-48]
	fldz
	fstp	dword ptr [dword246+28]
	mov	dword248,[ebp-48]
	fldz
	fstp	dword ptr [dword248+32]
	mov	dword250,[ebp-48]
	fldz
	fstp	dword ptr [dword250+36]
	mov	dword252,[ebp-48]
	fld	dword ptr [ebp-40]
	fsub	dword ptr [ebp-44]
	fdivr	dword ptr [ebp-40]
	fstp	dword ptr [dword252+40]
	mov	dword257,[ebp-48]
	fld1
	fstp	dword ptr [dword257+44]
	mov	dword259,[ebp-48]
	fldz
	fstp	dword ptr [dword259+48]
	mov	dword261,[ebp-48]
	fldz
	fstp	dword ptr [dword261+52]
	mov	dword263,[ebp-48]
	fld	dword ptr [ebp-44]
	fmul	dword ptr [ebp-40]
	fld	dword ptr [ebp-44]
	fsub	dword ptr [ebp-40]
	fdivp
	fstp	dword ptr [dword263+56]
	mov	dword269,[ebp-48]
	fldz
	fstp	dword ptr [dword269+60]
label0010:
; end of inline function matrix4f_make_perspective
	mov	dword271,[ebp+28]
	mov	[ebp-60],dword271
	mov	dword270,[ebp+24]
	mov	[ebp-64],dword270
	fild	dword ptr [ebp+16]
	fstp	dword ptr [ebp-68]
	fild	dword ptr [ebp+12]
	fstp	dword ptr [ebp-72]
	lea	dword23,dword ptr [__viewport_matrix]
	mov	[ebp-76],dword23
; start of inline function matrix4f_make_viewport
	mov	dword274,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [dword274]
	mov	dword278,[ebp-76]
	fldz
	fstp	dword ptr [dword278+4]
	mov	dword280,[ebp-76]
	fldz
	fstp	dword ptr [dword280+8]
	mov	dword282,[ebp-76]
	fldz
	fstp	dword ptr [dword282+12]
	mov	dword284,[ebp-76]
	fldz
	fstp	dword ptr [dword284+16]
	mov	dword286,[ebp-76]
	fld	dword ptr [ebp-68]
	fldz
	fsubrp
	fld	dword ptr [___unnamed_float_1]
	fdivp
	fstp	dword ptr [dword286+20]
	mov	dword290,[ebp-76]
	fldz
	fstp	dword ptr [dword290+24]
	mov	dword292,[ebp-76]
	fldz
	fstp	dword ptr [dword292+28]
	mov	dword294,[ebp-76]
	fldz
	fstp	dword ptr [dword294+32]
	mov	dword296,[ebp-76]
	fldz
	fstp	dword ptr [dword296+36]
	mov	dword298,[ebp-76]
	fld	dword ptr [ebp-60]
	fsub	dword ptr [ebp-64]
	fstp	dword ptr [dword298+40]
	mov	dword302,[ebp-76]
	fldz
	fstp	dword ptr [dword302+44]
	mov	dword304,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [dword304+48]
	mov	dword308,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-68]
	fstp	dword ptr [dword308+52]
	mov	dword312,[ebp-76]
	fld	dword ptr [ebp-64]
	fstp	dword ptr [dword312+56]
	mov	dword315,[ebp-76]
	fld1
	fstp	dword ptr [dword315+60]
label0011:
; end of inline function matrix4f_make_viewport
	fld1
	fstp	dword ptr [ebp-12]
	mov	dword57,[ebp+24]
	mov	[ebp-16],dword57
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword25,dword ptr [__clip_z_near_base]
	mov	[ebp-28],dword25
; start of inline function vec4f_assign
	mov	dword60,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword60]
	mov	dword63,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword63+4]
	mov	dword66,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword66+8]
	mov	dword69,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword69+12]
label0004:
; end of inline function vec4f_assign
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
	fld1
	fstp	dword ptr [ebp-12]
	mov	dword71,[ebp-4]
	mov	[ebp-16],dword71
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword32,dword ptr [__clip_z_near_norm]
	mov	[ebp-28],dword32
; start of inline function vec4f_assign
	mov	dword74,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword74]
	mov	dword77,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword77+4]
	mov	dword80,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword80+8]
	mov	dword83,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword83+12]
label0005:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	mov	dword85,[ebp+28]
	mov	[ebp-16],dword85
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword34,dword ptr [__clip_z_far_base]
	mov	[ebp-28],dword34
; start of inline function vec4f_assign
	mov	dword88,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword88]
	mov	dword91,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword91+4]
	mov	dword94,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword94+8]
	mov	dword97,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword97+12]
label0006:
; end of inline function vec4f_assign
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
	fld1
	fstp	dword ptr [ebp-12]
	mov	dword99,[ebp-8]
	mov	[ebp-16],dword99
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword41,dword ptr [__clip_z_far_norm]
	mov	[ebp-28],dword41
; start of inline function vec4f_assign
	mov	dword102,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword102]
	mov	dword105,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword105+4]
	mov	dword108,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword108+8]
	mov	dword111,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword111+12]
label0007:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	fstp	dword ptr [ebp-24]
	lea	dword44,dword ptr [__clip_plane_left_base]
	mov	[ebp-28],dword44
; start of inline function vec4f_assign
	mov	dword115,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword115]
	mov	dword118,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword118+4]
	mov	dword121,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword121+8]
	mov	dword124,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword124+12]
label0008:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fld1
	fstp	dword ptr [ebp-24]
	lea	dword45,dword ptr [__clip_plane_left_norm]
	mov	[ebp-28],dword45
; start of inline function vec4f_assign
	mov	dword128,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword128]
	mov	dword131,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword131+4]
	mov	dword134,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword134+8]
	mov	dword137,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword137+12]
label0009:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld1
	fsubrp
	fstp	dword ptr [ebp-24]
	lea	dword47,dword ptr [__clip_plane_right_base]
	mov	[ebp-28],dword47
; start of inline function vec4f_assign
	mov	dword141,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword141]
	mov	dword144,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword144+4]
	mov	dword147,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword147+8]
	mov	dword150,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword150+12]
label000a:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-24]
	lea	dword49,dword ptr [__clip_plane_right_norm]
	mov	[ebp-28],dword49
; start of inline function vec4f_assign
	mov	dword154,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword154]
	mov	dword157,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword157+4]
	mov	dword160,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword160+8]
	mov	dword163,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword163+12]
label000b:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fild	dword ptr [ebp+16]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword52,dword ptr [__clip_plane_top_base]
	mov	[ebp-28],dword52
; start of inline function vec4f_assign
	mov	dword167,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword167]
	mov	dword170,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword170+4]
	mov	dword173,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword173+8]
	mov	dword176,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword176+12]
label000c:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld1
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword53,dword ptr [__clip_plane_top_norm]
	mov	[ebp-28],dword53
; start of inline function vec4f_assign
	mov	dword180,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword180]
	mov	dword183,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword183+4]
	mov	dword186,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword186+8]
	mov	dword189,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword189+12]
label000d:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld1
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword54,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-28],dword54
; start of inline function vec4f_assign
	mov	dword193,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword193]
	mov	dword196,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword196+4]
	mov	dword199,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword199+8]
	mov	dword202,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword202+12]
label000e:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword56,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-28],dword56
; start of inline function vec4f_assign
	mov	dword206,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword206]
	mov	dword209,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword209+4]
	mov	dword212,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword212+8]
	mov	dword215,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword215+12]
label000f:
; end of inline function vec4f_assign
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
	mov	dword106,[ebp+8]
	mov	dword101,dword ptr [__pitch]
	imul	dword101,[ebp+16]
	add	dword101,dword ptr [__videomem]
	sal	dword106,2
	add	dword101,dword106
	sal	dword ptr [ebp+12],2
	mov	dword104,dword101
	add	dword104,[ebp+12]
	sal	dword106,2
	sub	dword104,dword106
label0000:
	mov	dword79,[ebp+24]
	mov	[ebp-48],dword79
	mov	dword78,[ebp+20]
	mov	[ebp-52],dword78
; start of inline function _tex2d
	mov	dword83,dword ptr [__texture_width]
	dec	dword83
	int2float	dword83
	fmul	dword ptr [ebp-52]
	float2int	dword85
	mov	[ebp-56],dword85
	mov	dword89,dword ptr [__texture_height]
	dec	dword89
	int2float	dword89
	fmul	dword ptr [ebp-48]
	float2int	dword91
	mov	[ebp-60],dword91
	mov	dword95,[ebp-60]
	imul	dword95,dword ptr [__texture_width]
	add	dword95,[ebp-56]
	sal	dword95,2
	add	dword95,dword ptr [__texture_data]
	mov	dword99,[dword95]
	mov	[ebp-64],dword99
label0004:
; end of inline function _tex2d
	mov	dword102,[ebp-64]
	sar	dword102,24
	mov	dword22,dword102
	and	dword22,-289
	mov	[ebp-40],dword22
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	dword103,[dword101]
	mov	dword34,dword103
	and	dword34,-73984
	sar	dword34,8
	mov	[ebp-32],dword34
	mov	dword39,dword103
	and	dword39,-289
	mov	[ebp-36],dword39
	mov	dword43,dword102
	and	dword43,-73984
	sar	dword43,8
	mov	[ebp-20],dword43
	mov	dword48,dword102
	and	dword48,-289
	mov	[ebp-24],dword48
	fild	dword ptr [ebp-20]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-32]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword54
	mov	[ebp-20],dword54
	fild	dword ptr [ebp-24]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-36]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword60
	mov	[ebp-24],dword60
	sal	dword ptr [ebp-20],8
	mov	dword105,[ebp-20]
	add	dword105,[ebp-24]
	mov	[dword101],dword105
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	dword101,4
	cmp	dword101,dword104
	jl	label0000
label0002:
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	create_stack_frame
	mov	dword235,[ebp+16]
	mov	dword234,[ebp+12]
	mov	dword233,[ebp+8]
	cmp	dword233,dword234
	jg	label0000
	mov	dword24,[ebp+40]
	mov	[ebp-4],dword24
	mov	dword23,[ebp+36]
	mov	[ebp-8],dword23
	mov	dword22,[ebp+24]
	mov	[ebp-12],dword22
	mov	dword21,[ebp+20]
	mov	[ebp-16],dword21
	mov	[ebp-20],dword235
	mov	[ebp-24],dword234
	mov	[ebp-28],dword233
; start of inline function _rasterize_horiz_line
	mov	dword28,dword ptr [__pitch]
	imul	dword28,[ebp-20]
	add	dword28,dword ptr [__videomem]
	sal	dword ptr [ebp-28],2
	add	dword28,[ebp-28]
	mov	[ebp-32],dword28
	sal	dword ptr [ebp-24],2
	mov	dword36,[ebp-32]
	add	dword36,[ebp-24]
	sal	dword ptr [ebp-28],2
	sub	dword36,[ebp-28]
	mov	[ebp-36],dword36
label0002:
	mov	dword104,[ebp-12]
	mov	[ebp-76],dword104
	mov	dword103,[ebp-16]
	mov	[ebp-80],dword103
; start of inline function _tex2d
	mov	dword108,dword ptr [__texture_width]
	dec	dword108
	int2float	dword108
	fmul	dword ptr [ebp-80]
	float2int	dword110
	mov	[ebp-84],dword110
	mov	dword114,dword ptr [__texture_height]
	dec	dword114
	int2float	dword114
	fmul	dword ptr [ebp-76]
	float2int	dword116
	mov	[ebp-88],dword116
	mov	dword120,[ebp-88]
	imul	dword120,dword ptr [__texture_width]
	add	dword120,[ebp-84]
	sal	dword120,2
	add	dword120,dword ptr [__texture_data]
	mov	dword124,[dword120]
	mov	[ebp-92],dword124
label0006:
; end of inline function _tex2d
	mov	dword42,[ebp-92]
	mov	[ebp-40],dword42
	sar	dword ptr [ebp-40],24
	mov	dword47,[ebp-40]
	and	dword47,-289
	mov	[ebp-68],dword47
	cmp	dword ptr [ebp-68],0
	je	label0005
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword54,[ebp-32]
	mov	dword56,[dword54]
	mov	[ebp-56],dword56
	mov	dword59,[ebp-56]
	and	dword59,-73984
	sar	dword59,8
	mov	[ebp-60],dword59
	mov	dword64,[ebp-56]
	and	dword64,-289
	mov	[ebp-64],dword64
	mov	dword68,[ebp-40]
	and	dword68,-73984
	sar	dword68,8
	mov	[ebp-48],dword68
	mov	dword73,[ebp-40]
	and	dword73,-289
	mov	[ebp-52],dword73
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword79
	mov	[ebp-48],dword79
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword85
	mov	[ebp-52],dword85
	sal	dword ptr [ebp-48],8
	mov	dword90,[ebp-48]
	add	dword90,[ebp-52]
	mov	[ebp-44],dword90
	mov	dword93,[ebp-32]
	mov	dword95,[ebp-44]
	mov	[dword93],dword95
label0005:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0003:
	add	dword ptr [ebp-32],4
	mov	dword102,[ebp-32]
	cmp	dword102,[ebp-36]
	jl	label0002
label0004:
label0007:
; end of inline function _rasterize_horiz_line
	jmp	label0001
label0000:
	mov	dword131,[ebp+40]
	mov	[ebp-4],dword131
	mov	dword130,[ebp+36]
	mov	[ebp-8],dword130
	mov	dword129,[ebp+32]
	mov	[ebp-12],dword129
	mov	dword128,[ebp+28]
	mov	[ebp-16],dword128
	mov	[ebp-20],dword235
	mov	[ebp-24],dword233
	mov	[ebp-28],dword234
; start of inline function _rasterize_horiz_line
	mov	dword135,dword ptr [__pitch]
	imul	dword135,[ebp-20]
	add	dword135,dword ptr [__videomem]
	sal	dword ptr [ebp-28],2
	add	dword135,[ebp-28]
	mov	[ebp-32],dword135
	sal	dword ptr [ebp-24],2
	mov	dword143,[ebp-32]
	add	dword143,[ebp-24]
	sal	dword ptr [ebp-28],2
	sub	dword143,[ebp-28]
	mov	[ebp-36],dword143
label0008:
	mov	dword211,[ebp-12]
	mov	[ebp-76],dword211
	mov	dword210,[ebp-16]
	mov	[ebp-80],dword210
; start of inline function _tex2d
	mov	dword215,dword ptr [__texture_width]
	dec	dword215
	int2float	dword215
	fmul	dword ptr [ebp-80]
	float2int	dword217
	mov	[ebp-84],dword217
	mov	dword221,dword ptr [__texture_height]
	dec	dword221
	int2float	dword221
	fmul	dword ptr [ebp-76]
	float2int	dword223
	mov	[ebp-88],dword223
	mov	dword227,[ebp-88]
	imul	dword227,dword ptr [__texture_width]
	add	dword227,[ebp-84]
	sal	dword227,2
	add	dword227,dword ptr [__texture_data]
	mov	dword231,[dword227]
	mov	[ebp-92],dword231
label000c:
; end of inline function _tex2d
	mov	dword149,[ebp-92]
	mov	[ebp-40],dword149
	sar	dword ptr [ebp-40],24
	mov	dword154,[ebp-40]
	and	dword154,-289
	mov	[ebp-68],dword154
	cmp	dword ptr [ebp-68],0
	je	label000b
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword161,[ebp-32]
	mov	dword163,[dword161]
	mov	[ebp-56],dword163
	mov	dword166,[ebp-56]
	and	dword166,-73984
	sar	dword166,8
	mov	[ebp-60],dword166
	mov	dword171,[ebp-56]
	and	dword171,-289
	mov	[ebp-64],dword171
	mov	dword175,[ebp-40]
	and	dword175,-73984
	sar	dword175,8
	mov	[ebp-48],dword175
	mov	dword180,[ebp-40]
	and	dword180,-289
	mov	[ebp-52],dword180
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword186
	mov	[ebp-48],dword186
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword192
	mov	[ebp-52],dword192
	sal	dword ptr [ebp-48],8
	mov	dword197,[ebp-48]
	add	dword197,[ebp-52]
	mov	[ebp-44],dword197
	mov	dword200,[ebp-32]
	mov	dword202,[ebp-44]
	mov	[dword200],dword202
label000b:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0009:
	add	dword ptr [ebp-32],4
	mov	dword209,[ebp-32]
	cmp	dword209,[ebp-36]
	jl	label0008
label000a:
label000d:
; end of inline function _rasterize_horiz_line
label0001:
	destroy_stack_frame
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	create_stack_frame
	mov	dword710,[ebp+20]
	mov	dword709,[ebp+12]
	mov	dword708,[ebp+8]
	mov	dword707,[ebp+16]
	cmp	dword708,dword709
	jge	label0000
	cmp	dword707,dword709
	jle	label0001
	mov	dword76,[ebp+40]
	mov	[ebp-4],dword76
	mov	dword75,[ebp+36]
	mov	[ebp-8],dword75
	mov	dword10,[ebp+24]
	mov	dword74,[dword10+4]
	mov	[ebp-12],dword74
	mov	dword12,[ebp+24]
	mov	dword73,[dword12]
	mov	[ebp-16],dword73
	mov	[ebp-20],dword710
	mov	[ebp-24],dword707
	mov	[ebp-28],dword708
; start of inline function _rasterize_horiz_line
	mov	dword80,dword ptr [__pitch]
	imul	dword80,[ebp-20]
	add	dword80,dword ptr [__videomem]
	sal	dword ptr [ebp-28],2
	add	dword80,[ebp-28]
	mov	[ebp-32],dword80
	sal	dword ptr [ebp-24],2
	mov	dword88,[ebp-32]
	add	dword88,[ebp-24]
	sal	dword ptr [ebp-28],2
	sub	dword88,[ebp-28]
	mov	[ebp-36],dword88
label000a:
	mov	dword156,[ebp-12]
	mov	[ebp-76],dword156
	mov	dword155,[ebp-16]
	mov	[ebp-80],dword155
; start of inline function _tex2d
	mov	dword160,dword ptr [__texture_width]
	dec	dword160
	int2float	dword160
	fmul	dword ptr [ebp-80]
	float2int	dword162
	mov	[ebp-84],dword162
	mov	dword166,dword ptr [__texture_height]
	dec	dword166
	int2float	dword166
	fmul	dword ptr [ebp-76]
	float2int	dword168
	mov	[ebp-88],dword168
	mov	dword172,[ebp-88]
	imul	dword172,dword ptr [__texture_width]
	add	dword172,[ebp-84]
	sal	dword172,2
	add	dword172,dword ptr [__texture_data]
	mov	dword176,[dword172]
	mov	[ebp-92],dword176
label000e:
; end of inline function _tex2d
	mov	dword94,[ebp-92]
	mov	[ebp-40],dword94
	sar	dword ptr [ebp-40],24
	mov	dword99,[ebp-40]
	and	dword99,-289
	mov	[ebp-68],dword99
	cmp	dword ptr [ebp-68],0
	je	label000d
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword106,[ebp-32]
	mov	dword108,[dword106]
	mov	[ebp-56],dword108
	mov	dword111,[ebp-56]
	and	dword111,-73984
	sar	dword111,8
	mov	[ebp-60],dword111
	mov	dword116,[ebp-56]
	and	dword116,-289
	mov	[ebp-64],dword116
	mov	dword120,[ebp-40]
	and	dword120,-73984
	sar	dword120,8
	mov	[ebp-48],dword120
	mov	dword125,[ebp-40]
	and	dword125,-289
	mov	[ebp-52],dword125
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword131
	mov	[ebp-48],dword131
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword137
	mov	[ebp-52],dword137
	sal	dword ptr [ebp-48],8
	mov	dword142,[ebp-48]
	add	dword142,[ebp-52]
	mov	[ebp-44],dword142
	mov	dword145,[ebp-32]
	mov	dword147,[ebp-44]
	mov	[dword145],dword147
label000d:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label000b:
	add	dword ptr [ebp-32],4
	mov	dword154,[ebp-32]
	cmp	dword154,[ebp-36]
	jl	label000a
label000c:
label000f:
; end of inline function _rasterize_horiz_line
	jmp	label0002
label0001:
	cmp	dword707,dword708
	jge	label0003
	mov	dword183,[ebp+40]
	mov	[ebp-4],dword183
	mov	dword182,[ebp+36]
	mov	[ebp-8],dword182
	mov	dword22,[ebp+32]
	mov	dword181,[dword22+4]
	mov	[ebp-12],dword181
	mov	dword24,[ebp+32]
	mov	dword180,[dword24]
	mov	[ebp-16],dword180
	mov	[ebp-20],dword710
	mov	[ebp-24],dword709
	mov	[ebp-28],dword707
; start of inline function _rasterize_horiz_line
	mov	dword187,dword ptr [__pitch]
	imul	dword187,[ebp-20]
	add	dword187,dword ptr [__videomem]
	sal	dword ptr [ebp-28],2
	add	dword187,[ebp-28]
	mov	[ebp-32],dword187
	sal	dword ptr [ebp-24],2
	mov	dword195,[ebp-32]
	add	dword195,[ebp-24]
	sal	dword ptr [ebp-28],2
	sub	dword195,[ebp-28]
	mov	[ebp-36],dword195
label0010:
	mov	dword263,[ebp-12]
	mov	[ebp-76],dword263
	mov	dword262,[ebp-16]
	mov	[ebp-80],dword262
; start of inline function _tex2d
	mov	dword267,dword ptr [__texture_width]
	dec	dword267
	int2float	dword267
	fmul	dword ptr [ebp-80]
	float2int	dword269
	mov	[ebp-84],dword269
	mov	dword273,dword ptr [__texture_height]
	dec	dword273
	int2float	dword273
	fmul	dword ptr [ebp-76]
	float2int	dword275
	mov	[ebp-88],dword275
	mov	dword279,[ebp-88]
	imul	dword279,dword ptr [__texture_width]
	add	dword279,[ebp-84]
	sal	dword279,2
	add	dword279,dword ptr [__texture_data]
	mov	dword283,[dword279]
	mov	[ebp-92],dword283
label0014:
; end of inline function _tex2d
	mov	dword201,[ebp-92]
	mov	[ebp-40],dword201
	sar	dword ptr [ebp-40],24
	mov	dword206,[ebp-40]
	and	dword206,-289
	mov	[ebp-68],dword206
	cmp	dword ptr [ebp-68],0
	je	label0013
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword213,[ebp-32]
	mov	dword215,[dword213]
	mov	[ebp-56],dword215
	mov	dword218,[ebp-56]
	and	dword218,-73984
	sar	dword218,8
	mov	[ebp-60],dword218
	mov	dword223,[ebp-56]
	and	dword223,-289
	mov	[ebp-64],dword223
	mov	dword227,[ebp-40]
	and	dword227,-73984
	sar	dword227,8
	mov	[ebp-48],dword227
	mov	dword232,[ebp-40]
	and	dword232,-289
	mov	[ebp-52],dword232
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword238
	mov	[ebp-48],dword238
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword244
	mov	[ebp-52],dword244
	sal	dword ptr [ebp-48],8
	mov	dword249,[ebp-48]
	add	dword249,[ebp-52]
	mov	[ebp-44],dword249
	mov	dword252,[ebp-32]
	mov	dword254,[ebp-44]
	mov	[dword252],dword254
label0013:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0011:
	add	dword ptr [ebp-32],4
	mov	dword261,[ebp-32]
	cmp	dword261,[ebp-36]
	jl	label0010
label0012:
label0015:
; end of inline function _rasterize_horiz_line
	jmp	label0004
label0003:
	mov	dword290,[ebp+40]
	mov	[ebp-4],dword290
	mov	dword289,[ebp+36]
	mov	[ebp-8],dword289
	mov	dword31,[ebp+24]
	mov	dword288,[dword31+4]
	mov	[ebp-12],dword288
	mov	dword33,[ebp+24]
	mov	dword287,[dword33]
	mov	[ebp-16],dword287
	mov	[ebp-20],dword710
	mov	[ebp-24],dword709
	mov	[ebp-28],dword708
; start of inline function _rasterize_horiz_line
	mov	dword294,dword ptr [__pitch]
	imul	dword294,[ebp-20]
	add	dword294,dword ptr [__videomem]
	sal	dword ptr [ebp-28],2
	add	dword294,[ebp-28]
	mov	[ebp-32],dword294
	sal	dword ptr [ebp-24],2
	mov	dword302,[ebp-32]
	add	dword302,[ebp-24]
	sal	dword ptr [ebp-28],2
	sub	dword302,[ebp-28]
	mov	[ebp-36],dword302
label0016:
	mov	dword370,[ebp-12]
	mov	[ebp-76],dword370
	mov	dword369,[ebp-16]
	mov	[ebp-80],dword369
; start of inline function _tex2d
	mov	dword374,dword ptr [__texture_width]
	dec	dword374
	int2float	dword374
	fmul	dword ptr [ebp-80]
	float2int	dword376
	mov	[ebp-84],dword376
	mov	dword380,dword ptr [__texture_height]
	dec	dword380
	int2float	dword380
	fmul	dword ptr [ebp-76]
	float2int	dword382
	mov	[ebp-88],dword382
	mov	dword386,[ebp-88]
	imul	dword386,dword ptr [__texture_width]
	add	dword386,[ebp-84]
	sal	dword386,2
	add	dword386,dword ptr [__texture_data]
	mov	dword390,[dword386]
	mov	[ebp-92],dword390
label001a:
; end of inline function _tex2d
	mov	dword308,[ebp-92]
	mov	[ebp-40],dword308
	sar	dword ptr [ebp-40],24
	mov	dword313,[ebp-40]
	and	dword313,-289
	mov	[ebp-68],dword313
	cmp	dword ptr [ebp-68],0
	je	label0019
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword320,[ebp-32]
	mov	dword322,[dword320]
	mov	[ebp-56],dword322
	mov	dword325,[ebp-56]
	and	dword325,-73984
	sar	dword325,8
	mov	[ebp-60],dword325
	mov	dword330,[ebp-56]
	and	dword330,-289
	mov	[ebp-64],dword330
	mov	dword334,[ebp-40]
	and	dword334,-73984
	sar	dword334,8
	mov	[ebp-48],dword334
	mov	dword339,[ebp-40]
	and	dword339,-289
	mov	[ebp-52],dword339
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword345
	mov	[ebp-48],dword345
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword351
	mov	[ebp-52],dword351
	sal	dword ptr [ebp-48],8
	mov	dword356,[ebp-48]
	add	dword356,[ebp-52]
	mov	[ebp-44],dword356
	mov	dword359,[ebp-32]
	mov	dword361,[ebp-44]
	mov	[dword359],dword361
label0019:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0017:
	add	dword ptr [ebp-32],4
	mov	dword368,[ebp-32]
	cmp	dword368,[ebp-36]
	jl	label0016
label0018:
label001b:
; end of inline function _rasterize_horiz_line
label0004:
label0002:
	jmp	label0005
label0000:
	cmp	dword707,dword709
	jge	label0006
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	fstp	dword ptr [ebp-8]
	mov	dword43,[ebp+32]
	mov	dword395,[dword43+4]
	mov	[ebp-12],dword395
	mov	dword45,[ebp+32]
	mov	dword394,[dword45]
	mov	[ebp-16],dword394
	mov	[ebp-20],dword710
	mov	[ebp-24],dword708
	mov	[ebp-28],dword707
; start of inline function _rasterize_horiz_line
	mov	dword399,dword ptr [__pitch]
	imul	dword399,[ebp-20]
	add	dword399,dword ptr [__videomem]
	sal	dword ptr [ebp-28],2
	add	dword399,[ebp-28]
	mov	[ebp-32],dword399
	sal	dword ptr [ebp-24],2
	mov	dword407,[ebp-32]
	add	dword407,[ebp-24]
	sal	dword ptr [ebp-28],2
	sub	dword407,[ebp-28]
	mov	[ebp-36],dword407
label001c:
	mov	dword475,[ebp-12]
	mov	[ebp-76],dword475
	mov	dword474,[ebp-16]
	mov	[ebp-80],dword474
; start of inline function _tex2d
	mov	dword479,dword ptr [__texture_width]
	dec	dword479
	int2float	dword479
	fmul	dword ptr [ebp-80]
	float2int	dword481
	mov	[ebp-84],dword481
	mov	dword485,dword ptr [__texture_height]
	dec	dword485
	int2float	dword485
	fmul	dword ptr [ebp-76]
	float2int	dword487
	mov	[ebp-88],dword487
	mov	dword491,[ebp-88]
	imul	dword491,dword ptr [__texture_width]
	add	dword491,[ebp-84]
	sal	dword491,2
	add	dword491,dword ptr [__texture_data]
	mov	dword495,[dword491]
	mov	[ebp-92],dword495
label0020:
; end of inline function _tex2d
	mov	dword413,[ebp-92]
	mov	[ebp-40],dword413
	sar	dword ptr [ebp-40],24
	mov	dword418,[ebp-40]
	and	dword418,-289
	mov	[ebp-68],dword418
	cmp	dword ptr [ebp-68],0
	je	label001f
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword425,[ebp-32]
	mov	dword427,[dword425]
	mov	[ebp-56],dword427
	mov	dword430,[ebp-56]
	and	dword430,-73984
	sar	dword430,8
	mov	[ebp-60],dword430
	mov	dword435,[ebp-56]
	and	dword435,-289
	mov	[ebp-64],dword435
	mov	dword439,[ebp-40]
	and	dword439,-73984
	sar	dword439,8
	mov	[ebp-48],dword439
	mov	dword444,[ebp-40]
	and	dword444,-289
	mov	[ebp-52],dword444
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword450
	mov	[ebp-48],dword450
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword456
	mov	[ebp-52],dword456
	sal	dword ptr [ebp-48],8
	mov	dword461,[ebp-48]
	add	dword461,[ebp-52]
	mov	[ebp-44],dword461
	mov	dword464,[ebp-32]
	mov	dword466,[ebp-44]
	mov	[dword464],dword466
label001f:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label001d:
	add	dword ptr [ebp-32],4
	mov	dword473,[ebp-32]
	cmp	dword473,[ebp-36]
	jl	label001c
label001e:
label0021:
; end of inline function _rasterize_horiz_line
	jmp	label0007
label0006:
	cmp	dword707,dword708
	jle	label0008
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	fstp	dword ptr [ebp-8]
	mov	dword55,[ebp+28]
	mov	dword500,[dword55+4]
	mov	[ebp-12],dword500
	mov	dword57,[ebp+28]
	mov	dword499,[dword57]
	mov	[ebp-16],dword499
	mov	[ebp-20],dword710
	mov	[ebp-24],dword707
	mov	[ebp-28],dword709
; start of inline function _rasterize_horiz_line
	mov	dword504,dword ptr [__pitch]
	imul	dword504,[ebp-20]
	add	dword504,dword ptr [__videomem]
	sal	dword ptr [ebp-28],2
	add	dword504,[ebp-28]
	mov	[ebp-32],dword504
	sal	dword ptr [ebp-24],2
	mov	dword512,[ebp-32]
	add	dword512,[ebp-24]
	sal	dword ptr [ebp-28],2
	sub	dword512,[ebp-28]
	mov	[ebp-36],dword512
label0022:
	mov	dword580,[ebp-12]
	mov	[ebp-76],dword580
	mov	dword579,[ebp-16]
	mov	[ebp-80],dword579
; start of inline function _tex2d
	mov	dword584,dword ptr [__texture_width]
	dec	dword584
	int2float	dword584
	fmul	dword ptr [ebp-80]
	float2int	dword586
	mov	[ebp-84],dword586
	mov	dword590,dword ptr [__texture_height]
	dec	dword590
	int2float	dword590
	fmul	dword ptr [ebp-76]
	float2int	dword592
	mov	[ebp-88],dword592
	mov	dword596,[ebp-88]
	imul	dword596,dword ptr [__texture_width]
	add	dword596,[ebp-84]
	sal	dword596,2
	add	dword596,dword ptr [__texture_data]
	mov	dword600,[dword596]
	mov	[ebp-92],dword600
label0026:
; end of inline function _tex2d
	mov	dword518,[ebp-92]
	mov	[ebp-40],dword518
	sar	dword ptr [ebp-40],24
	mov	dword523,[ebp-40]
	and	dword523,-289
	mov	[ebp-68],dword523
	cmp	dword ptr [ebp-68],0
	je	label0025
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword530,[ebp-32]
	mov	dword532,[dword530]
	mov	[ebp-56],dword532
	mov	dword535,[ebp-56]
	and	dword535,-73984
	sar	dword535,8
	mov	[ebp-60],dword535
	mov	dword540,[ebp-56]
	and	dword540,-289
	mov	[ebp-64],dword540
	mov	dword544,[ebp-40]
	and	dword544,-73984
	sar	dword544,8
	mov	[ebp-48],dword544
	mov	dword549,[ebp-40]
	and	dword549,-289
	mov	[ebp-52],dword549
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword555
	mov	[ebp-48],dword555
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword561
	mov	[ebp-52],dword561
	sal	dword ptr [ebp-48],8
	mov	dword566,[ebp-48]
	add	dword566,[ebp-52]
	mov	[ebp-44],dword566
	mov	dword569,[ebp-32]
	mov	dword571,[ebp-44]
	mov	[dword569],dword571
label0025:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0023:
	add	dword ptr [ebp-32],4
	mov	dword578,[ebp-32]
	cmp	dword578,[ebp-36]
	jl	label0022
label0024:
label0027:
; end of inline function _rasterize_horiz_line
	jmp	label0009
label0008:
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	fstp	dword ptr [ebp-8]
	mov	dword64,[ebp+28]
	mov	dword605,[dword64+4]
	mov	[ebp-12],dword605
	mov	dword66,[ebp+28]
	mov	dword604,[dword66]
	mov	[ebp-16],dword604
	mov	[ebp-20],dword710
	mov	[ebp-24],dword708
	mov	[ebp-28],dword709
; start of inline function _rasterize_horiz_line
	mov	dword609,dword ptr [__pitch]
	imul	dword609,[ebp-20]
	add	dword609,dword ptr [__videomem]
	sal	dword ptr [ebp-28],2
	add	dword609,[ebp-28]
	mov	[ebp-32],dword609
	sal	dword ptr [ebp-24],2
	mov	dword617,[ebp-32]
	add	dword617,[ebp-24]
	sal	dword ptr [ebp-28],2
	sub	dword617,[ebp-28]
	mov	[ebp-36],dword617
label0028:
	mov	dword685,[ebp-12]
	mov	[ebp-76],dword685
	mov	dword684,[ebp-16]
	mov	[ebp-80],dword684
; start of inline function _tex2d
	mov	dword689,dword ptr [__texture_width]
	dec	dword689
	int2float	dword689
	fmul	dword ptr [ebp-80]
	float2int	dword691
	mov	[ebp-84],dword691
	mov	dword695,dword ptr [__texture_height]
	dec	dword695
	int2float	dword695
	fmul	dword ptr [ebp-76]
	float2int	dword697
	mov	[ebp-88],dword697
	mov	dword701,[ebp-88]
	imul	dword701,dword ptr [__texture_width]
	add	dword701,[ebp-84]
	sal	dword701,2
	add	dword701,dword ptr [__texture_data]
	mov	dword705,[dword701]
	mov	[ebp-92],dword705
label002c:
; end of inline function _tex2d
	mov	dword623,[ebp-92]
	mov	[ebp-40],dword623
	sar	dword ptr [ebp-40],24
	mov	dword628,[ebp-40]
	and	dword628,-289
	mov	[ebp-68],dword628
	cmp	dword ptr [ebp-68],0
	je	label002b
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword635,[ebp-32]
	mov	dword637,[dword635]
	mov	[ebp-56],dword637
	mov	dword640,[ebp-56]
	and	dword640,-73984
	sar	dword640,8
	mov	[ebp-60],dword640
	mov	dword645,[ebp-56]
	and	dword645,-289
	mov	[ebp-64],dword645
	mov	dword649,[ebp-40]
	and	dword649,-73984
	sar	dword649,8
	mov	[ebp-48],dword649
	mov	dword654,[ebp-40]
	and	dword654,-289
	mov	[ebp-52],dword654
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword660
	mov	[ebp-48],dword660
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword666
	mov	[ebp-52],dword666
	sal	dword ptr [ebp-48],8
	mov	dword671,[ebp-48]
	add	dword671,[ebp-52]
	mov	[ebp-44],dword671
	mov	dword674,[ebp-32]
	mov	dword676,[ebp-44]
	mov	[dword674],dword676
label002b:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0029:
	add	dword ptr [ebp-32],4
	mov	dword683,[ebp-32]
	cmp	dword683,[ebp-36]
	jl	label0028
label002a:
label002d:
; end of inline function _rasterize_horiz_line
label0009:
label0007:
label0005:
	destroy_stack_frame
	ret
__rasterize_triangle_1i endp	

__rasterize_triangle_2i proc
	create_stack_frame
	mov	dword2,[ebp+8]
	add	dword2,4
	mov	dword5,[ebp+12]
	add	dword5,4
	mov	dword7,[dword2]
	cmp	dword7,[dword5]
	jle	label0000
	mov	dword10,[ebp+8]
	mov	[ebp-4],dword10
	mov	dword13,[ebp+12]
	mov	[ebp+8],dword13
	mov	dword16,[ebp-4]
	mov	[ebp+12],dword16
label0000:
	mov	dword18,[ebp+8]
	add	dword18,4
	mov	dword21,[ebp+16]
	add	dword21,4
	mov	dword23,[dword18]
	cmp	dword23,[dword21]
	jle	label0001
	mov	dword26,[ebp+8]
	mov	[ebp-4],dword26
	mov	dword29,[ebp+16]
	mov	[ebp+8],dword29
	mov	dword32,[ebp-4]
	mov	[ebp+16],dword32
label0001:
	mov	dword34,[ebp+12]
	add	dword34,4
	mov	dword37,[ebp+16]
	add	dword37,4
	mov	dword39,[dword34]
	cmp	dword39,[dword37]
	jle	label0002
	mov	dword42,[ebp+12]
	mov	[ebp-4],dword42
	mov	dword45,[ebp+16]
	mov	[ebp+12],dword45
	mov	dword48,[ebp-4]
	mov	[ebp+16],dword48
label0002:
	mov	dword50,[ebp+8]
	add	dword50,4
	mov	dword53,[ebp+16]
	add	dword53,4
	mov	dword55,[dword50]
	cmp	dword55,[dword53]
	jne	label0003
	mov	dword57,[ebp+8]
	add	dword57,4
	cmp	dword ptr [dword57],0
	jl	label0004
	mov	dword61,[ebp+8]
	add	dword61,4
	mov	dword64,[dword61]
	cmp	dword64,dword ptr [__height]
	jge	label0004
	fldz
	fstp	dword ptr [ebp-172]
	fldz
	fstp	dword ptr [ebp-176]
	mov	dword66,8
	add	dword66,[ebp+16]
	mov	[ebp-180],dword66
	mov	dword68,8
	add	dword68,[ebp+12]
	mov	[ebp-184],dword68
	mov	dword70,8
	add	dword70,[ebp+8]
	mov	[ebp-188],dword70
	mov	dword72,[ebp+8]
	add	dword72,4
	mov	dword1218,[dword72]
	mov	[ebp-192],dword1218
	mov	dword75,[ebp+16]
	mov	dword1217,[dword75]
	mov	[ebp-196],dword1217
	mov	dword77,[ebp+12]
	mov	dword1216,[dword77]
	mov	[ebp-200],dword1216
	mov	dword79,[ebp+8]
	mov	dword1215,[dword79]
	mov	[ebp-204],dword1215
; start of inline function _rasterize_triangle_1i
	mov	dword1222,[ebp-204]
	cmp	dword1222,[ebp-200]
	jge	label0038
	mov	dword1225,[ebp-196]
	cmp	dword1225,[ebp-200]
	jle	label0039
	mov	dword1295,[ebp-172]
	mov	[ebp-208],dword1295
	mov	dword1294,[ebp-176]
	mov	[ebp-212],dword1294
	mov	dword1229,[ebp-188]
	mov	dword1293,[dword1229+4]
	mov	[ebp-216],dword1293
	mov	dword1231,[ebp-188]
	mov	dword1292,[dword1231]
	mov	[ebp-220],dword1292
	mov	dword1291,[ebp-192]
	mov	[ebp-224],dword1291
	mov	dword1290,[ebp-196]
	mov	[ebp-228],dword1290
	mov	dword1289,[ebp-204]
	mov	[ebp-232],dword1289
; start of inline function _rasterize_horiz_line
	mov	dword1299,dword ptr [__pitch]
	imul	dword1299,[ebp-224]
	add	dword1299,dword ptr [__videomem]
	sal	dword ptr [ebp-232],2
	add	dword1299,[ebp-232]
	mov	[ebp-236],dword1299
	sal	dword ptr [ebp-228],2
	mov	dword1307,[ebp-236]
	add	dword1307,[ebp-228]
	sal	dword ptr [ebp-232],2
	sub	dword1307,[ebp-232]
	mov	[ebp-240],dword1307
label0042:
	mov	dword1375,[ebp-216]
	mov	[ebp-280],dword1375
	mov	dword1374,[ebp-220]
	mov	[ebp-284],dword1374
; start of inline function _tex2d
	mov	dword1379,dword ptr [__texture_width]
	dec	dword1379
	int2float	dword1379
	fmul	dword ptr [ebp-284]
	float2int	dword1381
	mov	[ebp-288],dword1381
	mov	dword1385,dword ptr [__texture_height]
	dec	dword1385
	int2float	dword1385
	fmul	dword ptr [ebp-280]
	float2int	dword1387
	mov	[ebp-292],dword1387
	mov	dword1391,[ebp-292]
	imul	dword1391,dword ptr [__texture_width]
	add	dword1391,[ebp-288]
	sal	dword1391,2
	add	dword1391,dword ptr [__texture_data]
	mov	dword1395,[dword1391]
	mov	[ebp-296],dword1395
label0046:
; end of inline function _tex2d
	mov	dword1313,[ebp-296]
	mov	[ebp-244],dword1313
	sar	dword ptr [ebp-244],24
	mov	dword1318,[ebp-244]
	and	dword1318,-289
	mov	[ebp-272],dword1318
	cmp	dword ptr [ebp-272],0
	je	label0045
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1325,[ebp-236]
	mov	dword1327,[dword1325]
	mov	[ebp-260],dword1327
	mov	dword1330,[ebp-260]
	and	dword1330,-73984
	sar	dword1330,8
	mov	[ebp-264],dword1330
	mov	dword1335,[ebp-260]
	and	dword1335,-289
	mov	[ebp-268],dword1335
	mov	dword1339,[ebp-244]
	and	dword1339,-73984
	sar	dword1339,8
	mov	[ebp-252],dword1339
	mov	dword1344,[ebp-244]
	and	dword1344,-289
	mov	[ebp-256],dword1344
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1350
	mov	[ebp-252],dword1350
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1356
	mov	[ebp-256],dword1356
	sal	dword ptr [ebp-252],8
	mov	dword1361,[ebp-252]
	add	dword1361,[ebp-256]
	mov	[ebp-248],dword1361
	mov	dword1364,[ebp-236]
	mov	dword1366,[ebp-248]
	mov	[dword1364],dword1366
label0045:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0043:
	add	dword ptr [ebp-236],4
	mov	dword1373,[ebp-236]
	cmp	dword1373,[ebp-240]
	jl	label0042
label0044:
label0047:
; end of inline function _rasterize_horiz_line
	jmp	label003a
label0039:
	mov	dword1237,[ebp-196]
	cmp	dword1237,[ebp-204]
	jge	label003b
	mov	dword1402,[ebp-172]
	mov	[ebp-208],dword1402
	mov	dword1401,[ebp-176]
	mov	[ebp-212],dword1401
	mov	dword1241,[ebp-180]
	mov	dword1400,[dword1241+4]
	mov	[ebp-216],dword1400
	mov	dword1243,[ebp-180]
	mov	dword1399,[dword1243]
	mov	[ebp-220],dword1399
	mov	dword1398,[ebp-192]
	mov	[ebp-224],dword1398
	mov	dword1397,[ebp-200]
	mov	[ebp-228],dword1397
	mov	dword1396,[ebp-196]
	mov	[ebp-232],dword1396
; start of inline function _rasterize_horiz_line
	mov	dword1406,dword ptr [__pitch]
	imul	dword1406,[ebp-224]
	add	dword1406,dword ptr [__videomem]
	sal	dword ptr [ebp-232],2
	add	dword1406,[ebp-232]
	mov	[ebp-236],dword1406
	sal	dword ptr [ebp-228],2
	mov	dword1414,[ebp-236]
	add	dword1414,[ebp-228]
	sal	dword ptr [ebp-232],2
	sub	dword1414,[ebp-232]
	mov	[ebp-240],dword1414
label0048:
	mov	dword1482,[ebp-216]
	mov	[ebp-280],dword1482
	mov	dword1481,[ebp-220]
	mov	[ebp-284],dword1481
; start of inline function _tex2d
	mov	dword1486,dword ptr [__texture_width]
	dec	dword1486
	int2float	dword1486
	fmul	dword ptr [ebp-284]
	float2int	dword1488
	mov	[ebp-288],dword1488
	mov	dword1492,dword ptr [__texture_height]
	dec	dword1492
	int2float	dword1492
	fmul	dword ptr [ebp-280]
	float2int	dword1494
	mov	[ebp-292],dword1494
	mov	dword1498,[ebp-292]
	imul	dword1498,dword ptr [__texture_width]
	add	dword1498,[ebp-288]
	sal	dword1498,2
	add	dword1498,dword ptr [__texture_data]
	mov	dword1502,[dword1498]
	mov	[ebp-296],dword1502
label004c:
; end of inline function _tex2d
	mov	dword1420,[ebp-296]
	mov	[ebp-244],dword1420
	sar	dword ptr [ebp-244],24
	mov	dword1425,[ebp-244]
	and	dword1425,-289
	mov	[ebp-272],dword1425
	cmp	dword ptr [ebp-272],0
	je	label004b
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1432,[ebp-236]
	mov	dword1434,[dword1432]
	mov	[ebp-260],dword1434
	mov	dword1437,[ebp-260]
	and	dword1437,-73984
	sar	dword1437,8
	mov	[ebp-264],dword1437
	mov	dword1442,[ebp-260]
	and	dword1442,-289
	mov	[ebp-268],dword1442
	mov	dword1446,[ebp-244]
	and	dword1446,-73984
	sar	dword1446,8
	mov	[ebp-252],dword1446
	mov	dword1451,[ebp-244]
	and	dword1451,-289
	mov	[ebp-256],dword1451
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1457
	mov	[ebp-252],dword1457
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1463
	mov	[ebp-256],dword1463
	sal	dword ptr [ebp-252],8
	mov	dword1468,[ebp-252]
	add	dword1468,[ebp-256]
	mov	[ebp-248],dword1468
	mov	dword1471,[ebp-236]
	mov	dword1473,[ebp-248]
	mov	[dword1471],dword1473
label004b:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0049:
	add	dword ptr [ebp-236],4
	mov	dword1480,[ebp-236]
	cmp	dword1480,[ebp-240]
	jl	label0048
label004a:
label004d:
; end of inline function _rasterize_horiz_line
	jmp	label003c
label003b:
	mov	dword1509,[ebp-172]
	mov	[ebp-208],dword1509
	mov	dword1508,[ebp-176]
	mov	[ebp-212],dword1508
	mov	dword1250,[ebp-188]
	mov	dword1507,[dword1250+4]
	mov	[ebp-216],dword1507
	mov	dword1252,[ebp-188]
	mov	dword1506,[dword1252]
	mov	[ebp-220],dword1506
	mov	dword1505,[ebp-192]
	mov	[ebp-224],dword1505
	mov	dword1504,[ebp-200]
	mov	[ebp-228],dword1504
	mov	dword1503,[ebp-204]
	mov	[ebp-232],dword1503
; start of inline function _rasterize_horiz_line
	mov	dword1513,dword ptr [__pitch]
	imul	dword1513,[ebp-224]
	add	dword1513,dword ptr [__videomem]
	sal	dword ptr [ebp-232],2
	add	dword1513,[ebp-232]
	mov	[ebp-236],dword1513
	sal	dword ptr [ebp-228],2
	mov	dword1521,[ebp-236]
	add	dword1521,[ebp-228]
	sal	dword ptr [ebp-232],2
	sub	dword1521,[ebp-232]
	mov	[ebp-240],dword1521
label004e:
	mov	dword1589,[ebp-216]
	mov	[ebp-280],dword1589
	mov	dword1588,[ebp-220]
	mov	[ebp-284],dword1588
; start of inline function _tex2d
	mov	dword1593,dword ptr [__texture_width]
	dec	dword1593
	int2float	dword1593
	fmul	dword ptr [ebp-284]
	float2int	dword1595
	mov	[ebp-288],dword1595
	mov	dword1599,dword ptr [__texture_height]
	dec	dword1599
	int2float	dword1599
	fmul	dword ptr [ebp-280]
	float2int	dword1601
	mov	[ebp-292],dword1601
	mov	dword1605,[ebp-292]
	imul	dword1605,dword ptr [__texture_width]
	add	dword1605,[ebp-288]
	sal	dword1605,2
	add	dword1605,dword ptr [__texture_data]
	mov	dword1609,[dword1605]
	mov	[ebp-296],dword1609
label0052:
; end of inline function _tex2d
	mov	dword1527,[ebp-296]
	mov	[ebp-244],dword1527
	sar	dword ptr [ebp-244],24
	mov	dword1532,[ebp-244]
	and	dword1532,-289
	mov	[ebp-272],dword1532
	cmp	dword ptr [ebp-272],0
	je	label0051
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1539,[ebp-236]
	mov	dword1541,[dword1539]
	mov	[ebp-260],dword1541
	mov	dword1544,[ebp-260]
	and	dword1544,-73984
	sar	dword1544,8
	mov	[ebp-264],dword1544
	mov	dword1549,[ebp-260]
	and	dword1549,-289
	mov	[ebp-268],dword1549
	mov	dword1553,[ebp-244]
	and	dword1553,-73984
	sar	dword1553,8
	mov	[ebp-252],dword1553
	mov	dword1558,[ebp-244]
	and	dword1558,-289
	mov	[ebp-256],dword1558
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1564
	mov	[ebp-252],dword1564
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1570
	mov	[ebp-256],dword1570
	sal	dword ptr [ebp-252],8
	mov	dword1575,[ebp-252]
	add	dword1575,[ebp-256]
	mov	[ebp-248],dword1575
	mov	dword1578,[ebp-236]
	mov	dword1580,[ebp-248]
	mov	[dword1578],dword1580
label0051:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label004f:
	add	dword ptr [ebp-236],4
	mov	dword1587,[ebp-236]
	cmp	dword1587,[ebp-240]
	jl	label004e
label0050:
label0053:
; end of inline function _rasterize_horiz_line
label003c:
label003a:
	jmp	label003d
label0038:
	mov	dword1258,[ebp-196]
	cmp	dword1258,[ebp-200]
	jge	label003e
	fld	dword ptr [ebp-172]
	fldz
	fsubrp
	fstp	dword ptr [ebp-208]
	fld	dword ptr [ebp-176]
	fldz
	fsubrp
	fstp	dword ptr [ebp-212]
	mov	dword1262,[ebp-180]
	mov	dword1614,[dword1262+4]
	mov	[ebp-216],dword1614
	mov	dword1264,[ebp-180]
	mov	dword1613,[dword1264]
	mov	[ebp-220],dword1613
	mov	dword1612,[ebp-192]
	mov	[ebp-224],dword1612
	mov	dword1611,[ebp-204]
	mov	[ebp-228],dword1611
	mov	dword1610,[ebp-196]
	mov	[ebp-232],dword1610
; start of inline function _rasterize_horiz_line
	mov	dword1618,dword ptr [__pitch]
	imul	dword1618,[ebp-224]
	add	dword1618,dword ptr [__videomem]
	sal	dword ptr [ebp-232],2
	add	dword1618,[ebp-232]
	mov	[ebp-236],dword1618
	sal	dword ptr [ebp-228],2
	mov	dword1626,[ebp-236]
	add	dword1626,[ebp-228]
	sal	dword ptr [ebp-232],2
	sub	dword1626,[ebp-232]
	mov	[ebp-240],dword1626
label0054:
	mov	dword1694,[ebp-216]
	mov	[ebp-280],dword1694
	mov	dword1693,[ebp-220]
	mov	[ebp-284],dword1693
; start of inline function _tex2d
	mov	dword1698,dword ptr [__texture_width]
	dec	dword1698
	int2float	dword1698
	fmul	dword ptr [ebp-284]
	float2int	dword1700
	mov	[ebp-288],dword1700
	mov	dword1704,dword ptr [__texture_height]
	dec	dword1704
	int2float	dword1704
	fmul	dword ptr [ebp-280]
	float2int	dword1706
	mov	[ebp-292],dword1706
	mov	dword1710,[ebp-292]
	imul	dword1710,dword ptr [__texture_width]
	add	dword1710,[ebp-288]
	sal	dword1710,2
	add	dword1710,dword ptr [__texture_data]
	mov	dword1714,[dword1710]
	mov	[ebp-296],dword1714
label0058:
; end of inline function _tex2d
	mov	dword1632,[ebp-296]
	mov	[ebp-244],dword1632
	sar	dword ptr [ebp-244],24
	mov	dword1637,[ebp-244]
	and	dword1637,-289
	mov	[ebp-272],dword1637
	cmp	dword ptr [ebp-272],0
	je	label0057
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1644,[ebp-236]
	mov	dword1646,[dword1644]
	mov	[ebp-260],dword1646
	mov	dword1649,[ebp-260]
	and	dword1649,-73984
	sar	dword1649,8
	mov	[ebp-264],dword1649
	mov	dword1654,[ebp-260]
	and	dword1654,-289
	mov	[ebp-268],dword1654
	mov	dword1658,[ebp-244]
	and	dword1658,-73984
	sar	dword1658,8
	mov	[ebp-252],dword1658
	mov	dword1663,[ebp-244]
	and	dword1663,-289
	mov	[ebp-256],dword1663
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1669
	mov	[ebp-252],dword1669
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1675
	mov	[ebp-256],dword1675
	sal	dword ptr [ebp-252],8
	mov	dword1680,[ebp-252]
	add	dword1680,[ebp-256]
	mov	[ebp-248],dword1680
	mov	dword1683,[ebp-236]
	mov	dword1685,[ebp-248]
	mov	[dword1683],dword1685
label0057:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0055:
	add	dword ptr [ebp-236],4
	mov	dword1692,[ebp-236]
	cmp	dword1692,[ebp-240]
	jl	label0054
label0056:
label0059:
; end of inline function _rasterize_horiz_line
	jmp	label003f
label003e:
	mov	dword1270,[ebp-196]
	cmp	dword1270,[ebp-204]
	jle	label0040
	fld	dword ptr [ebp-172]
	fldz
	fsubrp
	fstp	dword ptr [ebp-208]
	fld	dword ptr [ebp-176]
	fldz
	fsubrp
	fstp	dword ptr [ebp-212]
	mov	dword1274,[ebp-184]
	mov	dword1719,[dword1274+4]
	mov	[ebp-216],dword1719
	mov	dword1276,[ebp-184]
	mov	dword1718,[dword1276]
	mov	[ebp-220],dword1718
	mov	dword1717,[ebp-192]
	mov	[ebp-224],dword1717
	mov	dword1716,[ebp-196]
	mov	[ebp-228],dword1716
	mov	dword1715,[ebp-200]
	mov	[ebp-232],dword1715
; start of inline function _rasterize_horiz_line
	mov	dword1723,dword ptr [__pitch]
	imul	dword1723,[ebp-224]
	add	dword1723,dword ptr [__videomem]
	sal	dword ptr [ebp-232],2
	add	dword1723,[ebp-232]
	mov	[ebp-236],dword1723
	sal	dword ptr [ebp-228],2
	mov	dword1731,[ebp-236]
	add	dword1731,[ebp-228]
	sal	dword ptr [ebp-232],2
	sub	dword1731,[ebp-232]
	mov	[ebp-240],dword1731
label005a:
	mov	dword1799,[ebp-216]
	mov	[ebp-280],dword1799
	mov	dword1798,[ebp-220]
	mov	[ebp-284],dword1798
; start of inline function _tex2d
	mov	dword1803,dword ptr [__texture_width]
	dec	dword1803
	int2float	dword1803
	fmul	dword ptr [ebp-284]
	float2int	dword1805
	mov	[ebp-288],dword1805
	mov	dword1809,dword ptr [__texture_height]
	dec	dword1809
	int2float	dword1809
	fmul	dword ptr [ebp-280]
	float2int	dword1811
	mov	[ebp-292],dword1811
	mov	dword1815,[ebp-292]
	imul	dword1815,dword ptr [__texture_width]
	add	dword1815,[ebp-288]
	sal	dword1815,2
	add	dword1815,dword ptr [__texture_data]
	mov	dword1819,[dword1815]
	mov	[ebp-296],dword1819
label005e:
; end of inline function _tex2d
	mov	dword1737,[ebp-296]
	mov	[ebp-244],dword1737
	sar	dword ptr [ebp-244],24
	mov	dword1742,[ebp-244]
	and	dword1742,-289
	mov	[ebp-272],dword1742
	cmp	dword ptr [ebp-272],0
	je	label005d
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1749,[ebp-236]
	mov	dword1751,[dword1749]
	mov	[ebp-260],dword1751
	mov	dword1754,[ebp-260]
	and	dword1754,-73984
	sar	dword1754,8
	mov	[ebp-264],dword1754
	mov	dword1759,[ebp-260]
	and	dword1759,-289
	mov	[ebp-268],dword1759
	mov	dword1763,[ebp-244]
	and	dword1763,-73984
	sar	dword1763,8
	mov	[ebp-252],dword1763
	mov	dword1768,[ebp-244]
	and	dword1768,-289
	mov	[ebp-256],dword1768
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1774
	mov	[ebp-252],dword1774
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1780
	mov	[ebp-256],dword1780
	sal	dword ptr [ebp-252],8
	mov	dword1785,[ebp-252]
	add	dword1785,[ebp-256]
	mov	[ebp-248],dword1785
	mov	dword1788,[ebp-236]
	mov	dword1790,[ebp-248]
	mov	[dword1788],dword1790
label005d:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label005b:
	add	dword ptr [ebp-236],4
	mov	dword1797,[ebp-236]
	cmp	dword1797,[ebp-240]
	jl	label005a
label005c:
label005f:
; end of inline function _rasterize_horiz_line
	jmp	label0041
label0040:
	fld	dword ptr [ebp-172]
	fldz
	fsubrp
	fstp	dword ptr [ebp-208]
	fld	dword ptr [ebp-176]
	fldz
	fsubrp
	fstp	dword ptr [ebp-212]
	mov	dword1283,[ebp-184]
	mov	dword1824,[dword1283+4]
	mov	[ebp-216],dword1824
	mov	dword1285,[ebp-184]
	mov	dword1823,[dword1285]
	mov	[ebp-220],dword1823
	mov	dword1822,[ebp-192]
	mov	[ebp-224],dword1822
	mov	dword1821,[ebp-204]
	mov	[ebp-228],dword1821
	mov	dword1820,[ebp-200]
	mov	[ebp-232],dword1820
; start of inline function _rasterize_horiz_line
	mov	dword1828,dword ptr [__pitch]
	imul	dword1828,[ebp-224]
	add	dword1828,dword ptr [__videomem]
	sal	dword ptr [ebp-232],2
	add	dword1828,[ebp-232]
	mov	[ebp-236],dword1828
	sal	dword ptr [ebp-228],2
	mov	dword1836,[ebp-236]
	add	dword1836,[ebp-228]
	sal	dword ptr [ebp-232],2
	sub	dword1836,[ebp-232]
	mov	[ebp-240],dword1836
label0060:
	mov	dword1904,[ebp-216]
	mov	[ebp-280],dword1904
	mov	dword1903,[ebp-220]
	mov	[ebp-284],dword1903
; start of inline function _tex2d
	mov	dword1908,dword ptr [__texture_width]
	dec	dword1908
	int2float	dword1908
	fmul	dword ptr [ebp-284]
	float2int	dword1910
	mov	[ebp-288],dword1910
	mov	dword1914,dword ptr [__texture_height]
	dec	dword1914
	int2float	dword1914
	fmul	dword ptr [ebp-280]
	float2int	dword1916
	mov	[ebp-292],dword1916
	mov	dword1920,[ebp-292]
	imul	dword1920,dword ptr [__texture_width]
	add	dword1920,[ebp-288]
	sal	dword1920,2
	add	dword1920,dword ptr [__texture_data]
	mov	dword1924,[dword1920]
	mov	[ebp-296],dword1924
label0064:
; end of inline function _tex2d
	mov	dword1842,[ebp-296]
	mov	[ebp-244],dword1842
	sar	dword ptr [ebp-244],24
	mov	dword1847,[ebp-244]
	and	dword1847,-289
	mov	[ebp-272],dword1847
	cmp	dword ptr [ebp-272],0
	je	label0063
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1854,[ebp-236]
	mov	dword1856,[dword1854]
	mov	[ebp-260],dword1856
	mov	dword1859,[ebp-260]
	and	dword1859,-73984
	sar	dword1859,8
	mov	[ebp-264],dword1859
	mov	dword1864,[ebp-260]
	and	dword1864,-289
	mov	[ebp-268],dword1864
	mov	dword1868,[ebp-244]
	and	dword1868,-73984
	sar	dword1868,8
	mov	[ebp-252],dword1868
	mov	dword1873,[ebp-244]
	and	dword1873,-289
	mov	[ebp-256],dword1873
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1879
	mov	[ebp-252],dword1879
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1885
	mov	[ebp-256],dword1885
	sal	dword ptr [ebp-252],8
	mov	dword1890,[ebp-252]
	add	dword1890,[ebp-256]
	mov	[ebp-248],dword1890
	mov	dword1893,[ebp-236]
	mov	dword1895,[ebp-248]
	mov	[dword1893],dword1895
label0063:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0061:
	add	dword ptr [ebp-236],4
	mov	dword1902,[ebp-236]
	cmp	dword1902,[ebp-240]
	jl	label0060
label0062:
label0065:
; end of inline function _rasterize_horiz_line
label0041:
label003f:
label003d:
label0066:
; end of inline function _rasterize_triangle_1i
label0004:
	destroy_stack_frame
	ret
label0003:
	mov	dword81,[ebp+8]
	add	dword81,4
	mov	dword84,[dword81]
	mov	[ebp-16],dword84
label0005:
label0006:
	mov	dword86,[ebp+12]
	add	dword86,4
	mov	dword89,[dword86]
	cmp	dword89,[ebp-16]
	jle	label0007
	mov	dword91,[ebp+8]
	add	dword91,4
	mov	dword94,[ebp-16]
	sub	dword94,[dword91]
	mov	dword96,[ebp+12]
	mov	dword98,[ebp+8]
	mov	dword99,[dword96]
	sub	dword99,[dword98]
	imul	dword94,dword99
	mov	dword101,[ebp+12]
	add	dword101,4
	mov	dword104,[ebp+8]
	add	dword104,4
	mov	dword106,[dword101]
	sub	dword106,[dword104]
	cdq	dword107
	idiv	dword94,dword106
	mov	dword109,[ebp+8]
	add	dword94,[dword109]
	mov	[ebp-8],dword94
	mov	dword112,[ebp+8]
	add	dword112,4
	mov	dword115,[ebp-16]
	sub	dword115,[dword112]
	mov	dword117,[ebp+16]
	mov	dword119,[ebp+8]
	mov	dword120,[dword117]
	sub	dword120,[dword119]
	imul	dword115,dword120
	mov	dword122,[ebp+16]
	add	dword122,4
	mov	dword125,[ebp+8]
	add	dword125,4
	mov	dword127,[dword122]
	sub	dword127,[dword125]
	cdq	dword128
	idiv	dword115,dword127
	mov	dword130,[ebp+8]
	add	dword115,[dword130]
	mov	[ebp-12],dword115
	mov	dword133,[ebp+8]
	add	dword133,4
	mov	dword136,[ebp-16]
	sub	dword136,[dword133]
	int2float	dword136
	mov	dword138,[ebp+12]
	mov	dword140,[ebp+8]
	fld	dword ptr [dword138+8]
	fsub	dword ptr [dword140+8]
	fmulp
	mov	dword142,[ebp+12]
	add	dword142,4
	mov	dword145,[ebp+8]
	add	dword145,4
	mov	dword147,[dword142]
	sub	dword147,[dword145]
	int2float	dword147
	fdivp
	mov	dword149,[ebp+8]
	fadd	dword ptr [dword149+8]
	fstp	dword ptr [ebp-20]
	mov	dword152,[ebp+8]
	add	dword152,4
	mov	dword155,[ebp-16]
	sub	dword155,[dword152]
	int2float	dword155
	mov	dword157,[ebp+16]
	mov	dword159,[ebp+8]
	fld	dword ptr [dword157+8]
	fsub	dword ptr [dword159+8]
	fmulp
	mov	dword161,[ebp+16]
	add	dword161,4
	mov	dword164,[ebp+8]
	add	dword164,4
	mov	dword166,[dword161]
	sub	dword166,[dword164]
	int2float	dword166
	fdivp
	mov	dword168,[ebp+8]
	fadd	dword ptr [dword168+8]
	fstp	dword ptr [ebp-28]
	mov	dword171,[ebp+8]
	add	dword171,4
	mov	dword174,[ebp-16]
	sub	dword174,[dword171]
	int2float	dword174
	mov	dword176,8
	add	dword176,[ebp+12]
	add	dword176,4
	mov	dword179,8
	add	dword179,[ebp+8]
	add	dword179,4
	fld	dword ptr [dword176]
	fsub	dword ptr [dword179]
	fmulp
	mov	dword182,[ebp+12]
	add	dword182,4
	mov	dword185,[ebp+8]
	add	dword185,4
	mov	dword187,[dword182]
	sub	dword187,[dword185]
	int2float	dword187
	fdivp
	mov	dword189,8
	add	dword189,[ebp+8]
	add	dword189,4
	fadd	dword ptr [dword189]
	fstp	dword ptr [ebp-24]
	mov	dword193,[ebp+8]
	add	dword193,4
	mov	dword196,[ebp-16]
	sub	dword196,[dword193]
	int2float	dword196
	mov	dword198,8
	add	dword198,[ebp+16]
	add	dword198,4
	mov	dword201,8
	add	dword201,[ebp+8]
	add	dword201,4
	fld	dword ptr [dword198]
	fsub	dword ptr [dword201]
	fmulp
	mov	dword204,[ebp+16]
	add	dword204,4
	mov	dword207,[ebp+8]
	add	dword207,4
	mov	dword209,[dword204]
	sub	dword209,[dword207]
	int2float	dword209
	fdivp
	mov	dword211,8
	add	dword211,[ebp+8]
	add	dword211,4
	fadd	dword ptr [dword211]
	fstp	dword ptr [ebp-32]
	mov	dword216,[ebp-12]
	sub	dword216,[ebp-8]
	int2float	dword216
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	dword222,[ebp-12]
	sub	dword222,[ebp-8]
	int2float	dword222
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
	fstp	dword ptr [ebp-40]
	mov	dword500,[ebp-40]
	mov	[ebp-44],dword500
	mov	dword499,[ebp-36]
	mov	[ebp-48],dword499
	mov	dword498,[ebp-32]
	mov	[ebp-52],dword498
	mov	dword497,[ebp-28]
	mov	[ebp-56],dword497
	mov	dword496,[ebp-24]
	mov	[ebp-60],dword496
	mov	dword495,[ebp-20]
	mov	[ebp-64],dword495
	mov	dword494,[ebp-16]
	mov	[ebp-68],dword494
	mov	dword493,[ebp-12]
	mov	[ebp-72],dword493
	mov	dword492,[ebp-8]
	mov	[ebp-76],dword492
; start of inline function _rasterize_horiz_line__unordered
	mov	dword504,[ebp-76]
	cmp	dword504,[ebp-72]
	jg	label000b
	mov	dword525,[ebp-44]
	mov	[ebp-80],dword525
	mov	dword524,[ebp-48]
	mov	[ebp-84],dword524
	mov	dword523,[ebp-60]
	mov	[ebp-88],dword523
	mov	dword522,[ebp-64]
	mov	[ebp-92],dword522
	mov	dword521,[ebp-68]
	mov	[ebp-96],dword521
	mov	dword520,[ebp-72]
	mov	[ebp-100],dword520
	mov	dword519,[ebp-76]
	mov	[ebp-104],dword519
; start of inline function _rasterize_horiz_line
	mov	dword529,dword ptr [__pitch]
	imul	dword529,[ebp-96]
	add	dword529,dword ptr [__videomem]
	sal	dword ptr [ebp-104],2
	add	dword529,[ebp-104]
	mov	[ebp-108],dword529
	sal	dword ptr [ebp-100],2
	mov	dword537,[ebp-108]
	add	dword537,[ebp-100]
	sal	dword ptr [ebp-104],2
	sub	dword537,[ebp-104]
	mov	[ebp-112],dword537
label000d:
	mov	dword605,[ebp-88]
	mov	[ebp-152],dword605
	mov	dword604,[ebp-92]
	mov	[ebp-156],dword604
; start of inline function _tex2d
	mov	dword609,dword ptr [__texture_width]
	dec	dword609
	int2float	dword609
	fmul	dword ptr [ebp-156]
	float2int	dword611
	mov	[ebp-160],dword611
	mov	dword615,dword ptr [__texture_height]
	dec	dword615
	int2float	dword615
	fmul	dword ptr [ebp-152]
	float2int	dword617
	mov	[ebp-164],dword617
	mov	dword621,[ebp-164]
	imul	dword621,dword ptr [__texture_width]
	add	dword621,[ebp-160]
	sal	dword621,2
	add	dword621,dword ptr [__texture_data]
	mov	dword625,[dword621]
	mov	[ebp-168],dword625
label0011:
; end of inline function _tex2d
	mov	dword543,[ebp-168]
	mov	[ebp-116],dword543
	sar	dword ptr [ebp-116],24
	mov	dword548,[ebp-116]
	and	dword548,-289
	mov	[ebp-144],dword548
	cmp	dword ptr [ebp-144],0
	je	label0010
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword555,[ebp-108]
	mov	dword557,[dword555]
	mov	[ebp-132],dword557
	mov	dword560,[ebp-132]
	and	dword560,-73984
	sar	dword560,8
	mov	[ebp-136],dword560
	mov	dword565,[ebp-132]
	and	dword565,-289
	mov	[ebp-140],dword565
	mov	dword569,[ebp-116]
	and	dword569,-73984
	sar	dword569,8
	mov	[ebp-124],dword569
	mov	dword574,[ebp-116]
	and	dword574,-289
	mov	[ebp-128],dword574
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword580
	mov	[ebp-124],dword580
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword586
	mov	[ebp-128],dword586
	sal	dword ptr [ebp-124],8
	mov	dword591,[ebp-124]
	add	dword591,[ebp-128]
	mov	[ebp-120],dword591
	mov	dword594,[ebp-108]
	mov	dword596,[ebp-120]
	mov	[dword594],dword596
label0010:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label000e:
	add	dword ptr [ebp-108],4
	mov	dword603,[ebp-108]
	cmp	dword603,[ebp-112]
	jl	label000d
label000f:
label0012:
; end of inline function _rasterize_horiz_line
	jmp	label000c
label000b:
	mov	dword632,[ebp-44]
	mov	[ebp-80],dword632
	mov	dword631,[ebp-48]
	mov	[ebp-84],dword631
	mov	dword630,[ebp-52]
	mov	[ebp-88],dword630
	mov	dword629,[ebp-56]
	mov	[ebp-92],dword629
	mov	dword628,[ebp-68]
	mov	[ebp-96],dword628
	mov	dword627,[ebp-76]
	mov	[ebp-100],dword627
	mov	dword626,[ebp-72]
	mov	[ebp-104],dword626
; start of inline function _rasterize_horiz_line
	mov	dword636,dword ptr [__pitch]
	imul	dword636,[ebp-96]
	add	dword636,dword ptr [__videomem]
	sal	dword ptr [ebp-104],2
	add	dword636,[ebp-104]
	mov	[ebp-108],dword636
	sal	dword ptr [ebp-100],2
	mov	dword644,[ebp-108]
	add	dword644,[ebp-100]
	sal	dword ptr [ebp-104],2
	sub	dword644,[ebp-104]
	mov	[ebp-112],dword644
label0013:
	mov	dword712,[ebp-88]
	mov	[ebp-152],dword712
	mov	dword711,[ebp-92]
	mov	[ebp-156],dword711
; start of inline function _tex2d
	mov	dword716,dword ptr [__texture_width]
	dec	dword716
	int2float	dword716
	fmul	dword ptr [ebp-156]
	float2int	dword718
	mov	[ebp-160],dword718
	mov	dword722,dword ptr [__texture_height]
	dec	dword722
	int2float	dword722
	fmul	dword ptr [ebp-152]
	float2int	dword724
	mov	[ebp-164],dword724
	mov	dword728,[ebp-164]
	imul	dword728,dword ptr [__texture_width]
	add	dword728,[ebp-160]
	sal	dword728,2
	add	dword728,dword ptr [__texture_data]
	mov	dword732,[dword728]
	mov	[ebp-168],dword732
label0017:
; end of inline function _tex2d
	mov	dword650,[ebp-168]
	mov	[ebp-116],dword650
	sar	dword ptr [ebp-116],24
	mov	dword655,[ebp-116]
	and	dword655,-289
	mov	[ebp-144],dword655
	cmp	dword ptr [ebp-144],0
	je	label0016
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword662,[ebp-108]
	mov	dword664,[dword662]
	mov	[ebp-132],dword664
	mov	dword667,[ebp-132]
	and	dword667,-73984
	sar	dword667,8
	mov	[ebp-136],dword667
	mov	dword672,[ebp-132]
	and	dword672,-289
	mov	[ebp-140],dword672
	mov	dword676,[ebp-116]
	and	dword676,-73984
	sar	dword676,8
	mov	[ebp-124],dword676
	mov	dword681,[ebp-116]
	and	dword681,-289
	mov	[ebp-128],dword681
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword687
	mov	[ebp-124],dword687
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword693
	mov	[ebp-128],dword693
	sal	dword ptr [ebp-124],8
	mov	dword698,[ebp-124]
	add	dword698,[ebp-128]
	mov	[ebp-120],dword698
	mov	dword701,[ebp-108]
	mov	dword703,[ebp-120]
	mov	[dword701],dword703
label0016:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0014:
	add	dword ptr [ebp-108],4
	mov	dword710,[ebp-108]
	cmp	dword710,[ebp-112]
	jl	label0013
label0015:
label0018:
; end of inline function _rasterize_horiz_line
label000c:
label0019:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-16]
	jmp	label0006
label0007:
	mov	dword237,[ebp+12]
	add	dword237,4
	mov	dword240,[ebp+8]
	add	dword240,4
	mov	dword242,[dword237]
	sub	dword242,[dword240]
	mov	dword244,[ebp+16]
	mov	dword246,[ebp+8]
	mov	dword247,[dword244]
	sub	dword247,[dword246]
	imul	dword242,dword247
	mov	dword249,[ebp+16]
	add	dword249,4
	mov	dword252,[ebp+8]
	add	dword252,4
	mov	dword254,[dword249]
	sub	dword254,[dword252]
	cdq	dword255
	idiv	dword242,dword254
	mov	dword257,[ebp+8]
	add	dword242,[dword257]
	mov	[ebp-12],dword242
	mov	dword260,[ebp+12]
	add	dword260,4
	mov	dword263,[ebp+8]
	add	dword263,4
	mov	dword265,[dword260]
	sub	dword265,[dword263]
	int2float	dword265
	mov	dword267,[ebp+16]
	mov	dword269,[ebp+8]
	fld	dword ptr [dword267+8]
	fsub	dword ptr [dword269+8]
	fmulp
	mov	dword271,[ebp+16]
	add	dword271,4
	mov	dword274,[ebp+8]
	add	dword274,4
	mov	dword276,[dword271]
	sub	dword276,[dword274]
	int2float	dword276
	fdivp
	mov	dword278,[ebp+8]
	fadd	dword ptr [dword278+8]
	fstp	dword ptr [ebp-28]
	mov	dword281,[ebp+12]
	add	dword281,4
	mov	dword284,[ebp+8]
	add	dword284,4
	mov	dword286,[dword281]
	sub	dword286,[dword284]
	int2float	dword286
	mov	dword288,8
	add	dword288,[ebp+16]
	add	dword288,4
	mov	dword291,8
	add	dword291,[ebp+8]
	add	dword291,4
	fld	dword ptr [dword288]
	fsub	dword ptr [dword291]
	fmulp
	mov	dword294,[ebp+16]
	add	dword294,4
	mov	dword297,[ebp+8]
	add	dword297,4
	mov	dword299,[dword294]
	sub	dword299,[dword297]
	int2float	dword299
	fdivp
	mov	dword301,8
	add	dword301,[ebp+8]
	add	dword301,4
	fadd	dword ptr [dword301]
	fstp	dword ptr [ebp-32]
	mov	dword305,[ebp+12]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [dword305+8]
	mov	dword308,[ebp+12]
	mov	dword310,[ebp-12]
	sub	dword310,[dword308]
	int2float	dword310
	fdivp
	fstp	dword ptr [ebp-36]
	mov	dword313,8
	add	dword313,[ebp+12]
	add	dword313,4
	fld	dword ptr [ebp-32]
	fsub	dword ptr [dword313]
	mov	dword317,[ebp+12]
	mov	dword319,[ebp-12]
	sub	dword319,[dword317]
	int2float	dword319
	fdivp
	fstp	dword ptr [ebp-40]
	mov	dword741,[ebp-40]
	mov	[ebp-44],dword741
	mov	dword740,[ebp-36]
	mov	[ebp-48],dword740
	mov	dword324,8
	add	dword324,[ebp+12]
	add	dword324,4
	mov	dword739,[dword324]
	mov	[ebp-52],dword739
	mov	dword327,[ebp+12]
	mov	dword738,[dword327+8]
	mov	[ebp-56],dword738
	mov	dword737,[ebp-32]
	mov	[ebp-60],dword737
	mov	dword736,[ebp-28]
	mov	[ebp-64],dword736
	mov	dword331,[ebp+12]
	add	dword331,4
	mov	dword735,[dword331]
	mov	[ebp-68],dword735
	mov	dword334,[ebp+12]
	mov	dword734,[dword334]
	mov	[ebp-72],dword734
	mov	dword733,[ebp-12]
	mov	[ebp-76],dword733
; start of inline function _rasterize_horiz_line__unordered
	mov	dword745,[ebp-76]
	cmp	dword745,[ebp-72]
	jg	label001a
	mov	dword766,[ebp-44]
	mov	[ebp-80],dword766
	mov	dword765,[ebp-48]
	mov	[ebp-84],dword765
	mov	dword764,[ebp-60]
	mov	[ebp-88],dword764
	mov	dword763,[ebp-64]
	mov	[ebp-92],dword763
	mov	dword762,[ebp-68]
	mov	[ebp-96],dword762
	mov	dword761,[ebp-72]
	mov	[ebp-100],dword761
	mov	dword760,[ebp-76]
	mov	[ebp-104],dword760
; start of inline function _rasterize_horiz_line
	mov	dword770,dword ptr [__pitch]
	imul	dword770,[ebp-96]
	add	dword770,dword ptr [__videomem]
	sal	dword ptr [ebp-104],2
	add	dword770,[ebp-104]
	mov	[ebp-108],dword770
	sal	dword ptr [ebp-100],2
	mov	dword778,[ebp-108]
	add	dword778,[ebp-100]
	sal	dword ptr [ebp-104],2
	sub	dword778,[ebp-104]
	mov	[ebp-112],dword778
label001c:
	mov	dword846,[ebp-88]
	mov	[ebp-152],dword846
	mov	dword845,[ebp-92]
	mov	[ebp-156],dword845
; start of inline function _tex2d
	mov	dword850,dword ptr [__texture_width]
	dec	dword850
	int2float	dword850
	fmul	dword ptr [ebp-156]
	float2int	dword852
	mov	[ebp-160],dword852
	mov	dword856,dword ptr [__texture_height]
	dec	dword856
	int2float	dword856
	fmul	dword ptr [ebp-152]
	float2int	dword858
	mov	[ebp-164],dword858
	mov	dword862,[ebp-164]
	imul	dword862,dword ptr [__texture_width]
	add	dword862,[ebp-160]
	sal	dword862,2
	add	dword862,dword ptr [__texture_data]
	mov	dword866,[dword862]
	mov	[ebp-168],dword866
label0020:
; end of inline function _tex2d
	mov	dword784,[ebp-168]
	mov	[ebp-116],dword784
	sar	dword ptr [ebp-116],24
	mov	dword789,[ebp-116]
	and	dword789,-289
	mov	[ebp-144],dword789
	cmp	dword ptr [ebp-144],0
	je	label001f
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword796,[ebp-108]
	mov	dword798,[dword796]
	mov	[ebp-132],dword798
	mov	dword801,[ebp-132]
	and	dword801,-73984
	sar	dword801,8
	mov	[ebp-136],dword801
	mov	dword806,[ebp-132]
	and	dword806,-289
	mov	[ebp-140],dword806
	mov	dword810,[ebp-116]
	and	dword810,-73984
	sar	dword810,8
	mov	[ebp-124],dword810
	mov	dword815,[ebp-116]
	and	dword815,-289
	mov	[ebp-128],dword815
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword821
	mov	[ebp-124],dword821
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword827
	mov	[ebp-128],dword827
	sal	dword ptr [ebp-124],8
	mov	dword832,[ebp-124]
	add	dword832,[ebp-128]
	mov	[ebp-120],dword832
	mov	dword835,[ebp-108]
	mov	dword837,[ebp-120]
	mov	[dword835],dword837
label001f:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label001d:
	add	dword ptr [ebp-108],4
	mov	dword844,[ebp-108]
	cmp	dword844,[ebp-112]
	jl	label001c
label001e:
label0021:
; end of inline function _rasterize_horiz_line
	jmp	label001b
label001a:
	mov	dword873,[ebp-44]
	mov	[ebp-80],dword873
	mov	dword872,[ebp-48]
	mov	[ebp-84],dword872
	mov	dword871,[ebp-52]
	mov	[ebp-88],dword871
	mov	dword870,[ebp-56]
	mov	[ebp-92],dword870
	mov	dword869,[ebp-68]
	mov	[ebp-96],dword869
	mov	dword868,[ebp-76]
	mov	[ebp-100],dword868
	mov	dword867,[ebp-72]
	mov	[ebp-104],dword867
; start of inline function _rasterize_horiz_line
	mov	dword877,dword ptr [__pitch]
	imul	dword877,[ebp-96]
	add	dword877,dword ptr [__videomem]
	sal	dword ptr [ebp-104],2
	add	dword877,[ebp-104]
	mov	[ebp-108],dword877
	sal	dword ptr [ebp-100],2
	mov	dword885,[ebp-108]
	add	dword885,[ebp-100]
	sal	dword ptr [ebp-104],2
	sub	dword885,[ebp-104]
	mov	[ebp-112],dword885
label0022:
	mov	dword953,[ebp-88]
	mov	[ebp-152],dword953
	mov	dword952,[ebp-92]
	mov	[ebp-156],dword952
; start of inline function _tex2d
	mov	dword957,dword ptr [__texture_width]
	dec	dword957
	int2float	dword957
	fmul	dword ptr [ebp-156]
	float2int	dword959
	mov	[ebp-160],dword959
	mov	dword963,dword ptr [__texture_height]
	dec	dword963
	int2float	dword963
	fmul	dword ptr [ebp-152]
	float2int	dword965
	mov	[ebp-164],dword965
	mov	dword969,[ebp-164]
	imul	dword969,dword ptr [__texture_width]
	add	dword969,[ebp-160]
	sal	dword969,2
	add	dword969,dword ptr [__texture_data]
	mov	dword973,[dword969]
	mov	[ebp-168],dword973
label0026:
; end of inline function _tex2d
	mov	dword891,[ebp-168]
	mov	[ebp-116],dword891
	sar	dword ptr [ebp-116],24
	mov	dword896,[ebp-116]
	and	dword896,-289
	mov	[ebp-144],dword896
	cmp	dword ptr [ebp-144],0
	je	label0025
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword903,[ebp-108]
	mov	dword905,[dword903]
	mov	[ebp-132],dword905
	mov	dword908,[ebp-132]
	and	dword908,-73984
	sar	dword908,8
	mov	[ebp-136],dword908
	mov	dword913,[ebp-132]
	and	dword913,-289
	mov	[ebp-140],dword913
	mov	dword917,[ebp-116]
	and	dword917,-73984
	sar	dword917,8
	mov	[ebp-124],dword917
	mov	dword922,[ebp-116]
	and	dword922,-289
	mov	[ebp-128],dword922
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword928
	mov	[ebp-124],dword928
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword934
	mov	[ebp-128],dword934
	sal	dword ptr [ebp-124],8
	mov	dword939,[ebp-124]
	add	dword939,[ebp-128]
	mov	[ebp-120],dword939
	mov	dword942,[ebp-108]
	mov	dword944,[ebp-120]
	mov	[dword942],dword944
label0025:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0023:
	add	dword ptr [ebp-108],4
	mov	dword951,[ebp-108]
	cmp	dword951,[ebp-112]
	jl	label0022
label0024:
label0027:
; end of inline function _rasterize_horiz_line
label001b:
label0028:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword337,[ebp+12]
	add	dword337,4
	mov	dword339,1
	add	dword339,[dword337]
	mov	[ebp-16],dword339
label0008:
label0009:
	mov	dword342,[ebp+16]
	add	dword342,4
	mov	dword345,[dword342]
	cmp	dword345,[ebp-16]
	jle	label000a
	mov	dword347,[ebp+12]
	add	dword347,4
	mov	dword350,[ebp-16]
	sub	dword350,[dword347]
	mov	dword352,[ebp+16]
	mov	dword354,[ebp+12]
	mov	dword355,[dword352]
	sub	dword355,[dword354]
	imul	dword350,dword355
	mov	dword357,[ebp+16]
	add	dword357,4
	mov	dword360,[ebp+12]
	add	dword360,4
	mov	dword362,[dword357]
	sub	dword362,[dword360]
	cdq	dword363
	idiv	dword350,dword362
	mov	dword365,[ebp+12]
	add	dword350,[dword365]
	mov	[ebp-8],dword350
	mov	dword368,[ebp+8]
	add	dword368,4
	mov	dword371,[ebp-16]
	sub	dword371,[dword368]
	mov	dword373,[ebp+16]
	mov	dword375,[ebp+8]
	mov	dword376,[dword373]
	sub	dword376,[dword375]
	imul	dword371,dword376
	mov	dword378,[ebp+16]
	add	dword378,4
	mov	dword381,[ebp+8]
	add	dword381,4
	mov	dword383,[dword378]
	sub	dword383,[dword381]
	cdq	dword384
	idiv	dword371,dword383
	mov	dword386,[ebp+8]
	add	dword371,[dword386]
	mov	[ebp-12],dword371
	mov	dword389,[ebp+12]
	add	dword389,4
	mov	dword392,[ebp-16]
	sub	dword392,[dword389]
	int2float	dword392
	mov	dword394,[ebp+16]
	mov	dword396,[ebp+12]
	fld	dword ptr [dword394+8]
	fsub	dword ptr [dword396+8]
	fmulp
	mov	dword398,[ebp+16]
	add	dword398,4
	mov	dword401,[ebp+12]
	add	dword401,4
	mov	dword403,[dword398]
	sub	dword403,[dword401]
	int2float	dword403
	fdivp
	mov	dword405,[ebp+12]
	fadd	dword ptr [dword405+8]
	fstp	dword ptr [ebp-20]
	mov	dword408,[ebp+8]
	add	dword408,4
	mov	dword411,[ebp-16]
	sub	dword411,[dword408]
	int2float	dword411
	mov	dword413,[ebp+16]
	mov	dword415,[ebp+8]
	fld	dword ptr [dword413+8]
	fsub	dword ptr [dword415+8]
	fmulp
	mov	dword417,[ebp+16]
	add	dword417,4
	mov	dword420,[ebp+8]
	add	dword420,4
	mov	dword422,[dword417]
	sub	dword422,[dword420]
	int2float	dword422
	fdivp
	mov	dword424,[ebp+8]
	fadd	dword ptr [dword424+8]
	fstp	dword ptr [ebp-28]
	mov	dword427,[ebp+12]
	add	dword427,4
	mov	dword430,[ebp-16]
	sub	dword430,[dword427]
	int2float	dword430
	mov	dword432,8
	add	dword432,[ebp+16]
	add	dword432,4
	mov	dword435,8
	add	dword435,[ebp+12]
	add	dword435,4
	fld	dword ptr [dword432]
	fsub	dword ptr [dword435]
	fmulp
	mov	dword438,[ebp+16]
	add	dword438,4
	mov	dword441,[ebp+12]
	add	dword441,4
	mov	dword443,[dword438]
	sub	dword443,[dword441]
	int2float	dword443
	fdivp
	mov	dword445,8
	add	dword445,[ebp+12]
	add	dword445,4
	fadd	dword ptr [dword445]
	fstp	dword ptr [ebp-24]
	mov	dword449,[ebp+8]
	add	dword449,4
	mov	dword452,[ebp-16]
	sub	dword452,[dword449]
	int2float	dword452
	mov	dword454,8
	add	dword454,[ebp+16]
	add	dword454,4
	mov	dword457,8
	add	dword457,[ebp+8]
	add	dword457,4
	fld	dword ptr [dword454]
	fsub	dword ptr [dword457]
	fmulp
	mov	dword460,[ebp+16]
	add	dword460,4
	mov	dword463,[ebp+8]
	add	dword463,4
	mov	dword465,[dword460]
	sub	dword465,[dword463]
	int2float	dword465
	fdivp
	mov	dword467,8
	add	dword467,[ebp+8]
	add	dword467,4
	fadd	dword ptr [dword467]
	fstp	dword ptr [ebp-32]
	mov	dword472,[ebp-12]
	sub	dword472,[ebp-8]
	int2float	dword472
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	dword478,[ebp-12]
	sub	dword478,[ebp-8]
	int2float	dword478
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
	fstp	dword ptr [ebp-40]
	mov	dword982,[ebp-40]
	mov	[ebp-44],dword982
	mov	dword981,[ebp-36]
	mov	[ebp-48],dword981
	mov	dword980,[ebp-32]
	mov	[ebp-52],dword980
	mov	dword979,[ebp-28]
	mov	[ebp-56],dword979
	mov	dword978,[ebp-24]
	mov	[ebp-60],dword978
	mov	dword977,[ebp-20]
	mov	[ebp-64],dword977
	mov	dword976,[ebp-16]
	mov	[ebp-68],dword976
	mov	dword975,[ebp-12]
	mov	[ebp-72],dword975
	mov	dword974,[ebp-8]
	mov	[ebp-76],dword974
; start of inline function _rasterize_horiz_line__unordered
	mov	dword986,[ebp-76]
	cmp	dword986,[ebp-72]
	jg	label0029
	mov	dword1007,[ebp-44]
	mov	[ebp-80],dword1007
	mov	dword1006,[ebp-48]
	mov	[ebp-84],dword1006
	mov	dword1005,[ebp-60]
	mov	[ebp-88],dword1005
	mov	dword1004,[ebp-64]
	mov	[ebp-92],dword1004
	mov	dword1003,[ebp-68]
	mov	[ebp-96],dword1003
	mov	dword1002,[ebp-72]
	mov	[ebp-100],dword1002
	mov	dword1001,[ebp-76]
	mov	[ebp-104],dword1001
; start of inline function _rasterize_horiz_line
	mov	dword1011,dword ptr [__pitch]
	imul	dword1011,[ebp-96]
	add	dword1011,dword ptr [__videomem]
	sal	dword ptr [ebp-104],2
	add	dword1011,[ebp-104]
	mov	[ebp-108],dword1011
	sal	dword ptr [ebp-100],2
	mov	dword1019,[ebp-108]
	add	dword1019,[ebp-100]
	sal	dword ptr [ebp-104],2
	sub	dword1019,[ebp-104]
	mov	[ebp-112],dword1019
label002b:
	mov	dword1087,[ebp-88]
	mov	[ebp-152],dword1087
	mov	dword1086,[ebp-92]
	mov	[ebp-156],dword1086
; start of inline function _tex2d
	mov	dword1091,dword ptr [__texture_width]
	dec	dword1091
	int2float	dword1091
	fmul	dword ptr [ebp-156]
	float2int	dword1093
	mov	[ebp-160],dword1093
	mov	dword1097,dword ptr [__texture_height]
	dec	dword1097
	int2float	dword1097
	fmul	dword ptr [ebp-152]
	float2int	dword1099
	mov	[ebp-164],dword1099
	mov	dword1103,[ebp-164]
	imul	dword1103,dword ptr [__texture_width]
	add	dword1103,[ebp-160]
	sal	dword1103,2
	add	dword1103,dword ptr [__texture_data]
	mov	dword1107,[dword1103]
	mov	[ebp-168],dword1107
label002f:
; end of inline function _tex2d
	mov	dword1025,[ebp-168]
	mov	[ebp-116],dword1025
	sar	dword ptr [ebp-116],24
	mov	dword1030,[ebp-116]
	and	dword1030,-289
	mov	[ebp-144],dword1030
	cmp	dword ptr [ebp-144],0
	je	label002e
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword1037,[ebp-108]
	mov	dword1039,[dword1037]
	mov	[ebp-132],dword1039
	mov	dword1042,[ebp-132]
	and	dword1042,-73984
	sar	dword1042,8
	mov	[ebp-136],dword1042
	mov	dword1047,[ebp-132]
	and	dword1047,-289
	mov	[ebp-140],dword1047
	mov	dword1051,[ebp-116]
	and	dword1051,-73984
	sar	dword1051,8
	mov	[ebp-124],dword1051
	mov	dword1056,[ebp-116]
	and	dword1056,-289
	mov	[ebp-128],dword1056
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword1062
	mov	[ebp-124],dword1062
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword1068
	mov	[ebp-128],dword1068
	sal	dword ptr [ebp-124],8
	mov	dword1073,[ebp-124]
	add	dword1073,[ebp-128]
	mov	[ebp-120],dword1073
	mov	dword1076,[ebp-108]
	mov	dword1078,[ebp-120]
	mov	[dword1076],dword1078
label002e:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label002c:
	add	dword ptr [ebp-108],4
	mov	dword1085,[ebp-108]
	cmp	dword1085,[ebp-112]
	jl	label002b
label002d:
label0030:
; end of inline function _rasterize_horiz_line
	jmp	label002a
label0029:
	mov	dword1114,[ebp-44]
	mov	[ebp-80],dword1114
	mov	dword1113,[ebp-48]
	mov	[ebp-84],dword1113
	mov	dword1112,[ebp-52]
	mov	[ebp-88],dword1112
	mov	dword1111,[ebp-56]
	mov	[ebp-92],dword1111
	mov	dword1110,[ebp-68]
	mov	[ebp-96],dword1110
	mov	dword1109,[ebp-76]
	mov	[ebp-100],dword1109
	mov	dword1108,[ebp-72]
	mov	[ebp-104],dword1108
; start of inline function _rasterize_horiz_line
	mov	dword1118,dword ptr [__pitch]
	imul	dword1118,[ebp-96]
	add	dword1118,dword ptr [__videomem]
	sal	dword ptr [ebp-104],2
	add	dword1118,[ebp-104]
	mov	[ebp-108],dword1118
	sal	dword ptr [ebp-100],2
	mov	dword1126,[ebp-108]
	add	dword1126,[ebp-100]
	sal	dword ptr [ebp-104],2
	sub	dword1126,[ebp-104]
	mov	[ebp-112],dword1126
label0031:
	mov	dword1194,[ebp-88]
	mov	[ebp-152],dword1194
	mov	dword1193,[ebp-92]
	mov	[ebp-156],dword1193
; start of inline function _tex2d
	mov	dword1198,dword ptr [__texture_width]
	dec	dword1198
	int2float	dword1198
	fmul	dword ptr [ebp-156]
	float2int	dword1200
	mov	[ebp-160],dword1200
	mov	dword1204,dword ptr [__texture_height]
	dec	dword1204
	int2float	dword1204
	fmul	dword ptr [ebp-152]
	float2int	dword1206
	mov	[ebp-164],dword1206
	mov	dword1210,[ebp-164]
	imul	dword1210,dword ptr [__texture_width]
	add	dword1210,[ebp-160]
	sal	dword1210,2
	add	dword1210,dword ptr [__texture_data]
	mov	dword1214,[dword1210]
	mov	[ebp-168],dword1214
label0035:
; end of inline function _tex2d
	mov	dword1132,[ebp-168]
	mov	[ebp-116],dword1132
	sar	dword ptr [ebp-116],24
	mov	dword1137,[ebp-116]
	and	dword1137,-289
	mov	[ebp-144],dword1137
	cmp	dword ptr [ebp-144],0
	je	label0034
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword1144,[ebp-108]
	mov	dword1146,[dword1144]
	mov	[ebp-132],dword1146
	mov	dword1149,[ebp-132]
	and	dword1149,-73984
	sar	dword1149,8
	mov	[ebp-136],dword1149
	mov	dword1154,[ebp-132]
	and	dword1154,-289
	mov	[ebp-140],dword1154
	mov	dword1158,[ebp-116]
	and	dword1158,-73984
	sar	dword1158,8
	mov	[ebp-124],dword1158
	mov	dword1163,[ebp-116]
	and	dword1163,-289
	mov	[ebp-128],dword1163
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword1169
	mov	[ebp-124],dword1169
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword1175
	mov	[ebp-128],dword1175
	sal	dword ptr [ebp-124],8
	mov	dword1180,[ebp-124]
	add	dword1180,[ebp-128]
	mov	[ebp-120],dword1180
	mov	dword1183,[ebp-108]
	mov	dword1185,[ebp-120]
	mov	[dword1183],dword1185
label0034:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0032:
	add	dword ptr [ebp-108],4
	mov	dword1192,[ebp-108]
	cmp	dword1192,[ebp-112]
	jl	label0031
label0033:
label0036:
; end of inline function _rasterize_horiz_line
label002a:
label0037:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-16]
	jmp	label0009
label000a:
	destroy_stack_frame
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	create_stack_frame
	mov	dword351,[ebp+8]
	mov	dword ptr [dword351+192],0
	mov	dword352,[ebp+12]
	mov	dword353,[ebp+12]
	add	dword353,24
label0000:
label0001:
	mov	dword12,[ebp+12]
	mov	dword14,[dword12+192]
	imul	dword14,24
	mov	dword16,[ebp+12]
	add	dword16,dword14
	cmp	dword16,dword353
	jle	label0002
	mov	dword162,[ebp+16]
	mov	[ebp-108],dword162
	mov	[ebp-112],dword352
	lea	dword21,[ebp-24]
	mov	[ebp-116],dword21
; start of inline function vec4f_subtract
	mov	dword165,[ebp-112]
	mov	dword167,[ebp-108]
	fld	dword ptr [dword165]
	fsub	dword ptr [dword167]
	mov	dword169,[ebp-116]
	fstp	dword ptr [dword169]
	mov	dword171,[ebp-112]
	mov	dword173,[ebp-108]
	fld	dword ptr [dword171+4]
	fsub	dword ptr [dword173+4]
	mov	dword175,[ebp-116]
	fstp	dword ptr [dword175+4]
	mov	dword177,[ebp-112]
	mov	dword179,[ebp-108]
	fld	dword ptr [dword177+8]
	fsub	dword ptr [dword179+8]
	mov	dword181,[ebp-116]
	fstp	dword ptr [dword181+8]
	mov	dword183,[ebp-112]
	mov	dword185,[ebp-108]
	fld	dword ptr [dword183+12]
	fsub	dword ptr [dword185+12]
	mov	dword187,[ebp-116]
	fstp	dword ptr [dword187+12]
label000b:
; end of inline function vec4f_subtract
	mov	dword265,[ebp+20]
	mov	[ebp-120],dword265
	lea	dword23,[ebp-24]
	mov	[ebp-124],dword23
; start of inline function vec4f_dot
	mov	dword268,[ebp-124]
	mov	dword270,[ebp-120]
	fld	dword ptr [dword268+4]
	fmul	dword ptr [dword270+4]
	mov	dword272,[ebp-124]
	mov	dword274,[ebp-120]
	fld	dword ptr [dword272]
	fmul	dword ptr [dword274]
	faddp
	mov	dword276,[ebp-124]
	mov	dword278,[ebp-120]
	fld	dword ptr [dword276+8]
	fmul	dword ptr [dword278+8]
	faddp
	mov	dword280,[ebp-124]
	mov	dword282,[ebp-120]
	fld	dword ptr [dword280+12]
	fmul	dword ptr [dword282+12]
	faddp
	fstp	dword ptr [ebp-128]
label000f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-52]
	mov	dword188,[ebp+16]
	mov	[ebp-108],dword188
	mov	[ebp-112],dword353
	lea	dword28,[ebp-24]
	mov	[ebp-116],dword28
; start of inline function vec4f_subtract
	mov	dword191,[ebp-112]
	mov	dword193,[ebp-108]
	fld	dword ptr [dword191]
	fsub	dword ptr [dword193]
	mov	dword195,[ebp-116]
	fstp	dword ptr [dword195]
	mov	dword197,[ebp-112]
	mov	dword199,[ebp-108]
	fld	dword ptr [dword197+4]
	fsub	dword ptr [dword199+4]
	mov	dword201,[ebp-116]
	fstp	dword ptr [dword201+4]
	mov	dword203,[ebp-112]
	mov	dword205,[ebp-108]
	fld	dword ptr [dword203+8]
	fsub	dword ptr [dword205+8]
	mov	dword207,[ebp-116]
	fstp	dword ptr [dword207+8]
	mov	dword209,[ebp-112]
	mov	dword211,[ebp-108]
	fld	dword ptr [dword209+12]
	fsub	dword ptr [dword211+12]
	mov	dword213,[ebp-116]
	fstp	dword ptr [dword213+12]
label000c:
; end of inline function vec4f_subtract
	mov	dword283,[ebp+20]
	mov	[ebp-120],dword283
	lea	dword30,[ebp-24]
	mov	[ebp-124],dword30
; start of inline function vec4f_dot
	mov	dword286,[ebp-124]
	mov	dword288,[ebp-120]
	fld	dword ptr [dword286+4]
	fmul	dword ptr [dword288+4]
	mov	dword290,[ebp-124]
	mov	dword292,[ebp-120]
	fld	dword ptr [dword290]
	fmul	dword ptr [dword292]
	faddp
	mov	dword294,[ebp-124]
	mov	dword296,[ebp-120]
	fld	dword ptr [dword294+8]
	fmul	dword ptr [dword296+8]
	faddp
	mov	dword298,[ebp-124]
	mov	dword300,[ebp-120]
	fld	dword ptr [dword298+12]
	fmul	dword ptr [dword300+12]
	faddp
	fstp	dword ptr [ebp-128]
label0010:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-56]
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	mov	dword35,[dword351+192]
	inc	dword ptr [dword351+192]
	imul	dword35,24
	mov	dword38,dword351
	add	dword38,dword35
	mov	dword41,[dword352]
	mov	dword42,[dword352+4]
	mov	[dword38],dword41
	mov	[dword38+4],dword42
	mov	dword41,[dword352+8]
	mov	dword42,[dword352+12]
	mov	[dword38+8],dword41
	mov	[dword38+12],dword42
	mov	dword41,[dword352+16]
	mov	dword42,[dword352+20]
	mov	[dword38+16],dword41
	mov	[dword38+20],dword42
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
	mov	[ebp-108],dword352
	mov	dword214,[ebp+16]
	mov	[ebp-112],dword214
	lea	dword50,[ebp-24]
	mov	[ebp-116],dword50
; start of inline function vec4f_subtract
	mov	dword217,[ebp-112]
	mov	dword219,[ebp-108]
	fld	dword ptr [dword217]
	fsub	dword ptr [dword219]
	mov	dword221,[ebp-116]
	fstp	dword ptr [dword221]
	mov	dword223,[ebp-112]
	mov	dword225,[ebp-108]
	fld	dword ptr [dword223+4]
	fsub	dword ptr [dword225+4]
	mov	dword227,[ebp-116]
	fstp	dword ptr [dword227+4]
	mov	dword229,[ebp-112]
	mov	dword231,[ebp-108]
	fld	dword ptr [dword229+8]
	fsub	dword ptr [dword231+8]
	mov	dword233,[ebp-116]
	fstp	dword ptr [dword233+8]
	mov	dword235,[ebp-112]
	mov	dword237,[ebp-108]
	fld	dword ptr [dword235+12]
	fsub	dword ptr [dword237+12]
	mov	dword239,[ebp-116]
	fstp	dword ptr [dword239+12]
label000d:
; end of inline function vec4f_subtract
	mov	[ebp-108],dword352
	mov	[ebp-112],dword353
	lea	dword55,[ebp-40]
	mov	[ebp-116],dword55
; start of inline function vec4f_subtract
	mov	dword242,[ebp-112]
	mov	dword244,[ebp-108]
	fld	dword ptr [dword242]
	fsub	dword ptr [dword244]
	mov	dword246,[ebp-116]
	fstp	dword ptr [dword246]
	mov	dword248,[ebp-112]
	mov	dword250,[ebp-108]
	fld	dword ptr [dword248+4]
	fsub	dword ptr [dword250+4]
	mov	dword252,[ebp-116]
	fstp	dword ptr [dword252+4]
	mov	dword254,[ebp-112]
	mov	dword256,[ebp-108]
	fld	dword ptr [dword254+8]
	fsub	dword ptr [dword256+8]
	mov	dword258,[ebp-116]
	fstp	dword ptr [dword258+8]
	mov	dword260,[ebp-112]
	mov	dword262,[ebp-108]
	fld	dword ptr [dword260+12]
	fsub	dword ptr [dword262+12]
	mov	dword264,[ebp-116]
	fstp	dword ptr [dword264+12]
label000e:
; end of inline function vec4f_subtract
	mov	dword301,[ebp+20]
	mov	[ebp-120],dword301
	lea	dword57,[ebp-24]
	mov	[ebp-124],dword57
; start of inline function vec4f_dot
	mov	dword304,[ebp-124]
	mov	dword306,[ebp-120]
	fld	dword ptr [dword304+4]
	fmul	dword ptr [dword306+4]
	mov	dword308,[ebp-124]
	mov	dword310,[ebp-120]
	fld	dword ptr [dword308]
	fmul	dword ptr [dword310]
	faddp
	mov	dword312,[ebp-124]
	mov	dword314,[ebp-120]
	fld	dword ptr [dword312+8]
	fmul	dword ptr [dword314+8]
	faddp
	mov	dword316,[ebp-124]
	mov	dword318,[ebp-120]
	fld	dword ptr [dword316+12]
	fmul	dword ptr [dword318+12]
	faddp
	fstp	dword ptr [ebp-128]
label0011:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	mov	dword319,[ebp+20]
	mov	[ebp-120],dword319
	lea	dword59,[ebp-40]
	mov	[ebp-124],dword59
; start of inline function vec4f_dot
	mov	dword322,[ebp-124]
	mov	dword324,[ebp-120]
	fld	dword ptr [dword322+4]
	fmul	dword ptr [dword324+4]
	mov	dword326,[ebp-124]
	mov	dword328,[ebp-120]
	fld	dword ptr [dword326]
	fmul	dword ptr [dword328]
	faddp
	mov	dword330,[ebp-124]
	mov	dword332,[ebp-120]
	fld	dword ptr [dword330+8]
	fmul	dword ptr [dword332+8]
	faddp
	mov	dword334,[ebp-124]
	mov	dword336,[ebp-120]
	fld	dword ptr [dword334+12]
	fmul	dword ptr [dword336+12]
	faddp
	fstp	dword ptr [ebp-128]
label0012:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fdivp
	fstp	dword ptr [ebp-60]
	mov	dword337,[ebp-60]
	mov	[ebp-132],dword337
	lea	dword62,[ebp-40]
	mov	[ebp-136],dword62
; start of inline function vec4f_mul
	mov	dword340,[ebp-136]
	fld	dword ptr [dword340]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword340]
	mov	dword343,[ebp-136]
	fld	dword ptr [dword343+4]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword343+4]
	mov	dword346,[ebp-136]
	fld	dword ptr [dword346+8]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword346+8]
	mov	dword349,[ebp-136]
	fld	dword ptr [dword349+12]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword349+12]
label0013:
; end of inline function vec4f_mul
	lea	dword63,[ebp-40]
	mov	[ebp-96],dword63
	mov	[ebp-100],dword352
	mov	dword69,[dword351+192]
	imul	dword69,24
	mov	dword71,dword351
	add	dword71,dword69
	mov	[ebp-104],dword71
; start of inline function vec4f_add
	mov	dword139,[ebp-100]
	mov	dword141,[ebp-96]
	fld	dword ptr [dword139]
	fadd	dword ptr [dword141]
	mov	dword143,[ebp-104]
	fstp	dword ptr [dword143]
	mov	dword145,[ebp-100]
	mov	dword147,[ebp-96]
	fld	dword ptr [dword145+4]
	fadd	dword ptr [dword147+4]
	mov	dword149,[ebp-104]
	fstp	dword ptr [dword149+4]
	mov	dword151,[ebp-100]
	mov	dword153,[ebp-96]
	fld	dword ptr [dword151+8]
	fadd	dword ptr [dword153+8]
	mov	dword155,[ebp-104]
	fstp	dword ptr [dword155+8]
	mov	dword157,[ebp-100]
	mov	dword159,[ebp-96]
	fld	dword ptr [dword157+12]
	fadd	dword ptr [dword159+12]
	mov	dword161,[ebp-104]
	fstp	dword ptr [dword161+12]
label000a:
; end of inline function vec4f_add
	mov	dword73,16
	add	dword73,dword352
	mov	[ebp-76],dword73
	mov	dword75,16
	add	dword75,dword353
	mov	[ebp-80],dword75
	lea	dword76,[ebp-48]
	mov	[ebp-84],dword76
; start of inline function vec2f_subtract
	mov	dword118,[ebp-80]
	mov	dword120,[ebp-76]
	fld	dword ptr [dword118]
	fsub	dword ptr [dword120]
	mov	dword122,[ebp-84]
	fstp	dword ptr [dword122]
	mov	dword124,[ebp-80]
	mov	dword126,[ebp-76]
	fld	dword ptr [dword124+4]
	fsub	dword ptr [dword126+4]
	mov	dword128,[ebp-84]
	fstp	dword ptr [dword128+4]
label0008:
; end of inline function vec2f_subtract
	mov	dword129,[ebp-60]
	mov	[ebp-88],dword129
	lea	dword78,[ebp-48]
	mov	[ebp-92],dword78
; start of inline function vec2f_mul
	mov	dword132,[ebp-92]
	fld	dword ptr [dword132]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [dword132]
	mov	dword135,[ebp-92]
	fld	dword ptr [dword135+4]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [dword135+4]
label0009:
; end of inline function vec2f_mul
	lea	dword79,[ebp-48]
	mov	[ebp-64],dword79
	mov	dword81,16
	add	dword81,dword352
	mov	[ebp-68],dword81
	mov	dword85,[dword351+192]
	imul	dword85,24
	mov	dword87,dword351
	add	dword87,dword85
	add	dword87,16
	mov	[ebp-72],dword87
; start of inline function vec2f_add
	mov	dword105,[ebp-68]
	mov	dword107,[ebp-64]
	fld	dword ptr [dword105]
	fadd	dword ptr [dword107]
	mov	dword109,[ebp-72]
	fstp	dword ptr [dword109]
	mov	dword111,[ebp-68]
	mov	dword113,[ebp-64]
	fld	dword ptr [dword111+4]
	fadd	dword ptr [dword113+4]
	mov	dword115,[ebp-72]
	fstp	dword ptr [dword115+4]
label0007:
; end of inline function vec2f_add
	inc	dword ptr [dword351+192]
label0004:
	add	dword352,24
	add	dword353,24
	jmp	label0001
label0002:
	mov	dword95,[dword351+192]
	inc	dword ptr [dword351+192]
	imul	dword95,24
	mov	dword98,dword351
	add	dword98,dword95
	mov	dword101,[dword351]
	mov	dword102,[dword351+4]
	mov	[dword98],dword101
	mov	[dword98+4],dword102
	mov	dword101,[dword351+8]
	mov	dword102,[dword351+12]
	mov	[dword98+8],dword101
	mov	[dword98+12],dword102
	mov	dword101,[dword351+16]
	mov	dword102,[dword351+20]
	mov	[dword98+16],dword101
	mov	[dword98+20],dword102
	destroy_stack_frame
	ret
__clip_on_plain endp	

__clip_poligon proc
	create_stack_frame
	mov	dword2141,[ebp+8]
	mov	[ebp-200],(offset __clip_z_far_norm)
	mov	[ebp-204],(offset __clip_z_far_base)
	mov	[ebp-208],dword2141
	lea	dword4,[ebp-196]
	mov	[ebp-212],dword4
; start of inline function _clip_on_plain
	mov	dword32,[ebp-212]
	mov	dword ptr [dword32+192],0
	mov	dword35,[ebp-208]
	mov	[ebp-216],dword35
	mov	dword38,[ebp-208]
	add	dword38,24
	mov	[ebp-220],dword38
label0000:
label0001:
	mov	dword42,[ebp-208]
	mov	dword44,[dword42+192]
	imul	dword44,24
	mov	dword46,[ebp-208]
	add	dword46,dword44
	cmp	dword46,[ebp-220]
	jle	label0002
	mov	dword192,[ebp-204]
	mov	[ebp-320],dword192
	mov	dword50,[ebp-216]
	mov	[ebp-324],dword50
	lea	dword51,[ebp-236]
	mov	[ebp-328],dword51
; start of inline function vec4f_subtract
	mov	dword195,[ebp-324]
	mov	dword197,[ebp-320]
	fld	dword ptr [dword195]
	fsub	dword ptr [dword197]
	mov	dword199,[ebp-328]
	fstp	dword ptr [dword199]
	mov	dword201,[ebp-324]
	mov	dword203,[ebp-320]
	fld	dword ptr [dword201+4]
	fsub	dword ptr [dword203+4]
	mov	dword205,[ebp-328]
	fstp	dword ptr [dword205+4]
	mov	dword207,[ebp-324]
	mov	dword209,[ebp-320]
	fld	dword ptr [dword207+8]
	fsub	dword ptr [dword209+8]
	mov	dword211,[ebp-328]
	fstp	dword ptr [dword211+8]
	mov	dword213,[ebp-324]
	mov	dword215,[ebp-320]
	fld	dword ptr [dword213+12]
	fsub	dword ptr [dword215+12]
	mov	dword217,[ebp-328]
	fstp	dword ptr [dword217+12]
label000b:
; end of inline function vec4f_subtract
	mov	dword295,[ebp-200]
	mov	[ebp-332],dword295
	lea	dword53,[ebp-236]
	mov	[ebp-336],dword53
; start of inline function vec4f_dot
	mov	dword298,[ebp-336]
	mov	dword300,[ebp-332]
	fld	dword ptr [dword298+4]
	fmul	dword ptr [dword300+4]
	mov	dword302,[ebp-336]
	mov	dword304,[ebp-332]
	fld	dword ptr [dword302]
	fmul	dword ptr [dword304]
	faddp
	mov	dword306,[ebp-336]
	mov	dword308,[ebp-332]
	fld	dword ptr [dword306+8]
	fmul	dword ptr [dword308+8]
	faddp
	mov	dword310,[ebp-336]
	mov	dword312,[ebp-332]
	fld	dword ptr [dword310+12]
	fmul	dword ptr [dword312+12]
	faddp
	fstp	dword ptr [ebp-340]
label000f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	dword218,[ebp-204]
	mov	[ebp-320],dword218
	mov	dword57,[ebp-220]
	mov	[ebp-324],dword57
	lea	dword58,[ebp-236]
	mov	[ebp-328],dword58
; start of inline function vec4f_subtract
	mov	dword221,[ebp-324]
	mov	dword223,[ebp-320]
	fld	dword ptr [dword221]
	fsub	dword ptr [dword223]
	mov	dword225,[ebp-328]
	fstp	dword ptr [dword225]
	mov	dword227,[ebp-324]
	mov	dword229,[ebp-320]
	fld	dword ptr [dword227+4]
	fsub	dword ptr [dword229+4]
	mov	dword231,[ebp-328]
	fstp	dword ptr [dword231+4]
	mov	dword233,[ebp-324]
	mov	dword235,[ebp-320]
	fld	dword ptr [dword233+8]
	fsub	dword ptr [dword235+8]
	mov	dword237,[ebp-328]
	fstp	dword ptr [dword237+8]
	mov	dword239,[ebp-324]
	mov	dword241,[ebp-320]
	fld	dword ptr [dword239+12]
	fsub	dword ptr [dword241+12]
	mov	dword243,[ebp-328]
	fstp	dword ptr [dword243+12]
label000c:
; end of inline function vec4f_subtract
	mov	dword313,[ebp-200]
	mov	[ebp-332],dword313
	lea	dword60,[ebp-236]
	mov	[ebp-336],dword60
; start of inline function vec4f_dot
	mov	dword316,[ebp-336]
	mov	dword318,[ebp-332]
	fld	dword ptr [dword316+4]
	fmul	dword ptr [dword318+4]
	mov	dword320,[ebp-336]
	mov	dword322,[ebp-332]
	fld	dword ptr [dword320]
	fmul	dword ptr [dword322]
	faddp
	mov	dword324,[ebp-336]
	mov	dword326,[ebp-332]
	fld	dword ptr [dword324+8]
	fmul	dword ptr [dword326+8]
	faddp
	mov	dword328,[ebp-336]
	mov	dword330,[ebp-332]
	fld	dword ptr [dword328+12]
	fmul	dword ptr [dword330+12]
	faddp
	fstp	dword ptr [ebp-340]
label0010:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-268]
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	mov	dword64,[ebp-212]
	mov	dword65,[dword64+192]
	inc	dword ptr [dword64+192]
	imul	dword65,24
	mov	dword68,[ebp-212]
	add	dword68,dword65
	mov	dword70,[ebp-216]
	mov	dword71,[dword70]
	mov	dword72,[dword70+4]
	mov	[dword68],dword71
	mov	[dword68+4],dword72
	mov	dword71,[dword70+8]
	mov	dword72,[dword70+12]
	mov	[dword68+8],dword71
	mov	[dword68+12],dword72
	mov	dword71,[dword70+16]
	mov	dword72,[dword70+20]
	mov	[dword68+16],dword71
	mov	[dword68+20],dword72
label0003:
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jbe	label0006
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label0005
label0006:
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label0004
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jae	label0004
label0005:
	mov	dword78,[ebp-216]
	mov	[ebp-320],dword78
	mov	dword244,[ebp-204]
	mov	[ebp-324],dword244
	lea	dword80,[ebp-236]
	mov	[ebp-328],dword80
; start of inline function vec4f_subtract
	mov	dword247,[ebp-324]
	mov	dword249,[ebp-320]
	fld	dword ptr [dword247]
	fsub	dword ptr [dword249]
	mov	dword251,[ebp-328]
	fstp	dword ptr [dword251]
	mov	dword253,[ebp-324]
	mov	dword255,[ebp-320]
	fld	dword ptr [dword253+4]
	fsub	dword ptr [dword255+4]
	mov	dword257,[ebp-328]
	fstp	dword ptr [dword257+4]
	mov	dword259,[ebp-324]
	mov	dword261,[ebp-320]
	fld	dword ptr [dword259+8]
	fsub	dword ptr [dword261+8]
	mov	dword263,[ebp-328]
	fstp	dword ptr [dword263+8]
	mov	dword265,[ebp-324]
	mov	dword267,[ebp-320]
	fld	dword ptr [dword265+12]
	fsub	dword ptr [dword267+12]
	mov	dword269,[ebp-328]
	fstp	dword ptr [dword269+12]
label000d:
; end of inline function vec4f_subtract
	mov	dword82,[ebp-216]
	mov	[ebp-320],dword82
	mov	dword84,[ebp-220]
	mov	[ebp-324],dword84
	lea	dword85,[ebp-252]
	mov	[ebp-328],dword85
; start of inline function vec4f_subtract
	mov	dword272,[ebp-324]
	mov	dword274,[ebp-320]
	fld	dword ptr [dword272]
	fsub	dword ptr [dword274]
	mov	dword276,[ebp-328]
	fstp	dword ptr [dword276]
	mov	dword278,[ebp-324]
	mov	dword280,[ebp-320]
	fld	dword ptr [dword278+4]
	fsub	dword ptr [dword280+4]
	mov	dword282,[ebp-328]
	fstp	dword ptr [dword282+4]
	mov	dword284,[ebp-324]
	mov	dword286,[ebp-320]
	fld	dword ptr [dword284+8]
	fsub	dword ptr [dword286+8]
	mov	dword288,[ebp-328]
	fstp	dword ptr [dword288+8]
	mov	dword290,[ebp-324]
	mov	dword292,[ebp-320]
	fld	dword ptr [dword290+12]
	fsub	dword ptr [dword292+12]
	mov	dword294,[ebp-328]
	fstp	dword ptr [dword294+12]
label000e:
; end of inline function vec4f_subtract
	mov	dword331,[ebp-200]
	mov	[ebp-332],dword331
	lea	dword87,[ebp-236]
	mov	[ebp-336],dword87
; start of inline function vec4f_dot
	mov	dword334,[ebp-336]
	mov	dword336,[ebp-332]
	fld	dword ptr [dword334+4]
	fmul	dword ptr [dword336+4]
	mov	dword338,[ebp-336]
	mov	dword340,[ebp-332]
	fld	dword ptr [dword338]
	fmul	dword ptr [dword340]
	faddp
	mov	dword342,[ebp-336]
	mov	dword344,[ebp-332]
	fld	dword ptr [dword342+8]
	fmul	dword ptr [dword344+8]
	faddp
	mov	dword346,[ebp-336]
	mov	dword348,[ebp-332]
	fld	dword ptr [dword346+12]
	fmul	dword ptr [dword348+12]
	faddp
	fstp	dword ptr [ebp-340]
label0011:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	dword349,[ebp-200]
	mov	[ebp-332],dword349
	lea	dword89,[ebp-252]
	mov	[ebp-336],dword89
; start of inline function vec4f_dot
	mov	dword352,[ebp-336]
	mov	dword354,[ebp-332]
	fld	dword ptr [dword352+4]
	fmul	dword ptr [dword354+4]
	mov	dword356,[ebp-336]
	mov	dword358,[ebp-332]
	fld	dword ptr [dword356]
	fmul	dword ptr [dword358]
	faddp
	mov	dword360,[ebp-336]
	mov	dword362,[ebp-332]
	fld	dword ptr [dword360+8]
	fmul	dword ptr [dword362+8]
	faddp
	mov	dword364,[ebp-336]
	mov	dword366,[ebp-332]
	fld	dword ptr [dword364+12]
	fmul	dword ptr [dword366+12]
	faddp
	fstp	dword ptr [ebp-340]
label0012:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	dword367,[ebp-272]
	mov	[ebp-344],dword367
	lea	dword92,[ebp-252]
	mov	[ebp-348],dword92
; start of inline function vec4f_mul
	mov	dword370,[ebp-348]
	fld	dword ptr [dword370]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword370]
	mov	dword373,[ebp-348]
	fld	dword ptr [dword373+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword373+4]
	mov	dword376,[ebp-348]
	fld	dword ptr [dword376+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword376+8]
	mov	dword379,[ebp-348]
	fld	dword ptr [dword379+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword379+12]
label0013:
; end of inline function vec4f_mul
	lea	dword93,[ebp-252]
	mov	[ebp-308],dword93
	mov	dword95,[ebp-216]
	mov	[ebp-312],dword95
	mov	dword97,[ebp-212]
	mov	dword99,[dword97+192]
	imul	dword99,24
	mov	dword101,[ebp-212]
	add	dword101,dword99
	mov	[ebp-316],dword101
; start of inline function vec4f_add
	mov	dword169,[ebp-312]
	mov	dword171,[ebp-308]
	fld	dword ptr [dword169]
	fadd	dword ptr [dword171]
	mov	dword173,[ebp-316]
	fstp	dword ptr [dword173]
	mov	dword175,[ebp-312]
	mov	dword177,[ebp-308]
	fld	dword ptr [dword175+4]
	fadd	dword ptr [dword177+4]
	mov	dword179,[ebp-316]
	fstp	dword ptr [dword179+4]
	mov	dword181,[ebp-312]
	mov	dword183,[ebp-308]
	fld	dword ptr [dword181+8]
	fadd	dword ptr [dword183+8]
	mov	dword185,[ebp-316]
	fstp	dword ptr [dword185+8]
	mov	dword187,[ebp-312]
	mov	dword189,[ebp-308]
	fld	dword ptr [dword187+12]
	fadd	dword ptr [dword189+12]
	mov	dword191,[ebp-316]
	fstp	dword ptr [dword191+12]
label000a:
; end of inline function vec4f_add
	mov	dword103,16
	add	dword103,[ebp-216]
	mov	[ebp-288],dword103
	mov	dword105,16
	add	dword105,[ebp-220]
	mov	[ebp-292],dword105
	lea	dword106,[ebp-260]
	mov	[ebp-296],dword106
; start of inline function vec2f_subtract
	mov	dword148,[ebp-292]
	mov	dword150,[ebp-288]
	fld	dword ptr [dword148]
	fsub	dword ptr [dword150]
	mov	dword152,[ebp-296]
	fstp	dword ptr [dword152]
	mov	dword154,[ebp-292]
	mov	dword156,[ebp-288]
	fld	dword ptr [dword154+4]
	fsub	dword ptr [dword156+4]
	mov	dword158,[ebp-296]
	fstp	dword ptr [dword158+4]
label0008:
; end of inline function vec2f_subtract
	mov	dword159,[ebp-272]
	mov	[ebp-300],dword159
	lea	dword108,[ebp-260]
	mov	[ebp-304],dword108
; start of inline function vec2f_mul
	mov	dword162,[ebp-304]
	fld	dword ptr [dword162]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword162]
	mov	dword165,[ebp-304]
	fld	dword ptr [dword165+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword165+4]
label0009:
; end of inline function vec2f_mul
	lea	dword109,[ebp-260]
	mov	[ebp-276],dword109
	mov	dword111,16
	add	dword111,[ebp-216]
	mov	[ebp-280],dword111
	mov	dword113,[ebp-212]
	mov	dword115,[dword113+192]
	imul	dword115,24
	mov	dword117,[ebp-212]
	add	dword117,dword115
	add	dword117,16
	mov	[ebp-284],dword117
; start of inline function vec2f_add
	mov	dword135,[ebp-280]
	mov	dword137,[ebp-276]
	fld	dword ptr [dword135]
	fadd	dword ptr [dword137]
	mov	dword139,[ebp-284]
	fstp	dword ptr [dword139]
	mov	dword141,[ebp-280]
	mov	dword143,[ebp-276]
	fld	dword ptr [dword141+4]
	fadd	dword ptr [dword143+4]
	mov	dword145,[ebp-284]
	fstp	dword ptr [dword145+4]
label0007:
; end of inline function vec2f_add
	mov	dword120,[ebp-212]
	inc	dword ptr [dword120+192]
label0004:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label0001
label0002:
	mov	dword124,[ebp-212]
	mov	dword125,[dword124+192]
	inc	dword ptr [dword124+192]
	imul	dword125,24
	mov	dword128,[ebp-212]
	add	dword128,dword125
	mov	dword130,[ebp-212]
	mov	dword131,[dword130]
	mov	dword132,[dword130+4]
	mov	[dword128],dword131
	mov	[dword128+4],dword132
	mov	dword131,[dword130+8]
	mov	dword132,[dword130+12]
	mov	[dword128+8],dword131
	mov	[dword128+12],dword132
	mov	dword131,[dword130+16]
	mov	dword132,[dword130+20]
	mov	[dword128+16],dword131
	mov	[dword128+20],dword132
label0014:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_z_near_norm)
	mov	[ebp-204],(offset __clip_z_near_base)
	lea	dword7,[ebp-196]
	mov	[ebp-208],dword7
	mov	[ebp-212],dword2141
; start of inline function _clip_on_plain
	mov	dword384,[ebp-212]
	mov	dword ptr [dword384+192],0
	mov	dword387,[ebp-208]
	mov	[ebp-216],dword387
	mov	dword390,[ebp-208]
	add	dword390,24
	mov	[ebp-220],dword390
label0015:
label0016:
	mov	dword394,[ebp-208]
	mov	dword396,[dword394+192]
	imul	dword396,24
	mov	dword398,[ebp-208]
	add	dword398,dword396
	cmp	dword398,[ebp-220]
	jle	label0017
	mov	dword544,[ebp-204]
	mov	[ebp-320],dword544
	mov	dword402,[ebp-216]
	mov	[ebp-324],dword402
	lea	dword403,[ebp-236]
	mov	[ebp-328],dword403
; start of inline function vec4f_subtract
	mov	dword547,[ebp-324]
	mov	dword549,[ebp-320]
	fld	dword ptr [dword547]
	fsub	dword ptr [dword549]
	mov	dword551,[ebp-328]
	fstp	dword ptr [dword551]
	mov	dword553,[ebp-324]
	mov	dword555,[ebp-320]
	fld	dword ptr [dword553+4]
	fsub	dword ptr [dword555+4]
	mov	dword557,[ebp-328]
	fstp	dword ptr [dword557+4]
	mov	dword559,[ebp-324]
	mov	dword561,[ebp-320]
	fld	dword ptr [dword559+8]
	fsub	dword ptr [dword561+8]
	mov	dword563,[ebp-328]
	fstp	dword ptr [dword563+8]
	mov	dword565,[ebp-324]
	mov	dword567,[ebp-320]
	fld	dword ptr [dword565+12]
	fsub	dword ptr [dword567+12]
	mov	dword569,[ebp-328]
	fstp	dword ptr [dword569+12]
label0020:
; end of inline function vec4f_subtract
	mov	dword647,[ebp-200]
	mov	[ebp-332],dword647
	lea	dword405,[ebp-236]
	mov	[ebp-336],dword405
; start of inline function vec4f_dot
	mov	dword650,[ebp-336]
	mov	dword652,[ebp-332]
	fld	dword ptr [dword650+4]
	fmul	dword ptr [dword652+4]
	mov	dword654,[ebp-336]
	mov	dword656,[ebp-332]
	fld	dword ptr [dword654]
	fmul	dword ptr [dword656]
	faddp
	mov	dword658,[ebp-336]
	mov	dword660,[ebp-332]
	fld	dword ptr [dword658+8]
	fmul	dword ptr [dword660+8]
	faddp
	mov	dword662,[ebp-336]
	mov	dword664,[ebp-332]
	fld	dword ptr [dword662+12]
	fmul	dword ptr [dword664+12]
	faddp
	fstp	dword ptr [ebp-340]
label0024:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	dword570,[ebp-204]
	mov	[ebp-320],dword570
	mov	dword409,[ebp-220]
	mov	[ebp-324],dword409
	lea	dword410,[ebp-236]
	mov	[ebp-328],dword410
; start of inline function vec4f_subtract
	mov	dword573,[ebp-324]
	mov	dword575,[ebp-320]
	fld	dword ptr [dword573]
	fsub	dword ptr [dword575]
	mov	dword577,[ebp-328]
	fstp	dword ptr [dword577]
	mov	dword579,[ebp-324]
	mov	dword581,[ebp-320]
	fld	dword ptr [dword579+4]
	fsub	dword ptr [dword581+4]
	mov	dword583,[ebp-328]
	fstp	dword ptr [dword583+4]
	mov	dword585,[ebp-324]
	mov	dword587,[ebp-320]
	fld	dword ptr [dword585+8]
	fsub	dword ptr [dword587+8]
	mov	dword589,[ebp-328]
	fstp	dword ptr [dword589+8]
	mov	dword591,[ebp-324]
	mov	dword593,[ebp-320]
	fld	dword ptr [dword591+12]
	fsub	dword ptr [dword593+12]
	mov	dword595,[ebp-328]
	fstp	dword ptr [dword595+12]
label0021:
; end of inline function vec4f_subtract
	mov	dword665,[ebp-200]
	mov	[ebp-332],dword665
	lea	dword412,[ebp-236]
	mov	[ebp-336],dword412
; start of inline function vec4f_dot
	mov	dword668,[ebp-336]
	mov	dword670,[ebp-332]
	fld	dword ptr [dword668+4]
	fmul	dword ptr [dword670+4]
	mov	dword672,[ebp-336]
	mov	dword674,[ebp-332]
	fld	dword ptr [dword672]
	fmul	dword ptr [dword674]
	faddp
	mov	dword676,[ebp-336]
	mov	dword678,[ebp-332]
	fld	dword ptr [dword676+8]
	fmul	dword ptr [dword678+8]
	faddp
	mov	dword680,[ebp-336]
	mov	dword682,[ebp-332]
	fld	dword ptr [dword680+12]
	fmul	dword ptr [dword682+12]
	faddp
	fstp	dword ptr [ebp-340]
label0025:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-268]
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jb	label0018
	mov	dword416,[ebp-212]
	mov	dword417,[dword416+192]
	inc	dword ptr [dword416+192]
	imul	dword417,24
	mov	dword420,[ebp-212]
	add	dword420,dword417
	mov	dword422,[ebp-216]
	mov	dword423,[dword422]
	mov	dword424,[dword422+4]
	mov	[dword420],dword423
	mov	[dword420+4],dword424
	mov	dword423,[dword422+8]
	mov	dword424,[dword422+12]
	mov	[dword420+8],dword423
	mov	[dword420+12],dword424
	mov	dword423,[dword422+16]
	mov	dword424,[dword422+20]
	mov	[dword420+16],dword423
	mov	[dword420+20],dword424
label0018:
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jbe	label001b
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label001a
label001b:
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label0019
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jae	label0019
label001a:
	mov	dword430,[ebp-216]
	mov	[ebp-320],dword430
	mov	dword596,[ebp-204]
	mov	[ebp-324],dword596
	lea	dword432,[ebp-236]
	mov	[ebp-328],dword432
; start of inline function vec4f_subtract
	mov	dword599,[ebp-324]
	mov	dword601,[ebp-320]
	fld	dword ptr [dword599]
	fsub	dword ptr [dword601]
	mov	dword603,[ebp-328]
	fstp	dword ptr [dword603]
	mov	dword605,[ebp-324]
	mov	dword607,[ebp-320]
	fld	dword ptr [dword605+4]
	fsub	dword ptr [dword607+4]
	mov	dword609,[ebp-328]
	fstp	dword ptr [dword609+4]
	mov	dword611,[ebp-324]
	mov	dword613,[ebp-320]
	fld	dword ptr [dword611+8]
	fsub	dword ptr [dword613+8]
	mov	dword615,[ebp-328]
	fstp	dword ptr [dword615+8]
	mov	dword617,[ebp-324]
	mov	dword619,[ebp-320]
	fld	dword ptr [dword617+12]
	fsub	dword ptr [dword619+12]
	mov	dword621,[ebp-328]
	fstp	dword ptr [dword621+12]
label0022:
; end of inline function vec4f_subtract
	mov	dword434,[ebp-216]
	mov	[ebp-320],dword434
	mov	dword436,[ebp-220]
	mov	[ebp-324],dword436
	lea	dword437,[ebp-252]
	mov	[ebp-328],dword437
; start of inline function vec4f_subtract
	mov	dword624,[ebp-324]
	mov	dword626,[ebp-320]
	fld	dword ptr [dword624]
	fsub	dword ptr [dword626]
	mov	dword628,[ebp-328]
	fstp	dword ptr [dword628]
	mov	dword630,[ebp-324]
	mov	dword632,[ebp-320]
	fld	dword ptr [dword630+4]
	fsub	dword ptr [dword632+4]
	mov	dword634,[ebp-328]
	fstp	dword ptr [dword634+4]
	mov	dword636,[ebp-324]
	mov	dword638,[ebp-320]
	fld	dword ptr [dword636+8]
	fsub	dword ptr [dword638+8]
	mov	dword640,[ebp-328]
	fstp	dword ptr [dword640+8]
	mov	dword642,[ebp-324]
	mov	dword644,[ebp-320]
	fld	dword ptr [dword642+12]
	fsub	dword ptr [dword644+12]
	mov	dword646,[ebp-328]
	fstp	dword ptr [dword646+12]
label0023:
; end of inline function vec4f_subtract
	mov	dword683,[ebp-200]
	mov	[ebp-332],dword683
	lea	dword439,[ebp-236]
	mov	[ebp-336],dword439
; start of inline function vec4f_dot
	mov	dword686,[ebp-336]
	mov	dword688,[ebp-332]
	fld	dword ptr [dword686+4]
	fmul	dword ptr [dword688+4]
	mov	dword690,[ebp-336]
	mov	dword692,[ebp-332]
	fld	dword ptr [dword690]
	fmul	dword ptr [dword692]
	faddp
	mov	dword694,[ebp-336]
	mov	dword696,[ebp-332]
	fld	dword ptr [dword694+8]
	fmul	dword ptr [dword696+8]
	faddp
	mov	dword698,[ebp-336]
	mov	dword700,[ebp-332]
	fld	dword ptr [dword698+12]
	fmul	dword ptr [dword700+12]
	faddp
	fstp	dword ptr [ebp-340]
label0026:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	dword701,[ebp-200]
	mov	[ebp-332],dword701
	lea	dword441,[ebp-252]
	mov	[ebp-336],dword441
; start of inline function vec4f_dot
	mov	dword704,[ebp-336]
	mov	dword706,[ebp-332]
	fld	dword ptr [dword704+4]
	fmul	dword ptr [dword706+4]
	mov	dword708,[ebp-336]
	mov	dword710,[ebp-332]
	fld	dword ptr [dword708]
	fmul	dword ptr [dword710]
	faddp
	mov	dword712,[ebp-336]
	mov	dword714,[ebp-332]
	fld	dword ptr [dword712+8]
	fmul	dword ptr [dword714+8]
	faddp
	mov	dword716,[ebp-336]
	mov	dword718,[ebp-332]
	fld	dword ptr [dword716+12]
	fmul	dword ptr [dword718+12]
	faddp
	fstp	dword ptr [ebp-340]
label0027:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	dword719,[ebp-272]
	mov	[ebp-344],dword719
	lea	dword444,[ebp-252]
	mov	[ebp-348],dword444
; start of inline function vec4f_mul
	mov	dword722,[ebp-348]
	fld	dword ptr [dword722]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword722]
	mov	dword725,[ebp-348]
	fld	dword ptr [dword725+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword725+4]
	mov	dword728,[ebp-348]
	fld	dword ptr [dword728+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword728+8]
	mov	dword731,[ebp-348]
	fld	dword ptr [dword731+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword731+12]
label0028:
; end of inline function vec4f_mul
	lea	dword445,[ebp-252]
	mov	[ebp-308],dword445
	mov	dword447,[ebp-216]
	mov	[ebp-312],dword447
	mov	dword449,[ebp-212]
	mov	dword451,[dword449+192]
	imul	dword451,24
	mov	dword453,[ebp-212]
	add	dword453,dword451
	mov	[ebp-316],dword453
; start of inline function vec4f_add
	mov	dword521,[ebp-312]
	mov	dword523,[ebp-308]
	fld	dword ptr [dword521]
	fadd	dword ptr [dword523]
	mov	dword525,[ebp-316]
	fstp	dword ptr [dword525]
	mov	dword527,[ebp-312]
	mov	dword529,[ebp-308]
	fld	dword ptr [dword527+4]
	fadd	dword ptr [dword529+4]
	mov	dword531,[ebp-316]
	fstp	dword ptr [dword531+4]
	mov	dword533,[ebp-312]
	mov	dword535,[ebp-308]
	fld	dword ptr [dword533+8]
	fadd	dword ptr [dword535+8]
	mov	dword537,[ebp-316]
	fstp	dword ptr [dword537+8]
	mov	dword539,[ebp-312]
	mov	dword541,[ebp-308]
	fld	dword ptr [dword539+12]
	fadd	dword ptr [dword541+12]
	mov	dword543,[ebp-316]
	fstp	dword ptr [dword543+12]
label001f:
; end of inline function vec4f_add
	mov	dword455,16
	add	dword455,[ebp-216]
	mov	[ebp-288],dword455
	mov	dword457,16
	add	dword457,[ebp-220]
	mov	[ebp-292],dword457
	lea	dword458,[ebp-260]
	mov	[ebp-296],dword458
; start of inline function vec2f_subtract
	mov	dword500,[ebp-292]
	mov	dword502,[ebp-288]
	fld	dword ptr [dword500]
	fsub	dword ptr [dword502]
	mov	dword504,[ebp-296]
	fstp	dword ptr [dword504]
	mov	dword506,[ebp-292]
	mov	dword508,[ebp-288]
	fld	dword ptr [dword506+4]
	fsub	dword ptr [dword508+4]
	mov	dword510,[ebp-296]
	fstp	dword ptr [dword510+4]
label001d:
; end of inline function vec2f_subtract
	mov	dword511,[ebp-272]
	mov	[ebp-300],dword511
	lea	dword460,[ebp-260]
	mov	[ebp-304],dword460
; start of inline function vec2f_mul
	mov	dword514,[ebp-304]
	fld	dword ptr [dword514]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword514]
	mov	dword517,[ebp-304]
	fld	dword ptr [dword517+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword517+4]
label001e:
; end of inline function vec2f_mul
	lea	dword461,[ebp-260]
	mov	[ebp-276],dword461
	mov	dword463,16
	add	dword463,[ebp-216]
	mov	[ebp-280],dword463
	mov	dword465,[ebp-212]
	mov	dword467,[dword465+192]
	imul	dword467,24
	mov	dword469,[ebp-212]
	add	dword469,dword467
	add	dword469,16
	mov	[ebp-284],dword469
; start of inline function vec2f_add
	mov	dword487,[ebp-280]
	mov	dword489,[ebp-276]
	fld	dword ptr [dword487]
	fadd	dword ptr [dword489]
	mov	dword491,[ebp-284]
	fstp	dword ptr [dword491]
	mov	dword493,[ebp-280]
	mov	dword495,[ebp-276]
	fld	dword ptr [dword493+4]
	fadd	dword ptr [dword495+4]
	mov	dword497,[ebp-284]
	fstp	dword ptr [dword497+4]
label001c:
; end of inline function vec2f_add
	mov	dword472,[ebp-212]
	inc	dword ptr [dword472+192]
label0019:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label0016
label0017:
	mov	dword476,[ebp-212]
	mov	dword477,[dword476+192]
	inc	dword ptr [dword476+192]
	imul	dword477,24
	mov	dword480,[ebp-212]
	add	dword480,dword477
	mov	dword482,[ebp-212]
	mov	dword483,[dword482]
	mov	dword484,[dword482+4]
	mov	[dword480],dword483
	mov	[dword480+4],dword484
	mov	dword483,[dword482+8]
	mov	dword484,[dword482+12]
	mov	[dword480+8],dword483
	mov	[dword480+12],dword484
	mov	dword483,[dword482+16]
	mov	dword484,[dword482+20]
	mov	[dword480+16],dword483
	mov	[dword480+20],dword484
label0029:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_plane_left_norm)
	mov	[ebp-204],(offset __clip_plane_left_base)
	mov	[ebp-208],dword2141
	lea	dword12,[ebp-196]
	mov	[ebp-212],dword12
; start of inline function _clip_on_plain
	mov	dword736,[ebp-212]
	mov	dword ptr [dword736+192],0
	mov	dword739,[ebp-208]
	mov	[ebp-216],dword739
	mov	dword742,[ebp-208]
	add	dword742,24
	mov	[ebp-220],dword742
label002a:
label002b:
	mov	dword746,[ebp-208]
	mov	dword748,[dword746+192]
	imul	dword748,24
	mov	dword750,[ebp-208]
	add	dword750,dword748
	cmp	dword750,[ebp-220]
	jle	label002c
	mov	dword896,[ebp-204]
	mov	[ebp-320],dword896
	mov	dword754,[ebp-216]
	mov	[ebp-324],dword754
	lea	dword755,[ebp-236]
	mov	[ebp-328],dword755
; start of inline function vec4f_subtract
	mov	dword899,[ebp-324]
	mov	dword901,[ebp-320]
	fld	dword ptr [dword899]
	fsub	dword ptr [dword901]
	mov	dword903,[ebp-328]
	fstp	dword ptr [dword903]
	mov	dword905,[ebp-324]
	mov	dword907,[ebp-320]
	fld	dword ptr [dword905+4]
	fsub	dword ptr [dword907+4]
	mov	dword909,[ebp-328]
	fstp	dword ptr [dword909+4]
	mov	dword911,[ebp-324]
	mov	dword913,[ebp-320]
	fld	dword ptr [dword911+8]
	fsub	dword ptr [dword913+8]
	mov	dword915,[ebp-328]
	fstp	dword ptr [dword915+8]
	mov	dword917,[ebp-324]
	mov	dword919,[ebp-320]
	fld	dword ptr [dword917+12]
	fsub	dword ptr [dword919+12]
	mov	dword921,[ebp-328]
	fstp	dword ptr [dword921+12]
label0035:
; end of inline function vec4f_subtract
	mov	dword999,[ebp-200]
	mov	[ebp-332],dword999
	lea	dword757,[ebp-236]
	mov	[ebp-336],dword757
; start of inline function vec4f_dot
	mov	dword1002,[ebp-336]
	mov	dword1004,[ebp-332]
	fld	dword ptr [dword1002+4]
	fmul	dword ptr [dword1004+4]
	mov	dword1006,[ebp-336]
	mov	dword1008,[ebp-332]
	fld	dword ptr [dword1006]
	fmul	dword ptr [dword1008]
	faddp
	mov	dword1010,[ebp-336]
	mov	dword1012,[ebp-332]
	fld	dword ptr [dword1010+8]
	fmul	dword ptr [dword1012+8]
	faddp
	mov	dword1014,[ebp-336]
	mov	dword1016,[ebp-332]
	fld	dword ptr [dword1014+12]
	fmul	dword ptr [dword1016+12]
	faddp
	fstp	dword ptr [ebp-340]
label0039:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	dword922,[ebp-204]
	mov	[ebp-320],dword922
	mov	dword761,[ebp-220]
	mov	[ebp-324],dword761
	lea	dword762,[ebp-236]
	mov	[ebp-328],dword762
; start of inline function vec4f_subtract
	mov	dword925,[ebp-324]
	mov	dword927,[ebp-320]
	fld	dword ptr [dword925]
	fsub	dword ptr [dword927]
	mov	dword929,[ebp-328]
	fstp	dword ptr [dword929]
	mov	dword931,[ebp-324]
	mov	dword933,[ebp-320]
	fld	dword ptr [dword931+4]
	fsub	dword ptr [dword933+4]
	mov	dword935,[ebp-328]
	fstp	dword ptr [dword935+4]
	mov	dword937,[ebp-324]
	mov	dword939,[ebp-320]
	fld	dword ptr [dword937+8]
	fsub	dword ptr [dword939+8]
	mov	dword941,[ebp-328]
	fstp	dword ptr [dword941+8]
	mov	dword943,[ebp-324]
	mov	dword945,[ebp-320]
	fld	dword ptr [dword943+12]
	fsub	dword ptr [dword945+12]
	mov	dword947,[ebp-328]
	fstp	dword ptr [dword947+12]
label0036:
; end of inline function vec4f_subtract
	mov	dword1017,[ebp-200]
	mov	[ebp-332],dword1017
	lea	dword764,[ebp-236]
	mov	[ebp-336],dword764
; start of inline function vec4f_dot
	mov	dword1020,[ebp-336]
	mov	dword1022,[ebp-332]
	fld	dword ptr [dword1020+4]
	fmul	dword ptr [dword1022+4]
	mov	dword1024,[ebp-336]
	mov	dword1026,[ebp-332]
	fld	dword ptr [dword1024]
	fmul	dword ptr [dword1026]
	faddp
	mov	dword1028,[ebp-336]
	mov	dword1030,[ebp-332]
	fld	dword ptr [dword1028+8]
	fmul	dword ptr [dword1030+8]
	faddp
	mov	dword1032,[ebp-336]
	mov	dword1034,[ebp-332]
	fld	dword ptr [dword1032+12]
	fmul	dword ptr [dword1034+12]
	faddp
	fstp	dword ptr [ebp-340]
label003a:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-268]
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jb	label002d
	mov	dword768,[ebp-212]
	mov	dword769,[dword768+192]
	inc	dword ptr [dword768+192]
	imul	dword769,24
	mov	dword772,[ebp-212]
	add	dword772,dword769
	mov	dword774,[ebp-216]
	mov	dword775,[dword774]
	mov	dword776,[dword774+4]
	mov	[dword772],dword775
	mov	[dword772+4],dword776
	mov	dword775,[dword774+8]
	mov	dword776,[dword774+12]
	mov	[dword772+8],dword775
	mov	[dword772+12],dword776
	mov	dword775,[dword774+16]
	mov	dword776,[dword774+20]
	mov	[dword772+16],dword775
	mov	[dword772+20],dword776
label002d:
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jbe	label0030
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label002f
label0030:
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label002e
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jae	label002e
label002f:
	mov	dword782,[ebp-216]
	mov	[ebp-320],dword782
	mov	dword948,[ebp-204]
	mov	[ebp-324],dword948
	lea	dword784,[ebp-236]
	mov	[ebp-328],dword784
; start of inline function vec4f_subtract
	mov	dword951,[ebp-324]
	mov	dword953,[ebp-320]
	fld	dword ptr [dword951]
	fsub	dword ptr [dword953]
	mov	dword955,[ebp-328]
	fstp	dword ptr [dword955]
	mov	dword957,[ebp-324]
	mov	dword959,[ebp-320]
	fld	dword ptr [dword957+4]
	fsub	dword ptr [dword959+4]
	mov	dword961,[ebp-328]
	fstp	dword ptr [dword961+4]
	mov	dword963,[ebp-324]
	mov	dword965,[ebp-320]
	fld	dword ptr [dword963+8]
	fsub	dword ptr [dword965+8]
	mov	dword967,[ebp-328]
	fstp	dword ptr [dword967+8]
	mov	dword969,[ebp-324]
	mov	dword971,[ebp-320]
	fld	dword ptr [dword969+12]
	fsub	dword ptr [dword971+12]
	mov	dword973,[ebp-328]
	fstp	dword ptr [dword973+12]
label0037:
; end of inline function vec4f_subtract
	mov	dword786,[ebp-216]
	mov	[ebp-320],dword786
	mov	dword788,[ebp-220]
	mov	[ebp-324],dword788
	lea	dword789,[ebp-252]
	mov	[ebp-328],dword789
; start of inline function vec4f_subtract
	mov	dword976,[ebp-324]
	mov	dword978,[ebp-320]
	fld	dword ptr [dword976]
	fsub	dword ptr [dword978]
	mov	dword980,[ebp-328]
	fstp	dword ptr [dword980]
	mov	dword982,[ebp-324]
	mov	dword984,[ebp-320]
	fld	dword ptr [dword982+4]
	fsub	dword ptr [dword984+4]
	mov	dword986,[ebp-328]
	fstp	dword ptr [dword986+4]
	mov	dword988,[ebp-324]
	mov	dword990,[ebp-320]
	fld	dword ptr [dword988+8]
	fsub	dword ptr [dword990+8]
	mov	dword992,[ebp-328]
	fstp	dword ptr [dword992+8]
	mov	dword994,[ebp-324]
	mov	dword996,[ebp-320]
	fld	dword ptr [dword994+12]
	fsub	dword ptr [dword996+12]
	mov	dword998,[ebp-328]
	fstp	dword ptr [dword998+12]
label0038:
; end of inline function vec4f_subtract
	mov	dword1035,[ebp-200]
	mov	[ebp-332],dword1035
	lea	dword791,[ebp-236]
	mov	[ebp-336],dword791
; start of inline function vec4f_dot
	mov	dword1038,[ebp-336]
	mov	dword1040,[ebp-332]
	fld	dword ptr [dword1038+4]
	fmul	dword ptr [dword1040+4]
	mov	dword1042,[ebp-336]
	mov	dword1044,[ebp-332]
	fld	dword ptr [dword1042]
	fmul	dword ptr [dword1044]
	faddp
	mov	dword1046,[ebp-336]
	mov	dword1048,[ebp-332]
	fld	dword ptr [dword1046+8]
	fmul	dword ptr [dword1048+8]
	faddp
	mov	dword1050,[ebp-336]
	mov	dword1052,[ebp-332]
	fld	dword ptr [dword1050+12]
	fmul	dword ptr [dword1052+12]
	faddp
	fstp	dword ptr [ebp-340]
label003b:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	dword1053,[ebp-200]
	mov	[ebp-332],dword1053
	lea	dword793,[ebp-252]
	mov	[ebp-336],dword793
; start of inline function vec4f_dot
	mov	dword1056,[ebp-336]
	mov	dword1058,[ebp-332]
	fld	dword ptr [dword1056+4]
	fmul	dword ptr [dword1058+4]
	mov	dword1060,[ebp-336]
	mov	dword1062,[ebp-332]
	fld	dword ptr [dword1060]
	fmul	dword ptr [dword1062]
	faddp
	mov	dword1064,[ebp-336]
	mov	dword1066,[ebp-332]
	fld	dword ptr [dword1064+8]
	fmul	dword ptr [dword1066+8]
	faddp
	mov	dword1068,[ebp-336]
	mov	dword1070,[ebp-332]
	fld	dword ptr [dword1068+12]
	fmul	dword ptr [dword1070+12]
	faddp
	fstp	dword ptr [ebp-340]
label003c:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	dword1071,[ebp-272]
	mov	[ebp-344],dword1071
	lea	dword796,[ebp-252]
	mov	[ebp-348],dword796
; start of inline function vec4f_mul
	mov	dword1074,[ebp-348]
	fld	dword ptr [dword1074]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1074]
	mov	dword1077,[ebp-348]
	fld	dword ptr [dword1077+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1077+4]
	mov	dword1080,[ebp-348]
	fld	dword ptr [dword1080+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1080+8]
	mov	dword1083,[ebp-348]
	fld	dword ptr [dword1083+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1083+12]
label003d:
; end of inline function vec4f_mul
	lea	dword797,[ebp-252]
	mov	[ebp-308],dword797
	mov	dword799,[ebp-216]
	mov	[ebp-312],dword799
	mov	dword801,[ebp-212]
	mov	dword803,[dword801+192]
	imul	dword803,24
	mov	dword805,[ebp-212]
	add	dword805,dword803
	mov	[ebp-316],dword805
; start of inline function vec4f_add
	mov	dword873,[ebp-312]
	mov	dword875,[ebp-308]
	fld	dword ptr [dword873]
	fadd	dword ptr [dword875]
	mov	dword877,[ebp-316]
	fstp	dword ptr [dword877]
	mov	dword879,[ebp-312]
	mov	dword881,[ebp-308]
	fld	dword ptr [dword879+4]
	fadd	dword ptr [dword881+4]
	mov	dword883,[ebp-316]
	fstp	dword ptr [dword883+4]
	mov	dword885,[ebp-312]
	mov	dword887,[ebp-308]
	fld	dword ptr [dword885+8]
	fadd	dword ptr [dword887+8]
	mov	dword889,[ebp-316]
	fstp	dword ptr [dword889+8]
	mov	dword891,[ebp-312]
	mov	dword893,[ebp-308]
	fld	dword ptr [dword891+12]
	fadd	dword ptr [dword893+12]
	mov	dword895,[ebp-316]
	fstp	dword ptr [dword895+12]
label0034:
; end of inline function vec4f_add
	mov	dword807,16
	add	dword807,[ebp-216]
	mov	[ebp-288],dword807
	mov	dword809,16
	add	dword809,[ebp-220]
	mov	[ebp-292],dword809
	lea	dword810,[ebp-260]
	mov	[ebp-296],dword810
; start of inline function vec2f_subtract
	mov	dword852,[ebp-292]
	mov	dword854,[ebp-288]
	fld	dword ptr [dword852]
	fsub	dword ptr [dword854]
	mov	dword856,[ebp-296]
	fstp	dword ptr [dword856]
	mov	dword858,[ebp-292]
	mov	dword860,[ebp-288]
	fld	dword ptr [dword858+4]
	fsub	dword ptr [dword860+4]
	mov	dword862,[ebp-296]
	fstp	dword ptr [dword862+4]
label0032:
; end of inline function vec2f_subtract
	mov	dword863,[ebp-272]
	mov	[ebp-300],dword863
	lea	dword812,[ebp-260]
	mov	[ebp-304],dword812
; start of inline function vec2f_mul
	mov	dword866,[ebp-304]
	fld	dword ptr [dword866]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword866]
	mov	dword869,[ebp-304]
	fld	dword ptr [dword869+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword869+4]
label0033:
; end of inline function vec2f_mul
	lea	dword813,[ebp-260]
	mov	[ebp-276],dword813
	mov	dword815,16
	add	dword815,[ebp-216]
	mov	[ebp-280],dword815
	mov	dword817,[ebp-212]
	mov	dword819,[dword817+192]
	imul	dword819,24
	mov	dword821,[ebp-212]
	add	dword821,dword819
	add	dword821,16
	mov	[ebp-284],dword821
; start of inline function vec2f_add
	mov	dword839,[ebp-280]
	mov	dword841,[ebp-276]
	fld	dword ptr [dword839]
	fadd	dword ptr [dword841]
	mov	dword843,[ebp-284]
	fstp	dword ptr [dword843]
	mov	dword845,[ebp-280]
	mov	dword847,[ebp-276]
	fld	dword ptr [dword845+4]
	fadd	dword ptr [dword847+4]
	mov	dword849,[ebp-284]
	fstp	dword ptr [dword849+4]
label0031:
; end of inline function vec2f_add
	mov	dword824,[ebp-212]
	inc	dword ptr [dword824+192]
label002e:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label002b
label002c:
	mov	dword828,[ebp-212]
	mov	dword829,[dword828+192]
	inc	dword ptr [dword828+192]
	imul	dword829,24
	mov	dword832,[ebp-212]
	add	dword832,dword829
	mov	dword834,[ebp-212]
	mov	dword835,[dword834]
	mov	dword836,[dword834+4]
	mov	[dword832],dword835
	mov	[dword832+4],dword836
	mov	dword835,[dword834+8]
	mov	dword836,[dword834+12]
	mov	[dword832+8],dword835
	mov	[dword832+12],dword836
	mov	dword835,[dword834+16]
	mov	dword836,[dword834+20]
	mov	[dword832+16],dword835
	mov	[dword832+20],dword836
label003e:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_plane_right_norm)
	mov	[ebp-204],(offset __clip_plane_right_base)
	lea	dword15,[ebp-196]
	mov	[ebp-208],dword15
	mov	[ebp-212],dword2141
; start of inline function _clip_on_plain
	mov	dword1088,[ebp-212]
	mov	dword ptr [dword1088+192],0
	mov	dword1091,[ebp-208]
	mov	[ebp-216],dword1091
	mov	dword1094,[ebp-208]
	add	dword1094,24
	mov	[ebp-220],dword1094
label003f:
label0040:
	mov	dword1098,[ebp-208]
	mov	dword1100,[dword1098+192]
	imul	dword1100,24
	mov	dword1102,[ebp-208]
	add	dword1102,dword1100
	cmp	dword1102,[ebp-220]
	jle	label0041
	mov	dword1248,[ebp-204]
	mov	[ebp-320],dword1248
	mov	dword1106,[ebp-216]
	mov	[ebp-324],dword1106
	lea	dword1107,[ebp-236]
	mov	[ebp-328],dword1107
; start of inline function vec4f_subtract
	mov	dword1251,[ebp-324]
	mov	dword1253,[ebp-320]
	fld	dword ptr [dword1251]
	fsub	dword ptr [dword1253]
	mov	dword1255,[ebp-328]
	fstp	dword ptr [dword1255]
	mov	dword1257,[ebp-324]
	mov	dword1259,[ebp-320]
	fld	dword ptr [dword1257+4]
	fsub	dword ptr [dword1259+4]
	mov	dword1261,[ebp-328]
	fstp	dword ptr [dword1261+4]
	mov	dword1263,[ebp-324]
	mov	dword1265,[ebp-320]
	fld	dword ptr [dword1263+8]
	fsub	dword ptr [dword1265+8]
	mov	dword1267,[ebp-328]
	fstp	dword ptr [dword1267+8]
	mov	dword1269,[ebp-324]
	mov	dword1271,[ebp-320]
	fld	dword ptr [dword1269+12]
	fsub	dword ptr [dword1271+12]
	mov	dword1273,[ebp-328]
	fstp	dword ptr [dword1273+12]
label004a:
; end of inline function vec4f_subtract
	mov	dword1351,[ebp-200]
	mov	[ebp-332],dword1351
	lea	dword1109,[ebp-236]
	mov	[ebp-336],dword1109
; start of inline function vec4f_dot
	mov	dword1354,[ebp-336]
	mov	dword1356,[ebp-332]
	fld	dword ptr [dword1354+4]
	fmul	dword ptr [dword1356+4]
	mov	dword1358,[ebp-336]
	mov	dword1360,[ebp-332]
	fld	dword ptr [dword1358]
	fmul	dword ptr [dword1360]
	faddp
	mov	dword1362,[ebp-336]
	mov	dword1364,[ebp-332]
	fld	dword ptr [dword1362+8]
	fmul	dword ptr [dword1364+8]
	faddp
	mov	dword1366,[ebp-336]
	mov	dword1368,[ebp-332]
	fld	dword ptr [dword1366+12]
	fmul	dword ptr [dword1368+12]
	faddp
	fstp	dword ptr [ebp-340]
label004e:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	dword1274,[ebp-204]
	mov	[ebp-320],dword1274
	mov	dword1113,[ebp-220]
	mov	[ebp-324],dword1113
	lea	dword1114,[ebp-236]
	mov	[ebp-328],dword1114
; start of inline function vec4f_subtract
	mov	dword1277,[ebp-324]
	mov	dword1279,[ebp-320]
	fld	dword ptr [dword1277]
	fsub	dword ptr [dword1279]
	mov	dword1281,[ebp-328]
	fstp	dword ptr [dword1281]
	mov	dword1283,[ebp-324]
	mov	dword1285,[ebp-320]
	fld	dword ptr [dword1283+4]
	fsub	dword ptr [dword1285+4]
	mov	dword1287,[ebp-328]
	fstp	dword ptr [dword1287+4]
	mov	dword1289,[ebp-324]
	mov	dword1291,[ebp-320]
	fld	dword ptr [dword1289+8]
	fsub	dword ptr [dword1291+8]
	mov	dword1293,[ebp-328]
	fstp	dword ptr [dword1293+8]
	mov	dword1295,[ebp-324]
	mov	dword1297,[ebp-320]
	fld	dword ptr [dword1295+12]
	fsub	dword ptr [dword1297+12]
	mov	dword1299,[ebp-328]
	fstp	dword ptr [dword1299+12]
label004b:
; end of inline function vec4f_subtract
	mov	dword1369,[ebp-200]
	mov	[ebp-332],dword1369
	lea	dword1116,[ebp-236]
	mov	[ebp-336],dword1116
; start of inline function vec4f_dot
	mov	dword1372,[ebp-336]
	mov	dword1374,[ebp-332]
	fld	dword ptr [dword1372+4]
	fmul	dword ptr [dword1374+4]
	mov	dword1376,[ebp-336]
	mov	dword1378,[ebp-332]
	fld	dword ptr [dword1376]
	fmul	dword ptr [dword1378]
	faddp
	mov	dword1380,[ebp-336]
	mov	dword1382,[ebp-332]
	fld	dword ptr [dword1380+8]
	fmul	dword ptr [dword1382+8]
	faddp
	mov	dword1384,[ebp-336]
	mov	dword1386,[ebp-332]
	fld	dword ptr [dword1384+12]
	fmul	dword ptr [dword1386+12]
	faddp
	fstp	dword ptr [ebp-340]
label004f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-268]
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jb	label0042
	mov	dword1120,[ebp-212]
	mov	dword1121,[dword1120+192]
	inc	dword ptr [dword1120+192]
	imul	dword1121,24
	mov	dword1124,[ebp-212]
	add	dword1124,dword1121
	mov	dword1126,[ebp-216]
	mov	dword1127,[dword1126]
	mov	dword1128,[dword1126+4]
	mov	[dword1124],dword1127
	mov	[dword1124+4],dword1128
	mov	dword1127,[dword1126+8]
	mov	dword1128,[dword1126+12]
	mov	[dword1124+8],dword1127
	mov	[dword1124+12],dword1128
	mov	dword1127,[dword1126+16]
	mov	dword1128,[dword1126+20]
	mov	[dword1124+16],dword1127
	mov	[dword1124+20],dword1128
label0042:
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jbe	label0045
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label0044
label0045:
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label0043
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jae	label0043
label0044:
	mov	dword1134,[ebp-216]
	mov	[ebp-320],dword1134
	mov	dword1300,[ebp-204]
	mov	[ebp-324],dword1300
	lea	dword1136,[ebp-236]
	mov	[ebp-328],dword1136
; start of inline function vec4f_subtract
	mov	dword1303,[ebp-324]
	mov	dword1305,[ebp-320]
	fld	dword ptr [dword1303]
	fsub	dword ptr [dword1305]
	mov	dword1307,[ebp-328]
	fstp	dword ptr [dword1307]
	mov	dword1309,[ebp-324]
	mov	dword1311,[ebp-320]
	fld	dword ptr [dword1309+4]
	fsub	dword ptr [dword1311+4]
	mov	dword1313,[ebp-328]
	fstp	dword ptr [dword1313+4]
	mov	dword1315,[ebp-324]
	mov	dword1317,[ebp-320]
	fld	dword ptr [dword1315+8]
	fsub	dword ptr [dword1317+8]
	mov	dword1319,[ebp-328]
	fstp	dword ptr [dword1319+8]
	mov	dword1321,[ebp-324]
	mov	dword1323,[ebp-320]
	fld	dword ptr [dword1321+12]
	fsub	dword ptr [dword1323+12]
	mov	dword1325,[ebp-328]
	fstp	dword ptr [dword1325+12]
label004c:
; end of inline function vec4f_subtract
	mov	dword1138,[ebp-216]
	mov	[ebp-320],dword1138
	mov	dword1140,[ebp-220]
	mov	[ebp-324],dword1140
	lea	dword1141,[ebp-252]
	mov	[ebp-328],dword1141
; start of inline function vec4f_subtract
	mov	dword1328,[ebp-324]
	mov	dword1330,[ebp-320]
	fld	dword ptr [dword1328]
	fsub	dword ptr [dword1330]
	mov	dword1332,[ebp-328]
	fstp	dword ptr [dword1332]
	mov	dword1334,[ebp-324]
	mov	dword1336,[ebp-320]
	fld	dword ptr [dword1334+4]
	fsub	dword ptr [dword1336+4]
	mov	dword1338,[ebp-328]
	fstp	dword ptr [dword1338+4]
	mov	dword1340,[ebp-324]
	mov	dword1342,[ebp-320]
	fld	dword ptr [dword1340+8]
	fsub	dword ptr [dword1342+8]
	mov	dword1344,[ebp-328]
	fstp	dword ptr [dword1344+8]
	mov	dword1346,[ebp-324]
	mov	dword1348,[ebp-320]
	fld	dword ptr [dword1346+12]
	fsub	dword ptr [dword1348+12]
	mov	dword1350,[ebp-328]
	fstp	dword ptr [dword1350+12]
label004d:
; end of inline function vec4f_subtract
	mov	dword1387,[ebp-200]
	mov	[ebp-332],dword1387
	lea	dword1143,[ebp-236]
	mov	[ebp-336],dword1143
; start of inline function vec4f_dot
	mov	dword1390,[ebp-336]
	mov	dword1392,[ebp-332]
	fld	dword ptr [dword1390+4]
	fmul	dword ptr [dword1392+4]
	mov	dword1394,[ebp-336]
	mov	dword1396,[ebp-332]
	fld	dword ptr [dword1394]
	fmul	dword ptr [dword1396]
	faddp
	mov	dword1398,[ebp-336]
	mov	dword1400,[ebp-332]
	fld	dword ptr [dword1398+8]
	fmul	dword ptr [dword1400+8]
	faddp
	mov	dword1402,[ebp-336]
	mov	dword1404,[ebp-332]
	fld	dword ptr [dword1402+12]
	fmul	dword ptr [dword1404+12]
	faddp
	fstp	dword ptr [ebp-340]
label0050:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	dword1405,[ebp-200]
	mov	[ebp-332],dword1405
	lea	dword1145,[ebp-252]
	mov	[ebp-336],dword1145
; start of inline function vec4f_dot
	mov	dword1408,[ebp-336]
	mov	dword1410,[ebp-332]
	fld	dword ptr [dword1408+4]
	fmul	dword ptr [dword1410+4]
	mov	dword1412,[ebp-336]
	mov	dword1414,[ebp-332]
	fld	dword ptr [dword1412]
	fmul	dword ptr [dword1414]
	faddp
	mov	dword1416,[ebp-336]
	mov	dword1418,[ebp-332]
	fld	dword ptr [dword1416+8]
	fmul	dword ptr [dword1418+8]
	faddp
	mov	dword1420,[ebp-336]
	mov	dword1422,[ebp-332]
	fld	dword ptr [dword1420+12]
	fmul	dword ptr [dword1422+12]
	faddp
	fstp	dword ptr [ebp-340]
label0051:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	dword1423,[ebp-272]
	mov	[ebp-344],dword1423
	lea	dword1148,[ebp-252]
	mov	[ebp-348],dword1148
; start of inline function vec4f_mul
	mov	dword1426,[ebp-348]
	fld	dword ptr [dword1426]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1426]
	mov	dword1429,[ebp-348]
	fld	dword ptr [dword1429+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1429+4]
	mov	dword1432,[ebp-348]
	fld	dword ptr [dword1432+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1432+8]
	mov	dword1435,[ebp-348]
	fld	dword ptr [dword1435+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1435+12]
label0052:
; end of inline function vec4f_mul
	lea	dword1149,[ebp-252]
	mov	[ebp-308],dword1149
	mov	dword1151,[ebp-216]
	mov	[ebp-312],dword1151
	mov	dword1153,[ebp-212]
	mov	dword1155,[dword1153+192]
	imul	dword1155,24
	mov	dword1157,[ebp-212]
	add	dword1157,dword1155
	mov	[ebp-316],dword1157
; start of inline function vec4f_add
	mov	dword1225,[ebp-312]
	mov	dword1227,[ebp-308]
	fld	dword ptr [dword1225]
	fadd	dword ptr [dword1227]
	mov	dword1229,[ebp-316]
	fstp	dword ptr [dword1229]
	mov	dword1231,[ebp-312]
	mov	dword1233,[ebp-308]
	fld	dword ptr [dword1231+4]
	fadd	dword ptr [dword1233+4]
	mov	dword1235,[ebp-316]
	fstp	dword ptr [dword1235+4]
	mov	dword1237,[ebp-312]
	mov	dword1239,[ebp-308]
	fld	dword ptr [dword1237+8]
	fadd	dword ptr [dword1239+8]
	mov	dword1241,[ebp-316]
	fstp	dword ptr [dword1241+8]
	mov	dword1243,[ebp-312]
	mov	dword1245,[ebp-308]
	fld	dword ptr [dword1243+12]
	fadd	dword ptr [dword1245+12]
	mov	dword1247,[ebp-316]
	fstp	dword ptr [dword1247+12]
label0049:
; end of inline function vec4f_add
	mov	dword1159,16
	add	dword1159,[ebp-216]
	mov	[ebp-288],dword1159
	mov	dword1161,16
	add	dword1161,[ebp-220]
	mov	[ebp-292],dword1161
	lea	dword1162,[ebp-260]
	mov	[ebp-296],dword1162
; start of inline function vec2f_subtract
	mov	dword1204,[ebp-292]
	mov	dword1206,[ebp-288]
	fld	dword ptr [dword1204]
	fsub	dword ptr [dword1206]
	mov	dword1208,[ebp-296]
	fstp	dword ptr [dword1208]
	mov	dword1210,[ebp-292]
	mov	dword1212,[ebp-288]
	fld	dword ptr [dword1210+4]
	fsub	dword ptr [dword1212+4]
	mov	dword1214,[ebp-296]
	fstp	dword ptr [dword1214+4]
label0047:
; end of inline function vec2f_subtract
	mov	dword1215,[ebp-272]
	mov	[ebp-300],dword1215
	lea	dword1164,[ebp-260]
	mov	[ebp-304],dword1164
; start of inline function vec2f_mul
	mov	dword1218,[ebp-304]
	fld	dword ptr [dword1218]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword1218]
	mov	dword1221,[ebp-304]
	fld	dword ptr [dword1221+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword1221+4]
label0048:
; end of inline function vec2f_mul
	lea	dword1165,[ebp-260]
	mov	[ebp-276],dword1165
	mov	dword1167,16
	add	dword1167,[ebp-216]
	mov	[ebp-280],dword1167
	mov	dword1169,[ebp-212]
	mov	dword1171,[dword1169+192]
	imul	dword1171,24
	mov	dword1173,[ebp-212]
	add	dword1173,dword1171
	add	dword1173,16
	mov	[ebp-284],dword1173
; start of inline function vec2f_add
	mov	dword1191,[ebp-280]
	mov	dword1193,[ebp-276]
	fld	dword ptr [dword1191]
	fadd	dword ptr [dword1193]
	mov	dword1195,[ebp-284]
	fstp	dword ptr [dword1195]
	mov	dword1197,[ebp-280]
	mov	dword1199,[ebp-276]
	fld	dword ptr [dword1197+4]
	fadd	dword ptr [dword1199+4]
	mov	dword1201,[ebp-284]
	fstp	dword ptr [dword1201+4]
label0046:
; end of inline function vec2f_add
	mov	dword1176,[ebp-212]
	inc	dword ptr [dword1176+192]
label0043:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label0040
label0041:
	mov	dword1180,[ebp-212]
	mov	dword1181,[dword1180+192]
	inc	dword ptr [dword1180+192]
	imul	dword1181,24
	mov	dword1184,[ebp-212]
	add	dword1184,dword1181
	mov	dword1186,[ebp-212]
	mov	dword1187,[dword1186]
	mov	dword1188,[dword1186+4]
	mov	[dword1184],dword1187
	mov	[dword1184+4],dword1188
	mov	dword1187,[dword1186+8]
	mov	dword1188,[dword1186+12]
	mov	[dword1184+8],dword1187
	mov	[dword1184+12],dword1188
	mov	dword1187,[dword1186+16]
	mov	dword1188,[dword1186+20]
	mov	[dword1184+16],dword1187
	mov	[dword1184+20],dword1188
label0053:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_plane_top_norm)
	mov	[ebp-204],(offset __clip_plane_top_base)
	mov	[ebp-208],dword2141
	lea	dword20,[ebp-196]
	mov	[ebp-212],dword20
; start of inline function _clip_on_plain
	mov	dword1440,[ebp-212]
	mov	dword ptr [dword1440+192],0
	mov	dword1443,[ebp-208]
	mov	[ebp-216],dword1443
	mov	dword1446,[ebp-208]
	add	dword1446,24
	mov	[ebp-220],dword1446
label0054:
label0055:
	mov	dword1450,[ebp-208]
	mov	dword1452,[dword1450+192]
	imul	dword1452,24
	mov	dword1454,[ebp-208]
	add	dword1454,dword1452
	cmp	dword1454,[ebp-220]
	jle	label0056
	mov	dword1600,[ebp-204]
	mov	[ebp-320],dword1600
	mov	dword1458,[ebp-216]
	mov	[ebp-324],dword1458
	lea	dword1459,[ebp-236]
	mov	[ebp-328],dword1459
; start of inline function vec4f_subtract
	mov	dword1603,[ebp-324]
	mov	dword1605,[ebp-320]
	fld	dword ptr [dword1603]
	fsub	dword ptr [dword1605]
	mov	dword1607,[ebp-328]
	fstp	dword ptr [dword1607]
	mov	dword1609,[ebp-324]
	mov	dword1611,[ebp-320]
	fld	dword ptr [dword1609+4]
	fsub	dword ptr [dword1611+4]
	mov	dword1613,[ebp-328]
	fstp	dword ptr [dword1613+4]
	mov	dword1615,[ebp-324]
	mov	dword1617,[ebp-320]
	fld	dword ptr [dword1615+8]
	fsub	dword ptr [dword1617+8]
	mov	dword1619,[ebp-328]
	fstp	dword ptr [dword1619+8]
	mov	dword1621,[ebp-324]
	mov	dword1623,[ebp-320]
	fld	dword ptr [dword1621+12]
	fsub	dword ptr [dword1623+12]
	mov	dword1625,[ebp-328]
	fstp	dword ptr [dword1625+12]
label005f:
; end of inline function vec4f_subtract
	mov	dword1703,[ebp-200]
	mov	[ebp-332],dword1703
	lea	dword1461,[ebp-236]
	mov	[ebp-336],dword1461
; start of inline function vec4f_dot
	mov	dword1706,[ebp-336]
	mov	dword1708,[ebp-332]
	fld	dword ptr [dword1706+4]
	fmul	dword ptr [dword1708+4]
	mov	dword1710,[ebp-336]
	mov	dword1712,[ebp-332]
	fld	dword ptr [dword1710]
	fmul	dword ptr [dword1712]
	faddp
	mov	dword1714,[ebp-336]
	mov	dword1716,[ebp-332]
	fld	dword ptr [dword1714+8]
	fmul	dword ptr [dword1716+8]
	faddp
	mov	dword1718,[ebp-336]
	mov	dword1720,[ebp-332]
	fld	dword ptr [dword1718+12]
	fmul	dword ptr [dword1720+12]
	faddp
	fstp	dword ptr [ebp-340]
label0063:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	dword1626,[ebp-204]
	mov	[ebp-320],dword1626
	mov	dword1465,[ebp-220]
	mov	[ebp-324],dword1465
	lea	dword1466,[ebp-236]
	mov	[ebp-328],dword1466
; start of inline function vec4f_subtract
	mov	dword1629,[ebp-324]
	mov	dword1631,[ebp-320]
	fld	dword ptr [dword1629]
	fsub	dword ptr [dword1631]
	mov	dword1633,[ebp-328]
	fstp	dword ptr [dword1633]
	mov	dword1635,[ebp-324]
	mov	dword1637,[ebp-320]
	fld	dword ptr [dword1635+4]
	fsub	dword ptr [dword1637+4]
	mov	dword1639,[ebp-328]
	fstp	dword ptr [dword1639+4]
	mov	dword1641,[ebp-324]
	mov	dword1643,[ebp-320]
	fld	dword ptr [dword1641+8]
	fsub	dword ptr [dword1643+8]
	mov	dword1645,[ebp-328]
	fstp	dword ptr [dword1645+8]
	mov	dword1647,[ebp-324]
	mov	dword1649,[ebp-320]
	fld	dword ptr [dword1647+12]
	fsub	dword ptr [dword1649+12]
	mov	dword1651,[ebp-328]
	fstp	dword ptr [dword1651+12]
label0060:
; end of inline function vec4f_subtract
	mov	dword1721,[ebp-200]
	mov	[ebp-332],dword1721
	lea	dword1468,[ebp-236]
	mov	[ebp-336],dword1468
; start of inline function vec4f_dot
	mov	dword1724,[ebp-336]
	mov	dword1726,[ebp-332]
	fld	dword ptr [dword1724+4]
	fmul	dword ptr [dword1726+4]
	mov	dword1728,[ebp-336]
	mov	dword1730,[ebp-332]
	fld	dword ptr [dword1728]
	fmul	dword ptr [dword1730]
	faddp
	mov	dword1732,[ebp-336]
	mov	dword1734,[ebp-332]
	fld	dword ptr [dword1732+8]
	fmul	dword ptr [dword1734+8]
	faddp
	mov	dword1736,[ebp-336]
	mov	dword1738,[ebp-332]
	fld	dword ptr [dword1736+12]
	fmul	dword ptr [dword1738+12]
	faddp
	fstp	dword ptr [ebp-340]
label0064:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-268]
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jb	label0057
	mov	dword1472,[ebp-212]
	mov	dword1473,[dword1472+192]
	inc	dword ptr [dword1472+192]
	imul	dword1473,24
	mov	dword1476,[ebp-212]
	add	dword1476,dword1473
	mov	dword1478,[ebp-216]
	mov	dword1479,[dword1478]
	mov	dword1480,[dword1478+4]
	mov	[dword1476],dword1479
	mov	[dword1476+4],dword1480
	mov	dword1479,[dword1478+8]
	mov	dword1480,[dword1478+12]
	mov	[dword1476+8],dword1479
	mov	[dword1476+12],dword1480
	mov	dword1479,[dword1478+16]
	mov	dword1480,[dword1478+20]
	mov	[dword1476+16],dword1479
	mov	[dword1476+20],dword1480
label0057:
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jbe	label005a
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label0059
label005a:
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label0058
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jae	label0058
label0059:
	mov	dword1486,[ebp-216]
	mov	[ebp-320],dword1486
	mov	dword1652,[ebp-204]
	mov	[ebp-324],dword1652
	lea	dword1488,[ebp-236]
	mov	[ebp-328],dword1488
; start of inline function vec4f_subtract
	mov	dword1655,[ebp-324]
	mov	dword1657,[ebp-320]
	fld	dword ptr [dword1655]
	fsub	dword ptr [dword1657]
	mov	dword1659,[ebp-328]
	fstp	dword ptr [dword1659]
	mov	dword1661,[ebp-324]
	mov	dword1663,[ebp-320]
	fld	dword ptr [dword1661+4]
	fsub	dword ptr [dword1663+4]
	mov	dword1665,[ebp-328]
	fstp	dword ptr [dword1665+4]
	mov	dword1667,[ebp-324]
	mov	dword1669,[ebp-320]
	fld	dword ptr [dword1667+8]
	fsub	dword ptr [dword1669+8]
	mov	dword1671,[ebp-328]
	fstp	dword ptr [dword1671+8]
	mov	dword1673,[ebp-324]
	mov	dword1675,[ebp-320]
	fld	dword ptr [dword1673+12]
	fsub	dword ptr [dword1675+12]
	mov	dword1677,[ebp-328]
	fstp	dword ptr [dword1677+12]
label0061:
; end of inline function vec4f_subtract
	mov	dword1490,[ebp-216]
	mov	[ebp-320],dword1490
	mov	dword1492,[ebp-220]
	mov	[ebp-324],dword1492
	lea	dword1493,[ebp-252]
	mov	[ebp-328],dword1493
; start of inline function vec4f_subtract
	mov	dword1680,[ebp-324]
	mov	dword1682,[ebp-320]
	fld	dword ptr [dword1680]
	fsub	dword ptr [dword1682]
	mov	dword1684,[ebp-328]
	fstp	dword ptr [dword1684]
	mov	dword1686,[ebp-324]
	mov	dword1688,[ebp-320]
	fld	dword ptr [dword1686+4]
	fsub	dword ptr [dword1688+4]
	mov	dword1690,[ebp-328]
	fstp	dword ptr [dword1690+4]
	mov	dword1692,[ebp-324]
	mov	dword1694,[ebp-320]
	fld	dword ptr [dword1692+8]
	fsub	dword ptr [dword1694+8]
	mov	dword1696,[ebp-328]
	fstp	dword ptr [dword1696+8]
	mov	dword1698,[ebp-324]
	mov	dword1700,[ebp-320]
	fld	dword ptr [dword1698+12]
	fsub	dword ptr [dword1700+12]
	mov	dword1702,[ebp-328]
	fstp	dword ptr [dword1702+12]
label0062:
; end of inline function vec4f_subtract
	mov	dword1739,[ebp-200]
	mov	[ebp-332],dword1739
	lea	dword1495,[ebp-236]
	mov	[ebp-336],dword1495
; start of inline function vec4f_dot
	mov	dword1742,[ebp-336]
	mov	dword1744,[ebp-332]
	fld	dword ptr [dword1742+4]
	fmul	dword ptr [dword1744+4]
	mov	dword1746,[ebp-336]
	mov	dword1748,[ebp-332]
	fld	dword ptr [dword1746]
	fmul	dword ptr [dword1748]
	faddp
	mov	dword1750,[ebp-336]
	mov	dword1752,[ebp-332]
	fld	dword ptr [dword1750+8]
	fmul	dword ptr [dword1752+8]
	faddp
	mov	dword1754,[ebp-336]
	mov	dword1756,[ebp-332]
	fld	dword ptr [dword1754+12]
	fmul	dword ptr [dword1756+12]
	faddp
	fstp	dword ptr [ebp-340]
label0065:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	dword1757,[ebp-200]
	mov	[ebp-332],dword1757
	lea	dword1497,[ebp-252]
	mov	[ebp-336],dword1497
; start of inline function vec4f_dot
	mov	dword1760,[ebp-336]
	mov	dword1762,[ebp-332]
	fld	dword ptr [dword1760+4]
	fmul	dword ptr [dword1762+4]
	mov	dword1764,[ebp-336]
	mov	dword1766,[ebp-332]
	fld	dword ptr [dword1764]
	fmul	dword ptr [dword1766]
	faddp
	mov	dword1768,[ebp-336]
	mov	dword1770,[ebp-332]
	fld	dword ptr [dword1768+8]
	fmul	dword ptr [dword1770+8]
	faddp
	mov	dword1772,[ebp-336]
	mov	dword1774,[ebp-332]
	fld	dword ptr [dword1772+12]
	fmul	dword ptr [dword1774+12]
	faddp
	fstp	dword ptr [ebp-340]
label0066:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	dword1775,[ebp-272]
	mov	[ebp-344],dword1775
	lea	dword1500,[ebp-252]
	mov	[ebp-348],dword1500
; start of inline function vec4f_mul
	mov	dword1778,[ebp-348]
	fld	dword ptr [dword1778]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1778]
	mov	dword1781,[ebp-348]
	fld	dword ptr [dword1781+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1781+4]
	mov	dword1784,[ebp-348]
	fld	dword ptr [dword1784+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1784+8]
	mov	dword1787,[ebp-348]
	fld	dword ptr [dword1787+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword1787+12]
label0067:
; end of inline function vec4f_mul
	lea	dword1501,[ebp-252]
	mov	[ebp-308],dword1501
	mov	dword1503,[ebp-216]
	mov	[ebp-312],dword1503
	mov	dword1505,[ebp-212]
	mov	dword1507,[dword1505+192]
	imul	dword1507,24
	mov	dword1509,[ebp-212]
	add	dword1509,dword1507
	mov	[ebp-316],dword1509
; start of inline function vec4f_add
	mov	dword1577,[ebp-312]
	mov	dword1579,[ebp-308]
	fld	dword ptr [dword1577]
	fadd	dword ptr [dword1579]
	mov	dword1581,[ebp-316]
	fstp	dword ptr [dword1581]
	mov	dword1583,[ebp-312]
	mov	dword1585,[ebp-308]
	fld	dword ptr [dword1583+4]
	fadd	dword ptr [dword1585+4]
	mov	dword1587,[ebp-316]
	fstp	dword ptr [dword1587+4]
	mov	dword1589,[ebp-312]
	mov	dword1591,[ebp-308]
	fld	dword ptr [dword1589+8]
	fadd	dword ptr [dword1591+8]
	mov	dword1593,[ebp-316]
	fstp	dword ptr [dword1593+8]
	mov	dword1595,[ebp-312]
	mov	dword1597,[ebp-308]
	fld	dword ptr [dword1595+12]
	fadd	dword ptr [dword1597+12]
	mov	dword1599,[ebp-316]
	fstp	dword ptr [dword1599+12]
label005e:
; end of inline function vec4f_add
	mov	dword1511,16
	add	dword1511,[ebp-216]
	mov	[ebp-288],dword1511
	mov	dword1513,16
	add	dword1513,[ebp-220]
	mov	[ebp-292],dword1513
	lea	dword1514,[ebp-260]
	mov	[ebp-296],dword1514
; start of inline function vec2f_subtract
	mov	dword1556,[ebp-292]
	mov	dword1558,[ebp-288]
	fld	dword ptr [dword1556]
	fsub	dword ptr [dword1558]
	mov	dword1560,[ebp-296]
	fstp	dword ptr [dword1560]
	mov	dword1562,[ebp-292]
	mov	dword1564,[ebp-288]
	fld	dword ptr [dword1562+4]
	fsub	dword ptr [dword1564+4]
	mov	dword1566,[ebp-296]
	fstp	dword ptr [dword1566+4]
label005c:
; end of inline function vec2f_subtract
	mov	dword1567,[ebp-272]
	mov	[ebp-300],dword1567
	lea	dword1516,[ebp-260]
	mov	[ebp-304],dword1516
; start of inline function vec2f_mul
	mov	dword1570,[ebp-304]
	fld	dword ptr [dword1570]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword1570]
	mov	dword1573,[ebp-304]
	fld	dword ptr [dword1573+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword1573+4]
label005d:
; end of inline function vec2f_mul
	lea	dword1517,[ebp-260]
	mov	[ebp-276],dword1517
	mov	dword1519,16
	add	dword1519,[ebp-216]
	mov	[ebp-280],dword1519
	mov	dword1521,[ebp-212]
	mov	dword1523,[dword1521+192]
	imul	dword1523,24
	mov	dword1525,[ebp-212]
	add	dword1525,dword1523
	add	dword1525,16
	mov	[ebp-284],dword1525
; start of inline function vec2f_add
	mov	dword1543,[ebp-280]
	mov	dword1545,[ebp-276]
	fld	dword ptr [dword1543]
	fadd	dword ptr [dword1545]
	mov	dword1547,[ebp-284]
	fstp	dword ptr [dword1547]
	mov	dword1549,[ebp-280]
	mov	dword1551,[ebp-276]
	fld	dword ptr [dword1549+4]
	fadd	dword ptr [dword1551+4]
	mov	dword1553,[ebp-284]
	fstp	dword ptr [dword1553+4]
label005b:
; end of inline function vec2f_add
	mov	dword1528,[ebp-212]
	inc	dword ptr [dword1528+192]
label0058:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label0055
label0056:
	mov	dword1532,[ebp-212]
	mov	dword1533,[dword1532+192]
	inc	dword ptr [dword1532+192]
	imul	dword1533,24
	mov	dword1536,[ebp-212]
	add	dword1536,dword1533
	mov	dword1538,[ebp-212]
	mov	dword1539,[dword1538]
	mov	dword1540,[dword1538+4]
	mov	[dword1536],dword1539
	mov	[dword1536+4],dword1540
	mov	dword1539,[dword1538+8]
	mov	dword1540,[dword1538+12]
	mov	[dword1536+8],dword1539
	mov	[dword1536+12],dword1540
	mov	dword1539,[dword1538+16]
	mov	dword1540,[dword1538+20]
	mov	[dword1536+16],dword1539
	mov	[dword1536+20],dword1540
label0068:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_plane_bottom_norm)
	mov	[ebp-204],(offset __clip_plane_bottom_base)
	lea	dword23,[ebp-196]
	mov	[ebp-208],dword23
	mov	[ebp-212],dword2141
; start of inline function _clip_on_plain
	mov	dword1792,[ebp-212]
	mov	dword ptr [dword1792+192],0
	mov	dword1795,[ebp-208]
	mov	[ebp-216],dword1795
	mov	dword1798,[ebp-208]
	add	dword1798,24
	mov	[ebp-220],dword1798
label0069:
label006a:
	mov	dword1802,[ebp-208]
	mov	dword1804,[dword1802+192]
	imul	dword1804,24
	mov	dword1806,[ebp-208]
	add	dword1806,dword1804
	cmp	dword1806,[ebp-220]
	jle	label006b
	mov	dword1952,[ebp-204]
	mov	[ebp-320],dword1952
	mov	dword1810,[ebp-216]
	mov	[ebp-324],dword1810
	lea	dword1811,[ebp-236]
	mov	[ebp-328],dword1811
; start of inline function vec4f_subtract
	mov	dword1955,[ebp-324]
	mov	dword1957,[ebp-320]
	fld	dword ptr [dword1955]
	fsub	dword ptr [dword1957]
	mov	dword1959,[ebp-328]
	fstp	dword ptr [dword1959]
	mov	dword1961,[ebp-324]
	mov	dword1963,[ebp-320]
	fld	dword ptr [dword1961+4]
	fsub	dword ptr [dword1963+4]
	mov	dword1965,[ebp-328]
	fstp	dword ptr [dword1965+4]
	mov	dword1967,[ebp-324]
	mov	dword1969,[ebp-320]
	fld	dword ptr [dword1967+8]
	fsub	dword ptr [dword1969+8]
	mov	dword1971,[ebp-328]
	fstp	dword ptr [dword1971+8]
	mov	dword1973,[ebp-324]
	mov	dword1975,[ebp-320]
	fld	dword ptr [dword1973+12]
	fsub	dword ptr [dword1975+12]
	mov	dword1977,[ebp-328]
	fstp	dword ptr [dword1977+12]
label0074:
; end of inline function vec4f_subtract
	mov	dword2055,[ebp-200]
	mov	[ebp-332],dword2055
	lea	dword1813,[ebp-236]
	mov	[ebp-336],dword1813
; start of inline function vec4f_dot
	mov	dword2058,[ebp-336]
	mov	dword2060,[ebp-332]
	fld	dword ptr [dword2058+4]
	fmul	dword ptr [dword2060+4]
	mov	dword2062,[ebp-336]
	mov	dword2064,[ebp-332]
	fld	dword ptr [dword2062]
	fmul	dword ptr [dword2064]
	faddp
	mov	dword2066,[ebp-336]
	mov	dword2068,[ebp-332]
	fld	dword ptr [dword2066+8]
	fmul	dword ptr [dword2068+8]
	faddp
	mov	dword2070,[ebp-336]
	mov	dword2072,[ebp-332]
	fld	dword ptr [dword2070+12]
	fmul	dword ptr [dword2072+12]
	faddp
	fstp	dword ptr [ebp-340]
label0078:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	dword1978,[ebp-204]
	mov	[ebp-320],dword1978
	mov	dword1817,[ebp-220]
	mov	[ebp-324],dword1817
	lea	dword1818,[ebp-236]
	mov	[ebp-328],dword1818
; start of inline function vec4f_subtract
	mov	dword1981,[ebp-324]
	mov	dword1983,[ebp-320]
	fld	dword ptr [dword1981]
	fsub	dword ptr [dword1983]
	mov	dword1985,[ebp-328]
	fstp	dword ptr [dword1985]
	mov	dword1987,[ebp-324]
	mov	dword1989,[ebp-320]
	fld	dword ptr [dword1987+4]
	fsub	dword ptr [dword1989+4]
	mov	dword1991,[ebp-328]
	fstp	dword ptr [dword1991+4]
	mov	dword1993,[ebp-324]
	mov	dword1995,[ebp-320]
	fld	dword ptr [dword1993+8]
	fsub	dword ptr [dword1995+8]
	mov	dword1997,[ebp-328]
	fstp	dword ptr [dword1997+8]
	mov	dword1999,[ebp-324]
	mov	dword2001,[ebp-320]
	fld	dword ptr [dword1999+12]
	fsub	dword ptr [dword2001+12]
	mov	dword2003,[ebp-328]
	fstp	dword ptr [dword2003+12]
label0075:
; end of inline function vec4f_subtract
	mov	dword2073,[ebp-200]
	mov	[ebp-332],dword2073
	lea	dword1820,[ebp-236]
	mov	[ebp-336],dword1820
; start of inline function vec4f_dot
	mov	dword2076,[ebp-336]
	mov	dword2078,[ebp-332]
	fld	dword ptr [dword2076+4]
	fmul	dword ptr [dword2078+4]
	mov	dword2080,[ebp-336]
	mov	dword2082,[ebp-332]
	fld	dword ptr [dword2080]
	fmul	dword ptr [dword2082]
	faddp
	mov	dword2084,[ebp-336]
	mov	dword2086,[ebp-332]
	fld	dword ptr [dword2084+8]
	fmul	dword ptr [dword2086+8]
	faddp
	mov	dword2088,[ebp-336]
	mov	dword2090,[ebp-332]
	fld	dword ptr [dword2088+12]
	fmul	dword ptr [dword2090+12]
	faddp
	fstp	dword ptr [ebp-340]
label0079:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-268]
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jb	label006c
	mov	dword1824,[ebp-212]
	mov	dword1825,[dword1824+192]
	inc	dword ptr [dword1824+192]
	imul	dword1825,24
	mov	dword1828,[ebp-212]
	add	dword1828,dword1825
	mov	dword1830,[ebp-216]
	mov	dword1831,[dword1830]
	mov	dword1832,[dword1830+4]
	mov	[dword1828],dword1831
	mov	[dword1828+4],dword1832
	mov	dword1831,[dword1830+8]
	mov	dword1832,[dword1830+12]
	mov	[dword1828+8],dword1831
	mov	[dword1828+12],dword1832
	mov	dword1831,[dword1830+16]
	mov	dword1832,[dword1830+20]
	mov	[dword1828+16],dword1831
	mov	[dword1828+20],dword1832
label006c:
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jbe	label006f
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label006e
label006f:
	fldz
	fld	dword ptr [ebp-268]
	fucomip	st,st(1)
	fstp	st
	jb	label006d
	fldz
	fld	dword ptr [ebp-264]
	fucomip	st,st(1)
	fstp	st
	jae	label006d
label006e:
	mov	dword1838,[ebp-216]
	mov	[ebp-320],dword1838
	mov	dword2004,[ebp-204]
	mov	[ebp-324],dword2004
	lea	dword1840,[ebp-236]
	mov	[ebp-328],dword1840
; start of inline function vec4f_subtract
	mov	dword2007,[ebp-324]
	mov	dword2009,[ebp-320]
	fld	dword ptr [dword2007]
	fsub	dword ptr [dword2009]
	mov	dword2011,[ebp-328]
	fstp	dword ptr [dword2011]
	mov	dword2013,[ebp-324]
	mov	dword2015,[ebp-320]
	fld	dword ptr [dword2013+4]
	fsub	dword ptr [dword2015+4]
	mov	dword2017,[ebp-328]
	fstp	dword ptr [dword2017+4]
	mov	dword2019,[ebp-324]
	mov	dword2021,[ebp-320]
	fld	dword ptr [dword2019+8]
	fsub	dword ptr [dword2021+8]
	mov	dword2023,[ebp-328]
	fstp	dword ptr [dword2023+8]
	mov	dword2025,[ebp-324]
	mov	dword2027,[ebp-320]
	fld	dword ptr [dword2025+12]
	fsub	dword ptr [dword2027+12]
	mov	dword2029,[ebp-328]
	fstp	dword ptr [dword2029+12]
label0076:
; end of inline function vec4f_subtract
	mov	dword1842,[ebp-216]
	mov	[ebp-320],dword1842
	mov	dword1844,[ebp-220]
	mov	[ebp-324],dword1844
	lea	dword1845,[ebp-252]
	mov	[ebp-328],dword1845
; start of inline function vec4f_subtract
	mov	dword2032,[ebp-324]
	mov	dword2034,[ebp-320]
	fld	dword ptr [dword2032]
	fsub	dword ptr [dword2034]
	mov	dword2036,[ebp-328]
	fstp	dword ptr [dword2036]
	mov	dword2038,[ebp-324]
	mov	dword2040,[ebp-320]
	fld	dword ptr [dword2038+4]
	fsub	dword ptr [dword2040+4]
	mov	dword2042,[ebp-328]
	fstp	dword ptr [dword2042+4]
	mov	dword2044,[ebp-324]
	mov	dword2046,[ebp-320]
	fld	dword ptr [dword2044+8]
	fsub	dword ptr [dword2046+8]
	mov	dword2048,[ebp-328]
	fstp	dword ptr [dword2048+8]
	mov	dword2050,[ebp-324]
	mov	dword2052,[ebp-320]
	fld	dword ptr [dword2050+12]
	fsub	dword ptr [dword2052+12]
	mov	dword2054,[ebp-328]
	fstp	dword ptr [dword2054+12]
label0077:
; end of inline function vec4f_subtract
	mov	dword2091,[ebp-200]
	mov	[ebp-332],dword2091
	lea	dword1847,[ebp-236]
	mov	[ebp-336],dword1847
; start of inline function vec4f_dot
	mov	dword2094,[ebp-336]
	mov	dword2096,[ebp-332]
	fld	dword ptr [dword2094+4]
	fmul	dword ptr [dword2096+4]
	mov	dword2098,[ebp-336]
	mov	dword2100,[ebp-332]
	fld	dword ptr [dword2098]
	fmul	dword ptr [dword2100]
	faddp
	mov	dword2102,[ebp-336]
	mov	dword2104,[ebp-332]
	fld	dword ptr [dword2102+8]
	fmul	dword ptr [dword2104+8]
	faddp
	mov	dword2106,[ebp-336]
	mov	dword2108,[ebp-332]
	fld	dword ptr [dword2106+12]
	fmul	dword ptr [dword2108+12]
	faddp
	fstp	dword ptr [ebp-340]
label007a:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	dword2109,[ebp-200]
	mov	[ebp-332],dword2109
	lea	dword1849,[ebp-252]
	mov	[ebp-336],dword1849
; start of inline function vec4f_dot
	mov	dword2112,[ebp-336]
	mov	dword2114,[ebp-332]
	fld	dword ptr [dword2112+4]
	fmul	dword ptr [dword2114+4]
	mov	dword2116,[ebp-336]
	mov	dword2118,[ebp-332]
	fld	dword ptr [dword2116]
	fmul	dword ptr [dword2118]
	faddp
	mov	dword2120,[ebp-336]
	mov	dword2122,[ebp-332]
	fld	dword ptr [dword2120+8]
	fmul	dword ptr [dword2122+8]
	faddp
	mov	dword2124,[ebp-336]
	mov	dword2126,[ebp-332]
	fld	dword ptr [dword2124+12]
	fmul	dword ptr [dword2126+12]
	faddp
	fstp	dword ptr [ebp-340]
label007b:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	dword2127,[ebp-272]
	mov	[ebp-344],dword2127
	lea	dword1852,[ebp-252]
	mov	[ebp-348],dword1852
; start of inline function vec4f_mul
	mov	dword2130,[ebp-348]
	fld	dword ptr [dword2130]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword2130]
	mov	dword2133,[ebp-348]
	fld	dword ptr [dword2133+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword2133+4]
	mov	dword2136,[ebp-348]
	fld	dword ptr [dword2136+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword2136+8]
	mov	dword2139,[ebp-348]
	fld	dword ptr [dword2139+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [dword2139+12]
label007c:
; end of inline function vec4f_mul
	lea	dword1853,[ebp-252]
	mov	[ebp-308],dword1853
	mov	dword1855,[ebp-216]
	mov	[ebp-312],dword1855
	mov	dword1857,[ebp-212]
	mov	dword1859,[dword1857+192]
	imul	dword1859,24
	mov	dword1861,[ebp-212]
	add	dword1861,dword1859
	mov	[ebp-316],dword1861
; start of inline function vec4f_add
	mov	dword1929,[ebp-312]
	mov	dword1931,[ebp-308]
	fld	dword ptr [dword1929]
	fadd	dword ptr [dword1931]
	mov	dword1933,[ebp-316]
	fstp	dword ptr [dword1933]
	mov	dword1935,[ebp-312]
	mov	dword1937,[ebp-308]
	fld	dword ptr [dword1935+4]
	fadd	dword ptr [dword1937+4]
	mov	dword1939,[ebp-316]
	fstp	dword ptr [dword1939+4]
	mov	dword1941,[ebp-312]
	mov	dword1943,[ebp-308]
	fld	dword ptr [dword1941+8]
	fadd	dword ptr [dword1943+8]
	mov	dword1945,[ebp-316]
	fstp	dword ptr [dword1945+8]
	mov	dword1947,[ebp-312]
	mov	dword1949,[ebp-308]
	fld	dword ptr [dword1947+12]
	fadd	dword ptr [dword1949+12]
	mov	dword1951,[ebp-316]
	fstp	dword ptr [dword1951+12]
label0073:
; end of inline function vec4f_add
	mov	dword1863,16
	add	dword1863,[ebp-216]
	mov	[ebp-288],dword1863
	mov	dword1865,16
	add	dword1865,[ebp-220]
	mov	[ebp-292],dword1865
	lea	dword1866,[ebp-260]
	mov	[ebp-296],dword1866
; start of inline function vec2f_subtract
	mov	dword1908,[ebp-292]
	mov	dword1910,[ebp-288]
	fld	dword ptr [dword1908]
	fsub	dword ptr [dword1910]
	mov	dword1912,[ebp-296]
	fstp	dword ptr [dword1912]
	mov	dword1914,[ebp-292]
	mov	dword1916,[ebp-288]
	fld	dword ptr [dword1914+4]
	fsub	dword ptr [dword1916+4]
	mov	dword1918,[ebp-296]
	fstp	dword ptr [dword1918+4]
label0071:
; end of inline function vec2f_subtract
	mov	dword1919,[ebp-272]
	mov	[ebp-300],dword1919
	lea	dword1868,[ebp-260]
	mov	[ebp-304],dword1868
; start of inline function vec2f_mul
	mov	dword1922,[ebp-304]
	fld	dword ptr [dword1922]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword1922]
	mov	dword1925,[ebp-304]
	fld	dword ptr [dword1925+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [dword1925+4]
label0072:
; end of inline function vec2f_mul
	lea	dword1869,[ebp-260]
	mov	[ebp-276],dword1869
	mov	dword1871,16
	add	dword1871,[ebp-216]
	mov	[ebp-280],dword1871
	mov	dword1873,[ebp-212]
	mov	dword1875,[dword1873+192]
	imul	dword1875,24
	mov	dword1877,[ebp-212]
	add	dword1877,dword1875
	add	dword1877,16
	mov	[ebp-284],dword1877
; start of inline function vec2f_add
	mov	dword1895,[ebp-280]
	mov	dword1897,[ebp-276]
	fld	dword ptr [dword1895]
	fadd	dword ptr [dword1897]
	mov	dword1899,[ebp-284]
	fstp	dword ptr [dword1899]
	mov	dword1901,[ebp-280]
	mov	dword1903,[ebp-276]
	fld	dword ptr [dword1901+4]
	fadd	dword ptr [dword1903+4]
	mov	dword1905,[ebp-284]
	fstp	dword ptr [dword1905+4]
label0070:
; end of inline function vec2f_add
	mov	dword1880,[ebp-212]
	inc	dword ptr [dword1880+192]
label006d:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label006a
label006b:
	mov	dword1884,[ebp-212]
	mov	dword1885,[dword1884+192]
	inc	dword ptr [dword1884+192]
	imul	dword1885,24
	mov	dword1888,[ebp-212]
	add	dword1888,dword1885
	mov	dword1890,[ebp-212]
	mov	dword1891,[dword1890]
	mov	dword1892,[dword1890+4]
	mov	[dword1888],dword1891
	mov	[dword1888+4],dword1892
	mov	dword1891,[dword1890+8]
	mov	dword1892,[dword1890+12]
	mov	[dword1888+8],dword1891
	mov	[dword1888+12],dword1892
	mov	dword1891,[dword1890+16]
	mov	dword1892,[dword1890+20]
	mov	[dword1888+16],dword1891
	mov	[dword1888+20],dword1892
label007d:
; end of inline function _clip_on_plain
	cmp	dword ptr [dword2141+192],1
	setg	byte1
	movzx	dword28,byte1
	set_retval	dword28
	destroy_stack_frame
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	create_stack_frame
	mov	dword109,[ebp+8]
	mov	[ebp-24],(offset __viewport_matrix)
	mov	dword34,[ebp+12]
	mov	[ebp-28],dword34
	lea	dword3,[ebp-16]
	mov	[ebp-32],dword3
; start of inline function matrix4f_transform
	mov	dword37,[ebp-28]
	mov	dword39,[ebp-24]
	fld	dword ptr [dword37+4]
	fmul	dword ptr [dword39+16]
	mov	dword41,[ebp-28]
	mov	dword43,[ebp-24]
	fld	dword ptr [dword41]
	fmul	dword ptr [dword43]
	faddp
	mov	dword45,[ebp-28]
	mov	dword47,[ebp-24]
	fld	dword ptr [dword45+8]
	fmul	dword ptr [dword47+32]
	faddp
	mov	dword49,[ebp-28]
	mov	dword51,[ebp-24]
	fld	dword ptr [dword49+12]
	fmul	dword ptr [dword51+48]
	faddp
	mov	dword53,[ebp-32]
	fstp	dword ptr [dword53]
	mov	dword55,[ebp-24]
	mov	dword57,[ebp-28]
	fld	dword ptr [dword57]
	fmul	dword ptr [dword55+4]
	mov	dword59,[ebp-28]
	mov	dword61,[ebp-24]
	fld	dword ptr [dword59+4]
	fmul	dword ptr [dword61+20]
	faddp
	mov	dword63,[ebp-28]
	mov	dword65,[ebp-24]
	fld	dword ptr [dword63+8]
	fmul	dword ptr [dword65+36]
	faddp
	mov	dword67,[ebp-28]
	mov	dword69,[ebp-24]
	fld	dword ptr [dword67+12]
	fmul	dword ptr [dword69+52]
	faddp
	mov	dword71,[ebp-32]
	fstp	dword ptr [dword71+4]
	mov	dword73,[ebp-24]
	mov	dword75,[ebp-28]
	fld	dword ptr [dword75]
	fmul	dword ptr [dword73+8]
	mov	dword77,[ebp-28]
	mov	dword79,[ebp-24]
	fld	dword ptr [dword77+4]
	fmul	dword ptr [dword79+24]
	faddp
	mov	dword81,[ebp-28]
	mov	dword83,[ebp-24]
	fld	dword ptr [dword81+8]
	fmul	dword ptr [dword83+40]
	faddp
	mov	dword85,[ebp-28]
	mov	dword87,[ebp-24]
	fld	dword ptr [dword85+12]
	fmul	dword ptr [dword87+56]
	faddp
	mov	dword89,[ebp-32]
	fstp	dword ptr [dword89+8]
	mov	dword91,[ebp-24]
	mov	dword93,[ebp-28]
	fld	dword ptr [dword93]
	fmul	dword ptr [dword91+12]
	mov	dword95,[ebp-28]
	mov	dword97,[ebp-24]
	fld	dword ptr [dword95+4]
	fmul	dword ptr [dword97+28]
	faddp
	mov	dword99,[ebp-28]
	mov	dword101,[ebp-24]
	fld	dword ptr [dword99+8]
	fmul	dword ptr [dword101+44]
	faddp
	mov	dword103,[ebp-28]
	mov	dword105,[ebp-24]
	fld	dword ptr [dword103+12]
	fmul	dword ptr [dword105+60]
	faddp
	mov	dword107,[ebp-32]
	fstp	dword ptr [dword107+12]
label0002:
; end of inline function matrix4f_transform
	lea	dword4,[ebp-16]
	add	dword4,12
	fld1
	fdiv	dword ptr [dword4]
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [ebp-20]
	float2int	dword9
	mov	[dword109],dword9
	lea	dword12,[ebp-16]
	add	dword12,4
	fld	dword ptr [dword12]
	fmul	dword ptr [ebp-20]
	float2int	dword15
	mov	[dword109+4],dword15
	cmp	dword ptr [dword109],0
	jl	label0001
	mov	dword24,[dword109]
	cmp	dword24,dword ptr [__width]
	jge	label0001
	cmp	dword ptr [dword109+4],0
	jl	label0001
	mov	dword31,[dword109+4]
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
	mov	dword1977,[ebp+8]
	mov	[ebp-448],dword1977
; start of inline function _clip_poligon
	lea	dword1979,dword ptr [__clip_z_far_norm]
	mov	[ebp-648],dword1979
	lea	dword1980,dword ptr [__clip_z_far_base]
	mov	[ebp-652],dword1980
	mov	dword2007,[ebp-448]
	mov	[ebp-656],dword2007
	lea	dword1982,[ebp-644]
	mov	[ebp-660],dword1982
; start of inline function _clip_on_plain
	mov	dword2010,[ebp-660]
	mov	dword ptr [dword2010+192],0
	mov	dword2013,[ebp-656]
	mov	[ebp-664],dword2013
	mov	dword2016,[ebp-656]
	add	dword2016,24
	mov	[ebp-668],dword2016
label0070:
label0071:
	mov	dword2020,[ebp-656]
	mov	dword2022,[dword2020+192]
	imul	dword2022,24
	mov	dword2024,[ebp-656]
	add	dword2024,dword2022
	cmp	dword2024,[ebp-668]
	jle	label0072
	mov	dword2170,[ebp-652]
	mov	[ebp-768],dword2170
	mov	dword2028,[ebp-664]
	mov	[ebp-772],dword2028
	lea	dword2029,[ebp-684]
	mov	[ebp-776],dword2029
; start of inline function vec4f_subtract
	mov	dword2173,[ebp-772]
	mov	dword2175,[ebp-768]
	fld	dword ptr [dword2173]
	fsub	dword ptr [dword2175]
	mov	dword2177,[ebp-776]
	fstp	dword ptr [dword2177]
	mov	dword2179,[ebp-772]
	mov	dword2181,[ebp-768]
	fld	dword ptr [dword2179+4]
	fsub	dword ptr [dword2181+4]
	mov	dword2183,[ebp-776]
	fstp	dword ptr [dword2183+4]
	mov	dword2185,[ebp-772]
	mov	dword2187,[ebp-768]
	fld	dword ptr [dword2185+8]
	fsub	dword ptr [dword2187+8]
	mov	dword2189,[ebp-776]
	fstp	dword ptr [dword2189+8]
	mov	dword2191,[ebp-772]
	mov	dword2193,[ebp-768]
	fld	dword ptr [dword2191+12]
	fsub	dword ptr [dword2193+12]
	mov	dword2195,[ebp-776]
	fstp	dword ptr [dword2195+12]
label007b:
; end of inline function vec4f_subtract
	mov	dword2273,[ebp-648]
	mov	[ebp-780],dword2273
	lea	dword2031,[ebp-684]
	mov	[ebp-784],dword2031
; start of inline function vec4f_dot
	mov	dword2276,[ebp-784]
	mov	dword2278,[ebp-780]
	fld	dword ptr [dword2276+4]
	fmul	dword ptr [dword2278+4]
	mov	dword2280,[ebp-784]
	mov	dword2282,[ebp-780]
	fld	dword ptr [dword2280]
	fmul	dword ptr [dword2282]
	faddp
	mov	dword2284,[ebp-784]
	mov	dword2286,[ebp-780]
	fld	dword ptr [dword2284+8]
	fmul	dword ptr [dword2286+8]
	faddp
	mov	dword2288,[ebp-784]
	mov	dword2290,[ebp-780]
	fld	dword ptr [dword2288+12]
	fmul	dword ptr [dword2290+12]
	faddp
	fstp	dword ptr [ebp-788]
label007f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword2196,[ebp-652]
	mov	[ebp-768],dword2196
	mov	dword2035,[ebp-668]
	mov	[ebp-772],dword2035
	lea	dword2036,[ebp-684]
	mov	[ebp-776],dword2036
; start of inline function vec4f_subtract
	mov	dword2199,[ebp-772]
	mov	dword2201,[ebp-768]
	fld	dword ptr [dword2199]
	fsub	dword ptr [dword2201]
	mov	dword2203,[ebp-776]
	fstp	dword ptr [dword2203]
	mov	dword2205,[ebp-772]
	mov	dword2207,[ebp-768]
	fld	dword ptr [dword2205+4]
	fsub	dword ptr [dword2207+4]
	mov	dword2209,[ebp-776]
	fstp	dword ptr [dword2209+4]
	mov	dword2211,[ebp-772]
	mov	dword2213,[ebp-768]
	fld	dword ptr [dword2211+8]
	fsub	dword ptr [dword2213+8]
	mov	dword2215,[ebp-776]
	fstp	dword ptr [dword2215+8]
	mov	dword2217,[ebp-772]
	mov	dword2219,[ebp-768]
	fld	dword ptr [dword2217+12]
	fsub	dword ptr [dword2219+12]
	mov	dword2221,[ebp-776]
	fstp	dword ptr [dword2221+12]
label007c:
; end of inline function vec4f_subtract
	mov	dword2291,[ebp-648]
	mov	[ebp-780],dword2291
	lea	dword2038,[ebp-684]
	mov	[ebp-784],dword2038
; start of inline function vec4f_dot
	mov	dword2294,[ebp-784]
	mov	dword2296,[ebp-780]
	fld	dword ptr [dword2294+4]
	fmul	dword ptr [dword2296+4]
	mov	dword2298,[ebp-784]
	mov	dword2300,[ebp-780]
	fld	dword ptr [dword2298]
	fmul	dword ptr [dword2300]
	faddp
	mov	dword2302,[ebp-784]
	mov	dword2304,[ebp-780]
	fld	dword ptr [dword2302+8]
	fmul	dword ptr [dword2304+8]
	faddp
	mov	dword2306,[ebp-784]
	mov	dword2308,[ebp-780]
	fld	dword ptr [dword2306+12]
	fmul	dword ptr [dword2308+12]
	faddp
	fstp	dword ptr [ebp-788]
label0080:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-716]
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jb	label0073
	mov	dword2042,[ebp-660]
	mov	dword2043,[dword2042+192]
	inc	dword ptr [dword2042+192]
	imul	dword2043,24
	mov	dword2046,[ebp-660]
	add	dword2046,dword2043
	mov	dword2048,[ebp-664]
	mov	dword2049,[dword2048]
	mov	dword2050,[dword2048+4]
	mov	[dword2046],dword2049
	mov	[dword2046+4],dword2050
	mov	dword2049,[dword2048+8]
	mov	dword2050,[dword2048+12]
	mov	[dword2046+8],dword2049
	mov	[dword2046+12],dword2050
	mov	dword2049,[dword2048+16]
	mov	dword2050,[dword2048+20]
	mov	[dword2046+16],dword2049
	mov	[dword2046+20],dword2050
label0073:
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jbe	label0076
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label0075
label0076:
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label0074
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jae	label0074
label0075:
	mov	dword2056,[ebp-664]
	mov	[ebp-768],dword2056
	mov	dword2222,[ebp-652]
	mov	[ebp-772],dword2222
	lea	dword2058,[ebp-684]
	mov	[ebp-776],dword2058
; start of inline function vec4f_subtract
	mov	dword2225,[ebp-772]
	mov	dword2227,[ebp-768]
	fld	dword ptr [dword2225]
	fsub	dword ptr [dword2227]
	mov	dword2229,[ebp-776]
	fstp	dword ptr [dword2229]
	mov	dword2231,[ebp-772]
	mov	dword2233,[ebp-768]
	fld	dword ptr [dword2231+4]
	fsub	dword ptr [dword2233+4]
	mov	dword2235,[ebp-776]
	fstp	dword ptr [dword2235+4]
	mov	dword2237,[ebp-772]
	mov	dword2239,[ebp-768]
	fld	dword ptr [dword2237+8]
	fsub	dword ptr [dword2239+8]
	mov	dword2241,[ebp-776]
	fstp	dword ptr [dword2241+8]
	mov	dword2243,[ebp-772]
	mov	dword2245,[ebp-768]
	fld	dword ptr [dword2243+12]
	fsub	dword ptr [dword2245+12]
	mov	dword2247,[ebp-776]
	fstp	dword ptr [dword2247+12]
label007d:
; end of inline function vec4f_subtract
	mov	dword2060,[ebp-664]
	mov	[ebp-768],dword2060
	mov	dword2062,[ebp-668]
	mov	[ebp-772],dword2062
	lea	dword2063,[ebp-700]
	mov	[ebp-776],dword2063
; start of inline function vec4f_subtract
	mov	dword2250,[ebp-772]
	mov	dword2252,[ebp-768]
	fld	dword ptr [dword2250]
	fsub	dword ptr [dword2252]
	mov	dword2254,[ebp-776]
	fstp	dword ptr [dword2254]
	mov	dword2256,[ebp-772]
	mov	dword2258,[ebp-768]
	fld	dword ptr [dword2256+4]
	fsub	dword ptr [dword2258+4]
	mov	dword2260,[ebp-776]
	fstp	dword ptr [dword2260+4]
	mov	dword2262,[ebp-772]
	mov	dword2264,[ebp-768]
	fld	dword ptr [dword2262+8]
	fsub	dword ptr [dword2264+8]
	mov	dword2266,[ebp-776]
	fstp	dword ptr [dword2266+8]
	mov	dword2268,[ebp-772]
	mov	dword2270,[ebp-768]
	fld	dword ptr [dword2268+12]
	fsub	dword ptr [dword2270+12]
	mov	dword2272,[ebp-776]
	fstp	dword ptr [dword2272+12]
label007e:
; end of inline function vec4f_subtract
	mov	dword2309,[ebp-648]
	mov	[ebp-780],dword2309
	lea	dword2065,[ebp-684]
	mov	[ebp-784],dword2065
; start of inline function vec4f_dot
	mov	dword2312,[ebp-784]
	mov	dword2314,[ebp-780]
	fld	dword ptr [dword2312+4]
	fmul	dword ptr [dword2314+4]
	mov	dword2316,[ebp-784]
	mov	dword2318,[ebp-780]
	fld	dword ptr [dword2316]
	fmul	dword ptr [dword2318]
	faddp
	mov	dword2320,[ebp-784]
	mov	dword2322,[ebp-780]
	fld	dword ptr [dword2320+8]
	fmul	dword ptr [dword2322+8]
	faddp
	mov	dword2324,[ebp-784]
	mov	dword2326,[ebp-780]
	fld	dword ptr [dword2324+12]
	fmul	dword ptr [dword2326+12]
	faddp
	fstp	dword ptr [ebp-788]
label0081:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword2327,[ebp-648]
	mov	[ebp-780],dword2327
	lea	dword2067,[ebp-700]
	mov	[ebp-784],dword2067
; start of inline function vec4f_dot
	mov	dword2330,[ebp-784]
	mov	dword2332,[ebp-780]
	fld	dword ptr [dword2330+4]
	fmul	dword ptr [dword2332+4]
	mov	dword2334,[ebp-784]
	mov	dword2336,[ebp-780]
	fld	dword ptr [dword2334]
	fmul	dword ptr [dword2336]
	faddp
	mov	dword2338,[ebp-784]
	mov	dword2340,[ebp-780]
	fld	dword ptr [dword2338+8]
	fmul	dword ptr [dword2340+8]
	faddp
	mov	dword2342,[ebp-784]
	mov	dword2344,[ebp-780]
	fld	dword ptr [dword2342+12]
	fmul	dword ptr [dword2344+12]
	faddp
	fstp	dword ptr [ebp-788]
label0082:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword2345,[ebp-720]
	mov	[ebp-792],dword2345
	lea	dword2070,[ebp-700]
	mov	[ebp-796],dword2070
; start of inline function vec4f_mul
	mov	dword2348,[ebp-796]
	fld	dword ptr [dword2348]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2348]
	mov	dword2351,[ebp-796]
	fld	dword ptr [dword2351+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2351+4]
	mov	dword2354,[ebp-796]
	fld	dword ptr [dword2354+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2354+8]
	mov	dword2357,[ebp-796]
	fld	dword ptr [dword2357+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2357+12]
label0083:
; end of inline function vec4f_mul
	lea	dword2071,[ebp-700]
	mov	[ebp-756],dword2071
	mov	dword2073,[ebp-664]
	mov	[ebp-760],dword2073
	mov	dword2075,[ebp-660]
	mov	dword2077,[dword2075+192]
	imul	dword2077,24
	mov	dword2079,[ebp-660]
	add	dword2079,dword2077
	mov	[ebp-764],dword2079
; start of inline function vec4f_add
	mov	dword2147,[ebp-760]
	mov	dword2149,[ebp-756]
	fld	dword ptr [dword2147]
	fadd	dword ptr [dword2149]
	mov	dword2151,[ebp-764]
	fstp	dword ptr [dword2151]
	mov	dword2153,[ebp-760]
	mov	dword2155,[ebp-756]
	fld	dword ptr [dword2153+4]
	fadd	dword ptr [dword2155+4]
	mov	dword2157,[ebp-764]
	fstp	dword ptr [dword2157+4]
	mov	dword2159,[ebp-760]
	mov	dword2161,[ebp-756]
	fld	dword ptr [dword2159+8]
	fadd	dword ptr [dword2161+8]
	mov	dword2163,[ebp-764]
	fstp	dword ptr [dword2163+8]
	mov	dword2165,[ebp-760]
	mov	dword2167,[ebp-756]
	fld	dword ptr [dword2165+12]
	fadd	dword ptr [dword2167+12]
	mov	dword2169,[ebp-764]
	fstp	dword ptr [dword2169+12]
label007a:
; end of inline function vec4f_add
	mov	dword2081,16
	add	dword2081,[ebp-664]
	mov	[ebp-736],dword2081
	mov	dword2083,16
	add	dword2083,[ebp-668]
	mov	[ebp-740],dword2083
	lea	dword2084,[ebp-708]
	mov	[ebp-744],dword2084
; start of inline function vec2f_subtract
	mov	dword2126,[ebp-740]
	mov	dword2128,[ebp-736]
	fld	dword ptr [dword2126]
	fsub	dword ptr [dword2128]
	mov	dword2130,[ebp-744]
	fstp	dword ptr [dword2130]
	mov	dword2132,[ebp-740]
	mov	dword2134,[ebp-736]
	fld	dword ptr [dword2132+4]
	fsub	dword ptr [dword2134+4]
	mov	dword2136,[ebp-744]
	fstp	dword ptr [dword2136+4]
label0078:
; end of inline function vec2f_subtract
	mov	dword2137,[ebp-720]
	mov	[ebp-748],dword2137
	lea	dword2086,[ebp-708]
	mov	[ebp-752],dword2086
; start of inline function vec2f_mul
	mov	dword2140,[ebp-752]
	fld	dword ptr [dword2140]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2140]
	mov	dword2143,[ebp-752]
	fld	dword ptr [dword2143+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2143+4]
label0079:
; end of inline function vec2f_mul
	lea	dword2087,[ebp-708]
	mov	[ebp-724],dword2087
	mov	dword2089,16
	add	dword2089,[ebp-664]
	mov	[ebp-728],dword2089
	mov	dword2091,[ebp-660]
	mov	dword2093,[dword2091+192]
	imul	dword2093,24
	mov	dword2095,[ebp-660]
	add	dword2095,dword2093
	add	dword2095,16
	mov	[ebp-732],dword2095
; start of inline function vec2f_add
	mov	dword2113,[ebp-728]
	mov	dword2115,[ebp-724]
	fld	dword ptr [dword2113]
	fadd	dword ptr [dword2115]
	mov	dword2117,[ebp-732]
	fstp	dword ptr [dword2117]
	mov	dword2119,[ebp-728]
	mov	dword2121,[ebp-724]
	fld	dword ptr [dword2119+4]
	fadd	dword ptr [dword2121+4]
	mov	dword2123,[ebp-732]
	fstp	dword ptr [dword2123+4]
label0077:
; end of inline function vec2f_add
	mov	dword2098,[ebp-660]
	inc	dword ptr [dword2098+192]
label0074:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label0071
label0072:
	mov	dword2102,[ebp-660]
	mov	dword2103,[dword2102+192]
	inc	dword ptr [dword2102+192]
	imul	dword2103,24
	mov	dword2106,[ebp-660]
	add	dword2106,dword2103
	mov	dword2108,[ebp-660]
	mov	dword2109,[dword2108]
	mov	dword2110,[dword2108+4]
	mov	[dword2106],dword2109
	mov	[dword2106+4],dword2110
	mov	dword2109,[dword2108+8]
	mov	dword2110,[dword2108+12]
	mov	[dword2106+8],dword2109
	mov	[dword2106+12],dword2110
	mov	dword2109,[dword2108+16]
	mov	dword2110,[dword2108+20]
	mov	[dword2106+16],dword2109
	mov	[dword2106+20],dword2110
label0084:
; end of inline function _clip_on_plain
	lea	dword1983,dword ptr [__clip_z_near_norm]
	mov	[ebp-648],dword1983
	lea	dword1984,dword ptr [__clip_z_near_base]
	mov	[ebp-652],dword1984
	lea	dword1985,[ebp-644]
	mov	[ebp-656],dword1985
	mov	dword2359,[ebp-448]
	mov	[ebp-660],dword2359
; start of inline function _clip_on_plain
	mov	dword2362,[ebp-660]
	mov	dword ptr [dword2362+192],0
	mov	dword2365,[ebp-656]
	mov	[ebp-664],dword2365
	mov	dword2368,[ebp-656]
	add	dword2368,24
	mov	[ebp-668],dword2368
label0085:
label0086:
	mov	dword2372,[ebp-656]
	mov	dword2374,[dword2372+192]
	imul	dword2374,24
	mov	dword2376,[ebp-656]
	add	dword2376,dword2374
	cmp	dword2376,[ebp-668]
	jle	label0087
	mov	dword2522,[ebp-652]
	mov	[ebp-768],dword2522
	mov	dword2380,[ebp-664]
	mov	[ebp-772],dword2380
	lea	dword2381,[ebp-684]
	mov	[ebp-776],dword2381
; start of inline function vec4f_subtract
	mov	dword2525,[ebp-772]
	mov	dword2527,[ebp-768]
	fld	dword ptr [dword2525]
	fsub	dword ptr [dword2527]
	mov	dword2529,[ebp-776]
	fstp	dword ptr [dword2529]
	mov	dword2531,[ebp-772]
	mov	dword2533,[ebp-768]
	fld	dword ptr [dword2531+4]
	fsub	dword ptr [dword2533+4]
	mov	dword2535,[ebp-776]
	fstp	dword ptr [dword2535+4]
	mov	dword2537,[ebp-772]
	mov	dword2539,[ebp-768]
	fld	dword ptr [dword2537+8]
	fsub	dword ptr [dword2539+8]
	mov	dword2541,[ebp-776]
	fstp	dword ptr [dword2541+8]
	mov	dword2543,[ebp-772]
	mov	dword2545,[ebp-768]
	fld	dword ptr [dword2543+12]
	fsub	dword ptr [dword2545+12]
	mov	dword2547,[ebp-776]
	fstp	dword ptr [dword2547+12]
label0090:
; end of inline function vec4f_subtract
	mov	dword2625,[ebp-648]
	mov	[ebp-780],dword2625
	lea	dword2383,[ebp-684]
	mov	[ebp-784],dword2383
; start of inline function vec4f_dot
	mov	dword2628,[ebp-784]
	mov	dword2630,[ebp-780]
	fld	dword ptr [dword2628+4]
	fmul	dword ptr [dword2630+4]
	mov	dword2632,[ebp-784]
	mov	dword2634,[ebp-780]
	fld	dword ptr [dword2632]
	fmul	dword ptr [dword2634]
	faddp
	mov	dword2636,[ebp-784]
	mov	dword2638,[ebp-780]
	fld	dword ptr [dword2636+8]
	fmul	dword ptr [dword2638+8]
	faddp
	mov	dword2640,[ebp-784]
	mov	dword2642,[ebp-780]
	fld	dword ptr [dword2640+12]
	fmul	dword ptr [dword2642+12]
	faddp
	fstp	dword ptr [ebp-788]
label0094:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword2548,[ebp-652]
	mov	[ebp-768],dword2548
	mov	dword2387,[ebp-668]
	mov	[ebp-772],dword2387
	lea	dword2388,[ebp-684]
	mov	[ebp-776],dword2388
; start of inline function vec4f_subtract
	mov	dword2551,[ebp-772]
	mov	dword2553,[ebp-768]
	fld	dword ptr [dword2551]
	fsub	dword ptr [dword2553]
	mov	dword2555,[ebp-776]
	fstp	dword ptr [dword2555]
	mov	dword2557,[ebp-772]
	mov	dword2559,[ebp-768]
	fld	dword ptr [dword2557+4]
	fsub	dword ptr [dword2559+4]
	mov	dword2561,[ebp-776]
	fstp	dword ptr [dword2561+4]
	mov	dword2563,[ebp-772]
	mov	dword2565,[ebp-768]
	fld	dword ptr [dword2563+8]
	fsub	dword ptr [dword2565+8]
	mov	dword2567,[ebp-776]
	fstp	dword ptr [dword2567+8]
	mov	dword2569,[ebp-772]
	mov	dword2571,[ebp-768]
	fld	dword ptr [dword2569+12]
	fsub	dword ptr [dword2571+12]
	mov	dword2573,[ebp-776]
	fstp	dword ptr [dword2573+12]
label0091:
; end of inline function vec4f_subtract
	mov	dword2643,[ebp-648]
	mov	[ebp-780],dword2643
	lea	dword2390,[ebp-684]
	mov	[ebp-784],dword2390
; start of inline function vec4f_dot
	mov	dword2646,[ebp-784]
	mov	dword2648,[ebp-780]
	fld	dword ptr [dword2646+4]
	fmul	dword ptr [dword2648+4]
	mov	dword2650,[ebp-784]
	mov	dword2652,[ebp-780]
	fld	dword ptr [dword2650]
	fmul	dword ptr [dword2652]
	faddp
	mov	dword2654,[ebp-784]
	mov	dword2656,[ebp-780]
	fld	dword ptr [dword2654+8]
	fmul	dword ptr [dword2656+8]
	faddp
	mov	dword2658,[ebp-784]
	mov	dword2660,[ebp-780]
	fld	dword ptr [dword2658+12]
	fmul	dword ptr [dword2660+12]
	faddp
	fstp	dword ptr [ebp-788]
label0095:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-716]
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jb	label0088
	mov	dword2394,[ebp-660]
	mov	dword2395,[dword2394+192]
	inc	dword ptr [dword2394+192]
	imul	dword2395,24
	mov	dword2398,[ebp-660]
	add	dword2398,dword2395
	mov	dword2400,[ebp-664]
	mov	dword2401,[dword2400]
	mov	dword2402,[dword2400+4]
	mov	[dword2398],dword2401
	mov	[dword2398+4],dword2402
	mov	dword2401,[dword2400+8]
	mov	dword2402,[dword2400+12]
	mov	[dword2398+8],dword2401
	mov	[dword2398+12],dword2402
	mov	dword2401,[dword2400+16]
	mov	dword2402,[dword2400+20]
	mov	[dword2398+16],dword2401
	mov	[dword2398+20],dword2402
label0088:
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jbe	label008b
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label008a
label008b:
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label0089
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jae	label0089
label008a:
	mov	dword2408,[ebp-664]
	mov	[ebp-768],dword2408
	mov	dword2574,[ebp-652]
	mov	[ebp-772],dword2574
	lea	dword2410,[ebp-684]
	mov	[ebp-776],dword2410
; start of inline function vec4f_subtract
	mov	dword2577,[ebp-772]
	mov	dword2579,[ebp-768]
	fld	dword ptr [dword2577]
	fsub	dword ptr [dword2579]
	mov	dword2581,[ebp-776]
	fstp	dword ptr [dword2581]
	mov	dword2583,[ebp-772]
	mov	dword2585,[ebp-768]
	fld	dword ptr [dword2583+4]
	fsub	dword ptr [dword2585+4]
	mov	dword2587,[ebp-776]
	fstp	dword ptr [dword2587+4]
	mov	dword2589,[ebp-772]
	mov	dword2591,[ebp-768]
	fld	dword ptr [dword2589+8]
	fsub	dword ptr [dword2591+8]
	mov	dword2593,[ebp-776]
	fstp	dword ptr [dword2593+8]
	mov	dword2595,[ebp-772]
	mov	dword2597,[ebp-768]
	fld	dword ptr [dword2595+12]
	fsub	dword ptr [dword2597+12]
	mov	dword2599,[ebp-776]
	fstp	dword ptr [dword2599+12]
label0092:
; end of inline function vec4f_subtract
	mov	dword2412,[ebp-664]
	mov	[ebp-768],dword2412
	mov	dword2414,[ebp-668]
	mov	[ebp-772],dword2414
	lea	dword2415,[ebp-700]
	mov	[ebp-776],dword2415
; start of inline function vec4f_subtract
	mov	dword2602,[ebp-772]
	mov	dword2604,[ebp-768]
	fld	dword ptr [dword2602]
	fsub	dword ptr [dword2604]
	mov	dword2606,[ebp-776]
	fstp	dword ptr [dword2606]
	mov	dword2608,[ebp-772]
	mov	dword2610,[ebp-768]
	fld	dword ptr [dword2608+4]
	fsub	dword ptr [dword2610+4]
	mov	dword2612,[ebp-776]
	fstp	dword ptr [dword2612+4]
	mov	dword2614,[ebp-772]
	mov	dword2616,[ebp-768]
	fld	dword ptr [dword2614+8]
	fsub	dword ptr [dword2616+8]
	mov	dword2618,[ebp-776]
	fstp	dword ptr [dword2618+8]
	mov	dword2620,[ebp-772]
	mov	dword2622,[ebp-768]
	fld	dword ptr [dword2620+12]
	fsub	dword ptr [dword2622+12]
	mov	dword2624,[ebp-776]
	fstp	dword ptr [dword2624+12]
label0093:
; end of inline function vec4f_subtract
	mov	dword2661,[ebp-648]
	mov	[ebp-780],dword2661
	lea	dword2417,[ebp-684]
	mov	[ebp-784],dword2417
; start of inline function vec4f_dot
	mov	dword2664,[ebp-784]
	mov	dword2666,[ebp-780]
	fld	dword ptr [dword2664+4]
	fmul	dword ptr [dword2666+4]
	mov	dword2668,[ebp-784]
	mov	dword2670,[ebp-780]
	fld	dword ptr [dword2668]
	fmul	dword ptr [dword2670]
	faddp
	mov	dword2672,[ebp-784]
	mov	dword2674,[ebp-780]
	fld	dword ptr [dword2672+8]
	fmul	dword ptr [dword2674+8]
	faddp
	mov	dword2676,[ebp-784]
	mov	dword2678,[ebp-780]
	fld	dword ptr [dword2676+12]
	fmul	dword ptr [dword2678+12]
	faddp
	fstp	dword ptr [ebp-788]
label0096:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword2679,[ebp-648]
	mov	[ebp-780],dword2679
	lea	dword2419,[ebp-700]
	mov	[ebp-784],dword2419
; start of inline function vec4f_dot
	mov	dword2682,[ebp-784]
	mov	dword2684,[ebp-780]
	fld	dword ptr [dword2682+4]
	fmul	dword ptr [dword2684+4]
	mov	dword2686,[ebp-784]
	mov	dword2688,[ebp-780]
	fld	dword ptr [dword2686]
	fmul	dword ptr [dword2688]
	faddp
	mov	dword2690,[ebp-784]
	mov	dword2692,[ebp-780]
	fld	dword ptr [dword2690+8]
	fmul	dword ptr [dword2692+8]
	faddp
	mov	dword2694,[ebp-784]
	mov	dword2696,[ebp-780]
	fld	dword ptr [dword2694+12]
	fmul	dword ptr [dword2696+12]
	faddp
	fstp	dword ptr [ebp-788]
label0097:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword2697,[ebp-720]
	mov	[ebp-792],dword2697
	lea	dword2422,[ebp-700]
	mov	[ebp-796],dword2422
; start of inline function vec4f_mul
	mov	dword2700,[ebp-796]
	fld	dword ptr [dword2700]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2700]
	mov	dword2703,[ebp-796]
	fld	dword ptr [dword2703+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2703+4]
	mov	dword2706,[ebp-796]
	fld	dword ptr [dword2706+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2706+8]
	mov	dword2709,[ebp-796]
	fld	dword ptr [dword2709+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2709+12]
label0098:
; end of inline function vec4f_mul
	lea	dword2423,[ebp-700]
	mov	[ebp-756],dword2423
	mov	dword2425,[ebp-664]
	mov	[ebp-760],dword2425
	mov	dword2427,[ebp-660]
	mov	dword2429,[dword2427+192]
	imul	dword2429,24
	mov	dword2431,[ebp-660]
	add	dword2431,dword2429
	mov	[ebp-764],dword2431
; start of inline function vec4f_add
	mov	dword2499,[ebp-760]
	mov	dword2501,[ebp-756]
	fld	dword ptr [dword2499]
	fadd	dword ptr [dword2501]
	mov	dword2503,[ebp-764]
	fstp	dword ptr [dword2503]
	mov	dword2505,[ebp-760]
	mov	dword2507,[ebp-756]
	fld	dword ptr [dword2505+4]
	fadd	dword ptr [dword2507+4]
	mov	dword2509,[ebp-764]
	fstp	dword ptr [dword2509+4]
	mov	dword2511,[ebp-760]
	mov	dword2513,[ebp-756]
	fld	dword ptr [dword2511+8]
	fadd	dword ptr [dword2513+8]
	mov	dword2515,[ebp-764]
	fstp	dword ptr [dword2515+8]
	mov	dword2517,[ebp-760]
	mov	dword2519,[ebp-756]
	fld	dword ptr [dword2517+12]
	fadd	dword ptr [dword2519+12]
	mov	dword2521,[ebp-764]
	fstp	dword ptr [dword2521+12]
label008f:
; end of inline function vec4f_add
	mov	dword2433,16
	add	dword2433,[ebp-664]
	mov	[ebp-736],dword2433
	mov	dword2435,16
	add	dword2435,[ebp-668]
	mov	[ebp-740],dword2435
	lea	dword2436,[ebp-708]
	mov	[ebp-744],dword2436
; start of inline function vec2f_subtract
	mov	dword2478,[ebp-740]
	mov	dword2480,[ebp-736]
	fld	dword ptr [dword2478]
	fsub	dword ptr [dword2480]
	mov	dword2482,[ebp-744]
	fstp	dword ptr [dword2482]
	mov	dword2484,[ebp-740]
	mov	dword2486,[ebp-736]
	fld	dword ptr [dword2484+4]
	fsub	dword ptr [dword2486+4]
	mov	dword2488,[ebp-744]
	fstp	dword ptr [dword2488+4]
label008d:
; end of inline function vec2f_subtract
	mov	dword2489,[ebp-720]
	mov	[ebp-748],dword2489
	lea	dword2438,[ebp-708]
	mov	[ebp-752],dword2438
; start of inline function vec2f_mul
	mov	dword2492,[ebp-752]
	fld	dword ptr [dword2492]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2492]
	mov	dword2495,[ebp-752]
	fld	dword ptr [dword2495+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2495+4]
label008e:
; end of inline function vec2f_mul
	lea	dword2439,[ebp-708]
	mov	[ebp-724],dword2439
	mov	dword2441,16
	add	dword2441,[ebp-664]
	mov	[ebp-728],dword2441
	mov	dword2443,[ebp-660]
	mov	dword2445,[dword2443+192]
	imul	dword2445,24
	mov	dword2447,[ebp-660]
	add	dword2447,dword2445
	add	dword2447,16
	mov	[ebp-732],dword2447
; start of inline function vec2f_add
	mov	dword2465,[ebp-728]
	mov	dword2467,[ebp-724]
	fld	dword ptr [dword2465]
	fadd	dword ptr [dword2467]
	mov	dword2469,[ebp-732]
	fstp	dword ptr [dword2469]
	mov	dword2471,[ebp-728]
	mov	dword2473,[ebp-724]
	fld	dword ptr [dword2471+4]
	fadd	dword ptr [dword2473+4]
	mov	dword2475,[ebp-732]
	fstp	dword ptr [dword2475+4]
label008c:
; end of inline function vec2f_add
	mov	dword2450,[ebp-660]
	inc	dword ptr [dword2450+192]
label0089:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label0086
label0087:
	mov	dword2454,[ebp-660]
	mov	dword2455,[dword2454+192]
	inc	dword ptr [dword2454+192]
	imul	dword2455,24
	mov	dword2458,[ebp-660]
	add	dword2458,dword2455
	mov	dword2460,[ebp-660]
	mov	dword2461,[dword2460]
	mov	dword2462,[dword2460+4]
	mov	[dword2458],dword2461
	mov	[dword2458+4],dword2462
	mov	dword2461,[dword2460+8]
	mov	dword2462,[dword2460+12]
	mov	[dword2458+8],dword2461
	mov	[dword2458+12],dword2462
	mov	dword2461,[dword2460+16]
	mov	dword2462,[dword2460+20]
	mov	[dword2458+16],dword2461
	mov	[dword2458+20],dword2462
label0099:
; end of inline function _clip_on_plain
	lea	dword1987,dword ptr [__clip_plane_left_norm]
	mov	[ebp-648],dword1987
	lea	dword1988,dword ptr [__clip_plane_left_base]
	mov	[ebp-652],dword1988
	mov	dword2711,[ebp-448]
	mov	[ebp-656],dword2711
	lea	dword1990,[ebp-644]
	mov	[ebp-660],dword1990
; start of inline function _clip_on_plain
	mov	dword2714,[ebp-660]
	mov	dword ptr [dword2714+192],0
	mov	dword2717,[ebp-656]
	mov	[ebp-664],dword2717
	mov	dword2720,[ebp-656]
	add	dword2720,24
	mov	[ebp-668],dword2720
label009a:
label009b:
	mov	dword2724,[ebp-656]
	mov	dword2726,[dword2724+192]
	imul	dword2726,24
	mov	dword2728,[ebp-656]
	add	dword2728,dword2726
	cmp	dword2728,[ebp-668]
	jle	label009c
	mov	dword2874,[ebp-652]
	mov	[ebp-768],dword2874
	mov	dword2732,[ebp-664]
	mov	[ebp-772],dword2732
	lea	dword2733,[ebp-684]
	mov	[ebp-776],dword2733
; start of inline function vec4f_subtract
	mov	dword2877,[ebp-772]
	mov	dword2879,[ebp-768]
	fld	dword ptr [dword2877]
	fsub	dword ptr [dword2879]
	mov	dword2881,[ebp-776]
	fstp	dword ptr [dword2881]
	mov	dword2883,[ebp-772]
	mov	dword2885,[ebp-768]
	fld	dword ptr [dword2883+4]
	fsub	dword ptr [dword2885+4]
	mov	dword2887,[ebp-776]
	fstp	dword ptr [dword2887+4]
	mov	dword2889,[ebp-772]
	mov	dword2891,[ebp-768]
	fld	dword ptr [dword2889+8]
	fsub	dword ptr [dword2891+8]
	mov	dword2893,[ebp-776]
	fstp	dword ptr [dword2893+8]
	mov	dword2895,[ebp-772]
	mov	dword2897,[ebp-768]
	fld	dword ptr [dword2895+12]
	fsub	dword ptr [dword2897+12]
	mov	dword2899,[ebp-776]
	fstp	dword ptr [dword2899+12]
label00a5:
; end of inline function vec4f_subtract
	mov	dword2977,[ebp-648]
	mov	[ebp-780],dword2977
	lea	dword2735,[ebp-684]
	mov	[ebp-784],dword2735
; start of inline function vec4f_dot
	mov	dword2980,[ebp-784]
	mov	dword2982,[ebp-780]
	fld	dword ptr [dword2980+4]
	fmul	dword ptr [dword2982+4]
	mov	dword2984,[ebp-784]
	mov	dword2986,[ebp-780]
	fld	dword ptr [dword2984]
	fmul	dword ptr [dword2986]
	faddp
	mov	dword2988,[ebp-784]
	mov	dword2990,[ebp-780]
	fld	dword ptr [dword2988+8]
	fmul	dword ptr [dword2990+8]
	faddp
	mov	dword2992,[ebp-784]
	mov	dword2994,[ebp-780]
	fld	dword ptr [dword2992+12]
	fmul	dword ptr [dword2994+12]
	faddp
	fstp	dword ptr [ebp-788]
label00a9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword2900,[ebp-652]
	mov	[ebp-768],dword2900
	mov	dword2739,[ebp-668]
	mov	[ebp-772],dword2739
	lea	dword2740,[ebp-684]
	mov	[ebp-776],dword2740
; start of inline function vec4f_subtract
	mov	dword2903,[ebp-772]
	mov	dword2905,[ebp-768]
	fld	dword ptr [dword2903]
	fsub	dword ptr [dword2905]
	mov	dword2907,[ebp-776]
	fstp	dword ptr [dword2907]
	mov	dword2909,[ebp-772]
	mov	dword2911,[ebp-768]
	fld	dword ptr [dword2909+4]
	fsub	dword ptr [dword2911+4]
	mov	dword2913,[ebp-776]
	fstp	dword ptr [dword2913+4]
	mov	dword2915,[ebp-772]
	mov	dword2917,[ebp-768]
	fld	dword ptr [dword2915+8]
	fsub	dword ptr [dword2917+8]
	mov	dword2919,[ebp-776]
	fstp	dword ptr [dword2919+8]
	mov	dword2921,[ebp-772]
	mov	dword2923,[ebp-768]
	fld	dword ptr [dword2921+12]
	fsub	dword ptr [dword2923+12]
	mov	dword2925,[ebp-776]
	fstp	dword ptr [dword2925+12]
label00a6:
; end of inline function vec4f_subtract
	mov	dword2995,[ebp-648]
	mov	[ebp-780],dword2995
	lea	dword2742,[ebp-684]
	mov	[ebp-784],dword2742
; start of inline function vec4f_dot
	mov	dword2998,[ebp-784]
	mov	dword3000,[ebp-780]
	fld	dword ptr [dword2998+4]
	fmul	dword ptr [dword3000+4]
	mov	dword3002,[ebp-784]
	mov	dword3004,[ebp-780]
	fld	dword ptr [dword3002]
	fmul	dword ptr [dword3004]
	faddp
	mov	dword3006,[ebp-784]
	mov	dword3008,[ebp-780]
	fld	dword ptr [dword3006+8]
	fmul	dword ptr [dword3008+8]
	faddp
	mov	dword3010,[ebp-784]
	mov	dword3012,[ebp-780]
	fld	dword ptr [dword3010+12]
	fmul	dword ptr [dword3012+12]
	faddp
	fstp	dword ptr [ebp-788]
label00aa:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-716]
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jb	label009d
	mov	dword2746,[ebp-660]
	mov	dword2747,[dword2746+192]
	inc	dword ptr [dword2746+192]
	imul	dword2747,24
	mov	dword2750,[ebp-660]
	add	dword2750,dword2747
	mov	dword2752,[ebp-664]
	mov	dword2753,[dword2752]
	mov	dword2754,[dword2752+4]
	mov	[dword2750],dword2753
	mov	[dword2750+4],dword2754
	mov	dword2753,[dword2752+8]
	mov	dword2754,[dword2752+12]
	mov	[dword2750+8],dword2753
	mov	[dword2750+12],dword2754
	mov	dword2753,[dword2752+16]
	mov	dword2754,[dword2752+20]
	mov	[dword2750+16],dword2753
	mov	[dword2750+20],dword2754
label009d:
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jbe	label00a0
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label009f
label00a0:
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label009e
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jae	label009e
label009f:
	mov	dword2760,[ebp-664]
	mov	[ebp-768],dword2760
	mov	dword2926,[ebp-652]
	mov	[ebp-772],dword2926
	lea	dword2762,[ebp-684]
	mov	[ebp-776],dword2762
; start of inline function vec4f_subtract
	mov	dword2929,[ebp-772]
	mov	dword2931,[ebp-768]
	fld	dword ptr [dword2929]
	fsub	dword ptr [dword2931]
	mov	dword2933,[ebp-776]
	fstp	dword ptr [dword2933]
	mov	dword2935,[ebp-772]
	mov	dword2937,[ebp-768]
	fld	dword ptr [dword2935+4]
	fsub	dword ptr [dword2937+4]
	mov	dword2939,[ebp-776]
	fstp	dword ptr [dword2939+4]
	mov	dword2941,[ebp-772]
	mov	dword2943,[ebp-768]
	fld	dword ptr [dword2941+8]
	fsub	dword ptr [dword2943+8]
	mov	dword2945,[ebp-776]
	fstp	dword ptr [dword2945+8]
	mov	dword2947,[ebp-772]
	mov	dword2949,[ebp-768]
	fld	dword ptr [dword2947+12]
	fsub	dword ptr [dword2949+12]
	mov	dword2951,[ebp-776]
	fstp	dword ptr [dword2951+12]
label00a7:
; end of inline function vec4f_subtract
	mov	dword2764,[ebp-664]
	mov	[ebp-768],dword2764
	mov	dword2766,[ebp-668]
	mov	[ebp-772],dword2766
	lea	dword2767,[ebp-700]
	mov	[ebp-776],dword2767
; start of inline function vec4f_subtract
	mov	dword2954,[ebp-772]
	mov	dword2956,[ebp-768]
	fld	dword ptr [dword2954]
	fsub	dword ptr [dword2956]
	mov	dword2958,[ebp-776]
	fstp	dword ptr [dword2958]
	mov	dword2960,[ebp-772]
	mov	dword2962,[ebp-768]
	fld	dword ptr [dword2960+4]
	fsub	dword ptr [dword2962+4]
	mov	dword2964,[ebp-776]
	fstp	dword ptr [dword2964+4]
	mov	dword2966,[ebp-772]
	mov	dword2968,[ebp-768]
	fld	dword ptr [dword2966+8]
	fsub	dword ptr [dword2968+8]
	mov	dword2970,[ebp-776]
	fstp	dword ptr [dword2970+8]
	mov	dword2972,[ebp-772]
	mov	dword2974,[ebp-768]
	fld	dword ptr [dword2972+12]
	fsub	dword ptr [dword2974+12]
	mov	dword2976,[ebp-776]
	fstp	dword ptr [dword2976+12]
label00a8:
; end of inline function vec4f_subtract
	mov	dword3013,[ebp-648]
	mov	[ebp-780],dword3013
	lea	dword2769,[ebp-684]
	mov	[ebp-784],dword2769
; start of inline function vec4f_dot
	mov	dword3016,[ebp-784]
	mov	dword3018,[ebp-780]
	fld	dword ptr [dword3016+4]
	fmul	dword ptr [dword3018+4]
	mov	dword3020,[ebp-784]
	mov	dword3022,[ebp-780]
	fld	dword ptr [dword3020]
	fmul	dword ptr [dword3022]
	faddp
	mov	dword3024,[ebp-784]
	mov	dword3026,[ebp-780]
	fld	dword ptr [dword3024+8]
	fmul	dword ptr [dword3026+8]
	faddp
	mov	dword3028,[ebp-784]
	mov	dword3030,[ebp-780]
	fld	dword ptr [dword3028+12]
	fmul	dword ptr [dword3030+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ab:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword3031,[ebp-648]
	mov	[ebp-780],dword3031
	lea	dword2771,[ebp-700]
	mov	[ebp-784],dword2771
; start of inline function vec4f_dot
	mov	dword3034,[ebp-784]
	mov	dword3036,[ebp-780]
	fld	dword ptr [dword3034+4]
	fmul	dword ptr [dword3036+4]
	mov	dword3038,[ebp-784]
	mov	dword3040,[ebp-780]
	fld	dword ptr [dword3038]
	fmul	dword ptr [dword3040]
	faddp
	mov	dword3042,[ebp-784]
	mov	dword3044,[ebp-780]
	fld	dword ptr [dword3042+8]
	fmul	dword ptr [dword3044+8]
	faddp
	mov	dword3046,[ebp-784]
	mov	dword3048,[ebp-780]
	fld	dword ptr [dword3046+12]
	fmul	dword ptr [dword3048+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ac:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword3049,[ebp-720]
	mov	[ebp-792],dword3049
	lea	dword2774,[ebp-700]
	mov	[ebp-796],dword2774
; start of inline function vec4f_mul
	mov	dword3052,[ebp-796]
	fld	dword ptr [dword3052]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3052]
	mov	dword3055,[ebp-796]
	fld	dword ptr [dword3055+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3055+4]
	mov	dword3058,[ebp-796]
	fld	dword ptr [dword3058+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3058+8]
	mov	dword3061,[ebp-796]
	fld	dword ptr [dword3061+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3061+12]
label00ad:
; end of inline function vec4f_mul
	lea	dword2775,[ebp-700]
	mov	[ebp-756],dword2775
	mov	dword2777,[ebp-664]
	mov	[ebp-760],dword2777
	mov	dword2779,[ebp-660]
	mov	dword2781,[dword2779+192]
	imul	dword2781,24
	mov	dword2783,[ebp-660]
	add	dword2783,dword2781
	mov	[ebp-764],dword2783
; start of inline function vec4f_add
	mov	dword2851,[ebp-760]
	mov	dword2853,[ebp-756]
	fld	dword ptr [dword2851]
	fadd	dword ptr [dword2853]
	mov	dword2855,[ebp-764]
	fstp	dword ptr [dword2855]
	mov	dword2857,[ebp-760]
	mov	dword2859,[ebp-756]
	fld	dword ptr [dword2857+4]
	fadd	dword ptr [dword2859+4]
	mov	dword2861,[ebp-764]
	fstp	dword ptr [dword2861+4]
	mov	dword2863,[ebp-760]
	mov	dword2865,[ebp-756]
	fld	dword ptr [dword2863+8]
	fadd	dword ptr [dword2865+8]
	mov	dword2867,[ebp-764]
	fstp	dword ptr [dword2867+8]
	mov	dword2869,[ebp-760]
	mov	dword2871,[ebp-756]
	fld	dword ptr [dword2869+12]
	fadd	dword ptr [dword2871+12]
	mov	dword2873,[ebp-764]
	fstp	dword ptr [dword2873+12]
label00a4:
; end of inline function vec4f_add
	mov	dword2785,16
	add	dword2785,[ebp-664]
	mov	[ebp-736],dword2785
	mov	dword2787,16
	add	dword2787,[ebp-668]
	mov	[ebp-740],dword2787
	lea	dword2788,[ebp-708]
	mov	[ebp-744],dword2788
; start of inline function vec2f_subtract
	mov	dword2830,[ebp-740]
	mov	dword2832,[ebp-736]
	fld	dword ptr [dword2830]
	fsub	dword ptr [dword2832]
	mov	dword2834,[ebp-744]
	fstp	dword ptr [dword2834]
	mov	dword2836,[ebp-740]
	mov	dword2838,[ebp-736]
	fld	dword ptr [dword2836+4]
	fsub	dword ptr [dword2838+4]
	mov	dword2840,[ebp-744]
	fstp	dword ptr [dword2840+4]
label00a2:
; end of inline function vec2f_subtract
	mov	dword2841,[ebp-720]
	mov	[ebp-748],dword2841
	lea	dword2790,[ebp-708]
	mov	[ebp-752],dword2790
; start of inline function vec2f_mul
	mov	dword2844,[ebp-752]
	fld	dword ptr [dword2844]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2844]
	mov	dword2847,[ebp-752]
	fld	dword ptr [dword2847+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2847+4]
label00a3:
; end of inline function vec2f_mul
	lea	dword2791,[ebp-708]
	mov	[ebp-724],dword2791
	mov	dword2793,16
	add	dword2793,[ebp-664]
	mov	[ebp-728],dword2793
	mov	dword2795,[ebp-660]
	mov	dword2797,[dword2795+192]
	imul	dword2797,24
	mov	dword2799,[ebp-660]
	add	dword2799,dword2797
	add	dword2799,16
	mov	[ebp-732],dword2799
; start of inline function vec2f_add
	mov	dword2817,[ebp-728]
	mov	dword2819,[ebp-724]
	fld	dword ptr [dword2817]
	fadd	dword ptr [dword2819]
	mov	dword2821,[ebp-732]
	fstp	dword ptr [dword2821]
	mov	dword2823,[ebp-728]
	mov	dword2825,[ebp-724]
	fld	dword ptr [dword2823+4]
	fadd	dword ptr [dword2825+4]
	mov	dword2827,[ebp-732]
	fstp	dword ptr [dword2827+4]
label00a1:
; end of inline function vec2f_add
	mov	dword2802,[ebp-660]
	inc	dword ptr [dword2802+192]
label009e:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label009b
label009c:
	mov	dword2806,[ebp-660]
	mov	dword2807,[dword2806+192]
	inc	dword ptr [dword2806+192]
	imul	dword2807,24
	mov	dword2810,[ebp-660]
	add	dword2810,dword2807
	mov	dword2812,[ebp-660]
	mov	dword2813,[dword2812]
	mov	dword2814,[dword2812+4]
	mov	[dword2810],dword2813
	mov	[dword2810+4],dword2814
	mov	dword2813,[dword2812+8]
	mov	dword2814,[dword2812+12]
	mov	[dword2810+8],dword2813
	mov	[dword2810+12],dword2814
	mov	dword2813,[dword2812+16]
	mov	dword2814,[dword2812+20]
	mov	[dword2810+16],dword2813
	mov	[dword2810+20],dword2814
label00ae:
; end of inline function _clip_on_plain
	lea	dword1991,dword ptr [__clip_plane_right_norm]
	mov	[ebp-648],dword1991
	lea	dword1992,dword ptr [__clip_plane_right_base]
	mov	[ebp-652],dword1992
	lea	dword1993,[ebp-644]
	mov	[ebp-656],dword1993
	mov	dword3063,[ebp-448]
	mov	[ebp-660],dword3063
; start of inline function _clip_on_plain
	mov	dword3066,[ebp-660]
	mov	dword ptr [dword3066+192],0
	mov	dword3069,[ebp-656]
	mov	[ebp-664],dword3069
	mov	dword3072,[ebp-656]
	add	dword3072,24
	mov	[ebp-668],dword3072
label00af:
label00b0:
	mov	dword3076,[ebp-656]
	mov	dword3078,[dword3076+192]
	imul	dword3078,24
	mov	dword3080,[ebp-656]
	add	dword3080,dword3078
	cmp	dword3080,[ebp-668]
	jle	label00b1
	mov	dword3226,[ebp-652]
	mov	[ebp-768],dword3226
	mov	dword3084,[ebp-664]
	mov	[ebp-772],dword3084
	lea	dword3085,[ebp-684]
	mov	[ebp-776],dword3085
; start of inline function vec4f_subtract
	mov	dword3229,[ebp-772]
	mov	dword3231,[ebp-768]
	fld	dword ptr [dword3229]
	fsub	dword ptr [dword3231]
	mov	dword3233,[ebp-776]
	fstp	dword ptr [dword3233]
	mov	dword3235,[ebp-772]
	mov	dword3237,[ebp-768]
	fld	dword ptr [dword3235+4]
	fsub	dword ptr [dword3237+4]
	mov	dword3239,[ebp-776]
	fstp	dword ptr [dword3239+4]
	mov	dword3241,[ebp-772]
	mov	dword3243,[ebp-768]
	fld	dword ptr [dword3241+8]
	fsub	dword ptr [dword3243+8]
	mov	dword3245,[ebp-776]
	fstp	dword ptr [dword3245+8]
	mov	dword3247,[ebp-772]
	mov	dword3249,[ebp-768]
	fld	dword ptr [dword3247+12]
	fsub	dword ptr [dword3249+12]
	mov	dword3251,[ebp-776]
	fstp	dword ptr [dword3251+12]
label00ba:
; end of inline function vec4f_subtract
	mov	dword3329,[ebp-648]
	mov	[ebp-780],dword3329
	lea	dword3087,[ebp-684]
	mov	[ebp-784],dword3087
; start of inline function vec4f_dot
	mov	dword3332,[ebp-784]
	mov	dword3334,[ebp-780]
	fld	dword ptr [dword3332+4]
	fmul	dword ptr [dword3334+4]
	mov	dword3336,[ebp-784]
	mov	dword3338,[ebp-780]
	fld	dword ptr [dword3336]
	fmul	dword ptr [dword3338]
	faddp
	mov	dword3340,[ebp-784]
	mov	dword3342,[ebp-780]
	fld	dword ptr [dword3340+8]
	fmul	dword ptr [dword3342+8]
	faddp
	mov	dword3344,[ebp-784]
	mov	dword3346,[ebp-780]
	fld	dword ptr [dword3344+12]
	fmul	dword ptr [dword3346+12]
	faddp
	fstp	dword ptr [ebp-788]
label00be:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword3252,[ebp-652]
	mov	[ebp-768],dword3252
	mov	dword3091,[ebp-668]
	mov	[ebp-772],dword3091
	lea	dword3092,[ebp-684]
	mov	[ebp-776],dword3092
; start of inline function vec4f_subtract
	mov	dword3255,[ebp-772]
	mov	dword3257,[ebp-768]
	fld	dword ptr [dword3255]
	fsub	dword ptr [dword3257]
	mov	dword3259,[ebp-776]
	fstp	dword ptr [dword3259]
	mov	dword3261,[ebp-772]
	mov	dword3263,[ebp-768]
	fld	dword ptr [dword3261+4]
	fsub	dword ptr [dword3263+4]
	mov	dword3265,[ebp-776]
	fstp	dword ptr [dword3265+4]
	mov	dword3267,[ebp-772]
	mov	dword3269,[ebp-768]
	fld	dword ptr [dword3267+8]
	fsub	dword ptr [dword3269+8]
	mov	dword3271,[ebp-776]
	fstp	dword ptr [dword3271+8]
	mov	dword3273,[ebp-772]
	mov	dword3275,[ebp-768]
	fld	dword ptr [dword3273+12]
	fsub	dword ptr [dword3275+12]
	mov	dword3277,[ebp-776]
	fstp	dword ptr [dword3277+12]
label00bb:
; end of inline function vec4f_subtract
	mov	dword3347,[ebp-648]
	mov	[ebp-780],dword3347
	lea	dword3094,[ebp-684]
	mov	[ebp-784],dword3094
; start of inline function vec4f_dot
	mov	dword3350,[ebp-784]
	mov	dword3352,[ebp-780]
	fld	dword ptr [dword3350+4]
	fmul	dword ptr [dword3352+4]
	mov	dword3354,[ebp-784]
	mov	dword3356,[ebp-780]
	fld	dword ptr [dword3354]
	fmul	dword ptr [dword3356]
	faddp
	mov	dword3358,[ebp-784]
	mov	dword3360,[ebp-780]
	fld	dword ptr [dword3358+8]
	fmul	dword ptr [dword3360+8]
	faddp
	mov	dword3362,[ebp-784]
	mov	dword3364,[ebp-780]
	fld	dword ptr [dword3362+12]
	fmul	dword ptr [dword3364+12]
	faddp
	fstp	dword ptr [ebp-788]
label00bf:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-716]
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jb	label00b2
	mov	dword3098,[ebp-660]
	mov	dword3099,[dword3098+192]
	inc	dword ptr [dword3098+192]
	imul	dword3099,24
	mov	dword3102,[ebp-660]
	add	dword3102,dword3099
	mov	dword3104,[ebp-664]
	mov	dword3105,[dword3104]
	mov	dword3106,[dword3104+4]
	mov	[dword3102],dword3105
	mov	[dword3102+4],dword3106
	mov	dword3105,[dword3104+8]
	mov	dword3106,[dword3104+12]
	mov	[dword3102+8],dword3105
	mov	[dword3102+12],dword3106
	mov	dword3105,[dword3104+16]
	mov	dword3106,[dword3104+20]
	mov	[dword3102+16],dword3105
	mov	[dword3102+20],dword3106
label00b2:
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jbe	label00b5
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label00b4
label00b5:
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label00b3
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jae	label00b3
label00b4:
	mov	dword3112,[ebp-664]
	mov	[ebp-768],dword3112
	mov	dword3278,[ebp-652]
	mov	[ebp-772],dword3278
	lea	dword3114,[ebp-684]
	mov	[ebp-776],dword3114
; start of inline function vec4f_subtract
	mov	dword3281,[ebp-772]
	mov	dword3283,[ebp-768]
	fld	dword ptr [dword3281]
	fsub	dword ptr [dword3283]
	mov	dword3285,[ebp-776]
	fstp	dword ptr [dword3285]
	mov	dword3287,[ebp-772]
	mov	dword3289,[ebp-768]
	fld	dword ptr [dword3287+4]
	fsub	dword ptr [dword3289+4]
	mov	dword3291,[ebp-776]
	fstp	dword ptr [dword3291+4]
	mov	dword3293,[ebp-772]
	mov	dword3295,[ebp-768]
	fld	dword ptr [dword3293+8]
	fsub	dword ptr [dword3295+8]
	mov	dword3297,[ebp-776]
	fstp	dword ptr [dword3297+8]
	mov	dword3299,[ebp-772]
	mov	dword3301,[ebp-768]
	fld	dword ptr [dword3299+12]
	fsub	dword ptr [dword3301+12]
	mov	dword3303,[ebp-776]
	fstp	dword ptr [dword3303+12]
label00bc:
; end of inline function vec4f_subtract
	mov	dword3116,[ebp-664]
	mov	[ebp-768],dword3116
	mov	dword3118,[ebp-668]
	mov	[ebp-772],dword3118
	lea	dword3119,[ebp-700]
	mov	[ebp-776],dword3119
; start of inline function vec4f_subtract
	mov	dword3306,[ebp-772]
	mov	dword3308,[ebp-768]
	fld	dword ptr [dword3306]
	fsub	dword ptr [dword3308]
	mov	dword3310,[ebp-776]
	fstp	dword ptr [dword3310]
	mov	dword3312,[ebp-772]
	mov	dword3314,[ebp-768]
	fld	dword ptr [dword3312+4]
	fsub	dword ptr [dword3314+4]
	mov	dword3316,[ebp-776]
	fstp	dword ptr [dword3316+4]
	mov	dword3318,[ebp-772]
	mov	dword3320,[ebp-768]
	fld	dword ptr [dword3318+8]
	fsub	dword ptr [dword3320+8]
	mov	dword3322,[ebp-776]
	fstp	dword ptr [dword3322+8]
	mov	dword3324,[ebp-772]
	mov	dword3326,[ebp-768]
	fld	dword ptr [dword3324+12]
	fsub	dword ptr [dword3326+12]
	mov	dword3328,[ebp-776]
	fstp	dword ptr [dword3328+12]
label00bd:
; end of inline function vec4f_subtract
	mov	dword3365,[ebp-648]
	mov	[ebp-780],dword3365
	lea	dword3121,[ebp-684]
	mov	[ebp-784],dword3121
; start of inline function vec4f_dot
	mov	dword3368,[ebp-784]
	mov	dword3370,[ebp-780]
	fld	dword ptr [dword3368+4]
	fmul	dword ptr [dword3370+4]
	mov	dword3372,[ebp-784]
	mov	dword3374,[ebp-780]
	fld	dword ptr [dword3372]
	fmul	dword ptr [dword3374]
	faddp
	mov	dword3376,[ebp-784]
	mov	dword3378,[ebp-780]
	fld	dword ptr [dword3376+8]
	fmul	dword ptr [dword3378+8]
	faddp
	mov	dword3380,[ebp-784]
	mov	dword3382,[ebp-780]
	fld	dword ptr [dword3380+12]
	fmul	dword ptr [dword3382+12]
	faddp
	fstp	dword ptr [ebp-788]
label00c0:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword3383,[ebp-648]
	mov	[ebp-780],dword3383
	lea	dword3123,[ebp-700]
	mov	[ebp-784],dword3123
; start of inline function vec4f_dot
	mov	dword3386,[ebp-784]
	mov	dword3388,[ebp-780]
	fld	dword ptr [dword3386+4]
	fmul	dword ptr [dword3388+4]
	mov	dword3390,[ebp-784]
	mov	dword3392,[ebp-780]
	fld	dword ptr [dword3390]
	fmul	dword ptr [dword3392]
	faddp
	mov	dword3394,[ebp-784]
	mov	dword3396,[ebp-780]
	fld	dword ptr [dword3394+8]
	fmul	dword ptr [dword3396+8]
	faddp
	mov	dword3398,[ebp-784]
	mov	dword3400,[ebp-780]
	fld	dword ptr [dword3398+12]
	fmul	dword ptr [dword3400+12]
	faddp
	fstp	dword ptr [ebp-788]
label00c1:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword3401,[ebp-720]
	mov	[ebp-792],dword3401
	lea	dword3126,[ebp-700]
	mov	[ebp-796],dword3126
; start of inline function vec4f_mul
	mov	dword3404,[ebp-796]
	fld	dword ptr [dword3404]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3404]
	mov	dword3407,[ebp-796]
	fld	dword ptr [dword3407+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3407+4]
	mov	dword3410,[ebp-796]
	fld	dword ptr [dword3410+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3410+8]
	mov	dword3413,[ebp-796]
	fld	dword ptr [dword3413+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3413+12]
label00c2:
; end of inline function vec4f_mul
	lea	dword3127,[ebp-700]
	mov	[ebp-756],dword3127
	mov	dword3129,[ebp-664]
	mov	[ebp-760],dword3129
	mov	dword3131,[ebp-660]
	mov	dword3133,[dword3131+192]
	imul	dword3133,24
	mov	dword3135,[ebp-660]
	add	dword3135,dword3133
	mov	[ebp-764],dword3135
; start of inline function vec4f_add
	mov	dword3203,[ebp-760]
	mov	dword3205,[ebp-756]
	fld	dword ptr [dword3203]
	fadd	dword ptr [dword3205]
	mov	dword3207,[ebp-764]
	fstp	dword ptr [dword3207]
	mov	dword3209,[ebp-760]
	mov	dword3211,[ebp-756]
	fld	dword ptr [dword3209+4]
	fadd	dword ptr [dword3211+4]
	mov	dword3213,[ebp-764]
	fstp	dword ptr [dword3213+4]
	mov	dword3215,[ebp-760]
	mov	dword3217,[ebp-756]
	fld	dword ptr [dword3215+8]
	fadd	dword ptr [dword3217+8]
	mov	dword3219,[ebp-764]
	fstp	dword ptr [dword3219+8]
	mov	dword3221,[ebp-760]
	mov	dword3223,[ebp-756]
	fld	dword ptr [dword3221+12]
	fadd	dword ptr [dword3223+12]
	mov	dword3225,[ebp-764]
	fstp	dword ptr [dword3225+12]
label00b9:
; end of inline function vec4f_add
	mov	dword3137,16
	add	dword3137,[ebp-664]
	mov	[ebp-736],dword3137
	mov	dword3139,16
	add	dword3139,[ebp-668]
	mov	[ebp-740],dword3139
	lea	dword3140,[ebp-708]
	mov	[ebp-744],dword3140
; start of inline function vec2f_subtract
	mov	dword3182,[ebp-740]
	mov	dword3184,[ebp-736]
	fld	dword ptr [dword3182]
	fsub	dword ptr [dword3184]
	mov	dword3186,[ebp-744]
	fstp	dword ptr [dword3186]
	mov	dword3188,[ebp-740]
	mov	dword3190,[ebp-736]
	fld	dword ptr [dword3188+4]
	fsub	dword ptr [dword3190+4]
	mov	dword3192,[ebp-744]
	fstp	dword ptr [dword3192+4]
label00b7:
; end of inline function vec2f_subtract
	mov	dword3193,[ebp-720]
	mov	[ebp-748],dword3193
	lea	dword3142,[ebp-708]
	mov	[ebp-752],dword3142
; start of inline function vec2f_mul
	mov	dword3196,[ebp-752]
	fld	dword ptr [dword3196]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3196]
	mov	dword3199,[ebp-752]
	fld	dword ptr [dword3199+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3199+4]
label00b8:
; end of inline function vec2f_mul
	lea	dword3143,[ebp-708]
	mov	[ebp-724],dword3143
	mov	dword3145,16
	add	dword3145,[ebp-664]
	mov	[ebp-728],dword3145
	mov	dword3147,[ebp-660]
	mov	dword3149,[dword3147+192]
	imul	dword3149,24
	mov	dword3151,[ebp-660]
	add	dword3151,dword3149
	add	dword3151,16
	mov	[ebp-732],dword3151
; start of inline function vec2f_add
	mov	dword3169,[ebp-728]
	mov	dword3171,[ebp-724]
	fld	dword ptr [dword3169]
	fadd	dword ptr [dword3171]
	mov	dword3173,[ebp-732]
	fstp	dword ptr [dword3173]
	mov	dword3175,[ebp-728]
	mov	dword3177,[ebp-724]
	fld	dword ptr [dword3175+4]
	fadd	dword ptr [dword3177+4]
	mov	dword3179,[ebp-732]
	fstp	dword ptr [dword3179+4]
label00b6:
; end of inline function vec2f_add
	mov	dword3154,[ebp-660]
	inc	dword ptr [dword3154+192]
label00b3:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00b0
label00b1:
	mov	dword3158,[ebp-660]
	mov	dword3159,[dword3158+192]
	inc	dword ptr [dword3158+192]
	imul	dword3159,24
	mov	dword3162,[ebp-660]
	add	dword3162,dword3159
	mov	dword3164,[ebp-660]
	mov	dword3165,[dword3164]
	mov	dword3166,[dword3164+4]
	mov	[dword3162],dword3165
	mov	[dword3162+4],dword3166
	mov	dword3165,[dword3164+8]
	mov	dword3166,[dword3164+12]
	mov	[dword3162+8],dword3165
	mov	[dword3162+12],dword3166
	mov	dword3165,[dword3164+16]
	mov	dword3166,[dword3164+20]
	mov	[dword3162+16],dword3165
	mov	[dword3162+20],dword3166
label00c3:
; end of inline function _clip_on_plain
	lea	dword1995,dword ptr [__clip_plane_top_norm]
	mov	[ebp-648],dword1995
	lea	dword1996,dword ptr [__clip_plane_top_base]
	mov	[ebp-652],dword1996
	mov	dword3415,[ebp-448]
	mov	[ebp-656],dword3415
	lea	dword1998,[ebp-644]
	mov	[ebp-660],dword1998
; start of inline function _clip_on_plain
	mov	dword3418,[ebp-660]
	mov	dword ptr [dword3418+192],0
	mov	dword3421,[ebp-656]
	mov	[ebp-664],dword3421
	mov	dword3424,[ebp-656]
	add	dword3424,24
	mov	[ebp-668],dword3424
label00c4:
label00c5:
	mov	dword3428,[ebp-656]
	mov	dword3430,[dword3428+192]
	imul	dword3430,24
	mov	dword3432,[ebp-656]
	add	dword3432,dword3430
	cmp	dword3432,[ebp-668]
	jle	label00c6
	mov	dword3578,[ebp-652]
	mov	[ebp-768],dword3578
	mov	dword3436,[ebp-664]
	mov	[ebp-772],dword3436
	lea	dword3437,[ebp-684]
	mov	[ebp-776],dword3437
; start of inline function vec4f_subtract
	mov	dword3581,[ebp-772]
	mov	dword3583,[ebp-768]
	fld	dword ptr [dword3581]
	fsub	dword ptr [dword3583]
	mov	dword3585,[ebp-776]
	fstp	dword ptr [dword3585]
	mov	dword3587,[ebp-772]
	mov	dword3589,[ebp-768]
	fld	dword ptr [dword3587+4]
	fsub	dword ptr [dword3589+4]
	mov	dword3591,[ebp-776]
	fstp	dword ptr [dword3591+4]
	mov	dword3593,[ebp-772]
	mov	dword3595,[ebp-768]
	fld	dword ptr [dword3593+8]
	fsub	dword ptr [dword3595+8]
	mov	dword3597,[ebp-776]
	fstp	dword ptr [dword3597+8]
	mov	dword3599,[ebp-772]
	mov	dword3601,[ebp-768]
	fld	dword ptr [dword3599+12]
	fsub	dword ptr [dword3601+12]
	mov	dword3603,[ebp-776]
	fstp	dword ptr [dword3603+12]
label00cf:
; end of inline function vec4f_subtract
	mov	dword3681,[ebp-648]
	mov	[ebp-780],dword3681
	lea	dword3439,[ebp-684]
	mov	[ebp-784],dword3439
; start of inline function vec4f_dot
	mov	dword3684,[ebp-784]
	mov	dword3686,[ebp-780]
	fld	dword ptr [dword3684+4]
	fmul	dword ptr [dword3686+4]
	mov	dword3688,[ebp-784]
	mov	dword3690,[ebp-780]
	fld	dword ptr [dword3688]
	fmul	dword ptr [dword3690]
	faddp
	mov	dword3692,[ebp-784]
	mov	dword3694,[ebp-780]
	fld	dword ptr [dword3692+8]
	fmul	dword ptr [dword3694+8]
	faddp
	mov	dword3696,[ebp-784]
	mov	dword3698,[ebp-780]
	fld	dword ptr [dword3696+12]
	fmul	dword ptr [dword3698+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d3:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword3604,[ebp-652]
	mov	[ebp-768],dword3604
	mov	dword3443,[ebp-668]
	mov	[ebp-772],dword3443
	lea	dword3444,[ebp-684]
	mov	[ebp-776],dword3444
; start of inline function vec4f_subtract
	mov	dword3607,[ebp-772]
	mov	dword3609,[ebp-768]
	fld	dword ptr [dword3607]
	fsub	dword ptr [dword3609]
	mov	dword3611,[ebp-776]
	fstp	dword ptr [dword3611]
	mov	dword3613,[ebp-772]
	mov	dword3615,[ebp-768]
	fld	dword ptr [dword3613+4]
	fsub	dword ptr [dword3615+4]
	mov	dword3617,[ebp-776]
	fstp	dword ptr [dword3617+4]
	mov	dword3619,[ebp-772]
	mov	dword3621,[ebp-768]
	fld	dword ptr [dword3619+8]
	fsub	dword ptr [dword3621+8]
	mov	dword3623,[ebp-776]
	fstp	dword ptr [dword3623+8]
	mov	dword3625,[ebp-772]
	mov	dword3627,[ebp-768]
	fld	dword ptr [dword3625+12]
	fsub	dword ptr [dword3627+12]
	mov	dword3629,[ebp-776]
	fstp	dword ptr [dword3629+12]
label00d0:
; end of inline function vec4f_subtract
	mov	dword3699,[ebp-648]
	mov	[ebp-780],dword3699
	lea	dword3446,[ebp-684]
	mov	[ebp-784],dword3446
; start of inline function vec4f_dot
	mov	dword3702,[ebp-784]
	mov	dword3704,[ebp-780]
	fld	dword ptr [dword3702+4]
	fmul	dword ptr [dword3704+4]
	mov	dword3706,[ebp-784]
	mov	dword3708,[ebp-780]
	fld	dword ptr [dword3706]
	fmul	dword ptr [dword3708]
	faddp
	mov	dword3710,[ebp-784]
	mov	dword3712,[ebp-780]
	fld	dword ptr [dword3710+8]
	fmul	dword ptr [dword3712+8]
	faddp
	mov	dword3714,[ebp-784]
	mov	dword3716,[ebp-780]
	fld	dword ptr [dword3714+12]
	fmul	dword ptr [dword3716+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d4:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-716]
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jb	label00c7
	mov	dword3450,[ebp-660]
	mov	dword3451,[dword3450+192]
	inc	dword ptr [dword3450+192]
	imul	dword3451,24
	mov	dword3454,[ebp-660]
	add	dword3454,dword3451
	mov	dword3456,[ebp-664]
	mov	dword3457,[dword3456]
	mov	dword3458,[dword3456+4]
	mov	[dword3454],dword3457
	mov	[dword3454+4],dword3458
	mov	dword3457,[dword3456+8]
	mov	dword3458,[dword3456+12]
	mov	[dword3454+8],dword3457
	mov	[dword3454+12],dword3458
	mov	dword3457,[dword3456+16]
	mov	dword3458,[dword3456+20]
	mov	[dword3454+16],dword3457
	mov	[dword3454+20],dword3458
label00c7:
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jbe	label00ca
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label00c9
label00ca:
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label00c8
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jae	label00c8
label00c9:
	mov	dword3464,[ebp-664]
	mov	[ebp-768],dword3464
	mov	dword3630,[ebp-652]
	mov	[ebp-772],dword3630
	lea	dword3466,[ebp-684]
	mov	[ebp-776],dword3466
; start of inline function vec4f_subtract
	mov	dword3633,[ebp-772]
	mov	dword3635,[ebp-768]
	fld	dword ptr [dword3633]
	fsub	dword ptr [dword3635]
	mov	dword3637,[ebp-776]
	fstp	dword ptr [dword3637]
	mov	dword3639,[ebp-772]
	mov	dword3641,[ebp-768]
	fld	dword ptr [dword3639+4]
	fsub	dword ptr [dword3641+4]
	mov	dword3643,[ebp-776]
	fstp	dword ptr [dword3643+4]
	mov	dword3645,[ebp-772]
	mov	dword3647,[ebp-768]
	fld	dword ptr [dword3645+8]
	fsub	dword ptr [dword3647+8]
	mov	dword3649,[ebp-776]
	fstp	dword ptr [dword3649+8]
	mov	dword3651,[ebp-772]
	mov	dword3653,[ebp-768]
	fld	dword ptr [dword3651+12]
	fsub	dword ptr [dword3653+12]
	mov	dword3655,[ebp-776]
	fstp	dword ptr [dword3655+12]
label00d1:
; end of inline function vec4f_subtract
	mov	dword3468,[ebp-664]
	mov	[ebp-768],dword3468
	mov	dword3470,[ebp-668]
	mov	[ebp-772],dword3470
	lea	dword3471,[ebp-700]
	mov	[ebp-776],dword3471
; start of inline function vec4f_subtract
	mov	dword3658,[ebp-772]
	mov	dword3660,[ebp-768]
	fld	dword ptr [dword3658]
	fsub	dword ptr [dword3660]
	mov	dword3662,[ebp-776]
	fstp	dword ptr [dword3662]
	mov	dword3664,[ebp-772]
	mov	dword3666,[ebp-768]
	fld	dword ptr [dword3664+4]
	fsub	dword ptr [dword3666+4]
	mov	dword3668,[ebp-776]
	fstp	dword ptr [dword3668+4]
	mov	dword3670,[ebp-772]
	mov	dword3672,[ebp-768]
	fld	dword ptr [dword3670+8]
	fsub	dword ptr [dword3672+8]
	mov	dword3674,[ebp-776]
	fstp	dword ptr [dword3674+8]
	mov	dword3676,[ebp-772]
	mov	dword3678,[ebp-768]
	fld	dword ptr [dword3676+12]
	fsub	dword ptr [dword3678+12]
	mov	dword3680,[ebp-776]
	fstp	dword ptr [dword3680+12]
label00d2:
; end of inline function vec4f_subtract
	mov	dword3717,[ebp-648]
	mov	[ebp-780],dword3717
	lea	dword3473,[ebp-684]
	mov	[ebp-784],dword3473
; start of inline function vec4f_dot
	mov	dword3720,[ebp-784]
	mov	dword3722,[ebp-780]
	fld	dword ptr [dword3720+4]
	fmul	dword ptr [dword3722+4]
	mov	dword3724,[ebp-784]
	mov	dword3726,[ebp-780]
	fld	dword ptr [dword3724]
	fmul	dword ptr [dword3726]
	faddp
	mov	dword3728,[ebp-784]
	mov	dword3730,[ebp-780]
	fld	dword ptr [dword3728+8]
	fmul	dword ptr [dword3730+8]
	faddp
	mov	dword3732,[ebp-784]
	mov	dword3734,[ebp-780]
	fld	dword ptr [dword3732+12]
	fmul	dword ptr [dword3734+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d5:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword3735,[ebp-648]
	mov	[ebp-780],dword3735
	lea	dword3475,[ebp-700]
	mov	[ebp-784],dword3475
; start of inline function vec4f_dot
	mov	dword3738,[ebp-784]
	mov	dword3740,[ebp-780]
	fld	dword ptr [dword3738+4]
	fmul	dword ptr [dword3740+4]
	mov	dword3742,[ebp-784]
	mov	dword3744,[ebp-780]
	fld	dword ptr [dword3742]
	fmul	dword ptr [dword3744]
	faddp
	mov	dword3746,[ebp-784]
	mov	dword3748,[ebp-780]
	fld	dword ptr [dword3746+8]
	fmul	dword ptr [dword3748+8]
	faddp
	mov	dword3750,[ebp-784]
	mov	dword3752,[ebp-780]
	fld	dword ptr [dword3750+12]
	fmul	dword ptr [dword3752+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d6:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword3753,[ebp-720]
	mov	[ebp-792],dword3753
	lea	dword3478,[ebp-700]
	mov	[ebp-796],dword3478
; start of inline function vec4f_mul
	mov	dword3756,[ebp-796]
	fld	dword ptr [dword3756]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3756]
	mov	dword3759,[ebp-796]
	fld	dword ptr [dword3759+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3759+4]
	mov	dword3762,[ebp-796]
	fld	dword ptr [dword3762+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3762+8]
	mov	dword3765,[ebp-796]
	fld	dword ptr [dword3765+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3765+12]
label00d7:
; end of inline function vec4f_mul
	lea	dword3479,[ebp-700]
	mov	[ebp-756],dword3479
	mov	dword3481,[ebp-664]
	mov	[ebp-760],dword3481
	mov	dword3483,[ebp-660]
	mov	dword3485,[dword3483+192]
	imul	dword3485,24
	mov	dword3487,[ebp-660]
	add	dword3487,dword3485
	mov	[ebp-764],dword3487
; start of inline function vec4f_add
	mov	dword3555,[ebp-760]
	mov	dword3557,[ebp-756]
	fld	dword ptr [dword3555]
	fadd	dword ptr [dword3557]
	mov	dword3559,[ebp-764]
	fstp	dword ptr [dword3559]
	mov	dword3561,[ebp-760]
	mov	dword3563,[ebp-756]
	fld	dword ptr [dword3561+4]
	fadd	dword ptr [dword3563+4]
	mov	dword3565,[ebp-764]
	fstp	dword ptr [dword3565+4]
	mov	dword3567,[ebp-760]
	mov	dword3569,[ebp-756]
	fld	dword ptr [dword3567+8]
	fadd	dword ptr [dword3569+8]
	mov	dword3571,[ebp-764]
	fstp	dword ptr [dword3571+8]
	mov	dword3573,[ebp-760]
	mov	dword3575,[ebp-756]
	fld	dword ptr [dword3573+12]
	fadd	dword ptr [dword3575+12]
	mov	dword3577,[ebp-764]
	fstp	dword ptr [dword3577+12]
label00ce:
; end of inline function vec4f_add
	mov	dword3489,16
	add	dword3489,[ebp-664]
	mov	[ebp-736],dword3489
	mov	dword3491,16
	add	dword3491,[ebp-668]
	mov	[ebp-740],dword3491
	lea	dword3492,[ebp-708]
	mov	[ebp-744],dword3492
; start of inline function vec2f_subtract
	mov	dword3534,[ebp-740]
	mov	dword3536,[ebp-736]
	fld	dword ptr [dword3534]
	fsub	dword ptr [dword3536]
	mov	dword3538,[ebp-744]
	fstp	dword ptr [dword3538]
	mov	dword3540,[ebp-740]
	mov	dword3542,[ebp-736]
	fld	dword ptr [dword3540+4]
	fsub	dword ptr [dword3542+4]
	mov	dword3544,[ebp-744]
	fstp	dword ptr [dword3544+4]
label00cc:
; end of inline function vec2f_subtract
	mov	dword3545,[ebp-720]
	mov	[ebp-748],dword3545
	lea	dword3494,[ebp-708]
	mov	[ebp-752],dword3494
; start of inline function vec2f_mul
	mov	dword3548,[ebp-752]
	fld	dword ptr [dword3548]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3548]
	mov	dword3551,[ebp-752]
	fld	dword ptr [dword3551+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3551+4]
label00cd:
; end of inline function vec2f_mul
	lea	dword3495,[ebp-708]
	mov	[ebp-724],dword3495
	mov	dword3497,16
	add	dword3497,[ebp-664]
	mov	[ebp-728],dword3497
	mov	dword3499,[ebp-660]
	mov	dword3501,[dword3499+192]
	imul	dword3501,24
	mov	dword3503,[ebp-660]
	add	dword3503,dword3501
	add	dword3503,16
	mov	[ebp-732],dword3503
; start of inline function vec2f_add
	mov	dword3521,[ebp-728]
	mov	dword3523,[ebp-724]
	fld	dword ptr [dword3521]
	fadd	dword ptr [dword3523]
	mov	dword3525,[ebp-732]
	fstp	dword ptr [dword3525]
	mov	dword3527,[ebp-728]
	mov	dword3529,[ebp-724]
	fld	dword ptr [dword3527+4]
	fadd	dword ptr [dword3529+4]
	mov	dword3531,[ebp-732]
	fstp	dword ptr [dword3531+4]
label00cb:
; end of inline function vec2f_add
	mov	dword3506,[ebp-660]
	inc	dword ptr [dword3506+192]
label00c8:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00c5
label00c6:
	mov	dword3510,[ebp-660]
	mov	dword3511,[dword3510+192]
	inc	dword ptr [dword3510+192]
	imul	dword3511,24
	mov	dword3514,[ebp-660]
	add	dword3514,dword3511
	mov	dword3516,[ebp-660]
	mov	dword3517,[dword3516]
	mov	dword3518,[dword3516+4]
	mov	[dword3514],dword3517
	mov	[dword3514+4],dword3518
	mov	dword3517,[dword3516+8]
	mov	dword3518,[dword3516+12]
	mov	[dword3514+8],dword3517
	mov	[dword3514+12],dword3518
	mov	dword3517,[dword3516+16]
	mov	dword3518,[dword3516+20]
	mov	[dword3514+16],dword3517
	mov	[dword3514+20],dword3518
label00d8:
; end of inline function _clip_on_plain
	lea	dword1999,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-648],dword1999
	lea	dword2000,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-652],dword2000
	lea	dword2001,[ebp-644]
	mov	[ebp-656],dword2001
	mov	dword3767,[ebp-448]
	mov	[ebp-660],dword3767
; start of inline function _clip_on_plain
	mov	dword3770,[ebp-660]
	mov	dword ptr [dword3770+192],0
	mov	dword3773,[ebp-656]
	mov	[ebp-664],dword3773
	mov	dword3776,[ebp-656]
	add	dword3776,24
	mov	[ebp-668],dword3776
label00d9:
label00da:
	mov	dword3780,[ebp-656]
	mov	dword3782,[dword3780+192]
	imul	dword3782,24
	mov	dword3784,[ebp-656]
	add	dword3784,dword3782
	cmp	dword3784,[ebp-668]
	jle	label00db
	mov	dword3930,[ebp-652]
	mov	[ebp-768],dword3930
	mov	dword3788,[ebp-664]
	mov	[ebp-772],dword3788
	lea	dword3789,[ebp-684]
	mov	[ebp-776],dword3789
; start of inline function vec4f_subtract
	mov	dword3933,[ebp-772]
	mov	dword3935,[ebp-768]
	fld	dword ptr [dword3933]
	fsub	dword ptr [dword3935]
	mov	dword3937,[ebp-776]
	fstp	dword ptr [dword3937]
	mov	dword3939,[ebp-772]
	mov	dword3941,[ebp-768]
	fld	dword ptr [dword3939+4]
	fsub	dword ptr [dword3941+4]
	mov	dword3943,[ebp-776]
	fstp	dword ptr [dword3943+4]
	mov	dword3945,[ebp-772]
	mov	dword3947,[ebp-768]
	fld	dword ptr [dword3945+8]
	fsub	dword ptr [dword3947+8]
	mov	dword3949,[ebp-776]
	fstp	dword ptr [dword3949+8]
	mov	dword3951,[ebp-772]
	mov	dword3953,[ebp-768]
	fld	dword ptr [dword3951+12]
	fsub	dword ptr [dword3953+12]
	mov	dword3955,[ebp-776]
	fstp	dword ptr [dword3955+12]
label00e4:
; end of inline function vec4f_subtract
	mov	dword4033,[ebp-648]
	mov	[ebp-780],dword4033
	lea	dword3791,[ebp-684]
	mov	[ebp-784],dword3791
; start of inline function vec4f_dot
	mov	dword4036,[ebp-784]
	mov	dword4038,[ebp-780]
	fld	dword ptr [dword4036+4]
	fmul	dword ptr [dword4038+4]
	mov	dword4040,[ebp-784]
	mov	dword4042,[ebp-780]
	fld	dword ptr [dword4040]
	fmul	dword ptr [dword4042]
	faddp
	mov	dword4044,[ebp-784]
	mov	dword4046,[ebp-780]
	fld	dword ptr [dword4044+8]
	fmul	dword ptr [dword4046+8]
	faddp
	mov	dword4048,[ebp-784]
	mov	dword4050,[ebp-780]
	fld	dword ptr [dword4048+12]
	fmul	dword ptr [dword4050+12]
	faddp
	fstp	dword ptr [ebp-788]
label00e8:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword3956,[ebp-652]
	mov	[ebp-768],dword3956
	mov	dword3795,[ebp-668]
	mov	[ebp-772],dword3795
	lea	dword3796,[ebp-684]
	mov	[ebp-776],dword3796
; start of inline function vec4f_subtract
	mov	dword3959,[ebp-772]
	mov	dword3961,[ebp-768]
	fld	dword ptr [dword3959]
	fsub	dword ptr [dword3961]
	mov	dword3963,[ebp-776]
	fstp	dword ptr [dword3963]
	mov	dword3965,[ebp-772]
	mov	dword3967,[ebp-768]
	fld	dword ptr [dword3965+4]
	fsub	dword ptr [dword3967+4]
	mov	dword3969,[ebp-776]
	fstp	dword ptr [dword3969+4]
	mov	dword3971,[ebp-772]
	mov	dword3973,[ebp-768]
	fld	dword ptr [dword3971+8]
	fsub	dword ptr [dword3973+8]
	mov	dword3975,[ebp-776]
	fstp	dword ptr [dword3975+8]
	mov	dword3977,[ebp-772]
	mov	dword3979,[ebp-768]
	fld	dword ptr [dword3977+12]
	fsub	dword ptr [dword3979+12]
	mov	dword3981,[ebp-776]
	fstp	dword ptr [dword3981+12]
label00e5:
; end of inline function vec4f_subtract
	mov	dword4051,[ebp-648]
	mov	[ebp-780],dword4051
	lea	dword3798,[ebp-684]
	mov	[ebp-784],dword3798
; start of inline function vec4f_dot
	mov	dword4054,[ebp-784]
	mov	dword4056,[ebp-780]
	fld	dword ptr [dword4054+4]
	fmul	dword ptr [dword4056+4]
	mov	dword4058,[ebp-784]
	mov	dword4060,[ebp-780]
	fld	dword ptr [dword4058]
	fmul	dword ptr [dword4060]
	faddp
	mov	dword4062,[ebp-784]
	mov	dword4064,[ebp-780]
	fld	dword ptr [dword4062+8]
	fmul	dword ptr [dword4064+8]
	faddp
	mov	dword4066,[ebp-784]
	mov	dword4068,[ebp-780]
	fld	dword ptr [dword4066+12]
	fmul	dword ptr [dword4068+12]
	faddp
	fstp	dword ptr [ebp-788]
label00e9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-716]
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jb	label00dc
	mov	dword3802,[ebp-660]
	mov	dword3803,[dword3802+192]
	inc	dword ptr [dword3802+192]
	imul	dword3803,24
	mov	dword3806,[ebp-660]
	add	dword3806,dword3803
	mov	dword3808,[ebp-664]
	mov	dword3809,[dword3808]
	mov	dword3810,[dword3808+4]
	mov	[dword3806],dword3809
	mov	[dword3806+4],dword3810
	mov	dword3809,[dword3808+8]
	mov	dword3810,[dword3808+12]
	mov	[dword3806+8],dword3809
	mov	[dword3806+12],dword3810
	mov	dword3809,[dword3808+16]
	mov	dword3810,[dword3808+20]
	mov	[dword3806+16],dword3809
	mov	[dword3806+20],dword3810
label00dc:
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jbe	label00df
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label00de
label00df:
	fldz
	fld	dword ptr [ebp-716]
	fucomip	st,st(1)
	fstp	st
	jb	label00dd
	fldz
	fld	dword ptr [ebp-712]
	fucomip	st,st(1)
	fstp	st
	jae	label00dd
label00de:
	mov	dword3816,[ebp-664]
	mov	[ebp-768],dword3816
	mov	dword3982,[ebp-652]
	mov	[ebp-772],dword3982
	lea	dword3818,[ebp-684]
	mov	[ebp-776],dword3818
; start of inline function vec4f_subtract
	mov	dword3985,[ebp-772]
	mov	dword3987,[ebp-768]
	fld	dword ptr [dword3985]
	fsub	dword ptr [dword3987]
	mov	dword3989,[ebp-776]
	fstp	dword ptr [dword3989]
	mov	dword3991,[ebp-772]
	mov	dword3993,[ebp-768]
	fld	dword ptr [dword3991+4]
	fsub	dword ptr [dword3993+4]
	mov	dword3995,[ebp-776]
	fstp	dword ptr [dword3995+4]
	mov	dword3997,[ebp-772]
	mov	dword3999,[ebp-768]
	fld	dword ptr [dword3997+8]
	fsub	dword ptr [dword3999+8]
	mov	dword4001,[ebp-776]
	fstp	dword ptr [dword4001+8]
	mov	dword4003,[ebp-772]
	mov	dword4005,[ebp-768]
	fld	dword ptr [dword4003+12]
	fsub	dword ptr [dword4005+12]
	mov	dword4007,[ebp-776]
	fstp	dword ptr [dword4007+12]
label00e6:
; end of inline function vec4f_subtract
	mov	dword3820,[ebp-664]
	mov	[ebp-768],dword3820
	mov	dword3822,[ebp-668]
	mov	[ebp-772],dword3822
	lea	dword3823,[ebp-700]
	mov	[ebp-776],dword3823
; start of inline function vec4f_subtract
	mov	dword4010,[ebp-772]
	mov	dword4012,[ebp-768]
	fld	dword ptr [dword4010]
	fsub	dword ptr [dword4012]
	mov	dword4014,[ebp-776]
	fstp	dword ptr [dword4014]
	mov	dword4016,[ebp-772]
	mov	dword4018,[ebp-768]
	fld	dword ptr [dword4016+4]
	fsub	dword ptr [dword4018+4]
	mov	dword4020,[ebp-776]
	fstp	dword ptr [dword4020+4]
	mov	dword4022,[ebp-772]
	mov	dword4024,[ebp-768]
	fld	dword ptr [dword4022+8]
	fsub	dword ptr [dword4024+8]
	mov	dword4026,[ebp-776]
	fstp	dword ptr [dword4026+8]
	mov	dword4028,[ebp-772]
	mov	dword4030,[ebp-768]
	fld	dword ptr [dword4028+12]
	fsub	dword ptr [dword4030+12]
	mov	dword4032,[ebp-776]
	fstp	dword ptr [dword4032+12]
label00e7:
; end of inline function vec4f_subtract
	mov	dword4069,[ebp-648]
	mov	[ebp-780],dword4069
	lea	dword3825,[ebp-684]
	mov	[ebp-784],dword3825
; start of inline function vec4f_dot
	mov	dword4072,[ebp-784]
	mov	dword4074,[ebp-780]
	fld	dword ptr [dword4072+4]
	fmul	dword ptr [dword4074+4]
	mov	dword4076,[ebp-784]
	mov	dword4078,[ebp-780]
	fld	dword ptr [dword4076]
	fmul	dword ptr [dword4078]
	faddp
	mov	dword4080,[ebp-784]
	mov	dword4082,[ebp-780]
	fld	dword ptr [dword4080+8]
	fmul	dword ptr [dword4082+8]
	faddp
	mov	dword4084,[ebp-784]
	mov	dword4086,[ebp-780]
	fld	dword ptr [dword4084+12]
	fmul	dword ptr [dword4086+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ea:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword4087,[ebp-648]
	mov	[ebp-780],dword4087
	lea	dword3827,[ebp-700]
	mov	[ebp-784],dword3827
; start of inline function vec4f_dot
	mov	dword4090,[ebp-784]
	mov	dword4092,[ebp-780]
	fld	dword ptr [dword4090+4]
	fmul	dword ptr [dword4092+4]
	mov	dword4094,[ebp-784]
	mov	dword4096,[ebp-780]
	fld	dword ptr [dword4094]
	fmul	dword ptr [dword4096]
	faddp
	mov	dword4098,[ebp-784]
	mov	dword4100,[ebp-780]
	fld	dword ptr [dword4098+8]
	fmul	dword ptr [dword4100+8]
	faddp
	mov	dword4102,[ebp-784]
	mov	dword4104,[ebp-780]
	fld	dword ptr [dword4102+12]
	fmul	dword ptr [dword4104+12]
	faddp
	fstp	dword ptr [ebp-788]
label00eb:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword4105,[ebp-720]
	mov	[ebp-792],dword4105
	lea	dword3830,[ebp-700]
	mov	[ebp-796],dword3830
; start of inline function vec4f_mul
	mov	dword4108,[ebp-796]
	fld	dword ptr [dword4108]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword4108]
	mov	dword4111,[ebp-796]
	fld	dword ptr [dword4111+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword4111+4]
	mov	dword4114,[ebp-796]
	fld	dword ptr [dword4114+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword4114+8]
	mov	dword4117,[ebp-796]
	fld	dword ptr [dword4117+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword4117+12]
label00ec:
; end of inline function vec4f_mul
	lea	dword3831,[ebp-700]
	mov	[ebp-756],dword3831
	mov	dword3833,[ebp-664]
	mov	[ebp-760],dword3833
	mov	dword3835,[ebp-660]
	mov	dword3837,[dword3835+192]
	imul	dword3837,24
	mov	dword3839,[ebp-660]
	add	dword3839,dword3837
	mov	[ebp-764],dword3839
; start of inline function vec4f_add
	mov	dword3907,[ebp-760]
	mov	dword3909,[ebp-756]
	fld	dword ptr [dword3907]
	fadd	dword ptr [dword3909]
	mov	dword3911,[ebp-764]
	fstp	dword ptr [dword3911]
	mov	dword3913,[ebp-760]
	mov	dword3915,[ebp-756]
	fld	dword ptr [dword3913+4]
	fadd	dword ptr [dword3915+4]
	mov	dword3917,[ebp-764]
	fstp	dword ptr [dword3917+4]
	mov	dword3919,[ebp-760]
	mov	dword3921,[ebp-756]
	fld	dword ptr [dword3919+8]
	fadd	dword ptr [dword3921+8]
	mov	dword3923,[ebp-764]
	fstp	dword ptr [dword3923+8]
	mov	dword3925,[ebp-760]
	mov	dword3927,[ebp-756]
	fld	dword ptr [dword3925+12]
	fadd	dword ptr [dword3927+12]
	mov	dword3929,[ebp-764]
	fstp	dword ptr [dword3929+12]
label00e3:
; end of inline function vec4f_add
	mov	dword3841,16
	add	dword3841,[ebp-664]
	mov	[ebp-736],dword3841
	mov	dword3843,16
	add	dword3843,[ebp-668]
	mov	[ebp-740],dword3843
	lea	dword3844,[ebp-708]
	mov	[ebp-744],dword3844
; start of inline function vec2f_subtract
	mov	dword3886,[ebp-740]
	mov	dword3888,[ebp-736]
	fld	dword ptr [dword3886]
	fsub	dword ptr [dword3888]
	mov	dword3890,[ebp-744]
	fstp	dword ptr [dword3890]
	mov	dword3892,[ebp-740]
	mov	dword3894,[ebp-736]
	fld	dword ptr [dword3892+4]
	fsub	dword ptr [dword3894+4]
	mov	dword3896,[ebp-744]
	fstp	dword ptr [dword3896+4]
label00e1:
; end of inline function vec2f_subtract
	mov	dword3897,[ebp-720]
	mov	[ebp-748],dword3897
	lea	dword3846,[ebp-708]
	mov	[ebp-752],dword3846
; start of inline function vec2f_mul
	mov	dword3900,[ebp-752]
	fld	dword ptr [dword3900]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3900]
	mov	dword3903,[ebp-752]
	fld	dword ptr [dword3903+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3903+4]
label00e2:
; end of inline function vec2f_mul
	lea	dword3847,[ebp-708]
	mov	[ebp-724],dword3847
	mov	dword3849,16
	add	dword3849,[ebp-664]
	mov	[ebp-728],dword3849
	mov	dword3851,[ebp-660]
	mov	dword3853,[dword3851+192]
	imul	dword3853,24
	mov	dword3855,[ebp-660]
	add	dword3855,dword3853
	add	dword3855,16
	mov	[ebp-732],dword3855
; start of inline function vec2f_add
	mov	dword3873,[ebp-728]
	mov	dword3875,[ebp-724]
	fld	dword ptr [dword3873]
	fadd	dword ptr [dword3875]
	mov	dword3877,[ebp-732]
	fstp	dword ptr [dword3877]
	mov	dword3879,[ebp-728]
	mov	dword3881,[ebp-724]
	fld	dword ptr [dword3879+4]
	fadd	dword ptr [dword3881+4]
	mov	dword3883,[ebp-732]
	fstp	dword ptr [dword3883+4]
label00e0:
; end of inline function vec2f_add
	mov	dword3858,[ebp-660]
	inc	dword ptr [dword3858+192]
label00dd:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00da
label00db:
	mov	dword3862,[ebp-660]
	mov	dword3863,[dword3862+192]
	inc	dword ptr [dword3862+192]
	imul	dword3863,24
	mov	dword3866,[ebp-660]
	add	dword3866,dword3863
	mov	dword3868,[ebp-660]
	mov	dword3869,[dword3868]
	mov	dword3870,[dword3868+4]
	mov	[dword3866],dword3869
	mov	[dword3866+4],dword3870
	mov	dword3869,[dword3868+8]
	mov	dword3870,[dword3868+12]
	mov	[dword3866+8],dword3869
	mov	[dword3866+12],dword3870
	mov	dword3869,[dword3868+16]
	mov	dword3870,[dword3868+20]
	mov	[dword3866+16],dword3869
	mov	[dword3866+20],dword3870
label00ed:
; end of inline function _clip_on_plain
	mov	dword2004,[ebp-448]
	cmp	dword ptr [dword2004+192],1
	setg	byte31
	movzx	dword2006,byte31
	mov	[ebp-800],dword2006
label00ee:
; end of inline function _clip_poligon
	mov	dword2,[ebp-800]
	cmp	dword2,0
	jne	label0000
	destroy_stack_frame
	ret
label0000:
	mov	dword4,[ebp+8]
	cmp	dword ptr [dword4+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword ptr [ebp-136],0
label0002:
label0003:
	mov	dword11,[ebp+8]
	mov	dword13,[dword11+192]
	cmp	dword13,[ebp-136]
	jle	label0004
	mov	dword15,[ebp+8]
	mov	dword18,[ebp-136]
	imul	dword18,24
	add	dword15,dword18
	mov	[ebp-804],dword15
	lea	dword19,[ebp-132]
	sal	dword ptr [ebp-136],4
	add	dword19,[ebp-136]
	mov	[ebp-808],dword19
; start of inline function _transform_to_screen_space
	lea	dword4120,dword ptr [__viewport_matrix]
	mov	[ebp-832],dword4120
	mov	dword4153,[ebp-804]
	mov	[ebp-836],dword4153
	lea	dword4122,[ebp-824]
	mov	[ebp-840],dword4122
; start of inline function matrix4f_transform
	mov	dword4156,[ebp-836]
	mov	dword4158,[ebp-832]
	fld	dword ptr [dword4156+4]
	fmul	dword ptr [dword4158+16]
	mov	dword4160,[ebp-836]
	mov	dword4162,[ebp-832]
	fld	dword ptr [dword4160]
	fmul	dword ptr [dword4162]
	faddp
	mov	dword4164,[ebp-836]
	mov	dword4166,[ebp-832]
	fld	dword ptr [dword4164+8]
	fmul	dword ptr [dword4166+32]
	faddp
	mov	dword4168,[ebp-836]
	mov	dword4170,[ebp-832]
	fld	dword ptr [dword4168+12]
	fmul	dword ptr [dword4170+48]
	faddp
	mov	dword4172,[ebp-840]
	fstp	dword ptr [dword4172]
	mov	dword4174,[ebp-832]
	mov	dword4176,[ebp-836]
	fld	dword ptr [dword4176]
	fmul	dword ptr [dword4174+4]
	mov	dword4178,[ebp-836]
	mov	dword4180,[ebp-832]
	fld	dword ptr [dword4178+4]
	fmul	dword ptr [dword4180+20]
	faddp
	mov	dword4182,[ebp-836]
	mov	dword4184,[ebp-832]
	fld	dword ptr [dword4182+8]
	fmul	dword ptr [dword4184+36]
	faddp
	mov	dword4186,[ebp-836]
	mov	dword4188,[ebp-832]
	fld	dword ptr [dword4186+12]
	fmul	dword ptr [dword4188+52]
	faddp
	mov	dword4190,[ebp-840]
	fstp	dword ptr [dword4190+4]
	mov	dword4192,[ebp-832]
	mov	dword4194,[ebp-836]
	fld	dword ptr [dword4194]
	fmul	dword ptr [dword4192+8]
	mov	dword4196,[ebp-836]
	mov	dword4198,[ebp-832]
	fld	dword ptr [dword4196+4]
	fmul	dword ptr [dword4198+24]
	faddp
	mov	dword4200,[ebp-836]
	mov	dword4202,[ebp-832]
	fld	dword ptr [dword4200+8]
	fmul	dword ptr [dword4202+40]
	faddp
	mov	dword4204,[ebp-836]
	mov	dword4206,[ebp-832]
	fld	dword ptr [dword4204+12]
	fmul	dword ptr [dword4206+56]
	faddp
	mov	dword4208,[ebp-840]
	fstp	dword ptr [dword4208+8]
	mov	dword4210,[ebp-832]
	mov	dword4212,[ebp-836]
	fld	dword ptr [dword4212]
	fmul	dword ptr [dword4210+12]
	mov	dword4214,[ebp-836]
	mov	dword4216,[ebp-832]
	fld	dword ptr [dword4214+4]
	fmul	dword ptr [dword4216+28]
	faddp
	mov	dword4218,[ebp-836]
	mov	dword4220,[ebp-832]
	fld	dword ptr [dword4218+8]
	fmul	dword ptr [dword4220+44]
	faddp
	mov	dword4222,[ebp-836]
	mov	dword4224,[ebp-832]
	fld	dword ptr [dword4222+12]
	fmul	dword ptr [dword4224+60]
	faddp
	mov	dword4226,[ebp-840]
	fstp	dword ptr [dword4226+12]
label00f1:
; end of inline function matrix4f_transform
	lea	dword4123,[ebp-824]
	add	dword4123,12
	fld1
	fdiv	dword ptr [dword4123]
	fstp	dword ptr [ebp-828]
	fld	dword ptr [ebp-824]
	fmul	dword ptr [ebp-828]
	float2int	dword4128
	mov	dword4130,[ebp-808]
	mov	[dword4130],dword4128
	lea	dword4131,[ebp-824]
	add	dword4131,4
	fld	dword ptr [dword4131]
	fmul	dword ptr [ebp-828]
	float2int	dword4134
	mov	dword4136,[ebp-808]
	mov	[dword4136+4],dword4134
	mov	dword4138,[ebp-808]
	cmp	dword ptr [dword4138],0
	jl	label00f0
	mov	dword4141,[ebp-808]
	mov	dword4143,[dword4141]
	cmp	dword4143,dword ptr [__width]
	jge	label00f0
	mov	dword4145,[ebp-808]
	cmp	dword ptr [dword4145+4],0
	jl	label00f0
	mov	dword4148,[ebp-808]
	mov	dword4150,[dword4148+4]
	cmp	dword4150,dword ptr [__height]
	jl	label00ef
label00f0:
	mov	dword ptr ds:[0],0
label00ef:
label00f2:
; end of inline function _transform_to_screen_space
	lea	dword22,[ebp-132]
	sal	dword ptr [ebp-136],4
	add	dword22,[ebp-136]
	add	dword22,8
	mov	dword27,[ebp+8]
	mov	dword30,[ebp-136]
	imul	dword30,24
	add	dword27,dword30
	add	dword27,16
	mov	dword32,[dword27]
	mov	dword33,[dword27+4]
	mov	[dword22],dword32
	mov	[dword22+4],dword33
	inc	dword ptr [ebp-136]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-136],2
label0005:
label0006:
	mov	dword38,[ebp+8]
	mov	dword40,[dword38+192]
	dec	dword40
	cmp	dword40,[ebp-136]
	jle	label0007
	lea	dword42,[ebp-132]
	sal	dword ptr [ebp-136],4
	add	dword42,[ebp-136]
	mov	[ebp-140],dword42
	mov	dword47,[ebp-136]
	dec	dword47
	sal	dword47,4
	lea	dword49,[ebp-132]
	add	dword49,dword47
	mov	[ebp-144],dword49
	lea	dword50,[ebp-132]
	mov	[ebp-148],dword50
; start of inline function _rasterize_triangle_2i
	mov	dword54,[ebp-148]
	add	dword54,4
	mov	dword57,[ebp-144]
	add	dword57,4
	mov	dword59,[dword54]
	cmp	dword59,[dword57]
	jle	label0008
	mov	dword62,[ebp-148]
	mov	[ebp-152],dword62
	mov	dword65,[ebp-144]
	mov	[ebp-148],dword65
	mov	dword68,[ebp-152]
	mov	[ebp-144],dword68
label0008:
	mov	dword70,[ebp-148]
	add	dword70,4
	mov	dword73,[ebp-140]
	add	dword73,4
	mov	dword75,[dword70]
	cmp	dword75,[dword73]
	jle	label0009
	mov	dword78,[ebp-148]
	mov	[ebp-152],dword78
	mov	dword81,[ebp-140]
	mov	[ebp-148],dword81
	mov	dword84,[ebp-152]
	mov	[ebp-140],dword84
label0009:
	mov	dword86,[ebp-144]
	add	dword86,4
	mov	dword89,[ebp-140]
	add	dword89,4
	mov	dword91,[dword86]
	cmp	dword91,[dword89]
	jle	label000a
	mov	dword94,[ebp-144]
	mov	[ebp-152],dword94
	mov	dword97,[ebp-140]
	mov	[ebp-144],dword97
	mov	dword100,[ebp-152]
	mov	[ebp-140],dword100
label000a:
	mov	dword102,[ebp-148]
	add	dword102,4
	mov	dword105,[ebp-140]
	add	dword105,4
	mov	dword107,[dword102]
	cmp	dword107,[dword105]
	jne	label000b
	mov	dword109,[ebp-148]
	add	dword109,4
	cmp	dword ptr [dword109],0
	jl	label000c
	mov	dword113,[ebp-148]
	add	dword113,4
	mov	dword116,[dword113]
	cmp	dword116,dword ptr [__height]
	jge	label000c
	fldz
	fstp	dword ptr [ebp-320]
	fldz
	fstp	dword ptr [ebp-324]
	mov	dword118,8
	add	dword118,[ebp-140]
	mov	[ebp-328],dword118
	mov	dword120,8
	add	dword120,[ebp-144]
	mov	[ebp-332],dword120
	mov	dword122,8
	add	dword122,[ebp-148]
	mov	[ebp-336],dword122
	mov	dword124,[ebp-148]
	add	dword124,4
	mov	dword1270,[dword124]
	mov	[ebp-340],dword1270
	mov	dword127,[ebp-140]
	mov	dword1269,[dword127]
	mov	[ebp-344],dword1269
	mov	dword129,[ebp-144]
	mov	dword1268,[dword129]
	mov	[ebp-348],dword1268
	mov	dword131,[ebp-148]
	mov	dword1267,[dword131]
	mov	[ebp-352],dword1267
; start of inline function _rasterize_triangle_1i
	mov	dword1274,[ebp-352]
	cmp	dword1274,[ebp-348]
	jge	label0040
	mov	dword1277,[ebp-344]
	cmp	dword1277,[ebp-348]
	jle	label0041
	mov	dword1347,[ebp-320]
	mov	[ebp-356],dword1347
	mov	dword1346,[ebp-324]
	mov	[ebp-360],dword1346
	mov	dword1281,[ebp-336]
	mov	dword1345,[dword1281+4]
	mov	[ebp-364],dword1345
	mov	dword1283,[ebp-336]
	mov	dword1344,[dword1283]
	mov	[ebp-368],dword1344
	mov	dword1343,[ebp-340]
	mov	[ebp-372],dword1343
	mov	dword1342,[ebp-344]
	mov	[ebp-376],dword1342
	mov	dword1341,[ebp-352]
	mov	[ebp-380],dword1341
; start of inline function _rasterize_horiz_line
	mov	dword1351,dword ptr [__pitch]
	imul	dword1351,[ebp-372]
	add	dword1351,dword ptr [__videomem]
	sal	dword ptr [ebp-380],2
	add	dword1351,[ebp-380]
	mov	[ebp-384],dword1351
	sal	dword ptr [ebp-376],2
	mov	dword1359,[ebp-384]
	add	dword1359,[ebp-376]
	sal	dword ptr [ebp-380],2
	sub	dword1359,[ebp-380]
	mov	[ebp-388],dword1359
label004a:
	mov	dword1427,[ebp-364]
	mov	[ebp-428],dword1427
	mov	dword1426,[ebp-368]
	mov	[ebp-432],dword1426
; start of inline function _tex2d
	mov	dword1431,dword ptr [__texture_width]
	dec	dword1431
	int2float	dword1431
	fmul	dword ptr [ebp-432]
	float2int	dword1433
	mov	[ebp-436],dword1433
	mov	dword1437,dword ptr [__texture_height]
	dec	dword1437
	int2float	dword1437
	fmul	dword ptr [ebp-428]
	float2int	dword1439
	mov	[ebp-440],dword1439
	mov	dword1443,[ebp-440]
	imul	dword1443,dword ptr [__texture_width]
	add	dword1443,[ebp-436]
	sal	dword1443,2
	add	dword1443,dword ptr [__texture_data]
	mov	dword1447,[dword1443]
	mov	[ebp-444],dword1447
label004e:
; end of inline function _tex2d
	mov	dword1365,[ebp-444]
	mov	[ebp-392],dword1365
	sar	dword ptr [ebp-392],24
	mov	dword1370,[ebp-392]
	and	dword1370,-289
	mov	[ebp-420],dword1370
	cmp	dword ptr [ebp-420],0
	je	label004d
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1377,[ebp-384]
	mov	dword1379,[dword1377]
	mov	[ebp-408],dword1379
	mov	dword1382,[ebp-408]
	and	dword1382,-73984
	sar	dword1382,8
	mov	[ebp-412],dword1382
	mov	dword1387,[ebp-408]
	and	dword1387,-289
	mov	[ebp-416],dword1387
	mov	dword1391,[ebp-392]
	and	dword1391,-73984
	sar	dword1391,8
	mov	[ebp-400],dword1391
	mov	dword1396,[ebp-392]
	and	dword1396,-289
	mov	[ebp-404],dword1396
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1402
	mov	[ebp-400],dword1402
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1408
	mov	[ebp-404],dword1408
	sal	dword ptr [ebp-400],8
	mov	dword1413,[ebp-400]
	add	dword1413,[ebp-404]
	mov	[ebp-396],dword1413
	mov	dword1416,[ebp-384]
	mov	dword1418,[ebp-396]
	mov	[dword1416],dword1418
label004d:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label004b:
	add	dword ptr [ebp-384],4
	mov	dword1425,[ebp-384]
	cmp	dword1425,[ebp-388]
	jl	label004a
label004c:
label004f:
; end of inline function _rasterize_horiz_line
	jmp	label0042
label0041:
	mov	dword1289,[ebp-344]
	cmp	dword1289,[ebp-352]
	jge	label0043
	mov	dword1454,[ebp-320]
	mov	[ebp-356],dword1454
	mov	dword1453,[ebp-324]
	mov	[ebp-360],dword1453
	mov	dword1293,[ebp-328]
	mov	dword1452,[dword1293+4]
	mov	[ebp-364],dword1452
	mov	dword1295,[ebp-328]
	mov	dword1451,[dword1295]
	mov	[ebp-368],dword1451
	mov	dword1450,[ebp-340]
	mov	[ebp-372],dword1450
	mov	dword1449,[ebp-348]
	mov	[ebp-376],dword1449
	mov	dword1448,[ebp-344]
	mov	[ebp-380],dword1448
; start of inline function _rasterize_horiz_line
	mov	dword1458,dword ptr [__pitch]
	imul	dword1458,[ebp-372]
	add	dword1458,dword ptr [__videomem]
	sal	dword ptr [ebp-380],2
	add	dword1458,[ebp-380]
	mov	[ebp-384],dword1458
	sal	dword ptr [ebp-376],2
	mov	dword1466,[ebp-384]
	add	dword1466,[ebp-376]
	sal	dword ptr [ebp-380],2
	sub	dword1466,[ebp-380]
	mov	[ebp-388],dword1466
label0050:
	mov	dword1534,[ebp-364]
	mov	[ebp-428],dword1534
	mov	dword1533,[ebp-368]
	mov	[ebp-432],dword1533
; start of inline function _tex2d
	mov	dword1538,dword ptr [__texture_width]
	dec	dword1538
	int2float	dword1538
	fmul	dword ptr [ebp-432]
	float2int	dword1540
	mov	[ebp-436],dword1540
	mov	dword1544,dword ptr [__texture_height]
	dec	dword1544
	int2float	dword1544
	fmul	dword ptr [ebp-428]
	float2int	dword1546
	mov	[ebp-440],dword1546
	mov	dword1550,[ebp-440]
	imul	dword1550,dword ptr [__texture_width]
	add	dword1550,[ebp-436]
	sal	dword1550,2
	add	dword1550,dword ptr [__texture_data]
	mov	dword1554,[dword1550]
	mov	[ebp-444],dword1554
label0054:
; end of inline function _tex2d
	mov	dword1472,[ebp-444]
	mov	[ebp-392],dword1472
	sar	dword ptr [ebp-392],24
	mov	dword1477,[ebp-392]
	and	dword1477,-289
	mov	[ebp-420],dword1477
	cmp	dword ptr [ebp-420],0
	je	label0053
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1484,[ebp-384]
	mov	dword1486,[dword1484]
	mov	[ebp-408],dword1486
	mov	dword1489,[ebp-408]
	and	dword1489,-73984
	sar	dword1489,8
	mov	[ebp-412],dword1489
	mov	dword1494,[ebp-408]
	and	dword1494,-289
	mov	[ebp-416],dword1494
	mov	dword1498,[ebp-392]
	and	dword1498,-73984
	sar	dword1498,8
	mov	[ebp-400],dword1498
	mov	dword1503,[ebp-392]
	and	dword1503,-289
	mov	[ebp-404],dword1503
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1509
	mov	[ebp-400],dword1509
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1515
	mov	[ebp-404],dword1515
	sal	dword ptr [ebp-400],8
	mov	dword1520,[ebp-400]
	add	dword1520,[ebp-404]
	mov	[ebp-396],dword1520
	mov	dword1523,[ebp-384]
	mov	dword1525,[ebp-396]
	mov	[dword1523],dword1525
label0053:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0051:
	add	dword ptr [ebp-384],4
	mov	dword1532,[ebp-384]
	cmp	dword1532,[ebp-388]
	jl	label0050
label0052:
label0055:
; end of inline function _rasterize_horiz_line
	jmp	label0044
label0043:
	mov	dword1561,[ebp-320]
	mov	[ebp-356],dword1561
	mov	dword1560,[ebp-324]
	mov	[ebp-360],dword1560
	mov	dword1302,[ebp-336]
	mov	dword1559,[dword1302+4]
	mov	[ebp-364],dword1559
	mov	dword1304,[ebp-336]
	mov	dword1558,[dword1304]
	mov	[ebp-368],dword1558
	mov	dword1557,[ebp-340]
	mov	[ebp-372],dword1557
	mov	dword1556,[ebp-348]
	mov	[ebp-376],dword1556
	mov	dword1555,[ebp-352]
	mov	[ebp-380],dword1555
; start of inline function _rasterize_horiz_line
	mov	dword1565,dword ptr [__pitch]
	imul	dword1565,[ebp-372]
	add	dword1565,dword ptr [__videomem]
	sal	dword ptr [ebp-380],2
	add	dword1565,[ebp-380]
	mov	[ebp-384],dword1565
	sal	dword ptr [ebp-376],2
	mov	dword1573,[ebp-384]
	add	dword1573,[ebp-376]
	sal	dword ptr [ebp-380],2
	sub	dword1573,[ebp-380]
	mov	[ebp-388],dword1573
label0056:
	mov	dword1641,[ebp-364]
	mov	[ebp-428],dword1641
	mov	dword1640,[ebp-368]
	mov	[ebp-432],dword1640
; start of inline function _tex2d
	mov	dword1645,dword ptr [__texture_width]
	dec	dword1645
	int2float	dword1645
	fmul	dword ptr [ebp-432]
	float2int	dword1647
	mov	[ebp-436],dword1647
	mov	dword1651,dword ptr [__texture_height]
	dec	dword1651
	int2float	dword1651
	fmul	dword ptr [ebp-428]
	float2int	dword1653
	mov	[ebp-440],dword1653
	mov	dword1657,[ebp-440]
	imul	dword1657,dword ptr [__texture_width]
	add	dword1657,[ebp-436]
	sal	dword1657,2
	add	dword1657,dword ptr [__texture_data]
	mov	dword1661,[dword1657]
	mov	[ebp-444],dword1661
label005a:
; end of inline function _tex2d
	mov	dword1579,[ebp-444]
	mov	[ebp-392],dword1579
	sar	dword ptr [ebp-392],24
	mov	dword1584,[ebp-392]
	and	dword1584,-289
	mov	[ebp-420],dword1584
	cmp	dword ptr [ebp-420],0
	je	label0059
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1591,[ebp-384]
	mov	dword1593,[dword1591]
	mov	[ebp-408],dword1593
	mov	dword1596,[ebp-408]
	and	dword1596,-73984
	sar	dword1596,8
	mov	[ebp-412],dword1596
	mov	dword1601,[ebp-408]
	and	dword1601,-289
	mov	[ebp-416],dword1601
	mov	dword1605,[ebp-392]
	and	dword1605,-73984
	sar	dword1605,8
	mov	[ebp-400],dword1605
	mov	dword1610,[ebp-392]
	and	dword1610,-289
	mov	[ebp-404],dword1610
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1616
	mov	[ebp-400],dword1616
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1622
	mov	[ebp-404],dword1622
	sal	dword ptr [ebp-400],8
	mov	dword1627,[ebp-400]
	add	dword1627,[ebp-404]
	mov	[ebp-396],dword1627
	mov	dword1630,[ebp-384]
	mov	dword1632,[ebp-396]
	mov	[dword1630],dword1632
label0059:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0057:
	add	dword ptr [ebp-384],4
	mov	dword1639,[ebp-384]
	cmp	dword1639,[ebp-388]
	jl	label0056
label0058:
label005b:
; end of inline function _rasterize_horiz_line
label0044:
label0042:
	jmp	label0045
label0040:
	mov	dword1310,[ebp-344]
	cmp	dword1310,[ebp-348]
	jge	label0046
	fld	dword ptr [ebp-320]
	fldz
	fsubrp
	fstp	dword ptr [ebp-356]
	fld	dword ptr [ebp-324]
	fldz
	fsubrp
	fstp	dword ptr [ebp-360]
	mov	dword1314,[ebp-328]
	mov	dword1666,[dword1314+4]
	mov	[ebp-364],dword1666
	mov	dword1316,[ebp-328]
	mov	dword1665,[dword1316]
	mov	[ebp-368],dword1665
	mov	dword1664,[ebp-340]
	mov	[ebp-372],dword1664
	mov	dword1663,[ebp-352]
	mov	[ebp-376],dword1663
	mov	dword1662,[ebp-344]
	mov	[ebp-380],dword1662
; start of inline function _rasterize_horiz_line
	mov	dword1670,dword ptr [__pitch]
	imul	dword1670,[ebp-372]
	add	dword1670,dword ptr [__videomem]
	sal	dword ptr [ebp-380],2
	add	dword1670,[ebp-380]
	mov	[ebp-384],dword1670
	sal	dword ptr [ebp-376],2
	mov	dword1678,[ebp-384]
	add	dword1678,[ebp-376]
	sal	dword ptr [ebp-380],2
	sub	dword1678,[ebp-380]
	mov	[ebp-388],dword1678
label005c:
	mov	dword1746,[ebp-364]
	mov	[ebp-428],dword1746
	mov	dword1745,[ebp-368]
	mov	[ebp-432],dword1745
; start of inline function _tex2d
	mov	dword1750,dword ptr [__texture_width]
	dec	dword1750
	int2float	dword1750
	fmul	dword ptr [ebp-432]
	float2int	dword1752
	mov	[ebp-436],dword1752
	mov	dword1756,dword ptr [__texture_height]
	dec	dword1756
	int2float	dword1756
	fmul	dword ptr [ebp-428]
	float2int	dword1758
	mov	[ebp-440],dword1758
	mov	dword1762,[ebp-440]
	imul	dword1762,dword ptr [__texture_width]
	add	dword1762,[ebp-436]
	sal	dword1762,2
	add	dword1762,dword ptr [__texture_data]
	mov	dword1766,[dword1762]
	mov	[ebp-444],dword1766
label0060:
; end of inline function _tex2d
	mov	dword1684,[ebp-444]
	mov	[ebp-392],dword1684
	sar	dword ptr [ebp-392],24
	mov	dword1689,[ebp-392]
	and	dword1689,-289
	mov	[ebp-420],dword1689
	cmp	dword ptr [ebp-420],0
	je	label005f
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1696,[ebp-384]
	mov	dword1698,[dword1696]
	mov	[ebp-408],dword1698
	mov	dword1701,[ebp-408]
	and	dword1701,-73984
	sar	dword1701,8
	mov	[ebp-412],dword1701
	mov	dword1706,[ebp-408]
	and	dword1706,-289
	mov	[ebp-416],dword1706
	mov	dword1710,[ebp-392]
	and	dword1710,-73984
	sar	dword1710,8
	mov	[ebp-400],dword1710
	mov	dword1715,[ebp-392]
	and	dword1715,-289
	mov	[ebp-404],dword1715
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1721
	mov	[ebp-400],dword1721
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1727
	mov	[ebp-404],dword1727
	sal	dword ptr [ebp-400],8
	mov	dword1732,[ebp-400]
	add	dword1732,[ebp-404]
	mov	[ebp-396],dword1732
	mov	dword1735,[ebp-384]
	mov	dword1737,[ebp-396]
	mov	[dword1735],dword1737
label005f:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label005d:
	add	dword ptr [ebp-384],4
	mov	dword1744,[ebp-384]
	cmp	dword1744,[ebp-388]
	jl	label005c
label005e:
label0061:
; end of inline function _rasterize_horiz_line
	jmp	label0047
label0046:
	mov	dword1322,[ebp-344]
	cmp	dword1322,[ebp-352]
	jle	label0048
	fld	dword ptr [ebp-320]
	fldz
	fsubrp
	fstp	dword ptr [ebp-356]
	fld	dword ptr [ebp-324]
	fldz
	fsubrp
	fstp	dword ptr [ebp-360]
	mov	dword1326,[ebp-332]
	mov	dword1771,[dword1326+4]
	mov	[ebp-364],dword1771
	mov	dword1328,[ebp-332]
	mov	dword1770,[dword1328]
	mov	[ebp-368],dword1770
	mov	dword1769,[ebp-340]
	mov	[ebp-372],dword1769
	mov	dword1768,[ebp-344]
	mov	[ebp-376],dword1768
	mov	dword1767,[ebp-348]
	mov	[ebp-380],dword1767
; start of inline function _rasterize_horiz_line
	mov	dword1775,dword ptr [__pitch]
	imul	dword1775,[ebp-372]
	add	dword1775,dword ptr [__videomem]
	sal	dword ptr [ebp-380],2
	add	dword1775,[ebp-380]
	mov	[ebp-384],dword1775
	sal	dword ptr [ebp-376],2
	mov	dword1783,[ebp-384]
	add	dword1783,[ebp-376]
	sal	dword ptr [ebp-380],2
	sub	dword1783,[ebp-380]
	mov	[ebp-388],dword1783
label0062:
	mov	dword1851,[ebp-364]
	mov	[ebp-428],dword1851
	mov	dword1850,[ebp-368]
	mov	[ebp-432],dword1850
; start of inline function _tex2d
	mov	dword1855,dword ptr [__texture_width]
	dec	dword1855
	int2float	dword1855
	fmul	dword ptr [ebp-432]
	float2int	dword1857
	mov	[ebp-436],dword1857
	mov	dword1861,dword ptr [__texture_height]
	dec	dword1861
	int2float	dword1861
	fmul	dword ptr [ebp-428]
	float2int	dword1863
	mov	[ebp-440],dword1863
	mov	dword1867,[ebp-440]
	imul	dword1867,dword ptr [__texture_width]
	add	dword1867,[ebp-436]
	sal	dword1867,2
	add	dword1867,dword ptr [__texture_data]
	mov	dword1871,[dword1867]
	mov	[ebp-444],dword1871
label0066:
; end of inline function _tex2d
	mov	dword1789,[ebp-444]
	mov	[ebp-392],dword1789
	sar	dword ptr [ebp-392],24
	mov	dword1794,[ebp-392]
	and	dword1794,-289
	mov	[ebp-420],dword1794
	cmp	dword ptr [ebp-420],0
	je	label0065
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1801,[ebp-384]
	mov	dword1803,[dword1801]
	mov	[ebp-408],dword1803
	mov	dword1806,[ebp-408]
	and	dword1806,-73984
	sar	dword1806,8
	mov	[ebp-412],dword1806
	mov	dword1811,[ebp-408]
	and	dword1811,-289
	mov	[ebp-416],dword1811
	mov	dword1815,[ebp-392]
	and	dword1815,-73984
	sar	dword1815,8
	mov	[ebp-400],dword1815
	mov	dword1820,[ebp-392]
	and	dword1820,-289
	mov	[ebp-404],dword1820
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1826
	mov	[ebp-400],dword1826
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1832
	mov	[ebp-404],dword1832
	sal	dword ptr [ebp-400],8
	mov	dword1837,[ebp-400]
	add	dword1837,[ebp-404]
	mov	[ebp-396],dword1837
	mov	dword1840,[ebp-384]
	mov	dword1842,[ebp-396]
	mov	[dword1840],dword1842
label0065:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0063:
	add	dword ptr [ebp-384],4
	mov	dword1849,[ebp-384]
	cmp	dword1849,[ebp-388]
	jl	label0062
label0064:
label0067:
; end of inline function _rasterize_horiz_line
	jmp	label0049
label0048:
	fld	dword ptr [ebp-320]
	fldz
	fsubrp
	fstp	dword ptr [ebp-356]
	fld	dword ptr [ebp-324]
	fldz
	fsubrp
	fstp	dword ptr [ebp-360]
	mov	dword1335,[ebp-332]
	mov	dword1876,[dword1335+4]
	mov	[ebp-364],dword1876
	mov	dword1337,[ebp-332]
	mov	dword1875,[dword1337]
	mov	[ebp-368],dword1875
	mov	dword1874,[ebp-340]
	mov	[ebp-372],dword1874
	mov	dword1873,[ebp-352]
	mov	[ebp-376],dword1873
	mov	dword1872,[ebp-348]
	mov	[ebp-380],dword1872
; start of inline function _rasterize_horiz_line
	mov	dword1880,dword ptr [__pitch]
	imul	dword1880,[ebp-372]
	add	dword1880,dword ptr [__videomem]
	sal	dword ptr [ebp-380],2
	add	dword1880,[ebp-380]
	mov	[ebp-384],dword1880
	sal	dword ptr [ebp-376],2
	mov	dword1888,[ebp-384]
	add	dword1888,[ebp-376]
	sal	dword ptr [ebp-380],2
	sub	dword1888,[ebp-380]
	mov	[ebp-388],dword1888
label0068:
	mov	dword1956,[ebp-364]
	mov	[ebp-428],dword1956
	mov	dword1955,[ebp-368]
	mov	[ebp-432],dword1955
; start of inline function _tex2d
	mov	dword1960,dword ptr [__texture_width]
	dec	dword1960
	int2float	dword1960
	fmul	dword ptr [ebp-432]
	float2int	dword1962
	mov	[ebp-436],dword1962
	mov	dword1966,dword ptr [__texture_height]
	dec	dword1966
	int2float	dword1966
	fmul	dword ptr [ebp-428]
	float2int	dword1968
	mov	[ebp-440],dword1968
	mov	dword1972,[ebp-440]
	imul	dword1972,dword ptr [__texture_width]
	add	dword1972,[ebp-436]
	sal	dword1972,2
	add	dword1972,dword ptr [__texture_data]
	mov	dword1976,[dword1972]
	mov	[ebp-444],dword1976
label006c:
; end of inline function _tex2d
	mov	dword1894,[ebp-444]
	mov	[ebp-392],dword1894
	sar	dword ptr [ebp-392],24
	mov	dword1899,[ebp-392]
	and	dword1899,-289
	mov	[ebp-420],dword1899
	cmp	dword ptr [ebp-420],0
	je	label006b
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1906,[ebp-384]
	mov	dword1908,[dword1906]
	mov	[ebp-408],dword1908
	mov	dword1911,[ebp-408]
	and	dword1911,-73984
	sar	dword1911,8
	mov	[ebp-412],dword1911
	mov	dword1916,[ebp-408]
	and	dword1916,-289
	mov	[ebp-416],dword1916
	mov	dword1920,[ebp-392]
	and	dword1920,-73984
	sar	dword1920,8
	mov	[ebp-400],dword1920
	mov	dword1925,[ebp-392]
	and	dword1925,-289
	mov	[ebp-404],dword1925
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1931
	mov	[ebp-400],dword1931
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1937
	mov	[ebp-404],dword1937
	sal	dword ptr [ebp-400],8
	mov	dword1942,[ebp-400]
	add	dword1942,[ebp-404]
	mov	[ebp-396],dword1942
	mov	dword1945,[ebp-384]
	mov	dword1947,[ebp-396]
	mov	[dword1945],dword1947
label006b:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0069:
	add	dword ptr [ebp-384],4
	mov	dword1954,[ebp-384]
	cmp	dword1954,[ebp-388]
	jl	label0068
label006a:
label006d:
; end of inline function _rasterize_horiz_line
label0049:
label0047:
label0045:
label006e:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label006f
label000b:
	mov	dword133,[ebp-148]
	add	dword133,4
	mov	dword136,[dword133]
	mov	[ebp-164],dword136
label000d:
label000e:
	mov	dword138,[ebp-144]
	add	dword138,4
	mov	dword141,[dword138]
	cmp	dword141,[ebp-164]
	jle	label000f
	mov	dword143,[ebp-148]
	add	dword143,4
	mov	dword146,[ebp-164]
	sub	dword146,[dword143]
	mov	dword148,[ebp-144]
	mov	dword150,[ebp-148]
	mov	dword151,[dword148]
	sub	dword151,[dword150]
	imul	dword146,dword151
	mov	dword153,[ebp-144]
	add	dword153,4
	mov	dword156,[ebp-148]
	add	dword156,4
	mov	dword158,[dword153]
	sub	dword158,[dword156]
	cdq	dword159
	idiv	dword146,dword158
	mov	dword161,[ebp-148]
	add	dword146,[dword161]
	mov	[ebp-156],dword146
	mov	dword164,[ebp-148]
	add	dword164,4
	mov	dword167,[ebp-164]
	sub	dword167,[dword164]
	mov	dword169,[ebp-140]
	mov	dword171,[ebp-148]
	mov	dword172,[dword169]
	sub	dword172,[dword171]
	imul	dword167,dword172
	mov	dword174,[ebp-140]
	add	dword174,4
	mov	dword177,[ebp-148]
	add	dword177,4
	mov	dword179,[dword174]
	sub	dword179,[dword177]
	cdq	dword180
	idiv	dword167,dword179
	mov	dword182,[ebp-148]
	add	dword167,[dword182]
	mov	[ebp-160],dword167
	mov	dword185,[ebp-148]
	add	dword185,4
	mov	dword188,[ebp-164]
	sub	dword188,[dword185]
	int2float	dword188
	mov	dword190,[ebp-144]
	mov	dword192,[ebp-148]
	fld	dword ptr [dword190+8]
	fsub	dword ptr [dword192+8]
	fmulp
	mov	dword194,[ebp-144]
	add	dword194,4
	mov	dword197,[ebp-148]
	add	dword197,4
	mov	dword199,[dword194]
	sub	dword199,[dword197]
	int2float	dword199
	fdivp
	mov	dword201,[ebp-148]
	fadd	dword ptr [dword201+8]
	fstp	dword ptr [ebp-168]
	mov	dword204,[ebp-148]
	add	dword204,4
	mov	dword207,[ebp-164]
	sub	dword207,[dword204]
	int2float	dword207
	mov	dword209,[ebp-140]
	mov	dword211,[ebp-148]
	fld	dword ptr [dword209+8]
	fsub	dword ptr [dword211+8]
	fmulp
	mov	dword213,[ebp-140]
	add	dword213,4
	mov	dword216,[ebp-148]
	add	dword216,4
	mov	dword218,[dword213]
	sub	dword218,[dword216]
	int2float	dword218
	fdivp
	mov	dword220,[ebp-148]
	fadd	dword ptr [dword220+8]
	fstp	dword ptr [ebp-176]
	mov	dword223,[ebp-148]
	add	dword223,4
	mov	dword226,[ebp-164]
	sub	dword226,[dword223]
	int2float	dword226
	mov	dword228,8
	add	dword228,[ebp-144]
	add	dword228,4
	mov	dword231,8
	add	dword231,[ebp-148]
	add	dword231,4
	fld	dword ptr [dword228]
	fsub	dword ptr [dword231]
	fmulp
	mov	dword234,[ebp-144]
	add	dword234,4
	mov	dword237,[ebp-148]
	add	dword237,4
	mov	dword239,[dword234]
	sub	dword239,[dword237]
	int2float	dword239
	fdivp
	mov	dword241,8
	add	dword241,[ebp-148]
	add	dword241,4
	fadd	dword ptr [dword241]
	fstp	dword ptr [ebp-172]
	mov	dword245,[ebp-148]
	add	dword245,4
	mov	dword248,[ebp-164]
	sub	dword248,[dword245]
	int2float	dword248
	mov	dword250,8
	add	dword250,[ebp-140]
	add	dword250,4
	mov	dword253,8
	add	dword253,[ebp-148]
	add	dword253,4
	fld	dword ptr [dword250]
	fsub	dword ptr [dword253]
	fmulp
	mov	dword256,[ebp-140]
	add	dword256,4
	mov	dword259,[ebp-148]
	add	dword259,4
	mov	dword261,[dword256]
	sub	dword261,[dword259]
	int2float	dword261
	fdivp
	mov	dword263,8
	add	dword263,[ebp-148]
	add	dword263,4
	fadd	dword ptr [dword263]
	fstp	dword ptr [ebp-180]
	mov	dword268,[ebp-160]
	sub	dword268,[ebp-156]
	int2float	dword268
	fld	dword ptr [ebp-176]
	fsub	dword ptr [ebp-168]
	fdivrp
	fstp	dword ptr [ebp-184]
	mov	dword274,[ebp-160]
	sub	dword274,[ebp-156]
	int2float	dword274
	fld	dword ptr [ebp-180]
	fsub	dword ptr [ebp-172]
	fdivrp
	fstp	dword ptr [ebp-188]
	mov	dword552,[ebp-188]
	mov	[ebp-192],dword552
	mov	dword551,[ebp-184]
	mov	[ebp-196],dword551
	mov	dword550,[ebp-180]
	mov	[ebp-200],dword550
	mov	dword549,[ebp-176]
	mov	[ebp-204],dword549
	mov	dword548,[ebp-172]
	mov	[ebp-208],dword548
	mov	dword547,[ebp-168]
	mov	[ebp-212],dword547
	mov	dword546,[ebp-164]
	mov	[ebp-216],dword546
	mov	dword545,[ebp-160]
	mov	[ebp-220],dword545
	mov	dword544,[ebp-156]
	mov	[ebp-224],dword544
; start of inline function _rasterize_horiz_line__unordered
	mov	dword556,[ebp-224]
	cmp	dword556,[ebp-220]
	jg	label0013
	mov	dword577,[ebp-192]
	mov	[ebp-228],dword577
	mov	dword576,[ebp-196]
	mov	[ebp-232],dword576
	mov	dword575,[ebp-208]
	mov	[ebp-236],dword575
	mov	dword574,[ebp-212]
	mov	[ebp-240],dword574
	mov	dword573,[ebp-216]
	mov	[ebp-244],dword573
	mov	dword572,[ebp-220]
	mov	[ebp-248],dword572
	mov	dword571,[ebp-224]
	mov	[ebp-252],dword571
; start of inline function _rasterize_horiz_line
	mov	dword581,dword ptr [__pitch]
	imul	dword581,[ebp-244]
	add	dword581,dword ptr [__videomem]
	sal	dword ptr [ebp-252],2
	add	dword581,[ebp-252]
	mov	[ebp-256],dword581
	sal	dword ptr [ebp-248],2
	mov	dword589,[ebp-256]
	add	dword589,[ebp-248]
	sal	dword ptr [ebp-252],2
	sub	dword589,[ebp-252]
	mov	[ebp-260],dword589
label0015:
	mov	dword657,[ebp-236]
	mov	[ebp-300],dword657
	mov	dword656,[ebp-240]
	mov	[ebp-304],dword656
; start of inline function _tex2d
	mov	dword661,dword ptr [__texture_width]
	dec	dword661
	int2float	dword661
	fmul	dword ptr [ebp-304]
	float2int	dword663
	mov	[ebp-308],dword663
	mov	dword667,dword ptr [__texture_height]
	dec	dword667
	int2float	dword667
	fmul	dword ptr [ebp-300]
	float2int	dword669
	mov	[ebp-312],dword669
	mov	dword673,[ebp-312]
	imul	dword673,dword ptr [__texture_width]
	add	dword673,[ebp-308]
	sal	dword673,2
	add	dword673,dword ptr [__texture_data]
	mov	dword677,[dword673]
	mov	[ebp-316],dword677
label0019:
; end of inline function _tex2d
	mov	dword595,[ebp-316]
	mov	[ebp-264],dword595
	sar	dword ptr [ebp-264],24
	mov	dword600,[ebp-264]
	and	dword600,-289
	mov	[ebp-292],dword600
	cmp	dword ptr [ebp-292],0
	je	label0018
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword607,[ebp-256]
	mov	dword609,[dword607]
	mov	[ebp-280],dword609
	mov	dword612,[ebp-280]
	and	dword612,-73984
	sar	dword612,8
	mov	[ebp-284],dword612
	mov	dword617,[ebp-280]
	and	dword617,-289
	mov	[ebp-288],dword617
	mov	dword621,[ebp-264]
	and	dword621,-73984
	sar	dword621,8
	mov	[ebp-272],dword621
	mov	dword626,[ebp-264]
	and	dword626,-289
	mov	[ebp-276],dword626
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword632
	mov	[ebp-272],dword632
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword638
	mov	[ebp-276],dword638
	sal	dword ptr [ebp-272],8
	mov	dword643,[ebp-272]
	add	dword643,[ebp-276]
	mov	[ebp-268],dword643
	mov	dword646,[ebp-256]
	mov	dword648,[ebp-268]
	mov	[dword646],dword648
label0018:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0016:
	add	dword ptr [ebp-256],4
	mov	dword655,[ebp-256]
	cmp	dword655,[ebp-260]
	jl	label0015
label0017:
label001a:
; end of inline function _rasterize_horiz_line
	jmp	label0014
label0013:
	mov	dword684,[ebp-192]
	mov	[ebp-228],dword684
	mov	dword683,[ebp-196]
	mov	[ebp-232],dword683
	mov	dword682,[ebp-200]
	mov	[ebp-236],dword682
	mov	dword681,[ebp-204]
	mov	[ebp-240],dword681
	mov	dword680,[ebp-216]
	mov	[ebp-244],dword680
	mov	dword679,[ebp-224]
	mov	[ebp-248],dword679
	mov	dword678,[ebp-220]
	mov	[ebp-252],dword678
; start of inline function _rasterize_horiz_line
	mov	dword688,dword ptr [__pitch]
	imul	dword688,[ebp-244]
	add	dword688,dword ptr [__videomem]
	sal	dword ptr [ebp-252],2
	add	dword688,[ebp-252]
	mov	[ebp-256],dword688
	sal	dword ptr [ebp-248],2
	mov	dword696,[ebp-256]
	add	dword696,[ebp-248]
	sal	dword ptr [ebp-252],2
	sub	dword696,[ebp-252]
	mov	[ebp-260],dword696
label001b:
	mov	dword764,[ebp-236]
	mov	[ebp-300],dword764
	mov	dword763,[ebp-240]
	mov	[ebp-304],dword763
; start of inline function _tex2d
	mov	dword768,dword ptr [__texture_width]
	dec	dword768
	int2float	dword768
	fmul	dword ptr [ebp-304]
	float2int	dword770
	mov	[ebp-308],dword770
	mov	dword774,dword ptr [__texture_height]
	dec	dword774
	int2float	dword774
	fmul	dword ptr [ebp-300]
	float2int	dword776
	mov	[ebp-312],dword776
	mov	dword780,[ebp-312]
	imul	dword780,dword ptr [__texture_width]
	add	dword780,[ebp-308]
	sal	dword780,2
	add	dword780,dword ptr [__texture_data]
	mov	dword784,[dword780]
	mov	[ebp-316],dword784
label001f:
; end of inline function _tex2d
	mov	dword702,[ebp-316]
	mov	[ebp-264],dword702
	sar	dword ptr [ebp-264],24
	mov	dword707,[ebp-264]
	and	dword707,-289
	mov	[ebp-292],dword707
	cmp	dword ptr [ebp-292],0
	je	label001e
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword714,[ebp-256]
	mov	dword716,[dword714]
	mov	[ebp-280],dword716
	mov	dword719,[ebp-280]
	and	dword719,-73984
	sar	dword719,8
	mov	[ebp-284],dword719
	mov	dword724,[ebp-280]
	and	dword724,-289
	mov	[ebp-288],dword724
	mov	dword728,[ebp-264]
	and	dword728,-73984
	sar	dword728,8
	mov	[ebp-272],dword728
	mov	dword733,[ebp-264]
	and	dword733,-289
	mov	[ebp-276],dword733
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword739
	mov	[ebp-272],dword739
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword745
	mov	[ebp-276],dword745
	sal	dword ptr [ebp-272],8
	mov	dword750,[ebp-272]
	add	dword750,[ebp-276]
	mov	[ebp-268],dword750
	mov	dword753,[ebp-256]
	mov	dword755,[ebp-268]
	mov	[dword753],dword755
label001e:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label001c:
	add	dword ptr [ebp-256],4
	mov	dword762,[ebp-256]
	cmp	dword762,[ebp-260]
	jl	label001b
label001d:
label0020:
; end of inline function _rasterize_horiz_line
label0014:
label0021:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-164]
	jmp	label000e
label000f:
	mov	dword289,[ebp-144]
	add	dword289,4
	mov	dword292,[ebp-148]
	add	dword292,4
	mov	dword294,[dword289]
	sub	dword294,[dword292]
	mov	dword296,[ebp-140]
	mov	dword298,[ebp-148]
	mov	dword299,[dword296]
	sub	dword299,[dword298]
	imul	dword294,dword299
	mov	dword301,[ebp-140]
	add	dword301,4
	mov	dword304,[ebp-148]
	add	dword304,4
	mov	dword306,[dword301]
	sub	dword306,[dword304]
	cdq	dword307
	idiv	dword294,dword306
	mov	dword309,[ebp-148]
	add	dword294,[dword309]
	mov	[ebp-160],dword294
	mov	dword312,[ebp-144]
	add	dword312,4
	mov	dword315,[ebp-148]
	add	dword315,4
	mov	dword317,[dword312]
	sub	dword317,[dword315]
	int2float	dword317
	mov	dword319,[ebp-140]
	mov	dword321,[ebp-148]
	fld	dword ptr [dword319+8]
	fsub	dword ptr [dword321+8]
	fmulp
	mov	dword323,[ebp-140]
	add	dword323,4
	mov	dword326,[ebp-148]
	add	dword326,4
	mov	dword328,[dword323]
	sub	dword328,[dword326]
	int2float	dword328
	fdivp
	mov	dword330,[ebp-148]
	fadd	dword ptr [dword330+8]
	fstp	dword ptr [ebp-176]
	mov	dword333,[ebp-144]
	add	dword333,4
	mov	dword336,[ebp-148]
	add	dword336,4
	mov	dword338,[dword333]
	sub	dword338,[dword336]
	int2float	dword338
	mov	dword340,8
	add	dword340,[ebp-140]
	add	dword340,4
	mov	dword343,8
	add	dword343,[ebp-148]
	add	dword343,4
	fld	dword ptr [dword340]
	fsub	dword ptr [dword343]
	fmulp
	mov	dword346,[ebp-140]
	add	dword346,4
	mov	dword349,[ebp-148]
	add	dword349,4
	mov	dword351,[dword346]
	sub	dword351,[dword349]
	int2float	dword351
	fdivp
	mov	dword353,8
	add	dword353,[ebp-148]
	add	dword353,4
	fadd	dword ptr [dword353]
	fstp	dword ptr [ebp-180]
	mov	dword357,[ebp-144]
	fld	dword ptr [ebp-176]
	fsub	dword ptr [dword357+8]
	mov	dword360,[ebp-144]
	mov	dword362,[ebp-160]
	sub	dword362,[dword360]
	int2float	dword362
	fdivp
	fstp	dword ptr [ebp-184]
	mov	dword365,8
	add	dword365,[ebp-144]
	add	dword365,4
	fld	dword ptr [ebp-180]
	fsub	dword ptr [dword365]
	mov	dword369,[ebp-144]
	mov	dword371,[ebp-160]
	sub	dword371,[dword369]
	int2float	dword371
	fdivp
	fstp	dword ptr [ebp-188]
	mov	dword793,[ebp-188]
	mov	[ebp-192],dword793
	mov	dword792,[ebp-184]
	mov	[ebp-196],dword792
	mov	dword376,8
	add	dword376,[ebp-144]
	add	dword376,4
	mov	dword791,[dword376]
	mov	[ebp-200],dword791
	mov	dword379,[ebp-144]
	mov	dword790,[dword379+8]
	mov	[ebp-204],dword790
	mov	dword789,[ebp-180]
	mov	[ebp-208],dword789
	mov	dword788,[ebp-176]
	mov	[ebp-212],dword788
	mov	dword383,[ebp-144]
	add	dword383,4
	mov	dword787,[dword383]
	mov	[ebp-216],dword787
	mov	dword386,[ebp-144]
	mov	dword786,[dword386]
	mov	[ebp-220],dword786
	mov	dword785,[ebp-160]
	mov	[ebp-224],dword785
; start of inline function _rasterize_horiz_line__unordered
	mov	dword797,[ebp-224]
	cmp	dword797,[ebp-220]
	jg	label0022
	mov	dword818,[ebp-192]
	mov	[ebp-228],dword818
	mov	dword817,[ebp-196]
	mov	[ebp-232],dword817
	mov	dword816,[ebp-208]
	mov	[ebp-236],dword816
	mov	dword815,[ebp-212]
	mov	[ebp-240],dword815
	mov	dword814,[ebp-216]
	mov	[ebp-244],dword814
	mov	dword813,[ebp-220]
	mov	[ebp-248],dword813
	mov	dword812,[ebp-224]
	mov	[ebp-252],dword812
; start of inline function _rasterize_horiz_line
	mov	dword822,dword ptr [__pitch]
	imul	dword822,[ebp-244]
	add	dword822,dword ptr [__videomem]
	sal	dword ptr [ebp-252],2
	add	dword822,[ebp-252]
	mov	[ebp-256],dword822
	sal	dword ptr [ebp-248],2
	mov	dword830,[ebp-256]
	add	dword830,[ebp-248]
	sal	dword ptr [ebp-252],2
	sub	dword830,[ebp-252]
	mov	[ebp-260],dword830
label0024:
	mov	dword898,[ebp-236]
	mov	[ebp-300],dword898
	mov	dword897,[ebp-240]
	mov	[ebp-304],dword897
; start of inline function _tex2d
	mov	dword902,dword ptr [__texture_width]
	dec	dword902
	int2float	dword902
	fmul	dword ptr [ebp-304]
	float2int	dword904
	mov	[ebp-308],dword904
	mov	dword908,dword ptr [__texture_height]
	dec	dword908
	int2float	dword908
	fmul	dword ptr [ebp-300]
	float2int	dword910
	mov	[ebp-312],dword910
	mov	dword914,[ebp-312]
	imul	dword914,dword ptr [__texture_width]
	add	dword914,[ebp-308]
	sal	dword914,2
	add	dword914,dword ptr [__texture_data]
	mov	dword918,[dword914]
	mov	[ebp-316],dword918
label0028:
; end of inline function _tex2d
	mov	dword836,[ebp-316]
	mov	[ebp-264],dword836
	sar	dword ptr [ebp-264],24
	mov	dword841,[ebp-264]
	and	dword841,-289
	mov	[ebp-292],dword841
	cmp	dword ptr [ebp-292],0
	je	label0027
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword848,[ebp-256]
	mov	dword850,[dword848]
	mov	[ebp-280],dword850
	mov	dword853,[ebp-280]
	and	dword853,-73984
	sar	dword853,8
	mov	[ebp-284],dword853
	mov	dword858,[ebp-280]
	and	dword858,-289
	mov	[ebp-288],dword858
	mov	dword862,[ebp-264]
	and	dword862,-73984
	sar	dword862,8
	mov	[ebp-272],dword862
	mov	dword867,[ebp-264]
	and	dword867,-289
	mov	[ebp-276],dword867
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword873
	mov	[ebp-272],dword873
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword879
	mov	[ebp-276],dword879
	sal	dword ptr [ebp-272],8
	mov	dword884,[ebp-272]
	add	dword884,[ebp-276]
	mov	[ebp-268],dword884
	mov	dword887,[ebp-256]
	mov	dword889,[ebp-268]
	mov	[dword887],dword889
label0027:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0025:
	add	dword ptr [ebp-256],4
	mov	dword896,[ebp-256]
	cmp	dword896,[ebp-260]
	jl	label0024
label0026:
label0029:
; end of inline function _rasterize_horiz_line
	jmp	label0023
label0022:
	mov	dword925,[ebp-192]
	mov	[ebp-228],dword925
	mov	dword924,[ebp-196]
	mov	[ebp-232],dword924
	mov	dword923,[ebp-200]
	mov	[ebp-236],dword923
	mov	dword922,[ebp-204]
	mov	[ebp-240],dword922
	mov	dword921,[ebp-216]
	mov	[ebp-244],dword921
	mov	dword920,[ebp-224]
	mov	[ebp-248],dword920
	mov	dword919,[ebp-220]
	mov	[ebp-252],dword919
; start of inline function _rasterize_horiz_line
	mov	dword929,dword ptr [__pitch]
	imul	dword929,[ebp-244]
	add	dword929,dword ptr [__videomem]
	sal	dword ptr [ebp-252],2
	add	dword929,[ebp-252]
	mov	[ebp-256],dword929
	sal	dword ptr [ebp-248],2
	mov	dword937,[ebp-256]
	add	dword937,[ebp-248]
	sal	dword ptr [ebp-252],2
	sub	dword937,[ebp-252]
	mov	[ebp-260],dword937
label002a:
	mov	dword1005,[ebp-236]
	mov	[ebp-300],dword1005
	mov	dword1004,[ebp-240]
	mov	[ebp-304],dword1004
; start of inline function _tex2d
	mov	dword1009,dword ptr [__texture_width]
	dec	dword1009
	int2float	dword1009
	fmul	dword ptr [ebp-304]
	float2int	dword1011
	mov	[ebp-308],dword1011
	mov	dword1015,dword ptr [__texture_height]
	dec	dword1015
	int2float	dword1015
	fmul	dword ptr [ebp-300]
	float2int	dword1017
	mov	[ebp-312],dword1017
	mov	dword1021,[ebp-312]
	imul	dword1021,dword ptr [__texture_width]
	add	dword1021,[ebp-308]
	sal	dword1021,2
	add	dword1021,dword ptr [__texture_data]
	mov	dword1025,[dword1021]
	mov	[ebp-316],dword1025
label002e:
; end of inline function _tex2d
	mov	dword943,[ebp-316]
	mov	[ebp-264],dword943
	sar	dword ptr [ebp-264],24
	mov	dword948,[ebp-264]
	and	dword948,-289
	mov	[ebp-292],dword948
	cmp	dword ptr [ebp-292],0
	je	label002d
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword955,[ebp-256]
	mov	dword957,[dword955]
	mov	[ebp-280],dword957
	mov	dword960,[ebp-280]
	and	dword960,-73984
	sar	dword960,8
	mov	[ebp-284],dword960
	mov	dword965,[ebp-280]
	and	dword965,-289
	mov	[ebp-288],dword965
	mov	dword969,[ebp-264]
	and	dword969,-73984
	sar	dword969,8
	mov	[ebp-272],dword969
	mov	dword974,[ebp-264]
	and	dword974,-289
	mov	[ebp-276],dword974
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword980
	mov	[ebp-272],dword980
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword986
	mov	[ebp-276],dword986
	sal	dword ptr [ebp-272],8
	mov	dword991,[ebp-272]
	add	dword991,[ebp-276]
	mov	[ebp-268],dword991
	mov	dword994,[ebp-256]
	mov	dword996,[ebp-268]
	mov	[dword994],dword996
label002d:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label002b:
	add	dword ptr [ebp-256],4
	mov	dword1003,[ebp-256]
	cmp	dword1003,[ebp-260]
	jl	label002a
label002c:
label002f:
; end of inline function _rasterize_horiz_line
label0023:
label0030:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword389,[ebp-144]
	add	dword389,4
	mov	dword391,1
	add	dword391,[dword389]
	mov	[ebp-164],dword391
label0010:
label0011:
	mov	dword394,[ebp-140]
	add	dword394,4
	mov	dword397,[dword394]
	cmp	dword397,[ebp-164]
	jle	label0012
	mov	dword399,[ebp-144]
	add	dword399,4
	mov	dword402,[ebp-164]
	sub	dword402,[dword399]
	mov	dword404,[ebp-140]
	mov	dword406,[ebp-144]
	mov	dword407,[dword404]
	sub	dword407,[dword406]
	imul	dword402,dword407
	mov	dword409,[ebp-140]
	add	dword409,4
	mov	dword412,[ebp-144]
	add	dword412,4
	mov	dword414,[dword409]
	sub	dword414,[dword412]
	cdq	dword415
	idiv	dword402,dword414
	mov	dword417,[ebp-144]
	add	dword402,[dword417]
	mov	[ebp-156],dword402
	mov	dword420,[ebp-148]
	add	dword420,4
	mov	dword423,[ebp-164]
	sub	dword423,[dword420]
	mov	dword425,[ebp-140]
	mov	dword427,[ebp-148]
	mov	dword428,[dword425]
	sub	dword428,[dword427]
	imul	dword423,dword428
	mov	dword430,[ebp-140]
	add	dword430,4
	mov	dword433,[ebp-148]
	add	dword433,4
	mov	dword435,[dword430]
	sub	dword435,[dword433]
	cdq	dword436
	idiv	dword423,dword435
	mov	dword438,[ebp-148]
	add	dword423,[dword438]
	mov	[ebp-160],dword423
	mov	dword441,[ebp-144]
	add	dword441,4
	mov	dword444,[ebp-164]
	sub	dword444,[dword441]
	int2float	dword444
	mov	dword446,[ebp-140]
	mov	dword448,[ebp-144]
	fld	dword ptr [dword446+8]
	fsub	dword ptr [dword448+8]
	fmulp
	mov	dword450,[ebp-140]
	add	dword450,4
	mov	dword453,[ebp-144]
	add	dword453,4
	mov	dword455,[dword450]
	sub	dword455,[dword453]
	int2float	dword455
	fdivp
	mov	dword457,[ebp-144]
	fadd	dword ptr [dword457+8]
	fstp	dword ptr [ebp-168]
	mov	dword460,[ebp-148]
	add	dword460,4
	mov	dword463,[ebp-164]
	sub	dword463,[dword460]
	int2float	dword463
	mov	dword465,[ebp-140]
	mov	dword467,[ebp-148]
	fld	dword ptr [dword465+8]
	fsub	dword ptr [dword467+8]
	fmulp
	mov	dword469,[ebp-140]
	add	dword469,4
	mov	dword472,[ebp-148]
	add	dword472,4
	mov	dword474,[dword469]
	sub	dword474,[dword472]
	int2float	dword474
	fdivp
	mov	dword476,[ebp-148]
	fadd	dword ptr [dword476+8]
	fstp	dword ptr [ebp-176]
	mov	dword479,[ebp-144]
	add	dword479,4
	mov	dword482,[ebp-164]
	sub	dword482,[dword479]
	int2float	dword482
	mov	dword484,8
	add	dword484,[ebp-140]
	add	dword484,4
	mov	dword487,8
	add	dword487,[ebp-144]
	add	dword487,4
	fld	dword ptr [dword484]
	fsub	dword ptr [dword487]
	fmulp
	mov	dword490,[ebp-140]
	add	dword490,4
	mov	dword493,[ebp-144]
	add	dword493,4
	mov	dword495,[dword490]
	sub	dword495,[dword493]
	int2float	dword495
	fdivp
	mov	dword497,8
	add	dword497,[ebp-144]
	add	dword497,4
	fadd	dword ptr [dword497]
	fstp	dword ptr [ebp-172]
	mov	dword501,[ebp-148]
	add	dword501,4
	mov	dword504,[ebp-164]
	sub	dword504,[dword501]
	int2float	dword504
	mov	dword506,8
	add	dword506,[ebp-140]
	add	dword506,4
	mov	dword509,8
	add	dword509,[ebp-148]
	add	dword509,4
	fld	dword ptr [dword506]
	fsub	dword ptr [dword509]
	fmulp
	mov	dword512,[ebp-140]
	add	dword512,4
	mov	dword515,[ebp-148]
	add	dword515,4
	mov	dword517,[dword512]
	sub	dword517,[dword515]
	int2float	dword517
	fdivp
	mov	dword519,8
	add	dword519,[ebp-148]
	add	dword519,4
	fadd	dword ptr [dword519]
	fstp	dword ptr [ebp-180]
	mov	dword524,[ebp-160]
	sub	dword524,[ebp-156]
	int2float	dword524
	fld	dword ptr [ebp-176]
	fsub	dword ptr [ebp-168]
	fdivrp
	fstp	dword ptr [ebp-184]
	mov	dword530,[ebp-160]
	sub	dword530,[ebp-156]
	int2float	dword530
	fld	dword ptr [ebp-180]
	fsub	dword ptr [ebp-172]
	fdivrp
	fstp	dword ptr [ebp-188]
	mov	dword1034,[ebp-188]
	mov	[ebp-192],dword1034
	mov	dword1033,[ebp-184]
	mov	[ebp-196],dword1033
	mov	dword1032,[ebp-180]
	mov	[ebp-200],dword1032
	mov	dword1031,[ebp-176]
	mov	[ebp-204],dword1031
	mov	dword1030,[ebp-172]
	mov	[ebp-208],dword1030
	mov	dword1029,[ebp-168]
	mov	[ebp-212],dword1029
	mov	dword1028,[ebp-164]
	mov	[ebp-216],dword1028
	mov	dword1027,[ebp-160]
	mov	[ebp-220],dword1027
	mov	dword1026,[ebp-156]
	mov	[ebp-224],dword1026
; start of inline function _rasterize_horiz_line__unordered
	mov	dword1038,[ebp-224]
	cmp	dword1038,[ebp-220]
	jg	label0031
	mov	dword1059,[ebp-192]
	mov	[ebp-228],dword1059
	mov	dword1058,[ebp-196]
	mov	[ebp-232],dword1058
	mov	dword1057,[ebp-208]
	mov	[ebp-236],dword1057
	mov	dword1056,[ebp-212]
	mov	[ebp-240],dword1056
	mov	dword1055,[ebp-216]
	mov	[ebp-244],dword1055
	mov	dword1054,[ebp-220]
	mov	[ebp-248],dword1054
	mov	dword1053,[ebp-224]
	mov	[ebp-252],dword1053
; start of inline function _rasterize_horiz_line
	mov	dword1063,dword ptr [__pitch]
	imul	dword1063,[ebp-244]
	add	dword1063,dword ptr [__videomem]
	sal	dword ptr [ebp-252],2
	add	dword1063,[ebp-252]
	mov	[ebp-256],dword1063
	sal	dword ptr [ebp-248],2
	mov	dword1071,[ebp-256]
	add	dword1071,[ebp-248]
	sal	dword ptr [ebp-252],2
	sub	dword1071,[ebp-252]
	mov	[ebp-260],dword1071
label0033:
	mov	dword1139,[ebp-236]
	mov	[ebp-300],dword1139
	mov	dword1138,[ebp-240]
	mov	[ebp-304],dword1138
; start of inline function _tex2d
	mov	dword1143,dword ptr [__texture_width]
	dec	dword1143
	int2float	dword1143
	fmul	dword ptr [ebp-304]
	float2int	dword1145
	mov	[ebp-308],dword1145
	mov	dword1149,dword ptr [__texture_height]
	dec	dword1149
	int2float	dword1149
	fmul	dword ptr [ebp-300]
	float2int	dword1151
	mov	[ebp-312],dword1151
	mov	dword1155,[ebp-312]
	imul	dword1155,dword ptr [__texture_width]
	add	dword1155,[ebp-308]
	sal	dword1155,2
	add	dword1155,dword ptr [__texture_data]
	mov	dword1159,[dword1155]
	mov	[ebp-316],dword1159
label0037:
; end of inline function _tex2d
	mov	dword1077,[ebp-316]
	mov	[ebp-264],dword1077
	sar	dword ptr [ebp-264],24
	mov	dword1082,[ebp-264]
	and	dword1082,-289
	mov	[ebp-292],dword1082
	cmp	dword ptr [ebp-292],0
	je	label0036
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword1089,[ebp-256]
	mov	dword1091,[dword1089]
	mov	[ebp-280],dword1091
	mov	dword1094,[ebp-280]
	and	dword1094,-73984
	sar	dword1094,8
	mov	[ebp-284],dword1094
	mov	dword1099,[ebp-280]
	and	dword1099,-289
	mov	[ebp-288],dword1099
	mov	dword1103,[ebp-264]
	and	dword1103,-73984
	sar	dword1103,8
	mov	[ebp-272],dword1103
	mov	dword1108,[ebp-264]
	and	dword1108,-289
	mov	[ebp-276],dword1108
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword1114
	mov	[ebp-272],dword1114
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword1120
	mov	[ebp-276],dword1120
	sal	dword ptr [ebp-272],8
	mov	dword1125,[ebp-272]
	add	dword1125,[ebp-276]
	mov	[ebp-268],dword1125
	mov	dword1128,[ebp-256]
	mov	dword1130,[ebp-268]
	mov	[dword1128],dword1130
label0036:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0034:
	add	dword ptr [ebp-256],4
	mov	dword1137,[ebp-256]
	cmp	dword1137,[ebp-260]
	jl	label0033
label0035:
label0038:
; end of inline function _rasterize_horiz_line
	jmp	label0032
label0031:
	mov	dword1166,[ebp-192]
	mov	[ebp-228],dword1166
	mov	dword1165,[ebp-196]
	mov	[ebp-232],dword1165
	mov	dword1164,[ebp-200]
	mov	[ebp-236],dword1164
	mov	dword1163,[ebp-204]
	mov	[ebp-240],dword1163
	mov	dword1162,[ebp-216]
	mov	[ebp-244],dword1162
	mov	dword1161,[ebp-224]
	mov	[ebp-248],dword1161
	mov	dword1160,[ebp-220]
	mov	[ebp-252],dword1160
; start of inline function _rasterize_horiz_line
	mov	dword1170,dword ptr [__pitch]
	imul	dword1170,[ebp-244]
	add	dword1170,dword ptr [__videomem]
	sal	dword ptr [ebp-252],2
	add	dword1170,[ebp-252]
	mov	[ebp-256],dword1170
	sal	dword ptr [ebp-248],2
	mov	dword1178,[ebp-256]
	add	dword1178,[ebp-248]
	sal	dword ptr [ebp-252],2
	sub	dword1178,[ebp-252]
	mov	[ebp-260],dword1178
label0039:
	mov	dword1246,[ebp-236]
	mov	[ebp-300],dword1246
	mov	dword1245,[ebp-240]
	mov	[ebp-304],dword1245
; start of inline function _tex2d
	mov	dword1250,dword ptr [__texture_width]
	dec	dword1250
	int2float	dword1250
	fmul	dword ptr [ebp-304]
	float2int	dword1252
	mov	[ebp-308],dword1252
	mov	dword1256,dword ptr [__texture_height]
	dec	dword1256
	int2float	dword1256
	fmul	dword ptr [ebp-300]
	float2int	dword1258
	mov	[ebp-312],dword1258
	mov	dword1262,[ebp-312]
	imul	dword1262,dword ptr [__texture_width]
	add	dword1262,[ebp-308]
	sal	dword1262,2
	add	dword1262,dword ptr [__texture_data]
	mov	dword1266,[dword1262]
	mov	[ebp-316],dword1266
label003d:
; end of inline function _tex2d
	mov	dword1184,[ebp-316]
	mov	[ebp-264],dword1184
	sar	dword ptr [ebp-264],24
	mov	dword1189,[ebp-264]
	and	dword1189,-289
	mov	[ebp-292],dword1189
	cmp	dword ptr [ebp-292],0
	je	label003c
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword1196,[ebp-256]
	mov	dword1198,[dword1196]
	mov	[ebp-280],dword1198
	mov	dword1201,[ebp-280]
	and	dword1201,-73984
	sar	dword1201,8
	mov	[ebp-284],dword1201
	mov	dword1206,[ebp-280]
	and	dword1206,-289
	mov	[ebp-288],dword1206
	mov	dword1210,[ebp-264]
	and	dword1210,-73984
	sar	dword1210,8
	mov	[ebp-272],dword1210
	mov	dword1215,[ebp-264]
	and	dword1215,-289
	mov	[ebp-276],dword1215
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword1221
	mov	[ebp-272],dword1221
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword1227
	mov	[ebp-276],dword1227
	sal	dword ptr [ebp-272],8
	mov	dword1232,[ebp-272]
	add	dword1232,[ebp-276]
	mov	[ebp-268],dword1232
	mov	dword1235,[ebp-256]
	mov	dword1237,[ebp-268]
	mov	[dword1235],dword1237
label003c:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label003a:
	add	dword ptr [ebp-256],4
	mov	dword1244,[ebp-256]
	cmp	dword1244,[ebp-260]
	jl	label0039
label003b:
label003e:
; end of inline function _rasterize_horiz_line
label0032:
label003f:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-164]
	jmp	label0011
label0012:
label006f:
; end of inline function _rasterize_triangle_2i
	inc	dword ptr [ebp-136]
	jmp	label0006
label0007:
	destroy_stack_frame
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	create_stack_frame
	mov	dword102,[ebp+12]
	fld1
	fstp	dword ptr [ebp-20]
	mov	dword13,[dword102+8]
	mov	[ebp-24],dword13
	mov	dword12,[dword102+4]
	mov	[ebp-28],dword12
	mov	dword11,[dword102]
	mov	[ebp-32],dword11
	lea	dword7,[ebp-16]
	mov	[ebp-36],dword7
; start of inline function vec4f_assign
	mov	dword16,[ebp-36]
	fld	dword ptr [ebp-32]
	fstp	dword ptr [dword16]
	mov	dword19,[ebp-36]
	fld	dword ptr [ebp-28]
	fstp	dword ptr [dword19+4]
	mov	dword22,[ebp-36]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword22+8]
	mov	dword25,[ebp-36]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword25+12]
label0000:
; end of inline function vec4f_assign
	mov	[ebp-40],(offset __mvproj_matrix)
	lea	dword9,[ebp-16]
	mov	[ebp-44],dword9
	mov	dword27,[ebp+8]
	mov	[ebp-48],dword27
; start of inline function matrix4f_transform
	mov	dword30,[ebp-44]
	mov	dword32,[ebp-40]
	fld	dword ptr [dword30+4]
	fmul	dword ptr [dword32+16]
	mov	dword34,[ebp-44]
	mov	dword36,[ebp-40]
	fld	dword ptr [dword34]
	fmul	dword ptr [dword36]
	faddp
	mov	dword38,[ebp-44]
	mov	dword40,[ebp-40]
	fld	dword ptr [dword38+8]
	fmul	dword ptr [dword40+32]
	faddp
	mov	dword42,[ebp-44]
	mov	dword44,[ebp-40]
	fld	dword ptr [dword42+12]
	fmul	dword ptr [dword44+48]
	faddp
	mov	dword46,[ebp-48]
	fstp	dword ptr [dword46]
	mov	dword48,[ebp-40]
	mov	dword50,[ebp-44]
	fld	dword ptr [dword50]
	fmul	dword ptr [dword48+4]
	mov	dword52,[ebp-44]
	mov	dword54,[ebp-40]
	fld	dword ptr [dword52+4]
	fmul	dword ptr [dword54+20]
	faddp
	mov	dword56,[ebp-44]
	mov	dword58,[ebp-40]
	fld	dword ptr [dword56+8]
	fmul	dword ptr [dword58+36]
	faddp
	mov	dword60,[ebp-44]
	mov	dword62,[ebp-40]
	fld	dword ptr [dword60+12]
	fmul	dword ptr [dword62+52]
	faddp
	mov	dword64,[ebp-48]
	fstp	dword ptr [dword64+4]
	mov	dword66,[ebp-40]
	mov	dword68,[ebp-44]
	fld	dword ptr [dword68]
	fmul	dword ptr [dword66+8]
	mov	dword70,[ebp-44]
	mov	dword72,[ebp-40]
	fld	dword ptr [dword70+4]
	fmul	dword ptr [dword72+24]
	faddp
	mov	dword74,[ebp-44]
	mov	dword76,[ebp-40]
	fld	dword ptr [dword74+8]
	fmul	dword ptr [dword76+40]
	faddp
	mov	dword78,[ebp-44]
	mov	dword80,[ebp-40]
	fld	dword ptr [dword78+12]
	fmul	dword ptr [dword80+56]
	faddp
	mov	dword82,[ebp-48]
	fstp	dword ptr [dword82+8]
	mov	dword84,[ebp-40]
	mov	dword86,[ebp-44]
	fld	dword ptr [dword86]
	fmul	dword ptr [dword84+12]
	mov	dword88,[ebp-44]
	mov	dword90,[ebp-40]
	fld	dword ptr [dword88+4]
	fmul	dword ptr [dword90+28]
	faddp
	mov	dword92,[ebp-44]
	mov	dword94,[ebp-40]
	fld	dword ptr [dword92+8]
	fmul	dword ptr [dword94+44]
	faddp
	mov	dword96,[ebp-44]
	mov	dword98,[ebp-40]
	fld	dword ptr [dword96+12]
	fmul	dword ptr [dword98+60]
	faddp
	mov	dword100,[ebp-48]
	fstp	dword ptr [dword100+12]
label0001:
; end of inline function matrix4f_transform
	destroy_stack_frame
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	create_stack_frame
	mov	dword4265,[ebp+8]
	mov	[ebp-1044],dword4265
	lea	dword2,[ebp-196]
	mov	[ebp-1048],dword2
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4268,[ebp-1044]
	mov	dword4279,[dword4268+8]
	mov	[ebp-1072],dword4279
	mov	dword4270,[ebp-1044]
	mov	dword4278,[dword4270+4]
	mov	[ebp-1076],dword4278
	mov	dword4272,[ebp-1044]
	mov	dword4277,[dword4272]
	mov	[ebp-1080],dword4277
	lea	dword4273,[ebp-1064]
	mov	[ebp-1084],dword4273
; start of inline function vec4f_assign
	mov	dword4282,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4282]
	mov	dword4285,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4285+4]
	mov	dword4288,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4288+8]
	mov	dword4291,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4291+12]
label00f4:
; end of inline function vec4f_assign
	lea	dword4274,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4274
	lea	dword4275,[ebp-1064]
	mov	[ebp-1092],dword4275
	mov	dword4293,[ebp-1048]
	mov	[ebp-1096],dword4293
; start of inline function matrix4f_transform
	mov	dword4296,[ebp-1092]
	mov	dword4298,[ebp-1088]
	fld	dword ptr [dword4296+4]
	fmul	dword ptr [dword4298+16]
	mov	dword4300,[ebp-1092]
	mov	dword4302,[ebp-1088]
	fld	dword ptr [dword4300]
	fmul	dword ptr [dword4302]
	faddp
	mov	dword4304,[ebp-1092]
	mov	dword4306,[ebp-1088]
	fld	dword ptr [dword4304+8]
	fmul	dword ptr [dword4306+32]
	faddp
	mov	dword4308,[ebp-1092]
	mov	dword4310,[ebp-1088]
	fld	dword ptr [dword4308+12]
	fmul	dword ptr [dword4310+48]
	faddp
	mov	dword4312,[ebp-1096]
	fstp	dword ptr [dword4312]
	mov	dword4314,[ebp-1088]
	mov	dword4316,[ebp-1092]
	fld	dword ptr [dword4316]
	fmul	dword ptr [dword4314+4]
	mov	dword4318,[ebp-1092]
	mov	dword4320,[ebp-1088]
	fld	dword ptr [dword4318+4]
	fmul	dword ptr [dword4320+20]
	faddp
	mov	dword4322,[ebp-1092]
	mov	dword4324,[ebp-1088]
	fld	dword ptr [dword4322+8]
	fmul	dword ptr [dword4324+36]
	faddp
	mov	dword4326,[ebp-1092]
	mov	dword4328,[ebp-1088]
	fld	dword ptr [dword4326+12]
	fmul	dword ptr [dword4328+52]
	faddp
	mov	dword4330,[ebp-1096]
	fstp	dword ptr [dword4330+4]
	mov	dword4332,[ebp-1088]
	mov	dword4334,[ebp-1092]
	fld	dword ptr [dword4334]
	fmul	dword ptr [dword4332+8]
	mov	dword4336,[ebp-1092]
	mov	dword4338,[ebp-1088]
	fld	dword ptr [dword4336+4]
	fmul	dword ptr [dword4338+24]
	faddp
	mov	dword4340,[ebp-1092]
	mov	dword4342,[ebp-1088]
	fld	dword ptr [dword4340+8]
	fmul	dword ptr [dword4342+40]
	faddp
	mov	dword4344,[ebp-1092]
	mov	dword4346,[ebp-1088]
	fld	dword ptr [dword4344+12]
	fmul	dword ptr [dword4346+56]
	faddp
	mov	dword4348,[ebp-1096]
	fstp	dword ptr [dword4348+8]
	mov	dword4350,[ebp-1088]
	mov	dword4352,[ebp-1092]
	fld	dword ptr [dword4352]
	fmul	dword ptr [dword4350+12]
	mov	dword4354,[ebp-1092]
	mov	dword4356,[ebp-1088]
	fld	dword ptr [dword4354+4]
	fmul	dword ptr [dword4356+28]
	faddp
	mov	dword4358,[ebp-1092]
	mov	dword4360,[ebp-1088]
	fld	dword ptr [dword4358+8]
	fmul	dword ptr [dword4360+44]
	faddp
	mov	dword4362,[ebp-1092]
	mov	dword4364,[ebp-1088]
	fld	dword ptr [dword4362+12]
	fmul	dword ptr [dword4364+60]
	faddp
	mov	dword4366,[ebp-1096]
	fstp	dword ptr [dword4366+12]
label00f5:
; end of inline function matrix4f_transform
label00f6:
; end of inline function _transform_to_projection_space
	lea	dword3,[ebp-196]
	add	dword3,16
	mov	dword6,[ebp+20]
	mov	dword7,[dword6]
	mov	dword8,[dword6+4]
	mov	[dword3],dword7
	mov	[dword3+4],dword8
	mov	dword4367,[ebp+12]
	mov	[ebp-1044],dword4367
	lea	dword10,[ebp-196]
	add	dword10,24
	mov	[ebp-1048],dword10
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4370,[ebp-1044]
	mov	dword4381,[dword4370+8]
	mov	[ebp-1072],dword4381
	mov	dword4372,[ebp-1044]
	mov	dword4380,[dword4372+4]
	mov	[ebp-1076],dword4380
	mov	dword4374,[ebp-1044]
	mov	dword4379,[dword4374]
	mov	[ebp-1080],dword4379
	lea	dword4375,[ebp-1064]
	mov	[ebp-1084],dword4375
; start of inline function vec4f_assign
	mov	dword4384,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4384]
	mov	dword4387,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4387+4]
	mov	dword4390,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4390+8]
	mov	dword4393,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4393+12]
label00f7:
; end of inline function vec4f_assign
	lea	dword4376,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4376
	lea	dword4377,[ebp-1064]
	mov	[ebp-1092],dword4377
	mov	dword4395,[ebp-1048]
	mov	[ebp-1096],dword4395
; start of inline function matrix4f_transform
	mov	dword4398,[ebp-1092]
	mov	dword4400,[ebp-1088]
	fld	dword ptr [dword4398+4]
	fmul	dword ptr [dword4400+16]
	mov	dword4402,[ebp-1092]
	mov	dword4404,[ebp-1088]
	fld	dword ptr [dword4402]
	fmul	dword ptr [dword4404]
	faddp
	mov	dword4406,[ebp-1092]
	mov	dword4408,[ebp-1088]
	fld	dword ptr [dword4406+8]
	fmul	dword ptr [dword4408+32]
	faddp
	mov	dword4410,[ebp-1092]
	mov	dword4412,[ebp-1088]
	fld	dword ptr [dword4410+12]
	fmul	dword ptr [dword4412+48]
	faddp
	mov	dword4414,[ebp-1096]
	fstp	dword ptr [dword4414]
	mov	dword4416,[ebp-1088]
	mov	dword4418,[ebp-1092]
	fld	dword ptr [dword4418]
	fmul	dword ptr [dword4416+4]
	mov	dword4420,[ebp-1092]
	mov	dword4422,[ebp-1088]
	fld	dword ptr [dword4420+4]
	fmul	dword ptr [dword4422+20]
	faddp
	mov	dword4424,[ebp-1092]
	mov	dword4426,[ebp-1088]
	fld	dword ptr [dword4424+8]
	fmul	dword ptr [dword4426+36]
	faddp
	mov	dword4428,[ebp-1092]
	mov	dword4430,[ebp-1088]
	fld	dword ptr [dword4428+12]
	fmul	dword ptr [dword4430+52]
	faddp
	mov	dword4432,[ebp-1096]
	fstp	dword ptr [dword4432+4]
	mov	dword4434,[ebp-1088]
	mov	dword4436,[ebp-1092]
	fld	dword ptr [dword4436]
	fmul	dword ptr [dword4434+8]
	mov	dword4438,[ebp-1092]
	mov	dword4440,[ebp-1088]
	fld	dword ptr [dword4438+4]
	fmul	dword ptr [dword4440+24]
	faddp
	mov	dword4442,[ebp-1092]
	mov	dword4444,[ebp-1088]
	fld	dword ptr [dword4442+8]
	fmul	dword ptr [dword4444+40]
	faddp
	mov	dword4446,[ebp-1092]
	mov	dword4448,[ebp-1088]
	fld	dword ptr [dword4446+12]
	fmul	dword ptr [dword4448+56]
	faddp
	mov	dword4450,[ebp-1096]
	fstp	dword ptr [dword4450+8]
	mov	dword4452,[ebp-1088]
	mov	dword4454,[ebp-1092]
	fld	dword ptr [dword4454]
	fmul	dword ptr [dword4452+12]
	mov	dword4456,[ebp-1092]
	mov	dword4458,[ebp-1088]
	fld	dword ptr [dword4456+4]
	fmul	dword ptr [dword4458+28]
	faddp
	mov	dword4460,[ebp-1092]
	mov	dword4462,[ebp-1088]
	fld	dword ptr [dword4460+8]
	fmul	dword ptr [dword4462+44]
	faddp
	mov	dword4464,[ebp-1092]
	mov	dword4466,[ebp-1088]
	fld	dword ptr [dword4464+12]
	fmul	dword ptr [dword4466+60]
	faddp
	mov	dword4468,[ebp-1096]
	fstp	dword ptr [dword4468+12]
label00f8:
; end of inline function matrix4f_transform
label00f9:
; end of inline function _transform_to_projection_space
	lea	dword12,[ebp-196]
	add	dword12,24
	add	dword12,16
	mov	dword16,[ebp+24]
	mov	dword17,[dword16]
	mov	dword18,[dword16+4]
	mov	[dword12],dword17
	mov	[dword12+4],dword18
	mov	dword4469,[ebp+16]
	mov	[ebp-1044],dword4469
	lea	dword20,[ebp-196]
	add	dword20,48
	mov	[ebp-1048],dword20
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4472,[ebp-1044]
	mov	dword4483,[dword4472+8]
	mov	[ebp-1072],dword4483
	mov	dword4474,[ebp-1044]
	mov	dword4482,[dword4474+4]
	mov	[ebp-1076],dword4482
	mov	dword4476,[ebp-1044]
	mov	dword4481,[dword4476]
	mov	[ebp-1080],dword4481
	lea	dword4477,[ebp-1064]
	mov	[ebp-1084],dword4477
; start of inline function vec4f_assign
	mov	dword4486,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4486]
	mov	dword4489,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4489+4]
	mov	dword4492,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4492+8]
	mov	dword4495,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4495+12]
label00fa:
; end of inline function vec4f_assign
	lea	dword4478,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4478
	lea	dword4479,[ebp-1064]
	mov	[ebp-1092],dword4479
	mov	dword4497,[ebp-1048]
	mov	[ebp-1096],dword4497
; start of inline function matrix4f_transform
	mov	dword4500,[ebp-1092]
	mov	dword4502,[ebp-1088]
	fld	dword ptr [dword4500+4]
	fmul	dword ptr [dword4502+16]
	mov	dword4504,[ebp-1092]
	mov	dword4506,[ebp-1088]
	fld	dword ptr [dword4504]
	fmul	dword ptr [dword4506]
	faddp
	mov	dword4508,[ebp-1092]
	mov	dword4510,[ebp-1088]
	fld	dword ptr [dword4508+8]
	fmul	dword ptr [dword4510+32]
	faddp
	mov	dword4512,[ebp-1092]
	mov	dword4514,[ebp-1088]
	fld	dword ptr [dword4512+12]
	fmul	dword ptr [dword4514+48]
	faddp
	mov	dword4516,[ebp-1096]
	fstp	dword ptr [dword4516]
	mov	dword4518,[ebp-1088]
	mov	dword4520,[ebp-1092]
	fld	dword ptr [dword4520]
	fmul	dword ptr [dword4518+4]
	mov	dword4522,[ebp-1092]
	mov	dword4524,[ebp-1088]
	fld	dword ptr [dword4522+4]
	fmul	dword ptr [dword4524+20]
	faddp
	mov	dword4526,[ebp-1092]
	mov	dword4528,[ebp-1088]
	fld	dword ptr [dword4526+8]
	fmul	dword ptr [dword4528+36]
	faddp
	mov	dword4530,[ebp-1092]
	mov	dword4532,[ebp-1088]
	fld	dword ptr [dword4530+12]
	fmul	dword ptr [dword4532+52]
	faddp
	mov	dword4534,[ebp-1096]
	fstp	dword ptr [dword4534+4]
	mov	dword4536,[ebp-1088]
	mov	dword4538,[ebp-1092]
	fld	dword ptr [dword4538]
	fmul	dword ptr [dword4536+8]
	mov	dword4540,[ebp-1092]
	mov	dword4542,[ebp-1088]
	fld	dword ptr [dword4540+4]
	fmul	dword ptr [dword4542+24]
	faddp
	mov	dword4544,[ebp-1092]
	mov	dword4546,[ebp-1088]
	fld	dword ptr [dword4544+8]
	fmul	dword ptr [dword4546+40]
	faddp
	mov	dword4548,[ebp-1092]
	mov	dword4550,[ebp-1088]
	fld	dword ptr [dword4548+12]
	fmul	dword ptr [dword4550+56]
	faddp
	mov	dword4552,[ebp-1096]
	fstp	dword ptr [dword4552+8]
	mov	dword4554,[ebp-1088]
	mov	dword4556,[ebp-1092]
	fld	dword ptr [dword4556]
	fmul	dword ptr [dword4554+12]
	mov	dword4558,[ebp-1092]
	mov	dword4560,[ebp-1088]
	fld	dword ptr [dword4558+4]
	fmul	dword ptr [dword4560+28]
	faddp
	mov	dword4562,[ebp-1092]
	mov	dword4564,[ebp-1088]
	fld	dword ptr [dword4562+8]
	fmul	dword ptr [dword4564+44]
	faddp
	mov	dword4566,[ebp-1092]
	mov	dword4568,[ebp-1088]
	fld	dword ptr [dword4566+12]
	fmul	dword ptr [dword4568+60]
	faddp
	mov	dword4570,[ebp-1096]
	fstp	dword ptr [dword4570+12]
label00fb:
; end of inline function matrix4f_transform
label00fc:
; end of inline function _transform_to_projection_space
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
	lea	dword37,[ebp-196]
	mov	[ebp-200],dword37
; start of inline function _rasterize_polygon_4f
	mov	dword2015,[ebp-200]
	mov	[ebp-648],dword2015
; start of inline function _clip_poligon
	lea	dword2017,dword ptr [__clip_z_far_norm]
	mov	[ebp-848],dword2017
	lea	dword2018,dword ptr [__clip_z_far_base]
	mov	[ebp-852],dword2018
	mov	dword2045,[ebp-648]
	mov	[ebp-856],dword2045
	lea	dword2020,[ebp-844]
	mov	[ebp-860],dword2020
; start of inline function _clip_on_plain
	mov	dword2048,[ebp-860]
	mov	dword ptr [dword2048+192],0
	mov	dword2051,[ebp-856]
	mov	[ebp-864],dword2051
	mov	dword2054,[ebp-856]
	add	dword2054,24
	mov	[ebp-868],dword2054
label0070:
label0071:
	mov	dword2058,[ebp-856]
	mov	dword2060,[dword2058+192]
	imul	dword2060,24
	mov	dword2062,[ebp-856]
	add	dword2062,dword2060
	cmp	dword2062,[ebp-868]
	jle	label0072
	mov	dword2208,[ebp-852]
	mov	[ebp-968],dword2208
	mov	dword2066,[ebp-864]
	mov	[ebp-972],dword2066
	lea	dword2067,[ebp-884]
	mov	[ebp-976],dword2067
; start of inline function vec4f_subtract
	mov	dword2211,[ebp-972]
	mov	dword2213,[ebp-968]
	fld	dword ptr [dword2211]
	fsub	dword ptr [dword2213]
	mov	dword2215,[ebp-976]
	fstp	dword ptr [dword2215]
	mov	dword2217,[ebp-972]
	mov	dword2219,[ebp-968]
	fld	dword ptr [dword2217+4]
	fsub	dword ptr [dword2219+4]
	mov	dword2221,[ebp-976]
	fstp	dword ptr [dword2221+4]
	mov	dword2223,[ebp-972]
	mov	dword2225,[ebp-968]
	fld	dword ptr [dword2223+8]
	fsub	dword ptr [dword2225+8]
	mov	dword2227,[ebp-976]
	fstp	dword ptr [dword2227+8]
	mov	dword2229,[ebp-972]
	mov	dword2231,[ebp-968]
	fld	dword ptr [dword2229+12]
	fsub	dword ptr [dword2231+12]
	mov	dword2233,[ebp-976]
	fstp	dword ptr [dword2233+12]
label007b:
; end of inline function vec4f_subtract
	mov	dword2311,[ebp-848]
	mov	[ebp-980],dword2311
	lea	dword2069,[ebp-884]
	mov	[ebp-984],dword2069
; start of inline function vec4f_dot
	mov	dword2314,[ebp-984]
	mov	dword2316,[ebp-980]
	fld	dword ptr [dword2314+4]
	fmul	dword ptr [dword2316+4]
	mov	dword2318,[ebp-984]
	mov	dword2320,[ebp-980]
	fld	dword ptr [dword2318]
	fmul	dword ptr [dword2320]
	faddp
	mov	dword2322,[ebp-984]
	mov	dword2324,[ebp-980]
	fld	dword ptr [dword2322+8]
	fmul	dword ptr [dword2324+8]
	faddp
	mov	dword2326,[ebp-984]
	mov	dword2328,[ebp-980]
	fld	dword ptr [dword2326+12]
	fmul	dword ptr [dword2328+12]
	faddp
	fstp	dword ptr [ebp-988]
label007f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2234,[ebp-852]
	mov	[ebp-968],dword2234
	mov	dword2073,[ebp-868]
	mov	[ebp-972],dword2073
	lea	dword2074,[ebp-884]
	mov	[ebp-976],dword2074
; start of inline function vec4f_subtract
	mov	dword2237,[ebp-972]
	mov	dword2239,[ebp-968]
	fld	dword ptr [dword2237]
	fsub	dword ptr [dword2239]
	mov	dword2241,[ebp-976]
	fstp	dword ptr [dword2241]
	mov	dword2243,[ebp-972]
	mov	dword2245,[ebp-968]
	fld	dword ptr [dword2243+4]
	fsub	dword ptr [dword2245+4]
	mov	dword2247,[ebp-976]
	fstp	dword ptr [dword2247+4]
	mov	dword2249,[ebp-972]
	mov	dword2251,[ebp-968]
	fld	dword ptr [dword2249+8]
	fsub	dword ptr [dword2251+8]
	mov	dword2253,[ebp-976]
	fstp	dword ptr [dword2253+8]
	mov	dword2255,[ebp-972]
	mov	dword2257,[ebp-968]
	fld	dword ptr [dword2255+12]
	fsub	dword ptr [dword2257+12]
	mov	dword2259,[ebp-976]
	fstp	dword ptr [dword2259+12]
label007c:
; end of inline function vec4f_subtract
	mov	dword2329,[ebp-848]
	mov	[ebp-980],dword2329
	lea	dword2076,[ebp-884]
	mov	[ebp-984],dword2076
; start of inline function vec4f_dot
	mov	dword2332,[ebp-984]
	mov	dword2334,[ebp-980]
	fld	dword ptr [dword2332+4]
	fmul	dword ptr [dword2334+4]
	mov	dword2336,[ebp-984]
	mov	dword2338,[ebp-980]
	fld	dword ptr [dword2336]
	fmul	dword ptr [dword2338]
	faddp
	mov	dword2340,[ebp-984]
	mov	dword2342,[ebp-980]
	fld	dword ptr [dword2340+8]
	fmul	dword ptr [dword2342+8]
	faddp
	mov	dword2344,[ebp-984]
	mov	dword2346,[ebp-980]
	fld	dword ptr [dword2344+12]
	fmul	dword ptr [dword2346+12]
	faddp
	fstp	dword ptr [ebp-988]
label0080:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-916]
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jb	label0073
	mov	dword2080,[ebp-860]
	mov	dword2081,[dword2080+192]
	inc	dword ptr [dword2080+192]
	imul	dword2081,24
	mov	dword2084,[ebp-860]
	add	dword2084,dword2081
	mov	dword2086,[ebp-864]
	mov	dword2087,[dword2086]
	mov	dword2088,[dword2086+4]
	mov	[dword2084],dword2087
	mov	[dword2084+4],dword2088
	mov	dword2087,[dword2086+8]
	mov	dword2088,[dword2086+12]
	mov	[dword2084+8],dword2087
	mov	[dword2084+12],dword2088
	mov	dword2087,[dword2086+16]
	mov	dword2088,[dword2086+20]
	mov	[dword2084+16],dword2087
	mov	[dword2084+20],dword2088
label0073:
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jbe	label0076
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label0075
label0076:
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label0074
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jae	label0074
label0075:
	mov	dword2094,[ebp-864]
	mov	[ebp-968],dword2094
	mov	dword2260,[ebp-852]
	mov	[ebp-972],dword2260
	lea	dword2096,[ebp-884]
	mov	[ebp-976],dword2096
; start of inline function vec4f_subtract
	mov	dword2263,[ebp-972]
	mov	dword2265,[ebp-968]
	fld	dword ptr [dword2263]
	fsub	dword ptr [dword2265]
	mov	dword2267,[ebp-976]
	fstp	dword ptr [dword2267]
	mov	dword2269,[ebp-972]
	mov	dword2271,[ebp-968]
	fld	dword ptr [dword2269+4]
	fsub	dword ptr [dword2271+4]
	mov	dword2273,[ebp-976]
	fstp	dword ptr [dword2273+4]
	mov	dword2275,[ebp-972]
	mov	dword2277,[ebp-968]
	fld	dword ptr [dword2275+8]
	fsub	dword ptr [dword2277+8]
	mov	dword2279,[ebp-976]
	fstp	dword ptr [dword2279+8]
	mov	dword2281,[ebp-972]
	mov	dword2283,[ebp-968]
	fld	dword ptr [dword2281+12]
	fsub	dword ptr [dword2283+12]
	mov	dword2285,[ebp-976]
	fstp	dword ptr [dword2285+12]
label007d:
; end of inline function vec4f_subtract
	mov	dword2098,[ebp-864]
	mov	[ebp-968],dword2098
	mov	dword2100,[ebp-868]
	mov	[ebp-972],dword2100
	lea	dword2101,[ebp-900]
	mov	[ebp-976],dword2101
; start of inline function vec4f_subtract
	mov	dword2288,[ebp-972]
	mov	dword2290,[ebp-968]
	fld	dword ptr [dword2288]
	fsub	dword ptr [dword2290]
	mov	dword2292,[ebp-976]
	fstp	dword ptr [dword2292]
	mov	dword2294,[ebp-972]
	mov	dword2296,[ebp-968]
	fld	dword ptr [dword2294+4]
	fsub	dword ptr [dword2296+4]
	mov	dword2298,[ebp-976]
	fstp	dword ptr [dword2298+4]
	mov	dword2300,[ebp-972]
	mov	dword2302,[ebp-968]
	fld	dword ptr [dword2300+8]
	fsub	dword ptr [dword2302+8]
	mov	dword2304,[ebp-976]
	fstp	dword ptr [dword2304+8]
	mov	dword2306,[ebp-972]
	mov	dword2308,[ebp-968]
	fld	dword ptr [dword2306+12]
	fsub	dword ptr [dword2308+12]
	mov	dword2310,[ebp-976]
	fstp	dword ptr [dword2310+12]
label007e:
; end of inline function vec4f_subtract
	mov	dword2347,[ebp-848]
	mov	[ebp-980],dword2347
	lea	dword2103,[ebp-884]
	mov	[ebp-984],dword2103
; start of inline function vec4f_dot
	mov	dword2350,[ebp-984]
	mov	dword2352,[ebp-980]
	fld	dword ptr [dword2350+4]
	fmul	dword ptr [dword2352+4]
	mov	dword2354,[ebp-984]
	mov	dword2356,[ebp-980]
	fld	dword ptr [dword2354]
	fmul	dword ptr [dword2356]
	faddp
	mov	dword2358,[ebp-984]
	mov	dword2360,[ebp-980]
	fld	dword ptr [dword2358+8]
	fmul	dword ptr [dword2360+8]
	faddp
	mov	dword2362,[ebp-984]
	mov	dword2364,[ebp-980]
	fld	dword ptr [dword2362+12]
	fmul	dword ptr [dword2364+12]
	faddp
	fstp	dword ptr [ebp-988]
label0081:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword2365,[ebp-848]
	mov	[ebp-980],dword2365
	lea	dword2105,[ebp-900]
	mov	[ebp-984],dword2105
; start of inline function vec4f_dot
	mov	dword2368,[ebp-984]
	mov	dword2370,[ebp-980]
	fld	dword ptr [dword2368+4]
	fmul	dword ptr [dword2370+4]
	mov	dword2372,[ebp-984]
	mov	dword2374,[ebp-980]
	fld	dword ptr [dword2372]
	fmul	dword ptr [dword2374]
	faddp
	mov	dword2376,[ebp-984]
	mov	dword2378,[ebp-980]
	fld	dword ptr [dword2376+8]
	fmul	dword ptr [dword2378+8]
	faddp
	mov	dword2380,[ebp-984]
	mov	dword2382,[ebp-980]
	fld	dword ptr [dword2380+12]
	fmul	dword ptr [dword2382+12]
	faddp
	fstp	dword ptr [ebp-988]
label0082:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword2383,[ebp-920]
	mov	[ebp-992],dword2383
	lea	dword2108,[ebp-900]
	mov	[ebp-996],dword2108
; start of inline function vec4f_mul
	mov	dword2386,[ebp-996]
	fld	dword ptr [dword2386]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2386]
	mov	dword2389,[ebp-996]
	fld	dword ptr [dword2389+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2389+4]
	mov	dword2392,[ebp-996]
	fld	dword ptr [dword2392+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2392+8]
	mov	dword2395,[ebp-996]
	fld	dword ptr [dword2395+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2395+12]
label0083:
; end of inline function vec4f_mul
	lea	dword2109,[ebp-900]
	mov	[ebp-956],dword2109
	mov	dword2111,[ebp-864]
	mov	[ebp-960],dword2111
	mov	dword2113,[ebp-860]
	mov	dword2115,[dword2113+192]
	imul	dword2115,24
	mov	dword2117,[ebp-860]
	add	dword2117,dword2115
	mov	[ebp-964],dword2117
; start of inline function vec4f_add
	mov	dword2185,[ebp-960]
	mov	dword2187,[ebp-956]
	fld	dword ptr [dword2185]
	fadd	dword ptr [dword2187]
	mov	dword2189,[ebp-964]
	fstp	dword ptr [dword2189]
	mov	dword2191,[ebp-960]
	mov	dword2193,[ebp-956]
	fld	dword ptr [dword2191+4]
	fadd	dword ptr [dword2193+4]
	mov	dword2195,[ebp-964]
	fstp	dword ptr [dword2195+4]
	mov	dword2197,[ebp-960]
	mov	dword2199,[ebp-956]
	fld	dword ptr [dword2197+8]
	fadd	dword ptr [dword2199+8]
	mov	dword2201,[ebp-964]
	fstp	dword ptr [dword2201+8]
	mov	dword2203,[ebp-960]
	mov	dword2205,[ebp-956]
	fld	dword ptr [dword2203+12]
	fadd	dword ptr [dword2205+12]
	mov	dword2207,[ebp-964]
	fstp	dword ptr [dword2207+12]
label007a:
; end of inline function vec4f_add
	mov	dword2119,16
	add	dword2119,[ebp-864]
	mov	[ebp-936],dword2119
	mov	dword2121,16
	add	dword2121,[ebp-868]
	mov	[ebp-940],dword2121
	lea	dword2122,[ebp-908]
	mov	[ebp-944],dword2122
; start of inline function vec2f_subtract
	mov	dword2164,[ebp-940]
	mov	dword2166,[ebp-936]
	fld	dword ptr [dword2164]
	fsub	dword ptr [dword2166]
	mov	dword2168,[ebp-944]
	fstp	dword ptr [dword2168]
	mov	dword2170,[ebp-940]
	mov	dword2172,[ebp-936]
	fld	dword ptr [dword2170+4]
	fsub	dword ptr [dword2172+4]
	mov	dword2174,[ebp-944]
	fstp	dword ptr [dword2174+4]
label0078:
; end of inline function vec2f_subtract
	mov	dword2175,[ebp-920]
	mov	[ebp-948],dword2175
	lea	dword2124,[ebp-908]
	mov	[ebp-952],dword2124
; start of inline function vec2f_mul
	mov	dword2178,[ebp-952]
	fld	dword ptr [dword2178]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2178]
	mov	dword2181,[ebp-952]
	fld	dword ptr [dword2181+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2181+4]
label0079:
; end of inline function vec2f_mul
	lea	dword2125,[ebp-908]
	mov	[ebp-924],dword2125
	mov	dword2127,16
	add	dword2127,[ebp-864]
	mov	[ebp-928],dword2127
	mov	dword2129,[ebp-860]
	mov	dword2131,[dword2129+192]
	imul	dword2131,24
	mov	dword2133,[ebp-860]
	add	dword2133,dword2131
	add	dword2133,16
	mov	[ebp-932],dword2133
; start of inline function vec2f_add
	mov	dword2151,[ebp-928]
	mov	dword2153,[ebp-924]
	fld	dword ptr [dword2151]
	fadd	dword ptr [dword2153]
	mov	dword2155,[ebp-932]
	fstp	dword ptr [dword2155]
	mov	dword2157,[ebp-928]
	mov	dword2159,[ebp-924]
	fld	dword ptr [dword2157+4]
	fadd	dword ptr [dword2159+4]
	mov	dword2161,[ebp-932]
	fstp	dword ptr [dword2161+4]
label0077:
; end of inline function vec2f_add
	mov	dword2136,[ebp-860]
	inc	dword ptr [dword2136+192]
label0074:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label0071
label0072:
	mov	dword2140,[ebp-860]
	mov	dword2141,[dword2140+192]
	inc	dword ptr [dword2140+192]
	imul	dword2141,24
	mov	dword2144,[ebp-860]
	add	dword2144,dword2141
	mov	dword2146,[ebp-860]
	mov	dword2147,[dword2146]
	mov	dword2148,[dword2146+4]
	mov	[dword2144],dword2147
	mov	[dword2144+4],dword2148
	mov	dword2147,[dword2146+8]
	mov	dword2148,[dword2146+12]
	mov	[dword2144+8],dword2147
	mov	[dword2144+12],dword2148
	mov	dword2147,[dword2146+16]
	mov	dword2148,[dword2146+20]
	mov	[dword2144+16],dword2147
	mov	[dword2144+20],dword2148
label0084:
; end of inline function _clip_on_plain
	lea	dword2021,dword ptr [__clip_z_near_norm]
	mov	[ebp-848],dword2021
	lea	dword2022,dword ptr [__clip_z_near_base]
	mov	[ebp-852],dword2022
	lea	dword2023,[ebp-844]
	mov	[ebp-856],dword2023
	mov	dword2397,[ebp-648]
	mov	[ebp-860],dword2397
; start of inline function _clip_on_plain
	mov	dword2400,[ebp-860]
	mov	dword ptr [dword2400+192],0
	mov	dword2403,[ebp-856]
	mov	[ebp-864],dword2403
	mov	dword2406,[ebp-856]
	add	dword2406,24
	mov	[ebp-868],dword2406
label0085:
label0086:
	mov	dword2410,[ebp-856]
	mov	dword2412,[dword2410+192]
	imul	dword2412,24
	mov	dword2414,[ebp-856]
	add	dword2414,dword2412
	cmp	dword2414,[ebp-868]
	jle	label0087
	mov	dword2560,[ebp-852]
	mov	[ebp-968],dword2560
	mov	dword2418,[ebp-864]
	mov	[ebp-972],dword2418
	lea	dword2419,[ebp-884]
	mov	[ebp-976],dword2419
; start of inline function vec4f_subtract
	mov	dword2563,[ebp-972]
	mov	dword2565,[ebp-968]
	fld	dword ptr [dword2563]
	fsub	dword ptr [dword2565]
	mov	dword2567,[ebp-976]
	fstp	dword ptr [dword2567]
	mov	dword2569,[ebp-972]
	mov	dword2571,[ebp-968]
	fld	dword ptr [dword2569+4]
	fsub	dword ptr [dword2571+4]
	mov	dword2573,[ebp-976]
	fstp	dword ptr [dword2573+4]
	mov	dword2575,[ebp-972]
	mov	dword2577,[ebp-968]
	fld	dword ptr [dword2575+8]
	fsub	dword ptr [dword2577+8]
	mov	dword2579,[ebp-976]
	fstp	dword ptr [dword2579+8]
	mov	dword2581,[ebp-972]
	mov	dword2583,[ebp-968]
	fld	dword ptr [dword2581+12]
	fsub	dword ptr [dword2583+12]
	mov	dword2585,[ebp-976]
	fstp	dword ptr [dword2585+12]
label0090:
; end of inline function vec4f_subtract
	mov	dword2663,[ebp-848]
	mov	[ebp-980],dword2663
	lea	dword2421,[ebp-884]
	mov	[ebp-984],dword2421
; start of inline function vec4f_dot
	mov	dword2666,[ebp-984]
	mov	dword2668,[ebp-980]
	fld	dword ptr [dword2666+4]
	fmul	dword ptr [dword2668+4]
	mov	dword2670,[ebp-984]
	mov	dword2672,[ebp-980]
	fld	dword ptr [dword2670]
	fmul	dword ptr [dword2672]
	faddp
	mov	dword2674,[ebp-984]
	mov	dword2676,[ebp-980]
	fld	dword ptr [dword2674+8]
	fmul	dword ptr [dword2676+8]
	faddp
	mov	dword2678,[ebp-984]
	mov	dword2680,[ebp-980]
	fld	dword ptr [dword2678+12]
	fmul	dword ptr [dword2680+12]
	faddp
	fstp	dword ptr [ebp-988]
label0094:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2586,[ebp-852]
	mov	[ebp-968],dword2586
	mov	dword2425,[ebp-868]
	mov	[ebp-972],dword2425
	lea	dword2426,[ebp-884]
	mov	[ebp-976],dword2426
; start of inline function vec4f_subtract
	mov	dword2589,[ebp-972]
	mov	dword2591,[ebp-968]
	fld	dword ptr [dword2589]
	fsub	dword ptr [dword2591]
	mov	dword2593,[ebp-976]
	fstp	dword ptr [dword2593]
	mov	dword2595,[ebp-972]
	mov	dword2597,[ebp-968]
	fld	dword ptr [dword2595+4]
	fsub	dword ptr [dword2597+4]
	mov	dword2599,[ebp-976]
	fstp	dword ptr [dword2599+4]
	mov	dword2601,[ebp-972]
	mov	dword2603,[ebp-968]
	fld	dword ptr [dword2601+8]
	fsub	dword ptr [dword2603+8]
	mov	dword2605,[ebp-976]
	fstp	dword ptr [dword2605+8]
	mov	dword2607,[ebp-972]
	mov	dword2609,[ebp-968]
	fld	dword ptr [dword2607+12]
	fsub	dword ptr [dword2609+12]
	mov	dword2611,[ebp-976]
	fstp	dword ptr [dword2611+12]
label0091:
; end of inline function vec4f_subtract
	mov	dword2681,[ebp-848]
	mov	[ebp-980],dword2681
	lea	dword2428,[ebp-884]
	mov	[ebp-984],dword2428
; start of inline function vec4f_dot
	mov	dword2684,[ebp-984]
	mov	dword2686,[ebp-980]
	fld	dword ptr [dword2684+4]
	fmul	dword ptr [dword2686+4]
	mov	dword2688,[ebp-984]
	mov	dword2690,[ebp-980]
	fld	dword ptr [dword2688]
	fmul	dword ptr [dword2690]
	faddp
	mov	dword2692,[ebp-984]
	mov	dword2694,[ebp-980]
	fld	dword ptr [dword2692+8]
	fmul	dword ptr [dword2694+8]
	faddp
	mov	dword2696,[ebp-984]
	mov	dword2698,[ebp-980]
	fld	dword ptr [dword2696+12]
	fmul	dword ptr [dword2698+12]
	faddp
	fstp	dword ptr [ebp-988]
label0095:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-916]
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jb	label0088
	mov	dword2432,[ebp-860]
	mov	dword2433,[dword2432+192]
	inc	dword ptr [dword2432+192]
	imul	dword2433,24
	mov	dword2436,[ebp-860]
	add	dword2436,dword2433
	mov	dword2438,[ebp-864]
	mov	dword2439,[dword2438]
	mov	dword2440,[dword2438+4]
	mov	[dword2436],dword2439
	mov	[dword2436+4],dword2440
	mov	dword2439,[dword2438+8]
	mov	dword2440,[dword2438+12]
	mov	[dword2436+8],dword2439
	mov	[dword2436+12],dword2440
	mov	dword2439,[dword2438+16]
	mov	dword2440,[dword2438+20]
	mov	[dword2436+16],dword2439
	mov	[dword2436+20],dword2440
label0088:
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jbe	label008b
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label008a
label008b:
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label0089
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jae	label0089
label008a:
	mov	dword2446,[ebp-864]
	mov	[ebp-968],dword2446
	mov	dword2612,[ebp-852]
	mov	[ebp-972],dword2612
	lea	dword2448,[ebp-884]
	mov	[ebp-976],dword2448
; start of inline function vec4f_subtract
	mov	dword2615,[ebp-972]
	mov	dword2617,[ebp-968]
	fld	dword ptr [dword2615]
	fsub	dword ptr [dword2617]
	mov	dword2619,[ebp-976]
	fstp	dword ptr [dword2619]
	mov	dword2621,[ebp-972]
	mov	dword2623,[ebp-968]
	fld	dword ptr [dword2621+4]
	fsub	dword ptr [dword2623+4]
	mov	dword2625,[ebp-976]
	fstp	dword ptr [dword2625+4]
	mov	dword2627,[ebp-972]
	mov	dword2629,[ebp-968]
	fld	dword ptr [dword2627+8]
	fsub	dword ptr [dword2629+8]
	mov	dword2631,[ebp-976]
	fstp	dword ptr [dword2631+8]
	mov	dword2633,[ebp-972]
	mov	dword2635,[ebp-968]
	fld	dword ptr [dword2633+12]
	fsub	dword ptr [dword2635+12]
	mov	dword2637,[ebp-976]
	fstp	dword ptr [dword2637+12]
label0092:
; end of inline function vec4f_subtract
	mov	dword2450,[ebp-864]
	mov	[ebp-968],dword2450
	mov	dword2452,[ebp-868]
	mov	[ebp-972],dword2452
	lea	dword2453,[ebp-900]
	mov	[ebp-976],dword2453
; start of inline function vec4f_subtract
	mov	dword2640,[ebp-972]
	mov	dword2642,[ebp-968]
	fld	dword ptr [dword2640]
	fsub	dword ptr [dword2642]
	mov	dword2644,[ebp-976]
	fstp	dword ptr [dword2644]
	mov	dword2646,[ebp-972]
	mov	dword2648,[ebp-968]
	fld	dword ptr [dword2646+4]
	fsub	dword ptr [dword2648+4]
	mov	dword2650,[ebp-976]
	fstp	dword ptr [dword2650+4]
	mov	dword2652,[ebp-972]
	mov	dword2654,[ebp-968]
	fld	dword ptr [dword2652+8]
	fsub	dword ptr [dword2654+8]
	mov	dword2656,[ebp-976]
	fstp	dword ptr [dword2656+8]
	mov	dword2658,[ebp-972]
	mov	dword2660,[ebp-968]
	fld	dword ptr [dword2658+12]
	fsub	dword ptr [dword2660+12]
	mov	dword2662,[ebp-976]
	fstp	dword ptr [dword2662+12]
label0093:
; end of inline function vec4f_subtract
	mov	dword2699,[ebp-848]
	mov	[ebp-980],dword2699
	lea	dword2455,[ebp-884]
	mov	[ebp-984],dword2455
; start of inline function vec4f_dot
	mov	dword2702,[ebp-984]
	mov	dword2704,[ebp-980]
	fld	dword ptr [dword2702+4]
	fmul	dword ptr [dword2704+4]
	mov	dword2706,[ebp-984]
	mov	dword2708,[ebp-980]
	fld	dword ptr [dword2706]
	fmul	dword ptr [dword2708]
	faddp
	mov	dword2710,[ebp-984]
	mov	dword2712,[ebp-980]
	fld	dword ptr [dword2710+8]
	fmul	dword ptr [dword2712+8]
	faddp
	mov	dword2714,[ebp-984]
	mov	dword2716,[ebp-980]
	fld	dword ptr [dword2714+12]
	fmul	dword ptr [dword2716+12]
	faddp
	fstp	dword ptr [ebp-988]
label0096:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword2717,[ebp-848]
	mov	[ebp-980],dword2717
	lea	dword2457,[ebp-900]
	mov	[ebp-984],dword2457
; start of inline function vec4f_dot
	mov	dword2720,[ebp-984]
	mov	dword2722,[ebp-980]
	fld	dword ptr [dword2720+4]
	fmul	dword ptr [dword2722+4]
	mov	dword2724,[ebp-984]
	mov	dword2726,[ebp-980]
	fld	dword ptr [dword2724]
	fmul	dword ptr [dword2726]
	faddp
	mov	dword2728,[ebp-984]
	mov	dword2730,[ebp-980]
	fld	dword ptr [dword2728+8]
	fmul	dword ptr [dword2730+8]
	faddp
	mov	dword2732,[ebp-984]
	mov	dword2734,[ebp-980]
	fld	dword ptr [dword2732+12]
	fmul	dword ptr [dword2734+12]
	faddp
	fstp	dword ptr [ebp-988]
label0097:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword2735,[ebp-920]
	mov	[ebp-992],dword2735
	lea	dword2460,[ebp-900]
	mov	[ebp-996],dword2460
; start of inline function vec4f_mul
	mov	dword2738,[ebp-996]
	fld	dword ptr [dword2738]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2738]
	mov	dword2741,[ebp-996]
	fld	dword ptr [dword2741+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2741+4]
	mov	dword2744,[ebp-996]
	fld	dword ptr [dword2744+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2744+8]
	mov	dword2747,[ebp-996]
	fld	dword ptr [dword2747+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2747+12]
label0098:
; end of inline function vec4f_mul
	lea	dword2461,[ebp-900]
	mov	[ebp-956],dword2461
	mov	dword2463,[ebp-864]
	mov	[ebp-960],dword2463
	mov	dword2465,[ebp-860]
	mov	dword2467,[dword2465+192]
	imul	dword2467,24
	mov	dword2469,[ebp-860]
	add	dword2469,dword2467
	mov	[ebp-964],dword2469
; start of inline function vec4f_add
	mov	dword2537,[ebp-960]
	mov	dword2539,[ebp-956]
	fld	dword ptr [dword2537]
	fadd	dword ptr [dword2539]
	mov	dword2541,[ebp-964]
	fstp	dword ptr [dword2541]
	mov	dword2543,[ebp-960]
	mov	dword2545,[ebp-956]
	fld	dword ptr [dword2543+4]
	fadd	dword ptr [dword2545+4]
	mov	dword2547,[ebp-964]
	fstp	dword ptr [dword2547+4]
	mov	dword2549,[ebp-960]
	mov	dword2551,[ebp-956]
	fld	dword ptr [dword2549+8]
	fadd	dword ptr [dword2551+8]
	mov	dword2553,[ebp-964]
	fstp	dword ptr [dword2553+8]
	mov	dword2555,[ebp-960]
	mov	dword2557,[ebp-956]
	fld	dword ptr [dword2555+12]
	fadd	dword ptr [dword2557+12]
	mov	dword2559,[ebp-964]
	fstp	dword ptr [dword2559+12]
label008f:
; end of inline function vec4f_add
	mov	dword2471,16
	add	dword2471,[ebp-864]
	mov	[ebp-936],dword2471
	mov	dword2473,16
	add	dword2473,[ebp-868]
	mov	[ebp-940],dword2473
	lea	dword2474,[ebp-908]
	mov	[ebp-944],dword2474
; start of inline function vec2f_subtract
	mov	dword2516,[ebp-940]
	mov	dword2518,[ebp-936]
	fld	dword ptr [dword2516]
	fsub	dword ptr [dword2518]
	mov	dword2520,[ebp-944]
	fstp	dword ptr [dword2520]
	mov	dword2522,[ebp-940]
	mov	dword2524,[ebp-936]
	fld	dword ptr [dword2522+4]
	fsub	dword ptr [dword2524+4]
	mov	dword2526,[ebp-944]
	fstp	dword ptr [dword2526+4]
label008d:
; end of inline function vec2f_subtract
	mov	dword2527,[ebp-920]
	mov	[ebp-948],dword2527
	lea	dword2476,[ebp-908]
	mov	[ebp-952],dword2476
; start of inline function vec2f_mul
	mov	dword2530,[ebp-952]
	fld	dword ptr [dword2530]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2530]
	mov	dword2533,[ebp-952]
	fld	dword ptr [dword2533+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2533+4]
label008e:
; end of inline function vec2f_mul
	lea	dword2477,[ebp-908]
	mov	[ebp-924],dword2477
	mov	dword2479,16
	add	dword2479,[ebp-864]
	mov	[ebp-928],dword2479
	mov	dword2481,[ebp-860]
	mov	dword2483,[dword2481+192]
	imul	dword2483,24
	mov	dword2485,[ebp-860]
	add	dword2485,dword2483
	add	dword2485,16
	mov	[ebp-932],dword2485
; start of inline function vec2f_add
	mov	dword2503,[ebp-928]
	mov	dword2505,[ebp-924]
	fld	dword ptr [dword2503]
	fadd	dword ptr [dword2505]
	mov	dword2507,[ebp-932]
	fstp	dword ptr [dword2507]
	mov	dword2509,[ebp-928]
	mov	dword2511,[ebp-924]
	fld	dword ptr [dword2509+4]
	fadd	dword ptr [dword2511+4]
	mov	dword2513,[ebp-932]
	fstp	dword ptr [dword2513+4]
label008c:
; end of inline function vec2f_add
	mov	dword2488,[ebp-860]
	inc	dword ptr [dword2488+192]
label0089:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label0086
label0087:
	mov	dword2492,[ebp-860]
	mov	dword2493,[dword2492+192]
	inc	dword ptr [dword2492+192]
	imul	dword2493,24
	mov	dword2496,[ebp-860]
	add	dword2496,dword2493
	mov	dword2498,[ebp-860]
	mov	dword2499,[dword2498]
	mov	dword2500,[dword2498+4]
	mov	[dword2496],dword2499
	mov	[dword2496+4],dword2500
	mov	dword2499,[dword2498+8]
	mov	dword2500,[dword2498+12]
	mov	[dword2496+8],dword2499
	mov	[dword2496+12],dword2500
	mov	dword2499,[dword2498+16]
	mov	dword2500,[dword2498+20]
	mov	[dword2496+16],dword2499
	mov	[dword2496+20],dword2500
label0099:
; end of inline function _clip_on_plain
	lea	dword2025,dword ptr [__clip_plane_left_norm]
	mov	[ebp-848],dword2025
	lea	dword2026,dword ptr [__clip_plane_left_base]
	mov	[ebp-852],dword2026
	mov	dword2749,[ebp-648]
	mov	[ebp-856],dword2749
	lea	dword2028,[ebp-844]
	mov	[ebp-860],dword2028
; start of inline function _clip_on_plain
	mov	dword2752,[ebp-860]
	mov	dword ptr [dword2752+192],0
	mov	dword2755,[ebp-856]
	mov	[ebp-864],dword2755
	mov	dword2758,[ebp-856]
	add	dword2758,24
	mov	[ebp-868],dword2758
label009a:
label009b:
	mov	dword2762,[ebp-856]
	mov	dword2764,[dword2762+192]
	imul	dword2764,24
	mov	dword2766,[ebp-856]
	add	dword2766,dword2764
	cmp	dword2766,[ebp-868]
	jle	label009c
	mov	dword2912,[ebp-852]
	mov	[ebp-968],dword2912
	mov	dword2770,[ebp-864]
	mov	[ebp-972],dword2770
	lea	dword2771,[ebp-884]
	mov	[ebp-976],dword2771
; start of inline function vec4f_subtract
	mov	dword2915,[ebp-972]
	mov	dword2917,[ebp-968]
	fld	dword ptr [dword2915]
	fsub	dword ptr [dword2917]
	mov	dword2919,[ebp-976]
	fstp	dword ptr [dword2919]
	mov	dword2921,[ebp-972]
	mov	dword2923,[ebp-968]
	fld	dword ptr [dword2921+4]
	fsub	dword ptr [dword2923+4]
	mov	dword2925,[ebp-976]
	fstp	dword ptr [dword2925+4]
	mov	dword2927,[ebp-972]
	mov	dword2929,[ebp-968]
	fld	dword ptr [dword2927+8]
	fsub	dword ptr [dword2929+8]
	mov	dword2931,[ebp-976]
	fstp	dword ptr [dword2931+8]
	mov	dword2933,[ebp-972]
	mov	dword2935,[ebp-968]
	fld	dword ptr [dword2933+12]
	fsub	dword ptr [dword2935+12]
	mov	dword2937,[ebp-976]
	fstp	dword ptr [dword2937+12]
label00a5:
; end of inline function vec4f_subtract
	mov	dword3015,[ebp-848]
	mov	[ebp-980],dword3015
	lea	dword2773,[ebp-884]
	mov	[ebp-984],dword2773
; start of inline function vec4f_dot
	mov	dword3018,[ebp-984]
	mov	dword3020,[ebp-980]
	fld	dword ptr [dword3018+4]
	fmul	dword ptr [dword3020+4]
	mov	dword3022,[ebp-984]
	mov	dword3024,[ebp-980]
	fld	dword ptr [dword3022]
	fmul	dword ptr [dword3024]
	faddp
	mov	dword3026,[ebp-984]
	mov	dword3028,[ebp-980]
	fld	dword ptr [dword3026+8]
	fmul	dword ptr [dword3028+8]
	faddp
	mov	dword3030,[ebp-984]
	mov	dword3032,[ebp-980]
	fld	dword ptr [dword3030+12]
	fmul	dword ptr [dword3032+12]
	faddp
	fstp	dword ptr [ebp-988]
label00a9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2938,[ebp-852]
	mov	[ebp-968],dword2938
	mov	dword2777,[ebp-868]
	mov	[ebp-972],dword2777
	lea	dword2778,[ebp-884]
	mov	[ebp-976],dword2778
; start of inline function vec4f_subtract
	mov	dword2941,[ebp-972]
	mov	dword2943,[ebp-968]
	fld	dword ptr [dword2941]
	fsub	dword ptr [dword2943]
	mov	dword2945,[ebp-976]
	fstp	dword ptr [dword2945]
	mov	dword2947,[ebp-972]
	mov	dword2949,[ebp-968]
	fld	dword ptr [dword2947+4]
	fsub	dword ptr [dword2949+4]
	mov	dword2951,[ebp-976]
	fstp	dword ptr [dword2951+4]
	mov	dword2953,[ebp-972]
	mov	dword2955,[ebp-968]
	fld	dword ptr [dword2953+8]
	fsub	dword ptr [dword2955+8]
	mov	dword2957,[ebp-976]
	fstp	dword ptr [dword2957+8]
	mov	dword2959,[ebp-972]
	mov	dword2961,[ebp-968]
	fld	dword ptr [dword2959+12]
	fsub	dword ptr [dword2961+12]
	mov	dword2963,[ebp-976]
	fstp	dword ptr [dword2963+12]
label00a6:
; end of inline function vec4f_subtract
	mov	dword3033,[ebp-848]
	mov	[ebp-980],dword3033
	lea	dword2780,[ebp-884]
	mov	[ebp-984],dword2780
; start of inline function vec4f_dot
	mov	dword3036,[ebp-984]
	mov	dword3038,[ebp-980]
	fld	dword ptr [dword3036+4]
	fmul	dword ptr [dword3038+4]
	mov	dword3040,[ebp-984]
	mov	dword3042,[ebp-980]
	fld	dword ptr [dword3040]
	fmul	dword ptr [dword3042]
	faddp
	mov	dword3044,[ebp-984]
	mov	dword3046,[ebp-980]
	fld	dword ptr [dword3044+8]
	fmul	dword ptr [dword3046+8]
	faddp
	mov	dword3048,[ebp-984]
	mov	dword3050,[ebp-980]
	fld	dword ptr [dword3048+12]
	fmul	dword ptr [dword3050+12]
	faddp
	fstp	dword ptr [ebp-988]
label00aa:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-916]
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jb	label009d
	mov	dword2784,[ebp-860]
	mov	dword2785,[dword2784+192]
	inc	dword ptr [dword2784+192]
	imul	dword2785,24
	mov	dword2788,[ebp-860]
	add	dword2788,dword2785
	mov	dword2790,[ebp-864]
	mov	dword2791,[dword2790]
	mov	dword2792,[dword2790+4]
	mov	[dword2788],dword2791
	mov	[dword2788+4],dword2792
	mov	dword2791,[dword2790+8]
	mov	dword2792,[dword2790+12]
	mov	[dword2788+8],dword2791
	mov	[dword2788+12],dword2792
	mov	dword2791,[dword2790+16]
	mov	dword2792,[dword2790+20]
	mov	[dword2788+16],dword2791
	mov	[dword2788+20],dword2792
label009d:
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jbe	label00a0
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label009f
label00a0:
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label009e
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jae	label009e
label009f:
	mov	dword2798,[ebp-864]
	mov	[ebp-968],dword2798
	mov	dword2964,[ebp-852]
	mov	[ebp-972],dword2964
	lea	dword2800,[ebp-884]
	mov	[ebp-976],dword2800
; start of inline function vec4f_subtract
	mov	dword2967,[ebp-972]
	mov	dword2969,[ebp-968]
	fld	dword ptr [dword2967]
	fsub	dword ptr [dword2969]
	mov	dword2971,[ebp-976]
	fstp	dword ptr [dword2971]
	mov	dword2973,[ebp-972]
	mov	dword2975,[ebp-968]
	fld	dword ptr [dword2973+4]
	fsub	dword ptr [dword2975+4]
	mov	dword2977,[ebp-976]
	fstp	dword ptr [dword2977+4]
	mov	dword2979,[ebp-972]
	mov	dword2981,[ebp-968]
	fld	dword ptr [dword2979+8]
	fsub	dword ptr [dword2981+8]
	mov	dword2983,[ebp-976]
	fstp	dword ptr [dword2983+8]
	mov	dword2985,[ebp-972]
	mov	dword2987,[ebp-968]
	fld	dword ptr [dword2985+12]
	fsub	dword ptr [dword2987+12]
	mov	dword2989,[ebp-976]
	fstp	dword ptr [dword2989+12]
label00a7:
; end of inline function vec4f_subtract
	mov	dword2802,[ebp-864]
	mov	[ebp-968],dword2802
	mov	dword2804,[ebp-868]
	mov	[ebp-972],dword2804
	lea	dword2805,[ebp-900]
	mov	[ebp-976],dword2805
; start of inline function vec4f_subtract
	mov	dword2992,[ebp-972]
	mov	dword2994,[ebp-968]
	fld	dword ptr [dword2992]
	fsub	dword ptr [dword2994]
	mov	dword2996,[ebp-976]
	fstp	dword ptr [dword2996]
	mov	dword2998,[ebp-972]
	mov	dword3000,[ebp-968]
	fld	dword ptr [dword2998+4]
	fsub	dword ptr [dword3000+4]
	mov	dword3002,[ebp-976]
	fstp	dword ptr [dword3002+4]
	mov	dword3004,[ebp-972]
	mov	dword3006,[ebp-968]
	fld	dword ptr [dword3004+8]
	fsub	dword ptr [dword3006+8]
	mov	dword3008,[ebp-976]
	fstp	dword ptr [dword3008+8]
	mov	dword3010,[ebp-972]
	mov	dword3012,[ebp-968]
	fld	dword ptr [dword3010+12]
	fsub	dword ptr [dword3012+12]
	mov	dword3014,[ebp-976]
	fstp	dword ptr [dword3014+12]
label00a8:
; end of inline function vec4f_subtract
	mov	dword3051,[ebp-848]
	mov	[ebp-980],dword3051
	lea	dword2807,[ebp-884]
	mov	[ebp-984],dword2807
; start of inline function vec4f_dot
	mov	dword3054,[ebp-984]
	mov	dword3056,[ebp-980]
	fld	dword ptr [dword3054+4]
	fmul	dword ptr [dword3056+4]
	mov	dword3058,[ebp-984]
	mov	dword3060,[ebp-980]
	fld	dword ptr [dword3058]
	fmul	dword ptr [dword3060]
	faddp
	mov	dword3062,[ebp-984]
	mov	dword3064,[ebp-980]
	fld	dword ptr [dword3062+8]
	fmul	dword ptr [dword3064+8]
	faddp
	mov	dword3066,[ebp-984]
	mov	dword3068,[ebp-980]
	fld	dword ptr [dword3066+12]
	fmul	dword ptr [dword3068+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ab:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3069,[ebp-848]
	mov	[ebp-980],dword3069
	lea	dword2809,[ebp-900]
	mov	[ebp-984],dword2809
; start of inline function vec4f_dot
	mov	dword3072,[ebp-984]
	mov	dword3074,[ebp-980]
	fld	dword ptr [dword3072+4]
	fmul	dword ptr [dword3074+4]
	mov	dword3076,[ebp-984]
	mov	dword3078,[ebp-980]
	fld	dword ptr [dword3076]
	fmul	dword ptr [dword3078]
	faddp
	mov	dword3080,[ebp-984]
	mov	dword3082,[ebp-980]
	fld	dword ptr [dword3080+8]
	fmul	dword ptr [dword3082+8]
	faddp
	mov	dword3084,[ebp-984]
	mov	dword3086,[ebp-980]
	fld	dword ptr [dword3084+12]
	fmul	dword ptr [dword3086+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ac:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3087,[ebp-920]
	mov	[ebp-992],dword3087
	lea	dword2812,[ebp-900]
	mov	[ebp-996],dword2812
; start of inline function vec4f_mul
	mov	dword3090,[ebp-996]
	fld	dword ptr [dword3090]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3090]
	mov	dword3093,[ebp-996]
	fld	dword ptr [dword3093+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3093+4]
	mov	dword3096,[ebp-996]
	fld	dword ptr [dword3096+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3096+8]
	mov	dword3099,[ebp-996]
	fld	dword ptr [dword3099+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3099+12]
label00ad:
; end of inline function vec4f_mul
	lea	dword2813,[ebp-900]
	mov	[ebp-956],dword2813
	mov	dword2815,[ebp-864]
	mov	[ebp-960],dword2815
	mov	dword2817,[ebp-860]
	mov	dword2819,[dword2817+192]
	imul	dword2819,24
	mov	dword2821,[ebp-860]
	add	dword2821,dword2819
	mov	[ebp-964],dword2821
; start of inline function vec4f_add
	mov	dword2889,[ebp-960]
	mov	dword2891,[ebp-956]
	fld	dword ptr [dword2889]
	fadd	dword ptr [dword2891]
	mov	dword2893,[ebp-964]
	fstp	dword ptr [dword2893]
	mov	dword2895,[ebp-960]
	mov	dword2897,[ebp-956]
	fld	dword ptr [dword2895+4]
	fadd	dword ptr [dword2897+4]
	mov	dword2899,[ebp-964]
	fstp	dword ptr [dword2899+4]
	mov	dword2901,[ebp-960]
	mov	dword2903,[ebp-956]
	fld	dword ptr [dword2901+8]
	fadd	dword ptr [dword2903+8]
	mov	dword2905,[ebp-964]
	fstp	dword ptr [dword2905+8]
	mov	dword2907,[ebp-960]
	mov	dword2909,[ebp-956]
	fld	dword ptr [dword2907+12]
	fadd	dword ptr [dword2909+12]
	mov	dword2911,[ebp-964]
	fstp	dword ptr [dword2911+12]
label00a4:
; end of inline function vec4f_add
	mov	dword2823,16
	add	dword2823,[ebp-864]
	mov	[ebp-936],dword2823
	mov	dword2825,16
	add	dword2825,[ebp-868]
	mov	[ebp-940],dword2825
	lea	dword2826,[ebp-908]
	mov	[ebp-944],dword2826
; start of inline function vec2f_subtract
	mov	dword2868,[ebp-940]
	mov	dword2870,[ebp-936]
	fld	dword ptr [dword2868]
	fsub	dword ptr [dword2870]
	mov	dword2872,[ebp-944]
	fstp	dword ptr [dword2872]
	mov	dword2874,[ebp-940]
	mov	dword2876,[ebp-936]
	fld	dword ptr [dword2874+4]
	fsub	dword ptr [dword2876+4]
	mov	dword2878,[ebp-944]
	fstp	dword ptr [dword2878+4]
label00a2:
; end of inline function vec2f_subtract
	mov	dword2879,[ebp-920]
	mov	[ebp-948],dword2879
	lea	dword2828,[ebp-908]
	mov	[ebp-952],dword2828
; start of inline function vec2f_mul
	mov	dword2882,[ebp-952]
	fld	dword ptr [dword2882]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2882]
	mov	dword2885,[ebp-952]
	fld	dword ptr [dword2885+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2885+4]
label00a3:
; end of inline function vec2f_mul
	lea	dword2829,[ebp-908]
	mov	[ebp-924],dword2829
	mov	dword2831,16
	add	dword2831,[ebp-864]
	mov	[ebp-928],dword2831
	mov	dword2833,[ebp-860]
	mov	dword2835,[dword2833+192]
	imul	dword2835,24
	mov	dword2837,[ebp-860]
	add	dword2837,dword2835
	add	dword2837,16
	mov	[ebp-932],dword2837
; start of inline function vec2f_add
	mov	dword2855,[ebp-928]
	mov	dword2857,[ebp-924]
	fld	dword ptr [dword2855]
	fadd	dword ptr [dword2857]
	mov	dword2859,[ebp-932]
	fstp	dword ptr [dword2859]
	mov	dword2861,[ebp-928]
	mov	dword2863,[ebp-924]
	fld	dword ptr [dword2861+4]
	fadd	dword ptr [dword2863+4]
	mov	dword2865,[ebp-932]
	fstp	dword ptr [dword2865+4]
label00a1:
; end of inline function vec2f_add
	mov	dword2840,[ebp-860]
	inc	dword ptr [dword2840+192]
label009e:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label009b
label009c:
	mov	dword2844,[ebp-860]
	mov	dword2845,[dword2844+192]
	inc	dword ptr [dword2844+192]
	imul	dword2845,24
	mov	dword2848,[ebp-860]
	add	dword2848,dword2845
	mov	dword2850,[ebp-860]
	mov	dword2851,[dword2850]
	mov	dword2852,[dword2850+4]
	mov	[dword2848],dword2851
	mov	[dword2848+4],dword2852
	mov	dword2851,[dword2850+8]
	mov	dword2852,[dword2850+12]
	mov	[dword2848+8],dword2851
	mov	[dword2848+12],dword2852
	mov	dword2851,[dword2850+16]
	mov	dword2852,[dword2850+20]
	mov	[dword2848+16],dword2851
	mov	[dword2848+20],dword2852
label00ae:
; end of inline function _clip_on_plain
	lea	dword2029,dword ptr [__clip_plane_right_norm]
	mov	[ebp-848],dword2029
	lea	dword2030,dword ptr [__clip_plane_right_base]
	mov	[ebp-852],dword2030
	lea	dword2031,[ebp-844]
	mov	[ebp-856],dword2031
	mov	dword3101,[ebp-648]
	mov	[ebp-860],dword3101
; start of inline function _clip_on_plain
	mov	dword3104,[ebp-860]
	mov	dword ptr [dword3104+192],0
	mov	dword3107,[ebp-856]
	mov	[ebp-864],dword3107
	mov	dword3110,[ebp-856]
	add	dword3110,24
	mov	[ebp-868],dword3110
label00af:
label00b0:
	mov	dword3114,[ebp-856]
	mov	dword3116,[dword3114+192]
	imul	dword3116,24
	mov	dword3118,[ebp-856]
	add	dword3118,dword3116
	cmp	dword3118,[ebp-868]
	jle	label00b1
	mov	dword3264,[ebp-852]
	mov	[ebp-968],dword3264
	mov	dword3122,[ebp-864]
	mov	[ebp-972],dword3122
	lea	dword3123,[ebp-884]
	mov	[ebp-976],dword3123
; start of inline function vec4f_subtract
	mov	dword3267,[ebp-972]
	mov	dword3269,[ebp-968]
	fld	dword ptr [dword3267]
	fsub	dword ptr [dword3269]
	mov	dword3271,[ebp-976]
	fstp	dword ptr [dword3271]
	mov	dword3273,[ebp-972]
	mov	dword3275,[ebp-968]
	fld	dword ptr [dword3273+4]
	fsub	dword ptr [dword3275+4]
	mov	dword3277,[ebp-976]
	fstp	dword ptr [dword3277+4]
	mov	dword3279,[ebp-972]
	mov	dword3281,[ebp-968]
	fld	dword ptr [dword3279+8]
	fsub	dword ptr [dword3281+8]
	mov	dword3283,[ebp-976]
	fstp	dword ptr [dword3283+8]
	mov	dword3285,[ebp-972]
	mov	dword3287,[ebp-968]
	fld	dword ptr [dword3285+12]
	fsub	dword ptr [dword3287+12]
	mov	dword3289,[ebp-976]
	fstp	dword ptr [dword3289+12]
label00ba:
; end of inline function vec4f_subtract
	mov	dword3367,[ebp-848]
	mov	[ebp-980],dword3367
	lea	dword3125,[ebp-884]
	mov	[ebp-984],dword3125
; start of inline function vec4f_dot
	mov	dword3370,[ebp-984]
	mov	dword3372,[ebp-980]
	fld	dword ptr [dword3370+4]
	fmul	dword ptr [dword3372+4]
	mov	dword3374,[ebp-984]
	mov	dword3376,[ebp-980]
	fld	dword ptr [dword3374]
	fmul	dword ptr [dword3376]
	faddp
	mov	dword3378,[ebp-984]
	mov	dword3380,[ebp-980]
	fld	dword ptr [dword3378+8]
	fmul	dword ptr [dword3380+8]
	faddp
	mov	dword3382,[ebp-984]
	mov	dword3384,[ebp-980]
	fld	dword ptr [dword3382+12]
	fmul	dword ptr [dword3384+12]
	faddp
	fstp	dword ptr [ebp-988]
label00be:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword3290,[ebp-852]
	mov	[ebp-968],dword3290
	mov	dword3129,[ebp-868]
	mov	[ebp-972],dword3129
	lea	dword3130,[ebp-884]
	mov	[ebp-976],dword3130
; start of inline function vec4f_subtract
	mov	dword3293,[ebp-972]
	mov	dword3295,[ebp-968]
	fld	dword ptr [dword3293]
	fsub	dword ptr [dword3295]
	mov	dword3297,[ebp-976]
	fstp	dword ptr [dword3297]
	mov	dword3299,[ebp-972]
	mov	dword3301,[ebp-968]
	fld	dword ptr [dword3299+4]
	fsub	dword ptr [dword3301+4]
	mov	dword3303,[ebp-976]
	fstp	dword ptr [dword3303+4]
	mov	dword3305,[ebp-972]
	mov	dword3307,[ebp-968]
	fld	dword ptr [dword3305+8]
	fsub	dword ptr [dword3307+8]
	mov	dword3309,[ebp-976]
	fstp	dword ptr [dword3309+8]
	mov	dword3311,[ebp-972]
	mov	dword3313,[ebp-968]
	fld	dword ptr [dword3311+12]
	fsub	dword ptr [dword3313+12]
	mov	dword3315,[ebp-976]
	fstp	dword ptr [dword3315+12]
label00bb:
; end of inline function vec4f_subtract
	mov	dword3385,[ebp-848]
	mov	[ebp-980],dword3385
	lea	dword3132,[ebp-884]
	mov	[ebp-984],dword3132
; start of inline function vec4f_dot
	mov	dword3388,[ebp-984]
	mov	dword3390,[ebp-980]
	fld	dword ptr [dword3388+4]
	fmul	dword ptr [dword3390+4]
	mov	dword3392,[ebp-984]
	mov	dword3394,[ebp-980]
	fld	dword ptr [dword3392]
	fmul	dword ptr [dword3394]
	faddp
	mov	dword3396,[ebp-984]
	mov	dword3398,[ebp-980]
	fld	dword ptr [dword3396+8]
	fmul	dword ptr [dword3398+8]
	faddp
	mov	dword3400,[ebp-984]
	mov	dword3402,[ebp-980]
	fld	dword ptr [dword3400+12]
	fmul	dword ptr [dword3402+12]
	faddp
	fstp	dword ptr [ebp-988]
label00bf:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-916]
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jb	label00b2
	mov	dword3136,[ebp-860]
	mov	dword3137,[dword3136+192]
	inc	dword ptr [dword3136+192]
	imul	dword3137,24
	mov	dword3140,[ebp-860]
	add	dword3140,dword3137
	mov	dword3142,[ebp-864]
	mov	dword3143,[dword3142]
	mov	dword3144,[dword3142+4]
	mov	[dword3140],dword3143
	mov	[dword3140+4],dword3144
	mov	dword3143,[dword3142+8]
	mov	dword3144,[dword3142+12]
	mov	[dword3140+8],dword3143
	mov	[dword3140+12],dword3144
	mov	dword3143,[dword3142+16]
	mov	dword3144,[dword3142+20]
	mov	[dword3140+16],dword3143
	mov	[dword3140+20],dword3144
label00b2:
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jbe	label00b5
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label00b4
label00b5:
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label00b3
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jae	label00b3
label00b4:
	mov	dword3150,[ebp-864]
	mov	[ebp-968],dword3150
	mov	dword3316,[ebp-852]
	mov	[ebp-972],dword3316
	lea	dword3152,[ebp-884]
	mov	[ebp-976],dword3152
; start of inline function vec4f_subtract
	mov	dword3319,[ebp-972]
	mov	dword3321,[ebp-968]
	fld	dword ptr [dword3319]
	fsub	dword ptr [dword3321]
	mov	dword3323,[ebp-976]
	fstp	dword ptr [dword3323]
	mov	dword3325,[ebp-972]
	mov	dword3327,[ebp-968]
	fld	dword ptr [dword3325+4]
	fsub	dword ptr [dword3327+4]
	mov	dword3329,[ebp-976]
	fstp	dword ptr [dword3329+4]
	mov	dword3331,[ebp-972]
	mov	dword3333,[ebp-968]
	fld	dword ptr [dword3331+8]
	fsub	dword ptr [dword3333+8]
	mov	dword3335,[ebp-976]
	fstp	dword ptr [dword3335+8]
	mov	dword3337,[ebp-972]
	mov	dword3339,[ebp-968]
	fld	dword ptr [dword3337+12]
	fsub	dword ptr [dword3339+12]
	mov	dword3341,[ebp-976]
	fstp	dword ptr [dword3341+12]
label00bc:
; end of inline function vec4f_subtract
	mov	dword3154,[ebp-864]
	mov	[ebp-968],dword3154
	mov	dword3156,[ebp-868]
	mov	[ebp-972],dword3156
	lea	dword3157,[ebp-900]
	mov	[ebp-976],dword3157
; start of inline function vec4f_subtract
	mov	dword3344,[ebp-972]
	mov	dword3346,[ebp-968]
	fld	dword ptr [dword3344]
	fsub	dword ptr [dword3346]
	mov	dword3348,[ebp-976]
	fstp	dword ptr [dword3348]
	mov	dword3350,[ebp-972]
	mov	dword3352,[ebp-968]
	fld	dword ptr [dword3350+4]
	fsub	dword ptr [dword3352+4]
	mov	dword3354,[ebp-976]
	fstp	dword ptr [dword3354+4]
	mov	dword3356,[ebp-972]
	mov	dword3358,[ebp-968]
	fld	dword ptr [dword3356+8]
	fsub	dword ptr [dword3358+8]
	mov	dword3360,[ebp-976]
	fstp	dword ptr [dword3360+8]
	mov	dword3362,[ebp-972]
	mov	dword3364,[ebp-968]
	fld	dword ptr [dword3362+12]
	fsub	dword ptr [dword3364+12]
	mov	dword3366,[ebp-976]
	fstp	dword ptr [dword3366+12]
label00bd:
; end of inline function vec4f_subtract
	mov	dword3403,[ebp-848]
	mov	[ebp-980],dword3403
	lea	dword3159,[ebp-884]
	mov	[ebp-984],dword3159
; start of inline function vec4f_dot
	mov	dword3406,[ebp-984]
	mov	dword3408,[ebp-980]
	fld	dword ptr [dword3406+4]
	fmul	dword ptr [dword3408+4]
	mov	dword3410,[ebp-984]
	mov	dword3412,[ebp-980]
	fld	dword ptr [dword3410]
	fmul	dword ptr [dword3412]
	faddp
	mov	dword3414,[ebp-984]
	mov	dword3416,[ebp-980]
	fld	dword ptr [dword3414+8]
	fmul	dword ptr [dword3416+8]
	faddp
	mov	dword3418,[ebp-984]
	mov	dword3420,[ebp-980]
	fld	dword ptr [dword3418+12]
	fmul	dword ptr [dword3420+12]
	faddp
	fstp	dword ptr [ebp-988]
label00c0:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3421,[ebp-848]
	mov	[ebp-980],dword3421
	lea	dword3161,[ebp-900]
	mov	[ebp-984],dword3161
; start of inline function vec4f_dot
	mov	dword3424,[ebp-984]
	mov	dword3426,[ebp-980]
	fld	dword ptr [dword3424+4]
	fmul	dword ptr [dword3426+4]
	mov	dword3428,[ebp-984]
	mov	dword3430,[ebp-980]
	fld	dword ptr [dword3428]
	fmul	dword ptr [dword3430]
	faddp
	mov	dword3432,[ebp-984]
	mov	dword3434,[ebp-980]
	fld	dword ptr [dword3432+8]
	fmul	dword ptr [dword3434+8]
	faddp
	mov	dword3436,[ebp-984]
	mov	dword3438,[ebp-980]
	fld	dword ptr [dword3436+12]
	fmul	dword ptr [dword3438+12]
	faddp
	fstp	dword ptr [ebp-988]
label00c1:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3439,[ebp-920]
	mov	[ebp-992],dword3439
	lea	dword3164,[ebp-900]
	mov	[ebp-996],dword3164
; start of inline function vec4f_mul
	mov	dword3442,[ebp-996]
	fld	dword ptr [dword3442]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3442]
	mov	dword3445,[ebp-996]
	fld	dword ptr [dword3445+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3445+4]
	mov	dword3448,[ebp-996]
	fld	dword ptr [dword3448+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3448+8]
	mov	dword3451,[ebp-996]
	fld	dword ptr [dword3451+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3451+12]
label00c2:
; end of inline function vec4f_mul
	lea	dword3165,[ebp-900]
	mov	[ebp-956],dword3165
	mov	dword3167,[ebp-864]
	mov	[ebp-960],dword3167
	mov	dword3169,[ebp-860]
	mov	dword3171,[dword3169+192]
	imul	dword3171,24
	mov	dword3173,[ebp-860]
	add	dword3173,dword3171
	mov	[ebp-964],dword3173
; start of inline function vec4f_add
	mov	dword3241,[ebp-960]
	mov	dword3243,[ebp-956]
	fld	dword ptr [dword3241]
	fadd	dword ptr [dword3243]
	mov	dword3245,[ebp-964]
	fstp	dword ptr [dword3245]
	mov	dword3247,[ebp-960]
	mov	dword3249,[ebp-956]
	fld	dword ptr [dword3247+4]
	fadd	dword ptr [dword3249+4]
	mov	dword3251,[ebp-964]
	fstp	dword ptr [dword3251+4]
	mov	dword3253,[ebp-960]
	mov	dword3255,[ebp-956]
	fld	dword ptr [dword3253+8]
	fadd	dword ptr [dword3255+8]
	mov	dword3257,[ebp-964]
	fstp	dword ptr [dword3257+8]
	mov	dword3259,[ebp-960]
	mov	dword3261,[ebp-956]
	fld	dword ptr [dword3259+12]
	fadd	dword ptr [dword3261+12]
	mov	dword3263,[ebp-964]
	fstp	dword ptr [dword3263+12]
label00b9:
; end of inline function vec4f_add
	mov	dword3175,16
	add	dword3175,[ebp-864]
	mov	[ebp-936],dword3175
	mov	dword3177,16
	add	dword3177,[ebp-868]
	mov	[ebp-940],dword3177
	lea	dword3178,[ebp-908]
	mov	[ebp-944],dword3178
; start of inline function vec2f_subtract
	mov	dword3220,[ebp-940]
	mov	dword3222,[ebp-936]
	fld	dword ptr [dword3220]
	fsub	dword ptr [dword3222]
	mov	dword3224,[ebp-944]
	fstp	dword ptr [dword3224]
	mov	dword3226,[ebp-940]
	mov	dword3228,[ebp-936]
	fld	dword ptr [dword3226+4]
	fsub	dword ptr [dword3228+4]
	mov	dword3230,[ebp-944]
	fstp	dword ptr [dword3230+4]
label00b7:
; end of inline function vec2f_subtract
	mov	dword3231,[ebp-920]
	mov	[ebp-948],dword3231
	lea	dword3180,[ebp-908]
	mov	[ebp-952],dword3180
; start of inline function vec2f_mul
	mov	dword3234,[ebp-952]
	fld	dword ptr [dword3234]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3234]
	mov	dword3237,[ebp-952]
	fld	dword ptr [dword3237+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3237+4]
label00b8:
; end of inline function vec2f_mul
	lea	dword3181,[ebp-908]
	mov	[ebp-924],dword3181
	mov	dword3183,16
	add	dword3183,[ebp-864]
	mov	[ebp-928],dword3183
	mov	dword3185,[ebp-860]
	mov	dword3187,[dword3185+192]
	imul	dword3187,24
	mov	dword3189,[ebp-860]
	add	dword3189,dword3187
	add	dword3189,16
	mov	[ebp-932],dword3189
; start of inline function vec2f_add
	mov	dword3207,[ebp-928]
	mov	dword3209,[ebp-924]
	fld	dword ptr [dword3207]
	fadd	dword ptr [dword3209]
	mov	dword3211,[ebp-932]
	fstp	dword ptr [dword3211]
	mov	dword3213,[ebp-928]
	mov	dword3215,[ebp-924]
	fld	dword ptr [dword3213+4]
	fadd	dword ptr [dword3215+4]
	mov	dword3217,[ebp-932]
	fstp	dword ptr [dword3217+4]
label00b6:
; end of inline function vec2f_add
	mov	dword3192,[ebp-860]
	inc	dword ptr [dword3192+192]
label00b3:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00b0
label00b1:
	mov	dword3196,[ebp-860]
	mov	dword3197,[dword3196+192]
	inc	dword ptr [dword3196+192]
	imul	dword3197,24
	mov	dword3200,[ebp-860]
	add	dword3200,dword3197
	mov	dword3202,[ebp-860]
	mov	dword3203,[dword3202]
	mov	dword3204,[dword3202+4]
	mov	[dword3200],dword3203
	mov	[dword3200+4],dword3204
	mov	dword3203,[dword3202+8]
	mov	dword3204,[dword3202+12]
	mov	[dword3200+8],dword3203
	mov	[dword3200+12],dword3204
	mov	dword3203,[dword3202+16]
	mov	dword3204,[dword3202+20]
	mov	[dword3200+16],dword3203
	mov	[dword3200+20],dword3204
label00c3:
; end of inline function _clip_on_plain
	lea	dword2033,dword ptr [__clip_plane_top_norm]
	mov	[ebp-848],dword2033
	lea	dword2034,dword ptr [__clip_plane_top_base]
	mov	[ebp-852],dword2034
	mov	dword3453,[ebp-648]
	mov	[ebp-856],dword3453
	lea	dword2036,[ebp-844]
	mov	[ebp-860],dword2036
; start of inline function _clip_on_plain
	mov	dword3456,[ebp-860]
	mov	dword ptr [dword3456+192],0
	mov	dword3459,[ebp-856]
	mov	[ebp-864],dword3459
	mov	dword3462,[ebp-856]
	add	dword3462,24
	mov	[ebp-868],dword3462
label00c4:
label00c5:
	mov	dword3466,[ebp-856]
	mov	dword3468,[dword3466+192]
	imul	dword3468,24
	mov	dword3470,[ebp-856]
	add	dword3470,dword3468
	cmp	dword3470,[ebp-868]
	jle	label00c6
	mov	dword3616,[ebp-852]
	mov	[ebp-968],dword3616
	mov	dword3474,[ebp-864]
	mov	[ebp-972],dword3474
	lea	dword3475,[ebp-884]
	mov	[ebp-976],dword3475
; start of inline function vec4f_subtract
	mov	dword3619,[ebp-972]
	mov	dword3621,[ebp-968]
	fld	dword ptr [dword3619]
	fsub	dword ptr [dword3621]
	mov	dword3623,[ebp-976]
	fstp	dword ptr [dword3623]
	mov	dword3625,[ebp-972]
	mov	dword3627,[ebp-968]
	fld	dword ptr [dword3625+4]
	fsub	dword ptr [dword3627+4]
	mov	dword3629,[ebp-976]
	fstp	dword ptr [dword3629+4]
	mov	dword3631,[ebp-972]
	mov	dword3633,[ebp-968]
	fld	dword ptr [dword3631+8]
	fsub	dword ptr [dword3633+8]
	mov	dword3635,[ebp-976]
	fstp	dword ptr [dword3635+8]
	mov	dword3637,[ebp-972]
	mov	dword3639,[ebp-968]
	fld	dword ptr [dword3637+12]
	fsub	dword ptr [dword3639+12]
	mov	dword3641,[ebp-976]
	fstp	dword ptr [dword3641+12]
label00cf:
; end of inline function vec4f_subtract
	mov	dword3719,[ebp-848]
	mov	[ebp-980],dword3719
	lea	dword3477,[ebp-884]
	mov	[ebp-984],dword3477
; start of inline function vec4f_dot
	mov	dword3722,[ebp-984]
	mov	dword3724,[ebp-980]
	fld	dword ptr [dword3722+4]
	fmul	dword ptr [dword3724+4]
	mov	dword3726,[ebp-984]
	mov	dword3728,[ebp-980]
	fld	dword ptr [dword3726]
	fmul	dword ptr [dword3728]
	faddp
	mov	dword3730,[ebp-984]
	mov	dword3732,[ebp-980]
	fld	dword ptr [dword3730+8]
	fmul	dword ptr [dword3732+8]
	faddp
	mov	dword3734,[ebp-984]
	mov	dword3736,[ebp-980]
	fld	dword ptr [dword3734+12]
	fmul	dword ptr [dword3736+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d3:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword3642,[ebp-852]
	mov	[ebp-968],dword3642
	mov	dword3481,[ebp-868]
	mov	[ebp-972],dword3481
	lea	dword3482,[ebp-884]
	mov	[ebp-976],dword3482
; start of inline function vec4f_subtract
	mov	dword3645,[ebp-972]
	mov	dword3647,[ebp-968]
	fld	dword ptr [dword3645]
	fsub	dword ptr [dword3647]
	mov	dword3649,[ebp-976]
	fstp	dword ptr [dword3649]
	mov	dword3651,[ebp-972]
	mov	dword3653,[ebp-968]
	fld	dword ptr [dword3651+4]
	fsub	dword ptr [dword3653+4]
	mov	dword3655,[ebp-976]
	fstp	dword ptr [dword3655+4]
	mov	dword3657,[ebp-972]
	mov	dword3659,[ebp-968]
	fld	dword ptr [dword3657+8]
	fsub	dword ptr [dword3659+8]
	mov	dword3661,[ebp-976]
	fstp	dword ptr [dword3661+8]
	mov	dword3663,[ebp-972]
	mov	dword3665,[ebp-968]
	fld	dword ptr [dword3663+12]
	fsub	dword ptr [dword3665+12]
	mov	dword3667,[ebp-976]
	fstp	dword ptr [dword3667+12]
label00d0:
; end of inline function vec4f_subtract
	mov	dword3737,[ebp-848]
	mov	[ebp-980],dword3737
	lea	dword3484,[ebp-884]
	mov	[ebp-984],dword3484
; start of inline function vec4f_dot
	mov	dword3740,[ebp-984]
	mov	dword3742,[ebp-980]
	fld	dword ptr [dword3740+4]
	fmul	dword ptr [dword3742+4]
	mov	dword3744,[ebp-984]
	mov	dword3746,[ebp-980]
	fld	dword ptr [dword3744]
	fmul	dword ptr [dword3746]
	faddp
	mov	dword3748,[ebp-984]
	mov	dword3750,[ebp-980]
	fld	dword ptr [dword3748+8]
	fmul	dword ptr [dword3750+8]
	faddp
	mov	dword3752,[ebp-984]
	mov	dword3754,[ebp-980]
	fld	dword ptr [dword3752+12]
	fmul	dword ptr [dword3754+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d4:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-916]
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jb	label00c7
	mov	dword3488,[ebp-860]
	mov	dword3489,[dword3488+192]
	inc	dword ptr [dword3488+192]
	imul	dword3489,24
	mov	dword3492,[ebp-860]
	add	dword3492,dword3489
	mov	dword3494,[ebp-864]
	mov	dword3495,[dword3494]
	mov	dword3496,[dword3494+4]
	mov	[dword3492],dword3495
	mov	[dword3492+4],dword3496
	mov	dword3495,[dword3494+8]
	mov	dword3496,[dword3494+12]
	mov	[dword3492+8],dword3495
	mov	[dword3492+12],dword3496
	mov	dword3495,[dword3494+16]
	mov	dword3496,[dword3494+20]
	mov	[dword3492+16],dword3495
	mov	[dword3492+20],dword3496
label00c7:
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jbe	label00ca
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label00c9
label00ca:
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label00c8
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jae	label00c8
label00c9:
	mov	dword3502,[ebp-864]
	mov	[ebp-968],dword3502
	mov	dword3668,[ebp-852]
	mov	[ebp-972],dword3668
	lea	dword3504,[ebp-884]
	mov	[ebp-976],dword3504
; start of inline function vec4f_subtract
	mov	dword3671,[ebp-972]
	mov	dword3673,[ebp-968]
	fld	dword ptr [dword3671]
	fsub	dword ptr [dword3673]
	mov	dword3675,[ebp-976]
	fstp	dword ptr [dword3675]
	mov	dword3677,[ebp-972]
	mov	dword3679,[ebp-968]
	fld	dword ptr [dword3677+4]
	fsub	dword ptr [dword3679+4]
	mov	dword3681,[ebp-976]
	fstp	dword ptr [dword3681+4]
	mov	dword3683,[ebp-972]
	mov	dword3685,[ebp-968]
	fld	dword ptr [dword3683+8]
	fsub	dword ptr [dword3685+8]
	mov	dword3687,[ebp-976]
	fstp	dword ptr [dword3687+8]
	mov	dword3689,[ebp-972]
	mov	dword3691,[ebp-968]
	fld	dword ptr [dword3689+12]
	fsub	dword ptr [dword3691+12]
	mov	dword3693,[ebp-976]
	fstp	dword ptr [dword3693+12]
label00d1:
; end of inline function vec4f_subtract
	mov	dword3506,[ebp-864]
	mov	[ebp-968],dword3506
	mov	dword3508,[ebp-868]
	mov	[ebp-972],dword3508
	lea	dword3509,[ebp-900]
	mov	[ebp-976],dword3509
; start of inline function vec4f_subtract
	mov	dword3696,[ebp-972]
	mov	dword3698,[ebp-968]
	fld	dword ptr [dword3696]
	fsub	dword ptr [dword3698]
	mov	dword3700,[ebp-976]
	fstp	dword ptr [dword3700]
	mov	dword3702,[ebp-972]
	mov	dword3704,[ebp-968]
	fld	dword ptr [dword3702+4]
	fsub	dword ptr [dword3704+4]
	mov	dword3706,[ebp-976]
	fstp	dword ptr [dword3706+4]
	mov	dword3708,[ebp-972]
	mov	dword3710,[ebp-968]
	fld	dword ptr [dword3708+8]
	fsub	dword ptr [dword3710+8]
	mov	dword3712,[ebp-976]
	fstp	dword ptr [dword3712+8]
	mov	dword3714,[ebp-972]
	mov	dword3716,[ebp-968]
	fld	dword ptr [dword3714+12]
	fsub	dword ptr [dword3716+12]
	mov	dword3718,[ebp-976]
	fstp	dword ptr [dword3718+12]
label00d2:
; end of inline function vec4f_subtract
	mov	dword3755,[ebp-848]
	mov	[ebp-980],dword3755
	lea	dword3511,[ebp-884]
	mov	[ebp-984],dword3511
; start of inline function vec4f_dot
	mov	dword3758,[ebp-984]
	mov	dword3760,[ebp-980]
	fld	dword ptr [dword3758+4]
	fmul	dword ptr [dword3760+4]
	mov	dword3762,[ebp-984]
	mov	dword3764,[ebp-980]
	fld	dword ptr [dword3762]
	fmul	dword ptr [dword3764]
	faddp
	mov	dword3766,[ebp-984]
	mov	dword3768,[ebp-980]
	fld	dword ptr [dword3766+8]
	fmul	dword ptr [dword3768+8]
	faddp
	mov	dword3770,[ebp-984]
	mov	dword3772,[ebp-980]
	fld	dword ptr [dword3770+12]
	fmul	dword ptr [dword3772+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d5:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3773,[ebp-848]
	mov	[ebp-980],dword3773
	lea	dword3513,[ebp-900]
	mov	[ebp-984],dword3513
; start of inline function vec4f_dot
	mov	dword3776,[ebp-984]
	mov	dword3778,[ebp-980]
	fld	dword ptr [dword3776+4]
	fmul	dword ptr [dword3778+4]
	mov	dword3780,[ebp-984]
	mov	dword3782,[ebp-980]
	fld	dword ptr [dword3780]
	fmul	dword ptr [dword3782]
	faddp
	mov	dword3784,[ebp-984]
	mov	dword3786,[ebp-980]
	fld	dword ptr [dword3784+8]
	fmul	dword ptr [dword3786+8]
	faddp
	mov	dword3788,[ebp-984]
	mov	dword3790,[ebp-980]
	fld	dword ptr [dword3788+12]
	fmul	dword ptr [dword3790+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d6:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3791,[ebp-920]
	mov	[ebp-992],dword3791
	lea	dword3516,[ebp-900]
	mov	[ebp-996],dword3516
; start of inline function vec4f_mul
	mov	dword3794,[ebp-996]
	fld	dword ptr [dword3794]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3794]
	mov	dword3797,[ebp-996]
	fld	dword ptr [dword3797+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3797+4]
	mov	dword3800,[ebp-996]
	fld	dword ptr [dword3800+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3800+8]
	mov	dword3803,[ebp-996]
	fld	dword ptr [dword3803+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3803+12]
label00d7:
; end of inline function vec4f_mul
	lea	dword3517,[ebp-900]
	mov	[ebp-956],dword3517
	mov	dword3519,[ebp-864]
	mov	[ebp-960],dword3519
	mov	dword3521,[ebp-860]
	mov	dword3523,[dword3521+192]
	imul	dword3523,24
	mov	dword3525,[ebp-860]
	add	dword3525,dword3523
	mov	[ebp-964],dword3525
; start of inline function vec4f_add
	mov	dword3593,[ebp-960]
	mov	dword3595,[ebp-956]
	fld	dword ptr [dword3593]
	fadd	dword ptr [dword3595]
	mov	dword3597,[ebp-964]
	fstp	dword ptr [dword3597]
	mov	dword3599,[ebp-960]
	mov	dword3601,[ebp-956]
	fld	dword ptr [dword3599+4]
	fadd	dword ptr [dword3601+4]
	mov	dword3603,[ebp-964]
	fstp	dword ptr [dword3603+4]
	mov	dword3605,[ebp-960]
	mov	dword3607,[ebp-956]
	fld	dword ptr [dword3605+8]
	fadd	dword ptr [dword3607+8]
	mov	dword3609,[ebp-964]
	fstp	dword ptr [dword3609+8]
	mov	dword3611,[ebp-960]
	mov	dword3613,[ebp-956]
	fld	dword ptr [dword3611+12]
	fadd	dword ptr [dword3613+12]
	mov	dword3615,[ebp-964]
	fstp	dword ptr [dword3615+12]
label00ce:
; end of inline function vec4f_add
	mov	dword3527,16
	add	dword3527,[ebp-864]
	mov	[ebp-936],dword3527
	mov	dword3529,16
	add	dword3529,[ebp-868]
	mov	[ebp-940],dword3529
	lea	dword3530,[ebp-908]
	mov	[ebp-944],dword3530
; start of inline function vec2f_subtract
	mov	dword3572,[ebp-940]
	mov	dword3574,[ebp-936]
	fld	dword ptr [dword3572]
	fsub	dword ptr [dword3574]
	mov	dword3576,[ebp-944]
	fstp	dword ptr [dword3576]
	mov	dword3578,[ebp-940]
	mov	dword3580,[ebp-936]
	fld	dword ptr [dword3578+4]
	fsub	dword ptr [dword3580+4]
	mov	dword3582,[ebp-944]
	fstp	dword ptr [dword3582+4]
label00cc:
; end of inline function vec2f_subtract
	mov	dword3583,[ebp-920]
	mov	[ebp-948],dword3583
	lea	dword3532,[ebp-908]
	mov	[ebp-952],dword3532
; start of inline function vec2f_mul
	mov	dword3586,[ebp-952]
	fld	dword ptr [dword3586]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3586]
	mov	dword3589,[ebp-952]
	fld	dword ptr [dword3589+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3589+4]
label00cd:
; end of inline function vec2f_mul
	lea	dword3533,[ebp-908]
	mov	[ebp-924],dword3533
	mov	dword3535,16
	add	dword3535,[ebp-864]
	mov	[ebp-928],dword3535
	mov	dword3537,[ebp-860]
	mov	dword3539,[dword3537+192]
	imul	dword3539,24
	mov	dword3541,[ebp-860]
	add	dword3541,dword3539
	add	dword3541,16
	mov	[ebp-932],dword3541
; start of inline function vec2f_add
	mov	dword3559,[ebp-928]
	mov	dword3561,[ebp-924]
	fld	dword ptr [dword3559]
	fadd	dword ptr [dword3561]
	mov	dword3563,[ebp-932]
	fstp	dword ptr [dword3563]
	mov	dword3565,[ebp-928]
	mov	dword3567,[ebp-924]
	fld	dword ptr [dword3565+4]
	fadd	dword ptr [dword3567+4]
	mov	dword3569,[ebp-932]
	fstp	dword ptr [dword3569+4]
label00cb:
; end of inline function vec2f_add
	mov	dword3544,[ebp-860]
	inc	dword ptr [dword3544+192]
label00c8:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00c5
label00c6:
	mov	dword3548,[ebp-860]
	mov	dword3549,[dword3548+192]
	inc	dword ptr [dword3548+192]
	imul	dword3549,24
	mov	dword3552,[ebp-860]
	add	dword3552,dword3549
	mov	dword3554,[ebp-860]
	mov	dword3555,[dword3554]
	mov	dword3556,[dword3554+4]
	mov	[dword3552],dword3555
	mov	[dword3552+4],dword3556
	mov	dword3555,[dword3554+8]
	mov	dword3556,[dword3554+12]
	mov	[dword3552+8],dword3555
	mov	[dword3552+12],dword3556
	mov	dword3555,[dword3554+16]
	mov	dword3556,[dword3554+20]
	mov	[dword3552+16],dword3555
	mov	[dword3552+20],dword3556
label00d8:
; end of inline function _clip_on_plain
	lea	dword2037,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-848],dword2037
	lea	dword2038,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-852],dword2038
	lea	dword2039,[ebp-844]
	mov	[ebp-856],dword2039
	mov	dword3805,[ebp-648]
	mov	[ebp-860],dword3805
; start of inline function _clip_on_plain
	mov	dword3808,[ebp-860]
	mov	dword ptr [dword3808+192],0
	mov	dword3811,[ebp-856]
	mov	[ebp-864],dword3811
	mov	dword3814,[ebp-856]
	add	dword3814,24
	mov	[ebp-868],dword3814
label00d9:
label00da:
	mov	dword3818,[ebp-856]
	mov	dword3820,[dword3818+192]
	imul	dword3820,24
	mov	dword3822,[ebp-856]
	add	dword3822,dword3820
	cmp	dword3822,[ebp-868]
	jle	label00db
	mov	dword3968,[ebp-852]
	mov	[ebp-968],dword3968
	mov	dword3826,[ebp-864]
	mov	[ebp-972],dword3826
	lea	dword3827,[ebp-884]
	mov	[ebp-976],dword3827
; start of inline function vec4f_subtract
	mov	dword3971,[ebp-972]
	mov	dword3973,[ebp-968]
	fld	dword ptr [dword3971]
	fsub	dword ptr [dword3973]
	mov	dword3975,[ebp-976]
	fstp	dword ptr [dword3975]
	mov	dword3977,[ebp-972]
	mov	dword3979,[ebp-968]
	fld	dword ptr [dword3977+4]
	fsub	dword ptr [dword3979+4]
	mov	dword3981,[ebp-976]
	fstp	dword ptr [dword3981+4]
	mov	dword3983,[ebp-972]
	mov	dword3985,[ebp-968]
	fld	dword ptr [dword3983+8]
	fsub	dword ptr [dword3985+8]
	mov	dword3987,[ebp-976]
	fstp	dword ptr [dword3987+8]
	mov	dword3989,[ebp-972]
	mov	dword3991,[ebp-968]
	fld	dword ptr [dword3989+12]
	fsub	dword ptr [dword3991+12]
	mov	dword3993,[ebp-976]
	fstp	dword ptr [dword3993+12]
label00e4:
; end of inline function vec4f_subtract
	mov	dword4071,[ebp-848]
	mov	[ebp-980],dword4071
	lea	dword3829,[ebp-884]
	mov	[ebp-984],dword3829
; start of inline function vec4f_dot
	mov	dword4074,[ebp-984]
	mov	dword4076,[ebp-980]
	fld	dword ptr [dword4074+4]
	fmul	dword ptr [dword4076+4]
	mov	dword4078,[ebp-984]
	mov	dword4080,[ebp-980]
	fld	dword ptr [dword4078]
	fmul	dword ptr [dword4080]
	faddp
	mov	dword4082,[ebp-984]
	mov	dword4084,[ebp-980]
	fld	dword ptr [dword4082+8]
	fmul	dword ptr [dword4084+8]
	faddp
	mov	dword4086,[ebp-984]
	mov	dword4088,[ebp-980]
	fld	dword ptr [dword4086+12]
	fmul	dword ptr [dword4088+12]
	faddp
	fstp	dword ptr [ebp-988]
label00e8:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword3994,[ebp-852]
	mov	[ebp-968],dword3994
	mov	dword3833,[ebp-868]
	mov	[ebp-972],dword3833
	lea	dword3834,[ebp-884]
	mov	[ebp-976],dword3834
; start of inline function vec4f_subtract
	mov	dword3997,[ebp-972]
	mov	dword3999,[ebp-968]
	fld	dword ptr [dword3997]
	fsub	dword ptr [dword3999]
	mov	dword4001,[ebp-976]
	fstp	dword ptr [dword4001]
	mov	dword4003,[ebp-972]
	mov	dword4005,[ebp-968]
	fld	dword ptr [dword4003+4]
	fsub	dword ptr [dword4005+4]
	mov	dword4007,[ebp-976]
	fstp	dword ptr [dword4007+4]
	mov	dword4009,[ebp-972]
	mov	dword4011,[ebp-968]
	fld	dword ptr [dword4009+8]
	fsub	dword ptr [dword4011+8]
	mov	dword4013,[ebp-976]
	fstp	dword ptr [dword4013+8]
	mov	dword4015,[ebp-972]
	mov	dword4017,[ebp-968]
	fld	dword ptr [dword4015+12]
	fsub	dword ptr [dword4017+12]
	mov	dword4019,[ebp-976]
	fstp	dword ptr [dword4019+12]
label00e5:
; end of inline function vec4f_subtract
	mov	dword4089,[ebp-848]
	mov	[ebp-980],dword4089
	lea	dword3836,[ebp-884]
	mov	[ebp-984],dword3836
; start of inline function vec4f_dot
	mov	dword4092,[ebp-984]
	mov	dword4094,[ebp-980]
	fld	dword ptr [dword4092+4]
	fmul	dword ptr [dword4094+4]
	mov	dword4096,[ebp-984]
	mov	dword4098,[ebp-980]
	fld	dword ptr [dword4096]
	fmul	dword ptr [dword4098]
	faddp
	mov	dword4100,[ebp-984]
	mov	dword4102,[ebp-980]
	fld	dword ptr [dword4100+8]
	fmul	dword ptr [dword4102+8]
	faddp
	mov	dword4104,[ebp-984]
	mov	dword4106,[ebp-980]
	fld	dword ptr [dword4104+12]
	fmul	dword ptr [dword4106+12]
	faddp
	fstp	dword ptr [ebp-988]
label00e9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-916]
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jb	label00dc
	mov	dword3840,[ebp-860]
	mov	dword3841,[dword3840+192]
	inc	dword ptr [dword3840+192]
	imul	dword3841,24
	mov	dword3844,[ebp-860]
	add	dword3844,dword3841
	mov	dword3846,[ebp-864]
	mov	dword3847,[dword3846]
	mov	dword3848,[dword3846+4]
	mov	[dword3844],dword3847
	mov	[dword3844+4],dword3848
	mov	dword3847,[dword3846+8]
	mov	dword3848,[dword3846+12]
	mov	[dword3844+8],dword3847
	mov	[dword3844+12],dword3848
	mov	dword3847,[dword3846+16]
	mov	dword3848,[dword3846+20]
	mov	[dword3844+16],dword3847
	mov	[dword3844+20],dword3848
label00dc:
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jbe	label00df
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label00de
label00df:
	fldz
	fld	dword ptr [ebp-916]
	fucomip	st,st(1)
	fstp	st
	jb	label00dd
	fldz
	fld	dword ptr [ebp-912]
	fucomip	st,st(1)
	fstp	st
	jae	label00dd
label00de:
	mov	dword3854,[ebp-864]
	mov	[ebp-968],dword3854
	mov	dword4020,[ebp-852]
	mov	[ebp-972],dword4020
	lea	dword3856,[ebp-884]
	mov	[ebp-976],dword3856
; start of inline function vec4f_subtract
	mov	dword4023,[ebp-972]
	mov	dword4025,[ebp-968]
	fld	dword ptr [dword4023]
	fsub	dword ptr [dword4025]
	mov	dword4027,[ebp-976]
	fstp	dword ptr [dword4027]
	mov	dword4029,[ebp-972]
	mov	dword4031,[ebp-968]
	fld	dword ptr [dword4029+4]
	fsub	dword ptr [dword4031+4]
	mov	dword4033,[ebp-976]
	fstp	dword ptr [dword4033+4]
	mov	dword4035,[ebp-972]
	mov	dword4037,[ebp-968]
	fld	dword ptr [dword4035+8]
	fsub	dword ptr [dword4037+8]
	mov	dword4039,[ebp-976]
	fstp	dword ptr [dword4039+8]
	mov	dword4041,[ebp-972]
	mov	dword4043,[ebp-968]
	fld	dword ptr [dword4041+12]
	fsub	dword ptr [dword4043+12]
	mov	dword4045,[ebp-976]
	fstp	dword ptr [dword4045+12]
label00e6:
; end of inline function vec4f_subtract
	mov	dword3858,[ebp-864]
	mov	[ebp-968],dword3858
	mov	dword3860,[ebp-868]
	mov	[ebp-972],dword3860
	lea	dword3861,[ebp-900]
	mov	[ebp-976],dword3861
; start of inline function vec4f_subtract
	mov	dword4048,[ebp-972]
	mov	dword4050,[ebp-968]
	fld	dword ptr [dword4048]
	fsub	dword ptr [dword4050]
	mov	dword4052,[ebp-976]
	fstp	dword ptr [dword4052]
	mov	dword4054,[ebp-972]
	mov	dword4056,[ebp-968]
	fld	dword ptr [dword4054+4]
	fsub	dword ptr [dword4056+4]
	mov	dword4058,[ebp-976]
	fstp	dword ptr [dword4058+4]
	mov	dword4060,[ebp-972]
	mov	dword4062,[ebp-968]
	fld	dword ptr [dword4060+8]
	fsub	dword ptr [dword4062+8]
	mov	dword4064,[ebp-976]
	fstp	dword ptr [dword4064+8]
	mov	dword4066,[ebp-972]
	mov	dword4068,[ebp-968]
	fld	dword ptr [dword4066+12]
	fsub	dword ptr [dword4068+12]
	mov	dword4070,[ebp-976]
	fstp	dword ptr [dword4070+12]
label00e7:
; end of inline function vec4f_subtract
	mov	dword4107,[ebp-848]
	mov	[ebp-980],dword4107
	lea	dword3863,[ebp-884]
	mov	[ebp-984],dword3863
; start of inline function vec4f_dot
	mov	dword4110,[ebp-984]
	mov	dword4112,[ebp-980]
	fld	dword ptr [dword4110+4]
	fmul	dword ptr [dword4112+4]
	mov	dword4114,[ebp-984]
	mov	dword4116,[ebp-980]
	fld	dword ptr [dword4114]
	fmul	dword ptr [dword4116]
	faddp
	mov	dword4118,[ebp-984]
	mov	dword4120,[ebp-980]
	fld	dword ptr [dword4118+8]
	fmul	dword ptr [dword4120+8]
	faddp
	mov	dword4122,[ebp-984]
	mov	dword4124,[ebp-980]
	fld	dword ptr [dword4122+12]
	fmul	dword ptr [dword4124+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ea:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword4125,[ebp-848]
	mov	[ebp-980],dword4125
	lea	dword3865,[ebp-900]
	mov	[ebp-984],dword3865
; start of inline function vec4f_dot
	mov	dword4128,[ebp-984]
	mov	dword4130,[ebp-980]
	fld	dword ptr [dword4128+4]
	fmul	dword ptr [dword4130+4]
	mov	dword4132,[ebp-984]
	mov	dword4134,[ebp-980]
	fld	dword ptr [dword4132]
	fmul	dword ptr [dword4134]
	faddp
	mov	dword4136,[ebp-984]
	mov	dword4138,[ebp-980]
	fld	dword ptr [dword4136+8]
	fmul	dword ptr [dword4138+8]
	faddp
	mov	dword4140,[ebp-984]
	mov	dword4142,[ebp-980]
	fld	dword ptr [dword4140+12]
	fmul	dword ptr [dword4142+12]
	faddp
	fstp	dword ptr [ebp-988]
label00eb:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword4143,[ebp-920]
	mov	[ebp-992],dword4143
	lea	dword3868,[ebp-900]
	mov	[ebp-996],dword3868
; start of inline function vec4f_mul
	mov	dword4146,[ebp-996]
	fld	dword ptr [dword4146]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4146]
	mov	dword4149,[ebp-996]
	fld	dword ptr [dword4149+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4149+4]
	mov	dword4152,[ebp-996]
	fld	dword ptr [dword4152+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4152+8]
	mov	dword4155,[ebp-996]
	fld	dword ptr [dword4155+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4155+12]
label00ec:
; end of inline function vec4f_mul
	lea	dword3869,[ebp-900]
	mov	[ebp-956],dword3869
	mov	dword3871,[ebp-864]
	mov	[ebp-960],dword3871
	mov	dword3873,[ebp-860]
	mov	dword3875,[dword3873+192]
	imul	dword3875,24
	mov	dword3877,[ebp-860]
	add	dword3877,dword3875
	mov	[ebp-964],dword3877
; start of inline function vec4f_add
	mov	dword3945,[ebp-960]
	mov	dword3947,[ebp-956]
	fld	dword ptr [dword3945]
	fadd	dword ptr [dword3947]
	mov	dword3949,[ebp-964]
	fstp	dword ptr [dword3949]
	mov	dword3951,[ebp-960]
	mov	dword3953,[ebp-956]
	fld	dword ptr [dword3951+4]
	fadd	dword ptr [dword3953+4]
	mov	dword3955,[ebp-964]
	fstp	dword ptr [dword3955+4]
	mov	dword3957,[ebp-960]
	mov	dword3959,[ebp-956]
	fld	dword ptr [dword3957+8]
	fadd	dword ptr [dword3959+8]
	mov	dword3961,[ebp-964]
	fstp	dword ptr [dword3961+8]
	mov	dword3963,[ebp-960]
	mov	dword3965,[ebp-956]
	fld	dword ptr [dword3963+12]
	fadd	dword ptr [dword3965+12]
	mov	dword3967,[ebp-964]
	fstp	dword ptr [dword3967+12]
label00e3:
; end of inline function vec4f_add
	mov	dword3879,16
	add	dword3879,[ebp-864]
	mov	[ebp-936],dword3879
	mov	dword3881,16
	add	dword3881,[ebp-868]
	mov	[ebp-940],dword3881
	lea	dword3882,[ebp-908]
	mov	[ebp-944],dword3882
; start of inline function vec2f_subtract
	mov	dword3924,[ebp-940]
	mov	dword3926,[ebp-936]
	fld	dword ptr [dword3924]
	fsub	dword ptr [dword3926]
	mov	dword3928,[ebp-944]
	fstp	dword ptr [dword3928]
	mov	dword3930,[ebp-940]
	mov	dword3932,[ebp-936]
	fld	dword ptr [dword3930+4]
	fsub	dword ptr [dword3932+4]
	mov	dword3934,[ebp-944]
	fstp	dword ptr [dword3934+4]
label00e1:
; end of inline function vec2f_subtract
	mov	dword3935,[ebp-920]
	mov	[ebp-948],dword3935
	lea	dword3884,[ebp-908]
	mov	[ebp-952],dword3884
; start of inline function vec2f_mul
	mov	dword3938,[ebp-952]
	fld	dword ptr [dword3938]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3938]
	mov	dword3941,[ebp-952]
	fld	dword ptr [dword3941+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3941+4]
label00e2:
; end of inline function vec2f_mul
	lea	dword3885,[ebp-908]
	mov	[ebp-924],dword3885
	mov	dword3887,16
	add	dword3887,[ebp-864]
	mov	[ebp-928],dword3887
	mov	dword3889,[ebp-860]
	mov	dword3891,[dword3889+192]
	imul	dword3891,24
	mov	dword3893,[ebp-860]
	add	dword3893,dword3891
	add	dword3893,16
	mov	[ebp-932],dword3893
; start of inline function vec2f_add
	mov	dword3911,[ebp-928]
	mov	dword3913,[ebp-924]
	fld	dword ptr [dword3911]
	fadd	dword ptr [dword3913]
	mov	dword3915,[ebp-932]
	fstp	dword ptr [dword3915]
	mov	dword3917,[ebp-928]
	mov	dword3919,[ebp-924]
	fld	dword ptr [dword3917+4]
	fadd	dword ptr [dword3919+4]
	mov	dword3921,[ebp-932]
	fstp	dword ptr [dword3921+4]
label00e0:
; end of inline function vec2f_add
	mov	dword3896,[ebp-860]
	inc	dword ptr [dword3896+192]
label00dd:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00da
label00db:
	mov	dword3900,[ebp-860]
	mov	dword3901,[dword3900+192]
	inc	dword ptr [dword3900+192]
	imul	dword3901,24
	mov	dword3904,[ebp-860]
	add	dword3904,dword3901
	mov	dword3906,[ebp-860]
	mov	dword3907,[dword3906]
	mov	dword3908,[dword3906+4]
	mov	[dword3904],dword3907
	mov	[dword3904+4],dword3908
	mov	dword3907,[dword3906+8]
	mov	dword3908,[dword3906+12]
	mov	[dword3904+8],dword3907
	mov	[dword3904+12],dword3908
	mov	dword3907,[dword3906+16]
	mov	dword3908,[dword3906+20]
	mov	[dword3904+16],dword3907
	mov	[dword3904+20],dword3908
label00ed:
; end of inline function _clip_on_plain
	mov	dword2042,[ebp-648]
	cmp	dword ptr [dword2042+192],1
	setg	byte32
	movzx	dword2044,byte32
	mov	[ebp-1000],dword2044
label00ee:
; end of inline function _clip_poligon
	mov	dword40,[ebp-1000]
	cmp	dword40,0
	jne	label0000
	jmp	label00f3
label0000:
	mov	dword42,[ebp-200]
	cmp	dword ptr [dword42+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword ptr [ebp-336],0
label0002:
label0003:
	mov	dword49,[ebp-200]
	mov	dword51,[dword49+192]
	cmp	dword51,[ebp-336]
	jle	label0004
	mov	dword53,[ebp-200]
	mov	dword56,[ebp-336]
	imul	dword56,24
	add	dword53,dword56
	mov	[ebp-1004],dword53
	lea	dword57,[ebp-332]
	sal	dword ptr [ebp-336],4
	add	dword57,[ebp-336]
	mov	[ebp-1008],dword57
; start of inline function _transform_to_screen_space
	lea	dword4158,dword ptr [__viewport_matrix]
	mov	[ebp-1032],dword4158
	mov	dword4191,[ebp-1004]
	mov	[ebp-1036],dword4191
	lea	dword4160,[ebp-1024]
	mov	[ebp-1040],dword4160
; start of inline function matrix4f_transform
	mov	dword4194,[ebp-1036]
	mov	dword4196,[ebp-1032]
	fld	dword ptr [dword4194+4]
	fmul	dword ptr [dword4196+16]
	mov	dword4198,[ebp-1036]
	mov	dword4200,[ebp-1032]
	fld	dword ptr [dword4198]
	fmul	dword ptr [dword4200]
	faddp
	mov	dword4202,[ebp-1036]
	mov	dword4204,[ebp-1032]
	fld	dword ptr [dword4202+8]
	fmul	dword ptr [dword4204+32]
	faddp
	mov	dword4206,[ebp-1036]
	mov	dword4208,[ebp-1032]
	fld	dword ptr [dword4206+12]
	fmul	dword ptr [dword4208+48]
	faddp
	mov	dword4210,[ebp-1040]
	fstp	dword ptr [dword4210]
	mov	dword4212,[ebp-1032]
	mov	dword4214,[ebp-1036]
	fld	dword ptr [dword4214]
	fmul	dword ptr [dword4212+4]
	mov	dword4216,[ebp-1036]
	mov	dword4218,[ebp-1032]
	fld	dword ptr [dword4216+4]
	fmul	dword ptr [dword4218+20]
	faddp
	mov	dword4220,[ebp-1036]
	mov	dword4222,[ebp-1032]
	fld	dword ptr [dword4220+8]
	fmul	dword ptr [dword4222+36]
	faddp
	mov	dword4224,[ebp-1036]
	mov	dword4226,[ebp-1032]
	fld	dword ptr [dword4224+12]
	fmul	dword ptr [dword4226+52]
	faddp
	mov	dword4228,[ebp-1040]
	fstp	dword ptr [dword4228+4]
	mov	dword4230,[ebp-1032]
	mov	dword4232,[ebp-1036]
	fld	dword ptr [dword4232]
	fmul	dword ptr [dword4230+8]
	mov	dword4234,[ebp-1036]
	mov	dword4236,[ebp-1032]
	fld	dword ptr [dword4234+4]
	fmul	dword ptr [dword4236+24]
	faddp
	mov	dword4238,[ebp-1036]
	mov	dword4240,[ebp-1032]
	fld	dword ptr [dword4238+8]
	fmul	dword ptr [dword4240+40]
	faddp
	mov	dword4242,[ebp-1036]
	mov	dword4244,[ebp-1032]
	fld	dword ptr [dword4242+12]
	fmul	dword ptr [dword4244+56]
	faddp
	mov	dword4246,[ebp-1040]
	fstp	dword ptr [dword4246+8]
	mov	dword4248,[ebp-1032]
	mov	dword4250,[ebp-1036]
	fld	dword ptr [dword4250]
	fmul	dword ptr [dword4248+12]
	mov	dword4252,[ebp-1036]
	mov	dword4254,[ebp-1032]
	fld	dword ptr [dword4252+4]
	fmul	dword ptr [dword4254+28]
	faddp
	mov	dword4256,[ebp-1036]
	mov	dword4258,[ebp-1032]
	fld	dword ptr [dword4256+8]
	fmul	dword ptr [dword4258+44]
	faddp
	mov	dword4260,[ebp-1036]
	mov	dword4262,[ebp-1032]
	fld	dword ptr [dword4260+12]
	fmul	dword ptr [dword4262+60]
	faddp
	mov	dword4264,[ebp-1040]
	fstp	dword ptr [dword4264+12]
label00f1:
; end of inline function matrix4f_transform
	lea	dword4161,[ebp-1024]
	add	dword4161,12
	fld1
	fdiv	dword ptr [dword4161]
	fstp	dword ptr [ebp-1028]
	fld	dword ptr [ebp-1024]
	fmul	dword ptr [ebp-1028]
	float2int	dword4166
	mov	dword4168,[ebp-1008]
	mov	[dword4168],dword4166
	lea	dword4169,[ebp-1024]
	add	dword4169,4
	fld	dword ptr [dword4169]
	fmul	dword ptr [ebp-1028]
	float2int	dword4172
	mov	dword4174,[ebp-1008]
	mov	[dword4174+4],dword4172
	mov	dword4176,[ebp-1008]
	cmp	dword ptr [dword4176],0
	jl	label00f0
	mov	dword4179,[ebp-1008]
	mov	dword4181,[dword4179]
	cmp	dword4181,dword ptr [__width]
	jge	label00f0
	mov	dword4183,[ebp-1008]
	cmp	dword ptr [dword4183+4],0
	jl	label00f0
	mov	dword4186,[ebp-1008]
	mov	dword4188,[dword4186+4]
	cmp	dword4188,dword ptr [__height]
	jl	label00ef
label00f0:
	mov	dword ptr ds:[0],0
label00ef:
label00f2:
; end of inline function _transform_to_screen_space
	lea	dword60,[ebp-332]
	sal	dword ptr [ebp-336],4
	add	dword60,[ebp-336]
	add	dword60,8
	mov	dword65,[ebp-200]
	mov	dword68,[ebp-336]
	imul	dword68,24
	add	dword65,dword68
	add	dword65,16
	mov	dword70,[dword65]
	mov	dword71,[dword65+4]
	mov	[dword60],dword70
	mov	[dword60+4],dword71
	inc	dword ptr [ebp-336]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-336],2
label0005:
label0006:
	mov	dword76,[ebp-200]
	mov	dword78,[dword76+192]
	dec	dword78
	cmp	dword78,[ebp-336]
	jle	label0007
	lea	dword80,[ebp-332]
	sal	dword ptr [ebp-336],4
	add	dword80,[ebp-336]
	mov	[ebp-340],dword80
	mov	dword85,[ebp-336]
	dec	dword85
	sal	dword85,4
	lea	dword87,[ebp-332]
	add	dword87,dword85
	mov	[ebp-344],dword87
	lea	dword88,[ebp-332]
	mov	[ebp-348],dword88
; start of inline function _rasterize_triangle_2i
	mov	dword92,[ebp-348]
	add	dword92,4
	mov	dword95,[ebp-344]
	add	dword95,4
	mov	dword97,[dword92]
	cmp	dword97,[dword95]
	jle	label0008
	mov	dword100,[ebp-348]
	mov	[ebp-352],dword100
	mov	dword103,[ebp-344]
	mov	[ebp-348],dword103
	mov	dword106,[ebp-352]
	mov	[ebp-344],dword106
label0008:
	mov	dword108,[ebp-348]
	add	dword108,4
	mov	dword111,[ebp-340]
	add	dword111,4
	mov	dword113,[dword108]
	cmp	dword113,[dword111]
	jle	label0009
	mov	dword116,[ebp-348]
	mov	[ebp-352],dword116
	mov	dword119,[ebp-340]
	mov	[ebp-348],dword119
	mov	dword122,[ebp-352]
	mov	[ebp-340],dword122
label0009:
	mov	dword124,[ebp-344]
	add	dword124,4
	mov	dword127,[ebp-340]
	add	dword127,4
	mov	dword129,[dword124]
	cmp	dword129,[dword127]
	jle	label000a
	mov	dword132,[ebp-344]
	mov	[ebp-352],dword132
	mov	dword135,[ebp-340]
	mov	[ebp-344],dword135
	mov	dword138,[ebp-352]
	mov	[ebp-340],dword138
label000a:
	mov	dword140,[ebp-348]
	add	dword140,4
	mov	dword143,[ebp-340]
	add	dword143,4
	mov	dword145,[dword140]
	cmp	dword145,[dword143]
	jne	label000b
	mov	dword147,[ebp-348]
	add	dword147,4
	cmp	dword ptr [dword147],0
	jl	label000c
	mov	dword151,[ebp-348]
	add	dword151,4
	mov	dword154,[dword151]
	cmp	dword154,dword ptr [__height]
	jge	label000c
	fldz
	fstp	dword ptr [ebp-520]
	fldz
	fstp	dword ptr [ebp-524]
	mov	dword156,8
	add	dword156,[ebp-340]
	mov	[ebp-528],dword156
	mov	dword158,8
	add	dword158,[ebp-344]
	mov	[ebp-532],dword158
	mov	dword160,8
	add	dword160,[ebp-348]
	mov	[ebp-536],dword160
	mov	dword162,[ebp-348]
	add	dword162,4
	mov	dword1308,[dword162]
	mov	[ebp-540],dword1308
	mov	dword165,[ebp-340]
	mov	dword1307,[dword165]
	mov	[ebp-544],dword1307
	mov	dword167,[ebp-344]
	mov	dword1306,[dword167]
	mov	[ebp-548],dword1306
	mov	dword169,[ebp-348]
	mov	dword1305,[dword169]
	mov	[ebp-552],dword1305
; start of inline function _rasterize_triangle_1i
	mov	dword1312,[ebp-552]
	cmp	dword1312,[ebp-548]
	jge	label0040
	mov	dword1315,[ebp-544]
	cmp	dword1315,[ebp-548]
	jle	label0041
	mov	dword1385,[ebp-520]
	mov	[ebp-556],dword1385
	mov	dword1384,[ebp-524]
	mov	[ebp-560],dword1384
	mov	dword1319,[ebp-536]
	mov	dword1383,[dword1319+4]
	mov	[ebp-564],dword1383
	mov	dword1321,[ebp-536]
	mov	dword1382,[dword1321]
	mov	[ebp-568],dword1382
	mov	dword1381,[ebp-540]
	mov	[ebp-572],dword1381
	mov	dword1380,[ebp-544]
	mov	[ebp-576],dword1380
	mov	dword1379,[ebp-552]
	mov	[ebp-580],dword1379
; start of inline function _rasterize_horiz_line
	mov	dword1389,dword ptr [__pitch]
	imul	dword1389,[ebp-572]
	add	dword1389,dword ptr [__videomem]
	sal	dword ptr [ebp-580],2
	add	dword1389,[ebp-580]
	mov	[ebp-584],dword1389
	sal	dword ptr [ebp-576],2
	mov	dword1397,[ebp-584]
	add	dword1397,[ebp-576]
	sal	dword ptr [ebp-580],2
	sub	dword1397,[ebp-580]
	mov	[ebp-588],dword1397
label004a:
	mov	dword1465,[ebp-564]
	mov	[ebp-628],dword1465
	mov	dword1464,[ebp-568]
	mov	[ebp-632],dword1464
; start of inline function _tex2d
	mov	dword1469,dword ptr [__texture_width]
	dec	dword1469
	int2float	dword1469
	fmul	dword ptr [ebp-632]
	float2int	dword1471
	mov	[ebp-636],dword1471
	mov	dword1475,dword ptr [__texture_height]
	dec	dword1475
	int2float	dword1475
	fmul	dword ptr [ebp-628]
	float2int	dword1477
	mov	[ebp-640],dword1477
	mov	dword1481,[ebp-640]
	imul	dword1481,dword ptr [__texture_width]
	add	dword1481,[ebp-636]
	sal	dword1481,2
	add	dword1481,dword ptr [__texture_data]
	mov	dword1485,[dword1481]
	mov	[ebp-644],dword1485
label004e:
; end of inline function _tex2d
	mov	dword1403,[ebp-644]
	mov	[ebp-592],dword1403
	sar	dword ptr [ebp-592],24
	mov	dword1408,[ebp-592]
	and	dword1408,-289
	mov	[ebp-620],dword1408
	cmp	dword ptr [ebp-620],0
	je	label004d
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1415,[ebp-584]
	mov	dword1417,[dword1415]
	mov	[ebp-608],dword1417
	mov	dword1420,[ebp-608]
	and	dword1420,-73984
	sar	dword1420,8
	mov	[ebp-612],dword1420
	mov	dword1425,[ebp-608]
	and	dword1425,-289
	mov	[ebp-616],dword1425
	mov	dword1429,[ebp-592]
	and	dword1429,-73984
	sar	dword1429,8
	mov	[ebp-600],dword1429
	mov	dword1434,[ebp-592]
	and	dword1434,-289
	mov	[ebp-604],dword1434
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1440
	mov	[ebp-600],dword1440
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1446
	mov	[ebp-604],dword1446
	sal	dword ptr [ebp-600],8
	mov	dword1451,[ebp-600]
	add	dword1451,[ebp-604]
	mov	[ebp-596],dword1451
	mov	dword1454,[ebp-584]
	mov	dword1456,[ebp-596]
	mov	[dword1454],dword1456
label004d:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label004b:
	add	dword ptr [ebp-584],4
	mov	dword1463,[ebp-584]
	cmp	dword1463,[ebp-588]
	jl	label004a
label004c:
label004f:
; end of inline function _rasterize_horiz_line
	jmp	label0042
label0041:
	mov	dword1327,[ebp-544]
	cmp	dword1327,[ebp-552]
	jge	label0043
	mov	dword1492,[ebp-520]
	mov	[ebp-556],dword1492
	mov	dword1491,[ebp-524]
	mov	[ebp-560],dword1491
	mov	dword1331,[ebp-528]
	mov	dword1490,[dword1331+4]
	mov	[ebp-564],dword1490
	mov	dword1333,[ebp-528]
	mov	dword1489,[dword1333]
	mov	[ebp-568],dword1489
	mov	dword1488,[ebp-540]
	mov	[ebp-572],dword1488
	mov	dword1487,[ebp-548]
	mov	[ebp-576],dword1487
	mov	dword1486,[ebp-544]
	mov	[ebp-580],dword1486
; start of inline function _rasterize_horiz_line
	mov	dword1496,dword ptr [__pitch]
	imul	dword1496,[ebp-572]
	add	dword1496,dword ptr [__videomem]
	sal	dword ptr [ebp-580],2
	add	dword1496,[ebp-580]
	mov	[ebp-584],dword1496
	sal	dword ptr [ebp-576],2
	mov	dword1504,[ebp-584]
	add	dword1504,[ebp-576]
	sal	dword ptr [ebp-580],2
	sub	dword1504,[ebp-580]
	mov	[ebp-588],dword1504
label0050:
	mov	dword1572,[ebp-564]
	mov	[ebp-628],dword1572
	mov	dword1571,[ebp-568]
	mov	[ebp-632],dword1571
; start of inline function _tex2d
	mov	dword1576,dword ptr [__texture_width]
	dec	dword1576
	int2float	dword1576
	fmul	dword ptr [ebp-632]
	float2int	dword1578
	mov	[ebp-636],dword1578
	mov	dword1582,dword ptr [__texture_height]
	dec	dword1582
	int2float	dword1582
	fmul	dword ptr [ebp-628]
	float2int	dword1584
	mov	[ebp-640],dword1584
	mov	dword1588,[ebp-640]
	imul	dword1588,dword ptr [__texture_width]
	add	dword1588,[ebp-636]
	sal	dword1588,2
	add	dword1588,dword ptr [__texture_data]
	mov	dword1592,[dword1588]
	mov	[ebp-644],dword1592
label0054:
; end of inline function _tex2d
	mov	dword1510,[ebp-644]
	mov	[ebp-592],dword1510
	sar	dword ptr [ebp-592],24
	mov	dword1515,[ebp-592]
	and	dword1515,-289
	mov	[ebp-620],dword1515
	cmp	dword ptr [ebp-620],0
	je	label0053
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1522,[ebp-584]
	mov	dword1524,[dword1522]
	mov	[ebp-608],dword1524
	mov	dword1527,[ebp-608]
	and	dword1527,-73984
	sar	dword1527,8
	mov	[ebp-612],dword1527
	mov	dword1532,[ebp-608]
	and	dword1532,-289
	mov	[ebp-616],dword1532
	mov	dword1536,[ebp-592]
	and	dword1536,-73984
	sar	dword1536,8
	mov	[ebp-600],dword1536
	mov	dword1541,[ebp-592]
	and	dword1541,-289
	mov	[ebp-604],dword1541
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1547
	mov	[ebp-600],dword1547
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1553
	mov	[ebp-604],dword1553
	sal	dword ptr [ebp-600],8
	mov	dword1558,[ebp-600]
	add	dword1558,[ebp-604]
	mov	[ebp-596],dword1558
	mov	dword1561,[ebp-584]
	mov	dword1563,[ebp-596]
	mov	[dword1561],dword1563
label0053:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0051:
	add	dword ptr [ebp-584],4
	mov	dword1570,[ebp-584]
	cmp	dword1570,[ebp-588]
	jl	label0050
label0052:
label0055:
; end of inline function _rasterize_horiz_line
	jmp	label0044
label0043:
	mov	dword1599,[ebp-520]
	mov	[ebp-556],dword1599
	mov	dword1598,[ebp-524]
	mov	[ebp-560],dword1598
	mov	dword1340,[ebp-536]
	mov	dword1597,[dword1340+4]
	mov	[ebp-564],dword1597
	mov	dword1342,[ebp-536]
	mov	dword1596,[dword1342]
	mov	[ebp-568],dword1596
	mov	dword1595,[ebp-540]
	mov	[ebp-572],dword1595
	mov	dword1594,[ebp-548]
	mov	[ebp-576],dword1594
	mov	dword1593,[ebp-552]
	mov	[ebp-580],dword1593
; start of inline function _rasterize_horiz_line
	mov	dword1603,dword ptr [__pitch]
	imul	dword1603,[ebp-572]
	add	dword1603,dword ptr [__videomem]
	sal	dword ptr [ebp-580],2
	add	dword1603,[ebp-580]
	mov	[ebp-584],dword1603
	sal	dword ptr [ebp-576],2
	mov	dword1611,[ebp-584]
	add	dword1611,[ebp-576]
	sal	dword ptr [ebp-580],2
	sub	dword1611,[ebp-580]
	mov	[ebp-588],dword1611
label0056:
	mov	dword1679,[ebp-564]
	mov	[ebp-628],dword1679
	mov	dword1678,[ebp-568]
	mov	[ebp-632],dword1678
; start of inline function _tex2d
	mov	dword1683,dword ptr [__texture_width]
	dec	dword1683
	int2float	dword1683
	fmul	dword ptr [ebp-632]
	float2int	dword1685
	mov	[ebp-636],dword1685
	mov	dword1689,dword ptr [__texture_height]
	dec	dword1689
	int2float	dword1689
	fmul	dword ptr [ebp-628]
	float2int	dword1691
	mov	[ebp-640],dword1691
	mov	dword1695,[ebp-640]
	imul	dword1695,dword ptr [__texture_width]
	add	dword1695,[ebp-636]
	sal	dword1695,2
	add	dword1695,dword ptr [__texture_data]
	mov	dword1699,[dword1695]
	mov	[ebp-644],dword1699
label005a:
; end of inline function _tex2d
	mov	dword1617,[ebp-644]
	mov	[ebp-592],dword1617
	sar	dword ptr [ebp-592],24
	mov	dword1622,[ebp-592]
	and	dword1622,-289
	mov	[ebp-620],dword1622
	cmp	dword ptr [ebp-620],0
	je	label0059
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1629,[ebp-584]
	mov	dword1631,[dword1629]
	mov	[ebp-608],dword1631
	mov	dword1634,[ebp-608]
	and	dword1634,-73984
	sar	dword1634,8
	mov	[ebp-612],dword1634
	mov	dword1639,[ebp-608]
	and	dword1639,-289
	mov	[ebp-616],dword1639
	mov	dword1643,[ebp-592]
	and	dword1643,-73984
	sar	dword1643,8
	mov	[ebp-600],dword1643
	mov	dword1648,[ebp-592]
	and	dword1648,-289
	mov	[ebp-604],dword1648
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1654
	mov	[ebp-600],dword1654
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1660
	mov	[ebp-604],dword1660
	sal	dword ptr [ebp-600],8
	mov	dword1665,[ebp-600]
	add	dword1665,[ebp-604]
	mov	[ebp-596],dword1665
	mov	dword1668,[ebp-584]
	mov	dword1670,[ebp-596]
	mov	[dword1668],dword1670
label0059:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0057:
	add	dword ptr [ebp-584],4
	mov	dword1677,[ebp-584]
	cmp	dword1677,[ebp-588]
	jl	label0056
label0058:
label005b:
; end of inline function _rasterize_horiz_line
label0044:
label0042:
	jmp	label0045
label0040:
	mov	dword1348,[ebp-544]
	cmp	dword1348,[ebp-548]
	jge	label0046
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	dword1352,[ebp-528]
	mov	dword1704,[dword1352+4]
	mov	[ebp-564],dword1704
	mov	dword1354,[ebp-528]
	mov	dword1703,[dword1354]
	mov	[ebp-568],dword1703
	mov	dword1702,[ebp-540]
	mov	[ebp-572],dword1702
	mov	dword1701,[ebp-552]
	mov	[ebp-576],dword1701
	mov	dword1700,[ebp-544]
	mov	[ebp-580],dword1700
; start of inline function _rasterize_horiz_line
	mov	dword1708,dword ptr [__pitch]
	imul	dword1708,[ebp-572]
	add	dword1708,dword ptr [__videomem]
	sal	dword ptr [ebp-580],2
	add	dword1708,[ebp-580]
	mov	[ebp-584],dword1708
	sal	dword ptr [ebp-576],2
	mov	dword1716,[ebp-584]
	add	dword1716,[ebp-576]
	sal	dword ptr [ebp-580],2
	sub	dword1716,[ebp-580]
	mov	[ebp-588],dword1716
label005c:
	mov	dword1784,[ebp-564]
	mov	[ebp-628],dword1784
	mov	dword1783,[ebp-568]
	mov	[ebp-632],dword1783
; start of inline function _tex2d
	mov	dword1788,dword ptr [__texture_width]
	dec	dword1788
	int2float	dword1788
	fmul	dword ptr [ebp-632]
	float2int	dword1790
	mov	[ebp-636],dword1790
	mov	dword1794,dword ptr [__texture_height]
	dec	dword1794
	int2float	dword1794
	fmul	dword ptr [ebp-628]
	float2int	dword1796
	mov	[ebp-640],dword1796
	mov	dword1800,[ebp-640]
	imul	dword1800,dword ptr [__texture_width]
	add	dword1800,[ebp-636]
	sal	dword1800,2
	add	dword1800,dword ptr [__texture_data]
	mov	dword1804,[dword1800]
	mov	[ebp-644],dword1804
label0060:
; end of inline function _tex2d
	mov	dword1722,[ebp-644]
	mov	[ebp-592],dword1722
	sar	dword ptr [ebp-592],24
	mov	dword1727,[ebp-592]
	and	dword1727,-289
	mov	[ebp-620],dword1727
	cmp	dword ptr [ebp-620],0
	je	label005f
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1734,[ebp-584]
	mov	dword1736,[dword1734]
	mov	[ebp-608],dword1736
	mov	dword1739,[ebp-608]
	and	dword1739,-73984
	sar	dword1739,8
	mov	[ebp-612],dword1739
	mov	dword1744,[ebp-608]
	and	dword1744,-289
	mov	[ebp-616],dword1744
	mov	dword1748,[ebp-592]
	and	dword1748,-73984
	sar	dword1748,8
	mov	[ebp-600],dword1748
	mov	dword1753,[ebp-592]
	and	dword1753,-289
	mov	[ebp-604],dword1753
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1759
	mov	[ebp-600],dword1759
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1765
	mov	[ebp-604],dword1765
	sal	dword ptr [ebp-600],8
	mov	dword1770,[ebp-600]
	add	dword1770,[ebp-604]
	mov	[ebp-596],dword1770
	mov	dword1773,[ebp-584]
	mov	dword1775,[ebp-596]
	mov	[dword1773],dword1775
label005f:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label005d:
	add	dword ptr [ebp-584],4
	mov	dword1782,[ebp-584]
	cmp	dword1782,[ebp-588]
	jl	label005c
label005e:
label0061:
; end of inline function _rasterize_horiz_line
	jmp	label0047
label0046:
	mov	dword1360,[ebp-544]
	cmp	dword1360,[ebp-552]
	jle	label0048
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	dword1364,[ebp-532]
	mov	dword1809,[dword1364+4]
	mov	[ebp-564],dword1809
	mov	dword1366,[ebp-532]
	mov	dword1808,[dword1366]
	mov	[ebp-568],dword1808
	mov	dword1807,[ebp-540]
	mov	[ebp-572],dword1807
	mov	dword1806,[ebp-544]
	mov	[ebp-576],dword1806
	mov	dword1805,[ebp-548]
	mov	[ebp-580],dword1805
; start of inline function _rasterize_horiz_line
	mov	dword1813,dword ptr [__pitch]
	imul	dword1813,[ebp-572]
	add	dword1813,dword ptr [__videomem]
	sal	dword ptr [ebp-580],2
	add	dword1813,[ebp-580]
	mov	[ebp-584],dword1813
	sal	dword ptr [ebp-576],2
	mov	dword1821,[ebp-584]
	add	dword1821,[ebp-576]
	sal	dword ptr [ebp-580],2
	sub	dword1821,[ebp-580]
	mov	[ebp-588],dword1821
label0062:
	mov	dword1889,[ebp-564]
	mov	[ebp-628],dword1889
	mov	dword1888,[ebp-568]
	mov	[ebp-632],dword1888
; start of inline function _tex2d
	mov	dword1893,dword ptr [__texture_width]
	dec	dword1893
	int2float	dword1893
	fmul	dword ptr [ebp-632]
	float2int	dword1895
	mov	[ebp-636],dword1895
	mov	dword1899,dword ptr [__texture_height]
	dec	dword1899
	int2float	dword1899
	fmul	dword ptr [ebp-628]
	float2int	dword1901
	mov	[ebp-640],dword1901
	mov	dword1905,[ebp-640]
	imul	dword1905,dword ptr [__texture_width]
	add	dword1905,[ebp-636]
	sal	dword1905,2
	add	dword1905,dword ptr [__texture_data]
	mov	dword1909,[dword1905]
	mov	[ebp-644],dword1909
label0066:
; end of inline function _tex2d
	mov	dword1827,[ebp-644]
	mov	[ebp-592],dword1827
	sar	dword ptr [ebp-592],24
	mov	dword1832,[ebp-592]
	and	dword1832,-289
	mov	[ebp-620],dword1832
	cmp	dword ptr [ebp-620],0
	je	label0065
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1839,[ebp-584]
	mov	dword1841,[dword1839]
	mov	[ebp-608],dword1841
	mov	dword1844,[ebp-608]
	and	dword1844,-73984
	sar	dword1844,8
	mov	[ebp-612],dword1844
	mov	dword1849,[ebp-608]
	and	dword1849,-289
	mov	[ebp-616],dword1849
	mov	dword1853,[ebp-592]
	and	dword1853,-73984
	sar	dword1853,8
	mov	[ebp-600],dword1853
	mov	dword1858,[ebp-592]
	and	dword1858,-289
	mov	[ebp-604],dword1858
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1864
	mov	[ebp-600],dword1864
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1870
	mov	[ebp-604],dword1870
	sal	dword ptr [ebp-600],8
	mov	dword1875,[ebp-600]
	add	dword1875,[ebp-604]
	mov	[ebp-596],dword1875
	mov	dword1878,[ebp-584]
	mov	dword1880,[ebp-596]
	mov	[dword1878],dword1880
label0065:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0063:
	add	dword ptr [ebp-584],4
	mov	dword1887,[ebp-584]
	cmp	dword1887,[ebp-588]
	jl	label0062
label0064:
label0067:
; end of inline function _rasterize_horiz_line
	jmp	label0049
label0048:
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	dword1373,[ebp-532]
	mov	dword1914,[dword1373+4]
	mov	[ebp-564],dword1914
	mov	dword1375,[ebp-532]
	mov	dword1913,[dword1375]
	mov	[ebp-568],dword1913
	mov	dword1912,[ebp-540]
	mov	[ebp-572],dword1912
	mov	dword1911,[ebp-552]
	mov	[ebp-576],dword1911
	mov	dword1910,[ebp-548]
	mov	[ebp-580],dword1910
; start of inline function _rasterize_horiz_line
	mov	dword1918,dword ptr [__pitch]
	imul	dword1918,[ebp-572]
	add	dword1918,dword ptr [__videomem]
	sal	dword ptr [ebp-580],2
	add	dword1918,[ebp-580]
	mov	[ebp-584],dword1918
	sal	dword ptr [ebp-576],2
	mov	dword1926,[ebp-584]
	add	dword1926,[ebp-576]
	sal	dword ptr [ebp-580],2
	sub	dword1926,[ebp-580]
	mov	[ebp-588],dword1926
label0068:
	mov	dword1994,[ebp-564]
	mov	[ebp-628],dword1994
	mov	dword1993,[ebp-568]
	mov	[ebp-632],dword1993
; start of inline function _tex2d
	mov	dword1998,dword ptr [__texture_width]
	dec	dword1998
	int2float	dword1998
	fmul	dword ptr [ebp-632]
	float2int	dword2000
	mov	[ebp-636],dword2000
	mov	dword2004,dword ptr [__texture_height]
	dec	dword2004
	int2float	dword2004
	fmul	dword ptr [ebp-628]
	float2int	dword2006
	mov	[ebp-640],dword2006
	mov	dword2010,[ebp-640]
	imul	dword2010,dword ptr [__texture_width]
	add	dword2010,[ebp-636]
	sal	dword2010,2
	add	dword2010,dword ptr [__texture_data]
	mov	dword2014,[dword2010]
	mov	[ebp-644],dword2014
label006c:
; end of inline function _tex2d
	mov	dword1932,[ebp-644]
	mov	[ebp-592],dword1932
	sar	dword ptr [ebp-592],24
	mov	dword1937,[ebp-592]
	and	dword1937,-289
	mov	[ebp-620],dword1937
	cmp	dword ptr [ebp-620],0
	je	label006b
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1944,[ebp-584]
	mov	dword1946,[dword1944]
	mov	[ebp-608],dword1946
	mov	dword1949,[ebp-608]
	and	dword1949,-73984
	sar	dword1949,8
	mov	[ebp-612],dword1949
	mov	dword1954,[ebp-608]
	and	dword1954,-289
	mov	[ebp-616],dword1954
	mov	dword1958,[ebp-592]
	and	dword1958,-73984
	sar	dword1958,8
	mov	[ebp-600],dword1958
	mov	dword1963,[ebp-592]
	and	dword1963,-289
	mov	[ebp-604],dword1963
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1969
	mov	[ebp-600],dword1969
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1975
	mov	[ebp-604],dword1975
	sal	dword ptr [ebp-600],8
	mov	dword1980,[ebp-600]
	add	dword1980,[ebp-604]
	mov	[ebp-596],dword1980
	mov	dword1983,[ebp-584]
	mov	dword1985,[ebp-596]
	mov	[dword1983],dword1985
label006b:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0069:
	add	dword ptr [ebp-584],4
	mov	dword1992,[ebp-584]
	cmp	dword1992,[ebp-588]
	jl	label0068
label006a:
label006d:
; end of inline function _rasterize_horiz_line
label0049:
label0047:
label0045:
label006e:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label006f
label000b:
	mov	dword171,[ebp-348]
	add	dword171,4
	mov	dword174,[dword171]
	mov	[ebp-364],dword174
label000d:
label000e:
	mov	dword176,[ebp-344]
	add	dword176,4
	mov	dword179,[dword176]
	cmp	dword179,[ebp-364]
	jle	label000f
	mov	dword181,[ebp-348]
	add	dword181,4
	mov	dword184,[ebp-364]
	sub	dword184,[dword181]
	mov	dword186,[ebp-344]
	mov	dword188,[ebp-348]
	mov	dword189,[dword186]
	sub	dword189,[dword188]
	imul	dword184,dword189
	mov	dword191,[ebp-344]
	add	dword191,4
	mov	dword194,[ebp-348]
	add	dword194,4
	mov	dword196,[dword191]
	sub	dword196,[dword194]
	cdq	dword197
	idiv	dword184,dword196
	mov	dword199,[ebp-348]
	add	dword184,[dword199]
	mov	[ebp-356],dword184
	mov	dword202,[ebp-348]
	add	dword202,4
	mov	dword205,[ebp-364]
	sub	dword205,[dword202]
	mov	dword207,[ebp-340]
	mov	dword209,[ebp-348]
	mov	dword210,[dword207]
	sub	dword210,[dword209]
	imul	dword205,dword210
	mov	dword212,[ebp-340]
	add	dword212,4
	mov	dword215,[ebp-348]
	add	dword215,4
	mov	dword217,[dword212]
	sub	dword217,[dword215]
	cdq	dword218
	idiv	dword205,dword217
	mov	dword220,[ebp-348]
	add	dword205,[dword220]
	mov	[ebp-360],dword205
	mov	dword223,[ebp-348]
	add	dword223,4
	mov	dword226,[ebp-364]
	sub	dword226,[dword223]
	int2float	dword226
	mov	dword228,[ebp-344]
	mov	dword230,[ebp-348]
	fld	dword ptr [dword228+8]
	fsub	dword ptr [dword230+8]
	fmulp
	mov	dword232,[ebp-344]
	add	dword232,4
	mov	dword235,[ebp-348]
	add	dword235,4
	mov	dword237,[dword232]
	sub	dword237,[dword235]
	int2float	dword237
	fdivp
	mov	dword239,[ebp-348]
	fadd	dword ptr [dword239+8]
	fstp	dword ptr [ebp-368]
	mov	dword242,[ebp-348]
	add	dword242,4
	mov	dword245,[ebp-364]
	sub	dword245,[dword242]
	int2float	dword245
	mov	dword247,[ebp-340]
	mov	dword249,[ebp-348]
	fld	dword ptr [dword247+8]
	fsub	dword ptr [dword249+8]
	fmulp
	mov	dword251,[ebp-340]
	add	dword251,4
	mov	dword254,[ebp-348]
	add	dword254,4
	mov	dword256,[dword251]
	sub	dword256,[dword254]
	int2float	dword256
	fdivp
	mov	dword258,[ebp-348]
	fadd	dword ptr [dword258+8]
	fstp	dword ptr [ebp-376]
	mov	dword261,[ebp-348]
	add	dword261,4
	mov	dword264,[ebp-364]
	sub	dword264,[dword261]
	int2float	dword264
	mov	dword266,8
	add	dword266,[ebp-344]
	add	dword266,4
	mov	dword269,8
	add	dword269,[ebp-348]
	add	dword269,4
	fld	dword ptr [dword266]
	fsub	dword ptr [dword269]
	fmulp
	mov	dword272,[ebp-344]
	add	dword272,4
	mov	dword275,[ebp-348]
	add	dword275,4
	mov	dword277,[dword272]
	sub	dword277,[dword275]
	int2float	dword277
	fdivp
	mov	dword279,8
	add	dword279,[ebp-348]
	add	dword279,4
	fadd	dword ptr [dword279]
	fstp	dword ptr [ebp-372]
	mov	dword283,[ebp-348]
	add	dword283,4
	mov	dword286,[ebp-364]
	sub	dword286,[dword283]
	int2float	dword286
	mov	dword288,8
	add	dword288,[ebp-340]
	add	dword288,4
	mov	dword291,8
	add	dword291,[ebp-348]
	add	dword291,4
	fld	dword ptr [dword288]
	fsub	dword ptr [dword291]
	fmulp
	mov	dword294,[ebp-340]
	add	dword294,4
	mov	dword297,[ebp-348]
	add	dword297,4
	mov	dword299,[dword294]
	sub	dword299,[dword297]
	int2float	dword299
	fdivp
	mov	dword301,8
	add	dword301,[ebp-348]
	add	dword301,4
	fadd	dword ptr [dword301]
	fstp	dword ptr [ebp-380]
	mov	dword306,[ebp-360]
	sub	dword306,[ebp-356]
	int2float	dword306
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	dword312,[ebp-360]
	sub	dword312,[ebp-356]
	int2float	dword312
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	mov	dword590,[ebp-388]
	mov	[ebp-392],dword590
	mov	dword589,[ebp-384]
	mov	[ebp-396],dword589
	mov	dword588,[ebp-380]
	mov	[ebp-400],dword588
	mov	dword587,[ebp-376]
	mov	[ebp-404],dword587
	mov	dword586,[ebp-372]
	mov	[ebp-408],dword586
	mov	dword585,[ebp-368]
	mov	[ebp-412],dword585
	mov	dword584,[ebp-364]
	mov	[ebp-416],dword584
	mov	dword583,[ebp-360]
	mov	[ebp-420],dword583
	mov	dword582,[ebp-356]
	mov	[ebp-424],dword582
; start of inline function _rasterize_horiz_line__unordered
	mov	dword594,[ebp-424]
	cmp	dword594,[ebp-420]
	jg	label0013
	mov	dword615,[ebp-392]
	mov	[ebp-428],dword615
	mov	dword614,[ebp-396]
	mov	[ebp-432],dword614
	mov	dword613,[ebp-408]
	mov	[ebp-436],dword613
	mov	dword612,[ebp-412]
	mov	[ebp-440],dword612
	mov	dword611,[ebp-416]
	mov	[ebp-444],dword611
	mov	dword610,[ebp-420]
	mov	[ebp-448],dword610
	mov	dword609,[ebp-424]
	mov	[ebp-452],dword609
; start of inline function _rasterize_horiz_line
	mov	dword619,dword ptr [__pitch]
	imul	dword619,[ebp-444]
	add	dword619,dword ptr [__videomem]
	sal	dword ptr [ebp-452],2
	add	dword619,[ebp-452]
	mov	[ebp-456],dword619
	sal	dword ptr [ebp-448],2
	mov	dword627,[ebp-456]
	add	dword627,[ebp-448]
	sal	dword ptr [ebp-452],2
	sub	dword627,[ebp-452]
	mov	[ebp-460],dword627
label0015:
	mov	dword695,[ebp-436]
	mov	[ebp-500],dword695
	mov	dword694,[ebp-440]
	mov	[ebp-504],dword694
; start of inline function _tex2d
	mov	dword699,dword ptr [__texture_width]
	dec	dword699
	int2float	dword699
	fmul	dword ptr [ebp-504]
	float2int	dword701
	mov	[ebp-508],dword701
	mov	dword705,dword ptr [__texture_height]
	dec	dword705
	int2float	dword705
	fmul	dword ptr [ebp-500]
	float2int	dword707
	mov	[ebp-512],dword707
	mov	dword711,[ebp-512]
	imul	dword711,dword ptr [__texture_width]
	add	dword711,[ebp-508]
	sal	dword711,2
	add	dword711,dword ptr [__texture_data]
	mov	dword715,[dword711]
	mov	[ebp-516],dword715
label0019:
; end of inline function _tex2d
	mov	dword633,[ebp-516]
	mov	[ebp-464],dword633
	sar	dword ptr [ebp-464],24
	mov	dword638,[ebp-464]
	and	dword638,-289
	mov	[ebp-492],dword638
	cmp	dword ptr [ebp-492],0
	je	label0018
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword645,[ebp-456]
	mov	dword647,[dword645]
	mov	[ebp-480],dword647
	mov	dword650,[ebp-480]
	and	dword650,-73984
	sar	dword650,8
	mov	[ebp-484],dword650
	mov	dword655,[ebp-480]
	and	dword655,-289
	mov	[ebp-488],dword655
	mov	dword659,[ebp-464]
	and	dword659,-73984
	sar	dword659,8
	mov	[ebp-472],dword659
	mov	dword664,[ebp-464]
	and	dword664,-289
	mov	[ebp-476],dword664
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword670
	mov	[ebp-472],dword670
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword676
	mov	[ebp-476],dword676
	sal	dword ptr [ebp-472],8
	mov	dword681,[ebp-472]
	add	dword681,[ebp-476]
	mov	[ebp-468],dword681
	mov	dword684,[ebp-456]
	mov	dword686,[ebp-468]
	mov	[dword684],dword686
label0018:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0016:
	add	dword ptr [ebp-456],4
	mov	dword693,[ebp-456]
	cmp	dword693,[ebp-460]
	jl	label0015
label0017:
label001a:
; end of inline function _rasterize_horiz_line
	jmp	label0014
label0013:
	mov	dword722,[ebp-392]
	mov	[ebp-428],dword722
	mov	dword721,[ebp-396]
	mov	[ebp-432],dword721
	mov	dword720,[ebp-400]
	mov	[ebp-436],dword720
	mov	dword719,[ebp-404]
	mov	[ebp-440],dword719
	mov	dword718,[ebp-416]
	mov	[ebp-444],dword718
	mov	dword717,[ebp-424]
	mov	[ebp-448],dword717
	mov	dword716,[ebp-420]
	mov	[ebp-452],dword716
; start of inline function _rasterize_horiz_line
	mov	dword726,dword ptr [__pitch]
	imul	dword726,[ebp-444]
	add	dword726,dword ptr [__videomem]
	sal	dword ptr [ebp-452],2
	add	dword726,[ebp-452]
	mov	[ebp-456],dword726
	sal	dword ptr [ebp-448],2
	mov	dword734,[ebp-456]
	add	dword734,[ebp-448]
	sal	dword ptr [ebp-452],2
	sub	dword734,[ebp-452]
	mov	[ebp-460],dword734
label001b:
	mov	dword802,[ebp-436]
	mov	[ebp-500],dword802
	mov	dword801,[ebp-440]
	mov	[ebp-504],dword801
; start of inline function _tex2d
	mov	dword806,dword ptr [__texture_width]
	dec	dword806
	int2float	dword806
	fmul	dword ptr [ebp-504]
	float2int	dword808
	mov	[ebp-508],dword808
	mov	dword812,dword ptr [__texture_height]
	dec	dword812
	int2float	dword812
	fmul	dword ptr [ebp-500]
	float2int	dword814
	mov	[ebp-512],dword814
	mov	dword818,[ebp-512]
	imul	dword818,dword ptr [__texture_width]
	add	dword818,[ebp-508]
	sal	dword818,2
	add	dword818,dword ptr [__texture_data]
	mov	dword822,[dword818]
	mov	[ebp-516],dword822
label001f:
; end of inline function _tex2d
	mov	dword740,[ebp-516]
	mov	[ebp-464],dword740
	sar	dword ptr [ebp-464],24
	mov	dword745,[ebp-464]
	and	dword745,-289
	mov	[ebp-492],dword745
	cmp	dword ptr [ebp-492],0
	je	label001e
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword752,[ebp-456]
	mov	dword754,[dword752]
	mov	[ebp-480],dword754
	mov	dword757,[ebp-480]
	and	dword757,-73984
	sar	dword757,8
	mov	[ebp-484],dword757
	mov	dword762,[ebp-480]
	and	dword762,-289
	mov	[ebp-488],dword762
	mov	dword766,[ebp-464]
	and	dword766,-73984
	sar	dword766,8
	mov	[ebp-472],dword766
	mov	dword771,[ebp-464]
	and	dword771,-289
	mov	[ebp-476],dword771
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword777
	mov	[ebp-472],dword777
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword783
	mov	[ebp-476],dword783
	sal	dword ptr [ebp-472],8
	mov	dword788,[ebp-472]
	add	dword788,[ebp-476]
	mov	[ebp-468],dword788
	mov	dword791,[ebp-456]
	mov	dword793,[ebp-468]
	mov	[dword791],dword793
label001e:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label001c:
	add	dword ptr [ebp-456],4
	mov	dword800,[ebp-456]
	cmp	dword800,[ebp-460]
	jl	label001b
label001d:
label0020:
; end of inline function _rasterize_horiz_line
label0014:
label0021:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-364]
	jmp	label000e
label000f:
	mov	dword327,[ebp-344]
	add	dword327,4
	mov	dword330,[ebp-348]
	add	dword330,4
	mov	dword332,[dword327]
	sub	dword332,[dword330]
	mov	dword334,[ebp-340]
	mov	dword336,[ebp-348]
	mov	dword337,[dword334]
	sub	dword337,[dword336]
	imul	dword332,dword337
	mov	dword339,[ebp-340]
	add	dword339,4
	mov	dword342,[ebp-348]
	add	dword342,4
	mov	dword344,[dword339]
	sub	dword344,[dword342]
	cdq	dword345
	idiv	dword332,dword344
	mov	dword347,[ebp-348]
	add	dword332,[dword347]
	mov	[ebp-360],dword332
	mov	dword350,[ebp-344]
	add	dword350,4
	mov	dword353,[ebp-348]
	add	dword353,4
	mov	dword355,[dword350]
	sub	dword355,[dword353]
	int2float	dword355
	mov	dword357,[ebp-340]
	mov	dword359,[ebp-348]
	fld	dword ptr [dword357+8]
	fsub	dword ptr [dword359+8]
	fmulp
	mov	dword361,[ebp-340]
	add	dword361,4
	mov	dword364,[ebp-348]
	add	dword364,4
	mov	dword366,[dword361]
	sub	dword366,[dword364]
	int2float	dword366
	fdivp
	mov	dword368,[ebp-348]
	fadd	dword ptr [dword368+8]
	fstp	dword ptr [ebp-376]
	mov	dword371,[ebp-344]
	add	dword371,4
	mov	dword374,[ebp-348]
	add	dword374,4
	mov	dword376,[dword371]
	sub	dword376,[dword374]
	int2float	dword376
	mov	dword378,8
	add	dword378,[ebp-340]
	add	dword378,4
	mov	dword381,8
	add	dword381,[ebp-348]
	add	dword381,4
	fld	dword ptr [dword378]
	fsub	dword ptr [dword381]
	fmulp
	mov	dword384,[ebp-340]
	add	dword384,4
	mov	dword387,[ebp-348]
	add	dword387,4
	mov	dword389,[dword384]
	sub	dword389,[dword387]
	int2float	dword389
	fdivp
	mov	dword391,8
	add	dword391,[ebp-348]
	add	dword391,4
	fadd	dword ptr [dword391]
	fstp	dword ptr [ebp-380]
	mov	dword395,[ebp-344]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [dword395+8]
	mov	dword398,[ebp-344]
	mov	dword400,[ebp-360]
	sub	dword400,[dword398]
	int2float	dword400
	fdivp
	fstp	dword ptr [ebp-384]
	mov	dword403,8
	add	dword403,[ebp-344]
	add	dword403,4
	fld	dword ptr [ebp-380]
	fsub	dword ptr [dword403]
	mov	dword407,[ebp-344]
	mov	dword409,[ebp-360]
	sub	dword409,[dword407]
	int2float	dword409
	fdivp
	fstp	dword ptr [ebp-388]
	mov	dword831,[ebp-388]
	mov	[ebp-392],dword831
	mov	dword830,[ebp-384]
	mov	[ebp-396],dword830
	mov	dword414,8
	add	dword414,[ebp-344]
	add	dword414,4
	mov	dword829,[dword414]
	mov	[ebp-400],dword829
	mov	dword417,[ebp-344]
	mov	dword828,[dword417+8]
	mov	[ebp-404],dword828
	mov	dword827,[ebp-380]
	mov	[ebp-408],dword827
	mov	dword826,[ebp-376]
	mov	[ebp-412],dword826
	mov	dword421,[ebp-344]
	add	dword421,4
	mov	dword825,[dword421]
	mov	[ebp-416],dword825
	mov	dword424,[ebp-344]
	mov	dword824,[dword424]
	mov	[ebp-420],dword824
	mov	dword823,[ebp-360]
	mov	[ebp-424],dword823
; start of inline function _rasterize_horiz_line__unordered
	mov	dword835,[ebp-424]
	cmp	dword835,[ebp-420]
	jg	label0022
	mov	dword856,[ebp-392]
	mov	[ebp-428],dword856
	mov	dword855,[ebp-396]
	mov	[ebp-432],dword855
	mov	dword854,[ebp-408]
	mov	[ebp-436],dword854
	mov	dword853,[ebp-412]
	mov	[ebp-440],dword853
	mov	dword852,[ebp-416]
	mov	[ebp-444],dword852
	mov	dword851,[ebp-420]
	mov	[ebp-448],dword851
	mov	dword850,[ebp-424]
	mov	[ebp-452],dword850
; start of inline function _rasterize_horiz_line
	mov	dword860,dword ptr [__pitch]
	imul	dword860,[ebp-444]
	add	dword860,dword ptr [__videomem]
	sal	dword ptr [ebp-452],2
	add	dword860,[ebp-452]
	mov	[ebp-456],dword860
	sal	dword ptr [ebp-448],2
	mov	dword868,[ebp-456]
	add	dword868,[ebp-448]
	sal	dword ptr [ebp-452],2
	sub	dword868,[ebp-452]
	mov	[ebp-460],dword868
label0024:
	mov	dword936,[ebp-436]
	mov	[ebp-500],dword936
	mov	dword935,[ebp-440]
	mov	[ebp-504],dword935
; start of inline function _tex2d
	mov	dword940,dword ptr [__texture_width]
	dec	dword940
	int2float	dword940
	fmul	dword ptr [ebp-504]
	float2int	dword942
	mov	[ebp-508],dword942
	mov	dword946,dword ptr [__texture_height]
	dec	dword946
	int2float	dword946
	fmul	dword ptr [ebp-500]
	float2int	dword948
	mov	[ebp-512],dword948
	mov	dword952,[ebp-512]
	imul	dword952,dword ptr [__texture_width]
	add	dword952,[ebp-508]
	sal	dword952,2
	add	dword952,dword ptr [__texture_data]
	mov	dword956,[dword952]
	mov	[ebp-516],dword956
label0028:
; end of inline function _tex2d
	mov	dword874,[ebp-516]
	mov	[ebp-464],dword874
	sar	dword ptr [ebp-464],24
	mov	dword879,[ebp-464]
	and	dword879,-289
	mov	[ebp-492],dword879
	cmp	dword ptr [ebp-492],0
	je	label0027
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword886,[ebp-456]
	mov	dword888,[dword886]
	mov	[ebp-480],dword888
	mov	dword891,[ebp-480]
	and	dword891,-73984
	sar	dword891,8
	mov	[ebp-484],dword891
	mov	dword896,[ebp-480]
	and	dword896,-289
	mov	[ebp-488],dword896
	mov	dword900,[ebp-464]
	and	dword900,-73984
	sar	dword900,8
	mov	[ebp-472],dword900
	mov	dword905,[ebp-464]
	and	dword905,-289
	mov	[ebp-476],dword905
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword911
	mov	[ebp-472],dword911
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword917
	mov	[ebp-476],dword917
	sal	dword ptr [ebp-472],8
	mov	dword922,[ebp-472]
	add	dword922,[ebp-476]
	mov	[ebp-468],dword922
	mov	dword925,[ebp-456]
	mov	dword927,[ebp-468]
	mov	[dword925],dword927
label0027:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0025:
	add	dword ptr [ebp-456],4
	mov	dword934,[ebp-456]
	cmp	dword934,[ebp-460]
	jl	label0024
label0026:
label0029:
; end of inline function _rasterize_horiz_line
	jmp	label0023
label0022:
	mov	dword963,[ebp-392]
	mov	[ebp-428],dword963
	mov	dword962,[ebp-396]
	mov	[ebp-432],dword962
	mov	dword961,[ebp-400]
	mov	[ebp-436],dword961
	mov	dword960,[ebp-404]
	mov	[ebp-440],dword960
	mov	dword959,[ebp-416]
	mov	[ebp-444],dword959
	mov	dword958,[ebp-424]
	mov	[ebp-448],dword958
	mov	dword957,[ebp-420]
	mov	[ebp-452],dword957
; start of inline function _rasterize_horiz_line
	mov	dword967,dword ptr [__pitch]
	imul	dword967,[ebp-444]
	add	dword967,dword ptr [__videomem]
	sal	dword ptr [ebp-452],2
	add	dword967,[ebp-452]
	mov	[ebp-456],dword967
	sal	dword ptr [ebp-448],2
	mov	dword975,[ebp-456]
	add	dword975,[ebp-448]
	sal	dword ptr [ebp-452],2
	sub	dword975,[ebp-452]
	mov	[ebp-460],dword975
label002a:
	mov	dword1043,[ebp-436]
	mov	[ebp-500],dword1043
	mov	dword1042,[ebp-440]
	mov	[ebp-504],dword1042
; start of inline function _tex2d
	mov	dword1047,dword ptr [__texture_width]
	dec	dword1047
	int2float	dword1047
	fmul	dword ptr [ebp-504]
	float2int	dword1049
	mov	[ebp-508],dword1049
	mov	dword1053,dword ptr [__texture_height]
	dec	dword1053
	int2float	dword1053
	fmul	dword ptr [ebp-500]
	float2int	dword1055
	mov	[ebp-512],dword1055
	mov	dword1059,[ebp-512]
	imul	dword1059,dword ptr [__texture_width]
	add	dword1059,[ebp-508]
	sal	dword1059,2
	add	dword1059,dword ptr [__texture_data]
	mov	dword1063,[dword1059]
	mov	[ebp-516],dword1063
label002e:
; end of inline function _tex2d
	mov	dword981,[ebp-516]
	mov	[ebp-464],dword981
	sar	dword ptr [ebp-464],24
	mov	dword986,[ebp-464]
	and	dword986,-289
	mov	[ebp-492],dword986
	cmp	dword ptr [ebp-492],0
	je	label002d
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword993,[ebp-456]
	mov	dword995,[dword993]
	mov	[ebp-480],dword995
	mov	dword998,[ebp-480]
	and	dword998,-73984
	sar	dword998,8
	mov	[ebp-484],dword998
	mov	dword1003,[ebp-480]
	and	dword1003,-289
	mov	[ebp-488],dword1003
	mov	dword1007,[ebp-464]
	and	dword1007,-73984
	sar	dword1007,8
	mov	[ebp-472],dword1007
	mov	dword1012,[ebp-464]
	and	dword1012,-289
	mov	[ebp-476],dword1012
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1018
	mov	[ebp-472],dword1018
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1024
	mov	[ebp-476],dword1024
	sal	dword ptr [ebp-472],8
	mov	dword1029,[ebp-472]
	add	dword1029,[ebp-476]
	mov	[ebp-468],dword1029
	mov	dword1032,[ebp-456]
	mov	dword1034,[ebp-468]
	mov	[dword1032],dword1034
label002d:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label002b:
	add	dword ptr [ebp-456],4
	mov	dword1041,[ebp-456]
	cmp	dword1041,[ebp-460]
	jl	label002a
label002c:
label002f:
; end of inline function _rasterize_horiz_line
label0023:
label0030:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword427,[ebp-344]
	add	dword427,4
	mov	dword429,1
	add	dword429,[dword427]
	mov	[ebp-364],dword429
label0010:
label0011:
	mov	dword432,[ebp-340]
	add	dword432,4
	mov	dword435,[dword432]
	cmp	dword435,[ebp-364]
	jle	label0012
	mov	dword437,[ebp-344]
	add	dword437,4
	mov	dword440,[ebp-364]
	sub	dword440,[dword437]
	mov	dword442,[ebp-340]
	mov	dword444,[ebp-344]
	mov	dword445,[dword442]
	sub	dword445,[dword444]
	imul	dword440,dword445
	mov	dword447,[ebp-340]
	add	dword447,4
	mov	dword450,[ebp-344]
	add	dword450,4
	mov	dword452,[dword447]
	sub	dword452,[dword450]
	cdq	dword453
	idiv	dword440,dword452
	mov	dword455,[ebp-344]
	add	dword440,[dword455]
	mov	[ebp-356],dword440
	mov	dword458,[ebp-348]
	add	dword458,4
	mov	dword461,[ebp-364]
	sub	dword461,[dword458]
	mov	dword463,[ebp-340]
	mov	dword465,[ebp-348]
	mov	dword466,[dword463]
	sub	dword466,[dword465]
	imul	dword461,dword466
	mov	dword468,[ebp-340]
	add	dword468,4
	mov	dword471,[ebp-348]
	add	dword471,4
	mov	dword473,[dword468]
	sub	dword473,[dword471]
	cdq	dword474
	idiv	dword461,dword473
	mov	dword476,[ebp-348]
	add	dword461,[dword476]
	mov	[ebp-360],dword461
	mov	dword479,[ebp-344]
	add	dword479,4
	mov	dword482,[ebp-364]
	sub	dword482,[dword479]
	int2float	dword482
	mov	dword484,[ebp-340]
	mov	dword486,[ebp-344]
	fld	dword ptr [dword484+8]
	fsub	dword ptr [dword486+8]
	fmulp
	mov	dword488,[ebp-340]
	add	dword488,4
	mov	dword491,[ebp-344]
	add	dword491,4
	mov	dword493,[dword488]
	sub	dword493,[dword491]
	int2float	dword493
	fdivp
	mov	dword495,[ebp-344]
	fadd	dword ptr [dword495+8]
	fstp	dword ptr [ebp-368]
	mov	dword498,[ebp-348]
	add	dword498,4
	mov	dword501,[ebp-364]
	sub	dword501,[dword498]
	int2float	dword501
	mov	dword503,[ebp-340]
	mov	dword505,[ebp-348]
	fld	dword ptr [dword503+8]
	fsub	dword ptr [dword505+8]
	fmulp
	mov	dword507,[ebp-340]
	add	dword507,4
	mov	dword510,[ebp-348]
	add	dword510,4
	mov	dword512,[dword507]
	sub	dword512,[dword510]
	int2float	dword512
	fdivp
	mov	dword514,[ebp-348]
	fadd	dword ptr [dword514+8]
	fstp	dword ptr [ebp-376]
	mov	dword517,[ebp-344]
	add	dword517,4
	mov	dword520,[ebp-364]
	sub	dword520,[dword517]
	int2float	dword520
	mov	dword522,8
	add	dword522,[ebp-340]
	add	dword522,4
	mov	dword525,8
	add	dword525,[ebp-344]
	add	dword525,4
	fld	dword ptr [dword522]
	fsub	dword ptr [dword525]
	fmulp
	mov	dword528,[ebp-340]
	add	dword528,4
	mov	dword531,[ebp-344]
	add	dword531,4
	mov	dword533,[dword528]
	sub	dword533,[dword531]
	int2float	dword533
	fdivp
	mov	dword535,8
	add	dword535,[ebp-344]
	add	dword535,4
	fadd	dword ptr [dword535]
	fstp	dword ptr [ebp-372]
	mov	dword539,[ebp-348]
	add	dword539,4
	mov	dword542,[ebp-364]
	sub	dword542,[dword539]
	int2float	dword542
	mov	dword544,8
	add	dword544,[ebp-340]
	add	dword544,4
	mov	dword547,8
	add	dword547,[ebp-348]
	add	dword547,4
	fld	dword ptr [dword544]
	fsub	dword ptr [dword547]
	fmulp
	mov	dword550,[ebp-340]
	add	dword550,4
	mov	dword553,[ebp-348]
	add	dword553,4
	mov	dword555,[dword550]
	sub	dword555,[dword553]
	int2float	dword555
	fdivp
	mov	dword557,8
	add	dword557,[ebp-348]
	add	dword557,4
	fadd	dword ptr [dword557]
	fstp	dword ptr [ebp-380]
	mov	dword562,[ebp-360]
	sub	dword562,[ebp-356]
	int2float	dword562
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	dword568,[ebp-360]
	sub	dword568,[ebp-356]
	int2float	dword568
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	mov	dword1072,[ebp-388]
	mov	[ebp-392],dword1072
	mov	dword1071,[ebp-384]
	mov	[ebp-396],dword1071
	mov	dword1070,[ebp-380]
	mov	[ebp-400],dword1070
	mov	dword1069,[ebp-376]
	mov	[ebp-404],dword1069
	mov	dword1068,[ebp-372]
	mov	[ebp-408],dword1068
	mov	dword1067,[ebp-368]
	mov	[ebp-412],dword1067
	mov	dword1066,[ebp-364]
	mov	[ebp-416],dword1066
	mov	dword1065,[ebp-360]
	mov	[ebp-420],dword1065
	mov	dword1064,[ebp-356]
	mov	[ebp-424],dword1064
; start of inline function _rasterize_horiz_line__unordered
	mov	dword1076,[ebp-424]
	cmp	dword1076,[ebp-420]
	jg	label0031
	mov	dword1097,[ebp-392]
	mov	[ebp-428],dword1097
	mov	dword1096,[ebp-396]
	mov	[ebp-432],dword1096
	mov	dword1095,[ebp-408]
	mov	[ebp-436],dword1095
	mov	dword1094,[ebp-412]
	mov	[ebp-440],dword1094
	mov	dword1093,[ebp-416]
	mov	[ebp-444],dword1093
	mov	dword1092,[ebp-420]
	mov	[ebp-448],dword1092
	mov	dword1091,[ebp-424]
	mov	[ebp-452],dword1091
; start of inline function _rasterize_horiz_line
	mov	dword1101,dword ptr [__pitch]
	imul	dword1101,[ebp-444]
	add	dword1101,dword ptr [__videomem]
	sal	dword ptr [ebp-452],2
	add	dword1101,[ebp-452]
	mov	[ebp-456],dword1101
	sal	dword ptr [ebp-448],2
	mov	dword1109,[ebp-456]
	add	dword1109,[ebp-448]
	sal	dword ptr [ebp-452],2
	sub	dword1109,[ebp-452]
	mov	[ebp-460],dword1109
label0033:
	mov	dword1177,[ebp-436]
	mov	[ebp-500],dword1177
	mov	dword1176,[ebp-440]
	mov	[ebp-504],dword1176
; start of inline function _tex2d
	mov	dword1181,dword ptr [__texture_width]
	dec	dword1181
	int2float	dword1181
	fmul	dword ptr [ebp-504]
	float2int	dword1183
	mov	[ebp-508],dword1183
	mov	dword1187,dword ptr [__texture_height]
	dec	dword1187
	int2float	dword1187
	fmul	dword ptr [ebp-500]
	float2int	dword1189
	mov	[ebp-512],dword1189
	mov	dword1193,[ebp-512]
	imul	dword1193,dword ptr [__texture_width]
	add	dword1193,[ebp-508]
	sal	dword1193,2
	add	dword1193,dword ptr [__texture_data]
	mov	dword1197,[dword1193]
	mov	[ebp-516],dword1197
label0037:
; end of inline function _tex2d
	mov	dword1115,[ebp-516]
	mov	[ebp-464],dword1115
	sar	dword ptr [ebp-464],24
	mov	dword1120,[ebp-464]
	and	dword1120,-289
	mov	[ebp-492],dword1120
	cmp	dword ptr [ebp-492],0
	je	label0036
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword1127,[ebp-456]
	mov	dword1129,[dword1127]
	mov	[ebp-480],dword1129
	mov	dword1132,[ebp-480]
	and	dword1132,-73984
	sar	dword1132,8
	mov	[ebp-484],dword1132
	mov	dword1137,[ebp-480]
	and	dword1137,-289
	mov	[ebp-488],dword1137
	mov	dword1141,[ebp-464]
	and	dword1141,-73984
	sar	dword1141,8
	mov	[ebp-472],dword1141
	mov	dword1146,[ebp-464]
	and	dword1146,-289
	mov	[ebp-476],dword1146
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1152
	mov	[ebp-472],dword1152
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1158
	mov	[ebp-476],dword1158
	sal	dword ptr [ebp-472],8
	mov	dword1163,[ebp-472]
	add	dword1163,[ebp-476]
	mov	[ebp-468],dword1163
	mov	dword1166,[ebp-456]
	mov	dword1168,[ebp-468]
	mov	[dword1166],dword1168
label0036:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0034:
	add	dword ptr [ebp-456],4
	mov	dword1175,[ebp-456]
	cmp	dword1175,[ebp-460]
	jl	label0033
label0035:
label0038:
; end of inline function _rasterize_horiz_line
	jmp	label0032
label0031:
	mov	dword1204,[ebp-392]
	mov	[ebp-428],dword1204
	mov	dword1203,[ebp-396]
	mov	[ebp-432],dword1203
	mov	dword1202,[ebp-400]
	mov	[ebp-436],dword1202
	mov	dword1201,[ebp-404]
	mov	[ebp-440],dword1201
	mov	dword1200,[ebp-416]
	mov	[ebp-444],dword1200
	mov	dword1199,[ebp-424]
	mov	[ebp-448],dword1199
	mov	dword1198,[ebp-420]
	mov	[ebp-452],dword1198
; start of inline function _rasterize_horiz_line
	mov	dword1208,dword ptr [__pitch]
	imul	dword1208,[ebp-444]
	add	dword1208,dword ptr [__videomem]
	sal	dword ptr [ebp-452],2
	add	dword1208,[ebp-452]
	mov	[ebp-456],dword1208
	sal	dword ptr [ebp-448],2
	mov	dword1216,[ebp-456]
	add	dword1216,[ebp-448]
	sal	dword ptr [ebp-452],2
	sub	dword1216,[ebp-452]
	mov	[ebp-460],dword1216
label0039:
	mov	dword1284,[ebp-436]
	mov	[ebp-500],dword1284
	mov	dword1283,[ebp-440]
	mov	[ebp-504],dword1283
; start of inline function _tex2d
	mov	dword1288,dword ptr [__texture_width]
	dec	dword1288
	int2float	dword1288
	fmul	dword ptr [ebp-504]
	float2int	dword1290
	mov	[ebp-508],dword1290
	mov	dword1294,dword ptr [__texture_height]
	dec	dword1294
	int2float	dword1294
	fmul	dword ptr [ebp-500]
	float2int	dword1296
	mov	[ebp-512],dword1296
	mov	dword1300,[ebp-512]
	imul	dword1300,dword ptr [__texture_width]
	add	dword1300,[ebp-508]
	sal	dword1300,2
	add	dword1300,dword ptr [__texture_data]
	mov	dword1304,[dword1300]
	mov	[ebp-516],dword1304
label003d:
; end of inline function _tex2d
	mov	dword1222,[ebp-516]
	mov	[ebp-464],dword1222
	sar	dword ptr [ebp-464],24
	mov	dword1227,[ebp-464]
	and	dword1227,-289
	mov	[ebp-492],dword1227
	cmp	dword ptr [ebp-492],0
	je	label003c
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword1234,[ebp-456]
	mov	dword1236,[dword1234]
	mov	[ebp-480],dword1236
	mov	dword1239,[ebp-480]
	and	dword1239,-73984
	sar	dword1239,8
	mov	[ebp-484],dword1239
	mov	dword1244,[ebp-480]
	and	dword1244,-289
	mov	[ebp-488],dword1244
	mov	dword1248,[ebp-464]
	and	dword1248,-73984
	sar	dword1248,8
	mov	[ebp-472],dword1248
	mov	dword1253,[ebp-464]
	and	dword1253,-289
	mov	[ebp-476],dword1253
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1259
	mov	[ebp-472],dword1259
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1265
	mov	[ebp-476],dword1265
	sal	dword ptr [ebp-472],8
	mov	dword1270,[ebp-472]
	add	dword1270,[ebp-476]
	mov	[ebp-468],dword1270
	mov	dword1273,[ebp-456]
	mov	dword1275,[ebp-468]
	mov	[dword1273],dword1275
label003c:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label003a:
	add	dword ptr [ebp-456],4
	mov	dword1282,[ebp-456]
	cmp	dword1282,[ebp-460]
	jl	label0039
label003b:
label003e:
; end of inline function _rasterize_horiz_line
label0032:
label003f:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-364]
	jmp	label0011
label0012:
label006f:
; end of inline function _rasterize_triangle_2i
	inc	dword ptr [ebp-336]
	jmp	label0006
label0007:
label00f3:
; end of inline function _rasterize_polygon_4f
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
