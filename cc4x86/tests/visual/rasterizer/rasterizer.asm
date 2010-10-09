
.686
.model flat

.data

_dbgprintf	dd	?
__width	dd	?
__height	dd	?
__pitch	dd	?
__color	dd	?
__videomem	dd	?
__mvproj_matrix	db	 64 dup (?)
__viewport_matrix	db	 64 dup (?)
__clip_z_near_base	db	 16 dup (?)
__clip_z_near_norm	db	 16 dup (?)
__clip_z_far_base	db	 16 dup (?)
__clip_z_far_norm	db	 16 dup (?)
__clip_plane_left_base	db	 16 dup (?)
__clip_plane_left_norm	db	 16 dup (?)
__clip_plane_right_base	db	 16 dup (?)
__clip_plane_right_norm	db	 16 dup (?)
__clip_plane_top_base	db	 16 dup (?)
__clip_plane_top_norm	db	 16 dup (?)
__clip_plane_bottom_base	db	 16 dup (?)
__clip_plane_bottom_norm	db	 16 dup (?)
__texture_data	dd	?
__texture_width	dd	?
__texture_height	dd	?

.code

_vec2f_add proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	fld	dword ptr [esi]
	fadd	dword ptr [edi]
	fstp	dword ptr [ebx]
	fld	dword ptr [esi+4]
	fadd	dword ptr [edi+4]
	fstp	dword ptr [ebx+4]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
_vec2f_add endp	

_vec2f_subtract proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	fld	dword ptr [esi]
	fsub	dword ptr [edi]
	fstp	dword ptr [ebx]
	fld	dword ptr [esi+4]
	fsub	dword ptr [edi+4]
	fstp	dword ptr [ebx+4]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	fld	dword ptr [edi]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [edi]
	fld	dword ptr [edi+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [edi+4]
	pop	edi
	pop	ebp
	ret
_vec2f_mul endp	

_vec4f_assign proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	fld	dword ptr [ebp+12]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp+16]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [edi+12]
	pop	edi
	pop	ebp
	ret
_vec4f_assign endp	

_vec4f_add proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	fld	dword ptr [esi]
	fadd	dword ptr [edi]
	fstp	dword ptr [ebx]
	fld	dword ptr [esi+4]
	fadd	dword ptr [edi+4]
	fstp	dword ptr [ebx+4]
	fld	dword ptr [esi+8]
	fadd	dword ptr [edi+8]
	fstp	dword ptr [ebx+8]
	fld	dword ptr [esi+12]
	fadd	dword ptr [edi+12]
	fstp	dword ptr [ebx+12]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
_vec4f_add endp	

_vec4f_subtract proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	fld	dword ptr [esi]
	fsub	dword ptr [edi]
	fstp	dword ptr [ebx]
	fld	dword ptr [esi+4]
	fsub	dword ptr [edi+4]
	fstp	dword ptr [ebx+4]
	fld	dword ptr [esi+8]
	fsub	dword ptr [edi+8]
	fstp	dword ptr [ebx+8]
	fld	dword ptr [esi+12]
	fsub	dword ptr [edi+12]
	fstp	dword ptr [ebx+12]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	mov	edi,[ebp+12]
	mov	esi,[ebp+8]
	fld	dword ptr [esi]
	fmul	dword ptr [edi]
	fld	dword ptr [esi+4]
	fmul	dword ptr [edi+4]
	faddp
	fld	dword ptr [esi+8]
	fmul	dword ptr [edi+8]
	faddp
	fld	dword ptr [esi+12]
	fmul	dword ptr [edi+12]
	faddp
	pop	esi
	pop	edi
	pop	ebp
	ret
_vec4f_dot endp	

_vec4f_mul proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	fld	dword ptr [edi]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [edi]
	fld	dword ptr [edi+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [edi+4]
	fld	dword ptr [edi+8]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [edi+8]
	fld	dword ptr [edi+12]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [edi+12]
	pop	edi
	pop	ebp
	ret
_vec4f_mul endp	

.data

___unnamed_float_0	dd	0.000100

.code

_vec4f_is_equal proc
	push	ebp
	mov	ebp,esp
	sub	esp,20
	push	dword ptr [ebp+12]
	push	dword ptr [ebp+8]
	lea	eax,[ebp-16]
	push	eax
	call	_vec4f_subtract
	add	esp,12
	lea	eax,[ebp-16]
	push	eax
	lea	eax,[ebp-16]
	push	eax
	call	_vec4f_dot
	add	esp,8
	fstp	dword ptr [ebp-20]
	fld	[___unnamed_float_0]
	fld	dword ptr [ebp-20]
	fucomip	st,st(1)
	fstp	st
	setb	al
	movzx	eax,al
	add	esp,20
	pop	ebp
	ret
_vec4f_is_equal endp	

_matrix4f_make_identity proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	fld1
	fstp	dword ptr [edi]
	fldz
	fstp	dword ptr [edi+4]
	fldz
	fstp	dword ptr [edi+8]
	fldz
	fstp	dword ptr [edi+12]
	fldz
	fstp	dword ptr [edi+16]
	fld1
	fstp	dword ptr [edi+20]
	fldz
	fstp	dword ptr [edi+24]
	fldz
	fstp	dword ptr [edi+28]
	fldz
	fstp	dword ptr [edi+32]
	fldz
	fstp	dword ptr [edi+36]
	fld1
	fstp	dword ptr [edi+40]
	fldz
	fstp	dword ptr [edi+44]
	fldz
	fstp	dword ptr [edi+48]
	fldz
	fstp	dword ptr [edi+52]
	fldz
	fstp	dword ptr [edi+56]
	fld1
	fstp	dword ptr [edi+60]
	pop	edi
	pop	ebp
	ret
_matrix4f_make_identity endp	

_matrix4f_make_perspective proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	edi
	mov	edi,[ebp+8]
	fld	dword ptr [ebp+20]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp-4]
	fmul	dword ptr [ebp+24]
	fstp	dword ptr [ebp-8]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-8]
	fstp	dword ptr [edi]
	fldz
	fstp	dword ptr [edi+4]
	fldz
	fstp	dword ptr [edi+8]
	fldz
	fstp	dword ptr [edi+12]
	fldz
	fstp	dword ptr [edi+16]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-4]
	fstp	dword ptr [edi+20]
	fldz
	fstp	dword ptr [edi+24]
	fldz
	fstp	dword ptr [edi+28]
	fldz
	fstp	dword ptr [edi+32]
	fldz
	fstp	dword ptr [edi+36]
	fld	dword ptr [ebp+16]
	fsub	dword ptr [ebp+12]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [edi+40]
	fld1
	fstp	dword ptr [edi+44]
	fldz
	fstp	dword ptr [edi+48]
	fldz
	fstp	dword ptr [edi+52]
	fld	dword ptr [ebp+12]
	fmul	dword ptr [ebp+16]
	fld	dword ptr [ebp+12]
	fsub	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [edi+56]
	fldz
	fstp	dword ptr [edi+60]
	pop	edi
	add	esp,8
	pop	ebp
	ret
_matrix4f_make_perspective endp	

.data

___unnamed_float_1	dd	2.000000

.code

_matrix4f_make_viewport proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	fld	[___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [edi]
	fldz
	fstp	dword ptr [edi+4]
	fldz
	fstp	dword ptr [edi+8]
	fldz
	fstp	dword ptr [edi+12]
	fldz
	fstp	dword ptr [edi+16]
	fld	dword ptr [ebp+16]
	fldz
	fsubrp
	fld	[___unnamed_float_1]
	fdivp
	fstp	dword ptr [edi+20]
	fldz
	fstp	dword ptr [edi+24]
	fldz
	fstp	dword ptr [edi+28]
	fldz
	fstp	dword ptr [edi+32]
	fldz
	fstp	dword ptr [edi+36]
	fld	dword ptr [ebp+24]
	fsub	dword ptr [ebp+20]
	fstp	dword ptr [edi+40]
	fldz
	fstp	dword ptr [edi+44]
	fld	[___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [edi+48]
	fld	[___unnamed_float_1]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [edi+52]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [edi+56]
	fld1
	fstp	dword ptr [edi+60]
	pop	edi
	pop	ebp
	ret
_matrix4f_make_viewport endp	

_matrix4f_mul proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+8]
	mov	esi,[ebp+16]
	mov	ebx,[ebp+12]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+16]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [esi+32]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [esi+48]
	faddp
	fstp	dword ptr [edi]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi+4]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+20]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [esi+36]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [esi+52]
	faddp
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi+8]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+24]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [esi+40]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [esi+56]
	faddp
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi+12]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+28]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [esi+44]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [esi+60]
	faddp
	fstp	dword ptr [edi+12]
	fld	dword ptr [ebx+16]
	fmul	dword ptr [esi]
	fld	dword ptr [ebx+20]
	fmul	dword ptr [esi+16]
	faddp
	fld	dword ptr [ebx+24]
	fmul	dword ptr [esi+32]
	faddp
	fld	dword ptr [ebx+28]
	fmul	dword ptr [esi+48]
	faddp
	fstp	dword ptr [edi+16]
	fld	dword ptr [ebx+16]
	fmul	dword ptr [esi+4]
	fld	dword ptr [ebx+20]
	fmul	dword ptr [esi+20]
	faddp
	fld	dword ptr [ebx+24]
	fmul	dword ptr [esi+36]
	faddp
	fld	dword ptr [ebx+28]
	fmul	dword ptr [esi+52]
	faddp
	fstp	dword ptr [edi+20]
	fld	dword ptr [ebx+16]
	fmul	dword ptr [esi+8]
	fld	dword ptr [ebx+20]
	fmul	dword ptr [esi+24]
	faddp
	fld	dword ptr [ebx+24]
	fmul	dword ptr [esi+40]
	faddp
	fld	dword ptr [ebx+28]
	fmul	dword ptr [esi+56]
	faddp
	fstp	dword ptr [edi+24]
	fld	dword ptr [ebx+16]
	fmul	dword ptr [esi+12]
	fld	dword ptr [ebx+20]
	fmul	dword ptr [esi+28]
	faddp
	fld	dword ptr [ebx+24]
	fmul	dword ptr [esi+44]
	faddp
	fld	dword ptr [ebx+28]
	fmul	dword ptr [esi+60]
	faddp
	fstp	dword ptr [edi+28]
	fld	dword ptr [ebx+32]
	fmul	dword ptr [esi]
	fld	dword ptr [ebx+36]
	fmul	dword ptr [esi+16]
	faddp
	fld	dword ptr [ebx+40]
	fmul	dword ptr [esi+32]
	faddp
	fld	dword ptr [ebx+44]
	fmul	dword ptr [esi+48]
	faddp
	fstp	dword ptr [edi+32]
	fld	dword ptr [ebx+32]
	fmul	dword ptr [esi+4]
	fld	dword ptr [ebx+36]
	fmul	dword ptr [esi+20]
	faddp
	fld	dword ptr [ebx+40]
	fmul	dword ptr [esi+36]
	faddp
	fld	dword ptr [ebx+44]
	fmul	dword ptr [esi+52]
	faddp
	fstp	dword ptr [edi+36]
	fld	dword ptr [ebx+32]
	fmul	dword ptr [esi+8]
	fld	dword ptr [ebx+36]
	fmul	dword ptr [esi+24]
	faddp
	fld	dword ptr [ebx+40]
	fmul	dword ptr [esi+40]
	faddp
	fld	dword ptr [ebx+44]
	fmul	dword ptr [esi+56]
	faddp
	fstp	dword ptr [edi+40]
	fld	dword ptr [ebx+32]
	fmul	dword ptr [esi+12]
	fld	dword ptr [ebx+36]
	fmul	dword ptr [esi+28]
	faddp
	fld	dword ptr [ebx+40]
	fmul	dword ptr [esi+44]
	faddp
	fld	dword ptr [ebx+44]
	fmul	dword ptr [esi+60]
	faddp
	fstp	dword ptr [edi+44]
	fld	dword ptr [ebx+48]
	fmul	dword ptr [esi]
	fld	dword ptr [ebx+52]
	fmul	dword ptr [esi+16]
	faddp
	fld	dword ptr [ebx+56]
	fmul	dword ptr [esi+32]
	faddp
	fld	dword ptr [ebx+60]
	fmul	dword ptr [esi+48]
	faddp
	fstp	dword ptr [edi+48]
	fld	dword ptr [ebx+48]
	fmul	dword ptr [esi+4]
	fld	dword ptr [ebx+52]
	fmul	dword ptr [esi+20]
	faddp
	fld	dword ptr [ebx+56]
	fmul	dword ptr [esi+36]
	faddp
	fld	dword ptr [ebx+60]
	fmul	dword ptr [esi+52]
	faddp
	fstp	dword ptr [edi+52]
	fld	dword ptr [ebx+48]
	fmul	dword ptr [esi+8]
	fld	dword ptr [ebx+52]
	fmul	dword ptr [esi+24]
	faddp
	fld	dword ptr [ebx+56]
	fmul	dword ptr [esi+40]
	faddp
	fld	dword ptr [ebx+60]
	fmul	dword ptr [esi+56]
	faddp
	fstp	dword ptr [edi+56]
	fld	dword ptr [ebx+48]
	fmul	dword ptr [esi+12]
	fld	dword ptr [ebx+52]
	fmul	dword ptr [esi+28]
	faddp
	fld	dword ptr [ebx+56]
	fmul	dword ptr [esi+44]
	faddp
	fld	dword ptr [ebx+60]
	fmul	dword ptr [esi+60]
	faddp
	fstp	dword ptr [edi+60]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
_matrix4f_mul endp	

_matrix4f_transform proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+8]
	mov	esi,[ebp+16]
	mov	ebx,[ebp+12]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+16]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [esi+32]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [esi+48]
	faddp
	fstp	dword ptr [edi]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi+4]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+20]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [esi+36]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [esi+52]
	faddp
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi+8]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+24]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [esi+40]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [esi+56]
	faddp
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi+12]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+28]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [esi+44]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [esi+60]
	faddp
	fstp	dword ptr [edi+12]
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
_matrix4f_transform endp	

_matrix4f_transpose proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	fld	dword ptr [edi+16]
	fstp	dword ptr [edi+4]
	fld	dword ptr [edi+32]
	fstp	dword ptr [edi+8]
	fld	dword ptr [edi+48]
	fstp	dword ptr [edi+12]
	fld	dword ptr [edi+36]
	fstp	dword ptr [edi+24]
	fld	dword ptr [edi+52]
	fstp	dword ptr [edi+28]
	fld	dword ptr [edi+56]
	fstp	dword ptr [edi+44]
	pop	edi
	pop	ebp
	ret
_matrix4f_transpose endp	

.data

___unnamed_float_2	dd	-1.000000

.code

_rasterizer_init proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
	mov	eax,[ebp+8]
	mov	[_dbgprintf],eax
	mov	eax,[ebp+12]
	mov	[__width],eax
	mov	eax,[ebp+16]
	mov	[__height],eax
	mov	eax,[ebp+20]
	mov	[__pitch],eax
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp+32]
	push	dword ptr [ebp+28]
	push	dword ptr [ebp+24]
	lea	eax,[__mvproj_matrix]
	push	eax
	call	_matrix4f_make_perspective
	add	esp,20
	push	dword ptr [ebp+28]
	push	dword ptr [ebp+24]
	fild	dword ptr [ebp+16]
	fstp	dword ptr [esp-4]
	sub	esp,4
	fild	dword ptr [ebp+12]
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	eax,[__viewport_matrix]
	push	eax
	call	_matrix4f_make_viewport
	add	esp,20
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
	lea	eax,[__clip_z_near_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_z_near_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_z_far_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_z_far_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_plane_left_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_plane_left_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_plane_right_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_plane_right_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_plane_top_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_plane_top_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_plane_bottom_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	lea	eax,[__clip_plane_bottom_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
	add	esp,8
	pop	ebp
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	mov	[__videomem],eax
	pop	ebp
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	push	ebp
	mov	ebp,esp
	push	ebx
	mov	eax,[ebp+8]
	lea	ecx,[eax]
	lea	eax,[__mvproj_matrix]
	mov	edx,16
label0000:
	mov	ebx,[ecx]
	mov	[eax],ebx
	dec	edx
	lea	ecx,[ecx+4]
	lea	eax,[eax+4]
	jne	label0000
	pop	ebx
	pop	ebp
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	mov	[__color],eax
	pop	ebp
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	mov	[__texture_data],eax
	mov	eax,[ebp+12]
	mov	[__texture_width],eax
	mov	eax,[ebp+16]
	mov	[__texture_height],eax
	pop	ebp
	ret
_rasterizer_set_texture endp	

__tex2d proc
	push	ebp
	mov	ebp,esp
	sub	esp,12
	push	edi
	push	esi
	mov	eax,[__texture_width]
	dec	eax
	mov	[ebp-12],eax
	fild	dword ptr [ebp-12]
	fmul	dword ptr [ebp+8]
	fistp	dword ptr [ebp-12]
	mov	edi,[ebp-12]
	mov	eax,[__texture_height]
	dec	eax
	mov	[ebp-12],eax
	fild	dword ptr [ebp-12]
	fmul	dword ptr [ebp+12]
	fistp	dword ptr [ebp-12]
	mov	esi,[ebp-12]
	mov	eax,esi
	imul	eax,[__texture_width]
	add	eax,edi
	sal	eax,2
	add	eax,[__texture_data]
	mov	eax,[eax]
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
__tex2d endp	

.data

___unnamed_float_3	dd	255.000000

.code

__rasterize_horiz_line proc
	push	ebp
	mov	ebp,esp
	sub	esp,48
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+8]
	mov	esi,[__pitch]
	imul	esi,[ebp+16]
	add	esi,[__videomem]
	mov	eax,edi
	sal	eax,2
	add	esi,eax
	mov	ebx,[ebp+12]
	sal	ebx,2
	add	ebx,esi
	mov	eax,edi
	sal	eax,2
	sub	ebx,eax
label0000:
	push	dword ptr [ebp+24]
	push	dword ptr [ebp+20]
	call	__tex2d
	add	esp,8
	mov	edx,eax
	mov	eax,edx
	sar	eax,24
	and	eax,255
	mov	[ebp-40],eax
	cmp	dword ptr [ebp-40],0
	je	label0001
	fild	dword ptr [ebp-40]
	fld	[___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	ecx,[esi]
	mov	eax,ecx
	and	eax,65280
	sar	eax,8
	mov	[ebp-32],eax
	mov	eax,ecx
	and	eax,255
	mov	[ebp-36],eax
	mov	eax,edx
	and	eax,65280
	sar	eax,8
	mov	[ebp-20],eax
	mov	eax,edx
	and	eax,255
	mov	[ebp-24],eax
	fild	dword ptr [ebp-20]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-32]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	fistp	dword ptr [ebp-48]
	mov	eax,[ebp-48]
	mov	[ebp-20],eax
	fild	dword ptr [ebp-24]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-36]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	fistp	dword ptr [ebp-48]
	mov	eax,[ebp-48]
	mov	[ebp-24],eax
	mov	eax,[ebp-20]
	sal	eax,8
	add	eax,[ebp-24]
	mov	[esi],eax
label0001:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
	add	esi,4
	cmp	esi,ebx
	jle	label0000
	pop	ebx
	pop	esi
	pop	edi
	add	esp,48
	pop	ebp
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	cmp	ebx,esi
	jg	label0000
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [ebp+24]
	push	dword ptr [ebp+20]
	push	edi
	push	esi
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0001
label0000:
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [ebp+32]
	push	dword ptr [ebp+28]
	push	edi
	push	ebx
	push	esi
	call	__rasterize_horiz_line
	add	esp,28
label0001:
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+24]
	mov	esi,[ebp+20]
	mov	ebx,[ebp+12]
	mov	edx,[ebp+8]
	mov	ecx,[ebp+16]
	cmp	edx,ebx
	jge	label0000
	cmp	ecx,ebx
	jle	label0001
	push	ecx
	push	edx
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [edi+4]
	push	dword ptr [edi]
	push	esi
	push	ecx
	push	edx
	call	__rasterize_horiz_line
	add	esp,28
	pop	edx
	pop	ecx
	jmp	label0002
label0001:
	cmp	ecx,edx
	jge	label0003
	push	ecx
	push	edx
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	mov	eax,[ebp+32]
	push	dword ptr [eax+4]
	mov	eax,[ebp+32]
	push	dword ptr [eax]
	push	esi
	push	ebx
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
	pop	edx
	pop	ecx
	jmp	label0004
label0003:
	push	ecx
	push	edx
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [edi+4]
	push	dword ptr [edi]
	push	esi
	push	ebx
	push	edx
	call	__rasterize_horiz_line
	add	esp,28
	pop	edx
	pop	ecx
label0004:
label0002:
	jmp	label0005
label0000:
	cmp	ecx,ebx
	jge	label0006
	push	ecx
	push	edx
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
	mov	eax,[ebp+32]
	push	dword ptr [eax+4]
	mov	eax,[ebp+32]
	push	dword ptr [eax]
	push	esi
	push	edx
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
	pop	edx
	pop	ecx
	jmp	label0007
label0006:
	cmp	ecx,edx
	jle	label0008
	push	ecx
	push	edx
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
	mov	eax,[ebp+28]
	push	dword ptr [eax+4]
	mov	eax,[ebp+28]
	push	dword ptr [eax]
	push	esi
	push	ecx
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
	pop	edx
	pop	ecx
	jmp	label0009
label0008:
	push	ecx
	push	edx
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
	mov	eax,[ebp+28]
	push	dword ptr [eax+4]
	mov	eax,[ebp+28]
	push	dword ptr [eax]
	push	esi
	push	edx
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
	pop	edx
	pop	ecx
label0009:
label0007:
label0005:
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
__rasterize_triangle_1i endp	

__rasterize_triangle_2i proc
	push	ebp
	mov	ebp,esp
	sub	esp,44
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	mov	eax,[ebx+4]
	cmp	eax,[esi+4]
	jle	label0000
	mov	[ebp-4],ebx
	mov	ebx,esi
	mov	esi,[ebp-4]
label0000:
	mov	eax,[ebx+4]
	cmp	eax,[edi+4]
	jle	label0001
	mov	[ebp-4],ebx
	mov	ebx,edi
	mov	edi,[ebp-4]
label0001:
	mov	eax,[esi+4]
	cmp	eax,[edi+4]
	jle	label0002
	mov	[ebp-4],esi
	mov	esi,edi
	mov	edi,[ebp-4]
label0002:
	mov	eax,[ebx+4]
	cmp	eax,[edi+4]
	jne	label0003
	cmp	dword ptr [ebx+4],0
	jl	label0004
	mov	eax,[ebx+4]
	cmp	eax,[__height]
	jge	label0004
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	eax,8
	add	eax,edi
	push	eax
	mov	eax,8
	add	eax,esi
	push	eax
	mov	eax,8
	add	eax,ebx
	push	eax
	push	dword ptr [ebx+4]
	push	dword ptr [edi]
	push	dword ptr [esi]
	push	dword ptr [ebx]
	call	__rasterize_triangle_1i
	add	esp,36
label0004:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,44
	pop	ebp
	ret
label0003:
	mov	eax,[ebx+4]
	mov	[ebp-16],eax
label0005:
	mov	eax,[ebp-16]
	cmp	eax,[esi+4]
	jge	label0006
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	ecx,[esi]
	sub	ecx,[ebx]
	imul	eax,ecx
	mov	ecx,[esi+4]
	sub	ecx,[ebx+4]
	cdq
	idiv	ecx
	add	eax,[ebx]
	mov	[ebp-8],eax
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	ecx,[edi]
	sub	ecx,[ebx]
	imul	eax,ecx
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	cdq
	idiv	ecx
	add	eax,[ebx]
	mov	[ebp-12],eax
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [esi+8]
	fsub	dword ptr [ebx+8]
	fmulp
	mov	eax,[esi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [ebx+8]
	fstp	dword ptr [ebp-20]
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [edi+8]
	fsub	dword ptr [ebx+8]
	fmulp
	mov	eax,[edi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [ebx+8]
	fstp	dword ptr [ebp-28]
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	mov	eax,8
	add	eax,esi
	add	eax,4
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[esi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,8
	add	eax,ebx
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-24]
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	mov	eax,8
	add	eax,edi
	add	eax,4
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[edi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,8
	add	eax,ebx
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-40]
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
	inc	dword ptr [ebp-16]
	jmp	label0005
label0006:
	mov	eax,[esi+4]
	sub	eax,[ebx+4]
	mov	ecx,[edi]
	sub	ecx,[ebx]
	imul	eax,ecx
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	cdq
	idiv	ecx
	add	eax,[ebx]
	mov	[ebp-12],eax
	mov	eax,[esi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [edi+8]
	fsub	dword ptr [ebx+8]
	fmulp
	mov	eax,[edi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [ebx+8]
	fstp	dword ptr [ebp-28]
	mov	eax,[esi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	mov	eax,8
	add	eax,edi
	add	eax,4
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[edi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,8
	add	eax,ebx
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [esi+8]
	mov	eax,[ebp-12]
	sub	eax,[esi]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-36]
	mov	eax,8
	add	eax,esi
	add	eax,4
	fld	dword ptr [ebp-32]
	fsub	dword ptr [eax]
	mov	eax,[ebp-12]
	sub	eax,[esi]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-40]
	push	dword ptr [ebp-40]
	push	dword ptr [ebp-36]
	mov	eax,8
	add	eax,esi
	add	eax,4
	push	dword ptr [eax]
	push	dword ptr [esi+8]
	push	dword ptr [ebp-32]
	push	dword ptr [ebp-28]
	push	dword ptr [esi+4]
	push	dword ptr [esi]
	push	dword ptr [ebp-12]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	mov	eax,1
	add	eax,[esi+4]
	mov	[ebp-16],eax
label0007:
	mov	eax,[ebp-16]
	cmp	eax,[edi+4]
	jge	label0008
	mov	eax,[ebp-16]
	sub	eax,[esi+4]
	mov	ecx,[edi]
	sub	ecx,[esi]
	imul	eax,ecx
	mov	ecx,[edi+4]
	sub	ecx,[esi+4]
	cdq
	idiv	ecx
	add	eax,[esi]
	mov	[ebp-8],eax
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	ecx,[edi]
	sub	ecx,[ebx]
	imul	eax,ecx
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	cdq
	idiv	ecx
	add	eax,[ebx]
	mov	[ebp-12],eax
	mov	eax,[ebp-16]
	sub	eax,[esi+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [edi+8]
	fsub	dword ptr [esi+8]
	fmulp
	mov	eax,[edi+4]
	sub	eax,[esi+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [esi+8]
	fstp	dword ptr [ebp-20]
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [edi+8]
	fsub	dword ptr [ebx+8]
	fmulp
	mov	eax,[edi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [ebx+8]
	fstp	dword ptr [ebp-28]
	mov	eax,[ebp-16]
	sub	eax,[esi+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	mov	eax,8
	add	eax,edi
	add	eax,4
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[edi+4]
	sub	eax,[esi+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,8
	add	eax,esi
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-24]
	mov	eax,[ebp-16]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	mov	eax,8
	add	eax,edi
	add	eax,4
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[edi+4]
	sub	eax,[ebx+4]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,8
	add	eax,ebx
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-40]
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
	inc	dword ptr [ebp-16]
	jmp	label0007
label0008:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,44
	pop	ebp
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	push	ebp
	mov	ebp,esp
	sub	esp,60
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+8]
	mov	dword ptr [edi+192],0
	mov	esi,[ebp+12]
	mov	ebx,[ebp+12]
	add	ebx,24
label0000:
	mov	eax,[ebp+12]
	imul	ecx,[eax+192],24
	mov	eax,[ebp+12]
	add	eax,ecx
	cmp	ebx,eax
	jge	label0001
	push	dword ptr [ebp+16]
	mov	eax,esi
	push	eax
	lea	eax,[ebp-24]
	push	eax
	call	_vec4f_subtract
	add	esp,12
	push	dword ptr [ebp+20]
	lea	eax,[ebp-24]
	push	eax
	call	_vec4f_dot
	add	esp,8
	fstp	dword ptr [ebp-52]
	push	dword ptr [ebp+16]
	mov	eax,ebx
	push	eax
	lea	eax,[ebp-24]
	push	eax
	call	_vec4f_subtract
	add	esp,12
	push	dword ptr [ebp+20]
	lea	eax,[ebp-24]
	push	eax
	call	_vec4f_dot
	add	esp,8
	fstp	dword ptr [ebp-56]
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jb	label0002
	mov	eax,[edi+192]
	inc	dword ptr [edi+192]
	imul	eax,24
	mov	ecx,edi
	add	ecx,eax
	mov	eax,[esi]
	mov	edx,[esi+4]
	mov	[ecx],eax
	mov	[ecx+4],edx
	mov	eax,[esi+8]
	mov	edx,[esi+12]
	mov	[ecx+8],eax
	mov	[ecx+12],edx
	mov	eax,[esi+16]
	mov	edx,[esi+20]
	mov	[ecx+16],eax
	mov	[ecx+20],edx
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
	mov	eax,esi
	push	eax
	push	dword ptr [ebp+16]
	lea	eax,[ebp-24]
	push	eax
	call	_vec4f_subtract
	add	esp,12
	mov	eax,esi
	push	eax
	mov	eax,ebx
	push	eax
	lea	eax,[ebp-40]
	push	eax
	call	_vec4f_subtract
	add	esp,12
	push	dword ptr [ebp+20]
	lea	eax,[ebp-24]
	push	eax
	call	_vec4f_dot
	add	esp,8
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp+20]
	lea	eax,[ebp-40]
	push	eax
	call	_vec4f_dot
	add	esp,8
	fstp	dword ptr [esp-4]
	fld	dword ptr [esp]
	fld	dword ptr [esp-4]
	add	esp,4
	fdivp
	fstp	dword ptr [ebp-60]
	push	dword ptr [ebp-60]
	lea	eax,[ebp-40]
	push	eax
	call	_vec4f_mul
	add	esp,8
	lea	eax,[ebp-40]
	push	eax
	mov	eax,esi
	push	eax
	imul	eax,[edi+192],24
	mov	ecx,edi
	add	ecx,eax
	push	ecx
	call	_vec4f_add
	add	esp,12
	mov	eax,16
	add	eax,esi
	push	eax
	mov	eax,16
	add	eax,ebx
	push	eax
	lea	eax,[ebp-48]
	push	eax
	call	_vec2f_subtract
	add	esp,12
	push	dword ptr [ebp-60]
	lea	eax,[ebp-48]
	push	eax
	call	_vec2f_mul
	add	esp,8
	lea	eax,[ebp-48]
	push	eax
	mov	eax,16
	add	eax,esi
	push	eax
	imul	eax,[edi+192],24
	mov	ecx,edi
	add	ecx,eax
	add	ecx,16
	push	ecx
	call	_vec2f_add
	add	esp,12
	inc	dword ptr [edi+192]
label0003:
	add	esi,24
	add	ebx,24
	jmp	label0000
label0001:
	mov	eax,[edi+192]
	inc	dword ptr [edi+192]
	imul	eax,24
	mov	ecx,edi
	add	ecx,eax
	mov	eax,[edi]
	mov	edx,[edi+4]
	mov	[ecx],eax
	mov	[ecx+4],edx
	mov	eax,[edi+8]
	mov	edx,[edi+12]
	mov	[ecx+8],eax
	mov	[ecx+12],edx
	mov	eax,[edi+16]
	mov	edx,[edi+20]
	mov	[ecx+16],eax
	mov	[ecx+20],edx
	pop	ebx
	pop	esi
	pop	edi
	add	esp,60
	pop	ebp
	ret
__clip_on_plain endp	

__clip_poligon proc
	push	ebp
	mov	ebp,esp
	sub	esp,196
	push	edi
	mov	edi,[ebp+8]
	lea	eax,[__clip_z_far_norm]
	push	eax
	lea	eax,[__clip_z_far_base]
	push	eax
	push	edi
	lea	eax,[ebp-196]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,[__clip_z_near_norm]
	push	eax
	lea	eax,[__clip_z_near_base]
	push	eax
	lea	eax,[ebp-196]
	push	eax
	push	edi
	call	__clip_on_plain
	add	esp,16
	lea	eax,[__clip_plane_left_norm]
	push	eax
	lea	eax,[__clip_plane_left_base]
	push	eax
	push	edi
	lea	eax,[ebp-196]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,[__clip_plane_right_norm]
	push	eax
	lea	eax,[__clip_plane_right_base]
	push	eax
	lea	eax,[ebp-196]
	push	eax
	push	edi
	call	__clip_on_plain
	add	esp,16
	lea	eax,[__clip_plane_top_norm]
	push	eax
	lea	eax,[__clip_plane_top_base]
	push	eax
	push	edi
	lea	eax,[ebp-196]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,[__clip_plane_bottom_norm]
	push	eax
	lea	eax,[__clip_plane_bottom_base]
	push	eax
	lea	eax,[ebp-196]
	push	eax
	push	edi
	call	__clip_on_plain
	add	esp,16
	cmp	dword ptr [edi+192],1
	setg	al
	movzx	eax,al
	pop	edi
	add	esp,196
	pop	ebp
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	push	ebp
	mov	ebp,esp
	sub	esp,24
	push	edi
	mov	edi,[ebp+8]
	lea	eax,[__viewport_matrix]
	push	eax
	push	dword ptr [ebp+12]
	lea	eax,[ebp-16]
	push	eax
	call	_matrix4f_transform
	add	esp,12
	fld1
	lea	eax,[ebp-16]
	add	eax,12
	fdiv	dword ptr [eax]
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [ebp-20]
	fistp	dword ptr [ebp-24]
	mov	eax,[ebp-24]
	mov	[edi],eax
	lea	eax,[ebp-16]
	add	eax,4
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-20]
	fistp	dword ptr [ebp-24]
	mov	eax,[ebp-24]
	mov	[edi+4],eax
	cmp	dword ptr [edi],0
	jl	label0001
	mov	eax,[edi]
	cmp	eax,[__width]
	jge	label0001
	cmp	dword ptr [edi+4],0
	jl	label0001
	mov	eax,[edi+4]
	cmp	eax,[__height]
	jl	label0000
label0001:
	mov	dword ptr ds:[0],0
label0000:
	pop	edi
	add	esp,24
	pop	ebp
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	push	ebp
	mov	ebp,esp
	sub	esp,136
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+8]
	push	edi
	call	__clip_poligon
	add	esp,4
	cmp	eax,0
	jne	label0000
	pop	ebx
	pop	esi
	pop	edi
	add	esp,136
	pop	ebp
	ret
label0000:
	cmp	dword ptr [edi+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	esi,0
label0002:
	cmp	esi,[edi+192]
	jge	label0003
	imul	eax,esi,24
	mov	ecx,edi
	add	ecx,eax
	push	ecx
	mov	eax,esi
	sal	eax,4
	lea	ecx,[ebp-132]
	add	ecx,eax
	push	ecx
	call	__transform_to_screen_space
	add	esp,8
	mov	eax,esi
	sal	eax,4
	lea	ecx,[ebp-132]
	add	ecx,eax
	add	ecx,8
	imul	eax,esi,24
	mov	edx,edi
	add	edx,eax
	add	edx,16
	mov	eax,[edx]
	mov	ebx,[edx+4]
	mov	[ecx],eax
	mov	[ecx+4],ebx
	inc	esi
	jmp	label0002
label0003:
	mov	esi,2
label0004:
	mov	eax,[edi+192]
	dec	eax
	cmp	esi,eax
	jge	label0005
	mov	eax,esi
	sal	eax,4
	lea	ecx,[ebp-132]
	add	ecx,eax
	push	ecx
	mov	eax,esi
	dec	eax
	sal	eax,4
	lea	ecx,[ebp-132]
	add	ecx,eax
	push	ecx
	lea	eax,[ebp-132]
	push	eax
	call	__rasterize_triangle_2i
	add	esp,12
	inc	esi
	jmp	label0004
label0005:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,136
	pop	ebp
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	push	ebp
	mov	ebp,esp
	sub	esp,16
	push	edi
	mov	edi,[ebp+12]
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [edi+8]
	push	dword ptr [edi+4]
	push	dword ptr [edi]
	lea	eax,[ebp-16]
	push	eax
	call	_vec4f_assign
	add	esp,20
	lea	eax,[__mvproj_matrix]
	push	eax
	lea	eax,[ebp-16]
	push	eax
	push	dword ptr [ebp+8]
	call	_matrix4f_transform
	add	esp,12
	pop	edi
	add	esp,16
	pop	ebp
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	push	ebp
	mov	ebp,esp
	sub	esp,196
	push	ebx
	push	dword ptr [ebp+8]
	lea	eax,[ebp-196]
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	lea	eax,[ebp-196]
	add	eax,16
	mov	ecx,[ebp+20]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	push	dword ptr [ebp+12]
	lea	eax,[ebp-196]
	add	eax,24
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	lea	eax,[ebp-196]
	add	eax,24
	add	eax,16
	mov	ecx,[ebp+24]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	push	dword ptr [ebp+16]
	lea	eax,[ebp-196]
	add	eax,48
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	lea	eax,[ebp-196]
	add	eax,48
	add	eax,16
	mov	ecx,[ebp+28]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	lea	eax,[ebp-196]
	add	eax,72
	mov	ecx,[ebp-196]
	mov	edx,[ebp-192]
	mov	[eax],ecx
	mov	[eax+4],edx
	mov	ecx,[ebp-188]
	mov	edx,[ebp-184]
	mov	[eax+8],ecx
	mov	[eax+12],edx
	mov	ecx,[ebp-180]
	mov	edx,[ebp-176]
	mov	[eax+16],ecx
	mov	[eax+20],edx
	lea	eax,[ebp-196]
	add	eax,192
	mov	dword ptr [eax],4
	lea	eax,[ebp-196]
	push	eax
	call	__rasterize_polygon_4f
	add	esp,4
	pop	ebx
	add	esp,196
	pop	ebp
	ret
_rasterizer_triangle3f endp	

end