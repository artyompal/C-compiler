
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

_rasterizer_init proc
	push	ebp
	mov	ebp,esp
	sub	esp,76
	push	edi
	mov	eax,[ebp+8]
	mov	dword ptr [__dbgprintf],eax
	mov	eax,[ebp+12]
	mov	dword ptr [__width],eax
	mov	eax,[ebp+16]
	mov	dword ptr [__height],eax
	mov	eax,[ebp+20]
	mov	dword ptr [__pitch],eax
; start of inline function matrix4f_make_perspective
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp+32]
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp+28]
	fstp	dword ptr [ebp-40]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-44]
	fld	dword ptr [ebp-36]
	fmul	dword ptr [ebp-44]
	fstp	dword ptr [ebp-52]
	fld	dword ptr [ebp-52]
	fmul	dword ptr [ebp-32]
	fstp	dword ptr [ebp-56]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-56]
	fstp	dword ptr [__mvproj_matrix]
	fldz
	fstp	dword ptr [__mvproj_matrix+4]
	fldz
	fstp	dword ptr [__mvproj_matrix+8]
	fldz
	fstp	dword ptr [__mvproj_matrix+12]
	fldz
	fstp	dword ptr [__mvproj_matrix+16]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-52]
	fstp	dword ptr [__mvproj_matrix+20]
	fldz
	fstp	dword ptr [__mvproj_matrix+24]
	fldz
	fstp	dword ptr [__mvproj_matrix+28]
	fldz
	fstp	dword ptr [__mvproj_matrix+32]
	fldz
	fstp	dword ptr [__mvproj_matrix+36]
	fld	dword ptr [ebp-40]
	fsub	dword ptr [ebp-44]
	fdivr	dword ptr [ebp-40]
	fstp	dword ptr [__mvproj_matrix+40]
	fld1
	fstp	dword ptr [__mvproj_matrix+44]
	fldz
	fstp	dword ptr [__mvproj_matrix+48]
	fldz
	fstp	dword ptr [__mvproj_matrix+52]
	fld	dword ptr [ebp-44]
	fmul	dword ptr [ebp-40]
	fld	dword ptr [ebp-44]
	fsub	dword ptr [ebp-40]
	fdivp
	fstp	dword ptr [__mvproj_matrix+56]
	fldz
	fstp	dword ptr [__mvproj_matrix+60]
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
	fld	dword ptr [ebp+28]
	fstp	dword ptr [ebp-60]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-64]
	fild	dword ptr [ebp+16]
	fstp	dword ptr [ebp-68]
	fild	dword ptr [ebp+12]
	fstp	dword ptr [ebp-72]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [__viewport_matrix]
	fldz
	fstp	dword ptr [__viewport_matrix+4]
	fldz
	fstp	dword ptr [__viewport_matrix+8]
	fldz
	fstp	dword ptr [__viewport_matrix+12]
	fldz
	fstp	dword ptr [__viewport_matrix+16]
	fld	dword ptr [ebp-68]
	fldz
	fsubrp
	fld	dword ptr [___unnamed_float_1]
	fdivp
	fstp	dword ptr [__viewport_matrix+20]
	fldz
	fstp	dword ptr [__viewport_matrix+24]
	fldz
	fstp	dword ptr [__viewport_matrix+28]
	fldz
	fstp	dword ptr [__viewport_matrix+32]
	fldz
	fstp	dword ptr [__viewport_matrix+36]
	fld	dword ptr [ebp-60]
	fsub	dword ptr [ebp-64]
	fstp	dword ptr [__viewport_matrix+40]
	fldz
	fstp	dword ptr [__viewport_matrix+44]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [__viewport_matrix+48]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-68]
	fstp	dword ptr [__viewport_matrix+52]
	fld	dword ptr [ebp-64]
	fstp	dword ptr [__viewport_matrix+56]
	fld1
	fstp	dword ptr [__viewport_matrix+60]
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	edi,dword ptr [__clip_z_near_base]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
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
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp-4]
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	mov	edi,(offset __clip_z_near_norm)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp+28]
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	mov	edi,(offset __clip_z_far_base)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
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
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	mov	edi,(offset __clip_z_far_norm)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
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
	mov	edi,(offset __clip_plane_left_base)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fld1
	fstp	dword ptr [ebp-24]
	mov	edi,(offset __clip_plane_left_norm)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
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
	mov	edi,(offset __clip_plane_right_base)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-24]
	mov	edi,(offset __clip_plane_right_norm)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
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
	mov	edi,(offset __clip_plane_top_base)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld1
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	mov	edi,(offset __clip_plane_top_norm)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld1
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	mov	edi,(offset __clip_plane_bottom_base)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	mov	edi,(offset __clip_plane_bottom_norm)
	fld	dword ptr [ebp-24]
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [edi+12]
; end of inline function vec4f_assign
	pop	edi
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

__rasterize_horiz_line proc
	push	ebp
	mov	ebp,esp
	sub	esp,68
	push	edi
	push	esi
	push	ebx
	mov	edi,dword ptr [__pitch]
	imul	edi,[ebp+16]
	add	edi,dword ptr [__videomem]
	mov	eax,[ebp+8]
	sal	eax,2
	add	edi,eax
	mov	esi,[ebp+12]
	sal	esi,2
	add	esi,edi
	mov	eax,[ebp+8]
	sal	eax,2
	sub	esi,eax
label0000:
; start of inline function _tex2d
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-48]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [ebp-52]
	mov	eax,dword ptr [__texture_width]
	dec	eax
	mov	[ebp-68],eax
	fild	dword ptr [ebp-68]
	fmul	dword ptr [ebp-52]
	fistp	dword ptr [ebp-68]
	mov	ebx,[ebp-68]
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
	add	eax,ebx
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	ecx,[eax]
	mov	[ebp-64],ecx
; end of inline function _tex2d
	mov	ebx,[ebp-64]
	mov	eax,ebx
	sar	eax,24
	and	eax,255
	mov	[ebp-40],eax
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	edx,[edi]
	mov	eax,edx
	and	eax,65280
	sar	eax,8
	mov	[ebp-32],eax
	mov	eax,edx
	and	eax,255
	mov	[ebp-36],eax
	mov	eax,ebx
	and	eax,65280
	sar	eax,8
	mov	[ebp-20],eax
	mov	eax,ebx
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
	mov	ebx,[ebp-20]
	sal	ebx,8
	add	ebx,[ebp-24]
	mov	[edi],ebx
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
	add	edi,4
	cmp	edi,esi
	jl	label0000
	pop	ebx
	pop	esi
	pop	edi
	add	esp,68
	pop	ebp
	ret
__rasterize_horiz_line endp	

__clip_on_plain proc
	push	ebp
	mov	ebp,esp
	sub	esp,136
	push	edi
	push	esi
	push	ebx
	mov	eax,[ebp+8]
	mov	dword ptr [eax+192],0
	mov	eax,[ebp+12]
	mov	[ebp-4],eax
	mov	eax,[ebp+12]
	add	eax,24
	mov	[ebp-8],eax
label0001:
	mov	eax,[ebp+12]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp+12]
	add	eax,ecx
	cmp	eax,[ebp-8]
	jle	label0002
; start of inline function vec4f_subtract
	mov	eax,[ebp+16]
	mov	[ebp-108],eax
	mov	edi,[ebp-4]
	lea	esi,[ebp-24]
	mov	eax,[ebp-108]
	fld	dword ptr [edi]
	fsub	dword ptr [eax]
	fstp	dword ptr [esi]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+4]
	fsub	dword ptr [eax+4]
	fstp	dword ptr [esi+4]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+8]
	fsub	dword ptr [eax+8]
	fstp	dword ptr [esi+8]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+12]
	fsub	dword ptr [eax+12]
	fstp	dword ptr [esi+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
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
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-52]
; start of inline function vec4f_subtract
	mov	eax,[ebp+16]
	mov	[ebp-108],eax
	mov	eax,[ebp-8]
	mov	edi,eax
	lea	eax,[ebp-24]
	mov	esi,eax
	mov	eax,[ebp-108]
	fld	dword ptr [edi]
	fsub	dword ptr [eax]
	fstp	dword ptr [esi]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+4]
	fsub	dword ptr [eax+4]
	fstp	dword ptr [esi+4]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+8]
	fsub	dword ptr [eax+8]
	fstp	dword ptr [esi+8]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+12]
	fsub	dword ptr [eax+12]
	fstp	dword ptr [esi+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
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
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-56]
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	mov	eax,[ebp+8]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp+8]
	add	eax,ecx
	mov	ecx,[ebp-4]
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
; start of inline function vec4f_subtract
	mov	eax,[ebp-4]
	mov	[ebp-108],eax
	mov	eax,[ebp+16]
	mov	edi,eax
	lea	eax,[ebp-24]
	mov	esi,eax
	mov	eax,[ebp-108]
	fld	dword ptr [edi]
	fsub	dword ptr [eax]
	fstp	dword ptr [esi]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+4]
	fsub	dword ptr [eax+4]
	fstp	dword ptr [esi+4]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+8]
	fsub	dword ptr [eax+8]
	fstp	dword ptr [esi+8]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+12]
	fsub	dword ptr [eax+12]
	fstp	dword ptr [esi+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
	mov	eax,[ebp-4]
	mov	[ebp-108],eax
	mov	eax,[ebp-8]
	mov	edi,eax
	lea	eax,[ebp-40]
	mov	esi,eax
	mov	eax,[ebp-108]
	fld	dword ptr [edi]
	fsub	dword ptr [eax]
	fstp	dword ptr [esi]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+4]
	fsub	dword ptr [eax+4]
	fstp	dword ptr [esi+4]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+8]
	fsub	dword ptr [eax+8]
	fstp	dword ptr [esi+8]
	mov	eax,[ebp-108]
	fld	dword ptr [edi+12]
	fsub	dword ptr [eax+12]
	fstp	dword ptr [esi+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
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
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
; start of inline function vec4f_dot
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-40]
	mov	[ebp-124],eax
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
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fdivp
	fstp	dword ptr [ebp-60]
; start of inline function vec4f_mul
	fld	dword ptr [ebp-60]
	fstp	dword ptr [ebp-132]
	lea	eax,[ebp-40]
	mov	[ebp-136],eax
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
; end of inline function vec4f_mul
; start of inline function vec4f_add
	lea	eax,[ebp-40]
	mov	[ebp-96],eax
	mov	eax,[ebp-4]
	mov	[ebp-100],eax
	mov	eax,[ebp+8]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp+8]
	add	eax,ecx
	mov	[ebp-104],eax
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
; end of inline function vec4f_add
; start of inline function vec2f_subtract
	mov	eax,16
	add	eax,[ebp-4]
	mov	[ebp-76],eax
	mov	eax,16
	add	eax,[ebp-8]
	mov	[ebp-80],eax
	lea	eax,[ebp-48]
	mov	[ebp-84],eax
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
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
	fld	dword ptr [ebp-60]
	fstp	dword ptr [ebp-88]
	lea	eax,[ebp-48]
	mov	[ebp-92],eax
	mov	eax,[ebp-92]
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [eax]
	mov	eax,[ebp-92]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [eax+4]
; end of inline function vec2f_mul
; start of inline function vec2f_add
	lea	eax,[ebp-48]
	mov	[ebp-64],eax
	mov	eax,16
	add	eax,[ebp-4]
	mov	[ebp-68],eax
	mov	eax,[ebp+8]
	mov	ecx,[eax+192]
	imul	ecx,24
	mov	eax,[ebp+8]
	add	eax,ecx
	add	eax,16
	mov	[ebp-72],eax
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
; end of inline function vec2f_add
	mov	eax,[ebp+8]
	inc	dword ptr [eax+192]
label0004:
	add	dword ptr [ebp-4],24
	add	dword ptr [ebp-8],24
	jmp	label0001
label0002:
	mov	eax,[ebp+8]
	mov	ecx,[eax+192]
	inc	dword ptr [eax+192]
	imul	ecx,24
	mov	eax,[ebp+8]
	add	eax,ecx
	mov	ecx,[ebp+8]
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
	pop	ebx
	pop	esi
	pop	edi
	add	esp,136
	pop	ebp
	ret
__clip_on_plain endp	

__transform_to_projection_space proc
	push	ebp
	mov	ebp,esp
	sub	esp,48
	push	edi
	mov	edi,[ebp+12]
; start of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-20]
	fld	dword ptr [edi+8]
	fstp	dword ptr [ebp-24]
	fld	dword ptr [edi+4]
	fstp	dword ptr [ebp-28]
	fld	dword ptr [edi]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-32]
	fstp	dword ptr [ebp-16]
	fld	dword ptr [ebp-28]
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [ebp-8]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [ebp-4]
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
	mov	edi,[ebp+8]
	fld	dword ptr [ebp-12]
	fmul	dword ptr [__mvproj_matrix+16]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [__mvproj_matrix]
	faddp
	fld	dword ptr [ebp-8]
	fmul	dword ptr [__mvproj_matrix+32]
	faddp
	fld	dword ptr [ebp-4]
	fmul	dword ptr [__mvproj_matrix+48]
	faddp
	fstp	dword ptr [edi]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [__mvproj_matrix+4]
	fld	dword ptr [ebp-12]
	fmul	dword ptr [__mvproj_matrix+20]
	faddp
	fld	dword ptr [ebp-8]
	fmul	dword ptr [__mvproj_matrix+36]
	faddp
	fld	dword ptr [ebp-4]
	fmul	dword ptr [__mvproj_matrix+52]
	faddp
	fstp	dword ptr [edi+4]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [__mvproj_matrix+8]
	fld	dword ptr [ebp-12]
	fmul	dword ptr [__mvproj_matrix+24]
	faddp
	fld	dword ptr [ebp-8]
	fmul	dword ptr [__mvproj_matrix+40]
	faddp
	fld	dword ptr [ebp-4]
	fmul	dword ptr [__mvproj_matrix+56]
	faddp
	fstp	dword ptr [edi+8]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [__mvproj_matrix+12]
	fld	dword ptr [ebp-12]
	fmul	dword ptr [__mvproj_matrix+28]
	faddp
	fld	dword ptr [ebp-8]
	fmul	dword ptr [__mvproj_matrix+44]
	faddp
	fld	dword ptr [ebp-4]
	fmul	dword ptr [__mvproj_matrix+60]
	faddp
	fstp	dword ptr [edi+12]
; end of inline function matrix4f_transform
	pop	edi
	add	esp,48
	pop	ebp
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	push	ebp
	mov	ebp,esp
	sub	esp,708
	push	edi
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
; start of inline function _rasterize_polygon_4f
	lea	eax,[ebp-196]
	mov	[ebp-200],eax
; start of inline function _clip_poligon
	mov	eax,[ebp-200]
	mov	[ebp-464],eax
	lea	eax,dword ptr [__clip_z_far_norm]
	push	eax
	lea	eax,dword ptr [__clip_z_far_base]
	push	eax
	push	dword ptr [ebp-464]
	lea	eax,[ebp-660]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_z_near_norm]
	push	eax
	lea	eax,dword ptr [__clip_z_near_base]
	push	eax
	lea	eax,[ebp-660]
	push	eax
	push	dword ptr [ebp-464]
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_left_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_left_base]
	push	eax
	push	dword ptr [ebp-464]
	lea	eax,[ebp-660]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_right_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_right_base]
	push	eax
	lea	eax,[ebp-660]
	push	eax
	push	dword ptr [ebp-464]
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_top_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_top_base]
	push	eax
	push	dword ptr [ebp-464]
	lea	eax,[ebp-660]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_bottom_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_bottom_base]
	push	eax
	lea	eax,[ebp-660]
	push	eax
	push	dword ptr [ebp-464]
	call	__clip_on_plain
	add	esp,16
	mov	eax,[ebp-464]
	cmp	dword ptr [eax+192],1
	setg	al
	movzx	eax,al
	mov	[ebp-664],eax
; end of inline function _clip_poligon
	mov	eax,[ebp-664]
	cmp	eax,0
	jne	label0000
	jmp	label0007
label0000:
	mov	eax,[ebp-200]
	cmp	dword ptr [eax+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword ptr [ebp-336],0
label0003:
	mov	eax,[ebp-200]
	mov	ecx,[eax+192]
	cmp	ecx,[ebp-336]
	jle	label0004
; start of inline function _transform_to_screen_space
	mov	eax,[ebp-200]
	mov	ecx,[ebp-336]
	imul	ecx,24
	add	eax,ecx
	mov	[ebp-668],eax
	lea	eax,[ebp-332]
	mov	ecx,[ebp-336]
	sal	ecx,4
	add	eax,ecx
	mov	[ebp-672],eax
; start of inline function matrix4f_transform
	lea	eax,dword ptr [__viewport_matrix]
	mov	[ebp-696],eax
	mov	eax,[ebp-668]
	mov	[ebp-700],eax
	lea	eax,[ebp-688]
	mov	[ebp-704],eax
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-704]
	fstp	dword ptr [eax]
	mov	eax,[ebp-696]
	mov	ecx,[ebp-700]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-704]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-696]
	mov	ecx,[ebp-700]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-704]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-696]
	mov	ecx,[ebp-700]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-704]
	fstp	dword ptr [eax+12]
; end of inline function matrix4f_transform
	lea	eax,[ebp-688]
	add	eax,12
	fld1
	fdiv	dword ptr [eax]
	fstp	dword ptr [ebp-692]
	fld	dword ptr [ebp-688]
	fmul	dword ptr [ebp-692]
	fistp	dword ptr [ebp-708]
	mov	eax,[ebp-708]
	mov	ecx,[ebp-672]
	mov	[ecx],eax
	lea	eax,[ebp-688]
	add	eax,4
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-692]
	fistp	dword ptr [ebp-708]
	mov	eax,[ebp-708]
	mov	ecx,[ebp-672]
	mov	[ecx+4],eax
	mov	eax,[ebp-672]
	cmp	dword ptr [eax],0
	jl	label002a
	mov	eax,[ebp-672]
	mov	ecx,[eax]
	cmp	ecx,dword ptr [__width]
	jge	label002a
	mov	eax,[ebp-672]
	cmp	dword ptr [eax+4],0
	jl	label002a
	mov	eax,[ebp-672]
	mov	ecx,[eax+4]
	cmp	ecx,dword ptr [__height]
	jl	label0029
label002a:
	mov	dword ptr ds:[0],0
label0029:
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
label0006:
	mov	eax,[ebp-200]
	mov	ecx,[eax+192]
	dec	ecx
	cmp	ecx,[ebp-336]
	jle	label0007
; start of inline function _rasterize_triangle_2i
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
; start of inline function _rasterize_triangle_1i
	fldz
	fstp	dword ptr [ebp-428]
	fldz
	fstp	dword ptr [ebp-432]
	mov	eax,8
	add	eax,[ebp-340]
	mov	[ebp-436],eax
	mov	eax,8
	add	eax,[ebp-344]
	mov	[ebp-440],eax
	mov	eax,8
	add	eax,[ebp-348]
	mov	[ebp-444],eax
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-448],ecx
	mov	eax,[ebp-340]
	mov	ecx,[eax]
	mov	[ebp-452],ecx
	mov	eax,[ebp-344]
	mov	ecx,[eax]
	mov	[ebp-456],ecx
	mov	eax,[ebp-348]
	mov	ecx,[eax]
	mov	[ebp-460],ecx
	mov	eax,[ebp-460]
	cmp	eax,[ebp-456]
	jge	label001c
	mov	eax,[ebp-452]
	cmp	eax,[ebp-456]
	jle	label001d
	push	dword ptr [ebp-428]
	push	dword ptr [ebp-432]
	mov	eax,[ebp-444]
	push	dword ptr [eax+4]
	mov	eax,[ebp-444]
	push	dword ptr [eax]
	push	dword ptr [ebp-448]
	push	dword ptr [ebp-452]
	push	dword ptr [ebp-460]
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0020
label001d:
	mov	eax,[ebp-452]
	cmp	eax,[ebp-460]
	jge	label001f
	push	dword ptr [ebp-428]
	push	dword ptr [ebp-432]
	mov	eax,[ebp-436]
	push	dword ptr [eax+4]
	mov	eax,[ebp-436]
	push	dword ptr [eax]
	push	dword ptr [ebp-448]
	push	dword ptr [ebp-456]
	push	dword ptr [ebp-452]
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0020
label001f:
	push	dword ptr [ebp-428]
	push	dword ptr [ebp-432]
	mov	eax,[ebp-444]
	push	dword ptr [eax+4]
	mov	eax,[ebp-444]
	push	dword ptr [eax]
	push	dword ptr [ebp-448]
	push	dword ptr [ebp-456]
	push	dword ptr [ebp-460]
	call	__rasterize_horiz_line
	add	esp,28
label0020:
	jmp	label0025
label001c:
	mov	eax,[ebp-452]
	cmp	eax,[ebp-456]
	jge	label0022
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	eax,[ebp-436]
	push	dword ptr [eax+4]
	mov	eax,[ebp-436]
	push	dword ptr [eax]
	push	dword ptr [ebp-448]
	push	dword ptr [ebp-460]
	push	dword ptr [ebp-452]
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0025
label0022:
	mov	eax,[ebp-452]
	cmp	eax,[ebp-460]
	jle	label0024
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	eax,[ebp-440]
	push	dword ptr [eax+4]
	mov	eax,[ebp-440]
	push	dword ptr [eax]
	push	dword ptr [ebp-448]
	push	dword ptr [ebp-452]
	push	dword ptr [ebp-456]
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0025
label0024:
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	mov	eax,[ebp-440]
	push	dword ptr [eax+4]
	mov	eax,[ebp-440]
	push	dword ptr [eax]
	push	dword ptr [ebp-448]
	push	dword ptr [ebp-460]
	push	dword ptr [ebp-456]
	call	__rasterize_horiz_line
	add	esp,28
label0025:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label0012
label000b:
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-364],ecx
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
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-368]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-376]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
	fdivp
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-380]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-708],eax
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-708],eax
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
	fld	dword ptr [ebp-388]
	fstp	dword ptr [ebp-392]
	fld	dword ptr [ebp-384]
	fstp	dword ptr [ebp-396]
	fld	dword ptr [ebp-380]
	fstp	dword ptr [ebp-400]
	fld	dword ptr [ebp-376]
	fstp	dword ptr [ebp-404]
	fld	dword ptr [ebp-372]
	fstp	dword ptr [ebp-408]
	fld	dword ptr [ebp-368]
	fstp	dword ptr [ebp-412]
	mov	eax,[ebp-364]
	mov	[ebp-416],eax
	mov	eax,[ebp-360]
	mov	[ebp-420],eax
	mov	eax,[ebp-356]
	mov	[ebp-424],eax
	mov	eax,[ebp-424]
	cmp	eax,[ebp-420]
	jg	label0013
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-408]
	push	dword ptr [ebp-412]
	push	dword ptr [ebp-416]
	push	dword ptr [ebp-420]
	push	dword ptr [ebp-424]
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0014
label0013:
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-400]
	push	dword ptr [ebp-404]
	push	dword ptr [ebp-416]
	push	dword ptr [ebp-424]
	push	dword ptr [ebp-420]
	call	__rasterize_horiz_line
	add	esp,28
label0014:
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	fstp	dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
	fld	dword ptr [ebp-388]
	fstp	dword ptr [ebp-392]
	fld	dword ptr [ebp-384]
	fstp	dword ptr [ebp-396]
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	fld	dword ptr [eax]
	fstp	dword ptr [ebp-400]
	mov	eax,[ebp-344]
	fld	dword ptr [eax+8]
	fstp	dword ptr [ebp-404]
	fld	dword ptr [ebp-380]
	fstp	dword ptr [ebp-408]
	fld	dword ptr [ebp-376]
	fstp	dword ptr [ebp-412]
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[eax]
	mov	[ebp-416],ecx
	mov	eax,[ebp-344]
	mov	ecx,[eax]
	mov	[ebp-420],ecx
	mov	eax,[ebp-360]
	mov	[ebp-424],eax
	mov	eax,[ebp-424]
	cmp	eax,[ebp-420]
	jg	label0016
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-408]
	push	dword ptr [ebp-412]
	push	dword ptr [ebp-416]
	push	dword ptr [ebp-420]
	push	dword ptr [ebp-424]
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0017
label0016:
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-400]
	push	dword ptr [ebp-404]
	push	dword ptr [ebp-416]
	push	dword ptr [ebp-424]
	push	dword ptr [ebp-420]
	call	__rasterize_horiz_line
	add	esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,1
	add	ecx,[eax]
	mov	[ebp-364],ecx
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
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
	fdivp
	mov	eax,[ebp-344]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-368]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-376]
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
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
	mov	[ebp-708],edx
	fild	dword ptr [ebp-708]
	fdivp
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-380]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-708],eax
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-708],eax
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
	fld	dword ptr [ebp-388]
	fstp	dword ptr [ebp-392]
	fld	dword ptr [ebp-384]
	fstp	dword ptr [ebp-396]
	fld	dword ptr [ebp-380]
	fstp	dword ptr [ebp-400]
	fld	dword ptr [ebp-376]
	fstp	dword ptr [ebp-404]
	fld	dword ptr [ebp-372]
	fstp	dword ptr [ebp-408]
	fld	dword ptr [ebp-368]
	fstp	dword ptr [ebp-412]
	mov	eax,[ebp-364]
	mov	[ebp-416],eax
	mov	eax,[ebp-360]
	mov	[ebp-420],eax
	mov	eax,[ebp-356]
	mov	[ebp-424],eax
	mov	eax,[ebp-424]
	cmp	eax,[ebp-420]
	jg	label0019
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-408]
	push	dword ptr [ebp-412]
	push	dword ptr [ebp-416]
	push	dword ptr [ebp-420]
	push	dword ptr [ebp-424]
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label001a
label0019:
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-400]
	push	dword ptr [ebp-404]
	push	dword ptr [ebp-416]
	push	dword ptr [ebp-424]
	push	dword ptr [ebp-420]
	call	__rasterize_horiz_line
	add	esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-364]
	jmp	label0011
label0012:
; end of inline function _rasterize_triangle_2i
	inc	dword ptr [ebp-336]
	jmp	label0006
label0007:
; end of inline function _rasterize_polygon_4f
	pop	ebx
	pop	edi
	add	esp,708
	pop	ebp
	ret
_rasterizer_triangle3f endp	

end
