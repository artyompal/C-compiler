
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
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__dbgprintf],dword3
	mov	dword6,[ebp+12]
	mov	dword ptr [__width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__height],dword9
	mov	dword12,[ebp+20]
	mov	dword ptr [__pitch],dword12
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [ebp-32]
	mov	dword219,[ebp+32]
	mov	[ebp-36],dword219
	mov	dword218,[ebp+28]
	mov	[ebp-40],dword218
	mov	dword217,[ebp+24]
	mov	[ebp-44],dword217
	lea	dword18,dword ptr [__mvproj_matrix]
	mov	[ebp-48],dword18
; start of inline function matrix4f_make_perspective
	fld	dword ptr [ebp-36]
	fmul	dword ptr [ebp-44]
	fstp	dword ptr [ebp-52]
	fld	dword ptr [ebp-52]
	fmul	dword ptr [ebp-32]
	fstp	dword ptr [ebp-56]
	mov	dword228,[ebp-48]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-56]
	fstp	dword ptr [dword228]
	mov	dword232,[ebp-48]
	fldz
	fstp	dword ptr [dword232+4]
	mov	dword234,[ebp-48]
	fldz
	fstp	dword ptr [dword234+8]
	mov	dword236,[ebp-48]
	fldz
	fstp	dword ptr [dword236+12]
	mov	dword238,[ebp-48]
	fldz
	fstp	dword ptr [dword238+16]
	mov	dword240,[ebp-48]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-52]
	fstp	dword ptr [dword240+20]
	mov	dword244,[ebp-48]
	fldz
	fstp	dword ptr [dword244+24]
	mov	dword246,[ebp-48]
	fldz
	fstp	dword ptr [dword246+28]
	mov	dword248,[ebp-48]
	fldz
	fstp	dword ptr [dword248+32]
	mov	dword250,[ebp-48]
	fldz
	fstp	dword ptr [dword250+36]
	mov	dword252,[ebp-48]
	fld	dword ptr [ebp-40]
	fsub	dword ptr [ebp-44]
	fdivr	dword ptr [ebp-40]
	fstp	dword ptr [dword252+40]
	mov	dword257,[ebp-48]
	fld1
	fstp	dword ptr [dword257+44]
	mov	dword259,[ebp-48]
	fldz
	fstp	dword ptr [dword259+48]
	mov	dword261,[ebp-48]
	fldz
	fstp	dword ptr [dword261+52]
	mov	dword263,[ebp-48]
	fld	dword ptr [ebp-44]
	fmul	dword ptr [ebp-40]
	fld	dword ptr [ebp-44]
	fsub	dword ptr [ebp-40]
	fdivp
	fstp	dword ptr [dword263+56]
	mov	dword269,[ebp-48]
	fldz
	fstp	dword ptr [dword269+60]
label0010:
; end of inline function matrix4f_make_perspective
	mov	dword271,[ebp+28]
	mov	[ebp-60],dword271
	mov	dword270,[ebp+24]
	mov	[ebp-64],dword270
	fild	dword ptr [ebp+16]
	fstp	dword ptr [ebp-68]
	fild	dword ptr [ebp+12]
	fstp	dword ptr [ebp-72]
	lea	dword23,dword ptr [__viewport_matrix]
	mov	[ebp-76],dword23
; start of inline function matrix4f_make_viewport
	mov	dword274,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [dword274]
	mov	dword278,[ebp-76]
	fldz
	fstp	dword ptr [dword278+4]
	mov	dword280,[ebp-76]
	fldz
	fstp	dword ptr [dword280+8]
	mov	dword282,[ebp-76]
	fldz
	fstp	dword ptr [dword282+12]
	mov	dword284,[ebp-76]
	fldz
	fstp	dword ptr [dword284+16]
	mov	dword286,[ebp-76]
	fld	dword ptr [ebp-68]
	fldz
	fsubrp
	fld	dword ptr [___unnamed_float_1]
	fdivp
	fstp	dword ptr [dword286+20]
	mov	dword290,[ebp-76]
	fldz
	fstp	dword ptr [dword290+24]
	mov	dword292,[ebp-76]
	fldz
	fstp	dword ptr [dword292+28]
	mov	dword294,[ebp-76]
	fldz
	fstp	dword ptr [dword294+32]
	mov	dword296,[ebp-76]
	fldz
	fstp	dword ptr [dword296+36]
	mov	dword298,[ebp-76]
	fld	dword ptr [ebp-60]
	fsub	dword ptr [ebp-64]
	fstp	dword ptr [dword298+40]
	mov	dword302,[ebp-76]
	fldz
	fstp	dword ptr [dword302+44]
	mov	dword304,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [dword304+48]
	mov	dword308,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-68]
	fstp	dword ptr [dword308+52]
	mov	dword312,[ebp-76]
	fld	dword ptr [ebp-64]
	fstp	dword ptr [dword312+56]
	mov	dword315,[ebp-76]
	fld1
	fstp	dword ptr [dword315+60]
label0011:
; end of inline function matrix4f_make_viewport
	fld1
	fstp	dword ptr [ebp-12]
	mov	dword57,[ebp+24]
	mov	[ebp-16],dword57
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword25,dword ptr [__clip_z_near_base]
	mov	[ebp-28],dword25
; start of inline function vec4f_assign
	mov	dword60,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword60]
	mov	dword63,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword63+4]
	mov	dword66,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword66+8]
	mov	dword69,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword69+12]
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
	mov	dword71,[ebp-4]
	mov	[ebp-16],dword71
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword32,dword ptr [__clip_z_near_norm]
	mov	[ebp-28],dword32
; start of inline function vec4f_assign
	mov	dword74,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword74]
	mov	dword77,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword77+4]
	mov	dword80,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword80+8]
	mov	dword83,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword83+12]
label0005:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	mov	dword85,[ebp+28]
	mov	[ebp-16],dword85
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword34,dword ptr [__clip_z_far_base]
	mov	[ebp-28],dword34
; start of inline function vec4f_assign
	mov	dword88,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword88]
	mov	dword91,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword91+4]
	mov	dword94,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword94+8]
	mov	dword97,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword97+12]
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
	mov	dword99,[ebp-8]
	mov	[ebp-16],dword99
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword41,dword ptr [__clip_z_far_norm]
	mov	[ebp-28],dword41
; start of inline function vec4f_assign
	mov	dword102,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword102]
	mov	dword105,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword105+4]
	mov	dword108,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword108+8]
	mov	dword111,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword111+12]
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
	lea	dword44,dword ptr [__clip_plane_left_base]
	mov	[ebp-28],dword44
; start of inline function vec4f_assign
	mov	dword115,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword115]
	mov	dword118,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword118+4]
	mov	dword121,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword121+8]
	mov	dword124,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword124+12]
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
	lea	dword45,dword ptr [__clip_plane_left_norm]
	mov	[ebp-28],dword45
; start of inline function vec4f_assign
	mov	dword128,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword128]
	mov	dword131,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword131+4]
	mov	dword134,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword134+8]
	mov	dword137,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword137+12]
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
	lea	dword47,dword ptr [__clip_plane_right_base]
	mov	[ebp-28],dword47
; start of inline function vec4f_assign
	mov	dword141,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword141]
	mov	dword144,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword144+4]
	mov	dword147,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword147+8]
	mov	dword150,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword150+12]
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
	lea	dword49,dword ptr [__clip_plane_right_norm]
	mov	[ebp-28],dword49
; start of inline function vec4f_assign
	mov	dword154,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword154]
	mov	dword157,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword157+4]
	mov	dword160,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword160+8]
	mov	dword163,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword163+12]
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
	lea	dword52,dword ptr [__clip_plane_top_base]
	mov	[ebp-28],dword52
; start of inline function vec4f_assign
	mov	dword167,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword167]
	mov	dword170,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword170+4]
	mov	dword173,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword173+8]
	mov	dword176,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword176+12]
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
	lea	dword53,dword ptr [__clip_plane_top_norm]
	mov	[ebp-28],dword53
; start of inline function vec4f_assign
	mov	dword180,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword180]
	mov	dword183,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword183+4]
	mov	dword186,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword186+8]
	mov	dword189,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword189+12]
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
	lea	dword54,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-28],dword54
; start of inline function vec4f_assign
	mov	dword193,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword193]
	mov	dword196,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword196+4]
	mov	dword199,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword199+8]
	mov	dword202,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword202+12]
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
	lea	dword56,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-28],dword56
; start of inline function vec4f_assign
	mov	dword206,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword206]
	mov	dword209,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword209+4]
	mov	dword212,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword212+8]
	mov	dword215,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword215+12]
label000f:
; end of inline function vec4f_assign
	destroy_stack_frame
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__videomem],dword3
	destroy_stack_frame
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	create_stack_frame
	mov	dword2,[ebp+8]
	mov	dword4,[dword2]
	mov	dword5,[dword2+4]
	mov	dword ptr [__mvproj_matrix],dword4
	mov	dword ptr [__mvproj_matrix+4],dword5
	mov	dword4,[dword2+8]
	mov	dword5,[dword2+12]
	mov	dword ptr [__mvproj_matrix+8],dword4
	mov	dword ptr [__mvproj_matrix+12],dword5
	mov	dword4,[dword2+16]
	mov	dword5,[dword2+20]
	mov	dword ptr [__mvproj_matrix+16],dword4
	mov	dword ptr [__mvproj_matrix+20],dword5
	mov	dword4,[dword2+24]
	mov	dword5,[dword2+28]
	mov	dword ptr [__mvproj_matrix+24],dword4
	mov	dword ptr [__mvproj_matrix+28],dword5
	mov	dword4,[dword2+32]
	mov	dword5,[dword2+36]
	mov	dword ptr [__mvproj_matrix+32],dword4
	mov	dword ptr [__mvproj_matrix+36],dword5
	mov	dword4,[dword2+40]
	mov	dword5,[dword2+44]
	mov	dword ptr [__mvproj_matrix+40],dword4
	mov	dword ptr [__mvproj_matrix+44],dword5
	mov	dword4,[dword2+48]
	mov	dword5,[dword2+52]
	mov	dword ptr [__mvproj_matrix+48],dword4
	mov	dword ptr [__mvproj_matrix+52],dword5
	mov	dword4,[dword2+56]
	mov	dword5,[dword2+60]
	mov	dword ptr [__mvproj_matrix+56],dword4
	mov	dword ptr [__mvproj_matrix+60],dword5
	destroy_stack_frame
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__color],dword3
	destroy_stack_frame
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__texture_data],dword3
	mov	dword6,[ebp+12]
	mov	dword ptr [__texture_width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__texture_height],dword9
	destroy_stack_frame
	ret
_rasterizer_set_texture endp	

__rasterize_horiz_line proc
	create_stack_frame
	mov	dword108,[ebp+8]
	mov	dword103,dword ptr [__pitch]
	imul	dword103,[ebp+16]
	add	dword103,dword ptr [__videomem]
	mov	dword7,dword108
	sal	dword7,2
	add	dword103,dword7
	mov	dword106,[ebp+12]
	sal	dword106,2
	add	dword106,dword103
	mov	dword15,dword108
	sal	dword15,2
	sub	dword106,dword15
label0000:
	mov	dword81,[ebp+24]
	mov	[ebp-48],dword81
	mov	dword80,[ebp+20]
	mov	[ebp-52],dword80
; start of inline function _tex2d
	mov	dword85,dword ptr [__texture_width]
	dec	dword85
	int2float	dword85
	fmul	dword ptr [ebp-52]
	float2int	dword87
	mov	[ebp-56],dword87
	mov	dword91,dword ptr [__texture_height]
	dec	dword91
	int2float	dword91
	fmul	dword ptr [ebp-48]
	float2int	dword93
	mov	[ebp-60],dword93
	mov	dword97,[ebp-60]
	imul	dword97,dword ptr [__texture_width]
	add	dword97,[ebp-56]
	sal	dword97,2
	add	dword97,dword ptr [__texture_data]
	mov	dword101,[dword97]
	mov	[ebp-64],dword101
label0004:
; end of inline function _tex2d
	mov	dword104,[ebp-64]
	mov	dword23,dword104
	sar	dword23,24
	and	dword23,255
	mov	[ebp-40],dword23
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	dword105,[dword103]
	mov	dword36,dword105
	and	dword36,65280
	sar	dword36,8
	mov	[ebp-32],dword36
	mov	dword41,dword105
	and	dword41,255
	mov	[ebp-36],dword41
	mov	dword45,dword104
	and	dword45,65280
	sar	dword45,8
	mov	[ebp-20],dword45
	mov	dword50,dword104
	and	dword50,255
	mov	[ebp-24],dword50
	fild	dword ptr [ebp-20]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-32]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword56
	mov	[ebp-20],dword56
	fild	dword ptr [ebp-24]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-36]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword62
	mov	[ebp-24],dword62
	mov	dword107,[ebp-20]
	sal	dword107,8
	add	dword107,[ebp-24]
	mov	[dword103],dword107
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	dword103,4
	cmp	dword103,dword106
	jl	label0000
label0002:
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__clip_on_plain proc
	create_stack_frame
	mov	dword351,[ebp+8]
	mov	dword ptr [dword351+192],0
	mov	dword352,[ebp+12]
	mov	dword353,[ebp+12]
	add	dword353,24
label0000:
label0001:
	mov	dword12,[ebp+12]
	mov	dword14,[dword12+192]
	imul	dword14,24
	mov	dword16,[ebp+12]
	add	dword16,dword14
	cmp	dword16,dword353
	jle	label0002
	mov	dword162,[ebp+16]
	mov	[ebp-108],dword162
	mov	[ebp-112],dword352
	lea	dword21,[ebp-24]
	mov	[ebp-116],dword21
; start of inline function vec4f_subtract
	mov	dword165,[ebp-112]
	mov	dword167,[ebp-108]
	fld	dword ptr [dword165]
	fsub	dword ptr [dword167]
	mov	dword169,[ebp-116]
	fstp	dword ptr [dword169]
	mov	dword171,[ebp-112]
	mov	dword173,[ebp-108]
	fld	dword ptr [dword171+4]
	fsub	dword ptr [dword173+4]
	mov	dword175,[ebp-116]
	fstp	dword ptr [dword175+4]
	mov	dword177,[ebp-112]
	mov	dword179,[ebp-108]
	fld	dword ptr [dword177+8]
	fsub	dword ptr [dword179+8]
	mov	dword181,[ebp-116]
	fstp	dword ptr [dword181+8]
	mov	dword183,[ebp-112]
	mov	dword185,[ebp-108]
	fld	dword ptr [dword183+12]
	fsub	dword ptr [dword185+12]
	mov	dword187,[ebp-116]
	fstp	dword ptr [dword187+12]
label000b:
; end of inline function vec4f_subtract
	mov	dword265,[ebp+20]
	mov	[ebp-120],dword265
	lea	dword23,[ebp-24]
	mov	[ebp-124],dword23
; start of inline function vec4f_dot
	mov	dword268,[ebp-124]
	mov	dword270,[ebp-120]
	fld	dword ptr [dword268+4]
	fmul	dword ptr [dword270+4]
	mov	dword272,[ebp-124]
	mov	dword274,[ebp-120]
	fld	dword ptr [dword272]
	fmul	dword ptr [dword274]
	faddp
	mov	dword276,[ebp-124]
	mov	dword278,[ebp-120]
	fld	dword ptr [dword276+8]
	fmul	dword ptr [dword278+8]
	faddp
	mov	dword280,[ebp-124]
	mov	dword282,[ebp-120]
	fld	dword ptr [dword280+12]
	fmul	dword ptr [dword282+12]
	faddp
	fstp	dword ptr [ebp-128]
label000f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-52]
	mov	dword188,[ebp+16]
	mov	[ebp-108],dword188
	mov	[ebp-112],dword353
	lea	dword28,[ebp-24]
	mov	[ebp-116],dword28
; start of inline function vec4f_subtract
	mov	dword191,[ebp-112]
	mov	dword193,[ebp-108]
	fld	dword ptr [dword191]
	fsub	dword ptr [dword193]
	mov	dword195,[ebp-116]
	fstp	dword ptr [dword195]
	mov	dword197,[ebp-112]
	mov	dword199,[ebp-108]
	fld	dword ptr [dword197+4]
	fsub	dword ptr [dword199+4]
	mov	dword201,[ebp-116]
	fstp	dword ptr [dword201+4]
	mov	dword203,[ebp-112]
	mov	dword205,[ebp-108]
	fld	dword ptr [dword203+8]
	fsub	dword ptr [dword205+8]
	mov	dword207,[ebp-116]
	fstp	dword ptr [dword207+8]
	mov	dword209,[ebp-112]
	mov	dword211,[ebp-108]
	fld	dword ptr [dword209+12]
	fsub	dword ptr [dword211+12]
	mov	dword213,[ebp-116]
	fstp	dword ptr [dword213+12]
label000c:
; end of inline function vec4f_subtract
	mov	dword283,[ebp+20]
	mov	[ebp-120],dword283
	lea	dword30,[ebp-24]
	mov	[ebp-124],dword30
; start of inline function vec4f_dot
	mov	dword286,[ebp-124]
	mov	dword288,[ebp-120]
	fld	dword ptr [dword286+4]
	fmul	dword ptr [dword288+4]
	mov	dword290,[ebp-124]
	mov	dword292,[ebp-120]
	fld	dword ptr [dword290]
	fmul	dword ptr [dword292]
	faddp
	mov	dword294,[ebp-124]
	mov	dword296,[ebp-120]
	fld	dword ptr [dword294+8]
	fmul	dword ptr [dword296+8]
	faddp
	mov	dword298,[ebp-124]
	mov	dword300,[ebp-120]
	fld	dword ptr [dword298+12]
	fmul	dword ptr [dword300+12]
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
	mov	dword35,[dword351+192]
	inc	dword ptr [dword351+192]
	imul	dword35,24
	mov	dword38,dword351
	add	dword38,dword35
	mov	dword41,[dword352]
	mov	dword42,[dword352+4]
	mov	[dword38],dword41
	mov	[dword38+4],dword42
	mov	dword41,[dword352+8]
	mov	dword42,[dword352+12]
	mov	[dword38+8],dword41
	mov	[dword38+12],dword42
	mov	dword41,[dword352+16]
	mov	dword42,[dword352+20]
	mov	[dword38+16],dword41
	mov	[dword38+20],dword42
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
	mov	[ebp-108],dword352
	mov	dword214,[ebp+16]
	mov	[ebp-112],dword214
	lea	dword50,[ebp-24]
	mov	[ebp-116],dword50
; start of inline function vec4f_subtract
	mov	dword217,[ebp-112]
	mov	dword219,[ebp-108]
	fld	dword ptr [dword217]
	fsub	dword ptr [dword219]
	mov	dword221,[ebp-116]
	fstp	dword ptr [dword221]
	mov	dword223,[ebp-112]
	mov	dword225,[ebp-108]
	fld	dword ptr [dword223+4]
	fsub	dword ptr [dword225+4]
	mov	dword227,[ebp-116]
	fstp	dword ptr [dword227+4]
	mov	dword229,[ebp-112]
	mov	dword231,[ebp-108]
	fld	dword ptr [dword229+8]
	fsub	dword ptr [dword231+8]
	mov	dword233,[ebp-116]
	fstp	dword ptr [dword233+8]
	mov	dword235,[ebp-112]
	mov	dword237,[ebp-108]
	fld	dword ptr [dword235+12]
	fsub	dword ptr [dword237+12]
	mov	dword239,[ebp-116]
	fstp	dword ptr [dword239+12]
label000d:
; end of inline function vec4f_subtract
	mov	[ebp-108],dword352
	mov	[ebp-112],dword353
	lea	dword55,[ebp-40]
	mov	[ebp-116],dword55
; start of inline function vec4f_subtract
	mov	dword242,[ebp-112]
	mov	dword244,[ebp-108]
	fld	dword ptr [dword242]
	fsub	dword ptr [dword244]
	mov	dword246,[ebp-116]
	fstp	dword ptr [dword246]
	mov	dword248,[ebp-112]
	mov	dword250,[ebp-108]
	fld	dword ptr [dword248+4]
	fsub	dword ptr [dword250+4]
	mov	dword252,[ebp-116]
	fstp	dword ptr [dword252+4]
	mov	dword254,[ebp-112]
	mov	dword256,[ebp-108]
	fld	dword ptr [dword254+8]
	fsub	dword ptr [dword256+8]
	mov	dword258,[ebp-116]
	fstp	dword ptr [dword258+8]
	mov	dword260,[ebp-112]
	mov	dword262,[ebp-108]
	fld	dword ptr [dword260+12]
	fsub	dword ptr [dword262+12]
	mov	dword264,[ebp-116]
	fstp	dword ptr [dword264+12]
label000e:
; end of inline function vec4f_subtract
	mov	dword301,[ebp+20]
	mov	[ebp-120],dword301
	lea	dword57,[ebp-24]
	mov	[ebp-124],dword57
; start of inline function vec4f_dot
	mov	dword304,[ebp-124]
	mov	dword306,[ebp-120]
	fld	dword ptr [dword304+4]
	fmul	dword ptr [dword306+4]
	mov	dword308,[ebp-124]
	mov	dword310,[ebp-120]
	fld	dword ptr [dword308]
	fmul	dword ptr [dword310]
	faddp
	mov	dword312,[ebp-124]
	mov	dword314,[ebp-120]
	fld	dword ptr [dword312+8]
	fmul	dword ptr [dword314+8]
	faddp
	mov	dword316,[ebp-124]
	mov	dword318,[ebp-120]
	fld	dword ptr [dword316+12]
	fmul	dword ptr [dword318+12]
	faddp
	fstp	dword ptr [ebp-128]
label0011:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	mov	dword319,[ebp+20]
	mov	[ebp-120],dword319
	lea	dword59,[ebp-40]
	mov	[ebp-124],dword59
; start of inline function vec4f_dot
	mov	dword322,[ebp-124]
	mov	dword324,[ebp-120]
	fld	dword ptr [dword322+4]
	fmul	dword ptr [dword324+4]
	mov	dword326,[ebp-124]
	mov	dword328,[ebp-120]
	fld	dword ptr [dword326]
	fmul	dword ptr [dword328]
	faddp
	mov	dword330,[ebp-124]
	mov	dword332,[ebp-120]
	fld	dword ptr [dword330+8]
	fmul	dword ptr [dword332+8]
	faddp
	mov	dword334,[ebp-124]
	mov	dword336,[ebp-120]
	fld	dword ptr [dword334+12]
	fmul	dword ptr [dword336+12]
	faddp
	fstp	dword ptr [ebp-128]
label0012:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fdivp
	fstp	dword ptr [ebp-60]
	mov	dword337,[ebp-60]
	mov	[ebp-132],dword337
	lea	dword62,[ebp-40]
	mov	[ebp-136],dword62
; start of inline function vec4f_mul
	mov	dword340,[ebp-136]
	fld	dword ptr [dword340]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword340]
	mov	dword343,[ebp-136]
	fld	dword ptr [dword343+4]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword343+4]
	mov	dword346,[ebp-136]
	fld	dword ptr [dword346+8]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword346+8]
	mov	dword349,[ebp-136]
	fld	dword ptr [dword349+12]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword349+12]
label0013:
; end of inline function vec4f_mul
	lea	dword63,[ebp-40]
	mov	[ebp-96],dword63
	mov	[ebp-100],dword352
	mov	dword69,[dword351+192]
	imul	dword69,24
	mov	dword71,dword351
	add	dword71,dword69
	mov	[ebp-104],dword71
; start of inline function vec4f_add
	mov	dword139,[ebp-100]
	mov	dword141,[ebp-96]
	fld	dword ptr [dword139]
	fadd	dword ptr [dword141]
	mov	dword143,[ebp-104]
	fstp	dword ptr [dword143]
	mov	dword145,[ebp-100]
	mov	dword147,[ebp-96]
	fld	dword ptr [dword145+4]
	fadd	dword ptr [dword147+4]
	mov	dword149,[ebp-104]
	fstp	dword ptr [dword149+4]
	mov	dword151,[ebp-100]
	mov	dword153,[ebp-96]
	fld	dword ptr [dword151+8]
	fadd	dword ptr [dword153+8]
	mov	dword155,[ebp-104]
	fstp	dword ptr [dword155+8]
	mov	dword157,[ebp-100]
	mov	dword159,[ebp-96]
	fld	dword ptr [dword157+12]
	fadd	dword ptr [dword159+12]
	mov	dword161,[ebp-104]
	fstp	dword ptr [dword161+12]
label000a:
; end of inline function vec4f_add
	mov	dword73,16
	add	dword73,dword352
	mov	[ebp-76],dword73
	mov	dword75,16
	add	dword75,dword353
	mov	[ebp-80],dword75
	lea	dword76,[ebp-48]
	mov	[ebp-84],dword76
; start of inline function vec2f_subtract
	mov	dword118,[ebp-80]
	mov	dword120,[ebp-76]
	fld	dword ptr [dword118]
	fsub	dword ptr [dword120]
	mov	dword122,[ebp-84]
	fstp	dword ptr [dword122]
	mov	dword124,[ebp-80]
	mov	dword126,[ebp-76]
	fld	dword ptr [dword124+4]
	fsub	dword ptr [dword126+4]
	mov	dword128,[ebp-84]
	fstp	dword ptr [dword128+4]
label0008:
; end of inline function vec2f_subtract
	mov	dword129,[ebp-60]
	mov	[ebp-88],dword129
	lea	dword78,[ebp-48]
	mov	[ebp-92],dword78
; start of inline function vec2f_mul
	mov	dword132,[ebp-92]
	fld	dword ptr [dword132]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [dword132]
	mov	dword135,[ebp-92]
	fld	dword ptr [dword135+4]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [dword135+4]
label0009:
; end of inline function vec2f_mul
	lea	dword79,[ebp-48]
	mov	[ebp-64],dword79
	mov	dword81,16
	add	dword81,dword352
	mov	[ebp-68],dword81
	mov	dword85,[dword351+192]
	imul	dword85,24
	mov	dword87,dword351
	add	dword87,dword85
	add	dword87,16
	mov	[ebp-72],dword87
; start of inline function vec2f_add
	mov	dword105,[ebp-68]
	mov	dword107,[ebp-64]
	fld	dword ptr [dword105]
	fadd	dword ptr [dword107]
	mov	dword109,[ebp-72]
	fstp	dword ptr [dword109]
	mov	dword111,[ebp-68]
	mov	dword113,[ebp-64]
	fld	dword ptr [dword111+4]
	fadd	dword ptr [dword113+4]
	mov	dword115,[ebp-72]
	fstp	dword ptr [dword115+4]
label0007:
; end of inline function vec2f_add
	inc	dword ptr [dword351+192]
label0004:
	add	dword352,24
	add	dword353,24
	jmp	label0001
label0002:
	mov	dword95,[dword351+192]
	inc	dword ptr [dword351+192]
	imul	dword95,24
	mov	dword98,dword351
	add	dword98,dword95
	mov	dword101,[dword351]
	mov	dword102,[dword351+4]
	mov	[dword98],dword101
	mov	[dword98+4],dword102
	mov	dword101,[dword351+8]
	mov	dword102,[dword351+12]
	mov	[dword98+8],dword101
	mov	[dword98+12],dword102
	mov	dword101,[dword351+16]
	mov	dword102,[dword351+20]
	mov	[dword98+16],dword101
	mov	[dword98+20],dword102
	destroy_stack_frame
	ret
__clip_on_plain endp	

__transform_to_projection_space proc
	create_stack_frame
	mov	dword102,[ebp+12]
	fld1
	fstp	dword ptr [ebp-20]
	mov	dword13,[dword102+8]
	mov	[ebp-24],dword13
	mov	dword12,[dword102+4]
	mov	[ebp-28],dword12
	mov	dword11,[dword102]
	mov	[ebp-32],dword11
	lea	dword7,[ebp-16]
	mov	[ebp-36],dword7
; start of inline function vec4f_assign
	mov	dword16,[ebp-36]
	fld	dword ptr [ebp-32]
	fstp	dword ptr [dword16]
	mov	dword19,[ebp-36]
	fld	dword ptr [ebp-28]
	fstp	dword ptr [dword19+4]
	mov	dword22,[ebp-36]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword22+8]
	mov	dword25,[ebp-36]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword25+12]
label0000:
; end of inline function vec4f_assign
	mov	[ebp-40],(offset __mvproj_matrix)
	lea	dword9,[ebp-16]
	mov	[ebp-44],dword9
	mov	dword27,[ebp+8]
	mov	[ebp-48],dword27
; start of inline function matrix4f_transform
	mov	dword30,[ebp-44]
	mov	dword32,[ebp-40]
	fld	dword ptr [dword30+4]
	fmul	dword ptr [dword32+16]
	mov	dword34,[ebp-44]
	mov	dword36,[ebp-40]
	fld	dword ptr [dword34]
	fmul	dword ptr [dword36]
	faddp
	mov	dword38,[ebp-44]
	mov	dword40,[ebp-40]
	fld	dword ptr [dword38+8]
	fmul	dword ptr [dword40+32]
	faddp
	mov	dword42,[ebp-44]
	mov	dword44,[ebp-40]
	fld	dword ptr [dword42+12]
	fmul	dword ptr [dword44+48]
	faddp
	mov	dword46,[ebp-48]
	fstp	dword ptr [dword46]
	mov	dword48,[ebp-40]
	mov	dword50,[ebp-44]
	fld	dword ptr [dword50]
	fmul	dword ptr [dword48+4]
	mov	dword52,[ebp-44]
	mov	dword54,[ebp-40]
	fld	dword ptr [dword52+4]
	fmul	dword ptr [dword54+20]
	faddp
	mov	dword56,[ebp-44]
	mov	dword58,[ebp-40]
	fld	dword ptr [dword56+8]
	fmul	dword ptr [dword58+36]
	faddp
	mov	dword60,[ebp-44]
	mov	dword62,[ebp-40]
	fld	dword ptr [dword60+12]
	fmul	dword ptr [dword62+52]
	faddp
	mov	dword64,[ebp-48]
	fstp	dword ptr [dword64+4]
	mov	dword66,[ebp-40]
	mov	dword68,[ebp-44]
	fld	dword ptr [dword68]
	fmul	dword ptr [dword66+8]
	mov	dword70,[ebp-44]
	mov	dword72,[ebp-40]
	fld	dword ptr [dword70+4]
	fmul	dword ptr [dword72+24]
	faddp
	mov	dword74,[ebp-44]
	mov	dword76,[ebp-40]
	fld	dword ptr [dword74+8]
	fmul	dword ptr [dword76+40]
	faddp
	mov	dword78,[ebp-44]
	mov	dword80,[ebp-40]
	fld	dword ptr [dword78+12]
	fmul	dword ptr [dword80+56]
	faddp
	mov	dword82,[ebp-48]
	fstp	dword ptr [dword82+8]
	mov	dword84,[ebp-40]
	mov	dword86,[ebp-44]
	fld	dword ptr [dword86]
	fmul	dword ptr [dword84+12]
	mov	dword88,[ebp-44]
	mov	dword90,[ebp-40]
	fld	dword ptr [dword88+4]
	fmul	dword ptr [dword90+28]
	faddp
	mov	dword92,[ebp-44]
	mov	dword94,[ebp-40]
	fld	dword ptr [dword92+8]
	fmul	dword ptr [dword94+44]
	faddp
	mov	dword96,[ebp-44]
	mov	dword98,[ebp-40]
	fld	dword ptr [dword96+12]
	fmul	dword ptr [dword98+60]
	faddp
	mov	dword100,[ebp-48]
	fstp	dword ptr [dword100+12]
label0001:
; end of inline function matrix4f_transform
	destroy_stack_frame
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	create_stack_frame
	push_all
	push_arg	dword ptr [ebp+8],4
	lea	dword2,[ebp-196]
	push_arg	dword2,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword3,[ebp-196]
	add	dword3,16
	mov	dword6,[ebp+20]
	mov	dword7,[dword6]
	mov	dword8,[dword6+4]
	mov	[dword3],dword7
	mov	[dword3+4],dword8
	push_all
	push_arg	dword ptr [ebp+12],4
	lea	dword10,[ebp-196]
	add	dword10,24
	push_arg	dword10,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword12,[ebp-196]
	add	dword12,24
	add	dword12,16
	mov	dword16,[ebp+24]
	mov	dword17,[dword16]
	mov	dword18,[dword16+4]
	mov	[dword12],dword17
	mov	[dword12+4],dword18
	push_all
	push_arg	dword ptr [ebp+16],4
	lea	dword20,[ebp-196]
	add	dword20,48
	push_arg	dword20,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword22,[ebp-196]
	add	dword22,48
	add	dword22,16
	mov	dword26,[ebp+28]
	mov	dword27,[dword26]
	mov	dword28,[dword26+4]
	mov	[dword22],dword27
	mov	[dword22+4],dword28
	lea	dword29,[ebp-196]
	add	dword29,72
	mov	dword32,[ebp-196]
	mov	dword33,[ebp-192]
	mov	[dword29],dword32
	mov	[dword29+4],dword33
	mov	dword32,[ebp-188]
	mov	dword33,[ebp-184]
	mov	[dword29+8],dword32
	mov	[dword29+12],dword33
	mov	dword32,[ebp-180]
	mov	dword33,[ebp-176]
	mov	[dword29+16],dword32
	mov	[dword29+20],dword33
	lea	dword34,[ebp-196]
	add	dword34,192
	mov	dword ptr [dword34],4
	lea	dword37,[ebp-196]
	mov	[ebp-200],dword37
; start of inline function _rasterize_polygon_4f
	mov	dword740,[ebp-200]
	mov	[ebp-464],dword740
; start of inline function _clip_poligon
	push_all
	lea	dword742,dword ptr [__clip_z_far_norm]
	push_arg	dword742,4
	lea	dword743,dword ptr [__clip_z_far_base]
	push_arg	dword743,4
	push_arg	dword ptr [ebp-464],4
	lea	dword745,[ebp-660]
	push_arg	dword745,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword746,dword ptr [__clip_z_near_norm]
	push_arg	dword746,4
	lea	dword747,dword ptr [__clip_z_near_base]
	push_arg	dword747,4
	lea	dword748,[ebp-660]
	push_arg	dword748,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword750,dword ptr [__clip_plane_left_norm]
	push_arg	dword750,4
	lea	dword751,dword ptr [__clip_plane_left_base]
	push_arg	dword751,4
	push_arg	dword ptr [ebp-464],4
	lea	dword753,[ebp-660]
	push_arg	dword753,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword754,dword ptr [__clip_plane_right_norm]
	push_arg	dword754,4
	lea	dword755,dword ptr [__clip_plane_right_base]
	push_arg	dword755,4
	lea	dword756,[ebp-660]
	push_arg	dword756,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword758,dword ptr [__clip_plane_top_norm]
	push_arg	dword758,4
	lea	dword759,dword ptr [__clip_plane_top_base]
	push_arg	dword759,4
	push_arg	dword ptr [ebp-464],4
	lea	dword761,[ebp-660]
	push_arg	dword761,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword762,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword762,4
	lea	dword763,dword ptr [__clip_plane_bottom_base]
	push_arg	dword763,4
	lea	dword764,[ebp-660]
	push_arg	dword764,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	mov	dword767,[ebp-464]
	cmp	dword ptr [dword767+192],1
	setg	byte8
	movzx	dword769,byte8
	mov	[ebp-664],dword769
label0028:
; end of inline function _clip_poligon
	mov	dword40,[ebp-664]
	cmp	dword40,0
	jne	label0000
	jmp	label002d
label0000:
	mov	dword42,[ebp-200]
	cmp	dword ptr [dword42+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword ptr [ebp-336],0
label0002:
label0003:
	mov	dword49,[ebp-200]
	mov	dword51,[dword49+192]
	cmp	dword51,[ebp-336]
	jle	label0004
	mov	dword53,[ebp-200]
	mov	dword56,[ebp-336]
	imul	dword56,24
	add	dword53,dword56
	mov	[ebp-668],dword53
	lea	dword57,[ebp-332]
	mov	dword60,[ebp-336]
	sal	dword60,4
	add	dword57,dword60
	mov	[ebp-672],dword57
; start of inline function _transform_to_screen_space
	lea	dword771,dword ptr [__viewport_matrix]
	mov	[ebp-696],dword771
	mov	dword804,[ebp-668]
	mov	[ebp-700],dword804
	lea	dword773,[ebp-688]
	mov	[ebp-704],dword773
; start of inline function matrix4f_transform
	mov	dword807,[ebp-700]
	mov	dword809,[ebp-696]
	fld	dword ptr [dword807+4]
	fmul	dword ptr [dword809+16]
	mov	dword811,[ebp-700]
	mov	dword813,[ebp-696]
	fld	dword ptr [dword811]
	fmul	dword ptr [dword813]
	faddp
	mov	dword815,[ebp-700]
	mov	dword817,[ebp-696]
	fld	dword ptr [dword815+8]
	fmul	dword ptr [dword817+32]
	faddp
	mov	dword819,[ebp-700]
	mov	dword821,[ebp-696]
	fld	dword ptr [dword819+12]
	fmul	dword ptr [dword821+48]
	faddp
	mov	dword823,[ebp-704]
	fstp	dword ptr [dword823]
	mov	dword825,[ebp-696]
	mov	dword827,[ebp-700]
	fld	dword ptr [dword827]
	fmul	dword ptr [dword825+4]
	mov	dword829,[ebp-700]
	mov	dword831,[ebp-696]
	fld	dword ptr [dword829+4]
	fmul	dword ptr [dword831+20]
	faddp
	mov	dword833,[ebp-700]
	mov	dword835,[ebp-696]
	fld	dword ptr [dword833+8]
	fmul	dword ptr [dword835+36]
	faddp
	mov	dword837,[ebp-700]
	mov	dword839,[ebp-696]
	fld	dword ptr [dword837+12]
	fmul	dword ptr [dword839+52]
	faddp
	mov	dword841,[ebp-704]
	fstp	dword ptr [dword841+4]
	mov	dword843,[ebp-696]
	mov	dword845,[ebp-700]
	fld	dword ptr [dword845]
	fmul	dword ptr [dword843+8]
	mov	dword847,[ebp-700]
	mov	dword849,[ebp-696]
	fld	dword ptr [dword847+4]
	fmul	dword ptr [dword849+24]
	faddp
	mov	dword851,[ebp-700]
	mov	dword853,[ebp-696]
	fld	dword ptr [dword851+8]
	fmul	dword ptr [dword853+40]
	faddp
	mov	dword855,[ebp-700]
	mov	dword857,[ebp-696]
	fld	dword ptr [dword855+12]
	fmul	dword ptr [dword857+56]
	faddp
	mov	dword859,[ebp-704]
	fstp	dword ptr [dword859+8]
	mov	dword861,[ebp-696]
	mov	dword863,[ebp-700]
	fld	dword ptr [dword863]
	fmul	dword ptr [dword861+12]
	mov	dword865,[ebp-700]
	mov	dword867,[ebp-696]
	fld	dword ptr [dword865+4]
	fmul	dword ptr [dword867+28]
	faddp
	mov	dword869,[ebp-700]
	mov	dword871,[ebp-696]
	fld	dword ptr [dword869+8]
	fmul	dword ptr [dword871+44]
	faddp
	mov	dword873,[ebp-700]
	mov	dword875,[ebp-696]
	fld	dword ptr [dword873+12]
	fmul	dword ptr [dword875+60]
	faddp
	mov	dword877,[ebp-704]
	fstp	dword ptr [dword877+12]
label002b:
; end of inline function matrix4f_transform
	lea	dword774,[ebp-688]
	add	dword774,12
	fld1
	fdiv	dword ptr [dword774]
	fstp	dword ptr [ebp-692]
	fld	dword ptr [ebp-688]
	fmul	dword ptr [ebp-692]
	float2int	dword779
	mov	dword781,[ebp-672]
	mov	[dword781],dword779
	lea	dword782,[ebp-688]
	add	dword782,4
	fld	dword ptr [dword782]
	fmul	dword ptr [ebp-692]
	float2int	dword785
	mov	dword787,[ebp-672]
	mov	[dword787+4],dword785
	mov	dword789,[ebp-672]
	cmp	dword ptr [dword789],0
	jl	label002a
	mov	dword792,[ebp-672]
	mov	dword794,[dword792]
	cmp	dword794,dword ptr [__width]
	jge	label002a
	mov	dword796,[ebp-672]
	cmp	dword ptr [dword796+4],0
	jl	label002a
	mov	dword799,[ebp-672]
	mov	dword801,[dword799+4]
	cmp	dword801,dword ptr [__height]
	jl	label0029
label002a:
	mov	dword ptr ds:[0],0
label0029:
label002c:
; end of inline function _transform_to_screen_space
	lea	dword61,[ebp-332]
	mov	dword64,[ebp-336]
	sal	dword64,4
	add	dword61,dword64
	add	dword61,8
	mov	dword67,[ebp-200]
	mov	dword70,[ebp-336]
	imul	dword70,24
	add	dword67,dword70
	add	dword67,16
	mov	dword72,[dword67]
	mov	dword73,[dword67+4]
	mov	[dword61],dword72
	mov	[dword61+4],dword73
	inc	dword ptr [ebp-336]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-336],2
label0005:
label0006:
	mov	dword78,[ebp-200]
	mov	dword80,[dword78+192]
	dec	dword80
	cmp	dword80,[ebp-336]
	jle	label0007
	lea	dword82,[ebp-332]
	mov	dword85,[ebp-336]
	sal	dword85,4
	add	dword82,dword85
	mov	[ebp-340],dword82
	mov	dword88,[ebp-336]
	dec	dword88
	sal	dword88,4
	lea	dword90,[ebp-332]
	add	dword90,dword88
	mov	[ebp-344],dword90
	lea	dword91,[ebp-332]
	mov	[ebp-348],dword91
; start of inline function _rasterize_triangle_2i
	mov	dword95,[ebp-348]
	add	dword95,4
	mov	dword98,[ebp-344]
	add	dword98,4
	mov	dword100,[dword95]
	cmp	dword100,[dword98]
	jle	label0008
	mov	dword103,[ebp-348]
	mov	[ebp-352],dword103
	mov	dword106,[ebp-344]
	mov	[ebp-348],dword106
	mov	dword109,[ebp-352]
	mov	[ebp-344],dword109
label0008:
	mov	dword111,[ebp-348]
	add	dword111,4
	mov	dword114,[ebp-340]
	add	dword114,4
	mov	dword116,[dword111]
	cmp	dword116,[dword114]
	jle	label0009
	mov	dword119,[ebp-348]
	mov	[ebp-352],dword119
	mov	dword122,[ebp-340]
	mov	[ebp-348],dword122
	mov	dword125,[ebp-352]
	mov	[ebp-340],dword125
label0009:
	mov	dword127,[ebp-344]
	add	dword127,4
	mov	dword130,[ebp-340]
	add	dword130,4
	mov	dword132,[dword127]
	cmp	dword132,[dword130]
	jle	label000a
	mov	dword135,[ebp-344]
	mov	[ebp-352],dword135
	mov	dword138,[ebp-340]
	mov	[ebp-344],dword138
	mov	dword141,[ebp-352]
	mov	[ebp-340],dword141
label000a:
	mov	dword143,[ebp-348]
	add	dword143,4
	mov	dword146,[ebp-340]
	add	dword146,4
	mov	dword148,[dword143]
	cmp	dword148,[dword146]
	jne	label000b
	mov	dword150,[ebp-348]
	add	dword150,4
	cmp	dword ptr [dword150],0
	jl	label000c
	mov	dword154,[ebp-348]
	add	dword154,4
	mov	dword157,[dword154]
	cmp	dword157,dword ptr [__height]
	jge	label000c
	fldz
	fstp	dword ptr [ebp-428]
	fldz
	fstp	dword ptr [ebp-432]
	mov	dword159,8
	add	dword159,[ebp-340]
	mov	[ebp-436],dword159
	mov	dword161,8
	add	dword161,[ebp-344]
	mov	[ebp-440],dword161
	mov	dword163,8
	add	dword163,[ebp-348]
	mov	[ebp-444],dword163
	mov	dword165,[ebp-348]
	add	dword165,4
	mov	dword669,[dword165]
	mov	[ebp-448],dword669
	mov	dword168,[ebp-340]
	mov	dword668,[dword168]
	mov	[ebp-452],dword668
	mov	dword170,[ebp-344]
	mov	dword667,[dword170]
	mov	[ebp-456],dword667
	mov	dword172,[ebp-348]
	mov	dword666,[dword172]
	mov	[ebp-460],dword666
; start of inline function _rasterize_triangle_1i
	mov	dword673,[ebp-460]
	cmp	dword673,[ebp-456]
	jge	label001c
	mov	dword676,[ebp-452]
	cmp	dword676,[ebp-456]
	jle	label001d
	push_all
	push_arg	dword ptr [ebp-428],4
	push_arg	dword ptr [ebp-432],4
	mov	dword680,[ebp-444]
	push_arg	dword ptr [dword680+4],4
	mov	dword682,[ebp-444]
	push_arg	dword ptr [dword682],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-452],4
	push_arg	dword ptr [ebp-460],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label001e
label001d:
	mov	dword688,[ebp-452]
	cmp	dword688,[ebp-460]
	jge	label001f
	push_all
	push_arg	dword ptr [ebp-428],4
	push_arg	dword ptr [ebp-432],4
	mov	dword692,[ebp-436]
	push_arg	dword ptr [dword692+4],4
	mov	dword694,[ebp-436]
	push_arg	dword ptr [dword694],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-456],4
	push_arg	dword ptr [ebp-452],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0020
label001f:
	push_all
	push_arg	dword ptr [ebp-428],4
	push_arg	dword ptr [ebp-432],4
	mov	dword701,[ebp-444]
	push_arg	dword ptr [dword701+4],4
	mov	dword703,[ebp-444]
	push_arg	dword ptr [dword703],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-456],4
	push_arg	dword ptr [ebp-460],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0020:
label001e:
	jmp	label0021
label001c:
	mov	dword709,[ebp-452]
	cmp	dword709,[ebp-456]
	jge	label0022
	push_all
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	push_arg	sse61,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	push_arg	sse62,4
	mov	dword713,[ebp-436]
	push_arg	dword ptr [dword713+4],4
	mov	dword715,[ebp-436]
	push_arg	dword ptr [dword715],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-460],4
	push_arg	dword ptr [ebp-452],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0023
label0022:
	mov	dword721,[ebp-452]
	cmp	dword721,[ebp-460]
	jle	label0024
	push_all
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	push_arg	sse63,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	push_arg	sse64,4
	mov	dword725,[ebp-440]
	push_arg	dword ptr [dword725+4],4
	mov	dword727,[ebp-440]
	push_arg	dword ptr [dword727],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-452],4
	push_arg	dword ptr [ebp-456],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0025
label0024:
	push_all
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	push_arg	sse65,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	push_arg	sse66,4
	mov	dword734,[ebp-440]
	push_arg	dword ptr [dword734+4],4
	mov	dword736,[ebp-440]
	push_arg	dword ptr [dword736],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-460],4
	push_arg	dword ptr [ebp-456],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0025:
label0023:
label0021:
label0026:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label0027
label000b:
	mov	dword174,[ebp-348]
	add	dword174,4
	mov	dword177,[dword174]
	mov	[ebp-364],dword177
label000d:
label000e:
	mov	dword179,[ebp-344]
	add	dword179,4
	mov	dword182,[dword179]
	cmp	dword182,[ebp-364]
	jle	label000f
	mov	dword184,[ebp-348]
	add	dword184,4
	mov	dword187,[ebp-364]
	sub	dword187,[dword184]
	mov	dword189,[ebp-344]
	mov	dword191,[ebp-348]
	mov	dword192,[dword189]
	sub	dword192,[dword191]
	imul	dword187,dword192
	mov	dword194,[ebp-344]
	add	dword194,4
	mov	dword197,[ebp-348]
	add	dword197,4
	mov	dword199,[dword194]
	sub	dword199,[dword197]
	cdq	dword200
	idiv	dword187,dword199
	mov	dword202,[ebp-348]
	add	dword187,[dword202]
	mov	[ebp-356],dword187
	mov	dword205,[ebp-348]
	add	dword205,4
	mov	dword208,[ebp-364]
	sub	dword208,[dword205]
	mov	dword210,[ebp-340]
	mov	dword212,[ebp-348]
	mov	dword213,[dword210]
	sub	dword213,[dword212]
	imul	dword208,dword213
	mov	dword215,[ebp-340]
	add	dword215,4
	mov	dword218,[ebp-348]
	add	dword218,4
	mov	dword220,[dword215]
	sub	dword220,[dword218]
	cdq	dword221
	idiv	dword208,dword220
	mov	dword223,[ebp-348]
	add	dword208,[dword223]
	mov	[ebp-360],dword208
	mov	dword226,[ebp-348]
	add	dword226,4
	mov	dword229,[ebp-364]
	sub	dword229,[dword226]
	int2float	dword229
	mov	dword231,[ebp-344]
	mov	dword233,[ebp-348]
	fld	dword ptr [dword231+8]
	fsub	dword ptr [dword233+8]
	fmulp
	mov	dword235,[ebp-344]
	add	dword235,4
	mov	dword238,[ebp-348]
	add	dword238,4
	mov	dword240,[dword235]
	sub	dword240,[dword238]
	int2float	dword240
	fdivp
	mov	dword242,[ebp-348]
	fadd	dword ptr [dword242+8]
	fstp	dword ptr [ebp-368]
	mov	dword245,[ebp-348]
	add	dword245,4
	mov	dword248,[ebp-364]
	sub	dword248,[dword245]
	int2float	dword248
	mov	dword250,[ebp-340]
	mov	dword252,[ebp-348]
	fld	dword ptr [dword250+8]
	fsub	dword ptr [dword252+8]
	fmulp
	mov	dword254,[ebp-340]
	add	dword254,4
	mov	dword257,[ebp-348]
	add	dword257,4
	mov	dword259,[dword254]
	sub	dword259,[dword257]
	int2float	dword259
	fdivp
	mov	dword261,[ebp-348]
	fadd	dword ptr [dword261+8]
	fstp	dword ptr [ebp-376]
	mov	dword264,[ebp-348]
	add	dword264,4
	mov	dword267,[ebp-364]
	sub	dword267,[dword264]
	int2float	dword267
	mov	dword269,8
	add	dword269,[ebp-344]
	add	dword269,4
	mov	dword272,8
	add	dword272,[ebp-348]
	add	dword272,4
	fld	dword ptr [dword269]
	fsub	dword ptr [dword272]
	fmulp
	mov	dword275,[ebp-344]
	add	dword275,4
	mov	dword278,[ebp-348]
	add	dword278,4
	mov	dword280,[dword275]
	sub	dword280,[dword278]
	int2float	dword280
	fdivp
	mov	dword282,8
	add	dword282,[ebp-348]
	add	dword282,4
	fadd	dword ptr [dword282]
	fstp	dword ptr [ebp-372]
	mov	dword286,[ebp-348]
	add	dword286,4
	mov	dword289,[ebp-364]
	sub	dword289,[dword286]
	int2float	dword289
	mov	dword291,8
	add	dword291,[ebp-340]
	add	dword291,4
	mov	dword294,8
	add	dword294,[ebp-348]
	add	dword294,4
	fld	dword ptr [dword291]
	fsub	dword ptr [dword294]
	fmulp
	mov	dword297,[ebp-340]
	add	dword297,4
	mov	dword300,[ebp-348]
	add	dword300,4
	mov	dword302,[dword297]
	sub	dword302,[dword300]
	int2float	dword302
	fdivp
	mov	dword304,8
	add	dword304,[ebp-348]
	add	dword304,4
	fadd	dword ptr [dword304]
	fstp	dword ptr [ebp-380]
	mov	dword309,[ebp-360]
	sub	dword309,[ebp-356]
	int2float	dword309
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	dword315,[ebp-360]
	sub	dword315,[ebp-356]
	int2float	dword315
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	mov	dword593,[ebp-388]
	mov	[ebp-392],dword593
	mov	dword592,[ebp-384]
	mov	[ebp-396],dword592
	mov	dword591,[ebp-380]
	mov	[ebp-400],dword591
	mov	dword590,[ebp-376]
	mov	[ebp-404],dword590
	mov	dword589,[ebp-372]
	mov	[ebp-408],dword589
	mov	dword588,[ebp-368]
	mov	[ebp-412],dword588
	mov	dword587,[ebp-364]
	mov	[ebp-416],dword587
	mov	dword586,[ebp-360]
	mov	[ebp-420],dword586
	mov	dword585,[ebp-356]
	mov	[ebp-424],dword585
; start of inline function _rasterize_horiz_line__unordered
	mov	dword597,[ebp-424]
	cmp	dword597,[ebp-420]
	jg	label0013
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-408],4
	push_arg	dword ptr [ebp-412],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-420],4
	push_arg	dword ptr [ebp-424],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0014
label0013:
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0014:
label0015:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-364]
	jmp	label000e
label000f:
	mov	dword330,[ebp-344]
	add	dword330,4
	mov	dword333,[ebp-348]
	add	dword333,4
	mov	dword335,[dword330]
	sub	dword335,[dword333]
	mov	dword337,[ebp-340]
	mov	dword339,[ebp-348]
	mov	dword340,[dword337]
	sub	dword340,[dword339]
	imul	dword335,dword340
	mov	dword342,[ebp-340]
	add	dword342,4
	mov	dword345,[ebp-348]
	add	dword345,4
	mov	dword347,[dword342]
	sub	dword347,[dword345]
	cdq	dword348
	idiv	dword335,dword347
	mov	dword350,[ebp-348]
	add	dword335,[dword350]
	mov	[ebp-360],dword335
	mov	dword353,[ebp-344]
	add	dword353,4
	mov	dword356,[ebp-348]
	add	dword356,4
	mov	dword358,[dword353]
	sub	dword358,[dword356]
	int2float	dword358
	mov	dword360,[ebp-340]
	mov	dword362,[ebp-348]
	fld	dword ptr [dword360+8]
	fsub	dword ptr [dword362+8]
	fmulp
	mov	dword364,[ebp-340]
	add	dword364,4
	mov	dword367,[ebp-348]
	add	dword367,4
	mov	dword369,[dword364]
	sub	dword369,[dword367]
	int2float	dword369
	fdivp
	mov	dword371,[ebp-348]
	fadd	dword ptr [dword371+8]
	fstp	dword ptr [ebp-376]
	mov	dword374,[ebp-344]
	add	dword374,4
	mov	dword377,[ebp-348]
	add	dword377,4
	mov	dword379,[dword374]
	sub	dword379,[dword377]
	int2float	dword379
	mov	dword381,8
	add	dword381,[ebp-340]
	add	dword381,4
	mov	dword384,8
	add	dword384,[ebp-348]
	add	dword384,4
	fld	dword ptr [dword381]
	fsub	dword ptr [dword384]
	fmulp
	mov	dword387,[ebp-340]
	add	dword387,4
	mov	dword390,[ebp-348]
	add	dword390,4
	mov	dword392,[dword387]
	sub	dword392,[dword390]
	int2float	dword392
	fdivp
	mov	dword394,8
	add	dword394,[ebp-348]
	add	dword394,4
	fadd	dword ptr [dword394]
	fstp	dword ptr [ebp-380]
	mov	dword398,[ebp-344]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [dword398+8]
	mov	dword401,[ebp-344]
	mov	dword403,[ebp-360]
	sub	dword403,[dword401]
	int2float	dword403
	fdivp
	fstp	dword ptr [ebp-384]
	mov	dword406,8
	add	dword406,[ebp-344]
	add	dword406,4
	fld	dword ptr [ebp-380]
	fsub	dword ptr [dword406]
	mov	dword410,[ebp-344]
	mov	dword412,[ebp-360]
	sub	dword412,[dword410]
	int2float	dword412
	fdivp
	fstp	dword ptr [ebp-388]
	mov	dword620,[ebp-388]
	mov	[ebp-392],dword620
	mov	dword619,[ebp-384]
	mov	[ebp-396],dword619
	mov	dword417,8
	add	dword417,[ebp-344]
	add	dword417,4
	mov	dword618,[dword417]
	mov	[ebp-400],dword618
	mov	dword420,[ebp-344]
	mov	dword617,[dword420+8]
	mov	[ebp-404],dword617
	mov	dword616,[ebp-380]
	mov	[ebp-408],dword616
	mov	dword615,[ebp-376]
	mov	[ebp-412],dword615
	mov	dword424,[ebp-344]
	add	dword424,4
	mov	dword614,[dword424]
	mov	[ebp-416],dword614
	mov	dword427,[ebp-344]
	mov	dword613,[dword427]
	mov	[ebp-420],dword613
	mov	dword612,[ebp-360]
	mov	[ebp-424],dword612
; start of inline function _rasterize_horiz_line__unordered
	mov	dword624,[ebp-424]
	cmp	dword624,[ebp-420]
	jg	label0016
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-408],4
	push_arg	dword ptr [ebp-412],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-420],4
	push_arg	dword ptr [ebp-424],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0017
label0016:
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0017:
label0018:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword430,[ebp-344]
	add	dword430,4
	mov	dword432,1
	add	dword432,[dword430]
	mov	[ebp-364],dword432
label0010:
label0011:
	mov	dword435,[ebp-340]
	add	dword435,4
	mov	dword438,[dword435]
	cmp	dword438,[ebp-364]
	jle	label0012
	mov	dword440,[ebp-344]
	add	dword440,4
	mov	dword443,[ebp-364]
	sub	dword443,[dword440]
	mov	dword445,[ebp-340]
	mov	dword447,[ebp-344]
	mov	dword448,[dword445]
	sub	dword448,[dword447]
	imul	dword443,dword448
	mov	dword450,[ebp-340]
	add	dword450,4
	mov	dword453,[ebp-344]
	add	dword453,4
	mov	dword455,[dword450]
	sub	dword455,[dword453]
	cdq	dword456
	idiv	dword443,dword455
	mov	dword458,[ebp-344]
	add	dword443,[dword458]
	mov	[ebp-356],dword443
	mov	dword461,[ebp-348]
	add	dword461,4
	mov	dword464,[ebp-364]
	sub	dword464,[dword461]
	mov	dword466,[ebp-340]
	mov	dword468,[ebp-348]
	mov	dword469,[dword466]
	sub	dword469,[dword468]
	imul	dword464,dword469
	mov	dword471,[ebp-340]
	add	dword471,4
	mov	dword474,[ebp-348]
	add	dword474,4
	mov	dword476,[dword471]
	sub	dword476,[dword474]
	cdq	dword477
	idiv	dword464,dword476
	mov	dword479,[ebp-348]
	add	dword464,[dword479]
	mov	[ebp-360],dword464
	mov	dword482,[ebp-344]
	add	dword482,4
	mov	dword485,[ebp-364]
	sub	dword485,[dword482]
	int2float	dword485
	mov	dword487,[ebp-340]
	mov	dword489,[ebp-344]
	fld	dword ptr [dword487+8]
	fsub	dword ptr [dword489+8]
	fmulp
	mov	dword491,[ebp-340]
	add	dword491,4
	mov	dword494,[ebp-344]
	add	dword494,4
	mov	dword496,[dword491]
	sub	dword496,[dword494]
	int2float	dword496
	fdivp
	mov	dword498,[ebp-344]
	fadd	dword ptr [dword498+8]
	fstp	dword ptr [ebp-368]
	mov	dword501,[ebp-348]
	add	dword501,4
	mov	dword504,[ebp-364]
	sub	dword504,[dword501]
	int2float	dword504
	mov	dword506,[ebp-340]
	mov	dword508,[ebp-348]
	fld	dword ptr [dword506+8]
	fsub	dword ptr [dword508+8]
	fmulp
	mov	dword510,[ebp-340]
	add	dword510,4
	mov	dword513,[ebp-348]
	add	dword513,4
	mov	dword515,[dword510]
	sub	dword515,[dword513]
	int2float	dword515
	fdivp
	mov	dword517,[ebp-348]
	fadd	dword ptr [dword517+8]
	fstp	dword ptr [ebp-376]
	mov	dword520,[ebp-344]
	add	dword520,4
	mov	dword523,[ebp-364]
	sub	dword523,[dword520]
	int2float	dword523
	mov	dword525,8
	add	dword525,[ebp-340]
	add	dword525,4
	mov	dword528,8
	add	dword528,[ebp-344]
	add	dword528,4
	fld	dword ptr [dword525]
	fsub	dword ptr [dword528]
	fmulp
	mov	dword531,[ebp-340]
	add	dword531,4
	mov	dword534,[ebp-344]
	add	dword534,4
	mov	dword536,[dword531]
	sub	dword536,[dword534]
	int2float	dword536
	fdivp
	mov	dword538,8
	add	dword538,[ebp-344]
	add	dword538,4
	fadd	dword ptr [dword538]
	fstp	dword ptr [ebp-372]
	mov	dword542,[ebp-348]
	add	dword542,4
	mov	dword545,[ebp-364]
	sub	dword545,[dword542]
	int2float	dword545
	mov	dword547,8
	add	dword547,[ebp-340]
	add	dword547,4
	mov	dword550,8
	add	dword550,[ebp-348]
	add	dword550,4
	fld	dword ptr [dword547]
	fsub	dword ptr [dword550]
	fmulp
	mov	dword553,[ebp-340]
	add	dword553,4
	mov	dword556,[ebp-348]
	add	dword556,4
	mov	dword558,[dword553]
	sub	dword558,[dword556]
	int2float	dword558
	fdivp
	mov	dword560,8
	add	dword560,[ebp-348]
	add	dword560,4
	fadd	dword ptr [dword560]
	fstp	dword ptr [ebp-380]
	mov	dword565,[ebp-360]
	sub	dword565,[ebp-356]
	int2float	dword565
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	dword571,[ebp-360]
	sub	dword571,[ebp-356]
	int2float	dword571
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	mov	dword647,[ebp-388]
	mov	[ebp-392],dword647
	mov	dword646,[ebp-384]
	mov	[ebp-396],dword646
	mov	dword645,[ebp-380]
	mov	[ebp-400],dword645
	mov	dword644,[ebp-376]
	mov	[ebp-404],dword644
	mov	dword643,[ebp-372]
	mov	[ebp-408],dword643
	mov	dword642,[ebp-368]
	mov	[ebp-412],dword642
	mov	dword641,[ebp-364]
	mov	[ebp-416],dword641
	mov	dword640,[ebp-360]
	mov	[ebp-420],dword640
	mov	dword639,[ebp-356]
	mov	[ebp-424],dword639
; start of inline function _rasterize_horiz_line__unordered
	mov	dword651,[ebp-424]
	cmp	dword651,[ebp-420]
	jg	label0019
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-408],4
	push_arg	dword ptr [ebp-412],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-420],4
	push_arg	dword ptr [ebp-424],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label001a
label0019:
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
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
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
