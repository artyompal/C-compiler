
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
	sub	esp,112
	push	edi
	push	esi
	push	ebx
	movss	xmm7,dword ptr [ebp+32]
	movss	xmm6,dword ptr [ebp+28]
	movss	xmm5,dword ptr [ebp+24]
	mov	edi,[ebp+20]
	mov	esi,[ebp+16]
	mov	ebx,[ebp+12]
	mov	edx,[ebp+8]
	mov	dword ptr [__dbgprintf],edx
	mov	dword ptr [__width],ebx
	mov	dword ptr [__height],esi
	mov	dword ptr [__pitch],edi
; start of inline function matrix4f_make_perspective
	cvtsi2ss	xmm4,ebx
	cvtsi2ss	xmm0,esi
	divss	xmm4,xmm0
	movss	xmm0,xmm6
	movss	xmm3,xmm5
	mulss	xmm7,xmm3
	movss	xmm2,xmm7
	mulss	xmm2,xmm4
	movss	xmm4,xmm3
	divss	xmm4,xmm2
	movss	dword ptr [__mvproj_matrix],xmm4
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+4],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+8],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+12],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+16],xmm2
	movss	xmm2,xmm3
	divss	xmm2,xmm7
	movss	dword ptr [__mvproj_matrix+20],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+24],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+28],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+32],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+36],xmm2
	movss	xmm2,xmm0
	subss	xmm2,xmm3
	movss	xmm4,xmm0
	divss	xmm4,xmm2
	movss	dword ptr [__mvproj_matrix+40],xmm4
	movss	xmm2,dword ptr [___unnamed_float_1]
	movss	dword ptr [__mvproj_matrix+44],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+48],xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+52],xmm2
	movss	xmm2,xmm3
	mulss	xmm2,xmm0
	subss	xmm3,xmm0
	divss	xmm2,xmm3
	movss	dword ptr [__mvproj_matrix+56],xmm2
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+60],xmm0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
	movss	xmm7,xmm6
	movss	xmm4,xmm5
	cvtsi2ss	xmm3,esi
	cvtsi2ss	xmm2,ebx
	movss	xmm0,xmm2
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+4],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+8],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+16],xmm0
	movss	xmm0,xmm3
	xorps	xmm0,dword ptr [___unnamed_float_4]
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix+20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+24],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+28],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+32],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+36],xmm0
	movss	xmm0,xmm7
	subss	xmm0,xmm4
	movss	dword ptr [__viewport_matrix+40],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+44],xmm0
	movss	xmm0,xmm2
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix+48],xmm0
	movss	xmm0,xmm3
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix+52],xmm0
	movss	dword ptr [__viewport_matrix+56],xmm4
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [__viewport_matrix+60],xmm0
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,xmm5
	movss	xmm3,dword ptr [___unnamed_float_2]
	movss	xmm2,dword ptr [___unnamed_float_2]
	lea	edi,dword ptr [__clip_z_near_base]
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
	movss	xmm0,xmm6
	comiss	xmm0,xmm5
	mov	[ebp-80],ebx
	mov	[ebp-84],esi
	movss	dword ptr [ebp-88],xmm5
	movss	dword ptr [ebp-92],xmm6
	jbe	label0000
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-96],xmm7
	jmp	label0001
label0000:
	movss	xmm7,dword ptr [___unnamed_float_5]
	movss	dword ptr [ebp-96],xmm7
label0001:
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-100],xmm7
	movss	xmm7,dword ptr [ebp-96]
	movss	xmm4,xmm7
	movss	xmm3,dword ptr [___unnamed_float_2]
	movss	xmm2,dword ptr [___unnamed_float_2]
	mov	edi,(offset __clip_z_near_norm)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	xmm7,dword ptr [ebp-100]
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm6,dword ptr [ebp-92]
	movss	xmm4,xmm6
	movss	xmm3,dword ptr [___unnamed_float_2]
	movss	xmm2,dword ptr [___unnamed_float_2]
	mov	edi,(offset __clip_z_far_base)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
	movss	xmm2,xmm6
	movss	xmm5,dword ptr [ebp-88]
	comiss	xmm2,xmm5
	jbe	label0002
	movss	xmm7,dword ptr [___unnamed_float_5]
	movss	dword ptr [ebp-104],xmm7
	jmp	label0003
label0002:
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-104],xmm7
label0003:
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-100],xmm7
	movss	xmm7,dword ptr [ebp-104]
	movss	xmm4,xmm7
	movss	xmm3,dword ptr [___unnamed_float_2]
	movss	xmm2,dword ptr [___unnamed_float_2]
	mov	edi,(offset __clip_z_far_norm)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	xmm7,dword ptr [ebp-100]
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,dword ptr [___unnamed_float_2]
	movss	xmm3,dword ptr [___unnamed_float_2]
	mov	ebx,[ebp-80]
	cvtsi2ss	xmm2,ebx
	movss	xmm0,dword ptr [___unnamed_float_1]
	divss	xmm0,xmm2
	movss	xmm2,dword ptr [___unnamed_float_5]
	addss	xmm2,xmm0
	movss	dword ptr [ebp-108],xmm2
	movss	xmm0,dword ptr [ebp-108]
	movss	xmm2,xmm0
	mov	edi,(offset __clip_plane_left_base)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,dword ptr [___unnamed_float_2]
	movss	xmm3,dword ptr [___unnamed_float_2]
	movss	xmm2,dword ptr [___unnamed_float_1]
	mov	edi,(offset __clip_plane_left_norm)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,dword ptr [___unnamed_float_2]
	movss	xmm3,dword ptr [___unnamed_float_2]
	cvtsi2ss	xmm2,ebx
	movss	xmm0,dword ptr [___unnamed_float_1]
	divss	xmm0,xmm2
	movss	xmm2,dword ptr [___unnamed_float_1]
	subss	xmm2,xmm0
	movss	dword ptr [ebp-112],xmm2
	movss	xmm0,dword ptr [ebp-112]
	movss	xmm2,xmm0
	mov	edi,(offset __clip_plane_right_base)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,dword ptr [___unnamed_float_2]
	movss	xmm3,dword ptr [___unnamed_float_2]
	movss	xmm2,dword ptr [___unnamed_float_5]
	mov	edi,(offset __clip_plane_right_norm)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,dword ptr [___unnamed_float_2]
	mov	esi,[ebp-84]
	cvtsi2ss	xmm2,esi
	movss	xmm3,dword ptr [___unnamed_float_1]
	divss	xmm3,xmm2
	movss	xmm2,dword ptr [___unnamed_float_5]
	addss	xmm2,xmm3
	movss	xmm3,xmm2
	movss	xmm2,dword ptr [___unnamed_float_2]
	mov	edi,(offset __clip_plane_top_base)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,dword ptr [___unnamed_float_2]
	movss	xmm3,dword ptr [___unnamed_float_1]
	movss	xmm2,dword ptr [___unnamed_float_2]
	mov	edi,(offset __clip_plane_top_norm)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,dword ptr [___unnamed_float_2]
	movss	xmm3,dword ptr [___unnamed_float_1]
	movss	xmm2,dword ptr [___unnamed_float_2]
	mov	edi,(offset __clip_plane_bottom_base)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm4,dword ptr [___unnamed_float_2]
	movss	xmm3,dword ptr [___unnamed_float_5]
	movss	xmm2,dword ptr [___unnamed_float_2]
	mov	edi,(offset __clip_plane_bottom_norm)
	movss	dword ptr [edi],xmm2
	movss	dword ptr [edi+4],xmm3
	movss	dword ptr [edi+8],xmm4
	movss	dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
	pop	ebx
	pop	esi
	pop	edi
	add	esp,112
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
	sub	esp,100
	push	edi
	push	esi
	push	ebx
	movss	xmm7,dword ptr [ebp+32]
	movss	xmm6,dword ptr [ebp+28]
	movss	xmm5,dword ptr [ebp+24]
	movss	xmm4,dword ptr [ebp+20]
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
	mov	[ebp-68],edx
	mov	[ebp-72],edi
	movss	dword ptr [ebp-88],xmm4
	movss	dword ptr [ebp-92],xmm5
	movss	dword ptr [ebp-96],xmm6
	movss	dword ptr [ebp-100],xmm7
label0000:
; start of inline function _tex2d
	movss	xmm5,dword ptr [ebp-92]
	movss	xmm7,xmm5
	movss	xmm4,dword ptr [ebp-88]
	movss	xmm6,xmm4
	mov	eax,dword ptr [__texture_width]
	dec	eax
	cvtsi2ss	xmm0,eax
	mulss	xmm0,xmm6
	cvttss2si	eax,xmm0
	mov	ecx,dword ptr [__texture_height]
	dec	ecx
	cvtsi2ss	xmm0,ecx
	mulss	xmm0,xmm7
	cvttss2si	ecx,xmm0
	imul	ecx,dword ptr [__texture_width]
	add	ecx,eax
	sal	ecx,2
	add	ecx,dword ptr [__texture_data]
	mov	ecx,[ecx]
; end of inline function _tex2d
	mov	eax,ecx
	sar	eax,24
	and	eax,255
	cmp	eax,0
	mov	[ebp-76],ecx
	mov	[ebp-80],eax
	movss	dword ptr [ebp-88],xmm4
	movss	dword ptr [ebp-92],xmm5
	je	label0003
	mov	eax,[ebp-80]
	cvtsi2ss	xmm7,eax
	divss	xmm7,dword ptr [___unnamed_float_6]
	mov	edx,[ebp-68]
	mov	eax,[edx]
	mov	edi,eax
	and	edi,65280
	sar	edi,8
	and	eax,255
	mov	ecx,[ebp-76]
	mov	esi,ecx
	and	esi,65280
	sar	esi,8
	and	ecx,255
	cvtsi2ss	xmm0,esi
	mulss	xmm0,xmm7
	cvtsi2ss	xmm1,edi
	movss	xmm2,dword ptr [___unnamed_float_1]
	subss	xmm2,xmm7
	mulss	xmm1,xmm2
	addss	xmm0,xmm1
	cvttss2si	esi,xmm0
	mov	[ebp-84],esi
	mov	edi,[ebp-84]
	mov	esi,edi
	cvtsi2ss	xmm0,ecx
	mulss	xmm0,xmm7
	cvtsi2ss	xmm1,eax
	movss	xmm2,dword ptr [___unnamed_float_1]
	subss	xmm2,xmm7
	mulss	xmm1,xmm2
	addss	xmm0,xmm1
	cvttss2si	eax,xmm0
	mov	ecx,eax
	sal	esi,8
	add	esi,ecx
	mov	[edx],esi
	mov	[ebp-68],edx
label0003:
	movss	xmm4,dword ptr [ebp-88]
	movss	xmm6,dword ptr [ebp-96]
	addss	xmm4,xmm6
	movss	xmm5,dword ptr [ebp-92]
	movss	xmm7,dword ptr [ebp-100]
	addss	xmm5,xmm7
	mov	edx,[ebp-68]
	add	edx,4
	mov	edi,[ebp-72]
	cmp	edx,edi
	mov	[ebp-68],edx
	mov	[ebp-72],edi
	movss	dword ptr [ebp-88],xmm4
	movss	dword ptr [ebp-92],xmm5
	movss	dword ptr [ebp-96],xmm6
	movss	dword ptr [ebp-100],xmm7
	jl	label0000
	pop	ebx
	pop	esi
	pop	edi
	add	esp,100
	pop	ebp
	ret
__rasterize_horiz_line endp	

__clip_on_plain proc
	push	ebp
	mov	ebp,esp
	sub	esp,208
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
	mov	[ebp-140],ecx
	mov	[ebp-144],eax
	mov	[ebp-148],edx
	mov	[ebp-152],ebx
	mov	[ebp-156],esi
	mov	[ebp-160],edi
label0001:
	mov	ebx,[ebp-152]
	mov	eax,[ebx+192]
	imul	eax,24
	mov	ecx,ebx
	add	ecx,eax
	mov	eax,[ebp-144]
	cmp	ecx,eax
	mov	[ebp-144],eax
	mov	[ebp-152],ebx
	jle	label0002
; start of inline function vec4f_subtract
	mov	esi,[ebp-156]
	mov	edi,esi
	mov	ecx,[ebp-140]
	mov	ebx,ecx
	lea	edx,[ebp-24]
	movss	xmm0,dword ptr [ebx]
	subss	xmm0,dword ptr [edi]
	movss	dword ptr [edx],xmm0
	movss	xmm0,dword ptr [ebx+4]
	subss	xmm0,dword ptr [edi+4]
	movss	dword ptr [edx+4],xmm0
	movss	xmm0,dword ptr [ebx+8]
	subss	xmm0,dword ptr [edi+8]
	movss	dword ptr [edx+8],xmm0
	movss	xmm0,dword ptr [ebx+12]
	subss	xmm0,dword ptr [edi+12]
	movss	dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	ebx,[ebp-160]
	mov	edi,ebx
	lea	edx,[ebp-24]
	movss	xmm0,dword ptr [edx+4]
	mulss	xmm0,dword ptr [edi+4]
	movss	xmm7,dword ptr [edx]
	mulss	xmm7,dword ptr [edi]
	addss	xmm7,xmm0
	movss	xmm0,dword ptr [edx+8]
	mulss	xmm0,dword ptr [edi+8]
	addss	xmm7,xmm0
	movss	xmm0,dword ptr [edx+12]
	mulss	xmm0,dword ptr [edi+12]
	addss	xmm7,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
	mov	edi,esi
	mov	eax,[ebp-144]
	mov	ebx,eax
	lea	edx,[ebp-24]
	mov	[ebp-164],edx
	mov	[ebp-144],eax
	mov	eax,[ebp-164]
	mov	edx,eax
	movss	xmm0,dword ptr [ebx]
	subss	xmm0,dword ptr [edi]
	movss	dword ptr [edx],xmm0
	movss	xmm0,dword ptr [ebx+4]
	subss	xmm0,dword ptr [edi+4]
	movss	dword ptr [edx+4],xmm0
	movss	xmm0,dword ptr [ebx+8]
	subss	xmm0,dword ptr [edi+8]
	movss	dword ptr [edx+8],xmm0
	movss	xmm0,dword ptr [ebx+12]
	subss	xmm0,dword ptr [edi+12]
	movss	dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	ebx,[ebp-160]
	mov	edi,ebx
	lea	edx,[ebp-24]
	mov	[ebp-168],edx
	mov	eax,[ebp-168]
	mov	edx,eax
	movss	xmm0,dword ptr [edx+4]
	mulss	xmm0,dword ptr [edi+4]
	movss	xmm1,dword ptr [edx]
	mulss	xmm1,dword ptr [edi]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [edx+8]
	mulss	xmm0,dword ptr [edi+8]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [edx+12]
	mulss	xmm0,dword ptr [edi+12]
	addss	xmm1,xmm0
	movss	dword ptr [ebp-196],xmm7
	movss	xmm7,xmm1
; end of inline function vec4f_dot
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-200],xmm7
	movss	xmm7,dword ptr [ebp-196]
	comiss	xmm0,xmm7
	mov	[ebp-140],ecx
	mov	[ebp-156],esi
	movss	dword ptr [ebp-196],xmm7
	ja	label0003
	mov	edx,[ebp-148]
	mov	eax,[edx+192]
	inc	dword ptr [edx+192]
	imul	eax,24
	mov	ecx,edx
	add	ecx,eax
	mov	[ebp-172],ecx
	mov	ecx,[ebp-140]
	mov	eax,[ecx]
	mov	ebx,[ecx+4]
	mov	[ebp-140],ecx
	mov	ecx,[ebp-172]
	mov	[ecx],eax
	mov	[ecx+4],ebx
	mov	[ebp-172],ecx
	mov	ecx,[ebp-140]
	mov	eax,[ecx+8]
	mov	ebx,[ecx+12]
	mov	[ebp-140],ecx
	mov	ecx,[ebp-172]
	mov	[ecx+8],eax
	mov	[ecx+12],ebx
	mov	[ebp-172],ecx
	mov	ecx,[ebp-140]
	mov	eax,[ecx+16]
	mov	ebx,[ecx+20]
	mov	[ebp-140],ecx
	mov	ecx,[ebp-172]
	mov	[ecx+16],eax
	mov	[ecx+20],ebx
	mov	[ebp-148],edx
label0003:
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	xmm7,dword ptr [ebp-196]
	comiss	xmm0,xmm7
	movss	dword ptr [ebp-196],xmm7
	jae	label0006
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	xmm7,dword ptr [ebp-200]
	comiss	xmm0,xmm7
	movss	dword ptr [ebp-200],xmm7
	ja	label0005
label0006:
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	xmm7,dword ptr [ebp-200]
	comiss	xmm0,xmm7
	ja	label0004
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	xmm7,dword ptr [ebp-196]
	comiss	xmm0,xmm7
	jbe	label0004
label0005:
; start of inline function vec4f_subtract
	mov	ecx,[ebp-140]
	mov	edi,ecx
	mov	esi,[ebp-156]
	mov	ebx,esi
	lea	eax,[ebp-24]
	mov	edx,eax
	movss	xmm0,dword ptr [ebx]
	subss	xmm0,dword ptr [edi]
	movss	dword ptr [edx],xmm0
	movss	xmm0,dword ptr [ebx+4]
	subss	xmm0,dword ptr [edi+4]
	movss	dword ptr [edx+4],xmm0
	movss	xmm0,dword ptr [ebx+8]
	subss	xmm0,dword ptr [edi+8]
	movss	dword ptr [edx+8],xmm0
	movss	xmm0,dword ptr [ebx+12]
	subss	xmm0,dword ptr [edi+12]
	movss	dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
	mov	edi,ecx
	mov	eax,[ebp-144]
	mov	ebx,eax
	lea	edx,[ebp-40]
	mov	[ebp-176],edx
	mov	[ebp-156],esi
	mov	esi,[ebp-176]
	mov	edx,esi
	movss	xmm0,dword ptr [ebx]
	subss	xmm0,dword ptr [edi]
	movss	dword ptr [edx],xmm0
	movss	xmm0,dword ptr [ebx+4]
	subss	xmm0,dword ptr [edi+4]
	movss	dword ptr [edx+4],xmm0
	movss	xmm0,dword ptr [ebx+8]
	subss	xmm0,dword ptr [edi+8]
	movss	dword ptr [edx+8],xmm0
	movss	xmm0,dword ptr [ebx+12]
	subss	xmm0,dword ptr [edi+12]
	movss	dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	ebx,[ebp-160]
	mov	edi,ebx
	lea	edx,[ebp-24]
	mov	[ebp-180],edx
	mov	ebx,[ebp-180]
	mov	edx,ebx
	movss	xmm0,dword ptr [edx+4]
	mulss	xmm0,dword ptr [edi+4]
	movss	xmm1,dword ptr [edx]
	mulss	xmm1,dword ptr [edi]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [edx+8]
	mulss	xmm0,dword ptr [edi+8]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [edx+12]
	mulss	xmm0,dword ptr [edi+12]
	addss	xmm1,xmm0
	movss	xmm7,xmm1
; end of inline function vec4f_dot
; start of inline function vec4f_dot
	mov	edx,[ebp-160]
	mov	edi,edx
	lea	edx,[ebp-40]
	mov	[ebp-184],edx
	mov	ebx,[ebp-184]
	mov	edx,ebx
	movss	xmm0,dword ptr [edx+4]
	mulss	xmm0,dword ptr [edi+4]
	movss	xmm1,dword ptr [edx]
	mulss	xmm1,dword ptr [edi]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [edx+8]
	mulss	xmm0,dword ptr [edi+8]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [edx+12]
	mulss	xmm0,dword ptr [edi+12]
	addss	xmm1,xmm0
	movss	dword ptr [ebp-204],xmm7
	movss	xmm7,xmm1
; end of inline function vec4f_dot
	movss	dword ptr [ebp-208],xmm7
	movss	xmm7,dword ptr [ebp-204]
	movss	xmm1,dword ptr [ebp-208]
	divss	xmm7,xmm1
; start of inline function vec4f_mul
	movss	xmm0,xmm7
	movss	xmm1,dword ptr [ebp-40]
	mulss	xmm1,xmm0
	movss	dword ptr [ebp-40],xmm1
	movss	xmm1,dword ptr [ebp-36]
	mulss	xmm1,xmm0
	movss	dword ptr [ebp-36],xmm1
	movss	xmm1,dword ptr [ebp-32]
	mulss	xmm1,xmm0
	movss	dword ptr [ebp-32],xmm1
	movss	xmm1,dword ptr [ebp-28]
	mulss	xmm1,xmm0
	movss	dword ptr [ebp-28],xmm1
; end of inline function vec4f_mul
; start of inline function vec4f_add
	mov	edi,ecx
	mov	esi,[ebp-148]
	mov	edx,[esi+192]
	imul	edx,24
	mov	[ebp-188],edx
	mov	edx,[ebp-148]
	mov	esi,edx
	mov	[ebp-148],edx
	mov	edx,[ebp-188]
	add	esi,edx
	movss	xmm0,dword ptr [edi]
	addss	xmm0,dword ptr [ebp-40]
	movss	dword ptr [esi],xmm0
	movss	xmm0,dword ptr [edi+4]
	addss	xmm0,dword ptr [ebp-36]
	movss	dword ptr [esi+4],xmm0
	movss	xmm0,dword ptr [edi+8]
	addss	xmm0,dword ptr [ebp-32]
	movss	dword ptr [esi+8],xmm0
	movss	xmm0,dword ptr [edi+12]
	addss	xmm0,dword ptr [ebp-28]
	movss	dword ptr [esi+12],xmm0
; end of inline function vec4f_add
; start of inline function vec2f_subtract
	mov	edi,ecx
	mov	esi,eax
	movss	xmm0,dword ptr [esi+16]
	subss	xmm0,dword ptr [edi+16]
	movss	dword ptr [ebp-48],xmm0
	movss	xmm0,dword ptr [esi+20]
	subss	xmm0,dword ptr [edi+20]
	movss	dword ptr [ebp-44],xmm0
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
	movss	xmm0,dword ptr [ebp-48]
	mulss	xmm0,xmm7
	movss	dword ptr [ebp-48],xmm0
	movss	xmm0,dword ptr [ebp-44]
	mulss	xmm0,xmm7
	movss	dword ptr [ebp-44],xmm0
; end of inline function vec2f_mul
; start of inline function vec2f_add
	mov	edi,ecx
	mov	esi,[ebp-148]
	mov	edx,[esi+192]
	imul	edx,24
	mov	[ebp-192],edx
	mov	edx,[ebp-148]
	mov	esi,edx
	mov	[ebp-148],edx
	mov	edx,[ebp-192]
	add	esi,edx
	add	esi,16
	movss	xmm0,dword ptr [edi+16]
	addss	xmm0,dword ptr [ebp-48]
	movss	dword ptr [esi],xmm0
	movss	xmm0,dword ptr [edi+20]
	addss	xmm0,dword ptr [ebp-44]
	movss	dword ptr [esi+4],xmm0
; end of inline function vec2f_add
	mov	edx,[ebp-148]
	inc	dword ptr [edx+192]
	mov	[ebp-140],ecx
	mov	[ebp-144],eax
	mov	[ebp-148],edx
label0004:
	mov	ecx,[ebp-140]
	add	ecx,24
	mov	eax,[ebp-144]
	add	eax,24
	mov	[ebp-140],ecx
	mov	[ebp-144],eax
	jmp	label0001
label0002:
	mov	edx,[ebp-148]
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
	add	esp,208
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
	movss	xmm7,dword ptr [___unnamed_float_1]
	movss	xmm6,dword ptr [edi+8]
	movss	xmm5,dword ptr [edi+4]
	movss	xmm4,dword ptr [edi]
	movss	dword ptr [ebp-16],xmm4
	movss	dword ptr [ebp-12],xmm5
	movss	dword ptr [ebp-8],xmm6
	movss	dword ptr [ebp-4],xmm7
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
	movss	xmm4,dword ptr [ebp-12]
	mulss	xmm4,dword ptr [__mvproj_matrix+16]
	movss	xmm5,dword ptr [ebp-16]
	mulss	xmm5,dword ptr [__mvproj_matrix]
	addss	xmm5,xmm4
	movss	xmm4,dword ptr [ebp-8]
	mulss	xmm4,dword ptr [__mvproj_matrix+32]
	addss	xmm5,xmm4
	movss	xmm4,dword ptr [ebp-4]
	mulss	xmm4,dword ptr [__mvproj_matrix+48]
	addss	xmm5,xmm4
	movss	dword ptr [esi],xmm5
	movss	xmm4,dword ptr [ebp-16]
	mulss	xmm4,dword ptr [__mvproj_matrix+4]
	movss	xmm5,dword ptr [ebp-12]
	mulss	xmm5,dword ptr [__mvproj_matrix+20]
	addss	xmm4,xmm5
	movss	xmm5,dword ptr [ebp-8]
	mulss	xmm5,dword ptr [__mvproj_matrix+36]
	addss	xmm4,xmm5
	movss	xmm5,dword ptr [ebp-4]
	mulss	xmm5,dword ptr [__mvproj_matrix+52]
	addss	xmm4,xmm5
	movss	dword ptr [esi+4],xmm4
	movss	xmm4,dword ptr [ebp-16]
	mulss	xmm4,dword ptr [__mvproj_matrix+8]
	movss	xmm5,dword ptr [ebp-12]
	mulss	xmm5,dword ptr [__mvproj_matrix+24]
	addss	xmm4,xmm5
	movss	xmm5,dword ptr [ebp-8]
	mulss	xmm5,dword ptr [__mvproj_matrix+40]
	addss	xmm4,xmm5
	movss	xmm5,dword ptr [ebp-4]
	mulss	xmm5,dword ptr [__mvproj_matrix+56]
	addss	xmm4,xmm5
	movss	dword ptr [esi+8],xmm4
	movss	xmm4,dword ptr [ebp-16]
	mulss	xmm4,dword ptr [__mvproj_matrix+12]
	movss	xmm5,dword ptr [ebp-12]
	mulss	xmm5,dword ptr [__mvproj_matrix+28]
	addss	xmm4,xmm5
	movss	xmm5,dword ptr [ebp-8]
	mulss	xmm5,dword ptr [__mvproj_matrix+44]
	addss	xmm4,xmm5
	movss	xmm5,dword ptr [ebp-4]
	mulss	xmm5,dword ptr [__mvproj_matrix+60]
	addss	xmm4,xmm5
	movss	dword ptr [esi+12],xmm4
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
	sub	esp,884
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+28]
	mov	esi,[ebp+24]
	mov	ebx,[ebp+20]
	mov	edx,[ebp+16]
	mov	ecx,[ebp+12]
	mov	eax,[ebp+8]
	mov	[ebp-708],ecx
	mov	[ebp-712],edx
	push	eax
	lea	eax,[ebp-196]
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	mov	edx,[ebp-712]
	mov	ecx,[ebp-708]
	lea	eax,[ebp-196]
	add	eax,16
	mov	[ebp-716],edi
	mov	edi,[ebx]
	mov	ebx,[ebx+4]
	mov	[eax],edi
	mov	[eax+4],ebx
	mov	[ebp-712],edx
	push	ecx
	lea	eax,[ebp-196]
	add	eax,24
	push	eax
	call	__transform_to_projection_space
	add	esp,8
	mov	edx,[ebp-712]
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
	mov	edi,[ebp-716]
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
	mov	[ebp-720],edi
	jne	label0000
	jmp	label0007
label0000:
	mov	edi,[ebp-720]
	cmp	dword ptr [edi+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	edi,0
	mov	[ebp-724],edi
label0003:
	mov	edi,[ebp-720]
	mov	eax,[edi+192]
	mov	[ebp-720],edi
	mov	edi,[ebp-724]
	cmp	eax,edi
	mov	[ebp-724],edi
	jle	label0004
; start of inline function _transform_to_screen_space
	mov	esi,[ebp-720]
	mov	edi,esi
	mov	[ebp-728],edi
	mov	edi,[ebp-724]
	mov	eax,edi
	imul	eax,24
	mov	[ebp-724],edi
	mov	edi,[ebp-728]
	add	edi,eax
	lea	eax,[ebp-332]
	mov	[ebp-728],edi
	mov	edi,[ebp-724]
	mov	ecx,edi
	sal	ecx,4
	add	eax,ecx
; start of inline function matrix4f_transform
	mov	[ebp-724],edi
	mov	edi,[ebp-728]
	mov	ecx,edi
	movss	xmm0,dword ptr [ecx+4]
	mulss	xmm0,dword ptr [__viewport_matrix+16]
	movss	xmm1,dword ptr [ecx]
	mulss	xmm1,dword ptr [__viewport_matrix]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [ecx+8]
	mulss	xmm0,dword ptr [__viewport_matrix+32]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [ecx+12]
	mulss	xmm0,dword ptr [__viewport_matrix+48]
	addss	xmm1,xmm0
	movss	dword ptr [ebp-688],xmm1
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [__viewport_matrix+4]
	movss	xmm1,dword ptr [ecx+4]
	mulss	xmm1,dword ptr [__viewport_matrix+20]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ecx+8]
	mulss	xmm1,dword ptr [__viewport_matrix+36]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ecx+12]
	mulss	xmm1,dword ptr [__viewport_matrix+52]
	addss	xmm0,xmm1
	movss	dword ptr [ebp-684],xmm0
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [__viewport_matrix+8]
	movss	xmm1,dword ptr [ecx+4]
	mulss	xmm1,dword ptr [__viewport_matrix+24]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ecx+8]
	mulss	xmm1,dword ptr [__viewport_matrix+40]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ecx+12]
	mulss	xmm1,dword ptr [__viewport_matrix+56]
	addss	xmm0,xmm1
	movss	dword ptr [ebp-680],xmm0
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,dword ptr [__viewport_matrix+12]
	movss	xmm1,dword ptr [ecx+4]
	mulss	xmm1,dword ptr [__viewport_matrix+28]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ecx+8]
	mulss	xmm1,dword ptr [__viewport_matrix+44]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ecx+12]
	mulss	xmm1,dword ptr [__viewport_matrix+60]
	addss	xmm0,xmm1
	movss	dword ptr [ebp-676],xmm0
; end of inline function matrix4f_transform
	lea	ecx,[ebp-688]
	add	ecx,12
	movss	xmm1,dword ptr [___unnamed_float_1]
	divss	xmm1,dword ptr [ecx]
	movss	xmm0,dword ptr [ebp-688]
	mulss	xmm0,xmm1
	cvttss2si	ecx,xmm0
	mov	[eax],ecx
	lea	ecx,[ebp-688]
	add	ecx,4
	movss	xmm0,dword ptr [ecx]
	mulss	xmm0,xmm1
	cvttss2si	ecx,xmm0
	mov	[eax+4],ecx
	cmp	dword ptr [eax],0
	mov	[ebp-732],eax
	jl	label002a
	mov	edi,[ebp-732]
	mov	eax,[edi]
	cmp	eax,dword ptr [__width]
	jge	label002a
	mov	edi,[ebp-732]
	cmp	dword ptr [edi+4],0
	jl	label002a
	mov	edi,[ebp-732]
	mov	eax,[edi+4]
	cmp	eax,dword ptr [__height]
	jl	label0029
label002a:
	mov	dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
	lea	eax,[ebp-332]
	mov	edi,[ebp-724]
	mov	ecx,edi
	sal	ecx,4
	add	eax,ecx
	add	eax,8
	mov	[ebp-724],edi
	mov	edi,[ebp-720]
	mov	ecx,edi
	mov	[ebp-720],edi
	mov	edi,[ebp-724]
	mov	edx,edi
	imul	edx,24
	add	ecx,edx
	add	ecx,16
	mov	edx,[ecx]
	mov	ecx,[ecx+4]
	mov	[eax],edx
	mov	[eax+4],ecx
	inc	edi
	mov	[ebp-724],edi
	jmp	label0003
label0004:
	mov	edi,2
	mov	[ebp-724],edi
label0006:
	mov	edi,[ebp-720]
	mov	eax,[edi+192]
	dec	eax
	mov	[ebp-720],edi
	mov	edi,[ebp-724]
	cmp	eax,edi
	mov	[ebp-724],edi
	jle	label0007
; start of inline function _rasterize_triangle_2i
	lea	edi,[ebp-332]
	mov	[ebp-736],edi
	mov	edi,[ebp-724]
	mov	eax,edi
	sal	eax,4
	mov	[ebp-724],edi
	mov	edi,[ebp-736]
	add	edi,eax
	mov	[ebp-736],edi
	mov	edi,[ebp-724]
	mov	eax,edi
	dec	eax
	sal	eax,4
	lea	esi,[ebp-332]
	add	esi,eax
	lea	eax,[ebp-332]
	mov	ecx,[eax+4]
	cmp	ecx,[esi+4]
	mov	[ebp-724],edi
	mov	[ebp-740],eax
	mov	[ebp-744],esi
	jle	label0008
	mov	eax,[ebp-740]
	mov	edi,eax
	mov	esi,[ebp-744]
	mov	eax,esi
	mov	esi,edi
	mov	[ebp-740],eax
	mov	[ebp-744],esi
label0008:
	mov	edi,[ebp-740]
	mov	eax,[edi+4]
	mov	edi,[ebp-736]
	cmp	eax,[edi+4]
	mov	[ebp-736],edi
	jle	label0009
	mov	eax,[ebp-740]
	mov	edi,eax
	mov	[ebp-748],edi
	mov	edi,[ebp-736]
	mov	eax,edi
	mov	esi,[ebp-748]
	mov	edi,esi
	mov	[ebp-740],eax
	mov	[ebp-736],edi
label0009:
	mov	esi,[ebp-744]
	mov	eax,[esi+4]
	mov	edi,[ebp-736]
	cmp	eax,[edi+4]
	mov	[ebp-744],esi
	mov	[ebp-736],edi
	jle	label000a
	mov	esi,[ebp-744]
	mov	edi,esi
	mov	[ebp-748],edi
	mov	edi,[ebp-736]
	mov	esi,edi
	mov	ebx,[ebp-748]
	mov	edi,ebx
	mov	[ebp-744],esi
	mov	[ebp-736],edi
label000a:
	mov	edi,[ebp-740]
	mov	eax,[edi+4]
	mov	edi,[ebp-736]
	cmp	eax,[edi+4]
	mov	[ebp-736],edi
	jne	label000b
	mov	edi,[ebp-740]
	cmp	dword ptr [edi+4],0
	jl	label000c
	mov	edi,[ebp-740]
	mov	eax,[edi+4]
	cmp	eax,dword ptr [__height]
	jge	label000c
; start of inline function _rasterize_triangle_1i
	movss	xmm7,dword ptr [___unnamed_float_2]
	movss	xmm6,dword ptr [___unnamed_float_2]
	mov	esi,[ebp-736]
	mov	edi,esi
	mov	ebx,[ebp-744]
	mov	esi,ebx
	mov	eax,[ebp-740]
	mov	ebx,eax
	mov	edx,[eax+4]
	mov	[ebp-752],edi
	mov	edi,[ebp-736]
	mov	ecx,[edi]
	mov	[ebp-756],esi
	mov	esi,[ebp-744]
	mov	edi,[esi]
	mov	esi,[eax]
	cmp	esi,edi
	mov	[ebp-760],esi
	mov	[ebp-764],edi
	mov	[ebp-768],ecx
	mov	[ebp-772],edx
	mov	[ebp-776],ebx
	movss	dword ptr [ebp-820],xmm6
	movss	dword ptr [ebp-824],xmm7
	jge	label001c
	mov	ecx,[ebp-768]
	mov	edi,[ebp-764]
	cmp	ecx,edi
	mov	[ebp-764],edi
	mov	[ebp-768],ecx
	jle	label001d
	movss	xmm7,dword ptr [ebp-824]
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	xmm6,dword ptr [ebp-820]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	mov	edi,[ebp-776]
	push	dword ptr [edi+12]
	mov	edi,[ebp-776]
	push	dword ptr [edi+8]
	mov	edx,[ebp-772]
	push	edx
	mov	ecx,[ebp-768]
	push	ecx
	mov	esi,[ebp-760]
	push	esi
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0020
label001d:
	mov	ecx,[ebp-768]
	mov	esi,[ebp-760]
	cmp	ecx,esi
	mov	[ebp-760],esi
	mov	[ebp-768],ecx
	jge	label001f
	movss	xmm7,dword ptr [ebp-824]
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	xmm6,dword ptr [ebp-820]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	mov	edi,[ebp-752]
	push	dword ptr [edi+12]
	mov	edi,[ebp-752]
	push	dword ptr [edi+8]
	mov	edx,[ebp-772]
	push	edx
	mov	edi,[ebp-764]
	push	edi
	mov	ecx,[ebp-768]
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0020
label001f:
	movss	xmm7,dword ptr [ebp-824]
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	xmm6,dword ptr [ebp-820]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	mov	edi,[ebp-776]
	push	dword ptr [edi+12]
	mov	edi,[ebp-776]
	push	dword ptr [edi+8]
	mov	edx,[ebp-772]
	push	edx
	mov	edi,[ebp-764]
	push	edi
	mov	esi,[ebp-760]
	push	esi
	call	__rasterize_horiz_line
	add	esp,28
label0020:
	jmp	label0025
label001c:
	mov	ecx,[ebp-768]
	mov	edi,[ebp-764]
	cmp	ecx,edi
	mov	[ebp-764],edi
	mov	[ebp-768],ecx
	jge	label0022
	movss	xmm7,dword ptr [ebp-824]
	movss	xmm0,xmm7
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm6,dword ptr [ebp-820]
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	edi,[ebp-752]
	push	dword ptr [edi+12]
	mov	edi,[ebp-752]
	push	dword ptr [edi+8]
	mov	edx,[ebp-772]
	push	edx
	mov	esi,[ebp-760]
	push	esi
	mov	ecx,[ebp-768]
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0025
label0022:
	mov	ecx,[ebp-768]
	mov	esi,[ebp-760]
	cmp	ecx,esi
	mov	[ebp-760],esi
	mov	[ebp-768],ecx
	jle	label0024
	movss	xmm7,dword ptr [ebp-824]
	movss	xmm0,xmm7
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm6,dword ptr [ebp-820]
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	edi,[ebp-756]
	push	dword ptr [edi+12]
	mov	edi,[ebp-756]
	push	dword ptr [edi+8]
	mov	edx,[ebp-772]
	push	edx
	mov	ecx,[ebp-768]
	push	ecx
	mov	edi,[ebp-764]
	push	edi
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0025
label0024:
	movss	xmm7,dword ptr [ebp-824]
	movss	xmm0,xmm7
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm6,dword ptr [ebp-820]
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	edi,[ebp-756]
	push	dword ptr [edi+12]
	mov	edi,[ebp-756]
	push	dword ptr [edi+8]
	mov	edx,[ebp-772]
	push	edx
	mov	esi,[ebp-760]
	push	esi
	mov	edi,[ebp-764]
	push	edi
	call	__rasterize_horiz_line
	add	esp,28
label0025:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label0012
label000b:
	mov	eax,[ebp-740]
	mov	edi,[eax+4]
	mov	[ebp-740],eax
	mov	[ebp-780],edi
label000e:
	mov	esi,[ebp-744]
	mov	eax,[esi+4]
	mov	edi,[ebp-780]
	cmp	eax,edi
	mov	[ebp-744],esi
	mov	[ebp-780],edi
	jle	label000f
	mov	edi,[ebp-780]
	mov	eax,edi
	mov	esi,[ebp-740]
	sub	eax,[esi+4]
	mov	esi,[ebp-744]
	mov	ecx,[esi]
	mov	[ebp-784],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax]
	mov	[ebp-740],eax
	mov	eax,[ebp-784]
	imul	eax,ecx
	mov	ecx,[esi+4]
	mov	[ebp-784],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax+4]
	mov	[ebp-740],eax
	mov	eax,[ebp-784]
	cdq
	idiv	ecx
	mov	edx,[ebp-740]
	add	eax,[edx]
	mov	[ebp-784],eax
	mov	eax,edi
	mov	ecx,[ebp-740]
	sub	eax,[ecx+4]
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	mov	ecx,[edi]
	mov	[ebp-788],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax]
	mov	[ebp-740],eax
	mov	eax,[ebp-788]
	imul	eax,ecx
	mov	ecx,[edi+4]
	mov	[ebp-788],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax+4]
	mov	[ebp-740],eax
	mov	eax,[ebp-788]
	cdq
	idiv	ecx
	mov	edx,[ebp-740]
	add	eax,[edx]
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	ecx,edi
	mov	[ebp-788],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm7,ecx
	movss	xmm0,dword ptr [esi+8]
	subss	xmm0,dword ptr [eax+8]
	mulss	xmm7,xmm0
	mov	ecx,[esi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm0,ecx
	divss	xmm7,xmm0
	addss	xmm7,dword ptr [eax+8]
	mov	ecx,edi
	sub	ecx,[eax+4]
	cvtsi2ss	xmm0,ecx
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	movss	xmm1,dword ptr [edi+8]
	subss	xmm1,dword ptr [eax+8]
	mulss	xmm0,xmm1
	mov	ecx,[edi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm1,ecx
	divss	xmm0,xmm1
	addss	xmm0,dword ptr [eax+8]
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	ecx,edi
	sub	ecx,[eax+4]
	cvtsi2ss	xmm1,ecx
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	mov	edx,8
	add	edx,eax
	add	edx,4
	movss	xmm2,dword ptr [ecx]
	subss	xmm2,dword ptr [edx]
	mulss	xmm1,xmm2
	mov	ecx,[esi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm2,ecx
	divss	xmm1,xmm2
	mov	ecx,8
	add	ecx,eax
	add	ecx,4
	addss	xmm1,dword ptr [ecx]
	mov	ecx,edi
	sub	ecx,[eax+4]
	cvtsi2ss	xmm2,ecx
	mov	ecx,8
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	add	ecx,edi
	add	ecx,4
	mov	edx,8
	add	edx,eax
	add	edx,4
	movss	xmm3,dword ptr [ecx]
	subss	xmm3,dword ptr [edx]
	mulss	xmm2,xmm3
	mov	ecx,[edi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm3,ecx
	divss	xmm2,xmm3
	mov	ecx,8
	add	ecx,eax
	add	ecx,4
	addss	xmm2,dword ptr [ecx]
	mov	[ebp-740],eax
	mov	eax,[ebp-788]
	mov	ecx,eax
	mov	[ebp-788],eax
	mov	eax,[ebp-784]
	sub	ecx,eax
	cvtsi2ss	xmm3,ecx
	movss	xmm6,xmm0
	subss	xmm6,xmm7
	divss	xmm6,xmm3
	mov	[ebp-784],eax
	mov	eax,[ebp-788]
	mov	ecx,eax
	mov	[ebp-788],eax
	mov	eax,[ebp-784]
	sub	ecx,eax
	cvtsi2ss	xmm3,ecx
	movss	xmm5,xmm2
	subss	xmm5,xmm1
	divss	xmm5,xmm3
; start of inline function _rasterize_horiz_line__unordered
	movss	xmm3,xmm2
	movss	xmm2,xmm0
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	edx,edi
	mov	[ebp-784],eax
	mov	eax,[ebp-788]
	mov	ecx,eax
	mov	ebx,[ebp-784]
	mov	eax,ebx
	cmp	eax,ecx
	mov	[ebp-744],esi
	mov	[ebp-780],edi
	mov	[ebp-792],eax
	mov	[ebp-796],ecx
	mov	[ebp-800],edx
	movss	dword ptr [ebp-828],xmm7
	movss	dword ptr [ebp-832],xmm1
	movss	dword ptr [ebp-836],xmm2
	movss	dword ptr [ebp-840],xmm3
	movss	dword ptr [ebp-844],xmm6
	movss	dword ptr [ebp-848],xmm5
	jg	label0013
	movss	xmm5,dword ptr [ebp-848]
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	xmm6,dword ptr [ebp-844]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm1,dword ptr [ebp-832]
	movss	dword ptr [esp-4],xmm1
	sub	esp,4
	movss	xmm7,dword ptr [ebp-828]
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	mov	edx,[ebp-800]
	push	edx
	mov	ecx,[ebp-796]
	push	ecx
	mov	eax,[ebp-792]
	push	eax
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0014
label0013:
	movss	xmm5,dword ptr [ebp-848]
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	xmm6,dword ptr [ebp-844]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm3,dword ptr [ebp-840]
	movss	dword ptr [esp-4],xmm3
	sub	esp,4
	movss	xmm2,dword ptr [ebp-836]
	movss	dword ptr [esp-4],xmm2
	sub	esp,4
	mov	edx,[ebp-800]
	push	edx
	mov	eax,[ebp-792]
	push	eax
	mov	ecx,[ebp-796]
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
	mov	edi,[ebp-780]
	inc	edi
	mov	[ebp-780],edi
	jmp	label000e
label000f:
	mov	esi,[ebp-744]
	mov	eax,[esi+4]
	mov	edi,[ebp-740]
	sub	eax,[edi+4]
	mov	edi,[ebp-736]
	mov	ecx,[edi]
	mov	[ebp-804],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax]
	mov	[ebp-740],eax
	mov	eax,[ebp-804]
	imul	eax,ecx
	mov	ecx,[edi+4]
	mov	[ebp-804],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax+4]
	mov	[ebp-740],eax
	mov	eax,[ebp-804]
	cdq
	idiv	ecx
	mov	edx,[ebp-740]
	add	eax,[edx]
	mov	[ebp-804],eax
	mov	ecx,[ebp-804]
	mov	eax,ecx
	mov	ecx,[esi+4]
	mov	[ebp-788],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm0,ecx
	movss	xmm1,dword ptr [edi+8]
	subss	xmm1,dword ptr [eax+8]
	mulss	xmm0,xmm1
	mov	ecx,[edi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm1,ecx
	divss	xmm0,xmm1
	addss	xmm0,dword ptr [eax+8]
	movss	dword ptr [ebp-852],xmm0
	movss	xmm1,dword ptr [ebp-852]
	movss	xmm0,xmm1
	mov	ecx,[esi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm1,ecx
	mov	ecx,8
	add	ecx,edi
	add	ecx,4
	mov	edx,8
	add	edx,eax
	add	edx,4
	movss	xmm2,dword ptr [ecx]
	subss	xmm2,dword ptr [edx]
	mulss	xmm1,xmm2
	mov	ecx,[edi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm2,ecx
	divss	xmm1,xmm2
	mov	ecx,8
	add	ecx,eax
	add	ecx,4
	addss	xmm1,dword ptr [ecx]
	movss	xmm2,xmm1
	movss	xmm1,xmm0
	subss	xmm1,dword ptr [esi+8]
	mov	[ebp-740],eax
	mov	eax,[ebp-788]
	mov	ecx,eax
	sub	ecx,[esi]
	cvtsi2ss	xmm3,ecx
	divss	xmm1,xmm3
	movss	xmm6,xmm1
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	movss	xmm1,xmm2
	subss	xmm1,dword ptr [ecx]
	mov	ecx,eax
	sub	ecx,[esi]
	cvtsi2ss	xmm3,ecx
	divss	xmm1,xmm3
	movss	xmm5,xmm1
; start of inline function _rasterize_horiz_line__unordered
	movss	dword ptr [ebp-856],xmm5
	movss	xmm3,dword ptr [ebp-856]
	movss	xmm5,xmm3
	movss	dword ptr [ebp-860],xmm6
	movss	xmm1,dword ptr [ebp-860]
	movss	xmm6,xmm1
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	movss	xmm3,dword ptr [ecx]
	movss	dword ptr [ebp-864],xmm2
	movss	xmm2,dword ptr [esi+8]
	movss	dword ptr [ebp-836],xmm2
	movss	xmm2,dword ptr [ebp-864]
	movss	xmm1,xmm2
	movss	xmm7,xmm0
	mov	ecx,[esi+4]
	mov	edx,ecx
	mov	ecx,[esi]
	mov	[ebp-808],ecx
	mov	ebx,[ebp-808]
	mov	ecx,ebx
	mov	[ebp-788],eax
	mov	ebx,[ebp-788]
	mov	eax,ebx
	cmp	eax,ecx
	mov	[ebp-744],esi
	mov	[ebp-736],edi
	mov	[ebp-792],eax
	mov	[ebp-796],ecx
	mov	[ebp-800],edx
	movss	dword ptr [ebp-828],xmm7
	movss	dword ptr [ebp-832],xmm1
	movss	dword ptr [ebp-840],xmm3
	movss	dword ptr [ebp-844],xmm6
	movss	dword ptr [ebp-848],xmm5
	jg	label0016
	movss	xmm5,dword ptr [ebp-848]
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	xmm6,dword ptr [ebp-844]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm1,dword ptr [ebp-832]
	movss	dword ptr [esp-4],xmm1
	sub	esp,4
	movss	xmm7,dword ptr [ebp-828]
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	mov	edx,[ebp-800]
	push	edx
	mov	ecx,[ebp-796]
	push	ecx
	mov	eax,[ebp-792]
	push	eax
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0017
label0016:
	movss	xmm5,dword ptr [ebp-848]
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	xmm6,dword ptr [ebp-844]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm3,dword ptr [ebp-840]
	movss	dword ptr [esp-4],xmm3
	sub	esp,4
	movss	xmm2,dword ptr [ebp-836]
	movss	dword ptr [esp-4],xmm2
	sub	esp,4
	mov	edx,[ebp-800]
	push	edx
	mov	eax,[ebp-792]
	push	eax
	mov	ecx,[ebp-796]
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
	mov	eax,1
	mov	esi,[ebp-744]
	add	eax,[esi+4]
	mov	edi,eax
	mov	[ebp-744],esi
	mov	[ebp-780],edi
label0011:
	mov	edi,[ebp-736]
	mov	eax,[edi+4]
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	cmp	eax,edi
	mov	[ebp-780],edi
	jle	label0012
	mov	edi,[ebp-780]
	mov	eax,edi
	mov	esi,[ebp-744]
	sub	eax,[esi+4]
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	mov	ecx,[edi]
	sub	ecx,[esi]
	imul	eax,ecx
	mov	ecx,[edi+4]
	sub	ecx,[esi+4]
	cdq
	idiv	ecx
	add	eax,[esi]
	mov	[ebp-812],eax
	mov	ecx,[ebp-812]
	mov	eax,ecx
	mov	[ebp-784],eax
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	eax,edi
	mov	edx,[ebp-740]
	sub	eax,[edx+4]
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	mov	ecx,[edi]
	mov	[ebp-816],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax]
	mov	[ebp-740],eax
	mov	eax,[ebp-816]
	imul	eax,ecx
	mov	ecx,[edi+4]
	mov	[ebp-816],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax+4]
	mov	[ebp-740],eax
	mov	eax,[ebp-816]
	cdq
	idiv	ecx
	mov	edx,[ebp-740]
	add	eax,[edx]
	mov	[ebp-816],eax
	mov	ecx,[ebp-816]
	mov	eax,ecx
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	ecx,edi
	sub	ecx,[esi+4]
	cvtsi2ss	xmm0,ecx
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	movss	xmm1,dword ptr [edi+8]
	subss	xmm1,dword ptr [esi+8]
	mulss	xmm0,xmm1
	mov	ecx,[edi+4]
	sub	ecx,[esi+4]
	cvtsi2ss	xmm1,ecx
	divss	xmm0,xmm1
	addss	xmm0,dword ptr [esi+8]
	movss	xmm7,xmm0
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	ecx,edi
	mov	[ebp-788],eax
	mov	eax,[ebp-740]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm0,ecx
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	movss	xmm1,dword ptr [edi+8]
	subss	xmm1,dword ptr [eax+8]
	mulss	xmm0,xmm1
	mov	ecx,[edi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm1,ecx
	divss	xmm0,xmm1
	addss	xmm0,dword ptr [eax+8]
	movss	dword ptr [ebp-868],xmm0
	movss	xmm1,dword ptr [ebp-868]
	movss	xmm0,xmm1
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	ecx,edi
	sub	ecx,[esi+4]
	cvtsi2ss	xmm1,ecx
	mov	ecx,8
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	add	ecx,edi
	add	ecx,4
	mov	edx,8
	add	edx,esi
	add	edx,4
	movss	xmm2,dword ptr [ecx]
	subss	xmm2,dword ptr [edx]
	mulss	xmm1,xmm2
	mov	ecx,[edi+4]
	sub	ecx,[esi+4]
	cvtsi2ss	xmm2,ecx
	divss	xmm1,xmm2
	mov	ecx,8
	add	ecx,esi
	add	ecx,4
	addss	xmm1,dword ptr [ecx]
	movss	dword ptr [ebp-872],xmm1
	movss	xmm2,dword ptr [ebp-872]
	movss	xmm1,xmm2
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	ecx,edi
	sub	ecx,[eax+4]
	cvtsi2ss	xmm2,ecx
	mov	ecx,8
	mov	[ebp-780],edi
	mov	edi,[ebp-736]
	add	ecx,edi
	add	ecx,4
	mov	edx,8
	add	edx,eax
	add	edx,4
	movss	xmm3,dword ptr [ecx]
	subss	xmm3,dword ptr [edx]
	mulss	xmm2,xmm3
	mov	ecx,[edi+4]
	sub	ecx,[eax+4]
	cvtsi2ss	xmm3,ecx
	divss	xmm2,xmm3
	mov	ecx,8
	add	ecx,eax
	add	ecx,4
	addss	xmm2,dword ptr [ecx]
	movss	dword ptr [ebp-876],xmm2
	movss	xmm3,dword ptr [ebp-876]
	movss	xmm2,xmm3
	mov	[ebp-740],eax
	mov	eax,[ebp-788]
	mov	ecx,eax
	mov	[ebp-788],eax
	mov	eax,[ebp-784]
	sub	ecx,eax
	cvtsi2ss	xmm3,ecx
	movss	xmm4,xmm0
	subss	xmm4,xmm7
	divss	xmm4,xmm3
	movss	xmm6,xmm4
	mov	[ebp-784],eax
	mov	eax,[ebp-788]
	mov	ecx,eax
	mov	[ebp-788],eax
	mov	eax,[ebp-784]
	sub	ecx,eax
	cvtsi2ss	xmm3,ecx
	movss	xmm4,xmm2
	subss	xmm4,xmm1
	divss	xmm4,xmm3
	movss	xmm5,xmm4
; start of inline function _rasterize_horiz_line__unordered
	movss	dword ptr [ebp-856],xmm5
	movss	xmm4,dword ptr [ebp-856]
	movss	xmm5,xmm4
	movss	dword ptr [ebp-860],xmm6
	movss	xmm3,dword ptr [ebp-860]
	movss	xmm6,xmm3
	movss	xmm3,xmm2
	movss	xmm2,xmm0
	movss	dword ptr [ebp-880],xmm1
	movss	xmm0,dword ptr [ebp-880]
	movss	xmm1,xmm0
	movss	dword ptr [ebp-884],xmm7
	movss	xmm4,dword ptr [ebp-884]
	movss	xmm7,xmm4
	mov	[ebp-736],edi
	mov	edi,[ebp-780]
	mov	edx,edi
	mov	[ebp-784],eax
	mov	eax,[ebp-788]
	mov	ecx,eax
	mov	ebx,[ebp-784]
	mov	eax,ebx
	cmp	eax,ecx
	mov	[ebp-744],esi
	mov	[ebp-780],edi
	mov	[ebp-792],eax
	mov	[ebp-796],ecx
	mov	[ebp-800],edx
	movss	dword ptr [ebp-828],xmm7
	movss	dword ptr [ebp-832],xmm1
	movss	dword ptr [ebp-836],xmm2
	movss	dword ptr [ebp-840],xmm3
	movss	dword ptr [ebp-844],xmm6
	movss	dword ptr [ebp-848],xmm5
	jg	label0019
	movss	xmm5,dword ptr [ebp-848]
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	xmm6,dword ptr [ebp-844]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm1,dword ptr [ebp-832]
	movss	dword ptr [esp-4],xmm1
	sub	esp,4
	movss	xmm7,dword ptr [ebp-828]
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	mov	edx,[ebp-800]
	push	edx
	mov	ecx,[ebp-796]
	push	ecx
	mov	eax,[ebp-792]
	push	eax
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label001a
label0019:
	movss	xmm5,dword ptr [ebp-848]
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	xmm6,dword ptr [ebp-844]
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm3,dword ptr [ebp-840]
	movss	dword ptr [esp-4],xmm3
	sub	esp,4
	movss	xmm2,dword ptr [ebp-836]
	movss	dword ptr [esp-4],xmm2
	sub	esp,4
	mov	edx,[ebp-800]
	push	edx
	mov	eax,[ebp-792]
	push	eax
	mov	ecx,[ebp-796]
	push	ecx
	call	__rasterize_horiz_line
	add	esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
	mov	edi,[ebp-780]
	inc	edi
	mov	[ebp-780],edi
	jmp	label0011
label0012:
; end of inline function _rasterize_triangle_2i
	mov	edi,[ebp-724]
	inc	edi
	mov	[ebp-724],edi
	jmp	label0006
label0007:
; end of inline function _rasterize_polygon_4f
	pop	ebx
	pop	esi
	pop	edi
	add	esp,884
	pop	ebp
	ret
_rasterizer_triangle3f endp	

end
