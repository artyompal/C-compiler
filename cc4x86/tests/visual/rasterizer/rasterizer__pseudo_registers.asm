
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

_rasterizer_triangle3f proc
	create_stack_frame
	mov	dword4292,[ebp+8]
	mov	[ebp-1044],dword4292
	lea	dword2,[ebp-196]
	mov	[ebp-1048],dword2
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4295,[ebp-1044]
	mov	dword4306,[dword4295+8]
	mov	[ebp-1072],dword4306
	mov	dword4297,[ebp-1044]
	mov	dword4305,[dword4297+4]
	mov	[ebp-1076],dword4305
	mov	dword4299,[ebp-1044]
	mov	dword4304,[dword4299]
	mov	[ebp-1080],dword4304
	lea	dword4300,[ebp-1064]
	mov	[ebp-1084],dword4300
; start of inline function vec4f_assign
	mov	dword4309,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4309]
	mov	dword4312,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4312+4]
	mov	dword4315,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4315+8]
	mov	dword4318,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4318+12]
label00f4:
; end of inline function vec4f_assign
	lea	dword4301,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4301
	lea	dword4302,[ebp-1064]
	mov	[ebp-1092],dword4302
	mov	dword4320,[ebp-1048]
	mov	[ebp-1096],dword4320
; start of inline function matrix4f_transform
	mov	dword4323,[ebp-1092]
	mov	dword4325,[ebp-1088]
	fld	dword ptr [dword4323+4]
	fmul	dword ptr [dword4325+16]
	mov	dword4327,[ebp-1092]
	mov	dword4329,[ebp-1088]
	fld	dword ptr [dword4327]
	fmul	dword ptr [dword4329]
	faddp
	mov	dword4331,[ebp-1092]
	mov	dword4333,[ebp-1088]
	fld	dword ptr [dword4331+8]
	fmul	dword ptr [dword4333+32]
	faddp
	mov	dword4335,[ebp-1092]
	mov	dword4337,[ebp-1088]
	fld	dword ptr [dword4335+12]
	fmul	dword ptr [dword4337+48]
	faddp
	mov	dword4339,[ebp-1096]
	fstp	dword ptr [dword4339]
	mov	dword4341,[ebp-1088]
	mov	dword4343,[ebp-1092]
	fld	dword ptr [dword4343]
	fmul	dword ptr [dword4341+4]
	mov	dword4345,[ebp-1092]
	mov	dword4347,[ebp-1088]
	fld	dword ptr [dword4345+4]
	fmul	dword ptr [dword4347+20]
	faddp
	mov	dword4349,[ebp-1092]
	mov	dword4351,[ebp-1088]
	fld	dword ptr [dword4349+8]
	fmul	dword ptr [dword4351+36]
	faddp
	mov	dword4353,[ebp-1092]
	mov	dword4355,[ebp-1088]
	fld	dword ptr [dword4353+12]
	fmul	dword ptr [dword4355+52]
	faddp
	mov	dword4357,[ebp-1096]
	fstp	dword ptr [dword4357+4]
	mov	dword4359,[ebp-1088]
	mov	dword4361,[ebp-1092]
	fld	dword ptr [dword4361]
	fmul	dword ptr [dword4359+8]
	mov	dword4363,[ebp-1092]
	mov	dword4365,[ebp-1088]
	fld	dword ptr [dword4363+4]
	fmul	dword ptr [dword4365+24]
	faddp
	mov	dword4367,[ebp-1092]
	mov	dword4369,[ebp-1088]
	fld	dword ptr [dword4367+8]
	fmul	dword ptr [dword4369+40]
	faddp
	mov	dword4371,[ebp-1092]
	mov	dword4373,[ebp-1088]
	fld	dword ptr [dword4371+12]
	fmul	dword ptr [dword4373+56]
	faddp
	mov	dword4375,[ebp-1096]
	fstp	dword ptr [dword4375+8]
	mov	dword4377,[ebp-1088]
	mov	dword4379,[ebp-1092]
	fld	dword ptr [dword4379]
	fmul	dword ptr [dword4377+12]
	mov	dword4381,[ebp-1092]
	mov	dword4383,[ebp-1088]
	fld	dword ptr [dword4381+4]
	fmul	dword ptr [dword4383+28]
	faddp
	mov	dword4385,[ebp-1092]
	mov	dword4387,[ebp-1088]
	fld	dword ptr [dword4385+8]
	fmul	dword ptr [dword4387+44]
	faddp
	mov	dword4389,[ebp-1092]
	mov	dword4391,[ebp-1088]
	fld	dword ptr [dword4389+12]
	fmul	dword ptr [dword4391+60]
	faddp
	mov	dword4393,[ebp-1096]
	fstp	dword ptr [dword4393+12]
label00f5:
; end of inline function matrix4f_transform
label00f6:
; end of inline function _transform_to_projection_space
	lea	dword3,[ebp-196]
	add	dword3,16
	mov	dword6,[ebp+20]
	mov	dword7,[dword6]
	mov	dword8,[dword6+4]
	mov	[dword3],dword7
	mov	[dword3+4],dword8
	mov	dword4394,[ebp+12]
	mov	[ebp-1044],dword4394
	lea	dword10,[ebp-196]
	add	dword10,24
	mov	[ebp-1048],dword10
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4397,[ebp-1044]
	mov	dword4408,[dword4397+8]
	mov	[ebp-1072],dword4408
	mov	dword4399,[ebp-1044]
	mov	dword4407,[dword4399+4]
	mov	[ebp-1076],dword4407
	mov	dword4401,[ebp-1044]
	mov	dword4406,[dword4401]
	mov	[ebp-1080],dword4406
	lea	dword4402,[ebp-1064]
	mov	[ebp-1084],dword4402
; start of inline function vec4f_assign
	mov	dword4411,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4411]
	mov	dword4414,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4414+4]
	mov	dword4417,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4417+8]
	mov	dword4420,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4420+12]
label00f7:
; end of inline function vec4f_assign
	lea	dword4403,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4403
	lea	dword4404,[ebp-1064]
	mov	[ebp-1092],dword4404
	mov	dword4422,[ebp-1048]
	mov	[ebp-1096],dword4422
; start of inline function matrix4f_transform
	mov	dword4425,[ebp-1092]
	mov	dword4427,[ebp-1088]
	fld	dword ptr [dword4425+4]
	fmul	dword ptr [dword4427+16]
	mov	dword4429,[ebp-1092]
	mov	dword4431,[ebp-1088]
	fld	dword ptr [dword4429]
	fmul	dword ptr [dword4431]
	faddp
	mov	dword4433,[ebp-1092]
	mov	dword4435,[ebp-1088]
	fld	dword ptr [dword4433+8]
	fmul	dword ptr [dword4435+32]
	faddp
	mov	dword4437,[ebp-1092]
	mov	dword4439,[ebp-1088]
	fld	dword ptr [dword4437+12]
	fmul	dword ptr [dword4439+48]
	faddp
	mov	dword4441,[ebp-1096]
	fstp	dword ptr [dword4441]
	mov	dword4443,[ebp-1088]
	mov	dword4445,[ebp-1092]
	fld	dword ptr [dword4445]
	fmul	dword ptr [dword4443+4]
	mov	dword4447,[ebp-1092]
	mov	dword4449,[ebp-1088]
	fld	dword ptr [dword4447+4]
	fmul	dword ptr [dword4449+20]
	faddp
	mov	dword4451,[ebp-1092]
	mov	dword4453,[ebp-1088]
	fld	dword ptr [dword4451+8]
	fmul	dword ptr [dword4453+36]
	faddp
	mov	dword4455,[ebp-1092]
	mov	dword4457,[ebp-1088]
	fld	dword ptr [dword4455+12]
	fmul	dword ptr [dword4457+52]
	faddp
	mov	dword4459,[ebp-1096]
	fstp	dword ptr [dword4459+4]
	mov	dword4461,[ebp-1088]
	mov	dword4463,[ebp-1092]
	fld	dword ptr [dword4463]
	fmul	dword ptr [dword4461+8]
	mov	dword4465,[ebp-1092]
	mov	dword4467,[ebp-1088]
	fld	dword ptr [dword4465+4]
	fmul	dword ptr [dword4467+24]
	faddp
	mov	dword4469,[ebp-1092]
	mov	dword4471,[ebp-1088]
	fld	dword ptr [dword4469+8]
	fmul	dword ptr [dword4471+40]
	faddp
	mov	dword4473,[ebp-1092]
	mov	dword4475,[ebp-1088]
	fld	dword ptr [dword4473+12]
	fmul	dword ptr [dword4475+56]
	faddp
	mov	dword4477,[ebp-1096]
	fstp	dword ptr [dword4477+8]
	mov	dword4479,[ebp-1088]
	mov	dword4481,[ebp-1092]
	fld	dword ptr [dword4481]
	fmul	dword ptr [dword4479+12]
	mov	dword4483,[ebp-1092]
	mov	dword4485,[ebp-1088]
	fld	dword ptr [dword4483+4]
	fmul	dword ptr [dword4485+28]
	faddp
	mov	dword4487,[ebp-1092]
	mov	dword4489,[ebp-1088]
	fld	dword ptr [dword4487+8]
	fmul	dword ptr [dword4489+44]
	faddp
	mov	dword4491,[ebp-1092]
	mov	dword4493,[ebp-1088]
	fld	dword ptr [dword4491+12]
	fmul	dword ptr [dword4493+60]
	faddp
	mov	dword4495,[ebp-1096]
	fstp	dword ptr [dword4495+12]
label00f8:
; end of inline function matrix4f_transform
label00f9:
; end of inline function _transform_to_projection_space
	lea	dword12,[ebp-196]
	add	dword12,24
	add	dword12,16
	mov	dword16,[ebp+24]
	mov	dword17,[dword16]
	mov	dword18,[dword16+4]
	mov	[dword12],dword17
	mov	[dword12+4],dword18
	mov	dword4496,[ebp+16]
	mov	[ebp-1044],dword4496
	lea	dword20,[ebp-196]
	add	dword20,48
	mov	[ebp-1048],dword20
; start of inline function _transform_to_projection_space
	fld1
	fstp	dword ptr [ebp-1068]
	mov	dword4499,[ebp-1044]
	mov	dword4510,[dword4499+8]
	mov	[ebp-1072],dword4510
	mov	dword4501,[ebp-1044]
	mov	dword4509,[dword4501+4]
	mov	[ebp-1076],dword4509
	mov	dword4503,[ebp-1044]
	mov	dword4508,[dword4503]
	mov	[ebp-1080],dword4508
	lea	dword4504,[ebp-1064]
	mov	[ebp-1084],dword4504
; start of inline function vec4f_assign
	mov	dword4513,[ebp-1084]
	fld	dword ptr [ebp-1080]
	fstp	dword ptr [dword4513]
	mov	dword4516,[ebp-1084]
	fld	dword ptr [ebp-1076]
	fstp	dword ptr [dword4516+4]
	mov	dword4519,[ebp-1084]
	fld	dword ptr [ebp-1072]
	fstp	dword ptr [dword4519+8]
	mov	dword4522,[ebp-1084]
	fld	dword ptr [ebp-1068]
	fstp	dword ptr [dword4522+12]
label00fa:
; end of inline function vec4f_assign
	lea	dword4505,dword ptr [__mvproj_matrix]
	mov	[ebp-1088],dword4505
	lea	dword4506,[ebp-1064]
	mov	[ebp-1092],dword4506
	mov	dword4524,[ebp-1048]
	mov	[ebp-1096],dword4524
; start of inline function matrix4f_transform
	mov	dword4527,[ebp-1092]
	mov	dword4529,[ebp-1088]
	fld	dword ptr [dword4527+4]
	fmul	dword ptr [dword4529+16]
	mov	dword4531,[ebp-1092]
	mov	dword4533,[ebp-1088]
	fld	dword ptr [dword4531]
	fmul	dword ptr [dword4533]
	faddp
	mov	dword4535,[ebp-1092]
	mov	dword4537,[ebp-1088]
	fld	dword ptr [dword4535+8]
	fmul	dword ptr [dword4537+32]
	faddp
	mov	dword4539,[ebp-1092]
	mov	dword4541,[ebp-1088]
	fld	dword ptr [dword4539+12]
	fmul	dword ptr [dword4541+48]
	faddp
	mov	dword4543,[ebp-1096]
	fstp	dword ptr [dword4543]
	mov	dword4545,[ebp-1088]
	mov	dword4547,[ebp-1092]
	fld	dword ptr [dword4547]
	fmul	dword ptr [dword4545+4]
	mov	dword4549,[ebp-1092]
	mov	dword4551,[ebp-1088]
	fld	dword ptr [dword4549+4]
	fmul	dword ptr [dword4551+20]
	faddp
	mov	dword4553,[ebp-1092]
	mov	dword4555,[ebp-1088]
	fld	dword ptr [dword4553+8]
	fmul	dword ptr [dword4555+36]
	faddp
	mov	dword4557,[ebp-1092]
	mov	dword4559,[ebp-1088]
	fld	dword ptr [dword4557+12]
	fmul	dword ptr [dword4559+52]
	faddp
	mov	dword4561,[ebp-1096]
	fstp	dword ptr [dword4561+4]
	mov	dword4563,[ebp-1088]
	mov	dword4565,[ebp-1092]
	fld	dword ptr [dword4565]
	fmul	dword ptr [dword4563+8]
	mov	dword4567,[ebp-1092]
	mov	dword4569,[ebp-1088]
	fld	dword ptr [dword4567+4]
	fmul	dword ptr [dword4569+24]
	faddp
	mov	dword4571,[ebp-1092]
	mov	dword4573,[ebp-1088]
	fld	dword ptr [dword4571+8]
	fmul	dword ptr [dword4573+40]
	faddp
	mov	dword4575,[ebp-1092]
	mov	dword4577,[ebp-1088]
	fld	dword ptr [dword4575+12]
	fmul	dword ptr [dword4577+56]
	faddp
	mov	dword4579,[ebp-1096]
	fstp	dword ptr [dword4579+8]
	mov	dword4581,[ebp-1088]
	mov	dword4583,[ebp-1092]
	fld	dword ptr [dword4583]
	fmul	dword ptr [dword4581+12]
	mov	dword4585,[ebp-1092]
	mov	dword4587,[ebp-1088]
	fld	dword ptr [dword4585+4]
	fmul	dword ptr [dword4587+28]
	faddp
	mov	dword4589,[ebp-1092]
	mov	dword4591,[ebp-1088]
	fld	dword ptr [dword4589+8]
	fmul	dword ptr [dword4591+44]
	faddp
	mov	dword4593,[ebp-1092]
	mov	dword4595,[ebp-1088]
	fld	dword ptr [dword4593+12]
	fmul	dword ptr [dword4595+60]
	faddp
	mov	dword4597,[ebp-1096]
	fstp	dword ptr [dword4597+12]
label00fb:
; end of inline function matrix4f_transform
label00fc:
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
	lea	dword2044,dword ptr [__clip_z_far_norm]
	mov	[ebp-848],dword2044
	lea	dword2045,dword ptr [__clip_z_far_base]
	mov	[ebp-852],dword2045
	mov	dword2072,[ebp-648]
	mov	[ebp-856],dword2072
	lea	dword2047,[ebp-844]
	mov	[ebp-860],dword2047
; start of inline function _clip_on_plain
	mov	dword2075,[ebp-860]
	mov	dword ptr [dword2075+192],0
	mov	dword2078,[ebp-856]
	mov	[ebp-864],dword2078
	mov	dword2081,[ebp-856]
	add	dword2081,24
	mov	[ebp-868],dword2081
label0070:
label0071:
	mov	dword2085,[ebp-856]
	mov	dword2087,[dword2085+192]
	imul	dword2087,24
	mov	dword2089,[ebp-856]
	add	dword2089,dword2087
	cmp	dword2089,[ebp-868]
	jle	label0072
	mov	dword2235,[ebp-852]
	mov	[ebp-968],dword2235
	mov	dword2093,[ebp-864]
	mov	[ebp-972],dword2093
	lea	dword2094,[ebp-884]
	mov	[ebp-976],dword2094
; start of inline function vec4f_subtract
	mov	dword2238,[ebp-972]
	mov	dword2240,[ebp-968]
	fld	dword ptr [dword2238]
	fsub	dword ptr [dword2240]
	mov	dword2242,[ebp-976]
	fstp	dword ptr [dword2242]
	mov	dword2244,[ebp-972]
	mov	dword2246,[ebp-968]
	fld	dword ptr [dword2244+4]
	fsub	dword ptr [dword2246+4]
	mov	dword2248,[ebp-976]
	fstp	dword ptr [dword2248+4]
	mov	dword2250,[ebp-972]
	mov	dword2252,[ebp-968]
	fld	dword ptr [dword2250+8]
	fsub	dword ptr [dword2252+8]
	mov	dword2254,[ebp-976]
	fstp	dword ptr [dword2254+8]
	mov	dword2256,[ebp-972]
	mov	dword2258,[ebp-968]
	fld	dword ptr [dword2256+12]
	fsub	dword ptr [dword2258+12]
	mov	dword2260,[ebp-976]
	fstp	dword ptr [dword2260+12]
label007b:
; end of inline function vec4f_subtract
	mov	dword2338,[ebp-848]
	mov	[ebp-980],dword2338
	lea	dword2096,[ebp-884]
	mov	[ebp-984],dword2096
; start of inline function vec4f_dot
	mov	dword2341,[ebp-984]
	mov	dword2343,[ebp-980]
	fld	dword ptr [dword2341+4]
	fmul	dword ptr [dword2343+4]
	mov	dword2345,[ebp-984]
	mov	dword2347,[ebp-980]
	fld	dword ptr [dword2345]
	fmul	dword ptr [dword2347]
	faddp
	mov	dword2349,[ebp-984]
	mov	dword2351,[ebp-980]
	fld	dword ptr [dword2349+8]
	fmul	dword ptr [dword2351+8]
	faddp
	mov	dword2353,[ebp-984]
	mov	dword2355,[ebp-980]
	fld	dword ptr [dword2353+12]
	fmul	dword ptr [dword2355+12]
	faddp
	fstp	dword ptr [ebp-988]
label007f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2261,[ebp-852]
	mov	[ebp-968],dword2261
	mov	dword2100,[ebp-868]
	mov	[ebp-972],dword2100
	lea	dword2101,[ebp-884]
	mov	[ebp-976],dword2101
; start of inline function vec4f_subtract
	mov	dword2264,[ebp-972]
	mov	dword2266,[ebp-968]
	fld	dword ptr [dword2264]
	fsub	dword ptr [dword2266]
	mov	dword2268,[ebp-976]
	fstp	dword ptr [dword2268]
	mov	dword2270,[ebp-972]
	mov	dword2272,[ebp-968]
	fld	dword ptr [dword2270+4]
	fsub	dword ptr [dword2272+4]
	mov	dword2274,[ebp-976]
	fstp	dword ptr [dword2274+4]
	mov	dword2276,[ebp-972]
	mov	dword2278,[ebp-968]
	fld	dword ptr [dword2276+8]
	fsub	dword ptr [dword2278+8]
	mov	dword2280,[ebp-976]
	fstp	dword ptr [dword2280+8]
	mov	dword2282,[ebp-972]
	mov	dword2284,[ebp-968]
	fld	dword ptr [dword2282+12]
	fsub	dword ptr [dword2284+12]
	mov	dword2286,[ebp-976]
	fstp	dword ptr [dword2286+12]
label007c:
; end of inline function vec4f_subtract
	mov	dword2356,[ebp-848]
	mov	[ebp-980],dword2356
	lea	dword2103,[ebp-884]
	mov	[ebp-984],dword2103
; start of inline function vec4f_dot
	mov	dword2359,[ebp-984]
	mov	dword2361,[ebp-980]
	fld	dword ptr [dword2359+4]
	fmul	dword ptr [dword2361+4]
	mov	dword2363,[ebp-984]
	mov	dword2365,[ebp-980]
	fld	dword ptr [dword2363]
	fmul	dword ptr [dword2365]
	faddp
	mov	dword2367,[ebp-984]
	mov	dword2369,[ebp-980]
	fld	dword ptr [dword2367+8]
	fmul	dword ptr [dword2369+8]
	faddp
	mov	dword2371,[ebp-984]
	mov	dword2373,[ebp-980]
	fld	dword ptr [dword2371+12]
	fmul	dword ptr [dword2373+12]
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
	mov	dword2107,[ebp-860]
	mov	dword2108,[dword2107+192]
	inc	dword ptr [dword2107+192]
	imul	dword2108,24
	mov	dword2111,[ebp-860]
	add	dword2111,dword2108
	mov	dword2113,[ebp-864]
	mov	dword2114,[dword2113]
	mov	dword2115,[dword2113+4]
	mov	[dword2111],dword2114
	mov	[dword2111+4],dword2115
	mov	dword2114,[dword2113+8]
	mov	dword2115,[dword2113+12]
	mov	[dword2111+8],dword2114
	mov	[dword2111+12],dword2115
	mov	dword2114,[dword2113+16]
	mov	dword2115,[dword2113+20]
	mov	[dword2111+16],dword2114
	mov	[dword2111+20],dword2115
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
	mov	dword2121,[ebp-864]
	mov	[ebp-968],dword2121
	mov	dword2287,[ebp-852]
	mov	[ebp-972],dword2287
	lea	dword2123,[ebp-884]
	mov	[ebp-976],dword2123
; start of inline function vec4f_subtract
	mov	dword2290,[ebp-972]
	mov	dword2292,[ebp-968]
	fld	dword ptr [dword2290]
	fsub	dword ptr [dword2292]
	mov	dword2294,[ebp-976]
	fstp	dword ptr [dword2294]
	mov	dword2296,[ebp-972]
	mov	dword2298,[ebp-968]
	fld	dword ptr [dword2296+4]
	fsub	dword ptr [dword2298+4]
	mov	dword2300,[ebp-976]
	fstp	dword ptr [dword2300+4]
	mov	dword2302,[ebp-972]
	mov	dword2304,[ebp-968]
	fld	dword ptr [dword2302+8]
	fsub	dword ptr [dword2304+8]
	mov	dword2306,[ebp-976]
	fstp	dword ptr [dword2306+8]
	mov	dword2308,[ebp-972]
	mov	dword2310,[ebp-968]
	fld	dword ptr [dword2308+12]
	fsub	dword ptr [dword2310+12]
	mov	dword2312,[ebp-976]
	fstp	dword ptr [dword2312+12]
label007d:
; end of inline function vec4f_subtract
	mov	dword2125,[ebp-864]
	mov	[ebp-968],dword2125
	mov	dword2127,[ebp-868]
	mov	[ebp-972],dword2127
	lea	dword2128,[ebp-900]
	mov	[ebp-976],dword2128
; start of inline function vec4f_subtract
	mov	dword2315,[ebp-972]
	mov	dword2317,[ebp-968]
	fld	dword ptr [dword2315]
	fsub	dword ptr [dword2317]
	mov	dword2319,[ebp-976]
	fstp	dword ptr [dword2319]
	mov	dword2321,[ebp-972]
	mov	dword2323,[ebp-968]
	fld	dword ptr [dword2321+4]
	fsub	dword ptr [dword2323+4]
	mov	dword2325,[ebp-976]
	fstp	dword ptr [dword2325+4]
	mov	dword2327,[ebp-972]
	mov	dword2329,[ebp-968]
	fld	dword ptr [dword2327+8]
	fsub	dword ptr [dword2329+8]
	mov	dword2331,[ebp-976]
	fstp	dword ptr [dword2331+8]
	mov	dword2333,[ebp-972]
	mov	dword2335,[ebp-968]
	fld	dword ptr [dword2333+12]
	fsub	dword ptr [dword2335+12]
	mov	dword2337,[ebp-976]
	fstp	dword ptr [dword2337+12]
label007e:
; end of inline function vec4f_subtract
	mov	dword2374,[ebp-848]
	mov	[ebp-980],dword2374
	lea	dword2130,[ebp-884]
	mov	[ebp-984],dword2130
; start of inline function vec4f_dot
	mov	dword2377,[ebp-984]
	mov	dword2379,[ebp-980]
	fld	dword ptr [dword2377+4]
	fmul	dword ptr [dword2379+4]
	mov	dword2381,[ebp-984]
	mov	dword2383,[ebp-980]
	fld	dword ptr [dword2381]
	fmul	dword ptr [dword2383]
	faddp
	mov	dword2385,[ebp-984]
	mov	dword2387,[ebp-980]
	fld	dword ptr [dword2385+8]
	fmul	dword ptr [dword2387+8]
	faddp
	mov	dword2389,[ebp-984]
	mov	dword2391,[ebp-980]
	fld	dword ptr [dword2389+12]
	fmul	dword ptr [dword2391+12]
	faddp
	fstp	dword ptr [ebp-988]
label0081:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword2392,[ebp-848]
	mov	[ebp-980],dword2392
	lea	dword2132,[ebp-900]
	mov	[ebp-984],dword2132
; start of inline function vec4f_dot
	mov	dword2395,[ebp-984]
	mov	dword2397,[ebp-980]
	fld	dword ptr [dword2395+4]
	fmul	dword ptr [dword2397+4]
	mov	dword2399,[ebp-984]
	mov	dword2401,[ebp-980]
	fld	dword ptr [dword2399]
	fmul	dword ptr [dword2401]
	faddp
	mov	dword2403,[ebp-984]
	mov	dword2405,[ebp-980]
	fld	dword ptr [dword2403+8]
	fmul	dword ptr [dword2405+8]
	faddp
	mov	dword2407,[ebp-984]
	mov	dword2409,[ebp-980]
	fld	dword ptr [dword2407+12]
	fmul	dword ptr [dword2409+12]
	faddp
	fstp	dword ptr [ebp-988]
label0082:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword2410,[ebp-920]
	mov	[ebp-992],dword2410
	lea	dword2135,[ebp-900]
	mov	[ebp-996],dword2135
; start of inline function vec4f_mul
	mov	dword2413,[ebp-996]
	fld	dword ptr [dword2413]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2413]
	mov	dword2416,[ebp-996]
	fld	dword ptr [dword2416+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2416+4]
	mov	dword2419,[ebp-996]
	fld	dword ptr [dword2419+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2419+8]
	mov	dword2422,[ebp-996]
	fld	dword ptr [dword2422+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2422+12]
label0083:
; end of inline function vec4f_mul
	lea	dword2136,[ebp-900]
	mov	[ebp-956],dword2136
	mov	dword2138,[ebp-864]
	mov	[ebp-960],dword2138
	mov	dword2140,[ebp-860]
	mov	dword2142,[dword2140+192]
	imul	dword2142,24
	mov	dword2144,[ebp-860]
	add	dword2144,dword2142
	mov	[ebp-964],dword2144
; start of inline function vec4f_add
	mov	dword2212,[ebp-960]
	mov	dword2214,[ebp-956]
	fld	dword ptr [dword2212]
	fadd	dword ptr [dword2214]
	mov	dword2216,[ebp-964]
	fstp	dword ptr [dword2216]
	mov	dword2218,[ebp-960]
	mov	dword2220,[ebp-956]
	fld	dword ptr [dword2218+4]
	fadd	dword ptr [dword2220+4]
	mov	dword2222,[ebp-964]
	fstp	dword ptr [dword2222+4]
	mov	dword2224,[ebp-960]
	mov	dword2226,[ebp-956]
	fld	dword ptr [dword2224+8]
	fadd	dword ptr [dword2226+8]
	mov	dword2228,[ebp-964]
	fstp	dword ptr [dword2228+8]
	mov	dword2230,[ebp-960]
	mov	dword2232,[ebp-956]
	fld	dword ptr [dword2230+12]
	fadd	dword ptr [dword2232+12]
	mov	dword2234,[ebp-964]
	fstp	dword ptr [dword2234+12]
label007a:
; end of inline function vec4f_add
	mov	dword2146,16
	add	dword2146,[ebp-864]
	mov	[ebp-936],dword2146
	mov	dword2148,16
	add	dword2148,[ebp-868]
	mov	[ebp-940],dword2148
	lea	dword2149,[ebp-908]
	mov	[ebp-944],dword2149
; start of inline function vec2f_subtract
	mov	dword2191,[ebp-940]
	mov	dword2193,[ebp-936]
	fld	dword ptr [dword2191]
	fsub	dword ptr [dword2193]
	mov	dword2195,[ebp-944]
	fstp	dword ptr [dword2195]
	mov	dword2197,[ebp-940]
	mov	dword2199,[ebp-936]
	fld	dword ptr [dword2197+4]
	fsub	dword ptr [dword2199+4]
	mov	dword2201,[ebp-944]
	fstp	dword ptr [dword2201+4]
label0078:
; end of inline function vec2f_subtract
	mov	dword2202,[ebp-920]
	mov	[ebp-948],dword2202
	lea	dword2151,[ebp-908]
	mov	[ebp-952],dword2151
; start of inline function vec2f_mul
	mov	dword2205,[ebp-952]
	fld	dword ptr [dword2205]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2205]
	mov	dword2208,[ebp-952]
	fld	dword ptr [dword2208+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2208+4]
label0079:
; end of inline function vec2f_mul
	lea	dword2152,[ebp-908]
	mov	[ebp-924],dword2152
	mov	dword2154,16
	add	dword2154,[ebp-864]
	mov	[ebp-928],dword2154
	mov	dword2156,[ebp-860]
	mov	dword2158,[dword2156+192]
	imul	dword2158,24
	mov	dword2160,[ebp-860]
	add	dword2160,dword2158
	add	dword2160,16
	mov	[ebp-932],dword2160
; start of inline function vec2f_add
	mov	dword2178,[ebp-928]
	mov	dword2180,[ebp-924]
	fld	dword ptr [dword2178]
	fadd	dword ptr [dword2180]
	mov	dword2182,[ebp-932]
	fstp	dword ptr [dword2182]
	mov	dword2184,[ebp-928]
	mov	dword2186,[ebp-924]
	fld	dword ptr [dword2184+4]
	fadd	dword ptr [dword2186+4]
	mov	dword2188,[ebp-932]
	fstp	dword ptr [dword2188+4]
label0077:
; end of inline function vec2f_add
	mov	dword2163,[ebp-860]
	inc	dword ptr [dword2163+192]
label0074:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label0071
label0072:
	mov	dword2167,[ebp-860]
	mov	dword2168,[dword2167+192]
	inc	dword ptr [dword2167+192]
	imul	dword2168,24
	mov	dword2171,[ebp-860]
	add	dword2171,dword2168
	mov	dword2173,[ebp-860]
	mov	dword2174,[dword2173]
	mov	dword2175,[dword2173+4]
	mov	[dword2171],dword2174
	mov	[dword2171+4],dword2175
	mov	dword2174,[dword2173+8]
	mov	dword2175,[dword2173+12]
	mov	[dword2171+8],dword2174
	mov	[dword2171+12],dword2175
	mov	dword2174,[dword2173+16]
	mov	dword2175,[dword2173+20]
	mov	[dword2171+16],dword2174
	mov	[dword2171+20],dword2175
label0084:
; end of inline function _clip_on_plain
	lea	dword2048,dword ptr [__clip_z_near_norm]
	mov	[ebp-848],dword2048
	lea	dword2049,dword ptr [__clip_z_near_base]
	mov	[ebp-852],dword2049
	lea	dword2050,[ebp-844]
	mov	[ebp-856],dword2050
	mov	dword2424,[ebp-648]
	mov	[ebp-860],dword2424
; start of inline function _clip_on_plain
	mov	dword2427,[ebp-860]
	mov	dword ptr [dword2427+192],0
	mov	dword2430,[ebp-856]
	mov	[ebp-864],dword2430
	mov	dword2433,[ebp-856]
	add	dword2433,24
	mov	[ebp-868],dword2433
label0085:
label0086:
	mov	dword2437,[ebp-856]
	mov	dword2439,[dword2437+192]
	imul	dword2439,24
	mov	dword2441,[ebp-856]
	add	dword2441,dword2439
	cmp	dword2441,[ebp-868]
	jle	label0087
	mov	dword2587,[ebp-852]
	mov	[ebp-968],dword2587
	mov	dword2445,[ebp-864]
	mov	[ebp-972],dword2445
	lea	dword2446,[ebp-884]
	mov	[ebp-976],dword2446
; start of inline function vec4f_subtract
	mov	dword2590,[ebp-972]
	mov	dword2592,[ebp-968]
	fld	dword ptr [dword2590]
	fsub	dword ptr [dword2592]
	mov	dword2594,[ebp-976]
	fstp	dword ptr [dword2594]
	mov	dword2596,[ebp-972]
	mov	dword2598,[ebp-968]
	fld	dword ptr [dword2596+4]
	fsub	dword ptr [dword2598+4]
	mov	dword2600,[ebp-976]
	fstp	dword ptr [dword2600+4]
	mov	dword2602,[ebp-972]
	mov	dword2604,[ebp-968]
	fld	dword ptr [dword2602+8]
	fsub	dword ptr [dword2604+8]
	mov	dword2606,[ebp-976]
	fstp	dword ptr [dword2606+8]
	mov	dword2608,[ebp-972]
	mov	dword2610,[ebp-968]
	fld	dword ptr [dword2608+12]
	fsub	dword ptr [dword2610+12]
	mov	dword2612,[ebp-976]
	fstp	dword ptr [dword2612+12]
label0090:
; end of inline function vec4f_subtract
	mov	dword2690,[ebp-848]
	mov	[ebp-980],dword2690
	lea	dword2448,[ebp-884]
	mov	[ebp-984],dword2448
; start of inline function vec4f_dot
	mov	dword2693,[ebp-984]
	mov	dword2695,[ebp-980]
	fld	dword ptr [dword2693+4]
	fmul	dword ptr [dword2695+4]
	mov	dword2697,[ebp-984]
	mov	dword2699,[ebp-980]
	fld	dword ptr [dword2697]
	fmul	dword ptr [dword2699]
	faddp
	mov	dword2701,[ebp-984]
	mov	dword2703,[ebp-980]
	fld	dword ptr [dword2701+8]
	fmul	dword ptr [dword2703+8]
	faddp
	mov	dword2705,[ebp-984]
	mov	dword2707,[ebp-980]
	fld	dword ptr [dword2705+12]
	fmul	dword ptr [dword2707+12]
	faddp
	fstp	dword ptr [ebp-988]
label0094:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2613,[ebp-852]
	mov	[ebp-968],dword2613
	mov	dword2452,[ebp-868]
	mov	[ebp-972],dword2452
	lea	dword2453,[ebp-884]
	mov	[ebp-976],dword2453
; start of inline function vec4f_subtract
	mov	dword2616,[ebp-972]
	mov	dword2618,[ebp-968]
	fld	dword ptr [dword2616]
	fsub	dword ptr [dword2618]
	mov	dword2620,[ebp-976]
	fstp	dword ptr [dword2620]
	mov	dword2622,[ebp-972]
	mov	dword2624,[ebp-968]
	fld	dword ptr [dword2622+4]
	fsub	dword ptr [dword2624+4]
	mov	dword2626,[ebp-976]
	fstp	dword ptr [dword2626+4]
	mov	dword2628,[ebp-972]
	mov	dword2630,[ebp-968]
	fld	dword ptr [dword2628+8]
	fsub	dword ptr [dword2630+8]
	mov	dword2632,[ebp-976]
	fstp	dword ptr [dword2632+8]
	mov	dword2634,[ebp-972]
	mov	dword2636,[ebp-968]
	fld	dword ptr [dword2634+12]
	fsub	dword ptr [dword2636+12]
	mov	dword2638,[ebp-976]
	fstp	dword ptr [dword2638+12]
label0091:
; end of inline function vec4f_subtract
	mov	dword2708,[ebp-848]
	mov	[ebp-980],dword2708
	lea	dword2455,[ebp-884]
	mov	[ebp-984],dword2455
; start of inline function vec4f_dot
	mov	dword2711,[ebp-984]
	mov	dword2713,[ebp-980]
	fld	dword ptr [dword2711+4]
	fmul	dword ptr [dword2713+4]
	mov	dword2715,[ebp-984]
	mov	dword2717,[ebp-980]
	fld	dword ptr [dword2715]
	fmul	dword ptr [dword2717]
	faddp
	mov	dword2719,[ebp-984]
	mov	dword2721,[ebp-980]
	fld	dword ptr [dword2719+8]
	fmul	dword ptr [dword2721+8]
	faddp
	mov	dword2723,[ebp-984]
	mov	dword2725,[ebp-980]
	fld	dword ptr [dword2723+12]
	fmul	dword ptr [dword2725+12]
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
	mov	dword2459,[ebp-860]
	mov	dword2460,[dword2459+192]
	inc	dword ptr [dword2459+192]
	imul	dword2460,24
	mov	dword2463,[ebp-860]
	add	dword2463,dword2460
	mov	dword2465,[ebp-864]
	mov	dword2466,[dword2465]
	mov	dword2467,[dword2465+4]
	mov	[dword2463],dword2466
	mov	[dword2463+4],dword2467
	mov	dword2466,[dword2465+8]
	mov	dword2467,[dword2465+12]
	mov	[dword2463+8],dword2466
	mov	[dword2463+12],dword2467
	mov	dword2466,[dword2465+16]
	mov	dword2467,[dword2465+20]
	mov	[dword2463+16],dword2466
	mov	[dword2463+20],dword2467
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
	mov	dword2473,[ebp-864]
	mov	[ebp-968],dword2473
	mov	dword2639,[ebp-852]
	mov	[ebp-972],dword2639
	lea	dword2475,[ebp-884]
	mov	[ebp-976],dword2475
; start of inline function vec4f_subtract
	mov	dword2642,[ebp-972]
	mov	dword2644,[ebp-968]
	fld	dword ptr [dword2642]
	fsub	dword ptr [dword2644]
	mov	dword2646,[ebp-976]
	fstp	dword ptr [dword2646]
	mov	dword2648,[ebp-972]
	mov	dword2650,[ebp-968]
	fld	dword ptr [dword2648+4]
	fsub	dword ptr [dword2650+4]
	mov	dword2652,[ebp-976]
	fstp	dword ptr [dword2652+4]
	mov	dword2654,[ebp-972]
	mov	dword2656,[ebp-968]
	fld	dword ptr [dword2654+8]
	fsub	dword ptr [dword2656+8]
	mov	dword2658,[ebp-976]
	fstp	dword ptr [dword2658+8]
	mov	dword2660,[ebp-972]
	mov	dword2662,[ebp-968]
	fld	dword ptr [dword2660+12]
	fsub	dword ptr [dword2662+12]
	mov	dword2664,[ebp-976]
	fstp	dword ptr [dword2664+12]
label0092:
; end of inline function vec4f_subtract
	mov	dword2477,[ebp-864]
	mov	[ebp-968],dword2477
	mov	dword2479,[ebp-868]
	mov	[ebp-972],dword2479
	lea	dword2480,[ebp-900]
	mov	[ebp-976],dword2480
; start of inline function vec4f_subtract
	mov	dword2667,[ebp-972]
	mov	dword2669,[ebp-968]
	fld	dword ptr [dword2667]
	fsub	dword ptr [dword2669]
	mov	dword2671,[ebp-976]
	fstp	dword ptr [dword2671]
	mov	dword2673,[ebp-972]
	mov	dword2675,[ebp-968]
	fld	dword ptr [dword2673+4]
	fsub	dword ptr [dword2675+4]
	mov	dword2677,[ebp-976]
	fstp	dword ptr [dword2677+4]
	mov	dword2679,[ebp-972]
	mov	dword2681,[ebp-968]
	fld	dword ptr [dword2679+8]
	fsub	dword ptr [dword2681+8]
	mov	dword2683,[ebp-976]
	fstp	dword ptr [dword2683+8]
	mov	dword2685,[ebp-972]
	mov	dword2687,[ebp-968]
	fld	dword ptr [dword2685+12]
	fsub	dword ptr [dword2687+12]
	mov	dword2689,[ebp-976]
	fstp	dword ptr [dword2689+12]
label0093:
; end of inline function vec4f_subtract
	mov	dword2726,[ebp-848]
	mov	[ebp-980],dword2726
	lea	dword2482,[ebp-884]
	mov	[ebp-984],dword2482
; start of inline function vec4f_dot
	mov	dword2729,[ebp-984]
	mov	dword2731,[ebp-980]
	fld	dword ptr [dword2729+4]
	fmul	dword ptr [dword2731+4]
	mov	dword2733,[ebp-984]
	mov	dword2735,[ebp-980]
	fld	dword ptr [dword2733]
	fmul	dword ptr [dword2735]
	faddp
	mov	dword2737,[ebp-984]
	mov	dword2739,[ebp-980]
	fld	dword ptr [dword2737+8]
	fmul	dword ptr [dword2739+8]
	faddp
	mov	dword2741,[ebp-984]
	mov	dword2743,[ebp-980]
	fld	dword ptr [dword2741+12]
	fmul	dword ptr [dword2743+12]
	faddp
	fstp	dword ptr [ebp-988]
label0096:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword2744,[ebp-848]
	mov	[ebp-980],dword2744
	lea	dword2484,[ebp-900]
	mov	[ebp-984],dword2484
; start of inline function vec4f_dot
	mov	dword2747,[ebp-984]
	mov	dword2749,[ebp-980]
	fld	dword ptr [dword2747+4]
	fmul	dword ptr [dword2749+4]
	mov	dword2751,[ebp-984]
	mov	dword2753,[ebp-980]
	fld	dword ptr [dword2751]
	fmul	dword ptr [dword2753]
	faddp
	mov	dword2755,[ebp-984]
	mov	dword2757,[ebp-980]
	fld	dword ptr [dword2755+8]
	fmul	dword ptr [dword2757+8]
	faddp
	mov	dword2759,[ebp-984]
	mov	dword2761,[ebp-980]
	fld	dword ptr [dword2759+12]
	fmul	dword ptr [dword2761+12]
	faddp
	fstp	dword ptr [ebp-988]
label0097:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword2762,[ebp-920]
	mov	[ebp-992],dword2762
	lea	dword2487,[ebp-900]
	mov	[ebp-996],dword2487
; start of inline function vec4f_mul
	mov	dword2765,[ebp-996]
	fld	dword ptr [dword2765]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2765]
	mov	dword2768,[ebp-996]
	fld	dword ptr [dword2768+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2768+4]
	mov	dword2771,[ebp-996]
	fld	dword ptr [dword2771+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2771+8]
	mov	dword2774,[ebp-996]
	fld	dword ptr [dword2774+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword2774+12]
label0098:
; end of inline function vec4f_mul
	lea	dword2488,[ebp-900]
	mov	[ebp-956],dword2488
	mov	dword2490,[ebp-864]
	mov	[ebp-960],dword2490
	mov	dword2492,[ebp-860]
	mov	dword2494,[dword2492+192]
	imul	dword2494,24
	mov	dword2496,[ebp-860]
	add	dword2496,dword2494
	mov	[ebp-964],dword2496
; start of inline function vec4f_add
	mov	dword2564,[ebp-960]
	mov	dword2566,[ebp-956]
	fld	dword ptr [dword2564]
	fadd	dword ptr [dword2566]
	mov	dword2568,[ebp-964]
	fstp	dword ptr [dword2568]
	mov	dword2570,[ebp-960]
	mov	dword2572,[ebp-956]
	fld	dword ptr [dword2570+4]
	fadd	dword ptr [dword2572+4]
	mov	dword2574,[ebp-964]
	fstp	dword ptr [dword2574+4]
	mov	dword2576,[ebp-960]
	mov	dword2578,[ebp-956]
	fld	dword ptr [dword2576+8]
	fadd	dword ptr [dword2578+8]
	mov	dword2580,[ebp-964]
	fstp	dword ptr [dword2580+8]
	mov	dword2582,[ebp-960]
	mov	dword2584,[ebp-956]
	fld	dword ptr [dword2582+12]
	fadd	dword ptr [dword2584+12]
	mov	dword2586,[ebp-964]
	fstp	dword ptr [dword2586+12]
label008f:
; end of inline function vec4f_add
	mov	dword2498,16
	add	dword2498,[ebp-864]
	mov	[ebp-936],dword2498
	mov	dword2500,16
	add	dword2500,[ebp-868]
	mov	[ebp-940],dword2500
	lea	dword2501,[ebp-908]
	mov	[ebp-944],dword2501
; start of inline function vec2f_subtract
	mov	dword2543,[ebp-940]
	mov	dword2545,[ebp-936]
	fld	dword ptr [dword2543]
	fsub	dword ptr [dword2545]
	mov	dword2547,[ebp-944]
	fstp	dword ptr [dword2547]
	mov	dword2549,[ebp-940]
	mov	dword2551,[ebp-936]
	fld	dword ptr [dword2549+4]
	fsub	dword ptr [dword2551+4]
	mov	dword2553,[ebp-944]
	fstp	dword ptr [dword2553+4]
label008d:
; end of inline function vec2f_subtract
	mov	dword2554,[ebp-920]
	mov	[ebp-948],dword2554
	lea	dword2503,[ebp-908]
	mov	[ebp-952],dword2503
; start of inline function vec2f_mul
	mov	dword2557,[ebp-952]
	fld	dword ptr [dword2557]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2557]
	mov	dword2560,[ebp-952]
	fld	dword ptr [dword2560+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2560+4]
label008e:
; end of inline function vec2f_mul
	lea	dword2504,[ebp-908]
	mov	[ebp-924],dword2504
	mov	dword2506,16
	add	dword2506,[ebp-864]
	mov	[ebp-928],dword2506
	mov	dword2508,[ebp-860]
	mov	dword2510,[dword2508+192]
	imul	dword2510,24
	mov	dword2512,[ebp-860]
	add	dword2512,dword2510
	add	dword2512,16
	mov	[ebp-932],dword2512
; start of inline function vec2f_add
	mov	dword2530,[ebp-928]
	mov	dword2532,[ebp-924]
	fld	dword ptr [dword2530]
	fadd	dword ptr [dword2532]
	mov	dword2534,[ebp-932]
	fstp	dword ptr [dword2534]
	mov	dword2536,[ebp-928]
	mov	dword2538,[ebp-924]
	fld	dword ptr [dword2536+4]
	fadd	dword ptr [dword2538+4]
	mov	dword2540,[ebp-932]
	fstp	dword ptr [dword2540+4]
label008c:
; end of inline function vec2f_add
	mov	dword2515,[ebp-860]
	inc	dword ptr [dword2515+192]
label0089:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label0086
label0087:
	mov	dword2519,[ebp-860]
	mov	dword2520,[dword2519+192]
	inc	dword ptr [dword2519+192]
	imul	dword2520,24
	mov	dword2523,[ebp-860]
	add	dword2523,dword2520
	mov	dword2525,[ebp-860]
	mov	dword2526,[dword2525]
	mov	dword2527,[dword2525+4]
	mov	[dword2523],dword2526
	mov	[dword2523+4],dword2527
	mov	dword2526,[dword2525+8]
	mov	dword2527,[dword2525+12]
	mov	[dword2523+8],dword2526
	mov	[dword2523+12],dword2527
	mov	dword2526,[dword2525+16]
	mov	dword2527,[dword2525+20]
	mov	[dword2523+16],dword2526
	mov	[dword2523+20],dword2527
label0099:
; end of inline function _clip_on_plain
	lea	dword2052,dword ptr [__clip_plane_left_norm]
	mov	[ebp-848],dword2052
	lea	dword2053,dword ptr [__clip_plane_left_base]
	mov	[ebp-852],dword2053
	mov	dword2776,[ebp-648]
	mov	[ebp-856],dword2776
	lea	dword2055,[ebp-844]
	mov	[ebp-860],dword2055
; start of inline function _clip_on_plain
	mov	dword2779,[ebp-860]
	mov	dword ptr [dword2779+192],0
	mov	dword2782,[ebp-856]
	mov	[ebp-864],dword2782
	mov	dword2785,[ebp-856]
	add	dword2785,24
	mov	[ebp-868],dword2785
label009a:
label009b:
	mov	dword2789,[ebp-856]
	mov	dword2791,[dword2789+192]
	imul	dword2791,24
	mov	dword2793,[ebp-856]
	add	dword2793,dword2791
	cmp	dword2793,[ebp-868]
	jle	label009c
	mov	dword2939,[ebp-852]
	mov	[ebp-968],dword2939
	mov	dword2797,[ebp-864]
	mov	[ebp-972],dword2797
	lea	dword2798,[ebp-884]
	mov	[ebp-976],dword2798
; start of inline function vec4f_subtract
	mov	dword2942,[ebp-972]
	mov	dword2944,[ebp-968]
	fld	dword ptr [dword2942]
	fsub	dword ptr [dword2944]
	mov	dword2946,[ebp-976]
	fstp	dword ptr [dword2946]
	mov	dword2948,[ebp-972]
	mov	dword2950,[ebp-968]
	fld	dword ptr [dword2948+4]
	fsub	dword ptr [dword2950+4]
	mov	dword2952,[ebp-976]
	fstp	dword ptr [dword2952+4]
	mov	dword2954,[ebp-972]
	mov	dword2956,[ebp-968]
	fld	dword ptr [dword2954+8]
	fsub	dword ptr [dword2956+8]
	mov	dword2958,[ebp-976]
	fstp	dword ptr [dword2958+8]
	mov	dword2960,[ebp-972]
	mov	dword2962,[ebp-968]
	fld	dword ptr [dword2960+12]
	fsub	dword ptr [dword2962+12]
	mov	dword2964,[ebp-976]
	fstp	dword ptr [dword2964+12]
label00a5:
; end of inline function vec4f_subtract
	mov	dword3042,[ebp-848]
	mov	[ebp-980],dword3042
	lea	dword2800,[ebp-884]
	mov	[ebp-984],dword2800
; start of inline function vec4f_dot
	mov	dword3045,[ebp-984]
	mov	dword3047,[ebp-980]
	fld	dword ptr [dword3045+4]
	fmul	dword ptr [dword3047+4]
	mov	dword3049,[ebp-984]
	mov	dword3051,[ebp-980]
	fld	dword ptr [dword3049]
	fmul	dword ptr [dword3051]
	faddp
	mov	dword3053,[ebp-984]
	mov	dword3055,[ebp-980]
	fld	dword ptr [dword3053+8]
	fmul	dword ptr [dword3055+8]
	faddp
	mov	dword3057,[ebp-984]
	mov	dword3059,[ebp-980]
	fld	dword ptr [dword3057+12]
	fmul	dword ptr [dword3059+12]
	faddp
	fstp	dword ptr [ebp-988]
label00a9:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword2965,[ebp-852]
	mov	[ebp-968],dword2965
	mov	dword2804,[ebp-868]
	mov	[ebp-972],dword2804
	lea	dword2805,[ebp-884]
	mov	[ebp-976],dword2805
; start of inline function vec4f_subtract
	mov	dword2968,[ebp-972]
	mov	dword2970,[ebp-968]
	fld	dword ptr [dword2968]
	fsub	dword ptr [dword2970]
	mov	dword2972,[ebp-976]
	fstp	dword ptr [dword2972]
	mov	dword2974,[ebp-972]
	mov	dword2976,[ebp-968]
	fld	dword ptr [dword2974+4]
	fsub	dword ptr [dword2976+4]
	mov	dword2978,[ebp-976]
	fstp	dword ptr [dword2978+4]
	mov	dword2980,[ebp-972]
	mov	dword2982,[ebp-968]
	fld	dword ptr [dword2980+8]
	fsub	dword ptr [dword2982+8]
	mov	dword2984,[ebp-976]
	fstp	dword ptr [dword2984+8]
	mov	dword2986,[ebp-972]
	mov	dword2988,[ebp-968]
	fld	dword ptr [dword2986+12]
	fsub	dword ptr [dword2988+12]
	mov	dword2990,[ebp-976]
	fstp	dword ptr [dword2990+12]
label00a6:
; end of inline function vec4f_subtract
	mov	dword3060,[ebp-848]
	mov	[ebp-980],dword3060
	lea	dword2807,[ebp-884]
	mov	[ebp-984],dword2807
; start of inline function vec4f_dot
	mov	dword3063,[ebp-984]
	mov	dword3065,[ebp-980]
	fld	dword ptr [dword3063+4]
	fmul	dword ptr [dword3065+4]
	mov	dword3067,[ebp-984]
	mov	dword3069,[ebp-980]
	fld	dword ptr [dword3067]
	fmul	dword ptr [dword3069]
	faddp
	mov	dword3071,[ebp-984]
	mov	dword3073,[ebp-980]
	fld	dword ptr [dword3071+8]
	fmul	dword ptr [dword3073+8]
	faddp
	mov	dword3075,[ebp-984]
	mov	dword3077,[ebp-980]
	fld	dword ptr [dword3075+12]
	fmul	dword ptr [dword3077+12]
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
	mov	dword2811,[ebp-860]
	mov	dword2812,[dword2811+192]
	inc	dword ptr [dword2811+192]
	imul	dword2812,24
	mov	dword2815,[ebp-860]
	add	dword2815,dword2812
	mov	dword2817,[ebp-864]
	mov	dword2818,[dword2817]
	mov	dword2819,[dword2817+4]
	mov	[dword2815],dword2818
	mov	[dword2815+4],dword2819
	mov	dword2818,[dword2817+8]
	mov	dword2819,[dword2817+12]
	mov	[dword2815+8],dword2818
	mov	[dword2815+12],dword2819
	mov	dword2818,[dword2817+16]
	mov	dword2819,[dword2817+20]
	mov	[dword2815+16],dword2818
	mov	[dword2815+20],dword2819
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
	mov	dword2825,[ebp-864]
	mov	[ebp-968],dword2825
	mov	dword2991,[ebp-852]
	mov	[ebp-972],dword2991
	lea	dword2827,[ebp-884]
	mov	[ebp-976],dword2827
; start of inline function vec4f_subtract
	mov	dword2994,[ebp-972]
	mov	dword2996,[ebp-968]
	fld	dword ptr [dword2994]
	fsub	dword ptr [dword2996]
	mov	dword2998,[ebp-976]
	fstp	dword ptr [dword2998]
	mov	dword3000,[ebp-972]
	mov	dword3002,[ebp-968]
	fld	dword ptr [dword3000+4]
	fsub	dword ptr [dword3002+4]
	mov	dword3004,[ebp-976]
	fstp	dword ptr [dword3004+4]
	mov	dword3006,[ebp-972]
	mov	dword3008,[ebp-968]
	fld	dword ptr [dword3006+8]
	fsub	dword ptr [dword3008+8]
	mov	dword3010,[ebp-976]
	fstp	dword ptr [dword3010+8]
	mov	dword3012,[ebp-972]
	mov	dword3014,[ebp-968]
	fld	dword ptr [dword3012+12]
	fsub	dword ptr [dword3014+12]
	mov	dword3016,[ebp-976]
	fstp	dword ptr [dword3016+12]
label00a7:
; end of inline function vec4f_subtract
	mov	dword2829,[ebp-864]
	mov	[ebp-968],dword2829
	mov	dword2831,[ebp-868]
	mov	[ebp-972],dword2831
	lea	dword2832,[ebp-900]
	mov	[ebp-976],dword2832
; start of inline function vec4f_subtract
	mov	dword3019,[ebp-972]
	mov	dword3021,[ebp-968]
	fld	dword ptr [dword3019]
	fsub	dword ptr [dword3021]
	mov	dword3023,[ebp-976]
	fstp	dword ptr [dword3023]
	mov	dword3025,[ebp-972]
	mov	dword3027,[ebp-968]
	fld	dword ptr [dword3025+4]
	fsub	dword ptr [dword3027+4]
	mov	dword3029,[ebp-976]
	fstp	dword ptr [dword3029+4]
	mov	dword3031,[ebp-972]
	mov	dword3033,[ebp-968]
	fld	dword ptr [dword3031+8]
	fsub	dword ptr [dword3033+8]
	mov	dword3035,[ebp-976]
	fstp	dword ptr [dword3035+8]
	mov	dword3037,[ebp-972]
	mov	dword3039,[ebp-968]
	fld	dword ptr [dword3037+12]
	fsub	dword ptr [dword3039+12]
	mov	dword3041,[ebp-976]
	fstp	dword ptr [dword3041+12]
label00a8:
; end of inline function vec4f_subtract
	mov	dword3078,[ebp-848]
	mov	[ebp-980],dword3078
	lea	dword2834,[ebp-884]
	mov	[ebp-984],dword2834
; start of inline function vec4f_dot
	mov	dword3081,[ebp-984]
	mov	dword3083,[ebp-980]
	fld	dword ptr [dword3081+4]
	fmul	dword ptr [dword3083+4]
	mov	dword3085,[ebp-984]
	mov	dword3087,[ebp-980]
	fld	dword ptr [dword3085]
	fmul	dword ptr [dword3087]
	faddp
	mov	dword3089,[ebp-984]
	mov	dword3091,[ebp-980]
	fld	dword ptr [dword3089+8]
	fmul	dword ptr [dword3091+8]
	faddp
	mov	dword3093,[ebp-984]
	mov	dword3095,[ebp-980]
	fld	dword ptr [dword3093+12]
	fmul	dword ptr [dword3095+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ab:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3096,[ebp-848]
	mov	[ebp-980],dword3096
	lea	dword2836,[ebp-900]
	mov	[ebp-984],dword2836
; start of inline function vec4f_dot
	mov	dword3099,[ebp-984]
	mov	dword3101,[ebp-980]
	fld	dword ptr [dword3099+4]
	fmul	dword ptr [dword3101+4]
	mov	dword3103,[ebp-984]
	mov	dword3105,[ebp-980]
	fld	dword ptr [dword3103]
	fmul	dword ptr [dword3105]
	faddp
	mov	dword3107,[ebp-984]
	mov	dword3109,[ebp-980]
	fld	dword ptr [dword3107+8]
	fmul	dword ptr [dword3109+8]
	faddp
	mov	dword3111,[ebp-984]
	mov	dword3113,[ebp-980]
	fld	dword ptr [dword3111+12]
	fmul	dword ptr [dword3113+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ac:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3114,[ebp-920]
	mov	[ebp-992],dword3114
	lea	dword2839,[ebp-900]
	mov	[ebp-996],dword2839
; start of inline function vec4f_mul
	mov	dword3117,[ebp-996]
	fld	dword ptr [dword3117]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3117]
	mov	dword3120,[ebp-996]
	fld	dword ptr [dword3120+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3120+4]
	mov	dword3123,[ebp-996]
	fld	dword ptr [dword3123+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3123+8]
	mov	dword3126,[ebp-996]
	fld	dword ptr [dword3126+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3126+12]
label00ad:
; end of inline function vec4f_mul
	lea	dword2840,[ebp-900]
	mov	[ebp-956],dword2840
	mov	dword2842,[ebp-864]
	mov	[ebp-960],dword2842
	mov	dword2844,[ebp-860]
	mov	dword2846,[dword2844+192]
	imul	dword2846,24
	mov	dword2848,[ebp-860]
	add	dword2848,dword2846
	mov	[ebp-964],dword2848
; start of inline function vec4f_add
	mov	dword2916,[ebp-960]
	mov	dword2918,[ebp-956]
	fld	dword ptr [dword2916]
	fadd	dword ptr [dword2918]
	mov	dword2920,[ebp-964]
	fstp	dword ptr [dword2920]
	mov	dword2922,[ebp-960]
	mov	dword2924,[ebp-956]
	fld	dword ptr [dword2922+4]
	fadd	dword ptr [dword2924+4]
	mov	dword2926,[ebp-964]
	fstp	dword ptr [dword2926+4]
	mov	dword2928,[ebp-960]
	mov	dword2930,[ebp-956]
	fld	dword ptr [dword2928+8]
	fadd	dword ptr [dword2930+8]
	mov	dword2932,[ebp-964]
	fstp	dword ptr [dword2932+8]
	mov	dword2934,[ebp-960]
	mov	dword2936,[ebp-956]
	fld	dword ptr [dword2934+12]
	fadd	dword ptr [dword2936+12]
	mov	dword2938,[ebp-964]
	fstp	dword ptr [dword2938+12]
label00a4:
; end of inline function vec4f_add
	mov	dword2850,16
	add	dword2850,[ebp-864]
	mov	[ebp-936],dword2850
	mov	dword2852,16
	add	dword2852,[ebp-868]
	mov	[ebp-940],dword2852
	lea	dword2853,[ebp-908]
	mov	[ebp-944],dword2853
; start of inline function vec2f_subtract
	mov	dword2895,[ebp-940]
	mov	dword2897,[ebp-936]
	fld	dword ptr [dword2895]
	fsub	dword ptr [dword2897]
	mov	dword2899,[ebp-944]
	fstp	dword ptr [dword2899]
	mov	dword2901,[ebp-940]
	mov	dword2903,[ebp-936]
	fld	dword ptr [dword2901+4]
	fsub	dword ptr [dword2903+4]
	mov	dword2905,[ebp-944]
	fstp	dword ptr [dword2905+4]
label00a2:
; end of inline function vec2f_subtract
	mov	dword2906,[ebp-920]
	mov	[ebp-948],dword2906
	lea	dword2855,[ebp-908]
	mov	[ebp-952],dword2855
; start of inline function vec2f_mul
	mov	dword2909,[ebp-952]
	fld	dword ptr [dword2909]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2909]
	mov	dword2912,[ebp-952]
	fld	dword ptr [dword2912+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword2912+4]
label00a3:
; end of inline function vec2f_mul
	lea	dword2856,[ebp-908]
	mov	[ebp-924],dword2856
	mov	dword2858,16
	add	dword2858,[ebp-864]
	mov	[ebp-928],dword2858
	mov	dword2860,[ebp-860]
	mov	dword2862,[dword2860+192]
	imul	dword2862,24
	mov	dword2864,[ebp-860]
	add	dword2864,dword2862
	add	dword2864,16
	mov	[ebp-932],dword2864
; start of inline function vec2f_add
	mov	dword2882,[ebp-928]
	mov	dword2884,[ebp-924]
	fld	dword ptr [dword2882]
	fadd	dword ptr [dword2884]
	mov	dword2886,[ebp-932]
	fstp	dword ptr [dword2886]
	mov	dword2888,[ebp-928]
	mov	dword2890,[ebp-924]
	fld	dword ptr [dword2888+4]
	fadd	dword ptr [dword2890+4]
	mov	dword2892,[ebp-932]
	fstp	dword ptr [dword2892+4]
label00a1:
; end of inline function vec2f_add
	mov	dword2867,[ebp-860]
	inc	dword ptr [dword2867+192]
label009e:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label009b
label009c:
	mov	dword2871,[ebp-860]
	mov	dword2872,[dword2871+192]
	inc	dword ptr [dword2871+192]
	imul	dword2872,24
	mov	dword2875,[ebp-860]
	add	dword2875,dword2872
	mov	dword2877,[ebp-860]
	mov	dword2878,[dword2877]
	mov	dword2879,[dword2877+4]
	mov	[dword2875],dword2878
	mov	[dword2875+4],dword2879
	mov	dword2878,[dword2877+8]
	mov	dword2879,[dword2877+12]
	mov	[dword2875+8],dword2878
	mov	[dword2875+12],dword2879
	mov	dword2878,[dword2877+16]
	mov	dword2879,[dword2877+20]
	mov	[dword2875+16],dword2878
	mov	[dword2875+20],dword2879
label00ae:
; end of inline function _clip_on_plain
	lea	dword2056,dword ptr [__clip_plane_right_norm]
	mov	[ebp-848],dword2056
	lea	dword2057,dword ptr [__clip_plane_right_base]
	mov	[ebp-852],dword2057
	lea	dword2058,[ebp-844]
	mov	[ebp-856],dword2058
	mov	dword3128,[ebp-648]
	mov	[ebp-860],dword3128
; start of inline function _clip_on_plain
	mov	dword3131,[ebp-860]
	mov	dword ptr [dword3131+192],0
	mov	dword3134,[ebp-856]
	mov	[ebp-864],dword3134
	mov	dword3137,[ebp-856]
	add	dword3137,24
	mov	[ebp-868],dword3137
label00af:
label00b0:
	mov	dword3141,[ebp-856]
	mov	dword3143,[dword3141+192]
	imul	dword3143,24
	mov	dword3145,[ebp-856]
	add	dword3145,dword3143
	cmp	dword3145,[ebp-868]
	jle	label00b1
	mov	dword3291,[ebp-852]
	mov	[ebp-968],dword3291
	mov	dword3149,[ebp-864]
	mov	[ebp-972],dword3149
	lea	dword3150,[ebp-884]
	mov	[ebp-976],dword3150
; start of inline function vec4f_subtract
	mov	dword3294,[ebp-972]
	mov	dword3296,[ebp-968]
	fld	dword ptr [dword3294]
	fsub	dword ptr [dword3296]
	mov	dword3298,[ebp-976]
	fstp	dword ptr [dword3298]
	mov	dword3300,[ebp-972]
	mov	dword3302,[ebp-968]
	fld	dword ptr [dword3300+4]
	fsub	dword ptr [dword3302+4]
	mov	dword3304,[ebp-976]
	fstp	dword ptr [dword3304+4]
	mov	dword3306,[ebp-972]
	mov	dword3308,[ebp-968]
	fld	dword ptr [dword3306+8]
	fsub	dword ptr [dword3308+8]
	mov	dword3310,[ebp-976]
	fstp	dword ptr [dword3310+8]
	mov	dword3312,[ebp-972]
	mov	dword3314,[ebp-968]
	fld	dword ptr [dword3312+12]
	fsub	dword ptr [dword3314+12]
	mov	dword3316,[ebp-976]
	fstp	dword ptr [dword3316+12]
label00ba:
; end of inline function vec4f_subtract
	mov	dword3394,[ebp-848]
	mov	[ebp-980],dword3394
	lea	dword3152,[ebp-884]
	mov	[ebp-984],dword3152
; start of inline function vec4f_dot
	mov	dword3397,[ebp-984]
	mov	dword3399,[ebp-980]
	fld	dword ptr [dword3397+4]
	fmul	dword ptr [dword3399+4]
	mov	dword3401,[ebp-984]
	mov	dword3403,[ebp-980]
	fld	dword ptr [dword3401]
	fmul	dword ptr [dword3403]
	faddp
	mov	dword3405,[ebp-984]
	mov	dword3407,[ebp-980]
	fld	dword ptr [dword3405+8]
	fmul	dword ptr [dword3407+8]
	faddp
	mov	dword3409,[ebp-984]
	mov	dword3411,[ebp-980]
	fld	dword ptr [dword3409+12]
	fmul	dword ptr [dword3411+12]
	faddp
	fstp	dword ptr [ebp-988]
label00be:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword3317,[ebp-852]
	mov	[ebp-968],dword3317
	mov	dword3156,[ebp-868]
	mov	[ebp-972],dword3156
	lea	dword3157,[ebp-884]
	mov	[ebp-976],dword3157
; start of inline function vec4f_subtract
	mov	dword3320,[ebp-972]
	mov	dword3322,[ebp-968]
	fld	dword ptr [dword3320]
	fsub	dword ptr [dword3322]
	mov	dword3324,[ebp-976]
	fstp	dword ptr [dword3324]
	mov	dword3326,[ebp-972]
	mov	dword3328,[ebp-968]
	fld	dword ptr [dword3326+4]
	fsub	dword ptr [dword3328+4]
	mov	dword3330,[ebp-976]
	fstp	dword ptr [dword3330+4]
	mov	dword3332,[ebp-972]
	mov	dword3334,[ebp-968]
	fld	dword ptr [dword3332+8]
	fsub	dword ptr [dword3334+8]
	mov	dword3336,[ebp-976]
	fstp	dword ptr [dword3336+8]
	mov	dword3338,[ebp-972]
	mov	dword3340,[ebp-968]
	fld	dword ptr [dword3338+12]
	fsub	dword ptr [dword3340+12]
	mov	dword3342,[ebp-976]
	fstp	dword ptr [dword3342+12]
label00bb:
; end of inline function vec4f_subtract
	mov	dword3412,[ebp-848]
	mov	[ebp-980],dword3412
	lea	dword3159,[ebp-884]
	mov	[ebp-984],dword3159
; start of inline function vec4f_dot
	mov	dword3415,[ebp-984]
	mov	dword3417,[ebp-980]
	fld	dword ptr [dword3415+4]
	fmul	dword ptr [dword3417+4]
	mov	dword3419,[ebp-984]
	mov	dword3421,[ebp-980]
	fld	dword ptr [dword3419]
	fmul	dword ptr [dword3421]
	faddp
	mov	dword3423,[ebp-984]
	mov	dword3425,[ebp-980]
	fld	dword ptr [dword3423+8]
	fmul	dword ptr [dword3425+8]
	faddp
	mov	dword3427,[ebp-984]
	mov	dword3429,[ebp-980]
	fld	dword ptr [dword3427+12]
	fmul	dword ptr [dword3429+12]
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
	mov	dword3163,[ebp-860]
	mov	dword3164,[dword3163+192]
	inc	dword ptr [dword3163+192]
	imul	dword3164,24
	mov	dword3167,[ebp-860]
	add	dword3167,dword3164
	mov	dword3169,[ebp-864]
	mov	dword3170,[dword3169]
	mov	dword3171,[dword3169+4]
	mov	[dword3167],dword3170
	mov	[dword3167+4],dword3171
	mov	dword3170,[dword3169+8]
	mov	dword3171,[dword3169+12]
	mov	[dword3167+8],dword3170
	mov	[dword3167+12],dword3171
	mov	dword3170,[dword3169+16]
	mov	dword3171,[dword3169+20]
	mov	[dword3167+16],dword3170
	mov	[dword3167+20],dword3171
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
	mov	dword3177,[ebp-864]
	mov	[ebp-968],dword3177
	mov	dword3343,[ebp-852]
	mov	[ebp-972],dword3343
	lea	dword3179,[ebp-884]
	mov	[ebp-976],dword3179
; start of inline function vec4f_subtract
	mov	dword3346,[ebp-972]
	mov	dword3348,[ebp-968]
	fld	dword ptr [dword3346]
	fsub	dword ptr [dword3348]
	mov	dword3350,[ebp-976]
	fstp	dword ptr [dword3350]
	mov	dword3352,[ebp-972]
	mov	dword3354,[ebp-968]
	fld	dword ptr [dword3352+4]
	fsub	dword ptr [dword3354+4]
	mov	dword3356,[ebp-976]
	fstp	dword ptr [dword3356+4]
	mov	dword3358,[ebp-972]
	mov	dword3360,[ebp-968]
	fld	dword ptr [dword3358+8]
	fsub	dword ptr [dword3360+8]
	mov	dword3362,[ebp-976]
	fstp	dword ptr [dword3362+8]
	mov	dword3364,[ebp-972]
	mov	dword3366,[ebp-968]
	fld	dword ptr [dword3364+12]
	fsub	dword ptr [dword3366+12]
	mov	dword3368,[ebp-976]
	fstp	dword ptr [dword3368+12]
label00bc:
; end of inline function vec4f_subtract
	mov	dword3181,[ebp-864]
	mov	[ebp-968],dword3181
	mov	dword3183,[ebp-868]
	mov	[ebp-972],dword3183
	lea	dword3184,[ebp-900]
	mov	[ebp-976],dword3184
; start of inline function vec4f_subtract
	mov	dword3371,[ebp-972]
	mov	dword3373,[ebp-968]
	fld	dword ptr [dword3371]
	fsub	dword ptr [dword3373]
	mov	dword3375,[ebp-976]
	fstp	dword ptr [dword3375]
	mov	dword3377,[ebp-972]
	mov	dword3379,[ebp-968]
	fld	dword ptr [dword3377+4]
	fsub	dword ptr [dword3379+4]
	mov	dword3381,[ebp-976]
	fstp	dword ptr [dword3381+4]
	mov	dword3383,[ebp-972]
	mov	dword3385,[ebp-968]
	fld	dword ptr [dword3383+8]
	fsub	dword ptr [dword3385+8]
	mov	dword3387,[ebp-976]
	fstp	dword ptr [dword3387+8]
	mov	dword3389,[ebp-972]
	mov	dword3391,[ebp-968]
	fld	dword ptr [dword3389+12]
	fsub	dword ptr [dword3391+12]
	mov	dword3393,[ebp-976]
	fstp	dword ptr [dword3393+12]
label00bd:
; end of inline function vec4f_subtract
	mov	dword3430,[ebp-848]
	mov	[ebp-980],dword3430
	lea	dword3186,[ebp-884]
	mov	[ebp-984],dword3186
; start of inline function vec4f_dot
	mov	dword3433,[ebp-984]
	mov	dword3435,[ebp-980]
	fld	dword ptr [dword3433+4]
	fmul	dword ptr [dword3435+4]
	mov	dword3437,[ebp-984]
	mov	dword3439,[ebp-980]
	fld	dword ptr [dword3437]
	fmul	dword ptr [dword3439]
	faddp
	mov	dword3441,[ebp-984]
	mov	dword3443,[ebp-980]
	fld	dword ptr [dword3441+8]
	fmul	dword ptr [dword3443+8]
	faddp
	mov	dword3445,[ebp-984]
	mov	dword3447,[ebp-980]
	fld	dword ptr [dword3445+12]
	fmul	dword ptr [dword3447+12]
	faddp
	fstp	dword ptr [ebp-988]
label00c0:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3448,[ebp-848]
	mov	[ebp-980],dword3448
	lea	dword3188,[ebp-900]
	mov	[ebp-984],dword3188
; start of inline function vec4f_dot
	mov	dword3451,[ebp-984]
	mov	dword3453,[ebp-980]
	fld	dword ptr [dword3451+4]
	fmul	dword ptr [dword3453+4]
	mov	dword3455,[ebp-984]
	mov	dword3457,[ebp-980]
	fld	dword ptr [dword3455]
	fmul	dword ptr [dword3457]
	faddp
	mov	dword3459,[ebp-984]
	mov	dword3461,[ebp-980]
	fld	dword ptr [dword3459+8]
	fmul	dword ptr [dword3461+8]
	faddp
	mov	dword3463,[ebp-984]
	mov	dword3465,[ebp-980]
	fld	dword ptr [dword3463+12]
	fmul	dword ptr [dword3465+12]
	faddp
	fstp	dword ptr [ebp-988]
label00c1:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3466,[ebp-920]
	mov	[ebp-992],dword3466
	lea	dword3191,[ebp-900]
	mov	[ebp-996],dword3191
; start of inline function vec4f_mul
	mov	dword3469,[ebp-996]
	fld	dword ptr [dword3469]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3469]
	mov	dword3472,[ebp-996]
	fld	dword ptr [dword3472+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3472+4]
	mov	dword3475,[ebp-996]
	fld	dword ptr [dword3475+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3475+8]
	mov	dword3478,[ebp-996]
	fld	dword ptr [dword3478+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3478+12]
label00c2:
; end of inline function vec4f_mul
	lea	dword3192,[ebp-900]
	mov	[ebp-956],dword3192
	mov	dword3194,[ebp-864]
	mov	[ebp-960],dword3194
	mov	dword3196,[ebp-860]
	mov	dword3198,[dword3196+192]
	imul	dword3198,24
	mov	dword3200,[ebp-860]
	add	dword3200,dword3198
	mov	[ebp-964],dword3200
; start of inline function vec4f_add
	mov	dword3268,[ebp-960]
	mov	dword3270,[ebp-956]
	fld	dword ptr [dword3268]
	fadd	dword ptr [dword3270]
	mov	dword3272,[ebp-964]
	fstp	dword ptr [dword3272]
	mov	dword3274,[ebp-960]
	mov	dword3276,[ebp-956]
	fld	dword ptr [dword3274+4]
	fadd	dword ptr [dword3276+4]
	mov	dword3278,[ebp-964]
	fstp	dword ptr [dword3278+4]
	mov	dword3280,[ebp-960]
	mov	dword3282,[ebp-956]
	fld	dword ptr [dword3280+8]
	fadd	dword ptr [dword3282+8]
	mov	dword3284,[ebp-964]
	fstp	dword ptr [dword3284+8]
	mov	dword3286,[ebp-960]
	mov	dword3288,[ebp-956]
	fld	dword ptr [dword3286+12]
	fadd	dword ptr [dword3288+12]
	mov	dword3290,[ebp-964]
	fstp	dword ptr [dword3290+12]
label00b9:
; end of inline function vec4f_add
	mov	dword3202,16
	add	dword3202,[ebp-864]
	mov	[ebp-936],dword3202
	mov	dword3204,16
	add	dword3204,[ebp-868]
	mov	[ebp-940],dword3204
	lea	dword3205,[ebp-908]
	mov	[ebp-944],dword3205
; start of inline function vec2f_subtract
	mov	dword3247,[ebp-940]
	mov	dword3249,[ebp-936]
	fld	dword ptr [dword3247]
	fsub	dword ptr [dword3249]
	mov	dword3251,[ebp-944]
	fstp	dword ptr [dword3251]
	mov	dword3253,[ebp-940]
	mov	dword3255,[ebp-936]
	fld	dword ptr [dword3253+4]
	fsub	dword ptr [dword3255+4]
	mov	dword3257,[ebp-944]
	fstp	dword ptr [dword3257+4]
label00b7:
; end of inline function vec2f_subtract
	mov	dword3258,[ebp-920]
	mov	[ebp-948],dword3258
	lea	dword3207,[ebp-908]
	mov	[ebp-952],dword3207
; start of inline function vec2f_mul
	mov	dword3261,[ebp-952]
	fld	dword ptr [dword3261]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3261]
	mov	dword3264,[ebp-952]
	fld	dword ptr [dword3264+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3264+4]
label00b8:
; end of inline function vec2f_mul
	lea	dword3208,[ebp-908]
	mov	[ebp-924],dword3208
	mov	dword3210,16
	add	dword3210,[ebp-864]
	mov	[ebp-928],dword3210
	mov	dword3212,[ebp-860]
	mov	dword3214,[dword3212+192]
	imul	dword3214,24
	mov	dword3216,[ebp-860]
	add	dword3216,dword3214
	add	dword3216,16
	mov	[ebp-932],dword3216
; start of inline function vec2f_add
	mov	dword3234,[ebp-928]
	mov	dword3236,[ebp-924]
	fld	dword ptr [dword3234]
	fadd	dword ptr [dword3236]
	mov	dword3238,[ebp-932]
	fstp	dword ptr [dword3238]
	mov	dword3240,[ebp-928]
	mov	dword3242,[ebp-924]
	fld	dword ptr [dword3240+4]
	fadd	dword ptr [dword3242+4]
	mov	dword3244,[ebp-932]
	fstp	dword ptr [dword3244+4]
label00b6:
; end of inline function vec2f_add
	mov	dword3219,[ebp-860]
	inc	dword ptr [dword3219+192]
label00b3:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00b0
label00b1:
	mov	dword3223,[ebp-860]
	mov	dword3224,[dword3223+192]
	inc	dword ptr [dword3223+192]
	imul	dword3224,24
	mov	dword3227,[ebp-860]
	add	dword3227,dword3224
	mov	dword3229,[ebp-860]
	mov	dword3230,[dword3229]
	mov	dword3231,[dword3229+4]
	mov	[dword3227],dword3230
	mov	[dword3227+4],dword3231
	mov	dword3230,[dword3229+8]
	mov	dword3231,[dword3229+12]
	mov	[dword3227+8],dword3230
	mov	[dword3227+12],dword3231
	mov	dword3230,[dword3229+16]
	mov	dword3231,[dword3229+20]
	mov	[dword3227+16],dword3230
	mov	[dword3227+20],dword3231
label00c3:
; end of inline function _clip_on_plain
	lea	dword2060,dword ptr [__clip_plane_top_norm]
	mov	[ebp-848],dword2060
	lea	dword2061,dword ptr [__clip_plane_top_base]
	mov	[ebp-852],dword2061
	mov	dword3480,[ebp-648]
	mov	[ebp-856],dword3480
	lea	dword2063,[ebp-844]
	mov	[ebp-860],dword2063
; start of inline function _clip_on_plain
	mov	dword3483,[ebp-860]
	mov	dword ptr [dword3483+192],0
	mov	dword3486,[ebp-856]
	mov	[ebp-864],dword3486
	mov	dword3489,[ebp-856]
	add	dword3489,24
	mov	[ebp-868],dword3489
label00c4:
label00c5:
	mov	dword3493,[ebp-856]
	mov	dword3495,[dword3493+192]
	imul	dword3495,24
	mov	dword3497,[ebp-856]
	add	dword3497,dword3495
	cmp	dword3497,[ebp-868]
	jle	label00c6
	mov	dword3643,[ebp-852]
	mov	[ebp-968],dword3643
	mov	dword3501,[ebp-864]
	mov	[ebp-972],dword3501
	lea	dword3502,[ebp-884]
	mov	[ebp-976],dword3502
; start of inline function vec4f_subtract
	mov	dword3646,[ebp-972]
	mov	dword3648,[ebp-968]
	fld	dword ptr [dword3646]
	fsub	dword ptr [dword3648]
	mov	dword3650,[ebp-976]
	fstp	dword ptr [dword3650]
	mov	dword3652,[ebp-972]
	mov	dword3654,[ebp-968]
	fld	dword ptr [dword3652+4]
	fsub	dword ptr [dword3654+4]
	mov	dword3656,[ebp-976]
	fstp	dword ptr [dword3656+4]
	mov	dword3658,[ebp-972]
	mov	dword3660,[ebp-968]
	fld	dword ptr [dword3658+8]
	fsub	dword ptr [dword3660+8]
	mov	dword3662,[ebp-976]
	fstp	dword ptr [dword3662+8]
	mov	dword3664,[ebp-972]
	mov	dword3666,[ebp-968]
	fld	dword ptr [dword3664+12]
	fsub	dword ptr [dword3666+12]
	mov	dword3668,[ebp-976]
	fstp	dword ptr [dword3668+12]
label00cf:
; end of inline function vec4f_subtract
	mov	dword3746,[ebp-848]
	mov	[ebp-980],dword3746
	lea	dword3504,[ebp-884]
	mov	[ebp-984],dword3504
; start of inline function vec4f_dot
	mov	dword3749,[ebp-984]
	mov	dword3751,[ebp-980]
	fld	dword ptr [dword3749+4]
	fmul	dword ptr [dword3751+4]
	mov	dword3753,[ebp-984]
	mov	dword3755,[ebp-980]
	fld	dword ptr [dword3753]
	fmul	dword ptr [dword3755]
	faddp
	mov	dword3757,[ebp-984]
	mov	dword3759,[ebp-980]
	fld	dword ptr [dword3757+8]
	fmul	dword ptr [dword3759+8]
	faddp
	mov	dword3761,[ebp-984]
	mov	dword3763,[ebp-980]
	fld	dword ptr [dword3761+12]
	fmul	dword ptr [dword3763+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d3:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword3669,[ebp-852]
	mov	[ebp-968],dword3669
	mov	dword3508,[ebp-868]
	mov	[ebp-972],dword3508
	lea	dword3509,[ebp-884]
	mov	[ebp-976],dword3509
; start of inline function vec4f_subtract
	mov	dword3672,[ebp-972]
	mov	dword3674,[ebp-968]
	fld	dword ptr [dword3672]
	fsub	dword ptr [dword3674]
	mov	dword3676,[ebp-976]
	fstp	dword ptr [dword3676]
	mov	dword3678,[ebp-972]
	mov	dword3680,[ebp-968]
	fld	dword ptr [dword3678+4]
	fsub	dword ptr [dword3680+4]
	mov	dword3682,[ebp-976]
	fstp	dword ptr [dword3682+4]
	mov	dword3684,[ebp-972]
	mov	dword3686,[ebp-968]
	fld	dword ptr [dword3684+8]
	fsub	dword ptr [dword3686+8]
	mov	dword3688,[ebp-976]
	fstp	dword ptr [dword3688+8]
	mov	dword3690,[ebp-972]
	mov	dword3692,[ebp-968]
	fld	dword ptr [dword3690+12]
	fsub	dword ptr [dword3692+12]
	mov	dword3694,[ebp-976]
	fstp	dword ptr [dword3694+12]
label00d0:
; end of inline function vec4f_subtract
	mov	dword3764,[ebp-848]
	mov	[ebp-980],dword3764
	lea	dword3511,[ebp-884]
	mov	[ebp-984],dword3511
; start of inline function vec4f_dot
	mov	dword3767,[ebp-984]
	mov	dword3769,[ebp-980]
	fld	dword ptr [dword3767+4]
	fmul	dword ptr [dword3769+4]
	mov	dword3771,[ebp-984]
	mov	dword3773,[ebp-980]
	fld	dword ptr [dword3771]
	fmul	dword ptr [dword3773]
	faddp
	mov	dword3775,[ebp-984]
	mov	dword3777,[ebp-980]
	fld	dword ptr [dword3775+8]
	fmul	dword ptr [dword3777+8]
	faddp
	mov	dword3779,[ebp-984]
	mov	dword3781,[ebp-980]
	fld	dword ptr [dword3779+12]
	fmul	dword ptr [dword3781+12]
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
	mov	dword3515,[ebp-860]
	mov	dword3516,[dword3515+192]
	inc	dword ptr [dword3515+192]
	imul	dword3516,24
	mov	dword3519,[ebp-860]
	add	dword3519,dword3516
	mov	dword3521,[ebp-864]
	mov	dword3522,[dword3521]
	mov	dword3523,[dword3521+4]
	mov	[dword3519],dword3522
	mov	[dword3519+4],dword3523
	mov	dword3522,[dword3521+8]
	mov	dword3523,[dword3521+12]
	mov	[dword3519+8],dword3522
	mov	[dword3519+12],dword3523
	mov	dword3522,[dword3521+16]
	mov	dword3523,[dword3521+20]
	mov	[dword3519+16],dword3522
	mov	[dword3519+20],dword3523
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
	mov	dword3529,[ebp-864]
	mov	[ebp-968],dword3529
	mov	dword3695,[ebp-852]
	mov	[ebp-972],dword3695
	lea	dword3531,[ebp-884]
	mov	[ebp-976],dword3531
; start of inline function vec4f_subtract
	mov	dword3698,[ebp-972]
	mov	dword3700,[ebp-968]
	fld	dword ptr [dword3698]
	fsub	dword ptr [dword3700]
	mov	dword3702,[ebp-976]
	fstp	dword ptr [dword3702]
	mov	dword3704,[ebp-972]
	mov	dword3706,[ebp-968]
	fld	dword ptr [dword3704+4]
	fsub	dword ptr [dword3706+4]
	mov	dword3708,[ebp-976]
	fstp	dword ptr [dword3708+4]
	mov	dword3710,[ebp-972]
	mov	dword3712,[ebp-968]
	fld	dword ptr [dword3710+8]
	fsub	dword ptr [dword3712+8]
	mov	dword3714,[ebp-976]
	fstp	dword ptr [dword3714+8]
	mov	dword3716,[ebp-972]
	mov	dword3718,[ebp-968]
	fld	dword ptr [dword3716+12]
	fsub	dword ptr [dword3718+12]
	mov	dword3720,[ebp-976]
	fstp	dword ptr [dword3720+12]
label00d1:
; end of inline function vec4f_subtract
	mov	dword3533,[ebp-864]
	mov	[ebp-968],dword3533
	mov	dword3535,[ebp-868]
	mov	[ebp-972],dword3535
	lea	dword3536,[ebp-900]
	mov	[ebp-976],dword3536
; start of inline function vec4f_subtract
	mov	dword3723,[ebp-972]
	mov	dword3725,[ebp-968]
	fld	dword ptr [dword3723]
	fsub	dword ptr [dword3725]
	mov	dword3727,[ebp-976]
	fstp	dword ptr [dword3727]
	mov	dword3729,[ebp-972]
	mov	dword3731,[ebp-968]
	fld	dword ptr [dword3729+4]
	fsub	dword ptr [dword3731+4]
	mov	dword3733,[ebp-976]
	fstp	dword ptr [dword3733+4]
	mov	dword3735,[ebp-972]
	mov	dword3737,[ebp-968]
	fld	dword ptr [dword3735+8]
	fsub	dword ptr [dword3737+8]
	mov	dword3739,[ebp-976]
	fstp	dword ptr [dword3739+8]
	mov	dword3741,[ebp-972]
	mov	dword3743,[ebp-968]
	fld	dword ptr [dword3741+12]
	fsub	dword ptr [dword3743+12]
	mov	dword3745,[ebp-976]
	fstp	dword ptr [dword3745+12]
label00d2:
; end of inline function vec4f_subtract
	mov	dword3782,[ebp-848]
	mov	[ebp-980],dword3782
	lea	dword3538,[ebp-884]
	mov	[ebp-984],dword3538
; start of inline function vec4f_dot
	mov	dword3785,[ebp-984]
	mov	dword3787,[ebp-980]
	fld	dword ptr [dword3785+4]
	fmul	dword ptr [dword3787+4]
	mov	dword3789,[ebp-984]
	mov	dword3791,[ebp-980]
	fld	dword ptr [dword3789]
	fmul	dword ptr [dword3791]
	faddp
	mov	dword3793,[ebp-984]
	mov	dword3795,[ebp-980]
	fld	dword ptr [dword3793+8]
	fmul	dword ptr [dword3795+8]
	faddp
	mov	dword3797,[ebp-984]
	mov	dword3799,[ebp-980]
	fld	dword ptr [dword3797+12]
	fmul	dword ptr [dword3799+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d5:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword3800,[ebp-848]
	mov	[ebp-980],dword3800
	lea	dword3540,[ebp-900]
	mov	[ebp-984],dword3540
; start of inline function vec4f_dot
	mov	dword3803,[ebp-984]
	mov	dword3805,[ebp-980]
	fld	dword ptr [dword3803+4]
	fmul	dword ptr [dword3805+4]
	mov	dword3807,[ebp-984]
	mov	dword3809,[ebp-980]
	fld	dword ptr [dword3807]
	fmul	dword ptr [dword3809]
	faddp
	mov	dword3811,[ebp-984]
	mov	dword3813,[ebp-980]
	fld	dword ptr [dword3811+8]
	fmul	dword ptr [dword3813+8]
	faddp
	mov	dword3815,[ebp-984]
	mov	dword3817,[ebp-980]
	fld	dword ptr [dword3815+12]
	fmul	dword ptr [dword3817+12]
	faddp
	fstp	dword ptr [ebp-988]
label00d6:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword3818,[ebp-920]
	mov	[ebp-992],dword3818
	lea	dword3543,[ebp-900]
	mov	[ebp-996],dword3543
; start of inline function vec4f_mul
	mov	dword3821,[ebp-996]
	fld	dword ptr [dword3821]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3821]
	mov	dword3824,[ebp-996]
	fld	dword ptr [dword3824+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3824+4]
	mov	dword3827,[ebp-996]
	fld	dword ptr [dword3827+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3827+8]
	mov	dword3830,[ebp-996]
	fld	dword ptr [dword3830+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword3830+12]
label00d7:
; end of inline function vec4f_mul
	lea	dword3544,[ebp-900]
	mov	[ebp-956],dword3544
	mov	dword3546,[ebp-864]
	mov	[ebp-960],dword3546
	mov	dword3548,[ebp-860]
	mov	dword3550,[dword3548+192]
	imul	dword3550,24
	mov	dword3552,[ebp-860]
	add	dword3552,dword3550
	mov	[ebp-964],dword3552
; start of inline function vec4f_add
	mov	dword3620,[ebp-960]
	mov	dword3622,[ebp-956]
	fld	dword ptr [dword3620]
	fadd	dword ptr [dword3622]
	mov	dword3624,[ebp-964]
	fstp	dword ptr [dword3624]
	mov	dword3626,[ebp-960]
	mov	dword3628,[ebp-956]
	fld	dword ptr [dword3626+4]
	fadd	dword ptr [dword3628+4]
	mov	dword3630,[ebp-964]
	fstp	dword ptr [dword3630+4]
	mov	dword3632,[ebp-960]
	mov	dword3634,[ebp-956]
	fld	dword ptr [dword3632+8]
	fadd	dword ptr [dword3634+8]
	mov	dword3636,[ebp-964]
	fstp	dword ptr [dword3636+8]
	mov	dword3638,[ebp-960]
	mov	dword3640,[ebp-956]
	fld	dword ptr [dword3638+12]
	fadd	dword ptr [dword3640+12]
	mov	dword3642,[ebp-964]
	fstp	dword ptr [dword3642+12]
label00ce:
; end of inline function vec4f_add
	mov	dword3554,16
	add	dword3554,[ebp-864]
	mov	[ebp-936],dword3554
	mov	dword3556,16
	add	dword3556,[ebp-868]
	mov	[ebp-940],dword3556
	lea	dword3557,[ebp-908]
	mov	[ebp-944],dword3557
; start of inline function vec2f_subtract
	mov	dword3599,[ebp-940]
	mov	dword3601,[ebp-936]
	fld	dword ptr [dword3599]
	fsub	dword ptr [dword3601]
	mov	dword3603,[ebp-944]
	fstp	dword ptr [dword3603]
	mov	dword3605,[ebp-940]
	mov	dword3607,[ebp-936]
	fld	dword ptr [dword3605+4]
	fsub	dword ptr [dword3607+4]
	mov	dword3609,[ebp-944]
	fstp	dword ptr [dword3609+4]
label00cc:
; end of inline function vec2f_subtract
	mov	dword3610,[ebp-920]
	mov	[ebp-948],dword3610
	lea	dword3559,[ebp-908]
	mov	[ebp-952],dword3559
; start of inline function vec2f_mul
	mov	dword3613,[ebp-952]
	fld	dword ptr [dword3613]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3613]
	mov	dword3616,[ebp-952]
	fld	dword ptr [dword3616+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3616+4]
label00cd:
; end of inline function vec2f_mul
	lea	dword3560,[ebp-908]
	mov	[ebp-924],dword3560
	mov	dword3562,16
	add	dword3562,[ebp-864]
	mov	[ebp-928],dword3562
	mov	dword3564,[ebp-860]
	mov	dword3566,[dword3564+192]
	imul	dword3566,24
	mov	dword3568,[ebp-860]
	add	dword3568,dword3566
	add	dword3568,16
	mov	[ebp-932],dword3568
; start of inline function vec2f_add
	mov	dword3586,[ebp-928]
	mov	dword3588,[ebp-924]
	fld	dword ptr [dword3586]
	fadd	dword ptr [dword3588]
	mov	dword3590,[ebp-932]
	fstp	dword ptr [dword3590]
	mov	dword3592,[ebp-928]
	mov	dword3594,[ebp-924]
	fld	dword ptr [dword3592+4]
	fadd	dword ptr [dword3594+4]
	mov	dword3596,[ebp-932]
	fstp	dword ptr [dword3596+4]
label00cb:
; end of inline function vec2f_add
	mov	dword3571,[ebp-860]
	inc	dword ptr [dword3571+192]
label00c8:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00c5
label00c6:
	mov	dword3575,[ebp-860]
	mov	dword3576,[dword3575+192]
	inc	dword ptr [dword3575+192]
	imul	dword3576,24
	mov	dword3579,[ebp-860]
	add	dword3579,dword3576
	mov	dword3581,[ebp-860]
	mov	dword3582,[dword3581]
	mov	dword3583,[dword3581+4]
	mov	[dword3579],dword3582
	mov	[dword3579+4],dword3583
	mov	dword3582,[dword3581+8]
	mov	dword3583,[dword3581+12]
	mov	[dword3579+8],dword3582
	mov	[dword3579+12],dword3583
	mov	dword3582,[dword3581+16]
	mov	dword3583,[dword3581+20]
	mov	[dword3579+16],dword3582
	mov	[dword3579+20],dword3583
label00d8:
; end of inline function _clip_on_plain
	lea	dword2064,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-848],dword2064
	lea	dword2065,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-852],dword2065
	lea	dword2066,[ebp-844]
	mov	[ebp-856],dword2066
	mov	dword3832,[ebp-648]
	mov	[ebp-860],dword3832
; start of inline function _clip_on_plain
	mov	dword3835,[ebp-860]
	mov	dword ptr [dword3835+192],0
	mov	dword3838,[ebp-856]
	mov	[ebp-864],dword3838
	mov	dword3841,[ebp-856]
	add	dword3841,24
	mov	[ebp-868],dword3841
label00d9:
label00da:
	mov	dword3845,[ebp-856]
	mov	dword3847,[dword3845+192]
	imul	dword3847,24
	mov	dword3849,[ebp-856]
	add	dword3849,dword3847
	cmp	dword3849,[ebp-868]
	jle	label00db
	mov	dword3995,[ebp-852]
	mov	[ebp-968],dword3995
	mov	dword3853,[ebp-864]
	mov	[ebp-972],dword3853
	lea	dword3854,[ebp-884]
	mov	[ebp-976],dword3854
; start of inline function vec4f_subtract
	mov	dword3998,[ebp-972]
	mov	dword4000,[ebp-968]
	fld	dword ptr [dword3998]
	fsub	dword ptr [dword4000]
	mov	dword4002,[ebp-976]
	fstp	dword ptr [dword4002]
	mov	dword4004,[ebp-972]
	mov	dword4006,[ebp-968]
	fld	dword ptr [dword4004+4]
	fsub	dword ptr [dword4006+4]
	mov	dword4008,[ebp-976]
	fstp	dword ptr [dword4008+4]
	mov	dword4010,[ebp-972]
	mov	dword4012,[ebp-968]
	fld	dword ptr [dword4010+8]
	fsub	dword ptr [dword4012+8]
	mov	dword4014,[ebp-976]
	fstp	dword ptr [dword4014+8]
	mov	dword4016,[ebp-972]
	mov	dword4018,[ebp-968]
	fld	dword ptr [dword4016+12]
	fsub	dword ptr [dword4018+12]
	mov	dword4020,[ebp-976]
	fstp	dword ptr [dword4020+12]
label00e4:
; end of inline function vec4f_subtract
	mov	dword4098,[ebp-848]
	mov	[ebp-980],dword4098
	lea	dword3856,[ebp-884]
	mov	[ebp-984],dword3856
; start of inline function vec4f_dot
	mov	dword4101,[ebp-984]
	mov	dword4103,[ebp-980]
	fld	dword ptr [dword4101+4]
	fmul	dword ptr [dword4103+4]
	mov	dword4105,[ebp-984]
	mov	dword4107,[ebp-980]
	fld	dword ptr [dword4105]
	fmul	dword ptr [dword4107]
	faddp
	mov	dword4109,[ebp-984]
	mov	dword4111,[ebp-980]
	fld	dword ptr [dword4109+8]
	fmul	dword ptr [dword4111+8]
	faddp
	mov	dword4113,[ebp-984]
	mov	dword4115,[ebp-980]
	fld	dword ptr [dword4113+12]
	fmul	dword ptr [dword4115+12]
	faddp
	fstp	dword ptr [ebp-988]
label00e8:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fstp	dword ptr [ebp-912]
	mov	dword4021,[ebp-852]
	mov	[ebp-968],dword4021
	mov	dword3860,[ebp-868]
	mov	[ebp-972],dword3860
	lea	dword3861,[ebp-884]
	mov	[ebp-976],dword3861
; start of inline function vec4f_subtract
	mov	dword4024,[ebp-972]
	mov	dword4026,[ebp-968]
	fld	dword ptr [dword4024]
	fsub	dword ptr [dword4026]
	mov	dword4028,[ebp-976]
	fstp	dword ptr [dword4028]
	mov	dword4030,[ebp-972]
	mov	dword4032,[ebp-968]
	fld	dword ptr [dword4030+4]
	fsub	dword ptr [dword4032+4]
	mov	dword4034,[ebp-976]
	fstp	dword ptr [dword4034+4]
	mov	dword4036,[ebp-972]
	mov	dword4038,[ebp-968]
	fld	dword ptr [dword4036+8]
	fsub	dword ptr [dword4038+8]
	mov	dword4040,[ebp-976]
	fstp	dword ptr [dword4040+8]
	mov	dword4042,[ebp-972]
	mov	dword4044,[ebp-968]
	fld	dword ptr [dword4042+12]
	fsub	dword ptr [dword4044+12]
	mov	dword4046,[ebp-976]
	fstp	dword ptr [dword4046+12]
label00e5:
; end of inline function vec4f_subtract
	mov	dword4116,[ebp-848]
	mov	[ebp-980],dword4116
	lea	dword3863,[ebp-884]
	mov	[ebp-984],dword3863
; start of inline function vec4f_dot
	mov	dword4119,[ebp-984]
	mov	dword4121,[ebp-980]
	fld	dword ptr [dword4119+4]
	fmul	dword ptr [dword4121+4]
	mov	dword4123,[ebp-984]
	mov	dword4125,[ebp-980]
	fld	dword ptr [dword4123]
	fmul	dword ptr [dword4125]
	faddp
	mov	dword4127,[ebp-984]
	mov	dword4129,[ebp-980]
	fld	dword ptr [dword4127+8]
	fmul	dword ptr [dword4129+8]
	faddp
	mov	dword4131,[ebp-984]
	mov	dword4133,[ebp-980]
	fld	dword ptr [dword4131+12]
	fmul	dword ptr [dword4133+12]
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
	mov	dword3867,[ebp-860]
	mov	dword3868,[dword3867+192]
	inc	dword ptr [dword3867+192]
	imul	dword3868,24
	mov	dword3871,[ebp-860]
	add	dword3871,dword3868
	mov	dword3873,[ebp-864]
	mov	dword3874,[dword3873]
	mov	dword3875,[dword3873+4]
	mov	[dword3871],dword3874
	mov	[dword3871+4],dword3875
	mov	dword3874,[dword3873+8]
	mov	dword3875,[dword3873+12]
	mov	[dword3871+8],dword3874
	mov	[dword3871+12],dword3875
	mov	dword3874,[dword3873+16]
	mov	dword3875,[dword3873+20]
	mov	[dword3871+16],dword3874
	mov	[dword3871+20],dword3875
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
	mov	dword3881,[ebp-864]
	mov	[ebp-968],dword3881
	mov	dword4047,[ebp-852]
	mov	[ebp-972],dword4047
	lea	dword3883,[ebp-884]
	mov	[ebp-976],dword3883
; start of inline function vec4f_subtract
	mov	dword4050,[ebp-972]
	mov	dword4052,[ebp-968]
	fld	dword ptr [dword4050]
	fsub	dword ptr [dword4052]
	mov	dword4054,[ebp-976]
	fstp	dword ptr [dword4054]
	mov	dword4056,[ebp-972]
	mov	dword4058,[ebp-968]
	fld	dword ptr [dword4056+4]
	fsub	dword ptr [dword4058+4]
	mov	dword4060,[ebp-976]
	fstp	dword ptr [dword4060+4]
	mov	dword4062,[ebp-972]
	mov	dword4064,[ebp-968]
	fld	dword ptr [dword4062+8]
	fsub	dword ptr [dword4064+8]
	mov	dword4066,[ebp-976]
	fstp	dword ptr [dword4066+8]
	mov	dword4068,[ebp-972]
	mov	dword4070,[ebp-968]
	fld	dword ptr [dword4068+12]
	fsub	dword ptr [dword4070+12]
	mov	dword4072,[ebp-976]
	fstp	dword ptr [dword4072+12]
label00e6:
; end of inline function vec4f_subtract
	mov	dword3885,[ebp-864]
	mov	[ebp-968],dword3885
	mov	dword3887,[ebp-868]
	mov	[ebp-972],dword3887
	lea	dword3888,[ebp-900]
	mov	[ebp-976],dword3888
; start of inline function vec4f_subtract
	mov	dword4075,[ebp-972]
	mov	dword4077,[ebp-968]
	fld	dword ptr [dword4075]
	fsub	dword ptr [dword4077]
	mov	dword4079,[ebp-976]
	fstp	dword ptr [dword4079]
	mov	dword4081,[ebp-972]
	mov	dword4083,[ebp-968]
	fld	dword ptr [dword4081+4]
	fsub	dword ptr [dword4083+4]
	mov	dword4085,[ebp-976]
	fstp	dword ptr [dword4085+4]
	mov	dword4087,[ebp-972]
	mov	dword4089,[ebp-968]
	fld	dword ptr [dword4087+8]
	fsub	dword ptr [dword4089+8]
	mov	dword4091,[ebp-976]
	fstp	dword ptr [dword4091+8]
	mov	dword4093,[ebp-972]
	mov	dword4095,[ebp-968]
	fld	dword ptr [dword4093+12]
	fsub	dword ptr [dword4095+12]
	mov	dword4097,[ebp-976]
	fstp	dword ptr [dword4097+12]
label00e7:
; end of inline function vec4f_subtract
	mov	dword4134,[ebp-848]
	mov	[ebp-980],dword4134
	lea	dword3890,[ebp-884]
	mov	[ebp-984],dword3890
; start of inline function vec4f_dot
	mov	dword4137,[ebp-984]
	mov	dword4139,[ebp-980]
	fld	dword ptr [dword4137+4]
	fmul	dword ptr [dword4139+4]
	mov	dword4141,[ebp-984]
	mov	dword4143,[ebp-980]
	fld	dword ptr [dword4141]
	fmul	dword ptr [dword4143]
	faddp
	mov	dword4145,[ebp-984]
	mov	dword4147,[ebp-980]
	fld	dword ptr [dword4145+8]
	fmul	dword ptr [dword4147+8]
	faddp
	mov	dword4149,[ebp-984]
	mov	dword4151,[ebp-980]
	fld	dword ptr [dword4149+12]
	fmul	dword ptr [dword4151+12]
	faddp
	fstp	dword ptr [ebp-988]
label00ea:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	mov	dword4152,[ebp-848]
	mov	[ebp-980],dword4152
	lea	dword3892,[ebp-900]
	mov	[ebp-984],dword3892
; start of inline function vec4f_dot
	mov	dword4155,[ebp-984]
	mov	dword4157,[ebp-980]
	fld	dword ptr [dword4155+4]
	fmul	dword ptr [dword4157+4]
	mov	dword4159,[ebp-984]
	mov	dword4161,[ebp-980]
	fld	dword ptr [dword4159]
	fmul	dword ptr [dword4161]
	faddp
	mov	dword4163,[ebp-984]
	mov	dword4165,[ebp-980]
	fld	dword ptr [dword4163+8]
	fmul	dword ptr [dword4165+8]
	faddp
	mov	dword4167,[ebp-984]
	mov	dword4169,[ebp-980]
	fld	dword ptr [dword4167+12]
	fmul	dword ptr [dword4169+12]
	faddp
	fstp	dword ptr [ebp-988]
label00eb:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-988]
	fdivp
	fstp	dword ptr [ebp-920]
	mov	dword4170,[ebp-920]
	mov	[ebp-992],dword4170
	lea	dword3895,[ebp-900]
	mov	[ebp-996],dword3895
; start of inline function vec4f_mul
	mov	dword4173,[ebp-996]
	fld	dword ptr [dword4173]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4173]
	mov	dword4176,[ebp-996]
	fld	dword ptr [dword4176+4]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4176+4]
	mov	dword4179,[ebp-996]
	fld	dword ptr [dword4179+8]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4179+8]
	mov	dword4182,[ebp-996]
	fld	dword ptr [dword4182+12]
	fmul	dword ptr [ebp-992]
	fstp	dword ptr [dword4182+12]
label00ec:
; end of inline function vec4f_mul
	lea	dword3896,[ebp-900]
	mov	[ebp-956],dword3896
	mov	dword3898,[ebp-864]
	mov	[ebp-960],dword3898
	mov	dword3900,[ebp-860]
	mov	dword3902,[dword3900+192]
	imul	dword3902,24
	mov	dword3904,[ebp-860]
	add	dword3904,dword3902
	mov	[ebp-964],dword3904
; start of inline function vec4f_add
	mov	dword3972,[ebp-960]
	mov	dword3974,[ebp-956]
	fld	dword ptr [dword3972]
	fadd	dword ptr [dword3974]
	mov	dword3976,[ebp-964]
	fstp	dword ptr [dword3976]
	mov	dword3978,[ebp-960]
	mov	dword3980,[ebp-956]
	fld	dword ptr [dword3978+4]
	fadd	dword ptr [dword3980+4]
	mov	dword3982,[ebp-964]
	fstp	dword ptr [dword3982+4]
	mov	dword3984,[ebp-960]
	mov	dword3986,[ebp-956]
	fld	dword ptr [dword3984+8]
	fadd	dword ptr [dword3986+8]
	mov	dword3988,[ebp-964]
	fstp	dword ptr [dword3988+8]
	mov	dword3990,[ebp-960]
	mov	dword3992,[ebp-956]
	fld	dword ptr [dword3990+12]
	fadd	dword ptr [dword3992+12]
	mov	dword3994,[ebp-964]
	fstp	dword ptr [dword3994+12]
label00e3:
; end of inline function vec4f_add
	mov	dword3906,16
	add	dword3906,[ebp-864]
	mov	[ebp-936],dword3906
	mov	dword3908,16
	add	dword3908,[ebp-868]
	mov	[ebp-940],dword3908
	lea	dword3909,[ebp-908]
	mov	[ebp-944],dword3909
; start of inline function vec2f_subtract
	mov	dword3951,[ebp-940]
	mov	dword3953,[ebp-936]
	fld	dword ptr [dword3951]
	fsub	dword ptr [dword3953]
	mov	dword3955,[ebp-944]
	fstp	dword ptr [dword3955]
	mov	dword3957,[ebp-940]
	mov	dword3959,[ebp-936]
	fld	dword ptr [dword3957+4]
	fsub	dword ptr [dword3959+4]
	mov	dword3961,[ebp-944]
	fstp	dword ptr [dword3961+4]
label00e1:
; end of inline function vec2f_subtract
	mov	dword3962,[ebp-920]
	mov	[ebp-948],dword3962
	lea	dword3911,[ebp-908]
	mov	[ebp-952],dword3911
; start of inline function vec2f_mul
	mov	dword3965,[ebp-952]
	fld	dword ptr [dword3965]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3965]
	mov	dword3968,[ebp-952]
	fld	dword ptr [dword3968+4]
	fmul	dword ptr [ebp-948]
	fstp	dword ptr [dword3968+4]
label00e2:
; end of inline function vec2f_mul
	lea	dword3912,[ebp-908]
	mov	[ebp-924],dword3912
	mov	dword3914,16
	add	dword3914,[ebp-864]
	mov	[ebp-928],dword3914
	mov	dword3916,[ebp-860]
	mov	dword3918,[dword3916+192]
	imul	dword3918,24
	mov	dword3920,[ebp-860]
	add	dword3920,dword3918
	add	dword3920,16
	mov	[ebp-932],dword3920
; start of inline function vec2f_add
	mov	dword3938,[ebp-928]
	mov	dword3940,[ebp-924]
	fld	dword ptr [dword3938]
	fadd	dword ptr [dword3940]
	mov	dword3942,[ebp-932]
	fstp	dword ptr [dword3942]
	mov	dword3944,[ebp-928]
	mov	dword3946,[ebp-924]
	fld	dword ptr [dword3944+4]
	fadd	dword ptr [dword3946+4]
	mov	dword3948,[ebp-932]
	fstp	dword ptr [dword3948+4]
label00e0:
; end of inline function vec2f_add
	mov	dword3923,[ebp-860]
	inc	dword ptr [dword3923+192]
label00dd:
	add	dword ptr [ebp-864],24
	add	dword ptr [ebp-868],24
	jmp	label00da
label00db:
	mov	dword3927,[ebp-860]
	mov	dword3928,[dword3927+192]
	inc	dword ptr [dword3927+192]
	imul	dword3928,24
	mov	dword3931,[ebp-860]
	add	dword3931,dword3928
	mov	dword3933,[ebp-860]
	mov	dword3934,[dword3933]
	mov	dword3935,[dword3933+4]
	mov	[dword3931],dword3934
	mov	[dword3931+4],dword3935
	mov	dword3934,[dword3933+8]
	mov	dword3935,[dword3933+12]
	mov	[dword3931+8],dword3934
	mov	[dword3931+12],dword3935
	mov	dword3934,[dword3933+16]
	mov	dword3935,[dword3933+20]
	mov	[dword3931+16],dword3934
	mov	[dword3931+20],dword3935
label00ed:
; end of inline function _clip_on_plain
	mov	dword2069,[ebp-648]
	cmp	dword ptr [dword2069+192],1
	setg	byte32
	movzx	dword2071,byte32
	mov	[ebp-1000],dword2071
label00ee:
; end of inline function _clip_poligon
	mov	dword40,[ebp-1000]
	cmp	dword40,0
	jne	label0000
	jmp	label00f3
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
	mov	[ebp-1004],dword53
	lea	dword57,[ebp-332]
	mov	dword60,[ebp-336]
	sal	dword60,4
	add	dword57,dword60
	mov	[ebp-1008],dword57
; start of inline function _transform_to_screen_space
	lea	dword4185,dword ptr [__viewport_matrix]
	mov	[ebp-1032],dword4185
	mov	dword4218,[ebp-1004]
	mov	[ebp-1036],dword4218
	lea	dword4187,[ebp-1024]
	mov	[ebp-1040],dword4187
; start of inline function matrix4f_transform
	mov	dword4221,[ebp-1036]
	mov	dword4223,[ebp-1032]
	fld	dword ptr [dword4221+4]
	fmul	dword ptr [dword4223+16]
	mov	dword4225,[ebp-1036]
	mov	dword4227,[ebp-1032]
	fld	dword ptr [dword4225]
	fmul	dword ptr [dword4227]
	faddp
	mov	dword4229,[ebp-1036]
	mov	dword4231,[ebp-1032]
	fld	dword ptr [dword4229+8]
	fmul	dword ptr [dword4231+32]
	faddp
	mov	dword4233,[ebp-1036]
	mov	dword4235,[ebp-1032]
	fld	dword ptr [dword4233+12]
	fmul	dword ptr [dword4235+48]
	faddp
	mov	dword4237,[ebp-1040]
	fstp	dword ptr [dword4237]
	mov	dword4239,[ebp-1032]
	mov	dword4241,[ebp-1036]
	fld	dword ptr [dword4241]
	fmul	dword ptr [dword4239+4]
	mov	dword4243,[ebp-1036]
	mov	dword4245,[ebp-1032]
	fld	dword ptr [dword4243+4]
	fmul	dword ptr [dword4245+20]
	faddp
	mov	dword4247,[ebp-1036]
	mov	dword4249,[ebp-1032]
	fld	dword ptr [dword4247+8]
	fmul	dword ptr [dword4249+36]
	faddp
	mov	dword4251,[ebp-1036]
	mov	dword4253,[ebp-1032]
	fld	dword ptr [dword4251+12]
	fmul	dword ptr [dword4253+52]
	faddp
	mov	dword4255,[ebp-1040]
	fstp	dword ptr [dword4255+4]
	mov	dword4257,[ebp-1032]
	mov	dword4259,[ebp-1036]
	fld	dword ptr [dword4259]
	fmul	dword ptr [dword4257+8]
	mov	dword4261,[ebp-1036]
	mov	dword4263,[ebp-1032]
	fld	dword ptr [dword4261+4]
	fmul	dword ptr [dword4263+24]
	faddp
	mov	dword4265,[ebp-1036]
	mov	dword4267,[ebp-1032]
	fld	dword ptr [dword4265+8]
	fmul	dword ptr [dword4267+40]
	faddp
	mov	dword4269,[ebp-1036]
	mov	dword4271,[ebp-1032]
	fld	dword ptr [dword4269+12]
	fmul	dword ptr [dword4271+56]
	faddp
	mov	dword4273,[ebp-1040]
	fstp	dword ptr [dword4273+8]
	mov	dword4275,[ebp-1032]
	mov	dword4277,[ebp-1036]
	fld	dword ptr [dword4277]
	fmul	dword ptr [dword4275+12]
	mov	dword4279,[ebp-1036]
	mov	dword4281,[ebp-1032]
	fld	dword ptr [dword4279+4]
	fmul	dword ptr [dword4281+28]
	faddp
	mov	dword4283,[ebp-1036]
	mov	dword4285,[ebp-1032]
	fld	dword ptr [dword4283+8]
	fmul	dword ptr [dword4285+44]
	faddp
	mov	dword4287,[ebp-1036]
	mov	dword4289,[ebp-1032]
	fld	dword ptr [dword4287+12]
	fmul	dword ptr [dword4289+60]
	faddp
	mov	dword4291,[ebp-1040]
	fstp	dword ptr [dword4291+12]
label00f1:
; end of inline function matrix4f_transform
	lea	dword4188,[ebp-1024]
	add	dword4188,12
	fld1
	fdiv	dword ptr [dword4188]
	fstp	dword ptr [ebp-1028]
	fld	dword ptr [ebp-1024]
	fmul	dword ptr [ebp-1028]
	float2int	dword4193
	mov	dword4195,[ebp-1008]
	mov	[dword4195],dword4193
	lea	dword4196,[ebp-1024]
	add	dword4196,4
	fld	dword ptr [dword4196]
	fmul	dword ptr [ebp-1028]
	float2int	dword4199
	mov	dword4201,[ebp-1008]
	mov	[dword4201+4],dword4199
	mov	dword4203,[ebp-1008]
	cmp	dword ptr [dword4203],0
	jl	label00f0
	mov	dword4206,[ebp-1008]
	mov	dword4208,[dword4206]
	cmp	dword4208,dword ptr [__width]
	jge	label00f0
	mov	dword4210,[ebp-1008]
	cmp	dword ptr [dword4210+4],0
	jl	label00f0
	mov	dword4213,[ebp-1008]
	mov	dword4215,[dword4213+4]
	cmp	dword4215,dword ptr [__height]
	jl	label00ef
label00f0:
	mov	dword ptr ds:[0],0
label00ef:
label00f2:
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
label00f3:
; end of inline function _rasterize_polygon_4f
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
