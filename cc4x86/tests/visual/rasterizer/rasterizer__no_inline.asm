
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

_rasterizer_init proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
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
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp+32]
	push	dword ptr [ebp+28]
	push	dword ptr [ebp+24]
	lea	eax,dword ptr [__mvproj_matrix]
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
	lea	eax,dword ptr [__viewport_matrix]
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
	lea	eax,dword ptr [__clip_z_near_base]
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
	fld	dword ptr [___unnamed_float_2]
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
	lea	eax,dword ptr [__clip_z_near_norm]
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
	lea	eax,dword ptr [__clip_z_far_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
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
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp-8]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	eax,dword ptr [__clip_z_far_norm]
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
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_left_base]
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
	lea	eax,dword ptr [__clip_plane_left_norm]
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
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld1
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_right_base]
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
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_right_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fild	dword ptr [ebp+16]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_top_base]
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
	lea	eax,dword ptr [__clip_plane_top_norm]
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
	lea	eax,dword ptr [__clip_plane_bottom_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_bottom_norm]
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
	sub	esp,48
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
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	eax,8
	add	eax,[ebp+16]
	push	eax
	mov	eax,8
	add	eax,[ebp+12]
	push	eax
	mov	eax,8
	add	eax,[ebp+8]
	push	eax
	mov	eax,[ebp+8]
	add	eax,4
	push	dword ptr [eax]
	mov	eax,[ebp+16]
	push	dword ptr [eax]
	mov	eax,[ebp+12]
	push	dword ptr [eax]
	mov	eax,[ebp+8]
	push	dword ptr [eax]
	call	__rasterize_triangle_1i
	add	esp,36
label0004:
	pop	ebx
	pop	edi
	add	esp,44
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
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,[ebp+8]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-20]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,[ebp+8]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-28]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-32]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-40]
	push	dword ptr [ebp-40]
	push	dword ptr [ebp-36]
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	push	dword ptr [eax]
	mov	eax,[ebp+12]
	push	dword ptr [eax+8]
	push	dword ptr [ebp-32]
	push	dword ptr [ebp-28]
	mov	eax,[ebp+12]
	add	eax,4
	push	dword ptr [eax]
	mov	eax,[ebp+12]
	push	dword ptr [eax]
	push	dword ptr [ebp-12]
	call	__rasterize_horiz_line__unordered
	add	esp,36
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
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,[ebp+12]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-20]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,[ebp+8]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-28]
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
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
	mov	[ebp-44],edx
	fild	dword ptr [ebp-44]
	fdivp
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-32]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	mov	[ebp-44],eax
	fild	dword ptr [ebp-44]
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
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
	jmp	label0009
label000a:
	pop	ebx
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
label0001:
	mov	eax,[ebp+12]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp+12]
	add	eax,ecx
	cmp	eax,ebx
	jle	label0002
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
	fstp	qword ptr [esp-8]
	sub	esp,8
	push	dword ptr [ebp+20]
	lea	eax,[ebp-40]
	push	eax
	call	_vec4f_dot
	add	esp,8
	fstp	qword ptr [esp-8]
	fld	qword ptr [esp]
	fld	qword ptr [esp-8]
	add	esp,8
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
	mov	eax,[edi+192]
	imul	eax,24
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
	mov	eax,[edi+192]
	imul	eax,24
	mov	ecx,edi
	add	ecx,eax
	add	ecx,16
	push	ecx
	call	_vec2f_add
	add	esp,12
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
	lea	eax,dword ptr [__clip_z_far_norm]
	push	eax
	lea	eax,dword ptr [__clip_z_far_base]
	push	eax
	push	edi
	lea	eax,[ebp-196]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_z_near_norm]
	push	eax
	lea	eax,dword ptr [__clip_z_near_base]
	push	eax
	lea	eax,[ebp-196]
	push	eax
	push	edi
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_left_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_left_base]
	push	eax
	push	edi
	lea	eax,[ebp-196]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_right_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_right_base]
	push	eax
	lea	eax,[ebp-196]
	push	eax
	push	edi
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_top_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_top_base]
	push	eax
	push	edi
	lea	eax,[ebp-196]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_bottom_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_bottom_base]
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
	lea	eax,dword ptr [__viewport_matrix]
	push	eax
	push	dword ptr [ebp+12]
	lea	eax,[ebp-16]
	push	eax
	call	_matrix4f_transform
	add	esp,12
	lea	eax,[ebp-16]
	add	eax,12
	fld1
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
label0003:
	mov	eax,[edi+192]
	cmp	eax,esi
	jle	label0004
	mov	eax,edi
	mov	ecx,esi
	imul	ecx,24
	add	eax,ecx
	push	eax
	lea	eax,[ebp-132]
	mov	ecx,esi
	sal	ecx,4
	add	eax,ecx
	push	eax
	call	__transform_to_screen_space
	add	esp,8
	lea	eax,[ebp-132]
	mov	ecx,esi
	sal	ecx,4
	add	eax,ecx
	add	eax,8
	mov	ecx,edi
	mov	edx,esi
	imul	edx,24
	add	ecx,edx
	add	ecx,16
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	inc	esi
	jmp	label0003
label0004:
	mov	esi,2
label0005:
label0006:
	mov	eax,[edi+192]
	dec	eax
	cmp	eax,esi
	jle	label0007
	lea	eax,[ebp-132]
	mov	ecx,esi
	sal	ecx,4
	add	eax,ecx
	push	eax
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
	jmp	label0006
label0007:
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
	lea	eax,dword ptr [__mvproj_matrix]
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
