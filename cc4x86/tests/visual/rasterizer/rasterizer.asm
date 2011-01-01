
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
___unnamed_float_1	dd	03f800000h
public	___unnamed_float_1
___unnamed_float_2	dd	00h
public	___unnamed_float_2
___unnamed_float_3	dd	040000000h
public	___unnamed_float_3
align 16
___unnamed_float_4	dd	080000000h, 00h, 00h, 00h
public	___unnamed_float_4
___unnamed_float_5	dd	0bf800000h
public	___unnamed_float_5
___unnamed_float_6	dd	0437f0000h
public	___unnamed_float_6

.code

_rasterizer_init proc
	push	ebp
	mov	ebp,esp
	sub	esp,76
	movss	xmm7,dword ptr [ebp+28]
	movss	xmm6,dword ptr [ebp+24]
	mov	eax,[ebp+8]
	mov	dword ptr [__dbgprintf],eax
	mov	eax,[ebp+12]
	mov	dword ptr [__width],eax
	mov	eax,[ebp+16]
	mov	dword ptr [__height],eax
	mov	eax,[ebp+20]
	mov	dword ptr [__pitch],eax
	cvtsi2ss	xmm0,dword ptr [ebp+12]
	cvtsi2ss	xmm1,dword ptr [ebp+16]
	divss	xmm0,xmm1
	movss	dword ptr [ebp-32],xmm0
	movss	xmm0,dword ptr [ebp+32]
	movss	dword ptr [ebp-36],xmm0
	movss	dword ptr [ebp-40],xmm7
	movss	dword ptr [ebp-44],xmm6
	mov	[ebp-48],(offset __mvproj_matrix)
; start of inline function matrix4f_make_perspective
	movss	xmm0,dword ptr [ebp-36]
	mulss	xmm0,dword ptr [ebp-44]
	movss	dword ptr [ebp-52],xmm0
	movss	xmm0,dword ptr [ebp-52]
	mulss	xmm0,dword ptr [ebp-32]
	movss	dword ptr [ebp-56],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [ebp-44]
	divss	xmm0,dword ptr [ebp-56]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+12],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+16],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [ebp-44]
	divss	xmm0,dword ptr [ebp-52]
	movss	dword ptr [eax+20],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+24],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+28],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+32],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+36],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [ebp-40]
	subss	xmm0,dword ptr [ebp-44]
	movss	xmm1,dword ptr [ebp-40]
	divss	xmm1,xmm0
	movss	dword ptr [eax+40],xmm1
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [eax+44],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+48],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+52],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [ebp-44]
	mulss	xmm0,dword ptr [ebp-40]
	movss	xmm1,dword ptr [ebp-44]
	subss	xmm1,dword ptr [ebp-40]
	divss	xmm0,xmm1
	movss	dword ptr [eax+56],xmm0
	mov	eax,[ebp-48]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+60],xmm0
label0010:
; end of inline function matrix4f_make_perspective
	movss	dword ptr [ebp-60],xmm7
	movss	dword ptr [ebp-64],xmm6
	cvtsi2ss	xmm0,dword ptr [ebp+16]
	movss	dword ptr [ebp-68],xmm0
	cvtsi2ss	xmm0,dword ptr [ebp+12]
	movss	dword ptr [ebp-72],xmm0
	mov	[ebp-76],(offset __viewport_matrix)
; start of inline function matrix4f_make_viewport
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [ebp-72]
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+12],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+16],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [ebp-68]
	xorps	xmm0,dword ptr [___unnamed_float_4]
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [eax+20],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+24],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+28],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+32],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+36],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [ebp-60]
	subss	xmm0,dword ptr [ebp-64]
	movss	dword ptr [eax+40],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [eax+44],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [ebp-72]
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [eax+48],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [ebp-68]
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [eax+52],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [ebp-64]
	movss	dword ptr [eax+56],xmm0
	mov	eax,[ebp-76]
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [eax+60],xmm0
label0011:
; end of inline function matrix4f_make_viewport
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	dword ptr [ebp-16],xmm6
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_z_near_base)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label0004:
; end of inline function vec4f_assign
	movss	xmm0,xmm7
	comiss	xmm0,xmm6
	jbe	label0000
	movss	xmm5,dword ptr [___unnamed_float_1]
	jmp	label0001
label0000:
	movss	xmm5,dword ptr [___unnamed_float_5]
label0001:
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	dword ptr [ebp-16],xmm5
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_z_near_norm)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label0005:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	dword ptr [ebp-16],xmm7
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_z_far_base)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label0006:
; end of inline function vec4f_assign
	movss	xmm0,xmm7
	comiss	xmm0,xmm6
	jbe	label0002
	movss	xmm4,dword ptr [___unnamed_float_5]
	jmp	label0003
label0002:
	movss	xmm4,dword ptr [___unnamed_float_1]
label0003:
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	dword ptr [ebp-16],xmm4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_z_far_norm)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label0007:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],xmm0
	cvtsi2ss	xmm0,dword ptr [ebp+12]
	movss	xmm1,dword ptr [___unnamed_float_1]
	divss	xmm1,xmm0
	movss	xmm0,dword ptr [___unnamed_float_5]
	addss	xmm0,xmm1
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_plane_left_base)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label0008:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_plane_left_norm)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label0009:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],xmm0
	cvtsi2ss	xmm0,dword ptr [ebp+12]
	movss	xmm1,dword ptr [___unnamed_float_1]
	divss	xmm1,xmm0
	movss	xmm0,dword ptr [___unnamed_float_1]
	subss	xmm0,xmm1
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_plane_right_base)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label000a:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_5]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_plane_right_norm)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label000b:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],xmm0
	cvtsi2ss	xmm0,dword ptr [ebp+16]
	movss	xmm1,dword ptr [___unnamed_float_1]
	divss	xmm1,xmm0
	movss	xmm0,dword ptr [___unnamed_float_5]
	addss	xmm0,xmm1
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_plane_top_base)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label000c:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],xmm0
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_plane_top_norm)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label000d:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],xmm0
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_plane_bottom_base)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
label000e:
; end of inline function vec4f_assign
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],xmm0
	movss	xmm0,dword ptr [___unnamed_float_5]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],xmm0
	mov	[ebp-28],(offset __clip_plane_bottom_norm)
; start of inline function vec4f_assign
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-16]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-28]
	movss	xmm0,dword ptr [ebp-12]
	movss	dword ptr [eax+12],xmm0
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

__rasterize_horiz_line proc
	push	ebp
	mov	ebp,esp
	sub	esp,64
	push	edi
	push	esi
	push	ebx
	movss	xmm7,dword ptr [ebp+24]
	movss	xmm6,dword ptr [ebp+20]
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
	movss	dword ptr [ebp-48],xmm7
	movss	dword ptr [ebp-52],xmm6
; start of inline function _tex2d
	mov	eax,dword ptr [__texture_width]
	dec	eax
	cvtsi2ss	xmm0,eax
	mulss	xmm0,dword ptr [ebp-52]
	cvttss2si	eax,xmm0
	mov	[ebp-56],eax
	mov	eax,dword ptr [__texture_height]
	dec	eax
	cvtsi2ss	xmm0,eax
	mulss	xmm0,dword ptr [ebp-48]
	cvttss2si	eax,xmm0
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
	cvtsi2ss	xmm5,dword ptr [ebp-40]
	divss	xmm5,dword ptr [___unnamed_float_6]
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
	cvtsi2ss	xmm0,dword ptr [ebp-20]
	mulss	xmm0,xmm5
	cvtsi2ss	xmm1,dword ptr [ebp-32]
	movss	xmm2,dword ptr [___unnamed_float_1]
	subss	xmm2,xmm5
	mulss	xmm1,xmm2
	addss	xmm0,xmm1
	cvttss2si	eax,xmm0
	mov	[ebp-20],eax
	cvtsi2ss	xmm0,dword ptr [ebp-24]
	mulss	xmm0,xmm5
	cvtsi2ss	xmm1,dword ptr [ebp-36]
	movss	xmm2,dword ptr [___unnamed_float_1]
	subss	xmm2,xmm5
	mulss	xmm1,xmm2
	addss	xmm0,xmm1
	cvttss2si	eax,xmm0
	mov	[ebp-24],eax
	mov	eax,[ebp-20]
	sal	eax,8
	add	eax,[ebp-24]
	mov	[esi],eax
label0003:
	movss	xmm0,xmm6
	addss	xmm0,dword ptr [ebp+28]
	movss	xmm6,xmm0
	movss	xmm0,xmm7
	addss	xmm0,dword ptr [ebp+32]
	movss	xmm7,xmm0
label0001:
	add	esi,4
	cmp	esi,ebx
	jl	label0000
label0002:
	pop	ebx
	pop	esi
	pop	edi
	add	esp,64
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
	movss	xmm0,dword ptr [eax]
	subss	xmm0,dword ptr [ecx]
	mov	eax,[ebp-116]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+4]
	subss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+8]
	subss	xmm0,dword ptr [ecx+8]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+12]
	subss	xmm0,dword ptr [ecx+12]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+12],xmm0
label000b:
; end of inline function vec4f_subtract
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+4]
	mulss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm1,dword ptr [eax]
	mulss	xmm1,dword ptr [ecx]
	addss	xmm1,xmm0
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+8]
	mulss	xmm0,dword ptr [ecx+8]
	addss	xmm1,xmm0
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+12]
	mulss	xmm0,dword ptr [ecx+12]
	addss	xmm1,xmm0
	movss	dword ptr [ebp-128],xmm1
label000f:
; end of inline function vec4f_dot
	movss	xmm7,dword ptr [ebp-128]
	mov	eax,[ebp+16]
	mov	[ebp-108],eax
	mov	[ebp-112],ebx
	lea	eax,[ebp-24]
	mov	[ebp-116],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax]
	subss	xmm0,dword ptr [ecx]
	mov	eax,[ebp-116]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+4]
	subss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+8]
	subss	xmm0,dword ptr [ecx+8]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+12]
	subss	xmm0,dword ptr [ecx+12]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+12],xmm0
label000c:
; end of inline function vec4f_subtract
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+4]
	mulss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm1,dword ptr [eax]
	mulss	xmm1,dword ptr [ecx]
	addss	xmm1,xmm0
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+8]
	mulss	xmm0,dword ptr [ecx+8]
	addss	xmm1,xmm0
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+12]
	mulss	xmm0,dword ptr [ecx+12]
	addss	xmm1,xmm0
	movss	dword ptr [ebp-128],xmm1
label0010:
; end of inline function vec4f_dot
	movss	xmm6,dword ptr [ebp-128]
	movss	xmm0,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm7
	ja	label0003
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
	movss	xmm0,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm7
	jae	label0006
	movss	xmm0,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm6
	ja	label0005
label0006:
	movss	xmm0,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm6
	ja	label0004
	movss	xmm0,dword ptr [___unnamed_float_2]
	comiss	xmm0,xmm7
	jbe	label0004
label0005:
	mov	[ebp-108],esi
	mov	eax,[ebp+16]
	mov	[ebp-112],eax
	lea	eax,[ebp-24]
	mov	[ebp-116],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax]
	subss	xmm0,dword ptr [ecx]
	mov	eax,[ebp-116]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+4]
	subss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+8]
	subss	xmm0,dword ptr [ecx+8]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+12]
	subss	xmm0,dword ptr [ecx+12]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+12],xmm0
label000d:
; end of inline function vec4f_subtract
	mov	[ebp-108],esi
	mov	[ebp-112],ebx
	lea	eax,[ebp-40]
	mov	[ebp-116],eax
; start of inline function vec4f_subtract
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax]
	subss	xmm0,dword ptr [ecx]
	mov	eax,[ebp-116]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+4]
	subss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+8]
	subss	xmm0,dword ptr [ecx+8]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-112]
	mov	ecx,[ebp-108]
	movss	xmm0,dword ptr [eax+12]
	subss	xmm0,dword ptr [ecx+12]
	mov	eax,[ebp-116]
	movss	dword ptr [eax+12],xmm0
label000e:
; end of inline function vec4f_subtract
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-24]
	mov	[ebp-124],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+4]
	mulss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm1,dword ptr [eax]
	mulss	xmm1,dword ptr [ecx]
	addss	xmm1,xmm0
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+8]
	mulss	xmm0,dword ptr [ecx+8]
	addss	xmm1,xmm0
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+12]
	mulss	xmm0,dword ptr [ecx+12]
	addss	xmm1,xmm0
	movss	dword ptr [ebp-128],xmm1
label0011:
; end of inline function vec4f_dot
	movss	xmm5,dword ptr [ebp-128]
	mov	eax,[ebp+20]
	mov	[ebp-120],eax
	lea	eax,[ebp-40]
	mov	[ebp-124],eax
; start of inline function vec4f_dot
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+4]
	mulss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm1,dword ptr [eax]
	mulss	xmm1,dword ptr [ecx]
	addss	xmm1,xmm0
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+8]
	mulss	xmm0,dword ptr [ecx+8]
	addss	xmm1,xmm0
	mov	eax,[ebp-124]
	mov	ecx,[ebp-120]
	movss	xmm0,dword ptr [eax+12]
	mulss	xmm0,dword ptr [ecx+12]
	addss	xmm1,xmm0
	movss	dword ptr [ebp-128],xmm1
label0012:
; end of inline function vec4f_dot
	divss	xmm5,dword ptr [ebp-128]
	movss	dword ptr [ebp-132],xmm5
	lea	eax,[ebp-40]
	mov	[ebp-136],eax
; start of inline function vec4f_mul
	mov	eax,[ebp-136]
	movss	xmm0,dword ptr [eax]
	mulss	xmm0,dword ptr [ebp-132]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-136]
	movss	xmm0,dword ptr [eax+4]
	mulss	xmm0,dword ptr [ebp-132]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-136]
	movss	xmm0,dword ptr [eax+8]
	mulss	xmm0,dword ptr [ebp-132]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-136]
	movss	xmm0,dword ptr [eax+12]
	mulss	xmm0,dword ptr [ebp-132]
	movss	dword ptr [eax+12],xmm0
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
	movss	xmm0,dword ptr [eax]
	addss	xmm0,dword ptr [ecx]
	mov	eax,[ebp-104]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-100]
	mov	ecx,[ebp-96]
	movss	xmm0,dword ptr [eax+4]
	addss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-104]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-100]
	mov	ecx,[ebp-96]
	movss	xmm0,dword ptr [eax+8]
	addss	xmm0,dword ptr [ecx+8]
	mov	eax,[ebp-104]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-100]
	mov	ecx,[ebp-96]
	movss	xmm0,dword ptr [eax+12]
	addss	xmm0,dword ptr [ecx+12]
	mov	eax,[ebp-104]
	movss	dword ptr [eax+12],xmm0
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
	movss	xmm0,dword ptr [eax]
	subss	xmm0,dword ptr [ecx]
	mov	eax,[ebp-84]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-80]
	mov	ecx,[ebp-76]
	movss	xmm0,dword ptr [eax+4]
	subss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-84]
	movss	dword ptr [eax+4],xmm0
label0008:
; end of inline function vec2f_subtract
	movss	dword ptr [ebp-88],xmm5
	lea	eax,[ebp-48]
	mov	[ebp-92],eax
; start of inline function vec2f_mul
	mov	eax,[ebp-92]
	movss	xmm0,dword ptr [eax]
	mulss	xmm0,dword ptr [ebp-88]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-92]
	movss	xmm0,dword ptr [eax+4]
	mulss	xmm0,dword ptr [ebp-88]
	movss	dword ptr [eax+4],xmm0
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
	movss	xmm0,dword ptr [eax]
	addss	xmm0,dword ptr [ecx]
	mov	eax,[ebp-72]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-68]
	mov	ecx,[ebp-64]
	movss	xmm0,dword ptr [eax+4]
	addss	xmm0,dword ptr [ecx+4]
	mov	eax,[ebp-72]
	movss	dword ptr [eax+4],xmm0
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

__transform_to_projection_space proc
	push	ebp
	mov	ebp,esp
	sub	esp,48
	push	edi
	mov	edi,[ebp+12]
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-20],xmm0
	movss	xmm0,dword ptr [edi+8]
	movss	dword ptr [ebp-24],xmm0
	movss	xmm0,dword ptr [edi+4]
	movss	dword ptr [ebp-28],xmm0
	movss	xmm0,dword ptr [edi]
	movss	dword ptr [ebp-32],xmm0
	lea	eax,[ebp-16]
	mov	[ebp-36],eax
; start of inline function vec4f_assign
	mov	eax,[ebp-36]
	movss	xmm0,dword ptr [ebp-32]
	movss	dword ptr [eax],xmm0
	mov	eax,[ebp-36]
	movss	xmm0,dword ptr [ebp-28]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-36]
	movss	xmm0,dword ptr [ebp-24]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-36]
	movss	xmm0,dword ptr [ebp-20]
	movss	dword ptr [eax+12],xmm0
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
	movss	xmm0,dword ptr [eax+4]
	mulss	xmm0,dword ptr [ecx+16]
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax]
	mulss	xmm1,dword ptr [ecx]
	addss	xmm1,xmm0
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm0,dword ptr [eax+8]
	mulss	xmm0,dword ptr [ecx+32]
	addss	xmm1,xmm0
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm0,dword ptr [eax+12]
	mulss	xmm0,dword ptr [ecx+48]
	addss	xmm1,xmm0
	mov	eax,[ebp-48]
	movss	dword ptr [eax],xmm1
	mov	eax,[ebp-40]
	mov	ecx,[ebp-44]
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [eax+4]
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+4]
	mulss	xmm1,dword ptr [ecx+20]
	addss	xmm0,xmm1
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+8]
	mulss	xmm1,dword ptr [ecx+36]
	addss	xmm0,xmm1
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+12]
	mulss	xmm1,dword ptr [ecx+52]
	addss	xmm0,xmm1
	mov	eax,[ebp-48]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-40]
	mov	ecx,[ebp-44]
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [eax+8]
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+4]
	mulss	xmm1,dword ptr [ecx+24]
	addss	xmm0,xmm1
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+8]
	mulss	xmm1,dword ptr [ecx+40]
	addss	xmm0,xmm1
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+12]
	mulss	xmm1,dword ptr [ecx+56]
	addss	xmm0,xmm1
	mov	eax,[ebp-48]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-40]
	mov	ecx,[ebp-44]
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [eax+12]
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+4]
	mulss	xmm1,dword ptr [ecx+28]
	addss	xmm0,xmm1
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+8]
	mulss	xmm1,dword ptr [ecx+44]
	addss	xmm0,xmm1
	mov	eax,[ebp-44]
	mov	ecx,[ebp-40]
	movss	xmm1,dword ptr [eax+12]
	mulss	xmm1,dword ptr [ecx+60]
	addss	xmm0,xmm1
	mov	eax,[ebp-48]
	movss	dword ptr [eax+12],xmm0
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
	sub	esp,704
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
	lea	eax,[ebp-196]
	mov	[ebp-200],eax
; start of inline function _rasterize_polygon_4f
	mov	eax,[ebp-200]
	mov	[ebp-464],eax
; start of inline function _clip_poligon
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
label0028:
; end of inline function _clip_poligon
	mov	eax,[ebp-664]
	cmp	eax,0
	jne	label0000
	jmp	label002d
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
	mov	[ebp-668],eax
	lea	eax,[ebp-332]
	mov	ecx,[ebp-336]
	sal	ecx,4
	add	eax,ecx
	mov	[ebp-672],eax
; start of inline function _transform_to_screen_space
	lea	eax,dword ptr [__viewport_matrix]
	mov	[ebp-696],eax
	mov	eax,[ebp-668]
	mov	[ebp-700],eax
	lea	eax,[ebp-688]
	mov	[ebp-704],eax
; start of inline function matrix4f_transform
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm0,dword ptr [eax+4]
	mulss	xmm0,dword ptr [ecx+16]
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax]
	mulss	xmm1,dword ptr [ecx]
	addss	xmm1,xmm0
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm0,dword ptr [eax+8]
	mulss	xmm0,dword ptr [ecx+32]
	addss	xmm1,xmm0
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm0,dword ptr [eax+12]
	mulss	xmm0,dword ptr [ecx+48]
	addss	xmm1,xmm0
	mov	eax,[ebp-704]
	movss	dword ptr [eax],xmm1
	mov	eax,[ebp-696]
	mov	ecx,[ebp-700]
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [eax+4]
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+4]
	mulss	xmm1,dword ptr [ecx+20]
	addss	xmm0,xmm1
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+8]
	mulss	xmm1,dword ptr [ecx+36]
	addss	xmm0,xmm1
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+12]
	mulss	xmm1,dword ptr [ecx+52]
	addss	xmm0,xmm1
	mov	eax,[ebp-704]
	movss	dword ptr [eax+4],xmm0
	mov	eax,[ebp-696]
	mov	ecx,[ebp-700]
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [eax+8]
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+4]
	mulss	xmm1,dword ptr [ecx+24]
	addss	xmm0,xmm1
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+8]
	mulss	xmm1,dword ptr [ecx+40]
	addss	xmm0,xmm1
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+12]
	mulss	xmm1,dword ptr [ecx+56]
	addss	xmm0,xmm1
	mov	eax,[ebp-704]
	movss	dword ptr [eax+8],xmm0
	mov	eax,[ebp-696]
	mov	ecx,[ebp-700]
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [eax+12]
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+4]
	mulss	xmm1,dword ptr [ecx+28]
	addss	xmm0,xmm1
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+8]
	mulss	xmm1,dword ptr [ecx+44]
	addss	xmm0,xmm1
	mov	eax,[ebp-700]
	mov	ecx,[ebp-696]
	movss	xmm1,dword ptr [eax+12]
	mulss	xmm1,dword ptr [ecx+60]
	addss	xmm0,xmm1
	mov	eax,[ebp-704]
	movss	dword ptr [eax+12],xmm0
label002b:
; end of inline function matrix4f_transform
	lea	eax,[ebp-688]
	add	eax,12
	movss	xmm0,dword ptr [___unnamed_float_1]
	divss	xmm0,dword ptr [eax]
	movss	dword ptr [ebp-692],xmm0
	movss	xmm0,dword ptr [ebp-688]
	mulss	xmm0,dword ptr [ebp-692]
	cvttss2si	eax,xmm0
	mov	ecx,[ebp-672]
	mov	[ecx],eax
	lea	eax,[ebp-688]
	add	eax,4
	movss	xmm0,dword ptr [eax]
	mulss	xmm0,dword ptr [ebp-692]
	cvttss2si	eax,xmm0
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
label002c:
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
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-428],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-432],xmm0
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
; start of inline function _rasterize_triangle_1i
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
	jmp	label001e
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
label001e:
	jmp	label0021
label001c:
	mov	eax,[ebp-452]
	cmp	eax,[ebp-456]
	jge	label0022
	movss	xmm0,dword ptr [ebp-428]
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [ebp-432]
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
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
	jmp	label0023
label0022:
	mov	eax,[ebp-452]
	cmp	eax,[ebp-460]
	jle	label0024
	movss	xmm0,dword ptr [ebp-428]
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [ebp-432]
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
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
	movss	xmm0,dword ptr [ebp-428]
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [ebp-432]
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
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
label0023:
label0021:
label0026:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label0027
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
	cvtsi2ss	xmm0,ecx
	mov	eax,[ebp-344]
	mov	ecx,[ebp-348]
	movss	xmm1,dword ptr [eax+8]
	subss	xmm1,dword ptr [ecx+8]
	mulss	xmm0,xmm1
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,[ebp-348]
	addss	xmm0,dword ptr [eax+8]
	movss	dword ptr [ebp-368],xmm0
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,[ebp-340]
	mov	ecx,[ebp-348]
	movss	xmm1,dword ptr [eax+8]
	subss	xmm1,dword ptr [ecx+8]
	mulss	xmm0,xmm1
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,[ebp-348]
	addss	xmm0,dword ptr [eax+8]
	movss	dword ptr [ebp-376],xmm0
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-348]
	add	ecx,4
	movss	xmm1,dword ptr [eax]
	subss	xmm1,dword ptr [ecx]
	mulss	xmm0,xmm1
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	addss	xmm0,dword ptr [eax]
	movss	dword ptr [ebp-372],xmm0
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,8
	add	eax,[ebp-340]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-348]
	add	ecx,4
	movss	xmm1,dword ptr [eax]
	subss	xmm1,dword ptr [ecx]
	mulss	xmm0,xmm1
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	addss	xmm0,dword ptr [eax]
	movss	dword ptr [ebp-380],xmm0
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	cvtsi2ss	xmm0,eax
	movss	xmm1,dword ptr [ebp-376]
	subss	xmm1,dword ptr [ebp-368]
	divss	xmm1,xmm0
	movss	dword ptr [ebp-384],xmm1
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	cvtsi2ss	xmm0,eax
	movss	xmm1,dword ptr [ebp-380]
	subss	xmm1,dword ptr [ebp-372]
	divss	xmm1,xmm0
	movss	dword ptr [ebp-388],xmm1
	movss	xmm0,dword ptr [ebp-388]
	movss	dword ptr [ebp-392],xmm0
	movss	xmm0,dword ptr [ebp-384]
	movss	dword ptr [ebp-396],xmm0
	movss	xmm0,dword ptr [ebp-380]
	movss	dword ptr [ebp-400],xmm0
	movss	xmm0,dword ptr [ebp-376]
	movss	dword ptr [ebp-404],xmm0
	movss	xmm0,dword ptr [ebp-372]
	movss	dword ptr [ebp-408],xmm0
	movss	xmm0,dword ptr [ebp-368]
	movss	dword ptr [ebp-412],xmm0
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
label0015:
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
	cvtsi2ss	xmm0,edx
	mov	eax,[ebp-340]
	mov	ecx,[ebp-348]
	movss	xmm1,dword ptr [eax+8]
	subss	xmm1,dword ptr [ecx+8]
	mulss	xmm0,xmm1
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,[ebp-348]
	addss	xmm0,dword ptr [eax+8]
	movss	dword ptr [ebp-376],xmm0
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm0,edx
	mov	eax,8
	add	eax,[ebp-340]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-348]
	add	ecx,4
	movss	xmm1,dword ptr [eax]
	subss	xmm1,dword ptr [ecx]
	mulss	xmm0,xmm1
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	addss	xmm0,dword ptr [eax]
	movss	dword ptr [ebp-380],xmm0
	mov	eax,[ebp-344]
	movss	xmm0,dword ptr [ebp-376]
	subss	xmm0,dword ptr [eax+8]
	mov	eax,[ebp-344]
	mov	ecx,[ebp-360]
	sub	ecx,[eax]
	cvtsi2ss	xmm1,ecx
	divss	xmm0,xmm1
	movss	dword ptr [ebp-384],xmm0
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	movss	xmm0,dword ptr [ebp-380]
	subss	xmm0,dword ptr [eax]
	mov	eax,[ebp-344]
	mov	ecx,[ebp-360]
	sub	ecx,[eax]
	cvtsi2ss	xmm1,ecx
	divss	xmm0,xmm1
	movss	dword ptr [ebp-388],xmm0
	movss	xmm0,dword ptr [ebp-388]
	movss	dword ptr [ebp-392],xmm0
	movss	xmm0,dword ptr [ebp-384]
	movss	dword ptr [ebp-396],xmm0
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	movss	xmm0,dword ptr [eax]
	movss	dword ptr [ebp-400],xmm0
	mov	eax,[ebp-344]
	movss	xmm0,dword ptr [eax+8]
	movss	dword ptr [ebp-404],xmm0
	movss	xmm0,dword ptr [ebp-380]
	movss	dword ptr [ebp-408],xmm0
	movss	xmm0,dword ptr [ebp-376]
	movss	dword ptr [ebp-412],xmm0
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
label0018:
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
	cvtsi2ss	xmm0,ecx
	mov	eax,[ebp-340]
	mov	ecx,[ebp-344]
	movss	xmm1,dword ptr [eax+8]
	subss	xmm1,dword ptr [ecx+8]
	mulss	xmm0,xmm1
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-344]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,[ebp-344]
	addss	xmm0,dword ptr [eax+8]
	movss	dword ptr [ebp-368],xmm0
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,[ebp-340]
	mov	ecx,[ebp-348]
	movss	xmm1,dword ptr [eax+8]
	subss	xmm1,dword ptr [ecx+8]
	mulss	xmm0,xmm1
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,[ebp-348]
	addss	xmm0,dword ptr [eax+8]
	movss	dword ptr [ebp-376],xmm0
	mov	eax,[ebp-344]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,8
	add	eax,[ebp-340]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-344]
	add	ecx,4
	movss	xmm1,dword ptr [eax]
	subss	xmm1,dword ptr [ecx]
	mulss	xmm0,xmm1
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-344]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,8
	add	eax,[ebp-344]
	add	eax,4
	addss	xmm0,dword ptr [eax]
	movss	dword ptr [ebp-372],xmm0
	mov	eax,[ebp-348]
	add	eax,4
	mov	ecx,[ebp-364]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,8
	add	eax,[ebp-340]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp-348]
	add	ecx,4
	movss	xmm1,dword ptr [eax]
	subss	xmm1,dword ptr [ecx]
	mulss	xmm0,xmm1
	mov	eax,[ebp-340]
	add	eax,4
	mov	ecx,[ebp-348]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,8
	add	eax,[ebp-348]
	add	eax,4
	addss	xmm0,dword ptr [eax]
	movss	dword ptr [ebp-380],xmm0
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	cvtsi2ss	xmm0,eax
	movss	xmm1,dword ptr [ebp-376]
	subss	xmm1,dword ptr [ebp-368]
	divss	xmm1,xmm0
	movss	dword ptr [ebp-384],xmm1
	mov	eax,[ebp-360]
	sub	eax,[ebp-356]
	cvtsi2ss	xmm0,eax
	movss	xmm1,dword ptr [ebp-380]
	subss	xmm1,dword ptr [ebp-372]
	divss	xmm1,xmm0
	movss	dword ptr [ebp-388],xmm1
	movss	xmm0,dword ptr [ebp-388]
	movss	dword ptr [ebp-392],xmm0
	movss	xmm0,dword ptr [ebp-384]
	movss	dword ptr [ebp-396],xmm0
	movss	xmm0,dword ptr [ebp-380]
	movss	dword ptr [ebp-400],xmm0
	movss	xmm0,dword ptr [ebp-376]
	movss	dword ptr [ebp-404],xmm0
	movss	xmm0,dword ptr [ebp-372]
	movss	dword ptr [ebp-408],xmm0
	movss	xmm0,dword ptr [ebp-368]
	movss	dword ptr [ebp-412],xmm0
	mov	eax,[ebp-364]
	mov	[ebp-416],eax
	mov	eax,[ebp-360]
	mov	[ebp-420],eax
	mov	eax,[ebp-356]
	mov	[ebp-424],eax
; start of inline function _rasterize_horiz_line__unordered
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
label001b:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-364]
	jmp	label0011
label0012:
label0027:
; end of inline function _rasterize_triangle_2i
	inc	dword ptr [ebp-336]
	jmp	label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
	pop	ebx
	pop	edi
	add	esp,704
	pop	ebp
	ret
_rasterizer_triangle3f endp	

end
