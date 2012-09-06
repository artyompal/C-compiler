
.686
.model flat
.xmm

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
___unnamed_double_0	dq	03f1a36e2eb1c432dh
public	___unnamed_double_0
___unnamed_float_1	dd	040000000h
public	___unnamed_float_1
___unnamed_float_2	dd	0bf800000h
public	___unnamed_float_2
___unnamed_float_3	dd	0437f0000h
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
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	fld	dword ptr [esi+4]
	fmul	dword ptr [edi+16]
	fld	dword ptr [esi]
	fmul	dword ptr [edi]
	faddp
	fld	dword ptr [esi+8]
	fmul	dword ptr [edi+32]
	faddp
	fld	dword ptr [esi+12]
	fmul	dword ptr [edi+48]
	faddp
	fstp	dword ptr [ebx]
	fld	dword ptr [esi]
	fmul	dword ptr [edi+4]
	fld	dword ptr [esi+4]
	fmul	dword ptr [edi+20]
	faddp
	fld	dword ptr [esi+8]
	fmul	dword ptr [edi+36]
	faddp
	fld	dword ptr [esi+12]
	fmul	dword ptr [edi+52]
	faddp
	fstp	dword ptr [ebx+4]
	fld	dword ptr [esi]
	fmul	dword ptr [edi+8]
	fld	dword ptr [esi+4]
	fmul	dword ptr [edi+24]
	faddp
	fld	dword ptr [esi+8]
	fmul	dword ptr [edi+40]
	faddp
	fld	dword ptr [esi+12]
	fmul	dword ptr [edi+56]
	faddp
	fstp	dword ptr [ebx+8]
	fld	dword ptr [esi]
	fmul	dword ptr [edi+12]
	fld	dword ptr [esi+4]
	fmul	dword ptr [edi+28]
	faddp
	fld	dword ptr [esi+8]
	fmul	dword ptr [edi+44]
	faddp
	fld	dword ptr [esi+12]
	fmul	dword ptr [edi+60]
	faddp
	fstp	dword ptr [ebx+12]
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
	push	edi
	push	esi
	mov	edi,[ebp+20]
	mov	esi,[ebp+8]
	mov	dword ptr [__dbgprintf],esi
	mov	esi,[ebp+12]
	mov	dword ptr [__width],esi
	mov	esi,[ebp+16]
	mov	dword ptr [__height],esi
	mov	dword ptr [__pitch],edi
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [ebp+32]
	push	dword ptr [ebp+28]
	push	dword ptr [ebp+24]
	lea	esi,dword ptr [__mvproj_matrix]
	push	esi
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
	lea	esi,dword ptr [__viewport_matrix]
	push	esi
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
	lea	esi,dword ptr [__clip_z_near_base]
	push	esi
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
	lea	esi,dword ptr [__clip_z_near_norm]
	push	esi
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
	lea	esi,dword ptr [__clip_z_far_base]
	push	esi
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
	lea	esi,dword ptr [__clip_z_far_norm]
	push	esi
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
	lea	esi,dword ptr [__clip_plane_left_base]
	push	esi
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
	lea	esi,dword ptr [__clip_plane_left_norm]
	push	esi
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
	lea	esi,dword ptr [__clip_plane_right_base]
	push	esi
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
	lea	esi,dword ptr [__clip_plane_right_norm]
	push	esi
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
	lea	esi,dword ptr [__clip_plane_top_base]
	push	esi
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
	lea	esi,dword ptr [__clip_plane_top_norm]
	push	esi
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
	lea	esi,dword ptr [__clip_plane_bottom_base]
	push	esi
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
	lea	esi,dword ptr [__clip_plane_bottom_norm]
	push	esi
	call	_vec4f_assign
	add	esp,20
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	mov	dword ptr [__videomem],edi
	pop	edi
	pop	ebp
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	mov	eax,[edi]
	mov	ecx,[edi+4]
	mov	dword ptr [__mvproj_matrix],eax
	mov	dword ptr [__mvproj_matrix+4],ecx
	mov	eax,[edi+8]
	mov	ecx,[edi+12]
	mov	dword ptr [__mvproj_matrix+8],eax
	mov	dword ptr [__mvproj_matrix+12],ecx
	mov	eax,[edi+16]
	mov	ecx,[edi+20]
	mov	dword ptr [__mvproj_matrix+16],eax
	mov	dword ptr [__mvproj_matrix+20],ecx
	mov	eax,[edi+24]
	mov	ecx,[edi+28]
	mov	dword ptr [__mvproj_matrix+24],eax
	mov	dword ptr [__mvproj_matrix+28],ecx
	mov	eax,[edi+32]
	mov	ecx,[edi+36]
	mov	dword ptr [__mvproj_matrix+32],eax
	mov	dword ptr [__mvproj_matrix+36],ecx
	mov	eax,[edi+40]
	mov	ecx,[edi+44]
	mov	dword ptr [__mvproj_matrix+40],eax
	mov	dword ptr [__mvproj_matrix+44],ecx
	mov	eax,[edi+48]
	mov	ecx,[edi+52]
	mov	dword ptr [__mvproj_matrix+48],eax
	mov	dword ptr [__mvproj_matrix+52],ecx
	mov	eax,[edi+56]
	mov	ecx,[edi+60]
	mov	dword ptr [__mvproj_matrix+56],eax
	mov	dword ptr [__mvproj_matrix+60],ecx
	pop	edi
	pop	ebp
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	mov	dword ptr [__color],edi
	pop	edi
	pop	ebp
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	mov	dword ptr [__texture_data],ebx
	mov	dword ptr [__texture_width],esi
	mov	dword ptr [__texture_height],edi
	pop	ebx
	pop	esi
	pop	edi
	pop	ebp
	ret
_rasterizer_set_texture endp	

__tex2d proc
	push	ebp
	mov	ebp,esp
	sub	esp,12
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-12],eax
	fild	dword ptr [ebp-12]
	fmul	dword ptr [ebp+8]
	fistp	dword ptr [ebp-12]
	mov	eax,[ebp-12]
	mov	ecx,dword ptr [__texture_height]
	dec	ecx
	mov	[ebp-12],ecx
	fild	dword ptr [ebp-12]
	fmul	dword ptr [ebp+12]
	fistp	dword ptr [ebp-12]
	mov	ecx,[ebp-12]
	imul	ecx,dword ptr [__texture_width]
	add	ecx,eax
	sal	ecx,2
	add	ecx,dword ptr [__texture_data]
	mov	eax,[ecx]
	add	esp,12
	pop	ebp
	ret
__tex2d endp	

__rasterize_horiz_line proc
	push	ebp
	mov	ebp,esp
	sub	esp,52
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	mov	edx,dword ptr [__pitch]
	imul	edx,edi
	add	edx,dword ptr [__videomem]
	mov	edi,ebx
	sal	edi,2
	add	edx,edi
	mov	edi,esi
	sal	edi,2
	add	edi,edx
	sal	ebx,2
	sub	edi,ebx
label0000:
	mov	[ebp-52],edx
	push	dword ptr [ebp+24]
	push	dword ptr [ebp+20]
	call	__tex2d
	add	esp,8
	mov	edx,[ebp-52]
	mov	ebx,eax
	sar	ebx,24
	and	ebx,255
	mov	[ebp-40],ebx
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	esi,[edx]
	mov	ebx,esi
	and	ebx,65280
	sar	ebx,8
	mov	[ebp-32],ebx
	mov	ebx,esi
	and	ebx,255
	mov	[ebp-36],ebx
	mov	ebx,eax
	and	ebx,65280
	sar	ebx,8
	mov	[ebp-20],ebx
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
	mov	esi,[ebp-20]
	sal	esi,8
	add	esi,[ebp-24]
	mov	[edx],esi
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
	add	edx,4
	cmp	edx,edi
	jl	label0000
	pop	ebx
	pop	esi
	pop	edi
	add	esp,52
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
	sub	esp,4
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+32]
	mov	esi,[ebp+28]
	mov	ebx,[ebp+24]
	mov	edx,[ebp+20]
	mov	ecx,[ebp+16]
	mov	eax,[ebp+12]
	mov	[ebp-4],esi
	mov	esi,[ebp+8]
	cmp	esi,eax
	jge	label0000
	cmp	ecx,eax
	jle	label0001
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [ebx+4]
	push	dword ptr [ebx]
	push	edx
	push	ecx
	push	esi
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0004
label0001:
	cmp	ecx,esi
	jge	label0003
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [edi+4]
	push	dword ptr [edi]
	push	edx
	push	eax
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0004
label0003:
	push	dword ptr [ebp+40]
	push	dword ptr [ebp+36]
	push	dword ptr [ebx+4]
	push	dword ptr [ebx]
	push	edx
	push	eax
	push	esi
	call	__rasterize_horiz_line
	add	esp,28
label0004:
	jmp	label0009
label0000:
	cmp	ecx,eax
	jge	label0006
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
	push	dword ptr [edi+4]
	push	dword ptr [edi]
	push	edx
	push	esi
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0009
label0006:
	cmp	ecx,esi
	jle	label0008
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
	mov	esi,[ebp-4]
	push	dword ptr [esi+4]
	push	dword ptr [esi]
	push	edx
	push	ecx
	push	eax
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0009
label0008:
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
	push	dword ptr [esi+4]
	push	dword ptr [esi]
	push	edx
	push	esi
	push	eax
	call	__rasterize_horiz_line
	add	esp,28
label0009:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,4
	pop	ebp
	ret
__rasterize_triangle_1i endp	

__rasterize_triangle_2i proc
	push	ebp
	mov	ebp,esp
	sub	esp,64
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	mov	eax,[ebx+4]
	cmp	eax,[esi+4]
	jle	label0000
	mov	ebx,esi
	mov	esi,ebx
label0000:
	mov	eax,[ebx+4]
	cmp	eax,[edi+4]
	jle	label0001
	mov	ebx,edi
	mov	edi,ebx
label0001:
	mov	eax,[esi+4]
	cmp	eax,[edi+4]
	jle	label0002
	mov	ebx,esi
	mov	esi,edi
	mov	edi,ebx
label0002:
	mov	eax,[ebx+4]
	cmp	eax,[edi+4]
	jne	label0003
	cmp	dword ptr [ebx+4],0
	jl	label0004
	mov	eax,[ebx+4]
	cmp	eax,dword ptr [__height]
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
	add	esp,64
	pop	ebp
	ret
label0003:
	mov	ebx,[ebx+4]
label0006:
	mov	eax,[esi+4]
	cmp	eax,ebx
	jle	label0007
	mov	eax,ebx
	sub	eax,[ebx+4]
	mov	ecx,[esi]
	sub	ecx,[ebx]
	imul	eax,ecx
	mov	ecx,[esi+4]
	sub	ecx,[ebx+4]
	cdq
	idiv	ecx
	add	eax,[ebx]
	mov	[ebp-48],eax
	mov	eax,ebx
	sub	eax,[ebx+4]
	mov	ecx,[edi]
	sub	ecx,[ebx]
	imul	eax,ecx
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	cdq
	idiv	ecx
	add	eax,[ebx]
	mov	ecx,ebx
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fld	dword ptr [esi+8]
	fsub	dword ptr [ebx+8]
	fmulp
	mov	ecx,[esi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [ebx+8]
	fstp	dword ptr [ebp-20]
	mov	ecx,ebx
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fld	dword ptr [edi+8]
	fsub	dword ptr [ebx+8]
	fmulp
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [ebx+8]
	fstp	dword ptr [ebp-28]
	mov	ecx,ebx
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	mov	edx,8
	add	edx,ebx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[esi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-24]
	mov	ecx,ebx
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	mov	ecx,8
	add	ecx,edi
	add	ecx,4
	mov	edx,8
	add	edx,ebx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-32]
	mov	ecx,eax
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sub	ecx,eax
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	[ebp-48],eax
	mov	ecx,eax
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sub	ecx,eax
	mov	[ebp-44],ecx
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
	push	ebx
	mov	[ebp-48],eax
	mov	eax,[ebp-52]
	push	eax
	mov	eax,[ebp-48]
	push	eax
	call	__rasterize_horiz_line__unordered
	add	esp,36
	inc	ebx
	jmp	label0006
label0007:
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
	mov	[ebp-56],eax
	mov	ecx,[esi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fld	dword ptr [edi+8]
	fsub	dword ptr [ebx+8]
	fmulp
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [ebx+8]
	fstp	dword ptr [ebp-28]
	mov	ecx,[esi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	mov	ecx,8
	add	ecx,edi
	add	ecx,4
	mov	edx,8
	add	edx,ebx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [esi+8]
	mov	ecx,eax
	sub	ecx,[esi]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-36]
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ecx]
	mov	ecx,eax
	sub	ecx,[esi]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [ebp-40]
	push	dword ptr [ebp-40]
	push	dword ptr [ebp-36]
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	push	dword ptr [ecx]
	push	dword ptr [esi+8]
	push	dword ptr [ebp-32]
	push	dword ptr [ebp-28]
	push	dword ptr [esi+4]
	push	dword ptr [esi]
	push	eax
	call	__rasterize_horiz_line__unordered
	add	esp,36
	mov	eax,1
	add	eax,[esi+4]
	mov	ebx,eax
label0009:
	mov	eax,[edi+4]
	cmp	eax,ebx
	jle	label000a
	mov	eax,ebx
	sub	eax,[esi+4]
	mov	ecx,[edi]
	sub	ecx,[esi]
	imul	eax,ecx
	mov	ecx,[edi+4]
	sub	ecx,[esi+4]
	cdq
	idiv	ecx
	add	eax,[esi]
	mov	[ebp-60],eax
	mov	[ebp-48],eax
	mov	eax,ebx
	sub	eax,[ebx+4]
	mov	ecx,[edi]
	sub	ecx,[ebx]
	imul	eax,ecx
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	cdq
	idiv	ecx
	add	eax,[ebx]
	mov	[ebp-64],eax
	mov	ecx,ebx
	sub	ecx,[esi+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fld	dword ptr [edi+8]
	fsub	dword ptr [esi+8]
	fmulp
	mov	ecx,[edi+4]
	sub	ecx,[esi+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [esi+8]
	fstp	dword ptr [ebp-20]
	mov	ecx,ebx
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fld	dword ptr [edi+8]
	fsub	dword ptr [ebx+8]
	fmulp
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	fadd	dword ptr [ebx+8]
	fstp	dword ptr [ebp-28]
	mov	ecx,ebx
	sub	ecx,[esi+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	mov	ecx,8
	add	ecx,edi
	add	ecx,4
	mov	edx,8
	add	edx,esi
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[edi+4]
	sub	ecx,[esi+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-24]
	mov	ecx,ebx
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	mov	ecx,8
	add	ecx,edi
	add	ecx,4
	mov	edx,8
	add	edx,ebx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[edi+4]
	sub	ecx,[ebx+4]
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fdivp
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-32]
	mov	ecx,eax
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sub	ecx,eax
	mov	[ebp-44],ecx
	fild	dword ptr [ebp-44]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	[ebp-48],eax
	mov	ecx,eax
	mov	[ebp-52],eax
	mov	eax,[ebp-48]
	sub	ecx,eax
	mov	[ebp-44],ecx
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
	push	ebx
	mov	[ebp-48],eax
	mov	eax,[ebp-52]
	push	eax
	mov	eax,[ebp-48]
	push	eax
	call	__rasterize_horiz_line__unordered
	add	esp,36
	inc	ebx
	jmp	label0009
label000a:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
	pop	ebp
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	push	ebp
	mov	ebp,esp
	sub	esp,92
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+20]
	mov	esi,[ebp+16]
	mov	ebx,[ebp+12]
	mov	edx,[ebp+8]
	mov	dword ptr [edx+192],0
	mov	ecx,ebx
	lea	eax,[ebx+24]
label0001:
	mov	[ebp-64],edx
	mov	edx,[ebx+192]
	imul	edx,24
	mov	[ebp-68],edi
	mov	edi,ebx
	add	edi,edx
	cmp	edi,eax
	jle	label0002
	mov	[ebp-72],eax
	mov	[ebp-76],ecx
	push	esi
	push	ecx
	lea	edx,[ebp-24]
	push	edx
	call	_vec4f_subtract
	add	esp,12
	mov	edi,[ebp-68]
	push	edi
	lea	edx,[ebp-24]
	push	edx
	call	_vec4f_dot
	add	esp,8
	mov	ecx,[ebp-76]
	mov	eax,[ebp-72]
	fstp	dword ptr [ebp-52]
	mov	[ebp-72],eax
	mov	[ebp-76],ecx
	push	esi
	push	eax
	lea	edx,[ebp-24]
	push	edx
	call	_vec4f_subtract
	add	esp,12
	push	edi
	lea	edx,[ebp-24]
	push	edx
	call	_vec4f_dot
	add	esp,8
	mov	ecx,[ebp-76]
	mov	eax,[ebp-72]
	fstp	dword ptr [ebp-56]
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	mov	[ebp-80],ebx
	mov	ebx,[ebp-64]
	mov	edx,[ebx+192]
	mov	[ebp-84],edx
	mov	edx,[ebp-64]
	inc	dword ptr [edx+192]
	mov	[ebp-64],edx
	mov	edx,[ebp-84]
	imul	edx,24
	mov	[ebp-84],edx
	mov	ebx,edx
	mov	[ebp-64],edx
	mov	edx,[ebp-84]
	add	ebx,edx
	mov	edx,[ecx]
	mov	[ebp-68],edi
	mov	edi,[ecx+4]
	mov	[ebx],edx
	mov	[ebx+4],edi
	mov	edx,[ecx+8]
	mov	edi,[ecx+12]
	mov	[ebx+8],edx
	mov	[ebx+12],edi
	mov	edx,[ecx+16]
	mov	edi,[ecx+20]
	mov	[ebx+16],edx
	mov	[ebx+20],edi
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
	mov	[ebp-72],eax
	mov	[ebp-76],ecx
	push	ecx
	push	esi
	lea	edx,[ebp-24]
	push	edx
	call	_vec4f_subtract
	add	esp,12
	push	ecx
	push	eax
	lea	edx,[ebp-40]
	push	edx
	call	_vec4f_subtract
	add	esp,12
	mov	edi,[ebp-68]
	push	edi
	lea	edx,[ebp-24]
	push	edx
	call	_vec4f_dot
	add	esp,8
	mov	ecx,[ebp-76]
	mov	eax,[ebp-72]
	fstp	qword ptr [esp-8]
	sub	esp,8
	mov	[ebp-72],eax
	mov	[ebp-76],ecx
	push	edi
	lea	edx,[ebp-40]
	push	edx
	call	_vec4f_dot
	add	esp,8
	mov	ecx,[ebp-76]
	mov	eax,[ebp-72]
	fstp	qword ptr [esp-8]
	fld	qword ptr [esp]
	fld	qword ptr [esp-8]
	add	esp,8
	fdivp
	fstp	dword ptr [ebp-60]
	mov	[ebp-72],eax
	mov	[ebp-76],ecx
	push	dword ptr [ebp-60]
	lea	edx,[ebp-40]
	push	edx
	call	_vec4f_mul
	add	esp,8
	lea	edx,[ebp-40]
	push	edx
	push	ecx
	mov	ebx,[ebp-64]
	mov	edx,[ebx+192]
	imul	edx,24
	mov	[ebp-88],edx
	mov	ebx,edx
	mov	[ebp-64],edx
	mov	edx,[ebp-88]
	add	ebx,edx
	push	ebx
	call	_vec4f_add
	add	esp,12
	mov	edx,16
	add	edx,ecx
	push	edx
	mov	edx,16
	add	edx,eax
	push	edx
	lea	edx,[ebp-48]
	push	edx
	call	_vec2f_subtract
	add	esp,12
	push	dword ptr [ebp-60]
	lea	edx,[ebp-48]
	push	edx
	call	_vec2f_mul
	add	esp,8
	lea	edx,[ebp-48]
	push	edx
	mov	edx,16
	add	edx,ecx
	push	edx
	mov	ebx,[ebp-64]
	mov	edx,[ebx+192]
	imul	edx,24
	mov	[ebp-92],edx
	mov	ebx,edx
	mov	[ebp-64],edx
	mov	edx,[ebp-92]
	add	ebx,edx
	add	ebx,16
	push	ebx
	call	_vec2f_add
	add	esp,12
	mov	ecx,[ebp-76]
	mov	eax,[ebp-72]
	mov	edx,[ebp-64]
	inc	dword ptr [edx+192]
label0004:
	add	ecx,24
	add	eax,24
	jmp	label0001
label0002:
	mov	eax,[edx+192]
	inc	dword ptr [edx+192]
	imul	eax,24
	mov	ecx,edx
	add	ecx,eax
	mov	eax,[edx]
	mov	ebx,[edx+4]
	mov	[ecx],eax
	mov	[ecx+4],ebx
	mov	eax,[edx+8]
	mov	ebx,[edx+12]
	mov	[ecx+8],eax
	mov	[ecx+12],ebx
	mov	eax,[edx+16]
	mov	ebx,[edx+20]
	mov	[ecx+16],eax
	mov	[ecx+20],ebx
	pop	ebx
	pop	esi
	pop	edi
	add	esp,92
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
	push	esi
	mov	edi,[ebp+12]
	mov	esi,[ebp+8]
	lea	eax,dword ptr [__viewport_matrix]
	push	eax
	push	edi
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
	mov	[esi],eax
	lea	eax,[ebp-16]
	add	eax,4
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-20]
	fistp	dword ptr [ebp-24]
	mov	eax,[ebp-24]
	mov	[esi+4],eax
	cmp	dword ptr [esi],0
	jl	label0001
	mov	eax,[esi]
	cmp	eax,dword ptr [__width]
	jge	label0001
	cmp	dword ptr [esi+4],0
	jl	label0001
	mov	eax,[esi+4]
	cmp	eax,dword ptr [__height]
	jl	label0000
label0001:
	mov	dword ptr ds:[0],0
label0000:
	pop	esi
	pop	edi
	add	esp,24
	pop	ebp
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	push	ebp
	mov	ebp,esp
	sub	esp,140
	push	edi
	push	ebx
	mov	edi,[ebp+8]
	push	edi
	call	__clip_poligon
	add	esp,4
	cmp	eax,0
	jne	label0000
	pop	ebx
	pop	edi
	add	esp,140
	pop	ebp
	ret
label0000:
	cmp	dword ptr [edi+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	eax,0
label0003:
	mov	ecx,[edi+192]
	cmp	ecx,eax
	jle	label0004
	mov	[ebp-140],eax
	mov	ecx,edi
	mov	edx,eax
	imul	edx,24
	add	ecx,edx
	push	ecx
	lea	ecx,[ebp-132]
	mov	edx,eax
	sal	edx,4
	add	ecx,edx
	push	ecx
	call	__transform_to_screen_space
	add	esp,8
	mov	eax,[ebp-140]
	lea	ecx,[ebp-132]
	mov	edx,eax
	sal	edx,4
	add	ecx,edx
	add	ecx,8
	mov	edx,edi
	mov	ebx,eax
	imul	ebx,24
	add	edx,ebx
	add	edx,16
	mov	ebx,[edx]
	mov	edx,[edx+4]
	mov	[ecx],ebx
	mov	[ecx+4],edx
	inc	eax
	jmp	label0003
label0004:
	mov	eax,2
label0006:
	mov	ecx,[edi+192]
	dec	ecx
	cmp	ecx,eax
	jle	label0007
	mov	[ebp-140],eax
	lea	ecx,[ebp-132]
	mov	edx,eax
	sal	edx,4
	add	ecx,edx
	push	ecx
	mov	ecx,eax
	dec	ecx
	sal	ecx,4
	lea	edx,[ebp-132]
	add	edx,ecx
	push	edx
	lea	ecx,[ebp-132]
	push	ecx
	call	__rasterize_triangle_2i
	add	esp,12
	mov	eax,[ebp-140]
	inc	eax
	jmp	label0006
label0007:
	pop	ebx
	pop	edi
	add	esp,140
	pop	ebp
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	push	ebp
	mov	ebp,esp
	sub	esp,16
	push	edi
	push	esi
	mov	edi,[ebp+12]
	mov	esi,[ebp+8]
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	push	dword ptr [edi+8]
	push	dword ptr [edi+4]
	push	dword ptr [edi]
	lea	edi,[ebp-16]
	push	edi
	call	_vec4f_assign
	add	esp,20
	lea	edi,dword ptr [__mvproj_matrix]
	push	edi
	lea	edi,[ebp-16]
	push	edi
	push	esi
	call	_matrix4f_transform
	add	esp,12
	pop	esi
	pop	edi
	add	esp,16
	pop	ebp
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	push	ebp
	mov	ebp,esp
	sub	esp,208
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+28]
	mov	esi,[ebp+24]
	mov	ebx,[ebp+20]
	mov	edx,[ebp+16]
	mov	ecx,[ebp+12]
	mov	eax,[ebp+8]
	mov	[ebp-200],ecx
	mov	[ebp-204],edx
	push	eax
	lea	eax,[ebp-196]
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	mov	edx,[ebp-204]
	mov	ecx,[ebp-200]
	lea	eax,[ebp-196]
	add	eax,16
	mov	[ebp-208],edi
	mov	edi,[ebx]
	mov	ebx,[ebx+4]
	mov	[eax],edi
	mov	[eax+4],ebx
	mov	[ebp-204],edx
	push	ecx
	lea	eax,[ebp-196]
	add	eax,24
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	mov	edx,[ebp-204]
	lea	eax,[ebp-196]
	add	eax,24
	add	eax,16
	mov	ecx,[esi]
	mov	ebx,[esi+4]
	mov	[eax],ecx
	mov	[eax+4],ebx
	push	edx
	lea	eax,[ebp-196]
	add	eax,48
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	lea	eax,[ebp-196]
	add	eax,48
	add	eax,16
	mov	ecx,[edi]
	mov	edx,[edi+4]
	mov	[eax],ecx
	mov	[eax+4],edx
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
	pop	esi
	pop	edi
	add	esp,208
	pop	ebp
	ret
_rasterizer_triangle3f endp	

end
