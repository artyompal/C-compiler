
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
	fld	dword ptr [esi+4]
	fmul	dword ptr [edi+4]
	fld	dword ptr [esi]
	fmul	dword ptr [edi]
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

_vec4f_is_equal proc
	push	ebp
	mov	ebp,esp
	sub	esp,44
	mov	eax,[ebp+12]
	mov	[ebp-24],eax
	mov	eax,[ebp+8]
	mov	[ebp-28],eax
	lea	eax,[ebp-16]
	mov	[ebp-32],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-32]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-32]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-32]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-32]
	fstp	dword ptr [eax+12]
label0000:
; end of inline function vec4f_subtract
	lea	eax,[ebp-16]
	mov	[ebp-36],eax
	lea	eax,[ebp-16]
	mov	[ebp-40],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-40]
	mov	ecx,[ebp-36]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-40]
	mov	ecx,[ebp-36]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-40]
	mov	ecx,[ebp-36]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-40]
	mov	ecx,[ebp-36]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	seta	al
	movzx	eax,al
	add	esp,44
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

_matrix4f_make_viewport proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	fld	dword ptr [___unnamed_float_1]
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
	fld	dword ptr [___unnamed_float_1]
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
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [edi+48]
	fld	dword ptr [___unnamed_float_1]
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
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+16]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi]
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
	fld	dword ptr [ebx+4]
	fmul	dword ptr [esi+16]
	fld	dword ptr [ebx]
	fmul	dword ptr [esi]
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

_rasterizer_init proc
	push	ebp
	mov	ebp,esp
	sub	esp,76
	mov	eax,[ebp+8]
	mov	dword ptr [__dbgprintf],eax
	mov	eax,[ebp+12]
	mov	dword ptr [__width],eax
	mov	eax,[ebp+16]
	mov	dword ptr [__height],eax
	mov	eax,[ebp+20]
	mov	dword ptr [__pitch],eax
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [ebp-32]
	mov	eax,[ebp+32]
	mov	[ebp-36],eax
	mov	eax,[ebp+28]
	mov	[ebp-40],eax
	mov	eax,[ebp+24]
	mov	[ebp-44],eax
	lea	eax,dword ptr [__mvproj_matrix]
	mov	[ebp-48],eax
; start of inline function matrix4f_make_perspective
	fld	dword ptr [ebp-36]
	fmul	dword ptr [ebp-44]
	fstp	dword ptr [ebp-52]
	fld	dword ptr [ebp-52]
	fmul	dword ptr [ebp-32]
	fstp	dword ptr [ebp-56]
	mov	eax,[ebp-48]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-56]
	fstp	dword ptr [eax]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+12]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+16]
	mov	eax,[ebp-48]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-52]
	fstp	dword ptr [eax+20]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+24]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+28]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+32]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+36]
	mov	eax,[ebp-48]
	fld	dword ptr [ebp-40]
	fsub	dword ptr [ebp-44]
	fdivr	dword ptr [ebp-40]
	fstp	dword ptr [eax+40]
	mov	eax,[ebp-48]
	fld1
	fstp	dword ptr [eax+44]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+48]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+52]
	mov	eax,[ebp-48]
	fld	dword ptr [ebp-44]
	fmul	dword ptr [ebp-40]
	fld	dword ptr [ebp-44]
	fsub	dword ptr [ebp-40]
	fdivp
	fstp	dword ptr [eax+56]
	mov	eax,[ebp-48]
	fldz
	fstp	dword ptr [eax+60]
label0010:
; end of inline function matrix4f_make_perspective
	mov	eax,[ebp+28]
	mov	[ebp-60],eax
	mov	eax,[ebp+24]
	mov	[ebp-64],eax
	fild	dword ptr [ebp+16]
	fstp	dword ptr [ebp-68]
	fild	dword ptr [ebp+12]
	fstp	dword ptr [ebp-72]
	lea	eax,dword ptr [__viewport_matrix]
	mov	[ebp-76],eax
; start of inline function matrix4f_make_viewport
	mov	eax,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [eax]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+12]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+16]
	mov	eax,[ebp-76]
	fld	dword ptr [ebp-68]
	fldz
	fsubrp
	fld	dword ptr [___unnamed_float_1]
	fdivp
	fstp	dword ptr [eax+20]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+24]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+28]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+32]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+36]
	mov	eax,[ebp-76]
	fld	dword ptr [ebp-60]
	fsub	dword ptr [ebp-64]
	fstp	dword ptr [eax+40]
	mov	eax,[ebp-76]
	fldz
	fstp	dword ptr [eax+44]
	mov	eax,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [eax+48]
	mov	eax,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-68]
	fstp	dword ptr [eax+52]
	mov	eax,[ebp-76]
	fld	dword ptr [ebp-64]
	fstp	dword ptr [eax+56]
	mov	eax,[ebp-76]
	fld1
	fstp	dword ptr [eax+60]
label0011:
; end of inline function matrix4f_make_viewport
	fld1
	fstp	dword ptr [ebp-12]
	mov	eax,[ebp+24]
	mov	[ebp-16],eax
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	eax,dword ptr [__clip_z_near_base]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	mov	eax,[ebp-4]
	mov	[ebp-16],eax
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	eax,dword ptr [__clip_z_near_norm]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
label0005:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	mov	eax,[ebp+28]
	mov	[ebp-16],eax
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	eax,dword ptr [__clip_z_far_base]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	mov	eax,[ebp-8]
	mov	[ebp-16],eax
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	eax,dword ptr [__clip_z_far_norm]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	lea	eax,dword ptr [__clip_plane_left_base]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	lea	eax,dword ptr [__clip_plane_left_norm]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	lea	eax,dword ptr [__clip_plane_right_base]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	lea	eax,dword ptr [__clip_plane_right_norm]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	lea	eax,dword ptr [__clip_plane_top_base]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	lea	eax,dword ptr [__clip_plane_top_norm]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	lea	eax,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
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
	lea	eax,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-28],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [eax+12]
label000f:
; end of inline function vec4f_assign
	add	esp,76
	pop	ebp
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	mov	dword ptr [__videomem],eax
	pop	ebp
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	mov	ecx,[eax]
	mov	edx,[eax+4]
	mov	dword ptr [__mvproj_matrix],ecx
	mov	dword ptr [__mvproj_matrix+4],edx
	mov	ecx,[eax+8]
	mov	edx,[eax+12]
	mov	dword ptr [__mvproj_matrix+8],ecx
	mov	dword ptr [__mvproj_matrix+12],edx
	mov	ecx,[eax+16]
	mov	edx,[eax+20]
	mov	dword ptr [__mvproj_matrix+16],ecx
	mov	dword ptr [__mvproj_matrix+20],edx
	mov	ecx,[eax+24]
	mov	edx,[eax+28]
	mov	dword ptr [__mvproj_matrix+24],ecx
	mov	dword ptr [__mvproj_matrix+28],edx
	mov	ecx,[eax+32]
	mov	edx,[eax+36]
	mov	dword ptr [__mvproj_matrix+32],ecx
	mov	dword ptr [__mvproj_matrix+36],edx
	mov	ecx,[eax+40]
	mov	edx,[eax+44]
	mov	dword ptr [__mvproj_matrix+40],ecx
	mov	dword ptr [__mvproj_matrix+44],edx
	mov	ecx,[eax+48]
	mov	edx,[eax+52]
	mov	dword ptr [__mvproj_matrix+48],ecx
	mov	dword ptr [__mvproj_matrix+52],edx
	mov	ecx,[eax+56]
	mov	edx,[eax+60]
	mov	dword ptr [__mvproj_matrix+56],ecx
	mov	dword ptr [__mvproj_matrix+60],edx
	pop	ebp
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	mov	dword ptr [__color],eax
	pop	ebp
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8]
	mov	dword ptr [__texture_data],eax
	mov	eax,[ebp+12]
	mov	dword ptr [__texture_width],eax
	mov	eax,[ebp+16]
	mov	dword ptr [__texture_height],eax
	pop	ebp
	ret
_rasterizer_set_texture endp	

__tex2d proc
	push	ebp
	mov	ebp,esp
	sub	esp,12
	push	edi
	push	esi
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-12],eax
	fild	dword ptr [ebp-12]
	fmul	dword ptr [ebp+8]
	fistp	dword ptr [ebp-12]
	mov	edi,[ebp-12]
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-12],eax
	fild	dword ptr [ebp-12]
	fmul	dword ptr [ebp+12]
	fistp	dword ptr [ebp-12]
	mov	esi,[ebp-12]
	mov	eax,esi
	imul	eax,dword ptr [__texture_width]
	add	eax,edi
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	eax,[eax]
	pop	esi
	pop	edi
	add	esp,12
	pop	ebp
	ret
__tex2d endp	

__rasterize_horiz_line proc
	push	ebp
	mov	ebp,esp
	sub	esp,68
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+8]
	mov	esi,dword ptr [__pitch]
	imul	esi,[ebp+16]
	add	esi,dword ptr [__videomem]
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
	mov	eax,[ebp+24]
	mov	[ebp-48],eax
	mov	eax,[ebp+20]
	mov	[ebp-52],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-68],eax
	fild	dword ptr [ebp-68]
	fmul	dword ptr [ebp-52]
	fistp	dword ptr [ebp-68]
	mov	eax,[ebp-68]
	mov	[ebp-56],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-68],eax
	fild	dword ptr [ebp-68]
	fmul	dword ptr [ebp-48]
	fistp	dword ptr [ebp-68]
	mov	eax,[ebp-68]
	mov	[ebp-60],eax
	mov	eax,[ebp-60]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-56]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-64],ecx
label0004:
; end of inline function _tex2d
	mov	edx,[ebp-64]
	mov	eax,edx
	sar	eax,24
	and	eax,255
	mov	[ebp-40],eax
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
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
	fistp	dword ptr [ebp-68]
	mov	eax,[ebp-68]
	mov	[ebp-20],eax
	fild	dword ptr [ebp-24]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-36]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	fistp	dword ptr [ebp-68]
	mov	eax,[ebp-68]
	mov	[ebp-24],eax
	mov	eax,[ebp-20]
	sal	eax,8
	add	eax,[ebp-24]
	mov	[esi],eax
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	esi,4
	cmp	esi,ebx
	jl	label0000
label0002:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,68
	pop	ebp
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	push	ebp
	mov	ebp,esp
	sub	esp,96
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	cmp	ebx,esi
	jg	label0000
	mov	eax,[ebp+40]
	mov	[ebp-4],eax
	mov	eax,[ebp+36]
	mov	[ebp-8],eax
	mov	eax,[ebp+24]
	mov	[ebp-12],eax
	mov	eax,[ebp+20]
	mov	[ebp-16],eax
	mov	[ebp-20],edi
	mov	[ebp-24],esi
	mov	[ebp-28],ebx
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-20]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-28]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-32],eax
	mov	eax,[ebp-24]
	sal	eax,2
	add	eax,[ebp-32]
	mov	ecx,[ebp-28]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-36],eax
label0002:
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
	mov	eax,[ebp-16]
	mov	[ebp-80],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-80]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-84],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-76]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-88],eax
	mov	eax,[ebp-88]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-84]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-92],ecx
label0006:
; end of inline function _tex2d
	mov	eax,[ebp-92]
	mov	[ebp-40],eax
	mov	eax,[ebp-40]
	sar	eax,24
	and	eax,255
	mov	[ebp-68],eax
	cmp	dword ptr [ebp-68],0
	je	label0005
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	eax,[ebp-32]
	mov	ecx,[eax]
	mov	[ebp-56],ecx
	mov	eax,[ebp-56]
	and	eax,65280
	sar	eax,8
	mov	[ebp-60],eax
	mov	eax,[ebp-56]
	and	eax,255
	mov	[ebp-64],eax
	mov	eax,[ebp-40]
	and	eax,65280
	sar	eax,8
	mov	[ebp-48],eax
	mov	eax,[ebp-40]
	and	eax,255
	mov	[ebp-52],eax
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-48],eax
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sal	eax,8
	add	eax,[ebp-52]
	mov	[ebp-44],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-44]
	mov	[eax],ecx
label0005:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0003:
	add	dword ptr [ebp-32],4
	mov	eax,[ebp-32]
	cmp	eax,[ebp-36]
	jl	label0002
label0004:
label0007:
; end of inline function _rasterize_horiz_line
	jmp	label0001
label0000:
	mov	eax,[ebp+40]
	mov	[ebp-4],eax
	mov	eax,[ebp+36]
	mov	[ebp-8],eax
	mov	eax,[ebp+32]
	mov	[ebp-12],eax
	mov	eax,[ebp+28]
	mov	[ebp-16],eax
	mov	[ebp-20],edi
	mov	[ebp-24],ebx
	mov	[ebp-28],esi
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-20]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-28]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-32],eax
	mov	eax,[ebp-24]
	sal	eax,2
	add	eax,[ebp-32]
	mov	ecx,[ebp-28]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-36],eax
label0008:
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
	mov	eax,[ebp-16]
	mov	[ebp-80],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-80]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-84],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-76]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-88],eax
	mov	eax,[ebp-88]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-84]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-92],ecx
label000c:
; end of inline function _tex2d
	mov	eax,[ebp-92]
	mov	[ebp-40],eax
	mov	eax,[ebp-40]
	sar	eax,24
	and	eax,255
	mov	[ebp-68],eax
	cmp	dword ptr [ebp-68],0
	je	label000b
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	eax,[ebp-32]
	mov	ecx,[eax]
	mov	[ebp-56],ecx
	mov	eax,[ebp-56]
	and	eax,65280
	sar	eax,8
	mov	[ebp-60],eax
	mov	eax,[ebp-56]
	and	eax,255
	mov	[ebp-64],eax
	mov	eax,[ebp-40]
	and	eax,65280
	sar	eax,8
	mov	[ebp-48],eax
	mov	eax,[ebp-40]
	and	eax,255
	mov	[ebp-52],eax
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-48],eax
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sal	eax,8
	add	eax,[ebp-52]
	mov	[ebp-44],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-44]
	mov	[eax],ecx
label000b:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0009:
	add	dword ptr [ebp-32],4
	mov	eax,[ebp-32]
	cmp	eax,[ebp-36]
	jl	label0008
label000a:
label000d:
; end of inline function _rasterize_horiz_line
label0001:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,96
	pop	ebp
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	push	ebp
	mov	ebp,esp
	sub	esp,96
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+20]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	mov	edx,[ebp+16]
	cmp	ebx,esi
	jge	label0000
	cmp	edx,esi
	jle	label0001
	mov	eax,[ebp+40]
	mov	[ebp-4],eax
	mov	eax,[ebp+36]
	mov	[ebp-8],eax
	mov	eax,[ebp+24]
	mov	ecx,[eax+4]
	mov	[ebp-12],ecx
	mov	eax,[ebp+24]
	mov	ecx,[eax]
	mov	[ebp-16],ecx
	mov	[ebp-20],edi
	mov	[ebp-24],edx
	mov	[ebp-28],ebx
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-20]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-28]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-32],eax
	mov	eax,[ebp-24]
	sal	eax,2
	add	eax,[ebp-32]
	mov	ecx,[ebp-28]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-36],eax
label000a:
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
	mov	eax,[ebp-16]
	mov	[ebp-80],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-80]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-84],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-76]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-88],eax
	mov	eax,[ebp-88]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-84]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-92],ecx
label000e:
; end of inline function _tex2d
	mov	eax,[ebp-92]
	mov	[ebp-40],eax
	mov	eax,[ebp-40]
	sar	eax,24
	and	eax,255
	mov	[ebp-68],eax
	cmp	dword ptr [ebp-68],0
	je	label000d
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	eax,[ebp-32]
	mov	ecx,[eax]
	mov	[ebp-56],ecx
	mov	eax,[ebp-56]
	and	eax,65280
	sar	eax,8
	mov	[ebp-60],eax
	mov	eax,[ebp-56]
	and	eax,255
	mov	[ebp-64],eax
	mov	eax,[ebp-40]
	and	eax,65280
	sar	eax,8
	mov	[ebp-48],eax
	mov	eax,[ebp-40]
	and	eax,255
	mov	[ebp-52],eax
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-48],eax
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sal	eax,8
	add	eax,[ebp-52]
	mov	[ebp-44],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-44]
	mov	[eax],ecx
label000d:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label000b:
	add	dword ptr [ebp-32],4
	mov	eax,[ebp-32]
	cmp	eax,[ebp-36]
	jl	label000a
label000c:
label000f:
; end of inline function _rasterize_horiz_line
	jmp	label0002
label0001:
	cmp	edx,ebx
	jge	label0003
	mov	eax,[ebp+40]
	mov	[ebp-4],eax
	mov	eax,[ebp+36]
	mov	[ebp-8],eax
	mov	eax,[ebp+32]
	mov	ecx,[eax+4]
	mov	[ebp-12],ecx
	mov	eax,[ebp+32]
	mov	ecx,[eax]
	mov	[ebp-16],ecx
	mov	[ebp-20],edi
	mov	[ebp-24],esi
	mov	[ebp-28],edx
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-20]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-28]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-32],eax
	mov	eax,[ebp-24]
	sal	eax,2
	add	eax,[ebp-32]
	mov	ecx,[ebp-28]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-36],eax
label0010:
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
	mov	eax,[ebp-16]
	mov	[ebp-80],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-80]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-84],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-76]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-88],eax
	mov	eax,[ebp-88]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-84]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-92],ecx
label0014:
; end of inline function _tex2d
	mov	eax,[ebp-92]
	mov	[ebp-40],eax
	mov	eax,[ebp-40]
	sar	eax,24
	and	eax,255
	mov	[ebp-68],eax
	cmp	dword ptr [ebp-68],0
	je	label0013
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	eax,[ebp-32]
	mov	ecx,[eax]
	mov	[ebp-56],ecx
	mov	eax,[ebp-56]
	and	eax,65280
	sar	eax,8
	mov	[ebp-60],eax
	mov	eax,[ebp-56]
	and	eax,255
	mov	[ebp-64],eax
	mov	eax,[ebp-40]
	and	eax,65280
	sar	eax,8
	mov	[ebp-48],eax
	mov	eax,[ebp-40]
	and	eax,255
	mov	[ebp-52],eax
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-48],eax
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sal	eax,8
	add	eax,[ebp-52]
	mov	[ebp-44],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-44]
	mov	[eax],ecx
label0013:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0011:
	add	dword ptr [ebp-32],4
	mov	eax,[ebp-32]
	cmp	eax,[ebp-36]
	jl	label0010
label0012:
label0015:
; end of inline function _rasterize_horiz_line
	jmp	label0004
label0003:
	mov	eax,[ebp+40]
	mov	[ebp-4],eax
	mov	eax,[ebp+36]
	mov	[ebp-8],eax
	mov	eax,[ebp+24]
	mov	ecx,[eax+4]
	mov	[ebp-12],ecx
	mov	eax,[ebp+24]
	mov	ecx,[eax]
	mov	[ebp-16],ecx
	mov	[ebp-20],edi
	mov	[ebp-24],esi
	mov	[ebp-28],ebx
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-20]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-28]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-32],eax
	mov	eax,[ebp-24]
	sal	eax,2
	add	eax,[ebp-32]
	mov	ecx,[ebp-28]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-36],eax
label0016:
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
	mov	eax,[ebp-16]
	mov	[ebp-80],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-80]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-84],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-76]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-88],eax
	mov	eax,[ebp-88]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-84]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-92],ecx
label001a:
; end of inline function _tex2d
	mov	eax,[ebp-92]
	mov	[ebp-40],eax
	mov	eax,[ebp-40]
	sar	eax,24
	and	eax,255
	mov	[ebp-68],eax
	cmp	dword ptr [ebp-68],0
	je	label0019
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	eax,[ebp-32]
	mov	ecx,[eax]
	mov	[ebp-56],ecx
	mov	eax,[ebp-56]
	and	eax,65280
	sar	eax,8
	mov	[ebp-60],eax
	mov	eax,[ebp-56]
	and	eax,255
	mov	[ebp-64],eax
	mov	eax,[ebp-40]
	and	eax,65280
	sar	eax,8
	mov	[ebp-48],eax
	mov	eax,[ebp-40]
	and	eax,255
	mov	[ebp-52],eax
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-48],eax
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sal	eax,8
	add	eax,[ebp-52]
	mov	[ebp-44],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-44]
	mov	[eax],ecx
label0019:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0017:
	add	dword ptr [ebp-32],4
	mov	eax,[ebp-32]
	cmp	eax,[ebp-36]
	jl	label0016
label0018:
label001b:
; end of inline function _rasterize_horiz_line
label0004:
label0002:
	jmp	label0005
label0000:
	cmp	edx,esi
	jge	label0006
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	fstp	dword ptr [ebp-8]
	mov	eax,[ebp+32]
	mov	ecx,[eax+4]
	mov	[ebp-12],ecx
	mov	eax,[ebp+32]
	mov	ecx,[eax]
	mov	[ebp-16],ecx
	mov	[ebp-20],edi
	mov	[ebp-24],ebx
	mov	[ebp-28],edx
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-20]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-28]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-32],eax
	mov	eax,[ebp-24]
	sal	eax,2
	add	eax,[ebp-32]
	mov	ecx,[ebp-28]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-36],eax
label001c:
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
	mov	eax,[ebp-16]
	mov	[ebp-80],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-80]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-84],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-76]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-88],eax
	mov	eax,[ebp-88]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-84]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-92],ecx
label0020:
; end of inline function _tex2d
	mov	eax,[ebp-92]
	mov	[ebp-40],eax
	mov	eax,[ebp-40]
	sar	eax,24
	and	eax,255
	mov	[ebp-68],eax
	cmp	dword ptr [ebp-68],0
	je	label001f
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	eax,[ebp-32]
	mov	ecx,[eax]
	mov	[ebp-56],ecx
	mov	eax,[ebp-56]
	and	eax,65280
	sar	eax,8
	mov	[ebp-60],eax
	mov	eax,[ebp-56]
	and	eax,255
	mov	[ebp-64],eax
	mov	eax,[ebp-40]
	and	eax,65280
	sar	eax,8
	mov	[ebp-48],eax
	mov	eax,[ebp-40]
	and	eax,255
	mov	[ebp-52],eax
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-48],eax
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sal	eax,8
	add	eax,[ebp-52]
	mov	[ebp-44],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-44]
	mov	[eax],ecx
label001f:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label001d:
	add	dword ptr [ebp-32],4
	mov	eax,[ebp-32]
	cmp	eax,[ebp-36]
	jl	label001c
label001e:
label0021:
; end of inline function _rasterize_horiz_line
	jmp	label0007
label0006:
	cmp	edx,ebx
	jle	label0008
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	fstp	dword ptr [ebp-8]
	mov	eax,[ebp+28]
	mov	ecx,[eax+4]
	mov	[ebp-12],ecx
	mov	eax,[ebp+28]
	mov	ecx,[eax]
	mov	[ebp-16],ecx
	mov	[ebp-20],edi
	mov	[ebp-24],edx
	mov	[ebp-28],esi
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-20]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-28]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-32],eax
	mov	eax,[ebp-24]
	sal	eax,2
	add	eax,[ebp-32]
	mov	ecx,[ebp-28]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-36],eax
label0022:
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
	mov	eax,[ebp-16]
	mov	[ebp-80],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-80]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-84],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-76]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-88],eax
	mov	eax,[ebp-88]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-84]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-92],ecx
label0026:
; end of inline function _tex2d
	mov	eax,[ebp-92]
	mov	[ebp-40],eax
	mov	eax,[ebp-40]
	sar	eax,24
	and	eax,255
	mov	[ebp-68],eax
	cmp	dword ptr [ebp-68],0
	je	label0025
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	eax,[ebp-32]
	mov	ecx,[eax]
	mov	[ebp-56],ecx
	mov	eax,[ebp-56]
	and	eax,65280
	sar	eax,8
	mov	[ebp-60],eax
	mov	eax,[ebp-56]
	and	eax,255
	mov	[ebp-64],eax
	mov	eax,[ebp-40]
	and	eax,65280
	sar	eax,8
	mov	[ebp-48],eax
	mov	eax,[ebp-40]
	and	eax,255
	mov	[ebp-52],eax
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-48],eax
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sal	eax,8
	add	eax,[ebp-52]
	mov	[ebp-44],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-44]
	mov	[eax],ecx
label0025:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0023:
	add	dword ptr [ebp-32],4
	mov	eax,[ebp-32]
	cmp	eax,[ebp-36]
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
	mov	eax,[ebp+28]
	mov	ecx,[eax+4]
	mov	[ebp-12],ecx
	mov	eax,[ebp+28]
	mov	ecx,[eax]
	mov	[ebp-16],ecx
	mov	[ebp-20],edi
	mov	[ebp-24],ebx
	mov	[ebp-28],esi
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-20]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-28]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-32],eax
	mov	eax,[ebp-24]
	sal	eax,2
	add	eax,[ebp-32]
	mov	ecx,[ebp-28]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-36],eax
label0028:
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
	mov	eax,[ebp-16]
	mov	[ebp-80],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-80]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-84],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-96],eax
	fild	dword ptr [ebp-96]
	fmul	dword ptr [ebp-76]
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-88],eax
	mov	eax,[ebp-88]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-84]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-92],ecx
label002c:
; end of inline function _tex2d
	mov	eax,[ebp-92]
	mov	[ebp-40],eax
	mov	eax,[ebp-40]
	sar	eax,24
	and	eax,255
	mov	[ebp-68],eax
	cmp	dword ptr [ebp-68],0
	je	label002b
	fild	dword ptr [ebp-68]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-72]
	mov	eax,[ebp-32]
	mov	ecx,[eax]
	mov	[ebp-56],ecx
	mov	eax,[ebp-56]
	and	eax,65280
	sar	eax,8
	mov	[ebp-60],eax
	mov	eax,[ebp-56]
	and	eax,255
	mov	[ebp-64],eax
	mov	eax,[ebp-40]
	and	eax,65280
	sar	eax,8
	mov	[ebp-48],eax
	mov	eax,[ebp-40]
	and	eax,255
	mov	[ebp-52],eax
	fild	dword ptr [ebp-48]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-60]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-48],eax
	fild	dword ptr [ebp-52]
	fmul	dword ptr [ebp-72]
	fild	dword ptr [ebp-64]
	fld1
	fsub	dword ptr [ebp-72]
	fmulp
	faddp
	fistp	dword ptr [ebp-96]
	mov	eax,[ebp-96]
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sal	eax,8
	add	eax,[ebp-52]
	mov	[ebp-44],eax
	mov	eax,[ebp-32]
	mov	ecx,[ebp-44]
	mov	[eax],ecx
label002b:
	fld	dword ptr [ebp-16]
	fadd	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-12]
	fadd	dword ptr [ebp-4]
	fstp	dword ptr [ebp-12]
label0029:
	add	dword ptr [ebp-32],4
	mov	eax,[ebp-32]
	cmp	eax,[ebp-36]
	jl	label0028
label002a:
label002d:
; end of inline function _rasterize_horiz_line
label0009:
label0007:
label0005:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,96
	pop	ebp
	ret
__rasterize_triangle_1i endp	
