
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
___unnamed_double_0	dq	0.000100
public	___unnamed_double_0
___unnamed_float_1	dd	2.000000
public	___unnamed_float_1
___unnamed_float_2	dd	-1.000000
public	___unnamed_float_2
___unnamed_float_3	dd	255.000000
public	___unnamed_float_3

.code

_vec2f_add proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2]
	fadd	dword ptr [dword4]
	mov	dword6,[ebp+8]
	fstp	dword ptr [dword6]
	mov	dword8,[ebp+12]
	mov	dword10,[ebp+16]
	fld	dword ptr [dword8+4]
	fadd	dword ptr [dword10+4]
	mov	dword12,[ebp+8]
	fstp	dword ptr [dword12+4]
	destroy_stack_frame
	ret
_vec2f_add endp	

_vec2f_subtract proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2]
	fsub	dword ptr [dword4]
	mov	dword6,[ebp+8]
	fstp	dword ptr [dword6]
	mov	dword8,[ebp+12]
	mov	dword10,[ebp+16]
	fld	dword ptr [dword8+4]
	fsub	dword ptr [dword10+4]
	mov	dword12,[ebp+8]
	fstp	dword ptr [dword12+4]
	destroy_stack_frame
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld	dword ptr [dword2]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword2]
	mov	dword5,[ebp+8]
	fld	dword ptr [dword5+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword5+4]
	destroy_stack_frame
	ret
_vec2f_mul endp	

_vec4f_assign proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld	dword ptr [ebp+12]
	fstp	dword ptr [dword2]
	mov	dword5,[ebp+8]
	fld	dword ptr [ebp+16]
	fstp	dword ptr [dword5+4]
	mov	dword8,[ebp+8]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [dword8+8]
	mov	dword11,[ebp+8]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [dword11+12]
	destroy_stack_frame
	ret
_vec4f_assign endp	

_vec4f_add proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2]
	fadd	dword ptr [dword4]
	mov	dword6,[ebp+8]
	fstp	dword ptr [dword6]
	mov	dword8,[ebp+12]
	mov	dword10,[ebp+16]
	fld	dword ptr [dword8+4]
	fadd	dword ptr [dword10+4]
	mov	dword12,[ebp+8]
	fstp	dword ptr [dword12+4]
	mov	dword14,[ebp+12]
	mov	dword16,[ebp+16]
	fld	dword ptr [dword14+8]
	fadd	dword ptr [dword16+8]
	mov	dword18,[ebp+8]
	fstp	dword ptr [dword18+8]
	mov	dword20,[ebp+12]
	mov	dword22,[ebp+16]
	fld	dword ptr [dword20+12]
	fadd	dword ptr [dword22+12]
	mov	dword24,[ebp+8]
	fstp	dword ptr [dword24+12]
	destroy_stack_frame
	ret
_vec4f_add endp	

_vec4f_subtract proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2]
	fsub	dword ptr [dword4]
	mov	dword6,[ebp+8]
	fstp	dword ptr [dword6]
	mov	dword8,[ebp+12]
	mov	dword10,[ebp+16]
	fld	dword ptr [dword8+4]
	fsub	dword ptr [dword10+4]
	mov	dword12,[ebp+8]
	fstp	dword ptr [dword12+4]
	mov	dword14,[ebp+12]
	mov	dword16,[ebp+16]
	fld	dword ptr [dword14+8]
	fsub	dword ptr [dword16+8]
	mov	dword18,[ebp+8]
	fstp	dword ptr [dword18+8]
	mov	dword20,[ebp+12]
	mov	dword22,[ebp+16]
	fld	dword ptr [dword20+12]
	fsub	dword ptr [dword22+12]
	mov	dword24,[ebp+8]
	fstp	dword ptr [dword24+12]
	destroy_stack_frame
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	create_stack_frame
	mov	dword2,[ebp+8]
	mov	dword4,[ebp+12]
	fld	dword ptr [dword2+4]
	fmul	dword ptr [dword4+4]
	mov	dword6,[ebp+8]
	mov	dword8,[ebp+12]
	fld	dword ptr [dword6]
	fmul	dword ptr [dword8]
	faddp
	mov	dword10,[ebp+8]
	mov	dword12,[ebp+12]
	fld	dword ptr [dword10+8]
	fmul	dword ptr [dword12+8]
	faddp
	mov	dword14,[ebp+8]
	mov	dword16,[ebp+12]
	fld	dword ptr [dword14+12]
	fmul	dword ptr [dword16+12]
	faddp
	set_retvalp
	destroy_stack_frame
	ret
_vec4f_dot endp	

_vec4f_mul proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld	dword ptr [dword2]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword2]
	mov	dword5,[ebp+8]
	fld	dword ptr [dword5+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword5+4]
	mov	dword8,[ebp+8]
	fld	dword ptr [dword8+8]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword8+8]
	mov	dword11,[ebp+8]
	fld	dword ptr [dword11+12]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword11+12]
	destroy_stack_frame
	ret
_vec4f_mul endp	

_matrix4f_make_perspective proc
	create_stack_frame
	fld	dword ptr [ebp+20]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp-4]
	fmul	dword ptr [ebp+24]
	fstp	dword ptr [ebp-8]
	mov	dword8,[ebp+8]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-8]
	fstp	dword ptr [dword8]
	mov	dword12,[ebp+8]
	fldz
	fstp	dword ptr [dword12+4]
	mov	dword14,[ebp+8]
	fldz
	fstp	dword ptr [dword14+8]
	mov	dword16,[ebp+8]
	fldz
	fstp	dword ptr [dword16+12]
	mov	dword18,[ebp+8]
	fldz
	fstp	dword ptr [dword18+16]
	mov	dword20,[ebp+8]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-4]
	fstp	dword ptr [dword20+20]
	mov	dword24,[ebp+8]
	fldz
	fstp	dword ptr [dword24+24]
	mov	dword26,[ebp+8]
	fldz
	fstp	dword ptr [dword26+28]
	mov	dword28,[ebp+8]
	fldz
	fstp	dword ptr [dword28+32]
	mov	dword30,[ebp+8]
	fldz
	fstp	dword ptr [dword30+36]
	mov	dword32,[ebp+8]
	fld	dword ptr [ebp+16]
	fsub	dword ptr [ebp+12]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [dword32+40]
	mov	dword37,[ebp+8]
	fld1
	fstp	dword ptr [dword37+44]
	mov	dword39,[ebp+8]
	fldz
	fstp	dword ptr [dword39+48]
	mov	dword41,[ebp+8]
	fldz
	fstp	dword ptr [dword41+52]
	mov	dword43,[ebp+8]
	fld	dword ptr [ebp+12]
	fmul	dword ptr [ebp+16]
	fld	dword ptr [ebp+12]
	fsub	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [dword43+56]
	mov	dword49,[ebp+8]
	fldz
	fstp	dword ptr [dword49+60]
	destroy_stack_frame
	ret
_matrix4f_make_perspective endp	

_matrix4f_make_viewport proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [dword2]
	mov	dword6,[ebp+8]
	fldz
	fstp	dword ptr [dword6+4]
	mov	dword8,[ebp+8]
	fldz
	fstp	dword ptr [dword8+8]
	mov	dword10,[ebp+8]
	fldz
	fstp	dword ptr [dword10+12]
	mov	dword12,[ebp+8]
	fldz
	fstp	dword ptr [dword12+16]
	mov	dword14,[ebp+8]
	fld	dword ptr [ebp+16]
	fldz
	fsubrp
	fld	dword ptr [___unnamed_float_1]
	fdivp
	fstp	dword ptr [dword14+20]
	mov	dword18,[ebp+8]
	fldz
	fstp	dword ptr [dword18+24]
	mov	dword20,[ebp+8]
	fldz
	fstp	dword ptr [dword20+28]
	mov	dword22,[ebp+8]
	fldz
	fstp	dword ptr [dword22+32]
	mov	dword24,[ebp+8]
	fldz
	fstp	dword ptr [dword24+36]
	mov	dword26,[ebp+8]
	fld	dword ptr [ebp+24]
	fsub	dword ptr [ebp+20]
	fstp	dword ptr [dword26+40]
	mov	dword30,[ebp+8]
	fldz
	fstp	dword ptr [dword30+44]
	mov	dword32,[ebp+8]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [dword32+48]
	mov	dword36,[ebp+8]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [dword36+52]
	mov	dword40,[ebp+8]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [dword40+56]
	mov	dword43,[ebp+8]
	fld1
	fstp	dword ptr [dword43+60]
	destroy_stack_frame
	ret
_matrix4f_make_viewport endp	

_matrix4f_transform proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2+4]
	fmul	dword ptr [dword4+16]
	mov	dword6,[ebp+12]
	mov	dword8,[ebp+16]
	fld	dword ptr [dword6]
	fmul	dword ptr [dword8]
	faddp
	mov	dword10,[ebp+12]
	mov	dword12,[ebp+16]
	fld	dword ptr [dword10+8]
	fmul	dword ptr [dword12+32]
	faddp
	mov	dword14,[ebp+12]
	mov	dword16,[ebp+16]
	fld	dword ptr [dword14+12]
	fmul	dword ptr [dword16+48]
	faddp
	mov	dword18,[ebp+8]
	fstp	dword ptr [dword18]
	mov	dword20,[ebp+16]
	mov	dword22,[ebp+12]
	fld	dword ptr [dword22]
	fmul	dword ptr [dword20+4]
	mov	dword24,[ebp+12]
	mov	dword26,[ebp+16]
	fld	dword ptr [dword24+4]
	fmul	dword ptr [dword26+20]
	faddp
	mov	dword28,[ebp+12]
	mov	dword30,[ebp+16]
	fld	dword ptr [dword28+8]
	fmul	dword ptr [dword30+36]
	faddp
	mov	dword32,[ebp+12]
	mov	dword34,[ebp+16]
	fld	dword ptr [dword32+12]
	fmul	dword ptr [dword34+52]
	faddp
	mov	dword36,[ebp+8]
	fstp	dword ptr [dword36+4]
	mov	dword38,[ebp+16]
	mov	dword40,[ebp+12]
	fld	dword ptr [dword40]
	fmul	dword ptr [dword38+8]
	mov	dword42,[ebp+12]
	mov	dword44,[ebp+16]
	fld	dword ptr [dword42+4]
	fmul	dword ptr [dword44+24]
	faddp
	mov	dword46,[ebp+12]
	mov	dword48,[ebp+16]
	fld	dword ptr [dword46+8]
	fmul	dword ptr [dword48+40]
	faddp
	mov	dword50,[ebp+12]
	mov	dword52,[ebp+16]
	fld	dword ptr [dword50+12]
	fmul	dword ptr [dword52+56]
	faddp
	mov	dword54,[ebp+8]
	fstp	dword ptr [dword54+8]
	mov	dword56,[ebp+16]
	mov	dword58,[ebp+12]
	fld	dword ptr [dword58]
	fmul	dword ptr [dword56+12]
	mov	dword60,[ebp+12]
	mov	dword62,[ebp+16]
	fld	dword ptr [dword60+4]
	fmul	dword ptr [dword62+28]
	faddp
	mov	dword64,[ebp+12]
	mov	dword66,[ebp+16]
	fld	dword ptr [dword64+8]
	fmul	dword ptr [dword66+44]
	faddp
	mov	dword68,[ebp+12]
	mov	dword70,[ebp+16]
	fld	dword ptr [dword68+12]
	fmul	dword ptr [dword70+60]
	faddp
	mov	dword72,[ebp+8]
	fstp	dword ptr [dword72+12]
	destroy_stack_frame
	ret
_matrix4f_transform endp	

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
	float2int	dword5
	mov	[ebp-4],dword5
	mov	dword9,dword ptr [__texture_height]
	dec	dword9
	int2float	dword9
	fmul	dword ptr [ebp+12]
	float2int	dword11
	mov	[ebp-8],dword11
	mov	dword15,[ebp-8]
	imul	dword15,dword ptr [__texture_width]
	add	dword15,[ebp-4]
	sal	dword15,2
	add	dword15,dword ptr [__texture_data]
	set_retval	dword ptr [dword15]
	destroy_stack_frame
	ret
__tex2d endp	

__rasterize_horiz_line proc
	create_stack_frame
	mov	dword3,dword ptr [__pitch]
	imul	dword3,[ebp+16]
	add	dword3,dword ptr [__videomem]
	mov	dword7,[ebp+8]
	sal	dword7,2
	add	dword3,dword7
	mov	[ebp-4],dword3
	mov	dword11,[ebp+12]
	sal	dword11,2
	add	dword11,[ebp-4]
	mov	dword15,[ebp+8]
	sal	dword15,2
	sub	dword11,dword15
	mov	[ebp-8],dword11
label0000:
	push_all
	push_arg	dword ptr [ebp+24],4
	push_arg	dword ptr [ebp+20],4
	call	__tex2d
	restore_stack	8
	pop_all
	read_retval	dword19
	mov	[ebp-12],dword19
	mov	dword23,[ebp-12]
	sar	dword23,24
	and	dword23,255
	mov	[ebp-40],dword23
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	dword31,[ebp-4]
	mov	dword33,[dword31]
	mov	[ebp-28],dword33
	mov	dword36,[ebp-28]
	and	dword36,65280
	sar	dword36,8
	mov	[ebp-32],dword36
	mov	dword41,[ebp-28]
	and	dword41,255
	mov	[ebp-36],dword41
	mov	dword45,[ebp-12]
	and	dword45,65280
	sar	dword45,8
	mov	[ebp-20],dword45
	mov	dword50,[ebp-12]
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
	mov	dword66,[ebp-20]
	sal	dword66,8
	add	dword66,[ebp-24]
	mov	[ebp-16],dword66
	mov	dword70,[ebp-4]
	mov	dword72,[ebp-16]
	mov	[dword70],dword72
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	dword ptr [ebp-4],4
	mov	dword79,[ebp-4]
	cmp	dword79,[ebp-8]
	jl	label0000
label0002:
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	create_stack_frame
	mov	dword3,[ebp+8]
	cmp	dword3,[ebp+12]
	jg	label0000
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	push_arg	dword ptr [ebp+24],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+16],4
	push_arg	dword ptr [ebp+12],4
	push_arg	dword ptr [ebp+8],4
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
	push_arg	dword ptr [ebp+16],4
	push_arg	dword ptr [ebp+8],4
	push_arg	dword ptr [ebp+12],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0001:
	destroy_stack_frame
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	create_stack_frame
	mov	dword3,[ebp+8]
	cmp	dword3,[ebp+12]
	jge	label0000
	mov	dword6,[ebp+16]
	cmp	dword6,[ebp+12]
	jle	label0001
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	mov	dword10,[ebp+24]
	push_arg	dword ptr [dword10+4],4
	mov	dword12,[ebp+24]
	push_arg	dword ptr [dword12],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+16],4
	push_arg	dword ptr [ebp+8],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0002
label0001:
	mov	dword18,[ebp+16]
	cmp	dword18,[ebp+8]
	jge	label0003
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	mov	dword22,[ebp+32]
	push_arg	dword ptr [dword22+4],4
	mov	dword24,[ebp+32]
	push_arg	dword ptr [dword24],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+12],4
	push_arg	dword ptr [ebp+16],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0004
label0003:
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	mov	dword31,[ebp+24]
	push_arg	dword ptr [dword31+4],4
	mov	dword33,[ebp+24]
	push_arg	dword ptr [dword33],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+12],4
	push_arg	dword ptr [ebp+8],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0004:
label0002:
	jmp	label0005
label0000:
	mov	dword39,[ebp+16]
	cmp	dword39,[ebp+12]
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
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+8],4
	push_arg	dword ptr [ebp+16],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0007
label0006:
	mov	dword51,[ebp+16]
	cmp	dword51,[ebp+8]
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
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+16],4
	push_arg	dword ptr [ebp+12],4
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
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+8],4
	push_arg	dword ptr [ebp+12],4
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
	push_all
	fldz
	push_arg	sse1,4
	fldz
	push_arg	sse2,4
	mov	dword66,8
	add	dword66,[ebp+16]
	push_arg	dword66,4
	mov	dword68,8
	add	dword68,[ebp+12]
	push_arg	dword68,4
	mov	dword70,8
	add	dword70,[ebp+8]
	push_arg	dword70,4
	mov	dword72,[ebp+8]
	add	dword72,4
	push_arg	dword ptr [dword72],4
	mov	dword75,[ebp+16]
	push_arg	dword ptr [dword75],4
	mov	dword77,[ebp+12]
	push_arg	dword ptr [dword77],4
	mov	dword79,[ebp+8]
	push_arg	dword ptr [dword79],4
	call	__rasterize_triangle_1i
	restore_stack	36
	pop_all
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
	push_all
	push_arg	dword ptr [ebp-40],4
	push_arg	dword ptr [ebp-36],4
	mov	dword324,8
	add	dword324,[ebp+12]
	add	dword324,4
	push_arg	dword ptr [dword324],4
	mov	dword327,[ebp+12]
	push_arg	dword ptr [dword327+8],4
	push_arg	dword ptr [ebp-32],4
	push_arg	dword ptr [ebp-28],4
	mov	dword331,[ebp+12]
	add	dword331,4
	push_arg	dword ptr [dword331],4
	mov	dword334,[ebp+12]
	push_arg	dword ptr [dword334],4
	push_arg	dword ptr [ebp-12],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
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
	mov	dword2,[ebp+8]
	mov	dword ptr [dword2+192],0
	mov	dword5,[ebp+12]
	mov	[ebp-4],dword5
	mov	dword8,[ebp+12]
	add	dword8,24
	mov	[ebp-8],dword8
label0000:
label0001:
	mov	dword12,[ebp+12]
	mov	dword14,[dword12+192]
	imul	dword14,24
	mov	dword16,[ebp+12]
	add	dword16,dword14
	cmp	dword16,[ebp-8]
	jle	label0002
	push_all
	push_arg	dword ptr [ebp+16],4
	mov	dword20,[ebp-4]
	push_arg	dword20,4
	lea	dword21,[ebp-24]
	push_arg	dword21,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword23,[ebp-24]
	push_arg	dword23,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fstp	dword ptr [ebp-52]
	push_all
	push_arg	dword ptr [ebp+16],4
	mov	dword27,[ebp-8]
	push_arg	dword27,4
	lea	dword28,[ebp-24]
	push_arg	dword28,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword30,[ebp-24]
	push_arg	dword30,4
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
	mov	dword34,[ebp+8]
	mov	dword35,[dword34+192]
	inc	dword ptr [dword34+192]
	imul	dword35,24
	mov	dword38,[ebp+8]
	add	dword38,dword35
	mov	dword40,[ebp-4]
	mov	dword41,[dword40]
	mov	dword42,[dword40+4]
	mov	[dword38],dword41
	mov	[dword38+4],dword42
	mov	dword41,[dword40+8]
	mov	dword42,[dword40+12]
	mov	[dword38+8],dword41
	mov	[dword38+12],dword42
	mov	dword41,[dword40+16]
	mov	dword42,[dword40+20]
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
	push_all
	mov	dword48,[ebp-4]
	push_arg	dword48,4
	push_arg	dword ptr [ebp+16],4
	lea	dword50,[ebp-24]
	push_arg	dword50,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	mov	dword52,[ebp-4]
	push_arg	dword52,4
	mov	dword54,[ebp-8]
	push_arg	dword54,4
	lea	dword55,[ebp-40]
	push_arg	dword55,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword57,[ebp-24]
	push_arg	dword57,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword59,[ebp-40]
	push_arg	dword59,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fdivp
	fstp	dword ptr [ebp-60]
	push_all
	push_arg	dword ptr [ebp-60],4
	lea	dword62,[ebp-40]
	push_arg	dword62,4
	call	_vec4f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword63,[ebp-40]
	push_arg	dword63,4
	mov	dword65,[ebp-4]
	push_arg	dword65,4
	mov	dword67,[ebp+8]
	mov	dword69,[dword67+192]
	imul	dword69,24
	mov	dword71,[ebp+8]
	add	dword71,dword69
	push_arg	dword71,4
	call	_vec4f_add
	restore_stack	12
	pop_all
	push_all
	mov	dword73,16
	add	dword73,[ebp-4]
	push_arg	dword73,4
	mov	dword75,16
	add	dword75,[ebp-8]
	push_arg	dword75,4
	lea	dword76,[ebp-48]
	push_arg	dword76,4
	call	_vec2f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp-60],4
	lea	dword78,[ebp-48]
	push_arg	dword78,4
	call	_vec2f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword79,[ebp-48]
	push_arg	dword79,4
	mov	dword81,16
	add	dword81,[ebp-4]
	push_arg	dword81,4
	mov	dword83,[ebp+8]
	mov	dword85,[dword83+192]
	imul	dword85,24
	mov	dword87,[ebp+8]
	add	dword87,dword85
	add	dword87,16
	push_arg	dword87,4
	call	_vec2f_add
	restore_stack	12
	pop_all
	mov	dword90,[ebp+8]
	inc	dword ptr [dword90+192]
label0004:
	add	dword ptr [ebp-4],24
	add	dword ptr [ebp-8],24
	jmp	label0001
label0002:
	mov	dword94,[ebp+8]
	mov	dword95,[dword94+192]
	inc	dword ptr [dword94+192]
	imul	dword95,24
	mov	dword98,[ebp+8]
	add	dword98,dword95
	mov	dword100,[ebp+8]
	mov	dword101,[dword100]
	mov	dword102,[dword100+4]
	mov	[dword98],dword101
	mov	[dword98+4],dword102
	mov	dword101,[dword100+8]
	mov	dword102,[dword100+12]
	mov	[dword98+8],dword101
	mov	[dword98+12],dword102
	mov	dword101,[dword100+16]
	mov	dword102,[dword100+20]
	mov	[dword98+16],dword101
	mov	[dword98+20],dword102
	destroy_stack_frame
	ret
__clip_on_plain endp	

__clip_poligon proc
	create_stack_frame
	push_all
	lea	dword1,dword ptr [__clip_z_far_norm]
	push_arg	dword1,4
	lea	dword2,dword ptr [__clip_z_far_base]
	push_arg	dword2,4
	push_arg	dword ptr [ebp+8],4
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
	push_arg	dword ptr [ebp+8],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword9,dword ptr [__clip_plane_left_norm]
	push_arg	dword9,4
	lea	dword10,dword ptr [__clip_plane_left_base]
	push_arg	dword10,4
	push_arg	dword ptr [ebp+8],4
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
	push_arg	dword ptr [ebp+8],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword17,dword ptr [__clip_plane_top_norm]
	push_arg	dword17,4
	lea	dword18,dword ptr [__clip_plane_top_base]
	push_arg	dword18,4
	push_arg	dword ptr [ebp+8],4
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
	push_arg	dword ptr [ebp+8],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	mov	dword26,[ebp+8]
	cmp	dword ptr [dword26+192],1
	setg	byte1
	movzx	dword28,byte1
	set_retval	dword28
	destroy_stack_frame
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	create_stack_frame
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
	mov	dword11,[ebp+8]
	mov	[dword11],dword9
	lea	dword12,[ebp-16]
	add	dword12,4
	fld	dword ptr [dword12]
	fmul	dword ptr [ebp-20]
	float2int	dword15
	mov	dword17,[ebp+8]
	mov	[dword17+4],dword15
	mov	dword19,[ebp+8]
	cmp	dword ptr [dword19],0
	jl	label0001
	mov	dword22,[ebp+8]
	mov	dword24,[dword22]
	cmp	dword24,dword ptr [__width]
	jge	label0001
	mov	dword26,[ebp+8]
	cmp	dword ptr [dword26+4],0
	jl	label0001
	mov	dword29,[ebp+8]
	mov	dword31,[dword29+4]
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
	push_all
	push_arg	dword ptr [ebp+8],4
	call	__clip_poligon
	restore_stack	4
	pop_all
	read_retval	dword2
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
	push_all
	mov	dword15,[ebp+8]
	mov	dword18,[ebp-136]
	imul	dword18,24
	add	dword15,dword18
	push_arg	dword15,4
	lea	dword19,[ebp-132]
	mov	dword22,[ebp-136]
	sal	dword22,4
	add	dword19,dword22
	push_arg	dword19,4
	call	__transform_to_screen_space
	restore_stack	8
	pop_all
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
	push_all
	lea	dword44,[ebp-132]
	mov	dword47,[ebp-136]
	sal	dword47,4
	add	dword44,dword47
	push_arg	dword44,4
	mov	dword50,[ebp-136]
	dec	dword50
	sal	dword50,4
	lea	dword52,[ebp-132]
	add	dword52,dword50
	push_arg	dword52,4
	lea	dword53,[ebp-132]
	push_arg	dword53,4
	call	__rasterize_triangle_2i
	restore_stack	12
	pop_all
	inc	dword ptr [ebp-136]
	jmp	label0006
label0007:
	destroy_stack_frame
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	create_stack_frame
	push_all
	fld1
	push_arg	sse1,4
	mov	dword2,[ebp+12]
	push_arg	dword ptr [dword2+8],4
	mov	dword4,[ebp+12]
	push_arg	dword ptr [dword4+4],4
	mov	dword6,[ebp+12]
	push_arg	dword ptr [dword6],4
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
