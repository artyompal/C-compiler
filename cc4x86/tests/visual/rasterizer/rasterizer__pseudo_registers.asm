
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
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__dbgprintf],dword3
	mov	dword6,[ebp+12]
	mov	dword ptr [__width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__height],dword9
	mov	dword12,[ebp+20]
	mov	dword ptr [__pitch],dword12
; start of inline function matrix4f_make_perspective
	cvtsi2ss	sse1,dword ptr [ebp+12]
	cvtsi2ss	sse2,dword ptr [ebp+16]
	divss	sse1,sse2
	movss	dword ptr [ebp-32],sse1
	movss	sse127,dword ptr [ebp+32]
	movss	dword ptr [ebp-36],sse127
	movss	sse178,dword ptr [ebp+28]
	movss	sse177,dword ptr [ebp+24]
	movss	sse129,dword ptr [ebp-36]
	mulss	sse129,sse177
	movss	dword ptr [ebp-52],sse129
	movss	sse130,dword ptr [ebp-52]
	mulss	sse130,dword ptr [ebp-32]
	movss	dword ptr [ebp-56],sse130
	movss	sse131,sse177
	divss	sse131,dword ptr [ebp-56]
	movss	dword ptr [__mvproj_matrix],sse131
	movss	sse132,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+4],sse132
	movss	sse133,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+8],sse133
	movss	sse134,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+12],sse134
	movss	sse135,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+16],sse135
	movss	sse136,sse177
	divss	sse136,dword ptr [ebp-52]
	movss	dword ptr [__mvproj_matrix+20],sse136
	movss	sse137,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+24],sse137
	movss	sse138,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+28],sse138
	movss	sse139,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+32],sse139
	movss	sse140,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+36],sse140
	movss	sse141,sse178
	subss	sse141,sse177
	movss	sse142,sse178
	divss	sse142,sse141
	movss	dword ptr [__mvproj_matrix+40],sse142
	movss	sse143,dword ptr [___unnamed_float_1]
	movss	dword ptr [__mvproj_matrix+44],sse143
	movss	sse144,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+48],sse144
	movss	sse145,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+52],sse145
	movss	sse146,sse177
	mulss	sse146,sse178
	movss	sse147,sse177
	subss	sse147,sse178
	divss	sse146,sse147
	movss	dword ptr [__mvproj_matrix+56],sse146
	movss	sse148,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+60],sse148
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
	movss	sse150,dword ptr [ebp+28]
	movss	dword ptr [ebp-60],sse150
	movss	sse149,dword ptr [ebp+24]
	movss	dword ptr [ebp-64],sse149
	cvtsi2ss	sse3,dword ptr [ebp+16]
	movss	dword ptr [ebp-68],sse3
	cvtsi2ss	sse4,dword ptr [ebp+12]
	movss	dword ptr [ebp-72],sse4
	movss	sse153,dword ptr [ebp-72]
	divss	sse153,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix],sse153
	movss	sse154,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+4],sse154
	movss	sse155,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+8],sse155
	movss	sse156,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+12],sse156
	movss	sse157,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+16],sse157
	movss	sse158,dword ptr [ebp-68]
	xorps	sse158,dword ptr [___unnamed_float_4]
	divss	sse158,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix+20],sse158
	movss	sse160,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+24],sse160
	movss	sse161,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+28],sse161
	movss	sse162,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+32],sse162
	movss	sse163,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+36],sse163
	movss	sse164,dword ptr [ebp-60]
	subss	sse164,dword ptr [ebp-64]
	movss	dword ptr [__viewport_matrix+40],sse164
	movss	sse165,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+44],sse165
	movss	sse167,dword ptr [ebp-72]
	divss	sse167,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix+48],sse167
	movss	sse169,dword ptr [ebp-68]
	divss	sse169,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix+52],sse169
	movss	sse170,dword ptr [ebp-64]
	movss	dword ptr [__viewport_matrix+56],sse170
	movss	sse171,dword ptr [___unnamed_float_1]
	movss	dword ptr [__viewport_matrix+60],sse171
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [ebp+24]
	movss	sse174,dword ptr [___unnamed_float_2]
	movss	sse173,dword ptr [___unnamed_float_2]
	lea	dword374,dword ptr [__clip_z_near_base]
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
	movss	sse8,dword ptr [ebp+28]
	comiss	sse8,dword ptr [ebp+24]
	jbe	label0000
	movss	sse9,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-4],sse9
	jmp	label0001
label0000:
	movss	sse10,dword ptr [___unnamed_float_5]
	movss	dword ptr [ebp-4],sse10
label0001:
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [ebp-4]
	movss	sse174,dword ptr [___unnamed_float_2]
	movss	sse173,dword ptr [___unnamed_float_2]
	mov	dword374,(offset __clip_z_near_norm)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [ebp+28]
	movss	sse174,dword ptr [___unnamed_float_2]
	movss	sse173,dword ptr [___unnamed_float_2]
	mov	dword374,(offset __clip_z_far_base)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
	movss	sse17,dword ptr [ebp+28]
	comiss	sse17,dword ptr [ebp+24]
	jbe	label0002
	movss	sse18,dword ptr [___unnamed_float_5]
	movss	dword ptr [ebp-8],sse18
	jmp	label0003
label0002:
	movss	sse19,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-8],sse19
label0003:
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [ebp-8]
	movss	sse174,dword ptr [___unnamed_float_2]
	movss	sse173,dword ptr [___unnamed_float_2]
	mov	dword374,(offset __clip_z_far_norm)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	movss	sse174,dword ptr [___unnamed_float_2]
	cvtsi2ss	sse26,dword ptr [ebp+12]
	movss	sse27,dword ptr [___unnamed_float_1]
	divss	sse27,sse26
	movss	sse28,dword ptr [___unnamed_float_5]
	addss	sse28,sse27
	movss	sse173,sse28
	mov	dword374,(offset __clip_plane_left_base)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	movss	sse174,dword ptr [___unnamed_float_2]
	movss	sse173,dword ptr [___unnamed_float_1]
	mov	dword374,(offset __clip_plane_left_norm)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	movss	sse174,dword ptr [___unnamed_float_2]
	cvtsi2ss	sse36,dword ptr [ebp+12]
	movss	sse37,dword ptr [___unnamed_float_1]
	divss	sse37,sse36
	movss	sse38,dword ptr [___unnamed_float_1]
	subss	sse38,sse37
	movss	sse173,sse38
	mov	dword374,(offset __clip_plane_right_base)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	movss	sse174,dword ptr [___unnamed_float_2]
	movss	sse173,dword ptr [___unnamed_float_5]
	mov	dword374,(offset __clip_plane_right_norm)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	cvtsi2ss	sse45,dword ptr [ebp+16]
	movss	sse46,dword ptr [___unnamed_float_1]
	divss	sse46,sse45
	movss	sse47,dword ptr [___unnamed_float_5]
	addss	sse47,sse46
	movss	sse174,sse47
	movss	sse173,dword ptr [___unnamed_float_2]
	mov	dword374,(offset __clip_plane_top_base)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	movss	sse174,dword ptr [___unnamed_float_1]
	movss	sse173,dword ptr [___unnamed_float_2]
	mov	dword374,(offset __clip_plane_top_norm)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	movss	sse174,dword ptr [___unnamed_float_1]
	movss	sse173,dword ptr [___unnamed_float_2]
	mov	dword374,(offset __clip_plane_bottom_base)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	movss	sse174,dword ptr [___unnamed_float_5]
	movss	sse173,dword ptr [___unnamed_float_2]
	mov	dword374,(offset __clip_plane_bottom_norm)
	movss	dword ptr [dword374],sse173
	movss	dword ptr [dword374+4],sse174
	movss	dword ptr [dword374+8],sse175
	movss	dword ptr [dword374+12],sse176
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
	movss	sse19,dword ptr [ebp+24]
	movss	sse18,dword ptr [ebp+20]
	mov	dword103,dword ptr [__pitch]
	imul	dword103,[ebp+16]
	add	dword103,dword ptr [__videomem]
	mov	dword7,[ebp+8]
	sal	dword7,2
	add	dword103,dword7
	mov	dword106,[ebp+12]
	sal	dword106,2
	add	dword106,dword103
	mov	dword15,[ebp+8]
	sal	dword15,2
	sub	dword106,dword15
label0000:
; start of inline function _tex2d
	movss	sse21,sse19
	movss	sse20,sse18
	mov	dword85,dword ptr [__texture_width]
	dec	dword85
	cvtsi2ss	sse14,dword85
	mulss	sse14,sse20
	cvttss2si	dword108,sse14
	mov	dword91,dword ptr [__texture_height]
	dec	dword91
	cvtsi2ss	sse15,dword91
	mulss	sse15,sse21
	cvttss2si	dword93,sse15
	mov	[ebp-60],dword93
	mov	dword97,[ebp-60]
	imul	dword97,dword ptr [__texture_width]
	add	dword97,dword108
	sal	dword97,2
	add	dword97,dword ptr [__texture_data]
	mov	dword101,[dword97]
	mov	[ebp-64],dword101
; end of inline function _tex2d
	mov	dword104,[ebp-64]
	mov	dword23,dword104
	sar	dword23,24
	and	dword23,255
	mov	[ebp-40],dword23
	cmp	dword ptr [ebp-40],0
	je	label0003
	cvtsi2ss	sse17,dword ptr [ebp-40]
	divss	sse17,dword ptr [___unnamed_float_6]
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
	cvtsi2ss	sse3,dword ptr [ebp-20]
	mulss	sse3,sse17
	cvtsi2ss	sse4,dword ptr [ebp-32]
	movss	sse5,dword ptr [___unnamed_float_1]
	subss	sse5,sse17
	mulss	sse4,sse5
	addss	sse3,sse4
	cvttss2si	dword57,sse3
	mov	[ebp-20],dword57
	cvtsi2ss	sse6,dword ptr [ebp-24]
	mulss	sse6,sse17
	cvtsi2ss	sse7,dword ptr [ebp-36]
	movss	sse8,dword ptr [___unnamed_float_1]
	subss	sse8,sse17
	mulss	sse7,sse8
	addss	sse6,sse7
	cvttss2si	dword64,sse6
	mov	[ebp-24],dword64
	mov	dword107,[ebp-20]
	sal	dword107,8
	add	dword107,[ebp-24]
	mov	[dword103],dword107
label0003:
	addss	sse18,dword ptr [ebp+28]
	addss	sse19,dword ptr [ebp+32]
	add	dword103,4
	cmp	dword103,dword106
	jl	label0000
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__clip_on_plain proc
	create_stack_frame
	mov	dword2,[ebp+8]
	mov	dword ptr [dword2+192],0
	mov	dword5,[ebp+12]
	mov	[ebp-4],dword5
	mov	dword8,[ebp+12]
	add	dword8,24
	mov	[ebp-8],dword8
label0001:
	mov	dword12,[ebp+12]
	mov	dword14,[dword12+192]
	imul	dword14,24
	mov	dword16,[ebp+12]
	add	dword16,dword14
	cmp	dword16,[ebp-8]
	jle	label0002
; start of inline function vec4f_subtract
	mov	dword166,[ebp+16]
	mov	[ebp-108],dword166
	mov	dword355,[ebp-4]
	lea	dword354,[ebp-24]
	mov	dword171,[ebp-108]
	movss	sse26,dword ptr [dword355]
	subss	sse26,dword ptr [dword171]
	movss	dword ptr [dword354],sse26
	mov	dword177,[ebp-108]
	movss	sse27,dword ptr [dword355+4]
	subss	sse27,dword ptr [dword177+4]
	movss	dword ptr [dword354+4],sse27
	mov	dword183,[ebp-108]
	movss	sse28,dword ptr [dword355+8]
	subss	sse28,dword ptr [dword183+8]
	movss	dword ptr [dword354+8],sse28
	mov	dword189,[ebp-108]
	movss	sse29,dword ptr [dword355+12]
	subss	sse29,dword ptr [dword189+12]
	movss	dword ptr [dword354+12],sse29
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	dword269,[ebp+20]
	mov	[ebp-120],dword269
	lea	dword23,[ebp-24]
	mov	[ebp-124],dword23
	mov	dword272,[ebp-124]
	mov	dword274,[ebp-120]
	movss	sse46,dword ptr [dword272+4]
	mulss	sse46,dword ptr [dword274+4]
	mov	dword276,[ebp-124]
	mov	dword278,[ebp-120]
	movss	sse72,dword ptr [dword276]
	mulss	sse72,dword ptr [dword278]
	addss	sse72,sse46
	mov	dword280,[ebp-124]
	mov	dword282,[ebp-120]
	movss	sse48,dword ptr [dword280+8]
	mulss	sse48,dword ptr [dword282+8]
	addss	sse72,sse48
	mov	dword284,[ebp-124]
	mov	dword286,[ebp-120]
	movss	sse49,dword ptr [dword284+12]
	mulss	sse49,dword ptr [dword286+12]
	addss	sse72,sse49
; end of inline function vec4f_dot
	movss	sse74,sse72
; start of inline function vec4f_subtract
	mov	dword192,[ebp+16]
	mov	[ebp-108],dword192
	mov	dword27,[ebp-8]
	mov	dword355,dword27
	lea	dword28,[ebp-24]
	mov	dword354,dword28
	mov	dword197,[ebp-108]
	movss	sse31,dword ptr [dword355]
	subss	sse31,dword ptr [dword197]
	movss	dword ptr [dword354],sse31
	mov	dword203,[ebp-108]
	movss	sse32,dword ptr [dword355+4]
	subss	sse32,dword ptr [dword203+4]
	movss	dword ptr [dword354+4],sse32
	mov	dword209,[ebp-108]
	movss	sse33,dword ptr [dword355+8]
	subss	sse33,dword ptr [dword209+8]
	movss	dword ptr [dword354+8],sse33
	mov	dword215,[ebp-108]
	movss	sse34,dword ptr [dword355+12]
	subss	sse34,dword ptr [dword215+12]
	movss	dword ptr [dword354+12],sse34
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	dword287,[ebp+20]
	mov	[ebp-120],dword287
	lea	dword30,[ebp-24]
	mov	[ebp-124],dword30
	mov	dword290,[ebp-124]
	mov	dword292,[ebp-120]
	movss	sse51,dword ptr [dword290+4]
	mulss	sse51,dword ptr [dword292+4]
	mov	dword294,[ebp-124]
	mov	dword296,[ebp-120]
	movss	sse52,dword ptr [dword294]
	mulss	sse52,dword ptr [dword296]
	addss	sse52,sse51
	mov	dword298,[ebp-124]
	mov	dword300,[ebp-120]
	movss	sse53,dword ptr [dword298+8]
	mulss	sse53,dword ptr [dword300+8]
	addss	sse52,sse53
	mov	dword302,[ebp-124]
	mov	dword304,[ebp-120]
	movss	sse54,dword ptr [dword302+12]
	mulss	sse54,dword ptr [dword304+12]
	addss	sse52,sse54
	movss	sse72,sse52
; end of inline function vec4f_dot
	movss	sse75,sse72
	movss	sse3,dword ptr [___unnamed_float_2]
	comiss	sse3,sse74
	ja	label0003
	mov	dword35,[ebp+8]
	mov	dword36,[dword35+192]
	inc	dword ptr [dword35+192]
	imul	dword36,24
	mov	dword39,[ebp+8]
	add	dword39,dword36
	mov	dword41,[ebp-4]
	mov	dword42,[dword41]
	mov	dword43,[dword41+4]
	mov	[dword39],dword42
	mov	[dword39+4],dword43
	mov	dword42,[dword41+8]
	mov	dword43,[dword41+12]
	mov	[dword39+8],dword42
	mov	[dword39+12],dword43
	mov	dword42,[dword41+16]
	mov	dword43,[dword41+20]
	mov	[dword39+16],dword42
	mov	[dword39+20],dword43
label0003:
	movss	sse4,dword ptr [___unnamed_float_2]
	comiss	sse4,sse74
	jae	label0006
	movss	sse5,dword ptr [___unnamed_float_2]
	comiss	sse5,sse75
	ja	label0005
label0006:
	movss	sse6,dword ptr [___unnamed_float_2]
	comiss	sse6,sse75
	ja	label0004
	movss	sse7,dword ptr [___unnamed_float_2]
	comiss	sse7,sse74
	jbe	label0004
label0005:
; start of inline function vec4f_subtract
	mov	dword53,[ebp-4]
	mov	[ebp-108],dword53
	mov	dword218,[ebp+16]
	mov	dword355,dword218
	lea	dword55,[ebp-24]
	mov	dword354,dword55
	mov	dword223,[ebp-108]
	movss	sse36,dword ptr [dword355]
	subss	sse36,dword ptr [dword223]
	movss	dword ptr [dword354],sse36
	mov	dword229,[ebp-108]
	movss	sse37,dword ptr [dword355+4]
	subss	sse37,dword ptr [dword229+4]
	movss	dword ptr [dword354+4],sse37
	mov	dword235,[ebp-108]
	movss	sse38,dword ptr [dword355+8]
	subss	sse38,dword ptr [dword235+8]
	movss	dword ptr [dword354+8],sse38
	mov	dword241,[ebp-108]
	movss	sse39,dword ptr [dword355+12]
	subss	sse39,dword ptr [dword241+12]
	movss	dword ptr [dword354+12],sse39
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
	mov	dword57,[ebp-4]
	mov	[ebp-108],dword57
	mov	dword59,[ebp-8]
	mov	dword355,dword59
	lea	dword60,[ebp-40]
	mov	dword354,dword60
	mov	dword248,[ebp-108]
	movss	sse41,dword ptr [dword355]
	subss	sse41,dword ptr [dword248]
	movss	dword ptr [dword354],sse41
	mov	dword254,[ebp-108]
	movss	sse42,dword ptr [dword355+4]
	subss	sse42,dword ptr [dword254+4]
	movss	dword ptr [dword354+4],sse42
	mov	dword260,[ebp-108]
	movss	sse43,dword ptr [dword355+8]
	subss	sse43,dword ptr [dword260+8]
	movss	dword ptr [dword354+8],sse43
	mov	dword266,[ebp-108]
	movss	sse44,dword ptr [dword355+12]
	subss	sse44,dword ptr [dword266+12]
	movss	dword ptr [dword354+12],sse44
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	dword305,[ebp+20]
	mov	[ebp-120],dword305
	lea	dword62,[ebp-24]
	mov	[ebp-124],dword62
	mov	dword308,[ebp-124]
	mov	dword310,[ebp-120]
	movss	sse56,dword ptr [dword308+4]
	mulss	sse56,dword ptr [dword310+4]
	mov	dword312,[ebp-124]
	mov	dword314,[ebp-120]
	movss	sse57,dword ptr [dword312]
	mulss	sse57,dword ptr [dword314]
	addss	sse57,sse56
	mov	dword316,[ebp-124]
	mov	dword318,[ebp-120]
	movss	sse58,dword ptr [dword316+8]
	mulss	sse58,dword ptr [dword318+8]
	addss	sse57,sse58
	mov	dword320,[ebp-124]
	mov	dword322,[ebp-120]
	movss	sse59,dword ptr [dword320+12]
	mulss	sse59,dword ptr [dword322+12]
	addss	sse57,sse59
	movss	sse72,sse57
; end of inline function vec4f_dot
	movss	sse76,sse72
; start of inline function vec4f_dot
	mov	dword323,[ebp+20]
	mov	[ebp-120],dword323
	lea	dword64,[ebp-40]
	mov	[ebp-124],dword64
	mov	dword326,[ebp-124]
	mov	dword328,[ebp-120]
	movss	sse61,dword ptr [dword326+4]
	mulss	sse61,dword ptr [dword328+4]
	mov	dword330,[ebp-124]
	mov	dword332,[ebp-120]
	movss	sse62,dword ptr [dword330]
	mulss	sse62,dword ptr [dword332]
	addss	sse62,sse61
	mov	dword334,[ebp-124]
	mov	dword336,[ebp-120]
	movss	sse63,dword ptr [dword334+8]
	mulss	sse63,dword ptr [dword336+8]
	addss	sse62,sse63
	mov	dword338,[ebp-124]
	mov	dword340,[ebp-120]
	movss	sse64,dword ptr [dword338+12]
	mulss	sse64,dword ptr [dword340+12]
	addss	sse62,sse64
	movss	sse72,sse62
; end of inline function vec4f_dot
	divss	sse76,sse72
; start of inline function vec4f_mul
	movss	sse73,sse76
	lea	dword67,[ebp-40]
	mov	[ebp-136],dword67
	mov	dword343,[ebp-136]
	movss	sse67,dword ptr [dword343]
	mulss	sse67,sse73
	movss	dword ptr [dword343],sse67
	mov	dword346,[ebp-136]
	movss	sse68,dword ptr [dword346+4]
	mulss	sse68,sse73
	movss	dword ptr [dword346+4],sse68
	mov	dword349,[ebp-136]
	movss	sse69,dword ptr [dword349+8]
	mulss	sse69,sse73
	movss	dword ptr [dword349+8],sse69
	mov	dword352,[ebp-136]
	movss	sse70,dword ptr [dword352+12]
	mulss	sse70,sse73
	movss	dword ptr [dword352+12],sse70
; end of inline function vec4f_mul
; start of inline function vec4f_add
	lea	dword68,[ebp-40]
	mov	[ebp-96],dword68
	mov	dword70,[ebp-4]
	mov	[ebp-100],dword70
	mov	dword72,[ebp+8]
	mov	dword74,[dword72+192]
	imul	dword74,24
	mov	dword76,[ebp+8]
	add	dword76,dword74
	mov	[ebp-104],dword76
	mov	dword143,[ebp-100]
	mov	dword145,[ebp-96]
	movss	sse21,dword ptr [dword143]
	addss	sse21,dword ptr [dword145]
	mov	dword147,[ebp-104]
	movss	dword ptr [dword147],sse21
	mov	dword149,[ebp-100]
	mov	dword151,[ebp-96]
	movss	sse22,dword ptr [dword149+4]
	addss	sse22,dword ptr [dword151+4]
	mov	dword153,[ebp-104]
	movss	dword ptr [dword153+4],sse22
	mov	dword155,[ebp-100]
	mov	dword157,[ebp-96]
	movss	sse23,dword ptr [dword155+8]
	addss	sse23,dword ptr [dword157+8]
	mov	dword159,[ebp-104]
	movss	dword ptr [dword159+8],sse23
	mov	dword161,[ebp-100]
	mov	dword163,[ebp-96]
	movss	sse24,dword ptr [dword161+12]
	addss	sse24,dword ptr [dword163+12]
	mov	dword165,[ebp-104]
	movss	dword ptr [dword165+12],sse24
; end of inline function vec4f_add
; start of inline function vec2f_subtract
	mov	dword78,16
	add	dword78,[ebp-4]
	mov	[ebp-76],dword78
	mov	dword80,16
	add	dword80,[ebp-8]
	mov	[ebp-80],dword80
	lea	dword81,[ebp-48]
	mov	[ebp-84],dword81
	mov	dword123,[ebp-80]
	mov	dword125,[ebp-76]
	movss	sse14,dword ptr [dword123]
	subss	sse14,dword ptr [dword125]
	mov	dword127,[ebp-84]
	movss	dword ptr [dword127],sse14
	mov	dword129,[ebp-80]
	mov	dword131,[ebp-76]
	movss	sse15,dword ptr [dword129+4]
	subss	sse15,dword ptr [dword131+4]
	mov	dword133,[ebp-84]
	movss	dword ptr [dword133+4],sse15
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
	movss	sse77,sse76
	lea	dword83,[ebp-48]
	mov	[ebp-92],dword83
	mov	dword136,[ebp-92]
	movss	sse18,dword ptr [dword136]
	mulss	sse18,sse77
	movss	dword ptr [dword136],sse18
	mov	dword139,[ebp-92]
	movss	sse19,dword ptr [dword139+4]
	mulss	sse19,sse77
	movss	dword ptr [dword139+4],sse19
; end of inline function vec2f_mul
; start of inline function vec2f_add
	lea	dword84,[ebp-48]
	mov	[ebp-64],dword84
	mov	dword86,16
	add	dword86,[ebp-4]
	mov	[ebp-68],dword86
	mov	dword88,[ebp+8]
	mov	dword90,[dword88+192]
	imul	dword90,24
	mov	dword92,[ebp+8]
	add	dword92,dword90
	add	dword92,16
	mov	[ebp-72],dword92
	mov	dword110,[ebp-68]
	mov	dword112,[ebp-64]
	movss	sse11,dword ptr [dword110]
	addss	sse11,dword ptr [dword112]
	mov	dword114,[ebp-72]
	movss	dword ptr [dword114],sse11
	mov	dword116,[ebp-68]
	mov	dword118,[ebp-64]
	movss	sse12,dword ptr [dword116+4]
	addss	sse12,dword ptr [dword118+4]
	mov	dword120,[ebp-72]
	movss	dword ptr [dword120+4],sse12
; end of inline function vec2f_add
	mov	dword95,[ebp+8]
	inc	dword ptr [dword95+192]
label0004:
	add	dword ptr [ebp-4],24
	add	dword ptr [ebp-8],24
	jmp	label0001
label0002:
	mov	dword99,[ebp+8]
	mov	dword100,[dword99+192]
	inc	dword ptr [dword99+192]
	imul	dword100,24
	mov	dword103,[ebp+8]
	add	dword103,dword100
	mov	dword105,[ebp+8]
	mov	dword106,[dword105]
	mov	dword107,[dword105+4]
	mov	[dword103],dword106
	mov	[dword103+4],dword107
	mov	dword106,[dword105+8]
	mov	dword107,[dword105+12]
	mov	[dword103+8],dword106
	mov	[dword103+12],dword107
	mov	dword106,[dword105+16]
	mov	dword107,[dword105+20]
	mov	[dword103+16],dword106
	mov	[dword103+20],dword107
	destroy_stack_frame
	ret
__clip_on_plain endp	

__transform_to_projection_space proc
	create_stack_frame
	mov	dword104,[ebp+12]
; start of inline function vec4f_assign
	movss	sse31,dword ptr [___unnamed_float_1]
	movss	sse30,dword ptr [dword104+8]
	movss	sse29,dword ptr [dword104+4]
	movss	sse28,dword ptr [dword104]
	movss	dword ptr [ebp-16],sse28
	movss	dword ptr [ebp-12],sse29
	movss	dword ptr [ebp-8],sse30
	movss	dword ptr [ebp-4],sse31
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
	mov	dword103,[ebp+8]
	movss	sse11,dword ptr [ebp-12]
	mulss	sse11,dword ptr [__mvproj_matrix+16]
	movss	sse12,dword ptr [ebp-16]
	mulss	sse12,dword ptr [__mvproj_matrix]
	addss	sse12,sse11
	movss	sse13,dword ptr [ebp-8]
	mulss	sse13,dword ptr [__mvproj_matrix+32]
	addss	sse12,sse13
	movss	sse14,dword ptr [ebp-4]
	mulss	sse14,dword ptr [__mvproj_matrix+48]
	addss	sse12,sse14
	movss	dword ptr [dword103],sse12
	movss	sse15,dword ptr [ebp-16]
	mulss	sse15,dword ptr [__mvproj_matrix+4]
	movss	sse16,dword ptr [ebp-12]
	mulss	sse16,dword ptr [__mvproj_matrix+20]
	addss	sse15,sse16
	movss	sse17,dword ptr [ebp-8]
	mulss	sse17,dword ptr [__mvproj_matrix+36]
	addss	sse15,sse17
	movss	sse18,dword ptr [ebp-4]
	mulss	sse18,dword ptr [__mvproj_matrix+52]
	addss	sse15,sse18
	movss	dword ptr [dword103+4],sse15
	movss	sse19,dword ptr [ebp-16]
	mulss	sse19,dword ptr [__mvproj_matrix+8]
	movss	sse20,dword ptr [ebp-12]
	mulss	sse20,dword ptr [__mvproj_matrix+24]
	addss	sse19,sse20
	movss	sse21,dword ptr [ebp-8]
	mulss	sse21,dword ptr [__mvproj_matrix+40]
	addss	sse19,sse21
	movss	sse22,dword ptr [ebp-4]
	mulss	sse22,dword ptr [__mvproj_matrix+56]
	addss	sse19,sse22
	movss	dword ptr [dword103+8],sse19
	movss	sse23,dword ptr [ebp-16]
	mulss	sse23,dword ptr [__mvproj_matrix+12]
	movss	sse24,dword ptr [ebp-12]
	mulss	sse24,dword ptr [__mvproj_matrix+28]
	addss	sse23,sse24
	movss	sse25,dword ptr [ebp-8]
	mulss	sse25,dword ptr [__mvproj_matrix+44]
	addss	sse23,sse25
	movss	sse26,dword ptr [ebp-4]
	mulss	sse26,dword ptr [__mvproj_matrix+60]
	addss	sse23,sse26
	movss	dword ptr [dword103+12],sse23
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
; start of inline function _rasterize_polygon_4f
	lea	dword37,[ebp-196]
	mov	[ebp-200],dword37
; start of inline function _clip_poligon
	mov	dword724,[ebp-200]
	mov	[ebp-464],dword724
	push_all
	lea	dword726,dword ptr [__clip_z_far_norm]
	push_arg	dword726,4
	lea	dword727,dword ptr [__clip_z_far_base]
	push_arg	dword727,4
	push_arg	dword ptr [ebp-464],4
	lea	dword729,[ebp-660]
	push_arg	dword729,4
	call	__clip_on_plain
	restore_stack	16
	lea	dword730,dword ptr [__clip_z_near_norm]
	push_arg	dword730,4
	lea	dword731,dword ptr [__clip_z_near_base]
	push_arg	dword731,4
	lea	dword732,[ebp-660]
	push_arg	dword732,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	lea	dword734,dword ptr [__clip_plane_left_norm]
	push_arg	dword734,4
	lea	dword735,dword ptr [__clip_plane_left_base]
	push_arg	dword735,4
	push_arg	dword ptr [ebp-464],4
	lea	dword737,[ebp-660]
	push_arg	dword737,4
	call	__clip_on_plain
	restore_stack	16
	lea	dword738,dword ptr [__clip_plane_right_norm]
	push_arg	dword738,4
	lea	dword739,dword ptr [__clip_plane_right_base]
	push_arg	dword739,4
	lea	dword740,[ebp-660]
	push_arg	dword740,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	lea	dword742,dword ptr [__clip_plane_top_norm]
	push_arg	dword742,4
	lea	dword743,dword ptr [__clip_plane_top_base]
	push_arg	dword743,4
	push_arg	dword ptr [ebp-464],4
	lea	dword745,[ebp-660]
	push_arg	dword745,4
	call	__clip_on_plain
	restore_stack	16
	lea	dword746,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword746,4
	lea	dword747,dword ptr [__clip_plane_bottom_base]
	push_arg	dword747,4
	lea	dword748,[ebp-660]
	push_arg	dword748,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	mov	dword751,[ebp-464]
	cmp	dword ptr [dword751+192],1
	setg	byte8
	movzx	dword753,byte8
	mov	[ebp-664],dword753
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
label0003:
	mov	dword49,[ebp-200]
	mov	dword51,[dword49+192]
	cmp	dword51,[ebp-336]
	jle	label0004
; start of inline function _transform_to_screen_space
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
; start of inline function matrix4f_transform
	mov	[ebp-696],(offset __viewport_matrix)
	mov	dword789,[ebp-668]
	mov	[ebp-700],dword789
	lea	dword757,[ebp-688]
	mov	[ebp-704],dword757
	mov	dword792,[ebp-700]
	mov	dword794,[ebp-696]
	movss	sse81,dword ptr [dword792+4]
	mulss	sse81,dword ptr [dword794+16]
	mov	dword796,[ebp-700]
	mov	dword798,[ebp-696]
	movss	sse82,dword ptr [dword796]
	mulss	sse82,dword ptr [dword798]
	addss	sse82,sse81
	mov	dword800,[ebp-700]
	mov	dword802,[ebp-696]
	movss	sse83,dword ptr [dword800+8]
	mulss	sse83,dword ptr [dword802+32]
	addss	sse82,sse83
	mov	dword804,[ebp-700]
	mov	dword806,[ebp-696]
	movss	sse84,dword ptr [dword804+12]
	mulss	sse84,dword ptr [dword806+48]
	addss	sse82,sse84
	mov	dword808,[ebp-704]
	movss	dword ptr [dword808],sse82
	mov	dword810,[ebp-696]
	mov	dword812,[ebp-700]
	movss	sse85,dword ptr [dword812]
	mulss	sse85,dword ptr [dword810+4]
	mov	dword814,[ebp-700]
	mov	dword816,[ebp-696]
	movss	sse86,dword ptr [dword814+4]
	mulss	sse86,dword ptr [dword816+20]
	addss	sse85,sse86
	mov	dword818,[ebp-700]
	mov	dword820,[ebp-696]
	movss	sse87,dword ptr [dword818+8]
	mulss	sse87,dword ptr [dword820+36]
	addss	sse85,sse87
	mov	dword822,[ebp-700]
	mov	dword824,[ebp-696]
	movss	sse88,dword ptr [dword822+12]
	mulss	sse88,dword ptr [dword824+52]
	addss	sse85,sse88
	mov	dword826,[ebp-704]
	movss	dword ptr [dword826+4],sse85
	mov	dword828,[ebp-696]
	mov	dword830,[ebp-700]
	movss	sse89,dword ptr [dword830]
	mulss	sse89,dword ptr [dword828+8]
	mov	dword832,[ebp-700]
	mov	dword834,[ebp-696]
	movss	sse90,dword ptr [dword832+4]
	mulss	sse90,dword ptr [dword834+24]
	addss	sse89,sse90
	mov	dword836,[ebp-700]
	mov	dword838,[ebp-696]
	movss	sse91,dword ptr [dword836+8]
	mulss	sse91,dword ptr [dword838+40]
	addss	sse89,sse91
	mov	dword840,[ebp-700]
	mov	dword842,[ebp-696]
	movss	sse92,dword ptr [dword840+12]
	mulss	sse92,dword ptr [dword842+56]
	addss	sse89,sse92
	mov	dword844,[ebp-704]
	movss	dword ptr [dword844+8],sse89
	mov	dword846,[ebp-696]
	mov	dword848,[ebp-700]
	movss	sse93,dword ptr [dword848]
	mulss	sse93,dword ptr [dword846+12]
	mov	dword850,[ebp-700]
	mov	dword852,[ebp-696]
	movss	sse94,dword ptr [dword850+4]
	mulss	sse94,dword ptr [dword852+28]
	addss	sse93,sse94
	mov	dword854,[ebp-700]
	mov	dword856,[ebp-696]
	movss	sse95,dword ptr [dword854+8]
	mulss	sse95,dword ptr [dword856+44]
	addss	sse93,sse95
	mov	dword858,[ebp-700]
	mov	dword860,[ebp-696]
	movss	sse96,dword ptr [dword858+12]
	mulss	sse96,dword ptr [dword860+60]
	addss	sse93,sse96
	mov	dword862,[ebp-704]
	movss	dword ptr [dword862+12],sse93
; end of inline function matrix4f_transform
	lea	dword758,[ebp-688]
	add	dword758,12
	movss	sse77,dword ptr [___unnamed_float_1]
	divss	sse77,dword ptr [dword758]
	movss	dword ptr [ebp-692],sse77
	movss	sse78,dword ptr [ebp-688]
	mulss	sse78,dword ptr [ebp-692]
	cvttss2si	dword764,sse78
	mov	dword766,[ebp-672]
	mov	[dword766],dword764
	lea	dword767,[ebp-688]
	add	dword767,4
	movss	sse79,dword ptr [dword767]
	mulss	sse79,dword ptr [ebp-692]
	cvttss2si	dword770,sse79
	mov	dword772,[ebp-672]
	mov	[dword772+4],dword770
	mov	dword774,[ebp-672]
	cmp	dword ptr [dword774],0
	jl	label002a
	mov	dword777,[ebp-672]
	mov	dword779,[dword777]
	cmp	dword779,dword ptr [__width]
	jge	label002a
	mov	dword781,[ebp-672]
	cmp	dword ptr [dword781+4],0
	jl	label002a
	mov	dword784,[ebp-672]
	mov	dword786,[dword784+4]
	cmp	dword786,dword ptr [__height]
	jl	label0029
label002a:
	mov	dword ptr ds:[0],0
label0029:
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
label0006:
	mov	dword78,[ebp-200]
	mov	dword80,[dword78+192]
	dec	dword80
	cmp	dword80,[ebp-336]
	jle	label0007
; start of inline function _rasterize_triangle_2i
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
; start of inline function _rasterize_triangle_1i
	movss	sse103,dword ptr [___unnamed_float_2]
	movss	sse102,dword ptr [___unnamed_float_2]
	mov	dword161,8
	add	dword161,[ebp-340]
	mov	[ebp-436],dword161
	mov	dword163,8
	add	dword163,[ebp-344]
	mov	[ebp-440],dword163
	mov	dword165,8
	add	dword165,[ebp-348]
	mov	[ebp-444],dword165
	mov	dword167,[ebp-348]
	add	dword167,4
	mov	dword653,[dword167]
	mov	[ebp-448],dword653
	mov	dword170,[ebp-340]
	mov	dword652,[dword170]
	mov	[ebp-452],dword652
	mov	dword172,[ebp-344]
	mov	dword651,[dword172]
	mov	[ebp-456],dword651
	mov	dword174,[ebp-348]
	mov	dword650,[dword174]
	mov	[ebp-460],dword650
	mov	dword657,[ebp-460]
	cmp	dword657,[ebp-456]
	jge	label001c
	mov	dword660,[ebp-452]
	cmp	dword660,[ebp-456]
	jle	label001d
	push_all
	push_arg	sse103,4
	push_arg	sse102,4
	mov	dword664,[ebp-444]
	push_arg	dword ptr [dword664+4],4
	mov	dword666,[ebp-444]
	push_arg	dword ptr [dword666],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-452],4
	push_arg	dword ptr [ebp-460],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label001e
label001d:
	mov	dword672,[ebp-452]
	cmp	dword672,[ebp-460]
	jge	label001f
	push_all
	push_arg	sse103,4
	push_arg	sse102,4
	mov	dword676,[ebp-436]
	push_arg	dword ptr [dword676+4],4
	mov	dword678,[ebp-436]
	push_arg	dword ptr [dword678],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-456],4
	push_arg	dword ptr [ebp-452],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0020
label001f:
	push_all
	push_arg	sse103,4
	push_arg	sse102,4
	mov	dword685,[ebp-444]
	push_arg	dword ptr [dword685+4],4
	mov	dword687,[ebp-444]
	push_arg	dword ptr [dword687],4
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
	mov	dword693,[ebp-452]
	cmp	dword693,[ebp-456]
	jge	label0022
	push_all
	movss	sse69,sse103
	xorps	sse69,dword ptr [___unnamed_float_4]
	push_arg	sse69,4
	movss	sse70,sse102
	xorps	sse70,dword ptr [___unnamed_float_4]
	push_arg	sse70,4
	mov	dword697,[ebp-436]
	push_arg	dword ptr [dword697+4],4
	mov	dword699,[ebp-436]
	push_arg	dword ptr [dword699],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-460],4
	push_arg	dword ptr [ebp-452],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0023
label0022:
	mov	dword705,[ebp-452]
	cmp	dword705,[ebp-460]
	jle	label0024
	push_all
	movss	sse71,sse103
	xorps	sse71,dword ptr [___unnamed_float_4]
	push_arg	sse71,4
	movss	sse72,sse102
	xorps	sse72,dword ptr [___unnamed_float_4]
	push_arg	sse72,4
	mov	dword709,[ebp-440]
	push_arg	dword ptr [dword709+4],4
	mov	dword711,[ebp-440]
	push_arg	dword ptr [dword711],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-452],4
	push_arg	dword ptr [ebp-456],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0025
label0024:
	push_all
	movss	sse73,sse103
	xorps	sse73,dword ptr [___unnamed_float_4]
	push_arg	sse73,4
	movss	sse74,sse102
	xorps	sse74,dword ptr [___unnamed_float_4]
	push_arg	sse74,4
	mov	dword718,[ebp-440]
	push_arg	dword ptr [dword718+4],4
	mov	dword720,[ebp-440]
	push_arg	dword ptr [dword720],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-460],4
	push_arg	dword ptr [ebp-456],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label0027
label000b:
	mov	dword176,[ebp-348]
	add	dword176,4
	mov	dword179,[dword176]
	mov	[ebp-364],dword179
label000e:
	mov	dword181,[ebp-344]
	add	dword181,4
	mov	dword184,[dword181]
	cmp	dword184,[ebp-364]
	jle	label000f
	mov	dword186,[ebp-348]
	add	dword186,4
	mov	dword189,[ebp-364]
	sub	dword189,[dword186]
	mov	dword191,[ebp-344]
	mov	dword193,[ebp-348]
	mov	dword194,[dword191]
	sub	dword194,[dword193]
	imul	dword189,dword194
	mov	dword196,[ebp-344]
	add	dword196,4
	mov	dword199,[ebp-348]
	add	dword199,4
	mov	dword201,[dword196]
	sub	dword201,[dword199]
	cdq	dword202
	idiv	dword189,dword201
	mov	dword204,[ebp-348]
	add	dword189,[dword204]
	mov	[ebp-356],dword189
	mov	dword207,[ebp-348]
	add	dword207,4
	mov	dword210,[ebp-364]
	sub	dword210,[dword207]
	mov	dword212,[ebp-340]
	mov	dword214,[ebp-348]
	mov	dword215,[dword212]
	sub	dword215,[dword214]
	imul	dword210,dword215
	mov	dword217,[ebp-340]
	add	dword217,4
	mov	dword220,[ebp-348]
	add	dword220,4
	mov	dword222,[dword217]
	sub	dword222,[dword220]
	cdq	dword223
	idiv	dword210,dword222
	mov	dword225,[ebp-348]
	add	dword210,[dword225]
	mov	[ebp-360],dword210
	mov	dword228,[ebp-348]
	add	dword228,4
	mov	dword231,[ebp-364]
	sub	dword231,[dword228]
	cvtsi2ss	sse5,dword231
	mov	dword233,[ebp-344]
	mov	dword235,[ebp-348]
	movss	sse6,dword ptr [dword233+8]
	subss	sse6,dword ptr [dword235+8]
	mulss	sse5,sse6
	mov	dword237,[ebp-344]
	add	dword237,4
	mov	dword240,[ebp-348]
	add	dword240,4
	mov	dword242,[dword237]
	sub	dword242,[dword240]
	cvtsi2ss	sse7,dword242
	divss	sse5,sse7
	mov	dword244,[ebp-348]
	addss	sse5,dword ptr [dword244+8]
	movss	dword ptr [ebp-368],sse5
	mov	dword247,[ebp-348]
	add	dword247,4
	mov	dword250,[ebp-364]
	sub	dword250,[dword247]
	cvtsi2ss	sse98,dword250
	mov	dword252,[ebp-340]
	mov	dword254,[ebp-348]
	movss	sse9,dword ptr [dword252+8]
	subss	sse9,dword ptr [dword254+8]
	mulss	sse98,sse9
	mov	dword256,[ebp-340]
	add	dword256,4
	mov	dword259,[ebp-348]
	add	dword259,4
	mov	dword261,[dword256]
	sub	dword261,[dword259]
	cvtsi2ss	sse10,dword261
	divss	sse98,sse10
	mov	dword263,[ebp-348]
	addss	sse98,dword ptr [dword263+8]
	mov	dword266,[ebp-348]
	add	dword266,4
	mov	dword269,[ebp-364]
	sub	dword269,[dword266]
	cvtsi2ss	sse11,dword269
	mov	dword271,8
	add	dword271,[ebp-344]
	add	dword271,4
	mov	dword274,8
	add	dword274,[ebp-348]
	add	dword274,4
	movss	sse12,dword ptr [dword271]
	subss	sse12,dword ptr [dword274]
	mulss	sse11,sse12
	mov	dword277,[ebp-344]
	add	dword277,4
	mov	dword280,[ebp-348]
	add	dword280,4
	mov	dword282,[dword277]
	sub	dword282,[dword280]
	cvtsi2ss	sse13,dword282
	divss	sse11,sse13
	mov	dword284,8
	add	dword284,[ebp-348]
	add	dword284,4
	addss	sse11,dword ptr [dword284]
	movss	dword ptr [ebp-372],sse11
	mov	dword288,[ebp-348]
	add	dword288,4
	mov	dword291,[ebp-364]
	sub	dword291,[dword288]
	cvtsi2ss	sse99,dword291
	mov	dword293,8
	add	dword293,[ebp-340]
	add	dword293,4
	mov	dword296,8
	add	dword296,[ebp-348]
	add	dword296,4
	movss	sse15,dword ptr [dword293]
	subss	sse15,dword ptr [dword296]
	mulss	sse99,sse15
	mov	dword299,[ebp-340]
	add	dword299,4
	mov	dword302,[ebp-348]
	add	dword302,4
	mov	dword304,[dword299]
	sub	dword304,[dword302]
	cvtsi2ss	sse16,dword304
	divss	sse99,sse16
	mov	dword306,8
	add	dword306,[ebp-348]
	add	dword306,4
	addss	sse99,dword ptr [dword306]
	mov	dword311,[ebp-360]
	sub	dword311,[ebp-356]
	cvtsi2ss	sse17,dword311
	movss	sse18,sse98
	subss	sse18,dword ptr [ebp-368]
	divss	sse18,sse17
	movss	dword ptr [ebp-384],sse18
	mov	dword317,[ebp-360]
	sub	dword317,[ebp-356]
	cvtsi2ss	sse19,dword317
	movss	sse20,sse99
	subss	sse20,dword ptr [ebp-372]
	divss	sse20,sse19
	movss	dword ptr [ebp-388],sse20
; start of inline function _rasterize_horiz_line__unordered
	movss	sse101,dword ptr [ebp-388]
	movss	sse100,dword ptr [ebp-384]
	movss	dword ptr [ebp-400],sse99
	movss	dword ptr [ebp-404],sse98
	movss	sse48,dword ptr [ebp-372]
	movss	dword ptr [ebp-408],sse48
	movss	sse47,dword ptr [ebp-368]
	movss	dword ptr [ebp-412],sse47
	mov	dword589,[ebp-364]
	mov	[ebp-416],dword589
	mov	dword588,[ebp-360]
	mov	[ebp-420],dword588
	mov	dword587,[ebp-356]
	mov	[ebp-424],dword587
	mov	dword593,[ebp-424]
	cmp	dword593,[ebp-420]
	jg	label0013
	push_all
	push_arg	sse101,4
	push_arg	sse100,4
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
	push_arg	sse101,4
	push_arg	sse100,4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-364]
	jmp	label000e
label000f:
	mov	dword332,[ebp-344]
	add	dword332,4
	mov	dword335,[ebp-348]
	add	dword335,4
	mov	dword337,[dword332]
	sub	dword337,[dword335]
	mov	dword339,[ebp-340]
	mov	dword341,[ebp-348]
	mov	dword342,[dword339]
	sub	dword342,[dword341]
	imul	dword337,dword342
	mov	dword344,[ebp-340]
	add	dword344,4
	mov	dword347,[ebp-348]
	add	dword347,4
	mov	dword349,[dword344]
	sub	dword349,[dword347]
	cdq	dword350
	idiv	dword337,dword349
	mov	dword352,[ebp-348]
	add	dword337,[dword352]
	mov	[ebp-360],dword337
	mov	dword355,[ebp-344]
	add	dword355,4
	mov	dword358,[ebp-348]
	add	dword358,4
	mov	dword360,[dword355]
	sub	dword360,[dword358]
	cvtsi2ss	sse21,dword360
	mov	dword362,[ebp-340]
	mov	dword364,[ebp-348]
	movss	sse22,dword ptr [dword362+8]
	subss	sse22,dword ptr [dword364+8]
	mulss	sse21,sse22
	mov	dword366,[ebp-340]
	add	dword366,4
	mov	dword369,[ebp-348]
	add	dword369,4
	mov	dword371,[dword366]
	sub	dword371,[dword369]
	cvtsi2ss	sse23,dword371
	divss	sse21,sse23
	mov	dword373,[ebp-348]
	addss	sse21,dword ptr [dword373+8]
	movss	sse98,sse21
	mov	dword376,[ebp-344]
	add	dword376,4
	mov	dword379,[ebp-348]
	add	dword379,4
	mov	dword381,[dword376]
	sub	dword381,[dword379]
	cvtsi2ss	sse24,dword381
	mov	dword383,8
	add	dword383,[ebp-340]
	add	dword383,4
	mov	dword386,8
	add	dword386,[ebp-348]
	add	dword386,4
	movss	sse25,dword ptr [dword383]
	subss	sse25,dword ptr [dword386]
	mulss	sse24,sse25
	mov	dword389,[ebp-340]
	add	dword389,4
	mov	dword392,[ebp-348]
	add	dword392,4
	mov	dword394,[dword389]
	sub	dword394,[dword392]
	cvtsi2ss	sse26,dword394
	divss	sse24,sse26
	mov	dword396,8
	add	dword396,[ebp-348]
	add	dword396,4
	addss	sse24,dword ptr [dword396]
	movss	sse99,sse24
	mov	dword400,[ebp-344]
	movss	sse27,sse98
	subss	sse27,dword ptr [dword400+8]
	mov	dword403,[ebp-344]
	mov	dword405,[ebp-360]
	sub	dword405,[dword403]
	cvtsi2ss	sse28,dword405
	divss	sse27,sse28
	movss	dword ptr [ebp-384],sse27
	mov	dword408,8
	add	dword408,[ebp-344]
	add	dword408,4
	movss	sse29,sse99
	subss	sse29,dword ptr [dword408]
	mov	dword412,[ebp-344]
	mov	dword414,[ebp-360]
	sub	dword414,[dword412]
	cvtsi2ss	sse30,dword414
	divss	sse29,sse30
	movss	dword ptr [ebp-388],sse29
; start of inline function _rasterize_horiz_line__unordered
	movss	sse101,dword ptr [ebp-388]
	movss	sse100,dword ptr [ebp-384]
	mov	dword419,8
	add	dword419,[ebp-344]
	add	dword419,4
	movss	sse57,dword ptr [dword419]
	movss	dword ptr [ebp-400],sse57
	mov	dword422,[ebp-344]
	movss	sse56,dword ptr [dword422+8]
	movss	dword ptr [ebp-404],sse56
	movss	dword ptr [ebp-408],sse99
	movss	dword ptr [ebp-412],sse98
	mov	dword426,[ebp-344]
	add	dword426,4
	mov	dword610,[dword426]
	mov	[ebp-416],dword610
	mov	dword429,[ebp-344]
	mov	dword609,[dword429]
	mov	[ebp-420],dword609
	mov	dword608,[ebp-360]
	mov	[ebp-424],dword608
	mov	dword614,[ebp-424]
	cmp	dword614,[ebp-420]
	jg	label0016
	push_all
	push_arg	sse101,4
	push_arg	sse100,4
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
	push_arg	sse101,4
	push_arg	sse100,4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword432,[ebp-344]
	add	dword432,4
	mov	dword434,1
	add	dword434,[dword432]
	mov	[ebp-364],dword434
label0011:
	mov	dword437,[ebp-340]
	add	dword437,4
	mov	dword440,[dword437]
	cmp	dword440,[ebp-364]
	jle	label0012
	mov	dword442,[ebp-344]
	add	dword442,4
	mov	dword445,[ebp-364]
	sub	dword445,[dword442]
	mov	dword447,[ebp-340]
	mov	dword449,[ebp-344]
	mov	dword450,[dword447]
	sub	dword450,[dword449]
	imul	dword445,dword450
	mov	dword452,[ebp-340]
	add	dword452,4
	mov	dword455,[ebp-344]
	add	dword455,4
	mov	dword457,[dword452]
	sub	dword457,[dword455]
	cdq	dword458
	idiv	dword445,dword457
	mov	dword460,[ebp-344]
	add	dword445,[dword460]
	mov	[ebp-356],dword445
	mov	dword463,[ebp-348]
	add	dword463,4
	mov	dword466,[ebp-364]
	sub	dword466,[dword463]
	mov	dword468,[ebp-340]
	mov	dword470,[ebp-348]
	mov	dword471,[dword468]
	sub	dword471,[dword470]
	imul	dword466,dword471
	mov	dword473,[ebp-340]
	add	dword473,4
	mov	dword476,[ebp-348]
	add	dword476,4
	mov	dword478,[dword473]
	sub	dword478,[dword476]
	cdq	dword479
	idiv	dword466,dword478
	mov	dword481,[ebp-348]
	add	dword466,[dword481]
	mov	[ebp-360],dword466
	mov	dword484,[ebp-344]
	add	dword484,4
	mov	dword487,[ebp-364]
	sub	dword487,[dword484]
	cvtsi2ss	sse31,dword487
	mov	dword489,[ebp-340]
	mov	dword491,[ebp-344]
	movss	sse32,dword ptr [dword489+8]
	subss	sse32,dword ptr [dword491+8]
	mulss	sse31,sse32
	mov	dword493,[ebp-340]
	add	dword493,4
	mov	dword496,[ebp-344]
	add	dword496,4
	mov	dword498,[dword493]
	sub	dword498,[dword496]
	cvtsi2ss	sse33,dword498
	divss	sse31,sse33
	mov	dword500,[ebp-344]
	addss	sse31,dword ptr [dword500+8]
	movss	dword ptr [ebp-368],sse31
	mov	dword503,[ebp-348]
	add	dword503,4
	mov	dword506,[ebp-364]
	sub	dword506,[dword503]
	cvtsi2ss	sse34,dword506
	mov	dword508,[ebp-340]
	mov	dword510,[ebp-348]
	movss	sse35,dword ptr [dword508+8]
	subss	sse35,dword ptr [dword510+8]
	mulss	sse34,sse35
	mov	dword512,[ebp-340]
	add	dword512,4
	mov	dword515,[ebp-348]
	add	dword515,4
	mov	dword517,[dword512]
	sub	dword517,[dword515]
	cvtsi2ss	sse36,dword517
	divss	sse34,sse36
	mov	dword519,[ebp-348]
	addss	sse34,dword ptr [dword519+8]
	movss	sse98,sse34
	mov	dword522,[ebp-344]
	add	dword522,4
	mov	dword525,[ebp-364]
	sub	dword525,[dword522]
	cvtsi2ss	sse37,dword525
	mov	dword527,8
	add	dword527,[ebp-340]
	add	dword527,4
	mov	dword530,8
	add	dword530,[ebp-344]
	add	dword530,4
	movss	sse38,dword ptr [dword527]
	subss	sse38,dword ptr [dword530]
	mulss	sse37,sse38
	mov	dword533,[ebp-340]
	add	dword533,4
	mov	dword536,[ebp-344]
	add	dword536,4
	mov	dword538,[dword533]
	sub	dword538,[dword536]
	cvtsi2ss	sse39,dword538
	divss	sse37,sse39
	mov	dword540,8
	add	dword540,[ebp-344]
	add	dword540,4
	addss	sse37,dword ptr [dword540]
	movss	dword ptr [ebp-372],sse37
	mov	dword544,[ebp-348]
	add	dword544,4
	mov	dword547,[ebp-364]
	sub	dword547,[dword544]
	cvtsi2ss	sse40,dword547
	mov	dword549,8
	add	dword549,[ebp-340]
	add	dword549,4
	mov	dword552,8
	add	dword552,[ebp-348]
	add	dword552,4
	movss	sse41,dword ptr [dword549]
	subss	sse41,dword ptr [dword552]
	mulss	sse40,sse41
	mov	dword555,[ebp-340]
	add	dword555,4
	mov	dword558,[ebp-348]
	add	dword558,4
	mov	dword560,[dword555]
	sub	dword560,[dword558]
	cvtsi2ss	sse42,dword560
	divss	sse40,sse42
	mov	dword562,8
	add	dword562,[ebp-348]
	add	dword562,4
	addss	sse40,dword ptr [dword562]
	movss	sse99,sse40
	mov	dword567,[ebp-360]
	sub	dword567,[ebp-356]
	cvtsi2ss	sse43,dword567
	movss	sse44,sse98
	subss	sse44,dword ptr [ebp-368]
	divss	sse44,sse43
	movss	dword ptr [ebp-384],sse44
	mov	dword573,[ebp-360]
	sub	dword573,[ebp-356]
	cvtsi2ss	sse45,dword573
	movss	sse46,sse99
	subss	sse46,dword ptr [ebp-372]
	divss	sse46,sse45
	movss	dword ptr [ebp-388],sse46
; start of inline function _rasterize_horiz_line__unordered
	movss	sse101,dword ptr [ebp-388]
	movss	sse100,dword ptr [ebp-384]
	movss	dword ptr [ebp-400],sse99
	movss	dword ptr [ebp-404],sse98
	movss	sse62,dword ptr [ebp-372]
	movss	dword ptr [ebp-408],sse62
	movss	sse61,dword ptr [ebp-368]
	movss	dword ptr [ebp-412],sse61
	mov	dword631,[ebp-364]
	mov	[ebp-416],dword631
	mov	dword630,[ebp-360]
	mov	[ebp-420],dword630
	mov	dword629,[ebp-356]
	mov	[ebp-424],dword629
	mov	dword635,[ebp-424]
	cmp	dword635,[ebp-420]
	jg	label0019
	push_all
	push_arg	sse101,4
	push_arg	sse100,4
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
	push_arg	sse101,4
	push_arg	sse100,4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label001a:
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
