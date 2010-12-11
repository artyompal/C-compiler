
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
	set_retvalp
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
	push_arg	sse1,4
	lea	dword15,[ebp+32]
	push_arg	dword ptr [dword15],4
	lea	dword16,[ebp+28]
	push_arg	dword ptr [dword16],4
	lea	dword17,[ebp+24]
	push_arg	dword ptr [dword17],4
	lea	dword18,dword ptr [__mvproj_matrix]
	push_arg	dword18,4
	call	_matrix4f_make_perspective
	restore_stack	20
	pop_all
	push_all
	lea	dword19,[ebp+28]
	push_arg	dword ptr [dword19],4
	lea	dword20,[ebp+24]
	push_arg	dword ptr [dword20],4
	lea	dword21,[ebp+16]
	fild	dword ptr [dword21]
	push_arg	sse20,4
	lea	dword22,[ebp+12]
	fild	dword ptr [dword22]
	push_arg	sse20,4
	lea	dword23,dword ptr [__viewport_matrix]
	push_arg	dword23,4
	call	_matrix4f_make_viewport
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse2,4
	lea	dword24,[ebp+24]
	push_arg	dword ptr [dword24],4
	fldz
	push_arg	sse3,4
	fldz
	push_arg	sse4,4
	lea	dword25,dword ptr [__clip_z_near_base]
	push_arg	dword25,4
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
	push_arg	sse7,4
	lea	dword31,[ebp-4]
	push_arg	dword ptr [dword31],4
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
	lea	dword33,[ebp+28]
	push_arg	dword ptr [dword33],4
	fldz
	push_arg	sse11,4
	fldz
	push_arg	sse12,4
	lea	dword34,dword ptr [__clip_z_far_base]
	push_arg	dword34,4
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
	push_arg	sse15,4
	lea	dword40,[ebp-8]
	push_arg	dword ptr [dword40],4
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
	lea	dword42,[ebp+12]
	fild	dword ptr [dword42]
	fld1
	fdivrp
	lea	dword43,dword ptr [___unnamed_float_2]
	fld	dword ptr [dword43]
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
	lea	dword46,[ebp+12]
	fild	dword ptr [dword46]
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
	lea	dword48,dword ptr [___unnamed_float_2]
	fld	dword ptr [dword48]
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
	lea	dword50,[ebp+16]
	fild	dword ptr [dword50]
	fld1
	fdivrp
	lea	dword51,dword ptr [___unnamed_float_2]
	fld	dword ptr [dword51]
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
	lea	dword55,dword ptr [___unnamed_float_2]
	fld	dword ptr [dword55]
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
	set_retval	dword ptr [dword15]
	destroy_stack_frame
	ret
__tex2d endp	

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
	push_arg	dword ptr [dword17],4
	lea	dword18,[ebp+20]
	push_arg	dword ptr [dword18],4
	call	__tex2d
	restore_stack	8
	pop_all
	read_retval	dword19
	lea	dword20,[ebp-12]
	mov	[dword20],dword19
	lea	dword21,[ebp-12]
	mov	dword22,24
	mov	dword23,[dword21]
	sar	dword23,dword22
	mov	dword24,255
	and	dword23,dword24
	lea	dword25,[ebp-40]
	mov	[dword25],dword23
	lea	dword26,[ebp-40]
	cmp	dword ptr [dword26],0
	je	label0003
	lea	dword27,[ebp-40]
	fild	dword ptr [dword27]
	lea	dword28,dword ptr [___unnamed_float_3]
	fld	dword ptr [dword28]
	fdivp
	lea	dword29,[ebp-44]
	fstp	dword ptr [dword29]
	lea	dword30,[ebp-4]
	mov	dword31,[dword30]
	lea	dword32,[ebp-28]
	mov	dword33,[dword31]
	mov	[dword32],dword33
	lea	dword34,[ebp-28]
	mov	dword35,65280
	mov	dword36,[dword34]
	and	dword36,dword35
	mov	dword37,8
	sar	dword36,dword37
	lea	dword38,[ebp-32]
	mov	[dword38],dword36
	lea	dword39,[ebp-28]
	mov	dword40,255
	mov	dword41,[dword39]
	and	dword41,dword40
	lea	dword42,[ebp-36]
	mov	[dword42],dword41
	lea	dword43,[ebp-12]
	mov	dword44,65280
	mov	dword45,[dword43]
	and	dword45,dword44
	mov	dword46,8
	sar	dword45,dword46
	lea	dword47,[ebp-20]
	mov	[dword47],dword45
	lea	dword48,[ebp-12]
	mov	dword49,255
	mov	dword50,[dword48]
	and	dword50,dword49
	lea	dword51,[ebp-24]
	mov	[dword51],dword50
	lea	dword52,[ebp-20]
	fild	dword ptr [dword52]
	lea	dword53,[ebp-44]
	fmul	dword ptr [dword53]
	lea	dword54,[ebp-32]
	fild	dword ptr [dword54]
	fld1
	lea	dword55,[ebp-44]
	fsub	dword ptr [dword55]
	fmulp
	faddp
	float2int	dword56
	lea	dword57,[ebp-20]
	mov	[dword57],dword56
	lea	dword58,[ebp-24]
	fild	dword ptr [dword58]
	lea	dword59,[ebp-44]
	fmul	dword ptr [dword59]
	lea	dword60,[ebp-36]
	fild	dword ptr [dword60]
	fld1
	lea	dword61,[ebp-44]
	fsub	dword ptr [dword61]
	fmulp
	faddp
	float2int	dword62
	lea	dword63,[ebp-24]
	mov	[dword63],dword62
	lea	dword64,[ebp-20]
	mov	dword65,8
	mov	dword66,[dword64]
	sal	dword66,dword65
	lea	dword67,[ebp-24]
	add	dword66,[dword67]
	lea	dword68,[ebp-16]
	mov	[dword68],dword66
	lea	dword69,[ebp-4]
	mov	dword70,[dword69]
	lea	dword71,[ebp-16]
	mov	dword72,[dword71]
	mov	[dword70],dword72
label0003:
	lea	dword73,[ebp+20]
	lea	dword74,[ebp+28]
	fld	dword ptr [dword73]
	fadd	dword ptr [dword74]
	fstp	dword ptr [dword73]
	lea	dword75,[ebp+24]
	lea	dword76,[ebp+32]
	fld	dword ptr [dword75]
	fadd	dword ptr [dword76]
	fstp	dword ptr [dword75]
label0001:
	lea	dword77,[ebp-4]
	add	dword ptr [dword77],4
	lea	dword78,[ebp-8]
	mov	dword79,[dword77]
	cmp	dword79,[dword78]
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
	push_arg	dword ptr [dword4],4
	lea	dword5,[ebp+36]
	push_arg	dword ptr [dword5],4
	lea	dword6,[ebp+24]
	push_arg	dword ptr [dword6],4
	lea	dword7,[ebp+20]
	push_arg	dword ptr [dword7],4
	lea	dword8,[ebp+16]
	push_arg	dword ptr [dword8],4
	lea	dword9,[ebp+12]
	push_arg	dword ptr [dword9],4
	lea	dword10,[ebp+8]
	push_arg	dword ptr [dword10],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0001
label0000:
	push_all
	lea	dword11,[ebp+40]
	push_arg	dword ptr [dword11],4
	lea	dword12,[ebp+36]
	push_arg	dword ptr [dword12],4
	lea	dword13,[ebp+32]
	push_arg	dword ptr [dword13],4
	lea	dword14,[ebp+28]
	push_arg	dword ptr [dword14],4
	lea	dword15,[ebp+16]
	push_arg	dword ptr [dword15],4
	lea	dword16,[ebp+8]
	push_arg	dword ptr [dword16],4
	lea	dword17,[ebp+12]
	push_arg	dword ptr [dword17],4
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
	push_arg	dword ptr [dword7],4
	lea	dword8,[ebp+36]
	push_arg	dword ptr [dword8],4
	lea	dword9,[ebp+24]
	mov	dword10,4
	add	dword10,[dword9]
	push_arg	dword ptr [dword10],4
	lea	dword11,[ebp+24]
	mov	dword12,[dword11]
	push_arg	dword ptr [dword12],4
	lea	dword13,[ebp+20]
	push_arg	dword ptr [dword13],4
	lea	dword14,[ebp+16]
	push_arg	dword ptr [dword14],4
	lea	dword15,[ebp+8]
	push_arg	dword ptr [dword15],4
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
	push_arg	dword ptr [dword19],4
	lea	dword20,[ebp+36]
	push_arg	dword ptr [dword20],4
	lea	dword21,[ebp+32]
	mov	dword22,4
	add	dword22,[dword21]
	push_arg	dword ptr [dword22],4
	lea	dword23,[ebp+32]
	mov	dword24,[dword23]
	push_arg	dword ptr [dword24],4
	lea	dword25,[ebp+20]
	push_arg	dword ptr [dword25],4
	lea	dword26,[ebp+12]
	push_arg	dword ptr [dword26],4
	lea	dword27,[ebp+16]
	push_arg	dword ptr [dword27],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0004
label0003:
	push_all
	lea	dword28,[ebp+40]
	push_arg	dword ptr [dword28],4
	lea	dword29,[ebp+36]
	push_arg	dword ptr [dword29],4
	lea	dword30,[ebp+24]
	mov	dword31,4
	add	dword31,[dword30]
	push_arg	dword ptr [dword31],4
	lea	dword32,[ebp+24]
	mov	dword33,[dword32]
	push_arg	dword ptr [dword33],4
	lea	dword34,[ebp+20]
	push_arg	dword ptr [dword34],4
	lea	dword35,[ebp+12]
	push_arg	dword ptr [dword35],4
	lea	dword36,[ebp+8]
	push_arg	dword ptr [dword36],4
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
	push_arg	sse1,4
	lea	dword41,[ebp+36]
	fld	dword ptr [dword41]
	fldz
	fsubrp
	push_arg	sse2,4
	lea	dword42,[ebp+32]
	mov	dword43,4
	add	dword43,[dword42]
	push_arg	dword ptr [dword43],4
	lea	dword44,[ebp+32]
	mov	dword45,[dword44]
	push_arg	dword ptr [dword45],4
	lea	dword46,[ebp+20]
	push_arg	dword ptr [dword46],4
	lea	dword47,[ebp+8]
	push_arg	dword ptr [dword47],4
	lea	dword48,[ebp+16]
	push_arg	dword ptr [dword48],4
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
	push_arg	sse3,4
	lea	dword53,[ebp+36]
	fld	dword ptr [dword53]
	fldz
	fsubrp
	push_arg	sse4,4
	lea	dword54,[ebp+28]
	mov	dword55,4
	add	dword55,[dword54]
	push_arg	dword ptr [dword55],4
	lea	dword56,[ebp+28]
	mov	dword57,[dword56]
	push_arg	dword ptr [dword57],4
	lea	dword58,[ebp+20]
	push_arg	dword ptr [dword58],4
	lea	dword59,[ebp+16]
	push_arg	dword ptr [dword59],4
	lea	dword60,[ebp+12]
	push_arg	dword ptr [dword60],4
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
	push_arg	sse5,4
	lea	dword62,[ebp+36]
	fld	dword ptr [dword62]
	fldz
	fsubrp
	push_arg	sse6,4
	lea	dword63,[ebp+28]
	mov	dword64,4
	add	dword64,[dword63]
	push_arg	dword ptr [dword64],4
	lea	dword65,[ebp+28]
	mov	dword66,[dword65]
	push_arg	dword ptr [dword66],4
	lea	dword67,[ebp+20]
	push_arg	dword ptr [dword67],4
	lea	dword68,[ebp+8]
	push_arg	dword ptr [dword68],4
	lea	dword69,[ebp+12]
	push_arg	dword ptr [dword69],4
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
	push_arg	sse1,4
	fldz
	push_arg	sse2,4
	lea	dword65,[ebp+16]
	mov	dword66,8
	add	dword66,[dword65]
	push_arg	dword66,4
	lea	dword67,[ebp+12]
	mov	dword68,8
	add	dword68,[dword67]
	push_arg	dword68,4
	lea	dword69,[ebp+8]
	mov	dword70,8
	add	dword70,[dword69]
	push_arg	dword70,4
	lea	dword71,[ebp+8]
	mov	dword72,[dword71]
	mov	dword73,4
	add	dword72,dword73
	push_arg	dword ptr [dword72],4
	lea	dword74,[ebp+16]
	mov	dword75,[dword74]
	push_arg	dword ptr [dword75],4
	lea	dword76,[ebp+12]
	mov	dword77,[dword76]
	push_arg	dword ptr [dword77],4
	lea	dword78,[ebp+8]
	mov	dword79,[dword78]
	push_arg	dword ptr [dword79],4
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
	jle	label0007
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
	cdq	dword107
	idiv	dword94,dword106
	lea	dword108,[ebp+8]
	mov	dword109,[dword108]
	add	dword94,[dword109]
	lea	dword110,[ebp-8]
	mov	[dword110],dword94
	lea	dword111,[ebp+8]
	mov	dword112,[dword111]
	mov	dword113,4
	add	dword112,dword113
	lea	dword114,[ebp-16]
	mov	dword115,[dword114]
	sub	dword115,[dword112]
	lea	dword116,[ebp+16]
	mov	dword117,[dword116]
	lea	dword118,[ebp+8]
	mov	dword119,[dword118]
	mov	dword120,[dword117]
	sub	dword120,[dword119]
	imul	dword115,dword120
	lea	dword121,[ebp+16]
	mov	dword122,[dword121]
	mov	dword123,4
	add	dword122,dword123
	lea	dword124,[ebp+8]
	mov	dword125,[dword124]
	mov	dword126,4
	add	dword125,dword126
	mov	dword127,[dword122]
	sub	dword127,[dword125]
	cdq	dword128
	idiv	dword115,dword127
	lea	dword129,[ebp+8]
	mov	dword130,[dword129]
	add	dword115,[dword130]
	lea	dword131,[ebp-12]
	mov	[dword131],dword115
	lea	dword132,[ebp+8]
	mov	dword133,[dword132]
	mov	dword134,4
	add	dword133,dword134
	lea	dword135,[ebp-16]
	mov	dword136,[dword135]
	sub	dword136,[dword133]
	int2float	dword136
	lea	dword137,[ebp+12]
	mov	dword138,8
	add	dword138,[dword137]
	lea	dword139,[ebp+8]
	mov	dword140,8
	add	dword140,[dword139]
	fld	dword ptr [dword138]
	fsub	dword ptr [dword140]
	fmulp
	lea	dword141,[ebp+12]
	mov	dword142,[dword141]
	mov	dword143,4
	add	dword142,dword143
	lea	dword144,[ebp+8]
	mov	dword145,[dword144]
	mov	dword146,4
	add	dword145,dword146
	mov	dword147,[dword142]
	sub	dword147,[dword145]
	int2float	dword147
	fdivp
	lea	dword148,[ebp+8]
	mov	dword149,8
	add	dword149,[dword148]
	fadd	dword ptr [dword149]
	lea	dword150,[ebp-20]
	fstp	dword ptr [dword150]
	lea	dword151,[ebp+8]
	mov	dword152,[dword151]
	mov	dword153,4
	add	dword152,dword153
	lea	dword154,[ebp-16]
	mov	dword155,[dword154]
	sub	dword155,[dword152]
	int2float	dword155
	lea	dword156,[ebp+16]
	mov	dword157,8
	add	dword157,[dword156]
	lea	dword158,[ebp+8]
	mov	dword159,8
	add	dword159,[dword158]
	fld	dword ptr [dword157]
	fsub	dword ptr [dword159]
	fmulp
	lea	dword160,[ebp+16]
	mov	dword161,[dword160]
	mov	dword162,4
	add	dword161,dword162
	lea	dword163,[ebp+8]
	mov	dword164,[dword163]
	mov	dword165,4
	add	dword164,dword165
	mov	dword166,[dword161]
	sub	dword166,[dword164]
	int2float	dword166
	fdivp
	lea	dword167,[ebp+8]
	mov	dword168,8
	add	dword168,[dword167]
	fadd	dword ptr [dword168]
	lea	dword169,[ebp-28]
	fstp	dword ptr [dword169]
	lea	dword170,[ebp+8]
	mov	dword171,[dword170]
	mov	dword172,4
	add	dword171,dword172
	lea	dword173,[ebp-16]
	mov	dword174,[dword173]
	sub	dword174,[dword171]
	int2float	dword174
	lea	dword175,[ebp+12]
	mov	dword176,8
	add	dword176,[dword175]
	mov	dword177,4
	add	dword176,dword177
	lea	dword178,[ebp+8]
	mov	dword179,8
	add	dword179,[dword178]
	mov	dword180,4
	add	dword179,dword180
	fld	dword ptr [dword176]
	fsub	dword ptr [dword179]
	fmulp
	lea	dword181,[ebp+12]
	mov	dword182,[dword181]
	mov	dword183,4
	add	dword182,dword183
	lea	dword184,[ebp+8]
	mov	dword185,[dword184]
	mov	dword186,4
	add	dword185,dword186
	mov	dword187,[dword182]
	sub	dword187,[dword185]
	int2float	dword187
	fdivp
	lea	dword188,[ebp+8]
	mov	dword189,8
	add	dword189,[dword188]
	mov	dword190,4
	add	dword189,dword190
	fadd	dword ptr [dword189]
	lea	dword191,[ebp-24]
	fstp	dword ptr [dword191]
	lea	dword192,[ebp+8]
	mov	dword193,[dword192]
	mov	dword194,4
	add	dword193,dword194
	lea	dword195,[ebp-16]
	mov	dword196,[dword195]
	sub	dword196,[dword193]
	int2float	dword196
	lea	dword197,[ebp+16]
	mov	dword198,8
	add	dword198,[dword197]
	mov	dword199,4
	add	dword198,dword199
	lea	dword200,[ebp+8]
	mov	dword201,8
	add	dword201,[dword200]
	mov	dword202,4
	add	dword201,dword202
	fld	dword ptr [dword198]
	fsub	dword ptr [dword201]
	fmulp
	lea	dword203,[ebp+16]
	mov	dword204,[dword203]
	mov	dword205,4
	add	dword204,dword205
	lea	dword206,[ebp+8]
	mov	dword207,[dword206]
	mov	dword208,4
	add	dword207,dword208
	mov	dword209,[dword204]
	sub	dword209,[dword207]
	int2float	dword209
	fdivp
	lea	dword210,[ebp+8]
	mov	dword211,8
	add	dword211,[dword210]
	mov	dword212,4
	add	dword211,dword212
	fadd	dword ptr [dword211]
	lea	dword213,[ebp-32]
	fstp	dword ptr [dword213]
	lea	dword214,[ebp-12]
	lea	dword215,[ebp-8]
	mov	dword216,[dword214]
	sub	dword216,[dword215]
	int2float	dword216
	lea	dword217,[ebp-28]
	lea	dword218,[ebp-20]
	fld	dword ptr [dword217]
	fsub	dword ptr [dword218]
	fdivrp
	lea	dword219,[ebp-36]
	fstp	dword ptr [dword219]
	lea	dword220,[ebp-12]
	lea	dword221,[ebp-8]
	mov	dword222,[dword220]
	sub	dword222,[dword221]
	int2float	dword222
	lea	dword223,[ebp-32]
	lea	dword224,[ebp-24]
	fld	dword ptr [dword223]
	fsub	dword ptr [dword224]
	fdivrp
	lea	dword225,[ebp-40]
	fstp	dword ptr [dword225]
	push_all
	lea	dword226,[ebp-40]
	push_arg	dword ptr [dword226],4
	lea	dword227,[ebp-36]
	push_arg	dword ptr [dword227],4
	lea	dword228,[ebp-32]
	push_arg	dword ptr [dword228],4
	lea	dword229,[ebp-28]
	push_arg	dword ptr [dword229],4
	lea	dword230,[ebp-24]
	push_arg	dword ptr [dword230],4
	lea	dword231,[ebp-20]
	push_arg	dword ptr [dword231],4
	lea	dword232,[ebp-16]
	push_arg	dword ptr [dword232],4
	lea	dword233,[ebp-12]
	push_arg	dword ptr [dword233],4
	lea	dword234,[ebp-8]
	push_arg	dword ptr [dword234],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	lea	dword235,[ebp-16]
	inc	dword ptr [dword235]
	jmp	label0006
label0007:
	lea	dword236,[ebp+12]
	mov	dword237,[dword236]
	mov	dword238,4
	add	dword237,dword238
	lea	dword239,[ebp+8]
	mov	dword240,[dword239]
	mov	dword241,4
	add	dword240,dword241
	mov	dword242,[dword237]
	sub	dword242,[dword240]
	lea	dword243,[ebp+16]
	mov	dword244,[dword243]
	lea	dword245,[ebp+8]
	mov	dword246,[dword245]
	mov	dword247,[dword244]
	sub	dword247,[dword246]
	imul	dword242,dword247
	lea	dword248,[ebp+16]
	mov	dword249,[dword248]
	mov	dword250,4
	add	dword249,dword250
	lea	dword251,[ebp+8]
	mov	dword252,[dword251]
	mov	dword253,4
	add	dword252,dword253
	mov	dword254,[dword249]
	sub	dword254,[dword252]
	cdq	dword255
	idiv	dword242,dword254
	lea	dword256,[ebp+8]
	mov	dword257,[dword256]
	add	dword242,[dword257]
	lea	dword258,[ebp-12]
	mov	[dword258],dword242
	lea	dword259,[ebp+12]
	mov	dword260,[dword259]
	mov	dword261,4
	add	dword260,dword261
	lea	dword262,[ebp+8]
	mov	dword263,[dword262]
	mov	dword264,4
	add	dword263,dword264
	mov	dword265,[dword260]
	sub	dword265,[dword263]
	int2float	dword265
	lea	dword266,[ebp+16]
	mov	dword267,8
	add	dword267,[dword266]
	lea	dword268,[ebp+8]
	mov	dword269,8
	add	dword269,[dword268]
	fld	dword ptr [dword267]
	fsub	dword ptr [dword269]
	fmulp
	lea	dword270,[ebp+16]
	mov	dword271,[dword270]
	mov	dword272,4
	add	dword271,dword272
	lea	dword273,[ebp+8]
	mov	dword274,[dword273]
	mov	dword275,4
	add	dword274,dword275
	mov	dword276,[dword271]
	sub	dword276,[dword274]
	int2float	dword276
	fdivp
	lea	dword277,[ebp+8]
	mov	dword278,8
	add	dword278,[dword277]
	fadd	dword ptr [dword278]
	lea	dword279,[ebp-28]
	fstp	dword ptr [dword279]
	lea	dword280,[ebp+12]
	mov	dword281,[dword280]
	mov	dword282,4
	add	dword281,dword282
	lea	dword283,[ebp+8]
	mov	dword284,[dword283]
	mov	dword285,4
	add	dword284,dword285
	mov	dword286,[dword281]
	sub	dword286,[dword284]
	int2float	dword286
	lea	dword287,[ebp+16]
	mov	dword288,8
	add	dword288,[dword287]
	mov	dword289,4
	add	dword288,dword289
	lea	dword290,[ebp+8]
	mov	dword291,8
	add	dword291,[dword290]
	mov	dword292,4
	add	dword291,dword292
	fld	dword ptr [dword288]
	fsub	dword ptr [dword291]
	fmulp
	lea	dword293,[ebp+16]
	mov	dword294,[dword293]
	mov	dword295,4
	add	dword294,dword295
	lea	dword296,[ebp+8]
	mov	dword297,[dword296]
	mov	dword298,4
	add	dword297,dword298
	mov	dword299,[dword294]
	sub	dword299,[dword297]
	int2float	dword299
	fdivp
	lea	dword300,[ebp+8]
	mov	dword301,8
	add	dword301,[dword300]
	mov	dword302,4
	add	dword301,dword302
	fadd	dword ptr [dword301]
	lea	dword303,[ebp-32]
	fstp	dword ptr [dword303]
	lea	dword304,[ebp+12]
	mov	dword305,8
	add	dword305,[dword304]
	lea	dword306,[ebp-28]
	fld	dword ptr [dword306]
	fsub	dword ptr [dword305]
	lea	dword307,[ebp+12]
	mov	dword308,[dword307]
	lea	dword309,[ebp-12]
	mov	dword310,[dword309]
	sub	dword310,[dword308]
	int2float	dword310
	fdivp
	lea	dword311,[ebp-36]
	fstp	dword ptr [dword311]
	lea	dword312,[ebp+12]
	mov	dword313,8
	add	dword313,[dword312]
	mov	dword314,4
	add	dword313,dword314
	lea	dword315,[ebp-32]
	fld	dword ptr [dword315]
	fsub	dword ptr [dword313]
	lea	dword316,[ebp+12]
	mov	dword317,[dword316]
	lea	dword318,[ebp-12]
	mov	dword319,[dword318]
	sub	dword319,[dword317]
	int2float	dword319
	fdivp
	lea	dword320,[ebp-40]
	fstp	dword ptr [dword320]
	push_all
	lea	dword321,[ebp-40]
	push_arg	dword ptr [dword321],4
	lea	dword322,[ebp-36]
	push_arg	dword ptr [dword322],4
	lea	dword323,[ebp+12]
	mov	dword324,8
	add	dword324,[dword323]
	mov	dword325,4
	add	dword324,dword325
	push_arg	dword ptr [dword324],4
	lea	dword326,[ebp+12]
	mov	dword327,8
	add	dword327,[dword326]
	push_arg	dword ptr [dword327],4
	lea	dword328,[ebp-32]
	push_arg	dword ptr [dword328],4
	lea	dword329,[ebp-28]
	push_arg	dword ptr [dword329],4
	lea	dword330,[ebp+12]
	mov	dword331,[dword330]
	mov	dword332,4
	add	dword331,dword332
	push_arg	dword ptr [dword331],4
	lea	dword333,[ebp+12]
	mov	dword334,[dword333]
	push_arg	dword ptr [dword334],4
	lea	dword335,[ebp-12]
	push_arg	dword ptr [dword335],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	lea	dword336,[ebp+12]
	mov	dword337,[dword336]
	mov	dword338,4
	add	dword337,dword338
	mov	dword339,1
	add	dword339,[dword337]
	lea	dword340,[ebp-16]
	mov	[dword340],dword339
label0008:
label0009:
	lea	dword341,[ebp+16]
	mov	dword342,[dword341]
	mov	dword343,4
	add	dword342,dword343
	lea	dword344,[ebp-16]
	mov	dword345,[dword342]
	cmp	dword345,[dword344]
	jle	label000a
	lea	dword346,[ebp+12]
	mov	dword347,[dword346]
	mov	dword348,4
	add	dword347,dword348
	lea	dword349,[ebp-16]
	mov	dword350,[dword349]
	sub	dword350,[dword347]
	lea	dword351,[ebp+16]
	mov	dword352,[dword351]
	lea	dword353,[ebp+12]
	mov	dword354,[dword353]
	mov	dword355,[dword352]
	sub	dword355,[dword354]
	imul	dword350,dword355
	lea	dword356,[ebp+16]
	mov	dword357,[dword356]
	mov	dword358,4
	add	dword357,dword358
	lea	dword359,[ebp+12]
	mov	dword360,[dword359]
	mov	dword361,4
	add	dword360,dword361
	mov	dword362,[dword357]
	sub	dword362,[dword360]
	cdq	dword363
	idiv	dword350,dword362
	lea	dword364,[ebp+12]
	mov	dword365,[dword364]
	add	dword350,[dword365]
	lea	dword366,[ebp-8]
	mov	[dword366],dword350
	lea	dword367,[ebp+8]
	mov	dword368,[dword367]
	mov	dword369,4
	add	dword368,dword369
	lea	dword370,[ebp-16]
	mov	dword371,[dword370]
	sub	dword371,[dword368]
	lea	dword372,[ebp+16]
	mov	dword373,[dword372]
	lea	dword374,[ebp+8]
	mov	dword375,[dword374]
	mov	dword376,[dword373]
	sub	dword376,[dword375]
	imul	dword371,dword376
	lea	dword377,[ebp+16]
	mov	dword378,[dword377]
	mov	dword379,4
	add	dword378,dword379
	lea	dword380,[ebp+8]
	mov	dword381,[dword380]
	mov	dword382,4
	add	dword381,dword382
	mov	dword383,[dword378]
	sub	dword383,[dword381]
	cdq	dword384
	idiv	dword371,dword383
	lea	dword385,[ebp+8]
	mov	dword386,[dword385]
	add	dword371,[dword386]
	lea	dword387,[ebp-12]
	mov	[dword387],dword371
	lea	dword388,[ebp+12]
	mov	dword389,[dword388]
	mov	dword390,4
	add	dword389,dword390
	lea	dword391,[ebp-16]
	mov	dword392,[dword391]
	sub	dword392,[dword389]
	int2float	dword392
	lea	dword393,[ebp+16]
	mov	dword394,8
	add	dword394,[dword393]
	lea	dword395,[ebp+12]
	mov	dword396,8
	add	dword396,[dword395]
	fld	dword ptr [dword394]
	fsub	dword ptr [dword396]
	fmulp
	lea	dword397,[ebp+16]
	mov	dword398,[dword397]
	mov	dword399,4
	add	dword398,dword399
	lea	dword400,[ebp+12]
	mov	dword401,[dword400]
	mov	dword402,4
	add	dword401,dword402
	mov	dword403,[dword398]
	sub	dword403,[dword401]
	int2float	dword403
	fdivp
	lea	dword404,[ebp+12]
	mov	dword405,8
	add	dword405,[dword404]
	fadd	dword ptr [dword405]
	lea	dword406,[ebp-20]
	fstp	dword ptr [dword406]
	lea	dword407,[ebp+8]
	mov	dword408,[dword407]
	mov	dword409,4
	add	dword408,dword409
	lea	dword410,[ebp-16]
	mov	dword411,[dword410]
	sub	dword411,[dword408]
	int2float	dword411
	lea	dword412,[ebp+16]
	mov	dword413,8
	add	dword413,[dword412]
	lea	dword414,[ebp+8]
	mov	dword415,8
	add	dword415,[dword414]
	fld	dword ptr [dword413]
	fsub	dword ptr [dword415]
	fmulp
	lea	dword416,[ebp+16]
	mov	dword417,[dword416]
	mov	dword418,4
	add	dword417,dword418
	lea	dword419,[ebp+8]
	mov	dword420,[dword419]
	mov	dword421,4
	add	dword420,dword421
	mov	dword422,[dword417]
	sub	dword422,[dword420]
	int2float	dword422
	fdivp
	lea	dword423,[ebp+8]
	mov	dword424,8
	add	dword424,[dword423]
	fadd	dword ptr [dword424]
	lea	dword425,[ebp-28]
	fstp	dword ptr [dword425]
	lea	dword426,[ebp+12]
	mov	dword427,[dword426]
	mov	dword428,4
	add	dword427,dword428
	lea	dword429,[ebp-16]
	mov	dword430,[dword429]
	sub	dword430,[dword427]
	int2float	dword430
	lea	dword431,[ebp+16]
	mov	dword432,8
	add	dword432,[dword431]
	mov	dword433,4
	add	dword432,dword433
	lea	dword434,[ebp+12]
	mov	dword435,8
	add	dword435,[dword434]
	mov	dword436,4
	add	dword435,dword436
	fld	dword ptr [dword432]
	fsub	dword ptr [dword435]
	fmulp
	lea	dword437,[ebp+16]
	mov	dword438,[dword437]
	mov	dword439,4
	add	dword438,dword439
	lea	dword440,[ebp+12]
	mov	dword441,[dword440]
	mov	dword442,4
	add	dword441,dword442
	mov	dword443,[dword438]
	sub	dword443,[dword441]
	int2float	dword443
	fdivp
	lea	dword444,[ebp+12]
	mov	dword445,8
	add	dword445,[dword444]
	mov	dword446,4
	add	dword445,dword446
	fadd	dword ptr [dword445]
	lea	dword447,[ebp-24]
	fstp	dword ptr [dword447]
	lea	dword448,[ebp+8]
	mov	dword449,[dword448]
	mov	dword450,4
	add	dword449,dword450
	lea	dword451,[ebp-16]
	mov	dword452,[dword451]
	sub	dword452,[dword449]
	int2float	dword452
	lea	dword453,[ebp+16]
	mov	dword454,8
	add	dword454,[dword453]
	mov	dword455,4
	add	dword454,dword455
	lea	dword456,[ebp+8]
	mov	dword457,8
	add	dword457,[dword456]
	mov	dword458,4
	add	dword457,dword458
	fld	dword ptr [dword454]
	fsub	dword ptr [dword457]
	fmulp
	lea	dword459,[ebp+16]
	mov	dword460,[dword459]
	mov	dword461,4
	add	dword460,dword461
	lea	dword462,[ebp+8]
	mov	dword463,[dword462]
	mov	dword464,4
	add	dword463,dword464
	mov	dword465,[dword460]
	sub	dword465,[dword463]
	int2float	dword465
	fdivp
	lea	dword466,[ebp+8]
	mov	dword467,8
	add	dword467,[dword466]
	mov	dword468,4
	add	dword467,dword468
	fadd	dword ptr [dword467]
	lea	dword469,[ebp-32]
	fstp	dword ptr [dword469]
	lea	dword470,[ebp-12]
	lea	dword471,[ebp-8]
	mov	dword472,[dword470]
	sub	dword472,[dword471]
	int2float	dword472
	lea	dword473,[ebp-28]
	lea	dword474,[ebp-20]
	fld	dword ptr [dword473]
	fsub	dword ptr [dword474]
	fdivrp
	lea	dword475,[ebp-36]
	fstp	dword ptr [dword475]
	lea	dword476,[ebp-12]
	lea	dword477,[ebp-8]
	mov	dword478,[dword476]
	sub	dword478,[dword477]
	int2float	dword478
	lea	dword479,[ebp-32]
	lea	dword480,[ebp-24]
	fld	dword ptr [dword479]
	fsub	dword ptr [dword480]
	fdivrp
	lea	dword481,[ebp-40]
	fstp	dword ptr [dword481]
	push_all
	lea	dword482,[ebp-40]
	push_arg	dword ptr [dword482],4
	lea	dword483,[ebp-36]
	push_arg	dword ptr [dword483],4
	lea	dword484,[ebp-32]
	push_arg	dword ptr [dword484],4
	lea	dword485,[ebp-28]
	push_arg	dword ptr [dword485],4
	lea	dword486,[ebp-24]
	push_arg	dword ptr [dword486],4
	lea	dword487,[ebp-20]
	push_arg	dword ptr [dword487],4
	lea	dword488,[ebp-16]
	push_arg	dword ptr [dword488],4
	lea	dword489,[ebp-12]
	push_arg	dword ptr [dword489],4
	lea	dword490,[ebp-8]
	push_arg	dword ptr [dword490],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	lea	dword491,[ebp-16]
	inc	dword ptr [dword491]
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
	mov	dword14,[dword12]
	imul	dword14,dword13
	lea	dword15,[ebp+12]
	mov	dword16,[dword15]
	add	dword16,dword14
	lea	dword17,[ebp-8]
	cmp	dword16,[dword17]
	jle	label0002
	push_all
	lea	dword18,[ebp+16]
	push_arg	dword ptr [dword18],4
	lea	dword19,[ebp-4]
	mov	dword20,[dword19]
	push_arg	dword20,4
	lea	dword21,[ebp-24]
	push_arg	dword21,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword22,[ebp+20]
	push_arg	dword ptr [dword22],4
	lea	dword23,[ebp-24]
	push_arg	dword23,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	lea	dword24,[ebp-52]
	fstp	dword ptr [dword24]
	push_all
	lea	dword25,[ebp+16]
	push_arg	dword ptr [dword25],4
	lea	dword26,[ebp-8]
	mov	dword27,[dword26]
	push_arg	dword27,4
	lea	dword28,[ebp-24]
	push_arg	dword28,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword29,[ebp+20]
	push_arg	dword ptr [dword29],4
	lea	dword30,[ebp-24]
	push_arg	dword30,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	lea	dword31,[ebp-56]
	fstp	dword ptr [dword31]
	lea	dword32,[ebp-52]
	fldz
	fld	dword ptr [dword32]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	lea	dword33,[ebp+8]
	mov	dword34,192
	add	dword34,[dword33]
	mov	dword35,[dword34]
	inc	dword ptr [dword34]
	mov	dword36,24
	imul	dword35,dword36
	lea	dword37,[ebp+8]
	mov	dword38,[dword37]
	add	dword38,dword35
	lea	dword39,[ebp-4]
	mov	dword40,[dword39]
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
	lea	dword43,[ebp-52]
	fldz
	fld	dword ptr [dword43]
	fucomip	st,st(1)
	fstp	st
	jbe	label0006
	lea	dword44,[ebp-56]
	fldz
	fld	dword ptr [dword44]
	fucomip	st,st(1)
	fstp	st
	jb	label0005
label0006:
	lea	dword45,[ebp-56]
	fldz
	fld	dword ptr [dword45]
	fucomip	st,st(1)
	fstp	st
	jb	label0004
	lea	dword46,[ebp-52]
	fldz
	fld	dword ptr [dword46]
	fucomip	st,st(1)
	fstp	st
	jae	label0004
label0005:
	push_all
	lea	dword47,[ebp-4]
	mov	dword48,[dword47]
	push_arg	dword48,4
	lea	dword49,[ebp+16]
	push_arg	dword ptr [dword49],4
	lea	dword50,[ebp-24]
	push_arg	dword50,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword51,[ebp-4]
	mov	dword52,[dword51]
	push_arg	dword52,4
	lea	dword53,[ebp-8]
	mov	dword54,[dword53]
	push_arg	dword54,4
	lea	dword55,[ebp-40]
	push_arg	dword55,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword56,[ebp+20]
	push_arg	dword ptr [dword56],4
	lea	dword57,[ebp-24]
	push_arg	dword57,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	push_all
	lea	dword58,[ebp+20]
	push_arg	dword ptr [dword58],4
	lea	dword59,[ebp-40]
	push_arg	dword59,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fdivp
	lea	dword60,[ebp-60]
	fstp	dword ptr [dword60]
	push_all
	lea	dword61,[ebp-60]
	push_arg	dword ptr [dword61],4
	lea	dword62,[ebp-40]
	push_arg	dword62,4
	call	_vec4f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword63,[ebp-40]
	push_arg	dword63,4
	lea	dword64,[ebp-4]
	mov	dword65,[dword64]
	push_arg	dword65,4
	lea	dword66,[ebp+8]
	mov	dword67,192
	add	dword67,[dword66]
	mov	dword68,24
	mov	dword69,[dword67]
	imul	dword69,dword68
	lea	dword70,[ebp+8]
	mov	dword71,[dword70]
	add	dword71,dword69
	push_arg	dword71,4
	call	_vec4f_add
	restore_stack	12
	pop_all
	push_all
	lea	dword72,[ebp-4]
	mov	dword73,16
	add	dword73,[dword72]
	push_arg	dword73,4
	lea	dword74,[ebp-8]
	mov	dword75,16
	add	dword75,[dword74]
	push_arg	dword75,4
	lea	dword76,[ebp-48]
	push_arg	dword76,4
	call	_vec2f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword77,[ebp-60]
	push_arg	dword ptr [dword77],4
	lea	dword78,[ebp-48]
	push_arg	dword78,4
	call	_vec2f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword79,[ebp-48]
	push_arg	dword79,4
	lea	dword80,[ebp-4]
	mov	dword81,16
	add	dword81,[dword80]
	push_arg	dword81,4
	lea	dword82,[ebp+8]
	mov	dword83,192
	add	dword83,[dword82]
	mov	dword84,24
	mov	dword85,[dword83]
	imul	dword85,dword84
	lea	dword86,[ebp+8]
	mov	dword87,[dword86]
	add	dword87,dword85
	mov	dword88,16
	add	dword87,dword88
	push_arg	dword87,4
	call	_vec2f_add
	restore_stack	12
	pop_all
	lea	dword89,[ebp+8]
	mov	dword90,192
	add	dword90,[dword89]
	inc	dword ptr [dword90]
label0004:
	lea	dword91,[ebp-4]
	add	dword ptr [dword91],24
	lea	dword92,[ebp-8]
	add	dword ptr [dword92],24
	jmp	label0001
label0002:
	lea	dword93,[ebp+8]
	mov	dword94,192
	add	dword94,[dword93]
	mov	dword95,[dword94]
	inc	dword ptr [dword94]
	mov	dword96,24
	imul	dword95,dword96
	lea	dword97,[ebp+8]
	mov	dword98,[dword97]
	add	dword98,dword95
	lea	dword99,[ebp+8]
	mov	dword100,[dword99]
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
	lea	dword3,[ebp+8]
	push_arg	dword ptr [dword3],4
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
	lea	dword8,[ebp+8]
	push_arg	dword ptr [dword8],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword9,dword ptr [__clip_plane_left_norm]
	push_arg	dword9,4
	lea	dword10,dword ptr [__clip_plane_left_base]
	push_arg	dword10,4
	lea	dword11,[ebp+8]
	push_arg	dword ptr [dword11],4
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
	lea	dword16,[ebp+8]
	push_arg	dword ptr [dword16],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword17,dword ptr [__clip_plane_top_norm]
	push_arg	dword17,4
	lea	dword18,dword ptr [__clip_plane_top_base]
	push_arg	dword18,4
	lea	dword19,[ebp+8]
	push_arg	dword ptr [dword19],4
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
	lea	dword24,[ebp+8]
	push_arg	dword ptr [dword24],4
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
	set_retval	dword28
	destroy_stack_frame
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	create_stack_frame
	push_all
	lea	dword1,dword ptr [__viewport_matrix]
	push_arg	dword1,4
	lea	dword2,[ebp+12]
	push_arg	dword ptr [dword2],4
	lea	dword3,[ebp-16]
	push_arg	dword3,4
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
	push_arg	dword ptr [dword1],4
	call	__clip_poligon
	restore_stack	4
	pop_all
	read_retval	dword2
	cmp	dword2,0
	jne	label0000
	destroy_stack_frame
	ret
label0000:
	lea	dword3,[ebp+8]
	mov	dword4,192
	add	dword4,[dword3]
	mov	dword5,8
	cmp	[dword4],dword5
	jle	label0001
	mov	dword6,0
	mov	dword7,0
	mov	[dword6],dword7
label0001:
	lea	dword8,[ebp-136]
	mov	dword9,0
	mov	[dword8],dword9
label0002:
label0003:
	lea	dword10,[ebp+8]
	mov	dword11,192
	add	dword11,[dword10]
	lea	dword12,[ebp-136]
	mov	dword13,[dword11]
	cmp	dword13,[dword12]
	jle	label0004
	push_all
	lea	dword14,[ebp+8]
	mov	dword15,[dword14]
	lea	dword16,[ebp-136]
	mov	dword17,24
	mov	dword18,[dword16]
	imul	dword18,dword17
	add	dword15,dword18
	push_arg	dword15,4
	lea	dword19,[ebp-132]
	lea	dword20,[ebp-136]
	mov	dword21,4
	mov	dword22,[dword20]
	sal	dword22,dword21
	add	dword19,dword22
	push_arg	dword19,4
	call	__transform_to_screen_space
	restore_stack	8
	pop_all
	lea	dword23,[ebp-132]
	lea	dword24,[ebp-136]
	mov	dword25,4
	mov	dword26,[dword24]
	sal	dword26,dword25
	add	dword23,dword26
	mov	dword27,8
	add	dword23,dword27
	lea	dword28,[ebp+8]
	mov	dword29,[dword28]
	lea	dword30,[ebp-136]
	mov	dword31,24
	mov	dword32,[dword30]
	imul	dword32,dword31
	add	dword29,dword32
	mov	dword33,16
	add	dword29,dword33
	mov	dword34,[dword29]
	mov	dword35,[dword29+4]
	mov	[dword23],dword34
	mov	[dword23+4],dword35
	lea	dword36,[ebp-136]
	inc	dword ptr [dword36]
	jmp	label0003
label0004:
	lea	dword37,[ebp-136]
	mov	dword38,2
	mov	[dword37],dword38
label0005:
label0006:
	lea	dword39,[ebp+8]
	mov	dword40,192
	add	dword40,[dword39]
	mov	dword41,1
	mov	dword42,[dword40]
	sub	dword42,dword41
	lea	dword43,[ebp-136]
	cmp	dword42,[dword43]
	jle	label0007
	push_all
	lea	dword44,[ebp-132]
	lea	dword45,[ebp-136]
	mov	dword46,4
	mov	dword47,[dword45]
	sal	dword47,dword46
	add	dword44,dword47
	push_arg	dword44,4
	lea	dword48,[ebp-136]
	mov	dword49,1
	mov	dword50,[dword48]
	sub	dword50,dword49
	mov	dword51,4
	sal	dword50,dword51
	lea	dword52,[ebp-132]
	add	dword52,dword50
	push_arg	dword52,4
	lea	dword53,[ebp-132]
	push_arg	dword53,4
	call	__rasterize_triangle_2i
	restore_stack	12
	pop_all
	lea	dword54,[ebp-136]
	inc	dword ptr [dword54]
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
	lea	dword1,[ebp+12]
	mov	dword2,8
	add	dword2,[dword1]
	push_arg	dword ptr [dword2],4
	lea	dword3,[ebp+12]
	mov	dword4,4
	add	dword4,[dword3]
	push_arg	dword ptr [dword4],4
	lea	dword5,[ebp+12]
	mov	dword6,[dword5]
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
	lea	dword10,[ebp+8]
	push_arg	dword ptr [dword10],4
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
	push_arg	dword ptr [dword1],4
	lea	dword2,[ebp-196]
	push_arg	dword2,4
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
	push_arg	dword ptr [dword9],4
	lea	dword10,[ebp-196]
	mov	dword11,24
	add	dword10,dword11
	push_arg	dword10,4
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
	push_arg	dword ptr [dword19],4
	lea	dword20,[ebp-196]
	mov	dword21,48
	add	dword20,dword21
	push_arg	dword20,4
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
	push_arg	dword37,4
	call	__rasterize_polygon_4f
	restore_stack	4
	pop_all
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
