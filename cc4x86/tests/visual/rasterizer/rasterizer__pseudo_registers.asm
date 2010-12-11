
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

_rasterizer_triangle3f proc
	create_stack_frame
	mov	dword2180,[ebp+8]
	mov	[ebp-892],dword2180
	lea	dword2,[ebp-196]
	mov	[ebp-896],dword2
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-916]
	mov	dword2183,[ebp-892]
	mov	dword2194,[dword2183+8]
	mov	[ebp-920],dword2194
	mov	dword2185,[ebp-892]
	mov	dword2193,[dword2185+4]
	mov	[ebp-924],dword2193
	mov	dword2187,[ebp-892]
	mov	dword2192,[dword2187]
	mov	[ebp-928],dword2192
	lea	dword2188,[ebp-912]
	mov	[ebp-932],dword2188
; start of inline function vec4f_assign
	mov	dword2197,[ebp-932]
	fld	dword ptr [ebp-928]
	fstp	dword ptr [dword2197]
	mov	dword2200,[ebp-932]
	fld	dword ptr [ebp-924]
	fstp	dword ptr [dword2200+4]
	mov	dword2203,[ebp-932]
	fld	dword ptr [ebp-920]
	fstp	dword ptr [dword2203+8]
	mov	dword2206,[ebp-932]
	fld	dword ptr [ebp-916]
	fstp	dword ptr [dword2206+12]
label0076:
; end of inline function vec4f_assign
	lea	dword2189,dword ptr [__mvproj_matrix]
	mov	[ebp-936],dword2189
	lea	dword2190,[ebp-912]
	mov	[ebp-940],dword2190
	mov	dword2208,[ebp-896]
	mov	[ebp-944],dword2208
; start of inline function matrix4f_transform
	mov	dword2211,[ebp-940]
	mov	dword2213,[ebp-936]
	fld	dword ptr [dword2211+4]
	fmul	dword ptr [dword2213+16]
	mov	dword2215,[ebp-940]
	mov	dword2217,[ebp-936]
	fld	dword ptr [dword2215]
	fmul	dword ptr [dword2217]
	faddp
	mov	dword2219,[ebp-940]
	mov	dword2221,[ebp-936]
	fld	dword ptr [dword2219+8]
	fmul	dword ptr [dword2221+32]
	faddp
	mov	dword2223,[ebp-940]
	mov	dword2225,[ebp-936]
	fld	dword ptr [dword2223+12]
	fmul	dword ptr [dword2225+48]
	faddp
	mov	dword2227,[ebp-944]
	fstp	dword ptr [dword2227]
	mov	dword2229,[ebp-936]
	mov	dword2231,[ebp-940]
	fld	dword ptr [dword2231]
	fmul	dword ptr [dword2229+4]
	mov	dword2233,[ebp-940]
	mov	dword2235,[ebp-936]
	fld	dword ptr [dword2233+4]
	fmul	dword ptr [dword2235+20]
	faddp
	mov	dword2237,[ebp-940]
	mov	dword2239,[ebp-936]
	fld	dword ptr [dword2237+8]
	fmul	dword ptr [dword2239+36]
	faddp
	mov	dword2241,[ebp-940]
	mov	dword2243,[ebp-936]
	fld	dword ptr [dword2241+12]
	fmul	dword ptr [dword2243+52]
	faddp
	mov	dword2245,[ebp-944]
	fstp	dword ptr [dword2245+4]
	mov	dword2247,[ebp-936]
	mov	dword2249,[ebp-940]
	fld	dword ptr [dword2249]
	fmul	dword ptr [dword2247+8]
	mov	dword2251,[ebp-940]
	mov	dword2253,[ebp-936]
	fld	dword ptr [dword2251+4]
	fmul	dword ptr [dword2253+24]
	faddp
	mov	dword2255,[ebp-940]
	mov	dword2257,[ebp-936]
	fld	dword ptr [dword2255+8]
	fmul	dword ptr [dword2257+40]
	faddp
	mov	dword2259,[ebp-940]
	mov	dword2261,[ebp-936]
	fld	dword ptr [dword2259+12]
	fmul	dword ptr [dword2261+56]
	faddp
	mov	dword2263,[ebp-944]
	fstp	dword ptr [dword2263+8]
	mov	dword2265,[ebp-936]
	mov	dword2267,[ebp-940]
	fld	dword ptr [dword2267]
	fmul	dword ptr [dword2265+12]
	mov	dword2269,[ebp-940]
	mov	dword2271,[ebp-936]
	fld	dword ptr [dword2269+4]
	fmul	dword ptr [dword2271+28]
	faddp
	mov	dword2273,[ebp-940]
	mov	dword2275,[ebp-936]
	fld	dword ptr [dword2273+8]
	fmul	dword ptr [dword2275+44]
	faddp
	mov	dword2277,[ebp-940]
	mov	dword2279,[ebp-936]
	fld	dword ptr [dword2277+12]
	fmul	dword ptr [dword2279+60]
	faddp
	mov	dword2281,[ebp-944]
	fstp	dword ptr [dword2281+12]
label0077:
; end of inline function matrix4f_transform
label0078:
; end of inline function _transform_to_projection_space
	lea	dword3,[ebp-196]
	add	dword3,16
	mov	dword6,[ebp+20]
	mov	dword7,[dword6]
	mov	dword8,[dword6+4]
	mov	[dword3],dword7
	mov	[dword3+4],dword8
	mov	dword2282,[ebp+12]
	mov	[ebp-892],dword2282
	lea	dword10,[ebp-196]
	add	dword10,24
	mov	[ebp-896],dword10
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-916]
	mov	dword2285,[ebp-892]
	mov	dword2296,[dword2285+8]
	mov	[ebp-920],dword2296
	mov	dword2287,[ebp-892]
	mov	dword2295,[dword2287+4]
	mov	[ebp-924],dword2295
	mov	dword2289,[ebp-892]
	mov	dword2294,[dword2289]
	mov	[ebp-928],dword2294
	lea	dword2290,[ebp-912]
	mov	[ebp-932],dword2290
; start of inline function vec4f_assign
	mov	dword2299,[ebp-932]
	fld	dword ptr [ebp-928]
	fstp	dword ptr [dword2299]
	mov	dword2302,[ebp-932]
	fld	dword ptr [ebp-924]
	fstp	dword ptr [dword2302+4]
	mov	dword2305,[ebp-932]
	fld	dword ptr [ebp-920]
	fstp	dword ptr [dword2305+8]
	mov	dword2308,[ebp-932]
	fld	dword ptr [ebp-916]
	fstp	dword ptr [dword2308+12]
label0079:
; end of inline function vec4f_assign
	lea	dword2291,dword ptr [__mvproj_matrix]
	mov	[ebp-936],dword2291
	lea	dword2292,[ebp-912]
	mov	[ebp-940],dword2292
	mov	dword2310,[ebp-896]
	mov	[ebp-944],dword2310
; start of inline function matrix4f_transform
	mov	dword2313,[ebp-940]
	mov	dword2315,[ebp-936]
	fld	dword ptr [dword2313+4]
	fmul	dword ptr [dword2315+16]
	mov	dword2317,[ebp-940]
	mov	dword2319,[ebp-936]
	fld	dword ptr [dword2317]
	fmul	dword ptr [dword2319]
	faddp
	mov	dword2321,[ebp-940]
	mov	dword2323,[ebp-936]
	fld	dword ptr [dword2321+8]
	fmul	dword ptr [dword2323+32]
	faddp
	mov	dword2325,[ebp-940]
	mov	dword2327,[ebp-936]
	fld	dword ptr [dword2325+12]
	fmul	dword ptr [dword2327+48]
	faddp
	mov	dword2329,[ebp-944]
	fstp	dword ptr [dword2329]
	mov	dword2331,[ebp-936]
	mov	dword2333,[ebp-940]
	fld	dword ptr [dword2333]
	fmul	dword ptr [dword2331+4]
	mov	dword2335,[ebp-940]
	mov	dword2337,[ebp-936]
	fld	dword ptr [dword2335+4]
	fmul	dword ptr [dword2337+20]
	faddp
	mov	dword2339,[ebp-940]
	mov	dword2341,[ebp-936]
	fld	dword ptr [dword2339+8]
	fmul	dword ptr [dword2341+36]
	faddp
	mov	dword2343,[ebp-940]
	mov	dword2345,[ebp-936]
	fld	dword ptr [dword2343+12]
	fmul	dword ptr [dword2345+52]
	faddp
	mov	dword2347,[ebp-944]
	fstp	dword ptr [dword2347+4]
	mov	dword2349,[ebp-936]
	mov	dword2351,[ebp-940]
	fld	dword ptr [dword2351]
	fmul	dword ptr [dword2349+8]
	mov	dword2353,[ebp-940]
	mov	dword2355,[ebp-936]
	fld	dword ptr [dword2353+4]
	fmul	dword ptr [dword2355+24]
	faddp
	mov	dword2357,[ebp-940]
	mov	dword2359,[ebp-936]
	fld	dword ptr [dword2357+8]
	fmul	dword ptr [dword2359+40]
	faddp
	mov	dword2361,[ebp-940]
	mov	dword2363,[ebp-936]
	fld	dword ptr [dword2361+12]
	fmul	dword ptr [dword2363+56]
	faddp
	mov	dword2365,[ebp-944]
	fstp	dword ptr [dword2365+8]
	mov	dword2367,[ebp-936]
	mov	dword2369,[ebp-940]
	fld	dword ptr [dword2369]
	fmul	dword ptr [dword2367+12]
	mov	dword2371,[ebp-940]
	mov	dword2373,[ebp-936]
	fld	dword ptr [dword2371+4]
	fmul	dword ptr [dword2373+28]
	faddp
	mov	dword2375,[ebp-940]
	mov	dword2377,[ebp-936]
	fld	dword ptr [dword2375+8]
	fmul	dword ptr [dword2377+44]
	faddp
	mov	dword2379,[ebp-940]
	mov	dword2381,[ebp-936]
	fld	dword ptr [dword2379+12]
	fmul	dword ptr [dword2381+60]
	faddp
	mov	dword2383,[ebp-944]
	fstp	dword ptr [dword2383+12]
label007a:
; end of inline function matrix4f_transform
label007b:
; end of inline function _transform_to_projection_space
	lea	dword12,[ebp-196]
	add	dword12,24
	add	dword12,16
	mov	dword16,[ebp+24]
	mov	dword17,[dword16]
	mov	dword18,[dword16+4]
	mov	[dword12],dword17
	mov	[dword12+4],dword18
	mov	dword2384,[ebp+16]
	mov	[ebp-892],dword2384
	lea	dword20,[ebp-196]
	add	dword20,48
	mov	[ebp-896],dword20
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-916]
	mov	dword2387,[ebp-892]
	mov	dword2398,[dword2387+8]
	mov	[ebp-920],dword2398
	mov	dword2389,[ebp-892]
	mov	dword2397,[dword2389+4]
	mov	[ebp-924],dword2397
	mov	dword2391,[ebp-892]
	mov	dword2396,[dword2391]
	mov	[ebp-928],dword2396
	lea	dword2392,[ebp-912]
	mov	[ebp-932],dword2392
; start of inline function vec4f_assign
	mov	dword2401,[ebp-932]
	fld	dword ptr [ebp-928]
	fstp	dword ptr [dword2401]
	mov	dword2404,[ebp-932]
	fld	dword ptr [ebp-924]
	fstp	dword ptr [dword2404+4]
	mov	dword2407,[ebp-932]
	fld	dword ptr [ebp-920]
	fstp	dword ptr [dword2407+8]
	mov	dword2410,[ebp-932]
	fld	dword ptr [ebp-916]
	fstp	dword ptr [dword2410+12]
label007c:
; end of inline function vec4f_assign
	lea	dword2393,dword ptr [__mvproj_matrix]
	mov	[ebp-936],dword2393
	lea	dword2394,[ebp-912]
	mov	[ebp-940],dword2394
	mov	dword2412,[ebp-896]
	mov	[ebp-944],dword2412
; start of inline function matrix4f_transform
	mov	dword2415,[ebp-940]
	mov	dword2417,[ebp-936]
	fld	dword ptr [dword2415+4]
	fmul	dword ptr [dword2417+16]
	mov	dword2419,[ebp-940]
	mov	dword2421,[ebp-936]
	fld	dword ptr [dword2419]
	fmul	dword ptr [dword2421]
	faddp
	mov	dword2423,[ebp-940]
	mov	dword2425,[ebp-936]
	fld	dword ptr [dword2423+8]
	fmul	dword ptr [dword2425+32]
	faddp
	mov	dword2427,[ebp-940]
	mov	dword2429,[ebp-936]
	fld	dword ptr [dword2427+12]
	fmul	dword ptr [dword2429+48]
	faddp
	mov	dword2431,[ebp-944]
	fstp	dword ptr [dword2431]
	mov	dword2433,[ebp-936]
	mov	dword2435,[ebp-940]
	fld	dword ptr [dword2435]
	fmul	dword ptr [dword2433+4]
	mov	dword2437,[ebp-940]
	mov	dword2439,[ebp-936]
	fld	dword ptr [dword2437+4]
	fmul	dword ptr [dword2439+20]
	faddp
	mov	dword2441,[ebp-940]
	mov	dword2443,[ebp-936]
	fld	dword ptr [dword2441+8]
	fmul	dword ptr [dword2443+36]
	faddp
	mov	dword2445,[ebp-940]
	mov	dword2447,[ebp-936]
	fld	dword ptr [dword2445+12]
	fmul	dword ptr [dword2447+52]
	faddp
	mov	dword2449,[ebp-944]
	fstp	dword ptr [dword2449+4]
	mov	dword2451,[ebp-936]
	mov	dword2453,[ebp-940]
	fld	dword ptr [dword2453]
	fmul	dword ptr [dword2451+8]
	mov	dword2455,[ebp-940]
	mov	dword2457,[ebp-936]
	fld	dword ptr [dword2455+4]
	fmul	dword ptr [dword2457+24]
	faddp
	mov	dword2459,[ebp-940]
	mov	dword2461,[ebp-936]
	fld	dword ptr [dword2459+8]
	fmul	dword ptr [dword2461+40]
	faddp
	mov	dword2463,[ebp-940]
	mov	dword2465,[ebp-936]
	fld	dword ptr [dword2463+12]
	fmul	dword ptr [dword2465+56]
	faddp
	mov	dword2467,[ebp-944]
	fstp	dword ptr [dword2467+8]
	mov	dword2469,[ebp-936]
	mov	dword2471,[ebp-940]
	fld	dword ptr [dword2471]
	fmul	dword ptr [dword2469+12]
	mov	dword2473,[ebp-940]
	mov	dword2475,[ebp-936]
	fld	dword ptr [dword2473+4]
	fmul	dword ptr [dword2475+28]
	faddp
	mov	dword2477,[ebp-940]
	mov	dword2479,[ebp-936]
	fld	dword ptr [dword2477+8]
	fmul	dword ptr [dword2479+44]
	faddp
	mov	dword2481,[ebp-940]
	mov	dword2483,[ebp-936]
	fld	dword ptr [dword2481+12]
	fmul	dword ptr [dword2483+60]
	faddp
	mov	dword2485,[ebp-944]
	fstp	dword ptr [dword2485+12]
label007d:
; end of inline function matrix4f_transform
label007e:
; end of inline function _transform_to_projection_space
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
	mov	dword2042,[ebp-200]
	mov	[ebp-648],dword2042
; start of inline function _clip_poligon
	push_all
	lea	dword2044,dword ptr [__clip_z_far_norm]
	push_arg	dword2044,4
	lea	dword2045,dword ptr [__clip_z_far_base]
	push_arg	dword2045,4
	push_arg	dword ptr [ebp-648],4
	lea	dword2047,[ebp-844]
	push_arg	dword2047,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword2048,dword ptr [__clip_z_near_norm]
	push_arg	dword2048,4
	lea	dword2049,dword ptr [__clip_z_near_base]
	push_arg	dword2049,4
	lea	dword2050,[ebp-844]
	push_arg	dword2050,4
	push_arg	dword ptr [ebp-648],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword2052,dword ptr [__clip_plane_left_norm]
	push_arg	dword2052,4
	lea	dword2053,dword ptr [__clip_plane_left_base]
	push_arg	dword2053,4
	push_arg	dword ptr [ebp-648],4
	lea	dword2055,[ebp-844]
	push_arg	dword2055,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword2056,dword ptr [__clip_plane_right_norm]
	push_arg	dword2056,4
	lea	dword2057,dword ptr [__clip_plane_right_base]
	push_arg	dword2057,4
	lea	dword2058,[ebp-844]
	push_arg	dword2058,4
	push_arg	dword ptr [ebp-648],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword2060,dword ptr [__clip_plane_top_norm]
	push_arg	dword2060,4
	lea	dword2061,dword ptr [__clip_plane_top_base]
	push_arg	dword2061,4
	push_arg	dword ptr [ebp-648],4
	lea	dword2063,[ebp-844]
	push_arg	dword2063,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword2064,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword2064,4
	lea	dword2065,dword ptr [__clip_plane_bottom_base]
	push_arg	dword2065,4
	lea	dword2066,[ebp-844]
	push_arg	dword2066,4
	push_arg	dword ptr [ebp-648],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	mov	dword2069,[ebp-648]
	cmp	dword ptr [dword2069+192],1
	setg	byte32
	movzx	dword2071,byte32
	mov	[ebp-848],dword2071
label0070:
; end of inline function _clip_poligon
	mov	dword40,[ebp-848]
	cmp	dword40,0
	jne	label0000
	jmp	label0075
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
	mov	[ebp-852],dword53
	lea	dword57,[ebp-332]
	mov	dword60,[ebp-336]
	sal	dword60,4
	add	dword57,dword60
	mov	[ebp-856],dword57
; start of inline function _transform_to_screen_space
	lea	dword2073,dword ptr [__viewport_matrix]
	mov	[ebp-880],dword2073
	mov	dword2106,[ebp-852]
	mov	[ebp-884],dword2106
	lea	dword2075,[ebp-872]
	mov	[ebp-888],dword2075
; start of inline function matrix4f_transform
	mov	dword2109,[ebp-884]
	mov	dword2111,[ebp-880]
	fld	dword ptr [dword2109+4]
	fmul	dword ptr [dword2111+16]
	mov	dword2113,[ebp-884]
	mov	dword2115,[ebp-880]
	fld	dword ptr [dword2113]
	fmul	dword ptr [dword2115]
	faddp
	mov	dword2117,[ebp-884]
	mov	dword2119,[ebp-880]
	fld	dword ptr [dword2117+8]
	fmul	dword ptr [dword2119+32]
	faddp
	mov	dword2121,[ebp-884]
	mov	dword2123,[ebp-880]
	fld	dword ptr [dword2121+12]
	fmul	dword ptr [dword2123+48]
	faddp
	mov	dword2125,[ebp-888]
	fstp	dword ptr [dword2125]
	mov	dword2127,[ebp-880]
	mov	dword2129,[ebp-884]
	fld	dword ptr [dword2129]
	fmul	dword ptr [dword2127+4]
	mov	dword2131,[ebp-884]
	mov	dword2133,[ebp-880]
	fld	dword ptr [dword2131+4]
	fmul	dword ptr [dword2133+20]
	faddp
	mov	dword2135,[ebp-884]
	mov	dword2137,[ebp-880]
	fld	dword ptr [dword2135+8]
	fmul	dword ptr [dword2137+36]
	faddp
	mov	dword2139,[ebp-884]
	mov	dword2141,[ebp-880]
	fld	dword ptr [dword2139+12]
	fmul	dword ptr [dword2141+52]
	faddp
	mov	dword2143,[ebp-888]
	fstp	dword ptr [dword2143+4]
	mov	dword2145,[ebp-880]
	mov	dword2147,[ebp-884]
	fld	dword ptr [dword2147]
	fmul	dword ptr [dword2145+8]
	mov	dword2149,[ebp-884]
	mov	dword2151,[ebp-880]
	fld	dword ptr [dword2149+4]
	fmul	dword ptr [dword2151+24]
	faddp
	mov	dword2153,[ebp-884]
	mov	dword2155,[ebp-880]
	fld	dword ptr [dword2153+8]
	fmul	dword ptr [dword2155+40]
	faddp
	mov	dword2157,[ebp-884]
	mov	dword2159,[ebp-880]
	fld	dword ptr [dword2157+12]
	fmul	dword ptr [dword2159+56]
	faddp
	mov	dword2161,[ebp-888]
	fstp	dword ptr [dword2161+8]
	mov	dword2163,[ebp-880]
	mov	dword2165,[ebp-884]
	fld	dword ptr [dword2165]
	fmul	dword ptr [dword2163+12]
	mov	dword2167,[ebp-884]
	mov	dword2169,[ebp-880]
	fld	dword ptr [dword2167+4]
	fmul	dword ptr [dword2169+28]
	faddp
	mov	dword2171,[ebp-884]
	mov	dword2173,[ebp-880]
	fld	dword ptr [dword2171+8]
	fmul	dword ptr [dword2173+44]
	faddp
	mov	dword2175,[ebp-884]
	mov	dword2177,[ebp-880]
	fld	dword ptr [dword2175+12]
	fmul	dword ptr [dword2177+60]
	faddp
	mov	dword2179,[ebp-888]
	fstp	dword ptr [dword2179+12]
label0073:
; end of inline function matrix4f_transform
	lea	dword2076,[ebp-872]
	add	dword2076,12
	fld1
	fdiv	dword ptr [dword2076]
	fstp	dword ptr [ebp-876]
	fld	dword ptr [ebp-872]
	fmul	dword ptr [ebp-876]
	float2int	dword2081
	mov	dword2083,[ebp-856]
	mov	[dword2083],dword2081
	lea	dword2084,[ebp-872]
	add	dword2084,4
	fld	dword ptr [dword2084]
	fmul	dword ptr [ebp-876]
	float2int	dword2087
	mov	dword2089,[ebp-856]
	mov	[dword2089+4],dword2087
	mov	dword2091,[ebp-856]
	cmp	dword ptr [dword2091],0
	jl	label0072
	mov	dword2094,[ebp-856]
	mov	dword2096,[dword2094]
	cmp	dword2096,dword ptr [__width]
	jge	label0072
	mov	dword2098,[ebp-856]
	cmp	dword ptr [dword2098+4],0
	jl	label0072
	mov	dword2101,[ebp-856]
	mov	dword2103,[dword2101+4]
	cmp	dword2103,dword ptr [__height]
	jl	label0071
label0072:
	mov	dword ptr ds:[0],0
label0071:
label0074:
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
	fstp	dword ptr [ebp-520]
	fldz
	fstp	dword ptr [ebp-524]
	mov	dword159,8
	add	dword159,[ebp-340]
	mov	[ebp-528],dword159
	mov	dword161,8
	add	dword161,[ebp-344]
	mov	[ebp-532],dword161
	mov	dword163,8
	add	dword163,[ebp-348]
	mov	[ebp-536],dword163
	mov	dword165,[ebp-348]
	add	dword165,4
	mov	dword1323,[dword165]
	mov	[ebp-540],dword1323
	mov	dword168,[ebp-340]
	mov	dword1322,[dword168]
	mov	[ebp-544],dword1322
	mov	dword170,[ebp-344]
	mov	dword1321,[dword170]
	mov	[ebp-548],dword1321
	mov	dword172,[ebp-348]
	mov	dword1320,[dword172]
	mov	[ebp-552],dword1320
; start of inline function _rasterize_triangle_1i
	mov	dword1327,[ebp-552]
	cmp	dword1327,[ebp-548]
	jge	label0040
	mov	dword1330,[ebp-544]
	cmp	dword1330,[ebp-548]
	jle	label0041
	mov	dword1400,[ebp-520]
	mov	[ebp-556],dword1400
	mov	dword1399,[ebp-524]
	mov	[ebp-560],dword1399
	mov	dword1334,[ebp-536]
	mov	dword1398,[dword1334+4]
	mov	[ebp-564],dword1398
	mov	dword1336,[ebp-536]
	mov	dword1397,[dword1336]
	mov	[ebp-568],dword1397
	mov	dword1396,[ebp-540]
	mov	[ebp-572],dword1396
	mov	dword1395,[ebp-544]
	mov	[ebp-576],dword1395
	mov	dword1394,[ebp-552]
	mov	[ebp-580],dword1394
; start of inline function _rasterize_horiz_line
	mov	dword1404,dword ptr [__pitch]
	imul	dword1404,[ebp-572]
	add	dword1404,dword ptr [__videomem]
	mov	dword1408,[ebp-580]
	sal	dword1408,2
	add	dword1404,dword1408
	mov	[ebp-584],dword1404
	mov	dword1412,[ebp-576]
	sal	dword1412,2
	add	dword1412,[ebp-584]
	mov	dword1416,[ebp-580]
	sal	dword1416,2
	sub	dword1412,dword1416
	mov	[ebp-588],dword1412
label004a:
	mov	dword1482,[ebp-564]
	mov	[ebp-628],dword1482
	mov	dword1481,[ebp-568]
	mov	[ebp-632],dword1481
; start of inline function _tex2d
	mov	dword1486,dword ptr [__texture_width]
	dec	dword1486
	int2float	dword1486
	fmul	dword ptr [ebp-632]
	float2int	dword1488
	mov	[ebp-636],dword1488
	mov	dword1492,dword ptr [__texture_height]
	dec	dword1492
	int2float	dword1492
	fmul	dword ptr [ebp-628]
	float2int	dword1494
	mov	[ebp-640],dword1494
	mov	dword1498,[ebp-640]
	imul	dword1498,dword ptr [__texture_width]
	add	dword1498,[ebp-636]
	sal	dword1498,2
	add	dword1498,dword ptr [__texture_data]
	mov	dword1502,[dword1498]
	mov	[ebp-644],dword1502
label004e:
; end of inline function _tex2d
	mov	dword1420,[ebp-644]
	mov	[ebp-592],dword1420
	mov	dword1424,[ebp-592]
	sar	dword1424,24
	and	dword1424,255
	mov	[ebp-620],dword1424
	cmp	dword ptr [ebp-620],0
	je	label004d
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1432,[ebp-584]
	mov	dword1434,[dword1432]
	mov	[ebp-608],dword1434
	mov	dword1437,[ebp-608]
	and	dword1437,65280
	sar	dword1437,8
	mov	[ebp-612],dword1437
	mov	dword1442,[ebp-608]
	and	dword1442,255
	mov	[ebp-616],dword1442
	mov	dword1446,[ebp-592]
	and	dword1446,65280
	sar	dword1446,8
	mov	[ebp-600],dword1446
	mov	dword1451,[ebp-592]
	and	dword1451,255
	mov	[ebp-604],dword1451
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1457
	mov	[ebp-600],dword1457
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1463
	mov	[ebp-604],dword1463
	mov	dword1467,[ebp-600]
	sal	dword1467,8
	add	dword1467,[ebp-604]
	mov	[ebp-596],dword1467
	mov	dword1471,[ebp-584]
	mov	dword1473,[ebp-596]
	mov	[dword1471],dword1473
label004d:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label004b:
	add	dword ptr [ebp-584],4
	mov	dword1480,[ebp-584]
	cmp	dword1480,[ebp-588]
	jl	label004a
label004c:
label004f:
; end of inline function _rasterize_horiz_line
	jmp	label0042
label0041:
	mov	dword1342,[ebp-544]
	cmp	dword1342,[ebp-552]
	jge	label0043
	mov	dword1509,[ebp-520]
	mov	[ebp-556],dword1509
	mov	dword1508,[ebp-524]
	mov	[ebp-560],dword1508
	mov	dword1346,[ebp-528]
	mov	dword1507,[dword1346+4]
	mov	[ebp-564],dword1507
	mov	dword1348,[ebp-528]
	mov	dword1506,[dword1348]
	mov	[ebp-568],dword1506
	mov	dword1505,[ebp-540]
	mov	[ebp-572],dword1505
	mov	dword1504,[ebp-548]
	mov	[ebp-576],dword1504
	mov	dword1503,[ebp-544]
	mov	[ebp-580],dword1503
; start of inline function _rasterize_horiz_line
	mov	dword1513,dword ptr [__pitch]
	imul	dword1513,[ebp-572]
	add	dword1513,dword ptr [__videomem]
	mov	dword1517,[ebp-580]
	sal	dword1517,2
	add	dword1513,dword1517
	mov	[ebp-584],dword1513
	mov	dword1521,[ebp-576]
	sal	dword1521,2
	add	dword1521,[ebp-584]
	mov	dword1525,[ebp-580]
	sal	dword1525,2
	sub	dword1521,dword1525
	mov	[ebp-588],dword1521
label0050:
	mov	dword1591,[ebp-564]
	mov	[ebp-628],dword1591
	mov	dword1590,[ebp-568]
	mov	[ebp-632],dword1590
; start of inline function _tex2d
	mov	dword1595,dword ptr [__texture_width]
	dec	dword1595
	int2float	dword1595
	fmul	dword ptr [ebp-632]
	float2int	dword1597
	mov	[ebp-636],dword1597
	mov	dword1601,dword ptr [__texture_height]
	dec	dword1601
	int2float	dword1601
	fmul	dword ptr [ebp-628]
	float2int	dword1603
	mov	[ebp-640],dword1603
	mov	dword1607,[ebp-640]
	imul	dword1607,dword ptr [__texture_width]
	add	dword1607,[ebp-636]
	sal	dword1607,2
	add	dword1607,dword ptr [__texture_data]
	mov	dword1611,[dword1607]
	mov	[ebp-644],dword1611
label0054:
; end of inline function _tex2d
	mov	dword1529,[ebp-644]
	mov	[ebp-592],dword1529
	mov	dword1533,[ebp-592]
	sar	dword1533,24
	and	dword1533,255
	mov	[ebp-620],dword1533
	cmp	dword ptr [ebp-620],0
	je	label0053
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1541,[ebp-584]
	mov	dword1543,[dword1541]
	mov	[ebp-608],dword1543
	mov	dword1546,[ebp-608]
	and	dword1546,65280
	sar	dword1546,8
	mov	[ebp-612],dword1546
	mov	dword1551,[ebp-608]
	and	dword1551,255
	mov	[ebp-616],dword1551
	mov	dword1555,[ebp-592]
	and	dword1555,65280
	sar	dword1555,8
	mov	[ebp-600],dword1555
	mov	dword1560,[ebp-592]
	and	dword1560,255
	mov	[ebp-604],dword1560
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1566
	mov	[ebp-600],dword1566
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1572
	mov	[ebp-604],dword1572
	mov	dword1576,[ebp-600]
	sal	dword1576,8
	add	dword1576,[ebp-604]
	mov	[ebp-596],dword1576
	mov	dword1580,[ebp-584]
	mov	dword1582,[ebp-596]
	mov	[dword1580],dword1582
label0053:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0051:
	add	dword ptr [ebp-584],4
	mov	dword1589,[ebp-584]
	cmp	dword1589,[ebp-588]
	jl	label0050
label0052:
label0055:
; end of inline function _rasterize_horiz_line
	jmp	label0044
label0043:
	mov	dword1618,[ebp-520]
	mov	[ebp-556],dword1618
	mov	dword1617,[ebp-524]
	mov	[ebp-560],dword1617
	mov	dword1355,[ebp-536]
	mov	dword1616,[dword1355+4]
	mov	[ebp-564],dword1616
	mov	dword1357,[ebp-536]
	mov	dword1615,[dword1357]
	mov	[ebp-568],dword1615
	mov	dword1614,[ebp-540]
	mov	[ebp-572],dword1614
	mov	dword1613,[ebp-548]
	mov	[ebp-576],dword1613
	mov	dword1612,[ebp-552]
	mov	[ebp-580],dword1612
; start of inline function _rasterize_horiz_line
	mov	dword1622,dword ptr [__pitch]
	imul	dword1622,[ebp-572]
	add	dword1622,dword ptr [__videomem]
	mov	dword1626,[ebp-580]
	sal	dword1626,2
	add	dword1622,dword1626
	mov	[ebp-584],dword1622
	mov	dword1630,[ebp-576]
	sal	dword1630,2
	add	dword1630,[ebp-584]
	mov	dword1634,[ebp-580]
	sal	dword1634,2
	sub	dword1630,dword1634
	mov	[ebp-588],dword1630
label0056:
	mov	dword1700,[ebp-564]
	mov	[ebp-628],dword1700
	mov	dword1699,[ebp-568]
	mov	[ebp-632],dword1699
; start of inline function _tex2d
	mov	dword1704,dword ptr [__texture_width]
	dec	dword1704
	int2float	dword1704
	fmul	dword ptr [ebp-632]
	float2int	dword1706
	mov	[ebp-636],dword1706
	mov	dword1710,dword ptr [__texture_height]
	dec	dword1710
	int2float	dword1710
	fmul	dword ptr [ebp-628]
	float2int	dword1712
	mov	[ebp-640],dword1712
	mov	dword1716,[ebp-640]
	imul	dword1716,dword ptr [__texture_width]
	add	dword1716,[ebp-636]
	sal	dword1716,2
	add	dword1716,dword ptr [__texture_data]
	mov	dword1720,[dword1716]
	mov	[ebp-644],dword1720
label005a:
; end of inline function _tex2d
	mov	dword1638,[ebp-644]
	mov	[ebp-592],dword1638
	mov	dword1642,[ebp-592]
	sar	dword1642,24
	and	dword1642,255
	mov	[ebp-620],dword1642
	cmp	dword ptr [ebp-620],0
	je	label0059
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1650,[ebp-584]
	mov	dword1652,[dword1650]
	mov	[ebp-608],dword1652
	mov	dword1655,[ebp-608]
	and	dword1655,65280
	sar	dword1655,8
	mov	[ebp-612],dword1655
	mov	dword1660,[ebp-608]
	and	dword1660,255
	mov	[ebp-616],dword1660
	mov	dword1664,[ebp-592]
	and	dword1664,65280
	sar	dword1664,8
	mov	[ebp-600],dword1664
	mov	dword1669,[ebp-592]
	and	dword1669,255
	mov	[ebp-604],dword1669
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1675
	mov	[ebp-600],dword1675
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1681
	mov	[ebp-604],dword1681
	mov	dword1685,[ebp-600]
	sal	dword1685,8
	add	dword1685,[ebp-604]
	mov	[ebp-596],dword1685
	mov	dword1689,[ebp-584]
	mov	dword1691,[ebp-596]
	mov	[dword1689],dword1691
label0059:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0057:
	add	dword ptr [ebp-584],4
	mov	dword1698,[ebp-584]
	cmp	dword1698,[ebp-588]
	jl	label0056
label0058:
label005b:
; end of inline function _rasterize_horiz_line
label0044:
label0042:
	jmp	label0045
label0040:
	mov	dword1363,[ebp-544]
	cmp	dword1363,[ebp-548]
	jge	label0046
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	dword1367,[ebp-528]
	mov	dword1725,[dword1367+4]
	mov	[ebp-564],dword1725
	mov	dword1369,[ebp-528]
	mov	dword1724,[dword1369]
	mov	[ebp-568],dword1724
	mov	dword1723,[ebp-540]
	mov	[ebp-572],dword1723
	mov	dword1722,[ebp-552]
	mov	[ebp-576],dword1722
	mov	dword1721,[ebp-544]
	mov	[ebp-580],dword1721
; start of inline function _rasterize_horiz_line
	mov	dword1729,dword ptr [__pitch]
	imul	dword1729,[ebp-572]
	add	dword1729,dword ptr [__videomem]
	mov	dword1733,[ebp-580]
	sal	dword1733,2
	add	dword1729,dword1733
	mov	[ebp-584],dword1729
	mov	dword1737,[ebp-576]
	sal	dword1737,2
	add	dword1737,[ebp-584]
	mov	dword1741,[ebp-580]
	sal	dword1741,2
	sub	dword1737,dword1741
	mov	[ebp-588],dword1737
label005c:
	mov	dword1807,[ebp-564]
	mov	[ebp-628],dword1807
	mov	dword1806,[ebp-568]
	mov	[ebp-632],dword1806
; start of inline function _tex2d
	mov	dword1811,dword ptr [__texture_width]
	dec	dword1811
	int2float	dword1811
	fmul	dword ptr [ebp-632]
	float2int	dword1813
	mov	[ebp-636],dword1813
	mov	dword1817,dword ptr [__texture_height]
	dec	dword1817
	int2float	dword1817
	fmul	dword ptr [ebp-628]
	float2int	dword1819
	mov	[ebp-640],dword1819
	mov	dword1823,[ebp-640]
	imul	dword1823,dword ptr [__texture_width]
	add	dword1823,[ebp-636]
	sal	dword1823,2
	add	dword1823,dword ptr [__texture_data]
	mov	dword1827,[dword1823]
	mov	[ebp-644],dword1827
label0060:
; end of inline function _tex2d
	mov	dword1745,[ebp-644]
	mov	[ebp-592],dword1745
	mov	dword1749,[ebp-592]
	sar	dword1749,24
	and	dword1749,255
	mov	[ebp-620],dword1749
	cmp	dword ptr [ebp-620],0
	je	label005f
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1757,[ebp-584]
	mov	dword1759,[dword1757]
	mov	[ebp-608],dword1759
	mov	dword1762,[ebp-608]
	and	dword1762,65280
	sar	dword1762,8
	mov	[ebp-612],dword1762
	mov	dword1767,[ebp-608]
	and	dword1767,255
	mov	[ebp-616],dword1767
	mov	dword1771,[ebp-592]
	and	dword1771,65280
	sar	dword1771,8
	mov	[ebp-600],dword1771
	mov	dword1776,[ebp-592]
	and	dword1776,255
	mov	[ebp-604],dword1776
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1782
	mov	[ebp-600],dword1782
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1788
	mov	[ebp-604],dword1788
	mov	dword1792,[ebp-600]
	sal	dword1792,8
	add	dword1792,[ebp-604]
	mov	[ebp-596],dword1792
	mov	dword1796,[ebp-584]
	mov	dword1798,[ebp-596]
	mov	[dword1796],dword1798
label005f:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label005d:
	add	dword ptr [ebp-584],4
	mov	dword1805,[ebp-584]
	cmp	dword1805,[ebp-588]
	jl	label005c
label005e:
label0061:
; end of inline function _rasterize_horiz_line
	jmp	label0047
label0046:
	mov	dword1375,[ebp-544]
	cmp	dword1375,[ebp-552]
	jle	label0048
	fld	dword ptr [ebp-520]
	fldz
	fsubrp
	fstp	dword ptr [ebp-556]
	fld	dword ptr [ebp-524]
	fldz
	fsubrp
	fstp	dword ptr [ebp-560]
	mov	dword1379,[ebp-532]
	mov	dword1832,[dword1379+4]
	mov	[ebp-564],dword1832
	mov	dword1381,[ebp-532]
	mov	dword1831,[dword1381]
	mov	[ebp-568],dword1831
	mov	dword1830,[ebp-540]
	mov	[ebp-572],dword1830
	mov	dword1829,[ebp-544]
	mov	[ebp-576],dword1829
	mov	dword1828,[ebp-548]
	mov	[ebp-580],dword1828
; start of inline function _rasterize_horiz_line
	mov	dword1836,dword ptr [__pitch]
	imul	dword1836,[ebp-572]
	add	dword1836,dword ptr [__videomem]
	mov	dword1840,[ebp-580]
	sal	dword1840,2
	add	dword1836,dword1840
	mov	[ebp-584],dword1836
	mov	dword1844,[ebp-576]
	sal	dword1844,2
	add	dword1844,[ebp-584]
	mov	dword1848,[ebp-580]
	sal	dword1848,2
	sub	dword1844,dword1848
	mov	[ebp-588],dword1844
label0062:
	mov	dword1914,[ebp-564]
	mov	[ebp-628],dword1914
	mov	dword1913,[ebp-568]
	mov	[ebp-632],dword1913
; start of inline function _tex2d
	mov	dword1918,dword ptr [__texture_width]
	dec	dword1918
	int2float	dword1918
	fmul	dword ptr [ebp-632]
	float2int	dword1920
	mov	[ebp-636],dword1920
	mov	dword1924,dword ptr [__texture_height]
	dec	dword1924
	int2float	dword1924
	fmul	dword ptr [ebp-628]
	float2int	dword1926
	mov	[ebp-640],dword1926
	mov	dword1930,[ebp-640]
	imul	dword1930,dword ptr [__texture_width]
	add	dword1930,[ebp-636]
	sal	dword1930,2
	add	dword1930,dword ptr [__texture_data]
	mov	dword1934,[dword1930]
	mov	[ebp-644],dword1934
label0066:
; end of inline function _tex2d
	mov	dword1852,[ebp-644]
	mov	[ebp-592],dword1852
	mov	dword1856,[ebp-592]
	sar	dword1856,24
	and	dword1856,255
	mov	[ebp-620],dword1856
	cmp	dword ptr [ebp-620],0
	je	label0065
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1864,[ebp-584]
	mov	dword1866,[dword1864]
	mov	[ebp-608],dword1866
	mov	dword1869,[ebp-608]
	and	dword1869,65280
	sar	dword1869,8
	mov	[ebp-612],dword1869
	mov	dword1874,[ebp-608]
	and	dword1874,255
	mov	[ebp-616],dword1874
	mov	dword1878,[ebp-592]
	and	dword1878,65280
	sar	dword1878,8
	mov	[ebp-600],dword1878
	mov	dword1883,[ebp-592]
	and	dword1883,255
	mov	[ebp-604],dword1883
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1889
	mov	[ebp-600],dword1889
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1895
	mov	[ebp-604],dword1895
	mov	dword1899,[ebp-600]
	sal	dword1899,8
	add	dword1899,[ebp-604]
	mov	[ebp-596],dword1899
	mov	dword1903,[ebp-584]
	mov	dword1905,[ebp-596]
	mov	[dword1903],dword1905
label0065:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0063:
	add	dword ptr [ebp-584],4
	mov	dword1912,[ebp-584]
	cmp	dword1912,[ebp-588]
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
	mov	dword1388,[ebp-532]
	mov	dword1939,[dword1388+4]
	mov	[ebp-564],dword1939
	mov	dword1390,[ebp-532]
	mov	dword1938,[dword1390]
	mov	[ebp-568],dword1938
	mov	dword1937,[ebp-540]
	mov	[ebp-572],dword1937
	mov	dword1936,[ebp-552]
	mov	[ebp-576],dword1936
	mov	dword1935,[ebp-548]
	mov	[ebp-580],dword1935
; start of inline function _rasterize_horiz_line
	mov	dword1943,dword ptr [__pitch]
	imul	dword1943,[ebp-572]
	add	dword1943,dword ptr [__videomem]
	mov	dword1947,[ebp-580]
	sal	dword1947,2
	add	dword1943,dword1947
	mov	[ebp-584],dword1943
	mov	dword1951,[ebp-576]
	sal	dword1951,2
	add	dword1951,[ebp-584]
	mov	dword1955,[ebp-580]
	sal	dword1955,2
	sub	dword1951,dword1955
	mov	[ebp-588],dword1951
label0068:
	mov	dword2021,[ebp-564]
	mov	[ebp-628],dword2021
	mov	dword2020,[ebp-568]
	mov	[ebp-632],dword2020
; start of inline function _tex2d
	mov	dword2025,dword ptr [__texture_width]
	dec	dword2025
	int2float	dword2025
	fmul	dword ptr [ebp-632]
	float2int	dword2027
	mov	[ebp-636],dword2027
	mov	dword2031,dword ptr [__texture_height]
	dec	dword2031
	int2float	dword2031
	fmul	dword ptr [ebp-628]
	float2int	dword2033
	mov	[ebp-640],dword2033
	mov	dword2037,[ebp-640]
	imul	dword2037,dword ptr [__texture_width]
	add	dword2037,[ebp-636]
	sal	dword2037,2
	add	dword2037,dword ptr [__texture_data]
	mov	dword2041,[dword2037]
	mov	[ebp-644],dword2041
label006c:
; end of inline function _tex2d
	mov	dword1959,[ebp-644]
	mov	[ebp-592],dword1959
	mov	dword1963,[ebp-592]
	sar	dword1963,24
	and	dword1963,255
	mov	[ebp-620],dword1963
	cmp	dword ptr [ebp-620],0
	je	label006b
	fild	dword ptr [ebp-620]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-624]
	mov	dword1971,[ebp-584]
	mov	dword1973,[dword1971]
	mov	[ebp-608],dword1973
	mov	dword1976,[ebp-608]
	and	dword1976,65280
	sar	dword1976,8
	mov	[ebp-612],dword1976
	mov	dword1981,[ebp-608]
	and	dword1981,255
	mov	[ebp-616],dword1981
	mov	dword1985,[ebp-592]
	and	dword1985,65280
	sar	dword1985,8
	mov	[ebp-600],dword1985
	mov	dword1990,[ebp-592]
	and	dword1990,255
	mov	[ebp-604],dword1990
	fild	dword ptr [ebp-600]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-612]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword1996
	mov	[ebp-600],dword1996
	fild	dword ptr [ebp-604]
	fmul	dword ptr [ebp-624]
	fild	dword ptr [ebp-616]
	fld1
	fsub	dword ptr [ebp-624]
	fmulp
	faddp
	float2int	dword2002
	mov	[ebp-604],dword2002
	mov	dword2006,[ebp-600]
	sal	dword2006,8
	add	dword2006,[ebp-604]
	mov	[ebp-596],dword2006
	mov	dword2010,[ebp-584]
	mov	dword2012,[ebp-596]
	mov	[dword2010],dword2012
label006b:
	fld	dword ptr [ebp-568]
	fadd	dword ptr [ebp-560]
	fstp	dword ptr [ebp-568]
	fld	dword ptr [ebp-564]
	fadd	dword ptr [ebp-556]
	fstp	dword ptr [ebp-564]
label0069:
	add	dword ptr [ebp-584],4
	mov	dword2019,[ebp-584]
	cmp	dword2019,[ebp-588]
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
	mov	dword618,[ebp-392]
	mov	[ebp-428],dword618
	mov	dword617,[ebp-396]
	mov	[ebp-432],dword617
	mov	dword616,[ebp-408]
	mov	[ebp-436],dword616
	mov	dword615,[ebp-412]
	mov	[ebp-440],dword615
	mov	dword614,[ebp-416]
	mov	[ebp-444],dword614
	mov	dword613,[ebp-420]
	mov	[ebp-448],dword613
	mov	dword612,[ebp-424]
	mov	[ebp-452],dword612
; start of inline function _rasterize_horiz_line
	mov	dword622,dword ptr [__pitch]
	imul	dword622,[ebp-444]
	add	dword622,dword ptr [__videomem]
	mov	dword626,[ebp-452]
	sal	dword626,2
	add	dword622,dword626
	mov	[ebp-456],dword622
	mov	dword630,[ebp-448]
	sal	dword630,2
	add	dword630,[ebp-456]
	mov	dword634,[ebp-452]
	sal	dword634,2
	sub	dword630,dword634
	mov	[ebp-460],dword630
label0015:
	mov	dword700,[ebp-436]
	mov	[ebp-500],dword700
	mov	dword699,[ebp-440]
	mov	[ebp-504],dword699
; start of inline function _tex2d
	mov	dword704,dword ptr [__texture_width]
	dec	dword704
	int2float	dword704
	fmul	dword ptr [ebp-504]
	float2int	dword706
	mov	[ebp-508],dword706
	mov	dword710,dword ptr [__texture_height]
	dec	dword710
	int2float	dword710
	fmul	dword ptr [ebp-500]
	float2int	dword712
	mov	[ebp-512],dword712
	mov	dword716,[ebp-512]
	imul	dword716,dword ptr [__texture_width]
	add	dword716,[ebp-508]
	sal	dword716,2
	add	dword716,dword ptr [__texture_data]
	mov	dword720,[dword716]
	mov	[ebp-516],dword720
label0019:
; end of inline function _tex2d
	mov	dword638,[ebp-516]
	mov	[ebp-464],dword638
	mov	dword642,[ebp-464]
	sar	dword642,24
	and	dword642,255
	mov	[ebp-492],dword642
	cmp	dword ptr [ebp-492],0
	je	label0018
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword650,[ebp-456]
	mov	dword652,[dword650]
	mov	[ebp-480],dword652
	mov	dword655,[ebp-480]
	and	dword655,65280
	sar	dword655,8
	mov	[ebp-484],dword655
	mov	dword660,[ebp-480]
	and	dword660,255
	mov	[ebp-488],dword660
	mov	dword664,[ebp-464]
	and	dword664,65280
	sar	dword664,8
	mov	[ebp-472],dword664
	mov	dword669,[ebp-464]
	and	dword669,255
	mov	[ebp-476],dword669
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword675
	mov	[ebp-472],dword675
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword681
	mov	[ebp-476],dword681
	mov	dword685,[ebp-472]
	sal	dword685,8
	add	dword685,[ebp-476]
	mov	[ebp-468],dword685
	mov	dword689,[ebp-456]
	mov	dword691,[ebp-468]
	mov	[dword689],dword691
label0018:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0016:
	add	dword ptr [ebp-456],4
	mov	dword698,[ebp-456]
	cmp	dword698,[ebp-460]
	jl	label0015
label0017:
label001a:
; end of inline function _rasterize_horiz_line
	jmp	label0014
label0013:
	mov	dword727,[ebp-392]
	mov	[ebp-428],dword727
	mov	dword726,[ebp-396]
	mov	[ebp-432],dword726
	mov	dword725,[ebp-400]
	mov	[ebp-436],dword725
	mov	dword724,[ebp-404]
	mov	[ebp-440],dword724
	mov	dword723,[ebp-416]
	mov	[ebp-444],dword723
	mov	dword722,[ebp-424]
	mov	[ebp-448],dword722
	mov	dword721,[ebp-420]
	mov	[ebp-452],dword721
; start of inline function _rasterize_horiz_line
	mov	dword731,dword ptr [__pitch]
	imul	dword731,[ebp-444]
	add	dword731,dword ptr [__videomem]
	mov	dword735,[ebp-452]
	sal	dword735,2
	add	dword731,dword735
	mov	[ebp-456],dword731
	mov	dword739,[ebp-448]
	sal	dword739,2
	add	dword739,[ebp-456]
	mov	dword743,[ebp-452]
	sal	dword743,2
	sub	dword739,dword743
	mov	[ebp-460],dword739
label001b:
	mov	dword809,[ebp-436]
	mov	[ebp-500],dword809
	mov	dword808,[ebp-440]
	mov	[ebp-504],dword808
; start of inline function _tex2d
	mov	dword813,dword ptr [__texture_width]
	dec	dword813
	int2float	dword813
	fmul	dword ptr [ebp-504]
	float2int	dword815
	mov	[ebp-508],dword815
	mov	dword819,dword ptr [__texture_height]
	dec	dword819
	int2float	dword819
	fmul	dword ptr [ebp-500]
	float2int	dword821
	mov	[ebp-512],dword821
	mov	dword825,[ebp-512]
	imul	dword825,dword ptr [__texture_width]
	add	dword825,[ebp-508]
	sal	dword825,2
	add	dword825,dword ptr [__texture_data]
	mov	dword829,[dword825]
	mov	[ebp-516],dword829
label001f:
; end of inline function _tex2d
	mov	dword747,[ebp-516]
	mov	[ebp-464],dword747
	mov	dword751,[ebp-464]
	sar	dword751,24
	and	dword751,255
	mov	[ebp-492],dword751
	cmp	dword ptr [ebp-492],0
	je	label001e
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword759,[ebp-456]
	mov	dword761,[dword759]
	mov	[ebp-480],dword761
	mov	dword764,[ebp-480]
	and	dword764,65280
	sar	dword764,8
	mov	[ebp-484],dword764
	mov	dword769,[ebp-480]
	and	dword769,255
	mov	[ebp-488],dword769
	mov	dword773,[ebp-464]
	and	dword773,65280
	sar	dword773,8
	mov	[ebp-472],dword773
	mov	dword778,[ebp-464]
	and	dword778,255
	mov	[ebp-476],dword778
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword784
	mov	[ebp-472],dword784
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword790
	mov	[ebp-476],dword790
	mov	dword794,[ebp-472]
	sal	dword794,8
	add	dword794,[ebp-476]
	mov	[ebp-468],dword794
	mov	dword798,[ebp-456]
	mov	dword800,[ebp-468]
	mov	[dword798],dword800
label001e:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label001c:
	add	dword ptr [ebp-456],4
	mov	dword807,[ebp-456]
	cmp	dword807,[ebp-460]
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
	mov	dword838,[ebp-388]
	mov	[ebp-392],dword838
	mov	dword837,[ebp-384]
	mov	[ebp-396],dword837
	mov	dword417,8
	add	dword417,[ebp-344]
	add	dword417,4
	mov	dword836,[dword417]
	mov	[ebp-400],dword836
	mov	dword420,[ebp-344]
	mov	dword835,[dword420+8]
	mov	[ebp-404],dword835
	mov	dword834,[ebp-380]
	mov	[ebp-408],dword834
	mov	dword833,[ebp-376]
	mov	[ebp-412],dword833
	mov	dword424,[ebp-344]
	add	dword424,4
	mov	dword832,[dword424]
	mov	[ebp-416],dword832
	mov	dword427,[ebp-344]
	mov	dword831,[dword427]
	mov	[ebp-420],dword831
	mov	dword830,[ebp-360]
	mov	[ebp-424],dword830
; start of inline function _rasterize_horiz_line__unordered
	mov	dword842,[ebp-424]
	cmp	dword842,[ebp-420]
	jg	label0022
	mov	dword863,[ebp-392]
	mov	[ebp-428],dword863
	mov	dword862,[ebp-396]
	mov	[ebp-432],dword862
	mov	dword861,[ebp-408]
	mov	[ebp-436],dword861
	mov	dword860,[ebp-412]
	mov	[ebp-440],dword860
	mov	dword859,[ebp-416]
	mov	[ebp-444],dword859
	mov	dword858,[ebp-420]
	mov	[ebp-448],dword858
	mov	dword857,[ebp-424]
	mov	[ebp-452],dword857
; start of inline function _rasterize_horiz_line
	mov	dword867,dword ptr [__pitch]
	imul	dword867,[ebp-444]
	add	dword867,dword ptr [__videomem]
	mov	dword871,[ebp-452]
	sal	dword871,2
	add	dword867,dword871
	mov	[ebp-456],dword867
	mov	dword875,[ebp-448]
	sal	dword875,2
	add	dword875,[ebp-456]
	mov	dword879,[ebp-452]
	sal	dword879,2
	sub	dword875,dword879
	mov	[ebp-460],dword875
label0024:
	mov	dword945,[ebp-436]
	mov	[ebp-500],dword945
	mov	dword944,[ebp-440]
	mov	[ebp-504],dword944
; start of inline function _tex2d
	mov	dword949,dword ptr [__texture_width]
	dec	dword949
	int2float	dword949
	fmul	dword ptr [ebp-504]
	float2int	dword951
	mov	[ebp-508],dword951
	mov	dword955,dword ptr [__texture_height]
	dec	dword955
	int2float	dword955
	fmul	dword ptr [ebp-500]
	float2int	dword957
	mov	[ebp-512],dword957
	mov	dword961,[ebp-512]
	imul	dword961,dword ptr [__texture_width]
	add	dword961,[ebp-508]
	sal	dword961,2
	add	dword961,dword ptr [__texture_data]
	mov	dword965,[dword961]
	mov	[ebp-516],dword965
label0028:
; end of inline function _tex2d
	mov	dword883,[ebp-516]
	mov	[ebp-464],dword883
	mov	dword887,[ebp-464]
	sar	dword887,24
	and	dword887,255
	mov	[ebp-492],dword887
	cmp	dword ptr [ebp-492],0
	je	label0027
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword895,[ebp-456]
	mov	dword897,[dword895]
	mov	[ebp-480],dword897
	mov	dword900,[ebp-480]
	and	dword900,65280
	sar	dword900,8
	mov	[ebp-484],dword900
	mov	dword905,[ebp-480]
	and	dword905,255
	mov	[ebp-488],dword905
	mov	dword909,[ebp-464]
	and	dword909,65280
	sar	dword909,8
	mov	[ebp-472],dword909
	mov	dword914,[ebp-464]
	and	dword914,255
	mov	[ebp-476],dword914
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword920
	mov	[ebp-472],dword920
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword926
	mov	[ebp-476],dword926
	mov	dword930,[ebp-472]
	sal	dword930,8
	add	dword930,[ebp-476]
	mov	[ebp-468],dword930
	mov	dword934,[ebp-456]
	mov	dword936,[ebp-468]
	mov	[dword934],dword936
label0027:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0025:
	add	dword ptr [ebp-456],4
	mov	dword943,[ebp-456]
	cmp	dword943,[ebp-460]
	jl	label0024
label0026:
label0029:
; end of inline function _rasterize_horiz_line
	jmp	label0023
label0022:
	mov	dword972,[ebp-392]
	mov	[ebp-428],dword972
	mov	dword971,[ebp-396]
	mov	[ebp-432],dword971
	mov	dword970,[ebp-400]
	mov	[ebp-436],dword970
	mov	dword969,[ebp-404]
	mov	[ebp-440],dword969
	mov	dword968,[ebp-416]
	mov	[ebp-444],dword968
	mov	dword967,[ebp-424]
	mov	[ebp-448],dword967
	mov	dword966,[ebp-420]
	mov	[ebp-452],dword966
; start of inline function _rasterize_horiz_line
	mov	dword976,dword ptr [__pitch]
	imul	dword976,[ebp-444]
	add	dword976,dword ptr [__videomem]
	mov	dword980,[ebp-452]
	sal	dword980,2
	add	dword976,dword980
	mov	[ebp-456],dword976
	mov	dword984,[ebp-448]
	sal	dword984,2
	add	dword984,[ebp-456]
	mov	dword988,[ebp-452]
	sal	dword988,2
	sub	dword984,dword988
	mov	[ebp-460],dword984
label002a:
	mov	dword1054,[ebp-436]
	mov	[ebp-500],dword1054
	mov	dword1053,[ebp-440]
	mov	[ebp-504],dword1053
; start of inline function _tex2d
	mov	dword1058,dword ptr [__texture_width]
	dec	dword1058
	int2float	dword1058
	fmul	dword ptr [ebp-504]
	float2int	dword1060
	mov	[ebp-508],dword1060
	mov	dword1064,dword ptr [__texture_height]
	dec	dword1064
	int2float	dword1064
	fmul	dword ptr [ebp-500]
	float2int	dword1066
	mov	[ebp-512],dword1066
	mov	dword1070,[ebp-512]
	imul	dword1070,dword ptr [__texture_width]
	add	dword1070,[ebp-508]
	sal	dword1070,2
	add	dword1070,dword ptr [__texture_data]
	mov	dword1074,[dword1070]
	mov	[ebp-516],dword1074
label002e:
; end of inline function _tex2d
	mov	dword992,[ebp-516]
	mov	[ebp-464],dword992
	mov	dword996,[ebp-464]
	sar	dword996,24
	and	dword996,255
	mov	[ebp-492],dword996
	cmp	dword ptr [ebp-492],0
	je	label002d
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword1004,[ebp-456]
	mov	dword1006,[dword1004]
	mov	[ebp-480],dword1006
	mov	dword1009,[ebp-480]
	and	dword1009,65280
	sar	dword1009,8
	mov	[ebp-484],dword1009
	mov	dword1014,[ebp-480]
	and	dword1014,255
	mov	[ebp-488],dword1014
	mov	dword1018,[ebp-464]
	and	dword1018,65280
	sar	dword1018,8
	mov	[ebp-472],dword1018
	mov	dword1023,[ebp-464]
	and	dword1023,255
	mov	[ebp-476],dword1023
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1029
	mov	[ebp-472],dword1029
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1035
	mov	[ebp-476],dword1035
	mov	dword1039,[ebp-472]
	sal	dword1039,8
	add	dword1039,[ebp-476]
	mov	[ebp-468],dword1039
	mov	dword1043,[ebp-456]
	mov	dword1045,[ebp-468]
	mov	[dword1043],dword1045
label002d:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label002b:
	add	dword ptr [ebp-456],4
	mov	dword1052,[ebp-456]
	cmp	dword1052,[ebp-460]
	jl	label002a
label002c:
label002f:
; end of inline function _rasterize_horiz_line
label0023:
label0030:
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
	mov	dword1083,[ebp-388]
	mov	[ebp-392],dword1083
	mov	dword1082,[ebp-384]
	mov	[ebp-396],dword1082
	mov	dword1081,[ebp-380]
	mov	[ebp-400],dword1081
	mov	dword1080,[ebp-376]
	mov	[ebp-404],dword1080
	mov	dword1079,[ebp-372]
	mov	[ebp-408],dword1079
	mov	dword1078,[ebp-368]
	mov	[ebp-412],dword1078
	mov	dword1077,[ebp-364]
	mov	[ebp-416],dword1077
	mov	dword1076,[ebp-360]
	mov	[ebp-420],dword1076
	mov	dword1075,[ebp-356]
	mov	[ebp-424],dword1075
; start of inline function _rasterize_horiz_line__unordered
	mov	dword1087,[ebp-424]
	cmp	dword1087,[ebp-420]
	jg	label0031
	mov	dword1108,[ebp-392]
	mov	[ebp-428],dword1108
	mov	dword1107,[ebp-396]
	mov	[ebp-432],dword1107
	mov	dword1106,[ebp-408]
	mov	[ebp-436],dword1106
	mov	dword1105,[ebp-412]
	mov	[ebp-440],dword1105
	mov	dword1104,[ebp-416]
	mov	[ebp-444],dword1104
	mov	dword1103,[ebp-420]
	mov	[ebp-448],dword1103
	mov	dword1102,[ebp-424]
	mov	[ebp-452],dword1102
; start of inline function _rasterize_horiz_line
	mov	dword1112,dword ptr [__pitch]
	imul	dword1112,[ebp-444]
	add	dword1112,dword ptr [__videomem]
	mov	dword1116,[ebp-452]
	sal	dword1116,2
	add	dword1112,dword1116
	mov	[ebp-456],dword1112
	mov	dword1120,[ebp-448]
	sal	dword1120,2
	add	dword1120,[ebp-456]
	mov	dword1124,[ebp-452]
	sal	dword1124,2
	sub	dword1120,dword1124
	mov	[ebp-460],dword1120
label0033:
	mov	dword1190,[ebp-436]
	mov	[ebp-500],dword1190
	mov	dword1189,[ebp-440]
	mov	[ebp-504],dword1189
; start of inline function _tex2d
	mov	dword1194,dword ptr [__texture_width]
	dec	dword1194
	int2float	dword1194
	fmul	dword ptr [ebp-504]
	float2int	dword1196
	mov	[ebp-508],dword1196
	mov	dword1200,dword ptr [__texture_height]
	dec	dword1200
	int2float	dword1200
	fmul	dword ptr [ebp-500]
	float2int	dword1202
	mov	[ebp-512],dword1202
	mov	dword1206,[ebp-512]
	imul	dword1206,dword ptr [__texture_width]
	add	dword1206,[ebp-508]
	sal	dword1206,2
	add	dword1206,dword ptr [__texture_data]
	mov	dword1210,[dword1206]
	mov	[ebp-516],dword1210
label0037:
; end of inline function _tex2d
	mov	dword1128,[ebp-516]
	mov	[ebp-464],dword1128
	mov	dword1132,[ebp-464]
	sar	dword1132,24
	and	dword1132,255
	mov	[ebp-492],dword1132
	cmp	dword ptr [ebp-492],0
	je	label0036
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword1140,[ebp-456]
	mov	dword1142,[dword1140]
	mov	[ebp-480],dword1142
	mov	dword1145,[ebp-480]
	and	dword1145,65280
	sar	dword1145,8
	mov	[ebp-484],dword1145
	mov	dword1150,[ebp-480]
	and	dword1150,255
	mov	[ebp-488],dword1150
	mov	dword1154,[ebp-464]
	and	dword1154,65280
	sar	dword1154,8
	mov	[ebp-472],dword1154
	mov	dword1159,[ebp-464]
	and	dword1159,255
	mov	[ebp-476],dword1159
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1165
	mov	[ebp-472],dword1165
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1171
	mov	[ebp-476],dword1171
	mov	dword1175,[ebp-472]
	sal	dword1175,8
	add	dword1175,[ebp-476]
	mov	[ebp-468],dword1175
	mov	dword1179,[ebp-456]
	mov	dword1181,[ebp-468]
	mov	[dword1179],dword1181
label0036:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label0034:
	add	dword ptr [ebp-456],4
	mov	dword1188,[ebp-456]
	cmp	dword1188,[ebp-460]
	jl	label0033
label0035:
label0038:
; end of inline function _rasterize_horiz_line
	jmp	label0032
label0031:
	mov	dword1217,[ebp-392]
	mov	[ebp-428],dword1217
	mov	dword1216,[ebp-396]
	mov	[ebp-432],dword1216
	mov	dword1215,[ebp-400]
	mov	[ebp-436],dword1215
	mov	dword1214,[ebp-404]
	mov	[ebp-440],dword1214
	mov	dword1213,[ebp-416]
	mov	[ebp-444],dword1213
	mov	dword1212,[ebp-424]
	mov	[ebp-448],dword1212
	mov	dword1211,[ebp-420]
	mov	[ebp-452],dword1211
; start of inline function _rasterize_horiz_line
	mov	dword1221,dword ptr [__pitch]
	imul	dword1221,[ebp-444]
	add	dword1221,dword ptr [__videomem]
	mov	dword1225,[ebp-452]
	sal	dword1225,2
	add	dword1221,dword1225
	mov	[ebp-456],dword1221
	mov	dword1229,[ebp-448]
	sal	dword1229,2
	add	dword1229,[ebp-456]
	mov	dword1233,[ebp-452]
	sal	dword1233,2
	sub	dword1229,dword1233
	mov	[ebp-460],dword1229
label0039:
	mov	dword1299,[ebp-436]
	mov	[ebp-500],dword1299
	mov	dword1298,[ebp-440]
	mov	[ebp-504],dword1298
; start of inline function _tex2d
	mov	dword1303,dword ptr [__texture_width]
	dec	dword1303
	int2float	dword1303
	fmul	dword ptr [ebp-504]
	float2int	dword1305
	mov	[ebp-508],dword1305
	mov	dword1309,dword ptr [__texture_height]
	dec	dword1309
	int2float	dword1309
	fmul	dword ptr [ebp-500]
	float2int	dword1311
	mov	[ebp-512],dword1311
	mov	dword1315,[ebp-512]
	imul	dword1315,dword ptr [__texture_width]
	add	dword1315,[ebp-508]
	sal	dword1315,2
	add	dword1315,dword ptr [__texture_data]
	mov	dword1319,[dword1315]
	mov	[ebp-516],dword1319
label003d:
; end of inline function _tex2d
	mov	dword1237,[ebp-516]
	mov	[ebp-464],dword1237
	mov	dword1241,[ebp-464]
	sar	dword1241,24
	and	dword1241,255
	mov	[ebp-492],dword1241
	cmp	dword ptr [ebp-492],0
	je	label003c
	fild	dword ptr [ebp-492]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-496]
	mov	dword1249,[ebp-456]
	mov	dword1251,[dword1249]
	mov	[ebp-480],dword1251
	mov	dword1254,[ebp-480]
	and	dword1254,65280
	sar	dword1254,8
	mov	[ebp-484],dword1254
	mov	dword1259,[ebp-480]
	and	dword1259,255
	mov	[ebp-488],dword1259
	mov	dword1263,[ebp-464]
	and	dword1263,65280
	sar	dword1263,8
	mov	[ebp-472],dword1263
	mov	dword1268,[ebp-464]
	and	dword1268,255
	mov	[ebp-476],dword1268
	fild	dword ptr [ebp-472]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-484]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1274
	mov	[ebp-472],dword1274
	fild	dword ptr [ebp-476]
	fmul	dword ptr [ebp-496]
	fild	dword ptr [ebp-488]
	fld1
	fsub	dword ptr [ebp-496]
	fmulp
	faddp
	float2int	dword1280
	mov	[ebp-476],dword1280
	mov	dword1284,[ebp-472]
	sal	dword1284,8
	add	dword1284,[ebp-476]
	mov	[ebp-468],dword1284
	mov	dword1288,[ebp-456]
	mov	dword1290,[ebp-468]
	mov	[dword1288],dword1290
label003c:
	fld	dword ptr [ebp-440]
	fadd	dword ptr [ebp-432]
	fstp	dword ptr [ebp-440]
	fld	dword ptr [ebp-436]
	fadd	dword ptr [ebp-428]
	fstp	dword ptr [ebp-436]
label003a:
	add	dword ptr [ebp-456],4
	mov	dword1297,[ebp-456]
	cmp	dword1297,[ebp-460]
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
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
