
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
	push	esi
	mov	edi,[ebp+20]
	mov	esi,[ebp+8]
	mov	dword ptr [__dbgprintf],esi
	mov	esi,[ebp+12]
	mov	dword ptr [__width],esi
	mov	esi,[ebp+16]
	mov	dword ptr [__height],esi
	mov	dword ptr [__pitch],edi
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
	pop	esi
	pop	edi
	add	esp,76
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

__rasterize_horiz_line proc
	push	ebp
	mov	ebp,esp
	sub	esp,68
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
; start of inline function _tex2d
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-48]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [ebp-52]
	mov	ebx,dword ptr [__texture_width]
	dec	ebx
	mov	[ebp-68],ebx
	fild	dword ptr [ebp-68]
	fmul	dword ptr [ebp-52]
	fistp	dword ptr [ebp-68]
	mov	esi,[ebp-68]
	mov	ebx,dword ptr [__texture_height]
	dec	ebx
	mov	[ebp-68],ebx
	fild	dword ptr [ebp-68]
	fmul	dword ptr [ebp-48]
	fistp	dword ptr [ebp-68]
	mov	ebx,[ebp-68]
	imul	ebx,dword ptr [__texture_width]
	add	ebx,esi
	sal	ebx,2
	add	ebx,dword ptr [__texture_data]
	mov	esi,[ebx]
; end of inline function _tex2d
	mov	ebx,esi
	sar	ebx,24
	and	ebx,255
	mov	[ebp-40],ebx
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	ebx,[edx]
	mov	eax,ebx
	and	eax,65280
	sar	eax,8
	mov	[ebp-32],eax
	mov	eax,ebx
	and	eax,255
	mov	[ebp-36],eax
	mov	eax,esi
	and	eax,65280
	sar	eax,8
	mov	[ebp-20],eax
	mov	eax,esi
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
	add	esp,68
	pop	ebp
	ret
__rasterize_horiz_line endp	

__clip_on_plain proc
	push	ebp
	mov	ebp,esp
	sub	esp,184
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
	mov	[ebp-140],edx
	mov	edx,[ebx+192]
	imul	edx,24
	mov	[ebp-144],edi
	mov	edi,ebx
	add	edi,edx
	cmp	edi,eax
	jle	label0002
; start of inline function vec4f_subtract
	mov	edi,esi
	mov	edx,ecx
	mov	[ebp-148],ebx
	lea	ebx,[ebp-24]
	fld	dword ptr [edx]
	fsub	dword ptr [edi]
	fstp	dword ptr [ebx]
	fld	dword ptr [edx+4]
	fsub	dword ptr [edi+4]
	fstp	dword ptr [ebx+4]
	fld	dword ptr [edx+8]
	fsub	dword ptr [edi+8]
	fstp	dword ptr [ebx+8]
	fld	dword ptr [edx+12]
	fsub	dword ptr [edi+12]
	fstp	dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	ebx,[ebp-144]
	mov	edi,ebx
	lea	edx,[ebp-24]
	fld	dword ptr [edx+4]
	fmul	dword ptr [edi+4]
	fld	dword ptr [edx]
	fmul	dword ptr [edi]
	faddp
	fld	dword ptr [edx+8]
	fmul	dword ptr [edi+8]
	faddp
	fld	dword ptr [edx+12]
	fmul	dword ptr [edi+12]
	faddp
	fstp	dword ptr [ebp-128]
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-52]
; start of inline function vec4f_subtract
	mov	edi,esi
	mov	edx,eax
	lea	ebx,[ebp-24]
	mov	[ebp-152],ebx
	fld	dword ptr [edx]
	fsub	dword ptr [edi]
	fstp	dword ptr [ebx]
	fld	dword ptr [edx+4]
	fsub	dword ptr [edi+4]
	fstp	dword ptr [ebx+4]
	fld	dword ptr [edx+8]
	fsub	dword ptr [edi+8]
	fstp	dword ptr [ebx+8]
	fld	dword ptr [edx+12]
	fsub	dword ptr [edi+12]
	fstp	dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	ebx,[ebp-144]
	mov	edi,ebx
	lea	edx,[ebp-24]
	mov	[ebp-156],edx
	fld	dword ptr [edx+4]
	fmul	dword ptr [edi+4]
	fld	dword ptr [edx]
	fmul	dword ptr [edi]
	faddp
	fld	dword ptr [edx+8]
	fmul	dword ptr [edi+8]
	faddp
	fld	dword ptr [edx+12]
	fmul	dword ptr [edi+12]
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
	mov	edi,[ebp-140]
	mov	edx,[edi+192]
	mov	[ebp-160],edx
	mov	edx,[ebp-140]
	inc	dword ptr [edx+192]
	mov	[ebp-140],edx
	mov	edx,[ebp-160]
	imul	edx,24
	mov	[ebp-160],edx
	mov	ebx,edx
	mov	[ebp-140],edx
	mov	edx,[ebp-160]
	add	ebx,edx
	mov	edx,[ecx]
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
; start of inline function vec4f_subtract
	mov	edi,ecx
	mov	edx,esi
	lea	ebx,[ebp-24]
	mov	[ebp-164],ebx
	fld	dword ptr [edx]
	fsub	dword ptr [edi]
	fstp	dword ptr [ebx]
	fld	dword ptr [edx+4]
	fsub	dword ptr [edi+4]
	fstp	dword ptr [ebx+4]
	fld	dword ptr [edx+8]
	fsub	dword ptr [edi+8]
	fstp	dword ptr [ebx+8]
	fld	dword ptr [edx+12]
	fsub	dword ptr [edi+12]
	fstp	dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
	mov	edi,ecx
	mov	edx,eax
	lea	ebx,[ebp-40]
	mov	[ebp-168],ebx
	fld	dword ptr [edx]
	fsub	dword ptr [edi]
	fstp	dword ptr [ebx]
	fld	dword ptr [edx+4]
	fsub	dword ptr [edi+4]
	fstp	dword ptr [ebx+4]
	fld	dword ptr [edx+8]
	fsub	dword ptr [edi+8]
	fstp	dword ptr [ebx+8]
	fld	dword ptr [edx+12]
	fsub	dword ptr [edi+12]
	fstp	dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	ebx,[ebp-144]
	mov	edi,ebx
	lea	edx,[ebp-24]
	mov	[ebp-172],edx
	fld	dword ptr [edx+4]
	fmul	dword ptr [edi+4]
	fld	dword ptr [edx]
	fmul	dword ptr [edi]
	faddp
	fld	dword ptr [edx+8]
	fmul	dword ptr [edi+8]
	faddp
	fld	dword ptr [edx+12]
	fmul	dword ptr [edi+12]
	faddp
	fstp	dword ptr [ebp-128]
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
; start of inline function vec4f_dot
	mov	edx,[ebp-144]
	mov	edi,edx
	lea	edx,[ebp-40]
	mov	[ebp-176],edx
	fld	dword ptr [edx+4]
	fmul	dword ptr [edi+4]
	fld	dword ptr [edx]
	fmul	dword ptr [edi]
	faddp
	fld	dword ptr [edx+8]
	fmul	dword ptr [edi+8]
	faddp
	fld	dword ptr [edx+12]
	fmul	dword ptr [edi+12]
	faddp
	fstp	dword ptr [ebp-128]
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fdivp
	fstp	dword ptr [ebp-60]
; start of inline function vec4f_mul
	fld	dword ptr [ebp-60]
	fstp	dword ptr [ebp-132]
	fld	dword ptr [ebp-40]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [ebp-40]
	fld	dword ptr [ebp-36]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp-32]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp-28]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [ebp-28]
; end of inline function vec4f_mul
; start of inline function vec4f_add
	mov	edi,ecx
	mov	ebx,[ebp-140]
	mov	edx,[ebx+192]
	imul	edx,24
	mov	[ebp-180],edx
	mov	ebx,edx
	mov	[ebp-140],edx
	mov	edx,[ebp-180]
	add	ebx,edx
	fld	dword ptr [edi]
	fadd	dword ptr [ebp-40]
	fstp	dword ptr [ebx]
	fld	dword ptr [edi+4]
	fadd	dword ptr [ebp-36]
	fstp	dword ptr [ebx+4]
	fld	dword ptr [edi+8]
	fadd	dword ptr [ebp-32]
	fstp	dword ptr [ebx+8]
	fld	dword ptr [edi+12]
	fadd	dword ptr [ebp-28]
	fstp	dword ptr [ebx+12]
; end of inline function vec4f_add
; start of inline function vec2f_subtract
	mov	edi,ecx
	mov	ebx,eax
	fld	dword ptr [ebx+16]
	fsub	dword ptr [edi+16]
	fstp	dword ptr [ebp-48]
	fld	dword ptr [ebx+20]
	fsub	dword ptr [edi+20]
	fstp	dword ptr [ebp-44]
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
	fld	dword ptr [ebp-60]
	fstp	dword ptr [ebp-88]
	fld	dword ptr [ebp-48]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [ebp-48]
	fld	dword ptr [ebp-44]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [ebp-44]
; end of inline function vec2f_mul
; start of inline function vec2f_add
	mov	edi,ecx
	mov	ebx,[ebp-140]
	mov	edx,[ebx+192]
	imul	edx,24
	mov	[ebp-184],edx
	mov	ebx,edx
	mov	[ebp-140],edx
	mov	edx,[ebp-184]
	add	ebx,edx
	add	ebx,16
	fld	dword ptr [edi+16]
	fadd	dword ptr [ebp-48]
	fstp	dword ptr [ebx]
	fld	dword ptr [edi+20]
	fadd	dword ptr [ebp-44]
	fstp	dword ptr [ebx+4]
; end of inline function vec2f_add
	mov	edx,[ebp-140]
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
	add	esp,184
	pop	ebp
	ret
__clip_on_plain endp	

__transform_to_projection_space proc
	push	ebp
	mov	ebp,esp
	sub	esp,48
	push	edi
	push	esi
	mov	edi,[ebp+12]
	mov	esi,[ebp+8]
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
	fstp	dword ptr [esi]
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
	fstp	dword ptr [esi+4]
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
	fstp	dword ptr [esi+8]
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
	fstp	dword ptr [esi+12]
; end of inline function matrix4f_transform
	pop	esi
	pop	edi
	add	esp,48
	pop	ebp
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	push	ebp
	mov	ebp,esp
	sub	esp,752
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+28]
	mov	esi,[ebp+24]
	mov	ebx,[ebp+20]
	mov	edx,[ebp+16]
	mov	ecx,[ebp+12]
	mov	eax,[ebp+8]
	mov	[ebp-712],ecx
	mov	[ebp-716],edx
	push	eax
	lea	eax,[ebp-196]
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	mov	edx,[ebp-716]
	mov	ecx,[ebp-712]
	lea	eax,[ebp-196]
	add	eax,16
	mov	[ebp-720],edi
	mov	edi,[ebx]
	mov	ebx,[ebx+4]
	mov	[eax],edi
	mov	[eax+4],ebx
	mov	[ebp-716],edx
	push	ecx
	lea	eax,[ebp-196]
	add	eax,24
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	mov	edx,[ebp-716]
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
; start of inline function _rasterize_polygon_4f
	lea	edi,[ebp-196]
; start of inline function _clip_poligon
	mov	esi,edi
	lea	eax,dword ptr [__clip_z_far_norm]
	push	eax
	lea	eax,dword ptr [__clip_z_far_base]
	push	eax
	push	esi
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
	push	esi
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_left_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_left_base]
	push	eax
	push	esi
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
	push	esi
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_top_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_top_base]
	push	eax
	push	esi
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
	push	esi
	call	__clip_on_plain
	add	esp,16
	cmp	dword ptr [esi+192],1
	setg	al
	movzx	eax,al
; end of inline function _clip_poligon
	cmp	eax,0
	jne	label0000
	jmp	label0007
label0000:
	cmp	dword ptr [edi+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	esi,0
label0003:
	mov	eax,[edi+192]
	cmp	eax,esi
	jle	label0004
; start of inline function _transform_to_screen_space
	mov	ebx,edi
	mov	eax,esi
	imul	eax,24
	add	ebx,eax
	lea	edx,[ebp-332]
	mov	eax,esi
	sal	eax,4
	add	edx,eax
; start of inline function matrix4f_transform
	fld	dword ptr [ebx+4]
	fmul	dword ptr [__viewport_matrix+16]
	fld	dword ptr [ebx]
	fmul	dword ptr [__viewport_matrix]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [__viewport_matrix+32]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [__viewport_matrix+48]
	faddp
	fstp	dword ptr [ebp-688]
	fld	dword ptr [ebx]
	fmul	dword ptr [__viewport_matrix+4]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [__viewport_matrix+20]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [__viewport_matrix+36]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [__viewport_matrix+52]
	faddp
	fstp	dword ptr [ebp-684]
	fld	dword ptr [ebx]
	fmul	dword ptr [__viewport_matrix+8]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [__viewport_matrix+24]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [__viewport_matrix+40]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [__viewport_matrix+56]
	faddp
	fstp	dword ptr [ebp-680]
	fld	dword ptr [ebx]
	fmul	dword ptr [__viewport_matrix+12]
	fld	dword ptr [ebx+4]
	fmul	dword ptr [__viewport_matrix+28]
	faddp
	fld	dword ptr [ebx+8]
	fmul	dword ptr [__viewport_matrix+44]
	faddp
	fld	dword ptr [ebx+12]
	fmul	dword ptr [__viewport_matrix+60]
	faddp
	fstp	dword ptr [ebp-676]
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
	mov	[edx],eax
	lea	eax,[ebp-688]
	add	eax,4
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-692]
	fistp	dword ptr [ebp-708]
	mov	eax,[ebp-708]
	mov	[edx+4],eax
	cmp	dword ptr [edx],0
	jl	label002a
	mov	eax,[edx]
	cmp	eax,dword ptr [__width]
	jge	label002a
	cmp	dword ptr [edx+4],0
	jl	label002a
	mov	eax,[edx+4]
	cmp	eax,dword ptr [__height]
	jl	label0029
label002a:
	mov	dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
	lea	eax,[ebp-332]
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
	mov	ecx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ecx
	inc	esi
	jmp	label0003
label0004:
	mov	esi,2
label0006:
	mov	eax,[edi+192]
	dec	eax
	cmp	eax,esi
	jle	label0007
; start of inline function _rasterize_triangle_2i
	lea	ebx,[ebp-332]
	mov	eax,esi
	sal	eax,4
	add	ebx,eax
	mov	eax,esi
	dec	eax
	sal	eax,4
	lea	edx,[ebp-332]
	add	edx,eax
	lea	ecx,[ebp-332]
	mov	eax,[ecx+4]
	cmp	eax,[edx+4]
	jle	label0008
	mov	ecx,edx
	mov	edx,ecx
label0008:
	mov	eax,[ecx+4]
	cmp	eax,[ebx+4]
	jle	label0009
	mov	ecx,ebx
	mov	ebx,ecx
label0009:
	mov	eax,[edx+4]
	cmp	eax,[ebx+4]
	jle	label000a
	mov	ecx,edx
	mov	edx,ebx
	mov	ebx,ecx
label000a:
	mov	eax,[ecx+4]
	cmp	eax,[ebx+4]
	jne	label000b
	cmp	dword ptr [ecx+4],0
	jl	label000c
	mov	eax,[ecx+4]
	cmp	eax,dword ptr [__height]
	jge	label000c
; start of inline function _rasterize_triangle_1i
	fldz
	fstp	dword ptr [ebp-428]
	fldz
	fstp	dword ptr [ebp-432]
	mov	ecx,ebx
	mov	eax,edx
	mov	[ebp-724],edi
	mov	edi,ecx
	mov	[ebp-728],esi
	mov	esi,[ecx+4]
	mov	ebx,[ebx]
	mov	edx,[edx]
	mov	[ebp-732],eax
	mov	eax,[ecx]
	cmp	eax,edx
	jge	label001c
	cmp	ebx,edx
	jle	label001d
	push	dword ptr [ebp-428]
	push	dword ptr [ebp-432]
	push	dword ptr [edi+12]
	push	dword ptr [edi+8]
	push	esi
	push	ebx
	push	eax
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0020
label001d:
	cmp	ebx,eax
	jge	label001f
	push	dword ptr [ebp-428]
	push	dword ptr [ebp-432]
	push	dword ptr [ecx+12]
	push	dword ptr [ecx+8]
	push	esi
	push	edx
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0020
label001f:
	push	dword ptr [ebp-428]
	push	dword ptr [ebp-432]
	push	dword ptr [edi+12]
	push	dword ptr [edi+8]
	push	esi
	push	edx
	push	eax
	call	__rasterize_horiz_line
	add	esp,28
label0020:
	jmp	label0025
label001c:
	cmp	ebx,edx
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
	push	dword ptr [ecx+12]
	push	dword ptr [ecx+8]
	push	esi
	push	eax
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0025
label0022:
	cmp	ebx,eax
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
	mov	eax,[ebp-732]
	push	dword ptr [eax+12]
	push	dword ptr [eax+8]
	push	esi
	push	ebx
	push	edx
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
	push	dword ptr [eax+12]
	push	dword ptr [eax+8]
	push	esi
	push	eax
	push	edx
	call	__rasterize_horiz_line
	add	esp,28
label0025:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label0012
label000b:
	mov	edi,[ecx+4]
label000e:
	mov	eax,[edx+4]
	cmp	eax,edi
	jle	label000f
	mov	eax,edi
	sub	eax,[ecx+4]
	mov	ecx,[edx]
	sub	ecx,[ecx]
	imul	eax,ecx
	mov	ecx,[edx+4]
	sub	ecx,[ecx+4]
	cdq
	idiv	ecx
	add	eax,[ecx]
	mov	[ebp-736],eax
	mov	eax,edi
	sub	eax,[ecx+4]
	mov	ecx,[ebx]
	sub	ecx,[ecx]
	imul	eax,ecx
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	cdq
	idiv	ecx
	add	eax,[ecx]
	mov	ecx,edi
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fld	dword ptr [edx+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	ecx,[edx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	fadd	dword ptr [ecx+8]
	fstp	dword ptr [ebp-368]
	mov	ecx,edi
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebx+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	fadd	dword ptr [ecx+8]
	fstp	dword ptr [ebp-376]
	mov	ecx,edi
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	mov	ecx,8
	add	ecx,edx
	add	ecx,4
	mov	edx,8
	add	edx,ecx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[edx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	mov	ecx,8
	add	ecx,ecx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-372]
	mov	ecx,edi
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	mov	edx,8
	add	edx,ecx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	mov	ecx,8
	add	ecx,ecx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-380]
	mov	ecx,eax
	mov	[ebp-740],eax
	mov	eax,[ebp-736]
	sub	ecx,eax
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	[ebp-736],eax
	mov	ecx,eax
	mov	[ebp-740],eax
	mov	eax,[ebp-736]
	sub	ecx,eax
	mov	[ebp-708],ecx
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
	mov	esi,edi
	mov	[ebp-736],eax
	mov	ebx,eax
	mov	edx,eax
	cmp	edx,ebx
	jg	label0013
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-408]
	push	dword ptr [ebp-412]
	push	esi
	push	ebx
	push	edx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0014
label0013:
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-400]
	push	dword ptr [ebp-404]
	push	esi
	push	edx
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
	inc	edi
	jmp	label000e
label000f:
	mov	eax,[edx+4]
	sub	eax,[ecx+4]
	mov	ecx,[ebx]
	sub	ecx,[ecx]
	imul	eax,ecx
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	cdq
	idiv	ecx
	add	eax,[ecx]
	mov	[ebp-744],eax
	mov	ecx,[edx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebx+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	fadd	dword ptr [ecx+8]
	fstp	dword ptr [ebp-376]
	mov	ecx,[edx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	mov	edx,8
	add	edx,ecx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	mov	ecx,8
	add	ecx,ecx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-380]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [edx+8]
	mov	ecx,eax
	sub	ecx,[edx]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	fstp	dword ptr [ebp-384]
	mov	ecx,8
	add	ecx,edx
	add	ecx,4
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ecx]
	mov	ecx,eax
	sub	ecx,[edx]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	fstp	dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
	fld	dword ptr [ebp-388]
	fstp	dword ptr [ebp-392]
	fld	dword ptr [ebp-384]
	fstp	dword ptr [ebp-396]
	mov	ecx,8
	add	ecx,edx
	add	ecx,4
	fld	dword ptr [ecx]
	fstp	dword ptr [ebp-400]
	fld	dword ptr [edx+8]
	fstp	dword ptr [ebp-404]
	fld	dword ptr [ebp-380]
	fstp	dword ptr [ebp-408]
	fld	dword ptr [ebp-376]
	fstp	dword ptr [ebp-412]
	mov	ecx,[edx+4]
	mov	esi,ecx
	mov	ecx,[edx]
	mov	ebx,ecx
	mov	edx,eax
	cmp	edx,ebx
	jg	label0016
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-408]
	push	dword ptr [ebp-412]
	push	esi
	push	ebx
	push	edx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0017
label0016:
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-400]
	push	dword ptr [ebp-404]
	push	esi
	push	edx
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
	mov	eax,1
	add	eax,[edx+4]
	mov	edi,eax
label0011:
	mov	eax,[ebx+4]
	cmp	eax,edi
	jle	label0012
	mov	eax,edi
	sub	eax,[edx+4]
	mov	ecx,[ebx]
	sub	ecx,[edx]
	imul	eax,ecx
	mov	ecx,[ebx+4]
	sub	ecx,[edx+4]
	cdq
	idiv	ecx
	add	eax,[edx]
	mov	[ebp-748],eax
	mov	[ebp-736],eax
	mov	eax,edi
	sub	eax,[ecx+4]
	mov	ecx,[ebx]
	sub	ecx,[ecx]
	imul	eax,ecx
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	cdq
	idiv	ecx
	add	eax,[ecx]
	mov	[ebp-752],eax
	mov	ecx,edi
	sub	ecx,[edx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebx+8]
	fsub	dword ptr [edx+8]
	fmulp
	mov	ecx,[ebx+4]
	sub	ecx,[edx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	fadd	dword ptr [edx+8]
	fstp	dword ptr [ebp-368]
	mov	ecx,edi
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebx+8]
	fsub	dword ptr [ecx+8]
	fmulp
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	fadd	dword ptr [ecx+8]
	fstp	dword ptr [ebp-376]
	mov	ecx,edi
	sub	ecx,[edx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	mov	edx,8
	add	edx,edx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[ebx+4]
	sub	ecx,[edx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	mov	ecx,8
	add	ecx,edx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-372]
	mov	ecx,edi
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	mov	ecx,8
	add	ecx,ebx
	add	ecx,4
	mov	edx,8
	add	edx,ecx
	add	edx,4
	fld	dword ptr [ecx]
	fsub	dword ptr [edx]
	fmulp
	mov	ecx,[ebx+4]
	sub	ecx,[ecx+4]
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fdivp
	mov	ecx,8
	add	ecx,ecx
	add	ecx,4
	fadd	dword ptr [ecx]
	fstp	dword ptr [ebp-380]
	mov	ecx,eax
	mov	[ebp-740],eax
	mov	eax,[ebp-736]
	sub	ecx,eax
	mov	[ebp-708],ecx
	fild	dword ptr [ebp-708]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	[ebp-736],eax
	mov	ecx,eax
	mov	[ebp-740],eax
	mov	eax,[ebp-736]
	sub	ecx,eax
	mov	[ebp-708],ecx
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
	mov	esi,edi
	mov	[ebp-736],eax
	mov	ebx,eax
	mov	edx,eax
	cmp	edx,ebx
	jg	label0019
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-408]
	push	dword ptr [ebp-412]
	push	esi
	push	ebx
	push	edx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label001a
label0019:
	push	dword ptr [ebp-392]
	push	dword ptr [ebp-396]
	push	dword ptr [ebp-400]
	push	dword ptr [ebp-404]
	push	esi
	push	edx
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
	inc	edi
	jmp	label0011
label0012:
; end of inline function _rasterize_triangle_2i
	mov	esi,[ebp-728]
	inc	esi
	jmp	label0006
label0007:
; end of inline function _rasterize_polygon_4f
	pop	ebx
	pop	esi
	pop	edi
	add	esp,752
	pop	ebp
	ret
_rasterizer_triangle3f endp	

end
