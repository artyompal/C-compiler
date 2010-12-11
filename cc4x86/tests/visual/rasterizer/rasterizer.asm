
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

__rasterize_triangle_2i proc
	push	ebp
	mov	ebp,esp
	sub	esp,300
	push	edi
	push	ebx
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp+12]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label0000
	mov	eax,[ebp+8]
	mov	[ebp-4],eax
	mov	eax,[ebp+12]
	mov	[ebp+8],eax
	mov	eax,[ebp-4]
	mov	[ebp+12],eax
label0000:
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp+16]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label0001
	mov	eax,[ebp+8]
	mov	[ebp-4],eax
	mov	eax,[ebp+16]
	mov	[ebp+8],eax
	mov	eax,[ebp-4]
	mov	[ebp+16],eax
label0001:
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+16]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label0002
	mov	eax,[ebp+12]
	mov	[ebp-4],eax
	mov	eax,[ebp+16]
	mov	[ebp+12],eax
	mov	eax,[ebp-4]
	mov	[ebp+16],eax
label0002:
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp+16]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jne	label0003
	mov	eax,[ebp+8]
	add	eax,4
	cmp	dword ptr [eax],0
	jl	label0004
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,dword ptr [__height]
	jge	label0004
	fldz
	fstp	dword ptr [ebp-172]
	fldz
	fstp	dword ptr [ebp-176]
	mov	eax,8
	add	eax,[ebp+16]
	mov	[ebp-180],eax
	mov	eax,8
	add	eax,[ebp+12]
	mov	[ebp-184],eax
	mov	eax,8
	add	eax,[ebp+8]
	mov	[ebp-188],eax
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-192],ecx
	mov	eax,[ebp+16]
	mov	ecx,[eax]
	mov	[ebp-196],ecx
	mov	eax,[ebp+12]
	mov	ecx,[eax]
	mov	[ebp-200],ecx
	mov	eax,[ebp+8]
	mov	ecx,[eax]
	mov	[ebp-204],ecx
; start of inline function _rasterize_triangle_1i
	mov	eax,[ebp-204]
	cmp	eax,[ebp-200]
	jge	label0038
	mov	eax,[ebp-196]
	cmp	eax,[ebp-200]
	jle	label0039
	mov	eax,[ebp-172]
	mov	[ebp-208],eax
	mov	eax,[ebp-176]
	mov	[ebp-212],eax
	mov	eax,[ebp-188]
	mov	ecx,[eax+4]
	mov	[ebp-216],ecx
	mov	eax,[ebp-188]
	mov	ecx,[eax]
	mov	[ebp-220],ecx
	mov	eax,[ebp-192]
	mov	[ebp-224],eax
	mov	eax,[ebp-196]
	mov	[ebp-228],eax
	mov	eax,[ebp-204]
	mov	[ebp-232],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-224]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-232]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-236],eax
	mov	eax,[ebp-228]
	sal	eax,2
	add	eax,[ebp-236]
	mov	ecx,[ebp-232]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-240],eax
label0042:
	mov	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-220]
	mov	[ebp-284],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-284]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-288],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-280]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-292],eax
	mov	eax,[ebp-292]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-288]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-296],ecx
label0046:
; end of inline function _tex2d
	mov	eax,[ebp-296]
	mov	[ebp-244],eax
	mov	eax,[ebp-244]
	sar	eax,24
	and	eax,255
	mov	[ebp-272],eax
	cmp	dword ptr [ebp-272],0
	je	label0045
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	eax,[ebp-236]
	mov	ecx,[eax]
	mov	[ebp-260],ecx
	mov	eax,[ebp-260]
	and	eax,65280
	sar	eax,8
	mov	[ebp-264],eax
	mov	eax,[ebp-260]
	and	eax,255
	mov	[ebp-268],eax
	mov	eax,[ebp-244]
	and	eax,65280
	sar	eax,8
	mov	[ebp-252],eax
	mov	eax,[ebp-244]
	and	eax,255
	mov	[ebp-256],eax
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-252],eax
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-256],eax
	mov	eax,[ebp-252]
	sal	eax,8
	add	eax,[ebp-256]
	mov	[ebp-248],eax
	mov	eax,[ebp-236]
	mov	ecx,[ebp-248]
	mov	[eax],ecx
label0045:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0043:
	add	dword ptr [ebp-236],4
	mov	eax,[ebp-236]
	cmp	eax,[ebp-240]
	jl	label0042
label0044:
label0047:
; end of inline function _rasterize_horiz_line
	jmp	label003a
label0039:
	mov	eax,[ebp-196]
	cmp	eax,[ebp-204]
	jge	label003b
	mov	eax,[ebp-172]
	mov	[ebp-208],eax
	mov	eax,[ebp-176]
	mov	[ebp-212],eax
	mov	eax,[ebp-180]
	mov	ecx,[eax+4]
	mov	[ebp-216],ecx
	mov	eax,[ebp-180]
	mov	ecx,[eax]
	mov	[ebp-220],ecx
	mov	eax,[ebp-192]
	mov	[ebp-224],eax
	mov	eax,[ebp-200]
	mov	[ebp-228],eax
	mov	eax,[ebp-196]
	mov	[ebp-232],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-224]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-232]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-236],eax
	mov	eax,[ebp-228]
	sal	eax,2
	add	eax,[ebp-236]
	mov	ecx,[ebp-232]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-240],eax
label0048:
	mov	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-220]
	mov	[ebp-284],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-284]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-288],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-280]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-292],eax
	mov	eax,[ebp-292]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-288]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-296],ecx
label004c:
; end of inline function _tex2d
	mov	eax,[ebp-296]
	mov	[ebp-244],eax
	mov	eax,[ebp-244]
	sar	eax,24
	and	eax,255
	mov	[ebp-272],eax
	cmp	dword ptr [ebp-272],0
	je	label004b
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	eax,[ebp-236]
	mov	ecx,[eax]
	mov	[ebp-260],ecx
	mov	eax,[ebp-260]
	and	eax,65280
	sar	eax,8
	mov	[ebp-264],eax
	mov	eax,[ebp-260]
	and	eax,255
	mov	[ebp-268],eax
	mov	eax,[ebp-244]
	and	eax,65280
	sar	eax,8
	mov	[ebp-252],eax
	mov	eax,[ebp-244]
	and	eax,255
	mov	[ebp-256],eax
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-252],eax
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-256],eax
	mov	eax,[ebp-252]
	sal	eax,8
	add	eax,[ebp-256]
	mov	[ebp-248],eax
	mov	eax,[ebp-236]
	mov	ecx,[ebp-248]
	mov	[eax],ecx
label004b:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0049:
	add	dword ptr [ebp-236],4
	mov	eax,[ebp-236]
	cmp	eax,[ebp-240]
	jl	label0048
label004a:
label004d:
; end of inline function _rasterize_horiz_line
	jmp	label003c
label003b:
	mov	eax,[ebp-172]
	mov	[ebp-208],eax
	mov	eax,[ebp-176]
	mov	[ebp-212],eax
	mov	eax,[ebp-188]
	mov	ecx,[eax+4]
	mov	[ebp-216],ecx
	mov	eax,[ebp-188]
	mov	ecx,[eax]
	mov	[ebp-220],ecx
	mov	eax,[ebp-192]
	mov	[ebp-224],eax
	mov	eax,[ebp-200]
	mov	[ebp-228],eax
	mov	eax,[ebp-204]
	mov	[ebp-232],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-224]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-232]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-236],eax
	mov	eax,[ebp-228]
	sal	eax,2
	add	eax,[ebp-236]
	mov	ecx,[ebp-232]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-240],eax
label004e:
	mov	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-220]
	mov	[ebp-284],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-284]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-288],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-280]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-292],eax
	mov	eax,[ebp-292]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-288]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-296],ecx
label0052:
; end of inline function _tex2d
	mov	eax,[ebp-296]
	mov	[ebp-244],eax
	mov	eax,[ebp-244]
	sar	eax,24
	and	eax,255
	mov	[ebp-272],eax
	cmp	dword ptr [ebp-272],0
	je	label0051
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	eax,[ebp-236]
	mov	ecx,[eax]
	mov	[ebp-260],ecx
	mov	eax,[ebp-260]
	and	eax,65280
	sar	eax,8
	mov	[ebp-264],eax
	mov	eax,[ebp-260]
	and	eax,255
	mov	[ebp-268],eax
	mov	eax,[ebp-244]
	and	eax,65280
	sar	eax,8
	mov	[ebp-252],eax
	mov	eax,[ebp-244]
	and	eax,255
	mov	[ebp-256],eax
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-252],eax
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-256],eax
	mov	eax,[ebp-252]
	sal	eax,8
	add	eax,[ebp-256]
	mov	[ebp-248],eax
	mov	eax,[ebp-236]
	mov	ecx,[ebp-248]
	mov	[eax],ecx
label0051:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label004f:
	add	dword ptr [ebp-236],4
	mov	eax,[ebp-236]
	cmp	eax,[ebp-240]
	jl	label004e
label0050:
label0053:
; end of inline function _rasterize_horiz_line
label003c:
label003a:
	jmp	label003d
label0038:
	mov	eax,[ebp-196]
	cmp	eax,[ebp-200]
	jge	label003e
	fld	dword ptr [ebp-172]
	fldz
	fsubrp
	fstp	dword ptr [ebp-208]
	fld	dword ptr [ebp-176]
	fldz
	fsubrp
	fstp	dword ptr [ebp-212]
	mov	eax,[ebp-180]
	mov	ecx,[eax+4]
	mov	[ebp-216],ecx
	mov	eax,[ebp-180]
	mov	ecx,[eax]
	mov	[ebp-220],ecx
	mov	eax,[ebp-192]
	mov	[ebp-224],eax
	mov	eax,[ebp-204]
	mov	[ebp-228],eax
	mov	eax,[ebp-196]
	mov	[ebp-232],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-224]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-232]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-236],eax
	mov	eax,[ebp-228]
	sal	eax,2
	add	eax,[ebp-236]
	mov	ecx,[ebp-232]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-240],eax
label0054:
	mov	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-220]
	mov	[ebp-284],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-284]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-288],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-280]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-292],eax
	mov	eax,[ebp-292]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-288]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-296],ecx
label0058:
; end of inline function _tex2d
	mov	eax,[ebp-296]
	mov	[ebp-244],eax
	mov	eax,[ebp-244]
	sar	eax,24
	and	eax,255
	mov	[ebp-272],eax
	cmp	dword ptr [ebp-272],0
	je	label0057
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	eax,[ebp-236]
	mov	ecx,[eax]
	mov	[ebp-260],ecx
	mov	eax,[ebp-260]
	and	eax,65280
	sar	eax,8
	mov	[ebp-264],eax
	mov	eax,[ebp-260]
	and	eax,255
	mov	[ebp-268],eax
	mov	eax,[ebp-244]
	and	eax,65280
	sar	eax,8
	mov	[ebp-252],eax
	mov	eax,[ebp-244]
	and	eax,255
	mov	[ebp-256],eax
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-252],eax
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-256],eax
	mov	eax,[ebp-252]
	sal	eax,8
	add	eax,[ebp-256]
	mov	[ebp-248],eax
	mov	eax,[ebp-236]
	mov	ecx,[ebp-248]
	mov	[eax],ecx
label0057:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0055:
	add	dword ptr [ebp-236],4
	mov	eax,[ebp-236]
	cmp	eax,[ebp-240]
	jl	label0054
label0056:
label0059:
; end of inline function _rasterize_horiz_line
	jmp	label003f
label003e:
	mov	eax,[ebp-196]
	cmp	eax,[ebp-204]
	jle	label0040
	fld	dword ptr [ebp-172]
	fldz
	fsubrp
	fstp	dword ptr [ebp-208]
	fld	dword ptr [ebp-176]
	fldz
	fsubrp
	fstp	dword ptr [ebp-212]
	mov	eax,[ebp-184]
	mov	ecx,[eax+4]
	mov	[ebp-216],ecx
	mov	eax,[ebp-184]
	mov	ecx,[eax]
	mov	[ebp-220],ecx
	mov	eax,[ebp-192]
	mov	[ebp-224],eax
	mov	eax,[ebp-196]
	mov	[ebp-228],eax
	mov	eax,[ebp-200]
	mov	[ebp-232],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-224]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-232]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-236],eax
	mov	eax,[ebp-228]
	sal	eax,2
	add	eax,[ebp-236]
	mov	ecx,[ebp-232]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-240],eax
label005a:
	mov	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-220]
	mov	[ebp-284],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-284]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-288],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-280]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-292],eax
	mov	eax,[ebp-292]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-288]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-296],ecx
label005e:
; end of inline function _tex2d
	mov	eax,[ebp-296]
	mov	[ebp-244],eax
	mov	eax,[ebp-244]
	sar	eax,24
	and	eax,255
	mov	[ebp-272],eax
	cmp	dword ptr [ebp-272],0
	je	label005d
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	eax,[ebp-236]
	mov	ecx,[eax]
	mov	[ebp-260],ecx
	mov	eax,[ebp-260]
	and	eax,65280
	sar	eax,8
	mov	[ebp-264],eax
	mov	eax,[ebp-260]
	and	eax,255
	mov	[ebp-268],eax
	mov	eax,[ebp-244]
	and	eax,65280
	sar	eax,8
	mov	[ebp-252],eax
	mov	eax,[ebp-244]
	and	eax,255
	mov	[ebp-256],eax
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-252],eax
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-256],eax
	mov	eax,[ebp-252]
	sal	eax,8
	add	eax,[ebp-256]
	mov	[ebp-248],eax
	mov	eax,[ebp-236]
	mov	ecx,[ebp-248]
	mov	[eax],ecx
label005d:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label005b:
	add	dword ptr [ebp-236],4
	mov	eax,[ebp-236]
	cmp	eax,[ebp-240]
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
	mov	eax,[ebp-184]
	mov	ecx,[eax+4]
	mov	[ebp-216],ecx
	mov	eax,[ebp-184]
	mov	ecx,[eax]
	mov	[ebp-220],ecx
	mov	eax,[ebp-192]
	mov	[ebp-224],eax
	mov	eax,[ebp-204]
	mov	[ebp-228],eax
	mov	eax,[ebp-200]
	mov	[ebp-232],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-224]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-232]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-236],eax
	mov	eax,[ebp-228]
	sal	eax,2
	add	eax,[ebp-236]
	mov	ecx,[ebp-232]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-240],eax
label0060:
	mov	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-220]
	mov	[ebp-284],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-284]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-288],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-280]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-292],eax
	mov	eax,[ebp-292]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-288]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-296],ecx
label0064:
; end of inline function _tex2d
	mov	eax,[ebp-296]
	mov	[ebp-244],eax
	mov	eax,[ebp-244]
	sar	eax,24
	and	eax,255
	mov	[ebp-272],eax
	cmp	dword ptr [ebp-272],0
	je	label0063
	fild	dword ptr [ebp-272]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-276]
	mov	eax,[ebp-236]
	mov	ecx,[eax]
	mov	[ebp-260],ecx
	mov	eax,[ebp-260]
	and	eax,65280
	sar	eax,8
	mov	[ebp-264],eax
	mov	eax,[ebp-260]
	and	eax,255
	mov	[ebp-268],eax
	mov	eax,[ebp-244]
	and	eax,65280
	sar	eax,8
	mov	[ebp-252],eax
	mov	eax,[ebp-244]
	and	eax,255
	mov	[ebp-256],eax
	fild	dword ptr [ebp-252]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-264]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-252],eax
	fild	dword ptr [ebp-256]
	fmul	dword ptr [ebp-276]
	fild	dword ptr [ebp-268]
	fld1
	fsub	dword ptr [ebp-276]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-256],eax
	mov	eax,[ebp-252]
	sal	eax,8
	add	eax,[ebp-256]
	mov	[ebp-248],eax
	mov	eax,[ebp-236]
	mov	ecx,[ebp-248]
	mov	[eax],ecx
label0063:
	fld	dword ptr [ebp-220]
	fadd	dword ptr [ebp-212]
	fstp	dword ptr [ebp-220]
	fld	dword ptr [ebp-216]
	fadd	dword ptr [ebp-208]
	fstp	dword ptr [ebp-216]
label0061:
	add	dword ptr [ebp-236],4
	mov	eax,[ebp-236]
	cmp	eax,[ebp-240]
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
	pop	ebx
	pop	edi
	add	esp,300
	pop	ebp
	ret
label0003:
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-16],ecx
label0005:
label0006:
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,[ebp-16]
	jle	label0007
	mov	eax,[ebp+8]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-16]
	sub	eax,[edi]
	mov	ecx,[ebp+12]
	mov	edx,[ebp+8]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp+12]
	add	ecx,4
	mov	edx,[ebp+8]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp+8]
	add	eax,[ecx]
	mov	[ebp-8],eax
	mov	eax,[ebp+8]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-16]
	sub	eax,[edi]
	mov	ecx,[ebp+16]
	mov	edx,[ebp+8]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp+16]
	add	ecx,4
	mov	edx,[ebp+8]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp+8]
	add	eax,[ecx]
	mov	[ebp-12],eax
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	mov	eax,[ebp+12]
	mov	ecx,[ebp+8]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,[ebp+8]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-20]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	mov	eax,[ebp+16]
	mov	ecx,[ebp+8]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,[ebp+8]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-28]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+8]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-24]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	mov	eax,8
	add	eax,[ebp+16]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+8]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-32]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
	fstp	dword ptr [ebp-40]
	mov	eax,[ebp-40]
	mov	[ebp-44],eax
	mov	eax,[ebp-36]
	mov	[ebp-48],eax
	mov	eax,[ebp-32]
	mov	[ebp-52],eax
	mov	eax,[ebp-28]
	mov	[ebp-56],eax
	mov	eax,[ebp-24]
	mov	[ebp-60],eax
	mov	eax,[ebp-20]
	mov	[ebp-64],eax
	mov	eax,[ebp-16]
	mov	[ebp-68],eax
	mov	eax,[ebp-12]
	mov	[ebp-72],eax
	mov	eax,[ebp-8]
	mov	[ebp-76],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-76]
	cmp	eax,[ebp-72]
	jg	label000b
	mov	eax,[ebp-44]
	mov	[ebp-80],eax
	mov	eax,[ebp-48]
	mov	[ebp-84],eax
	mov	eax,[ebp-60]
	mov	[ebp-88],eax
	mov	eax,[ebp-64]
	mov	[ebp-92],eax
	mov	eax,[ebp-68]
	mov	[ebp-96],eax
	mov	eax,[ebp-72]
	mov	[ebp-100],eax
	mov	eax,[ebp-76]
	mov	[ebp-104],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-96]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-104]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-108],eax
	mov	eax,[ebp-100]
	sal	eax,2
	add	eax,[ebp-108]
	mov	ecx,[ebp-104]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-112],eax
label000d:
	mov	eax,[ebp-88]
	mov	[ebp-152],eax
	mov	eax,[ebp-92]
	mov	[ebp-156],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-156]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-160],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-152]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-164],eax
	mov	eax,[ebp-164]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-160]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-168],ecx
label0011:
; end of inline function _tex2d
	mov	eax,[ebp-168]
	mov	[ebp-116],eax
	mov	eax,[ebp-116]
	sar	eax,24
	and	eax,255
	mov	[ebp-144],eax
	cmp	dword ptr [ebp-144],0
	je	label0010
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	eax,[ebp-108]
	mov	ecx,[eax]
	mov	[ebp-132],ecx
	mov	eax,[ebp-132]
	and	eax,65280
	sar	eax,8
	mov	[ebp-136],eax
	mov	eax,[ebp-132]
	and	eax,255
	mov	[ebp-140],eax
	mov	eax,[ebp-116]
	and	eax,65280
	sar	eax,8
	mov	[ebp-124],eax
	mov	eax,[ebp-116]
	and	eax,255
	mov	[ebp-128],eax
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-124],eax
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-128],eax
	mov	eax,[ebp-124]
	sal	eax,8
	add	eax,[ebp-128]
	mov	[ebp-120],eax
	mov	eax,[ebp-108]
	mov	ecx,[ebp-120]
	mov	[eax],ecx
label0010:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label000e:
	add	dword ptr [ebp-108],4
	mov	eax,[ebp-108]
	cmp	eax,[ebp-112]
	jl	label000d
label000f:
label0012:
; end of inline function _rasterize_horiz_line
	jmp	label000c
label000b:
	mov	eax,[ebp-44]
	mov	[ebp-80],eax
	mov	eax,[ebp-48]
	mov	[ebp-84],eax
	mov	eax,[ebp-52]
	mov	[ebp-88],eax
	mov	eax,[ebp-56]
	mov	[ebp-92],eax
	mov	eax,[ebp-68]
	mov	[ebp-96],eax
	mov	eax,[ebp-76]
	mov	[ebp-100],eax
	mov	eax,[ebp-72]
	mov	[ebp-104],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-96]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-104]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-108],eax
	mov	eax,[ebp-100]
	sal	eax,2
	add	eax,[ebp-108]
	mov	ecx,[ebp-104]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-112],eax
label0013:
	mov	eax,[ebp-88]
	mov	[ebp-152],eax
	mov	eax,[ebp-92]
	mov	[ebp-156],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-156]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-160],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-152]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-164],eax
	mov	eax,[ebp-164]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-160]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-168],ecx
label0017:
; end of inline function _tex2d
	mov	eax,[ebp-168]
	mov	[ebp-116],eax
	mov	eax,[ebp-116]
	sar	eax,24
	and	eax,255
	mov	[ebp-144],eax
	cmp	dword ptr [ebp-144],0
	je	label0016
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	eax,[ebp-108]
	mov	ecx,[eax]
	mov	[ebp-132],ecx
	mov	eax,[ebp-132]
	and	eax,65280
	sar	eax,8
	mov	[ebp-136],eax
	mov	eax,[ebp-132]
	and	eax,255
	mov	[ebp-140],eax
	mov	eax,[ebp-116]
	and	eax,65280
	sar	eax,8
	mov	[ebp-124],eax
	mov	eax,[ebp-116]
	and	eax,255
	mov	[ebp-128],eax
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-124],eax
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-128],eax
	mov	eax,[ebp-124]
	sal	eax,8
	add	eax,[ebp-128]
	mov	[ebp-120],eax
	mov	eax,[ebp-108]
	mov	ecx,[ebp-120]
	mov	[eax],ecx
label0016:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0014:
	add	dword ptr [ebp-108],4
	mov	eax,[ebp-108]
	cmp	eax,[ebp-112]
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
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edi,eax
	mov	eax,[edi]
	sub	eax,[ecx]
	mov	ecx,[ebp+16]
	mov	edx,[ebp+8]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp+16]
	add	ecx,4
	mov	edx,[ebp+8]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp+8]
	add	eax,[ecx]
	mov	[ebp-12],eax
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	mov	eax,[ebp+16]
	mov	ecx,[ebp+8]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,[ebp+8]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-28]
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	mov	eax,8
	add	eax,[ebp+16]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+8]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-32]
	mov	eax,[ebp+12]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [eax+8]
	mov	eax,[ebp+12]
	mov	ecx,[ebp-12]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	fdivp
	fstp	dword ptr [ebp-36]
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	fld	dword ptr [ebp-32]
	fsub	dword ptr [eax]
	mov	eax,[ebp+12]
	mov	ecx,[ebp-12]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	fdivp
	fstp	dword ptr [ebp-40]
	mov	eax,[ebp-40]
	mov	[ebp-44],eax
	mov	eax,[ebp-36]
	mov	[ebp-48],eax
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-52],ecx
	mov	eax,[ebp+12]
	mov	ecx,[eax+8]
	mov	[ebp-56],ecx
	mov	eax,[ebp-32]
	mov	[ebp-60],eax
	mov	eax,[ebp-28]
	mov	[ebp-64],eax
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-68],ecx
	mov	eax,[ebp+12]
	mov	ecx,[eax]
	mov	[ebp-72],ecx
	mov	eax,[ebp-12]
	mov	[ebp-76],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-76]
	cmp	eax,[ebp-72]
	jg	label001a
	mov	eax,[ebp-44]
	mov	[ebp-80],eax
	mov	eax,[ebp-48]
	mov	[ebp-84],eax
	mov	eax,[ebp-60]
	mov	[ebp-88],eax
	mov	eax,[ebp-64]
	mov	[ebp-92],eax
	mov	eax,[ebp-68]
	mov	[ebp-96],eax
	mov	eax,[ebp-72]
	mov	[ebp-100],eax
	mov	eax,[ebp-76]
	mov	[ebp-104],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-96]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-104]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-108],eax
	mov	eax,[ebp-100]
	sal	eax,2
	add	eax,[ebp-108]
	mov	ecx,[ebp-104]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-112],eax
label001c:
	mov	eax,[ebp-88]
	mov	[ebp-152],eax
	mov	eax,[ebp-92]
	mov	[ebp-156],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-156]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-160],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-152]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-164],eax
	mov	eax,[ebp-164]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-160]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-168],ecx
label0020:
; end of inline function _tex2d
	mov	eax,[ebp-168]
	mov	[ebp-116],eax
	mov	eax,[ebp-116]
	sar	eax,24
	and	eax,255
	mov	[ebp-144],eax
	cmp	dword ptr [ebp-144],0
	je	label001f
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	eax,[ebp-108]
	mov	ecx,[eax]
	mov	[ebp-132],ecx
	mov	eax,[ebp-132]
	and	eax,65280
	sar	eax,8
	mov	[ebp-136],eax
	mov	eax,[ebp-132]
	and	eax,255
	mov	[ebp-140],eax
	mov	eax,[ebp-116]
	and	eax,65280
	sar	eax,8
	mov	[ebp-124],eax
	mov	eax,[ebp-116]
	and	eax,255
	mov	[ebp-128],eax
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-124],eax
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-128],eax
	mov	eax,[ebp-124]
	sal	eax,8
	add	eax,[ebp-128]
	mov	[ebp-120],eax
	mov	eax,[ebp-108]
	mov	ecx,[ebp-120]
	mov	[eax],ecx
label001f:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label001d:
	add	dword ptr [ebp-108],4
	mov	eax,[ebp-108]
	cmp	eax,[ebp-112]
	jl	label001c
label001e:
label0021:
; end of inline function _rasterize_horiz_line
	jmp	label001b
label001a:
	mov	eax,[ebp-44]
	mov	[ebp-80],eax
	mov	eax,[ebp-48]
	mov	[ebp-84],eax
	mov	eax,[ebp-52]
	mov	[ebp-88],eax
	mov	eax,[ebp-56]
	mov	[ebp-92],eax
	mov	eax,[ebp-68]
	mov	[ebp-96],eax
	mov	eax,[ebp-76]
	mov	[ebp-100],eax
	mov	eax,[ebp-72]
	mov	[ebp-104],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-96]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-104]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-108],eax
	mov	eax,[ebp-100]
	sal	eax,2
	add	eax,[ebp-108]
	mov	ecx,[ebp-104]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-112],eax
label0022:
	mov	eax,[ebp-88]
	mov	[ebp-152],eax
	mov	eax,[ebp-92]
	mov	[ebp-156],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-156]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-160],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-152]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-164],eax
	mov	eax,[ebp-164]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-160]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-168],ecx
label0026:
; end of inline function _tex2d
	mov	eax,[ebp-168]
	mov	[ebp-116],eax
	mov	eax,[ebp-116]
	sar	eax,24
	and	eax,255
	mov	[ebp-144],eax
	cmp	dword ptr [ebp-144],0
	je	label0025
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	eax,[ebp-108]
	mov	ecx,[eax]
	mov	[ebp-132],ecx
	mov	eax,[ebp-132]
	and	eax,65280
	sar	eax,8
	mov	[ebp-136],eax
	mov	eax,[ebp-132]
	and	eax,255
	mov	[ebp-140],eax
	mov	eax,[ebp-116]
	and	eax,65280
	sar	eax,8
	mov	[ebp-124],eax
	mov	eax,[ebp-116]
	and	eax,255
	mov	[ebp-128],eax
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-124],eax
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-128],eax
	mov	eax,[ebp-124]
	sal	eax,8
	add	eax,[ebp-128]
	mov	[ebp-120],eax
	mov	eax,[ebp-108]
	mov	ecx,[ebp-120]
	mov	[eax],ecx
label0025:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0023:
	add	dword ptr [ebp-108],4
	mov	eax,[ebp-108]
	cmp	eax,[ebp-112]
	jl	label0022
label0024:
label0027:
; end of inline function _rasterize_horiz_line
label001b:
label0028:
; end of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,1
	add	ecx,[eax]
	mov	[ebp-16],ecx
label0008:
label0009:
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,[ebp-16]
	jle	label000a
	mov	eax,[ebp+12]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-16]
	sub	eax,[edi]
	mov	ecx,[ebp+16]
	mov	edx,[ebp+12]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp+16]
	add	ecx,4
	mov	edx,[ebp+12]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp+12]
	add	eax,[ecx]
	mov	[ebp-8],eax
	mov	eax,[ebp+8]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-16]
	sub	eax,[edi]
	mov	ecx,[ebp+16]
	mov	edx,[ebp+8]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp+16]
	add	ecx,4
	mov	edx,[ebp+8]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp+8]
	add	eax,[ecx]
	mov	[ebp-12],eax
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	mov	eax,[ebp+16]
	mov	ecx,[ebp+12]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+12]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,[ebp+12]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-20]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	mov	eax,[ebp+16]
	mov	ecx,[ebp+8]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,[ebp+8]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-28]
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	mov	eax,8
	add	eax,[ebp+16]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+12]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+12]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-24]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-300],ecx
	fild	dword ptr [ebp-300]
	mov	eax,8
	add	eax,[ebp+16]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+8]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-300],edx
	fild	dword ptr [ebp-300]
	fdivp
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-32]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
	fstp	dword ptr [ebp-40]
	mov	eax,[ebp-40]
	mov	[ebp-44],eax
	mov	eax,[ebp-36]
	mov	[ebp-48],eax
	mov	eax,[ebp-32]
	mov	[ebp-52],eax
	mov	eax,[ebp-28]
	mov	[ebp-56],eax
	mov	eax,[ebp-24]
	mov	[ebp-60],eax
	mov	eax,[ebp-20]
	mov	[ebp-64],eax
	mov	eax,[ebp-16]
	mov	[ebp-68],eax
	mov	eax,[ebp-12]
	mov	[ebp-72],eax
	mov	eax,[ebp-8]
	mov	[ebp-76],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-76]
	cmp	eax,[ebp-72]
	jg	label0029
	mov	eax,[ebp-44]
	mov	[ebp-80],eax
	mov	eax,[ebp-48]
	mov	[ebp-84],eax
	mov	eax,[ebp-60]
	mov	[ebp-88],eax
	mov	eax,[ebp-64]
	mov	[ebp-92],eax
	mov	eax,[ebp-68]
	mov	[ebp-96],eax
	mov	eax,[ebp-72]
	mov	[ebp-100],eax
	mov	eax,[ebp-76]
	mov	[ebp-104],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-96]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-104]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-108],eax
	mov	eax,[ebp-100]
	sal	eax,2
	add	eax,[ebp-108]
	mov	ecx,[ebp-104]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-112],eax
label002b:
	mov	eax,[ebp-88]
	mov	[ebp-152],eax
	mov	eax,[ebp-92]
	mov	[ebp-156],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-156]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-160],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-152]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-164],eax
	mov	eax,[ebp-164]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-160]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-168],ecx
label002f:
; end of inline function _tex2d
	mov	eax,[ebp-168]
	mov	[ebp-116],eax
	mov	eax,[ebp-116]
	sar	eax,24
	and	eax,255
	mov	[ebp-144],eax
	cmp	dword ptr [ebp-144],0
	je	label002e
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	eax,[ebp-108]
	mov	ecx,[eax]
	mov	[ebp-132],ecx
	mov	eax,[ebp-132]
	and	eax,65280
	sar	eax,8
	mov	[ebp-136],eax
	mov	eax,[ebp-132]
	and	eax,255
	mov	[ebp-140],eax
	mov	eax,[ebp-116]
	and	eax,65280
	sar	eax,8
	mov	[ebp-124],eax
	mov	eax,[ebp-116]
	and	eax,255
	mov	[ebp-128],eax
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-124],eax
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-128],eax
	mov	eax,[ebp-124]
	sal	eax,8
	add	eax,[ebp-128]
	mov	[ebp-120],eax
	mov	eax,[ebp-108]
	mov	ecx,[ebp-120]
	mov	[eax],ecx
label002e:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label002c:
	add	dword ptr [ebp-108],4
	mov	eax,[ebp-108]
	cmp	eax,[ebp-112]
	jl	label002b
label002d:
label0030:
; end of inline function _rasterize_horiz_line
	jmp	label002a
label0029:
	mov	eax,[ebp-44]
	mov	[ebp-80],eax
	mov	eax,[ebp-48]
	mov	[ebp-84],eax
	mov	eax,[ebp-52]
	mov	[ebp-88],eax
	mov	eax,[ebp-56]
	mov	[ebp-92],eax
	mov	eax,[ebp-68]
	mov	[ebp-96],eax
	mov	eax,[ebp-76]
	mov	[ebp-100],eax
	mov	eax,[ebp-72]
	mov	[ebp-104],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-96]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-104]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-108],eax
	mov	eax,[ebp-100]
	sal	eax,2
	add	eax,[ebp-108]
	mov	ecx,[ebp-104]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-112],eax
label0031:
	mov	eax,[ebp-88]
	mov	[ebp-152],eax
	mov	eax,[ebp-92]
	mov	[ebp-156],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-156]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-160],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-300],eax
	fild	dword ptr [ebp-300]
	fmul	dword ptr [ebp-152]
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-164],eax
	mov	eax,[ebp-164]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-160]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-168],ecx
label0035:
; end of inline function _tex2d
	mov	eax,[ebp-168]
	mov	[ebp-116],eax
	mov	eax,[ebp-116]
	sar	eax,24
	and	eax,255
	mov	[ebp-144],eax
	cmp	dword ptr [ebp-144],0
	je	label0034
	fild	dword ptr [ebp-144]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-148]
	mov	eax,[ebp-108]
	mov	ecx,[eax]
	mov	[ebp-132],ecx
	mov	eax,[ebp-132]
	and	eax,65280
	sar	eax,8
	mov	[ebp-136],eax
	mov	eax,[ebp-132]
	and	eax,255
	mov	[ebp-140],eax
	mov	eax,[ebp-116]
	and	eax,65280
	sar	eax,8
	mov	[ebp-124],eax
	mov	eax,[ebp-116]
	and	eax,255
	mov	[ebp-128],eax
	fild	dword ptr [ebp-124]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-136]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-124],eax
	fild	dword ptr [ebp-128]
	fmul	dword ptr [ebp-148]
	fild	dword ptr [ebp-140]
	fld1
	fsub	dword ptr [ebp-148]
	fmulp
	faddp
	fistp	dword ptr [ebp-300]
	mov	eax,[ebp-300]
	mov	[ebp-128],eax
	mov	eax,[ebp-124]
	sal	eax,8
	add	eax,[ebp-128]
	mov	[ebp-120],eax
	mov	eax,[ebp-108]
	mov	ecx,[ebp-120]
	mov	[eax],ecx
label0034:
	fld	dword ptr [ebp-92]
	fadd	dword ptr [ebp-84]
	fstp	dword ptr [ebp-92]
	fld	dword ptr [ebp-88]
	fadd	dword ptr [ebp-80]
	fstp	dword ptr [ebp-88]
label0032:
	add	dword ptr [ebp-108],4
	mov	eax,[ebp-108]
	cmp	eax,[ebp-112]
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
	pop	ebx
	pop	edi
	add	esp,300
	pop	ebp
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	push	ebp
	mov	ebp,esp
	sub	esp,136
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+8]
	mov	dword ptr [edi+192],0
	mov	esi,[ebp+12]
	mov	ebx,[ebp+12]
	add	ebx,24
label0000:
label0001:
	mov	eax,[ebp+12]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp+12]
	add	eax,ecx
	cmp	eax,ebx
	jle	label0002
	mov	eax,[ebp+16]
	mov	[ebp-108],eax
	mov	[ebp-112],esi
	lea	eax,[ebp-24]
	mov	[ebp-116],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+12]
label000b:
; end of inline function vec4f_subtract
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-128]
label000f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-52]
	mov	eax,[ebp+16]
	mov	[ebp-108],eax
	mov	[ebp-112],ebx
	lea	eax,[ebp-24]
	mov	[ebp-116],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+12]
label000c:
; end of inline function vec4f_subtract
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	[ebp-108],esi
	mov	eax,[ebp+16]
	mov	[ebp-112],eax
	lea	eax,[ebp-24]
	mov	[ebp-116],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+12]
label000d:
; end of inline function vec4f_subtract
	mov	[ebp-108],esi
	mov	[ebp-112],ebx
	lea	eax,[ebp-40]
	mov	[ebp-116],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-116]
	fstp	dword ptr [eax+12]
label000e:
; end of inline function vec4f_subtract
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-128]
label0011:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-40]
	mov	[ebp-124],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-128]
label0012:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fdivp
	fstp	dword ptr [ebp-60]
	mov	eax,[ebp-60]
	mov	[ebp-132],eax
	lea	eax,[ebp-40]
	mov	[ebp-136],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-136]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [eax]
	mov	eax,[ebp-136]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-136]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-136]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [eax+12]
label0013:
; end of inline function vec4f_mul
	lea	eax,[ebp-40]
	mov	[ebp-96],eax
	mov	[ebp-100],esi
	mov	eax,[edi+192]
	imul	eax,24
	mov	ecx,edi
	add	ecx,eax
	mov	[ebp-104],ecx
; start of inline function vec4f_add
	mov	eax,[ebp-100]
	mov	ecx,[ebp-96]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-104]
	fstp	dword ptr [eax]
	mov	eax,[ebp-100]
	mov	ecx,[ebp-96]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-104]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-100]
	mov	ecx,[ebp-96]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-104]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-100]
	mov	ecx,[ebp-96]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-104]
	fstp	dword ptr [eax+12]
label000a:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,esi
	mov	[ebp-76],eax
	mov	eax,16
	add	eax,ebx
	mov	[ebp-80],eax
	lea	eax,[ebp-48]
	mov	[ebp-84],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-80]
	mov	ecx,[ebp-76]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-84]
	fstp	dword ptr [eax]
	mov	eax,[ebp-80]
	mov	ecx,[ebp-76]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-84]
	fstp	dword ptr [eax+4]
label0008:
; end of inline function vec2f_subtract
	mov	eax,[ebp-60]
	mov	[ebp-88],eax
	lea	eax,[ebp-48]
	mov	[ebp-92],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-92]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [eax]
	mov	eax,[ebp-92]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [eax+4]
label0009:
; end of inline function vec2f_mul
	lea	eax,[ebp-48]
	mov	[ebp-64],eax
	mov	eax,16
	add	eax,esi
	mov	[ebp-68],eax
	mov	eax,[edi+192]
	imul	eax,24
	mov	ecx,edi
	add	ecx,eax
	add	ecx,16
	mov	[ebp-72],ecx
; start of inline function vec2f_add
	mov	eax,[ebp-68]
	mov	ecx,[ebp-64]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-72]
	fstp	dword ptr [eax]
	mov	eax,[ebp-68]
	mov	ecx,[ebp-64]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-72]
	fstp	dword ptr [eax+4]
label0007:
; end of inline function vec2f_add
	inc	dword ptr [edi+192]
label0004:
	add	esi,24
	add	ebx,24
	jmp	label0001
label0002:
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
	add	esp,136
	pop	ebp
	ret
__clip_on_plain endp	

__clip_poligon proc
	push	ebp
	mov	ebp,esp
	sub	esp,348
	push	edi
	push	ebx
	mov	edi,[ebp+8]
	mov	[ebp-200],(offset __clip_z_far_norm)
	mov	[ebp-204],(offset __clip_z_far_base)
	mov	[ebp-208],edi
	lea	eax,[ebp-196]
	mov	[ebp-212],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-212]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-208]
	mov	[ebp-216],eax
	mov	eax,[ebp-208]
	add	eax,24
	mov	[ebp-220],eax
label0000:
label0001:
	mov	eax,[ebp-208]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-208]
	add	eax,ecx
	cmp	eax,[ebp-220]
	jle	label0002
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-216]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label000b:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label000f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label000c:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-216]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-204]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label000d:
; end of inline function vec4f_subtract
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-252]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label000e:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0011:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-252]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0012:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	eax,[ebp-272]
	mov	[ebp-344],eax
	lea	eax,[ebp-252]
	mov	[ebp-348],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-348]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+12]
label0013:
; end of inline function vec4f_mul
	lea	eax,[ebp-252]
	mov	[ebp-308],eax
	mov	eax,[ebp-216]
	mov	[ebp-312],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	[ebp-316],eax
; start of inline function vec4f_add
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+12]
label000a:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-288],eax
	mov	eax,16
	add	eax,[ebp-220]
	mov	[ebp-292],eax
	lea	eax,[ebp-260]
	mov	[ebp-296],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax]
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax+4]
label0008:
; end of inline function vec2f_subtract
	mov	eax,[ebp-272]
	mov	[ebp-300],eax
	lea	eax,[ebp-260]
	mov	[ebp-304],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-304]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax]
	mov	eax,[ebp-304]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax+4]
label0009:
; end of inline function vec2f_mul
	lea	eax,[ebp-260]
	mov	[ebp-276],eax
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	add	eax,16
	mov	[ebp-284],eax
; start of inline function vec2f_add
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax]
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax+4]
label0007:
; end of inline function vec2f_add
	mov	eax,[ebp-212]
	inc	dword ptr [eax+192]
label0004:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label0001
label0002:
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-212]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label0014:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_z_near_norm)
	mov	[ebp-204],(offset __clip_z_near_base)
	lea	eax,[ebp-196]
	mov	[ebp-208],eax
	mov	[ebp-212],edi
; start of inline function _clip_on_plain
	mov	eax,[ebp-212]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-208]
	mov	[ebp-216],eax
	mov	eax,[ebp-208]
	add	eax,24
	mov	[ebp-220],eax
label0015:
label0016:
	mov	eax,[ebp-208]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-208]
	add	eax,ecx
	cmp	eax,[ebp-220]
	jle	label0017
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-216]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0020:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0024:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0021:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-216]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-204]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0022:
; end of inline function vec4f_subtract
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-252]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0023:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0026:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-252]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0027:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	eax,[ebp-272]
	mov	[ebp-344],eax
	lea	eax,[ebp-252]
	mov	[ebp-348],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-348]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+12]
label0028:
; end of inline function vec4f_mul
	lea	eax,[ebp-252]
	mov	[ebp-308],eax
	mov	eax,[ebp-216]
	mov	[ebp-312],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	[ebp-316],eax
; start of inline function vec4f_add
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+12]
label001f:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-288],eax
	mov	eax,16
	add	eax,[ebp-220]
	mov	[ebp-292],eax
	lea	eax,[ebp-260]
	mov	[ebp-296],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax]
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax+4]
label001d:
; end of inline function vec2f_subtract
	mov	eax,[ebp-272]
	mov	[ebp-300],eax
	lea	eax,[ebp-260]
	mov	[ebp-304],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-304]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax]
	mov	eax,[ebp-304]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax+4]
label001e:
; end of inline function vec2f_mul
	lea	eax,[ebp-260]
	mov	[ebp-276],eax
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	add	eax,16
	mov	[ebp-284],eax
; start of inline function vec2f_add
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax]
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax+4]
label001c:
; end of inline function vec2f_add
	mov	eax,[ebp-212]
	inc	dword ptr [eax+192]
label0019:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label0016
label0017:
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-212]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label0029:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_plane_left_norm)
	mov	[ebp-204],(offset __clip_plane_left_base)
	mov	[ebp-208],edi
	lea	eax,[ebp-196]
	mov	[ebp-212],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-212]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-208]
	mov	[ebp-216],eax
	mov	eax,[ebp-208]
	add	eax,24
	mov	[ebp-220],eax
label002a:
label002b:
	mov	eax,[ebp-208]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-208]
	add	eax,ecx
	cmp	eax,[ebp-220]
	jle	label002c
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-216]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0035:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0039:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0036:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-216]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-204]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0037:
; end of inline function vec4f_subtract
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-252]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0038:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label003b:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-252]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label003c:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	eax,[ebp-272]
	mov	[ebp-344],eax
	lea	eax,[ebp-252]
	mov	[ebp-348],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-348]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+12]
label003d:
; end of inline function vec4f_mul
	lea	eax,[ebp-252]
	mov	[ebp-308],eax
	mov	eax,[ebp-216]
	mov	[ebp-312],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	[ebp-316],eax
; start of inline function vec4f_add
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+12]
label0034:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-288],eax
	mov	eax,16
	add	eax,[ebp-220]
	mov	[ebp-292],eax
	lea	eax,[ebp-260]
	mov	[ebp-296],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax]
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax+4]
label0032:
; end of inline function vec2f_subtract
	mov	eax,[ebp-272]
	mov	[ebp-300],eax
	lea	eax,[ebp-260]
	mov	[ebp-304],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-304]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax]
	mov	eax,[ebp-304]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax+4]
label0033:
; end of inline function vec2f_mul
	lea	eax,[ebp-260]
	mov	[ebp-276],eax
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	add	eax,16
	mov	[ebp-284],eax
; start of inline function vec2f_add
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax]
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax+4]
label0031:
; end of inline function vec2f_add
	mov	eax,[ebp-212]
	inc	dword ptr [eax+192]
label002e:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label002b
label002c:
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-212]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label003e:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_plane_right_norm)
	mov	[ebp-204],(offset __clip_plane_right_base)
	lea	eax,[ebp-196]
	mov	[ebp-208],eax
	mov	[ebp-212],edi
; start of inline function _clip_on_plain
	mov	eax,[ebp-212]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-208]
	mov	[ebp-216],eax
	mov	eax,[ebp-208]
	add	eax,24
	mov	[ebp-220],eax
label003f:
label0040:
	mov	eax,[ebp-208]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-208]
	add	eax,ecx
	cmp	eax,[ebp-220]
	jle	label0041
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-216]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label004a:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label004e:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label004b:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-216]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-204]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label004c:
; end of inline function vec4f_subtract
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-252]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label004d:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0050:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-252]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0051:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	eax,[ebp-272]
	mov	[ebp-344],eax
	lea	eax,[ebp-252]
	mov	[ebp-348],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-348]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+12]
label0052:
; end of inline function vec4f_mul
	lea	eax,[ebp-252]
	mov	[ebp-308],eax
	mov	eax,[ebp-216]
	mov	[ebp-312],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	[ebp-316],eax
; start of inline function vec4f_add
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+12]
label0049:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-288],eax
	mov	eax,16
	add	eax,[ebp-220]
	mov	[ebp-292],eax
	lea	eax,[ebp-260]
	mov	[ebp-296],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax]
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax+4]
label0047:
; end of inline function vec2f_subtract
	mov	eax,[ebp-272]
	mov	[ebp-300],eax
	lea	eax,[ebp-260]
	mov	[ebp-304],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-304]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax]
	mov	eax,[ebp-304]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax+4]
label0048:
; end of inline function vec2f_mul
	lea	eax,[ebp-260]
	mov	[ebp-276],eax
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	add	eax,16
	mov	[ebp-284],eax
; start of inline function vec2f_add
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax]
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax+4]
label0046:
; end of inline function vec2f_add
	mov	eax,[ebp-212]
	inc	dword ptr [eax+192]
label0043:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label0040
label0041:
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-212]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label0053:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_plane_top_norm)
	mov	[ebp-204],(offset __clip_plane_top_base)
	mov	[ebp-208],edi
	lea	eax,[ebp-196]
	mov	[ebp-212],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-212]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-208]
	mov	[ebp-216],eax
	mov	eax,[ebp-208]
	add	eax,24
	mov	[ebp-220],eax
label0054:
label0055:
	mov	eax,[ebp-208]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-208]
	add	eax,ecx
	cmp	eax,[ebp-220]
	jle	label0056
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-216]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label005f:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0063:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0060:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-216]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-204]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0061:
; end of inline function vec4f_subtract
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-252]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0062:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0065:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-252]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0066:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	eax,[ebp-272]
	mov	[ebp-344],eax
	lea	eax,[ebp-252]
	mov	[ebp-348],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-348]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+12]
label0067:
; end of inline function vec4f_mul
	lea	eax,[ebp-252]
	mov	[ebp-308],eax
	mov	eax,[ebp-216]
	mov	[ebp-312],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	[ebp-316],eax
; start of inline function vec4f_add
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+12]
label005e:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-288],eax
	mov	eax,16
	add	eax,[ebp-220]
	mov	[ebp-292],eax
	lea	eax,[ebp-260]
	mov	[ebp-296],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax]
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax+4]
label005c:
; end of inline function vec2f_subtract
	mov	eax,[ebp-272]
	mov	[ebp-300],eax
	lea	eax,[ebp-260]
	mov	[ebp-304],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-304]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax]
	mov	eax,[ebp-304]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax+4]
label005d:
; end of inline function vec2f_mul
	lea	eax,[ebp-260]
	mov	[ebp-276],eax
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	add	eax,16
	mov	[ebp-284],eax
; start of inline function vec2f_add
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax]
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax+4]
label005b:
; end of inline function vec2f_add
	mov	eax,[ebp-212]
	inc	dword ptr [eax+192]
label0058:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label0055
label0056:
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-212]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label0068:
; end of inline function _clip_on_plain
	mov	[ebp-200],(offset __clip_plane_bottom_norm)
	mov	[ebp-204],(offset __clip_plane_bottom_base)
	lea	eax,[ebp-196]
	mov	[ebp-208],eax
	mov	[ebp-212],edi
; start of inline function _clip_on_plain
	mov	eax,[ebp-212]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-208]
	mov	[ebp-216],eax
	mov	eax,[ebp-208]
	add	eax,24
	mov	[ebp-220],eax
label0069:
label006a:
	mov	eax,[ebp-208]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-208]
	add	eax,ecx
	cmp	eax,[ebp-220]
	jle	label006b
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-216]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0074:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label0078:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fstp	dword ptr [ebp-264]
	mov	eax,[ebp-204]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0075:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-216]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-204]
	mov	[ebp-324],eax
	lea	eax,[ebp-236]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0076:
; end of inline function vec4f_subtract
	mov	eax,[ebp-216]
	mov	[ebp-320],eax
	mov	eax,[ebp-220]
	mov	[ebp-324],eax
	lea	eax,[ebp-252]
	mov	[ebp-328],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-324]
	mov	ecx,[ebp-320]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-328]
	fstp	dword ptr [eax+12]
label0077:
; end of inline function vec4f_subtract
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-236]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label007a:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	mov	eax,[ebp-200]
	mov	[ebp-332],eax
	lea	eax,[ebp-252]
	mov	[ebp-336],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-336]
	mov	ecx,[ebp-332]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-340]
label007b:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-340]
	fdivp
	fstp	dword ptr [ebp-272]
	mov	eax,[ebp-272]
	mov	[ebp-344],eax
	lea	eax,[ebp-252]
	mov	[ebp-348],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-348]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-348]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-344]
	fstp	dword ptr [eax+12]
label007c:
; end of inline function vec4f_mul
	lea	eax,[ebp-252]
	mov	[ebp-308],eax
	mov	eax,[ebp-216]
	mov	[ebp-312],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	[ebp-316],eax
; start of inline function vec4f_add
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-312]
	mov	ecx,[ebp-308]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-316]
	fstp	dword ptr [eax+12]
label0073:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-288],eax
	mov	eax,16
	add	eax,[ebp-220]
	mov	[ebp-292],eax
	lea	eax,[ebp-260]
	mov	[ebp-296],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax]
	mov	eax,[ebp-292]
	mov	ecx,[ebp-288]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-296]
	fstp	dword ptr [eax+4]
label0071:
; end of inline function vec2f_subtract
	mov	eax,[ebp-272]
	mov	[ebp-300],eax
	lea	eax,[ebp-260]
	mov	[ebp-304],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-304]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax]
	mov	eax,[ebp-304]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-300]
	fstp	dword ptr [eax+4]
label0072:
; end of inline function vec2f_mul
	lea	eax,[ebp-260]
	mov	[ebp-276],eax
	mov	eax,16
	add	eax,[ebp-216]
	mov	[ebp-280],eax
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	add	eax,16
	mov	[ebp-284],eax
; start of inline function vec2f_add
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax]
	mov	eax,[ebp-280]
	mov	ecx,[ebp-276]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-284]
	fstp	dword ptr [eax+4]
label0070:
; end of inline function vec2f_add
	mov	eax,[ebp-212]
	inc	dword ptr [eax+192]
label006d:
	add	dword ptr [ebp-216],24
	add	dword ptr [ebp-220],24
	jmp	label006a
label006b:
	mov	eax,[ebp-212]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-212]
	add	eax,ecx
	mov	ecx,[ebp-212]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label007d:
; end of inline function _clip_on_plain
	cmp	dword ptr [edi+192],1
	setg	al
	movzx	eax,al
	pop	ebx
	pop	edi
	add	esp,348
	pop	ebp
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	push	ebp
	mov	ebp,esp
	sub	esp,36
	push	edi
	mov	edi,[ebp+8]
	mov	[ebp-24],(offset __viewport_matrix)
	mov	eax,[ebp+12]
	mov	[ebp-28],eax
	lea	eax,[ebp-16]
	mov	[ebp-32],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-32]
	fstp	dword ptr [eax]
	mov	eax,[ebp-24]
	mov	ecx,[ebp-28]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-32]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-24]
	mov	ecx,[ebp-28]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-32]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-24]
	mov	ecx,[ebp-28]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-28]
	mov	ecx,[ebp-24]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-32]
	fstp	dword ptr [eax+12]
label0002:
; end of inline function matrix4f_transform
	lea	eax,[ebp-16]
	add	eax,12
	fld1
	fdiv	dword ptr [eax]
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [ebp-20]
	fistp	dword ptr [ebp-36]
	mov	eax,[ebp-36]
	mov	[edi],eax
	lea	eax,[ebp-16]
	add	eax,4
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-20]
	fistp	dword ptr [ebp-36]
	mov	eax,[ebp-36]
	mov	[edi+4],eax
	cmp	dword ptr [edi],0
	jl	label0001
	mov	eax,[edi]
	cmp	eax,dword ptr [__width]
	jge	label0001
	cmp	dword ptr [edi+4],0
	jl	label0001
	mov	eax,[edi+4]
	cmp	eax,dword ptr [__height]
	jl	label0000
label0001:
	mov	dword ptr ds:[0],0
label0000:
	pop	edi
	add	esp,36
	pop	ebp
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	push	ebp
	mov	ebp,esp
	sub	esp,844
	push	edi
	push	ebx
	mov	eax,[ebp+8]
	mov	[ebp-448],eax
; start of inline function _clip_poligon
	lea	eax,dword ptr [__clip_z_far_norm]
	mov	[ebp-648],eax
	lea	eax,dword ptr [__clip_z_far_base]
	mov	[ebp-652],eax
	mov	eax,[ebp-448]
	mov	[ebp-656],eax
	lea	eax,[ebp-644]
	mov	[ebp-660],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-660]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-656]
	mov	[ebp-664],eax
	mov	eax,[ebp-656]
	add	eax,24
	mov	[ebp-668],eax
label0070:
label0071:
	mov	eax,[ebp-656]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-656]
	add	eax,ecx
	cmp	eax,[ebp-668]
	jle	label0072
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-664]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label007b:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label007f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label007c:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-664]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-652]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label007d:
; end of inline function vec4f_subtract
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-700]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label007e:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label0081:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-700]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label0082:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	eax,[ebp-720]
	mov	[ebp-792],eax
	lea	eax,[ebp-700]
	mov	[ebp-796],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-796]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+12]
label0083:
; end of inline function vec4f_mul
	lea	eax,[ebp-700]
	mov	[ebp-756],eax
	mov	eax,[ebp-664]
	mov	[ebp-760],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	[ebp-764],eax
; start of inline function vec4f_add
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+12]
label007a:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-736],eax
	mov	eax,16
	add	eax,[ebp-668]
	mov	[ebp-740],eax
	lea	eax,[ebp-708]
	mov	[ebp-744],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax]
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax+4]
label0078:
; end of inline function vec2f_subtract
	mov	eax,[ebp-720]
	mov	[ebp-748],eax
	lea	eax,[ebp-708]
	mov	[ebp-752],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-752]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax]
	mov	eax,[ebp-752]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax+4]
label0079:
; end of inline function vec2f_mul
	lea	eax,[ebp-708]
	mov	[ebp-724],eax
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-728],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	add	eax,16
	mov	[ebp-732],eax
; start of inline function vec2f_add
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax]
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax+4]
label0077:
; end of inline function vec2f_add
	mov	eax,[ebp-660]
	inc	dword ptr [eax+192]
label0074:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label0071
label0072:
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-660]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label0084:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_z_near_norm]
	mov	[ebp-648],eax
	lea	eax,dword ptr [__clip_z_near_base]
	mov	[ebp-652],eax
	lea	eax,[ebp-644]
	mov	[ebp-656],eax
	mov	eax,[ebp-448]
	mov	[ebp-660],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-660]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-656]
	mov	[ebp-664],eax
	mov	eax,[ebp-656]
	add	eax,24
	mov	[ebp-668],eax
label0085:
label0086:
	mov	eax,[ebp-656]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-656]
	add	eax,ecx
	cmp	eax,[ebp-668]
	jle	label0087
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-664]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label0090:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label0094:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label0091:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-664]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-652]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label0092:
; end of inline function vec4f_subtract
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-700]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label0093:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label0096:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-700]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label0097:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	eax,[ebp-720]
	mov	[ebp-792],eax
	lea	eax,[ebp-700]
	mov	[ebp-796],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-796]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+12]
label0098:
; end of inline function vec4f_mul
	lea	eax,[ebp-700]
	mov	[ebp-756],eax
	mov	eax,[ebp-664]
	mov	[ebp-760],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	[ebp-764],eax
; start of inline function vec4f_add
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+12]
label008f:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-736],eax
	mov	eax,16
	add	eax,[ebp-668]
	mov	[ebp-740],eax
	lea	eax,[ebp-708]
	mov	[ebp-744],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax]
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax+4]
label008d:
; end of inline function vec2f_subtract
	mov	eax,[ebp-720]
	mov	[ebp-748],eax
	lea	eax,[ebp-708]
	mov	[ebp-752],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-752]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax]
	mov	eax,[ebp-752]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax+4]
label008e:
; end of inline function vec2f_mul
	lea	eax,[ebp-708]
	mov	[ebp-724],eax
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-728],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	add	eax,16
	mov	[ebp-732],eax
; start of inline function vec2f_add
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax]
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax+4]
label008c:
; end of inline function vec2f_add
	mov	eax,[ebp-660]
	inc	dword ptr [eax+192]
label0089:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label0086
label0087:
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-660]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label0099:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_plane_left_norm]
	mov	[ebp-648],eax
	lea	eax,dword ptr [__clip_plane_left_base]
	mov	[ebp-652],eax
	mov	eax,[ebp-448]
	mov	[ebp-656],eax
	lea	eax,[ebp-644]
	mov	[ebp-660],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-660]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-656]
	mov	[ebp-664],eax
	mov	eax,[ebp-656]
	add	eax,24
	mov	[ebp-668],eax
label009a:
label009b:
	mov	eax,[ebp-656]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-656]
	add	eax,ecx
	cmp	eax,[ebp-668]
	jle	label009c
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-664]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00a5:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00a9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00a6:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-664]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-652]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00a7:
; end of inline function vec4f_subtract
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-700]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00a8:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ab:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-700]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ac:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	eax,[ebp-720]
	mov	[ebp-792],eax
	lea	eax,[ebp-700]
	mov	[ebp-796],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-796]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+12]
label00ad:
; end of inline function vec4f_mul
	lea	eax,[ebp-700]
	mov	[ebp-756],eax
	mov	eax,[ebp-664]
	mov	[ebp-760],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	[ebp-764],eax
; start of inline function vec4f_add
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+12]
label00a4:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-736],eax
	mov	eax,16
	add	eax,[ebp-668]
	mov	[ebp-740],eax
	lea	eax,[ebp-708]
	mov	[ebp-744],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax]
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax+4]
label00a2:
; end of inline function vec2f_subtract
	mov	eax,[ebp-720]
	mov	[ebp-748],eax
	lea	eax,[ebp-708]
	mov	[ebp-752],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-752]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax]
	mov	eax,[ebp-752]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax+4]
label00a3:
; end of inline function vec2f_mul
	lea	eax,[ebp-708]
	mov	[ebp-724],eax
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-728],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	add	eax,16
	mov	[ebp-732],eax
; start of inline function vec2f_add
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax]
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax+4]
label00a1:
; end of inline function vec2f_add
	mov	eax,[ebp-660]
	inc	dword ptr [eax+192]
label009e:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label009b
label009c:
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-660]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label00ae:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_plane_right_norm]
	mov	[ebp-648],eax
	lea	eax,dword ptr [__clip_plane_right_base]
	mov	[ebp-652],eax
	lea	eax,[ebp-644]
	mov	[ebp-656],eax
	mov	eax,[ebp-448]
	mov	[ebp-660],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-660]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-656]
	mov	[ebp-664],eax
	mov	eax,[ebp-656]
	add	eax,24
	mov	[ebp-668],eax
label00af:
label00b0:
	mov	eax,[ebp-656]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-656]
	add	eax,ecx
	cmp	eax,[ebp-668]
	jle	label00b1
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-664]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00ba:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00be:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00bb:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-664]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-652]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00bc:
; end of inline function vec4f_subtract
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-700]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00bd:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00c0:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-700]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00c1:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	eax,[ebp-720]
	mov	[ebp-792],eax
	lea	eax,[ebp-700]
	mov	[ebp-796],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-796]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+12]
label00c2:
; end of inline function vec4f_mul
	lea	eax,[ebp-700]
	mov	[ebp-756],eax
	mov	eax,[ebp-664]
	mov	[ebp-760],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	[ebp-764],eax
; start of inline function vec4f_add
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+12]
label00b9:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-736],eax
	mov	eax,16
	add	eax,[ebp-668]
	mov	[ebp-740],eax
	lea	eax,[ebp-708]
	mov	[ebp-744],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax]
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax+4]
label00b7:
; end of inline function vec2f_subtract
	mov	eax,[ebp-720]
	mov	[ebp-748],eax
	lea	eax,[ebp-708]
	mov	[ebp-752],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-752]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax]
	mov	eax,[ebp-752]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax+4]
label00b8:
; end of inline function vec2f_mul
	lea	eax,[ebp-708]
	mov	[ebp-724],eax
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-728],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	add	eax,16
	mov	[ebp-732],eax
; start of inline function vec2f_add
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax]
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax+4]
label00b6:
; end of inline function vec2f_add
	mov	eax,[ebp-660]
	inc	dword ptr [eax+192]
label00b3:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00b0
label00b1:
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-660]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label00c3:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_plane_top_norm]
	mov	[ebp-648],eax
	lea	eax,dword ptr [__clip_plane_top_base]
	mov	[ebp-652],eax
	mov	eax,[ebp-448]
	mov	[ebp-656],eax
	lea	eax,[ebp-644]
	mov	[ebp-660],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-660]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-656]
	mov	[ebp-664],eax
	mov	eax,[ebp-656]
	add	eax,24
	mov	[ebp-668],eax
label00c4:
label00c5:
	mov	eax,[ebp-656]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-656]
	add	eax,ecx
	cmp	eax,[ebp-668]
	jle	label00c6
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-664]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00cf:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d3:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00d0:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-664]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-652]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00d1:
; end of inline function vec4f_subtract
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-700]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00d2:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d5:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-700]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00d6:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	eax,[ebp-720]
	mov	[ebp-792],eax
	lea	eax,[ebp-700]
	mov	[ebp-796],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-796]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+12]
label00d7:
; end of inline function vec4f_mul
	lea	eax,[ebp-700]
	mov	[ebp-756],eax
	mov	eax,[ebp-664]
	mov	[ebp-760],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	[ebp-764],eax
; start of inline function vec4f_add
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+12]
label00ce:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-736],eax
	mov	eax,16
	add	eax,[ebp-668]
	mov	[ebp-740],eax
	lea	eax,[ebp-708]
	mov	[ebp-744],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax]
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax+4]
label00cc:
; end of inline function vec2f_subtract
	mov	eax,[ebp-720]
	mov	[ebp-748],eax
	lea	eax,[ebp-708]
	mov	[ebp-752],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-752]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax]
	mov	eax,[ebp-752]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax+4]
label00cd:
; end of inline function vec2f_mul
	lea	eax,[ebp-708]
	mov	[ebp-724],eax
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-728],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	add	eax,16
	mov	[ebp-732],eax
; start of inline function vec2f_add
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax]
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax+4]
label00cb:
; end of inline function vec2f_add
	mov	eax,[ebp-660]
	inc	dword ptr [eax+192]
label00c8:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00c5
label00c6:
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-660]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label00d8:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-648],eax
	lea	eax,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-652],eax
	lea	eax,[ebp-644]
	mov	[ebp-656],eax
	mov	eax,[ebp-448]
	mov	[ebp-660],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-660]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-656]
	mov	[ebp-664],eax
	mov	eax,[ebp-656]
	add	eax,24
	mov	[ebp-668],eax
label00d9:
label00da:
	mov	eax,[ebp-656]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-656]
	add	eax,ecx
	cmp	eax,[ebp-668]
	jle	label00db
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-664]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00e4:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00e8:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fstp	dword ptr [ebp-712]
	mov	eax,[ebp-652]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00e5:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-664]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-652]
	mov	[ebp-772],eax
	lea	eax,[ebp-684]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00e6:
; end of inline function vec4f_subtract
	mov	eax,[ebp-664]
	mov	[ebp-768],eax
	mov	eax,[ebp-668]
	mov	[ebp-772],eax
	lea	eax,[ebp-700]
	mov	[ebp-776],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-772]
	mov	ecx,[ebp-768]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-776]
	fstp	dword ptr [eax+12]
label00e7:
; end of inline function vec4f_subtract
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-684]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00ea:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	mov	eax,[ebp-648]
	mov	[ebp-780],eax
	lea	eax,[ebp-700]
	mov	[ebp-784],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-784]
	mov	ecx,[ebp-780]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-788]
label00eb:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-788]
	fdivp
	fstp	dword ptr [ebp-720]
	mov	eax,[ebp-720]
	mov	[ebp-792],eax
	lea	eax,[ebp-700]
	mov	[ebp-796],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-796]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-796]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-792]
	fstp	dword ptr [eax+12]
label00ec:
; end of inline function vec4f_mul
	lea	eax,[ebp-700]
	mov	[ebp-756],eax
	mov	eax,[ebp-664]
	mov	[ebp-760],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	[ebp-764],eax
; start of inline function vec4f_add
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-760]
	mov	ecx,[ebp-756]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-764]
	fstp	dword ptr [eax+12]
label00e3:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-736],eax
	mov	eax,16
	add	eax,[ebp-668]
	mov	[ebp-740],eax
	lea	eax,[ebp-708]
	mov	[ebp-744],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax]
	mov	eax,[ebp-740]
	mov	ecx,[ebp-736]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-744]
	fstp	dword ptr [eax+4]
label00e1:
; end of inline function vec2f_subtract
	mov	eax,[ebp-720]
	mov	[ebp-748],eax
	lea	eax,[ebp-708]
	mov	[ebp-752],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-752]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax]
	mov	eax,[ebp-752]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-748]
	fstp	dword ptr [eax+4]
label00e2:
; end of inline function vec2f_mul
	lea	eax,[ebp-708]
	mov	[ebp-724],eax
	mov	eax,16
	add	eax,[ebp-664]
	mov	[ebp-728],eax
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	add	eax,16
	mov	[ebp-732],eax
; start of inline function vec2f_add
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax]
	mov	eax,[ebp-728]
	mov	ecx,[ebp-724]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-732]
	fstp	dword ptr [eax+4]
label00e0:
; end of inline function vec2f_add
	mov	eax,[ebp-660]
	inc	dword ptr [eax+192]
label00dd:
	add	dword ptr [ebp-664],24
	add	dword ptr [ebp-668],24
	jmp	label00da
label00db:
	mov	eax,[ebp-660]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-660]
	add	eax,ecx
	mov	ecx,[ebp-660]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label00ed:
; end of inline function _clip_on_plain
	mov	eax,[ebp-448]
	cmp	dword ptr [eax+192],1
	setg	al
	movzx	eax,al
	mov	[ebp-800],eax
label00ee:
; end of inline function _clip_poligon
	mov	eax,[ebp-800]
	cmp	eax,0
	jne	label0000
	pop	ebx
	pop	edi
	add	esp,844
	pop	ebp
	ret
label0000:
	mov	eax,[ebp+8]
	cmp	dword ptr [eax+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword ptr [ebp-136],0
label0002:
label0003:
	mov	eax,[ebp+8]
	mov	ecx,[eax+192]
	cmp	ecx,[ebp-136]
	jle	label0004
	mov	eax,[ebp+8]
	mov	ecx,[ebp-136]
	imul	ecx,24
	add	eax,ecx
	mov	[ebp-804],eax
	lea	eax,[ebp-132]
	mov	ecx,[ebp-136]
	sal	ecx,4
	add	eax,ecx
	mov	[ebp-808],eax
; start of inline function _transform_to_screen_space
	lea	eax,dword ptr [__viewport_matrix]
	mov	[ebp-832],eax
	mov	eax,[ebp-804]
	mov	[ebp-836],eax
	lea	eax,[ebp-824]
	mov	[ebp-840],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-840]
	fstp	dword ptr [eax]
	mov	eax,[ebp-832]
	mov	ecx,[ebp-836]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-840]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-832]
	mov	ecx,[ebp-836]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-840]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-832]
	mov	ecx,[ebp-836]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-836]
	mov	ecx,[ebp-832]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-840]
	fstp	dword ptr [eax+12]
label00f1:
; end of inline function matrix4f_transform
	lea	eax,[ebp-824]
	add	eax,12
	fld1
	fdiv	dword ptr [eax]
	fstp	dword ptr [ebp-828]
	fld	dword ptr [ebp-824]
	fmul	dword ptr [ebp-828]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	ecx,[ebp-808]
	mov	[ecx],eax
	lea	eax,[ebp-824]
	add	eax,4
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-828]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	ecx,[ebp-808]
	mov	[ecx+4],eax
	mov	eax,[ebp-808]
	cmp	dword ptr [eax],0
	jl	label00f0
	mov	eax,[ebp-808]
	mov	ecx,[eax]
	cmp	ecx,dword ptr [__width]
	jge	label00f0
	mov	eax,[ebp-808]
	cmp	dword ptr [eax+4],0
	jl	label00f0
	mov	eax,[ebp-808]
	mov	ecx,[eax+4]
	cmp	ecx,dword ptr [__height]
	jl	label00ef
label00f0:
	mov	dword ptr ds:[0],0
label00ef:
label00f2:
; end of inline function _transform_to_screen_space
	lea	eax,[ebp-132]
	mov	ecx,[ebp-136]
	sal	ecx,4
	add	eax,ecx
	add	eax,8
	mov	ecx,[ebp+8]
	mov	edx,[ebp-136]
	imul	edx,24
	add	ecx,edx
	add	ecx,16
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	inc	dword ptr [ebp-136]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-136],2
label0005:
label0006:
	mov	eax,[ebp+8]
	mov	ecx,[eax+192]
	dec	ecx
	cmp	ecx,[ebp-136]
	jle	label0007
	lea	eax,[ebp-132]
	mov	ecx,[ebp-136]
	sal	ecx,4
	add	eax,ecx
	mov	[ebp-140],eax
	mov	eax,[ebp-136]
	dec	eax
	sal	eax,4
	lea	ecx,[ebp-132]
	add	ecx,eax
	mov	[ebp-144],ecx
	lea	eax,[ebp-132]
	mov	[ebp-148],eax
; start of inline function _rasterize_triangle_2i
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-144]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label0008
	mov	eax,[ebp-148]
	mov	[ebp-152],eax
	mov	eax,[ebp-144]
	mov	[ebp-148],eax
	mov	eax,[ebp-152]
	mov	[ebp-144],eax
label0008:
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-140]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label0009
	mov	eax,[ebp-148]
	mov	[ebp-152],eax
	mov	eax,[ebp-140]
	mov	[ebp-148],eax
	mov	eax,[ebp-152]
	mov	[ebp-140],eax
label0009:
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[ebp-140]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label000a
	mov	eax,[ebp-144]
	mov	[ebp-152],eax
	mov	eax,[ebp-140]
	mov	[ebp-144],eax
	mov	eax,[ebp-152]
	mov	[ebp-140],eax
label000a:
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-140]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jne	label000b
	mov	eax,[ebp-148]
	add	eax,4
	cmp	dword ptr [eax],0
	jl	label000c
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,dword ptr [__height]
	jge	label000c
	fldz
	fstp	dword ptr [ebp-320]
	fldz
	fstp	dword ptr [ebp-324]
	mov	eax,8
	add	eax,[ebp-140]
	mov	[ebp-328],eax
	mov	eax,8
	add	eax,[ebp-144]
	mov	[ebp-332],eax
	mov	eax,8
	add	eax,[ebp-148]
	mov	[ebp-336],eax
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-340],ecx
	mov	eax,[ebp-140]
	mov	ecx,[eax]
	mov	[ebp-344],ecx
	mov	eax,[ebp-144]
	mov	ecx,[eax]
	mov	[ebp-348],ecx
	mov	eax,[ebp-148]
	mov	ecx,[eax]
	mov	[ebp-352],ecx
; start of inline function _rasterize_triangle_1i
	mov	eax,[ebp-352]
	cmp	eax,[ebp-348]
	jge	label0040
	mov	eax,[ebp-344]
	cmp	eax,[ebp-348]
	jle	label0041
	mov	eax,[ebp-320]
	mov	[ebp-356],eax
	mov	eax,[ebp-324]
	mov	[ebp-360],eax
	mov	eax,[ebp-336]
	mov	ecx,[eax+4]
	mov	[ebp-364],ecx
	mov	eax,[ebp-336]
	mov	ecx,[eax]
	mov	[ebp-368],ecx
	mov	eax,[ebp-340]
	mov	[ebp-372],eax
	mov	eax,[ebp-344]
	mov	[ebp-376],eax
	mov	eax,[ebp-352]
	mov	[ebp-380],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-372]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-380]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-384],eax
	mov	eax,[ebp-376]
	sal	eax,2
	add	eax,[ebp-384]
	mov	ecx,[ebp-380]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-388],eax
label004a:
	mov	eax,[ebp-364]
	mov	[ebp-428],eax
	mov	eax,[ebp-368]
	mov	[ebp-432],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-432]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-436],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-428]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-440],eax
	mov	eax,[ebp-440]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-436]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-444],ecx
label004e:
; end of inline function _tex2d
	mov	eax,[ebp-444]
	mov	[ebp-392],eax
	mov	eax,[ebp-392]
	sar	eax,24
	and	eax,255
	mov	[ebp-420],eax
	cmp	dword ptr [ebp-420],0
	je	label004d
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	eax,[ebp-384]
	mov	ecx,[eax]
	mov	[ebp-408],ecx
	mov	eax,[ebp-408]
	and	eax,65280
	sar	eax,8
	mov	[ebp-412],eax
	mov	eax,[ebp-408]
	and	eax,255
	mov	[ebp-416],eax
	mov	eax,[ebp-392]
	and	eax,65280
	sar	eax,8
	mov	[ebp-400],eax
	mov	eax,[ebp-392]
	and	eax,255
	mov	[ebp-404],eax
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-400],eax
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-404],eax
	mov	eax,[ebp-400]
	sal	eax,8
	add	eax,[ebp-404]
	mov	[ebp-396],eax
	mov	eax,[ebp-384]
	mov	ecx,[ebp-396]
	mov	[eax],ecx
label004d:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label004b:
	add	dword ptr [ebp-384],4
	mov	eax,[ebp-384]
	cmp	eax,[ebp-388]
	jl	label004a
label004c:
label004f:
; end of inline function _rasterize_horiz_line
	jmp	label0042
label0041:
	mov	eax,[ebp-344]
	cmp	eax,[ebp-352]
	jge	label0043
	mov	eax,[ebp-320]
	mov	[ebp-356],eax
	mov	eax,[ebp-324]
	mov	[ebp-360],eax
	mov	eax,[ebp-328]
	mov	ecx,[eax+4]
	mov	[ebp-364],ecx
	mov	eax,[ebp-328]
	mov	ecx,[eax]
	mov	[ebp-368],ecx
	mov	eax,[ebp-340]
	mov	[ebp-372],eax
	mov	eax,[ebp-348]
	mov	[ebp-376],eax
	mov	eax,[ebp-344]
	mov	[ebp-380],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-372]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-380]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-384],eax
	mov	eax,[ebp-376]
	sal	eax,2
	add	eax,[ebp-384]
	mov	ecx,[ebp-380]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-388],eax
label0050:
	mov	eax,[ebp-364]
	mov	[ebp-428],eax
	mov	eax,[ebp-368]
	mov	[ebp-432],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-432]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-436],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-428]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-440],eax
	mov	eax,[ebp-440]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-436]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-444],ecx
label0054:
; end of inline function _tex2d
	mov	eax,[ebp-444]
	mov	[ebp-392],eax
	mov	eax,[ebp-392]
	sar	eax,24
	and	eax,255
	mov	[ebp-420],eax
	cmp	dword ptr [ebp-420],0
	je	label0053
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	eax,[ebp-384]
	mov	ecx,[eax]
	mov	[ebp-408],ecx
	mov	eax,[ebp-408]
	and	eax,65280
	sar	eax,8
	mov	[ebp-412],eax
	mov	eax,[ebp-408]
	and	eax,255
	mov	[ebp-416],eax
	mov	eax,[ebp-392]
	and	eax,65280
	sar	eax,8
	mov	[ebp-400],eax
	mov	eax,[ebp-392]
	and	eax,255
	mov	[ebp-404],eax
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-400],eax
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-404],eax
	mov	eax,[ebp-400]
	sal	eax,8
	add	eax,[ebp-404]
	mov	[ebp-396],eax
	mov	eax,[ebp-384]
	mov	ecx,[ebp-396]
	mov	[eax],ecx
label0053:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0051:
	add	dword ptr [ebp-384],4
	mov	eax,[ebp-384]
	cmp	eax,[ebp-388]
	jl	label0050
label0052:
label0055:
; end of inline function _rasterize_horiz_line
	jmp	label0044
label0043:
	mov	eax,[ebp-320]
	mov	[ebp-356],eax
	mov	eax,[ebp-324]
	mov	[ebp-360],eax
	mov	eax,[ebp-336]
	mov	ecx,[eax+4]
	mov	[ebp-364],ecx
	mov	eax,[ebp-336]
	mov	ecx,[eax]
	mov	[ebp-368],ecx
	mov	eax,[ebp-340]
	mov	[ebp-372],eax
	mov	eax,[ebp-348]
	mov	[ebp-376],eax
	mov	eax,[ebp-352]
	mov	[ebp-380],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-372]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-380]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-384],eax
	mov	eax,[ebp-376]
	sal	eax,2
	add	eax,[ebp-384]
	mov	ecx,[ebp-380]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-388],eax
label0056:
	mov	eax,[ebp-364]
	mov	[ebp-428],eax
	mov	eax,[ebp-368]
	mov	[ebp-432],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-432]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-436],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-428]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-440],eax
	mov	eax,[ebp-440]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-436]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-444],ecx
label005a:
; end of inline function _tex2d
	mov	eax,[ebp-444]
	mov	[ebp-392],eax
	mov	eax,[ebp-392]
	sar	eax,24
	and	eax,255
	mov	[ebp-420],eax
	cmp	dword ptr [ebp-420],0
	je	label0059
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	eax,[ebp-384]
	mov	ecx,[eax]
	mov	[ebp-408],ecx
	mov	eax,[ebp-408]
	and	eax,65280
	sar	eax,8
	mov	[ebp-412],eax
	mov	eax,[ebp-408]
	and	eax,255
	mov	[ebp-416],eax
	mov	eax,[ebp-392]
	and	eax,65280
	sar	eax,8
	mov	[ebp-400],eax
	mov	eax,[ebp-392]
	and	eax,255
	mov	[ebp-404],eax
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-400],eax
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-404],eax
	mov	eax,[ebp-400]
	sal	eax,8
	add	eax,[ebp-404]
	mov	[ebp-396],eax
	mov	eax,[ebp-384]
	mov	ecx,[ebp-396]
	mov	[eax],ecx
label0059:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0057:
	add	dword ptr [ebp-384],4
	mov	eax,[ebp-384]
	cmp	eax,[ebp-388]
	jl	label0056
label0058:
label005b:
; end of inline function _rasterize_horiz_line
label0044:
label0042:
	jmp	label0045
label0040:
	mov	eax,[ebp-344]
	cmp	eax,[ebp-348]
	jge	label0046
	fld	dword ptr [ebp-320]
	fldz
	fsubrp
	fstp	dword ptr [ebp-356]
	fld	dword ptr [ebp-324]
	fldz
	fsubrp
	fstp	dword ptr [ebp-360]
	mov	eax,[ebp-328]
	mov	ecx,[eax+4]
	mov	[ebp-364],ecx
	mov	eax,[ebp-328]
	mov	ecx,[eax]
	mov	[ebp-368],ecx
	mov	eax,[ebp-340]
	mov	[ebp-372],eax
	mov	eax,[ebp-352]
	mov	[ebp-376],eax
	mov	eax,[ebp-344]
	mov	[ebp-380],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-372]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-380]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-384],eax
	mov	eax,[ebp-376]
	sal	eax,2
	add	eax,[ebp-384]
	mov	ecx,[ebp-380]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-388],eax
label005c:
	mov	eax,[ebp-364]
	mov	[ebp-428],eax
	mov	eax,[ebp-368]
	mov	[ebp-432],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-432]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-436],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-428]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-440],eax
	mov	eax,[ebp-440]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-436]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-444],ecx
label0060:
; end of inline function _tex2d
	mov	eax,[ebp-444]
	mov	[ebp-392],eax
	mov	eax,[ebp-392]
	sar	eax,24
	and	eax,255
	mov	[ebp-420],eax
	cmp	dword ptr [ebp-420],0
	je	label005f
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	eax,[ebp-384]
	mov	ecx,[eax]
	mov	[ebp-408],ecx
	mov	eax,[ebp-408]
	and	eax,65280
	sar	eax,8
	mov	[ebp-412],eax
	mov	eax,[ebp-408]
	and	eax,255
	mov	[ebp-416],eax
	mov	eax,[ebp-392]
	and	eax,65280
	sar	eax,8
	mov	[ebp-400],eax
	mov	eax,[ebp-392]
	and	eax,255
	mov	[ebp-404],eax
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-400],eax
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-404],eax
	mov	eax,[ebp-400]
	sal	eax,8
	add	eax,[ebp-404]
	mov	[ebp-396],eax
	mov	eax,[ebp-384]
	mov	ecx,[ebp-396]
	mov	[eax],ecx
label005f:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label005d:
	add	dword ptr [ebp-384],4
	mov	eax,[ebp-384]
	cmp	eax,[ebp-388]
	jl	label005c
label005e:
label0061:
; end of inline function _rasterize_horiz_line
	jmp	label0047
label0046:
	mov	eax,[ebp-344]
	cmp	eax,[ebp-352]
	jle	label0048
	fld	dword ptr [ebp-320]
	fldz
	fsubrp
	fstp	dword ptr [ebp-356]
	fld	dword ptr [ebp-324]
	fldz
	fsubrp
	fstp	dword ptr [ebp-360]
	mov	eax,[ebp-332]
	mov	ecx,[eax+4]
	mov	[ebp-364],ecx
	mov	eax,[ebp-332]
	mov	ecx,[eax]
	mov	[ebp-368],ecx
	mov	eax,[ebp-340]
	mov	[ebp-372],eax
	mov	eax,[ebp-344]
	mov	[ebp-376],eax
	mov	eax,[ebp-348]
	mov	[ebp-380],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-372]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-380]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-384],eax
	mov	eax,[ebp-376]
	sal	eax,2
	add	eax,[ebp-384]
	mov	ecx,[ebp-380]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-388],eax
label0062:
	mov	eax,[ebp-364]
	mov	[ebp-428],eax
	mov	eax,[ebp-368]
	mov	[ebp-432],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-432]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-436],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-428]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-440],eax
	mov	eax,[ebp-440]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-436]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-444],ecx
label0066:
; end of inline function _tex2d
	mov	eax,[ebp-444]
	mov	[ebp-392],eax
	mov	eax,[ebp-392]
	sar	eax,24
	and	eax,255
	mov	[ebp-420],eax
	cmp	dword ptr [ebp-420],0
	je	label0065
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	eax,[ebp-384]
	mov	ecx,[eax]
	mov	[ebp-408],ecx
	mov	eax,[ebp-408]
	and	eax,65280
	sar	eax,8
	mov	[ebp-412],eax
	mov	eax,[ebp-408]
	and	eax,255
	mov	[ebp-416],eax
	mov	eax,[ebp-392]
	and	eax,65280
	sar	eax,8
	mov	[ebp-400],eax
	mov	eax,[ebp-392]
	and	eax,255
	mov	[ebp-404],eax
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-400],eax
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-404],eax
	mov	eax,[ebp-400]
	sal	eax,8
	add	eax,[ebp-404]
	mov	[ebp-396],eax
	mov	eax,[ebp-384]
	mov	ecx,[ebp-396]
	mov	[eax],ecx
label0065:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0063:
	add	dword ptr [ebp-384],4
	mov	eax,[ebp-384]
	cmp	eax,[ebp-388]
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
	mov	eax,[ebp-332]
	mov	ecx,[eax+4]
	mov	[ebp-364],ecx
	mov	eax,[ebp-332]
	mov	ecx,[eax]
	mov	[ebp-368],ecx
	mov	eax,[ebp-340]
	mov	[ebp-372],eax
	mov	eax,[ebp-352]
	mov	[ebp-376],eax
	mov	eax,[ebp-348]
	mov	[ebp-380],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-372]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-380]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-384],eax
	mov	eax,[ebp-376]
	sal	eax,2
	add	eax,[ebp-384]
	mov	ecx,[ebp-380]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-388],eax
label0068:
	mov	eax,[ebp-364]
	mov	[ebp-428],eax
	mov	eax,[ebp-368]
	mov	[ebp-432],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-432]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-436],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-428]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-440],eax
	mov	eax,[ebp-440]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-436]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-444],ecx
label006c:
; end of inline function _tex2d
	mov	eax,[ebp-444]
	mov	[ebp-392],eax
	mov	eax,[ebp-392]
	sar	eax,24
	and	eax,255
	mov	[ebp-420],eax
	cmp	dword ptr [ebp-420],0
	je	label006b
	fild	dword ptr [ebp-420]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-424]
	mov	eax,[ebp-384]
	mov	ecx,[eax]
	mov	[ebp-408],ecx
	mov	eax,[ebp-408]
	and	eax,65280
	sar	eax,8
	mov	[ebp-412],eax
	mov	eax,[ebp-408]
	and	eax,255
	mov	[ebp-416],eax
	mov	eax,[ebp-392]
	and	eax,65280
	sar	eax,8
	mov	[ebp-400],eax
	mov	eax,[ebp-392]
	and	eax,255
	mov	[ebp-404],eax
	fild	dword ptr [ebp-400]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-412]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-400],eax
	fild	dword ptr [ebp-404]
	fmul	dword ptr [ebp-424]
	fild	dword ptr [ebp-416]
	fld1
	fsub	dword ptr [ebp-424]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-404],eax
	mov	eax,[ebp-400]
	sal	eax,8
	add	eax,[ebp-404]
	mov	[ebp-396],eax
	mov	eax,[ebp-384]
	mov	ecx,[ebp-396]
	mov	[eax],ecx
label006b:
	fld	dword ptr [ebp-368]
	fadd	dword ptr [ebp-360]
	fstp	dword ptr [ebp-368]
	fld	dword ptr [ebp-364]
	fadd	dword ptr [ebp-356]
	fstp	dword ptr [ebp-364]
label0069:
	add	dword ptr [ebp-384],4
	mov	eax,[ebp-384]
	cmp	eax,[ebp-388]
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
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-164],ecx
label000d:
label000e:
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,[ebp-164]
	jle	label000f
	mov	eax,[ebp-148]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-164]
	sub	eax,[edi]
	mov	ecx,[ebp-144]
	mov	edx,[ebp-148]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-144]
	add	ecx,4
	mov	edx,[ebp-148]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-148]
	add	eax,[ecx]
	mov	[ebp-156],eax
	mov	eax,[ebp-148]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-164]
	sub	eax,[edi]
	mov	ecx,[ebp-140]
	mov	edx,[ebp-148]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-140]
	add	ecx,4
	mov	edx,[ebp-148]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-148]
	add	eax,[ecx]
	mov	[ebp-160],eax
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-164]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	mov	eax,[ebp-144]
	mov	ecx,[ebp-148]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,[ebp-148]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-168]
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-164]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	mov	eax,[ebp-140]
	mov	ecx,[ebp-148]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,[ebp-148]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-176]
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-164]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	mov	eax,8
	add	eax,[ebp-144]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-148]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,8
	add	eax,[ebp-148]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-172]
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-164]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	mov	eax,8
	add	eax,[ebp-140]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-148]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,8
	add	eax,[ebp-148]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-180]
	mov	eax,[ebp-160]
	sub	eax,[ebp-156]
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fld	dword ptr [ebp-176]
	fsub	dword ptr [ebp-168]
	fdivrp
	fstp	dword ptr [ebp-184]
	mov	eax,[ebp-160]
	sub	eax,[ebp-156]
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fld	dword ptr [ebp-180]
	fsub	dword ptr [ebp-172]
	fdivrp
	fstp	dword ptr [ebp-188]
	mov	eax,[ebp-188]
	mov	[ebp-192],eax
	mov	eax,[ebp-184]
	mov	[ebp-196],eax
	mov	eax,[ebp-180]
	mov	[ebp-200],eax
	mov	eax,[ebp-176]
	mov	[ebp-204],eax
	mov	eax,[ebp-172]
	mov	[ebp-208],eax
	mov	eax,[ebp-168]
	mov	[ebp-212],eax
	mov	eax,[ebp-164]
	mov	[ebp-216],eax
	mov	eax,[ebp-160]
	mov	[ebp-220],eax
	mov	eax,[ebp-156]
	mov	[ebp-224],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-224]
	cmp	eax,[ebp-220]
	jg	label0013
	mov	eax,[ebp-192]
	mov	[ebp-228],eax
	mov	eax,[ebp-196]
	mov	[ebp-232],eax
	mov	eax,[ebp-208]
	mov	[ebp-236],eax
	mov	eax,[ebp-212]
	mov	[ebp-240],eax
	mov	eax,[ebp-216]
	mov	[ebp-244],eax
	mov	eax,[ebp-220]
	mov	[ebp-248],eax
	mov	eax,[ebp-224]
	mov	[ebp-252],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-244]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-252]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-256],eax
	mov	eax,[ebp-248]
	sal	eax,2
	add	eax,[ebp-256]
	mov	ecx,[ebp-252]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-260],eax
label0015:
	mov	eax,[ebp-236]
	mov	[ebp-300],eax
	mov	eax,[ebp-240]
	mov	[ebp-304],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-304]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-308],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-300]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-312],eax
	mov	eax,[ebp-312]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-308]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-316],ecx
label0019:
; end of inline function _tex2d
	mov	eax,[ebp-316]
	mov	[ebp-264],eax
	mov	eax,[ebp-264]
	sar	eax,24
	and	eax,255
	mov	[ebp-292],eax
	cmp	dword ptr [ebp-292],0
	je	label0018
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	eax,[ebp-256]
	mov	ecx,[eax]
	mov	[ebp-280],ecx
	mov	eax,[ebp-280]
	and	eax,65280
	sar	eax,8
	mov	[ebp-284],eax
	mov	eax,[ebp-280]
	and	eax,255
	mov	[ebp-288],eax
	mov	eax,[ebp-264]
	and	eax,65280
	sar	eax,8
	mov	[ebp-272],eax
	mov	eax,[ebp-264]
	and	eax,255
	mov	[ebp-276],eax
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-272],eax
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-276],eax
	mov	eax,[ebp-272]
	sal	eax,8
	add	eax,[ebp-276]
	mov	[ebp-268],eax
	mov	eax,[ebp-256]
	mov	ecx,[ebp-268]
	mov	[eax],ecx
label0018:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0016:
	add	dword ptr [ebp-256],4
	mov	eax,[ebp-256]
	cmp	eax,[ebp-260]
	jl	label0015
label0017:
label001a:
; end of inline function _rasterize_horiz_line
	jmp	label0014
label0013:
	mov	eax,[ebp-192]
	mov	[ebp-228],eax
	mov	eax,[ebp-196]
	mov	[ebp-232],eax
	mov	eax,[ebp-200]
	mov	[ebp-236],eax
	mov	eax,[ebp-204]
	mov	[ebp-240],eax
	mov	eax,[ebp-216]
	mov	[ebp-244],eax
	mov	eax,[ebp-224]
	mov	[ebp-248],eax
	mov	eax,[ebp-220]
	mov	[ebp-252],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-244]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-252]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-256],eax
	mov	eax,[ebp-248]
	sal	eax,2
	add	eax,[ebp-256]
	mov	ecx,[ebp-252]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-260],eax
label001b:
	mov	eax,[ebp-236]
	mov	[ebp-300],eax
	mov	eax,[ebp-240]
	mov	[ebp-304],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-304]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-308],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-300]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-312],eax
	mov	eax,[ebp-312]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-308]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-316],ecx
label001f:
; end of inline function _tex2d
	mov	eax,[ebp-316]
	mov	[ebp-264],eax
	mov	eax,[ebp-264]
	sar	eax,24
	and	eax,255
	mov	[ebp-292],eax
	cmp	dword ptr [ebp-292],0
	je	label001e
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	eax,[ebp-256]
	mov	ecx,[eax]
	mov	[ebp-280],ecx
	mov	eax,[ebp-280]
	and	eax,65280
	sar	eax,8
	mov	[ebp-284],eax
	mov	eax,[ebp-280]
	and	eax,255
	mov	[ebp-288],eax
	mov	eax,[ebp-264]
	and	eax,65280
	sar	eax,8
	mov	[ebp-272],eax
	mov	eax,[ebp-264]
	and	eax,255
	mov	[ebp-276],eax
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-272],eax
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-276],eax
	mov	eax,[ebp-272]
	sal	eax,8
	add	eax,[ebp-276]
	mov	[ebp-268],eax
	mov	eax,[ebp-256]
	mov	ecx,[ebp-268]
	mov	[eax],ecx
label001e:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label001c:
	add	dword ptr [ebp-256],4
	mov	eax,[ebp-256]
	cmp	eax,[ebp-260]
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
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edi,eax
	mov	eax,[edi]
	sub	eax,[ecx]
	mov	ecx,[ebp-140]
	mov	edx,[ebp-148]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-140]
	add	ecx,4
	mov	edx,[ebp-148]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-148]
	add	eax,[ecx]
	mov	[ebp-160],eax
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	mov	eax,[ebp-140]
	mov	ecx,[ebp-148]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,[ebp-148]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-176]
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	mov	eax,8
	add	eax,[ebp-140]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-148]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,8
	add	eax,[ebp-148]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-180]
	mov	eax,[ebp-144]
	fld	dword ptr [ebp-176]
	fsub	dword ptr [eax+8]
	mov	eax,[ebp-144]
	mov	ecx,[ebp-160]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	fdivp
	fstp	dword ptr [ebp-184]
	mov	eax,8
	add	eax,[ebp-144]
	add	eax,4
	fld	dword ptr [ebp-180]
	fsub	dword ptr [eax]
	mov	eax,[ebp-144]
	mov	ecx,[ebp-160]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	fdivp
	fstp	dword ptr [ebp-188]
	mov	eax,[ebp-188]
	mov	[ebp-192],eax
	mov	eax,[ebp-184]
	mov	[ebp-196],eax
	mov	eax,8
	add	eax,[ebp-144]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-200],ecx
	mov	eax,[ebp-144]
	mov	ecx,[eax+8]
	mov	[ebp-204],ecx
	mov	eax,[ebp-180]
	mov	[ebp-208],eax
	mov	eax,[ebp-176]
	mov	[ebp-212],eax
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-216],ecx
	mov	eax,[ebp-144]
	mov	ecx,[eax]
	mov	[ebp-220],ecx
	mov	eax,[ebp-160]
	mov	[ebp-224],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-224]
	cmp	eax,[ebp-220]
	jg	label0022
	mov	eax,[ebp-192]
	mov	[ebp-228],eax
	mov	eax,[ebp-196]
	mov	[ebp-232],eax
	mov	eax,[ebp-208]
	mov	[ebp-236],eax
	mov	eax,[ebp-212]
	mov	[ebp-240],eax
	mov	eax,[ebp-216]
	mov	[ebp-244],eax
	mov	eax,[ebp-220]
	mov	[ebp-248],eax
	mov	eax,[ebp-224]
	mov	[ebp-252],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-244]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-252]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-256],eax
	mov	eax,[ebp-248]
	sal	eax,2
	add	eax,[ebp-256]
	mov	ecx,[ebp-252]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-260],eax
label0024:
	mov	eax,[ebp-236]
	mov	[ebp-300],eax
	mov	eax,[ebp-240]
	mov	[ebp-304],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-304]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-308],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-300]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-312],eax
	mov	eax,[ebp-312]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-308]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-316],ecx
label0028:
; end of inline function _tex2d
	mov	eax,[ebp-316]
	mov	[ebp-264],eax
	mov	eax,[ebp-264]
	sar	eax,24
	and	eax,255
	mov	[ebp-292],eax
	cmp	dword ptr [ebp-292],0
	je	label0027
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	eax,[ebp-256]
	mov	ecx,[eax]
	mov	[ebp-280],ecx
	mov	eax,[ebp-280]
	and	eax,65280
	sar	eax,8
	mov	[ebp-284],eax
	mov	eax,[ebp-280]
	and	eax,255
	mov	[ebp-288],eax
	mov	eax,[ebp-264]
	and	eax,65280
	sar	eax,8
	mov	[ebp-272],eax
	mov	eax,[ebp-264]
	and	eax,255
	mov	[ebp-276],eax
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-272],eax
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-276],eax
	mov	eax,[ebp-272]
	sal	eax,8
	add	eax,[ebp-276]
	mov	[ebp-268],eax
	mov	eax,[ebp-256]
	mov	ecx,[ebp-268]
	mov	[eax],ecx
label0027:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0025:
	add	dword ptr [ebp-256],4
	mov	eax,[ebp-256]
	cmp	eax,[ebp-260]
	jl	label0024
label0026:
label0029:
; end of inline function _rasterize_horiz_line
	jmp	label0023
label0022:
	mov	eax,[ebp-192]
	mov	[ebp-228],eax
	mov	eax,[ebp-196]
	mov	[ebp-232],eax
	mov	eax,[ebp-200]
	mov	[ebp-236],eax
	mov	eax,[ebp-204]
	mov	[ebp-240],eax
	mov	eax,[ebp-216]
	mov	[ebp-244],eax
	mov	eax,[ebp-224]
	mov	[ebp-248],eax
	mov	eax,[ebp-220]
	mov	[ebp-252],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-244]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-252]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-256],eax
	mov	eax,[ebp-248]
	sal	eax,2
	add	eax,[ebp-256]
	mov	ecx,[ebp-252]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-260],eax
label002a:
	mov	eax,[ebp-236]
	mov	[ebp-300],eax
	mov	eax,[ebp-240]
	mov	[ebp-304],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-304]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-308],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-300]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-312],eax
	mov	eax,[ebp-312]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-308]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-316],ecx
label002e:
; end of inline function _tex2d
	mov	eax,[ebp-316]
	mov	[ebp-264],eax
	mov	eax,[ebp-264]
	sar	eax,24
	and	eax,255
	mov	[ebp-292],eax
	cmp	dword ptr [ebp-292],0
	je	label002d
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	eax,[ebp-256]
	mov	ecx,[eax]
	mov	[ebp-280],ecx
	mov	eax,[ebp-280]
	and	eax,65280
	sar	eax,8
	mov	[ebp-284],eax
	mov	eax,[ebp-280]
	and	eax,255
	mov	[ebp-288],eax
	mov	eax,[ebp-264]
	and	eax,65280
	sar	eax,8
	mov	[ebp-272],eax
	mov	eax,[ebp-264]
	and	eax,255
	mov	[ebp-276],eax
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-272],eax
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-276],eax
	mov	eax,[ebp-272]
	sal	eax,8
	add	eax,[ebp-276]
	mov	[ebp-268],eax
	mov	eax,[ebp-256]
	mov	ecx,[ebp-268]
	mov	[eax],ecx
label002d:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label002b:
	add	dword ptr [ebp-256],4
	mov	eax,[ebp-256]
	cmp	eax,[ebp-260]
	jl	label002a
label002c:
label002f:
; end of inline function _rasterize_horiz_line
label0023:
label0030:
; end of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,1
	add	ecx,[eax]
	mov	[ebp-164],ecx
label0010:
label0011:
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,[ebp-164]
	jle	label0012
	mov	eax,[ebp-144]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-164]
	sub	eax,[edi]
	mov	ecx,[ebp-140]
	mov	edx,[ebp-144]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-140]
	add	ecx,4
	mov	edx,[ebp-144]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-144]
	add	eax,[ecx]
	mov	[ebp-156],eax
	mov	eax,[ebp-148]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-164]
	sub	eax,[edi]
	mov	ecx,[ebp-140]
	mov	edx,[ebp-148]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-140]
	add	ecx,4
	mov	edx,[ebp-148]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-148]
	add	eax,[ecx]
	mov	[ebp-160],eax
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[ebp-164]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	mov	eax,[ebp-140]
	mov	ecx,[ebp-144]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[ebp-144]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,[ebp-144]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-168]
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-164]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	mov	eax,[ebp-140]
	mov	ecx,[ebp-148]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,[ebp-148]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-176]
	mov	eax,[ebp-144]
	add	eax,4
	mov	ecx,[ebp-164]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	mov	eax,8
	add	eax,[ebp-140]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-144]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[ebp-144]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,8
	add	eax,[ebp-144]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-172]
	mov	eax,[ebp-148]
	add	eax,4
	mov	ecx,[ebp-164]
	sub	ecx,[eax]
	mov	[ebp-844],ecx
	fild	dword ptr [ebp-844]
	mov	eax,8
	add	eax,[ebp-140]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-148]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-140]
	add	eax,4
	mov	ecx,[ebp-148]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-844],edx
	fild	dword ptr [ebp-844]
	fdivp
	mov	eax,8
	add	eax,[ebp-148]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-180]
	mov	eax,[ebp-160]
	sub	eax,[ebp-156]
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fld	dword ptr [ebp-176]
	fsub	dword ptr [ebp-168]
	fdivrp
	fstp	dword ptr [ebp-184]
	mov	eax,[ebp-160]
	sub	eax,[ebp-156]
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fld	dword ptr [ebp-180]
	fsub	dword ptr [ebp-172]
	fdivrp
	fstp	dword ptr [ebp-188]
	mov	eax,[ebp-188]
	mov	[ebp-192],eax
	mov	eax,[ebp-184]
	mov	[ebp-196],eax
	mov	eax,[ebp-180]
	mov	[ebp-200],eax
	mov	eax,[ebp-176]
	mov	[ebp-204],eax
	mov	eax,[ebp-172]
	mov	[ebp-208],eax
	mov	eax,[ebp-168]
	mov	[ebp-212],eax
	mov	eax,[ebp-164]
	mov	[ebp-216],eax
	mov	eax,[ebp-160]
	mov	[ebp-220],eax
	mov	eax,[ebp-156]
	mov	[ebp-224],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-224]
	cmp	eax,[ebp-220]
	jg	label0031
	mov	eax,[ebp-192]
	mov	[ebp-228],eax
	mov	eax,[ebp-196]
	mov	[ebp-232],eax
	mov	eax,[ebp-208]
	mov	[ebp-236],eax
	mov	eax,[ebp-212]
	mov	[ebp-240],eax
	mov	eax,[ebp-216]
	mov	[ebp-244],eax
	mov	eax,[ebp-220]
	mov	[ebp-248],eax
	mov	eax,[ebp-224]
	mov	[ebp-252],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-244]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-252]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-256],eax
	mov	eax,[ebp-248]
	sal	eax,2
	add	eax,[ebp-256]
	mov	ecx,[ebp-252]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-260],eax
label0033:
	mov	eax,[ebp-236]
	mov	[ebp-300],eax
	mov	eax,[ebp-240]
	mov	[ebp-304],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-304]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-308],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-300]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-312],eax
	mov	eax,[ebp-312]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-308]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-316],ecx
label0037:
; end of inline function _tex2d
	mov	eax,[ebp-316]
	mov	[ebp-264],eax
	mov	eax,[ebp-264]
	sar	eax,24
	and	eax,255
	mov	[ebp-292],eax
	cmp	dword ptr [ebp-292],0
	je	label0036
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	eax,[ebp-256]
	mov	ecx,[eax]
	mov	[ebp-280],ecx
	mov	eax,[ebp-280]
	and	eax,65280
	sar	eax,8
	mov	[ebp-284],eax
	mov	eax,[ebp-280]
	and	eax,255
	mov	[ebp-288],eax
	mov	eax,[ebp-264]
	and	eax,65280
	sar	eax,8
	mov	[ebp-272],eax
	mov	eax,[ebp-264]
	and	eax,255
	mov	[ebp-276],eax
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-272],eax
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-276],eax
	mov	eax,[ebp-272]
	sal	eax,8
	add	eax,[ebp-276]
	mov	[ebp-268],eax
	mov	eax,[ebp-256]
	mov	ecx,[ebp-268]
	mov	[eax],ecx
label0036:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label0034:
	add	dword ptr [ebp-256],4
	mov	eax,[ebp-256]
	cmp	eax,[ebp-260]
	jl	label0033
label0035:
label0038:
; end of inline function _rasterize_horiz_line
	jmp	label0032
label0031:
	mov	eax,[ebp-192]
	mov	[ebp-228],eax
	mov	eax,[ebp-196]
	mov	[ebp-232],eax
	mov	eax,[ebp-200]
	mov	[ebp-236],eax
	mov	eax,[ebp-204]
	mov	[ebp-240],eax
	mov	eax,[ebp-216]
	mov	[ebp-244],eax
	mov	eax,[ebp-224]
	mov	[ebp-248],eax
	mov	eax,[ebp-220]
	mov	[ebp-252],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-244]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-252]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-256],eax
	mov	eax,[ebp-248]
	sal	eax,2
	add	eax,[ebp-256]
	mov	ecx,[ebp-252]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-260],eax
label0039:
	mov	eax,[ebp-236]
	mov	[ebp-300],eax
	mov	eax,[ebp-240]
	mov	[ebp-304],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-304]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-308],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-844],eax
	fild	dword ptr [ebp-844]
	fmul	dword ptr [ebp-300]
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-312],eax
	mov	eax,[ebp-312]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-308]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-316],ecx
label003d:
; end of inline function _tex2d
	mov	eax,[ebp-316]
	mov	[ebp-264],eax
	mov	eax,[ebp-264]
	sar	eax,24
	and	eax,255
	mov	[ebp-292],eax
	cmp	dword ptr [ebp-292],0
	je	label003c
	fild	dword ptr [ebp-292]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-296]
	mov	eax,[ebp-256]
	mov	ecx,[eax]
	mov	[ebp-280],ecx
	mov	eax,[ebp-280]
	and	eax,65280
	sar	eax,8
	mov	[ebp-284],eax
	mov	eax,[ebp-280]
	and	eax,255
	mov	[ebp-288],eax
	mov	eax,[ebp-264]
	and	eax,65280
	sar	eax,8
	mov	[ebp-272],eax
	mov	eax,[ebp-264]
	and	eax,255
	mov	[ebp-276],eax
	fild	dword ptr [ebp-272]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-284]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-272],eax
	fild	dword ptr [ebp-276]
	fmul	dword ptr [ebp-296]
	fild	dword ptr [ebp-288]
	fld1
	fsub	dword ptr [ebp-296]
	fmulp
	faddp
	fistp	dword ptr [ebp-844]
	mov	eax,[ebp-844]
	mov	[ebp-276],eax
	mov	eax,[ebp-272]
	sal	eax,8
	add	eax,[ebp-276]
	mov	[ebp-268],eax
	mov	eax,[ebp-256]
	mov	ecx,[ebp-268]
	mov	[eax],ecx
label003c:
	fld	dword ptr [ebp-240]
	fadd	dword ptr [ebp-232]
	fstp	dword ptr [ebp-240]
	fld	dword ptr [ebp-236]
	fadd	dword ptr [ebp-228]
	fstp	dword ptr [ebp-236]
label003a:
	add	dword ptr [ebp-256],4
	mov	eax,[ebp-256]
	cmp	eax,[ebp-260]
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
	pop	ebx
	pop	edi
	add	esp,844
	pop	ebp
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	push	ebp
	mov	ebp,esp
	sub	esp,48
	push	edi
	mov	edi,[ebp+12]
	fld1
	fstp	dword ptr [ebp-20]
	mov	eax,[edi+8]
	mov	[ebp-24],eax
	mov	eax,[edi+4]
	mov	[ebp-28],eax
	mov	eax,[edi]
	mov	[ebp-32],eax
	lea	eax,[ebp-16]
	mov	[ebp-36],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-36]
	fld	dword ptr [ebp-32]
	fstp	dword ptr [eax]
	mov	eax,[ebp-36]
	fld	dword ptr [ebp-28]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-36]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-36]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [eax+12]
label0000:
; end of inline function vec4f_assign
	mov	[ebp-40],(offset __mvproj_matrix)
	lea	eax,[ebp-16]
	mov	[ebp-44],eax
	mov	eax,[ebp+8]
	mov	[ebp-48],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-48]
	fstp	dword ptr [eax]
	mov	eax,[ebp-40]
	mov	ecx,[ebp-44]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-48]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-40]
	mov	ecx,[ebp-44]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-48]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-40]
	mov	ecx,[ebp-44]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-48]
	fstp	dword ptr [eax+12]
label0001:
; end of inline function matrix4f_transform
	pop	edi
	add	esp,48
	pop	ebp
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	push	ebp
	mov	ebp,esp
	sub	esp,1100
	push	edi
	push	ebx
	mov	eax,[ebp+8]
	mov	[ebp-1044],eax
	lea	eax,[ebp-196]
	mov	[ebp-1048],eax
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	eax,[ebp-1044]
	mov	ecx,[eax+8]
	mov	[ebp-1072],ecx
	mov	eax,[ebp-1044]
	mov	ecx,[eax+4]
	mov	[ebp-1076],ecx
	mov	eax,[ebp-1044]
	mov	ecx,[eax]
	mov	[ebp-1080],ecx
	lea	eax,[ebp-1064]
	mov	[ebp-1084],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [eax]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [eax+12]
label00f4:
; end of inline function vec4f_assign
	lea	eax,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],eax
	lea	eax,[ebp-1064]
	mov	[ebp-1092],eax
	mov	eax,[ebp-1048]
	mov	[ebp-1096],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+12]
label00f5:
; end of inline function matrix4f_transform
label00f6:
; end of inline function _transform_to_projection_space
	lea	eax,[ebp-196]
	add	eax,16
	mov	ecx,[ebp+20]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	eax,[ebp+12]
	mov	[ebp-1044],eax
	lea	eax,[ebp-196]
	add	eax,24
	mov	[ebp-1048],eax
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	eax,[ebp-1044]
	mov	ecx,[eax+8]
	mov	[ebp-1072],ecx
	mov	eax,[ebp-1044]
	mov	ecx,[eax+4]
	mov	[ebp-1076],ecx
	mov	eax,[ebp-1044]
	mov	ecx,[eax]
	mov	[ebp-1080],ecx
	lea	eax,[ebp-1064]
	mov	[ebp-1084],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [eax]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [eax+12]
label00f7:
; end of inline function vec4f_assign
	lea	eax,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],eax
	lea	eax,[ebp-1064]
	mov	[ebp-1092],eax
	mov	eax,[ebp-1048]
	mov	[ebp-1096],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+12]
label00f8:
; end of inline function matrix4f_transform
label00f9:
; end of inline function _transform_to_projection_space
	lea	eax,[ebp-196]
	add	eax,24
	add	eax,16
	mov	ecx,[ebp+24]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	eax,[ebp+16]
	mov	[ebp-1044],eax
	lea	eax,[ebp-196]
	add	eax,48
	mov	[ebp-1048],eax
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	eax,[ebp-1044]
	mov	ecx,[eax+8]
	mov	[ebp-1072],ecx
	mov	eax,[ebp-1044]
	mov	ecx,[eax+4]
	mov	[ebp-1076],ecx
	mov	eax,[ebp-1044]
	mov	ecx,[eax]
	mov	[ebp-1080],ecx
	lea	eax,[ebp-1064]
	mov	[ebp-1084],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [eax]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [eax+12]
label00fa:
; end of inline function vec4f_assign
	lea	eax,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],eax
	lea	eax,[ebp-1064]
	mov	[ebp-1092],eax
	mov	eax,[ebp-1048]
	mov	[ebp-1096],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-1088]
	mov	ecx,[ebp-1092]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-1092]
	mov	ecx,[ebp-1088]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-1096]
	fstp	dword ptr [eax+12]
label00fb:
; end of inline function matrix4f_transform
label00fc:
; end of inline function _transform_to_projection_space
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
	mov	[ebp-200],eax
; start of inline function _rasterize_polygon_4f
	mov	eax,[ebp-200]
	mov	[ebp-648],eax
; start of inline function _clip_poligon
	lea	eax,dword ptr [__clip_z_far_norm]
	mov	[ebp-848],eax
	lea	eax,dword ptr [__clip_z_far_base]
	mov	[ebp-852],eax
	mov	eax,[ebp-648]
	mov	[ebp-856],eax
	lea	eax,[ebp-844]
	mov	[ebp-860],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-860]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-856]
	mov	[ebp-864],eax
	mov	eax,[ebp-856]
	add	eax,24
	mov	[ebp-868],eax
label0070:
label0071:
	mov	eax,[ebp-856]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-856]
	add	eax,ecx
	cmp	eax,[ebp-868]
	jle	label0072
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-864]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label007b:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label007f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label007c:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-864]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-852]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label007d:
; end of inline function vec4f_subtract
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-900]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label007e:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label0081:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-900]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label0082:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	eax,[ebp-920]
	mov	[ebp-992],eax
	lea	eax,[ebp-900]
	mov	[ebp-996],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-996]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+12]
label0083:
; end of inline function vec4f_mul
	lea	eax,[ebp-900]
	mov	[ebp-956],eax
	mov	eax,[ebp-864]
	mov	[ebp-960],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	[ebp-964],eax
; start of inline function vec4f_add
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+12]
label007a:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-936],eax
	mov	eax,16
	add	eax,[ebp-868]
	mov	[ebp-940],eax
	lea	eax,[ebp-908]
	mov	[ebp-944],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
label0078:
; end of inline function vec2f_subtract
	mov	eax,[ebp-920]
	mov	[ebp-948],eax
	lea	eax,[ebp-908]
	mov	[ebp-952],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-952]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax]
	mov	eax,[ebp-952]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax+4]
label0079:
; end of inline function vec2f_mul
	lea	eax,[ebp-908]
	mov	[ebp-924],eax
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-928],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	add	eax,16
	mov	[ebp-932],eax
; start of inline function vec2f_add
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax]
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax+4]
label0077:
; end of inline function vec2f_add
	mov	eax,[ebp-860]
	inc	dword ptr [eax+192]
label0074:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label0071
label0072:
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-860]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label0084:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_z_near_norm]
	mov	[ebp-848],eax
	lea	eax,dword ptr [__clip_z_near_base]
	mov	[ebp-852],eax
	lea	eax,[ebp-844]
	mov	[ebp-856],eax
	mov	eax,[ebp-648]
	mov	[ebp-860],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-860]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-856]
	mov	[ebp-864],eax
	mov	eax,[ebp-856]
	add	eax,24
	mov	[ebp-868],eax
label0085:
label0086:
	mov	eax,[ebp-856]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-856]
	add	eax,ecx
	cmp	eax,[ebp-868]
	jle	label0087
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-864]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label0090:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label0094:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label0091:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-864]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-852]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label0092:
; end of inline function vec4f_subtract
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-900]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label0093:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label0096:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-900]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label0097:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	eax,[ebp-920]
	mov	[ebp-992],eax
	lea	eax,[ebp-900]
	mov	[ebp-996],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-996]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+12]
label0098:
; end of inline function vec4f_mul
	lea	eax,[ebp-900]
	mov	[ebp-956],eax
	mov	eax,[ebp-864]
	mov	[ebp-960],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	[ebp-964],eax
; start of inline function vec4f_add
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+12]
label008f:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-936],eax
	mov	eax,16
	add	eax,[ebp-868]
	mov	[ebp-940],eax
	lea	eax,[ebp-908]
	mov	[ebp-944],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
label008d:
; end of inline function vec2f_subtract
	mov	eax,[ebp-920]
	mov	[ebp-948],eax
	lea	eax,[ebp-908]
	mov	[ebp-952],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-952]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax]
	mov	eax,[ebp-952]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax+4]
label008e:
; end of inline function vec2f_mul
	lea	eax,[ebp-908]
	mov	[ebp-924],eax
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-928],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	add	eax,16
	mov	[ebp-932],eax
; start of inline function vec2f_add
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax]
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax+4]
label008c:
; end of inline function vec2f_add
	mov	eax,[ebp-860]
	inc	dword ptr [eax+192]
label0089:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label0086
label0087:
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-860]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label0099:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_plane_left_norm]
	mov	[ebp-848],eax
	lea	eax,dword ptr [__clip_plane_left_base]
	mov	[ebp-852],eax
	mov	eax,[ebp-648]
	mov	[ebp-856],eax
	lea	eax,[ebp-844]
	mov	[ebp-860],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-860]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-856]
	mov	[ebp-864],eax
	mov	eax,[ebp-856]
	add	eax,24
	mov	[ebp-868],eax
label009a:
label009b:
	mov	eax,[ebp-856]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-856]
	add	eax,ecx
	cmp	eax,[ebp-868]
	jle	label009c
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-864]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00a5:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00a9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00a6:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-864]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-852]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00a7:
; end of inline function vec4f_subtract
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-900]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00a8:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ab:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-900]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ac:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	eax,[ebp-920]
	mov	[ebp-992],eax
	lea	eax,[ebp-900]
	mov	[ebp-996],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-996]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+12]
label00ad:
; end of inline function vec4f_mul
	lea	eax,[ebp-900]
	mov	[ebp-956],eax
	mov	eax,[ebp-864]
	mov	[ebp-960],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	[ebp-964],eax
; start of inline function vec4f_add
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+12]
label00a4:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-936],eax
	mov	eax,16
	add	eax,[ebp-868]
	mov	[ebp-940],eax
	lea	eax,[ebp-908]
	mov	[ebp-944],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
label00a2:
; end of inline function vec2f_subtract
	mov	eax,[ebp-920]
	mov	[ebp-948],eax
	lea	eax,[ebp-908]
	mov	[ebp-952],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-952]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax]
	mov	eax,[ebp-952]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax+4]
label00a3:
; end of inline function vec2f_mul
	lea	eax,[ebp-908]
	mov	[ebp-924],eax
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-928],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	add	eax,16
	mov	[ebp-932],eax
; start of inline function vec2f_add
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax]
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax+4]
label00a1:
; end of inline function vec2f_add
	mov	eax,[ebp-860]
	inc	dword ptr [eax+192]
label009e:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label009b
label009c:
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-860]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label00ae:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_plane_right_norm]
	mov	[ebp-848],eax
	lea	eax,dword ptr [__clip_plane_right_base]
	mov	[ebp-852],eax
	lea	eax,[ebp-844]
	mov	[ebp-856],eax
	mov	eax,[ebp-648]
	mov	[ebp-860],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-860]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-856]
	mov	[ebp-864],eax
	mov	eax,[ebp-856]
	add	eax,24
	mov	[ebp-868],eax
label00af:
label00b0:
	mov	eax,[ebp-856]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-856]
	add	eax,ecx
	cmp	eax,[ebp-868]
	jle	label00b1
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-864]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00ba:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00be:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00bb:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-864]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-852]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00bc:
; end of inline function vec4f_subtract
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-900]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00bd:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00c0:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-900]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00c1:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	eax,[ebp-920]
	mov	[ebp-992],eax
	lea	eax,[ebp-900]
	mov	[ebp-996],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-996]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+12]
label00c2:
; end of inline function vec4f_mul
	lea	eax,[ebp-900]
	mov	[ebp-956],eax
	mov	eax,[ebp-864]
	mov	[ebp-960],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	[ebp-964],eax
; start of inline function vec4f_add
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+12]
label00b9:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-936],eax
	mov	eax,16
	add	eax,[ebp-868]
	mov	[ebp-940],eax
	lea	eax,[ebp-908]
	mov	[ebp-944],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
label00b7:
; end of inline function vec2f_subtract
	mov	eax,[ebp-920]
	mov	[ebp-948],eax
	lea	eax,[ebp-908]
	mov	[ebp-952],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-952]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax]
	mov	eax,[ebp-952]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax+4]
label00b8:
; end of inline function vec2f_mul
	lea	eax,[ebp-908]
	mov	[ebp-924],eax
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-928],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	add	eax,16
	mov	[ebp-932],eax
; start of inline function vec2f_add
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax]
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax+4]
label00b6:
; end of inline function vec2f_add
	mov	eax,[ebp-860]
	inc	dword ptr [eax+192]
label00b3:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00b0
label00b1:
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-860]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label00c3:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_plane_top_norm]
	mov	[ebp-848],eax
	lea	eax,dword ptr [__clip_plane_top_base]
	mov	[ebp-852],eax
	mov	eax,[ebp-648]
	mov	[ebp-856],eax
	lea	eax,[ebp-844]
	mov	[ebp-860],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-860]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-856]
	mov	[ebp-864],eax
	mov	eax,[ebp-856]
	add	eax,24
	mov	[ebp-868],eax
label00c4:
label00c5:
	mov	eax,[ebp-856]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-856]
	add	eax,ecx
	cmp	eax,[ebp-868]
	jle	label00c6
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-864]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00cf:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d3:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00d0:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-864]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-852]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00d1:
; end of inline function vec4f_subtract
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-900]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00d2:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d5:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-900]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d6:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	eax,[ebp-920]
	mov	[ebp-992],eax
	lea	eax,[ebp-900]
	mov	[ebp-996],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-996]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+12]
label00d7:
; end of inline function vec4f_mul
	lea	eax,[ebp-900]
	mov	[ebp-956],eax
	mov	eax,[ebp-864]
	mov	[ebp-960],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	[ebp-964],eax
; start of inline function vec4f_add
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+12]
label00ce:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-936],eax
	mov	eax,16
	add	eax,[ebp-868]
	mov	[ebp-940],eax
	lea	eax,[ebp-908]
	mov	[ebp-944],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
label00cc:
; end of inline function vec2f_subtract
	mov	eax,[ebp-920]
	mov	[ebp-948],eax
	lea	eax,[ebp-908]
	mov	[ebp-952],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-952]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax]
	mov	eax,[ebp-952]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax+4]
label00cd:
; end of inline function vec2f_mul
	lea	eax,[ebp-908]
	mov	[ebp-924],eax
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-928],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	add	eax,16
	mov	[ebp-932],eax
; start of inline function vec2f_add
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax]
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax+4]
label00cb:
; end of inline function vec2f_add
	mov	eax,[ebp-860]
	inc	dword ptr [eax+192]
label00c8:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00c5
label00c6:
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-860]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label00d8:
; end of inline function _clip_on_plain
	lea	eax,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-848],eax
	lea	eax,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-852],eax
	lea	eax,[ebp-844]
	mov	[ebp-856],eax
	mov	eax,[ebp-648]
	mov	[ebp-860],eax
; start of inline function _clip_on_plain
	mov	eax,[ebp-860]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp-856]
	mov	[ebp-864],eax
	mov	eax,[ebp-856]
	add	eax,24
	mov	[ebp-868],eax
label00d9:
label00da:
	mov	eax,[ebp-856]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-856]
	add	eax,ecx
	cmp	eax,[ebp-868]
	jle	label00db
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-864]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00e4:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00e8:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	eax,[ebp-852]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00e5:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
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
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-864]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
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
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-852]
	mov	[ebp-972],eax
	lea	eax,[ebp-884]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00e6:
; end of inline function vec4f_subtract
	mov	eax,[ebp-864]
	mov	[ebp-968],eax
	mov	eax,[ebp-868]
	mov	[ebp-972],eax
	lea	eax,[ebp-900]
	mov	[ebp-976],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-972]
	mov	ecx,[ebp-968]
	fld	dword ptr [eax+12]
	fsub	dword ptr [ecx+12]
	mov	eax,[ebp-976]
	fstp	dword ptr [eax+12]
label00e7:
; end of inline function vec4f_subtract
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-884]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ea:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	eax,[ebp-848]
	mov	[ebp-980],eax
	lea	eax,[ebp-900]
	mov	[ebp-984],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+4]
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+8]
	faddp
	mov	eax,[ebp-984]
	mov	ecx,[ebp-980]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+12]
	faddp
	fstp	dword ptr [ebp-988]
label00eb:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	eax,[ebp-920]
	mov	[ebp-992],eax
	lea	eax,[ebp-900]
	mov	[ebp-996],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-996]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-996]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [eax+12]
label00ec:
; end of inline function vec4f_mul
	lea	eax,[ebp-900]
	mov	[ebp-956],eax
	mov	eax,[ebp-864]
	mov	[ebp-960],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	[ebp-964],eax
; start of inline function vec4f_add
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+8]
	fadd	dword ptr [ecx+8]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-960]
	mov	ecx,[ebp-956]
	fld	dword ptr [eax+12]
	fadd	dword ptr [ecx+12]
	mov	eax,[ebp-964]
	fstp	dword ptr [eax+12]
label00e3:
; end of inline function vec4f_add
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-936],eax
	mov	eax,16
	add	eax,[ebp-868]
	mov	[ebp-940],eax
	lea	eax,[ebp-908]
	mov	[ebp-944],eax
; start of inline function vec2f_subtract
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fsub	dword ptr [ecx+4]
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
label00e1:
; end of inline function vec2f_subtract
	mov	eax,[ebp-920]
	mov	[ebp-948],eax
	lea	eax,[ebp-908]
	mov	[ebp-952],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-952]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax]
	mov	eax,[ebp-952]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [eax+4]
label00e2:
; end of inline function vec2f_mul
	lea	eax,[ebp-908]
	mov	[ebp-924],eax
	mov	eax,16
	add	eax,[ebp-864]
	mov	[ebp-928],eax
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	add	eax,16
	mov	[ebp-932],eax
; start of inline function vec2f_add
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax]
	fadd	dword ptr [ecx]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax]
	mov	eax,[ebp-928]
	mov	ecx,[ebp-924]
	fld	dword ptr [eax+4]
	fadd	dword ptr [ecx+4]
	mov	eax,[ebp-932]
	fstp	dword ptr [eax+4]
label00e0:
; end of inline function vec2f_add
	mov	eax,[ebp-860]
	inc	dword ptr [eax+192]
label00dd:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00da
label00db:
	mov	eax,[ebp-860]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp-860]
	add	eax,ecx
	mov	ecx,[ebp-860]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	edx,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[eax+8],edx
	mov	[eax+12],ebx
	mov	edx,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[eax+16],edx
	mov	[eax+20],ebx
label00ed:
; end of inline function _clip_on_plain
	mov	eax,[ebp-648]
	cmp	dword ptr [eax+192],1
	setg	al
	movzx	eax,al
	mov	[ebp-1000],eax
label00ee:
; end of inline function _clip_poligon
	mov	eax,[ebp-1000]
	cmp	eax,0
	jne	label0000
	jmp	label00f3
label0000:
	mov	eax,[ebp-200]
	cmp	dword ptr [eax+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword ptr [ebp-336],0
label0002:
label0003:
	mov	eax,[ebp-200]
	mov	ecx,[eax+192]
	cmp	ecx,[ebp-336]
	jle	label0004
	mov	eax,[ebp-200]
	mov	ecx,[ebp-336]
	imul	ecx,24
	add	eax,ecx
	mov	[ebp-1004],eax
	lea	eax,[ebp-332]
	mov	ecx,[ebp-336]
	sal	ecx,4
	add	eax,ecx
	mov	[ebp-1008],eax
; start of inline function _transform_to_screen_space
	lea	eax,dword ptr [__viewport_matrix]
	mov	[ebp-1032],eax
	mov	eax,[ebp-1004]
	mov	[ebp-1036],eax
	lea	eax,[ebp-1024]
	mov	[ebp-1040],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-1040]
	fstp	dword ptr [eax]
	mov	eax,[ebp-1032]
	mov	ecx,[ebp-1036]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-1040]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-1032]
	mov	ecx,[ebp-1036]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-1040]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-1032]
	mov	ecx,[ebp-1036]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-1036]
	mov	ecx,[ebp-1032]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-1040]
	fstp	dword ptr [eax+12]
label00f1:
; end of inline function matrix4f_transform
	lea	eax,[ebp-1024]
	add	eax,12
	fld1
	fdiv	dword ptr [eax]
	fstp	dword ptr [ebp-1028]
	fld	dword ptr [ebp-1024]
	fmul	dword ptr [ebp-1028]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	ecx,[ebp-1008]
	mov	[ecx],eax
	lea	eax,[ebp-1024]
	add	eax,4
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-1028]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	ecx,[ebp-1008]
	mov	[ecx+4],eax
	mov	eax,[ebp-1008]
	cmp	dword ptr [eax],0
	jl	label00f0
	mov	eax,[ebp-1008]
	mov	ecx,[eax]
	cmp	ecx,dword ptr [__width]
	jge	label00f0
	mov	eax,[ebp-1008]
	cmp	dword ptr [eax+4],0
	jl	label00f0
	mov	eax,[ebp-1008]
	mov	ecx,[eax+4]
	cmp	ecx,dword ptr [__height]
	jl	label00ef
label00f0:
	mov	dword ptr ds:[0],0
label00ef:
label00f2:
; end of inline function _transform_to_screen_space
	lea	eax,[ebp-332]
	mov	ecx,[ebp-336]
	sal	ecx,4
	add	eax,ecx
	add	eax,8
	mov	ecx,[ebp-200]
	mov	edx,[ebp-336]
	imul	edx,24
	add	ecx,edx
	add	ecx,16
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	inc	dword ptr [ebp-336]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-336],2
label0005:
label0006:
	mov	eax,[ebp-200]
	mov	ecx,[eax+192]
	dec	ecx
	cmp	ecx,[ebp-336]
	jle	label0007
	lea	eax,[ebp-332]
	mov	ecx,[ebp-336]
	sal	ecx,4
	add	eax,ecx
	mov	[ebp-340],eax
	mov	eax,[ebp-336]
	dec	eax
	sal	eax,4
	lea	ecx,[ebp-332]
	add	ecx,eax
	mov	[ebp-344],ecx
	lea	eax,[ebp-332]
	mov	[ebp-348],eax
; start of inline function _rasterize_triangle_2i
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-344]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label0008
	mov	eax,[ebp-348]
	mov	[ebp-352],eax
	mov	eax,[ebp-344]
	mov	[ebp-348],eax
	mov	eax,[ebp-352]
	mov	[ebp-344],eax
label0008:
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-340]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label0009
	mov	eax,[ebp-348]
	mov	[ebp-352],eax
	mov	eax,[ebp-340]
	mov	[ebp-348],eax
	mov	eax,[ebp-352]
	mov	[ebp-340],eax
label0009:
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-340]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jle	label000a
	mov	eax,[ebp-344]
	mov	[ebp-352],eax
	mov	eax,[ebp-340]
	mov	[ebp-344],eax
	mov	eax,[ebp-352]
	mov	[ebp-340],eax
label000a:
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-340]
	add	ecx,4
	mov	edx,[eax]
	cmp	edx,[ecx]
	jne	label000b
	mov	eax,[ebp-348]
	add	eax,4
	cmp	dword ptr [eax],0
	jl	label000c
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,dword ptr [__height]
	jge	label000c
	fldz
	fstp	dword ptr [ebp-520]
	fldz
	fstp	dword ptr [ebp-524]
	mov	eax,8
	add	eax,[ebp-340]
	mov	[ebp-528],eax
	mov	eax,8
	add	eax,[ebp-344]
	mov	[ebp-532],eax
	mov	eax,8
	add	eax,[ebp-348]
	mov	[ebp-536],eax
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-540],ecx
	mov	eax,[ebp-340]
	mov	ecx,[eax]
	mov	[ebp-544],ecx
	mov	eax,[ebp-344]
	mov	ecx,[eax]
	mov	[ebp-548],ecx
	mov	eax,[ebp-348]
	mov	ecx,[eax]
	mov	[ebp-552],ecx
; start of inline function _rasterize_triangle_1i
	mov	eax,[ebp-552]
	cmp	eax,[ebp-548]
	jge	label0040
	mov	eax,[ebp-544]
	cmp	eax,[ebp-548]
	jle	label0041
	mov	eax,[ebp-520]
	mov	[ebp-556],eax
	mov	eax,[ebp-524]
	mov	[ebp-560],eax
	mov	eax,[ebp-536]
	mov	ecx,[eax+4]
	mov	[ebp-564],ecx
	mov	eax,[ebp-536]
	mov	ecx,[eax]
	mov	[ebp-568],ecx
	mov	eax,[ebp-540]
	mov	[ebp-572],eax
	mov	eax,[ebp-544]
	mov	[ebp-576],eax
	mov	eax,[ebp-552]
	mov	[ebp-580],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-572]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-580]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-584],eax
	mov	eax,[ebp-576]
	sal	eax,2
	add	eax,[ebp-584]
	mov	ecx,[ebp-580]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-588],eax
label004a:
	mov	eax,[ebp-564]
	mov	[ebp-628],eax
	mov	eax,[ebp-568]
	mov	[ebp-632],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-640],eax
	mov	eax,[ebp-640]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-636]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-644],ecx
label004e:
; end of inline function _tex2d
	mov	eax,[ebp-644]
	mov	[ebp-592],eax
	mov	eax,[ebp-592]
	sar	eax,24
	and	eax,255
	mov	[ebp-620],eax
	cmp	dword ptr [ebp-620],0
	je	label004d
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	eax,[ebp-584]
	mov	ecx,[eax]
	mov	[ebp-608],ecx
	mov	eax,[ebp-608]
	and	eax,65280
	sar	eax,8
	mov	[ebp-612],eax
	mov	eax,[ebp-608]
	and	eax,255
	mov	[ebp-616],eax
	mov	eax,[ebp-592]
	and	eax,65280
	sar	eax,8
	mov	[ebp-600],eax
	mov	eax,[ebp-592]
	and	eax,255
	mov	[ebp-604],eax
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-604],eax
	mov	eax,[ebp-600]
	sal	eax,8
	add	eax,[ebp-604]
	mov	[ebp-596],eax
	mov	eax,[ebp-584]
	mov	ecx,[ebp-596]
	mov	[eax],ecx
label004d:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label004b:
	add	dword ptr [ebp-584],4
	mov	eax,[ebp-584]
	cmp	eax,[ebp-588]
	jl	label004a
label004c:
label004f:
; end of inline function _rasterize_horiz_line
	jmp	label0042
label0041:
	mov	eax,[ebp-544]
	cmp	eax,[ebp-552]
	jge	label0043
	mov	eax,[ebp-520]
	mov	[ebp-556],eax
	mov	eax,[ebp-524]
	mov	[ebp-560],eax
	mov	eax,[ebp-528]
	mov	ecx,[eax+4]
	mov	[ebp-564],ecx
	mov	eax,[ebp-528]
	mov	ecx,[eax]
	mov	[ebp-568],ecx
	mov	eax,[ebp-540]
	mov	[ebp-572],eax
	mov	eax,[ebp-548]
	mov	[ebp-576],eax
	mov	eax,[ebp-544]
	mov	[ebp-580],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-572]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-580]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-584],eax
	mov	eax,[ebp-576]
	sal	eax,2
	add	eax,[ebp-584]
	mov	ecx,[ebp-580]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-588],eax
label0050:
	mov	eax,[ebp-564]
	mov	[ebp-628],eax
	mov	eax,[ebp-568]
	mov	[ebp-632],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-640],eax
	mov	eax,[ebp-640]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-636]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-644],ecx
label0054:
; end of inline function _tex2d
	mov	eax,[ebp-644]
	mov	[ebp-592],eax
	mov	eax,[ebp-592]
	sar	eax,24
	and	eax,255
	mov	[ebp-620],eax
	cmp	dword ptr [ebp-620],0
	je	label0053
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	eax,[ebp-584]
	mov	ecx,[eax]
	mov	[ebp-608],ecx
	mov	eax,[ebp-608]
	and	eax,65280
	sar	eax,8
	mov	[ebp-612],eax
	mov	eax,[ebp-608]
	and	eax,255
	mov	[ebp-616],eax
	mov	eax,[ebp-592]
	and	eax,65280
	sar	eax,8
	mov	[ebp-600],eax
	mov	eax,[ebp-592]
	and	eax,255
	mov	[ebp-604],eax
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-604],eax
	mov	eax,[ebp-600]
	sal	eax,8
	add	eax,[ebp-604]
	mov	[ebp-596],eax
	mov	eax,[ebp-584]
	mov	ecx,[ebp-596]
	mov	[eax],ecx
label0053:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0051:
	add	dword ptr [ebp-584],4
	mov	eax,[ebp-584]
	cmp	eax,[ebp-588]
	jl	label0050
label0052:
label0055:
; end of inline function _rasterize_horiz_line
	jmp	label0044
label0043:
	mov	eax,[ebp-520]
	mov	[ebp-556],eax
	mov	eax,[ebp-524]
	mov	[ebp-560],eax
	mov	eax,[ebp-536]
	mov	ecx,[eax+4]
	mov	[ebp-564],ecx
	mov	eax,[ebp-536]
	mov	ecx,[eax]
	mov	[ebp-568],ecx
	mov	eax,[ebp-540]
	mov	[ebp-572],eax
	mov	eax,[ebp-548]
	mov	[ebp-576],eax
	mov	eax,[ebp-552]
	mov	[ebp-580],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-572]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-580]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-584],eax
	mov	eax,[ebp-576]
	sal	eax,2
	add	eax,[ebp-584]
	mov	ecx,[ebp-580]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-588],eax
label0056:
	mov	eax,[ebp-564]
	mov	[ebp-628],eax
	mov	eax,[ebp-568]
	mov	[ebp-632],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-640],eax
	mov	eax,[ebp-640]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-636]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-644],ecx
label005a:
; end of inline function _tex2d
	mov	eax,[ebp-644]
	mov	[ebp-592],eax
	mov	eax,[ebp-592]
	sar	eax,24
	and	eax,255
	mov	[ebp-620],eax
	cmp	dword ptr [ebp-620],0
	je	label0059
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	eax,[ebp-584]
	mov	ecx,[eax]
	mov	[ebp-608],ecx
	mov	eax,[ebp-608]
	and	eax,65280
	sar	eax,8
	mov	[ebp-612],eax
	mov	eax,[ebp-608]
	and	eax,255
	mov	[ebp-616],eax
	mov	eax,[ebp-592]
	and	eax,65280
	sar	eax,8
	mov	[ebp-600],eax
	mov	eax,[ebp-592]
	and	eax,255
	mov	[ebp-604],eax
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-604],eax
	mov	eax,[ebp-600]
	sal	eax,8
	add	eax,[ebp-604]
	mov	[ebp-596],eax
	mov	eax,[ebp-584]
	mov	ecx,[ebp-596]
	mov	[eax],ecx
label0059:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0057:
	add	dword ptr [ebp-584],4
	mov	eax,[ebp-584]
	cmp	eax,[ebp-588]
	jl	label0056
label0058:
label005b:
; end of inline function _rasterize_horiz_line
label0044:
label0042:
	jmp	label0045
label0040:
	mov	eax,[ebp-544]
	cmp	eax,[ebp-548]
	jge	label0046
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	eax,[ebp-528]
	mov	ecx,[eax+4]
	mov	[ebp-564],ecx
	mov	eax,[ebp-528]
	mov	ecx,[eax]
	mov	[ebp-568],ecx
	mov	eax,[ebp-540]
	mov	[ebp-572],eax
	mov	eax,[ebp-552]
	mov	[ebp-576],eax
	mov	eax,[ebp-544]
	mov	[ebp-580],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-572]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-580]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-584],eax
	mov	eax,[ebp-576]
	sal	eax,2
	add	eax,[ebp-584]
	mov	ecx,[ebp-580]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-588],eax
label005c:
	mov	eax,[ebp-564]
	mov	[ebp-628],eax
	mov	eax,[ebp-568]
	mov	[ebp-632],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-640],eax
	mov	eax,[ebp-640]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-636]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-644],ecx
label0060:
; end of inline function _tex2d
	mov	eax,[ebp-644]
	mov	[ebp-592],eax
	mov	eax,[ebp-592]
	sar	eax,24
	and	eax,255
	mov	[ebp-620],eax
	cmp	dword ptr [ebp-620],0
	je	label005f
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	eax,[ebp-584]
	mov	ecx,[eax]
	mov	[ebp-608],ecx
	mov	eax,[ebp-608]
	and	eax,65280
	sar	eax,8
	mov	[ebp-612],eax
	mov	eax,[ebp-608]
	and	eax,255
	mov	[ebp-616],eax
	mov	eax,[ebp-592]
	and	eax,65280
	sar	eax,8
	mov	[ebp-600],eax
	mov	eax,[ebp-592]
	and	eax,255
	mov	[ebp-604],eax
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-604],eax
	mov	eax,[ebp-600]
	sal	eax,8
	add	eax,[ebp-604]
	mov	[ebp-596],eax
	mov	eax,[ebp-584]
	mov	ecx,[ebp-596]
	mov	[eax],ecx
label005f:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label005d:
	add	dword ptr [ebp-584],4
	mov	eax,[ebp-584]
	cmp	eax,[ebp-588]
	jl	label005c
label005e:
label0061:
; end of inline function _rasterize_horiz_line
	jmp	label0047
label0046:
	mov	eax,[ebp-544]
	cmp	eax,[ebp-552]
	jle	label0048
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	eax,[ebp-532]
	mov	ecx,[eax+4]
	mov	[ebp-564],ecx
	mov	eax,[ebp-532]
	mov	ecx,[eax]
	mov	[ebp-568],ecx
	mov	eax,[ebp-540]
	mov	[ebp-572],eax
	mov	eax,[ebp-544]
	mov	[ebp-576],eax
	mov	eax,[ebp-548]
	mov	[ebp-580],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-572]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-580]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-584],eax
	mov	eax,[ebp-576]
	sal	eax,2
	add	eax,[ebp-584]
	mov	ecx,[ebp-580]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-588],eax
label0062:
	mov	eax,[ebp-564]
	mov	[ebp-628],eax
	mov	eax,[ebp-568]
	mov	[ebp-632],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-640],eax
	mov	eax,[ebp-640]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-636]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-644],ecx
label0066:
; end of inline function _tex2d
	mov	eax,[ebp-644]
	mov	[ebp-592],eax
	mov	eax,[ebp-592]
	sar	eax,24
	and	eax,255
	mov	[ebp-620],eax
	cmp	dword ptr [ebp-620],0
	je	label0065
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	eax,[ebp-584]
	mov	ecx,[eax]
	mov	[ebp-608],ecx
	mov	eax,[ebp-608]
	and	eax,65280
	sar	eax,8
	mov	[ebp-612],eax
	mov	eax,[ebp-608]
	and	eax,255
	mov	[ebp-616],eax
	mov	eax,[ebp-592]
	and	eax,65280
	sar	eax,8
	mov	[ebp-600],eax
	mov	eax,[ebp-592]
	and	eax,255
	mov	[ebp-604],eax
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-604],eax
	mov	eax,[ebp-600]
	sal	eax,8
	add	eax,[ebp-604]
	mov	[ebp-596],eax
	mov	eax,[ebp-584]
	mov	ecx,[ebp-596]
	mov	[eax],ecx
label0065:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0063:
	add	dword ptr [ebp-584],4
	mov	eax,[ebp-584]
	cmp	eax,[ebp-588]
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
	mov	eax,[ebp-532]
	mov	ecx,[eax+4]
	mov	[ebp-564],ecx
	mov	eax,[ebp-532]
	mov	ecx,[eax]
	mov	[ebp-568],ecx
	mov	eax,[ebp-540]
	mov	[ebp-572],eax
	mov	eax,[ebp-552]
	mov	[ebp-576],eax
	mov	eax,[ebp-548]
	mov	[ebp-580],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-572]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-580]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-584],eax
	mov	eax,[ebp-576]
	sal	eax,2
	add	eax,[ebp-584]
	mov	ecx,[ebp-580]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-588],eax
label0068:
	mov	eax,[ebp-564]
	mov	[ebp-628],eax
	mov	eax,[ebp-568]
	mov	[ebp-632],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-640],eax
	mov	eax,[ebp-640]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-636]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-644],ecx
label006c:
; end of inline function _tex2d
	mov	eax,[ebp-644]
	mov	[ebp-592],eax
	mov	eax,[ebp-592]
	sar	eax,24
	and	eax,255
	mov	[ebp-620],eax
	cmp	dword ptr [ebp-620],0
	je	label006b
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	eax,[ebp-584]
	mov	ecx,[eax]
	mov	[ebp-608],ecx
	mov	eax,[ebp-608]
	and	eax,65280
	sar	eax,8
	mov	[ebp-612],eax
	mov	eax,[ebp-608]
	and	eax,255
	mov	[ebp-616],eax
	mov	eax,[ebp-592]
	and	eax,65280
	sar	eax,8
	mov	[ebp-600],eax
	mov	eax,[ebp-592]
	and	eax,255
	mov	[ebp-604],eax
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-604],eax
	mov	eax,[ebp-600]
	sal	eax,8
	add	eax,[ebp-604]
	mov	[ebp-596],eax
	mov	eax,[ebp-584]
	mov	ecx,[ebp-596]
	mov	[eax],ecx
label006b:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0069:
	add	dword ptr [ebp-584],4
	mov	eax,[ebp-584]
	cmp	eax,[ebp-588]
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
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-364],ecx
label000d:
label000e:
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,[ebp-364]
	jle	label000f
	mov	eax,[ebp-348]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-364]
	sub	eax,[edi]
	mov	ecx,[ebp-344]
	mov	edx,[ebp-348]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-344]
	add	ecx,4
	mov	edx,[ebp-348]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-348]
	add	eax,[ecx]
	mov	[ebp-356],eax
	mov	eax,[ebp-348]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-364]
	sub	eax,[edi]
	mov	ecx,[ebp-340]
	mov	edx,[ebp-348]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-340]
	add	ecx,4
	mov	edx,[ebp-348]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-348]
	add	eax,[ecx]
	mov	[ebp-360],eax
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	mov	eax,[ebp-344]
	mov	ecx,[ebp-348]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-368]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	mov	eax,[ebp-340]
	mov	ecx,[ebp-348]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-376]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-348]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-372]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	mov	eax,8
	add	eax,[ebp-340]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-348]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-380]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	mov	eax,[ebp-388]
	mov	[ebp-392],eax
	mov	eax,[ebp-384]
	mov	[ebp-396],eax
	mov	eax,[ebp-380]
	mov	[ebp-400],eax
	mov	eax,[ebp-376]
	mov	[ebp-404],eax
	mov	eax,[ebp-372]
	mov	[ebp-408],eax
	mov	eax,[ebp-368]
	mov	[ebp-412],eax
	mov	eax,[ebp-364]
	mov	[ebp-416],eax
	mov	eax,[ebp-360]
	mov	[ebp-420],eax
	mov	eax,[ebp-356]
	mov	[ebp-424],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-424]
	cmp	eax,[ebp-420]
	jg	label0013
	mov	eax,[ebp-392]
	mov	[ebp-428],eax
	mov	eax,[ebp-396]
	mov	[ebp-432],eax
	mov	eax,[ebp-408]
	mov	[ebp-436],eax
	mov	eax,[ebp-412]
	mov	[ebp-440],eax
	mov	eax,[ebp-416]
	mov	[ebp-444],eax
	mov	eax,[ebp-420]
	mov	[ebp-448],eax
	mov	eax,[ebp-424]
	mov	[ebp-452],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-444]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-452]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-456],eax
	mov	eax,[ebp-448]
	sal	eax,2
	add	eax,[ebp-456]
	mov	ecx,[ebp-452]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-460],eax
label0015:
	mov	eax,[ebp-436]
	mov	[ebp-500],eax
	mov	eax,[ebp-440]
	mov	[ebp-504],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-512],eax
	mov	eax,[ebp-512]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-508]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-516],ecx
label0019:
; end of inline function _tex2d
	mov	eax,[ebp-516]
	mov	[ebp-464],eax
	mov	eax,[ebp-464]
	sar	eax,24
	and	eax,255
	mov	[ebp-492],eax
	cmp	dword ptr [ebp-492],0
	je	label0018
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	eax,[ebp-456]
	mov	ecx,[eax]
	mov	[ebp-480],ecx
	mov	eax,[ebp-480]
	and	eax,65280
	sar	eax,8
	mov	[ebp-484],eax
	mov	eax,[ebp-480]
	and	eax,255
	mov	[ebp-488],eax
	mov	eax,[ebp-464]
	and	eax,65280
	sar	eax,8
	mov	[ebp-472],eax
	mov	eax,[ebp-464]
	and	eax,255
	mov	[ebp-476],eax
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-476],eax
	mov	eax,[ebp-472]
	sal	eax,8
	add	eax,[ebp-476]
	mov	[ebp-468],eax
	mov	eax,[ebp-456]
	mov	ecx,[ebp-468]
	mov	[eax],ecx
label0018:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0016:
	add	dword ptr [ebp-456],4
	mov	eax,[ebp-456]
	cmp	eax,[ebp-460]
	jl	label0015
label0017:
label001a:
; end of inline function _rasterize_horiz_line
	jmp	label0014
label0013:
	mov	eax,[ebp-392]
	mov	[ebp-428],eax
	mov	eax,[ebp-396]
	mov	[ebp-432],eax
	mov	eax,[ebp-400]
	mov	[ebp-436],eax
	mov	eax,[ebp-404]
	mov	[ebp-440],eax
	mov	eax,[ebp-416]
	mov	[ebp-444],eax
	mov	eax,[ebp-424]
	mov	[ebp-448],eax
	mov	eax,[ebp-420]
	mov	[ebp-452],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-444]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-452]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-456],eax
	mov	eax,[ebp-448]
	sal	eax,2
	add	eax,[ebp-456]
	mov	ecx,[ebp-452]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-460],eax
label001b:
	mov	eax,[ebp-436]
	mov	[ebp-500],eax
	mov	eax,[ebp-440]
	mov	[ebp-504],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-512],eax
	mov	eax,[ebp-512]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-508]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-516],ecx
label001f:
; end of inline function _tex2d
	mov	eax,[ebp-516]
	mov	[ebp-464],eax
	mov	eax,[ebp-464]
	sar	eax,24
	and	eax,255
	mov	[ebp-492],eax
	cmp	dword ptr [ebp-492],0
	je	label001e
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	eax,[ebp-456]
	mov	ecx,[eax]
	mov	[ebp-480],ecx
	mov	eax,[ebp-480]
	and	eax,65280
	sar	eax,8
	mov	[ebp-484],eax
	mov	eax,[ebp-480]
	and	eax,255
	mov	[ebp-488],eax
	mov	eax,[ebp-464]
	and	eax,65280
	sar	eax,8
	mov	[ebp-472],eax
	mov	eax,[ebp-464]
	and	eax,255
	mov	[ebp-476],eax
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-476],eax
	mov	eax,[ebp-472]
	sal	eax,8
	add	eax,[ebp-476]
	mov	[ebp-468],eax
	mov	eax,[ebp-456]
	mov	ecx,[ebp-468]
	mov	[eax],ecx
label001e:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label001c:
	add	dword ptr [ebp-456],4
	mov	eax,[ebp-456]
	cmp	eax,[ebp-460]
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
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edi,eax
	mov	eax,[edi]
	sub	eax,[ecx]
	mov	ecx,[ebp-340]
	mov	edx,[ebp-348]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-340]
	add	ecx,4
	mov	edx,[ebp-348]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-348]
	add	eax,[ecx]
	mov	[ebp-360],eax
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	mov	eax,[ebp-340]
	mov	ecx,[ebp-348]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-376]
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	mov	eax,8
	add	eax,[ebp-340]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-348]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-380]
	mov	eax,[ebp-344]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [eax+8]
	mov	eax,[ebp-344]
	mov	ecx,[ebp-360]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	fdivp
	fstp	dword ptr [ebp-384]
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	fld	dword ptr [ebp-380]
	fsub	dword ptr [eax]
	mov	eax,[ebp-344]
	mov	ecx,[ebp-360]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	fdivp
	fstp	dword ptr [ebp-388]
	mov	eax,[ebp-388]
	mov	[ebp-392],eax
	mov	eax,[ebp-384]
	mov	[ebp-396],eax
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-400],ecx
	mov	eax,[ebp-344]
	mov	ecx,[eax+8]
	mov	[ebp-404],ecx
	mov	eax,[ebp-380]
	mov	[ebp-408],eax
	mov	eax,[ebp-376]
	mov	[ebp-412],eax
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-416],ecx
	mov	eax,[ebp-344]
	mov	ecx,[eax]
	mov	[ebp-420],ecx
	mov	eax,[ebp-360]
	mov	[ebp-424],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-424]
	cmp	eax,[ebp-420]
	jg	label0022
	mov	eax,[ebp-392]
	mov	[ebp-428],eax
	mov	eax,[ebp-396]
	mov	[ebp-432],eax
	mov	eax,[ebp-408]
	mov	[ebp-436],eax
	mov	eax,[ebp-412]
	mov	[ebp-440],eax
	mov	eax,[ebp-416]
	mov	[ebp-444],eax
	mov	eax,[ebp-420]
	mov	[ebp-448],eax
	mov	eax,[ebp-424]
	mov	[ebp-452],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-444]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-452]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-456],eax
	mov	eax,[ebp-448]
	sal	eax,2
	add	eax,[ebp-456]
	mov	ecx,[ebp-452]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-460],eax
label0024:
	mov	eax,[ebp-436]
	mov	[ebp-500],eax
	mov	eax,[ebp-440]
	mov	[ebp-504],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-512],eax
	mov	eax,[ebp-512]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-508]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-516],ecx
label0028:
; end of inline function _tex2d
	mov	eax,[ebp-516]
	mov	[ebp-464],eax
	mov	eax,[ebp-464]
	sar	eax,24
	and	eax,255
	mov	[ebp-492],eax
	cmp	dword ptr [ebp-492],0
	je	label0027
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	eax,[ebp-456]
	mov	ecx,[eax]
	mov	[ebp-480],ecx
	mov	eax,[ebp-480]
	and	eax,65280
	sar	eax,8
	mov	[ebp-484],eax
	mov	eax,[ebp-480]
	and	eax,255
	mov	[ebp-488],eax
	mov	eax,[ebp-464]
	and	eax,65280
	sar	eax,8
	mov	[ebp-472],eax
	mov	eax,[ebp-464]
	and	eax,255
	mov	[ebp-476],eax
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-476],eax
	mov	eax,[ebp-472]
	sal	eax,8
	add	eax,[ebp-476]
	mov	[ebp-468],eax
	mov	eax,[ebp-456]
	mov	ecx,[ebp-468]
	mov	[eax],ecx
label0027:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0025:
	add	dword ptr [ebp-456],4
	mov	eax,[ebp-456]
	cmp	eax,[ebp-460]
	jl	label0024
label0026:
label0029:
; end of inline function _rasterize_horiz_line
	jmp	label0023
label0022:
	mov	eax,[ebp-392]
	mov	[ebp-428],eax
	mov	eax,[ebp-396]
	mov	[ebp-432],eax
	mov	eax,[ebp-400]
	mov	[ebp-436],eax
	mov	eax,[ebp-404]
	mov	[ebp-440],eax
	mov	eax,[ebp-416]
	mov	[ebp-444],eax
	mov	eax,[ebp-424]
	mov	[ebp-448],eax
	mov	eax,[ebp-420]
	mov	[ebp-452],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-444]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-452]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-456],eax
	mov	eax,[ebp-448]
	sal	eax,2
	add	eax,[ebp-456]
	mov	ecx,[ebp-452]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-460],eax
label002a:
	mov	eax,[ebp-436]
	mov	[ebp-500],eax
	mov	eax,[ebp-440]
	mov	[ebp-504],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-512],eax
	mov	eax,[ebp-512]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-508]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-516],ecx
label002e:
; end of inline function _tex2d
	mov	eax,[ebp-516]
	mov	[ebp-464],eax
	mov	eax,[ebp-464]
	sar	eax,24
	and	eax,255
	mov	[ebp-492],eax
	cmp	dword ptr [ebp-492],0
	je	label002d
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	eax,[ebp-456]
	mov	ecx,[eax]
	mov	[ebp-480],ecx
	mov	eax,[ebp-480]
	and	eax,65280
	sar	eax,8
	mov	[ebp-484],eax
	mov	eax,[ebp-480]
	and	eax,255
	mov	[ebp-488],eax
	mov	eax,[ebp-464]
	and	eax,65280
	sar	eax,8
	mov	[ebp-472],eax
	mov	eax,[ebp-464]
	and	eax,255
	mov	[ebp-476],eax
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-476],eax
	mov	eax,[ebp-472]
	sal	eax,8
	add	eax,[ebp-476]
	mov	[ebp-468],eax
	mov	eax,[ebp-456]
	mov	ecx,[ebp-468]
	mov	[eax],ecx
label002d:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label002b:
	add	dword ptr [ebp-456],4
	mov	eax,[ebp-456]
	cmp	eax,[ebp-460]
	jl	label002a
label002c:
label002f:
; end of inline function _rasterize_horiz_line
label0023:
label0030:
; end of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,1
	add	ecx,[eax]
	mov	[ebp-364],ecx
label0010:
label0011:
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[eax]
	cmp	ecx,[ebp-364]
	jle	label0012
	mov	eax,[ebp-344]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-364]
	sub	eax,[edi]
	mov	ecx,[ebp-340]
	mov	edx,[ebp-344]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-340]
	add	ecx,4
	mov	edx,[ebp-344]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-344]
	add	eax,[ecx]
	mov	[ebp-356],eax
	mov	eax,[ebp-348]
	add	eax,4
	mov	edi,eax
	mov	eax,[ebp-364]
	sub	eax,[edi]
	mov	ecx,[ebp-340]
	mov	edx,[ebp-348]
	mov	ebx,[ecx]
	sub	ebx,[edx]
	imul	eax,ebx
	mov	ecx,[ebp-340]
	add	ecx,4
	mov	edx,[ebp-348]
	add	edx,4
	mov	ebx,[ecx]
	sub	ebx,[edx]
	cdq
	idiv	ebx
	mov	ecx,[ebp-348]
	add	eax,[ecx]
	mov	[ebp-360],eax
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	mov	eax,[ebp-340]
	mov	ecx,[ebp-344]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-344]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,[ebp-344]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-368]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	mov	eax,[ebp-340]
	mov	ecx,[ebp-348]
	fld	dword ptr [eax+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-376]
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	mov	eax,8
	add	eax,[ebp-340]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-344]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-344]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-372]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-1100],ecx
	fild	dword ptr [ebp-1100]
	mov	eax,8
	add	eax,[ebp-340]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-348]
	add	ecx,4
	fld	dword ptr [eax]
	fsub	dword ptr [ecx]
	fmulp
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	mov	[ebp-1100],edx
	fild	dword ptr [ebp-1100]
	fdivp
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-380]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	mov	eax,[ebp-388]
	mov	[ebp-392],eax
	mov	eax,[ebp-384]
	mov	[ebp-396],eax
	mov	eax,[ebp-380]
	mov	[ebp-400],eax
	mov	eax,[ebp-376]
	mov	[ebp-404],eax
	mov	eax,[ebp-372]
	mov	[ebp-408],eax
	mov	eax,[ebp-368]
	mov	[ebp-412],eax
	mov	eax,[ebp-364]
	mov	[ebp-416],eax
	mov	eax,[ebp-360]
	mov	[ebp-420],eax
	mov	eax,[ebp-356]
	mov	[ebp-424],eax
; start of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-424]
	cmp	eax,[ebp-420]
	jg	label0031
	mov	eax,[ebp-392]
	mov	[ebp-428],eax
	mov	eax,[ebp-396]
	mov	[ebp-432],eax
	mov	eax,[ebp-408]
	mov	[ebp-436],eax
	mov	eax,[ebp-412]
	mov	[ebp-440],eax
	mov	eax,[ebp-416]
	mov	[ebp-444],eax
	mov	eax,[ebp-420]
	mov	[ebp-448],eax
	mov	eax,[ebp-424]
	mov	[ebp-452],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-444]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-452]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-456],eax
	mov	eax,[ebp-448]
	sal	eax,2
	add	eax,[ebp-456]
	mov	ecx,[ebp-452]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-460],eax
label0033:
	mov	eax,[ebp-436]
	mov	[ebp-500],eax
	mov	eax,[ebp-440]
	mov	[ebp-504],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-512],eax
	mov	eax,[ebp-512]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-508]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-516],ecx
label0037:
; end of inline function _tex2d
	mov	eax,[ebp-516]
	mov	[ebp-464],eax
	mov	eax,[ebp-464]
	sar	eax,24
	and	eax,255
	mov	[ebp-492],eax
	cmp	dword ptr [ebp-492],0
	je	label0036
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	eax,[ebp-456]
	mov	ecx,[eax]
	mov	[ebp-480],ecx
	mov	eax,[ebp-480]
	and	eax,65280
	sar	eax,8
	mov	[ebp-484],eax
	mov	eax,[ebp-480]
	and	eax,255
	mov	[ebp-488],eax
	mov	eax,[ebp-464]
	and	eax,65280
	sar	eax,8
	mov	[ebp-472],eax
	mov	eax,[ebp-464]
	and	eax,255
	mov	[ebp-476],eax
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-476],eax
	mov	eax,[ebp-472]
	sal	eax,8
	add	eax,[ebp-476]
	mov	[ebp-468],eax
	mov	eax,[ebp-456]
	mov	ecx,[ebp-468]
	mov	[eax],ecx
label0036:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0034:
	add	dword ptr [ebp-456],4
	mov	eax,[ebp-456]
	cmp	eax,[ebp-460]
	jl	label0033
label0035:
label0038:
; end of inline function _rasterize_horiz_line
	jmp	label0032
label0031:
	mov	eax,[ebp-392]
	mov	[ebp-428],eax
	mov	eax,[ebp-396]
	mov	[ebp-432],eax
	mov	eax,[ebp-400]
	mov	[ebp-436],eax
	mov	eax,[ebp-404]
	mov	[ebp-440],eax
	mov	eax,[ebp-416]
	mov	[ebp-444],eax
	mov	eax,[ebp-424]
	mov	[ebp-448],eax
	mov	eax,[ebp-420]
	mov	[ebp-452],eax
; start of inline function _rasterize_horiz_line
	mov	eax,dword ptr [__pitch]
	imul	eax,[ebp-444]
	add	eax,dword ptr [__videomem]
	mov	ecx,[ebp-452]
	sal	ecx,2
	add	eax,ecx
	mov	[ebp-456],eax
	mov	eax,[ebp-448]
	sal	eax,2
	add	eax,[ebp-456]
	mov	ecx,[ebp-452]
	sal	ecx,2
	sub	eax,ecx
	mov	[ebp-460],eax
label0039:
	mov	eax,[ebp-436]
	mov	[ebp-500],eax
	mov	eax,[ebp-440]
	mov	[ebp-504],eax
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-1100],eax
	fild	dword ptr [ebp-1100]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-512],eax
	mov	eax,[ebp-512]
	imul	eax,dword ptr [__texture_width]
	add	eax,[ebp-508]
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-516],ecx
label003d:
; end of inline function _tex2d
	mov	eax,[ebp-516]
	mov	[ebp-464],eax
	mov	eax,[ebp-464]
	sar	eax,24
	and	eax,255
	mov	[ebp-492],eax
	cmp	dword ptr [ebp-492],0
	je	label003c
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	eax,[ebp-456]
	mov	ecx,[eax]
	mov	[ebp-480],ecx
	mov	eax,[ebp-480]
	and	eax,65280
	sar	eax,8
	mov	[ebp-484],eax
	mov	eax,[ebp-480]
	and	eax,255
	mov	[ebp-488],eax
	mov	eax,[ebp-464]
	and	eax,65280
	sar	eax,8
	mov	[ebp-472],eax
	mov	eax,[ebp-464]
	and	eax,255
	mov	[ebp-476],eax
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-1100]
	mov	eax,[ebp-1100]
	mov	[ebp-476],eax
	mov	eax,[ebp-472]
	sal	eax,8
	add	eax,[ebp-476]
	mov	[ebp-468],eax
	mov	eax,[ebp-456]
	mov	ecx,[ebp-468]
	mov	[eax],ecx
label003c:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label003a:
	add	dword ptr [ebp-456],4
	mov	eax,[ebp-456]
	cmp	eax,[ebp-460]
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
	pop	ebx
	pop	edi
	add	esp,1100
	pop	ebp
	ret
_rasterizer_triangle3f endp	

end
