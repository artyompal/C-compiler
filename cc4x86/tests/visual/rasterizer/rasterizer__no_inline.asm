
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

_vec2f_add proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	movss	xmm0,dword ptr [esi]
	addss	xmm0,dword ptr [edi]
	movss	dword ptr [ebx],xmm0
	movss	xmm0,dword ptr [esi+4]
	addss	xmm0,dword ptr [edi+4]
	movss	dword ptr [ebx+4],xmm0
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
	movss	xmm0,dword ptr [esi]
	subss	xmm0,dword ptr [edi]
	movss	dword ptr [ebx],xmm0
	movss	xmm0,dword ptr [esi+4]
	subss	xmm0,dword ptr [edi+4]
	movss	dword ptr [ebx+4],xmm0
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
	movss	xmm7,dword ptr [ebp+12]
	mov	edi,[ebp+8]
	movss	xmm0,dword ptr [edi]
	mulss	xmm0,xmm7
	movss	dword ptr [edi],xmm0
	movss	xmm0,dword ptr [edi+4]
	mulss	xmm0,xmm7
	movss	dword ptr [edi+4],xmm0
	pop	edi
	pop	ebp
	ret
_vec2f_mul endp	

_vec4f_assign proc
	push	ebp
	mov	ebp,esp
	push	edi
	mov	edi,[ebp+8]
	movss	xmm0,dword ptr [ebp+12]
	movss	dword ptr [edi],xmm0
	movss	xmm0,dword ptr [ebp+16]
	movss	dword ptr [edi+4],xmm0
	movss	xmm0,dword ptr [ebp+20]
	movss	dword ptr [edi+8],xmm0
	movss	xmm0,dword ptr [ebp+24]
	movss	dword ptr [edi+12],xmm0
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
	movss	xmm0,dword ptr [esi]
	addss	xmm0,dword ptr [edi]
	movss	dword ptr [ebx],xmm0
	movss	xmm0,dword ptr [esi+4]
	addss	xmm0,dword ptr [edi+4]
	movss	dword ptr [ebx+4],xmm0
	movss	xmm0,dword ptr [esi+8]
	addss	xmm0,dword ptr [edi+8]
	movss	dword ptr [ebx+8],xmm0
	movss	xmm0,dword ptr [esi+12]
	addss	xmm0,dword ptr [edi+12]
	movss	dword ptr [ebx+12],xmm0
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
	movss	xmm0,dword ptr [esi]
	subss	xmm0,dword ptr [edi]
	movss	dword ptr [ebx],xmm0
	movss	xmm0,dword ptr [esi+4]
	subss	xmm0,dword ptr [edi+4]
	movss	dword ptr [ebx+4],xmm0
	movss	xmm0,dword ptr [esi+8]
	subss	xmm0,dword ptr [edi+8]
	movss	dword ptr [ebx+8],xmm0
	movss	xmm0,dword ptr [esi+12]
	subss	xmm0,dword ptr [edi+12]
	movss	dword ptr [ebx+12],xmm0
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
	movss	xmm0,dword ptr [esi+4]
	mulss	xmm0,dword ptr [edi+4]
	movss	xmm1,dword ptr [esi]
	mulss	xmm1,dword ptr [edi]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [esi+8]
	mulss	xmm0,dword ptr [edi+8]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [esi+12]
	mulss	xmm0,dword ptr [edi+12]
	addss	xmm1,xmm0
	movss	xmm0,xmm1
	pop	esi
	pop	edi
	pop	ebp
	ret
_vec4f_dot endp	

_vec4f_mul proc
	push	ebp
	mov	ebp,esp
	push	edi
	movss	xmm7,dword ptr [ebp+12]
	mov	edi,[ebp+8]
	movss	xmm0,dword ptr [edi]
	mulss	xmm0,xmm7
	movss	dword ptr [edi],xmm0
	movss	xmm0,dword ptr [edi+4]
	mulss	xmm0,xmm7
	movss	dword ptr [edi+4],xmm0
	movss	xmm0,dword ptr [edi+8]
	mulss	xmm0,xmm7
	movss	dword ptr [edi+8],xmm0
	movss	xmm0,dword ptr [edi+12]
	mulss	xmm0,xmm7
	movss	dword ptr [edi+12],xmm0
	pop	edi
	pop	ebp
	ret
_vec4f_mul endp	

_matrix4f_make_perspective proc
	push	ebp
	mov	ebp,esp
	sub	esp,8
	push	edi
	movss	xmm7,dword ptr [ebp+16]
	movss	xmm6,dword ptr [ebp+12]
	mov	edi,[ebp+8]
	movss	xmm5,dword ptr [ebp+20]
	mulss	xmm5,xmm6
	movss	xmm4,xmm5
	mulss	xmm4,dword ptr [ebp+24]
	movss	xmm0,xmm6
	divss	xmm0,xmm4
	movss	dword ptr [edi],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+4],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+8],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+16],xmm0
	movss	xmm0,xmm6
	divss	xmm0,xmm5
	movss	dword ptr [edi+20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+24],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+28],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+32],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+36],xmm0
	movss	xmm0,xmm7
	subss	xmm0,xmm6
	movss	xmm1,xmm7
	divss	xmm1,xmm0
	movss	dword ptr [edi+40],xmm1
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [edi+44],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+48],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+52],xmm0
	movss	xmm0,xmm6
	mulss	xmm0,xmm7
	movss	xmm1,xmm6
	subss	xmm1,xmm7
	divss	xmm0,xmm1
	movss	dword ptr [edi+56],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+60],xmm0
	pop	edi
	add	esp,8
	pop	ebp
	ret
_matrix4f_make_perspective endp	

_matrix4f_make_viewport proc
	push	ebp
	mov	ebp,esp
	push	edi
	movss	xmm7,dword ptr [ebp+20]
	movss	xmm6,dword ptr [ebp+16]
	movss	xmm5,dword ptr [ebp+12]
	mov	edi,[ebp+8]
	movss	xmm0,xmm5
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [edi],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+4],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+8],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+12],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+16],xmm0
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_4]
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [edi+20],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+24],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+28],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+32],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+36],xmm0
	movss	xmm0,dword ptr [ebp+24]
	subss	xmm0,xmm7
	movss	dword ptr [edi+40],xmm0
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [edi+44],xmm0
	movss	xmm0,xmm5
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [edi+48],xmm0
	movss	xmm0,xmm6
	divss	xmm0,dword ptr [___unnamed_float_3]
	movss	dword ptr [edi+52],xmm0
	movss	dword ptr [edi+56],xmm7
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [edi+60],xmm0
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
	movss	xmm0,dword ptr [ebx+4]
	mulss	xmm0,dword ptr [esi+16]
	movss	xmm1,dword ptr [ebx]
	mulss	xmm1,dword ptr [esi]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [ebx+8]
	mulss	xmm0,dword ptr [esi+32]
	addss	xmm1,xmm0
	movss	xmm0,dword ptr [ebx+12]
	mulss	xmm0,dword ptr [esi+48]
	addss	xmm1,xmm0
	movss	dword ptr [edi],xmm1
	movss	xmm0,dword ptr [ebx]
	mulss	xmm0,dword ptr [esi+4]
	movss	xmm1,dword ptr [ebx+4]
	mulss	xmm1,dword ptr [esi+20]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ebx+8]
	mulss	xmm1,dword ptr [esi+36]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ebx+12]
	mulss	xmm1,dword ptr [esi+52]
	addss	xmm0,xmm1
	movss	dword ptr [edi+4],xmm0
	movss	xmm0,dword ptr [ebx]
	mulss	xmm0,dword ptr [esi+8]
	movss	xmm1,dword ptr [ebx+4]
	mulss	xmm1,dword ptr [esi+24]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ebx+8]
	mulss	xmm1,dword ptr [esi+40]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ebx+12]
	mulss	xmm1,dword ptr [esi+56]
	addss	xmm0,xmm1
	movss	dword ptr [edi+8],xmm0
	movss	xmm0,dword ptr [ebx]
	mulss	xmm0,dword ptr [esi+12]
	movss	xmm1,dword ptr [ebx+4]
	mulss	xmm1,dword ptr [esi+28]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ebx+8]
	mulss	xmm1,dword ptr [esi+44]
	addss	xmm0,xmm1
	movss	xmm1,dword ptr [ebx+12]
	mulss	xmm1,dword ptr [esi+60]
	addss	xmm0,xmm1
	movss	dword ptr [edi+12],xmm0
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
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [ebp+32]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	lea	eax,dword ptr [__mvproj_matrix]
	push	eax
	call	_matrix4f_make_perspective
	add	esp,20
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	cvtsi2ss	xmm0,dword ptr [ebp+16]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	cvtsi2ss	xmm0,dword ptr [ebp+12]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__viewport_matrix]
	push	eax
	call	_matrix4f_make_viewport
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_z_near_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,xmm7
	comiss	xmm0,xmm6
	jbe	label0000
	movss	xmm5,dword ptr [___unnamed_float_1]
	jmp	label0001
label0000:
	movss	xmm5,dword ptr [___unnamed_float_5]
label0001:
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_z_near_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_z_far_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,xmm7
	comiss	xmm0,xmm6
	jbe	label0002
	movss	xmm4,dword ptr [___unnamed_float_5]
	jmp	label0003
label0002:
	movss	xmm4,dword ptr [___unnamed_float_1]
label0003:
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	dword ptr [esp-4],xmm4
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_z_far_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	cvtsi2ss	xmm0,dword ptr [ebp+12]
	movss	xmm1,dword ptr [___unnamed_float_1]
	divss	xmm1,xmm0
	movss	xmm0,dword ptr [___unnamed_float_5]
	addss	xmm0,xmm1
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_left_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_left_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	cvtsi2ss	xmm0,dword ptr [ebp+12]
	movss	xmm1,dword ptr [___unnamed_float_1]
	divss	xmm1,xmm0
	movss	xmm0,dword ptr [___unnamed_float_1]
	subss	xmm0,xmm1
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_right_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_5]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_right_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	cvtsi2ss	xmm0,dword ptr [ebp+16]
	movss	xmm1,dword ptr [___unnamed_float_1]
	divss	xmm1,xmm0
	movss	xmm0,dword ptr [___unnamed_float_5]
	addss	xmm0,xmm1
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_top_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_top_norm]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	lea	eax,dword ptr [__clip_plane_bottom_base]
	push	eax
	call	_vec4f_assign
	add	esp,20
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_5]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
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
	sub	esp,8
	push	edi
	push	esi
	mov	eax,dword ptr [__texture_width]
	dec	eax
	cvtsi2ss	xmm0,eax
	mulss	xmm0,dword ptr [ebp+8]
	cvttss2si	edi,xmm0
	mov	eax,dword ptr [__texture_height]
	dec	eax
	cvtsi2ss	xmm0,eax
	mulss	xmm0,dword ptr [ebp+12]
	cvttss2si	esi,xmm0
	mov	eax,esi
	imul	eax,dword ptr [__texture_width]
	add	eax,edi
	sal	eax,2
	add	eax,dword ptr [__texture_data]
	mov	eax,[eax]
	pop	esi
	pop	edi
	add	esp,8
	pop	ebp
	ret
__tex2d endp	

__rasterize_horiz_line proc
	push	ebp
	mov	ebp,esp
	sub	esp,44
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
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	call	__tex2d
	add	esp,8
	mov	edx,eax
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
	add	esp,44
	pop	ebp
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	push	ebp
	mov	ebp,esp
	push	edi
	push	esi
	push	ebx
	movss	xmm7,dword ptr [ebp+40]
	movss	xmm6,dword ptr [ebp+36]
	mov	edi,[ebp+16]
	mov	esi,[ebp+12]
	mov	ebx,[ebp+8]
	cmp	ebx,esi
	jg	label0000
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm0,dword ptr [ebp+24]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [ebp+20]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	push	edi
	push	esi
	push	ebx
	call	__rasterize_horiz_line
	add	esp,28
	jmp	label0001
label0000:
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm0,dword ptr [ebp+32]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [ebp+28]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
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
	movss	xmm7,dword ptr [ebp+40]
	movss	xmm6,dword ptr [ebp+36]
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
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm0,dword ptr [edi+4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [edi]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
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
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	mov	eax,[ebp+32]
	movss	xmm0,dword ptr [eax+4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	eax,[ebp+32]
	movss	xmm0,dword ptr [eax]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
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
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	xmm0,dword ptr [edi+4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [edi]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
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
	movss	xmm0,xmm7
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	eax,[ebp+32]
	movss	xmm0,dword ptr [eax+4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	eax,[ebp+32]
	movss	xmm0,dword ptr [eax]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
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
	movss	xmm0,xmm7
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	eax,[ebp+28]
	movss	xmm0,dword ptr [eax+4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	eax,[ebp+28]
	movss	xmm0,dword ptr [eax]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
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
	movss	xmm0,xmm7
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,xmm6
	xorps	xmm0,dword ptr [___unnamed_float_4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	eax,[ebp+28]
	movss	xmm0,dword ptr [eax+4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	eax,[ebp+28]
	movss	xmm0,dword ptr [eax]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
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
	sub	esp,40
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
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [___unnamed_float_2]
	movss	dword ptr [esp-4],xmm0
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
	add	esp,40
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
	cvtsi2ss	xmm7,ecx
	mov	eax,[ebp+12]
	mov	ecx,[ebp+8]
	movss	xmm0,dword ptr [eax+8]
	subss	xmm0,dword ptr [ecx+8]
	mulss	xmm7,xmm0
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm0,edx
	divss	xmm7,xmm0
	mov	eax,[ebp+8]
	addss	xmm7,dword ptr [eax+8]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	cvtsi2ss	xmm6,ecx
	mov	eax,[ebp+16]
	mov	ecx,[ebp+8]
	movss	xmm0,dword ptr [eax+8]
	subss	xmm0,dword ptr [ecx+8]
	mulss	xmm6,xmm0
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm0,edx
	divss	xmm6,xmm0
	mov	eax,[ebp+8]
	addss	xmm6,dword ptr [eax+8]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	cvtsi2ss	xmm5,ecx
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+8]
	add	ecx,4
	movss	xmm0,dword ptr [eax]
	subss	xmm0,dword ptr [ecx]
	mulss	xmm5,xmm0
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm0,edx
	divss	xmm5,xmm0
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	addss	xmm5,dword ptr [eax]
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	cvtsi2ss	xmm4,ecx
	mov	eax,8
	add	eax,[ebp+16]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+8]
	add	ecx,4
	movss	xmm0,dword ptr [eax]
	subss	xmm0,dword ptr [ecx]
	mulss	xmm4,xmm0
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm0,edx
	divss	xmm4,xmm0
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	addss	xmm4,dword ptr [eax]
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	cvtsi2ss	xmm0,eax
	movss	xmm3,xmm6
	subss	xmm3,xmm7
	divss	xmm3,xmm0
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	cvtsi2ss	xmm0,eax
	movss	xmm2,xmm4
	subss	xmm2,xmm5
	divss	xmm2,xmm0
	push	xmm2
	movss	dword ptr [esp-4],xmm2
	sub	esp,4
	movss	dword ptr [esp-4],xmm3
	sub	esp,4
	movss	dword ptr [esp-4],xmm4
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	push	dword ptr [ebp-16]
	push	dword ptr [ebp-12]
	push	dword ptr [ebp-8]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	pop	xmm2
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
	cvtsi2ss	xmm0,edx
	mov	eax,[ebp+16]
	mov	ecx,[ebp+8]
	movss	xmm1,dword ptr [eax+8]
	subss	xmm1,dword ptr [ecx+8]
	mulss	xmm0,xmm1
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,[ebp+8]
	addss	xmm0,dword ptr [eax+8]
	movss	xmm6,xmm0
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm0,edx
	mov	eax,8
	add	eax,[ebp+16]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+8]
	add	ecx,4
	movss	xmm1,dword ptr [eax]
	subss	xmm1,dword ptr [ecx]
	mulss	xmm0,xmm1
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	addss	xmm0,dword ptr [eax]
	movss	xmm4,xmm0
	mov	eax,[ebp+12]
	movss	xmm0,xmm6
	subss	xmm0,dword ptr [eax+8]
	mov	eax,[ebp+12]
	mov	ecx,[ebp-12]
	sub	ecx,[eax]
	cvtsi2ss	xmm1,ecx
	divss	xmm0,xmm1
	movss	xmm3,xmm0
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	movss	xmm0,xmm4
	subss	xmm0,dword ptr [eax]
	mov	eax,[ebp+12]
	mov	ecx,[ebp-12]
	sub	ecx,[eax]
	cvtsi2ss	xmm1,ecx
	divss	xmm0,xmm1
	movss	xmm2,xmm0
	push	xmm2
	movss	dword ptr [esp-4],xmm2
	sub	esp,4
	movss	dword ptr [esp-4],xmm3
	sub	esp,4
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	movss	xmm0,dword ptr [eax]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	mov	eax,[ebp+12]
	movss	xmm0,dword ptr [eax+8]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	dword ptr [esp-4],xmm4
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	mov	eax,[ebp+12]
	add	eax,4
	push	dword ptr [eax]
	mov	eax,[ebp+12]
	push	dword ptr [eax]
	push	dword ptr [ebp-12]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	pop	xmm2
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
	cvtsi2ss	xmm0,ecx
	mov	eax,[ebp+16]
	mov	ecx,[ebp+12]
	movss	xmm1,dword ptr [eax+8]
	subss	xmm1,dword ptr [ecx+8]
	mulss	xmm0,xmm1
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+12]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,[ebp+12]
	addss	xmm0,dword ptr [eax+8]
	movss	xmm7,xmm0
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,[ebp+16]
	mov	ecx,[ebp+8]
	movss	xmm1,dword ptr [eax+8]
	subss	xmm1,dword ptr [ecx+8]
	mulss	xmm0,xmm1
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,[ebp+8]
	addss	xmm0,dword ptr [eax+8]
	movss	xmm6,xmm0
	mov	eax,[ebp+12]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,8
	add	eax,[ebp+16]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+12]
	add	ecx,4
	movss	xmm1,dword ptr [eax]
	subss	xmm1,dword ptr [ecx]
	mulss	xmm0,xmm1
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+12]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,8
	add	eax,[ebp+12]
	add	eax,4
	addss	xmm0,dword ptr [eax]
	movss	xmm5,xmm0
	mov	eax,[ebp+8]
	add	eax,4
	mov	ecx,[ebp-16]
	sub	ecx,[eax]
	cvtsi2ss	xmm0,ecx
	mov	eax,8
	add	eax,[ebp+16]
	add	eax,4
	mov	ecx,8
	add	ecx,[ebp+8]
	add	ecx,4
	movss	xmm1,dword ptr [eax]
	subss	xmm1,dword ptr [ecx]
	mulss	xmm0,xmm1
	mov	eax,[ebp+16]
	add	eax,4
	mov	ecx,[ebp+8]
	add	ecx,4
	mov	edx,[eax]
	sub	edx,[ecx]
	cvtsi2ss	xmm1,edx
	divss	xmm0,xmm1
	mov	eax,8
	add	eax,[ebp+8]
	add	eax,4
	addss	xmm0,dword ptr [eax]
	movss	xmm4,xmm0
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	cvtsi2ss	xmm0,eax
	movss	xmm1,xmm6
	subss	xmm1,xmm7
	divss	xmm1,xmm0
	movss	xmm3,xmm1
	mov	eax,[ebp-12]
	sub	eax,[ebp-8]
	cvtsi2ss	xmm0,eax
	movss	xmm1,xmm4
	subss	xmm1,xmm5
	divss	xmm1,xmm0
	movss	xmm2,xmm1
	push	xmm2
	movss	dword ptr [esp-4],xmm2
	sub	esp,4
	movss	dword ptr [esp-4],xmm3
	sub	esp,4
	movss	dword ptr [esp-4],xmm4
	sub	esp,4
	movss	dword ptr [esp-4],xmm6
	sub	esp,4
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
	movss	dword ptr [esp-4],xmm7
	sub	esp,4
	push	dword ptr [ebp-16]
	push	dword ptr [ebp-12]
	push	dword ptr [ebp-8]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	pop	xmm2
	inc	dword ptr [ebp-16]
	jmp	label0009
label000a:
	pop	ebx
	pop	edi
	add	esp,40
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
	movss	xmm7,xmm0
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
	movss	xmm6,xmm0
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
	movss	xmm5,xmm0
	push	dword ptr [ebp+20]
	lea	eax,[ebp-40]
	push	eax
	call	_vec4f_dot
	add	esp,8
	divss	xmm5,xmm0
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
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
	movss	dword ptr [esp-4],xmm5
	sub	esp,4
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
	sub	esp,20
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
	movss	xmm7,dword ptr [___unnamed_float_1]
	divss	xmm7,dword ptr [eax]
	movss	xmm0,dword ptr [ebp-16]
	mulss	xmm0,xmm7
	cvttss2si	eax,xmm0
	mov	[edi],eax
	lea	eax,[ebp-16]
	add	eax,4
	movss	xmm0,dword ptr [eax]
	mulss	xmm0,xmm7
	cvttss2si	eax,xmm0
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
	add	esp,20
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
	movss	xmm0,dword ptr [___unnamed_float_1]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [edi+8]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [edi+4]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
	movss	xmm0,dword ptr [edi]
	movss	dword ptr [esp-4],xmm0
	sub	esp,4
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
