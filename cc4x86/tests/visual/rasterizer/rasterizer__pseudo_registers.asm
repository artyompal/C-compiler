
.686
.model flat

.data

_dbgprintf	dd	?
public	_dbgprintf
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
	x86instr_create_stack_frame	0
	mov	reg15,[ebp+16]
	mov	reg14,[ebp+12]
	mov	reg13,[ebp+8]
	fld	dword ptr [reg14]
	fadd	dword ptr [reg15]
	fstp	dword ptr [reg13]
	fld	dword ptr [reg14+4]
	fadd	dword ptr [reg15+4]
	fstp	dword ptr [reg13+4]
	x86instr_destroy_stack_frame	0
	ret
_vec2f_add endp	

_vec2f_subtract proc
	x86instr_create_stack_frame	0
	mov	reg15,[ebp+16]
	mov	reg14,[ebp+12]
	mov	reg13,[ebp+8]
	fld	dword ptr [reg14]
	fsub	dword ptr [reg15]
	fstp	dword ptr [reg13]
	fld	dword ptr [reg14+4]
	fsub	dword ptr [reg15+4]
	fstp	dword ptr [reg13+4]
	x86instr_destroy_stack_frame	0
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	x86instr_create_stack_frame	0
	mov	reg6,[ebp+8]
	fld	dword ptr [reg6]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [reg6]
	fld	dword ptr [reg6+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [reg6+4]
	x86instr_destroy_stack_frame	0
	ret
_vec2f_mul endp	

_vec4f_assign proc
	x86instr_create_stack_frame	0
	mov	reg12,[ebp+8]
	fld	dword ptr [ebp+12]
	fstp	dword ptr [reg12]
	fld	dword ptr [ebp+16]
	fstp	dword ptr [reg12+4]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [reg12+8]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [reg12+12]
	x86instr_destroy_stack_frame	0
	ret
_vec4f_assign endp	

_vec4f_add proc
	x86instr_create_stack_frame	0
	mov	reg27,[ebp+16]
	mov	reg26,[ebp+12]
	mov	reg25,[ebp+8]
	fld	dword ptr [reg26]
	fadd	dword ptr [reg27]
	fstp	dword ptr [reg25]
	fld	dword ptr [reg26+4]
	fadd	dword ptr [reg27+4]
	fstp	dword ptr [reg25+4]
	fld	dword ptr [reg26+8]
	fadd	dword ptr [reg27+8]
	fstp	dword ptr [reg25+8]
	fld	dword ptr [reg26+12]
	fadd	dword ptr [reg27+12]
	fstp	dword ptr [reg25+12]
	x86instr_destroy_stack_frame	0
	ret
_vec4f_add endp	

_vec4f_subtract proc
	x86instr_create_stack_frame	0
	mov	reg27,[ebp+16]
	mov	reg26,[ebp+12]
	mov	reg25,[ebp+8]
	fld	dword ptr [reg26]
	fsub	dword ptr [reg27]
	fstp	dword ptr [reg25]
	fld	dword ptr [reg26+4]
	fsub	dword ptr [reg27+4]
	fstp	dword ptr [reg25+4]
	fld	dword ptr [reg26+8]
	fsub	dword ptr [reg27+8]
	fstp	dword ptr [reg25+8]
	fld	dword ptr [reg26+12]
	fsub	dword ptr [reg27+12]
	fstp	dword ptr [reg25+12]
	x86instr_destroy_stack_frame	0
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	x86instr_create_stack_frame	0
	mov	reg18,[ebp+12]
	mov	reg17,[ebp+8]
	fld	dword ptr [reg17]
	fmul	dword ptr [reg18]
	fld	dword ptr [reg17+4]
	fmul	dword ptr [reg18+4]
	faddp
	fld	dword ptr [reg17+8]
	fmul	dword ptr [reg18+8]
	faddp
	fld	dword ptr [reg17+12]
	fmul	dword ptr [reg18+12]
	faddp
	x86instr_destroy_stack_frame	0
	ret
_vec4f_dot endp	

_vec4f_mul proc
	x86instr_create_stack_frame	0
	mov	reg12,[ebp+8]
	fld	dword ptr [reg12]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [reg12]
	fld	dword ptr [reg12+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [reg12+4]
	fld	dword ptr [reg12+8]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [reg12+8]
	fld	dword ptr [reg12+12]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [reg12+12]
	x86instr_destroy_stack_frame	0
	ret
_vec4f_mul endp	

.data

___unnamed_float_0	dd	0.000100
public	___unnamed_float_0

.code

_vec4f_is_equal proc
	x86instr_create_stack_frame	20
	x86instr_push_all
	push	dword ptr [ebp+12]
	push	dword ptr [ebp+8]
	lea	reg3,[ebp-16]
	push	reg3
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	lea	reg5,[ebp-16]
	push	reg5
	lea	reg6,[ebp-16]
	push	reg6
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	fstp	dword ptr [ebp-20]
	fld	[___unnamed_float_0]
	fld	dword ptr [ebp-20]
	fucomip	st,st(1)
	fstp	st
	setb	al
	movzx	reg9,al
	mov	eax,reg9
	x86instr_destroy_stack_frame	20
	ret
_vec4f_is_equal endp	

_matrix4f_make_identity proc
	x86instr_create_stack_frame	0
	mov	reg33,[ebp+8]
	fld1
	fstp	dword ptr [reg33]
	fldz
	fstp	dword ptr [reg33+4]
	fldz
	fstp	dword ptr [reg33+8]
	fldz
	fstp	dword ptr [reg33+12]
	fldz
	fstp	dword ptr [reg33+16]
	fld1
	fstp	dword ptr [reg33+20]
	fldz
	fstp	dword ptr [reg33+24]
	fldz
	fstp	dword ptr [reg33+28]
	fldz
	fstp	dword ptr [reg33+32]
	fldz
	fstp	dword ptr [reg33+36]
	fld1
	fstp	dword ptr [reg33+40]
	fldz
	fstp	dword ptr [reg33+44]
	fldz
	fstp	dword ptr [reg33+48]
	fldz
	fstp	dword ptr [reg33+52]
	fldz
	fstp	dword ptr [reg33+56]
	fld1
	fstp	dword ptr [reg33+60]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_make_identity endp	

_matrix4f_make_perspective proc
	x86instr_create_stack_frame	8
	mov	reg50,[ebp+8]
	fld	dword ptr [ebp+20]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp-4]
	fmul	dword ptr [ebp+24]
	fstp	dword ptr [ebp-8]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-8]
	fstp	dword ptr [reg50]
	fldz
	fstp	dword ptr [reg50+4]
	fldz
	fstp	dword ptr [reg50+8]
	fldz
	fstp	dword ptr [reg50+12]
	fldz
	fstp	dword ptr [reg50+16]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-4]
	fstp	dword ptr [reg50+20]
	fldz
	fstp	dword ptr [reg50+24]
	fldz
	fstp	dword ptr [reg50+28]
	fldz
	fstp	dword ptr [reg50+32]
	fldz
	fstp	dword ptr [reg50+36]
	fld	dword ptr [ebp+16]
	fsub	dword ptr [ebp+12]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [reg50+40]
	fld1
	fstp	dword ptr [reg50+44]
	fldz
	fstp	dword ptr [reg50+48]
	fldz
	fstp	dword ptr [reg50+52]
	fld	dword ptr [ebp+12]
	fmul	dword ptr [ebp+16]
	fld	dword ptr [ebp+12]
	fsub	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [reg50+56]
	fldz
	fstp	dword ptr [reg50+60]
	x86instr_destroy_stack_frame	8
	ret
_matrix4f_make_perspective endp	

.data

___unnamed_float_1	dd	2.000000
public	___unnamed_float_1

.code

_matrix4f_make_viewport proc
	x86instr_create_stack_frame	0
	mov	reg44,[ebp+8]
	fld	[___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [reg44]
	fldz
	fstp	dword ptr [reg44+4]
	fldz
	fstp	dword ptr [reg44+8]
	fldz
	fstp	dword ptr [reg44+12]
	fldz
	fstp	dword ptr [reg44+16]
	fld	dword ptr [ebp+16]
	fldz
	fsubrp
	fld	[___unnamed_float_1]
	fdivp
	fstp	dword ptr [reg44+20]
	fldz
	fstp	dword ptr [reg44+24]
	fldz
	fstp	dword ptr [reg44+28]
	fldz
	fstp	dword ptr [reg44+32]
	fldz
	fstp	dword ptr [reg44+36]
	fld	dword ptr [ebp+24]
	fsub	dword ptr [ebp+20]
	fstp	dword ptr [reg44+40]
	fldz
	fstp	dword ptr [reg44+44]
	fld	[___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [reg44+48]
	fld	[___unnamed_float_1]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [reg44+52]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [reg44+56]
	fld1
	fstp	dword ptr [reg44+60]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_make_viewport endp	

_matrix4f_mul proc
	x86instr_create_stack_frame	0
	mov	reg291,[ebp+8]
	mov	reg290,[ebp+16]
	mov	reg289,[ebp+12]
	fld	dword ptr [reg289]
	fmul	dword ptr [reg290]
	fld	dword ptr [reg289+4]
	fmul	dword ptr [reg290+16]
	faddp
	fld	dword ptr [reg289+8]
	fmul	dword ptr [reg290+32]
	faddp
	fld	dword ptr [reg289+12]
	fmul	dword ptr [reg290+48]
	faddp
	fstp	dword ptr [reg291]
	fld	dword ptr [reg289]
	fmul	dword ptr [reg290+4]
	fld	dword ptr [reg289+4]
	fmul	dword ptr [reg290+20]
	faddp
	fld	dword ptr [reg289+8]
	fmul	dword ptr [reg290+36]
	faddp
	fld	dword ptr [reg289+12]
	fmul	dword ptr [reg290+52]
	faddp
	fstp	dword ptr [reg291+4]
	fld	dword ptr [reg289]
	fmul	dword ptr [reg290+8]
	fld	dword ptr [reg289+4]
	fmul	dword ptr [reg290+24]
	faddp
	fld	dword ptr [reg289+8]
	fmul	dword ptr [reg290+40]
	faddp
	fld	dword ptr [reg289+12]
	fmul	dword ptr [reg290+56]
	faddp
	fstp	dword ptr [reg291+8]
	fld	dword ptr [reg289]
	fmul	dword ptr [reg290+12]
	fld	dword ptr [reg289+4]
	fmul	dword ptr [reg290+28]
	faddp
	fld	dword ptr [reg289+8]
	fmul	dword ptr [reg290+44]
	faddp
	fld	dword ptr [reg289+12]
	fmul	dword ptr [reg290+60]
	faddp
	fstp	dword ptr [reg291+12]
	fld	dword ptr [reg289+16]
	fmul	dword ptr [reg290]
	fld	dword ptr [reg289+20]
	fmul	dword ptr [reg290+16]
	faddp
	fld	dword ptr [reg289+24]
	fmul	dword ptr [reg290+32]
	faddp
	fld	dword ptr [reg289+28]
	fmul	dword ptr [reg290+48]
	faddp
	fstp	dword ptr [reg291+16]
	fld	dword ptr [reg289+16]
	fmul	dword ptr [reg290+4]
	fld	dword ptr [reg289+20]
	fmul	dword ptr [reg290+20]
	faddp
	fld	dword ptr [reg289+24]
	fmul	dword ptr [reg290+36]
	faddp
	fld	dword ptr [reg289+28]
	fmul	dword ptr [reg290+52]
	faddp
	fstp	dword ptr [reg291+20]
	fld	dword ptr [reg289+16]
	fmul	dword ptr [reg290+8]
	fld	dword ptr [reg289+20]
	fmul	dword ptr [reg290+24]
	faddp
	fld	dword ptr [reg289+24]
	fmul	dword ptr [reg290+40]
	faddp
	fld	dword ptr [reg289+28]
	fmul	dword ptr [reg290+56]
	faddp
	fstp	dword ptr [reg291+24]
	fld	dword ptr [reg289+16]
	fmul	dword ptr [reg290+12]
	fld	dword ptr [reg289+20]
	fmul	dword ptr [reg290+28]
	faddp
	fld	dword ptr [reg289+24]
	fmul	dword ptr [reg290+44]
	faddp
	fld	dword ptr [reg289+28]
	fmul	dword ptr [reg290+60]
	faddp
	fstp	dword ptr [reg291+28]
	fld	dword ptr [reg289+32]
	fmul	dword ptr [reg290]
	fld	dword ptr [reg289+36]
	fmul	dword ptr [reg290+16]
	faddp
	fld	dword ptr [reg289+40]
	fmul	dword ptr [reg290+32]
	faddp
	fld	dword ptr [reg289+44]
	fmul	dword ptr [reg290+48]
	faddp
	fstp	dword ptr [reg291+32]
	fld	dword ptr [reg289+32]
	fmul	dword ptr [reg290+4]
	fld	dword ptr [reg289+36]
	fmul	dword ptr [reg290+20]
	faddp
	fld	dword ptr [reg289+40]
	fmul	dword ptr [reg290+36]
	faddp
	fld	dword ptr [reg289+44]
	fmul	dword ptr [reg290+52]
	faddp
	fstp	dword ptr [reg291+36]
	fld	dword ptr [reg289+32]
	fmul	dword ptr [reg290+8]
	fld	dword ptr [reg289+36]
	fmul	dword ptr [reg290+24]
	faddp
	fld	dword ptr [reg289+40]
	fmul	dword ptr [reg290+40]
	faddp
	fld	dword ptr [reg289+44]
	fmul	dword ptr [reg290+56]
	faddp
	fstp	dword ptr [reg291+40]
	fld	dword ptr [reg289+32]
	fmul	dword ptr [reg290+12]
	fld	dword ptr [reg289+36]
	fmul	dword ptr [reg290+28]
	faddp
	fld	dword ptr [reg289+40]
	fmul	dword ptr [reg290+44]
	faddp
	fld	dword ptr [reg289+44]
	fmul	dword ptr [reg290+60]
	faddp
	fstp	dword ptr [reg291+44]
	fld	dword ptr [reg289+48]
	fmul	dword ptr [reg290]
	fld	dword ptr [reg289+52]
	fmul	dword ptr [reg290+16]
	faddp
	fld	dword ptr [reg289+56]
	fmul	dword ptr [reg290+32]
	faddp
	fld	dword ptr [reg289+60]
	fmul	dword ptr [reg290+48]
	faddp
	fstp	dword ptr [reg291+48]
	fld	dword ptr [reg289+48]
	fmul	dword ptr [reg290+4]
	fld	dword ptr [reg289+52]
	fmul	dword ptr [reg290+20]
	faddp
	fld	dword ptr [reg289+56]
	fmul	dword ptr [reg290+36]
	faddp
	fld	dword ptr [reg289+60]
	fmul	dword ptr [reg290+52]
	faddp
	fstp	dword ptr [reg291+52]
	fld	dword ptr [reg289+48]
	fmul	dword ptr [reg290+8]
	fld	dword ptr [reg289+52]
	fmul	dword ptr [reg290+24]
	faddp
	fld	dword ptr [reg289+56]
	fmul	dword ptr [reg290+40]
	faddp
	fld	dword ptr [reg289+60]
	fmul	dword ptr [reg290+56]
	faddp
	fstp	dword ptr [reg291+56]
	fld	dword ptr [reg289+48]
	fmul	dword ptr [reg290+12]
	fld	dword ptr [reg289+52]
	fmul	dword ptr [reg290+28]
	faddp
	fld	dword ptr [reg289+56]
	fmul	dword ptr [reg290+44]
	faddp
	fld	dword ptr [reg289+60]
	fmul	dword ptr [reg290+60]
	faddp
	fstp	dword ptr [reg291+60]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_mul endp	

_matrix4f_transform proc
	x86instr_create_stack_frame	0
	mov	reg75,[ebp+8]
	mov	reg74,[ebp+16]
	mov	reg73,[ebp+12]
	fld	dword ptr [reg73]
	fmul	dword ptr [reg74]
	fld	dword ptr [reg73+4]
	fmul	dword ptr [reg74+16]
	faddp
	fld	dword ptr [reg73+8]
	fmul	dword ptr [reg74+32]
	faddp
	fld	dword ptr [reg73+12]
	fmul	dword ptr [reg74+48]
	faddp
	fstp	dword ptr [reg75]
	fld	dword ptr [reg73]
	fmul	dword ptr [reg74+4]
	fld	dword ptr [reg73+4]
	fmul	dword ptr [reg74+20]
	faddp
	fld	dword ptr [reg73+8]
	fmul	dword ptr [reg74+36]
	faddp
	fld	dword ptr [reg73+12]
	fmul	dword ptr [reg74+52]
	faddp
	fstp	dword ptr [reg75+4]
	fld	dword ptr [reg73]
	fmul	dword ptr [reg74+8]
	fld	dword ptr [reg73+4]
	fmul	dword ptr [reg74+24]
	faddp
	fld	dword ptr [reg73+8]
	fmul	dword ptr [reg74+40]
	faddp
	fld	dword ptr [reg73+12]
	fmul	dword ptr [reg74+56]
	faddp
	fstp	dword ptr [reg75+8]
	fld	dword ptr [reg73]
	fmul	dword ptr [reg74+12]
	fld	dword ptr [reg73+4]
	fmul	dword ptr [reg74+28]
	faddp
	fld	dword ptr [reg73+8]
	fmul	dword ptr [reg74+44]
	faddp
	fld	dword ptr [reg73+12]
	fmul	dword ptr [reg74+60]
	faddp
	fstp	dword ptr [reg75+12]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_transform endp	

_matrix4f_transpose proc
	x86instr_create_stack_frame	0
	mov	reg25,[ebp+8]
	fld	dword ptr [reg25+16]
	fstp	dword ptr [reg25+4]
	fld	dword ptr [reg25+32]
	fstp	dword ptr [reg25+8]
	fld	dword ptr [reg25+48]
	fstp	dword ptr [reg25+12]
	fld	dword ptr [reg25+36]
	fstp	dword ptr [reg25+24]
	fld	dword ptr [reg25+52]
	fstp	dword ptr [reg25+28]
	fld	dword ptr [reg25+56]
	fstp	dword ptr [reg25+44]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_transpose endp	

.data

___unnamed_float_2	dd	-1.000000
public	___unnamed_float_2

.code

_rasterizer_init proc
	x86instr_create_stack_frame	8
	mov	reg3,[ebp+8]
	mov	[_dbgprintf],reg3
	mov	reg6,[ebp+12]
	mov	[__width],reg6
	mov	reg9,[ebp+16]
	mov	[__height],reg9
	mov	reg12,[ebp+20]
	mov	[__pitch],reg12
	x86instr_push_all
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp+32]
	push	dword ptr [ebp+28]
	push	dword ptr [ebp+24]
	lea	reg18,[__mvproj_matrix]
	push	reg18
	call	_matrix4f_make_perspective
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	push	dword ptr [ebp+28]
	push	dword ptr [ebp+24]
	fild	dword ptr [ebp+16]
	fstp	dword ptr [esp-4]
	sub	esp,4
	fild	dword ptr [ebp+12]
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg23,[__viewport_matrix]
	push	reg23
	call	_matrix4f_make_viewport
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp+24]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg25,[__clip_z_near_base]
	push	reg25
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
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
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp-4]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg32,[__clip_z_near_norm]
	push	reg32
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp+28]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg34,[__clip_z_far_base]
	push	reg34
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
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
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp-8]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg41,[__clip_z_far_norm]
	push	reg41
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	[___unnamed_float_2]
	fld1
	fild	dword ptr [ebp+12]
	fdivp
	faddp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg44,[__clip_plane_left_base]
	push	reg44
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg45,[__clip_plane_left_norm]
	push	reg45
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld1
	fld1
	fild	dword ptr [ebp+12]
	fdivp
	fsubp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg47,[__clip_plane_right_base]
	push	reg47
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	[___unnamed_float_2]
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg49,[__clip_plane_right_norm]
	push	reg49
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	[___unnamed_float_2]
	fld1
	fild	dword ptr [ebp+16]
	fdivp
	faddp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg52,[__clip_plane_top_base]
	push	reg52
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg53,[__clip_plane_top_norm]
	push	reg53
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg54,[__clip_plane_bottom_base]
	push	reg54
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	[___unnamed_float_2]
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg56,[__clip_plane_bottom_norm]
	push	reg56
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_destroy_stack_frame	8
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	x86instr_create_stack_frame	0
	mov	reg3,[ebp+8]
	mov	[__videomem],reg3
	x86instr_destroy_stack_frame	0
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	x86instr_create_stack_frame	0
	mov	reg2,[ebp+8]
	lea	reg4,[reg2]
	lea	reg5,[__mvproj_matrix]
	mov	reg6,16
label0000:
	mov	reg7,[reg4]
	mov	[reg5],reg7
	dec	reg6
	lea	reg4,[reg4+4]
	lea	reg5,[reg5+4]
	jne	label0000
	x86instr_destroy_stack_frame	0
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	x86instr_create_stack_frame	0
	mov	reg3,[ebp+8]
	mov	[__color],reg3
	x86instr_destroy_stack_frame	0
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	x86instr_create_stack_frame	0
	mov	reg3,[ebp+8]
	mov	[__texture_data],reg3
	mov	reg6,[ebp+12]
	mov	[__texture_width],reg6
	mov	reg9,[ebp+16]
	mov	[__texture_height],reg9
	x86instr_destroy_stack_frame	0
	ret
_rasterizer_set_texture endp	

__tex2d proc
	x86instr_create_stack_frame	12
	mov	reg3,[__texture_width]
	dec	reg3
	mov	[ebp-12],reg3
	fild	dword ptr [ebp-12]
	fmul	dword ptr [ebp+8]
	fistp	dword ptr [ebp-12]
	mov	reg16,[ebp-12]
	mov	reg9,[__texture_height]
	dec	reg9
	mov	[ebp-12],reg9
	fild	dword ptr [ebp-12]
	fmul	dword ptr [ebp+12]
	fistp	dword ptr [ebp-12]
	mov	reg17,[ebp-12]
	mov	reg15,reg17
	imul	reg15,[__texture_width]
	add	reg15,reg16
	sal	reg15,2
	add	reg15,[__texture_data]
	mov	eax,[reg15]
	x86instr_destroy_stack_frame	12
	ret
__tex2d endp	

.data

___unnamed_float_3	dd	255.000000
public	___unnamed_float_3

.code

__rasterize_horiz_line proc
	x86instr_create_stack_frame	48
	mov	reg85,[ebp+8]
	mov	reg80,[__pitch]
	imul	reg80,[ebp+16]
	add	reg80,[__videomem]
	mov	reg7,reg85
	sal	reg7,2
	add	reg80,reg7
	mov	reg83,[ebp+12]
	sal	reg83,2
	add	reg83,reg80
	mov	reg15,reg85
	sal	reg15,2
	sub	reg83,reg15
label0000:
	x86instr_push_all
	push	dword ptr [ebp+24]
	push	dword ptr [ebp+20]
	call	__tex2d
	add	esp,8
	x86instr_pop_all
	mov	reg81,eax
	mov	reg23,reg81
	sar	reg23,24
	and	reg23,255
	mov	[ebp-40],reg23
	cmp	dword ptr [ebp-40],0
	je	label0002
	fild	dword ptr [ebp-40]
	fld	[___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	reg82,[reg80]
	mov	reg36,reg82
	and	reg36,65280
	sar	reg36,8
	mov	[ebp-32],reg36
	mov	reg41,reg82
	and	reg41,255
	mov	[ebp-36],reg41
	mov	reg45,reg81
	and	reg45,65280
	sar	reg45,8
	mov	[ebp-20],reg45
	mov	reg50,reg81
	and	reg50,255
	mov	[ebp-24],reg50
	fild	dword ptr [ebp-20]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-32]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	fistp	dword ptr [ebp-48]
	mov	reg57,[ebp-48]
	mov	[ebp-20],reg57
	fild	dword ptr [ebp-24]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-36]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	fistp	dword ptr [ebp-48]
	mov	reg63,[ebp-48]
	mov	[ebp-24],reg63
	mov	reg84,[ebp-20]
	sal	reg84,8
	add	reg84,[ebp-24]
	mov	[reg80],reg84
label0002:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
	add	reg80,4
	cmp	reg80,reg83
	jle	label0000
label0001:
	x86instr_destroy_stack_frame	48
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	x86instr_create_stack_frame	0
	mov	reg6,[ebp+16]
	mov	reg5,[ebp+12]
	mov	reg4,[ebp+8]
	cmp	reg4,reg5
	jg	label0000
	x86instr_push_all
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [ebp+24]
	push	dword ptr [ebp+20]
	push	reg6
	push	reg5
	push	reg4
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0001
label0000:
	x86instr_push_all
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [ebp+32]
	push	dword ptr [ebp+28]
	push	reg6
	push	reg4
	push	reg5
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
label0001:
	x86instr_destroy_stack_frame	0
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	x86instr_create_stack_frame	0
	mov	reg71,[ebp+24]
	mov	reg70,[ebp+20]
	mov	reg69,[ebp+12]
	mov	reg68,[ebp+8]
	mov	reg67,[ebp+16]
	cmp	reg68,reg69
	jge	label0000
	cmp	reg67,reg69
	jle	label0001
	x86instr_push_all
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [reg71+4]
	push	dword ptr [reg71]
	push	reg70
	push	reg67
	push	reg68
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0002
label0001:
	cmp	reg67,reg68
	jge	label0003
	x86instr_push_all
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	mov	reg22,[ebp+32]
	push	dword ptr [reg22+4]
	mov	reg24,[ebp+32]
	push	dword ptr [reg24]
	push	reg70
	push	reg69
	push	reg67
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0004
label0003:
	x86instr_push_all
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [reg71+4]
	push	dword ptr [reg71]
	push	reg70
	push	reg69
	push	reg68
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
label0004:
label0002:
	jmp	label0005
label0000:
	cmp	reg67,reg69
	jge	label0006
	x86instr_push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	reg43,[ebp+32]
	push	dword ptr [reg43+4]
	mov	reg45,[ebp+32]
	push	dword ptr [reg45]
	push	reg70
	push	reg68
	push	reg67
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0007
label0006:
	cmp	reg67,reg68
	jle	label0008
	x86instr_push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	reg55,[ebp+28]
	push	dword ptr [reg55+4]
	mov	reg57,[ebp+28]
	push	dword ptr [reg57]
	push	reg70
	push	reg67
	push	reg69
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0009
label0008:
	x86instr_push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	reg64,[ebp+28]
	push	dword ptr [reg64+4]
	mov	reg66,[ebp+28]
	push	dword ptr [reg66]
	push	reg70
	push	reg68
	push	reg69
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
label0009:
label0007:
label0005:
	x86instr_destroy_stack_frame	0
	ret
__rasterize_triangle_1i endp	

__rasterize_triangle_2i proc
	x86instr_create_stack_frame	44
	mov	reg484,[ebp+16]
	mov	reg483,[ebp+12]
	mov	reg482,[ebp+8]
	mov	reg7,[reg482+4]
	cmp	reg7,[reg483+4]
	jle	label0000
	mov	[ebp-4],reg482
	mov	reg482,reg483
	mov	reg483,[ebp-4]
label0000:
	mov	reg23,[reg482+4]
	cmp	reg23,[reg484+4]
	jle	label0001
	mov	[ebp-4],reg482
	mov	reg482,reg484
	mov	reg484,[ebp-4]
label0001:
	mov	reg39,[reg483+4]
	cmp	reg39,[reg484+4]
	jle	label0002
	mov	[ebp-4],reg483
	mov	reg483,reg484
	mov	reg484,[ebp-4]
label0002:
	mov	reg55,[reg482+4]
	cmp	reg55,[reg484+4]
	jne	label0003
	cmp	dword ptr [reg482+4],0
	jl	label0004
	mov	reg64,[reg482+4]
	cmp	reg64,[__height]
	jge	label0004
	x86instr_push_all
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	reg66,8
	add	reg66,reg484
	push	reg66
	mov	reg68,8
	add	reg68,reg483
	push	reg68
	mov	reg70,8
	add	reg70,reg482
	push	reg70
	push	dword ptr [reg482+4]
	push	dword ptr [reg484]
	push	dword ptr [reg483]
	push	dword ptr [reg482]
	call	__rasterize_triangle_1i
	add	esp,36
	x86instr_pop_all
label0004:
	x86instr_destroy_stack_frame	44
	ret
label0003:
	mov	reg84,[reg482+4]
	mov	[ebp-16],reg84
label0005:
	mov	reg89,[ebp-16]
	cmp	reg89,[reg483+4]
	jge	label0006
	mov	reg94,[ebp-16]
	sub	reg94,[reg482+4]
	mov	reg99,[reg483]
	sub	reg99,[reg482]
	imul	reg94,reg99
	mov	reg106,[reg483+4]
	sub	reg106,[reg482+4]
	mov	eax,reg94
	cdq
	idiv	reg106
	mov	reg107,eax
	add	reg107,[reg482]
	mov	[ebp-8],reg107
	mov	reg115,[ebp-16]
	sub	reg115,[reg482+4]
	mov	reg120,[reg484]
	sub	reg120,[reg482]
	imul	reg115,reg120
	mov	reg127,[reg484+4]
	sub	reg127,[reg482+4]
	mov	eax,reg115
	cdq
	idiv	reg127
	mov	reg128,eax
	add	reg128,[reg482]
	mov	[ebp-12],reg128
	mov	reg137,[ebp-16]
	sub	reg137,[reg482+4]
	mov	[ebp-44],reg137
	fild	dword ptr [ebp-44]
	fld	dword ptr [reg483+8]
	fsub	dword ptr [reg482+8]
	fmulp
	mov	reg148,[reg483+4]
	sub	reg148,[reg482+4]
	mov	[ebp-44],reg148
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [reg482+8]
	fstp	dword ptr [ebp-20]
	mov	reg156,[ebp-16]
	sub	reg156,[reg482+4]
	mov	[ebp-44],reg156
	fild	dword ptr [ebp-44]
	fld	dword ptr [reg484+8]
	fsub	dword ptr [reg482+8]
	fmulp
	mov	reg167,[reg484+4]
	sub	reg167,[reg482+4]
	mov	[ebp-44],reg167
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [reg482+8]
	fstp	dword ptr [ebp-28]
	mov	reg175,[ebp-16]
	sub	reg175,[reg482+4]
	mov	[ebp-44],reg175
	fild	dword ptr [ebp-44]
	mov	reg177,8
	add	reg177,reg483
	add	reg177,4
	mov	reg180,8
	add	reg180,reg482
	add	reg180,4
	fld	dword ptr [reg177]
	fsub	dword ptr [reg180]
	fmulp
	mov	reg188,[reg483+4]
	sub	reg188,[reg482+4]
	mov	[ebp-44],reg188
	fild	dword ptr [ebp-44]
	fdivp
	mov	reg190,8
	add	reg190,reg482
	add	reg190,4
	fadd	dword ptr [reg190]
	fstp	dword ptr [ebp-24]
	mov	reg197,[ebp-16]
	sub	reg197,[reg482+4]
	mov	[ebp-44],reg197
	fild	dword ptr [ebp-44]
	mov	reg199,8
	add	reg199,reg484
	add	reg199,4
	mov	reg202,8
	add	reg202,reg482
	add	reg202,4
	fld	dword ptr [reg199]
	fsub	dword ptr [reg202]
	fmulp
	mov	reg210,[reg484+4]
	sub	reg210,[reg482+4]
	mov	[ebp-44],reg210
	fild	dword ptr [ebp-44]
	fdivp
	mov	reg212,8
	add	reg212,reg482
	add	reg212,4
	fadd	dword ptr [reg212]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	mov	reg219,[ebp-12]
	sub	reg219,[ebp-8]
	mov	[ebp-44],reg219
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	mov	reg225,[ebp-12]
	sub	reg225,[ebp-8]
	mov	[ebp-44],reg225
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-40]
	x86instr_push_all
	push	dword ptr [ebp-40]
	push	dword ptr [ebp-36]
	push	dword ptr [ebp-32]
	push	dword ptr [ebp-28]
	push	dword ptr [ebp-24]
	push	dword ptr [ebp-20]
	push	dword ptr [ebp-16]
	push	dword ptr [ebp-12]
	push	dword ptr [ebp-8]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	x86instr_pop_all
	inc	dword ptr [ebp-16]
	jmp	label0005
label0006:
	mov	reg242,[reg483+4]
	sub	reg242,[reg482+4]
	mov	reg247,[reg484]
	sub	reg247,[reg482]
	imul	reg242,reg247
	mov	reg254,[reg484+4]
	sub	reg254,[reg482+4]
	mov	eax,reg242
	cdq
	idiv	reg254
	mov	reg255,eax
	add	reg255,[reg482]
	mov	[ebp-12],reg255
	mov	reg266,[reg483+4]
	sub	reg266,[reg482+4]
	mov	[ebp-44],reg266
	fild	dword ptr [ebp-44]
	fld	dword ptr [reg484+8]
	fsub	dword ptr [reg482+8]
	fmulp
	mov	reg277,[reg484+4]
	sub	reg277,[reg482+4]
	mov	[ebp-44],reg277
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [reg482+8]
	fstp	dword ptr [ebp-28]
	mov	reg287,[reg483+4]
	sub	reg287,[reg482+4]
	mov	[ebp-44],reg287
	fild	dword ptr [ebp-44]
	mov	reg289,8
	add	reg289,reg484
	add	reg289,4
	mov	reg292,8
	add	reg292,reg482
	add	reg292,4
	fld	dword ptr [reg289]
	fsub	dword ptr [reg292]
	fmulp
	mov	reg300,[reg484+4]
	sub	reg300,[reg482+4]
	mov	[ebp-44],reg300
	fild	dword ptr [ebp-44]
	fdivp
	mov	reg302,8
	add	reg302,reg482
	add	reg302,4
	fadd	dword ptr [reg302]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [reg483+8]
	mov	reg311,[ebp-12]
	sub	reg311,[reg483]
	mov	[ebp-44],reg311
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-36]
	mov	reg315,8
	add	reg315,reg483
	add	reg315,4
	fld	dword ptr [ebp-32]
	fsub	dword ptr [reg315]
	mov	reg320,[ebp-12]
	sub	reg320,[reg483]
	mov	[ebp-44],reg320
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-40]
	x86instr_push_all
	push	dword ptr [ebp-40]
	push	dword ptr [ebp-36]
	mov	reg324,8
	add	reg324,reg483
	add	reg324,4
	push	dword ptr [reg324]
	push	dword ptr [reg483+8]
	push	dword ptr [ebp-32]
	push	dword ptr [ebp-28]
	push	dword ptr [reg483+4]
	push	dword ptr [reg483]
	push	dword ptr [ebp-12]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	x86instr_pop_all
	mov	reg339,1
	add	reg339,[reg483+4]
	mov	[ebp-16],reg339
label0007:
	mov	reg345,[ebp-16]
	cmp	reg345,[reg484+4]
	jge	label0008
	mov	reg350,[ebp-16]
	sub	reg350,[reg483+4]
	mov	reg355,[reg484]
	sub	reg355,[reg483]
	imul	reg350,reg355
	mov	reg362,[reg484+4]
	sub	reg362,[reg483+4]
	mov	eax,reg350
	cdq
	idiv	reg362
	mov	reg363,eax
	add	reg363,[reg483]
	mov	[ebp-8],reg363
	mov	reg371,[ebp-16]
	sub	reg371,[reg482+4]
	mov	reg376,[reg484]
	sub	reg376,[reg482]
	imul	reg371,reg376
	mov	reg383,[reg484+4]
	sub	reg383,[reg482+4]
	mov	eax,reg371
	cdq
	idiv	reg383
	mov	reg384,eax
	add	reg384,[reg482]
	mov	[ebp-12],reg384
	mov	reg393,[ebp-16]
	sub	reg393,[reg483+4]
	mov	[ebp-44],reg393
	fild	dword ptr [ebp-44]
	fld	dword ptr [reg484+8]
	fsub	dword ptr [reg483+8]
	fmulp
	mov	reg404,[reg484+4]
	sub	reg404,[reg483+4]
	mov	[ebp-44],reg404
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [reg483+8]
	fstp	dword ptr [ebp-20]
	mov	reg412,[ebp-16]
	sub	reg412,[reg482+4]
	mov	[ebp-44],reg412
	fild	dword ptr [ebp-44]
	fld	dword ptr [reg484+8]
	fsub	dword ptr [reg482+8]
	fmulp
	mov	reg423,[reg484+4]
	sub	reg423,[reg482+4]
	mov	[ebp-44],reg423
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [reg482+8]
	fstp	dword ptr [ebp-28]
	mov	reg431,[ebp-16]
	sub	reg431,[reg483+4]
	mov	[ebp-44],reg431
	fild	dword ptr [ebp-44]
	mov	reg433,8
	add	reg433,reg484
	add	reg433,4
	mov	reg436,8
	add	reg436,reg483
	add	reg436,4
	fld	dword ptr [reg433]
	fsub	dword ptr [reg436]
	fmulp
	mov	reg444,[reg484+4]
	sub	reg444,[reg483+4]
	mov	[ebp-44],reg444
	fild	dword ptr [ebp-44]
	fdivp
	mov	reg446,8
	add	reg446,reg483
	add	reg446,4
	fadd	dword ptr [reg446]
	fstp	dword ptr [ebp-24]
	mov	reg453,[ebp-16]
	sub	reg453,[reg482+4]
	mov	[ebp-44],reg453
	fild	dword ptr [ebp-44]
	mov	reg455,8
	add	reg455,reg484
	add	reg455,4
	mov	reg458,8
	add	reg458,reg482
	add	reg458,4
	fld	dword ptr [reg455]
	fsub	dword ptr [reg458]
	fmulp
	mov	reg466,[reg484+4]
	sub	reg466,[reg482+4]
	mov	[ebp-44],reg466
	fild	dword ptr [ebp-44]
	fdivp
	mov	reg468,8
	add	reg468,reg482
	add	reg468,4
	fadd	dword ptr [reg468]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	mov	reg475,[ebp-12]
	sub	reg475,[ebp-8]
	mov	[ebp-44],reg475
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	mov	reg481,[ebp-12]
	sub	reg481,[ebp-8]
	mov	[ebp-44],reg481
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-40]
	x86instr_push_all
	push	dword ptr [ebp-40]
	push	dword ptr [ebp-36]
	push	dword ptr [ebp-32]
	push	dword ptr [ebp-28]
	push	dword ptr [ebp-24]
	push	dword ptr [ebp-20]
	push	dword ptr [ebp-16]
	push	dword ptr [ebp-12]
	push	dword ptr [ebp-8]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	x86instr_pop_all
	inc	dword ptr [ebp-16]
	jmp	label0007
label0008:
	x86instr_destroy_stack_frame	44
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	x86instr_create_stack_frame	60
	mov	reg100,[ebp+8]
	mov	dword ptr [reg100+192],0
	mov	reg101,[ebp+12]
	mov	reg102,[ebp+12]
	add	reg102,24
label0000:
	mov	reg13,[ebp+12]
	imul	reg14,[reg13+192],24
	mov	reg16,[ebp+12]
	add	reg16,reg14
	cmp	reg102,reg16
	jge	label0001
	x86instr_push_all
	push	dword ptr [ebp+16]
	mov	reg19,reg101
	push	reg19
	lea	reg20,[ebp-24]
	push	reg20
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	push	dword ptr [ebp+20]
	lea	reg23,[ebp-24]
	push	reg23
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	fstp	dword ptr [ebp-52]
	x86instr_push_all
	push	dword ptr [ebp+16]
	mov	reg26,reg102
	push	reg26
	lea	reg27,[ebp-24]
	push	reg27
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	push	dword ptr [ebp+20]
	lea	reg30,[ebp-24]
	push	reg30
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	fstp	dword ptr [ebp-56]
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jb	label0002
	mov	reg34,[reg100+192]
	inc	dword ptr [reg100+192]
	imul	reg34,24
	mov	reg37,reg100
	add	reg37,reg34
	mov	reg40,[reg101]
	mov	reg41,[reg101+4]
	mov	[reg37],reg40
	mov	[reg37+4],reg41
	mov	reg40,[reg101+8]
	mov	reg41,[reg101+12]
	mov	[reg37+8],reg40
	mov	[reg37+12],reg41
	mov	reg40,[reg101+16]
	mov	reg41,[reg101+20]
	mov	[reg37+16],reg40
	mov	[reg37+20],reg41
label0002:
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jbe	label0005
	fldz
	fld	dword ptr [ebp-56]
	fucomip	st,st(1)
	fstp	st
	jb	label0004
label0005:
	fldz
	fld	dword ptr [ebp-56]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jae	label0003
label0004:
	x86instr_push_all
	mov	reg47,reg101
	push	reg47
	push	dword ptr [ebp+16]
	lea	reg49,[ebp-24]
	push	reg49
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	mov	reg51,reg101
	push	reg51
	mov	reg53,reg102
	push	reg53
	lea	reg54,[ebp-40]
	push	reg54
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	push	dword ptr [ebp+20]
	lea	reg57,[ebp-24]
	push	reg57
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	x86instr_push_all
	push	dword ptr [ebp+20]
	lea	reg59,[ebp-40]
	push	reg59
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	fdivp
	fstp	dword ptr [ebp-60]
	x86instr_push_all
	push	dword ptr [ebp-60]
	lea	reg61,[ebp-40]
	push	reg61
	call	_vec4f_mul
	add	esp,8
	x86instr_pop_all
	x86instr_push_all
	lea	reg62,[ebp-40]
	push	reg62
	mov	reg64,reg101
	push	reg64
	imul	reg67,[reg100+192],24
	mov	reg69,reg100
	add	reg69,reg67
	push	reg69
	call	_vec4f_add
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	mov	reg71,16
	add	reg71,reg101
	push	reg71
	mov	reg73,16
	add	reg73,reg102
	push	reg73
	lea	reg74,[ebp-48]
	push	reg74
	call	_vec2f_subtract
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	push	dword ptr [ebp-60]
	lea	reg76,[ebp-48]
	push	reg76
	call	_vec2f_mul
	add	esp,8
	x86instr_pop_all
	x86instr_push_all
	lea	reg77,[ebp-48]
	push	reg77
	mov	reg79,16
	add	reg79,reg101
	push	reg79
	imul	reg82,[reg100+192],24
	mov	reg84,reg100
	add	reg84,reg82
	add	reg84,16
	push	reg84
	call	_vec2f_add
	add	esp,12
	x86instr_pop_all
	inc	dword ptr [reg100+192]
label0003:
	add	reg101,24
	add	reg102,24
	jmp	label0000
label0001:
	mov	reg92,[reg100+192]
	inc	dword ptr [reg100+192]
	imul	reg92,24
	mov	reg95,reg100
	add	reg95,reg92
	mov	reg98,[reg100]
	mov	reg99,[reg100+4]
	mov	[reg95],reg98
	mov	[reg95+4],reg99
	mov	reg98,[reg100+8]
	mov	reg99,[reg100+12]
	mov	[reg95+8],reg98
	mov	[reg95+12],reg99
	mov	reg98,[reg100+16]
	mov	reg99,[reg100+20]
	mov	[reg95+16],reg98
	mov	[reg95+20],reg99
	x86instr_destroy_stack_frame	60
	ret
__clip_on_plain endp	

__clip_poligon proc
	x86instr_create_stack_frame	196
	mov	reg29,[ebp+8]
	x86instr_push_all
	lea	reg1,[__clip_z_far_norm]
	push	reg1
	lea	reg2,[__clip_z_far_base]
	push	reg2
	push	reg29
	lea	reg4,[ebp-196]
	push	reg4
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg5,[__clip_z_near_norm]
	push	reg5
	lea	reg6,[__clip_z_near_base]
	push	reg6
	lea	reg7,[ebp-196]
	push	reg7
	push	reg29
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg9,[__clip_plane_left_norm]
	push	reg9
	lea	reg10,[__clip_plane_left_base]
	push	reg10
	push	reg29
	lea	reg12,[ebp-196]
	push	reg12
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg13,[__clip_plane_right_norm]
	push	reg13
	lea	reg14,[__clip_plane_right_base]
	push	reg14
	lea	reg15,[ebp-196]
	push	reg15
	push	reg29
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg17,[__clip_plane_top_norm]
	push	reg17
	lea	reg18,[__clip_plane_top_base]
	push	reg18
	push	reg29
	lea	reg20,[ebp-196]
	push	reg20
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg21,[__clip_plane_bottom_norm]
	push	reg21
	lea	reg22,[__clip_plane_bottom_base]
	push	reg22
	lea	reg23,[ebp-196]
	push	reg23
	push	reg29
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	cmp	dword ptr [reg29+192],1
	setg	al
	movzx	reg28,al
	mov	eax,reg28
	x86instr_destroy_stack_frame	196
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	x86instr_create_stack_frame	24
	mov	reg32,[ebp+8]
	x86instr_push_all
	lea	reg1,[__viewport_matrix]
	push	reg1
	push	dword ptr [ebp+12]
	lea	reg3,[ebp-16]
	push	reg3
	call	_matrix4f_transform
	add	esp,12
	x86instr_pop_all
	fld1
	lea	reg5,[ebp-16]
	add	reg5,12
	fdiv	dword ptr [reg5]
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [ebp-20]
	fistp	dword ptr [ebp-24]
	mov	reg11,[ebp-24]
	mov	[reg32],reg11
	lea	reg12,[ebp-16]
	add	reg12,4
	fld	dword ptr [reg12]
	fmul	dword ptr [ebp-20]
	fistp	dword ptr [ebp-24]
	mov	reg17,[ebp-24]
	mov	[reg32+4],reg17
	cmp	dword ptr [reg32],0
	jl	label0001
	mov	reg24,[reg32]
	cmp	reg24,[__width]
	jge	label0001
	cmp	dword ptr [reg32+4],0
	jl	label0001
	mov	reg31,[reg32+4]
	cmp	reg31,[__height]
	jl	label0000
label0001:
	mov	dword ptr ds:[0],0
label0000:
	x86instr_destroy_stack_frame	24
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	x86instr_create_stack_frame	136
	mov	reg53,[ebp+8]
	x86instr_push_all
	push	reg53
	call	__clip_poligon
	add	esp,4
	x86instr_pop_all
	mov	reg2,eax
	cmp	reg2,0
	jne	label0000
	x86instr_destroy_stack_frame	136
	ret
label0000:
	cmp	dword ptr [reg53+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	reg52,0
label0002:
	cmp	reg52,[reg53+192]
	jge	label0003
	x86instr_push_all
	mov	reg15,reg53
	imul	reg17,reg52,24
	add	reg15,reg17
	push	reg15
	lea	reg18,[ebp-132]
	mov	reg21,reg52
	sal	reg21,4
	add	reg18,reg21
	push	reg18
	call	__transform_to_screen_space
	add	esp,8
	x86instr_pop_all
	lea	reg22,[ebp-132]
	mov	reg25,reg52
	sal	reg25,4
	add	reg22,reg25
	add	reg22,8
	mov	reg28,reg53
	imul	reg30,reg52,24
	add	reg28,reg30
	add	reg28,16
	mov	reg32,[reg28]
	mov	reg33,[reg28+4]
	mov	[reg22],reg32
	mov	[reg22+4],reg33
	inc	reg52
	jmp	label0002
label0003:
	mov	reg52,2
label0004:
	mov	reg41,[reg53+192]
	dec	reg41
	cmp	reg52,reg41
	jge	label0005
	x86instr_push_all
	lea	reg42,[ebp-132]
	mov	reg45,reg52
	sal	reg45,4
	add	reg42,reg45
	push	reg42
	mov	reg48,reg52
	dec	reg48
	sal	reg48,4
	lea	reg50,[ebp-132]
	add	reg50,reg48
	push	reg50
	lea	reg51,[ebp-132]
	push	reg51
	call	__rasterize_triangle_2i
	add	esp,12
	x86instr_pop_all
	inc	reg52
	jmp	label0004
label0005:
	x86instr_destroy_stack_frame	136
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	x86instr_create_stack_frame	16
	mov	reg10,[ebp+12]
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [reg10+8]
	push	dword ptr [reg10+4]
	push	dword ptr [reg10]
	lea	reg7,[ebp-16]
	push	reg7
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	lea	reg8,[__mvproj_matrix]
	push	reg8
	lea	reg9,[ebp-16]
	push	reg9
	push	dword ptr [ebp+8]
	call	_matrix4f_transform
	add	esp,12
	x86instr_pop_all
	x86instr_destroy_stack_frame	16
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	x86instr_create_stack_frame	196
	x86instr_push_all
	push	dword ptr [ebp+8]
	lea	reg2,[ebp-196]
	push	reg2
	call	__transform_to_projection_space
	add	esp,8
	x86instr_pop_all
	lea	reg3,[ebp-196]
	add	reg3,16
	mov	reg6,[ebp+20]
	mov	reg7,[reg6]
	mov	reg8,[reg6+4]
	mov	[reg3],reg7
	mov	[reg3+4],reg8
	x86instr_push_all
	push	dword ptr [ebp+12]
	lea	reg10,[ebp-196]
	add	reg10,24
	push	reg10
	call	__transform_to_projection_space
	add	esp,8
	x86instr_pop_all
	lea	reg12,[ebp-196]
	add	reg12,24
	add	reg12,16
	mov	reg16,[ebp+24]
	mov	reg17,[reg16]
	mov	reg18,[reg16+4]
	mov	[reg12],reg17
	mov	[reg12+4],reg18
	x86instr_push_all
	push	dword ptr [ebp+16]
	lea	reg20,[ebp-196]
	add	reg20,48
	push	reg20
	call	__transform_to_projection_space
	add	esp,8
	x86instr_pop_all
	lea	reg22,[ebp-196]
	add	reg22,48
	add	reg22,16
	mov	reg26,[ebp+28]
	mov	reg27,[reg26]
	mov	reg28,[reg26+4]
	mov	[reg22],reg27
	mov	[reg22+4],reg28
	lea	reg29,[ebp-196]
	add	reg29,72
	mov	reg32,[ebp-196]
	mov	reg33,[ebp-192]
	mov	[reg29],reg32
	mov	[reg29+4],reg33
	mov	reg32,[ebp-188]
	mov	reg33,[ebp-184]
	mov	[reg29+8],reg32
	mov	[reg29+12],reg33
	mov	reg32,[ebp-180]
	mov	reg33,[ebp-176]
	mov	[reg29+16],reg32
	mov	[reg29+20],reg33
	lea	reg34,[ebp-196]
	add	reg34,192
	mov	dword ptr [reg34],4
	x86instr_push_all
	lea	reg37,[ebp-196]
	push	reg37
	call	__rasterize_polygon_4f
	add	esp,4
	x86instr_pop_all
	x86instr_destroy_stack_frame	196
	ret
_rasterizer_triangle3f endp	

end
