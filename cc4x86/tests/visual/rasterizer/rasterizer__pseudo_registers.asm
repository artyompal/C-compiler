
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
	mov	dword108,[ebp+8]
	mov	dword103,dword ptr [__pitch]
	imul	dword103,[ebp+16]
	add	dword103,dword ptr [__videomem]
	mov	dword7,dword108
	sal	dword7,2
	add	dword103,dword7
	mov	dword106,[ebp+12]
	sal	dword106,2
	add	dword106,dword103
	mov	dword15,dword108
	sal	dword15,2
	sub	dword106,dword15
label0000:
	mov	dword81,[ebp+24]
	mov	[ebp-48],dword81
	mov	dword80,[ebp+20]
	mov	[ebp-52],dword80
; start of inline function _tex2d
	mov	dword85,dword ptr [__texture_width]
	dec	dword85
	int2float	dword85
	fmul	dword ptr [ebp-52]
	float2int	dword87
	mov	[ebp-56],dword87
	mov	dword91,dword ptr [__texture_height]
	dec	dword91
	int2float	dword91
	fmul	dword ptr [ebp-48]
	float2int	dword93
	mov	[ebp-60],dword93
	mov	dword97,[ebp-60]
	imul	dword97,dword ptr [__texture_width]
	add	dword97,[ebp-56]
	sal	dword97,2
	add	dword97,dword ptr [__texture_data]
	mov	dword101,[dword97]
	mov	[ebp-64],dword101
label0004:
; end of inline function _tex2d
	mov	dword104,[ebp-64]
	mov	dword23,dword104
	sar	dword23,24
	and	dword23,255
	mov	[ebp-40],dword23
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	dword105,[dword103]
	mov	dword36,dword105
	and	dword36,65280
	sar	dword36,8
	mov	[ebp-32],dword36
	mov	dword41,dword105
	and	dword41,255
	mov	[ebp-36],dword41
	mov	dword45,dword104
	and	dword45,65280
	sar	dword45,8
	mov	[ebp-20],dword45
	mov	dword50,dword104
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
	mov	dword107,[ebp-20]
	sal	dword107,8
	add	dword107,[ebp-24]
	mov	[dword103],dword107
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	dword103,4
	cmp	dword103,dword106
	jl	label0000
label0002:
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	create_stack_frame
	mov	dword239,[ebp+16]
	mov	dword238,[ebp+12]
	mov	dword237,[ebp+8]
	cmp	dword237,dword238
	jg	label0000
	mov	dword24,[ebp+40]
	mov	[ebp-4],dword24
	mov	dword23,[ebp+36]
	mov	[ebp-8],dword23
	mov	dword22,[ebp+24]
	mov	[ebp-12],dword22
	mov	dword21,[ebp+20]
	mov	[ebp-16],dword21
	mov	[ebp-20],dword239
	mov	[ebp-24],dword238
	mov	[ebp-28],dword237
; start of inline function _rasterize_horiz_line
	mov	dword28,dword ptr [__pitch]
	imul	dword28,[ebp-20]
	add	dword28,dword ptr [__videomem]
	mov	dword32,[ebp-28]
	sal	dword32,2
	add	dword28,dword32
	mov	[ebp-32],dword28
	mov	dword36,[ebp-24]
	sal	dword36,2
	add	dword36,[ebp-32]
	mov	dword40,[ebp-28]
	sal	dword40,2
	sub	dword36,dword40
	mov	[ebp-36],dword36
label0002:
	mov	dword106,[ebp-12]
	mov	[ebp-76],dword106
	mov	dword105,[ebp-16]
	mov	[ebp-80],dword105
; start of inline function _tex2d
	mov	dword110,dword ptr [__texture_width]
	dec	dword110
	int2float	dword110
	fmul	dword ptr [ebp-80]
	float2int	dword112
	mov	[ebp-84],dword112
	mov	dword116,dword ptr [__texture_height]
	dec	dword116
	int2float	dword116
	fmul	dword ptr [ebp-76]
	float2int	dword118
	mov	[ebp-88],dword118
	mov	dword122,[ebp-88]
	imul	dword122,dword ptr [__texture_width]
	add	dword122,[ebp-84]
	sal	dword122,2
	add	dword122,dword ptr [__texture_data]
	mov	dword126,[dword122]
	mov	[ebp-92],dword126
label0006:
; end of inline function _tex2d
	mov	dword44,[ebp-92]
	mov	[ebp-40],dword44
	mov	dword48,[ebp-40]
	sar	dword48,24
	and	dword48,255
	mov	[ebp-68],dword48
	cmp	dword ptr [ebp-68],0
	je	label0005
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword56,[ebp-32]
	mov	dword58,[dword56]
	mov	[ebp-56],dword58
	mov	dword61,[ebp-56]
	and	dword61,65280
	sar	dword61,8
	mov	[ebp-60],dword61
	mov	dword66,[ebp-56]
	and	dword66,255
	mov	[ebp-64],dword66
	mov	dword70,[ebp-40]
	and	dword70,65280
	sar	dword70,8
	mov	[ebp-48],dword70
	mov	dword75,[ebp-40]
	and	dword75,255
	mov	[ebp-52],dword75
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword81
	mov	[ebp-48],dword81
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword87
	mov	[ebp-52],dword87
	mov	dword91,[ebp-48]
	sal	dword91,8
	add	dword91,[ebp-52]
	mov	[ebp-44],dword91
	mov	dword95,[ebp-32]
	mov	dword97,[ebp-44]
	mov	[dword95],dword97
label0005:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0003:
	add	dword ptr [ebp-32],4
	mov	dword104,[ebp-32]
	cmp	dword104,[ebp-36]
	jl	label0002
label0004:
label0007:
; end of inline function _rasterize_horiz_line
	jmp	label0001
label0000:
	mov	dword133,[ebp+40]
	mov	[ebp-4],dword133
	mov	dword132,[ebp+36]
	mov	[ebp-8],dword132
	mov	dword131,[ebp+32]
	mov	[ebp-12],dword131
	mov	dword130,[ebp+28]
	mov	[ebp-16],dword130
	mov	[ebp-20],dword239
	mov	[ebp-24],dword237
	mov	[ebp-28],dword238
; start of inline function _rasterize_horiz_line
	mov	dword137,dword ptr [__pitch]
	imul	dword137,[ebp-20]
	add	dword137,dword ptr [__videomem]
	mov	dword141,[ebp-28]
	sal	dword141,2
	add	dword137,dword141
	mov	[ebp-32],dword137
	mov	dword145,[ebp-24]
	sal	dword145,2
	add	dword145,[ebp-32]
	mov	dword149,[ebp-28]
	sal	dword149,2
	sub	dword145,dword149
	mov	[ebp-36],dword145
label0008:
	mov	dword215,[ebp-12]
	mov	[ebp-76],dword215
	mov	dword214,[ebp-16]
	mov	[ebp-80],dword214
; start of inline function _tex2d
	mov	dword219,dword ptr [__texture_width]
	dec	dword219
	int2float	dword219
	fmul	dword ptr [ebp-80]
	float2int	dword221
	mov	[ebp-84],dword221
	mov	dword225,dword ptr [__texture_height]
	dec	dword225
	int2float	dword225
	fmul	dword ptr [ebp-76]
	float2int	dword227
	mov	[ebp-88],dword227
	mov	dword231,[ebp-88]
	imul	dword231,dword ptr [__texture_width]
	add	dword231,[ebp-84]
	sal	dword231,2
	add	dword231,dword ptr [__texture_data]
	mov	dword235,[dword231]
	mov	[ebp-92],dword235
label000c:
; end of inline function _tex2d
	mov	dword153,[ebp-92]
	mov	[ebp-40],dword153
	mov	dword157,[ebp-40]
	sar	dword157,24
	and	dword157,255
	mov	[ebp-68],dword157
	cmp	dword ptr [ebp-68],0
	je	label000b
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword165,[ebp-32]
	mov	dword167,[dword165]
	mov	[ebp-56],dword167
	mov	dword170,[ebp-56]
	and	dword170,65280
	sar	dword170,8
	mov	[ebp-60],dword170
	mov	dword175,[ebp-56]
	and	dword175,255
	mov	[ebp-64],dword175
	mov	dword179,[ebp-40]
	and	dword179,65280
	sar	dword179,8
	mov	[ebp-48],dword179
	mov	dword184,[ebp-40]
	and	dword184,255
	mov	[ebp-52],dword184
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword190
	mov	[ebp-48],dword190
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword196
	mov	[ebp-52],dword196
	mov	dword200,[ebp-48]
	sal	dword200,8
	add	dword200,[ebp-52]
	mov	[ebp-44],dword200
	mov	dword204,[ebp-32]
	mov	dword206,[ebp-44]
	mov	[dword204],dword206
label000b:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0009:
	add	dword ptr [ebp-32],4
	mov	dword213,[ebp-32]
	cmp	dword213,[ebp-36]
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
	mov	dword722,[ebp+20]
	mov	dword721,[ebp+12]
	mov	dword720,[ebp+8]
	mov	dword719,[ebp+16]
	cmp	dword720,dword721
	jge	label0000
	cmp	dword719,dword721
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
	mov	[ebp-20],dword722
	mov	[ebp-24],dword719
	mov	[ebp-28],dword720
; start of inline function _rasterize_horiz_line
	mov	dword80,dword ptr [__pitch]
	imul	dword80,[ebp-20]
	add	dword80,dword ptr [__videomem]
	mov	dword84,[ebp-28]
	sal	dword84,2
	add	dword80,dword84
	mov	[ebp-32],dword80
	mov	dword88,[ebp-24]
	sal	dword88,2
	add	dword88,[ebp-32]
	mov	dword92,[ebp-28]
	sal	dword92,2
	sub	dword88,dword92
	mov	[ebp-36],dword88
label000a:
	mov	dword158,[ebp-12]
	mov	[ebp-76],dword158
	mov	dword157,[ebp-16]
	mov	[ebp-80],dword157
; start of inline function _tex2d
	mov	dword162,dword ptr [__texture_width]
	dec	dword162
	int2float	dword162
	fmul	dword ptr [ebp-80]
	float2int	dword164
	mov	[ebp-84],dword164
	mov	dword168,dword ptr [__texture_height]
	dec	dword168
	int2float	dword168
	fmul	dword ptr [ebp-76]
	float2int	dword170
	mov	[ebp-88],dword170
	mov	dword174,[ebp-88]
	imul	dword174,dword ptr [__texture_width]
	add	dword174,[ebp-84]
	sal	dword174,2
	add	dword174,dword ptr [__texture_data]
	mov	dword178,[dword174]
	mov	[ebp-92],dword178
label000e:
; end of inline function _tex2d
	mov	dword96,[ebp-92]
	mov	[ebp-40],dword96
	mov	dword100,[ebp-40]
	sar	dword100,24
	and	dword100,255
	mov	[ebp-68],dword100
	cmp	dword ptr [ebp-68],0
	je	label000d
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword108,[ebp-32]
	mov	dword110,[dword108]
	mov	[ebp-56],dword110
	mov	dword113,[ebp-56]
	and	dword113,65280
	sar	dword113,8
	mov	[ebp-60],dword113
	mov	dword118,[ebp-56]
	and	dword118,255
	mov	[ebp-64],dword118
	mov	dword122,[ebp-40]
	and	dword122,65280
	sar	dword122,8
	mov	[ebp-48],dword122
	mov	dword127,[ebp-40]
	and	dword127,255
	mov	[ebp-52],dword127
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword133
	mov	[ebp-48],dword133
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword139
	mov	[ebp-52],dword139
	mov	dword143,[ebp-48]
	sal	dword143,8
	add	dword143,[ebp-52]
	mov	[ebp-44],dword143
	mov	dword147,[ebp-32]
	mov	dword149,[ebp-44]
	mov	[dword147],dword149
label000d:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label000b:
	add	dword ptr [ebp-32],4
	mov	dword156,[ebp-32]
	cmp	dword156,[ebp-36]
	jl	label000a
label000c:
label000f:
; end of inline function _rasterize_horiz_line
	jmp	label0002
label0001:
	cmp	dword719,dword720
	jge	label0003
	mov	dword185,[ebp+40]
	mov	[ebp-4],dword185
	mov	dword184,[ebp+36]
	mov	[ebp-8],dword184
	mov	dword22,[ebp+32]
	mov	dword183,[dword22+4]
	mov	[ebp-12],dword183
	mov	dword24,[ebp+32]
	mov	dword182,[dword24]
	mov	[ebp-16],dword182
	mov	[ebp-20],dword722
	mov	[ebp-24],dword721
	mov	[ebp-28],dword719
; start of inline function _rasterize_horiz_line
	mov	dword189,dword ptr [__pitch]
	imul	dword189,[ebp-20]
	add	dword189,dword ptr [__videomem]
	mov	dword193,[ebp-28]
	sal	dword193,2
	add	dword189,dword193
	mov	[ebp-32],dword189
	mov	dword197,[ebp-24]
	sal	dword197,2
	add	dword197,[ebp-32]
	mov	dword201,[ebp-28]
	sal	dword201,2
	sub	dword197,dword201
	mov	[ebp-36],dword197
label0010:
	mov	dword267,[ebp-12]
	mov	[ebp-76],dword267
	mov	dword266,[ebp-16]
	mov	[ebp-80],dword266
; start of inline function _tex2d
	mov	dword271,dword ptr [__texture_width]
	dec	dword271
	int2float	dword271
	fmul	dword ptr [ebp-80]
	float2int	dword273
	mov	[ebp-84],dword273
	mov	dword277,dword ptr [__texture_height]
	dec	dword277
	int2float	dword277
	fmul	dword ptr [ebp-76]
	float2int	dword279
	mov	[ebp-88],dword279
	mov	dword283,[ebp-88]
	imul	dword283,dword ptr [__texture_width]
	add	dword283,[ebp-84]
	sal	dword283,2
	add	dword283,dword ptr [__texture_data]
	mov	dword287,[dword283]
	mov	[ebp-92],dword287
label0014:
; end of inline function _tex2d
	mov	dword205,[ebp-92]
	mov	[ebp-40],dword205
	mov	dword209,[ebp-40]
	sar	dword209,24
	and	dword209,255
	mov	[ebp-68],dword209
	cmp	dword ptr [ebp-68],0
	je	label0013
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword217,[ebp-32]
	mov	dword219,[dword217]
	mov	[ebp-56],dword219
	mov	dword222,[ebp-56]
	and	dword222,65280
	sar	dword222,8
	mov	[ebp-60],dword222
	mov	dword227,[ebp-56]
	and	dword227,255
	mov	[ebp-64],dword227
	mov	dword231,[ebp-40]
	and	dword231,65280
	sar	dword231,8
	mov	[ebp-48],dword231
	mov	dword236,[ebp-40]
	and	dword236,255
	mov	[ebp-52],dword236
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword242
	mov	[ebp-48],dword242
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword248
	mov	[ebp-52],dword248
	mov	dword252,[ebp-48]
	sal	dword252,8
	add	dword252,[ebp-52]
	mov	[ebp-44],dword252
	mov	dword256,[ebp-32]
	mov	dword258,[ebp-44]
	mov	[dword256],dword258
label0013:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0011:
	add	dword ptr [ebp-32],4
	mov	dword265,[ebp-32]
	cmp	dword265,[ebp-36]
	jl	label0010
label0012:
label0015:
; end of inline function _rasterize_horiz_line
	jmp	label0004
label0003:
	mov	dword294,[ebp+40]
	mov	[ebp-4],dword294
	mov	dword293,[ebp+36]
	mov	[ebp-8],dword293
	mov	dword31,[ebp+24]
	mov	dword292,[dword31+4]
	mov	[ebp-12],dword292
	mov	dword33,[ebp+24]
	mov	dword291,[dword33]
	mov	[ebp-16],dword291
	mov	[ebp-20],dword722
	mov	[ebp-24],dword721
	mov	[ebp-28],dword720
; start of inline function _rasterize_horiz_line
	mov	dword298,dword ptr [__pitch]
	imul	dword298,[ebp-20]
	add	dword298,dword ptr [__videomem]
	mov	dword302,[ebp-28]
	sal	dword302,2
	add	dword298,dword302
	mov	[ebp-32],dword298
	mov	dword306,[ebp-24]
	sal	dword306,2
	add	dword306,[ebp-32]
	mov	dword310,[ebp-28]
	sal	dword310,2
	sub	dword306,dword310
	mov	[ebp-36],dword306
label0016:
	mov	dword376,[ebp-12]
	mov	[ebp-76],dword376
	mov	dword375,[ebp-16]
	mov	[ebp-80],dword375
; start of inline function _tex2d
	mov	dword380,dword ptr [__texture_width]
	dec	dword380
	int2float	dword380
	fmul	dword ptr [ebp-80]
	float2int	dword382
	mov	[ebp-84],dword382
	mov	dword386,dword ptr [__texture_height]
	dec	dword386
	int2float	dword386
	fmul	dword ptr [ebp-76]
	float2int	dword388
	mov	[ebp-88],dword388
	mov	dword392,[ebp-88]
	imul	dword392,dword ptr [__texture_width]
	add	dword392,[ebp-84]
	sal	dword392,2
	add	dword392,dword ptr [__texture_data]
	mov	dword396,[dword392]
	mov	[ebp-92],dword396
label001a:
; end of inline function _tex2d
	mov	dword314,[ebp-92]
	mov	[ebp-40],dword314
	mov	dword318,[ebp-40]
	sar	dword318,24
	and	dword318,255
	mov	[ebp-68],dword318
	cmp	dword ptr [ebp-68],0
	je	label0019
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword326,[ebp-32]
	mov	dword328,[dword326]
	mov	[ebp-56],dword328
	mov	dword331,[ebp-56]
	and	dword331,65280
	sar	dword331,8
	mov	[ebp-60],dword331
	mov	dword336,[ebp-56]
	and	dword336,255
	mov	[ebp-64],dword336
	mov	dword340,[ebp-40]
	and	dword340,65280
	sar	dword340,8
	mov	[ebp-48],dword340
	mov	dword345,[ebp-40]
	and	dword345,255
	mov	[ebp-52],dword345
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword351
	mov	[ebp-48],dword351
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword357
	mov	[ebp-52],dword357
	mov	dword361,[ebp-48]
	sal	dword361,8
	add	dword361,[ebp-52]
	mov	[ebp-44],dword361
	mov	dword365,[ebp-32]
	mov	dword367,[ebp-44]
	mov	[dword365],dword367
label0019:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0017:
	add	dword ptr [ebp-32],4
	mov	dword374,[ebp-32]
	cmp	dword374,[ebp-36]
	jl	label0016
label0018:
label001b:
; end of inline function _rasterize_horiz_line
label0004:
label0002:
	jmp	label0005
label0000:
	cmp	dword719,dword721
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
	mov	dword401,[dword43+4]
	mov	[ebp-12],dword401
	mov	dword45,[ebp+32]
	mov	dword400,[dword45]
	mov	[ebp-16],dword400
	mov	[ebp-20],dword722
	mov	[ebp-24],dword720
	mov	[ebp-28],dword719
; start of inline function _rasterize_horiz_line
	mov	dword405,dword ptr [__pitch]
	imul	dword405,[ebp-20]
	add	dword405,dword ptr [__videomem]
	mov	dword409,[ebp-28]
	sal	dword409,2
	add	dword405,dword409
	mov	[ebp-32],dword405
	mov	dword413,[ebp-24]
	sal	dword413,2
	add	dword413,[ebp-32]
	mov	dword417,[ebp-28]
	sal	dword417,2
	sub	dword413,dword417
	mov	[ebp-36],dword413
label001c:
	mov	dword483,[ebp-12]
	mov	[ebp-76],dword483
	mov	dword482,[ebp-16]
	mov	[ebp-80],dword482
; start of inline function _tex2d
	mov	dword487,dword ptr [__texture_width]
	dec	dword487
	int2float	dword487
	fmul	dword ptr [ebp-80]
	float2int	dword489
	mov	[ebp-84],dword489
	mov	dword493,dword ptr [__texture_height]
	dec	dword493
	int2float	dword493
	fmul	dword ptr [ebp-76]
	float2int	dword495
	mov	[ebp-88],dword495
	mov	dword499,[ebp-88]
	imul	dword499,dword ptr [__texture_width]
	add	dword499,[ebp-84]
	sal	dword499,2
	add	dword499,dword ptr [__texture_data]
	mov	dword503,[dword499]
	mov	[ebp-92],dword503
label0020:
; end of inline function _tex2d
	mov	dword421,[ebp-92]
	mov	[ebp-40],dword421
	mov	dword425,[ebp-40]
	sar	dword425,24
	and	dword425,255
	mov	[ebp-68],dword425
	cmp	dword ptr [ebp-68],0
	je	label001f
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword433,[ebp-32]
	mov	dword435,[dword433]
	mov	[ebp-56],dword435
	mov	dword438,[ebp-56]
	and	dword438,65280
	sar	dword438,8
	mov	[ebp-60],dword438
	mov	dword443,[ebp-56]
	and	dword443,255
	mov	[ebp-64],dword443
	mov	dword447,[ebp-40]
	and	dword447,65280
	sar	dword447,8
	mov	[ebp-48],dword447
	mov	dword452,[ebp-40]
	and	dword452,255
	mov	[ebp-52],dword452
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword458
	mov	[ebp-48],dword458
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword464
	mov	[ebp-52],dword464
	mov	dword468,[ebp-48]
	sal	dword468,8
	add	dword468,[ebp-52]
	mov	[ebp-44],dword468
	mov	dword472,[ebp-32]
	mov	dword474,[ebp-44]
	mov	[dword472],dword474
label001f:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label001d:
	add	dword ptr [ebp-32],4
	mov	dword481,[ebp-32]
	cmp	dword481,[ebp-36]
	jl	label001c
label001e:
label0021:
; end of inline function _rasterize_horiz_line
	jmp	label0007
label0006:
	cmp	dword719,dword720
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
	mov	dword508,[dword55+4]
	mov	[ebp-12],dword508
	mov	dword57,[ebp+28]
	mov	dword507,[dword57]
	mov	[ebp-16],dword507
	mov	[ebp-20],dword722
	mov	[ebp-24],dword719
	mov	[ebp-28],dword721
; start of inline function _rasterize_horiz_line
	mov	dword512,dword ptr [__pitch]
	imul	dword512,[ebp-20]
	add	dword512,dword ptr [__videomem]
	mov	dword516,[ebp-28]
	sal	dword516,2
	add	dword512,dword516
	mov	[ebp-32],dword512
	mov	dword520,[ebp-24]
	sal	dword520,2
	add	dword520,[ebp-32]
	mov	dword524,[ebp-28]
	sal	dword524,2
	sub	dword520,dword524
	mov	[ebp-36],dword520
label0022:
	mov	dword590,[ebp-12]
	mov	[ebp-76],dword590
	mov	dword589,[ebp-16]
	mov	[ebp-80],dword589
; start of inline function _tex2d
	mov	dword594,dword ptr [__texture_width]
	dec	dword594
	int2float	dword594
	fmul	dword ptr [ebp-80]
	float2int	dword596
	mov	[ebp-84],dword596
	mov	dword600,dword ptr [__texture_height]
	dec	dword600
	int2float	dword600
	fmul	dword ptr [ebp-76]
	float2int	dword602
	mov	[ebp-88],dword602
	mov	dword606,[ebp-88]
	imul	dword606,dword ptr [__texture_width]
	add	dword606,[ebp-84]
	sal	dword606,2
	add	dword606,dword ptr [__texture_data]
	mov	dword610,[dword606]
	mov	[ebp-92],dword610
label0026:
; end of inline function _tex2d
	mov	dword528,[ebp-92]
	mov	[ebp-40],dword528
	mov	dword532,[ebp-40]
	sar	dword532,24
	and	dword532,255
	mov	[ebp-68],dword532
	cmp	dword ptr [ebp-68],0
	je	label0025
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword540,[ebp-32]
	mov	dword542,[dword540]
	mov	[ebp-56],dword542
	mov	dword545,[ebp-56]
	and	dword545,65280
	sar	dword545,8
	mov	[ebp-60],dword545
	mov	dword550,[ebp-56]
	and	dword550,255
	mov	[ebp-64],dword550
	mov	dword554,[ebp-40]
	and	dword554,65280
	sar	dword554,8
	mov	[ebp-48],dword554
	mov	dword559,[ebp-40]
	and	dword559,255
	mov	[ebp-52],dword559
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword565
	mov	[ebp-48],dword565
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword571
	mov	[ebp-52],dword571
	mov	dword575,[ebp-48]
	sal	dword575,8
	add	dword575,[ebp-52]
	mov	[ebp-44],dword575
	mov	dword579,[ebp-32]
	mov	dword581,[ebp-44]
	mov	[dword579],dword581
label0025:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0023:
	add	dword ptr [ebp-32],4
	mov	dword588,[ebp-32]
	cmp	dword588,[ebp-36]
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
	mov	dword615,[dword64+4]
	mov	[ebp-12],dword615
	mov	dword66,[ebp+28]
	mov	dword614,[dword66]
	mov	[ebp-16],dword614
	mov	[ebp-20],dword722
	mov	[ebp-24],dword720
	mov	[ebp-28],dword721
; start of inline function _rasterize_horiz_line
	mov	dword619,dword ptr [__pitch]
	imul	dword619,[ebp-20]
	add	dword619,dword ptr [__videomem]
	mov	dword623,[ebp-28]
	sal	dword623,2
	add	dword619,dword623
	mov	[ebp-32],dword619
	mov	dword627,[ebp-24]
	sal	dword627,2
	add	dword627,[ebp-32]
	mov	dword631,[ebp-28]
	sal	dword631,2
	sub	dword627,dword631
	mov	[ebp-36],dword627
label0028:
	mov	dword697,[ebp-12]
	mov	[ebp-76],dword697
	mov	dword696,[ebp-16]
	mov	[ebp-80],dword696
; start of inline function _tex2d
	mov	dword701,dword ptr [__texture_width]
	dec	dword701
	int2float	dword701
	fmul	dword ptr [ebp-80]
	float2int	dword703
	mov	[ebp-84],dword703
	mov	dword707,dword ptr [__texture_height]
	dec	dword707
	int2float	dword707
	fmul	dword ptr [ebp-76]
	float2int	dword709
	mov	[ebp-88],dword709
	mov	dword713,[ebp-88]
	imul	dword713,dword ptr [__texture_width]
	add	dword713,[ebp-84]
	sal	dword713,2
	add	dword713,dword ptr [__texture_data]
	mov	dword717,[dword713]
	mov	[ebp-92],dword717
label002c:
; end of inline function _tex2d
	mov	dword635,[ebp-92]
	mov	[ebp-40],dword635
	mov	dword639,[ebp-40]
	sar	dword639,24
	and	dword639,255
	mov	[ebp-68],dword639
	cmp	dword ptr [ebp-68],0
	je	label002b
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	dword647,[ebp-32]
	mov	dword649,[dword647]
	mov	[ebp-56],dword649
	mov	dword652,[ebp-56]
	and	dword652,65280
	sar	dword652,8
	mov	[ebp-60],dword652
	mov	dword657,[ebp-56]
	and	dword657,255
	mov	[ebp-64],dword657
	mov	dword661,[ebp-40]
	and	dword661,65280
	sar	dword661,8
	mov	[ebp-48],dword661
	mov	dword666,[ebp-40]
	and	dword666,255
	mov	[ebp-52],dword666
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword672
	mov	[ebp-48],dword672
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	float2int	dword678
	mov	[ebp-52],dword678
	mov	dword682,[ebp-48]
	sal	dword682,8
	add	dword682,[ebp-52]
	mov	[ebp-44],dword682
	mov	dword686,[ebp-32]
	mov	dword688,[ebp-44]
	mov	[dword686],dword688
label002b:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0029:
	add	dword ptr [ebp-32],4
	mov	dword695,[ebp-32]
	cmp	dword695,[ebp-36]
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
	mov	dword1230,[dword72]
	mov	[ebp-192],dword1230
	mov	dword75,[ebp+16]
	mov	dword1229,[dword75]
	mov	[ebp-196],dword1229
	mov	dword77,[ebp+12]
	mov	dword1228,[dword77]
	mov	[ebp-200],dword1228
	mov	dword79,[ebp+8]
	mov	dword1227,[dword79]
	mov	[ebp-204],dword1227
; start of inline function _rasterize_triangle_1i
	mov	dword1234,[ebp-204]
	cmp	dword1234,[ebp-200]
	jge	label0038
	mov	dword1237,[ebp-196]
	cmp	dword1237,[ebp-200]
	jle	label0039
	mov	dword1307,[ebp-172]
	mov	[ebp-208],dword1307
	mov	dword1306,[ebp-176]
	mov	[ebp-212],dword1306
	mov	dword1241,[ebp-188]
	mov	dword1305,[dword1241+4]
	mov	[ebp-216],dword1305
	mov	dword1243,[ebp-188]
	mov	dword1304,[dword1243]
	mov	[ebp-220],dword1304
	mov	dword1303,[ebp-192]
	mov	[ebp-224],dword1303
	mov	dword1302,[ebp-196]
	mov	[ebp-228],dword1302
	mov	dword1301,[ebp-204]
	mov	[ebp-232],dword1301
; start of inline function _rasterize_horiz_line
	mov	dword1311,dword ptr [__pitch]
	imul	dword1311,[ebp-224]
	add	dword1311,dword ptr [__videomem]
	mov	dword1315,[ebp-232]
	sal	dword1315,2
	add	dword1311,dword1315
	mov	[ebp-236],dword1311
	mov	dword1319,[ebp-228]
	sal	dword1319,2
	add	dword1319,[ebp-236]
	mov	dword1323,[ebp-232]
	sal	dword1323,2
	sub	dword1319,dword1323
	mov	[ebp-240],dword1319
label0042:
	mov	dword1389,[ebp-216]
	mov	[ebp-280],dword1389
	mov	dword1388,[ebp-220]
	mov	[ebp-284],dword1388
; start of inline function _tex2d
	mov	dword1393,dword ptr [__texture_width]
	dec	dword1393
	int2float	dword1393
	fmul	dword ptr [ebp-284]
	float2int	dword1395
	mov	[ebp-288],dword1395
	mov	dword1399,dword ptr [__texture_height]
	dec	dword1399
	int2float	dword1399
	fmul	dword ptr [ebp-280]
	float2int	dword1401
	mov	[ebp-292],dword1401
	mov	dword1405,[ebp-292]
	imul	dword1405,dword ptr [__texture_width]
	add	dword1405,[ebp-288]
	sal	dword1405,2
	add	dword1405,dword ptr [__texture_data]
	mov	dword1409,[dword1405]
	mov	[ebp-296],dword1409
label0046:
; end of inline function _tex2d
	mov	dword1327,[ebp-296]
	mov	[ebp-244],dword1327
	mov	dword1331,[ebp-244]
	sar	dword1331,24
	and	dword1331,255
	mov	[ebp-272],dword1331
	cmp	dword ptr [ebp-272],0
	je	label0045
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1339,[ebp-236]
	mov	dword1341,[dword1339]
	mov	[ebp-260],dword1341
	mov	dword1344,[ebp-260]
	and	dword1344,65280
	sar	dword1344,8
	mov	[ebp-264],dword1344
	mov	dword1349,[ebp-260]
	and	dword1349,255
	mov	[ebp-268],dword1349
	mov	dword1353,[ebp-244]
	and	dword1353,65280
	sar	dword1353,8
	mov	[ebp-252],dword1353
	mov	dword1358,[ebp-244]
	and	dword1358,255
	mov	[ebp-256],dword1358
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1364
	mov	[ebp-252],dword1364
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1370
	mov	[ebp-256],dword1370
	mov	dword1374,[ebp-252]
	sal	dword1374,8
	add	dword1374,[ebp-256]
	mov	[ebp-248],dword1374
	mov	dword1378,[ebp-236]
	mov	dword1380,[ebp-248]
	mov	[dword1378],dword1380
label0045:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0043:
	add	dword ptr [ebp-236],4
	mov	dword1387,[ebp-236]
	cmp	dword1387,[ebp-240]
	jl	label0042
label0044:
label0047:
; end of inline function _rasterize_horiz_line
	jmp	label003a
label0039:
	mov	dword1249,[ebp-196]
	cmp	dword1249,[ebp-204]
	jge	label003b
	mov	dword1416,[ebp-172]
	mov	[ebp-208],dword1416
	mov	dword1415,[ebp-176]
	mov	[ebp-212],dword1415
	mov	dword1253,[ebp-180]
	mov	dword1414,[dword1253+4]
	mov	[ebp-216],dword1414
	mov	dword1255,[ebp-180]
	mov	dword1413,[dword1255]
	mov	[ebp-220],dword1413
	mov	dword1412,[ebp-192]
	mov	[ebp-224],dword1412
	mov	dword1411,[ebp-200]
	mov	[ebp-228],dword1411
	mov	dword1410,[ebp-196]
	mov	[ebp-232],dword1410
; start of inline function _rasterize_horiz_line
	mov	dword1420,dword ptr [__pitch]
	imul	dword1420,[ebp-224]
	add	dword1420,dword ptr [__videomem]
	mov	dword1424,[ebp-232]
	sal	dword1424,2
	add	dword1420,dword1424
	mov	[ebp-236],dword1420
	mov	dword1428,[ebp-228]
	sal	dword1428,2
	add	dword1428,[ebp-236]
	mov	dword1432,[ebp-232]
	sal	dword1432,2
	sub	dword1428,dword1432
	mov	[ebp-240],dword1428
label0048:
	mov	dword1498,[ebp-216]
	mov	[ebp-280],dword1498
	mov	dword1497,[ebp-220]
	mov	[ebp-284],dword1497
; start of inline function _tex2d
	mov	dword1502,dword ptr [__texture_width]
	dec	dword1502
	int2float	dword1502
	fmul	dword ptr [ebp-284]
	float2int	dword1504
	mov	[ebp-288],dword1504
	mov	dword1508,dword ptr [__texture_height]
	dec	dword1508
	int2float	dword1508
	fmul	dword ptr [ebp-280]
	float2int	dword1510
	mov	[ebp-292],dword1510
	mov	dword1514,[ebp-292]
	imul	dword1514,dword ptr [__texture_width]
	add	dword1514,[ebp-288]
	sal	dword1514,2
	add	dword1514,dword ptr [__texture_data]
	mov	dword1518,[dword1514]
	mov	[ebp-296],dword1518
label004c:
; end of inline function _tex2d
	mov	dword1436,[ebp-296]
	mov	[ebp-244],dword1436
	mov	dword1440,[ebp-244]
	sar	dword1440,24
	and	dword1440,255
	mov	[ebp-272],dword1440
	cmp	dword ptr [ebp-272],0
	je	label004b
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1448,[ebp-236]
	mov	dword1450,[dword1448]
	mov	[ebp-260],dword1450
	mov	dword1453,[ebp-260]
	and	dword1453,65280
	sar	dword1453,8
	mov	[ebp-264],dword1453
	mov	dword1458,[ebp-260]
	and	dword1458,255
	mov	[ebp-268],dword1458
	mov	dword1462,[ebp-244]
	and	dword1462,65280
	sar	dword1462,8
	mov	[ebp-252],dword1462
	mov	dword1467,[ebp-244]
	and	dword1467,255
	mov	[ebp-256],dword1467
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1473
	mov	[ebp-252],dword1473
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1479
	mov	[ebp-256],dword1479
	mov	dword1483,[ebp-252]
	sal	dword1483,8
	add	dword1483,[ebp-256]
	mov	[ebp-248],dword1483
	mov	dword1487,[ebp-236]
	mov	dword1489,[ebp-248]
	mov	[dword1487],dword1489
label004b:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0049:
	add	dword ptr [ebp-236],4
	mov	dword1496,[ebp-236]
	cmp	dword1496,[ebp-240]
	jl	label0048
label004a:
label004d:
; end of inline function _rasterize_horiz_line
	jmp	label003c
label003b:
	mov	dword1525,[ebp-172]
	mov	[ebp-208],dword1525
	mov	dword1524,[ebp-176]
	mov	[ebp-212],dword1524
	mov	dword1262,[ebp-188]
	mov	dword1523,[dword1262+4]
	mov	[ebp-216],dword1523
	mov	dword1264,[ebp-188]
	mov	dword1522,[dword1264]
	mov	[ebp-220],dword1522
	mov	dword1521,[ebp-192]
	mov	[ebp-224],dword1521
	mov	dword1520,[ebp-200]
	mov	[ebp-228],dword1520
	mov	dword1519,[ebp-204]
	mov	[ebp-232],dword1519
; start of inline function _rasterize_horiz_line
	mov	dword1529,dword ptr [__pitch]
	imul	dword1529,[ebp-224]
	add	dword1529,dword ptr [__videomem]
	mov	dword1533,[ebp-232]
	sal	dword1533,2
	add	dword1529,dword1533
	mov	[ebp-236],dword1529
	mov	dword1537,[ebp-228]
	sal	dword1537,2
	add	dword1537,[ebp-236]
	mov	dword1541,[ebp-232]
	sal	dword1541,2
	sub	dword1537,dword1541
	mov	[ebp-240],dword1537
label004e:
	mov	dword1607,[ebp-216]
	mov	[ebp-280],dword1607
	mov	dword1606,[ebp-220]
	mov	[ebp-284],dword1606
; start of inline function _tex2d
	mov	dword1611,dword ptr [__texture_width]
	dec	dword1611
	int2float	dword1611
	fmul	dword ptr [ebp-284]
	float2int	dword1613
	mov	[ebp-288],dword1613
	mov	dword1617,dword ptr [__texture_height]
	dec	dword1617
	int2float	dword1617
	fmul	dword ptr [ebp-280]
	float2int	dword1619
	mov	[ebp-292],dword1619
	mov	dword1623,[ebp-292]
	imul	dword1623,dword ptr [__texture_width]
	add	dword1623,[ebp-288]
	sal	dword1623,2
	add	dword1623,dword ptr [__texture_data]
	mov	dword1627,[dword1623]
	mov	[ebp-296],dword1627
label0052:
; end of inline function _tex2d
	mov	dword1545,[ebp-296]
	mov	[ebp-244],dword1545
	mov	dword1549,[ebp-244]
	sar	dword1549,24
	and	dword1549,255
	mov	[ebp-272],dword1549
	cmp	dword ptr [ebp-272],0
	je	label0051
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1557,[ebp-236]
	mov	dword1559,[dword1557]
	mov	[ebp-260],dword1559
	mov	dword1562,[ebp-260]
	and	dword1562,65280
	sar	dword1562,8
	mov	[ebp-264],dword1562
	mov	dword1567,[ebp-260]
	and	dword1567,255
	mov	[ebp-268],dword1567
	mov	dword1571,[ebp-244]
	and	dword1571,65280
	sar	dword1571,8
	mov	[ebp-252],dword1571
	mov	dword1576,[ebp-244]
	and	dword1576,255
	mov	[ebp-256],dword1576
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1582
	mov	[ebp-252],dword1582
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1588
	mov	[ebp-256],dword1588
	mov	dword1592,[ebp-252]
	sal	dword1592,8
	add	dword1592,[ebp-256]
	mov	[ebp-248],dword1592
	mov	dword1596,[ebp-236]
	mov	dword1598,[ebp-248]
	mov	[dword1596],dword1598
label0051:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label004f:
	add	dword ptr [ebp-236],4
	mov	dword1605,[ebp-236]
	cmp	dword1605,[ebp-240]
	jl	label004e
label0050:
label0053:
; end of inline function _rasterize_horiz_line
label003c:
label003a:
	jmp	label003d
label0038:
	mov	dword1270,[ebp-196]
	cmp	dword1270,[ebp-200]
	jge	label003e
	fld	dword ptr [ebp-172]
	fldz
	fsubrp
	fstp	dword ptr [ebp-208]
	fld	dword ptr [ebp-176]
	fldz
	fsubrp
	fstp	dword ptr [ebp-212]
	mov	dword1274,[ebp-180]
	mov	dword1632,[dword1274+4]
	mov	[ebp-216],dword1632
	mov	dword1276,[ebp-180]
	mov	dword1631,[dword1276]
	mov	[ebp-220],dword1631
	mov	dword1630,[ebp-192]
	mov	[ebp-224],dword1630
	mov	dword1629,[ebp-204]
	mov	[ebp-228],dword1629
	mov	dword1628,[ebp-196]
	mov	[ebp-232],dword1628
; start of inline function _rasterize_horiz_line
	mov	dword1636,dword ptr [__pitch]
	imul	dword1636,[ebp-224]
	add	dword1636,dword ptr [__videomem]
	mov	dword1640,[ebp-232]
	sal	dword1640,2
	add	dword1636,dword1640
	mov	[ebp-236],dword1636
	mov	dword1644,[ebp-228]
	sal	dword1644,2
	add	dword1644,[ebp-236]
	mov	dword1648,[ebp-232]
	sal	dword1648,2
	sub	dword1644,dword1648
	mov	[ebp-240],dword1644
label0054:
	mov	dword1714,[ebp-216]
	mov	[ebp-280],dword1714
	mov	dword1713,[ebp-220]
	mov	[ebp-284],dword1713
; start of inline function _tex2d
	mov	dword1718,dword ptr [__texture_width]
	dec	dword1718
	int2float	dword1718
	fmul	dword ptr [ebp-284]
	float2int	dword1720
	mov	[ebp-288],dword1720
	mov	dword1724,dword ptr [__texture_height]
	dec	dword1724
	int2float	dword1724
	fmul	dword ptr [ebp-280]
	float2int	dword1726
	mov	[ebp-292],dword1726
	mov	dword1730,[ebp-292]
	imul	dword1730,dword ptr [__texture_width]
	add	dword1730,[ebp-288]
	sal	dword1730,2
	add	dword1730,dword ptr [__texture_data]
	mov	dword1734,[dword1730]
	mov	[ebp-296],dword1734
label0058:
; end of inline function _tex2d
	mov	dword1652,[ebp-296]
	mov	[ebp-244],dword1652
	mov	dword1656,[ebp-244]
	sar	dword1656,24
	and	dword1656,255
	mov	[ebp-272],dword1656
	cmp	dword ptr [ebp-272],0
	je	label0057
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1664,[ebp-236]
	mov	dword1666,[dword1664]
	mov	[ebp-260],dword1666
	mov	dword1669,[ebp-260]
	and	dword1669,65280
	sar	dword1669,8
	mov	[ebp-264],dword1669
	mov	dword1674,[ebp-260]
	and	dword1674,255
	mov	[ebp-268],dword1674
	mov	dword1678,[ebp-244]
	and	dword1678,65280
	sar	dword1678,8
	mov	[ebp-252],dword1678
	mov	dword1683,[ebp-244]
	and	dword1683,255
	mov	[ebp-256],dword1683
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1689
	mov	[ebp-252],dword1689
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1695
	mov	[ebp-256],dword1695
	mov	dword1699,[ebp-252]
	sal	dword1699,8
	add	dword1699,[ebp-256]
	mov	[ebp-248],dword1699
	mov	dword1703,[ebp-236]
	mov	dword1705,[ebp-248]
	mov	[dword1703],dword1705
label0057:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0055:
	add	dword ptr [ebp-236],4
	mov	dword1712,[ebp-236]
	cmp	dword1712,[ebp-240]
	jl	label0054
label0056:
label0059:
; end of inline function _rasterize_horiz_line
	jmp	label003f
label003e:
	mov	dword1282,[ebp-196]
	cmp	dword1282,[ebp-204]
	jle	label0040
	fld	dword ptr [ebp-172]
	fldz
	fsubrp
	fstp	dword ptr [ebp-208]
	fld	dword ptr [ebp-176]
	fldz
	fsubrp
	fstp	dword ptr [ebp-212]
	mov	dword1286,[ebp-184]
	mov	dword1739,[dword1286+4]
	mov	[ebp-216],dword1739
	mov	dword1288,[ebp-184]
	mov	dword1738,[dword1288]
	mov	[ebp-220],dword1738
	mov	dword1737,[ebp-192]
	mov	[ebp-224],dword1737
	mov	dword1736,[ebp-196]
	mov	[ebp-228],dword1736
	mov	dword1735,[ebp-200]
	mov	[ebp-232],dword1735
; start of inline function _rasterize_horiz_line
	mov	dword1743,dword ptr [__pitch]
	imul	dword1743,[ebp-224]
	add	dword1743,dword ptr [__videomem]
	mov	dword1747,[ebp-232]
	sal	dword1747,2
	add	dword1743,dword1747
	mov	[ebp-236],dword1743
	mov	dword1751,[ebp-228]
	sal	dword1751,2
	add	dword1751,[ebp-236]
	mov	dword1755,[ebp-232]
	sal	dword1755,2
	sub	dword1751,dword1755
	mov	[ebp-240],dword1751
label005a:
	mov	dword1821,[ebp-216]
	mov	[ebp-280],dword1821
	mov	dword1820,[ebp-220]
	mov	[ebp-284],dword1820
; start of inline function _tex2d
	mov	dword1825,dword ptr [__texture_width]
	dec	dword1825
	int2float	dword1825
	fmul	dword ptr [ebp-284]
	float2int	dword1827
	mov	[ebp-288],dword1827
	mov	dword1831,dword ptr [__texture_height]
	dec	dword1831
	int2float	dword1831
	fmul	dword ptr [ebp-280]
	float2int	dword1833
	mov	[ebp-292],dword1833
	mov	dword1837,[ebp-292]
	imul	dword1837,dword ptr [__texture_width]
	add	dword1837,[ebp-288]
	sal	dword1837,2
	add	dword1837,dword ptr [__texture_data]
	mov	dword1841,[dword1837]
	mov	[ebp-296],dword1841
label005e:
; end of inline function _tex2d
	mov	dword1759,[ebp-296]
	mov	[ebp-244],dword1759
	mov	dword1763,[ebp-244]
	sar	dword1763,24
	and	dword1763,255
	mov	[ebp-272],dword1763
	cmp	dword ptr [ebp-272],0
	je	label005d
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1771,[ebp-236]
	mov	dword1773,[dword1771]
	mov	[ebp-260],dword1773
	mov	dword1776,[ebp-260]
	and	dword1776,65280
	sar	dword1776,8
	mov	[ebp-264],dword1776
	mov	dword1781,[ebp-260]
	and	dword1781,255
	mov	[ebp-268],dword1781
	mov	dword1785,[ebp-244]
	and	dword1785,65280
	sar	dword1785,8
	mov	[ebp-252],dword1785
	mov	dword1790,[ebp-244]
	and	dword1790,255
	mov	[ebp-256],dword1790
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1796
	mov	[ebp-252],dword1796
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1802
	mov	[ebp-256],dword1802
	mov	dword1806,[ebp-252]
	sal	dword1806,8
	add	dword1806,[ebp-256]
	mov	[ebp-248],dword1806
	mov	dword1810,[ebp-236]
	mov	dword1812,[ebp-248]
	mov	[dword1810],dword1812
label005d:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label005b:
	add	dword ptr [ebp-236],4
	mov	dword1819,[ebp-236]
	cmp	dword1819,[ebp-240]
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
	mov	dword1295,[ebp-184]
	mov	dword1846,[dword1295+4]
	mov	[ebp-216],dword1846
	mov	dword1297,[ebp-184]
	mov	dword1845,[dword1297]
	mov	[ebp-220],dword1845
	mov	dword1844,[ebp-192]
	mov	[ebp-224],dword1844
	mov	dword1843,[ebp-204]
	mov	[ebp-228],dword1843
	mov	dword1842,[ebp-200]
	mov	[ebp-232],dword1842
; start of inline function _rasterize_horiz_line
	mov	dword1850,dword ptr [__pitch]
	imul	dword1850,[ebp-224]
	add	dword1850,dword ptr [__videomem]
	mov	dword1854,[ebp-232]
	sal	dword1854,2
	add	dword1850,dword1854
	mov	[ebp-236],dword1850
	mov	dword1858,[ebp-228]
	sal	dword1858,2
	add	dword1858,[ebp-236]
	mov	dword1862,[ebp-232]
	sal	dword1862,2
	sub	dword1858,dword1862
	mov	[ebp-240],dword1858
label0060:
	mov	dword1928,[ebp-216]
	mov	[ebp-280],dword1928
	mov	dword1927,[ebp-220]
	mov	[ebp-284],dword1927
; start of inline function _tex2d
	mov	dword1932,dword ptr [__texture_width]
	dec	dword1932
	int2float	dword1932
	fmul	dword ptr [ebp-284]
	float2int	dword1934
	mov	[ebp-288],dword1934
	mov	dword1938,dword ptr [__texture_height]
	dec	dword1938
	int2float	dword1938
	fmul	dword ptr [ebp-280]
	float2int	dword1940
	mov	[ebp-292],dword1940
	mov	dword1944,[ebp-292]
	imul	dword1944,dword ptr [__texture_width]
	add	dword1944,[ebp-288]
	sal	dword1944,2
	add	dword1944,dword ptr [__texture_data]
	mov	dword1948,[dword1944]
	mov	[ebp-296],dword1948
label0064:
; end of inline function _tex2d
	mov	dword1866,[ebp-296]
	mov	[ebp-244],dword1866
	mov	dword1870,[ebp-244]
	sar	dword1870,24
	and	dword1870,255
	mov	[ebp-272],dword1870
	cmp	dword ptr [ebp-272],0
	je	label0063
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	dword1878,[ebp-236]
	mov	dword1880,[dword1878]
	mov	[ebp-260],dword1880
	mov	dword1883,[ebp-260]
	and	dword1883,65280
	sar	dword1883,8
	mov	[ebp-264],dword1883
	mov	dword1888,[ebp-260]
	and	dword1888,255
	mov	[ebp-268],dword1888
	mov	dword1892,[ebp-244]
	and	dword1892,65280
	sar	dword1892,8
	mov	[ebp-252],dword1892
	mov	dword1897,[ebp-244]
	and	dword1897,255
	mov	[ebp-256],dword1897
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1903
	mov	[ebp-252],dword1903
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	float2int	dword1909
	mov	[ebp-256],dword1909
	mov	dword1913,[ebp-252]
	sal	dword1913,8
	add	dword1913,[ebp-256]
	mov	[ebp-248],dword1913
	mov	dword1917,[ebp-236]
	mov	dword1919,[ebp-248]
	mov	[dword1917],dword1919
label0063:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0061:
	add	dword ptr [ebp-236],4
	mov	dword1926,[ebp-236]
	cmp	dword1926,[ebp-240]
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
	mov	dword533,[ebp-104]
	sal	dword533,2
	add	dword529,dword533
	mov	[ebp-108],dword529
	mov	dword537,[ebp-100]
	sal	dword537,2
	add	dword537,[ebp-108]
	mov	dword541,[ebp-104]
	sal	dword541,2
	sub	dword537,dword541
	mov	[ebp-112],dword537
label000d:
	mov	dword607,[ebp-88]
	mov	[ebp-152],dword607
	mov	dword606,[ebp-92]
	mov	[ebp-156],dword606
; start of inline function _tex2d
	mov	dword611,dword ptr [__texture_width]
	dec	dword611
	int2float	dword611
	fmul	dword ptr [ebp-156]
	float2int	dword613
	mov	[ebp-160],dword613
	mov	dword617,dword ptr [__texture_height]
	dec	dword617
	int2float	dword617
	fmul	dword ptr [ebp-152]
	float2int	dword619
	mov	[ebp-164],dword619
	mov	dword623,[ebp-164]
	imul	dword623,dword ptr [__texture_width]
	add	dword623,[ebp-160]
	sal	dword623,2
	add	dword623,dword ptr [__texture_data]
	mov	dword627,[dword623]
	mov	[ebp-168],dword627
label0011:
; end of inline function _tex2d
	mov	dword545,[ebp-168]
	mov	[ebp-116],dword545
	mov	dword549,[ebp-116]
	sar	dword549,24
	and	dword549,255
	mov	[ebp-144],dword549
	cmp	dword ptr [ebp-144],0
	je	label0010
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword557,[ebp-108]
	mov	dword559,[dword557]
	mov	[ebp-132],dword559
	mov	dword562,[ebp-132]
	and	dword562,65280
	sar	dword562,8
	mov	[ebp-136],dword562
	mov	dword567,[ebp-132]
	and	dword567,255
	mov	[ebp-140],dword567
	mov	dword571,[ebp-116]
	and	dword571,65280
	sar	dword571,8
	mov	[ebp-124],dword571
	mov	dword576,[ebp-116]
	and	dword576,255
	mov	[ebp-128],dword576
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword582
	mov	[ebp-124],dword582
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword588
	mov	[ebp-128],dword588
	mov	dword592,[ebp-124]
	sal	dword592,8
	add	dword592,[ebp-128]
	mov	[ebp-120],dword592
	mov	dword596,[ebp-108]
	mov	dword598,[ebp-120]
	mov	[dword596],dword598
label0010:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label000e:
	add	dword ptr [ebp-108],4
	mov	dword605,[ebp-108]
	cmp	dword605,[ebp-112]
	jl	label000d
label000f:
label0012:
; end of inline function _rasterize_horiz_line
	jmp	label000c
label000b:
	mov	dword634,[ebp-44]
	mov	[ebp-80],dword634
	mov	dword633,[ebp-48]
	mov	[ebp-84],dword633
	mov	dword632,[ebp-52]
	mov	[ebp-88],dword632
	mov	dword631,[ebp-56]
	mov	[ebp-92],dword631
	mov	dword630,[ebp-68]
	mov	[ebp-96],dword630
	mov	dword629,[ebp-76]
	mov	[ebp-100],dword629
	mov	dword628,[ebp-72]
	mov	[ebp-104],dword628
; start of inline function _rasterize_horiz_line
	mov	dword638,dword ptr [__pitch]
	imul	dword638,[ebp-96]
	add	dword638,dword ptr [__videomem]
	mov	dword642,[ebp-104]
	sal	dword642,2
	add	dword638,dword642
	mov	[ebp-108],dword638
	mov	dword646,[ebp-100]
	sal	dword646,2
	add	dword646,[ebp-108]
	mov	dword650,[ebp-104]
	sal	dword650,2
	sub	dword646,dword650
	mov	[ebp-112],dword646
label0013:
	mov	dword716,[ebp-88]
	mov	[ebp-152],dword716
	mov	dword715,[ebp-92]
	mov	[ebp-156],dword715
; start of inline function _tex2d
	mov	dword720,dword ptr [__texture_width]
	dec	dword720
	int2float	dword720
	fmul	dword ptr [ebp-156]
	float2int	dword722
	mov	[ebp-160],dword722
	mov	dword726,dword ptr [__texture_height]
	dec	dword726
	int2float	dword726
	fmul	dword ptr [ebp-152]
	float2int	dword728
	mov	[ebp-164],dword728
	mov	dword732,[ebp-164]
	imul	dword732,dword ptr [__texture_width]
	add	dword732,[ebp-160]
	sal	dword732,2
	add	dword732,dword ptr [__texture_data]
	mov	dword736,[dword732]
	mov	[ebp-168],dword736
label0017:
; end of inline function _tex2d
	mov	dword654,[ebp-168]
	mov	[ebp-116],dword654
	mov	dword658,[ebp-116]
	sar	dword658,24
	and	dword658,255
	mov	[ebp-144],dword658
	cmp	dword ptr [ebp-144],0
	je	label0016
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword666,[ebp-108]
	mov	dword668,[dword666]
	mov	[ebp-132],dword668
	mov	dword671,[ebp-132]
	and	dword671,65280
	sar	dword671,8
	mov	[ebp-136],dword671
	mov	dword676,[ebp-132]
	and	dword676,255
	mov	[ebp-140],dword676
	mov	dword680,[ebp-116]
	and	dword680,65280
	sar	dword680,8
	mov	[ebp-124],dword680
	mov	dword685,[ebp-116]
	and	dword685,255
	mov	[ebp-128],dword685
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword691
	mov	[ebp-124],dword691
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword697
	mov	[ebp-128],dword697
	mov	dword701,[ebp-124]
	sal	dword701,8
	add	dword701,[ebp-128]
	mov	[ebp-120],dword701
	mov	dword705,[ebp-108]
	mov	dword707,[ebp-120]
	mov	[dword705],dword707
label0016:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0014:
	add	dword ptr [ebp-108],4
	mov	dword714,[ebp-108]
	cmp	dword714,[ebp-112]
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
	mov	dword745,[ebp-40]
	mov	[ebp-44],dword745
	mov	dword744,[ebp-36]
	mov	[ebp-48],dword744
	mov	dword324,8
	add	dword324,[ebp+12]
	add	dword324,4
	mov	dword743,[dword324]
	mov	[ebp-52],dword743
	mov	dword327,[ebp+12]
	mov	dword742,[dword327+8]
	mov	[ebp-56],dword742
	mov	dword741,[ebp-32]
	mov	[ebp-60],dword741
	mov	dword740,[ebp-28]
	mov	[ebp-64],dword740
	mov	dword331,[ebp+12]
	add	dword331,4
	mov	dword739,[dword331]
	mov	[ebp-68],dword739
	mov	dword334,[ebp+12]
	mov	dword738,[dword334]
	mov	[ebp-72],dword738
	mov	dword737,[ebp-12]
	mov	[ebp-76],dword737
; start of inline function _rasterize_horiz_line__unordered
	mov	dword749,[ebp-76]
	cmp	dword749,[ebp-72]
	jg	label001a
	mov	dword770,[ebp-44]
	mov	[ebp-80],dword770
	mov	dword769,[ebp-48]
	mov	[ebp-84],dword769
	mov	dword768,[ebp-60]
	mov	[ebp-88],dword768
	mov	dword767,[ebp-64]
	mov	[ebp-92],dword767
	mov	dword766,[ebp-68]
	mov	[ebp-96],dword766
	mov	dword765,[ebp-72]
	mov	[ebp-100],dword765
	mov	dword764,[ebp-76]
	mov	[ebp-104],dword764
; start of inline function _rasterize_horiz_line
	mov	dword774,dword ptr [__pitch]
	imul	dword774,[ebp-96]
	add	dword774,dword ptr [__videomem]
	mov	dword778,[ebp-104]
	sal	dword778,2
	add	dword774,dword778
	mov	[ebp-108],dword774
	mov	dword782,[ebp-100]
	sal	dword782,2
	add	dword782,[ebp-108]
	mov	dword786,[ebp-104]
	sal	dword786,2
	sub	dword782,dword786
	mov	[ebp-112],dword782
label001c:
	mov	dword852,[ebp-88]
	mov	[ebp-152],dword852
	mov	dword851,[ebp-92]
	mov	[ebp-156],dword851
; start of inline function _tex2d
	mov	dword856,dword ptr [__texture_width]
	dec	dword856
	int2float	dword856
	fmul	dword ptr [ebp-156]
	float2int	dword858
	mov	[ebp-160],dword858
	mov	dword862,dword ptr [__texture_height]
	dec	dword862
	int2float	dword862
	fmul	dword ptr [ebp-152]
	float2int	dword864
	mov	[ebp-164],dword864
	mov	dword868,[ebp-164]
	imul	dword868,dword ptr [__texture_width]
	add	dword868,[ebp-160]
	sal	dword868,2
	add	dword868,dword ptr [__texture_data]
	mov	dword872,[dword868]
	mov	[ebp-168],dword872
label0020:
; end of inline function _tex2d
	mov	dword790,[ebp-168]
	mov	[ebp-116],dword790
	mov	dword794,[ebp-116]
	sar	dword794,24
	and	dword794,255
	mov	[ebp-144],dword794
	cmp	dword ptr [ebp-144],0
	je	label001f
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword802,[ebp-108]
	mov	dword804,[dword802]
	mov	[ebp-132],dword804
	mov	dword807,[ebp-132]
	and	dword807,65280
	sar	dword807,8
	mov	[ebp-136],dword807
	mov	dword812,[ebp-132]
	and	dword812,255
	mov	[ebp-140],dword812
	mov	dword816,[ebp-116]
	and	dword816,65280
	sar	dword816,8
	mov	[ebp-124],dword816
	mov	dword821,[ebp-116]
	and	dword821,255
	mov	[ebp-128],dword821
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword827
	mov	[ebp-124],dword827
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword833
	mov	[ebp-128],dword833
	mov	dword837,[ebp-124]
	sal	dword837,8
	add	dword837,[ebp-128]
	mov	[ebp-120],dword837
	mov	dword841,[ebp-108]
	mov	dword843,[ebp-120]
	mov	[dword841],dword843
label001f:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label001d:
	add	dword ptr [ebp-108],4
	mov	dword850,[ebp-108]
	cmp	dword850,[ebp-112]
	jl	label001c
label001e:
label0021:
; end of inline function _rasterize_horiz_line
	jmp	label001b
label001a:
	mov	dword879,[ebp-44]
	mov	[ebp-80],dword879
	mov	dword878,[ebp-48]
	mov	[ebp-84],dword878
	mov	dword877,[ebp-52]
	mov	[ebp-88],dword877
	mov	dword876,[ebp-56]
	mov	[ebp-92],dword876
	mov	dword875,[ebp-68]
	mov	[ebp-96],dword875
	mov	dword874,[ebp-76]
	mov	[ebp-100],dword874
	mov	dword873,[ebp-72]
	mov	[ebp-104],dword873
; start of inline function _rasterize_horiz_line
	mov	dword883,dword ptr [__pitch]
	imul	dword883,[ebp-96]
	add	dword883,dword ptr [__videomem]
	mov	dword887,[ebp-104]
	sal	dword887,2
	add	dword883,dword887
	mov	[ebp-108],dword883
	mov	dword891,[ebp-100]
	sal	dword891,2
	add	dword891,[ebp-108]
	mov	dword895,[ebp-104]
	sal	dword895,2
	sub	dword891,dword895
	mov	[ebp-112],dword891
label0022:
	mov	dword961,[ebp-88]
	mov	[ebp-152],dword961
	mov	dword960,[ebp-92]
	mov	[ebp-156],dword960
; start of inline function _tex2d
	mov	dword965,dword ptr [__texture_width]
	dec	dword965
	int2float	dword965
	fmul	dword ptr [ebp-156]
	float2int	dword967
	mov	[ebp-160],dword967
	mov	dword971,dword ptr [__texture_height]
	dec	dword971
	int2float	dword971
	fmul	dword ptr [ebp-152]
	float2int	dword973
	mov	[ebp-164],dword973
	mov	dword977,[ebp-164]
	imul	dword977,dword ptr [__texture_width]
	add	dword977,[ebp-160]
	sal	dword977,2
	add	dword977,dword ptr [__texture_data]
	mov	dword981,[dword977]
	mov	[ebp-168],dword981
label0026:
; end of inline function _tex2d
	mov	dword899,[ebp-168]
	mov	[ebp-116],dword899
	mov	dword903,[ebp-116]
	sar	dword903,24
	and	dword903,255
	mov	[ebp-144],dword903
	cmp	dword ptr [ebp-144],0
	je	label0025
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword911,[ebp-108]
	mov	dword913,[dword911]
	mov	[ebp-132],dword913
	mov	dword916,[ebp-132]
	and	dword916,65280
	sar	dword916,8
	mov	[ebp-136],dword916
	mov	dword921,[ebp-132]
	and	dword921,255
	mov	[ebp-140],dword921
	mov	dword925,[ebp-116]
	and	dword925,65280
	sar	dword925,8
	mov	[ebp-124],dword925
	mov	dword930,[ebp-116]
	and	dword930,255
	mov	[ebp-128],dword930
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword936
	mov	[ebp-124],dword936
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword942
	mov	[ebp-128],dword942
	mov	dword946,[ebp-124]
	sal	dword946,8
	add	dword946,[ebp-128]
	mov	[ebp-120],dword946
	mov	dword950,[ebp-108]
	mov	dword952,[ebp-120]
	mov	[dword950],dword952
label0025:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0023:
	add	dword ptr [ebp-108],4
	mov	dword959,[ebp-108]
	cmp	dword959,[ebp-112]
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
	mov	dword990,[ebp-40]
	mov	[ebp-44],dword990
	mov	dword989,[ebp-36]
	mov	[ebp-48],dword989
	mov	dword988,[ebp-32]
	mov	[ebp-52],dword988
	mov	dword987,[ebp-28]
	mov	[ebp-56],dword987
	mov	dword986,[ebp-24]
	mov	[ebp-60],dword986
	mov	dword985,[ebp-20]
	mov	[ebp-64],dword985
	mov	dword984,[ebp-16]
	mov	[ebp-68],dword984
	mov	dword983,[ebp-12]
	mov	[ebp-72],dword983
	mov	dword982,[ebp-8]
	mov	[ebp-76],dword982
; start of inline function _rasterize_horiz_line__unordered
	mov	dword994,[ebp-76]
	cmp	dword994,[ebp-72]
	jg	label0029
	mov	dword1015,[ebp-44]
	mov	[ebp-80],dword1015
	mov	dword1014,[ebp-48]
	mov	[ebp-84],dword1014
	mov	dword1013,[ebp-60]
	mov	[ebp-88],dword1013
	mov	dword1012,[ebp-64]
	mov	[ebp-92],dword1012
	mov	dword1011,[ebp-68]
	mov	[ebp-96],dword1011
	mov	dword1010,[ebp-72]
	mov	[ebp-100],dword1010
	mov	dword1009,[ebp-76]
	mov	[ebp-104],dword1009
; start of inline function _rasterize_horiz_line
	mov	dword1019,dword ptr [__pitch]
	imul	dword1019,[ebp-96]
	add	dword1019,dword ptr [__videomem]
	mov	dword1023,[ebp-104]
	sal	dword1023,2
	add	dword1019,dword1023
	mov	[ebp-108],dword1019
	mov	dword1027,[ebp-100]
	sal	dword1027,2
	add	dword1027,[ebp-108]
	mov	dword1031,[ebp-104]
	sal	dword1031,2
	sub	dword1027,dword1031
	mov	[ebp-112],dword1027
label002b:
	mov	dword1097,[ebp-88]
	mov	[ebp-152],dword1097
	mov	dword1096,[ebp-92]
	mov	[ebp-156],dword1096
; start of inline function _tex2d
	mov	dword1101,dword ptr [__texture_width]
	dec	dword1101
	int2float	dword1101
	fmul	dword ptr [ebp-156]
	float2int	dword1103
	mov	[ebp-160],dword1103
	mov	dword1107,dword ptr [__texture_height]
	dec	dword1107
	int2float	dword1107
	fmul	dword ptr [ebp-152]
	float2int	dword1109
	mov	[ebp-164],dword1109
	mov	dword1113,[ebp-164]
	imul	dword1113,dword ptr [__texture_width]
	add	dword1113,[ebp-160]
	sal	dword1113,2
	add	dword1113,dword ptr [__texture_data]
	mov	dword1117,[dword1113]
	mov	[ebp-168],dword1117
label002f:
; end of inline function _tex2d
	mov	dword1035,[ebp-168]
	mov	[ebp-116],dword1035
	mov	dword1039,[ebp-116]
	sar	dword1039,24
	and	dword1039,255
	mov	[ebp-144],dword1039
	cmp	dword ptr [ebp-144],0
	je	label002e
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword1047,[ebp-108]
	mov	dword1049,[dword1047]
	mov	[ebp-132],dword1049
	mov	dword1052,[ebp-132]
	and	dword1052,65280
	sar	dword1052,8
	mov	[ebp-136],dword1052
	mov	dword1057,[ebp-132]
	and	dword1057,255
	mov	[ebp-140],dword1057
	mov	dword1061,[ebp-116]
	and	dword1061,65280
	sar	dword1061,8
	mov	[ebp-124],dword1061
	mov	dword1066,[ebp-116]
	and	dword1066,255
	mov	[ebp-128],dword1066
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword1072
	mov	[ebp-124],dword1072
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword1078
	mov	[ebp-128],dword1078
	mov	dword1082,[ebp-124]
	sal	dword1082,8
	add	dword1082,[ebp-128]
	mov	[ebp-120],dword1082
	mov	dword1086,[ebp-108]
	mov	dword1088,[ebp-120]
	mov	[dword1086],dword1088
label002e:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label002c:
	add	dword ptr [ebp-108],4
	mov	dword1095,[ebp-108]
	cmp	dword1095,[ebp-112]
	jl	label002b
label002d:
label0030:
; end of inline function _rasterize_horiz_line
	jmp	label002a
label0029:
	mov	dword1124,[ebp-44]
	mov	[ebp-80],dword1124
	mov	dword1123,[ebp-48]
	mov	[ebp-84],dword1123
	mov	dword1122,[ebp-52]
	mov	[ebp-88],dword1122
	mov	dword1121,[ebp-56]
	mov	[ebp-92],dword1121
	mov	dword1120,[ebp-68]
	mov	[ebp-96],dword1120
	mov	dword1119,[ebp-76]
	mov	[ebp-100],dword1119
	mov	dword1118,[ebp-72]
	mov	[ebp-104],dword1118
; start of inline function _rasterize_horiz_line
	mov	dword1128,dword ptr [__pitch]
	imul	dword1128,[ebp-96]
	add	dword1128,dword ptr [__videomem]
	mov	dword1132,[ebp-104]
	sal	dword1132,2
	add	dword1128,dword1132
	mov	[ebp-108],dword1128
	mov	dword1136,[ebp-100]
	sal	dword1136,2
	add	dword1136,[ebp-108]
	mov	dword1140,[ebp-104]
	sal	dword1140,2
	sub	dword1136,dword1140
	mov	[ebp-112],dword1136
label0031:
	mov	dword1206,[ebp-88]
	mov	[ebp-152],dword1206
	mov	dword1205,[ebp-92]
	mov	[ebp-156],dword1205
; start of inline function _tex2d
	mov	dword1210,dword ptr [__texture_width]
	dec	dword1210
	int2float	dword1210
	fmul	dword ptr [ebp-156]
	float2int	dword1212
	mov	[ebp-160],dword1212
	mov	dword1216,dword ptr [__texture_height]
	dec	dword1216
	int2float	dword1216
	fmul	dword ptr [ebp-152]
	float2int	dword1218
	mov	[ebp-164],dword1218
	mov	dword1222,[ebp-164]
	imul	dword1222,dword ptr [__texture_width]
	add	dword1222,[ebp-160]
	sal	dword1222,2
	add	dword1222,dword ptr [__texture_data]
	mov	dword1226,[dword1222]
	mov	[ebp-168],dword1226
label0035:
; end of inline function _tex2d
	mov	dword1144,[ebp-168]
	mov	[ebp-116],dword1144
	mov	dword1148,[ebp-116]
	sar	dword1148,24
	and	dword1148,255
	mov	[ebp-144],dword1148
	cmp	dword ptr [ebp-144],0
	je	label0034
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	dword1156,[ebp-108]
	mov	dword1158,[dword1156]
	mov	[ebp-132],dword1158
	mov	dword1161,[ebp-132]
	and	dword1161,65280
	sar	dword1161,8
	mov	[ebp-136],dword1161
	mov	dword1166,[ebp-132]
	and	dword1166,255
	mov	[ebp-140],dword1166
	mov	dword1170,[ebp-116]
	and	dword1170,65280
	sar	dword1170,8
	mov	[ebp-124],dword1170
	mov	dword1175,[ebp-116]
	and	dword1175,255
	mov	[ebp-128],dword1175
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword1181
	mov	[ebp-124],dword1181
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	float2int	dword1187
	mov	[ebp-128],dword1187
	mov	dword1191,[ebp-124]
	sal	dword1191,8
	add	dword1191,[ebp-128]
	mov	[ebp-120],dword1191
	mov	dword1195,[ebp-108]
	mov	dword1197,[ebp-120]
	mov	[dword1195],dword1197
label0034:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0032:
	add	dword ptr [ebp-108],4
	mov	dword1204,[ebp-108]
	cmp	dword1204,[ebp-112]
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
	mov	dword2004,[ebp+8]
	mov	[ebp-448],dword2004
; start of inline function _clip_poligon
	lea	dword2006,dword ptr [__clip_z_far_norm]
	mov	[ebp-648],dword2006
	lea	dword2007,dword ptr [__clip_z_far_base]
	mov	[ebp-652],dword2007
	mov	dword2034,[ebp-448]
	mov	[ebp-656],dword2034
	lea	dword2009,[ebp-644]
	mov	[ebp-660],dword2009
; start of inline function _clip_on_plain
	mov	dword2037,[ebp-660]
	mov	dword ptr [dword2037+192],0
	mov	dword2040,[ebp-656]
	mov	[ebp-664],dword2040
	mov	dword2043,[ebp-656]
	add	dword2043,24
	mov	[ebp-668],dword2043
label0070:
label0071:
	mov	dword2047,[ebp-656]
	mov	dword2049,[dword2047+192]
	imul	dword2049,24
	mov	dword2051,[ebp-656]
	add	dword2051,dword2049
	cmp	dword2051,[ebp-668]
	jle	label0072
	mov	dword2197,[ebp-652]
	mov	[ebp-768],dword2197
	mov	dword2055,[ebp-664]
	mov	[ebp-772],dword2055
	lea	dword2056,[ebp-684]
	mov	[ebp-776],dword2056
; start of inline function vec4f_subtract
	mov	dword2200,[ebp-772]
	mov	dword2202,[ebp-768]
	fld	dword ptr [dword2200]
	fsub	dword ptr [dword2202]
	mov	dword2204,[ebp-776]
	fstp	dword ptr [dword2204]
	mov	dword2206,[ebp-772]
	mov	dword2208,[ebp-768]
	fld	dword ptr [dword2206+4]
	fsub	dword ptr [dword2208+4]
	mov	dword2210,[ebp-776]
	fstp	dword ptr [dword2210+4]
	mov	dword2212,[ebp-772]
	mov	dword2214,[ebp-768]
	fld	dword ptr [dword2212+8]
	fsub	dword ptr [dword2214+8]
	mov	dword2216,[ebp-776]
	fstp	dword ptr [dword2216+8]
	mov	dword2218,[ebp-772]
	mov	dword2220,[ebp-768]
	fld	dword ptr [dword2218+12]
	fsub	dword ptr [dword2220+12]
	mov	dword2222,[ebp-776]
	fstp	dword ptr [dword2222+12]
label007b:
; end of inline function vec4f_subtract
	mov	dword2300,[ebp-648]
	mov	[ebp-780],dword2300
	lea	dword2058,[ebp-684]
	mov	[ebp-784],dword2058
; start of inline function vec4f_dot
	mov	dword2303,[ebp-784]
	mov	dword2305,[ebp-780]
	fld	dword ptr [dword2303+4]
	fmul	dword ptr [dword2305+4]
	mov	dword2307,[ebp-784]
	mov	dword2309,[ebp-780]
	fld	dword ptr [dword2307]
	fmul	dword ptr [dword2309]
	faddp
	mov	dword2311,[ebp-784]
	mov	dword2313,[ebp-780]
	fld	dword ptr [dword2311+8]
	fmul	dword ptr [dword2313+8]
	faddp
	mov	dword2315,[ebp-784]
	mov	dword2317,[ebp-780]
	fld	dword ptr [dword2315+12]
	fmul	dword ptr [dword2317+12]
	faddp
	fstp	dword ptr [ebp-788]
label007f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword2223,[ebp-652]
	mov	[ebp-768],dword2223
	mov	dword2062,[ebp-668]
	mov	[ebp-772],dword2062
	lea	dword2063,[ebp-684]
	mov	[ebp-776],dword2063
; start of inline function vec4f_subtract
	mov	dword2226,[ebp-772]
	mov	dword2228,[ebp-768]
	fld	dword ptr [dword2226]
	fsub	dword ptr [dword2228]
	mov	dword2230,[ebp-776]
	fstp	dword ptr [dword2230]
	mov	dword2232,[ebp-772]
	mov	dword2234,[ebp-768]
	fld	dword ptr [dword2232+4]
	fsub	dword ptr [dword2234+4]
	mov	dword2236,[ebp-776]
	fstp	dword ptr [dword2236+4]
	mov	dword2238,[ebp-772]
	mov	dword2240,[ebp-768]
	fld	dword ptr [dword2238+8]
	fsub	dword ptr [dword2240+8]
	mov	dword2242,[ebp-776]
	fstp	dword ptr [dword2242+8]
	mov	dword2244,[ebp-772]
	mov	dword2246,[ebp-768]
	fld	dword ptr [dword2244+12]
	fsub	dword ptr [dword2246+12]
	mov	dword2248,[ebp-776]
	fstp	dword ptr [dword2248+12]
label007c:
; end of inline function vec4f_subtract
	mov	dword2318,[ebp-648]
	mov	[ebp-780],dword2318
	lea	dword2065,[ebp-684]
	mov	[ebp-784],dword2065
; start of inline function vec4f_dot
	mov	dword2321,[ebp-784]
	mov	dword2323,[ebp-780]
	fld	dword ptr [dword2321+4]
	fmul	dword ptr [dword2323+4]
	mov	dword2325,[ebp-784]
	mov	dword2327,[ebp-780]
	fld	dword ptr [dword2325]
	fmul	dword ptr [dword2327]
	faddp
	mov	dword2329,[ebp-784]
	mov	dword2331,[ebp-780]
	fld	dword ptr [dword2329+8]
	fmul	dword ptr [dword2331+8]
	faddp
	mov	dword2333,[ebp-784]
	mov	dword2335,[ebp-780]
	fld	dword ptr [dword2333+12]
	fmul	dword ptr [dword2335+12]
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
	mov	dword2069,[ebp-660]
	mov	dword2070,[dword2069+192]
	inc	dword ptr [dword2069+192]
	imul	dword2070,24
	mov	dword2073,[ebp-660]
	add	dword2073,dword2070
	mov	dword2075,[ebp-664]
	mov	dword2076,[dword2075]
	mov	dword2077,[dword2075+4]
	mov	[dword2073],dword2076
	mov	[dword2073+4],dword2077
	mov	dword2076,[dword2075+8]
	mov	dword2077,[dword2075+12]
	mov	[dword2073+8],dword2076
	mov	[dword2073+12],dword2077
	mov	dword2076,[dword2075+16]
	mov	dword2077,[dword2075+20]
	mov	[dword2073+16],dword2076
	mov	[dword2073+20],dword2077
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
	mov	dword2083,[ebp-664]
	mov	[ebp-768],dword2083
	mov	dword2249,[ebp-652]
	mov	[ebp-772],dword2249
	lea	dword2085,[ebp-684]
	mov	[ebp-776],dword2085
; start of inline function vec4f_subtract
	mov	dword2252,[ebp-772]
	mov	dword2254,[ebp-768]
	fld	dword ptr [dword2252]
	fsub	dword ptr [dword2254]
	mov	dword2256,[ebp-776]
	fstp	dword ptr [dword2256]
	mov	dword2258,[ebp-772]
	mov	dword2260,[ebp-768]
	fld	dword ptr [dword2258+4]
	fsub	dword ptr [dword2260+4]
	mov	dword2262,[ebp-776]
	fstp	dword ptr [dword2262+4]
	mov	dword2264,[ebp-772]
	mov	dword2266,[ebp-768]
	fld	dword ptr [dword2264+8]
	fsub	dword ptr [dword2266+8]
	mov	dword2268,[ebp-776]
	fstp	dword ptr [dword2268+8]
	mov	dword2270,[ebp-772]
	mov	dword2272,[ebp-768]
	fld	dword ptr [dword2270+12]
	fsub	dword ptr [dword2272+12]
	mov	dword2274,[ebp-776]
	fstp	dword ptr [dword2274+12]
label007d:
; end of inline function vec4f_subtract
	mov	dword2087,[ebp-664]
	mov	[ebp-768],dword2087
	mov	dword2089,[ebp-668]
	mov	[ebp-772],dword2089
	lea	dword2090,[ebp-700]
	mov	[ebp-776],dword2090
; start of inline function vec4f_subtract
	mov	dword2277,[ebp-772]
	mov	dword2279,[ebp-768]
	fld	dword ptr [dword2277]
	fsub	dword ptr [dword2279]
	mov	dword2281,[ebp-776]
	fstp	dword ptr [dword2281]
	mov	dword2283,[ebp-772]
	mov	dword2285,[ebp-768]
	fld	dword ptr [dword2283+4]
	fsub	dword ptr [dword2285+4]
	mov	dword2287,[ebp-776]
	fstp	dword ptr [dword2287+4]
	mov	dword2289,[ebp-772]
	mov	dword2291,[ebp-768]
	fld	dword ptr [dword2289+8]
	fsub	dword ptr [dword2291+8]
	mov	dword2293,[ebp-776]
	fstp	dword ptr [dword2293+8]
	mov	dword2295,[ebp-772]
	mov	dword2297,[ebp-768]
	fld	dword ptr [dword2295+12]
	fsub	dword ptr [dword2297+12]
	mov	dword2299,[ebp-776]
	fstp	dword ptr [dword2299+12]
label007e:
; end of inline function vec4f_subtract
	mov	dword2336,[ebp-648]
	mov	[ebp-780],dword2336
	lea	dword2092,[ebp-684]
	mov	[ebp-784],dword2092
; start of inline function vec4f_dot
	mov	dword2339,[ebp-784]
	mov	dword2341,[ebp-780]
	fld	dword ptr [dword2339+4]
	fmul	dword ptr [dword2341+4]
	mov	dword2343,[ebp-784]
	mov	dword2345,[ebp-780]
	fld	dword ptr [dword2343]
	fmul	dword ptr [dword2345]
	faddp
	mov	dword2347,[ebp-784]
	mov	dword2349,[ebp-780]
	fld	dword ptr [dword2347+8]
	fmul	dword ptr [dword2349+8]
	faddp
	mov	dword2351,[ebp-784]
	mov	dword2353,[ebp-780]
	fld	dword ptr [dword2351+12]
	fmul	dword ptr [dword2353+12]
	faddp
	fstp	dword ptr [ebp-788]
label0081:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword2354,[ebp-648]
	mov	[ebp-780],dword2354
	lea	dword2094,[ebp-700]
	mov	[ebp-784],dword2094
; start of inline function vec4f_dot
	mov	dword2357,[ebp-784]
	mov	dword2359,[ebp-780]
	fld	dword ptr [dword2357+4]
	fmul	dword ptr [dword2359+4]
	mov	dword2361,[ebp-784]
	mov	dword2363,[ebp-780]
	fld	dword ptr [dword2361]
	fmul	dword ptr [dword2363]
	faddp
	mov	dword2365,[ebp-784]
	mov	dword2367,[ebp-780]
	fld	dword ptr [dword2365+8]
	fmul	dword ptr [dword2367+8]
	faddp
	mov	dword2369,[ebp-784]
	mov	dword2371,[ebp-780]
	fld	dword ptr [dword2369+12]
	fmul	dword ptr [dword2371+12]
	faddp
	fstp	dword ptr [ebp-788]
label0082:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword2372,[ebp-720]
	mov	[ebp-792],dword2372
	lea	dword2097,[ebp-700]
	mov	[ebp-796],dword2097
; start of inline function vec4f_mul
	mov	dword2375,[ebp-796]
	fld	dword ptr [dword2375]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2375]
	mov	dword2378,[ebp-796]
	fld	dword ptr [dword2378+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2378+4]
	mov	dword2381,[ebp-796]
	fld	dword ptr [dword2381+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2381+8]
	mov	dword2384,[ebp-796]
	fld	dword ptr [dword2384+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2384+12]
label0083:
; end of inline function vec4f_mul
	lea	dword2098,[ebp-700]
	mov	[ebp-756],dword2098
	mov	dword2100,[ebp-664]
	mov	[ebp-760],dword2100
	mov	dword2102,[ebp-660]
	mov	dword2104,[dword2102+192]
	imul	dword2104,24
	mov	dword2106,[ebp-660]
	add	dword2106,dword2104
	mov	[ebp-764],dword2106
; start of inline function vec4f_add
	mov	dword2174,[ebp-760]
	mov	dword2176,[ebp-756]
	fld	dword ptr [dword2174]
	fadd	dword ptr [dword2176]
	mov	dword2178,[ebp-764]
	fstp	dword ptr [dword2178]
	mov	dword2180,[ebp-760]
	mov	dword2182,[ebp-756]
	fld	dword ptr [dword2180+4]
	fadd	dword ptr [dword2182+4]
	mov	dword2184,[ebp-764]
	fstp	dword ptr [dword2184+4]
	mov	dword2186,[ebp-760]
	mov	dword2188,[ebp-756]
	fld	dword ptr [dword2186+8]
	fadd	dword ptr [dword2188+8]
	mov	dword2190,[ebp-764]
	fstp	dword ptr [dword2190+8]
	mov	dword2192,[ebp-760]
	mov	dword2194,[ebp-756]
	fld	dword ptr [dword2192+12]
	fadd	dword ptr [dword2194+12]
	mov	dword2196,[ebp-764]
	fstp	dword ptr [dword2196+12]
label007a:
; end of inline function vec4f_add
	mov	dword2108,16
	add	dword2108,[ebp-664]
	mov	[ebp-736],dword2108
	mov	dword2110,16
	add	dword2110,[ebp-668]
	mov	[ebp-740],dword2110
	lea	dword2111,[ebp-708]
	mov	[ebp-744],dword2111
; start of inline function vec2f_subtract
	mov	dword2153,[ebp-740]
	mov	dword2155,[ebp-736]
	fld	dword ptr [dword2153]
	fsub	dword ptr [dword2155]
	mov	dword2157,[ebp-744]
	fstp	dword ptr [dword2157]
	mov	dword2159,[ebp-740]
	mov	dword2161,[ebp-736]
	fld	dword ptr [dword2159+4]
	fsub	dword ptr [dword2161+4]
	mov	dword2163,[ebp-744]
	fstp	dword ptr [dword2163+4]
label0078:
; end of inline function vec2f_subtract
	mov	dword2164,[ebp-720]
	mov	[ebp-748],dword2164
	lea	dword2113,[ebp-708]
	mov	[ebp-752],dword2113
; start of inline function vec2f_mul
	mov	dword2167,[ebp-752]
	fld	dword ptr [dword2167]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2167]
	mov	dword2170,[ebp-752]
	fld	dword ptr [dword2170+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2170+4]
label0079:
; end of inline function vec2f_mul
	lea	dword2114,[ebp-708]
	mov	[ebp-724],dword2114
	mov	dword2116,16
	add	dword2116,[ebp-664]
	mov	[ebp-728],dword2116
	mov	dword2118,[ebp-660]
	mov	dword2120,[dword2118+192]
	imul	dword2120,24
	mov	dword2122,[ebp-660]
	add	dword2122,dword2120
	add	dword2122,16
	mov	[ebp-732],dword2122
; start of inline function vec2f_add
	mov	dword2140,[ebp-728]
	mov	dword2142,[ebp-724]
	fld	dword ptr [dword2140]
	fadd	dword ptr [dword2142]
	mov	dword2144,[ebp-732]
	fstp	dword ptr [dword2144]
	mov	dword2146,[ebp-728]
	mov	dword2148,[ebp-724]
	fld	dword ptr [dword2146+4]
	fadd	dword ptr [dword2148+4]
	mov	dword2150,[ebp-732]
	fstp	dword ptr [dword2150+4]
label0077:
; end of inline function vec2f_add
	mov	dword2125,[ebp-660]
	inc	dword ptr [dword2125+192]
label0074:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label0071
label0072:
	mov	dword2129,[ebp-660]
	mov	dword2130,[dword2129+192]
	inc	dword ptr [dword2129+192]
	imul	dword2130,24
	mov	dword2133,[ebp-660]
	add	dword2133,dword2130
	mov	dword2135,[ebp-660]
	mov	dword2136,[dword2135]
	mov	dword2137,[dword2135+4]
	mov	[dword2133],dword2136
	mov	[dword2133+4],dword2137
	mov	dword2136,[dword2135+8]
	mov	dword2137,[dword2135+12]
	mov	[dword2133+8],dword2136
	mov	[dword2133+12],dword2137
	mov	dword2136,[dword2135+16]
	mov	dword2137,[dword2135+20]
	mov	[dword2133+16],dword2136
	mov	[dword2133+20],dword2137
label0084:
; end of inline function _clip_on_plain
	lea	dword2010,dword ptr [__clip_z_near_norm]
	mov	[ebp-648],dword2010
	lea	dword2011,dword ptr [__clip_z_near_base]
	mov	[ebp-652],dword2011
	lea	dword2012,[ebp-644]
	mov	[ebp-656],dword2012
	mov	dword2386,[ebp-448]
	mov	[ebp-660],dword2386
; start of inline function _clip_on_plain
	mov	dword2389,[ebp-660]
	mov	dword ptr [dword2389+192],0
	mov	dword2392,[ebp-656]
	mov	[ebp-664],dword2392
	mov	dword2395,[ebp-656]
	add	dword2395,24
	mov	[ebp-668],dword2395
label0085:
label0086:
	mov	dword2399,[ebp-656]
	mov	dword2401,[dword2399+192]
	imul	dword2401,24
	mov	dword2403,[ebp-656]
	add	dword2403,dword2401
	cmp	dword2403,[ebp-668]
	jle	label0087
	mov	dword2549,[ebp-652]
	mov	[ebp-768],dword2549
	mov	dword2407,[ebp-664]
	mov	[ebp-772],dword2407
	lea	dword2408,[ebp-684]
	mov	[ebp-776],dword2408
; start of inline function vec4f_subtract
	mov	dword2552,[ebp-772]
	mov	dword2554,[ebp-768]
	fld	dword ptr [dword2552]
	fsub	dword ptr [dword2554]
	mov	dword2556,[ebp-776]
	fstp	dword ptr [dword2556]
	mov	dword2558,[ebp-772]
	mov	dword2560,[ebp-768]
	fld	dword ptr [dword2558+4]
	fsub	dword ptr [dword2560+4]
	mov	dword2562,[ebp-776]
	fstp	dword ptr [dword2562+4]
	mov	dword2564,[ebp-772]
	mov	dword2566,[ebp-768]
	fld	dword ptr [dword2564+8]
	fsub	dword ptr [dword2566+8]
	mov	dword2568,[ebp-776]
	fstp	dword ptr [dword2568+8]
	mov	dword2570,[ebp-772]
	mov	dword2572,[ebp-768]
	fld	dword ptr [dword2570+12]
	fsub	dword ptr [dword2572+12]
	mov	dword2574,[ebp-776]
	fstp	dword ptr [dword2574+12]
label0090:
; end of inline function vec4f_subtract
	mov	dword2652,[ebp-648]
	mov	[ebp-780],dword2652
	lea	dword2410,[ebp-684]
	mov	[ebp-784],dword2410
; start of inline function vec4f_dot
	mov	dword2655,[ebp-784]
	mov	dword2657,[ebp-780]
	fld	dword ptr [dword2655+4]
	fmul	dword ptr [dword2657+4]
	mov	dword2659,[ebp-784]
	mov	dword2661,[ebp-780]
	fld	dword ptr [dword2659]
	fmul	dword ptr [dword2661]
	faddp
	mov	dword2663,[ebp-784]
	mov	dword2665,[ebp-780]
	fld	dword ptr [dword2663+8]
	fmul	dword ptr [dword2665+8]
	faddp
	mov	dword2667,[ebp-784]
	mov	dword2669,[ebp-780]
	fld	dword ptr [dword2667+12]
	fmul	dword ptr [dword2669+12]
	faddp
	fstp	dword ptr [ebp-788]
label0094:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword2575,[ebp-652]
	mov	[ebp-768],dword2575
	mov	dword2414,[ebp-668]
	mov	[ebp-772],dword2414
	lea	dword2415,[ebp-684]
	mov	[ebp-776],dword2415
; start of inline function vec4f_subtract
	mov	dword2578,[ebp-772]
	mov	dword2580,[ebp-768]
	fld	dword ptr [dword2578]
	fsub	dword ptr [dword2580]
	mov	dword2582,[ebp-776]
	fstp	dword ptr [dword2582]
	mov	dword2584,[ebp-772]
	mov	dword2586,[ebp-768]
	fld	dword ptr [dword2584+4]
	fsub	dword ptr [dword2586+4]
	mov	dword2588,[ebp-776]
	fstp	dword ptr [dword2588+4]
	mov	dword2590,[ebp-772]
	mov	dword2592,[ebp-768]
	fld	dword ptr [dword2590+8]
	fsub	dword ptr [dword2592+8]
	mov	dword2594,[ebp-776]
	fstp	dword ptr [dword2594+8]
	mov	dword2596,[ebp-772]
	mov	dword2598,[ebp-768]
	fld	dword ptr [dword2596+12]
	fsub	dword ptr [dword2598+12]
	mov	dword2600,[ebp-776]
	fstp	dword ptr [dword2600+12]
label0091:
; end of inline function vec4f_subtract
	mov	dword2670,[ebp-648]
	mov	[ebp-780],dword2670
	lea	dword2417,[ebp-684]
	mov	[ebp-784],dword2417
; start of inline function vec4f_dot
	mov	dword2673,[ebp-784]
	mov	dword2675,[ebp-780]
	fld	dword ptr [dword2673+4]
	fmul	dword ptr [dword2675+4]
	mov	dword2677,[ebp-784]
	mov	dword2679,[ebp-780]
	fld	dword ptr [dword2677]
	fmul	dword ptr [dword2679]
	faddp
	mov	dword2681,[ebp-784]
	mov	dword2683,[ebp-780]
	fld	dword ptr [dword2681+8]
	fmul	dword ptr [dword2683+8]
	faddp
	mov	dword2685,[ebp-784]
	mov	dword2687,[ebp-780]
	fld	dword ptr [dword2685+12]
	fmul	dword ptr [dword2687+12]
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
	mov	dword2421,[ebp-660]
	mov	dword2422,[dword2421+192]
	inc	dword ptr [dword2421+192]
	imul	dword2422,24
	mov	dword2425,[ebp-660]
	add	dword2425,dword2422
	mov	dword2427,[ebp-664]
	mov	dword2428,[dword2427]
	mov	dword2429,[dword2427+4]
	mov	[dword2425],dword2428
	mov	[dword2425+4],dword2429
	mov	dword2428,[dword2427+8]
	mov	dword2429,[dword2427+12]
	mov	[dword2425+8],dword2428
	mov	[dword2425+12],dword2429
	mov	dword2428,[dword2427+16]
	mov	dword2429,[dword2427+20]
	mov	[dword2425+16],dword2428
	mov	[dword2425+20],dword2429
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
	mov	dword2435,[ebp-664]
	mov	[ebp-768],dword2435
	mov	dword2601,[ebp-652]
	mov	[ebp-772],dword2601
	lea	dword2437,[ebp-684]
	mov	[ebp-776],dword2437
; start of inline function vec4f_subtract
	mov	dword2604,[ebp-772]
	mov	dword2606,[ebp-768]
	fld	dword ptr [dword2604]
	fsub	dword ptr [dword2606]
	mov	dword2608,[ebp-776]
	fstp	dword ptr [dword2608]
	mov	dword2610,[ebp-772]
	mov	dword2612,[ebp-768]
	fld	dword ptr [dword2610+4]
	fsub	dword ptr [dword2612+4]
	mov	dword2614,[ebp-776]
	fstp	dword ptr [dword2614+4]
	mov	dword2616,[ebp-772]
	mov	dword2618,[ebp-768]
	fld	dword ptr [dword2616+8]
	fsub	dword ptr [dword2618+8]
	mov	dword2620,[ebp-776]
	fstp	dword ptr [dword2620+8]
	mov	dword2622,[ebp-772]
	mov	dword2624,[ebp-768]
	fld	dword ptr [dword2622+12]
	fsub	dword ptr [dword2624+12]
	mov	dword2626,[ebp-776]
	fstp	dword ptr [dword2626+12]
label0092:
; end of inline function vec4f_subtract
	mov	dword2439,[ebp-664]
	mov	[ebp-768],dword2439
	mov	dword2441,[ebp-668]
	mov	[ebp-772],dword2441
	lea	dword2442,[ebp-700]
	mov	[ebp-776],dword2442
; start of inline function vec4f_subtract
	mov	dword2629,[ebp-772]
	mov	dword2631,[ebp-768]
	fld	dword ptr [dword2629]
	fsub	dword ptr [dword2631]
	mov	dword2633,[ebp-776]
	fstp	dword ptr [dword2633]
	mov	dword2635,[ebp-772]
	mov	dword2637,[ebp-768]
	fld	dword ptr [dword2635+4]
	fsub	dword ptr [dword2637+4]
	mov	dword2639,[ebp-776]
	fstp	dword ptr [dword2639+4]
	mov	dword2641,[ebp-772]
	mov	dword2643,[ebp-768]
	fld	dword ptr [dword2641+8]
	fsub	dword ptr [dword2643+8]
	mov	dword2645,[ebp-776]
	fstp	dword ptr [dword2645+8]
	mov	dword2647,[ebp-772]
	mov	dword2649,[ebp-768]
	fld	dword ptr [dword2647+12]
	fsub	dword ptr [dword2649+12]
	mov	dword2651,[ebp-776]
	fstp	dword ptr [dword2651+12]
label0093:
; end of inline function vec4f_subtract
	mov	dword2688,[ebp-648]
	mov	[ebp-780],dword2688
	lea	dword2444,[ebp-684]
	mov	[ebp-784],dword2444
; start of inline function vec4f_dot
	mov	dword2691,[ebp-784]
	mov	dword2693,[ebp-780]
	fld	dword ptr [dword2691+4]
	fmul	dword ptr [dword2693+4]
	mov	dword2695,[ebp-784]
	mov	dword2697,[ebp-780]
	fld	dword ptr [dword2695]
	fmul	dword ptr [dword2697]
	faddp
	mov	dword2699,[ebp-784]
	mov	dword2701,[ebp-780]
	fld	dword ptr [dword2699+8]
	fmul	dword ptr [dword2701+8]
	faddp
	mov	dword2703,[ebp-784]
	mov	dword2705,[ebp-780]
	fld	dword ptr [dword2703+12]
	fmul	dword ptr [dword2705+12]
	faddp
	fstp	dword ptr [ebp-788]
label0096:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword2706,[ebp-648]
	mov	[ebp-780],dword2706
	lea	dword2446,[ebp-700]
	mov	[ebp-784],dword2446
; start of inline function vec4f_dot
	mov	dword2709,[ebp-784]
	mov	dword2711,[ebp-780]
	fld	dword ptr [dword2709+4]
	fmul	dword ptr [dword2711+4]
	mov	dword2713,[ebp-784]
	mov	dword2715,[ebp-780]
	fld	dword ptr [dword2713]
	fmul	dword ptr [dword2715]
	faddp
	mov	dword2717,[ebp-784]
	mov	dword2719,[ebp-780]
	fld	dword ptr [dword2717+8]
	fmul	dword ptr [dword2719+8]
	faddp
	mov	dword2721,[ebp-784]
	mov	dword2723,[ebp-780]
	fld	dword ptr [dword2721+12]
	fmul	dword ptr [dword2723+12]
	faddp
	fstp	dword ptr [ebp-788]
label0097:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword2724,[ebp-720]
	mov	[ebp-792],dword2724
	lea	dword2449,[ebp-700]
	mov	[ebp-796],dword2449
; start of inline function vec4f_mul
	mov	dword2727,[ebp-796]
	fld	dword ptr [dword2727]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2727]
	mov	dword2730,[ebp-796]
	fld	dword ptr [dword2730+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2730+4]
	mov	dword2733,[ebp-796]
	fld	dword ptr [dword2733+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2733+8]
	mov	dword2736,[ebp-796]
	fld	dword ptr [dword2736+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword2736+12]
label0098:
; end of inline function vec4f_mul
	lea	dword2450,[ebp-700]
	mov	[ebp-756],dword2450
	mov	dword2452,[ebp-664]
	mov	[ebp-760],dword2452
	mov	dword2454,[ebp-660]
	mov	dword2456,[dword2454+192]
	imul	dword2456,24
	mov	dword2458,[ebp-660]
	add	dword2458,dword2456
	mov	[ebp-764],dword2458
; start of inline function vec4f_add
	mov	dword2526,[ebp-760]
	mov	dword2528,[ebp-756]
	fld	dword ptr [dword2526]
	fadd	dword ptr [dword2528]
	mov	dword2530,[ebp-764]
	fstp	dword ptr [dword2530]
	mov	dword2532,[ebp-760]
	mov	dword2534,[ebp-756]
	fld	dword ptr [dword2532+4]
	fadd	dword ptr [dword2534+4]
	mov	dword2536,[ebp-764]
	fstp	dword ptr [dword2536+4]
	mov	dword2538,[ebp-760]
	mov	dword2540,[ebp-756]
	fld	dword ptr [dword2538+8]
	fadd	dword ptr [dword2540+8]
	mov	dword2542,[ebp-764]
	fstp	dword ptr [dword2542+8]
	mov	dword2544,[ebp-760]
	mov	dword2546,[ebp-756]
	fld	dword ptr [dword2544+12]
	fadd	dword ptr [dword2546+12]
	mov	dword2548,[ebp-764]
	fstp	dword ptr [dword2548+12]
label008f:
; end of inline function vec4f_add
	mov	dword2460,16
	add	dword2460,[ebp-664]
	mov	[ebp-736],dword2460
	mov	dword2462,16
	add	dword2462,[ebp-668]
	mov	[ebp-740],dword2462
	lea	dword2463,[ebp-708]
	mov	[ebp-744],dword2463
; start of inline function vec2f_subtract
	mov	dword2505,[ebp-740]
	mov	dword2507,[ebp-736]
	fld	dword ptr [dword2505]
	fsub	dword ptr [dword2507]
	mov	dword2509,[ebp-744]
	fstp	dword ptr [dword2509]
	mov	dword2511,[ebp-740]
	mov	dword2513,[ebp-736]
	fld	dword ptr [dword2511+4]
	fsub	dword ptr [dword2513+4]
	mov	dword2515,[ebp-744]
	fstp	dword ptr [dword2515+4]
label008d:
; end of inline function vec2f_subtract
	mov	dword2516,[ebp-720]
	mov	[ebp-748],dword2516
	lea	dword2465,[ebp-708]
	mov	[ebp-752],dword2465
; start of inline function vec2f_mul
	mov	dword2519,[ebp-752]
	fld	dword ptr [dword2519]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2519]
	mov	dword2522,[ebp-752]
	fld	dword ptr [dword2522+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2522+4]
label008e:
; end of inline function vec2f_mul
	lea	dword2466,[ebp-708]
	mov	[ebp-724],dword2466
	mov	dword2468,16
	add	dword2468,[ebp-664]
	mov	[ebp-728],dword2468
	mov	dword2470,[ebp-660]
	mov	dword2472,[dword2470+192]
	imul	dword2472,24
	mov	dword2474,[ebp-660]
	add	dword2474,dword2472
	add	dword2474,16
	mov	[ebp-732],dword2474
; start of inline function vec2f_add
	mov	dword2492,[ebp-728]
	mov	dword2494,[ebp-724]
	fld	dword ptr [dword2492]
	fadd	dword ptr [dword2494]
	mov	dword2496,[ebp-732]
	fstp	dword ptr [dword2496]
	mov	dword2498,[ebp-728]
	mov	dword2500,[ebp-724]
	fld	dword ptr [dword2498+4]
	fadd	dword ptr [dword2500+4]
	mov	dword2502,[ebp-732]
	fstp	dword ptr [dword2502+4]
label008c:
; end of inline function vec2f_add
	mov	dword2477,[ebp-660]
	inc	dword ptr [dword2477+192]
label0089:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label0086
label0087:
	mov	dword2481,[ebp-660]
	mov	dword2482,[dword2481+192]
	inc	dword ptr [dword2481+192]
	imul	dword2482,24
	mov	dword2485,[ebp-660]
	add	dword2485,dword2482
	mov	dword2487,[ebp-660]
	mov	dword2488,[dword2487]
	mov	dword2489,[dword2487+4]
	mov	[dword2485],dword2488
	mov	[dword2485+4],dword2489
	mov	dword2488,[dword2487+8]
	mov	dword2489,[dword2487+12]
	mov	[dword2485+8],dword2488
	mov	[dword2485+12],dword2489
	mov	dword2488,[dword2487+16]
	mov	dword2489,[dword2487+20]
	mov	[dword2485+16],dword2488
	mov	[dword2485+20],dword2489
label0099:
; end of inline function _clip_on_plain
	lea	dword2014,dword ptr [__clip_plane_left_norm]
	mov	[ebp-648],dword2014
	lea	dword2015,dword ptr [__clip_plane_left_base]
	mov	[ebp-652],dword2015
	mov	dword2738,[ebp-448]
	mov	[ebp-656],dword2738
	lea	dword2017,[ebp-644]
	mov	[ebp-660],dword2017
; start of inline function _clip_on_plain
	mov	dword2741,[ebp-660]
	mov	dword ptr [dword2741+192],0
	mov	dword2744,[ebp-656]
	mov	[ebp-664],dword2744
	mov	dword2747,[ebp-656]
	add	dword2747,24
	mov	[ebp-668],dword2747
label009a:
label009b:
	mov	dword2751,[ebp-656]
	mov	dword2753,[dword2751+192]
	imul	dword2753,24
	mov	dword2755,[ebp-656]
	add	dword2755,dword2753
	cmp	dword2755,[ebp-668]
	jle	label009c
	mov	dword2901,[ebp-652]
	mov	[ebp-768],dword2901
	mov	dword2759,[ebp-664]
	mov	[ebp-772],dword2759
	lea	dword2760,[ebp-684]
	mov	[ebp-776],dword2760
; start of inline function vec4f_subtract
	mov	dword2904,[ebp-772]
	mov	dword2906,[ebp-768]
	fld	dword ptr [dword2904]
	fsub	dword ptr [dword2906]
	mov	dword2908,[ebp-776]
	fstp	dword ptr [dword2908]
	mov	dword2910,[ebp-772]
	mov	dword2912,[ebp-768]
	fld	dword ptr [dword2910+4]
	fsub	dword ptr [dword2912+4]
	mov	dword2914,[ebp-776]
	fstp	dword ptr [dword2914+4]
	mov	dword2916,[ebp-772]
	mov	dword2918,[ebp-768]
	fld	dword ptr [dword2916+8]
	fsub	dword ptr [dword2918+8]
	mov	dword2920,[ebp-776]
	fstp	dword ptr [dword2920+8]
	mov	dword2922,[ebp-772]
	mov	dword2924,[ebp-768]
	fld	dword ptr [dword2922+12]
	fsub	dword ptr [dword2924+12]
	mov	dword2926,[ebp-776]
	fstp	dword ptr [dword2926+12]
label00a5:
; end of inline function vec4f_subtract
	mov	dword3004,[ebp-648]
	mov	[ebp-780],dword3004
	lea	dword2762,[ebp-684]
	mov	[ebp-784],dword2762
; start of inline function vec4f_dot
	mov	dword3007,[ebp-784]
	mov	dword3009,[ebp-780]
	fld	dword ptr [dword3007+4]
	fmul	dword ptr [dword3009+4]
	mov	dword3011,[ebp-784]
	mov	dword3013,[ebp-780]
	fld	dword ptr [dword3011]
	fmul	dword ptr [dword3013]
	faddp
	mov	dword3015,[ebp-784]
	mov	dword3017,[ebp-780]
	fld	dword ptr [dword3015+8]
	fmul	dword ptr [dword3017+8]
	faddp
	mov	dword3019,[ebp-784]
	mov	dword3021,[ebp-780]
	fld	dword ptr [dword3019+12]
	fmul	dword ptr [dword3021+12]
	faddp
	fstp	dword ptr [ebp-788]
label00a9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword2927,[ebp-652]
	mov	[ebp-768],dword2927
	mov	dword2766,[ebp-668]
	mov	[ebp-772],dword2766
	lea	dword2767,[ebp-684]
	mov	[ebp-776],dword2767
; start of inline function vec4f_subtract
	mov	dword2930,[ebp-772]
	mov	dword2932,[ebp-768]
	fld	dword ptr [dword2930]
	fsub	dword ptr [dword2932]
	mov	dword2934,[ebp-776]
	fstp	dword ptr [dword2934]
	mov	dword2936,[ebp-772]
	mov	dword2938,[ebp-768]
	fld	dword ptr [dword2936+4]
	fsub	dword ptr [dword2938+4]
	mov	dword2940,[ebp-776]
	fstp	dword ptr [dword2940+4]
	mov	dword2942,[ebp-772]
	mov	dword2944,[ebp-768]
	fld	dword ptr [dword2942+8]
	fsub	dword ptr [dword2944+8]
	mov	dword2946,[ebp-776]
	fstp	dword ptr [dword2946+8]
	mov	dword2948,[ebp-772]
	mov	dword2950,[ebp-768]
	fld	dword ptr [dword2948+12]
	fsub	dword ptr [dword2950+12]
	mov	dword2952,[ebp-776]
	fstp	dword ptr [dword2952+12]
label00a6:
; end of inline function vec4f_subtract
	mov	dword3022,[ebp-648]
	mov	[ebp-780],dword3022
	lea	dword2769,[ebp-684]
	mov	[ebp-784],dword2769
; start of inline function vec4f_dot
	mov	dword3025,[ebp-784]
	mov	dword3027,[ebp-780]
	fld	dword ptr [dword3025+4]
	fmul	dword ptr [dword3027+4]
	mov	dword3029,[ebp-784]
	mov	dword3031,[ebp-780]
	fld	dword ptr [dword3029]
	fmul	dword ptr [dword3031]
	faddp
	mov	dword3033,[ebp-784]
	mov	dword3035,[ebp-780]
	fld	dword ptr [dword3033+8]
	fmul	dword ptr [dword3035+8]
	faddp
	mov	dword3037,[ebp-784]
	mov	dword3039,[ebp-780]
	fld	dword ptr [dword3037+12]
	fmul	dword ptr [dword3039+12]
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
	mov	dword2773,[ebp-660]
	mov	dword2774,[dword2773+192]
	inc	dword ptr [dword2773+192]
	imul	dword2774,24
	mov	dword2777,[ebp-660]
	add	dword2777,dword2774
	mov	dword2779,[ebp-664]
	mov	dword2780,[dword2779]
	mov	dword2781,[dword2779+4]
	mov	[dword2777],dword2780
	mov	[dword2777+4],dword2781
	mov	dword2780,[dword2779+8]
	mov	dword2781,[dword2779+12]
	mov	[dword2777+8],dword2780
	mov	[dword2777+12],dword2781
	mov	dword2780,[dword2779+16]
	mov	dword2781,[dword2779+20]
	mov	[dword2777+16],dword2780
	mov	[dword2777+20],dword2781
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
	mov	dword2787,[ebp-664]
	mov	[ebp-768],dword2787
	mov	dword2953,[ebp-652]
	mov	[ebp-772],dword2953
	lea	dword2789,[ebp-684]
	mov	[ebp-776],dword2789
; start of inline function vec4f_subtract
	mov	dword2956,[ebp-772]
	mov	dword2958,[ebp-768]
	fld	dword ptr [dword2956]
	fsub	dword ptr [dword2958]
	mov	dword2960,[ebp-776]
	fstp	dword ptr [dword2960]
	mov	dword2962,[ebp-772]
	mov	dword2964,[ebp-768]
	fld	dword ptr [dword2962+4]
	fsub	dword ptr [dword2964+4]
	mov	dword2966,[ebp-776]
	fstp	dword ptr [dword2966+4]
	mov	dword2968,[ebp-772]
	mov	dword2970,[ebp-768]
	fld	dword ptr [dword2968+8]
	fsub	dword ptr [dword2970+8]
	mov	dword2972,[ebp-776]
	fstp	dword ptr [dword2972+8]
	mov	dword2974,[ebp-772]
	mov	dword2976,[ebp-768]
	fld	dword ptr [dword2974+12]
	fsub	dword ptr [dword2976+12]
	mov	dword2978,[ebp-776]
	fstp	dword ptr [dword2978+12]
label00a7:
; end of inline function vec4f_subtract
	mov	dword2791,[ebp-664]
	mov	[ebp-768],dword2791
	mov	dword2793,[ebp-668]
	mov	[ebp-772],dword2793
	lea	dword2794,[ebp-700]
	mov	[ebp-776],dword2794
; start of inline function vec4f_subtract
	mov	dword2981,[ebp-772]
	mov	dword2983,[ebp-768]
	fld	dword ptr [dword2981]
	fsub	dword ptr [dword2983]
	mov	dword2985,[ebp-776]
	fstp	dword ptr [dword2985]
	mov	dword2987,[ebp-772]
	mov	dword2989,[ebp-768]
	fld	dword ptr [dword2987+4]
	fsub	dword ptr [dword2989+4]
	mov	dword2991,[ebp-776]
	fstp	dword ptr [dword2991+4]
	mov	dword2993,[ebp-772]
	mov	dword2995,[ebp-768]
	fld	dword ptr [dword2993+8]
	fsub	dword ptr [dword2995+8]
	mov	dword2997,[ebp-776]
	fstp	dword ptr [dword2997+8]
	mov	dword2999,[ebp-772]
	mov	dword3001,[ebp-768]
	fld	dword ptr [dword2999+12]
	fsub	dword ptr [dword3001+12]
	mov	dword3003,[ebp-776]
	fstp	dword ptr [dword3003+12]
label00a8:
; end of inline function vec4f_subtract
	mov	dword3040,[ebp-648]
	mov	[ebp-780],dword3040
	lea	dword2796,[ebp-684]
	mov	[ebp-784],dword2796
; start of inline function vec4f_dot
	mov	dword3043,[ebp-784]
	mov	dword3045,[ebp-780]
	fld	dword ptr [dword3043+4]
	fmul	dword ptr [dword3045+4]
	mov	dword3047,[ebp-784]
	mov	dword3049,[ebp-780]
	fld	dword ptr [dword3047]
	fmul	dword ptr [dword3049]
	faddp
	mov	dword3051,[ebp-784]
	mov	dword3053,[ebp-780]
	fld	dword ptr [dword3051+8]
	fmul	dword ptr [dword3053+8]
	faddp
	mov	dword3055,[ebp-784]
	mov	dword3057,[ebp-780]
	fld	dword ptr [dword3055+12]
	fmul	dword ptr [dword3057+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ab:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword3058,[ebp-648]
	mov	[ebp-780],dword3058
	lea	dword2798,[ebp-700]
	mov	[ebp-784],dword2798
; start of inline function vec4f_dot
	mov	dword3061,[ebp-784]
	mov	dword3063,[ebp-780]
	fld	dword ptr [dword3061+4]
	fmul	dword ptr [dword3063+4]
	mov	dword3065,[ebp-784]
	mov	dword3067,[ebp-780]
	fld	dword ptr [dword3065]
	fmul	dword ptr [dword3067]
	faddp
	mov	dword3069,[ebp-784]
	mov	dword3071,[ebp-780]
	fld	dword ptr [dword3069+8]
	fmul	dword ptr [dword3071+8]
	faddp
	mov	dword3073,[ebp-784]
	mov	dword3075,[ebp-780]
	fld	dword ptr [dword3073+12]
	fmul	dword ptr [dword3075+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ac:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword3076,[ebp-720]
	mov	[ebp-792],dword3076
	lea	dword2801,[ebp-700]
	mov	[ebp-796],dword2801
; start of inline function vec4f_mul
	mov	dword3079,[ebp-796]
	fld	dword ptr [dword3079]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3079]
	mov	dword3082,[ebp-796]
	fld	dword ptr [dword3082+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3082+4]
	mov	dword3085,[ebp-796]
	fld	dword ptr [dword3085+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3085+8]
	mov	dword3088,[ebp-796]
	fld	dword ptr [dword3088+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3088+12]
label00ad:
; end of inline function vec4f_mul
	lea	dword2802,[ebp-700]
	mov	[ebp-756],dword2802
	mov	dword2804,[ebp-664]
	mov	[ebp-760],dword2804
	mov	dword2806,[ebp-660]
	mov	dword2808,[dword2806+192]
	imul	dword2808,24
	mov	dword2810,[ebp-660]
	add	dword2810,dword2808
	mov	[ebp-764],dword2810
; start of inline function vec4f_add
	mov	dword2878,[ebp-760]
	mov	dword2880,[ebp-756]
	fld	dword ptr [dword2878]
	fadd	dword ptr [dword2880]
	mov	dword2882,[ebp-764]
	fstp	dword ptr [dword2882]
	mov	dword2884,[ebp-760]
	mov	dword2886,[ebp-756]
	fld	dword ptr [dword2884+4]
	fadd	dword ptr [dword2886+4]
	mov	dword2888,[ebp-764]
	fstp	dword ptr [dword2888+4]
	mov	dword2890,[ebp-760]
	mov	dword2892,[ebp-756]
	fld	dword ptr [dword2890+8]
	fadd	dword ptr [dword2892+8]
	mov	dword2894,[ebp-764]
	fstp	dword ptr [dword2894+8]
	mov	dword2896,[ebp-760]
	mov	dword2898,[ebp-756]
	fld	dword ptr [dword2896+12]
	fadd	dword ptr [dword2898+12]
	mov	dword2900,[ebp-764]
	fstp	dword ptr [dword2900+12]
label00a4:
; end of inline function vec4f_add
	mov	dword2812,16
	add	dword2812,[ebp-664]
	mov	[ebp-736],dword2812
	mov	dword2814,16
	add	dword2814,[ebp-668]
	mov	[ebp-740],dword2814
	lea	dword2815,[ebp-708]
	mov	[ebp-744],dword2815
; start of inline function vec2f_subtract
	mov	dword2857,[ebp-740]
	mov	dword2859,[ebp-736]
	fld	dword ptr [dword2857]
	fsub	dword ptr [dword2859]
	mov	dword2861,[ebp-744]
	fstp	dword ptr [dword2861]
	mov	dword2863,[ebp-740]
	mov	dword2865,[ebp-736]
	fld	dword ptr [dword2863+4]
	fsub	dword ptr [dword2865+4]
	mov	dword2867,[ebp-744]
	fstp	dword ptr [dword2867+4]
label00a2:
; end of inline function vec2f_subtract
	mov	dword2868,[ebp-720]
	mov	[ebp-748],dword2868
	lea	dword2817,[ebp-708]
	mov	[ebp-752],dword2817
; start of inline function vec2f_mul
	mov	dword2871,[ebp-752]
	fld	dword ptr [dword2871]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2871]
	mov	dword2874,[ebp-752]
	fld	dword ptr [dword2874+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword2874+4]
label00a3:
; end of inline function vec2f_mul
	lea	dword2818,[ebp-708]
	mov	[ebp-724],dword2818
	mov	dword2820,16
	add	dword2820,[ebp-664]
	mov	[ebp-728],dword2820
	mov	dword2822,[ebp-660]
	mov	dword2824,[dword2822+192]
	imul	dword2824,24
	mov	dword2826,[ebp-660]
	add	dword2826,dword2824
	add	dword2826,16
	mov	[ebp-732],dword2826
; start of inline function vec2f_add
	mov	dword2844,[ebp-728]
	mov	dword2846,[ebp-724]
	fld	dword ptr [dword2844]
	fadd	dword ptr [dword2846]
	mov	dword2848,[ebp-732]
	fstp	dword ptr [dword2848]
	mov	dword2850,[ebp-728]
	mov	dword2852,[ebp-724]
	fld	dword ptr [dword2850+4]
	fadd	dword ptr [dword2852+4]
	mov	dword2854,[ebp-732]
	fstp	dword ptr [dword2854+4]
label00a1:
; end of inline function vec2f_add
	mov	dword2829,[ebp-660]
	inc	dword ptr [dword2829+192]
label009e:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label009b
label009c:
	mov	dword2833,[ebp-660]
	mov	dword2834,[dword2833+192]
	inc	dword ptr [dword2833+192]
	imul	dword2834,24
	mov	dword2837,[ebp-660]
	add	dword2837,dword2834
	mov	dword2839,[ebp-660]
	mov	dword2840,[dword2839]
	mov	dword2841,[dword2839+4]
	mov	[dword2837],dword2840
	mov	[dword2837+4],dword2841
	mov	dword2840,[dword2839+8]
	mov	dword2841,[dword2839+12]
	mov	[dword2837+8],dword2840
	mov	[dword2837+12],dword2841
	mov	dword2840,[dword2839+16]
	mov	dword2841,[dword2839+20]
	mov	[dword2837+16],dword2840
	mov	[dword2837+20],dword2841
label00ae:
; end of inline function _clip_on_plain
	lea	dword2018,dword ptr [__clip_plane_right_norm]
	mov	[ebp-648],dword2018
	lea	dword2019,dword ptr [__clip_plane_right_base]
	mov	[ebp-652],dword2019
	lea	dword2020,[ebp-644]
	mov	[ebp-656],dword2020
	mov	dword3090,[ebp-448]
	mov	[ebp-660],dword3090
; start of inline function _clip_on_plain
	mov	dword3093,[ebp-660]
	mov	dword ptr [dword3093+192],0
	mov	dword3096,[ebp-656]
	mov	[ebp-664],dword3096
	mov	dword3099,[ebp-656]
	add	dword3099,24
	mov	[ebp-668],dword3099
label00af:
label00b0:
	mov	dword3103,[ebp-656]
	mov	dword3105,[dword3103+192]
	imul	dword3105,24
	mov	dword3107,[ebp-656]
	add	dword3107,dword3105
	cmp	dword3107,[ebp-668]
	jle	label00b1
	mov	dword3253,[ebp-652]
	mov	[ebp-768],dword3253
	mov	dword3111,[ebp-664]
	mov	[ebp-772],dword3111
	lea	dword3112,[ebp-684]
	mov	[ebp-776],dword3112
; start of inline function vec4f_subtract
	mov	dword3256,[ebp-772]
	mov	dword3258,[ebp-768]
	fld	dword ptr [dword3256]
	fsub	dword ptr [dword3258]
	mov	dword3260,[ebp-776]
	fstp	dword ptr [dword3260]
	mov	dword3262,[ebp-772]
	mov	dword3264,[ebp-768]
	fld	dword ptr [dword3262+4]
	fsub	dword ptr [dword3264+4]
	mov	dword3266,[ebp-776]
	fstp	dword ptr [dword3266+4]
	mov	dword3268,[ebp-772]
	mov	dword3270,[ebp-768]
	fld	dword ptr [dword3268+8]
	fsub	dword ptr [dword3270+8]
	mov	dword3272,[ebp-776]
	fstp	dword ptr [dword3272+8]
	mov	dword3274,[ebp-772]
	mov	dword3276,[ebp-768]
	fld	dword ptr [dword3274+12]
	fsub	dword ptr [dword3276+12]
	mov	dword3278,[ebp-776]
	fstp	dword ptr [dword3278+12]
label00ba:
; end of inline function vec4f_subtract
	mov	dword3356,[ebp-648]
	mov	[ebp-780],dword3356
	lea	dword3114,[ebp-684]
	mov	[ebp-784],dword3114
; start of inline function vec4f_dot
	mov	dword3359,[ebp-784]
	mov	dword3361,[ebp-780]
	fld	dword ptr [dword3359+4]
	fmul	dword ptr [dword3361+4]
	mov	dword3363,[ebp-784]
	mov	dword3365,[ebp-780]
	fld	dword ptr [dword3363]
	fmul	dword ptr [dword3365]
	faddp
	mov	dword3367,[ebp-784]
	mov	dword3369,[ebp-780]
	fld	dword ptr [dword3367+8]
	fmul	dword ptr [dword3369+8]
	faddp
	mov	dword3371,[ebp-784]
	mov	dword3373,[ebp-780]
	fld	dword ptr [dword3371+12]
	fmul	dword ptr [dword3373+12]
	faddp
	fstp	dword ptr [ebp-788]
label00be:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword3279,[ebp-652]
	mov	[ebp-768],dword3279
	mov	dword3118,[ebp-668]
	mov	[ebp-772],dword3118
	lea	dword3119,[ebp-684]
	mov	[ebp-776],dword3119
; start of inline function vec4f_subtract
	mov	dword3282,[ebp-772]
	mov	dword3284,[ebp-768]
	fld	dword ptr [dword3282]
	fsub	dword ptr [dword3284]
	mov	dword3286,[ebp-776]
	fstp	dword ptr [dword3286]
	mov	dword3288,[ebp-772]
	mov	dword3290,[ebp-768]
	fld	dword ptr [dword3288+4]
	fsub	dword ptr [dword3290+4]
	mov	dword3292,[ebp-776]
	fstp	dword ptr [dword3292+4]
	mov	dword3294,[ebp-772]
	mov	dword3296,[ebp-768]
	fld	dword ptr [dword3294+8]
	fsub	dword ptr [dword3296+8]
	mov	dword3298,[ebp-776]
	fstp	dword ptr [dword3298+8]
	mov	dword3300,[ebp-772]
	mov	dword3302,[ebp-768]
	fld	dword ptr [dword3300+12]
	fsub	dword ptr [dword3302+12]
	mov	dword3304,[ebp-776]
	fstp	dword ptr [dword3304+12]
label00bb:
; end of inline function vec4f_subtract
	mov	dword3374,[ebp-648]
	mov	[ebp-780],dword3374
	lea	dword3121,[ebp-684]
	mov	[ebp-784],dword3121
; start of inline function vec4f_dot
	mov	dword3377,[ebp-784]
	mov	dword3379,[ebp-780]
	fld	dword ptr [dword3377+4]
	fmul	dword ptr [dword3379+4]
	mov	dword3381,[ebp-784]
	mov	dword3383,[ebp-780]
	fld	dword ptr [dword3381]
	fmul	dword ptr [dword3383]
	faddp
	mov	dword3385,[ebp-784]
	mov	dword3387,[ebp-780]
	fld	dword ptr [dword3385+8]
	fmul	dword ptr [dword3387+8]
	faddp
	mov	dword3389,[ebp-784]
	mov	dword3391,[ebp-780]
	fld	dword ptr [dword3389+12]
	fmul	dword ptr [dword3391+12]
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
	mov	dword3125,[ebp-660]
	mov	dword3126,[dword3125+192]
	inc	dword ptr [dword3125+192]
	imul	dword3126,24
	mov	dword3129,[ebp-660]
	add	dword3129,dword3126
	mov	dword3131,[ebp-664]
	mov	dword3132,[dword3131]
	mov	dword3133,[dword3131+4]
	mov	[dword3129],dword3132
	mov	[dword3129+4],dword3133
	mov	dword3132,[dword3131+8]
	mov	dword3133,[dword3131+12]
	mov	[dword3129+8],dword3132
	mov	[dword3129+12],dword3133
	mov	dword3132,[dword3131+16]
	mov	dword3133,[dword3131+20]
	mov	[dword3129+16],dword3132
	mov	[dword3129+20],dword3133
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
	mov	dword3139,[ebp-664]
	mov	[ebp-768],dword3139
	mov	dword3305,[ebp-652]
	mov	[ebp-772],dword3305
	lea	dword3141,[ebp-684]
	mov	[ebp-776],dword3141
; start of inline function vec4f_subtract
	mov	dword3308,[ebp-772]
	mov	dword3310,[ebp-768]
	fld	dword ptr [dword3308]
	fsub	dword ptr [dword3310]
	mov	dword3312,[ebp-776]
	fstp	dword ptr [dword3312]
	mov	dword3314,[ebp-772]
	mov	dword3316,[ebp-768]
	fld	dword ptr [dword3314+4]
	fsub	dword ptr [dword3316+4]
	mov	dword3318,[ebp-776]
	fstp	dword ptr [dword3318+4]
	mov	dword3320,[ebp-772]
	mov	dword3322,[ebp-768]
	fld	dword ptr [dword3320+8]
	fsub	dword ptr [dword3322+8]
	mov	dword3324,[ebp-776]
	fstp	dword ptr [dword3324+8]
	mov	dword3326,[ebp-772]
	mov	dword3328,[ebp-768]
	fld	dword ptr [dword3326+12]
	fsub	dword ptr [dword3328+12]
	mov	dword3330,[ebp-776]
	fstp	dword ptr [dword3330+12]
label00bc:
; end of inline function vec4f_subtract
	mov	dword3143,[ebp-664]
	mov	[ebp-768],dword3143
	mov	dword3145,[ebp-668]
	mov	[ebp-772],dword3145
	lea	dword3146,[ebp-700]
	mov	[ebp-776],dword3146
; start of inline function vec4f_subtract
	mov	dword3333,[ebp-772]
	mov	dword3335,[ebp-768]
	fld	dword ptr [dword3333]
	fsub	dword ptr [dword3335]
	mov	dword3337,[ebp-776]
	fstp	dword ptr [dword3337]
	mov	dword3339,[ebp-772]
	mov	dword3341,[ebp-768]
	fld	dword ptr [dword3339+4]
	fsub	dword ptr [dword3341+4]
	mov	dword3343,[ebp-776]
	fstp	dword ptr [dword3343+4]
	mov	dword3345,[ebp-772]
	mov	dword3347,[ebp-768]
	fld	dword ptr [dword3345+8]
	fsub	dword ptr [dword3347+8]
	mov	dword3349,[ebp-776]
	fstp	dword ptr [dword3349+8]
	mov	dword3351,[ebp-772]
	mov	dword3353,[ebp-768]
	fld	dword ptr [dword3351+12]
	fsub	dword ptr [dword3353+12]
	mov	dword3355,[ebp-776]
	fstp	dword ptr [dword3355+12]
label00bd:
; end of inline function vec4f_subtract
	mov	dword3392,[ebp-648]
	mov	[ebp-780],dword3392
	lea	dword3148,[ebp-684]
	mov	[ebp-784],dword3148
; start of inline function vec4f_dot
	mov	dword3395,[ebp-784]
	mov	dword3397,[ebp-780]
	fld	dword ptr [dword3395+4]
	fmul	dword ptr [dword3397+4]
	mov	dword3399,[ebp-784]
	mov	dword3401,[ebp-780]
	fld	dword ptr [dword3399]
	fmul	dword ptr [dword3401]
	faddp
	mov	dword3403,[ebp-784]
	mov	dword3405,[ebp-780]
	fld	dword ptr [dword3403+8]
	fmul	dword ptr [dword3405+8]
	faddp
	mov	dword3407,[ebp-784]
	mov	dword3409,[ebp-780]
	fld	dword ptr [dword3407+12]
	fmul	dword ptr [dword3409+12]
	faddp
	fstp	dword ptr [ebp-788]
label00c0:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword3410,[ebp-648]
	mov	[ebp-780],dword3410
	lea	dword3150,[ebp-700]
	mov	[ebp-784],dword3150
; start of inline function vec4f_dot
	mov	dword3413,[ebp-784]
	mov	dword3415,[ebp-780]
	fld	dword ptr [dword3413+4]
	fmul	dword ptr [dword3415+4]
	mov	dword3417,[ebp-784]
	mov	dword3419,[ebp-780]
	fld	dword ptr [dword3417]
	fmul	dword ptr [dword3419]
	faddp
	mov	dword3421,[ebp-784]
	mov	dword3423,[ebp-780]
	fld	dword ptr [dword3421+8]
	fmul	dword ptr [dword3423+8]
	faddp
	mov	dword3425,[ebp-784]
	mov	dword3427,[ebp-780]
	fld	dword ptr [dword3425+12]
	fmul	dword ptr [dword3427+12]
	faddp
	fstp	dword ptr [ebp-788]
label00c1:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword3428,[ebp-720]
	mov	[ebp-792],dword3428
	lea	dword3153,[ebp-700]
	mov	[ebp-796],dword3153
; start of inline function vec4f_mul
	mov	dword3431,[ebp-796]
	fld	dword ptr [dword3431]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3431]
	mov	dword3434,[ebp-796]
	fld	dword ptr [dword3434+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3434+4]
	mov	dword3437,[ebp-796]
	fld	dword ptr [dword3437+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3437+8]
	mov	dword3440,[ebp-796]
	fld	dword ptr [dword3440+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3440+12]
label00c2:
; end of inline function vec4f_mul
	lea	dword3154,[ebp-700]
	mov	[ebp-756],dword3154
	mov	dword3156,[ebp-664]
	mov	[ebp-760],dword3156
	mov	dword3158,[ebp-660]
	mov	dword3160,[dword3158+192]
	imul	dword3160,24
	mov	dword3162,[ebp-660]
	add	dword3162,dword3160
	mov	[ebp-764],dword3162
; start of inline function vec4f_add
	mov	dword3230,[ebp-760]
	mov	dword3232,[ebp-756]
	fld	dword ptr [dword3230]
	fadd	dword ptr [dword3232]
	mov	dword3234,[ebp-764]
	fstp	dword ptr [dword3234]
	mov	dword3236,[ebp-760]
	mov	dword3238,[ebp-756]
	fld	dword ptr [dword3236+4]
	fadd	dword ptr [dword3238+4]
	mov	dword3240,[ebp-764]
	fstp	dword ptr [dword3240+4]
	mov	dword3242,[ebp-760]
	mov	dword3244,[ebp-756]
	fld	dword ptr [dword3242+8]
	fadd	dword ptr [dword3244+8]
	mov	dword3246,[ebp-764]
	fstp	dword ptr [dword3246+8]
	mov	dword3248,[ebp-760]
	mov	dword3250,[ebp-756]
	fld	dword ptr [dword3248+12]
	fadd	dword ptr [dword3250+12]
	mov	dword3252,[ebp-764]
	fstp	dword ptr [dword3252+12]
label00b9:
; end of inline function vec4f_add
	mov	dword3164,16
	add	dword3164,[ebp-664]
	mov	[ebp-736],dword3164
	mov	dword3166,16
	add	dword3166,[ebp-668]
	mov	[ebp-740],dword3166
	lea	dword3167,[ebp-708]
	mov	[ebp-744],dword3167
; start of inline function vec2f_subtract
	mov	dword3209,[ebp-740]
	mov	dword3211,[ebp-736]
	fld	dword ptr [dword3209]
	fsub	dword ptr [dword3211]
	mov	dword3213,[ebp-744]
	fstp	dword ptr [dword3213]
	mov	dword3215,[ebp-740]
	mov	dword3217,[ebp-736]
	fld	dword ptr [dword3215+4]
	fsub	dword ptr [dword3217+4]
	mov	dword3219,[ebp-744]
	fstp	dword ptr [dword3219+4]
label00b7:
; end of inline function vec2f_subtract
	mov	dword3220,[ebp-720]
	mov	[ebp-748],dword3220
	lea	dword3169,[ebp-708]
	mov	[ebp-752],dword3169
; start of inline function vec2f_mul
	mov	dword3223,[ebp-752]
	fld	dword ptr [dword3223]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3223]
	mov	dword3226,[ebp-752]
	fld	dword ptr [dword3226+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3226+4]
label00b8:
; end of inline function vec2f_mul
	lea	dword3170,[ebp-708]
	mov	[ebp-724],dword3170
	mov	dword3172,16
	add	dword3172,[ebp-664]
	mov	[ebp-728],dword3172
	mov	dword3174,[ebp-660]
	mov	dword3176,[dword3174+192]
	imul	dword3176,24
	mov	dword3178,[ebp-660]
	add	dword3178,dword3176
	add	dword3178,16
	mov	[ebp-732],dword3178
; start of inline function vec2f_add
	mov	dword3196,[ebp-728]
	mov	dword3198,[ebp-724]
	fld	dword ptr [dword3196]
	fadd	dword ptr [dword3198]
	mov	dword3200,[ebp-732]
	fstp	dword ptr [dword3200]
	mov	dword3202,[ebp-728]
	mov	dword3204,[ebp-724]
	fld	dword ptr [dword3202+4]
	fadd	dword ptr [dword3204+4]
	mov	dword3206,[ebp-732]
	fstp	dword ptr [dword3206+4]
label00b6:
; end of inline function vec2f_add
	mov	dword3181,[ebp-660]
	inc	dword ptr [dword3181+192]
label00b3:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00b0
label00b1:
	mov	dword3185,[ebp-660]
	mov	dword3186,[dword3185+192]
	inc	dword ptr [dword3185+192]
	imul	dword3186,24
	mov	dword3189,[ebp-660]
	add	dword3189,dword3186
	mov	dword3191,[ebp-660]
	mov	dword3192,[dword3191]
	mov	dword3193,[dword3191+4]
	mov	[dword3189],dword3192
	mov	[dword3189+4],dword3193
	mov	dword3192,[dword3191+8]
	mov	dword3193,[dword3191+12]
	mov	[dword3189+8],dword3192
	mov	[dword3189+12],dword3193
	mov	dword3192,[dword3191+16]
	mov	dword3193,[dword3191+20]
	mov	[dword3189+16],dword3192
	mov	[dword3189+20],dword3193
label00c3:
; end of inline function _clip_on_plain
	lea	dword2022,dword ptr [__clip_plane_top_norm]
	mov	[ebp-648],dword2022
	lea	dword2023,dword ptr [__clip_plane_top_base]
	mov	[ebp-652],dword2023
	mov	dword3442,[ebp-448]
	mov	[ebp-656],dword3442
	lea	dword2025,[ebp-644]
	mov	[ebp-660],dword2025
; start of inline function _clip_on_plain
	mov	dword3445,[ebp-660]
	mov	dword ptr [dword3445+192],0
	mov	dword3448,[ebp-656]
	mov	[ebp-664],dword3448
	mov	dword3451,[ebp-656]
	add	dword3451,24
	mov	[ebp-668],dword3451
label00c4:
label00c5:
	mov	dword3455,[ebp-656]
	mov	dword3457,[dword3455+192]
	imul	dword3457,24
	mov	dword3459,[ebp-656]
	add	dword3459,dword3457
	cmp	dword3459,[ebp-668]
	jle	label00c6
	mov	dword3605,[ebp-652]
	mov	[ebp-768],dword3605
	mov	dword3463,[ebp-664]
	mov	[ebp-772],dword3463
	lea	dword3464,[ebp-684]
	mov	[ebp-776],dword3464
; start of inline function vec4f_subtract
	mov	dword3608,[ebp-772]
	mov	dword3610,[ebp-768]
	fld	dword ptr [dword3608]
	fsub	dword ptr [dword3610]
	mov	dword3612,[ebp-776]
	fstp	dword ptr [dword3612]
	mov	dword3614,[ebp-772]
	mov	dword3616,[ebp-768]
	fld	dword ptr [dword3614+4]
	fsub	dword ptr [dword3616+4]
	mov	dword3618,[ebp-776]
	fstp	dword ptr [dword3618+4]
	mov	dword3620,[ebp-772]
	mov	dword3622,[ebp-768]
	fld	dword ptr [dword3620+8]
	fsub	dword ptr [dword3622+8]
	mov	dword3624,[ebp-776]
	fstp	dword ptr [dword3624+8]
	mov	dword3626,[ebp-772]
	mov	dword3628,[ebp-768]
	fld	dword ptr [dword3626+12]
	fsub	dword ptr [dword3628+12]
	mov	dword3630,[ebp-776]
	fstp	dword ptr [dword3630+12]
label00cf:
; end of inline function vec4f_subtract
	mov	dword3708,[ebp-648]
	mov	[ebp-780],dword3708
	lea	dword3466,[ebp-684]
	mov	[ebp-784],dword3466
; start of inline function vec4f_dot
	mov	dword3711,[ebp-784]
	mov	dword3713,[ebp-780]
	fld	dword ptr [dword3711+4]
	fmul	dword ptr [dword3713+4]
	mov	dword3715,[ebp-784]
	mov	dword3717,[ebp-780]
	fld	dword ptr [dword3715]
	fmul	dword ptr [dword3717]
	faddp
	mov	dword3719,[ebp-784]
	mov	dword3721,[ebp-780]
	fld	dword ptr [dword3719+8]
	fmul	dword ptr [dword3721+8]
	faddp
	mov	dword3723,[ebp-784]
	mov	dword3725,[ebp-780]
	fld	dword ptr [dword3723+12]
	fmul	dword ptr [dword3725+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d3:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword3631,[ebp-652]
	mov	[ebp-768],dword3631
	mov	dword3470,[ebp-668]
	mov	[ebp-772],dword3470
	lea	dword3471,[ebp-684]
	mov	[ebp-776],dword3471
; start of inline function vec4f_subtract
	mov	dword3634,[ebp-772]
	mov	dword3636,[ebp-768]
	fld	dword ptr [dword3634]
	fsub	dword ptr [dword3636]
	mov	dword3638,[ebp-776]
	fstp	dword ptr [dword3638]
	mov	dword3640,[ebp-772]
	mov	dword3642,[ebp-768]
	fld	dword ptr [dword3640+4]
	fsub	dword ptr [dword3642+4]
	mov	dword3644,[ebp-776]
	fstp	dword ptr [dword3644+4]
	mov	dword3646,[ebp-772]
	mov	dword3648,[ebp-768]
	fld	dword ptr [dword3646+8]
	fsub	dword ptr [dword3648+8]
	mov	dword3650,[ebp-776]
	fstp	dword ptr [dword3650+8]
	mov	dword3652,[ebp-772]
	mov	dword3654,[ebp-768]
	fld	dword ptr [dword3652+12]
	fsub	dword ptr [dword3654+12]
	mov	dword3656,[ebp-776]
	fstp	dword ptr [dword3656+12]
label00d0:
; end of inline function vec4f_subtract
	mov	dword3726,[ebp-648]
	mov	[ebp-780],dword3726
	lea	dword3473,[ebp-684]
	mov	[ebp-784],dword3473
; start of inline function vec4f_dot
	mov	dword3729,[ebp-784]
	mov	dword3731,[ebp-780]
	fld	dword ptr [dword3729+4]
	fmul	dword ptr [dword3731+4]
	mov	dword3733,[ebp-784]
	mov	dword3735,[ebp-780]
	fld	dword ptr [dword3733]
	fmul	dword ptr [dword3735]
	faddp
	mov	dword3737,[ebp-784]
	mov	dword3739,[ebp-780]
	fld	dword ptr [dword3737+8]
	fmul	dword ptr [dword3739+8]
	faddp
	mov	dword3741,[ebp-784]
	mov	dword3743,[ebp-780]
	fld	dword ptr [dword3741+12]
	fmul	dword ptr [dword3743+12]
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
	mov	dword3477,[ebp-660]
	mov	dword3478,[dword3477+192]
	inc	dword ptr [dword3477+192]
	imul	dword3478,24
	mov	dword3481,[ebp-660]
	add	dword3481,dword3478
	mov	dword3483,[ebp-664]
	mov	dword3484,[dword3483]
	mov	dword3485,[dword3483+4]
	mov	[dword3481],dword3484
	mov	[dword3481+4],dword3485
	mov	dword3484,[dword3483+8]
	mov	dword3485,[dword3483+12]
	mov	[dword3481+8],dword3484
	mov	[dword3481+12],dword3485
	mov	dword3484,[dword3483+16]
	mov	dword3485,[dword3483+20]
	mov	[dword3481+16],dword3484
	mov	[dword3481+20],dword3485
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
	mov	dword3491,[ebp-664]
	mov	[ebp-768],dword3491
	mov	dword3657,[ebp-652]
	mov	[ebp-772],dword3657
	lea	dword3493,[ebp-684]
	mov	[ebp-776],dword3493
; start of inline function vec4f_subtract
	mov	dword3660,[ebp-772]
	mov	dword3662,[ebp-768]
	fld	dword ptr [dword3660]
	fsub	dword ptr [dword3662]
	mov	dword3664,[ebp-776]
	fstp	dword ptr [dword3664]
	mov	dword3666,[ebp-772]
	mov	dword3668,[ebp-768]
	fld	dword ptr [dword3666+4]
	fsub	dword ptr [dword3668+4]
	mov	dword3670,[ebp-776]
	fstp	dword ptr [dword3670+4]
	mov	dword3672,[ebp-772]
	mov	dword3674,[ebp-768]
	fld	dword ptr [dword3672+8]
	fsub	dword ptr [dword3674+8]
	mov	dword3676,[ebp-776]
	fstp	dword ptr [dword3676+8]
	mov	dword3678,[ebp-772]
	mov	dword3680,[ebp-768]
	fld	dword ptr [dword3678+12]
	fsub	dword ptr [dword3680+12]
	mov	dword3682,[ebp-776]
	fstp	dword ptr [dword3682+12]
label00d1:
; end of inline function vec4f_subtract
	mov	dword3495,[ebp-664]
	mov	[ebp-768],dword3495
	mov	dword3497,[ebp-668]
	mov	[ebp-772],dword3497
	lea	dword3498,[ebp-700]
	mov	[ebp-776],dword3498
; start of inline function vec4f_subtract
	mov	dword3685,[ebp-772]
	mov	dword3687,[ebp-768]
	fld	dword ptr [dword3685]
	fsub	dword ptr [dword3687]
	mov	dword3689,[ebp-776]
	fstp	dword ptr [dword3689]
	mov	dword3691,[ebp-772]
	mov	dword3693,[ebp-768]
	fld	dword ptr [dword3691+4]
	fsub	dword ptr [dword3693+4]
	mov	dword3695,[ebp-776]
	fstp	dword ptr [dword3695+4]
	mov	dword3697,[ebp-772]
	mov	dword3699,[ebp-768]
	fld	dword ptr [dword3697+8]
	fsub	dword ptr [dword3699+8]
	mov	dword3701,[ebp-776]
	fstp	dword ptr [dword3701+8]
	mov	dword3703,[ebp-772]
	mov	dword3705,[ebp-768]
	fld	dword ptr [dword3703+12]
	fsub	dword ptr [dword3705+12]
	mov	dword3707,[ebp-776]
	fstp	dword ptr [dword3707+12]
label00d2:
; end of inline function vec4f_subtract
	mov	dword3744,[ebp-648]
	mov	[ebp-780],dword3744
	lea	dword3500,[ebp-684]
	mov	[ebp-784],dword3500
; start of inline function vec4f_dot
	mov	dword3747,[ebp-784]
	mov	dword3749,[ebp-780]
	fld	dword ptr [dword3747+4]
	fmul	dword ptr [dword3749+4]
	mov	dword3751,[ebp-784]
	mov	dword3753,[ebp-780]
	fld	dword ptr [dword3751]
	fmul	dword ptr [dword3753]
	faddp
	mov	dword3755,[ebp-784]
	mov	dword3757,[ebp-780]
	fld	dword ptr [dword3755+8]
	fmul	dword ptr [dword3757+8]
	faddp
	mov	dword3759,[ebp-784]
	mov	dword3761,[ebp-780]
	fld	dword ptr [dword3759+12]
	fmul	dword ptr [dword3761+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d5:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword3762,[ebp-648]
	mov	[ebp-780],dword3762
	lea	dword3502,[ebp-700]
	mov	[ebp-784],dword3502
; start of inline function vec4f_dot
	mov	dword3765,[ebp-784]
	mov	dword3767,[ebp-780]
	fld	dword ptr [dword3765+4]
	fmul	dword ptr [dword3767+4]
	mov	dword3769,[ebp-784]
	mov	dword3771,[ebp-780]
	fld	dword ptr [dword3769]
	fmul	dword ptr [dword3771]
	faddp
	mov	dword3773,[ebp-784]
	mov	dword3775,[ebp-780]
	fld	dword ptr [dword3773+8]
	fmul	dword ptr [dword3775+8]
	faddp
	mov	dword3777,[ebp-784]
	mov	dword3779,[ebp-780]
	fld	dword ptr [dword3777+12]
	fmul	dword ptr [dword3779+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d6:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword3780,[ebp-720]
	mov	[ebp-792],dword3780
	lea	dword3505,[ebp-700]
	mov	[ebp-796],dword3505
; start of inline function vec4f_mul
	mov	dword3783,[ebp-796]
	fld	dword ptr [dword3783]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3783]
	mov	dword3786,[ebp-796]
	fld	dword ptr [dword3786+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3786+4]
	mov	dword3789,[ebp-796]
	fld	dword ptr [dword3789+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3789+8]
	mov	dword3792,[ebp-796]
	fld	dword ptr [dword3792+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword3792+12]
label00d7:
; end of inline function vec4f_mul
	lea	dword3506,[ebp-700]
	mov	[ebp-756],dword3506
	mov	dword3508,[ebp-664]
	mov	[ebp-760],dword3508
	mov	dword3510,[ebp-660]
	mov	dword3512,[dword3510+192]
	imul	dword3512,24
	mov	dword3514,[ebp-660]
	add	dword3514,dword3512
	mov	[ebp-764],dword3514
; start of inline function vec4f_add
	mov	dword3582,[ebp-760]
	mov	dword3584,[ebp-756]
	fld	dword ptr [dword3582]
	fadd	dword ptr [dword3584]
	mov	dword3586,[ebp-764]
	fstp	dword ptr [dword3586]
	mov	dword3588,[ebp-760]
	mov	dword3590,[ebp-756]
	fld	dword ptr [dword3588+4]
	fadd	dword ptr [dword3590+4]
	mov	dword3592,[ebp-764]
	fstp	dword ptr [dword3592+4]
	mov	dword3594,[ebp-760]
	mov	dword3596,[ebp-756]
	fld	dword ptr [dword3594+8]
	fadd	dword ptr [dword3596+8]
	mov	dword3598,[ebp-764]
	fstp	dword ptr [dword3598+8]
	mov	dword3600,[ebp-760]
	mov	dword3602,[ebp-756]
	fld	dword ptr [dword3600+12]
	fadd	dword ptr [dword3602+12]
	mov	dword3604,[ebp-764]
	fstp	dword ptr [dword3604+12]
label00ce:
; end of inline function vec4f_add
	mov	dword3516,16
	add	dword3516,[ebp-664]
	mov	[ebp-736],dword3516
	mov	dword3518,16
	add	dword3518,[ebp-668]
	mov	[ebp-740],dword3518
	lea	dword3519,[ebp-708]
	mov	[ebp-744],dword3519
; start of inline function vec2f_subtract
	mov	dword3561,[ebp-740]
	mov	dword3563,[ebp-736]
	fld	dword ptr [dword3561]
	fsub	dword ptr [dword3563]
	mov	dword3565,[ebp-744]
	fstp	dword ptr [dword3565]
	mov	dword3567,[ebp-740]
	mov	dword3569,[ebp-736]
	fld	dword ptr [dword3567+4]
	fsub	dword ptr [dword3569+4]
	mov	dword3571,[ebp-744]
	fstp	dword ptr [dword3571+4]
label00cc:
; end of inline function vec2f_subtract
	mov	dword3572,[ebp-720]
	mov	[ebp-748],dword3572
	lea	dword3521,[ebp-708]
	mov	[ebp-752],dword3521
; start of inline function vec2f_mul
	mov	dword3575,[ebp-752]
	fld	dword ptr [dword3575]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3575]
	mov	dword3578,[ebp-752]
	fld	dword ptr [dword3578+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3578+4]
label00cd:
; end of inline function vec2f_mul
	lea	dword3522,[ebp-708]
	mov	[ebp-724],dword3522
	mov	dword3524,16
	add	dword3524,[ebp-664]
	mov	[ebp-728],dword3524
	mov	dword3526,[ebp-660]
	mov	dword3528,[dword3526+192]
	imul	dword3528,24
	mov	dword3530,[ebp-660]
	add	dword3530,dword3528
	add	dword3530,16
	mov	[ebp-732],dword3530
; start of inline function vec2f_add
	mov	dword3548,[ebp-728]
	mov	dword3550,[ebp-724]
	fld	dword ptr [dword3548]
	fadd	dword ptr [dword3550]
	mov	dword3552,[ebp-732]
	fstp	dword ptr [dword3552]
	mov	dword3554,[ebp-728]
	mov	dword3556,[ebp-724]
	fld	dword ptr [dword3554+4]
	fadd	dword ptr [dword3556+4]
	mov	dword3558,[ebp-732]
	fstp	dword ptr [dword3558+4]
label00cb:
; end of inline function vec2f_add
	mov	dword3533,[ebp-660]
	inc	dword ptr [dword3533+192]
label00c8:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00c5
label00c6:
	mov	dword3537,[ebp-660]
	mov	dword3538,[dword3537+192]
	inc	dword ptr [dword3537+192]
	imul	dword3538,24
	mov	dword3541,[ebp-660]
	add	dword3541,dword3538
	mov	dword3543,[ebp-660]
	mov	dword3544,[dword3543]
	mov	dword3545,[dword3543+4]
	mov	[dword3541],dword3544
	mov	[dword3541+4],dword3545
	mov	dword3544,[dword3543+8]
	mov	dword3545,[dword3543+12]
	mov	[dword3541+8],dword3544
	mov	[dword3541+12],dword3545
	mov	dword3544,[dword3543+16]
	mov	dword3545,[dword3543+20]
	mov	[dword3541+16],dword3544
	mov	[dword3541+20],dword3545
label00d8:
; end of inline function _clip_on_plain
	lea	dword2026,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-648],dword2026
	lea	dword2027,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-652],dword2027
	lea	dword2028,[ebp-644]
	mov	[ebp-656],dword2028
	mov	dword3794,[ebp-448]
	mov	[ebp-660],dword3794
; start of inline function _clip_on_plain
	mov	dword3797,[ebp-660]
	mov	dword ptr [dword3797+192],0
	mov	dword3800,[ebp-656]
	mov	[ebp-664],dword3800
	mov	dword3803,[ebp-656]
	add	dword3803,24
	mov	[ebp-668],dword3803
label00d9:
label00da:
	mov	dword3807,[ebp-656]
	mov	dword3809,[dword3807+192]
	imul	dword3809,24
	mov	dword3811,[ebp-656]
	add	dword3811,dword3809
	cmp	dword3811,[ebp-668]
	jle	label00db
	mov	dword3957,[ebp-652]
	mov	[ebp-768],dword3957
	mov	dword3815,[ebp-664]
	mov	[ebp-772],dword3815
	lea	dword3816,[ebp-684]
	mov	[ebp-776],dword3816
; start of inline function vec4f_subtract
	mov	dword3960,[ebp-772]
	mov	dword3962,[ebp-768]
	fld	dword ptr [dword3960]
	fsub	dword ptr [dword3962]
	mov	dword3964,[ebp-776]
	fstp	dword ptr [dword3964]
	mov	dword3966,[ebp-772]
	mov	dword3968,[ebp-768]
	fld	dword ptr [dword3966+4]
	fsub	dword ptr [dword3968+4]
	mov	dword3970,[ebp-776]
	fstp	dword ptr [dword3970+4]
	mov	dword3972,[ebp-772]
	mov	dword3974,[ebp-768]
	fld	dword ptr [dword3972+8]
	fsub	dword ptr [dword3974+8]
	mov	dword3976,[ebp-776]
	fstp	dword ptr [dword3976+8]
	mov	dword3978,[ebp-772]
	mov	dword3980,[ebp-768]
	fld	dword ptr [dword3978+12]
	fsub	dword ptr [dword3980+12]
	mov	dword3982,[ebp-776]
	fstp	dword ptr [dword3982+12]
label00e4:
; end of inline function vec4f_subtract
	mov	dword4060,[ebp-648]
	mov	[ebp-780],dword4060
	lea	dword3818,[ebp-684]
	mov	[ebp-784],dword3818
; start of inline function vec4f_dot
	mov	dword4063,[ebp-784]
	mov	dword4065,[ebp-780]
	fld	dword ptr [dword4063+4]
	fmul	dword ptr [dword4065+4]
	mov	dword4067,[ebp-784]
	mov	dword4069,[ebp-780]
	fld	dword ptr [dword4067]
	fmul	dword ptr [dword4069]
	faddp
	mov	dword4071,[ebp-784]
	mov	dword4073,[ebp-780]
	fld	dword ptr [dword4071+8]
	fmul	dword ptr [dword4073+8]
	faddp
	mov	dword4075,[ebp-784]
	mov	dword4077,[ebp-780]
	fld	dword ptr [dword4075+12]
	fmul	dword ptr [dword4077+12]
	faddp
	fstp	dword ptr [ebp-788]
label00e8:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	dword3983,[ebp-652]
	mov	[ebp-768],dword3983
	mov	dword3822,[ebp-668]
	mov	[ebp-772],dword3822
	lea	dword3823,[ebp-684]
	mov	[ebp-776],dword3823
; start of inline function vec4f_subtract
	mov	dword3986,[ebp-772]
	mov	dword3988,[ebp-768]
	fld	dword ptr [dword3986]
	fsub	dword ptr [dword3988]
	mov	dword3990,[ebp-776]
	fstp	dword ptr [dword3990]
	mov	dword3992,[ebp-772]
	mov	dword3994,[ebp-768]
	fld	dword ptr [dword3992+4]
	fsub	dword ptr [dword3994+4]
	mov	dword3996,[ebp-776]
	fstp	dword ptr [dword3996+4]
	mov	dword3998,[ebp-772]
	mov	dword4000,[ebp-768]
	fld	dword ptr [dword3998+8]
	fsub	dword ptr [dword4000+8]
	mov	dword4002,[ebp-776]
	fstp	dword ptr [dword4002+8]
	mov	dword4004,[ebp-772]
	mov	dword4006,[ebp-768]
	fld	dword ptr [dword4004+12]
	fsub	dword ptr [dword4006+12]
	mov	dword4008,[ebp-776]
	fstp	dword ptr [dword4008+12]
label00e5:
; end of inline function vec4f_subtract
	mov	dword4078,[ebp-648]
	mov	[ebp-780],dword4078
	lea	dword3825,[ebp-684]
	mov	[ebp-784],dword3825
; start of inline function vec4f_dot
	mov	dword4081,[ebp-784]
	mov	dword4083,[ebp-780]
	fld	dword ptr [dword4081+4]
	fmul	dword ptr [dword4083+4]
	mov	dword4085,[ebp-784]
	mov	dword4087,[ebp-780]
	fld	dword ptr [dword4085]
	fmul	dword ptr [dword4087]
	faddp
	mov	dword4089,[ebp-784]
	mov	dword4091,[ebp-780]
	fld	dword ptr [dword4089+8]
	fmul	dword ptr [dword4091+8]
	faddp
	mov	dword4093,[ebp-784]
	mov	dword4095,[ebp-780]
	fld	dword ptr [dword4093+12]
	fmul	dword ptr [dword4095+12]
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
	mov	dword3829,[ebp-660]
	mov	dword3830,[dword3829+192]
	inc	dword ptr [dword3829+192]
	imul	dword3830,24
	mov	dword3833,[ebp-660]
	add	dword3833,dword3830
	mov	dword3835,[ebp-664]
	mov	dword3836,[dword3835]
	mov	dword3837,[dword3835+4]
	mov	[dword3833],dword3836
	mov	[dword3833+4],dword3837
	mov	dword3836,[dword3835+8]
	mov	dword3837,[dword3835+12]
	mov	[dword3833+8],dword3836
	mov	[dword3833+12],dword3837
	mov	dword3836,[dword3835+16]
	mov	dword3837,[dword3835+20]
	mov	[dword3833+16],dword3836
	mov	[dword3833+20],dword3837
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
	mov	dword3843,[ebp-664]
	mov	[ebp-768],dword3843
	mov	dword4009,[ebp-652]
	mov	[ebp-772],dword4009
	lea	dword3845,[ebp-684]
	mov	[ebp-776],dword3845
; start of inline function vec4f_subtract
	mov	dword4012,[ebp-772]
	mov	dword4014,[ebp-768]
	fld	dword ptr [dword4012]
	fsub	dword ptr [dword4014]
	mov	dword4016,[ebp-776]
	fstp	dword ptr [dword4016]
	mov	dword4018,[ebp-772]
	mov	dword4020,[ebp-768]
	fld	dword ptr [dword4018+4]
	fsub	dword ptr [dword4020+4]
	mov	dword4022,[ebp-776]
	fstp	dword ptr [dword4022+4]
	mov	dword4024,[ebp-772]
	mov	dword4026,[ebp-768]
	fld	dword ptr [dword4024+8]
	fsub	dword ptr [dword4026+8]
	mov	dword4028,[ebp-776]
	fstp	dword ptr [dword4028+8]
	mov	dword4030,[ebp-772]
	mov	dword4032,[ebp-768]
	fld	dword ptr [dword4030+12]
	fsub	dword ptr [dword4032+12]
	mov	dword4034,[ebp-776]
	fstp	dword ptr [dword4034+12]
label00e6:
; end of inline function vec4f_subtract
	mov	dword3847,[ebp-664]
	mov	[ebp-768],dword3847
	mov	dword3849,[ebp-668]
	mov	[ebp-772],dword3849
	lea	dword3850,[ebp-700]
	mov	[ebp-776],dword3850
; start of inline function vec4f_subtract
	mov	dword4037,[ebp-772]
	mov	dword4039,[ebp-768]
	fld	dword ptr [dword4037]
	fsub	dword ptr [dword4039]
	mov	dword4041,[ebp-776]
	fstp	dword ptr [dword4041]
	mov	dword4043,[ebp-772]
	mov	dword4045,[ebp-768]
	fld	dword ptr [dword4043+4]
	fsub	dword ptr [dword4045+4]
	mov	dword4047,[ebp-776]
	fstp	dword ptr [dword4047+4]
	mov	dword4049,[ebp-772]
	mov	dword4051,[ebp-768]
	fld	dword ptr [dword4049+8]
	fsub	dword ptr [dword4051+8]
	mov	dword4053,[ebp-776]
	fstp	dword ptr [dword4053+8]
	mov	dword4055,[ebp-772]
	mov	dword4057,[ebp-768]
	fld	dword ptr [dword4055+12]
	fsub	dword ptr [dword4057+12]
	mov	dword4059,[ebp-776]
	fstp	dword ptr [dword4059+12]
label00e7:
; end of inline function vec4f_subtract
	mov	dword4096,[ebp-648]
	mov	[ebp-780],dword4096
	lea	dword3852,[ebp-684]
	mov	[ebp-784],dword3852
; start of inline function vec4f_dot
	mov	dword4099,[ebp-784]
	mov	dword4101,[ebp-780]
	fld	dword ptr [dword4099+4]
	fmul	dword ptr [dword4101+4]
	mov	dword4103,[ebp-784]
	mov	dword4105,[ebp-780]
	fld	dword ptr [dword4103]
	fmul	dword ptr [dword4105]
	faddp
	mov	dword4107,[ebp-784]
	mov	dword4109,[ebp-780]
	fld	dword ptr [dword4107+8]
	fmul	dword ptr [dword4109+8]
	faddp
	mov	dword4111,[ebp-784]
	mov	dword4113,[ebp-780]
	fld	dword ptr [dword4111+12]
	fmul	dword ptr [dword4113+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ea:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	dword4114,[ebp-648]
	mov	[ebp-780],dword4114
	lea	dword3854,[ebp-700]
	mov	[ebp-784],dword3854
; start of inline function vec4f_dot
	mov	dword4117,[ebp-784]
	mov	dword4119,[ebp-780]
	fld	dword ptr [dword4117+4]
	fmul	dword ptr [dword4119+4]
	mov	dword4121,[ebp-784]
	mov	dword4123,[ebp-780]
	fld	dword ptr [dword4121]
	fmul	dword ptr [dword4123]
	faddp
	mov	dword4125,[ebp-784]
	mov	dword4127,[ebp-780]
	fld	dword ptr [dword4125+8]
	fmul	dword ptr [dword4127+8]
	faddp
	mov	dword4129,[ebp-784]
	mov	dword4131,[ebp-780]
	fld	dword ptr [dword4129+12]
	fmul	dword ptr [dword4131+12]
	faddp
	fstp	dword ptr [ebp-788]
label00eb:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	dword4132,[ebp-720]
	mov	[ebp-792],dword4132
	lea	dword3857,[ebp-700]
	mov	[ebp-796],dword3857
; start of inline function vec4f_mul
	mov	dword4135,[ebp-796]
	fld	dword ptr [dword4135]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword4135]
	mov	dword4138,[ebp-796]
	fld	dword ptr [dword4138+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword4138+4]
	mov	dword4141,[ebp-796]
	fld	dword ptr [dword4141+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword4141+8]
	mov	dword4144,[ebp-796]
	fld	dword ptr [dword4144+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [dword4144+12]
label00ec:
; end of inline function vec4f_mul
	lea	dword3858,[ebp-700]
	mov	[ebp-756],dword3858
	mov	dword3860,[ebp-664]
	mov	[ebp-760],dword3860
	mov	dword3862,[ebp-660]
	mov	dword3864,[dword3862+192]
	imul	dword3864,24
	mov	dword3866,[ebp-660]
	add	dword3866,dword3864
	mov	[ebp-764],dword3866
; start of inline function vec4f_add
	mov	dword3934,[ebp-760]
	mov	dword3936,[ebp-756]
	fld	dword ptr [dword3934]
	fadd	dword ptr [dword3936]
	mov	dword3938,[ebp-764]
	fstp	dword ptr [dword3938]
	mov	dword3940,[ebp-760]
	mov	dword3942,[ebp-756]
	fld	dword ptr [dword3940+4]
	fadd	dword ptr [dword3942+4]
	mov	dword3944,[ebp-764]
	fstp	dword ptr [dword3944+4]
	mov	dword3946,[ebp-760]
	mov	dword3948,[ebp-756]
	fld	dword ptr [dword3946+8]
	fadd	dword ptr [dword3948+8]
	mov	dword3950,[ebp-764]
	fstp	dword ptr [dword3950+8]
	mov	dword3952,[ebp-760]
	mov	dword3954,[ebp-756]
	fld	dword ptr [dword3952+12]
	fadd	dword ptr [dword3954+12]
	mov	dword3956,[ebp-764]
	fstp	dword ptr [dword3956+12]
label00e3:
; end of inline function vec4f_add
	mov	dword3868,16
	add	dword3868,[ebp-664]
	mov	[ebp-736],dword3868
	mov	dword3870,16
	add	dword3870,[ebp-668]
	mov	[ebp-740],dword3870
	lea	dword3871,[ebp-708]
	mov	[ebp-744],dword3871
; start of inline function vec2f_subtract
	mov	dword3913,[ebp-740]
	mov	dword3915,[ebp-736]
	fld	dword ptr [dword3913]
	fsub	dword ptr [dword3915]
	mov	dword3917,[ebp-744]
	fstp	dword ptr [dword3917]
	mov	dword3919,[ebp-740]
	mov	dword3921,[ebp-736]
	fld	dword ptr [dword3919+4]
	fsub	dword ptr [dword3921+4]
	mov	dword3923,[ebp-744]
	fstp	dword ptr [dword3923+4]
label00e1:
; end of inline function vec2f_subtract
	mov	dword3924,[ebp-720]
	mov	[ebp-748],dword3924
	lea	dword3873,[ebp-708]
	mov	[ebp-752],dword3873
; start of inline function vec2f_mul
	mov	dword3927,[ebp-752]
	fld	dword ptr [dword3927]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3927]
	mov	dword3930,[ebp-752]
	fld	dword ptr [dword3930+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [dword3930+4]
label00e2:
; end of inline function vec2f_mul
	lea	dword3874,[ebp-708]
	mov	[ebp-724],dword3874
	mov	dword3876,16
	add	dword3876,[ebp-664]
	mov	[ebp-728],dword3876
	mov	dword3878,[ebp-660]
	mov	dword3880,[dword3878+192]
	imul	dword3880,24
	mov	dword3882,[ebp-660]
	add	dword3882,dword3880
	add	dword3882,16
	mov	[ebp-732],dword3882
; start of inline function vec2f_add
	mov	dword3900,[ebp-728]
	mov	dword3902,[ebp-724]
	fld	dword ptr [dword3900]
	fadd	dword ptr [dword3902]
	mov	dword3904,[ebp-732]
	fstp	dword ptr [dword3904]
	mov	dword3906,[ebp-728]
	mov	dword3908,[ebp-724]
	fld	dword ptr [dword3906+4]
	fadd	dword ptr [dword3908+4]
	mov	dword3910,[ebp-732]
	fstp	dword ptr [dword3910+4]
label00e0:
; end of inline function vec2f_add
	mov	dword3885,[ebp-660]
	inc	dword ptr [dword3885+192]
label00dd:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00da
label00db:
	mov	dword3889,[ebp-660]
	mov	dword3890,[dword3889+192]
	inc	dword ptr [dword3889+192]
	imul	dword3890,24
	mov	dword3893,[ebp-660]
	add	dword3893,dword3890
	mov	dword3895,[ebp-660]
	mov	dword3896,[dword3895]
	mov	dword3897,[dword3895+4]
	mov	[dword3893],dword3896
	mov	[dword3893+4],dword3897
	mov	dword3896,[dword3895+8]
	mov	dword3897,[dword3895+12]
	mov	[dword3893+8],dword3896
	mov	[dword3893+12],dword3897
	mov	dword3896,[dword3895+16]
	mov	dword3897,[dword3895+20]
	mov	[dword3893+16],dword3896
	mov	[dword3893+20],dword3897
label00ed:
; end of inline function _clip_on_plain
	mov	dword2031,[ebp-448]
	cmp	dword ptr [dword2031+192],1
	setg	byte31
	movzx	dword2033,byte31
	mov	[ebp-800],dword2033
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
	mov	dword22,[ebp-136]
	sal	dword22,4
	add	dword19,dword22
	mov	[ebp-808],dword19
; start of inline function _transform_to_screen_space
	lea	dword4147,dword ptr [__viewport_matrix]
	mov	[ebp-832],dword4147
	mov	dword4180,[ebp-804]
	mov	[ebp-836],dword4180
	lea	dword4149,[ebp-824]
	mov	[ebp-840],dword4149
; start of inline function matrix4f_transform
	mov	dword4183,[ebp-836]
	mov	dword4185,[ebp-832]
	fld	dword ptr [dword4183+4]
	fmul	dword ptr [dword4185+16]
	mov	dword4187,[ebp-836]
	mov	dword4189,[ebp-832]
	fld	dword ptr [dword4187]
	fmul	dword ptr [dword4189]
	faddp
	mov	dword4191,[ebp-836]
	mov	dword4193,[ebp-832]
	fld	dword ptr [dword4191+8]
	fmul	dword ptr [dword4193+32]
	faddp
	mov	dword4195,[ebp-836]
	mov	dword4197,[ebp-832]
	fld	dword ptr [dword4195+12]
	fmul	dword ptr [dword4197+48]
	faddp
	mov	dword4199,[ebp-840]
	fstp	dword ptr [dword4199]
	mov	dword4201,[ebp-832]
	mov	dword4203,[ebp-836]
	fld	dword ptr [dword4203]
	fmul	dword ptr [dword4201+4]
	mov	dword4205,[ebp-836]
	mov	dword4207,[ebp-832]
	fld	dword ptr [dword4205+4]
	fmul	dword ptr [dword4207+20]
	faddp
	mov	dword4209,[ebp-836]
	mov	dword4211,[ebp-832]
	fld	dword ptr [dword4209+8]
	fmul	dword ptr [dword4211+36]
	faddp
	mov	dword4213,[ebp-836]
	mov	dword4215,[ebp-832]
	fld	dword ptr [dword4213+12]
	fmul	dword ptr [dword4215+52]
	faddp
	mov	dword4217,[ebp-840]
	fstp	dword ptr [dword4217+4]
	mov	dword4219,[ebp-832]
	mov	dword4221,[ebp-836]
	fld	dword ptr [dword4221]
	fmul	dword ptr [dword4219+8]
	mov	dword4223,[ebp-836]
	mov	dword4225,[ebp-832]
	fld	dword ptr [dword4223+4]
	fmul	dword ptr [dword4225+24]
	faddp
	mov	dword4227,[ebp-836]
	mov	dword4229,[ebp-832]
	fld	dword ptr [dword4227+8]
	fmul	dword ptr [dword4229+40]
	faddp
	mov	dword4231,[ebp-836]
	mov	dword4233,[ebp-832]
	fld	dword ptr [dword4231+12]
	fmul	dword ptr [dword4233+56]
	faddp
	mov	dword4235,[ebp-840]
	fstp	dword ptr [dword4235+8]
	mov	dword4237,[ebp-832]
	mov	dword4239,[ebp-836]
	fld	dword ptr [dword4239]
	fmul	dword ptr [dword4237+12]
	mov	dword4241,[ebp-836]
	mov	dword4243,[ebp-832]
	fld	dword ptr [dword4241+4]
	fmul	dword ptr [dword4243+28]
	faddp
	mov	dword4245,[ebp-836]
	mov	dword4247,[ebp-832]
	fld	dword ptr [dword4245+8]
	fmul	dword ptr [dword4247+44]
	faddp
	mov	dword4249,[ebp-836]
	mov	dword4251,[ebp-832]
	fld	dword ptr [dword4249+12]
	fmul	dword ptr [dword4251+60]
	faddp
	mov	dword4253,[ebp-840]
	fstp	dword ptr [dword4253+12]
label00f1:
; end of inline function matrix4f_transform
	lea	dword4150,[ebp-824]
	add	dword4150,12
	fld1
	fdiv	dword ptr [dword4150]
	fstp	dword ptr [ebp-828]
	fld	dword ptr [ebp-824]
	fmul	dword ptr [ebp-828]
	float2int	dword4155
	mov	dword4157,[ebp-808]
	mov	[dword4157],dword4155
	lea	dword4158,[ebp-824]
	add	dword4158,4
	fld	dword ptr [dword4158]
	fmul	dword ptr [ebp-828]
	float2int	dword4161
	mov	dword4163,[ebp-808]
	mov	[dword4163+4],dword4161
	mov	dword4165,[ebp-808]
	cmp	dword ptr [dword4165],0
	jl	label00f0
	mov	dword4168,[ebp-808]
	mov	dword4170,[dword4168]
	cmp	dword4170,dword ptr [__width]
	jge	label00f0
	mov	dword4172,[ebp-808]
	cmp	dword ptr [dword4172+4],0
	jl	label00f0
	mov	dword4175,[ebp-808]
	mov	dword4177,[dword4175+4]
	cmp	dword4177,dword ptr [__height]
	jl	label00ef
label00f0:
	mov	dword ptr ds:[0],0
label00ef:
label00f2:
; end of inline function _transform_to_screen_space
	lea	dword23,[ebp-132]
	mov	dword26,[ebp-136]
	sal	dword26,4
	add	dword23,dword26
	add	dword23,8
	mov	dword29,[ebp+8]
	mov	dword32,[ebp-136]
	imul	dword32,24
	add	dword29,dword32
	add	dword29,16
	mov	dword34,[dword29]
	mov	dword35,[dword29+4]
	mov	[dword23],dword34
	mov	[dword23+4],dword35
	inc	dword ptr [ebp-136]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-136],2
label0005:
label0006:
	mov	dword40,[ebp+8]
	mov	dword42,[dword40+192]
	dec	dword42
	cmp	dword42,[ebp-136]
	jle	label0007
	lea	dword44,[ebp-132]
	mov	dword47,[ebp-136]
	sal	dword47,4
	add	dword44,dword47
	mov	[ebp-140],dword44
	mov	dword50,[ebp-136]
	dec	dword50
	sal	dword50,4
	lea	dword52,[ebp-132]
	add	dword52,dword50
	mov	[ebp-144],dword52
	lea	dword53,[ebp-132]
	mov	[ebp-148],dword53
; start of inline function _rasterize_triangle_2i
	mov	dword57,[ebp-148]
	add	dword57,4
	mov	dword60,[ebp-144]
	add	dword60,4
	mov	dword62,[dword57]
	cmp	dword62,[dword60]
	jle	label0008
	mov	dword65,[ebp-148]
	mov	[ebp-152],dword65
	mov	dword68,[ebp-144]
	mov	[ebp-148],dword68
	mov	dword71,[ebp-152]
	mov	[ebp-144],dword71
label0008:
	mov	dword73,[ebp-148]
	add	dword73,4
	mov	dword76,[ebp-140]
	add	dword76,4
	mov	dword78,[dword73]
	cmp	dword78,[dword76]
	jle	label0009
	mov	dword81,[ebp-148]
	mov	[ebp-152],dword81
	mov	dword84,[ebp-140]
	mov	[ebp-148],dword84
	mov	dword87,[ebp-152]
	mov	[ebp-140],dword87
label0009:
	mov	dword89,[ebp-144]
	add	dword89,4
	mov	dword92,[ebp-140]
	add	dword92,4
	mov	dword94,[dword89]
	cmp	dword94,[dword92]
	jle	label000a
	mov	dword97,[ebp-144]
	mov	[ebp-152],dword97
	mov	dword100,[ebp-140]
	mov	[ebp-144],dword100
	mov	dword103,[ebp-152]
	mov	[ebp-140],dword103
label000a:
	mov	dword105,[ebp-148]
	add	dword105,4
	mov	dword108,[ebp-140]
	add	dword108,4
	mov	dword110,[dword105]
	cmp	dword110,[dword108]
	jne	label000b
	mov	dword112,[ebp-148]
	add	dword112,4
	cmp	dword ptr [dword112],0
	jl	label000c
	mov	dword116,[ebp-148]
	add	dword116,4
	mov	dword119,[dword116]
	cmp	dword119,dword ptr [__height]
	jge	label000c
	fldz
	fstp	dword ptr [ebp-320]
	fldz
	fstp	dword ptr [ebp-324]
	mov	dword121,8
	add	dword121,[ebp-140]
	mov	[ebp-328],dword121
	mov	dword123,8
	add	dword123,[ebp-144]
	mov	[ebp-332],dword123
	mov	dword125,8
	add	dword125,[ebp-148]
	mov	[ebp-336],dword125
	mov	dword127,[ebp-148]
	add	dword127,4
	mov	dword1285,[dword127]
	mov	[ebp-340],dword1285
	mov	dword130,[ebp-140]
	mov	dword1284,[dword130]
	mov	[ebp-344],dword1284
	mov	dword132,[ebp-144]
	mov	dword1283,[dword132]
	mov	[ebp-348],dword1283
	mov	dword134,[ebp-148]
	mov	dword1282,[dword134]
	mov	[ebp-352],dword1282
; start of inline function _rasterize_triangle_1i
	mov	dword1289,[ebp-352]
	cmp	dword1289,[ebp-348]
	jge	label0040
	mov	dword1292,[ebp-344]
	cmp	dword1292,[ebp-348]
	jle	label0041
	mov	dword1362,[ebp-320]
	mov	[ebp-356],dword1362
	mov	dword1361,[ebp-324]
	mov	[ebp-360],dword1361
	mov	dword1296,[ebp-336]
	mov	dword1360,[dword1296+4]
	mov	[ebp-364],dword1360
	mov	dword1298,[ebp-336]
	mov	dword1359,[dword1298]
	mov	[ebp-368],dword1359
	mov	dword1358,[ebp-340]
	mov	[ebp-372],dword1358
	mov	dword1357,[ebp-344]
	mov	[ebp-376],dword1357
	mov	dword1356,[ebp-352]
	mov	[ebp-380],dword1356
; start of inline function _rasterize_horiz_line
	mov	dword1366,dword ptr [__pitch]
	imul	dword1366,[ebp-372]
	add	dword1366,dword ptr [__videomem]
	mov	dword1370,[ebp-380]
	sal	dword1370,2
	add	dword1366,dword1370
	mov	[ebp-384],dword1366
	mov	dword1374,[ebp-376]
	sal	dword1374,2
	add	dword1374,[ebp-384]
	mov	dword1378,[ebp-380]
	sal	dword1378,2
	sub	dword1374,dword1378
	mov	[ebp-388],dword1374
label004a:
	mov	dword1444,[ebp-364]
	mov	[ebp-428],dword1444
	mov	dword1443,[ebp-368]
	mov	[ebp-432],dword1443
; start of inline function _tex2d
	mov	dword1448,dword ptr [__texture_width]
	dec	dword1448
	int2float	dword1448
	fmul	dword ptr [ebp-432]
	float2int	dword1450
	mov	[ebp-436],dword1450
	mov	dword1454,dword ptr [__texture_height]
	dec	dword1454
	int2float	dword1454
	fmul	dword ptr [ebp-428]
	float2int	dword1456
	mov	[ebp-440],dword1456
	mov	dword1460,[ebp-440]
	imul	dword1460,dword ptr [__texture_width]
	add	dword1460,[ebp-436]
	sal	dword1460,2
	add	dword1460,dword ptr [__texture_data]
	mov	dword1464,[dword1460]
	mov	[ebp-444],dword1464
label004e:
; end of inline function _tex2d
	mov	dword1382,[ebp-444]
	mov	[ebp-392],dword1382
	mov	dword1386,[ebp-392]
	sar	dword1386,24
	and	dword1386,255
	mov	[ebp-420],dword1386
	cmp	dword ptr [ebp-420],0
	je	label004d
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1394,[ebp-384]
	mov	dword1396,[dword1394]
	mov	[ebp-408],dword1396
	mov	dword1399,[ebp-408]
	and	dword1399,65280
	sar	dword1399,8
	mov	[ebp-412],dword1399
	mov	dword1404,[ebp-408]
	and	dword1404,255
	mov	[ebp-416],dword1404
	mov	dword1408,[ebp-392]
	and	dword1408,65280
	sar	dword1408,8
	mov	[ebp-400],dword1408
	mov	dword1413,[ebp-392]
	and	dword1413,255
	mov	[ebp-404],dword1413
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1419
	mov	[ebp-400],dword1419
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1425
	mov	[ebp-404],dword1425
	mov	dword1429,[ebp-400]
	sal	dword1429,8
	add	dword1429,[ebp-404]
	mov	[ebp-396],dword1429
	mov	dword1433,[ebp-384]
	mov	dword1435,[ebp-396]
	mov	[dword1433],dword1435
label004d:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label004b:
	add	dword ptr [ebp-384],4
	mov	dword1442,[ebp-384]
	cmp	dword1442,[ebp-388]
	jl	label004a
label004c:
label004f:
; end of inline function _rasterize_horiz_line
	jmp	label0042
label0041:
	mov	dword1304,[ebp-344]
	cmp	dword1304,[ebp-352]
	jge	label0043
	mov	dword1471,[ebp-320]
	mov	[ebp-356],dword1471
	mov	dword1470,[ebp-324]
	mov	[ebp-360],dword1470
	mov	dword1308,[ebp-328]
	mov	dword1469,[dword1308+4]
	mov	[ebp-364],dword1469
	mov	dword1310,[ebp-328]
	mov	dword1468,[dword1310]
	mov	[ebp-368],dword1468
	mov	dword1467,[ebp-340]
	mov	[ebp-372],dword1467
	mov	dword1466,[ebp-348]
	mov	[ebp-376],dword1466
	mov	dword1465,[ebp-344]
	mov	[ebp-380],dword1465
; start of inline function _rasterize_horiz_line
	mov	dword1475,dword ptr [__pitch]
	imul	dword1475,[ebp-372]
	add	dword1475,dword ptr [__videomem]
	mov	dword1479,[ebp-380]
	sal	dword1479,2
	add	dword1475,dword1479
	mov	[ebp-384],dword1475
	mov	dword1483,[ebp-376]
	sal	dword1483,2
	add	dword1483,[ebp-384]
	mov	dword1487,[ebp-380]
	sal	dword1487,2
	sub	dword1483,dword1487
	mov	[ebp-388],dword1483
label0050:
	mov	dword1553,[ebp-364]
	mov	[ebp-428],dword1553
	mov	dword1552,[ebp-368]
	mov	[ebp-432],dword1552
; start of inline function _tex2d
	mov	dword1557,dword ptr [__texture_width]
	dec	dword1557
	int2float	dword1557
	fmul	dword ptr [ebp-432]
	float2int	dword1559
	mov	[ebp-436],dword1559
	mov	dword1563,dword ptr [__texture_height]
	dec	dword1563
	int2float	dword1563
	fmul	dword ptr [ebp-428]
	float2int	dword1565
	mov	[ebp-440],dword1565
	mov	dword1569,[ebp-440]
	imul	dword1569,dword ptr [__texture_width]
	add	dword1569,[ebp-436]
	sal	dword1569,2
	add	dword1569,dword ptr [__texture_data]
	mov	dword1573,[dword1569]
	mov	[ebp-444],dword1573
label0054:
; end of inline function _tex2d
	mov	dword1491,[ebp-444]
	mov	[ebp-392],dword1491
	mov	dword1495,[ebp-392]
	sar	dword1495,24
	and	dword1495,255
	mov	[ebp-420],dword1495
	cmp	dword ptr [ebp-420],0
	je	label0053
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1503,[ebp-384]
	mov	dword1505,[dword1503]
	mov	[ebp-408],dword1505
	mov	dword1508,[ebp-408]
	and	dword1508,65280
	sar	dword1508,8
	mov	[ebp-412],dword1508
	mov	dword1513,[ebp-408]
	and	dword1513,255
	mov	[ebp-416],dword1513
	mov	dword1517,[ebp-392]
	and	dword1517,65280
	sar	dword1517,8
	mov	[ebp-400],dword1517
	mov	dword1522,[ebp-392]
	and	dword1522,255
	mov	[ebp-404],dword1522
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1528
	mov	[ebp-400],dword1528
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1534
	mov	[ebp-404],dword1534
	mov	dword1538,[ebp-400]
	sal	dword1538,8
	add	dword1538,[ebp-404]
	mov	[ebp-396],dword1538
	mov	dword1542,[ebp-384]
	mov	dword1544,[ebp-396]
	mov	[dword1542],dword1544
label0053:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0051:
	add	dword ptr [ebp-384],4
	mov	dword1551,[ebp-384]
	cmp	dword1551,[ebp-388]
	jl	label0050
label0052:
label0055:
; end of inline function _rasterize_horiz_line
	jmp	label0044
label0043:
	mov	dword1580,[ebp-320]
	mov	[ebp-356],dword1580
	mov	dword1579,[ebp-324]
	mov	[ebp-360],dword1579
	mov	dword1317,[ebp-336]
	mov	dword1578,[dword1317+4]
	mov	[ebp-364],dword1578
	mov	dword1319,[ebp-336]
	mov	dword1577,[dword1319]
	mov	[ebp-368],dword1577
	mov	dword1576,[ebp-340]
	mov	[ebp-372],dword1576
	mov	dword1575,[ebp-348]
	mov	[ebp-376],dword1575
	mov	dword1574,[ebp-352]
	mov	[ebp-380],dword1574
; start of inline function _rasterize_horiz_line
	mov	dword1584,dword ptr [__pitch]
	imul	dword1584,[ebp-372]
	add	dword1584,dword ptr [__videomem]
	mov	dword1588,[ebp-380]
	sal	dword1588,2
	add	dword1584,dword1588
	mov	[ebp-384],dword1584
	mov	dword1592,[ebp-376]
	sal	dword1592,2
	add	dword1592,[ebp-384]
	mov	dword1596,[ebp-380]
	sal	dword1596,2
	sub	dword1592,dword1596
	mov	[ebp-388],dword1592
label0056:
	mov	dword1662,[ebp-364]
	mov	[ebp-428],dword1662
	mov	dword1661,[ebp-368]
	mov	[ebp-432],dword1661
; start of inline function _tex2d
	mov	dword1666,dword ptr [__texture_width]
	dec	dword1666
	int2float	dword1666
	fmul	dword ptr [ebp-432]
	float2int	dword1668
	mov	[ebp-436],dword1668
	mov	dword1672,dword ptr [__texture_height]
	dec	dword1672
	int2float	dword1672
	fmul	dword ptr [ebp-428]
	float2int	dword1674
	mov	[ebp-440],dword1674
	mov	dword1678,[ebp-440]
	imul	dword1678,dword ptr [__texture_width]
	add	dword1678,[ebp-436]
	sal	dword1678,2
	add	dword1678,dword ptr [__texture_data]
	mov	dword1682,[dword1678]
	mov	[ebp-444],dword1682
label005a:
; end of inline function _tex2d
	mov	dword1600,[ebp-444]
	mov	[ebp-392],dword1600
	mov	dword1604,[ebp-392]
	sar	dword1604,24
	and	dword1604,255
	mov	[ebp-420],dword1604
	cmp	dword ptr [ebp-420],0
	je	label0059
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1612,[ebp-384]
	mov	dword1614,[dword1612]
	mov	[ebp-408],dword1614
	mov	dword1617,[ebp-408]
	and	dword1617,65280
	sar	dword1617,8
	mov	[ebp-412],dword1617
	mov	dword1622,[ebp-408]
	and	dword1622,255
	mov	[ebp-416],dword1622
	mov	dword1626,[ebp-392]
	and	dword1626,65280
	sar	dword1626,8
	mov	[ebp-400],dword1626
	mov	dword1631,[ebp-392]
	and	dword1631,255
	mov	[ebp-404],dword1631
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1637
	mov	[ebp-400],dword1637
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1643
	mov	[ebp-404],dword1643
	mov	dword1647,[ebp-400]
	sal	dword1647,8
	add	dword1647,[ebp-404]
	mov	[ebp-396],dword1647
	mov	dword1651,[ebp-384]
	mov	dword1653,[ebp-396]
	mov	[dword1651],dword1653
label0059:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0057:
	add	dword ptr [ebp-384],4
	mov	dword1660,[ebp-384]
	cmp	dword1660,[ebp-388]
	jl	label0056
label0058:
label005b:
; end of inline function _rasterize_horiz_line
label0044:
label0042:
	jmp	label0045
label0040:
	mov	dword1325,[ebp-344]
	cmp	dword1325,[ebp-348]
	jge	label0046
	fld	dword ptr [ebp-320]
	fldz
	fsubrp
	fstp	dword ptr [ebp-356]
	fld	dword ptr [ebp-324]
	fldz
	fsubrp
	fstp	dword ptr [ebp-360]
	mov	dword1329,[ebp-328]
	mov	dword1687,[dword1329+4]
	mov	[ebp-364],dword1687
	mov	dword1331,[ebp-328]
	mov	dword1686,[dword1331]
	mov	[ebp-368],dword1686
	mov	dword1685,[ebp-340]
	mov	[ebp-372],dword1685
	mov	dword1684,[ebp-352]
	mov	[ebp-376],dword1684
	mov	dword1683,[ebp-344]
	mov	[ebp-380],dword1683
; start of inline function _rasterize_horiz_line
	mov	dword1691,dword ptr [__pitch]
	imul	dword1691,[ebp-372]
	add	dword1691,dword ptr [__videomem]
	mov	dword1695,[ebp-380]
	sal	dword1695,2
	add	dword1691,dword1695
	mov	[ebp-384],dword1691
	mov	dword1699,[ebp-376]
	sal	dword1699,2
	add	dword1699,[ebp-384]
	mov	dword1703,[ebp-380]
	sal	dword1703,2
	sub	dword1699,dword1703
	mov	[ebp-388],dword1699
label005c:
	mov	dword1769,[ebp-364]
	mov	[ebp-428],dword1769
	mov	dword1768,[ebp-368]
	mov	[ebp-432],dword1768
; start of inline function _tex2d
	mov	dword1773,dword ptr [__texture_width]
	dec	dword1773
	int2float	dword1773
	fmul	dword ptr [ebp-432]
	float2int	dword1775
	mov	[ebp-436],dword1775
	mov	dword1779,dword ptr [__texture_height]
	dec	dword1779
	int2float	dword1779
	fmul	dword ptr [ebp-428]
	float2int	dword1781
	mov	[ebp-440],dword1781
	mov	dword1785,[ebp-440]
	imul	dword1785,dword ptr [__texture_width]
	add	dword1785,[ebp-436]
	sal	dword1785,2
	add	dword1785,dword ptr [__texture_data]
	mov	dword1789,[dword1785]
	mov	[ebp-444],dword1789
label0060:
; end of inline function _tex2d
	mov	dword1707,[ebp-444]
	mov	[ebp-392],dword1707
	mov	dword1711,[ebp-392]
	sar	dword1711,24
	and	dword1711,255
	mov	[ebp-420],dword1711
	cmp	dword ptr [ebp-420],0
	je	label005f
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1719,[ebp-384]
	mov	dword1721,[dword1719]
	mov	[ebp-408],dword1721
	mov	dword1724,[ebp-408]
	and	dword1724,65280
	sar	dword1724,8
	mov	[ebp-412],dword1724
	mov	dword1729,[ebp-408]
	and	dword1729,255
	mov	[ebp-416],dword1729
	mov	dword1733,[ebp-392]
	and	dword1733,65280
	sar	dword1733,8
	mov	[ebp-400],dword1733
	mov	dword1738,[ebp-392]
	and	dword1738,255
	mov	[ebp-404],dword1738
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1744
	mov	[ebp-400],dword1744
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1750
	mov	[ebp-404],dword1750
	mov	dword1754,[ebp-400]
	sal	dword1754,8
	add	dword1754,[ebp-404]
	mov	[ebp-396],dword1754
	mov	dword1758,[ebp-384]
	mov	dword1760,[ebp-396]
	mov	[dword1758],dword1760
label005f:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label005d:
	add	dword ptr [ebp-384],4
	mov	dword1767,[ebp-384]
	cmp	dword1767,[ebp-388]
	jl	label005c
label005e:
label0061:
; end of inline function _rasterize_horiz_line
	jmp	label0047
label0046:
	mov	dword1337,[ebp-344]
	cmp	dword1337,[ebp-352]
	jle	label0048
	fld	dword ptr [ebp-320]
	fldz
	fsubrp
	fstp	dword ptr [ebp-356]
	fld	dword ptr [ebp-324]
	fldz
	fsubrp
	fstp	dword ptr [ebp-360]
	mov	dword1341,[ebp-332]
	mov	dword1794,[dword1341+4]
	mov	[ebp-364],dword1794
	mov	dword1343,[ebp-332]
	mov	dword1793,[dword1343]
	mov	[ebp-368],dword1793
	mov	dword1792,[ebp-340]
	mov	[ebp-372],dword1792
	mov	dword1791,[ebp-344]
	mov	[ebp-376],dword1791
	mov	dword1790,[ebp-348]
	mov	[ebp-380],dword1790
; start of inline function _rasterize_horiz_line
	mov	dword1798,dword ptr [__pitch]
	imul	dword1798,[ebp-372]
	add	dword1798,dword ptr [__videomem]
	mov	dword1802,[ebp-380]
	sal	dword1802,2
	add	dword1798,dword1802
	mov	[ebp-384],dword1798
	mov	dword1806,[ebp-376]
	sal	dword1806,2
	add	dword1806,[ebp-384]
	mov	dword1810,[ebp-380]
	sal	dword1810,2
	sub	dword1806,dword1810
	mov	[ebp-388],dword1806
label0062:
	mov	dword1876,[ebp-364]
	mov	[ebp-428],dword1876
	mov	dword1875,[ebp-368]
	mov	[ebp-432],dword1875
; start of inline function _tex2d
	mov	dword1880,dword ptr [__texture_width]
	dec	dword1880
	int2float	dword1880
	fmul	dword ptr [ebp-432]
	float2int	dword1882
	mov	[ebp-436],dword1882
	mov	dword1886,dword ptr [__texture_height]
	dec	dword1886
	int2float	dword1886
	fmul	dword ptr [ebp-428]
	float2int	dword1888
	mov	[ebp-440],dword1888
	mov	dword1892,[ebp-440]
	imul	dword1892,dword ptr [__texture_width]
	add	dword1892,[ebp-436]
	sal	dword1892,2
	add	dword1892,dword ptr [__texture_data]
	mov	dword1896,[dword1892]
	mov	[ebp-444],dword1896
label0066:
; end of inline function _tex2d
	mov	dword1814,[ebp-444]
	mov	[ebp-392],dword1814
	mov	dword1818,[ebp-392]
	sar	dword1818,24
	and	dword1818,255
	mov	[ebp-420],dword1818
	cmp	dword ptr [ebp-420],0
	je	label0065
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1826,[ebp-384]
	mov	dword1828,[dword1826]
	mov	[ebp-408],dword1828
	mov	dword1831,[ebp-408]
	and	dword1831,65280
	sar	dword1831,8
	mov	[ebp-412],dword1831
	mov	dword1836,[ebp-408]
	and	dword1836,255
	mov	[ebp-416],dword1836
	mov	dword1840,[ebp-392]
	and	dword1840,65280
	sar	dword1840,8
	mov	[ebp-400],dword1840
	mov	dword1845,[ebp-392]
	and	dword1845,255
	mov	[ebp-404],dword1845
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1851
	mov	[ebp-400],dword1851
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1857
	mov	[ebp-404],dword1857
	mov	dword1861,[ebp-400]
	sal	dword1861,8
	add	dword1861,[ebp-404]
	mov	[ebp-396],dword1861
	mov	dword1865,[ebp-384]
	mov	dword1867,[ebp-396]
	mov	[dword1865],dword1867
label0065:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0063:
	add	dword ptr [ebp-384],4
	mov	dword1874,[ebp-384]
	cmp	dword1874,[ebp-388]
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
	mov	dword1350,[ebp-332]
	mov	dword1901,[dword1350+4]
	mov	[ebp-364],dword1901
	mov	dword1352,[ebp-332]
	mov	dword1900,[dword1352]
	mov	[ebp-368],dword1900
	mov	dword1899,[ebp-340]
	mov	[ebp-372],dword1899
	mov	dword1898,[ebp-352]
	mov	[ebp-376],dword1898
	mov	dword1897,[ebp-348]
	mov	[ebp-380],dword1897
; start of inline function _rasterize_horiz_line
	mov	dword1905,dword ptr [__pitch]
	imul	dword1905,[ebp-372]
	add	dword1905,dword ptr [__videomem]
	mov	dword1909,[ebp-380]
	sal	dword1909,2
	add	dword1905,dword1909
	mov	[ebp-384],dword1905
	mov	dword1913,[ebp-376]
	sal	dword1913,2
	add	dword1913,[ebp-384]
	mov	dword1917,[ebp-380]
	sal	dword1917,2
	sub	dword1913,dword1917
	mov	[ebp-388],dword1913
label0068:
	mov	dword1983,[ebp-364]
	mov	[ebp-428],dword1983
	mov	dword1982,[ebp-368]
	mov	[ebp-432],dword1982
; start of inline function _tex2d
	mov	dword1987,dword ptr [__texture_width]
	dec	dword1987
	int2float	dword1987
	fmul	dword ptr [ebp-432]
	float2int	dword1989
	mov	[ebp-436],dword1989
	mov	dword1993,dword ptr [__texture_height]
	dec	dword1993
	int2float	dword1993
	fmul	dword ptr [ebp-428]
	float2int	dword1995
	mov	[ebp-440],dword1995
	mov	dword1999,[ebp-440]
	imul	dword1999,dword ptr [__texture_width]
	add	dword1999,[ebp-436]
	sal	dword1999,2
	add	dword1999,dword ptr [__texture_data]
	mov	dword2003,[dword1999]
	mov	[ebp-444],dword2003
label006c:
; end of inline function _tex2d
	mov	dword1921,[ebp-444]
	mov	[ebp-392],dword1921
	mov	dword1925,[ebp-392]
	sar	dword1925,24
	and	dword1925,255
	mov	[ebp-420],dword1925
	cmp	dword ptr [ebp-420],0
	je	label006b
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	dword1933,[ebp-384]
	mov	dword1935,[dword1933]
	mov	[ebp-408],dword1935
	mov	dword1938,[ebp-408]
	and	dword1938,65280
	sar	dword1938,8
	mov	[ebp-412],dword1938
	mov	dword1943,[ebp-408]
	and	dword1943,255
	mov	[ebp-416],dword1943
	mov	dword1947,[ebp-392]
	and	dword1947,65280
	sar	dword1947,8
	mov	[ebp-400],dword1947
	mov	dword1952,[ebp-392]
	and	dword1952,255
	mov	[ebp-404],dword1952
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1958
	mov	[ebp-400],dword1958
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	float2int	dword1964
	mov	[ebp-404],dword1964
	mov	dword1968,[ebp-400]
	sal	dword1968,8
	add	dword1968,[ebp-404]
	mov	[ebp-396],dword1968
	mov	dword1972,[ebp-384]
	mov	dword1974,[ebp-396]
	mov	[dword1972],dword1974
label006b:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0069:
	add	dword ptr [ebp-384],4
	mov	dword1981,[ebp-384]
	cmp	dword1981,[ebp-388]
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
	mov	dword136,[ebp-148]
	add	dword136,4
	mov	dword139,[dword136]
	mov	[ebp-164],dword139
label000d:
label000e:
	mov	dword141,[ebp-144]
	add	dword141,4
	mov	dword144,[dword141]
	cmp	dword144,[ebp-164]
	jle	label000f
	mov	dword146,[ebp-148]
	add	dword146,4
	mov	dword149,[ebp-164]
	sub	dword149,[dword146]
	mov	dword151,[ebp-144]
	mov	dword153,[ebp-148]
	mov	dword154,[dword151]
	sub	dword154,[dword153]
	imul	dword149,dword154
	mov	dword156,[ebp-144]
	add	dword156,4
	mov	dword159,[ebp-148]
	add	dword159,4
	mov	dword161,[dword156]
	sub	dword161,[dword159]
	cdq	dword162
	idiv	dword149,dword161
	mov	dword164,[ebp-148]
	add	dword149,[dword164]
	mov	[ebp-156],dword149
	mov	dword167,[ebp-148]
	add	dword167,4
	mov	dword170,[ebp-164]
	sub	dword170,[dword167]
	mov	dword172,[ebp-140]
	mov	dword174,[ebp-148]
	mov	dword175,[dword172]
	sub	dword175,[dword174]
	imul	dword170,dword175
	mov	dword177,[ebp-140]
	add	dword177,4
	mov	dword180,[ebp-148]
	add	dword180,4
	mov	dword182,[dword177]
	sub	dword182,[dword180]
	cdq	dword183
	idiv	dword170,dword182
	mov	dword185,[ebp-148]
	add	dword170,[dword185]
	mov	[ebp-160],dword170
	mov	dword188,[ebp-148]
	add	dword188,4
	mov	dword191,[ebp-164]
	sub	dword191,[dword188]
	int2float	dword191
	mov	dword193,[ebp-144]
	mov	dword195,[ebp-148]
	fld	dword ptr [dword193+8]
	fsub	dword ptr [dword195+8]
	fmulp
	mov	dword197,[ebp-144]
	add	dword197,4
	mov	dword200,[ebp-148]
	add	dword200,4
	mov	dword202,[dword197]
	sub	dword202,[dword200]
	int2float	dword202
	fdivp
	mov	dword204,[ebp-148]
	fadd	dword ptr [dword204+8]
	fstp	dword ptr [ebp-168]
	mov	dword207,[ebp-148]
	add	dword207,4
	mov	dword210,[ebp-164]
	sub	dword210,[dword207]
	int2float	dword210
	mov	dword212,[ebp-140]
	mov	dword214,[ebp-148]
	fld	dword ptr [dword212+8]
	fsub	dword ptr [dword214+8]
	fmulp
	mov	dword216,[ebp-140]
	add	dword216,4
	mov	dword219,[ebp-148]
	add	dword219,4
	mov	dword221,[dword216]
	sub	dword221,[dword219]
	int2float	dword221
	fdivp
	mov	dword223,[ebp-148]
	fadd	dword ptr [dword223+8]
	fstp	dword ptr [ebp-176]
	mov	dword226,[ebp-148]
	add	dword226,4
	mov	dword229,[ebp-164]
	sub	dword229,[dword226]
	int2float	dword229
	mov	dword231,8
	add	dword231,[ebp-144]
	add	dword231,4
	mov	dword234,8
	add	dword234,[ebp-148]
	add	dword234,4
	fld	dword ptr [dword231]
	fsub	dword ptr [dword234]
	fmulp
	mov	dword237,[ebp-144]
	add	dword237,4
	mov	dword240,[ebp-148]
	add	dword240,4
	mov	dword242,[dword237]
	sub	dword242,[dword240]
	int2float	dword242
	fdivp
	mov	dword244,8
	add	dword244,[ebp-148]
	add	dword244,4
	fadd	dword ptr [dword244]
	fstp	dword ptr [ebp-172]
	mov	dword248,[ebp-148]
	add	dword248,4
	mov	dword251,[ebp-164]
	sub	dword251,[dword248]
	int2float	dword251
	mov	dword253,8
	add	dword253,[ebp-140]
	add	dword253,4
	mov	dword256,8
	add	dword256,[ebp-148]
	add	dword256,4
	fld	dword ptr [dword253]
	fsub	dword ptr [dword256]
	fmulp
	mov	dword259,[ebp-140]
	add	dword259,4
	mov	dword262,[ebp-148]
	add	dword262,4
	mov	dword264,[dword259]
	sub	dword264,[dword262]
	int2float	dword264
	fdivp
	mov	dword266,8
	add	dword266,[ebp-148]
	add	dword266,4
	fadd	dword ptr [dword266]
	fstp	dword ptr [ebp-180]
	mov	dword271,[ebp-160]
	sub	dword271,[ebp-156]
	int2float	dword271
	fld	dword ptr [ebp-176]
	fsub	dword ptr [ebp-168]
	fdivrp
	fstp	dword ptr [ebp-184]
	mov	dword277,[ebp-160]
	sub	dword277,[ebp-156]
	int2float	dword277
	fld	dword ptr [ebp-180]
	fsub	dword ptr [ebp-172]
	fdivrp
	fstp	dword ptr [ebp-188]
	mov	dword555,[ebp-188]
	mov	[ebp-192],dword555
	mov	dword554,[ebp-184]
	mov	[ebp-196],dword554
	mov	dword553,[ebp-180]
	mov	[ebp-200],dword553
	mov	dword552,[ebp-176]
	mov	[ebp-204],dword552
	mov	dword551,[ebp-172]
	mov	[ebp-208],dword551
	mov	dword550,[ebp-168]
	mov	[ebp-212],dword550
	mov	dword549,[ebp-164]
	mov	[ebp-216],dword549
	mov	dword548,[ebp-160]
	mov	[ebp-220],dword548
	mov	dword547,[ebp-156]
	mov	[ebp-224],dword547
; start of inline function _rasterize_horiz_line__unordered
	mov	dword559,[ebp-224]
	cmp	dword559,[ebp-220]
	jg	label0013
	mov	dword580,[ebp-192]
	mov	[ebp-228],dword580
	mov	dword579,[ebp-196]
	mov	[ebp-232],dword579
	mov	dword578,[ebp-208]
	mov	[ebp-236],dword578
	mov	dword577,[ebp-212]
	mov	[ebp-240],dword577
	mov	dword576,[ebp-216]
	mov	[ebp-244],dword576
	mov	dword575,[ebp-220]
	mov	[ebp-248],dword575
	mov	dword574,[ebp-224]
	mov	[ebp-252],dword574
; start of inline function _rasterize_horiz_line
	mov	dword584,dword ptr [__pitch]
	imul	dword584,[ebp-244]
	add	dword584,dword ptr [__videomem]
	mov	dword588,[ebp-252]
	sal	dword588,2
	add	dword584,dword588
	mov	[ebp-256],dword584
	mov	dword592,[ebp-248]
	sal	dword592,2
	add	dword592,[ebp-256]
	mov	dword596,[ebp-252]
	sal	dword596,2
	sub	dword592,dword596
	mov	[ebp-260],dword592
label0015:
	mov	dword662,[ebp-236]
	mov	[ebp-300],dword662
	mov	dword661,[ebp-240]
	mov	[ebp-304],dword661
; start of inline function _tex2d
	mov	dword666,dword ptr [__texture_width]
	dec	dword666
	int2float	dword666
	fmul	dword ptr [ebp-304]
	float2int	dword668
	mov	[ebp-308],dword668
	mov	dword672,dword ptr [__texture_height]
	dec	dword672
	int2float	dword672
	fmul	dword ptr [ebp-300]
	float2int	dword674
	mov	[ebp-312],dword674
	mov	dword678,[ebp-312]
	imul	dword678,dword ptr [__texture_width]
	add	dword678,[ebp-308]
	sal	dword678,2
	add	dword678,dword ptr [__texture_data]
	mov	dword682,[dword678]
	mov	[ebp-316],dword682
label0019:
; end of inline function _tex2d
	mov	dword600,[ebp-316]
	mov	[ebp-264],dword600
	mov	dword604,[ebp-264]
	sar	dword604,24
	and	dword604,255
	mov	[ebp-292],dword604
	cmp	dword ptr [ebp-292],0
	je	label0018
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword612,[ebp-256]
	mov	dword614,[dword612]
	mov	[ebp-280],dword614
	mov	dword617,[ebp-280]
	and	dword617,65280
	sar	dword617,8
	mov	[ebp-284],dword617
	mov	dword622,[ebp-280]
	and	dword622,255
	mov	[ebp-288],dword622
	mov	dword626,[ebp-264]
	and	dword626,65280
	sar	dword626,8
	mov	[ebp-272],dword626
	mov	dword631,[ebp-264]
	and	dword631,255
	mov	[ebp-276],dword631
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword637
	mov	[ebp-272],dword637
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword643
	mov	[ebp-276],dword643
	mov	dword647,[ebp-272]
	sal	dword647,8
	add	dword647,[ebp-276]
	mov	[ebp-268],dword647
	mov	dword651,[ebp-256]
	mov	dword653,[ebp-268]
	mov	[dword651],dword653
label0018:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0016:
	add	dword ptr [ebp-256],4
	mov	dword660,[ebp-256]
	cmp	dword660,[ebp-260]
	jl	label0015
label0017:
label001a:
; end of inline function _rasterize_horiz_line
	jmp	label0014
label0013:
	mov	dword689,[ebp-192]
	mov	[ebp-228],dword689
	mov	dword688,[ebp-196]
	mov	[ebp-232],dword688
	mov	dword687,[ebp-200]
	mov	[ebp-236],dword687
	mov	dword686,[ebp-204]
	mov	[ebp-240],dword686
	mov	dword685,[ebp-216]
	mov	[ebp-244],dword685
	mov	dword684,[ebp-224]
	mov	[ebp-248],dword684
	mov	dword683,[ebp-220]
	mov	[ebp-252],dword683
; start of inline function _rasterize_horiz_line
	mov	dword693,dword ptr [__pitch]
	imul	dword693,[ebp-244]
	add	dword693,dword ptr [__videomem]
	mov	dword697,[ebp-252]
	sal	dword697,2
	add	dword693,dword697
	mov	[ebp-256],dword693
	mov	dword701,[ebp-248]
	sal	dword701,2
	add	dword701,[ebp-256]
	mov	dword705,[ebp-252]
	sal	dword705,2
	sub	dword701,dword705
	mov	[ebp-260],dword701
label001b:
	mov	dword771,[ebp-236]
	mov	[ebp-300],dword771
	mov	dword770,[ebp-240]
	mov	[ebp-304],dword770
; start of inline function _tex2d
	mov	dword775,dword ptr [__texture_width]
	dec	dword775
	int2float	dword775
	fmul	dword ptr [ebp-304]
	float2int	dword777
	mov	[ebp-308],dword777
	mov	dword781,dword ptr [__texture_height]
	dec	dword781
	int2float	dword781
	fmul	dword ptr [ebp-300]
	float2int	dword783
	mov	[ebp-312],dword783
	mov	dword787,[ebp-312]
	imul	dword787,dword ptr [__texture_width]
	add	dword787,[ebp-308]
	sal	dword787,2
	add	dword787,dword ptr [__texture_data]
	mov	dword791,[dword787]
	mov	[ebp-316],dword791
label001f:
; end of inline function _tex2d
	mov	dword709,[ebp-316]
	mov	[ebp-264],dword709
	mov	dword713,[ebp-264]
	sar	dword713,24
	and	dword713,255
	mov	[ebp-292],dword713
	cmp	dword ptr [ebp-292],0
	je	label001e
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword721,[ebp-256]
	mov	dword723,[dword721]
	mov	[ebp-280],dword723
	mov	dword726,[ebp-280]
	and	dword726,65280
	sar	dword726,8
	mov	[ebp-284],dword726
	mov	dword731,[ebp-280]
	and	dword731,255
	mov	[ebp-288],dword731
	mov	dword735,[ebp-264]
	and	dword735,65280
	sar	dword735,8
	mov	[ebp-272],dword735
	mov	dword740,[ebp-264]
	and	dword740,255
	mov	[ebp-276],dword740
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword746
	mov	[ebp-272],dword746
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword752
	mov	[ebp-276],dword752
	mov	dword756,[ebp-272]
	sal	dword756,8
	add	dword756,[ebp-276]
	mov	[ebp-268],dword756
	mov	dword760,[ebp-256]
	mov	dword762,[ebp-268]
	mov	[dword760],dword762
label001e:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label001c:
	add	dword ptr [ebp-256],4
	mov	dword769,[ebp-256]
	cmp	dword769,[ebp-260]
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
	mov	dword292,[ebp-144]
	add	dword292,4
	mov	dword295,[ebp-148]
	add	dword295,4
	mov	dword297,[dword292]
	sub	dword297,[dword295]
	mov	dword299,[ebp-140]
	mov	dword301,[ebp-148]
	mov	dword302,[dword299]
	sub	dword302,[dword301]
	imul	dword297,dword302
	mov	dword304,[ebp-140]
	add	dword304,4
	mov	dword307,[ebp-148]
	add	dword307,4
	mov	dword309,[dword304]
	sub	dword309,[dword307]
	cdq	dword310
	idiv	dword297,dword309
	mov	dword312,[ebp-148]
	add	dword297,[dword312]
	mov	[ebp-160],dword297
	mov	dword315,[ebp-144]
	add	dword315,4
	mov	dword318,[ebp-148]
	add	dword318,4
	mov	dword320,[dword315]
	sub	dword320,[dword318]
	int2float	dword320
	mov	dword322,[ebp-140]
	mov	dword324,[ebp-148]
	fld	dword ptr [dword322+8]
	fsub	dword ptr [dword324+8]
	fmulp
	mov	dword326,[ebp-140]
	add	dword326,4
	mov	dword329,[ebp-148]
	add	dword329,4
	mov	dword331,[dword326]
	sub	dword331,[dword329]
	int2float	dword331
	fdivp
	mov	dword333,[ebp-148]
	fadd	dword ptr [dword333+8]
	fstp	dword ptr [ebp-176]
	mov	dword336,[ebp-144]
	add	dword336,4
	mov	dword339,[ebp-148]
	add	dword339,4
	mov	dword341,[dword336]
	sub	dword341,[dword339]
	int2float	dword341
	mov	dword343,8
	add	dword343,[ebp-140]
	add	dword343,4
	mov	dword346,8
	add	dword346,[ebp-148]
	add	dword346,4
	fld	dword ptr [dword343]
	fsub	dword ptr [dword346]
	fmulp
	mov	dword349,[ebp-140]
	add	dword349,4
	mov	dword352,[ebp-148]
	add	dword352,4
	mov	dword354,[dword349]
	sub	dword354,[dword352]
	int2float	dword354
	fdivp
	mov	dword356,8
	add	dword356,[ebp-148]
	add	dword356,4
	fadd	dword ptr [dword356]
	fstp	dword ptr [ebp-180]
	mov	dword360,[ebp-144]
	fld	dword ptr [ebp-176]
	fsub	dword ptr [dword360+8]
	mov	dword363,[ebp-144]
	mov	dword365,[ebp-160]
	sub	dword365,[dword363]
	int2float	dword365
	fdivp
	fstp	dword ptr [ebp-184]
	mov	dword368,8
	add	dword368,[ebp-144]
	add	dword368,4
	fld	dword ptr [ebp-180]
	fsub	dword ptr [dword368]
	mov	dword372,[ebp-144]
	mov	dword374,[ebp-160]
	sub	dword374,[dword372]
	int2float	dword374
	fdivp
	fstp	dword ptr [ebp-188]
	mov	dword800,[ebp-188]
	mov	[ebp-192],dword800
	mov	dword799,[ebp-184]
	mov	[ebp-196],dword799
	mov	dword379,8
	add	dword379,[ebp-144]
	add	dword379,4
	mov	dword798,[dword379]
	mov	[ebp-200],dword798
	mov	dword382,[ebp-144]
	mov	dword797,[dword382+8]
	mov	[ebp-204],dword797
	mov	dword796,[ebp-180]
	mov	[ebp-208],dword796
	mov	dword795,[ebp-176]
	mov	[ebp-212],dword795
	mov	dword386,[ebp-144]
	add	dword386,4
	mov	dword794,[dword386]
	mov	[ebp-216],dword794
	mov	dword389,[ebp-144]
	mov	dword793,[dword389]
	mov	[ebp-220],dword793
	mov	dword792,[ebp-160]
	mov	[ebp-224],dword792
; start of inline function _rasterize_horiz_line__unordered
	mov	dword804,[ebp-224]
	cmp	dword804,[ebp-220]
	jg	label0022
	mov	dword825,[ebp-192]
	mov	[ebp-228],dword825
	mov	dword824,[ebp-196]
	mov	[ebp-232],dword824
	mov	dword823,[ebp-208]
	mov	[ebp-236],dword823
	mov	dword822,[ebp-212]
	mov	[ebp-240],dword822
	mov	dword821,[ebp-216]
	mov	[ebp-244],dword821
	mov	dword820,[ebp-220]
	mov	[ebp-248],dword820
	mov	dword819,[ebp-224]
	mov	[ebp-252],dword819
; start of inline function _rasterize_horiz_line
	mov	dword829,dword ptr [__pitch]
	imul	dword829,[ebp-244]
	add	dword829,dword ptr [__videomem]
	mov	dword833,[ebp-252]
	sal	dword833,2
	add	dword829,dword833
	mov	[ebp-256],dword829
	mov	dword837,[ebp-248]
	sal	dword837,2
	add	dword837,[ebp-256]
	mov	dword841,[ebp-252]
	sal	dword841,2
	sub	dword837,dword841
	mov	[ebp-260],dword837
label0024:
	mov	dword907,[ebp-236]
	mov	[ebp-300],dword907
	mov	dword906,[ebp-240]
	mov	[ebp-304],dword906
; start of inline function _tex2d
	mov	dword911,dword ptr [__texture_width]
	dec	dword911
	int2float	dword911
	fmul	dword ptr [ebp-304]
	float2int	dword913
	mov	[ebp-308],dword913
	mov	dword917,dword ptr [__texture_height]
	dec	dword917
	int2float	dword917
	fmul	dword ptr [ebp-300]
	float2int	dword919
	mov	[ebp-312],dword919
	mov	dword923,[ebp-312]
	imul	dword923,dword ptr [__texture_width]
	add	dword923,[ebp-308]
	sal	dword923,2
	add	dword923,dword ptr [__texture_data]
	mov	dword927,[dword923]
	mov	[ebp-316],dword927
label0028:
; end of inline function _tex2d
	mov	dword845,[ebp-316]
	mov	[ebp-264],dword845
	mov	dword849,[ebp-264]
	sar	dword849,24
	and	dword849,255
	mov	[ebp-292],dword849
	cmp	dword ptr [ebp-292],0
	je	label0027
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword857,[ebp-256]
	mov	dword859,[dword857]
	mov	[ebp-280],dword859
	mov	dword862,[ebp-280]
	and	dword862,65280
	sar	dword862,8
	mov	[ebp-284],dword862
	mov	dword867,[ebp-280]
	and	dword867,255
	mov	[ebp-288],dword867
	mov	dword871,[ebp-264]
	and	dword871,65280
	sar	dword871,8
	mov	[ebp-272],dword871
	mov	dword876,[ebp-264]
	and	dword876,255
	mov	[ebp-276],dword876
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword882
	mov	[ebp-272],dword882
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword888
	mov	[ebp-276],dword888
	mov	dword892,[ebp-272]
	sal	dword892,8
	add	dword892,[ebp-276]
	mov	[ebp-268],dword892
	mov	dword896,[ebp-256]
	mov	dword898,[ebp-268]
	mov	[dword896],dword898
label0027:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0025:
	add	dword ptr [ebp-256],4
	mov	dword905,[ebp-256]
	cmp	dword905,[ebp-260]
	jl	label0024
label0026:
label0029:
; end of inline function _rasterize_horiz_line
	jmp	label0023
label0022:
	mov	dword934,[ebp-192]
	mov	[ebp-228],dword934
	mov	dword933,[ebp-196]
	mov	[ebp-232],dword933
	mov	dword932,[ebp-200]
	mov	[ebp-236],dword932
	mov	dword931,[ebp-204]
	mov	[ebp-240],dword931
	mov	dword930,[ebp-216]
	mov	[ebp-244],dword930
	mov	dword929,[ebp-224]
	mov	[ebp-248],dword929
	mov	dword928,[ebp-220]
	mov	[ebp-252],dword928
; start of inline function _rasterize_horiz_line
	mov	dword938,dword ptr [__pitch]
	imul	dword938,[ebp-244]
	add	dword938,dword ptr [__videomem]
	mov	dword942,[ebp-252]
	sal	dword942,2
	add	dword938,dword942
	mov	[ebp-256],dword938
	mov	dword946,[ebp-248]
	sal	dword946,2
	add	dword946,[ebp-256]
	mov	dword950,[ebp-252]
	sal	dword950,2
	sub	dword946,dword950
	mov	[ebp-260],dword946
label002a:
	mov	dword1016,[ebp-236]
	mov	[ebp-300],dword1016
	mov	dword1015,[ebp-240]
	mov	[ebp-304],dword1015
; start of inline function _tex2d
	mov	dword1020,dword ptr [__texture_width]
	dec	dword1020
	int2float	dword1020
	fmul	dword ptr [ebp-304]
	float2int	dword1022
	mov	[ebp-308],dword1022
	mov	dword1026,dword ptr [__texture_height]
	dec	dword1026
	int2float	dword1026
	fmul	dword ptr [ebp-300]
	float2int	dword1028
	mov	[ebp-312],dword1028
	mov	dword1032,[ebp-312]
	imul	dword1032,dword ptr [__texture_width]
	add	dword1032,[ebp-308]
	sal	dword1032,2
	add	dword1032,dword ptr [__texture_data]
	mov	dword1036,[dword1032]
	mov	[ebp-316],dword1036
label002e:
; end of inline function _tex2d
	mov	dword954,[ebp-316]
	mov	[ebp-264],dword954
	mov	dword958,[ebp-264]
	sar	dword958,24
	and	dword958,255
	mov	[ebp-292],dword958
	cmp	dword ptr [ebp-292],0
	je	label002d
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword966,[ebp-256]
	mov	dword968,[dword966]
	mov	[ebp-280],dword968
	mov	dword971,[ebp-280]
	and	dword971,65280
	sar	dword971,8
	mov	[ebp-284],dword971
	mov	dword976,[ebp-280]
	and	dword976,255
	mov	[ebp-288],dword976
	mov	dword980,[ebp-264]
	and	dword980,65280
	sar	dword980,8
	mov	[ebp-272],dword980
	mov	dword985,[ebp-264]
	and	dword985,255
	mov	[ebp-276],dword985
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword991
	mov	[ebp-272],dword991
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword997
	mov	[ebp-276],dword997
	mov	dword1001,[ebp-272]
	sal	dword1001,8
	add	dword1001,[ebp-276]
	mov	[ebp-268],dword1001
	mov	dword1005,[ebp-256]
	mov	dword1007,[ebp-268]
	mov	[dword1005],dword1007
label002d:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label002b:
	add	dword ptr [ebp-256],4
	mov	dword1014,[ebp-256]
	cmp	dword1014,[ebp-260]
	jl	label002a
label002c:
label002f:
; end of inline function _rasterize_horiz_line
label0023:
label0030:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword392,[ebp-144]
	add	dword392,4
	mov	dword394,1
	add	dword394,[dword392]
	mov	[ebp-164],dword394
label0010:
label0011:
	mov	dword397,[ebp-140]
	add	dword397,4
	mov	dword400,[dword397]
	cmp	dword400,[ebp-164]
	jle	label0012
	mov	dword402,[ebp-144]
	add	dword402,4
	mov	dword405,[ebp-164]
	sub	dword405,[dword402]
	mov	dword407,[ebp-140]
	mov	dword409,[ebp-144]
	mov	dword410,[dword407]
	sub	dword410,[dword409]
	imul	dword405,dword410
	mov	dword412,[ebp-140]
	add	dword412,4
	mov	dword415,[ebp-144]
	add	dword415,4
	mov	dword417,[dword412]
	sub	dword417,[dword415]
	cdq	dword418
	idiv	dword405,dword417
	mov	dword420,[ebp-144]
	add	dword405,[dword420]
	mov	[ebp-156],dword405
	mov	dword423,[ebp-148]
	add	dword423,4
	mov	dword426,[ebp-164]
	sub	dword426,[dword423]
	mov	dword428,[ebp-140]
	mov	dword430,[ebp-148]
	mov	dword431,[dword428]
	sub	dword431,[dword430]
	imul	dword426,dword431
	mov	dword433,[ebp-140]
	add	dword433,4
	mov	dword436,[ebp-148]
	add	dword436,4
	mov	dword438,[dword433]
	sub	dword438,[dword436]
	cdq	dword439
	idiv	dword426,dword438
	mov	dword441,[ebp-148]
	add	dword426,[dword441]
	mov	[ebp-160],dword426
	mov	dword444,[ebp-144]
	add	dword444,4
	mov	dword447,[ebp-164]
	sub	dword447,[dword444]
	int2float	dword447
	mov	dword449,[ebp-140]
	mov	dword451,[ebp-144]
	fld	dword ptr [dword449+8]
	fsub	dword ptr [dword451+8]
	fmulp
	mov	dword453,[ebp-140]
	add	dword453,4
	mov	dword456,[ebp-144]
	add	dword456,4
	mov	dword458,[dword453]
	sub	dword458,[dword456]
	int2float	dword458
	fdivp
	mov	dword460,[ebp-144]
	fadd	dword ptr [dword460+8]
	fstp	dword ptr [ebp-168]
	mov	dword463,[ebp-148]
	add	dword463,4
	mov	dword466,[ebp-164]
	sub	dword466,[dword463]
	int2float	dword466
	mov	dword468,[ebp-140]
	mov	dword470,[ebp-148]
	fld	dword ptr [dword468+8]
	fsub	dword ptr [dword470+8]
	fmulp
	mov	dword472,[ebp-140]
	add	dword472,4
	mov	dword475,[ebp-148]
	add	dword475,4
	mov	dword477,[dword472]
	sub	dword477,[dword475]
	int2float	dword477
	fdivp
	mov	dword479,[ebp-148]
	fadd	dword ptr [dword479+8]
	fstp	dword ptr [ebp-176]
	mov	dword482,[ebp-144]
	add	dword482,4
	mov	dword485,[ebp-164]
	sub	dword485,[dword482]
	int2float	dword485
	mov	dword487,8
	add	dword487,[ebp-140]
	add	dword487,4
	mov	dword490,8
	add	dword490,[ebp-144]
	add	dword490,4
	fld	dword ptr [dword487]
	fsub	dword ptr [dword490]
	fmulp
	mov	dword493,[ebp-140]
	add	dword493,4
	mov	dword496,[ebp-144]
	add	dword496,4
	mov	dword498,[dword493]
	sub	dword498,[dword496]
	int2float	dword498
	fdivp
	mov	dword500,8
	add	dword500,[ebp-144]
	add	dword500,4
	fadd	dword ptr [dword500]
	fstp	dword ptr [ebp-172]
	mov	dword504,[ebp-148]
	add	dword504,4
	mov	dword507,[ebp-164]
	sub	dword507,[dword504]
	int2float	dword507
	mov	dword509,8
	add	dword509,[ebp-140]
	add	dword509,4
	mov	dword512,8
	add	dword512,[ebp-148]
	add	dword512,4
	fld	dword ptr [dword509]
	fsub	dword ptr [dword512]
	fmulp
	mov	dword515,[ebp-140]
	add	dword515,4
	mov	dword518,[ebp-148]
	add	dword518,4
	mov	dword520,[dword515]
	sub	dword520,[dword518]
	int2float	dword520
	fdivp
	mov	dword522,8
	add	dword522,[ebp-148]
	add	dword522,4
	fadd	dword ptr [dword522]
	fstp	dword ptr [ebp-180]
	mov	dword527,[ebp-160]
	sub	dword527,[ebp-156]
	int2float	dword527
	fld	dword ptr [ebp-176]
	fsub	dword ptr [ebp-168]
	fdivrp
	fstp	dword ptr [ebp-184]
	mov	dword533,[ebp-160]
	sub	dword533,[ebp-156]
	int2float	dword533
	fld	dword ptr [ebp-180]
	fsub	dword ptr [ebp-172]
	fdivrp
	fstp	dword ptr [ebp-188]
	mov	dword1045,[ebp-188]
	mov	[ebp-192],dword1045
	mov	dword1044,[ebp-184]
	mov	[ebp-196],dword1044
	mov	dword1043,[ebp-180]
	mov	[ebp-200],dword1043
	mov	dword1042,[ebp-176]
	mov	[ebp-204],dword1042
	mov	dword1041,[ebp-172]
	mov	[ebp-208],dword1041
	mov	dword1040,[ebp-168]
	mov	[ebp-212],dword1040
	mov	dword1039,[ebp-164]
	mov	[ebp-216],dword1039
	mov	dword1038,[ebp-160]
	mov	[ebp-220],dword1038
	mov	dword1037,[ebp-156]
	mov	[ebp-224],dword1037
; start of inline function _rasterize_horiz_line__unordered
	mov	dword1049,[ebp-224]
	cmp	dword1049,[ebp-220]
	jg	label0031
	mov	dword1070,[ebp-192]
	mov	[ebp-228],dword1070
	mov	dword1069,[ebp-196]
	mov	[ebp-232],dword1069
	mov	dword1068,[ebp-208]
	mov	[ebp-236],dword1068
	mov	dword1067,[ebp-212]
	mov	[ebp-240],dword1067
	mov	dword1066,[ebp-216]
	mov	[ebp-244],dword1066
	mov	dword1065,[ebp-220]
	mov	[ebp-248],dword1065
	mov	dword1064,[ebp-224]
	mov	[ebp-252],dword1064
; start of inline function _rasterize_horiz_line
	mov	dword1074,dword ptr [__pitch]
	imul	dword1074,[ebp-244]
	add	dword1074,dword ptr [__videomem]
	mov	dword1078,[ebp-252]
	sal	dword1078,2
	add	dword1074,dword1078
	mov	[ebp-256],dword1074
	mov	dword1082,[ebp-248]
	sal	dword1082,2
	add	dword1082,[ebp-256]
	mov	dword1086,[ebp-252]
	sal	dword1086,2
	sub	dword1082,dword1086
	mov	[ebp-260],dword1082
label0033:
	mov	dword1152,[ebp-236]
	mov	[ebp-300],dword1152
	mov	dword1151,[ebp-240]
	mov	[ebp-304],dword1151
; start of inline function _tex2d
	mov	dword1156,dword ptr [__texture_width]
	dec	dword1156
	int2float	dword1156
	fmul	dword ptr [ebp-304]
	float2int	dword1158
	mov	[ebp-308],dword1158
	mov	dword1162,dword ptr [__texture_height]
	dec	dword1162
	int2float	dword1162
	fmul	dword ptr [ebp-300]
	float2int	dword1164
	mov	[ebp-312],dword1164
	mov	dword1168,[ebp-312]
	imul	dword1168,dword ptr [__texture_width]
	add	dword1168,[ebp-308]
	sal	dword1168,2
	add	dword1168,dword ptr [__texture_data]
	mov	dword1172,[dword1168]
	mov	[ebp-316],dword1172
label0037:
; end of inline function _tex2d
	mov	dword1090,[ebp-316]
	mov	[ebp-264],dword1090
	mov	dword1094,[ebp-264]
	sar	dword1094,24
	and	dword1094,255
	mov	[ebp-292],dword1094
	cmp	dword ptr [ebp-292],0
	je	label0036
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword1102,[ebp-256]
	mov	dword1104,[dword1102]
	mov	[ebp-280],dword1104
	mov	dword1107,[ebp-280]
	and	dword1107,65280
	sar	dword1107,8
	mov	[ebp-284],dword1107
	mov	dword1112,[ebp-280]
	and	dword1112,255
	mov	[ebp-288],dword1112
	mov	dword1116,[ebp-264]
	and	dword1116,65280
	sar	dword1116,8
	mov	[ebp-272],dword1116
	mov	dword1121,[ebp-264]
	and	dword1121,255
	mov	[ebp-276],dword1121
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword1127
	mov	[ebp-272],dword1127
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword1133
	mov	[ebp-276],dword1133
	mov	dword1137,[ebp-272]
	sal	dword1137,8
	add	dword1137,[ebp-276]
	mov	[ebp-268],dword1137
	mov	dword1141,[ebp-256]
	mov	dword1143,[ebp-268]
	mov	[dword1141],dword1143
label0036:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0034:
	add	dword ptr [ebp-256],4
	mov	dword1150,[ebp-256]
	cmp	dword1150,[ebp-260]
	jl	label0033
label0035:
label0038:
; end of inline function _rasterize_horiz_line
	jmp	label0032
label0031:
	mov	dword1179,[ebp-192]
	mov	[ebp-228],dword1179
	mov	dword1178,[ebp-196]
	mov	[ebp-232],dword1178
	mov	dword1177,[ebp-200]
	mov	[ebp-236],dword1177
	mov	dword1176,[ebp-204]
	mov	[ebp-240],dword1176
	mov	dword1175,[ebp-216]
	mov	[ebp-244],dword1175
	mov	dword1174,[ebp-224]
	mov	[ebp-248],dword1174
	mov	dword1173,[ebp-220]
	mov	[ebp-252],dword1173
; start of inline function _rasterize_horiz_line
	mov	dword1183,dword ptr [__pitch]
	imul	dword1183,[ebp-244]
	add	dword1183,dword ptr [__videomem]
	mov	dword1187,[ebp-252]
	sal	dword1187,2
	add	dword1183,dword1187
	mov	[ebp-256],dword1183
	mov	dword1191,[ebp-248]
	sal	dword1191,2
	add	dword1191,[ebp-256]
	mov	dword1195,[ebp-252]
	sal	dword1195,2
	sub	dword1191,dword1195
	mov	[ebp-260],dword1191
label0039:
	mov	dword1261,[ebp-236]
	mov	[ebp-300],dword1261
	mov	dword1260,[ebp-240]
	mov	[ebp-304],dword1260
; start of inline function _tex2d
	mov	dword1265,dword ptr [__texture_width]
	dec	dword1265
	int2float	dword1265
	fmul	dword ptr [ebp-304]
	float2int	dword1267
	mov	[ebp-308],dword1267
	mov	dword1271,dword ptr [__texture_height]
	dec	dword1271
	int2float	dword1271
	fmul	dword ptr [ebp-300]
	float2int	dword1273
	mov	[ebp-312],dword1273
	mov	dword1277,[ebp-312]
	imul	dword1277,dword ptr [__texture_width]
	add	dword1277,[ebp-308]
	sal	dword1277,2
	add	dword1277,dword ptr [__texture_data]
	mov	dword1281,[dword1277]
	mov	[ebp-316],dword1281
label003d:
; end of inline function _tex2d
	mov	dword1199,[ebp-316]
	mov	[ebp-264],dword1199
	mov	dword1203,[ebp-264]
	sar	dword1203,24
	and	dword1203,255
	mov	[ebp-292],dword1203
	cmp	dword ptr [ebp-292],0
	je	label003c
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	dword1211,[ebp-256]
	mov	dword1213,[dword1211]
	mov	[ebp-280],dword1213
	mov	dword1216,[ebp-280]
	and	dword1216,65280
	sar	dword1216,8
	mov	[ebp-284],dword1216
	mov	dword1221,[ebp-280]
	and	dword1221,255
	mov	[ebp-288],dword1221
	mov	dword1225,[ebp-264]
	and	dword1225,65280
	sar	dword1225,8
	mov	[ebp-272],dword1225
	mov	dword1230,[ebp-264]
	and	dword1230,255
	mov	[ebp-276],dword1230
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword1236
	mov	[ebp-272],dword1236
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	float2int	dword1242
	mov	[ebp-276],dword1242
	mov	dword1246,[ebp-272]
	sal	dword1246,8
	add	dword1246,[ebp-276]
	mov	[ebp-268],dword1246
	mov	dword1250,[ebp-256]
	mov	dword1252,[ebp-268]
	mov	[dword1250],dword1252
label003c:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label003a:
	add	dword ptr [ebp-256],4
	mov	dword1259,[ebp-256]
	cmp	dword1259,[ebp-260]
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
	mov	dword4292,[ebp+8]
	mov	[ebp-1044],dword4292
	lea	dword2,[ebp-196]
	mov	[ebp-1048],dword2
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4295,[ebp-1044]
	mov	dword4306,[dword4295+8]
	mov	[ebp-1072],dword4306
	mov	dword4297,[ebp-1044]
	mov	dword4305,[dword4297+4]
	mov	[ebp-1076],dword4305
	mov	dword4299,[ebp-1044]
	mov	dword4304,[dword4299]
	mov	[ebp-1080],dword4304
	lea	dword4300,[ebp-1064]
	mov	[ebp-1084],dword4300
; start of inline function vec4f_assign
	mov	dword4309,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4309]
	mov	dword4312,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4312+4]
	mov	dword4315,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4315+8]
	mov	dword4318,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4318+12]
label00f4:
; end of inline function vec4f_assign
	lea	dword4301,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4301
	lea	dword4302,[ebp-1064]
	mov	[ebp-1092],dword4302
	mov	dword4320,[ebp-1048]
	mov	[ebp-1096],dword4320
; start of inline function matrix4f_transform
	mov	dword4323,[ebp-1092]
	mov	dword4325,[ebp-1088]
	fld	dword ptr [dword4323+4]
	fmul	dword ptr [dword4325+16]
	mov	dword4327,[ebp-1092]
	mov	dword4329,[ebp-1088]
	fld	dword ptr [dword4327]
	fmul	dword ptr [dword4329]
	faddp
	mov	dword4331,[ebp-1092]
	mov	dword4333,[ebp-1088]
	fld	dword ptr [dword4331+8]
	fmul	dword ptr [dword4333+32]
	faddp
	mov	dword4335,[ebp-1092]
	mov	dword4337,[ebp-1088]
	fld	dword ptr [dword4335+12]
	fmul	dword ptr [dword4337+48]
	faddp
	mov	dword4339,[ebp-1096]
	fstp	dword ptr [dword4339]
	mov	dword4341,[ebp-1088]
	mov	dword4343,[ebp-1092]
	fld	dword ptr [dword4343]
	fmul	dword ptr [dword4341+4]
	mov	dword4345,[ebp-1092]
	mov	dword4347,[ebp-1088]
	fld	dword ptr [dword4345+4]
	fmul	dword ptr [dword4347+20]
	faddp
	mov	dword4349,[ebp-1092]
	mov	dword4351,[ebp-1088]
	fld	dword ptr [dword4349+8]
	fmul	dword ptr [dword4351+36]
	faddp
	mov	dword4353,[ebp-1092]
	mov	dword4355,[ebp-1088]
	fld	dword ptr [dword4353+12]
	fmul	dword ptr [dword4355+52]
	faddp
	mov	dword4357,[ebp-1096]
	fstp	dword ptr [dword4357+4]
	mov	dword4359,[ebp-1088]
	mov	dword4361,[ebp-1092]
	fld	dword ptr [dword4361]
	fmul	dword ptr [dword4359+8]
	mov	dword4363,[ebp-1092]
	mov	dword4365,[ebp-1088]
	fld	dword ptr [dword4363+4]
	fmul	dword ptr [dword4365+24]
	faddp
	mov	dword4367,[ebp-1092]
	mov	dword4369,[ebp-1088]
	fld	dword ptr [dword4367+8]
	fmul	dword ptr [dword4369+40]
	faddp
	mov	dword4371,[ebp-1092]
	mov	dword4373,[ebp-1088]
	fld	dword ptr [dword4371+12]
	fmul	dword ptr [dword4373+56]
	faddp
	mov	dword4375,[ebp-1096]
	fstp	dword ptr [dword4375+8]
	mov	dword4377,[ebp-1088]
	mov	dword4379,[ebp-1092]
	fld	dword ptr [dword4379]
	fmul	dword ptr [dword4377+12]
	mov	dword4381,[ebp-1092]
	mov	dword4383,[ebp-1088]
	fld	dword ptr [dword4381+4]
	fmul	dword ptr [dword4383+28]
	faddp
	mov	dword4385,[ebp-1092]
	mov	dword4387,[ebp-1088]
	fld	dword ptr [dword4385+8]
	fmul	dword ptr [dword4387+44]
	faddp
	mov	dword4389,[ebp-1092]
	mov	dword4391,[ebp-1088]
	fld	dword ptr [dword4389+12]
	fmul	dword ptr [dword4391+60]
	faddp
	mov	dword4393,[ebp-1096]
	fstp	dword ptr [dword4393+12]
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
	mov	dword4394,[ebp+12]
	mov	[ebp-1044],dword4394
	lea	dword10,[ebp-196]
	add	dword10,24
	mov	[ebp-1048],dword10
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4397,[ebp-1044]
	mov	dword4408,[dword4397+8]
	mov	[ebp-1072],dword4408
	mov	dword4399,[ebp-1044]
	mov	dword4407,[dword4399+4]
	mov	[ebp-1076],dword4407
	mov	dword4401,[ebp-1044]
	mov	dword4406,[dword4401]
	mov	[ebp-1080],dword4406
	lea	dword4402,[ebp-1064]
	mov	[ebp-1084],dword4402
; start of inline function vec4f_assign
	mov	dword4411,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4411]
	mov	dword4414,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4414+4]
	mov	dword4417,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4417+8]
	mov	dword4420,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4420+12]
label00f7:
; end of inline function vec4f_assign
	lea	dword4403,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4403
	lea	dword4404,[ebp-1064]
	mov	[ebp-1092],dword4404
	mov	dword4422,[ebp-1048]
	mov	[ebp-1096],dword4422
; start of inline function matrix4f_transform
	mov	dword4425,[ebp-1092]
	mov	dword4427,[ebp-1088]
	fld	dword ptr [dword4425+4]
	fmul	dword ptr [dword4427+16]
	mov	dword4429,[ebp-1092]
	mov	dword4431,[ebp-1088]
	fld	dword ptr [dword4429]
	fmul	dword ptr [dword4431]
	faddp
	mov	dword4433,[ebp-1092]
	mov	dword4435,[ebp-1088]
	fld	dword ptr [dword4433+8]
	fmul	dword ptr [dword4435+32]
	faddp
	mov	dword4437,[ebp-1092]
	mov	dword4439,[ebp-1088]
	fld	dword ptr [dword4437+12]
	fmul	dword ptr [dword4439+48]
	faddp
	mov	dword4441,[ebp-1096]
	fstp	dword ptr [dword4441]
	mov	dword4443,[ebp-1088]
	mov	dword4445,[ebp-1092]
	fld	dword ptr [dword4445]
	fmul	dword ptr [dword4443+4]
	mov	dword4447,[ebp-1092]
	mov	dword4449,[ebp-1088]
	fld	dword ptr [dword4447+4]
	fmul	dword ptr [dword4449+20]
	faddp
	mov	dword4451,[ebp-1092]
	mov	dword4453,[ebp-1088]
	fld	dword ptr [dword4451+8]
	fmul	dword ptr [dword4453+36]
	faddp
	mov	dword4455,[ebp-1092]
	mov	dword4457,[ebp-1088]
	fld	dword ptr [dword4455+12]
	fmul	dword ptr [dword4457+52]
	faddp
	mov	dword4459,[ebp-1096]
	fstp	dword ptr [dword4459+4]
	mov	dword4461,[ebp-1088]
	mov	dword4463,[ebp-1092]
	fld	dword ptr [dword4463]
	fmul	dword ptr [dword4461+8]
	mov	dword4465,[ebp-1092]
	mov	dword4467,[ebp-1088]
	fld	dword ptr [dword4465+4]
	fmul	dword ptr [dword4467+24]
	faddp
	mov	dword4469,[ebp-1092]
	mov	dword4471,[ebp-1088]
	fld	dword ptr [dword4469+8]
	fmul	dword ptr [dword4471+40]
	faddp
	mov	dword4473,[ebp-1092]
	mov	dword4475,[ebp-1088]
	fld	dword ptr [dword4473+12]
	fmul	dword ptr [dword4475+56]
	faddp
	mov	dword4477,[ebp-1096]
	fstp	dword ptr [dword4477+8]
	mov	dword4479,[ebp-1088]
	mov	dword4481,[ebp-1092]
	fld	dword ptr [dword4481]
	fmul	dword ptr [dword4479+12]
	mov	dword4483,[ebp-1092]
	mov	dword4485,[ebp-1088]
	fld	dword ptr [dword4483+4]
	fmul	dword ptr [dword4485+28]
	faddp
	mov	dword4487,[ebp-1092]
	mov	dword4489,[ebp-1088]
	fld	dword ptr [dword4487+8]
	fmul	dword ptr [dword4489+44]
	faddp
	mov	dword4491,[ebp-1092]
	mov	dword4493,[ebp-1088]
	fld	dword ptr [dword4491+12]
	fmul	dword ptr [dword4493+60]
	faddp
	mov	dword4495,[ebp-1096]
	fstp	dword ptr [dword4495+12]
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
	mov	dword4496,[ebp+16]
	mov	[ebp-1044],dword4496
	lea	dword20,[ebp-196]
	add	dword20,48
	mov	[ebp-1048],dword20
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4499,[ebp-1044]
	mov	dword4510,[dword4499+8]
	mov	[ebp-1072],dword4510
	mov	dword4501,[ebp-1044]
	mov	dword4509,[dword4501+4]
	mov	[ebp-1076],dword4509
	mov	dword4503,[ebp-1044]
	mov	dword4508,[dword4503]
	mov	[ebp-1080],dword4508
	lea	dword4504,[ebp-1064]
	mov	[ebp-1084],dword4504
; start of inline function vec4f_assign
	mov	dword4513,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4513]
	mov	dword4516,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4516+4]
	mov	dword4519,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4519+8]
	mov	dword4522,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4522+12]
label00fa:
; end of inline function vec4f_assign
	lea	dword4505,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4505
	lea	dword4506,[ebp-1064]
	mov	[ebp-1092],dword4506
	mov	dword4524,[ebp-1048]
	mov	[ebp-1096],dword4524
; start of inline function matrix4f_transform
	mov	dword4527,[ebp-1092]
	mov	dword4529,[ebp-1088]
	fld	dword ptr [dword4527+4]
	fmul	dword ptr [dword4529+16]
	mov	dword4531,[ebp-1092]
	mov	dword4533,[ebp-1088]
	fld	dword ptr [dword4531]
	fmul	dword ptr [dword4533]
	faddp
	mov	dword4535,[ebp-1092]
	mov	dword4537,[ebp-1088]
	fld	dword ptr [dword4535+8]
	fmul	dword ptr [dword4537+32]
	faddp
	mov	dword4539,[ebp-1092]
	mov	dword4541,[ebp-1088]
	fld	dword ptr [dword4539+12]
	fmul	dword ptr [dword4541+48]
	faddp
	mov	dword4543,[ebp-1096]
	fstp	dword ptr [dword4543]
	mov	dword4545,[ebp-1088]
	mov	dword4547,[ebp-1092]
	fld	dword ptr [dword4547]
	fmul	dword ptr [dword4545+4]
	mov	dword4549,[ebp-1092]
	mov	dword4551,[ebp-1088]
	fld	dword ptr [dword4549+4]
	fmul	dword ptr [dword4551+20]
	faddp
	mov	dword4553,[ebp-1092]
	mov	dword4555,[ebp-1088]
	fld	dword ptr [dword4553+8]
	fmul	dword ptr [dword4555+36]
	faddp
	mov	dword4557,[ebp-1092]
	mov	dword4559,[ebp-1088]
	fld	dword ptr [dword4557+12]
	fmul	dword ptr [dword4559+52]
	faddp
	mov	dword4561,[ebp-1096]
	fstp	dword ptr [dword4561+4]
	mov	dword4563,[ebp-1088]
	mov	dword4565,[ebp-1092]
	fld	dword ptr [dword4565]
	fmul	dword ptr [dword4563+8]
	mov	dword4567,[ebp-1092]
	mov	dword4569,[ebp-1088]
	fld	dword ptr [dword4567+4]
	fmul	dword ptr [dword4569+24]
	faddp
	mov	dword4571,[ebp-1092]
	mov	dword4573,[ebp-1088]
	fld	dword ptr [dword4571+8]
	fmul	dword ptr [dword4573+40]
	faddp
	mov	dword4575,[ebp-1092]
	mov	dword4577,[ebp-1088]
	fld	dword ptr [dword4575+12]
	fmul	dword ptr [dword4577+56]
	faddp
	mov	dword4579,[ebp-1096]
	fstp	dword ptr [dword4579+8]
	mov	dword4581,[ebp-1088]
	mov	dword4583,[ebp-1092]
	fld	dword ptr [dword4583]
	fmul	dword ptr [dword4581+12]
	mov	dword4585,[ebp-1092]
	mov	dword4587,[ebp-1088]
	fld	dword ptr [dword4585+4]
	fmul	dword ptr [dword4587+28]
	faddp
	mov	dword4589,[ebp-1092]
	mov	dword4591,[ebp-1088]
	fld	dword ptr [dword4589+8]
	fmul	dword ptr [dword4591+44]
	faddp
	mov	dword4593,[ebp-1092]
	mov	dword4595,[ebp-1088]
	fld	dword ptr [dword4593+12]
	fmul	dword ptr [dword4595+60]
	faddp
	mov	dword4597,[ebp-1096]
	fstp	dword ptr [dword4597+12]
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
	mov	dword2042,[ebp-200]
	mov	[ebp-648],dword2042
; start of inline function _clip_poligon
	lea	dword2044,dword ptr [__clip_z_far_norm]
	mov	[ebp-848],dword2044
	lea	dword2045,dword ptr [__clip_z_far_base]
	mov	[ebp-852],dword2045
	mov	dword2072,[ebp-648]
	mov	[ebp-856],dword2072
	lea	dword2047,[ebp-844]
	mov	[ebp-860],dword2047
; start of inline function _clip_on_plain
	mov	dword2075,[ebp-860]
	mov	dword ptr [dword2075+192],0
	mov	dword2078,[ebp-856]
	mov	[ebp-864],dword2078
	mov	dword2081,[ebp-856]
	add	dword2081,24
	mov	[ebp-868],dword2081
label0070:
label0071:
	mov	dword2085,[ebp-856]
	mov	dword2087,[dword2085+192]
	imul	dword2087,24
	mov	dword2089,[ebp-856]
	add	dword2089,dword2087
	cmp	dword2089,[ebp-868]
	jle	label0072
	mov	dword2235,[ebp-852]
	mov	[ebp-968],dword2235
	mov	dword2093,[ebp-864]
	mov	[ebp-972],dword2093
	lea	dword2094,[ebp-884]
	mov	[ebp-976],dword2094
; start of inline function vec4f_subtract
	mov	dword2238,[ebp-972]
	mov	dword2240,[ebp-968]
	fld	dword ptr [dword2238]
	fsub	dword ptr [dword2240]
	mov	dword2242,[ebp-976]
	fstp	dword ptr [dword2242]
	mov	dword2244,[ebp-972]
	mov	dword2246,[ebp-968]
	fld	dword ptr [dword2244+4]
	fsub	dword ptr [dword2246+4]
	mov	dword2248,[ebp-976]
	fstp	dword ptr [dword2248+4]
	mov	dword2250,[ebp-972]
	mov	dword2252,[ebp-968]
	fld	dword ptr [dword2250+8]
	fsub	dword ptr [dword2252+8]
	mov	dword2254,[ebp-976]
	fstp	dword ptr [dword2254+8]
	mov	dword2256,[ebp-972]
	mov	dword2258,[ebp-968]
	fld	dword ptr [dword2256+12]
	fsub	dword ptr [dword2258+12]
	mov	dword2260,[ebp-976]
	fstp	dword ptr [dword2260+12]
label007b:
; end of inline function vec4f_subtract
	mov	dword2338,[ebp-848]
	mov	[ebp-980],dword2338
	lea	dword2096,[ebp-884]
	mov	[ebp-984],dword2096
; start of inline function vec4f_dot
	mov	dword2341,[ebp-984]
	mov	dword2343,[ebp-980]
	fld	dword ptr [dword2341+4]
	fmul	dword ptr [dword2343+4]
	mov	dword2345,[ebp-984]
	mov	dword2347,[ebp-980]
	fld	dword ptr [dword2345]
	fmul	dword ptr [dword2347]
	faddp
	mov	dword2349,[ebp-984]
	mov	dword2351,[ebp-980]
	fld	dword ptr [dword2349+8]
	fmul	dword ptr [dword2351+8]
	faddp
	mov	dword2353,[ebp-984]
	mov	dword2355,[ebp-980]
	fld	dword ptr [dword2353+12]
	fmul	dword ptr [dword2355+12]
	faddp
	fstp	dword ptr [ebp-988]
label007f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2261,[ebp-852]
	mov	[ebp-968],dword2261
	mov	dword2100,[ebp-868]
	mov	[ebp-972],dword2100
	lea	dword2101,[ebp-884]
	mov	[ebp-976],dword2101
; start of inline function vec4f_subtract
	mov	dword2264,[ebp-972]
	mov	dword2266,[ebp-968]
	fld	dword ptr [dword2264]
	fsub	dword ptr [dword2266]
	mov	dword2268,[ebp-976]
	fstp	dword ptr [dword2268]
	mov	dword2270,[ebp-972]
	mov	dword2272,[ebp-968]
	fld	dword ptr [dword2270+4]
	fsub	dword ptr [dword2272+4]
	mov	dword2274,[ebp-976]
	fstp	dword ptr [dword2274+4]
	mov	dword2276,[ebp-972]
	mov	dword2278,[ebp-968]
	fld	dword ptr [dword2276+8]
	fsub	dword ptr [dword2278+8]
	mov	dword2280,[ebp-976]
	fstp	dword ptr [dword2280+8]
	mov	dword2282,[ebp-972]
	mov	dword2284,[ebp-968]
	fld	dword ptr [dword2282+12]
	fsub	dword ptr [dword2284+12]
	mov	dword2286,[ebp-976]
	fstp	dword ptr [dword2286+12]
label007c:
; end of inline function vec4f_subtract
	mov	dword2356,[ebp-848]
	mov	[ebp-980],dword2356
	lea	dword2103,[ebp-884]
	mov	[ebp-984],dword2103
; start of inline function vec4f_dot
	mov	dword2359,[ebp-984]
	mov	dword2361,[ebp-980]
	fld	dword ptr [dword2359+4]
	fmul	dword ptr [dword2361+4]
	mov	dword2363,[ebp-984]
	mov	dword2365,[ebp-980]
	fld	dword ptr [dword2363]
	fmul	dword ptr [dword2365]
	faddp
	mov	dword2367,[ebp-984]
	mov	dword2369,[ebp-980]
	fld	dword ptr [dword2367+8]
	fmul	dword ptr [dword2369+8]
	faddp
	mov	dword2371,[ebp-984]
	mov	dword2373,[ebp-980]
	fld	dword ptr [dword2371+12]
	fmul	dword ptr [dword2373+12]
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
	mov	dword2107,[ebp-860]
	mov	dword2108,[dword2107+192]
	inc	dword ptr [dword2107+192]
	imul	dword2108,24
	mov	dword2111,[ebp-860]
	add	dword2111,dword2108
	mov	dword2113,[ebp-864]
	mov	dword2114,[dword2113]
	mov	dword2115,[dword2113+4]
	mov	[dword2111],dword2114
	mov	[dword2111+4],dword2115
	mov	dword2114,[dword2113+8]
	mov	dword2115,[dword2113+12]
	mov	[dword2111+8],dword2114
	mov	[dword2111+12],dword2115
	mov	dword2114,[dword2113+16]
	mov	dword2115,[dword2113+20]
	mov	[dword2111+16],dword2114
	mov	[dword2111+20],dword2115
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
	mov	dword2121,[ebp-864]
	mov	[ebp-968],dword2121
	mov	dword2287,[ebp-852]
	mov	[ebp-972],dword2287
	lea	dword2123,[ebp-884]
	mov	[ebp-976],dword2123
; start of inline function vec4f_subtract
	mov	dword2290,[ebp-972]
	mov	dword2292,[ebp-968]
	fld	dword ptr [dword2290]
	fsub	dword ptr [dword2292]
	mov	dword2294,[ebp-976]
	fstp	dword ptr [dword2294]
	mov	dword2296,[ebp-972]
	mov	dword2298,[ebp-968]
	fld	dword ptr [dword2296+4]
	fsub	dword ptr [dword2298+4]
	mov	dword2300,[ebp-976]
	fstp	dword ptr [dword2300+4]
	mov	dword2302,[ebp-972]
	mov	dword2304,[ebp-968]
	fld	dword ptr [dword2302+8]
	fsub	dword ptr [dword2304+8]
	mov	dword2306,[ebp-976]
	fstp	dword ptr [dword2306+8]
	mov	dword2308,[ebp-972]
	mov	dword2310,[ebp-968]
	fld	dword ptr [dword2308+12]
	fsub	dword ptr [dword2310+12]
	mov	dword2312,[ebp-976]
	fstp	dword ptr [dword2312+12]
label007d:
; end of inline function vec4f_subtract
	mov	dword2125,[ebp-864]
	mov	[ebp-968],dword2125
	mov	dword2127,[ebp-868]
	mov	[ebp-972],dword2127
	lea	dword2128,[ebp-900]
	mov	[ebp-976],dword2128
; start of inline function vec4f_subtract
	mov	dword2315,[ebp-972]
	mov	dword2317,[ebp-968]
	fld	dword ptr [dword2315]
	fsub	dword ptr [dword2317]
	mov	dword2319,[ebp-976]
	fstp	dword ptr [dword2319]
	mov	dword2321,[ebp-972]
	mov	dword2323,[ebp-968]
	fld	dword ptr [dword2321+4]
	fsub	dword ptr [dword2323+4]
	mov	dword2325,[ebp-976]
	fstp	dword ptr [dword2325+4]
	mov	dword2327,[ebp-972]
	mov	dword2329,[ebp-968]
	fld	dword ptr [dword2327+8]
	fsub	dword ptr [dword2329+8]
	mov	dword2331,[ebp-976]
	fstp	dword ptr [dword2331+8]
	mov	dword2333,[ebp-972]
	mov	dword2335,[ebp-968]
	fld	dword ptr [dword2333+12]
	fsub	dword ptr [dword2335+12]
	mov	dword2337,[ebp-976]
	fstp	dword ptr [dword2337+12]
label007e:
; end of inline function vec4f_subtract
	mov	dword2374,[ebp-848]
	mov	[ebp-980],dword2374
	lea	dword2130,[ebp-884]
	mov	[ebp-984],dword2130
; start of inline function vec4f_dot
	mov	dword2377,[ebp-984]
	mov	dword2379,[ebp-980]
	fld	dword ptr [dword2377+4]
	fmul	dword ptr [dword2379+4]
	mov	dword2381,[ebp-984]
	mov	dword2383,[ebp-980]
	fld	dword ptr [dword2381]
	fmul	dword ptr [dword2383]
	faddp
	mov	dword2385,[ebp-984]
	mov	dword2387,[ebp-980]
	fld	dword ptr [dword2385+8]
	fmul	dword ptr [dword2387+8]
	faddp
	mov	dword2389,[ebp-984]
	mov	dword2391,[ebp-980]
	fld	dword ptr [dword2389+12]
	fmul	dword ptr [dword2391+12]
	faddp
	fstp	dword ptr [ebp-988]
label0081:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword2392,[ebp-848]
	mov	[ebp-980],dword2392
	lea	dword2132,[ebp-900]
	mov	[ebp-984],dword2132
; start of inline function vec4f_dot
	mov	dword2395,[ebp-984]
	mov	dword2397,[ebp-980]
	fld	dword ptr [dword2395+4]
	fmul	dword ptr [dword2397+4]
	mov	dword2399,[ebp-984]
	mov	dword2401,[ebp-980]
	fld	dword ptr [dword2399]
	fmul	dword ptr [dword2401]
	faddp
	mov	dword2403,[ebp-984]
	mov	dword2405,[ebp-980]
	fld	dword ptr [dword2403+8]
	fmul	dword ptr [dword2405+8]
	faddp
	mov	dword2407,[ebp-984]
	mov	dword2409,[ebp-980]
	fld	dword ptr [dword2407+12]
	fmul	dword ptr [dword2409+12]
	faddp
	fstp	dword ptr [ebp-988]
label0082:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword2410,[ebp-920]
	mov	[ebp-992],dword2410
	lea	dword2135,[ebp-900]
	mov	[ebp-996],dword2135
; start of inline function vec4f_mul
	mov	dword2413,[ebp-996]
	fld	dword ptr [dword2413]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2413]
	mov	dword2416,[ebp-996]
	fld	dword ptr [dword2416+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2416+4]
	mov	dword2419,[ebp-996]
	fld	dword ptr [dword2419+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2419+8]
	mov	dword2422,[ebp-996]
	fld	dword ptr [dword2422+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2422+12]
label0083:
; end of inline function vec4f_mul
	lea	dword2136,[ebp-900]
	mov	[ebp-956],dword2136
	mov	dword2138,[ebp-864]
	mov	[ebp-960],dword2138
	mov	dword2140,[ebp-860]
	mov	dword2142,[dword2140+192]
	imul	dword2142,24
	mov	dword2144,[ebp-860]
	add	dword2144,dword2142
	mov	[ebp-964],dword2144
; start of inline function vec4f_add
	mov	dword2212,[ebp-960]
	mov	dword2214,[ebp-956]
	fld	dword ptr [dword2212]
	fadd	dword ptr [dword2214]
	mov	dword2216,[ebp-964]
	fstp	dword ptr [dword2216]
	mov	dword2218,[ebp-960]
	mov	dword2220,[ebp-956]
	fld	dword ptr [dword2218+4]
	fadd	dword ptr [dword2220+4]
	mov	dword2222,[ebp-964]
	fstp	dword ptr [dword2222+4]
	mov	dword2224,[ebp-960]
	mov	dword2226,[ebp-956]
	fld	dword ptr [dword2224+8]
	fadd	dword ptr [dword2226+8]
	mov	dword2228,[ebp-964]
	fstp	dword ptr [dword2228+8]
	mov	dword2230,[ebp-960]
	mov	dword2232,[ebp-956]
	fld	dword ptr [dword2230+12]
	fadd	dword ptr [dword2232+12]
	mov	dword2234,[ebp-964]
	fstp	dword ptr [dword2234+12]
label007a:
; end of inline function vec4f_add
	mov	dword2146,16
	add	dword2146,[ebp-864]
	mov	[ebp-936],dword2146
	mov	dword2148,16
	add	dword2148,[ebp-868]
	mov	[ebp-940],dword2148
	lea	dword2149,[ebp-908]
	mov	[ebp-944],dword2149
; start of inline function vec2f_subtract
	mov	dword2191,[ebp-940]
	mov	dword2193,[ebp-936]
	fld	dword ptr [dword2191]
	fsub	dword ptr [dword2193]
	mov	dword2195,[ebp-944]
	fstp	dword ptr [dword2195]
	mov	dword2197,[ebp-940]
	mov	dword2199,[ebp-936]
	fld	dword ptr [dword2197+4]
	fsub	dword ptr [dword2199+4]
	mov	dword2201,[ebp-944]
	fstp	dword ptr [dword2201+4]
label0078:
; end of inline function vec2f_subtract
	mov	dword2202,[ebp-920]
	mov	[ebp-948],dword2202
	lea	dword2151,[ebp-908]
	mov	[ebp-952],dword2151
; start of inline function vec2f_mul
	mov	dword2205,[ebp-952]
	fld	dword ptr [dword2205]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2205]
	mov	dword2208,[ebp-952]
	fld	dword ptr [dword2208+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2208+4]
label0079:
; end of inline function vec2f_mul
	lea	dword2152,[ebp-908]
	mov	[ebp-924],dword2152
	mov	dword2154,16
	add	dword2154,[ebp-864]
	mov	[ebp-928],dword2154
	mov	dword2156,[ebp-860]
	mov	dword2158,[dword2156+192]
	imul	dword2158,24
	mov	dword2160,[ebp-860]
	add	dword2160,dword2158
	add	dword2160,16
	mov	[ebp-932],dword2160
; start of inline function vec2f_add
	mov	dword2178,[ebp-928]
	mov	dword2180,[ebp-924]
	fld	dword ptr [dword2178]
	fadd	dword ptr [dword2180]
	mov	dword2182,[ebp-932]
	fstp	dword ptr [dword2182]
	mov	dword2184,[ebp-928]
	mov	dword2186,[ebp-924]
	fld	dword ptr [dword2184+4]
	fadd	dword ptr [dword2186+4]
	mov	dword2188,[ebp-932]
	fstp	dword ptr [dword2188+4]
label0077:
; end of inline function vec2f_add
	mov	dword2163,[ebp-860]
	inc	dword ptr [dword2163+192]
label0074:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label0071
label0072:
	mov	dword2167,[ebp-860]
	mov	dword2168,[dword2167+192]
	inc	dword ptr [dword2167+192]
	imul	dword2168,24
	mov	dword2171,[ebp-860]
	add	dword2171,dword2168
	mov	dword2173,[ebp-860]
	mov	dword2174,[dword2173]
	mov	dword2175,[dword2173+4]
	mov	[dword2171],dword2174
	mov	[dword2171+4],dword2175
	mov	dword2174,[dword2173+8]
	mov	dword2175,[dword2173+12]
	mov	[dword2171+8],dword2174
	mov	[dword2171+12],dword2175
	mov	dword2174,[dword2173+16]
	mov	dword2175,[dword2173+20]
	mov	[dword2171+16],dword2174
	mov	[dword2171+20],dword2175
label0084:
; end of inline function _clip_on_plain
	lea	dword2048,dword ptr [__clip_z_near_norm]
	mov	[ebp-848],dword2048
	lea	dword2049,dword ptr [__clip_z_near_base]
	mov	[ebp-852],dword2049
	lea	dword2050,[ebp-844]
	mov	[ebp-856],dword2050
	mov	dword2424,[ebp-648]
	mov	[ebp-860],dword2424
; start of inline function _clip_on_plain
	mov	dword2427,[ebp-860]
	mov	dword ptr [dword2427+192],0
	mov	dword2430,[ebp-856]
	mov	[ebp-864],dword2430
	mov	dword2433,[ebp-856]
	add	dword2433,24
	mov	[ebp-868],dword2433
label0085:
label0086:
	mov	dword2437,[ebp-856]
	mov	dword2439,[dword2437+192]
	imul	dword2439,24
	mov	dword2441,[ebp-856]
	add	dword2441,dword2439
	cmp	dword2441,[ebp-868]
	jle	label0087
	mov	dword2587,[ebp-852]
	mov	[ebp-968],dword2587
	mov	dword2445,[ebp-864]
	mov	[ebp-972],dword2445
	lea	dword2446,[ebp-884]
	mov	[ebp-976],dword2446
; start of inline function vec4f_subtract
	mov	dword2590,[ebp-972]
	mov	dword2592,[ebp-968]
	fld	dword ptr [dword2590]
	fsub	dword ptr [dword2592]
	mov	dword2594,[ebp-976]
	fstp	dword ptr [dword2594]
	mov	dword2596,[ebp-972]
	mov	dword2598,[ebp-968]
	fld	dword ptr [dword2596+4]
	fsub	dword ptr [dword2598+4]
	mov	dword2600,[ebp-976]
	fstp	dword ptr [dword2600+4]
	mov	dword2602,[ebp-972]
	mov	dword2604,[ebp-968]
	fld	dword ptr [dword2602+8]
	fsub	dword ptr [dword2604+8]
	mov	dword2606,[ebp-976]
	fstp	dword ptr [dword2606+8]
	mov	dword2608,[ebp-972]
	mov	dword2610,[ebp-968]
	fld	dword ptr [dword2608+12]
	fsub	dword ptr [dword2610+12]
	mov	dword2612,[ebp-976]
	fstp	dword ptr [dword2612+12]
label0090:
; end of inline function vec4f_subtract
	mov	dword2690,[ebp-848]
	mov	[ebp-980],dword2690
	lea	dword2448,[ebp-884]
	mov	[ebp-984],dword2448
; start of inline function vec4f_dot
	mov	dword2693,[ebp-984]
	mov	dword2695,[ebp-980]
	fld	dword ptr [dword2693+4]
	fmul	dword ptr [dword2695+4]
	mov	dword2697,[ebp-984]
	mov	dword2699,[ebp-980]
	fld	dword ptr [dword2697]
	fmul	dword ptr [dword2699]
	faddp
	mov	dword2701,[ebp-984]
	mov	dword2703,[ebp-980]
	fld	dword ptr [dword2701+8]
	fmul	dword ptr [dword2703+8]
	faddp
	mov	dword2705,[ebp-984]
	mov	dword2707,[ebp-980]
	fld	dword ptr [dword2705+12]
	fmul	dword ptr [dword2707+12]
	faddp
	fstp	dword ptr [ebp-988]
label0094:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2613,[ebp-852]
	mov	[ebp-968],dword2613
	mov	dword2452,[ebp-868]
	mov	[ebp-972],dword2452
	lea	dword2453,[ebp-884]
	mov	[ebp-976],dword2453
; start of inline function vec4f_subtract
	mov	dword2616,[ebp-972]
	mov	dword2618,[ebp-968]
	fld	dword ptr [dword2616]
	fsub	dword ptr [dword2618]
	mov	dword2620,[ebp-976]
	fstp	dword ptr [dword2620]
	mov	dword2622,[ebp-972]
	mov	dword2624,[ebp-968]
	fld	dword ptr [dword2622+4]
	fsub	dword ptr [dword2624+4]
	mov	dword2626,[ebp-976]
	fstp	dword ptr [dword2626+4]
	mov	dword2628,[ebp-972]
	mov	dword2630,[ebp-968]
	fld	dword ptr [dword2628+8]
	fsub	dword ptr [dword2630+8]
	mov	dword2632,[ebp-976]
	fstp	dword ptr [dword2632+8]
	mov	dword2634,[ebp-972]
	mov	dword2636,[ebp-968]
	fld	dword ptr [dword2634+12]
	fsub	dword ptr [dword2636+12]
	mov	dword2638,[ebp-976]
	fstp	dword ptr [dword2638+12]
label0091:
; end of inline function vec4f_subtract
	mov	dword2708,[ebp-848]
	mov	[ebp-980],dword2708
	lea	dword2455,[ebp-884]
	mov	[ebp-984],dword2455
; start of inline function vec4f_dot
	mov	dword2711,[ebp-984]
	mov	dword2713,[ebp-980]
	fld	dword ptr [dword2711+4]
	fmul	dword ptr [dword2713+4]
	mov	dword2715,[ebp-984]
	mov	dword2717,[ebp-980]
	fld	dword ptr [dword2715]
	fmul	dword ptr [dword2717]
	faddp
	mov	dword2719,[ebp-984]
	mov	dword2721,[ebp-980]
	fld	dword ptr [dword2719+8]
	fmul	dword ptr [dword2721+8]
	faddp
	mov	dword2723,[ebp-984]
	mov	dword2725,[ebp-980]
	fld	dword ptr [dword2723+12]
	fmul	dword ptr [dword2725+12]
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
	mov	dword2459,[ebp-860]
	mov	dword2460,[dword2459+192]
	inc	dword ptr [dword2459+192]
	imul	dword2460,24
	mov	dword2463,[ebp-860]
	add	dword2463,dword2460
	mov	dword2465,[ebp-864]
	mov	dword2466,[dword2465]
	mov	dword2467,[dword2465+4]
	mov	[dword2463],dword2466
	mov	[dword2463+4],dword2467
	mov	dword2466,[dword2465+8]
	mov	dword2467,[dword2465+12]
	mov	[dword2463+8],dword2466
	mov	[dword2463+12],dword2467
	mov	dword2466,[dword2465+16]
	mov	dword2467,[dword2465+20]
	mov	[dword2463+16],dword2466
	mov	[dword2463+20],dword2467
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
	mov	dword2473,[ebp-864]
	mov	[ebp-968],dword2473
	mov	dword2639,[ebp-852]
	mov	[ebp-972],dword2639
	lea	dword2475,[ebp-884]
	mov	[ebp-976],dword2475
; start of inline function vec4f_subtract
	mov	dword2642,[ebp-972]
	mov	dword2644,[ebp-968]
	fld	dword ptr [dword2642]
	fsub	dword ptr [dword2644]
	mov	dword2646,[ebp-976]
	fstp	dword ptr [dword2646]
	mov	dword2648,[ebp-972]
	mov	dword2650,[ebp-968]
	fld	dword ptr [dword2648+4]
	fsub	dword ptr [dword2650+4]
	mov	dword2652,[ebp-976]
	fstp	dword ptr [dword2652+4]
	mov	dword2654,[ebp-972]
	mov	dword2656,[ebp-968]
	fld	dword ptr [dword2654+8]
	fsub	dword ptr [dword2656+8]
	mov	dword2658,[ebp-976]
	fstp	dword ptr [dword2658+8]
	mov	dword2660,[ebp-972]
	mov	dword2662,[ebp-968]
	fld	dword ptr [dword2660+12]
	fsub	dword ptr [dword2662+12]
	mov	dword2664,[ebp-976]
	fstp	dword ptr [dword2664+12]
label0092:
; end of inline function vec4f_subtract
	mov	dword2477,[ebp-864]
	mov	[ebp-968],dword2477
	mov	dword2479,[ebp-868]
	mov	[ebp-972],dword2479
	lea	dword2480,[ebp-900]
	mov	[ebp-976],dword2480
; start of inline function vec4f_subtract
	mov	dword2667,[ebp-972]
	mov	dword2669,[ebp-968]
	fld	dword ptr [dword2667]
	fsub	dword ptr [dword2669]
	mov	dword2671,[ebp-976]
	fstp	dword ptr [dword2671]
	mov	dword2673,[ebp-972]
	mov	dword2675,[ebp-968]
	fld	dword ptr [dword2673+4]
	fsub	dword ptr [dword2675+4]
	mov	dword2677,[ebp-976]
	fstp	dword ptr [dword2677+4]
	mov	dword2679,[ebp-972]
	mov	dword2681,[ebp-968]
	fld	dword ptr [dword2679+8]
	fsub	dword ptr [dword2681+8]
	mov	dword2683,[ebp-976]
	fstp	dword ptr [dword2683+8]
	mov	dword2685,[ebp-972]
	mov	dword2687,[ebp-968]
	fld	dword ptr [dword2685+12]
	fsub	dword ptr [dword2687+12]
	mov	dword2689,[ebp-976]
	fstp	dword ptr [dword2689+12]
label0093:
; end of inline function vec4f_subtract
	mov	dword2726,[ebp-848]
	mov	[ebp-980],dword2726
	lea	dword2482,[ebp-884]
	mov	[ebp-984],dword2482
; start of inline function vec4f_dot
	mov	dword2729,[ebp-984]
	mov	dword2731,[ebp-980]
	fld	dword ptr [dword2729+4]
	fmul	dword ptr [dword2731+4]
	mov	dword2733,[ebp-984]
	mov	dword2735,[ebp-980]
	fld	dword ptr [dword2733]
	fmul	dword ptr [dword2735]
	faddp
	mov	dword2737,[ebp-984]
	mov	dword2739,[ebp-980]
	fld	dword ptr [dword2737+8]
	fmul	dword ptr [dword2739+8]
	faddp
	mov	dword2741,[ebp-984]
	mov	dword2743,[ebp-980]
	fld	dword ptr [dword2741+12]
	fmul	dword ptr [dword2743+12]
	faddp
	fstp	dword ptr [ebp-988]
label0096:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword2744,[ebp-848]
	mov	[ebp-980],dword2744
	lea	dword2484,[ebp-900]
	mov	[ebp-984],dword2484
; start of inline function vec4f_dot
	mov	dword2747,[ebp-984]
	mov	dword2749,[ebp-980]
	fld	dword ptr [dword2747+4]
	fmul	dword ptr [dword2749+4]
	mov	dword2751,[ebp-984]
	mov	dword2753,[ebp-980]
	fld	dword ptr [dword2751]
	fmul	dword ptr [dword2753]
	faddp
	mov	dword2755,[ebp-984]
	mov	dword2757,[ebp-980]
	fld	dword ptr [dword2755+8]
	fmul	dword ptr [dword2757+8]
	faddp
	mov	dword2759,[ebp-984]
	mov	dword2761,[ebp-980]
	fld	dword ptr [dword2759+12]
	fmul	dword ptr [dword2761+12]
	faddp
	fstp	dword ptr [ebp-988]
label0097:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword2762,[ebp-920]
	mov	[ebp-992],dword2762
	lea	dword2487,[ebp-900]
	mov	[ebp-996],dword2487
; start of inline function vec4f_mul
	mov	dword2765,[ebp-996]
	fld	dword ptr [dword2765]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2765]
	mov	dword2768,[ebp-996]
	fld	dword ptr [dword2768+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2768+4]
	mov	dword2771,[ebp-996]
	fld	dword ptr [dword2771+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2771+8]
	mov	dword2774,[ebp-996]
	fld	dword ptr [dword2774+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2774+12]
label0098:
; end of inline function vec4f_mul
	lea	dword2488,[ebp-900]
	mov	[ebp-956],dword2488
	mov	dword2490,[ebp-864]
	mov	[ebp-960],dword2490
	mov	dword2492,[ebp-860]
	mov	dword2494,[dword2492+192]
	imul	dword2494,24
	mov	dword2496,[ebp-860]
	add	dword2496,dword2494
	mov	[ebp-964],dword2496
; start of inline function vec4f_add
	mov	dword2564,[ebp-960]
	mov	dword2566,[ebp-956]
	fld	dword ptr [dword2564]
	fadd	dword ptr [dword2566]
	mov	dword2568,[ebp-964]
	fstp	dword ptr [dword2568]
	mov	dword2570,[ebp-960]
	mov	dword2572,[ebp-956]
	fld	dword ptr [dword2570+4]
	fadd	dword ptr [dword2572+4]
	mov	dword2574,[ebp-964]
	fstp	dword ptr [dword2574+4]
	mov	dword2576,[ebp-960]
	mov	dword2578,[ebp-956]
	fld	dword ptr [dword2576+8]
	fadd	dword ptr [dword2578+8]
	mov	dword2580,[ebp-964]
	fstp	dword ptr [dword2580+8]
	mov	dword2582,[ebp-960]
	mov	dword2584,[ebp-956]
	fld	dword ptr [dword2582+12]
	fadd	dword ptr [dword2584+12]
	mov	dword2586,[ebp-964]
	fstp	dword ptr [dword2586+12]
label008f:
; end of inline function vec4f_add
	mov	dword2498,16
	add	dword2498,[ebp-864]
	mov	[ebp-936],dword2498
	mov	dword2500,16
	add	dword2500,[ebp-868]
	mov	[ebp-940],dword2500
	lea	dword2501,[ebp-908]
	mov	[ebp-944],dword2501
; start of inline function vec2f_subtract
	mov	dword2543,[ebp-940]
	mov	dword2545,[ebp-936]
	fld	dword ptr [dword2543]
	fsub	dword ptr [dword2545]
	mov	dword2547,[ebp-944]
	fstp	dword ptr [dword2547]
	mov	dword2549,[ebp-940]
	mov	dword2551,[ebp-936]
	fld	dword ptr [dword2549+4]
	fsub	dword ptr [dword2551+4]
	mov	dword2553,[ebp-944]
	fstp	dword ptr [dword2553+4]
label008d:
; end of inline function vec2f_subtract
	mov	dword2554,[ebp-920]
	mov	[ebp-948],dword2554
	lea	dword2503,[ebp-908]
	mov	[ebp-952],dword2503
; start of inline function vec2f_mul
	mov	dword2557,[ebp-952]
	fld	dword ptr [dword2557]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2557]
	mov	dword2560,[ebp-952]
	fld	dword ptr [dword2560+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2560+4]
label008e:
; end of inline function vec2f_mul
	lea	dword2504,[ebp-908]
	mov	[ebp-924],dword2504
	mov	dword2506,16
	add	dword2506,[ebp-864]
	mov	[ebp-928],dword2506
	mov	dword2508,[ebp-860]
	mov	dword2510,[dword2508+192]
	imul	dword2510,24
	mov	dword2512,[ebp-860]
	add	dword2512,dword2510
	add	dword2512,16
	mov	[ebp-932],dword2512
; start of inline function vec2f_add
	mov	dword2530,[ebp-928]
	mov	dword2532,[ebp-924]
	fld	dword ptr [dword2530]
	fadd	dword ptr [dword2532]
	mov	dword2534,[ebp-932]
	fstp	dword ptr [dword2534]
	mov	dword2536,[ebp-928]
	mov	dword2538,[ebp-924]
	fld	dword ptr [dword2536+4]
	fadd	dword ptr [dword2538+4]
	mov	dword2540,[ebp-932]
	fstp	dword ptr [dword2540+4]
label008c:
; end of inline function vec2f_add
	mov	dword2515,[ebp-860]
	inc	dword ptr [dword2515+192]
label0089:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label0086
label0087:
	mov	dword2519,[ebp-860]
	mov	dword2520,[dword2519+192]
	inc	dword ptr [dword2519+192]
	imul	dword2520,24
	mov	dword2523,[ebp-860]
	add	dword2523,dword2520
	mov	dword2525,[ebp-860]
	mov	dword2526,[dword2525]
	mov	dword2527,[dword2525+4]
	mov	[dword2523],dword2526
	mov	[dword2523+4],dword2527
	mov	dword2526,[dword2525+8]
	mov	dword2527,[dword2525+12]
	mov	[dword2523+8],dword2526
	mov	[dword2523+12],dword2527
	mov	dword2526,[dword2525+16]
	mov	dword2527,[dword2525+20]
	mov	[dword2523+16],dword2526
	mov	[dword2523+20],dword2527
label0099:
; end of inline function _clip_on_plain
	lea	dword2052,dword ptr [__clip_plane_left_norm]
	mov	[ebp-848],dword2052
	lea	dword2053,dword ptr [__clip_plane_left_base]
	mov	[ebp-852],dword2053
	mov	dword2776,[ebp-648]
	mov	[ebp-856],dword2776
	lea	dword2055,[ebp-844]
	mov	[ebp-860],dword2055
; start of inline function _clip_on_plain
	mov	dword2779,[ebp-860]
	mov	dword ptr [dword2779+192],0
	mov	dword2782,[ebp-856]
	mov	[ebp-864],dword2782
	mov	dword2785,[ebp-856]
	add	dword2785,24
	mov	[ebp-868],dword2785
label009a:
label009b:
	mov	dword2789,[ebp-856]
	mov	dword2791,[dword2789+192]
	imul	dword2791,24
	mov	dword2793,[ebp-856]
	add	dword2793,dword2791
	cmp	dword2793,[ebp-868]
	jle	label009c
	mov	dword2939,[ebp-852]
	mov	[ebp-968],dword2939
	mov	dword2797,[ebp-864]
	mov	[ebp-972],dword2797
	lea	dword2798,[ebp-884]
	mov	[ebp-976],dword2798
; start of inline function vec4f_subtract
	mov	dword2942,[ebp-972]
	mov	dword2944,[ebp-968]
	fld	dword ptr [dword2942]
	fsub	dword ptr [dword2944]
	mov	dword2946,[ebp-976]
	fstp	dword ptr [dword2946]
	mov	dword2948,[ebp-972]
	mov	dword2950,[ebp-968]
	fld	dword ptr [dword2948+4]
	fsub	dword ptr [dword2950+4]
	mov	dword2952,[ebp-976]
	fstp	dword ptr [dword2952+4]
	mov	dword2954,[ebp-972]
	mov	dword2956,[ebp-968]
	fld	dword ptr [dword2954+8]
	fsub	dword ptr [dword2956+8]
	mov	dword2958,[ebp-976]
	fstp	dword ptr [dword2958+8]
	mov	dword2960,[ebp-972]
	mov	dword2962,[ebp-968]
	fld	dword ptr [dword2960+12]
	fsub	dword ptr [dword2962+12]
	mov	dword2964,[ebp-976]
	fstp	dword ptr [dword2964+12]
label00a5:
; end of inline function vec4f_subtract
	mov	dword3042,[ebp-848]
	mov	[ebp-980],dword3042
	lea	dword2800,[ebp-884]
	mov	[ebp-984],dword2800
; start of inline function vec4f_dot
	mov	dword3045,[ebp-984]
	mov	dword3047,[ebp-980]
	fld	dword ptr [dword3045+4]
	fmul	dword ptr [dword3047+4]
	mov	dword3049,[ebp-984]
	mov	dword3051,[ebp-980]
	fld	dword ptr [dword3049]
	fmul	dword ptr [dword3051]
	faddp
	mov	dword3053,[ebp-984]
	mov	dword3055,[ebp-980]
	fld	dword ptr [dword3053+8]
	fmul	dword ptr [dword3055+8]
	faddp
	mov	dword3057,[ebp-984]
	mov	dword3059,[ebp-980]
	fld	dword ptr [dword3057+12]
	fmul	dword ptr [dword3059+12]
	faddp
	fstp	dword ptr [ebp-988]
label00a9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2965,[ebp-852]
	mov	[ebp-968],dword2965
	mov	dword2804,[ebp-868]
	mov	[ebp-972],dword2804
	lea	dword2805,[ebp-884]
	mov	[ebp-976],dword2805
; start of inline function vec4f_subtract
	mov	dword2968,[ebp-972]
	mov	dword2970,[ebp-968]
	fld	dword ptr [dword2968]
	fsub	dword ptr [dword2970]
	mov	dword2972,[ebp-976]
	fstp	dword ptr [dword2972]
	mov	dword2974,[ebp-972]
	mov	dword2976,[ebp-968]
	fld	dword ptr [dword2974+4]
	fsub	dword ptr [dword2976+4]
	mov	dword2978,[ebp-976]
	fstp	dword ptr [dword2978+4]
	mov	dword2980,[ebp-972]
	mov	dword2982,[ebp-968]
	fld	dword ptr [dword2980+8]
	fsub	dword ptr [dword2982+8]
	mov	dword2984,[ebp-976]
	fstp	dword ptr [dword2984+8]
	mov	dword2986,[ebp-972]
	mov	dword2988,[ebp-968]
	fld	dword ptr [dword2986+12]
	fsub	dword ptr [dword2988+12]
	mov	dword2990,[ebp-976]
	fstp	dword ptr [dword2990+12]
label00a6:
; end of inline function vec4f_subtract
	mov	dword3060,[ebp-848]
	mov	[ebp-980],dword3060
	lea	dword2807,[ebp-884]
	mov	[ebp-984],dword2807
; start of inline function vec4f_dot
	mov	dword3063,[ebp-984]
	mov	dword3065,[ebp-980]
	fld	dword ptr [dword3063+4]
	fmul	dword ptr [dword3065+4]
	mov	dword3067,[ebp-984]
	mov	dword3069,[ebp-980]
	fld	dword ptr [dword3067]
	fmul	dword ptr [dword3069]
	faddp
	mov	dword3071,[ebp-984]
	mov	dword3073,[ebp-980]
	fld	dword ptr [dword3071+8]
	fmul	dword ptr [dword3073+8]
	faddp
	mov	dword3075,[ebp-984]
	mov	dword3077,[ebp-980]
	fld	dword ptr [dword3075+12]
	fmul	dword ptr [dword3077+12]
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
	mov	dword2811,[ebp-860]
	mov	dword2812,[dword2811+192]
	inc	dword ptr [dword2811+192]
	imul	dword2812,24
	mov	dword2815,[ebp-860]
	add	dword2815,dword2812
	mov	dword2817,[ebp-864]
	mov	dword2818,[dword2817]
	mov	dword2819,[dword2817+4]
	mov	[dword2815],dword2818
	mov	[dword2815+4],dword2819
	mov	dword2818,[dword2817+8]
	mov	dword2819,[dword2817+12]
	mov	[dword2815+8],dword2818
	mov	[dword2815+12],dword2819
	mov	dword2818,[dword2817+16]
	mov	dword2819,[dword2817+20]
	mov	[dword2815+16],dword2818
	mov	[dword2815+20],dword2819
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
	mov	dword2825,[ebp-864]
	mov	[ebp-968],dword2825
	mov	dword2991,[ebp-852]
	mov	[ebp-972],dword2991
	lea	dword2827,[ebp-884]
	mov	[ebp-976],dword2827
; start of inline function vec4f_subtract
	mov	dword2994,[ebp-972]
	mov	dword2996,[ebp-968]
	fld	dword ptr [dword2994]
	fsub	dword ptr [dword2996]
	mov	dword2998,[ebp-976]
	fstp	dword ptr [dword2998]
	mov	dword3000,[ebp-972]
	mov	dword3002,[ebp-968]
	fld	dword ptr [dword3000+4]
	fsub	dword ptr [dword3002+4]
	mov	dword3004,[ebp-976]
	fstp	dword ptr [dword3004+4]
	mov	dword3006,[ebp-972]
	mov	dword3008,[ebp-968]
	fld	dword ptr [dword3006+8]
	fsub	dword ptr [dword3008+8]
	mov	dword3010,[ebp-976]
	fstp	dword ptr [dword3010+8]
	mov	dword3012,[ebp-972]
	mov	dword3014,[ebp-968]
	fld	dword ptr [dword3012+12]
	fsub	dword ptr [dword3014+12]
	mov	dword3016,[ebp-976]
	fstp	dword ptr [dword3016+12]
label00a7:
; end of inline function vec4f_subtract
	mov	dword2829,[ebp-864]
	mov	[ebp-968],dword2829
	mov	dword2831,[ebp-868]
	mov	[ebp-972],dword2831
	lea	dword2832,[ebp-900]
	mov	[ebp-976],dword2832
; start of inline function vec4f_subtract
	mov	dword3019,[ebp-972]
	mov	dword3021,[ebp-968]
	fld	dword ptr [dword3019]
	fsub	dword ptr [dword3021]
	mov	dword3023,[ebp-976]
	fstp	dword ptr [dword3023]
	mov	dword3025,[ebp-972]
	mov	dword3027,[ebp-968]
	fld	dword ptr [dword3025+4]
	fsub	dword ptr [dword3027+4]
	mov	dword3029,[ebp-976]
	fstp	dword ptr [dword3029+4]
	mov	dword3031,[ebp-972]
	mov	dword3033,[ebp-968]
	fld	dword ptr [dword3031+8]
	fsub	dword ptr [dword3033+8]
	mov	dword3035,[ebp-976]
	fstp	dword ptr [dword3035+8]
	mov	dword3037,[ebp-972]
	mov	dword3039,[ebp-968]
	fld	dword ptr [dword3037+12]
	fsub	dword ptr [dword3039+12]
	mov	dword3041,[ebp-976]
	fstp	dword ptr [dword3041+12]
label00a8:
; end of inline function vec4f_subtract
	mov	dword3078,[ebp-848]
	mov	[ebp-980],dword3078
	lea	dword2834,[ebp-884]
	mov	[ebp-984],dword2834
; start of inline function vec4f_dot
	mov	dword3081,[ebp-984]
	mov	dword3083,[ebp-980]
	fld	dword ptr [dword3081+4]
	fmul	dword ptr [dword3083+4]
	mov	dword3085,[ebp-984]
	mov	dword3087,[ebp-980]
	fld	dword ptr [dword3085]
	fmul	dword ptr [dword3087]
	faddp
	mov	dword3089,[ebp-984]
	mov	dword3091,[ebp-980]
	fld	dword ptr [dword3089+8]
	fmul	dword ptr [dword3091+8]
	faddp
	mov	dword3093,[ebp-984]
	mov	dword3095,[ebp-980]
	fld	dword ptr [dword3093+12]
	fmul	dword ptr [dword3095+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ab:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3096,[ebp-848]
	mov	[ebp-980],dword3096
	lea	dword2836,[ebp-900]
	mov	[ebp-984],dword2836
; start of inline function vec4f_dot
	mov	dword3099,[ebp-984]
	mov	dword3101,[ebp-980]
	fld	dword ptr [dword3099+4]
	fmul	dword ptr [dword3101+4]
	mov	dword3103,[ebp-984]
	mov	dword3105,[ebp-980]
	fld	dword ptr [dword3103]
	fmul	dword ptr [dword3105]
	faddp
	mov	dword3107,[ebp-984]
	mov	dword3109,[ebp-980]
	fld	dword ptr [dword3107+8]
	fmul	dword ptr [dword3109+8]
	faddp
	mov	dword3111,[ebp-984]
	mov	dword3113,[ebp-980]
	fld	dword ptr [dword3111+12]
	fmul	dword ptr [dword3113+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ac:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3114,[ebp-920]
	mov	[ebp-992],dword3114
	lea	dword2839,[ebp-900]
	mov	[ebp-996],dword2839
; start of inline function vec4f_mul
	mov	dword3117,[ebp-996]
	fld	dword ptr [dword3117]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3117]
	mov	dword3120,[ebp-996]
	fld	dword ptr [dword3120+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3120+4]
	mov	dword3123,[ebp-996]
	fld	dword ptr [dword3123+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3123+8]
	mov	dword3126,[ebp-996]
	fld	dword ptr [dword3126+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3126+12]
label00ad:
; end of inline function vec4f_mul
	lea	dword2840,[ebp-900]
	mov	[ebp-956],dword2840
	mov	dword2842,[ebp-864]
	mov	[ebp-960],dword2842
	mov	dword2844,[ebp-860]
	mov	dword2846,[dword2844+192]
	imul	dword2846,24
	mov	dword2848,[ebp-860]
	add	dword2848,dword2846
	mov	[ebp-964],dword2848
; start of inline function vec4f_add
	mov	dword2916,[ebp-960]
	mov	dword2918,[ebp-956]
	fld	dword ptr [dword2916]
	fadd	dword ptr [dword2918]
	mov	dword2920,[ebp-964]
	fstp	dword ptr [dword2920]
	mov	dword2922,[ebp-960]
	mov	dword2924,[ebp-956]
	fld	dword ptr [dword2922+4]
	fadd	dword ptr [dword2924+4]
	mov	dword2926,[ebp-964]
	fstp	dword ptr [dword2926+4]
	mov	dword2928,[ebp-960]
	mov	dword2930,[ebp-956]
	fld	dword ptr [dword2928+8]
	fadd	dword ptr [dword2930+8]
	mov	dword2932,[ebp-964]
	fstp	dword ptr [dword2932+8]
	mov	dword2934,[ebp-960]
	mov	dword2936,[ebp-956]
	fld	dword ptr [dword2934+12]
	fadd	dword ptr [dword2936+12]
	mov	dword2938,[ebp-964]
	fstp	dword ptr [dword2938+12]
label00a4:
; end of inline function vec4f_add
	mov	dword2850,16
	add	dword2850,[ebp-864]
	mov	[ebp-936],dword2850
	mov	dword2852,16
	add	dword2852,[ebp-868]
	mov	[ebp-940],dword2852
	lea	dword2853,[ebp-908]
	mov	[ebp-944],dword2853
; start of inline function vec2f_subtract
	mov	dword2895,[ebp-940]
	mov	dword2897,[ebp-936]
	fld	dword ptr [dword2895]
	fsub	dword ptr [dword2897]
	mov	dword2899,[ebp-944]
	fstp	dword ptr [dword2899]
	mov	dword2901,[ebp-940]
	mov	dword2903,[ebp-936]
	fld	dword ptr [dword2901+4]
	fsub	dword ptr [dword2903+4]
	mov	dword2905,[ebp-944]
	fstp	dword ptr [dword2905+4]
label00a2:
; end of inline function vec2f_subtract
	mov	dword2906,[ebp-920]
	mov	[ebp-948],dword2906
	lea	dword2855,[ebp-908]
	mov	[ebp-952],dword2855
; start of inline function vec2f_mul
	mov	dword2909,[ebp-952]
	fld	dword ptr [dword2909]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2909]
	mov	dword2912,[ebp-952]
	fld	dword ptr [dword2912+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2912+4]
label00a3:
; end of inline function vec2f_mul
	lea	dword2856,[ebp-908]
	mov	[ebp-924],dword2856
	mov	dword2858,16
	add	dword2858,[ebp-864]
	mov	[ebp-928],dword2858
	mov	dword2860,[ebp-860]
	mov	dword2862,[dword2860+192]
	imul	dword2862,24
	mov	dword2864,[ebp-860]
	add	dword2864,dword2862
	add	dword2864,16
	mov	[ebp-932],dword2864
; start of inline function vec2f_add
	mov	dword2882,[ebp-928]
	mov	dword2884,[ebp-924]
	fld	dword ptr [dword2882]
	fadd	dword ptr [dword2884]
	mov	dword2886,[ebp-932]
	fstp	dword ptr [dword2886]
	mov	dword2888,[ebp-928]
	mov	dword2890,[ebp-924]
	fld	dword ptr [dword2888+4]
	fadd	dword ptr [dword2890+4]
	mov	dword2892,[ebp-932]
	fstp	dword ptr [dword2892+4]
label00a1:
; end of inline function vec2f_add
	mov	dword2867,[ebp-860]
	inc	dword ptr [dword2867+192]
label009e:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label009b
label009c:
	mov	dword2871,[ebp-860]
	mov	dword2872,[dword2871+192]
	inc	dword ptr [dword2871+192]
	imul	dword2872,24
	mov	dword2875,[ebp-860]
	add	dword2875,dword2872
	mov	dword2877,[ebp-860]
	mov	dword2878,[dword2877]
	mov	dword2879,[dword2877+4]
	mov	[dword2875],dword2878
	mov	[dword2875+4],dword2879
	mov	dword2878,[dword2877+8]
	mov	dword2879,[dword2877+12]
	mov	[dword2875+8],dword2878
	mov	[dword2875+12],dword2879
	mov	dword2878,[dword2877+16]
	mov	dword2879,[dword2877+20]
	mov	[dword2875+16],dword2878
	mov	[dword2875+20],dword2879
label00ae:
; end of inline function _clip_on_plain
	lea	dword2056,dword ptr [__clip_plane_right_norm]
	mov	[ebp-848],dword2056
	lea	dword2057,dword ptr [__clip_plane_right_base]
	mov	[ebp-852],dword2057
	lea	dword2058,[ebp-844]
	mov	[ebp-856],dword2058
	mov	dword3128,[ebp-648]
	mov	[ebp-860],dword3128
; start of inline function _clip_on_plain
	mov	dword3131,[ebp-860]
	mov	dword ptr [dword3131+192],0
	mov	dword3134,[ebp-856]
	mov	[ebp-864],dword3134
	mov	dword3137,[ebp-856]
	add	dword3137,24
	mov	[ebp-868],dword3137
label00af:
label00b0:
	mov	dword3141,[ebp-856]
	mov	dword3143,[dword3141+192]
	imul	dword3143,24
	mov	dword3145,[ebp-856]
	add	dword3145,dword3143
	cmp	dword3145,[ebp-868]
	jle	label00b1
	mov	dword3291,[ebp-852]
	mov	[ebp-968],dword3291
	mov	dword3149,[ebp-864]
	mov	[ebp-972],dword3149
	lea	dword3150,[ebp-884]
	mov	[ebp-976],dword3150
; start of inline function vec4f_subtract
	mov	dword3294,[ebp-972]
	mov	dword3296,[ebp-968]
	fld	dword ptr [dword3294]
	fsub	dword ptr [dword3296]
	mov	dword3298,[ebp-976]
	fstp	dword ptr [dword3298]
	mov	dword3300,[ebp-972]
	mov	dword3302,[ebp-968]
	fld	dword ptr [dword3300+4]
	fsub	dword ptr [dword3302+4]
	mov	dword3304,[ebp-976]
	fstp	dword ptr [dword3304+4]
	mov	dword3306,[ebp-972]
	mov	dword3308,[ebp-968]
	fld	dword ptr [dword3306+8]
	fsub	dword ptr [dword3308+8]
	mov	dword3310,[ebp-976]
	fstp	dword ptr [dword3310+8]
	mov	dword3312,[ebp-972]
	mov	dword3314,[ebp-968]
	fld	dword ptr [dword3312+12]
	fsub	dword ptr [dword3314+12]
	mov	dword3316,[ebp-976]
	fstp	dword ptr [dword3316+12]
label00ba:
; end of inline function vec4f_subtract
	mov	dword3394,[ebp-848]
	mov	[ebp-980],dword3394
	lea	dword3152,[ebp-884]
	mov	[ebp-984],dword3152
; start of inline function vec4f_dot
	mov	dword3397,[ebp-984]
	mov	dword3399,[ebp-980]
	fld	dword ptr [dword3397+4]
	fmul	dword ptr [dword3399+4]
	mov	dword3401,[ebp-984]
	mov	dword3403,[ebp-980]
	fld	dword ptr [dword3401]
	fmul	dword ptr [dword3403]
	faddp
	mov	dword3405,[ebp-984]
	mov	dword3407,[ebp-980]
	fld	dword ptr [dword3405+8]
	fmul	dword ptr [dword3407+8]
	faddp
	mov	dword3409,[ebp-984]
	mov	dword3411,[ebp-980]
	fld	dword ptr [dword3409+12]
	fmul	dword ptr [dword3411+12]
	faddp
	fstp	dword ptr [ebp-988]
label00be:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword3317,[ebp-852]
	mov	[ebp-968],dword3317
	mov	dword3156,[ebp-868]
	mov	[ebp-972],dword3156
	lea	dword3157,[ebp-884]
	mov	[ebp-976],dword3157
; start of inline function vec4f_subtract
	mov	dword3320,[ebp-972]
	mov	dword3322,[ebp-968]
	fld	dword ptr [dword3320]
	fsub	dword ptr [dword3322]
	mov	dword3324,[ebp-976]
	fstp	dword ptr [dword3324]
	mov	dword3326,[ebp-972]
	mov	dword3328,[ebp-968]
	fld	dword ptr [dword3326+4]
	fsub	dword ptr [dword3328+4]
	mov	dword3330,[ebp-976]
	fstp	dword ptr [dword3330+4]
	mov	dword3332,[ebp-972]
	mov	dword3334,[ebp-968]
	fld	dword ptr [dword3332+8]
	fsub	dword ptr [dword3334+8]
	mov	dword3336,[ebp-976]
	fstp	dword ptr [dword3336+8]
	mov	dword3338,[ebp-972]
	mov	dword3340,[ebp-968]
	fld	dword ptr [dword3338+12]
	fsub	dword ptr [dword3340+12]
	mov	dword3342,[ebp-976]
	fstp	dword ptr [dword3342+12]
label00bb:
; end of inline function vec4f_subtract
	mov	dword3412,[ebp-848]
	mov	[ebp-980],dword3412
	lea	dword3159,[ebp-884]
	mov	[ebp-984],dword3159
; start of inline function vec4f_dot
	mov	dword3415,[ebp-984]
	mov	dword3417,[ebp-980]
	fld	dword ptr [dword3415+4]
	fmul	dword ptr [dword3417+4]
	mov	dword3419,[ebp-984]
	mov	dword3421,[ebp-980]
	fld	dword ptr [dword3419]
	fmul	dword ptr [dword3421]
	faddp
	mov	dword3423,[ebp-984]
	mov	dword3425,[ebp-980]
	fld	dword ptr [dword3423+8]
	fmul	dword ptr [dword3425+8]
	faddp
	mov	dword3427,[ebp-984]
	mov	dword3429,[ebp-980]
	fld	dword ptr [dword3427+12]
	fmul	dword ptr [dword3429+12]
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
	mov	dword3163,[ebp-860]
	mov	dword3164,[dword3163+192]
	inc	dword ptr [dword3163+192]
	imul	dword3164,24
	mov	dword3167,[ebp-860]
	add	dword3167,dword3164
	mov	dword3169,[ebp-864]
	mov	dword3170,[dword3169]
	mov	dword3171,[dword3169+4]
	mov	[dword3167],dword3170
	mov	[dword3167+4],dword3171
	mov	dword3170,[dword3169+8]
	mov	dword3171,[dword3169+12]
	mov	[dword3167+8],dword3170
	mov	[dword3167+12],dword3171
	mov	dword3170,[dword3169+16]
	mov	dword3171,[dword3169+20]
	mov	[dword3167+16],dword3170
	mov	[dword3167+20],dword3171
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
	mov	dword3177,[ebp-864]
	mov	[ebp-968],dword3177
	mov	dword3343,[ebp-852]
	mov	[ebp-972],dword3343
	lea	dword3179,[ebp-884]
	mov	[ebp-976],dword3179
; start of inline function vec4f_subtract
	mov	dword3346,[ebp-972]
	mov	dword3348,[ebp-968]
	fld	dword ptr [dword3346]
	fsub	dword ptr [dword3348]
	mov	dword3350,[ebp-976]
	fstp	dword ptr [dword3350]
	mov	dword3352,[ebp-972]
	mov	dword3354,[ebp-968]
	fld	dword ptr [dword3352+4]
	fsub	dword ptr [dword3354+4]
	mov	dword3356,[ebp-976]
	fstp	dword ptr [dword3356+4]
	mov	dword3358,[ebp-972]
	mov	dword3360,[ebp-968]
	fld	dword ptr [dword3358+8]
	fsub	dword ptr [dword3360+8]
	mov	dword3362,[ebp-976]
	fstp	dword ptr [dword3362+8]
	mov	dword3364,[ebp-972]
	mov	dword3366,[ebp-968]
	fld	dword ptr [dword3364+12]
	fsub	dword ptr [dword3366+12]
	mov	dword3368,[ebp-976]
	fstp	dword ptr [dword3368+12]
label00bc:
; end of inline function vec4f_subtract
	mov	dword3181,[ebp-864]
	mov	[ebp-968],dword3181
	mov	dword3183,[ebp-868]
	mov	[ebp-972],dword3183
	lea	dword3184,[ebp-900]
	mov	[ebp-976],dword3184
; start of inline function vec4f_subtract
	mov	dword3371,[ebp-972]
	mov	dword3373,[ebp-968]
	fld	dword ptr [dword3371]
	fsub	dword ptr [dword3373]
	mov	dword3375,[ebp-976]
	fstp	dword ptr [dword3375]
	mov	dword3377,[ebp-972]
	mov	dword3379,[ebp-968]
	fld	dword ptr [dword3377+4]
	fsub	dword ptr [dword3379+4]
	mov	dword3381,[ebp-976]
	fstp	dword ptr [dword3381+4]
	mov	dword3383,[ebp-972]
	mov	dword3385,[ebp-968]
	fld	dword ptr [dword3383+8]
	fsub	dword ptr [dword3385+8]
	mov	dword3387,[ebp-976]
	fstp	dword ptr [dword3387+8]
	mov	dword3389,[ebp-972]
	mov	dword3391,[ebp-968]
	fld	dword ptr [dword3389+12]
	fsub	dword ptr [dword3391+12]
	mov	dword3393,[ebp-976]
	fstp	dword ptr [dword3393+12]
label00bd:
; end of inline function vec4f_subtract
	mov	dword3430,[ebp-848]
	mov	[ebp-980],dword3430
	lea	dword3186,[ebp-884]
	mov	[ebp-984],dword3186
; start of inline function vec4f_dot
	mov	dword3433,[ebp-984]
	mov	dword3435,[ebp-980]
	fld	dword ptr [dword3433+4]
	fmul	dword ptr [dword3435+4]
	mov	dword3437,[ebp-984]
	mov	dword3439,[ebp-980]
	fld	dword ptr [dword3437]
	fmul	dword ptr [dword3439]
	faddp
	mov	dword3441,[ebp-984]
	mov	dword3443,[ebp-980]
	fld	dword ptr [dword3441+8]
	fmul	dword ptr [dword3443+8]
	faddp
	mov	dword3445,[ebp-984]
	mov	dword3447,[ebp-980]
	fld	dword ptr [dword3445+12]
	fmul	dword ptr [dword3447+12]
	faddp
	fstp	dword ptr [ebp-988]
label00c0:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3448,[ebp-848]
	mov	[ebp-980],dword3448
	lea	dword3188,[ebp-900]
	mov	[ebp-984],dword3188
; start of inline function vec4f_dot
	mov	dword3451,[ebp-984]
	mov	dword3453,[ebp-980]
	fld	dword ptr [dword3451+4]
	fmul	dword ptr [dword3453+4]
	mov	dword3455,[ebp-984]
	mov	dword3457,[ebp-980]
	fld	dword ptr [dword3455]
	fmul	dword ptr [dword3457]
	faddp
	mov	dword3459,[ebp-984]
	mov	dword3461,[ebp-980]
	fld	dword ptr [dword3459+8]
	fmul	dword ptr [dword3461+8]
	faddp
	mov	dword3463,[ebp-984]
	mov	dword3465,[ebp-980]
	fld	dword ptr [dword3463+12]
	fmul	dword ptr [dword3465+12]
	faddp
	fstp	dword ptr [ebp-988]
label00c1:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3466,[ebp-920]
	mov	[ebp-992],dword3466
	lea	dword3191,[ebp-900]
	mov	[ebp-996],dword3191
; start of inline function vec4f_mul
	mov	dword3469,[ebp-996]
	fld	dword ptr [dword3469]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3469]
	mov	dword3472,[ebp-996]
	fld	dword ptr [dword3472+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3472+4]
	mov	dword3475,[ebp-996]
	fld	dword ptr [dword3475+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3475+8]
	mov	dword3478,[ebp-996]
	fld	dword ptr [dword3478+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3478+12]
label00c2:
; end of inline function vec4f_mul
	lea	dword3192,[ebp-900]
	mov	[ebp-956],dword3192
	mov	dword3194,[ebp-864]
	mov	[ebp-960],dword3194
	mov	dword3196,[ebp-860]
	mov	dword3198,[dword3196+192]
	imul	dword3198,24
	mov	dword3200,[ebp-860]
	add	dword3200,dword3198
	mov	[ebp-964],dword3200
; start of inline function vec4f_add
	mov	dword3268,[ebp-960]
	mov	dword3270,[ebp-956]
	fld	dword ptr [dword3268]
	fadd	dword ptr [dword3270]
	mov	dword3272,[ebp-964]
	fstp	dword ptr [dword3272]
	mov	dword3274,[ebp-960]
	mov	dword3276,[ebp-956]
	fld	dword ptr [dword3274+4]
	fadd	dword ptr [dword3276+4]
	mov	dword3278,[ebp-964]
	fstp	dword ptr [dword3278+4]
	mov	dword3280,[ebp-960]
	mov	dword3282,[ebp-956]
	fld	dword ptr [dword3280+8]
	fadd	dword ptr [dword3282+8]
	mov	dword3284,[ebp-964]
	fstp	dword ptr [dword3284+8]
	mov	dword3286,[ebp-960]
	mov	dword3288,[ebp-956]
	fld	dword ptr [dword3286+12]
	fadd	dword ptr [dword3288+12]
	mov	dword3290,[ebp-964]
	fstp	dword ptr [dword3290+12]
label00b9:
; end of inline function vec4f_add
	mov	dword3202,16
	add	dword3202,[ebp-864]
	mov	[ebp-936],dword3202
	mov	dword3204,16
	add	dword3204,[ebp-868]
	mov	[ebp-940],dword3204
	lea	dword3205,[ebp-908]
	mov	[ebp-944],dword3205
; start of inline function vec2f_subtract
	mov	dword3247,[ebp-940]
	mov	dword3249,[ebp-936]
	fld	dword ptr [dword3247]
	fsub	dword ptr [dword3249]
	mov	dword3251,[ebp-944]
	fstp	dword ptr [dword3251]
	mov	dword3253,[ebp-940]
	mov	dword3255,[ebp-936]
	fld	dword ptr [dword3253+4]
	fsub	dword ptr [dword3255+4]
	mov	dword3257,[ebp-944]
	fstp	dword ptr [dword3257+4]
label00b7:
; end of inline function vec2f_subtract
	mov	dword3258,[ebp-920]
	mov	[ebp-948],dword3258
	lea	dword3207,[ebp-908]
	mov	[ebp-952],dword3207
; start of inline function vec2f_mul
	mov	dword3261,[ebp-952]
	fld	dword ptr [dword3261]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3261]
	mov	dword3264,[ebp-952]
	fld	dword ptr [dword3264+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3264+4]
label00b8:
; end of inline function vec2f_mul
	lea	dword3208,[ebp-908]
	mov	[ebp-924],dword3208
	mov	dword3210,16
	add	dword3210,[ebp-864]
	mov	[ebp-928],dword3210
	mov	dword3212,[ebp-860]
	mov	dword3214,[dword3212+192]
	imul	dword3214,24
	mov	dword3216,[ebp-860]
	add	dword3216,dword3214
	add	dword3216,16
	mov	[ebp-932],dword3216
; start of inline function vec2f_add
	mov	dword3234,[ebp-928]
	mov	dword3236,[ebp-924]
	fld	dword ptr [dword3234]
	fadd	dword ptr [dword3236]
	mov	dword3238,[ebp-932]
	fstp	dword ptr [dword3238]
	mov	dword3240,[ebp-928]
	mov	dword3242,[ebp-924]
	fld	dword ptr [dword3240+4]
	fadd	dword ptr [dword3242+4]
	mov	dword3244,[ebp-932]
	fstp	dword ptr [dword3244+4]
label00b6:
; end of inline function vec2f_add
	mov	dword3219,[ebp-860]
	inc	dword ptr [dword3219+192]
label00b3:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00b0
label00b1:
	mov	dword3223,[ebp-860]
	mov	dword3224,[dword3223+192]
	inc	dword ptr [dword3223+192]
	imul	dword3224,24
	mov	dword3227,[ebp-860]
	add	dword3227,dword3224
	mov	dword3229,[ebp-860]
	mov	dword3230,[dword3229]
	mov	dword3231,[dword3229+4]
	mov	[dword3227],dword3230
	mov	[dword3227+4],dword3231
	mov	dword3230,[dword3229+8]
	mov	dword3231,[dword3229+12]
	mov	[dword3227+8],dword3230
	mov	[dword3227+12],dword3231
	mov	dword3230,[dword3229+16]
	mov	dword3231,[dword3229+20]
	mov	[dword3227+16],dword3230
	mov	[dword3227+20],dword3231
label00c3:
; end of inline function _clip_on_plain
	lea	dword2060,dword ptr [__clip_plane_top_norm]
	mov	[ebp-848],dword2060
	lea	dword2061,dword ptr [__clip_plane_top_base]
	mov	[ebp-852],dword2061
	mov	dword3480,[ebp-648]
	mov	[ebp-856],dword3480
	lea	dword2063,[ebp-844]
	mov	[ebp-860],dword2063
; start of inline function _clip_on_plain
	mov	dword3483,[ebp-860]
	mov	dword ptr [dword3483+192],0
	mov	dword3486,[ebp-856]
	mov	[ebp-864],dword3486
	mov	dword3489,[ebp-856]
	add	dword3489,24
	mov	[ebp-868],dword3489
label00c4:
label00c5:
	mov	dword3493,[ebp-856]
	mov	dword3495,[dword3493+192]
	imul	dword3495,24
	mov	dword3497,[ebp-856]
	add	dword3497,dword3495
	cmp	dword3497,[ebp-868]
	jle	label00c6
	mov	dword3643,[ebp-852]
	mov	[ebp-968],dword3643
	mov	dword3501,[ebp-864]
	mov	[ebp-972],dword3501
	lea	dword3502,[ebp-884]
	mov	[ebp-976],dword3502
; start of inline function vec4f_subtract
	mov	dword3646,[ebp-972]
	mov	dword3648,[ebp-968]
	fld	dword ptr [dword3646]
	fsub	dword ptr [dword3648]
	mov	dword3650,[ebp-976]
	fstp	dword ptr [dword3650]
	mov	dword3652,[ebp-972]
	mov	dword3654,[ebp-968]
	fld	dword ptr [dword3652+4]
	fsub	dword ptr [dword3654+4]
	mov	dword3656,[ebp-976]
	fstp	dword ptr [dword3656+4]
	mov	dword3658,[ebp-972]
	mov	dword3660,[ebp-968]
	fld	dword ptr [dword3658+8]
	fsub	dword ptr [dword3660+8]
	mov	dword3662,[ebp-976]
	fstp	dword ptr [dword3662+8]
	mov	dword3664,[ebp-972]
	mov	dword3666,[ebp-968]
	fld	dword ptr [dword3664+12]
	fsub	dword ptr [dword3666+12]
	mov	dword3668,[ebp-976]
	fstp	dword ptr [dword3668+12]
label00cf:
; end of inline function vec4f_subtract
	mov	dword3746,[ebp-848]
	mov	[ebp-980],dword3746
	lea	dword3504,[ebp-884]
	mov	[ebp-984],dword3504
; start of inline function vec4f_dot
	mov	dword3749,[ebp-984]
	mov	dword3751,[ebp-980]
	fld	dword ptr [dword3749+4]
	fmul	dword ptr [dword3751+4]
	mov	dword3753,[ebp-984]
	mov	dword3755,[ebp-980]
	fld	dword ptr [dword3753]
	fmul	dword ptr [dword3755]
	faddp
	mov	dword3757,[ebp-984]
	mov	dword3759,[ebp-980]
	fld	dword ptr [dword3757+8]
	fmul	dword ptr [dword3759+8]
	faddp
	mov	dword3761,[ebp-984]
	mov	dword3763,[ebp-980]
	fld	dword ptr [dword3761+12]
	fmul	dword ptr [dword3763+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d3:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword3669,[ebp-852]
	mov	[ebp-968],dword3669
	mov	dword3508,[ebp-868]
	mov	[ebp-972],dword3508
	lea	dword3509,[ebp-884]
	mov	[ebp-976],dword3509
; start of inline function vec4f_subtract
	mov	dword3672,[ebp-972]
	mov	dword3674,[ebp-968]
	fld	dword ptr [dword3672]
	fsub	dword ptr [dword3674]
	mov	dword3676,[ebp-976]
	fstp	dword ptr [dword3676]
	mov	dword3678,[ebp-972]
	mov	dword3680,[ebp-968]
	fld	dword ptr [dword3678+4]
	fsub	dword ptr [dword3680+4]
	mov	dword3682,[ebp-976]
	fstp	dword ptr [dword3682+4]
	mov	dword3684,[ebp-972]
	mov	dword3686,[ebp-968]
	fld	dword ptr [dword3684+8]
	fsub	dword ptr [dword3686+8]
	mov	dword3688,[ebp-976]
	fstp	dword ptr [dword3688+8]
	mov	dword3690,[ebp-972]
	mov	dword3692,[ebp-968]
	fld	dword ptr [dword3690+12]
	fsub	dword ptr [dword3692+12]
	mov	dword3694,[ebp-976]
	fstp	dword ptr [dword3694+12]
label00d0:
; end of inline function vec4f_subtract
	mov	dword3764,[ebp-848]
	mov	[ebp-980],dword3764
	lea	dword3511,[ebp-884]
	mov	[ebp-984],dword3511
; start of inline function vec4f_dot
	mov	dword3767,[ebp-984]
	mov	dword3769,[ebp-980]
	fld	dword ptr [dword3767+4]
	fmul	dword ptr [dword3769+4]
	mov	dword3771,[ebp-984]
	mov	dword3773,[ebp-980]
	fld	dword ptr [dword3771]
	fmul	dword ptr [dword3773]
	faddp
	mov	dword3775,[ebp-984]
	mov	dword3777,[ebp-980]
	fld	dword ptr [dword3775+8]
	fmul	dword ptr [dword3777+8]
	faddp
	mov	dword3779,[ebp-984]
	mov	dword3781,[ebp-980]
	fld	dword ptr [dword3779+12]
	fmul	dword ptr [dword3781+12]
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
	mov	dword3515,[ebp-860]
	mov	dword3516,[dword3515+192]
	inc	dword ptr [dword3515+192]
	imul	dword3516,24
	mov	dword3519,[ebp-860]
	add	dword3519,dword3516
	mov	dword3521,[ebp-864]
	mov	dword3522,[dword3521]
	mov	dword3523,[dword3521+4]
	mov	[dword3519],dword3522
	mov	[dword3519+4],dword3523
	mov	dword3522,[dword3521+8]
	mov	dword3523,[dword3521+12]
	mov	[dword3519+8],dword3522
	mov	[dword3519+12],dword3523
	mov	dword3522,[dword3521+16]
	mov	dword3523,[dword3521+20]
	mov	[dword3519+16],dword3522
	mov	[dword3519+20],dword3523
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
	mov	dword3529,[ebp-864]
	mov	[ebp-968],dword3529
	mov	dword3695,[ebp-852]
	mov	[ebp-972],dword3695
	lea	dword3531,[ebp-884]
	mov	[ebp-976],dword3531
; start of inline function vec4f_subtract
	mov	dword3698,[ebp-972]
	mov	dword3700,[ebp-968]
	fld	dword ptr [dword3698]
	fsub	dword ptr [dword3700]
	mov	dword3702,[ebp-976]
	fstp	dword ptr [dword3702]
	mov	dword3704,[ebp-972]
	mov	dword3706,[ebp-968]
	fld	dword ptr [dword3704+4]
	fsub	dword ptr [dword3706+4]
	mov	dword3708,[ebp-976]
	fstp	dword ptr [dword3708+4]
	mov	dword3710,[ebp-972]
	mov	dword3712,[ebp-968]
	fld	dword ptr [dword3710+8]
	fsub	dword ptr [dword3712+8]
	mov	dword3714,[ebp-976]
	fstp	dword ptr [dword3714+8]
	mov	dword3716,[ebp-972]
	mov	dword3718,[ebp-968]
	fld	dword ptr [dword3716+12]
	fsub	dword ptr [dword3718+12]
	mov	dword3720,[ebp-976]
	fstp	dword ptr [dword3720+12]
label00d1:
; end of inline function vec4f_subtract
	mov	dword3533,[ebp-864]
	mov	[ebp-968],dword3533
	mov	dword3535,[ebp-868]
	mov	[ebp-972],dword3535
	lea	dword3536,[ebp-900]
	mov	[ebp-976],dword3536
; start of inline function vec4f_subtract
	mov	dword3723,[ebp-972]
	mov	dword3725,[ebp-968]
	fld	dword ptr [dword3723]
	fsub	dword ptr [dword3725]
	mov	dword3727,[ebp-976]
	fstp	dword ptr [dword3727]
	mov	dword3729,[ebp-972]
	mov	dword3731,[ebp-968]
	fld	dword ptr [dword3729+4]
	fsub	dword ptr [dword3731+4]
	mov	dword3733,[ebp-976]
	fstp	dword ptr [dword3733+4]
	mov	dword3735,[ebp-972]
	mov	dword3737,[ebp-968]
	fld	dword ptr [dword3735+8]
	fsub	dword ptr [dword3737+8]
	mov	dword3739,[ebp-976]
	fstp	dword ptr [dword3739+8]
	mov	dword3741,[ebp-972]
	mov	dword3743,[ebp-968]
	fld	dword ptr [dword3741+12]
	fsub	dword ptr [dword3743+12]
	mov	dword3745,[ebp-976]
	fstp	dword ptr [dword3745+12]
label00d2:
; end of inline function vec4f_subtract
	mov	dword3782,[ebp-848]
	mov	[ebp-980],dword3782
	lea	dword3538,[ebp-884]
	mov	[ebp-984],dword3538
; start of inline function vec4f_dot
	mov	dword3785,[ebp-984]
	mov	dword3787,[ebp-980]
	fld	dword ptr [dword3785+4]
	fmul	dword ptr [dword3787+4]
	mov	dword3789,[ebp-984]
	mov	dword3791,[ebp-980]
	fld	dword ptr [dword3789]
	fmul	dword ptr [dword3791]
	faddp
	mov	dword3793,[ebp-984]
	mov	dword3795,[ebp-980]
	fld	dword ptr [dword3793+8]
	fmul	dword ptr [dword3795+8]
	faddp
	mov	dword3797,[ebp-984]
	mov	dword3799,[ebp-980]
	fld	dword ptr [dword3797+12]
	fmul	dword ptr [dword3799+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d5:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3800,[ebp-848]
	mov	[ebp-980],dword3800
	lea	dword3540,[ebp-900]
	mov	[ebp-984],dword3540
; start of inline function vec4f_dot
	mov	dword3803,[ebp-984]
	mov	dword3805,[ebp-980]
	fld	dword ptr [dword3803+4]
	fmul	dword ptr [dword3805+4]
	mov	dword3807,[ebp-984]
	mov	dword3809,[ebp-980]
	fld	dword ptr [dword3807]
	fmul	dword ptr [dword3809]
	faddp
	mov	dword3811,[ebp-984]
	mov	dword3813,[ebp-980]
	fld	dword ptr [dword3811+8]
	fmul	dword ptr [dword3813+8]
	faddp
	mov	dword3815,[ebp-984]
	mov	dword3817,[ebp-980]
	fld	dword ptr [dword3815+12]
	fmul	dword ptr [dword3817+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d6:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3818,[ebp-920]
	mov	[ebp-992],dword3818
	lea	dword3543,[ebp-900]
	mov	[ebp-996],dword3543
; start of inline function vec4f_mul
	mov	dword3821,[ebp-996]
	fld	dword ptr [dword3821]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3821]
	mov	dword3824,[ebp-996]
	fld	dword ptr [dword3824+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3824+4]
	mov	dword3827,[ebp-996]
	fld	dword ptr [dword3827+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3827+8]
	mov	dword3830,[ebp-996]
	fld	dword ptr [dword3830+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3830+12]
label00d7:
; end of inline function vec4f_mul
	lea	dword3544,[ebp-900]
	mov	[ebp-956],dword3544
	mov	dword3546,[ebp-864]
	mov	[ebp-960],dword3546
	mov	dword3548,[ebp-860]
	mov	dword3550,[dword3548+192]
	imul	dword3550,24
	mov	dword3552,[ebp-860]
	add	dword3552,dword3550
	mov	[ebp-964],dword3552
; start of inline function vec4f_add
	mov	dword3620,[ebp-960]
	mov	dword3622,[ebp-956]
	fld	dword ptr [dword3620]
	fadd	dword ptr [dword3622]
	mov	dword3624,[ebp-964]
	fstp	dword ptr [dword3624]
	mov	dword3626,[ebp-960]
	mov	dword3628,[ebp-956]
	fld	dword ptr [dword3626+4]
	fadd	dword ptr [dword3628+4]
	mov	dword3630,[ebp-964]
	fstp	dword ptr [dword3630+4]
	mov	dword3632,[ebp-960]
	mov	dword3634,[ebp-956]
	fld	dword ptr [dword3632+8]
	fadd	dword ptr [dword3634+8]
	mov	dword3636,[ebp-964]
	fstp	dword ptr [dword3636+8]
	mov	dword3638,[ebp-960]
	mov	dword3640,[ebp-956]
	fld	dword ptr [dword3638+12]
	fadd	dword ptr [dword3640+12]
	mov	dword3642,[ebp-964]
	fstp	dword ptr [dword3642+12]
label00ce:
; end of inline function vec4f_add
	mov	dword3554,16
	add	dword3554,[ebp-864]
	mov	[ebp-936],dword3554
	mov	dword3556,16
	add	dword3556,[ebp-868]
	mov	[ebp-940],dword3556
	lea	dword3557,[ebp-908]
	mov	[ebp-944],dword3557
; start of inline function vec2f_subtract
	mov	dword3599,[ebp-940]
	mov	dword3601,[ebp-936]
	fld	dword ptr [dword3599]
	fsub	dword ptr [dword3601]
	mov	dword3603,[ebp-944]
	fstp	dword ptr [dword3603]
	mov	dword3605,[ebp-940]
	mov	dword3607,[ebp-936]
	fld	dword ptr [dword3605+4]
	fsub	dword ptr [dword3607+4]
	mov	dword3609,[ebp-944]
	fstp	dword ptr [dword3609+4]
label00cc:
; end of inline function vec2f_subtract
	mov	dword3610,[ebp-920]
	mov	[ebp-948],dword3610
	lea	dword3559,[ebp-908]
	mov	[ebp-952],dword3559
; start of inline function vec2f_mul
	mov	dword3613,[ebp-952]
	fld	dword ptr [dword3613]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3613]
	mov	dword3616,[ebp-952]
	fld	dword ptr [dword3616+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3616+4]
label00cd:
; end of inline function vec2f_mul
	lea	dword3560,[ebp-908]
	mov	[ebp-924],dword3560
	mov	dword3562,16
	add	dword3562,[ebp-864]
	mov	[ebp-928],dword3562
	mov	dword3564,[ebp-860]
	mov	dword3566,[dword3564+192]
	imul	dword3566,24
	mov	dword3568,[ebp-860]
	add	dword3568,dword3566
	add	dword3568,16
	mov	[ebp-932],dword3568
; start of inline function vec2f_add
	mov	dword3586,[ebp-928]
	mov	dword3588,[ebp-924]
	fld	dword ptr [dword3586]
	fadd	dword ptr [dword3588]
	mov	dword3590,[ebp-932]
	fstp	dword ptr [dword3590]
	mov	dword3592,[ebp-928]
	mov	dword3594,[ebp-924]
	fld	dword ptr [dword3592+4]
	fadd	dword ptr [dword3594+4]
	mov	dword3596,[ebp-932]
	fstp	dword ptr [dword3596+4]
label00cb:
; end of inline function vec2f_add
	mov	dword3571,[ebp-860]
	inc	dword ptr [dword3571+192]
label00c8:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00c5
label00c6:
	mov	dword3575,[ebp-860]
	mov	dword3576,[dword3575+192]
	inc	dword ptr [dword3575+192]
	imul	dword3576,24
	mov	dword3579,[ebp-860]
	add	dword3579,dword3576
	mov	dword3581,[ebp-860]
	mov	dword3582,[dword3581]
	mov	dword3583,[dword3581+4]
	mov	[dword3579],dword3582
	mov	[dword3579+4],dword3583
	mov	dword3582,[dword3581+8]
	mov	dword3583,[dword3581+12]
	mov	[dword3579+8],dword3582
	mov	[dword3579+12],dword3583
	mov	dword3582,[dword3581+16]
	mov	dword3583,[dword3581+20]
	mov	[dword3579+16],dword3582
	mov	[dword3579+20],dword3583
label00d8:
; end of inline function _clip_on_plain
	lea	dword2064,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-848],dword2064
	lea	dword2065,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-852],dword2065
	lea	dword2066,[ebp-844]
	mov	[ebp-856],dword2066
	mov	dword3832,[ebp-648]
	mov	[ebp-860],dword3832
; start of inline function _clip_on_plain
	mov	dword3835,[ebp-860]
	mov	dword ptr [dword3835+192],0
	mov	dword3838,[ebp-856]
	mov	[ebp-864],dword3838
	mov	dword3841,[ebp-856]
	add	dword3841,24
	mov	[ebp-868],dword3841
label00d9:
label00da:
	mov	dword3845,[ebp-856]
	mov	dword3847,[dword3845+192]
	imul	dword3847,24
	mov	dword3849,[ebp-856]
	add	dword3849,dword3847
	cmp	dword3849,[ebp-868]
	jle	label00db
	mov	dword3995,[ebp-852]
	mov	[ebp-968],dword3995
	mov	dword3853,[ebp-864]
	mov	[ebp-972],dword3853
	lea	dword3854,[ebp-884]
	mov	[ebp-976],dword3854
; start of inline function vec4f_subtract
	mov	dword3998,[ebp-972]
	mov	dword4000,[ebp-968]
	fld	dword ptr [dword3998]
	fsub	dword ptr [dword4000]
	mov	dword4002,[ebp-976]
	fstp	dword ptr [dword4002]
	mov	dword4004,[ebp-972]
	mov	dword4006,[ebp-968]
	fld	dword ptr [dword4004+4]
	fsub	dword ptr [dword4006+4]
	mov	dword4008,[ebp-976]
	fstp	dword ptr [dword4008+4]
	mov	dword4010,[ebp-972]
	mov	dword4012,[ebp-968]
	fld	dword ptr [dword4010+8]
	fsub	dword ptr [dword4012+8]
	mov	dword4014,[ebp-976]
	fstp	dword ptr [dword4014+8]
	mov	dword4016,[ebp-972]
	mov	dword4018,[ebp-968]
	fld	dword ptr [dword4016+12]
	fsub	dword ptr [dword4018+12]
	mov	dword4020,[ebp-976]
	fstp	dword ptr [dword4020+12]
label00e4:
; end of inline function vec4f_subtract
	mov	dword4098,[ebp-848]
	mov	[ebp-980],dword4098
	lea	dword3856,[ebp-884]
	mov	[ebp-984],dword3856
; start of inline function vec4f_dot
	mov	dword4101,[ebp-984]
	mov	dword4103,[ebp-980]
	fld	dword ptr [dword4101+4]
	fmul	dword ptr [dword4103+4]
	mov	dword4105,[ebp-984]
	mov	dword4107,[ebp-980]
	fld	dword ptr [dword4105]
	fmul	dword ptr [dword4107]
	faddp
	mov	dword4109,[ebp-984]
	mov	dword4111,[ebp-980]
	fld	dword ptr [dword4109+8]
	fmul	dword ptr [dword4111+8]
	faddp
	mov	dword4113,[ebp-984]
	mov	dword4115,[ebp-980]
	fld	dword ptr [dword4113+12]
	fmul	dword ptr [dword4115+12]
	faddp
	fstp	dword ptr [ebp-988]
label00e8:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword4021,[ebp-852]
	mov	[ebp-968],dword4021
	mov	dword3860,[ebp-868]
	mov	[ebp-972],dword3860
	lea	dword3861,[ebp-884]
	mov	[ebp-976],dword3861
; start of inline function vec4f_subtract
	mov	dword4024,[ebp-972]
	mov	dword4026,[ebp-968]
	fld	dword ptr [dword4024]
	fsub	dword ptr [dword4026]
	mov	dword4028,[ebp-976]
	fstp	dword ptr [dword4028]
	mov	dword4030,[ebp-972]
	mov	dword4032,[ebp-968]
	fld	dword ptr [dword4030+4]
	fsub	dword ptr [dword4032+4]
	mov	dword4034,[ebp-976]
	fstp	dword ptr [dword4034+4]
	mov	dword4036,[ebp-972]
	mov	dword4038,[ebp-968]
	fld	dword ptr [dword4036+8]
	fsub	dword ptr [dword4038+8]
	mov	dword4040,[ebp-976]
	fstp	dword ptr [dword4040+8]
	mov	dword4042,[ebp-972]
	mov	dword4044,[ebp-968]
	fld	dword ptr [dword4042+12]
	fsub	dword ptr [dword4044+12]
	mov	dword4046,[ebp-976]
	fstp	dword ptr [dword4046+12]
label00e5:
; end of inline function vec4f_subtract
	mov	dword4116,[ebp-848]
	mov	[ebp-980],dword4116
	lea	dword3863,[ebp-884]
	mov	[ebp-984],dword3863
; start of inline function vec4f_dot
	mov	dword4119,[ebp-984]
	mov	dword4121,[ebp-980]
	fld	dword ptr [dword4119+4]
	fmul	dword ptr [dword4121+4]
	mov	dword4123,[ebp-984]
	mov	dword4125,[ebp-980]
	fld	dword ptr [dword4123]
	fmul	dword ptr [dword4125]
	faddp
	mov	dword4127,[ebp-984]
	mov	dword4129,[ebp-980]
	fld	dword ptr [dword4127+8]
	fmul	dword ptr [dword4129+8]
	faddp
	mov	dword4131,[ebp-984]
	mov	dword4133,[ebp-980]
	fld	dword ptr [dword4131+12]
	fmul	dword ptr [dword4133+12]
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
	mov	dword3867,[ebp-860]
	mov	dword3868,[dword3867+192]
	inc	dword ptr [dword3867+192]
	imul	dword3868,24
	mov	dword3871,[ebp-860]
	add	dword3871,dword3868
	mov	dword3873,[ebp-864]
	mov	dword3874,[dword3873]
	mov	dword3875,[dword3873+4]
	mov	[dword3871],dword3874
	mov	[dword3871+4],dword3875
	mov	dword3874,[dword3873+8]
	mov	dword3875,[dword3873+12]
	mov	[dword3871+8],dword3874
	mov	[dword3871+12],dword3875
	mov	dword3874,[dword3873+16]
	mov	dword3875,[dword3873+20]
	mov	[dword3871+16],dword3874
	mov	[dword3871+20],dword3875
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
	mov	dword3881,[ebp-864]
	mov	[ebp-968],dword3881
	mov	dword4047,[ebp-852]
	mov	[ebp-972],dword4047
	lea	dword3883,[ebp-884]
	mov	[ebp-976],dword3883
; start of inline function vec4f_subtract
	mov	dword4050,[ebp-972]
	mov	dword4052,[ebp-968]
	fld	dword ptr [dword4050]
	fsub	dword ptr [dword4052]
	mov	dword4054,[ebp-976]
	fstp	dword ptr [dword4054]
	mov	dword4056,[ebp-972]
	mov	dword4058,[ebp-968]
	fld	dword ptr [dword4056+4]
	fsub	dword ptr [dword4058+4]
	mov	dword4060,[ebp-976]
	fstp	dword ptr [dword4060+4]
	mov	dword4062,[ebp-972]
	mov	dword4064,[ebp-968]
	fld	dword ptr [dword4062+8]
	fsub	dword ptr [dword4064+8]
	mov	dword4066,[ebp-976]
	fstp	dword ptr [dword4066+8]
	mov	dword4068,[ebp-972]
	mov	dword4070,[ebp-968]
	fld	dword ptr [dword4068+12]
	fsub	dword ptr [dword4070+12]
	mov	dword4072,[ebp-976]
	fstp	dword ptr [dword4072+12]
label00e6:
; end of inline function vec4f_subtract
	mov	dword3885,[ebp-864]
	mov	[ebp-968],dword3885
	mov	dword3887,[ebp-868]
	mov	[ebp-972],dword3887
	lea	dword3888,[ebp-900]
	mov	[ebp-976],dword3888
; start of inline function vec4f_subtract
	mov	dword4075,[ebp-972]
	mov	dword4077,[ebp-968]
	fld	dword ptr [dword4075]
	fsub	dword ptr [dword4077]
	mov	dword4079,[ebp-976]
	fstp	dword ptr [dword4079]
	mov	dword4081,[ebp-972]
	mov	dword4083,[ebp-968]
	fld	dword ptr [dword4081+4]
	fsub	dword ptr [dword4083+4]
	mov	dword4085,[ebp-976]
	fstp	dword ptr [dword4085+4]
	mov	dword4087,[ebp-972]
	mov	dword4089,[ebp-968]
	fld	dword ptr [dword4087+8]
	fsub	dword ptr [dword4089+8]
	mov	dword4091,[ebp-976]
	fstp	dword ptr [dword4091+8]
	mov	dword4093,[ebp-972]
	mov	dword4095,[ebp-968]
	fld	dword ptr [dword4093+12]
	fsub	dword ptr [dword4095+12]
	mov	dword4097,[ebp-976]
	fstp	dword ptr [dword4097+12]
label00e7:
; end of inline function vec4f_subtract
	mov	dword4134,[ebp-848]
	mov	[ebp-980],dword4134
	lea	dword3890,[ebp-884]
	mov	[ebp-984],dword3890
; start of inline function vec4f_dot
	mov	dword4137,[ebp-984]
	mov	dword4139,[ebp-980]
	fld	dword ptr [dword4137+4]
	fmul	dword ptr [dword4139+4]
	mov	dword4141,[ebp-984]
	mov	dword4143,[ebp-980]
	fld	dword ptr [dword4141]
	fmul	dword ptr [dword4143]
	faddp
	mov	dword4145,[ebp-984]
	mov	dword4147,[ebp-980]
	fld	dword ptr [dword4145+8]
	fmul	dword ptr [dword4147+8]
	faddp
	mov	dword4149,[ebp-984]
	mov	dword4151,[ebp-980]
	fld	dword ptr [dword4149+12]
	fmul	dword ptr [dword4151+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ea:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword4152,[ebp-848]
	mov	[ebp-980],dword4152
	lea	dword3892,[ebp-900]
	mov	[ebp-984],dword3892
; start of inline function vec4f_dot
	mov	dword4155,[ebp-984]
	mov	dword4157,[ebp-980]
	fld	dword ptr [dword4155+4]
	fmul	dword ptr [dword4157+4]
	mov	dword4159,[ebp-984]
	mov	dword4161,[ebp-980]
	fld	dword ptr [dword4159]
	fmul	dword ptr [dword4161]
	faddp
	mov	dword4163,[ebp-984]
	mov	dword4165,[ebp-980]
	fld	dword ptr [dword4163+8]
	fmul	dword ptr [dword4165+8]
	faddp
	mov	dword4167,[ebp-984]
	mov	dword4169,[ebp-980]
	fld	dword ptr [dword4167+12]
	fmul	dword ptr [dword4169+12]
	faddp
	fstp	dword ptr [ebp-988]
label00eb:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword4170,[ebp-920]
	mov	[ebp-992],dword4170
	lea	dword3895,[ebp-900]
	mov	[ebp-996],dword3895
; start of inline function vec4f_mul
	mov	dword4173,[ebp-996]
	fld	dword ptr [dword4173]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4173]
	mov	dword4176,[ebp-996]
	fld	dword ptr [dword4176+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4176+4]
	mov	dword4179,[ebp-996]
	fld	dword ptr [dword4179+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4179+8]
	mov	dword4182,[ebp-996]
	fld	dword ptr [dword4182+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4182+12]
label00ec:
; end of inline function vec4f_mul
	lea	dword3896,[ebp-900]
	mov	[ebp-956],dword3896
	mov	dword3898,[ebp-864]
	mov	[ebp-960],dword3898
	mov	dword3900,[ebp-860]
	mov	dword3902,[dword3900+192]
	imul	dword3902,24
	mov	dword3904,[ebp-860]
	add	dword3904,dword3902
	mov	[ebp-964],dword3904
; start of inline function vec4f_add
	mov	dword3972,[ebp-960]
	mov	dword3974,[ebp-956]
	fld	dword ptr [dword3972]
	fadd	dword ptr [dword3974]
	mov	dword3976,[ebp-964]
	fstp	dword ptr [dword3976]
	mov	dword3978,[ebp-960]
	mov	dword3980,[ebp-956]
	fld	dword ptr [dword3978+4]
	fadd	dword ptr [dword3980+4]
	mov	dword3982,[ebp-964]
	fstp	dword ptr [dword3982+4]
	mov	dword3984,[ebp-960]
	mov	dword3986,[ebp-956]
	fld	dword ptr [dword3984+8]
	fadd	dword ptr [dword3986+8]
	mov	dword3988,[ebp-964]
	fstp	dword ptr [dword3988+8]
	mov	dword3990,[ebp-960]
	mov	dword3992,[ebp-956]
	fld	dword ptr [dword3990+12]
	fadd	dword ptr [dword3992+12]
	mov	dword3994,[ebp-964]
	fstp	dword ptr [dword3994+12]
label00e3:
; end of inline function vec4f_add
	mov	dword3906,16
	add	dword3906,[ebp-864]
	mov	[ebp-936],dword3906
	mov	dword3908,16
	add	dword3908,[ebp-868]
	mov	[ebp-940],dword3908
	lea	dword3909,[ebp-908]
	mov	[ebp-944],dword3909
; start of inline function vec2f_subtract
	mov	dword3951,[ebp-940]
	mov	dword3953,[ebp-936]
	fld	dword ptr [dword3951]
	fsub	dword ptr [dword3953]
	mov	dword3955,[ebp-944]
	fstp	dword ptr [dword3955]
	mov	dword3957,[ebp-940]
	mov	dword3959,[ebp-936]
	fld	dword ptr [dword3957+4]
	fsub	dword ptr [dword3959+4]
	mov	dword3961,[ebp-944]
	fstp	dword ptr [dword3961+4]
label00e1:
; end of inline function vec2f_subtract
	mov	dword3962,[ebp-920]
	mov	[ebp-948],dword3962
	lea	dword3911,[ebp-908]
	mov	[ebp-952],dword3911
; start of inline function vec2f_mul
	mov	dword3965,[ebp-952]
	fld	dword ptr [dword3965]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3965]
	mov	dword3968,[ebp-952]
	fld	dword ptr [dword3968+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3968+4]
label00e2:
; end of inline function vec2f_mul
	lea	dword3912,[ebp-908]
	mov	[ebp-924],dword3912
	mov	dword3914,16
	add	dword3914,[ebp-864]
	mov	[ebp-928],dword3914
	mov	dword3916,[ebp-860]
	mov	dword3918,[dword3916+192]
	imul	dword3918,24
	mov	dword3920,[ebp-860]
	add	dword3920,dword3918
	add	dword3920,16
	mov	[ebp-932],dword3920
; start of inline function vec2f_add
	mov	dword3938,[ebp-928]
	mov	dword3940,[ebp-924]
	fld	dword ptr [dword3938]
	fadd	dword ptr [dword3940]
	mov	dword3942,[ebp-932]
	fstp	dword ptr [dword3942]
	mov	dword3944,[ebp-928]
	mov	dword3946,[ebp-924]
	fld	dword ptr [dword3944+4]
	fadd	dword ptr [dword3946+4]
	mov	dword3948,[ebp-932]
	fstp	dword ptr [dword3948+4]
label00e0:
; end of inline function vec2f_add
	mov	dword3923,[ebp-860]
	inc	dword ptr [dword3923+192]
label00dd:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00da
label00db:
	mov	dword3927,[ebp-860]
	mov	dword3928,[dword3927+192]
	inc	dword ptr [dword3927+192]
	imul	dword3928,24
	mov	dword3931,[ebp-860]
	add	dword3931,dword3928
	mov	dword3933,[ebp-860]
	mov	dword3934,[dword3933]
	mov	dword3935,[dword3933+4]
	mov	[dword3931],dword3934
	mov	[dword3931+4],dword3935
	mov	dword3934,[dword3933+8]
	mov	dword3935,[dword3933+12]
	mov	[dword3931+8],dword3934
	mov	[dword3931+12],dword3935
	mov	dword3934,[dword3933+16]
	mov	dword3935,[dword3933+20]
	mov	[dword3931+16],dword3934
	mov	[dword3931+20],dword3935
label00ed:
; end of inline function _clip_on_plain
	mov	dword2069,[ebp-648]
	cmp	dword ptr [dword2069+192],1
	setg	byte32
	movzx	dword2071,byte32
	mov	[ebp-1000],dword2071
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
	mov	dword60,[ebp-336]
	sal	dword60,4
	add	dword57,dword60
	mov	[ebp-1008],dword57
; start of inline function _transform_to_screen_space
	lea	dword4185,dword ptr [__viewport_matrix]
	mov	[ebp-1032],dword4185
	mov	dword4218,[ebp-1004]
	mov	[ebp-1036],dword4218
	lea	dword4187,[ebp-1024]
	mov	[ebp-1040],dword4187
; start of inline function matrix4f_transform
	mov	dword4221,[ebp-1036]
	mov	dword4223,[ebp-1032]
	fld	dword ptr [dword4221+4]
	fmul	dword ptr [dword4223+16]
	mov	dword4225,[ebp-1036]
	mov	dword4227,[ebp-1032]
	fld	dword ptr [dword4225]
	fmul	dword ptr [dword4227]
	faddp
	mov	dword4229,[ebp-1036]
	mov	dword4231,[ebp-1032]
	fld	dword ptr [dword4229+8]
	fmul	dword ptr [dword4231+32]
	faddp
	mov	dword4233,[ebp-1036]
	mov	dword4235,[ebp-1032]
	fld	dword ptr [dword4233+12]
	fmul	dword ptr [dword4235+48]
	faddp
	mov	dword4237,[ebp-1040]
	fstp	dword ptr [dword4237]
	mov	dword4239,[ebp-1032]
	mov	dword4241,[ebp-1036]
	fld	dword ptr [dword4241]
	fmul	dword ptr [dword4239+4]
	mov	dword4243,[ebp-1036]
	mov	dword4245,[ebp-1032]
	fld	dword ptr [dword4243+4]
	fmul	dword ptr [dword4245+20]
	faddp
	mov	dword4247,[ebp-1036]
	mov	dword4249,[ebp-1032]
	fld	dword ptr [dword4247+8]
	fmul	dword ptr [dword4249+36]
	faddp
	mov	dword4251,[ebp-1036]
	mov	dword4253,[ebp-1032]
	fld	dword ptr [dword4251+12]
	fmul	dword ptr [dword4253+52]
	faddp
	mov	dword4255,[ebp-1040]
	fstp	dword ptr [dword4255+4]
	mov	dword4257,[ebp-1032]
	mov	dword4259,[ebp-1036]
	fld	dword ptr [dword4259]
	fmul	dword ptr [dword4257+8]
	mov	dword4261,[ebp-1036]
	mov	dword4263,[ebp-1032]
	fld	dword ptr [dword4261+4]
	fmul	dword ptr [dword4263+24]
	faddp
	mov	dword4265,[ebp-1036]
	mov	dword4267,[ebp-1032]
	fld	dword ptr [dword4265+8]
	fmul	dword ptr [dword4267+40]
	faddp
	mov	dword4269,[ebp-1036]
	mov	dword4271,[ebp-1032]
	fld	dword ptr [dword4269+12]
	fmul	dword ptr [dword4271+56]
	faddp
	mov	dword4273,[ebp-1040]
	fstp	dword ptr [dword4273+8]
	mov	dword4275,[ebp-1032]
	mov	dword4277,[ebp-1036]
	fld	dword ptr [dword4277]
	fmul	dword ptr [dword4275+12]
	mov	dword4279,[ebp-1036]
	mov	dword4281,[ebp-1032]
	fld	dword ptr [dword4279+4]
	fmul	dword ptr [dword4281+28]
	faddp
	mov	dword4283,[ebp-1036]
	mov	dword4285,[ebp-1032]
	fld	dword ptr [dword4283+8]
	fmul	dword ptr [dword4285+44]
	faddp
	mov	dword4287,[ebp-1036]
	mov	dword4289,[ebp-1032]
	fld	dword ptr [dword4287+12]
	fmul	dword ptr [dword4289+60]
	faddp
	mov	dword4291,[ebp-1040]
	fstp	dword ptr [dword4291+12]
label00f1:
; end of inline function matrix4f_transform
	lea	dword4188,[ebp-1024]
	add	dword4188,12
	fld1
	fdiv	dword ptr [dword4188]
	fstp	dword ptr [ebp-1028]
	fld	dword ptr [ebp-1024]
	fmul	dword ptr [ebp-1028]
	float2int	dword4193
	mov	dword4195,[ebp-1008]
	mov	[dword4195],dword4193
	lea	dword4196,[ebp-1024]
	add	dword4196,4
	fld	dword ptr [dword4196]
	fmul	dword ptr [ebp-1028]
	float2int	dword4199
	mov	dword4201,[ebp-1008]
	mov	[dword4201+4],dword4199
	mov	dword4203,[ebp-1008]
	cmp	dword ptr [dword4203],0
	jl	label00f0
	mov	dword4206,[ebp-1008]
	mov	dword4208,[dword4206]
	cmp	dword4208,dword ptr [__width]
	jge	label00f0
	mov	dword4210,[ebp-1008]
	cmp	dword ptr [dword4210+4],0
	jl	label00f0
	mov	dword4213,[ebp-1008]
	mov	dword4215,[dword4213+4]
	cmp	dword4215,dword ptr [__height]
	jl	label00ef
label00f0:
	mov	dword ptr ds:[0],0
label00ef:
label00f2:
; end of inline function _transform_to_screen_space
	lea	dword61,[ebp-332]
	mov	dword64,[ebp-336]
	sal	dword64,4
	add	dword61,dword64
	add	dword61,8
	mov	dword67,[ebp-200]
	mov	dword70,[ebp-336]
	imul	dword70,24
	add	dword67,dword70
	add	dword67,16
	mov	dword72,[dword67]
	mov	dword73,[dword67+4]
	mov	[dword61],dword72
	mov	[dword61+4],dword73
	inc	dword ptr [ebp-336]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-336],2
label0005:
label0006:
	mov	dword78,[ebp-200]
	mov	dword80,[dword78+192]
	dec	dword80
	cmp	dword80,[ebp-336]
	jle	label0007
	lea	dword82,[ebp-332]
	mov	dword85,[ebp-336]
	sal	dword85,4
	add	dword82,dword85
	mov	[ebp-340],dword82
	mov	dword88,[ebp-336]
	dec	dword88
	sal	dword88,4
	lea	dword90,[ebp-332]
	add	dword90,dword88
	mov	[ebp-344],dword90
	lea	dword91,[ebp-332]
	mov	[ebp-348],dword91
; start of inline function _rasterize_triangle_2i
	mov	dword95,[ebp-348]
	add	dword95,4
	mov	dword98,[ebp-344]
	add	dword98,4
	mov	dword100,[dword95]
	cmp	dword100,[dword98]
	jle	label0008
	mov	dword103,[ebp-348]
	mov	[ebp-352],dword103
	mov	dword106,[ebp-344]
	mov	[ebp-348],dword106
	mov	dword109,[ebp-352]
	mov	[ebp-344],dword109
label0008:
	mov	dword111,[ebp-348]
	add	dword111,4
	mov	dword114,[ebp-340]
	add	dword114,4
	mov	dword116,[dword111]
	cmp	dword116,[dword114]
	jle	label0009
	mov	dword119,[ebp-348]
	mov	[ebp-352],dword119
	mov	dword122,[ebp-340]
	mov	[ebp-348],dword122
	mov	dword125,[ebp-352]
	mov	[ebp-340],dword125
label0009:
	mov	dword127,[ebp-344]
	add	dword127,4
	mov	dword130,[ebp-340]
	add	dword130,4
	mov	dword132,[dword127]
	cmp	dword132,[dword130]
	jle	label000a
	mov	dword135,[ebp-344]
	mov	[ebp-352],dword135
	mov	dword138,[ebp-340]
	mov	[ebp-344],dword138
	mov	dword141,[ebp-352]
	mov	[ebp-340],dword141
label000a:
	mov	dword143,[ebp-348]
	add	dword143,4
	mov	dword146,[ebp-340]
	add	dword146,4
	mov	dword148,[dword143]
	cmp	dword148,[dword146]
	jne	label000b
	mov	dword150,[ebp-348]
	add	dword150,4
	cmp	dword ptr [dword150],0
	jl	label000c
	mov	dword154,[ebp-348]
	add	dword154,4
	mov	dword157,[dword154]
	cmp	dword157,dword ptr [__height]
	jge	label000c
	fldz
	fstp	dword ptr [ebp-520]
	fldz
	fstp	dword ptr [ebp-524]
	mov	dword159,8
	add	dword159,[ebp-340]
	mov	[ebp-528],dword159
	mov	dword161,8
	add	dword161,[ebp-344]
	mov	[ebp-532],dword161
	mov	dword163,8
	add	dword163,[ebp-348]
	mov	[ebp-536],dword163
	mov	dword165,[ebp-348]
	add	dword165,4
	mov	dword1323,[dword165]
	mov	[ebp-540],dword1323
	mov	dword168,[ebp-340]
	mov	dword1322,[dword168]
	mov	[ebp-544],dword1322
	mov	dword170,[ebp-344]
	mov	dword1321,[dword170]
	mov	[ebp-548],dword1321
	mov	dword172,[ebp-348]
	mov	dword1320,[dword172]
	mov	[ebp-552],dword1320
; start of inline function _rasterize_triangle_1i
	mov	dword1327,[ebp-552]
	cmp	dword1327,[ebp-548]
	jge	label0040
	mov	dword1330,[ebp-544]
	cmp	dword1330,[ebp-548]
	jle	label0041
	mov	dword1400,[ebp-520]
	mov	[ebp-556],dword1400
	mov	dword1399,[ebp-524]
	mov	[ebp-560],dword1399
	mov	dword1334,[ebp-536]
	mov	dword1398,[dword1334+4]
	mov	[ebp-564],dword1398
	mov	dword1336,[ebp-536]
	mov	dword1397,[dword1336]
	mov	[ebp-568],dword1397
	mov	dword1396,[ebp-540]
	mov	[ebp-572],dword1396
	mov	dword1395,[ebp-544]
	mov	[ebp-576],dword1395
	mov	dword1394,[ebp-552]
	mov	[ebp-580],dword1394
; start of inline function _rasterize_horiz_line
	mov	dword1404,dword ptr [__pitch]
	imul	dword1404,[ebp-572]
	add	dword1404,dword ptr [__videomem]
	mov	dword1408,[ebp-580]
	sal	dword1408,2
	add	dword1404,dword1408
	mov	[ebp-584],dword1404
	mov	dword1412,[ebp-576]
	sal	dword1412,2
	add	dword1412,[ebp-584]
	mov	dword1416,[ebp-580]
	sal	dword1416,2
	sub	dword1412,dword1416
	mov	[ebp-588],dword1412
label004a:
	mov	dword1482,[ebp-564]
	mov	[ebp-628],dword1482
	mov	dword1481,[ebp-568]
	mov	[ebp-632],dword1481
; start of inline function _tex2d
	mov	dword1486,dword ptr [__texture_width]
	dec	dword1486
	int2float	dword1486
	fmul	dword ptr [ebp-632]
	float2int	dword1488
	mov	[ebp-636],dword1488
	mov	dword1492,dword ptr [__texture_height]
	dec	dword1492
	int2float	dword1492
	fmul	dword ptr [ebp-628]
	float2int	dword1494
	mov	[ebp-640],dword1494
	mov	dword1498,[ebp-640]
	imul	dword1498,dword ptr [__texture_width]
	add	dword1498,[ebp-636]
	sal	dword1498,2
	add	dword1498,dword ptr [__texture_data]
	mov	dword1502,[dword1498]
	mov	[ebp-644],dword1502
label004e:
; end of inline function _tex2d
	mov	dword1420,[ebp-644]
	mov	[ebp-592],dword1420
	mov	dword1424,[ebp-592]
	sar	dword1424,24
	and	dword1424,255
	mov	[ebp-620],dword1424
	cmp	dword ptr [ebp-620],0
	je	label004d
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1432,[ebp-584]
	mov	dword1434,[dword1432]
	mov	[ebp-608],dword1434
	mov	dword1437,[ebp-608]
	and	dword1437,65280
	sar	dword1437,8
	mov	[ebp-612],dword1437
	mov	dword1442,[ebp-608]
	and	dword1442,255
	mov	[ebp-616],dword1442
	mov	dword1446,[ebp-592]
	and	dword1446,65280
	sar	dword1446,8
	mov	[ebp-600],dword1446
	mov	dword1451,[ebp-592]
	and	dword1451,255
	mov	[ebp-604],dword1451
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1457
	mov	[ebp-600],dword1457
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1463
	mov	[ebp-604],dword1463
	mov	dword1467,[ebp-600]
	sal	dword1467,8
	add	dword1467,[ebp-604]
	mov	[ebp-596],dword1467
	mov	dword1471,[ebp-584]
	mov	dword1473,[ebp-596]
	mov	[dword1471],dword1473
label004d:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label004b:
	add	dword ptr [ebp-584],4
	mov	dword1480,[ebp-584]
	cmp	dword1480,[ebp-588]
	jl	label004a
label004c:
label004f:
; end of inline function _rasterize_horiz_line
	jmp	label0042
label0041:
	mov	dword1342,[ebp-544]
	cmp	dword1342,[ebp-552]
	jge	label0043
	mov	dword1509,[ebp-520]
	mov	[ebp-556],dword1509
	mov	dword1508,[ebp-524]
	mov	[ebp-560],dword1508
	mov	dword1346,[ebp-528]
	mov	dword1507,[dword1346+4]
	mov	[ebp-564],dword1507
	mov	dword1348,[ebp-528]
	mov	dword1506,[dword1348]
	mov	[ebp-568],dword1506
	mov	dword1505,[ebp-540]
	mov	[ebp-572],dword1505
	mov	dword1504,[ebp-548]
	mov	[ebp-576],dword1504
	mov	dword1503,[ebp-544]
	mov	[ebp-580],dword1503
; start of inline function _rasterize_horiz_line
	mov	dword1513,dword ptr [__pitch]
	imul	dword1513,[ebp-572]
	add	dword1513,dword ptr [__videomem]
	mov	dword1517,[ebp-580]
	sal	dword1517,2
	add	dword1513,dword1517
	mov	[ebp-584],dword1513
	mov	dword1521,[ebp-576]
	sal	dword1521,2
	add	dword1521,[ebp-584]
	mov	dword1525,[ebp-580]
	sal	dword1525,2
	sub	dword1521,dword1525
	mov	[ebp-588],dword1521
label0050:
	mov	dword1591,[ebp-564]
	mov	[ebp-628],dword1591
	mov	dword1590,[ebp-568]
	mov	[ebp-632],dword1590
; start of inline function _tex2d
	mov	dword1595,dword ptr [__texture_width]
	dec	dword1595
	int2float	dword1595
	fmul	dword ptr [ebp-632]
	float2int	dword1597
	mov	[ebp-636],dword1597
	mov	dword1601,dword ptr [__texture_height]
	dec	dword1601
	int2float	dword1601
	fmul	dword ptr [ebp-628]
	float2int	dword1603
	mov	[ebp-640],dword1603
	mov	dword1607,[ebp-640]
	imul	dword1607,dword ptr [__texture_width]
	add	dword1607,[ebp-636]
	sal	dword1607,2
	add	dword1607,dword ptr [__texture_data]
	mov	dword1611,[dword1607]
	mov	[ebp-644],dword1611
label0054:
; end of inline function _tex2d
	mov	dword1529,[ebp-644]
	mov	[ebp-592],dword1529
	mov	dword1533,[ebp-592]
	sar	dword1533,24
	and	dword1533,255
	mov	[ebp-620],dword1533
	cmp	dword ptr [ebp-620],0
	je	label0053
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1541,[ebp-584]
	mov	dword1543,[dword1541]
	mov	[ebp-608],dword1543
	mov	dword1546,[ebp-608]
	and	dword1546,65280
	sar	dword1546,8
	mov	[ebp-612],dword1546
	mov	dword1551,[ebp-608]
	and	dword1551,255
	mov	[ebp-616],dword1551
	mov	dword1555,[ebp-592]
	and	dword1555,65280
	sar	dword1555,8
	mov	[ebp-600],dword1555
	mov	dword1560,[ebp-592]
	and	dword1560,255
	mov	[ebp-604],dword1560
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1566
	mov	[ebp-600],dword1566
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1572
	mov	[ebp-604],dword1572
	mov	dword1576,[ebp-600]
	sal	dword1576,8
	add	dword1576,[ebp-604]
	mov	[ebp-596],dword1576
	mov	dword1580,[ebp-584]
	mov	dword1582,[ebp-596]
	mov	[dword1580],dword1582
label0053:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0051:
	add	dword ptr [ebp-584],4
	mov	dword1589,[ebp-584]
	cmp	dword1589,[ebp-588]
	jl	label0050
label0052:
label0055:
; end of inline function _rasterize_horiz_line
	jmp	label0044
label0043:
	mov	dword1618,[ebp-520]
	mov	[ebp-556],dword1618
	mov	dword1617,[ebp-524]
	mov	[ebp-560],dword1617
	mov	dword1355,[ebp-536]
	mov	dword1616,[dword1355+4]
	mov	[ebp-564],dword1616
	mov	dword1357,[ebp-536]
	mov	dword1615,[dword1357]
	mov	[ebp-568],dword1615
	mov	dword1614,[ebp-540]
	mov	[ebp-572],dword1614
	mov	dword1613,[ebp-548]
	mov	[ebp-576],dword1613
	mov	dword1612,[ebp-552]
	mov	[ebp-580],dword1612
; start of inline function _rasterize_horiz_line
	mov	dword1622,dword ptr [__pitch]
	imul	dword1622,[ebp-572]
	add	dword1622,dword ptr [__videomem]
	mov	dword1626,[ebp-580]
	sal	dword1626,2
	add	dword1622,dword1626
	mov	[ebp-584],dword1622
	mov	dword1630,[ebp-576]
	sal	dword1630,2
	add	dword1630,[ebp-584]
	mov	dword1634,[ebp-580]
	sal	dword1634,2
	sub	dword1630,dword1634
	mov	[ebp-588],dword1630
label0056:
	mov	dword1700,[ebp-564]
	mov	[ebp-628],dword1700
	mov	dword1699,[ebp-568]
	mov	[ebp-632],dword1699
; start of inline function _tex2d
	mov	dword1704,dword ptr [__texture_width]
	dec	dword1704
	int2float	dword1704
	fmul	dword ptr [ebp-632]
	float2int	dword1706
	mov	[ebp-636],dword1706
	mov	dword1710,dword ptr [__texture_height]
	dec	dword1710
	int2float	dword1710
	fmul	dword ptr [ebp-628]
	float2int	dword1712
	mov	[ebp-640],dword1712
	mov	dword1716,[ebp-640]
	imul	dword1716,dword ptr [__texture_width]
	add	dword1716,[ebp-636]
	sal	dword1716,2
	add	dword1716,dword ptr [__texture_data]
	mov	dword1720,[dword1716]
	mov	[ebp-644],dword1720
label005a:
; end of inline function _tex2d
	mov	dword1638,[ebp-644]
	mov	[ebp-592],dword1638
	mov	dword1642,[ebp-592]
	sar	dword1642,24
	and	dword1642,255
	mov	[ebp-620],dword1642
	cmp	dword ptr [ebp-620],0
	je	label0059
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1650,[ebp-584]
	mov	dword1652,[dword1650]
	mov	[ebp-608],dword1652
	mov	dword1655,[ebp-608]
	and	dword1655,65280
	sar	dword1655,8
	mov	[ebp-612],dword1655
	mov	dword1660,[ebp-608]
	and	dword1660,255
	mov	[ebp-616],dword1660
	mov	dword1664,[ebp-592]
	and	dword1664,65280
	sar	dword1664,8
	mov	[ebp-600],dword1664
	mov	dword1669,[ebp-592]
	and	dword1669,255
	mov	[ebp-604],dword1669
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1675
	mov	[ebp-600],dword1675
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1681
	mov	[ebp-604],dword1681
	mov	dword1685,[ebp-600]
	sal	dword1685,8
	add	dword1685,[ebp-604]
	mov	[ebp-596],dword1685
	mov	dword1689,[ebp-584]
	mov	dword1691,[ebp-596]
	mov	[dword1689],dword1691
label0059:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0057:
	add	dword ptr [ebp-584],4
	mov	dword1698,[ebp-584]
	cmp	dword1698,[ebp-588]
	jl	label0056
label0058:
label005b:
; end of inline function _rasterize_horiz_line
label0044:
label0042:
	jmp	label0045
label0040:
	mov	dword1363,[ebp-544]
	cmp	dword1363,[ebp-548]
	jge	label0046
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	dword1367,[ebp-528]
	mov	dword1725,[dword1367+4]
	mov	[ebp-564],dword1725
	mov	dword1369,[ebp-528]
	mov	dword1724,[dword1369]
	mov	[ebp-568],dword1724
	mov	dword1723,[ebp-540]
	mov	[ebp-572],dword1723
	mov	dword1722,[ebp-552]
	mov	[ebp-576],dword1722
	mov	dword1721,[ebp-544]
	mov	[ebp-580],dword1721
; start of inline function _rasterize_horiz_line
	mov	dword1729,dword ptr [__pitch]
	imul	dword1729,[ebp-572]
	add	dword1729,dword ptr [__videomem]
	mov	dword1733,[ebp-580]
	sal	dword1733,2
	add	dword1729,dword1733
	mov	[ebp-584],dword1729
	mov	dword1737,[ebp-576]
	sal	dword1737,2
	add	dword1737,[ebp-584]
	mov	dword1741,[ebp-580]
	sal	dword1741,2
	sub	dword1737,dword1741
	mov	[ebp-588],dword1737
label005c:
	mov	dword1807,[ebp-564]
	mov	[ebp-628],dword1807
	mov	dword1806,[ebp-568]
	mov	[ebp-632],dword1806
; start of inline function _tex2d
	mov	dword1811,dword ptr [__texture_width]
	dec	dword1811
	int2float	dword1811
	fmul	dword ptr [ebp-632]
	float2int	dword1813
	mov	[ebp-636],dword1813
	mov	dword1817,dword ptr [__texture_height]
	dec	dword1817
	int2float	dword1817
	fmul	dword ptr [ebp-628]
	float2int	dword1819
	mov	[ebp-640],dword1819
	mov	dword1823,[ebp-640]
	imul	dword1823,dword ptr [__texture_width]
	add	dword1823,[ebp-636]
	sal	dword1823,2
	add	dword1823,dword ptr [__texture_data]
	mov	dword1827,[dword1823]
	mov	[ebp-644],dword1827
label0060:
; end of inline function _tex2d
	mov	dword1745,[ebp-644]
	mov	[ebp-592],dword1745
	mov	dword1749,[ebp-592]
	sar	dword1749,24
	and	dword1749,255
	mov	[ebp-620],dword1749
	cmp	dword ptr [ebp-620],0
	je	label005f
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1757,[ebp-584]
	mov	dword1759,[dword1757]
	mov	[ebp-608],dword1759
	mov	dword1762,[ebp-608]
	and	dword1762,65280
	sar	dword1762,8
	mov	[ebp-612],dword1762
	mov	dword1767,[ebp-608]
	and	dword1767,255
	mov	[ebp-616],dword1767
	mov	dword1771,[ebp-592]
	and	dword1771,65280
	sar	dword1771,8
	mov	[ebp-600],dword1771
	mov	dword1776,[ebp-592]
	and	dword1776,255
	mov	[ebp-604],dword1776
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1782
	mov	[ebp-600],dword1782
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1788
	mov	[ebp-604],dword1788
	mov	dword1792,[ebp-600]
	sal	dword1792,8
	add	dword1792,[ebp-604]
	mov	[ebp-596],dword1792
	mov	dword1796,[ebp-584]
	mov	dword1798,[ebp-596]
	mov	[dword1796],dword1798
label005f:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label005d:
	add	dword ptr [ebp-584],4
	mov	dword1805,[ebp-584]
	cmp	dword1805,[ebp-588]
	jl	label005c
label005e:
label0061:
; end of inline function _rasterize_horiz_line
	jmp	label0047
label0046:
	mov	dword1375,[ebp-544]
	cmp	dword1375,[ebp-552]
	jle	label0048
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	dword1379,[ebp-532]
	mov	dword1832,[dword1379+4]
	mov	[ebp-564],dword1832
	mov	dword1381,[ebp-532]
	mov	dword1831,[dword1381]
	mov	[ebp-568],dword1831
	mov	dword1830,[ebp-540]
	mov	[ebp-572],dword1830
	mov	dword1829,[ebp-544]
	mov	[ebp-576],dword1829
	mov	dword1828,[ebp-548]
	mov	[ebp-580],dword1828
; start of inline function _rasterize_horiz_line
	mov	dword1836,dword ptr [__pitch]
	imul	dword1836,[ebp-572]
	add	dword1836,dword ptr [__videomem]
	mov	dword1840,[ebp-580]
	sal	dword1840,2
	add	dword1836,dword1840
	mov	[ebp-584],dword1836
	mov	dword1844,[ebp-576]
	sal	dword1844,2
	add	dword1844,[ebp-584]
	mov	dword1848,[ebp-580]
	sal	dword1848,2
	sub	dword1844,dword1848
	mov	[ebp-588],dword1844
label0062:
	mov	dword1914,[ebp-564]
	mov	[ebp-628],dword1914
	mov	dword1913,[ebp-568]
	mov	[ebp-632],dword1913
; start of inline function _tex2d
	mov	dword1918,dword ptr [__texture_width]
	dec	dword1918
	int2float	dword1918
	fmul	dword ptr [ebp-632]
	float2int	dword1920
	mov	[ebp-636],dword1920
	mov	dword1924,dword ptr [__texture_height]
	dec	dword1924
	int2float	dword1924
	fmul	dword ptr [ebp-628]
	float2int	dword1926
	mov	[ebp-640],dword1926
	mov	dword1930,[ebp-640]
	imul	dword1930,dword ptr [__texture_width]
	add	dword1930,[ebp-636]
	sal	dword1930,2
	add	dword1930,dword ptr [__texture_data]
	mov	dword1934,[dword1930]
	mov	[ebp-644],dword1934
label0066:
; end of inline function _tex2d
	mov	dword1852,[ebp-644]
	mov	[ebp-592],dword1852
	mov	dword1856,[ebp-592]
	sar	dword1856,24
	and	dword1856,255
	mov	[ebp-620],dword1856
	cmp	dword ptr [ebp-620],0
	je	label0065
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1864,[ebp-584]
	mov	dword1866,[dword1864]
	mov	[ebp-608],dword1866
	mov	dword1869,[ebp-608]
	and	dword1869,65280
	sar	dword1869,8
	mov	[ebp-612],dword1869
	mov	dword1874,[ebp-608]
	and	dword1874,255
	mov	[ebp-616],dword1874
	mov	dword1878,[ebp-592]
	and	dword1878,65280
	sar	dword1878,8
	mov	[ebp-600],dword1878
	mov	dword1883,[ebp-592]
	and	dword1883,255
	mov	[ebp-604],dword1883
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1889
	mov	[ebp-600],dword1889
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1895
	mov	[ebp-604],dword1895
	mov	dword1899,[ebp-600]
	sal	dword1899,8
	add	dword1899,[ebp-604]
	mov	[ebp-596],dword1899
	mov	dword1903,[ebp-584]
	mov	dword1905,[ebp-596]
	mov	[dword1903],dword1905
label0065:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0063:
	add	dword ptr [ebp-584],4
	mov	dword1912,[ebp-584]
	cmp	dword1912,[ebp-588]
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
	mov	dword1388,[ebp-532]
	mov	dword1939,[dword1388+4]
	mov	[ebp-564],dword1939
	mov	dword1390,[ebp-532]
	mov	dword1938,[dword1390]
	mov	[ebp-568],dword1938
	mov	dword1937,[ebp-540]
	mov	[ebp-572],dword1937
	mov	dword1936,[ebp-552]
	mov	[ebp-576],dword1936
	mov	dword1935,[ebp-548]
	mov	[ebp-580],dword1935
; start of inline function _rasterize_horiz_line
	mov	dword1943,dword ptr [__pitch]
	imul	dword1943,[ebp-572]
	add	dword1943,dword ptr [__videomem]
	mov	dword1947,[ebp-580]
	sal	dword1947,2
	add	dword1943,dword1947
	mov	[ebp-584],dword1943
	mov	dword1951,[ebp-576]
	sal	dword1951,2
	add	dword1951,[ebp-584]
	mov	dword1955,[ebp-580]
	sal	dword1955,2
	sub	dword1951,dword1955
	mov	[ebp-588],dword1951
label0068:
	mov	dword2021,[ebp-564]
	mov	[ebp-628],dword2021
	mov	dword2020,[ebp-568]
	mov	[ebp-632],dword2020
; start of inline function _tex2d
	mov	dword2025,dword ptr [__texture_width]
	dec	dword2025
	int2float	dword2025
	fmul	dword ptr [ebp-632]
	float2int	dword2027
	mov	[ebp-636],dword2027
	mov	dword2031,dword ptr [__texture_height]
	dec	dword2031
	int2float	dword2031
	fmul	dword ptr [ebp-628]
	float2int	dword2033
	mov	[ebp-640],dword2033
	mov	dword2037,[ebp-640]
	imul	dword2037,dword ptr [__texture_width]
	add	dword2037,[ebp-636]
	sal	dword2037,2
	add	dword2037,dword ptr [__texture_data]
	mov	dword2041,[dword2037]
	mov	[ebp-644],dword2041
label006c:
; end of inline function _tex2d
	mov	dword1959,[ebp-644]
	mov	[ebp-592],dword1959
	mov	dword1963,[ebp-592]
	sar	dword1963,24
	and	dword1963,255
	mov	[ebp-620],dword1963
	cmp	dword ptr [ebp-620],0
	je	label006b
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1971,[ebp-584]
	mov	dword1973,[dword1971]
	mov	[ebp-608],dword1973
	mov	dword1976,[ebp-608]
	and	dword1976,65280
	sar	dword1976,8
	mov	[ebp-612],dword1976
	mov	dword1981,[ebp-608]
	and	dword1981,255
	mov	[ebp-616],dword1981
	mov	dword1985,[ebp-592]
	and	dword1985,65280
	sar	dword1985,8
	mov	[ebp-600],dword1985
	mov	dword1990,[ebp-592]
	and	dword1990,255
	mov	[ebp-604],dword1990
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1996
	mov	[ebp-600],dword1996
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword2002
	mov	[ebp-604],dword2002
	mov	dword2006,[ebp-600]
	sal	dword2006,8
	add	dword2006,[ebp-604]
	mov	[ebp-596],dword2006
	mov	dword2010,[ebp-584]
	mov	dword2012,[ebp-596]
	mov	[dword2010],dword2012
label006b:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0069:
	add	dword ptr [ebp-584],4
	mov	dword2019,[ebp-584]
	cmp	dword2019,[ebp-588]
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
	mov	dword174,[ebp-348]
	add	dword174,4
	mov	dword177,[dword174]
	mov	[ebp-364],dword177
label000d:
label000e:
	mov	dword179,[ebp-344]
	add	dword179,4
	mov	dword182,[dword179]
	cmp	dword182,[ebp-364]
	jle	label000f
	mov	dword184,[ebp-348]
	add	dword184,4
	mov	dword187,[ebp-364]
	sub	dword187,[dword184]
	mov	dword189,[ebp-344]
	mov	dword191,[ebp-348]
	mov	dword192,[dword189]
	sub	dword192,[dword191]
	imul	dword187,dword192
	mov	dword194,[ebp-344]
	add	dword194,4
	mov	dword197,[ebp-348]
	add	dword197,4
	mov	dword199,[dword194]
	sub	dword199,[dword197]
	cdq	dword200
	idiv	dword187,dword199
	mov	dword202,[ebp-348]
	add	dword187,[dword202]
	mov	[ebp-356],dword187
	mov	dword205,[ebp-348]
	add	dword205,4
	mov	dword208,[ebp-364]
	sub	dword208,[dword205]
	mov	dword210,[ebp-340]
	mov	dword212,[ebp-348]
	mov	dword213,[dword210]
	sub	dword213,[dword212]
	imul	dword208,dword213
	mov	dword215,[ebp-340]
	add	dword215,4
	mov	dword218,[ebp-348]
	add	dword218,4
	mov	dword220,[dword215]
	sub	dword220,[dword218]
	cdq	dword221
	idiv	dword208,dword220
	mov	dword223,[ebp-348]
	add	dword208,[dword223]
	mov	[ebp-360],dword208
	mov	dword226,[ebp-348]
	add	dword226,4
	mov	dword229,[ebp-364]
	sub	dword229,[dword226]
	int2float	dword229
	mov	dword231,[ebp-344]
	mov	dword233,[ebp-348]
	fld	dword ptr [dword231+8]
	fsub	dword ptr [dword233+8]
	fmulp
	mov	dword235,[ebp-344]
	add	dword235,4
	mov	dword238,[ebp-348]
	add	dword238,4
	mov	dword240,[dword235]
	sub	dword240,[dword238]
	int2float	dword240
	fdivp
	mov	dword242,[ebp-348]
	fadd	dword ptr [dword242+8]
	fstp	dword ptr [ebp-368]
	mov	dword245,[ebp-348]
	add	dword245,4
	mov	dword248,[ebp-364]
	sub	dword248,[dword245]
	int2float	dword248
	mov	dword250,[ebp-340]
	mov	dword252,[ebp-348]
	fld	dword ptr [dword250+8]
	fsub	dword ptr [dword252+8]
	fmulp
	mov	dword254,[ebp-340]
	add	dword254,4
	mov	dword257,[ebp-348]
	add	dword257,4
	mov	dword259,[dword254]
	sub	dword259,[dword257]
	int2float	dword259
	fdivp
	mov	dword261,[ebp-348]
	fadd	dword ptr [dword261+8]
	fstp	dword ptr [ebp-376]
	mov	dword264,[ebp-348]
	add	dword264,4
	mov	dword267,[ebp-364]
	sub	dword267,[dword264]
	int2float	dword267
	mov	dword269,8
	add	dword269,[ebp-344]
	add	dword269,4
	mov	dword272,8
	add	dword272,[ebp-348]
	add	dword272,4
	fld	dword ptr [dword269]
	fsub	dword ptr [dword272]
	fmulp
	mov	dword275,[ebp-344]
	add	dword275,4
	mov	dword278,[ebp-348]
	add	dword278,4
	mov	dword280,[dword275]
	sub	dword280,[dword278]
	int2float	dword280
	fdivp
	mov	dword282,8
	add	dword282,[ebp-348]
	add	dword282,4
	fadd	dword ptr [dword282]
	fstp	dword ptr [ebp-372]
	mov	dword286,[ebp-348]
	add	dword286,4
	mov	dword289,[ebp-364]
	sub	dword289,[dword286]
	int2float	dword289
	mov	dword291,8
	add	dword291,[ebp-340]
	add	dword291,4
	mov	dword294,8
	add	dword294,[ebp-348]
	add	dword294,4
	fld	dword ptr [dword291]
	fsub	dword ptr [dword294]
	fmulp
	mov	dword297,[ebp-340]
	add	dword297,4
	mov	dword300,[ebp-348]
	add	dword300,4
	mov	dword302,[dword297]
	sub	dword302,[dword300]
	int2float	dword302
	fdivp
	mov	dword304,8
	add	dword304,[ebp-348]
	add	dword304,4
	fadd	dword ptr [dword304]
	fstp	dword ptr [ebp-380]
	mov	dword309,[ebp-360]
	sub	dword309,[ebp-356]
	int2float	dword309
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	dword315,[ebp-360]
	sub	dword315,[ebp-356]
	int2float	dword315
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	mov	dword593,[ebp-388]
	mov	[ebp-392],dword593
	mov	dword592,[ebp-384]
	mov	[ebp-396],dword592
	mov	dword591,[ebp-380]
	mov	[ebp-400],dword591
	mov	dword590,[ebp-376]
	mov	[ebp-404],dword590
	mov	dword589,[ebp-372]
	mov	[ebp-408],dword589
	mov	dword588,[ebp-368]
	mov	[ebp-412],dword588
	mov	dword587,[ebp-364]
	mov	[ebp-416],dword587
	mov	dword586,[ebp-360]
	mov	[ebp-420],dword586
	mov	dword585,[ebp-356]
	mov	[ebp-424],dword585
; start of inline function _rasterize_horiz_line__unordered
	mov	dword597,[ebp-424]
	cmp	dword597,[ebp-420]
	jg	label0013
	mov	dword618,[ebp-392]
	mov	[ebp-428],dword618
	mov	dword617,[ebp-396]
	mov	[ebp-432],dword617
	mov	dword616,[ebp-408]
	mov	[ebp-436],dword616
	mov	dword615,[ebp-412]
	mov	[ebp-440],dword615
	mov	dword614,[ebp-416]
	mov	[ebp-444],dword614
	mov	dword613,[ebp-420]
	mov	[ebp-448],dword613
	mov	dword612,[ebp-424]
	mov	[ebp-452],dword612
; start of inline function _rasterize_horiz_line
	mov	dword622,dword ptr [__pitch]
	imul	dword622,[ebp-444]
	add	dword622,dword ptr [__videomem]
	mov	dword626,[ebp-452]
	sal	dword626,2
	add	dword622,dword626
	mov	[ebp-456],dword622
	mov	dword630,[ebp-448]
	sal	dword630,2
	add	dword630,[ebp-456]
	mov	dword634,[ebp-452]
	sal	dword634,2
	sub	dword630,dword634
	mov	[ebp-460],dword630
label0015:
	mov	dword700,[ebp-436]
	mov	[ebp-500],dword700
	mov	dword699,[ebp-440]
	mov	[ebp-504],dword699
; start of inline function _tex2d
	mov	dword704,dword ptr [__texture_width]
	dec	dword704
	int2float	dword704
	fmul	dword ptr [ebp-504]
	float2int	dword706
	mov	[ebp-508],dword706
	mov	dword710,dword ptr [__texture_height]
	dec	dword710
	int2float	dword710
	fmul	dword ptr [ebp-500]
	float2int	dword712
	mov	[ebp-512],dword712
	mov	dword716,[ebp-512]
	imul	dword716,dword ptr [__texture_width]
	add	dword716,[ebp-508]
	sal	dword716,2
	add	dword716,dword ptr [__texture_data]
	mov	dword720,[dword716]
	mov	[ebp-516],dword720
label0019:
; end of inline function _tex2d
	mov	dword638,[ebp-516]
	mov	[ebp-464],dword638
	mov	dword642,[ebp-464]
	sar	dword642,24
	and	dword642,255
	mov	[ebp-492],dword642
	cmp	dword ptr [ebp-492],0
	je	label0018
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword650,[ebp-456]
	mov	dword652,[dword650]
	mov	[ebp-480],dword652
	mov	dword655,[ebp-480]
	and	dword655,65280
	sar	dword655,8
	mov	[ebp-484],dword655
	mov	dword660,[ebp-480]
	and	dword660,255
	mov	[ebp-488],dword660
	mov	dword664,[ebp-464]
	and	dword664,65280
	sar	dword664,8
	mov	[ebp-472],dword664
	mov	dword669,[ebp-464]
	and	dword669,255
	mov	[ebp-476],dword669
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword675
	mov	[ebp-472],dword675
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword681
	mov	[ebp-476],dword681
	mov	dword685,[ebp-472]
	sal	dword685,8
	add	dword685,[ebp-476]
	mov	[ebp-468],dword685
	mov	dword689,[ebp-456]
	mov	dword691,[ebp-468]
	mov	[dword689],dword691
label0018:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0016:
	add	dword ptr [ebp-456],4
	mov	dword698,[ebp-456]
	cmp	dword698,[ebp-460]
	jl	label0015
label0017:
label001a:
; end of inline function _rasterize_horiz_line
	jmp	label0014
label0013:
	mov	dword727,[ebp-392]
	mov	[ebp-428],dword727
	mov	dword726,[ebp-396]
	mov	[ebp-432],dword726
	mov	dword725,[ebp-400]
	mov	[ebp-436],dword725
	mov	dword724,[ebp-404]
	mov	[ebp-440],dword724
	mov	dword723,[ebp-416]
	mov	[ebp-444],dword723
	mov	dword722,[ebp-424]
	mov	[ebp-448],dword722
	mov	dword721,[ebp-420]
	mov	[ebp-452],dword721
; start of inline function _rasterize_horiz_line
	mov	dword731,dword ptr [__pitch]
	imul	dword731,[ebp-444]
	add	dword731,dword ptr [__videomem]
	mov	dword735,[ebp-452]
	sal	dword735,2
	add	dword731,dword735
	mov	[ebp-456],dword731
	mov	dword739,[ebp-448]
	sal	dword739,2
	add	dword739,[ebp-456]
	mov	dword743,[ebp-452]
	sal	dword743,2
	sub	dword739,dword743
	mov	[ebp-460],dword739
label001b:
	mov	dword809,[ebp-436]
	mov	[ebp-500],dword809
	mov	dword808,[ebp-440]
	mov	[ebp-504],dword808
; start of inline function _tex2d
	mov	dword813,dword ptr [__texture_width]
	dec	dword813
	int2float	dword813
	fmul	dword ptr [ebp-504]
	float2int	dword815
	mov	[ebp-508],dword815
	mov	dword819,dword ptr [__texture_height]
	dec	dword819
	int2float	dword819
	fmul	dword ptr [ebp-500]
	float2int	dword821
	mov	[ebp-512],dword821
	mov	dword825,[ebp-512]
	imul	dword825,dword ptr [__texture_width]
	add	dword825,[ebp-508]
	sal	dword825,2
	add	dword825,dword ptr [__texture_data]
	mov	dword829,[dword825]
	mov	[ebp-516],dword829
label001f:
; end of inline function _tex2d
	mov	dword747,[ebp-516]
	mov	[ebp-464],dword747
	mov	dword751,[ebp-464]
	sar	dword751,24
	and	dword751,255
	mov	[ebp-492],dword751
	cmp	dword ptr [ebp-492],0
	je	label001e
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword759,[ebp-456]
	mov	dword761,[dword759]
	mov	[ebp-480],dword761
	mov	dword764,[ebp-480]
	and	dword764,65280
	sar	dword764,8
	mov	[ebp-484],dword764
	mov	dword769,[ebp-480]
	and	dword769,255
	mov	[ebp-488],dword769
	mov	dword773,[ebp-464]
	and	dword773,65280
	sar	dword773,8
	mov	[ebp-472],dword773
	mov	dword778,[ebp-464]
	and	dword778,255
	mov	[ebp-476],dword778
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword784
	mov	[ebp-472],dword784
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword790
	mov	[ebp-476],dword790
	mov	dword794,[ebp-472]
	sal	dword794,8
	add	dword794,[ebp-476]
	mov	[ebp-468],dword794
	mov	dword798,[ebp-456]
	mov	dword800,[ebp-468]
	mov	[dword798],dword800
label001e:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label001c:
	add	dword ptr [ebp-456],4
	mov	dword807,[ebp-456]
	cmp	dword807,[ebp-460]
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
	mov	dword330,[ebp-344]
	add	dword330,4
	mov	dword333,[ebp-348]
	add	dword333,4
	mov	dword335,[dword330]
	sub	dword335,[dword333]
	mov	dword337,[ebp-340]
	mov	dword339,[ebp-348]
	mov	dword340,[dword337]
	sub	dword340,[dword339]
	imul	dword335,dword340
	mov	dword342,[ebp-340]
	add	dword342,4
	mov	dword345,[ebp-348]
	add	dword345,4
	mov	dword347,[dword342]
	sub	dword347,[dword345]
	cdq	dword348
	idiv	dword335,dword347
	mov	dword350,[ebp-348]
	add	dword335,[dword350]
	mov	[ebp-360],dword335
	mov	dword353,[ebp-344]
	add	dword353,4
	mov	dword356,[ebp-348]
	add	dword356,4
	mov	dword358,[dword353]
	sub	dword358,[dword356]
	int2float	dword358
	mov	dword360,[ebp-340]
	mov	dword362,[ebp-348]
	fld	dword ptr [dword360+8]
	fsub	dword ptr [dword362+8]
	fmulp
	mov	dword364,[ebp-340]
	add	dword364,4
	mov	dword367,[ebp-348]
	add	dword367,4
	mov	dword369,[dword364]
	sub	dword369,[dword367]
	int2float	dword369
	fdivp
	mov	dword371,[ebp-348]
	fadd	dword ptr [dword371+8]
	fstp	dword ptr [ebp-376]
	mov	dword374,[ebp-344]
	add	dword374,4
	mov	dword377,[ebp-348]
	add	dword377,4
	mov	dword379,[dword374]
	sub	dword379,[dword377]
	int2float	dword379
	mov	dword381,8
	add	dword381,[ebp-340]
	add	dword381,4
	mov	dword384,8
	add	dword384,[ebp-348]
	add	dword384,4
	fld	dword ptr [dword381]
	fsub	dword ptr [dword384]
	fmulp
	mov	dword387,[ebp-340]
	add	dword387,4
	mov	dword390,[ebp-348]
	add	dword390,4
	mov	dword392,[dword387]
	sub	dword392,[dword390]
	int2float	dword392
	fdivp
	mov	dword394,8
	add	dword394,[ebp-348]
	add	dword394,4
	fadd	dword ptr [dword394]
	fstp	dword ptr [ebp-380]
	mov	dword398,[ebp-344]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [dword398+8]
	mov	dword401,[ebp-344]
	mov	dword403,[ebp-360]
	sub	dword403,[dword401]
	int2float	dword403
	fdivp
	fstp	dword ptr [ebp-384]
	mov	dword406,8
	add	dword406,[ebp-344]
	add	dword406,4
	fld	dword ptr [ebp-380]
	fsub	dword ptr [dword406]
	mov	dword410,[ebp-344]
	mov	dword412,[ebp-360]
	sub	dword412,[dword410]
	int2float	dword412
	fdivp
	fstp	dword ptr [ebp-388]
	mov	dword838,[ebp-388]
	mov	[ebp-392],dword838
	mov	dword837,[ebp-384]
	mov	[ebp-396],dword837
	mov	dword417,8
	add	dword417,[ebp-344]
	add	dword417,4
	mov	dword836,[dword417]
	mov	[ebp-400],dword836
	mov	dword420,[ebp-344]
	mov	dword835,[dword420+8]
	mov	[ebp-404],dword835
	mov	dword834,[ebp-380]
	mov	[ebp-408],dword834
	mov	dword833,[ebp-376]
	mov	[ebp-412],dword833
	mov	dword424,[ebp-344]
	add	dword424,4
	mov	dword832,[dword424]
	mov	[ebp-416],dword832
	mov	dword427,[ebp-344]
	mov	dword831,[dword427]
	mov	[ebp-420],dword831
	mov	dword830,[ebp-360]
	mov	[ebp-424],dword830
; start of inline function _rasterize_horiz_line__unordered
	mov	dword842,[ebp-424]
	cmp	dword842,[ebp-420]
	jg	label0022
	mov	dword863,[ebp-392]
	mov	[ebp-428],dword863
	mov	dword862,[ebp-396]
	mov	[ebp-432],dword862
	mov	dword861,[ebp-408]
	mov	[ebp-436],dword861
	mov	dword860,[ebp-412]
	mov	[ebp-440],dword860
	mov	dword859,[ebp-416]
	mov	[ebp-444],dword859
	mov	dword858,[ebp-420]
	mov	[ebp-448],dword858
	mov	dword857,[ebp-424]
	mov	[ebp-452],dword857
; start of inline function _rasterize_horiz_line
	mov	dword867,dword ptr [__pitch]
	imul	dword867,[ebp-444]
	add	dword867,dword ptr [__videomem]
	mov	dword871,[ebp-452]
	sal	dword871,2
	add	dword867,dword871
	mov	[ebp-456],dword867
	mov	dword875,[ebp-448]
	sal	dword875,2
	add	dword875,[ebp-456]
	mov	dword879,[ebp-452]
	sal	dword879,2
	sub	dword875,dword879
	mov	[ebp-460],dword875
label0024:
	mov	dword945,[ebp-436]
	mov	[ebp-500],dword945
	mov	dword944,[ebp-440]
	mov	[ebp-504],dword944
; start of inline function _tex2d
	mov	dword949,dword ptr [__texture_width]
	dec	dword949
	int2float	dword949
	fmul	dword ptr [ebp-504]
	float2int	dword951
	mov	[ebp-508],dword951
	mov	dword955,dword ptr [__texture_height]
	dec	dword955
	int2float	dword955
	fmul	dword ptr [ebp-500]
	float2int	dword957
	mov	[ebp-512],dword957
	mov	dword961,[ebp-512]
	imul	dword961,dword ptr [__texture_width]
	add	dword961,[ebp-508]
	sal	dword961,2
	add	dword961,dword ptr [__texture_data]
	mov	dword965,[dword961]
	mov	[ebp-516],dword965
label0028:
; end of inline function _tex2d
	mov	dword883,[ebp-516]
	mov	[ebp-464],dword883
	mov	dword887,[ebp-464]
	sar	dword887,24
	and	dword887,255
	mov	[ebp-492],dword887
	cmp	dword ptr [ebp-492],0
	je	label0027
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword895,[ebp-456]
	mov	dword897,[dword895]
	mov	[ebp-480],dword897
	mov	dword900,[ebp-480]
	and	dword900,65280
	sar	dword900,8
	mov	[ebp-484],dword900
	mov	dword905,[ebp-480]
	and	dword905,255
	mov	[ebp-488],dword905
	mov	dword909,[ebp-464]
	and	dword909,65280
	sar	dword909,8
	mov	[ebp-472],dword909
	mov	dword914,[ebp-464]
	and	dword914,255
	mov	[ebp-476],dword914
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword920
	mov	[ebp-472],dword920
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword926
	mov	[ebp-476],dword926
	mov	dword930,[ebp-472]
	sal	dword930,8
	add	dword930,[ebp-476]
	mov	[ebp-468],dword930
	mov	dword934,[ebp-456]
	mov	dword936,[ebp-468]
	mov	[dword934],dword936
label0027:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0025:
	add	dword ptr [ebp-456],4
	mov	dword943,[ebp-456]
	cmp	dword943,[ebp-460]
	jl	label0024
label0026:
label0029:
; end of inline function _rasterize_horiz_line
	jmp	label0023
label0022:
	mov	dword972,[ebp-392]
	mov	[ebp-428],dword972
	mov	dword971,[ebp-396]
	mov	[ebp-432],dword971
	mov	dword970,[ebp-400]
	mov	[ebp-436],dword970
	mov	dword969,[ebp-404]
	mov	[ebp-440],dword969
	mov	dword968,[ebp-416]
	mov	[ebp-444],dword968
	mov	dword967,[ebp-424]
	mov	[ebp-448],dword967
	mov	dword966,[ebp-420]
	mov	[ebp-452],dword966
; start of inline function _rasterize_horiz_line
	mov	dword976,dword ptr [__pitch]
	imul	dword976,[ebp-444]
	add	dword976,dword ptr [__videomem]
	mov	dword980,[ebp-452]
	sal	dword980,2
	add	dword976,dword980
	mov	[ebp-456],dword976
	mov	dword984,[ebp-448]
	sal	dword984,2
	add	dword984,[ebp-456]
	mov	dword988,[ebp-452]
	sal	dword988,2
	sub	dword984,dword988
	mov	[ebp-460],dword984
label002a:
	mov	dword1054,[ebp-436]
	mov	[ebp-500],dword1054
	mov	dword1053,[ebp-440]
	mov	[ebp-504],dword1053
; start of inline function _tex2d
	mov	dword1058,dword ptr [__texture_width]
	dec	dword1058
	int2float	dword1058
	fmul	dword ptr [ebp-504]
	float2int	dword1060
	mov	[ebp-508],dword1060
	mov	dword1064,dword ptr [__texture_height]
	dec	dword1064
	int2float	dword1064
	fmul	dword ptr [ebp-500]
	float2int	dword1066
	mov	[ebp-512],dword1066
	mov	dword1070,[ebp-512]
	imul	dword1070,dword ptr [__texture_width]
	add	dword1070,[ebp-508]
	sal	dword1070,2
	add	dword1070,dword ptr [__texture_data]
	mov	dword1074,[dword1070]
	mov	[ebp-516],dword1074
label002e:
; end of inline function _tex2d
	mov	dword992,[ebp-516]
	mov	[ebp-464],dword992
	mov	dword996,[ebp-464]
	sar	dword996,24
	and	dword996,255
	mov	[ebp-492],dword996
	cmp	dword ptr [ebp-492],0
	je	label002d
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword1004,[ebp-456]
	mov	dword1006,[dword1004]
	mov	[ebp-480],dword1006
	mov	dword1009,[ebp-480]
	and	dword1009,65280
	sar	dword1009,8
	mov	[ebp-484],dword1009
	mov	dword1014,[ebp-480]
	and	dword1014,255
	mov	[ebp-488],dword1014
	mov	dword1018,[ebp-464]
	and	dword1018,65280
	sar	dword1018,8
	mov	[ebp-472],dword1018
	mov	dword1023,[ebp-464]
	and	dword1023,255
	mov	[ebp-476],dword1023
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1029
	mov	[ebp-472],dword1029
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1035
	mov	[ebp-476],dword1035
	mov	dword1039,[ebp-472]
	sal	dword1039,8
	add	dword1039,[ebp-476]
	mov	[ebp-468],dword1039
	mov	dword1043,[ebp-456]
	mov	dword1045,[ebp-468]
	mov	[dword1043],dword1045
label002d:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label002b:
	add	dword ptr [ebp-456],4
	mov	dword1052,[ebp-456]
	cmp	dword1052,[ebp-460]
	jl	label002a
label002c:
label002f:
; end of inline function _rasterize_horiz_line
label0023:
label0030:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword430,[ebp-344]
	add	dword430,4
	mov	dword432,1
	add	dword432,[dword430]
	mov	[ebp-364],dword432
label0010:
label0011:
	mov	dword435,[ebp-340]
	add	dword435,4
	mov	dword438,[dword435]
	cmp	dword438,[ebp-364]
	jle	label0012
	mov	dword440,[ebp-344]
	add	dword440,4
	mov	dword443,[ebp-364]
	sub	dword443,[dword440]
	mov	dword445,[ebp-340]
	mov	dword447,[ebp-344]
	mov	dword448,[dword445]
	sub	dword448,[dword447]
	imul	dword443,dword448
	mov	dword450,[ebp-340]
	add	dword450,4
	mov	dword453,[ebp-344]
	add	dword453,4
	mov	dword455,[dword450]
	sub	dword455,[dword453]
	cdq	dword456
	idiv	dword443,dword455
	mov	dword458,[ebp-344]
	add	dword443,[dword458]
	mov	[ebp-356],dword443
	mov	dword461,[ebp-348]
	add	dword461,4
	mov	dword464,[ebp-364]
	sub	dword464,[dword461]
	mov	dword466,[ebp-340]
	mov	dword468,[ebp-348]
	mov	dword469,[dword466]
	sub	dword469,[dword468]
	imul	dword464,dword469
	mov	dword471,[ebp-340]
	add	dword471,4
	mov	dword474,[ebp-348]
	add	dword474,4
	mov	dword476,[dword471]
	sub	dword476,[dword474]
	cdq	dword477
	idiv	dword464,dword476
	mov	dword479,[ebp-348]
	add	dword464,[dword479]
	mov	[ebp-360],dword464
	mov	dword482,[ebp-344]
	add	dword482,4
	mov	dword485,[ebp-364]
	sub	dword485,[dword482]
	int2float	dword485
	mov	dword487,[ebp-340]
	mov	dword489,[ebp-344]
	fld	dword ptr [dword487+8]
	fsub	dword ptr [dword489+8]
	fmulp
	mov	dword491,[ebp-340]
	add	dword491,4
	mov	dword494,[ebp-344]
	add	dword494,4
	mov	dword496,[dword491]
	sub	dword496,[dword494]
	int2float	dword496
	fdivp
	mov	dword498,[ebp-344]
	fadd	dword ptr [dword498+8]
	fstp	dword ptr [ebp-368]
	mov	dword501,[ebp-348]
	add	dword501,4
	mov	dword504,[ebp-364]
	sub	dword504,[dword501]
	int2float	dword504
	mov	dword506,[ebp-340]
	mov	dword508,[ebp-348]
	fld	dword ptr [dword506+8]
	fsub	dword ptr [dword508+8]
	fmulp
	mov	dword510,[ebp-340]
	add	dword510,4
	mov	dword513,[ebp-348]
	add	dword513,4
	mov	dword515,[dword510]
	sub	dword515,[dword513]
	int2float	dword515
	fdivp
	mov	dword517,[ebp-348]
	fadd	dword ptr [dword517+8]
	fstp	dword ptr [ebp-376]
	mov	dword520,[ebp-344]
	add	dword520,4
	mov	dword523,[ebp-364]
	sub	dword523,[dword520]
	int2float	dword523
	mov	dword525,8
	add	dword525,[ebp-340]
	add	dword525,4
	mov	dword528,8
	add	dword528,[ebp-344]
	add	dword528,4
	fld	dword ptr [dword525]
	fsub	dword ptr [dword528]
	fmulp
	mov	dword531,[ebp-340]
	add	dword531,4
	mov	dword534,[ebp-344]
	add	dword534,4
	mov	dword536,[dword531]
	sub	dword536,[dword534]
	int2float	dword536
	fdivp
	mov	dword538,8
	add	dword538,[ebp-344]
	add	dword538,4
	fadd	dword ptr [dword538]
	fstp	dword ptr [ebp-372]
	mov	dword542,[ebp-348]
	add	dword542,4
	mov	dword545,[ebp-364]
	sub	dword545,[dword542]
	int2float	dword545
	mov	dword547,8
	add	dword547,[ebp-340]
	add	dword547,4
	mov	dword550,8
	add	dword550,[ebp-348]
	add	dword550,4
	fld	dword ptr [dword547]
	fsub	dword ptr [dword550]
	fmulp
	mov	dword553,[ebp-340]
	add	dword553,4
	mov	dword556,[ebp-348]
	add	dword556,4
	mov	dword558,[dword553]
	sub	dword558,[dword556]
	int2float	dword558
	fdivp
	mov	dword560,8
	add	dword560,[ebp-348]
	add	dword560,4
	fadd	dword ptr [dword560]
	fstp	dword ptr [ebp-380]
	mov	dword565,[ebp-360]
	sub	dword565,[ebp-356]
	int2float	dword565
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	dword571,[ebp-360]
	sub	dword571,[ebp-356]
	int2float	dword571
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	mov	dword1083,[ebp-388]
	mov	[ebp-392],dword1083
	mov	dword1082,[ebp-384]
	mov	[ebp-396],dword1082
	mov	dword1081,[ebp-380]
	mov	[ebp-400],dword1081
	mov	dword1080,[ebp-376]
	mov	[ebp-404],dword1080
	mov	dword1079,[ebp-372]
	mov	[ebp-408],dword1079
	mov	dword1078,[ebp-368]
	mov	[ebp-412],dword1078
	mov	dword1077,[ebp-364]
	mov	[ebp-416],dword1077
	mov	dword1076,[ebp-360]
	mov	[ebp-420],dword1076
	mov	dword1075,[ebp-356]
	mov	[ebp-424],dword1075
; start of inline function _rasterize_horiz_line__unordered
	mov	dword1087,[ebp-424]
	cmp	dword1087,[ebp-420]
	jg	label0031
	mov	dword1108,[ebp-392]
	mov	[ebp-428],dword1108
	mov	dword1107,[ebp-396]
	mov	[ebp-432],dword1107
	mov	dword1106,[ebp-408]
	mov	[ebp-436],dword1106
	mov	dword1105,[ebp-412]
	mov	[ebp-440],dword1105
	mov	dword1104,[ebp-416]
	mov	[ebp-444],dword1104
	mov	dword1103,[ebp-420]
	mov	[ebp-448],dword1103
	mov	dword1102,[ebp-424]
	mov	[ebp-452],dword1102
; start of inline function _rasterize_horiz_line
	mov	dword1112,dword ptr [__pitch]
	imul	dword1112,[ebp-444]
	add	dword1112,dword ptr [__videomem]
	mov	dword1116,[ebp-452]
	sal	dword1116,2
	add	dword1112,dword1116
	mov	[ebp-456],dword1112
	mov	dword1120,[ebp-448]
	sal	dword1120,2
	add	dword1120,[ebp-456]
	mov	dword1124,[ebp-452]
	sal	dword1124,2
	sub	dword1120,dword1124
	mov	[ebp-460],dword1120
label0033:
	mov	dword1190,[ebp-436]
	mov	[ebp-500],dword1190
	mov	dword1189,[ebp-440]
	mov	[ebp-504],dword1189
; start of inline function _tex2d
	mov	dword1194,dword ptr [__texture_width]
	dec	dword1194
	int2float	dword1194
	fmul	dword ptr [ebp-504]
	float2int	dword1196
	mov	[ebp-508],dword1196
	mov	dword1200,dword ptr [__texture_height]
	dec	dword1200
	int2float	dword1200
	fmul	dword ptr [ebp-500]
	float2int	dword1202
	mov	[ebp-512],dword1202
	mov	dword1206,[ebp-512]
	imul	dword1206,dword ptr [__texture_width]
	add	dword1206,[ebp-508]
	sal	dword1206,2
	add	dword1206,dword ptr [__texture_data]
	mov	dword1210,[dword1206]
	mov	[ebp-516],dword1210
label0037:
; end of inline function _tex2d
	mov	dword1128,[ebp-516]
	mov	[ebp-464],dword1128
	mov	dword1132,[ebp-464]
	sar	dword1132,24
	and	dword1132,255
	mov	[ebp-492],dword1132
	cmp	dword ptr [ebp-492],0
	je	label0036
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword1140,[ebp-456]
	mov	dword1142,[dword1140]
	mov	[ebp-480],dword1142
	mov	dword1145,[ebp-480]
	and	dword1145,65280
	sar	dword1145,8
	mov	[ebp-484],dword1145
	mov	dword1150,[ebp-480]
	and	dword1150,255
	mov	[ebp-488],dword1150
	mov	dword1154,[ebp-464]
	and	dword1154,65280
	sar	dword1154,8
	mov	[ebp-472],dword1154
	mov	dword1159,[ebp-464]
	and	dword1159,255
	mov	[ebp-476],dword1159
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1165
	mov	[ebp-472],dword1165
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1171
	mov	[ebp-476],dword1171
	mov	dword1175,[ebp-472]
	sal	dword1175,8
	add	dword1175,[ebp-476]
	mov	[ebp-468],dword1175
	mov	dword1179,[ebp-456]
	mov	dword1181,[ebp-468]
	mov	[dword1179],dword1181
label0036:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0034:
	add	dword ptr [ebp-456],4
	mov	dword1188,[ebp-456]
	cmp	dword1188,[ebp-460]
	jl	label0033
label0035:
label0038:
; end of inline function _rasterize_horiz_line
	jmp	label0032
label0031:
	mov	dword1217,[ebp-392]
	mov	[ebp-428],dword1217
	mov	dword1216,[ebp-396]
	mov	[ebp-432],dword1216
	mov	dword1215,[ebp-400]
	mov	[ebp-436],dword1215
	mov	dword1214,[ebp-404]
	mov	[ebp-440],dword1214
	mov	dword1213,[ebp-416]
	mov	[ebp-444],dword1213
	mov	dword1212,[ebp-424]
	mov	[ebp-448],dword1212
	mov	dword1211,[ebp-420]
	mov	[ebp-452],dword1211
; start of inline function _rasterize_horiz_line
	mov	dword1221,dword ptr [__pitch]
	imul	dword1221,[ebp-444]
	add	dword1221,dword ptr [__videomem]
	mov	dword1225,[ebp-452]
	sal	dword1225,2
	add	dword1221,dword1225
	mov	[ebp-456],dword1221
	mov	dword1229,[ebp-448]
	sal	dword1229,2
	add	dword1229,[ebp-456]
	mov	dword1233,[ebp-452]
	sal	dword1233,2
	sub	dword1229,dword1233
	mov	[ebp-460],dword1229
label0039:
	mov	dword1299,[ebp-436]
	mov	[ebp-500],dword1299
	mov	dword1298,[ebp-440]
	mov	[ebp-504],dword1298
; start of inline function _tex2d
	mov	dword1303,dword ptr [__texture_width]
	dec	dword1303
	int2float	dword1303
	fmul	dword ptr [ebp-504]
	float2int	dword1305
	mov	[ebp-508],dword1305
	mov	dword1309,dword ptr [__texture_height]
	dec	dword1309
	int2float	dword1309
	fmul	dword ptr [ebp-500]
	float2int	dword1311
	mov	[ebp-512],dword1311
	mov	dword1315,[ebp-512]
	imul	dword1315,dword ptr [__texture_width]
	add	dword1315,[ebp-508]
	sal	dword1315,2
	add	dword1315,dword ptr [__texture_data]
	mov	dword1319,[dword1315]
	mov	[ebp-516],dword1319
label003d:
; end of inline function _tex2d
	mov	dword1237,[ebp-516]
	mov	[ebp-464],dword1237
	mov	dword1241,[ebp-464]
	sar	dword1241,24
	and	dword1241,255
	mov	[ebp-492],dword1241
	cmp	dword ptr [ebp-492],0
	je	label003c
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword1249,[ebp-456]
	mov	dword1251,[dword1249]
	mov	[ebp-480],dword1251
	mov	dword1254,[ebp-480]
	and	dword1254,65280
	sar	dword1254,8
	mov	[ebp-484],dword1254
	mov	dword1259,[ebp-480]
	and	dword1259,255
	mov	[ebp-488],dword1259
	mov	dword1263,[ebp-464]
	and	dword1263,65280
	sar	dword1263,8
	mov	[ebp-472],dword1263
	mov	dword1268,[ebp-464]
	and	dword1268,255
	mov	[ebp-476],dword1268
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1274
	mov	[ebp-472],dword1274
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1280
	mov	[ebp-476],dword1280
	mov	dword1284,[ebp-472]
	sal	dword1284,8
	add	dword1284,[ebp-476]
	mov	[ebp-468],dword1284
	mov	dword1288,[ebp-456]
	mov	dword1290,[ebp-468]
	mov	[dword1288],dword1290
label003c:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label003a:
	add	dword ptr [ebp-456],4
	mov	dword1297,[ebp-456]
	cmp	dword1297,[ebp-460]
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
