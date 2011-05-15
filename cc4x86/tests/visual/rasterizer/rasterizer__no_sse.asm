
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
