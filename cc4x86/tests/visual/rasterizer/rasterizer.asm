
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

_rasterizer_triangle3f proc
	push	ebp
	mov	ebp,esp
	sub	esp,948
	push	edi
	push	ebx
	mov	eax,[ebp+8]
	mov	[ebp-892],eax
	lea	eax,[ebp-196]
	mov	[ebp-896],eax
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-916]
	mov	eax,[ebp-892]
	mov	ecx,[eax+8]
	mov	[ebp-920],ecx
	mov	eax,[ebp-892]
	mov	ecx,[eax+4]
	mov	[ebp-924],ecx
	mov	eax,[ebp-892]
	mov	ecx,[eax]
	mov	[ebp-928],ecx
	lea	eax,[ebp-912]
	mov	[ebp-932],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-928]
	fstp	dword ptr [eax]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-924]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-920]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-916]
	fstp	dword ptr [eax+12]
label0076:
; end of inline function vec4f_assign
	lea	eax,dword ptr [__mvproj_matrix]
	mov	[ebp-936],eax
	lea	eax,[ebp-912]
	mov	[ebp-940],eax
	mov	eax,[ebp-896]
	mov	[ebp-944],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+12]
label0077:
; end of inline function matrix4f_transform
label0078:
; end of inline function _transform_to_projection_space
	lea	eax,[ebp-196]
	add	eax,16
	mov	ecx,[ebp+20]
	mov	edx,[ecx]
	mov	ebx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ebx
	mov	eax,[ebp+12]
	mov	[ebp-892],eax
	lea	eax,[ebp-196]
	add	eax,24
	mov	[ebp-896],eax
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-916]
	mov	eax,[ebp-892]
	mov	ecx,[eax+8]
	mov	[ebp-920],ecx
	mov	eax,[ebp-892]
	mov	ecx,[eax+4]
	mov	[ebp-924],ecx
	mov	eax,[ebp-892]
	mov	ecx,[eax]
	mov	[ebp-928],ecx
	lea	eax,[ebp-912]
	mov	[ebp-932],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-928]
	fstp	dword ptr [eax]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-924]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-920]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-916]
	fstp	dword ptr [eax+12]
label0079:
; end of inline function vec4f_assign
	lea	eax,dword ptr [__mvproj_matrix]
	mov	[ebp-936],eax
	lea	eax,[ebp-912]
	mov	[ebp-940],eax
	mov	eax,[ebp-896]
	mov	[ebp-944],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+12]
label007a:
; end of inline function matrix4f_transform
label007b:
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
	mov	[ebp-892],eax
	lea	eax,[ebp-196]
	add	eax,48
	mov	[ebp-896],eax
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-916]
	mov	eax,[ebp-892]
	mov	ecx,[eax+8]
	mov	[ebp-920],ecx
	mov	eax,[ebp-892]
	mov	ecx,[eax+4]
	mov	[ebp-924],ecx
	mov	eax,[ebp-892]
	mov	ecx,[eax]
	mov	[ebp-928],ecx
	lea	eax,[ebp-912]
	mov	[ebp-932],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-928]
	fstp	dword ptr [eax]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-924]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-920]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-932]
	fld	dword ptr [ebp-916]
	fstp	dword ptr [eax+12]
label007c:
; end of inline function vec4f_assign
	lea	eax,dword ptr [__mvproj_matrix]
	mov	[ebp-936],eax
	lea	eax,[ebp-912]
	mov	[ebp-940],eax
	mov	eax,[ebp-896]
	mov	[ebp-944],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-936]
	mov	ecx,[ebp-940]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-940]
	mov	ecx,[ebp-936]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-944]
	fstp	dword ptr [eax+12]
label007d:
; end of inline function matrix4f_transform
label007e:
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
	push	eax
	lea	eax,dword ptr [__clip_z_far_base]
	push	eax
	push	dword ptr [ebp-648]
	lea	eax,[ebp-844]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_z_near_norm]
	push	eax
	lea	eax,dword ptr [__clip_z_near_base]
	push	eax
	lea	eax,[ebp-844]
	push	eax
	push	dword ptr [ebp-648]
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_left_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_left_base]
	push	eax
	push	dword ptr [ebp-648]
	lea	eax,[ebp-844]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_right_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_right_base]
	push	eax
	lea	eax,[ebp-844]
	push	eax
	push	dword ptr [ebp-648]
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_top_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_top_base]
	push	eax
	push	dword ptr [ebp-648]
	lea	eax,[ebp-844]
	push	eax
	call	__clip_on_plain
	add	esp,16
	lea	eax,dword ptr [__clip_plane_bottom_norm]
	push	eax
	lea	eax,dword ptr [__clip_plane_bottom_base]
	push	eax
	lea	eax,[ebp-844]
	push	eax
	push	dword ptr [ebp-648]
	call	__clip_on_plain
	add	esp,16
	mov	eax,[ebp-648]
	cmp	dword ptr [eax+192],1
	setg	al
	movzx	eax,al
	mov	[ebp-848],eax
label0070:
; end of inline function _clip_poligon
	mov	eax,[ebp-848]
	cmp	eax,0
	jne	label0000
	jmp	label0075
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
	mov	[ebp-852],eax
	lea	eax,[ebp-332]
	mov	ecx,[ebp-336]
	sal	ecx,4
	add	eax,ecx
	mov	[ebp-856],eax
; start of inline function _transform_to_screen_space
	lea	eax,dword ptr [__viewport_matrix]
	mov	[ebp-880],eax
	mov	eax,[ebp-852]
	mov	[ebp-884],eax
	lea	eax,[ebp-872]
	mov	[ebp-888],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+16]
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax]
	fmul	dword ptr [ecx]
	faddp
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+32]
	faddp
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+48]
	faddp
	mov	eax,[ebp-888]
	fstp	dword ptr [eax]
	mov	eax,[ebp-880]
	mov	ecx,[ebp-884]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+4]
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+20]
	faddp
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+36]
	faddp
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+52]
	faddp
	mov	eax,[ebp-888]
	fstp	dword ptr [eax+4]
	mov	eax,[ebp-880]
	mov	ecx,[ebp-884]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+8]
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+24]
	faddp
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+40]
	faddp
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+56]
	faddp
	mov	eax,[ebp-888]
	fstp	dword ptr [eax+8]
	mov	eax,[ebp-880]
	mov	ecx,[ebp-884]
	fld	dword ptr [ecx]
	fmul	dword ptr [eax+12]
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+4]
	fmul	dword ptr [ecx+28]
	faddp
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+8]
	fmul	dword ptr [ecx+44]
	faddp
	mov	eax,[ebp-884]
	mov	ecx,[ebp-880]
	fld	dword ptr [eax+12]
	fmul	dword ptr [ecx+60]
	faddp
	mov	eax,[ebp-888]
	fstp	dword ptr [eax+12]
label0073:
; end of inline function matrix4f_transform
	lea	eax,[ebp-872]
	add	eax,12
	fld1
	fdiv	dword ptr [eax]
	fstp	dword ptr [ebp-876]
	fld	dword ptr [ebp-872]
	fmul	dword ptr [ebp-876]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	ecx,[ebp-856]
	mov	[ecx],eax
	lea	eax,[ebp-872]
	add	eax,4
	fld	dword ptr [eax]
	fmul	dword ptr [ebp-876]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	ecx,[ebp-856]
	mov	[ecx+4],eax
	mov	eax,[ebp-856]
	cmp	dword ptr [eax],0
	jl	label0072
	mov	eax,[ebp-856]
	mov	ecx,[eax]
	cmp	ecx,dword ptr [__width]
	jge	label0072
	mov	eax,[ebp-856]
	cmp	dword ptr [eax+4],0
	jl	label0072
	mov	eax,[ebp-856]
	mov	ecx,[eax+4]
	cmp	ecx,dword ptr [__height]
	jl	label0071
label0072:
	mov	dword ptr ds:[0],0
label0071:
label0074:
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-632]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-636],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-628]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-600],eax
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-368]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-376]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
	fdivp
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-380]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
	fdivp
	mov	eax,[ebp-344]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-368]
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
	fdivp
	mov	eax,[ebp-348]
	fadd	dword ptr [eax+8]
	fstp	dword ptr [ebp-376]
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],ecx
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],edx
	fild	dword ptr [ebp-948]
	fdivp
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	fadd	dword ptr [eax]
	fstp	dword ptr [ebp-380]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-504]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-508],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	mov	[ebp-948],eax
	fild	dword ptr [ebp-948]
	fmul	dword ptr [ebp-500]
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
	mov	[ebp-472],eax
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	fistp	dword ptr [ebp-948]
	mov	eax,[ebp-948]
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
label0075:
; end of inline function _rasterize_polygon_4f
	pop	ebx
	pop	edi
	add	esp,948
	pop	ebp
	ret
_rasterizer_triangle3f endp	

end
