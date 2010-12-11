
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
