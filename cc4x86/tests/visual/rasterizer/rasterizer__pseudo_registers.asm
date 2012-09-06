
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
	movss	sse191,dword ptr [ebp+32]
	movss	sse190,dword ptr [ebp+28]
	movss	sse189,dword ptr [ebp+24]
	mov	dword379,[ebp+20]
	mov	dword378,[ebp+8]
	mov	dword ptr [__dbgprintf],dword378
	mov	dword6,[ebp+12]
	mov	dword ptr [__width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__height],dword9
	mov	dword ptr [__pitch],dword379
; start of inline function matrix4f_make_perspective
	cvtsi2ss	sse182,dword ptr [ebp+12]
	cvtsi2ss	sse2,dword ptr [ebp+16]
	divss	sse182,sse2
	movss	sse181,sse191
	movss	sse180,sse190
	movss	sse179,sse189
	movss	sse183,sse181
	mulss	sse183,sse179
	movss	sse184,sse183
	mulss	sse184,sse182
	movss	sse131,sse179
	divss	sse131,sse184
	movss	dword ptr [__mvproj_matrix],sse131
	movss	sse132,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+4],sse132
	movss	sse133,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+8],sse133
	movss	sse134,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+12],sse134
	movss	sse135,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+16],sse135
	movss	sse136,sse179
	divss	sse136,sse183
	movss	dword ptr [__mvproj_matrix+20],sse136
	movss	sse137,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+24],sse137
	movss	sse138,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+28],sse138
	movss	sse139,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+32],sse139
	movss	sse140,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+36],sse140
	movss	sse141,sse180
	subss	sse141,sse179
	movss	sse142,sse180
	divss	sse142,sse141
	movss	dword ptr [__mvproj_matrix+40],sse142
	movss	sse143,dword ptr [___unnamed_float_1]
	movss	dword ptr [__mvproj_matrix+44],sse143
	movss	sse144,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+48],sse144
	movss	sse145,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+52],sse145
	movss	sse146,sse179
	mulss	sse146,sse180
	movss	sse147,sse179
	subss	sse147,sse180
	divss	sse146,sse147
	movss	dword ptr [__mvproj_matrix+56],sse146
	movss	sse148,dword ptr [___unnamed_float_2]
	movss	dword ptr [__mvproj_matrix+60],sse148
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
	movss	sse188,sse190
	movss	sse187,sse189
	cvtsi2ss	sse186,dword ptr [ebp+16]
	cvtsi2ss	sse185,dword ptr [ebp+12]
	movss	sse153,sse185
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
	movss	sse158,sse186
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
	movss	sse164,sse188
	subss	sse164,sse187
	movss	dword ptr [__viewport_matrix+40],sse164
	movss	sse165,dword ptr [___unnamed_float_2]
	movss	dword ptr [__viewport_matrix+44],sse165
	movss	sse167,sse185
	divss	sse167,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix+48],sse167
	movss	sse169,sse186
	divss	sse169,dword ptr [___unnamed_float_3]
	movss	dword ptr [__viewport_matrix+52],sse169
	movss	dword ptr [__viewport_matrix+56],sse187
	movss	sse171,dword ptr [___unnamed_float_1]
	movss	dword ptr [__viewport_matrix+60],sse171
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,sse189
	movss	sse176,dword ptr [___unnamed_float_2]
	movss	sse175,dword ptr [___unnamed_float_2]
	lea	dword375,dword ptr [__clip_z_near_base]
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
	movss	sse8,sse190
	comiss	sse8,sse189
	jbe	label0000
	movss	sse173,dword ptr [___unnamed_float_1]
	jmp	label0001
label0000:
	movss	sse173,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,sse173
	movss	sse176,dword ptr [___unnamed_float_2]
	movss	sse175,dword ptr [___unnamed_float_2]
	mov	dword375,(offset __clip_z_near_norm)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,sse190
	movss	sse176,dword ptr [___unnamed_float_2]
	movss	sse175,dword ptr [___unnamed_float_2]
	mov	dword375,(offset __clip_z_far_base)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
	movss	sse17,sse190
	comiss	sse17,sse189
	jbe	label0002
	movss	sse174,dword ptr [___unnamed_float_5]
	jmp	label0003
label0002:
	movss	sse174,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,sse174
	movss	sse176,dword ptr [___unnamed_float_2]
	movss	sse175,dword ptr [___unnamed_float_2]
	mov	dword375,(offset __clip_z_far_norm)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,dword ptr [___unnamed_float_2]
	movss	sse176,dword ptr [___unnamed_float_2]
	cvtsi2ss	sse26,dword ptr [ebp+12]
	movss	sse27,dword ptr [___unnamed_float_1]
	divss	sse27,sse26
	movss	sse28,dword ptr [___unnamed_float_5]
	addss	sse28,sse27
	movss	sse175,sse28
	mov	dword375,(offset __clip_plane_left_base)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,dword ptr [___unnamed_float_2]
	movss	sse176,dword ptr [___unnamed_float_2]
	movss	sse175,dword ptr [___unnamed_float_1]
	mov	dword375,(offset __clip_plane_left_norm)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,dword ptr [___unnamed_float_2]
	movss	sse176,dword ptr [___unnamed_float_2]
	cvtsi2ss	sse36,dword ptr [ebp+12]
	movss	sse37,dword ptr [___unnamed_float_1]
	divss	sse37,sse36
	movss	sse38,dword ptr [___unnamed_float_1]
	subss	sse38,sse37
	movss	sse175,sse38
	mov	dword375,(offset __clip_plane_right_base)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,dword ptr [___unnamed_float_2]
	movss	sse176,dword ptr [___unnamed_float_2]
	movss	sse175,dword ptr [___unnamed_float_5]
	mov	dword375,(offset __clip_plane_right_norm)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,dword ptr [___unnamed_float_2]
	cvtsi2ss	sse45,dword ptr [ebp+16]
	movss	sse46,dword ptr [___unnamed_float_1]
	divss	sse46,sse45
	movss	sse47,dword ptr [___unnamed_float_5]
	addss	sse47,sse46
	movss	sse176,sse47
	movss	sse175,dword ptr [___unnamed_float_2]
	mov	dword375,(offset __clip_plane_top_base)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,dword ptr [___unnamed_float_2]
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	mov	dword375,(offset __clip_plane_top_norm)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,dword ptr [___unnamed_float_2]
	movss	sse176,dword ptr [___unnamed_float_1]
	movss	sse175,dword ptr [___unnamed_float_2]
	mov	dword375,(offset __clip_plane_bottom_base)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
	movss	sse178,dword ptr [___unnamed_float_1]
	movss	sse177,dword ptr [___unnamed_float_2]
	movss	sse176,dword ptr [___unnamed_float_5]
	movss	sse175,dword ptr [___unnamed_float_2]
	mov	dword375,(offset __clip_plane_bottom_norm)
	movss	dword ptr [dword375],sse175
	movss	dword ptr [dword375+4],sse176
	movss	dword ptr [dword375+8],sse177
	movss	dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
	destroy_stack_frame
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	create_stack_frame
	mov	dword5,[ebp+8]
	mov	dword ptr [__videomem],dword5
	destroy_stack_frame
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	create_stack_frame
	mov	dword7,[ebp+8]
	mov	dword4,[dword7]
	mov	dword5,[dword7+4]
	mov	dword ptr [__mvproj_matrix],dword4
	mov	dword ptr [__mvproj_matrix+4],dword5
	mov	dword4,[dword7+8]
	mov	dword5,[dword7+12]
	mov	dword ptr [__mvproj_matrix+8],dword4
	mov	dword ptr [__mvproj_matrix+12],dword5
	mov	dword4,[dword7+16]
	mov	dword5,[dword7+20]
	mov	dword ptr [__mvproj_matrix+16],dword4
	mov	dword ptr [__mvproj_matrix+20],dword5
	mov	dword4,[dword7+24]
	mov	dword5,[dword7+28]
	mov	dword ptr [__mvproj_matrix+24],dword4
	mov	dword ptr [__mvproj_matrix+28],dword5
	mov	dword4,[dword7+32]
	mov	dword5,[dword7+36]
	mov	dword ptr [__mvproj_matrix+32],dword4
	mov	dword ptr [__mvproj_matrix+36],dword5
	mov	dword4,[dword7+40]
	mov	dword5,[dword7+44]
	mov	dword ptr [__mvproj_matrix+40],dword4
	mov	dword ptr [__mvproj_matrix+44],dword5
	mov	dword4,[dword7+48]
	mov	dword5,[dword7+52]
	mov	dword ptr [__mvproj_matrix+48],dword4
	mov	dword ptr [__mvproj_matrix+52],dword5
	mov	dword4,[dword7+56]
	mov	dword5,[dword7+60]
	mov	dword ptr [__mvproj_matrix+56],dword4
	mov	dword ptr [__mvproj_matrix+60],dword5
	destroy_stack_frame
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	create_stack_frame
	mov	dword5,[ebp+8]
	mov	dword ptr [__color],dword5
	destroy_stack_frame
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	create_stack_frame
	mov	dword13,[ebp+16]
	mov	dword12,[ebp+12]
	mov	dword11,[ebp+8]
	mov	dword ptr [__texture_data],dword11
	mov	dword ptr [__texture_width],dword12
	mov	dword ptr [__texture_height],dword13
	destroy_stack_frame
	ret
_rasterizer_set_texture endp	

__rasterize_horiz_line proc
	create_stack_frame
	movss	sse23,dword ptr [ebp+32]
	movss	sse22,dword ptr [ebp+28]
	movss	sse21,dword ptr [ebp+24]
	movss	sse20,dword ptr [ebp+20]
	mov	dword113,[ebp+16]
	mov	dword112,[ebp+12]
	mov	dword111,[ebp+8]
	mov	dword103,dword ptr [__pitch]
	imul	dword103,dword113
	add	dword103,dword ptr [__videomem]
	mov	dword7,dword111
	sal	dword7,2
	add	dword103,dword7
	mov	dword104,dword112
	sal	dword104,2
	add	dword104,dword103
	mov	dword15,dword111
	sal	dword15,2
	sub	dword104,dword15
label0000:
; start of inline function _tex2d
	movss	sse19,sse21
	movss	sse18,sse20
	mov	dword85,dword ptr [__texture_width]
	dec	dword85
	cvtsi2ss	sse14,dword85
	mulss	sse14,sse18
	cvttss2si	dword108,sse14
	mov	dword91,dword ptr [__texture_height]
	dec	dword91
	cvtsi2ss	sse15,dword91
	mulss	sse15,sse19
	cvttss2si	dword109,sse15
	mov	dword97,dword109
	imul	dword97,dword ptr [__texture_width]
	add	dword97,dword108
	sal	dword97,2
	add	dword97,dword ptr [__texture_data]
	mov	dword110,[dword97]
; end of inline function _tex2d
	mov	dword105,dword110
	mov	dword23,dword105
	sar	dword23,24
	and	dword23,255
	mov	[ebp-40],dword23
	cmp	dword ptr [ebp-40],0
	je	label0003
	cvtsi2ss	sse17,dword ptr [ebp-40]
	divss	sse17,dword ptr [___unnamed_float_6]
	mov	dword107,[dword103]
	mov	dword36,dword107
	and	dword36,65280
	sar	dword36,8
	mov	[ebp-32],dword36
	mov	dword41,dword107
	and	dword41,255
	mov	[ebp-36],dword41
	mov	dword45,dword105
	and	dword45,65280
	sar	dword45,8
	mov	[ebp-20],dword45
	mov	dword50,dword105
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
	mov	dword106,[ebp-20]
	sal	dword106,8
	add	dword106,[ebp-24]
	mov	[dword103],dword106
label0003:
	addss	sse20,sse22
	addss	sse21,sse23
	add	dword103,4
	cmp	dword103,dword104
	jl	label0000
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__clip_on_plain proc
	create_stack_frame
	mov	dword376,[ebp+20]
	mov	dword375,[ebp+16]
	mov	dword374,[ebp+12]
	mov	dword373,[ebp+8]
	mov	dword ptr [dword373+192],0
	mov	dword355,dword374
	lea	dword356,[dword374+24]
label0001:
	mov	dword14,[dword374+192]
	imul	dword14,24
	mov	dword16,dword374
	add	dword16,dword14
	cmp	dword16,dword356
	jle	label0002
; start of inline function vec4f_subtract
	mov	dword369,dword375
	mov	dword368,dword355
	lea	dword367,[ebp-24]
	movss	sse26,dword ptr [dword368]
	subss	sse26,dword ptr [dword369]
	movss	dword ptr [dword367],sse26
	movss	sse27,dword ptr [dword368+4]
	subss	sse27,dword ptr [dword369+4]
	movss	dword ptr [dword367+4],sse27
	movss	sse28,dword ptr [dword368+8]
	subss	sse28,dword ptr [dword369+8]
	movss	dword ptr [dword367+8],sse28
	movss	sse29,dword ptr [dword368+12]
	subss	sse29,dword ptr [dword369+12]
	movss	dword ptr [dword367+12],sse29
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	dword371,dword376
	lea	dword370,[ebp-24]
	movss	sse46,dword ptr [dword370+4]
	mulss	sse46,dword ptr [dword371+4]
	movss	sse76,dword ptr [dword370]
	mulss	sse76,dword ptr [dword371]
	addss	sse76,sse46
	movss	sse48,dword ptr [dword370+8]
	mulss	sse48,dword ptr [dword371+8]
	addss	sse76,sse48
	movss	sse49,dword ptr [dword370+12]
	mulss	sse49,dword ptr [dword371+12]
	addss	sse76,sse49
; end of inline function vec4f_dot
	movss	sse72,sse76
; start of inline function vec4f_subtract
	mov	dword369,dword375
	mov	dword368,dword356
	lea	dword28,[ebp-24]
	mov	dword367,dword28
	movss	sse31,dword ptr [dword368]
	subss	sse31,dword ptr [dword369]
	movss	dword ptr [dword367],sse31
	movss	sse32,dword ptr [dword368+4]
	subss	sse32,dword ptr [dword369+4]
	movss	dword ptr [dword367+4],sse32
	movss	sse33,dword ptr [dword368+8]
	subss	sse33,dword ptr [dword369+8]
	movss	dword ptr [dword367+8],sse33
	movss	sse34,dword ptr [dword368+12]
	subss	sse34,dword ptr [dword369+12]
	movss	dword ptr [dword367+12],sse34
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	dword371,dword376
	lea	dword30,[ebp-24]
	mov	dword370,dword30
	movss	sse51,dword ptr [dword370+4]
	mulss	sse51,dword ptr [dword371+4]
	movss	sse52,dword ptr [dword370]
	mulss	sse52,dword ptr [dword371]
	addss	sse52,sse51
	movss	sse53,dword ptr [dword370+8]
	mulss	sse53,dword ptr [dword371+8]
	addss	sse52,sse53
	movss	sse54,dword ptr [dword370+12]
	mulss	sse54,dword ptr [dword371+12]
	addss	sse52,sse54
	movss	sse76,sse52
; end of inline function vec4f_dot
	movss	sse73,sse76
	movss	sse3,dword ptr [___unnamed_float_2]
	comiss	sse3,sse72
	ja	label0003
	mov	dword36,[dword373+192]
	inc	dword ptr [dword373+192]
	imul	dword36,24
	mov	dword39,dword373
	add	dword39,dword36
	mov	dword42,[dword355]
	mov	dword43,[dword355+4]
	mov	[dword39],dword42
	mov	[dword39+4],dword43
	mov	dword42,[dword355+8]
	mov	dword43,[dword355+12]
	mov	[dword39+8],dword42
	mov	[dword39+12],dword43
	mov	dword42,[dword355+16]
	mov	dword43,[dword355+20]
	mov	[dword39+16],dword42
	mov	[dword39+20],dword43
label0003:
	movss	sse4,dword ptr [___unnamed_float_2]
	comiss	sse4,sse72
	jae	label0006
	movss	sse5,dword ptr [___unnamed_float_2]
	comiss	sse5,sse73
	ja	label0005
label0006:
	movss	sse6,dword ptr [___unnamed_float_2]
	comiss	sse6,sse73
	ja	label0004
	movss	sse7,dword ptr [___unnamed_float_2]
	comiss	sse7,sse72
	jbe	label0004
label0005:
; start of inline function vec4f_subtract
	mov	dword369,dword355
	mov	dword368,dword375
	lea	dword55,[ebp-24]
	mov	dword367,dword55
	movss	sse36,dword ptr [dword368]
	subss	sse36,dword ptr [dword369]
	movss	dword ptr [dword367],sse36
	movss	sse37,dword ptr [dword368+4]
	subss	sse37,dword ptr [dword369+4]
	movss	dword ptr [dword367+4],sse37
	movss	sse38,dword ptr [dword368+8]
	subss	sse38,dword ptr [dword369+8]
	movss	dword ptr [dword367+8],sse38
	movss	sse39,dword ptr [dword368+12]
	subss	sse39,dword ptr [dword369+12]
	movss	dword ptr [dword367+12],sse39
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
	mov	dword369,dword355
	mov	dword368,dword356
	lea	dword60,[ebp-40]
	mov	dword367,dword60
	movss	sse41,dword ptr [dword368]
	subss	sse41,dword ptr [dword369]
	movss	dword ptr [dword367],sse41
	movss	sse42,dword ptr [dword368+4]
	subss	sse42,dword ptr [dword369+4]
	movss	dword ptr [dword367+4],sse42
	movss	sse43,dword ptr [dword368+8]
	subss	sse43,dword ptr [dword369+8]
	movss	dword ptr [dword367+8],sse43
	movss	sse44,dword ptr [dword368+12]
	subss	sse44,dword ptr [dword369+12]
	movss	dword ptr [dword367+12],sse44
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
	mov	dword371,dword376
	lea	dword62,[ebp-24]
	mov	dword370,dword62
	movss	sse56,dword ptr [dword370+4]
	mulss	sse56,dword ptr [dword371+4]
	movss	sse57,dword ptr [dword370]
	mulss	sse57,dword ptr [dword371]
	addss	sse57,sse56
	movss	sse58,dword ptr [dword370+8]
	mulss	sse58,dword ptr [dword371+8]
	addss	sse57,sse58
	movss	sse59,dword ptr [dword370+12]
	mulss	sse59,dword ptr [dword371+12]
	addss	sse57,sse59
	movss	sse76,sse57
; end of inline function vec4f_dot
	movss	sse74,sse76
; start of inline function vec4f_dot
	mov	dword371,dword376
	lea	dword64,[ebp-40]
	mov	dword370,dword64
	movss	sse61,dword ptr [dword370+4]
	mulss	sse61,dword ptr [dword371+4]
	movss	sse62,dword ptr [dword370]
	mulss	sse62,dword ptr [dword371]
	addss	sse62,sse61
	movss	sse63,dword ptr [dword370+8]
	mulss	sse63,dword ptr [dword371+8]
	addss	sse62,sse63
	movss	sse64,dword ptr [dword370+12]
	mulss	sse64,dword ptr [dword371+12]
	addss	sse62,sse64
	movss	sse76,sse62
; end of inline function vec4f_dot
	divss	sse74,sse76
; start of inline function vec4f_mul
	movss	sse77,sse74
	movss	sse67,dword ptr [ebp-40]
	mulss	sse67,sse77
	movss	dword ptr [ebp-40],sse67
	movss	sse68,dword ptr [ebp-36]
	mulss	sse68,sse77
	movss	dword ptr [ebp-36],sse68
	movss	sse69,dword ptr [ebp-32]
	mulss	sse69,sse77
	movss	dword ptr [ebp-32],sse69
	movss	sse70,dword ptr [ebp-28]
	mulss	sse70,sse77
	movss	dword ptr [ebp-28],sse70
; end of inline function vec4f_mul
; start of inline function vec4f_add
	mov	dword365,dword355
	mov	dword74,[dword373+192]
	imul	dword74,24
	mov	dword364,dword373
	add	dword364,dword74
	movss	sse21,dword ptr [dword365]
	addss	sse21,dword ptr [ebp-40]
	movss	dword ptr [dword364],sse21
	movss	sse22,dword ptr [dword365+4]
	addss	sse22,dword ptr [ebp-36]
	movss	dword ptr [dword364+4],sse22
	movss	sse23,dword ptr [dword365+8]
	addss	sse23,dword ptr [ebp-32]
	movss	dword ptr [dword364+8],sse23
	movss	sse24,dword ptr [dword365+12]
	addss	sse24,dword ptr [ebp-28]
	movss	dword ptr [dword364+12],sse24
; end of inline function vec4f_add
; start of inline function vec2f_subtract
	mov	dword362,dword355
	mov	dword361,dword356
	movss	sse14,dword ptr [dword361+16]
	subss	sse14,dword ptr [dword362+16]
	movss	dword ptr [ebp-48],sse14
	movss	sse15,dword ptr [dword361+20]
	subss	sse15,dword ptr [dword362+20]
	movss	dword ptr [ebp-44],sse15
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
	movss	sse75,sse74
	movss	sse18,dword ptr [ebp-48]
	mulss	sse18,sse75
	movss	dword ptr [ebp-48],sse18
	movss	sse19,dword ptr [ebp-44]
	mulss	sse19,sse75
	movss	dword ptr [ebp-44],sse19
; end of inline function vec2f_mul
; start of inline function vec2f_add
	mov	dword358,dword355
	mov	dword90,[dword373+192]
	imul	dword90,24
	mov	dword357,dword373
	add	dword357,dword90
	add	dword357,16
	movss	sse11,dword ptr [dword358+16]
	addss	sse11,dword ptr [ebp-48]
	movss	dword ptr [dword357],sse11
	movss	sse12,dword ptr [dword358+20]
	addss	sse12,dword ptr [ebp-44]
	movss	dword ptr [dword357+4],sse12
; end of inline function vec2f_add
	inc	dword ptr [dword373+192]
label0004:
	add	dword355,24
	add	dword356,24
	jmp	label0001
label0002:
	mov	dword100,[dword373+192]
	inc	dword ptr [dword373+192]
	imul	dword100,24
	mov	dword103,dword373
	add	dword103,dword100
	mov	dword106,[dword373]
	mov	dword107,[dword373+4]
	mov	[dword103],dword106
	mov	[dword103+4],dword107
	mov	dword106,[dword373+8]
	mov	dword107,[dword373+12]
	mov	[dword103+8],dword106
	mov	[dword103+12],dword107
	mov	dword106,[dword373+16]
	mov	dword107,[dword373+20]
	mov	[dword103+16],dword106
	mov	[dword103+20],dword107
	destroy_stack_frame
	ret
__clip_on_plain endp	

__transform_to_projection_space proc
	create_stack_frame
	mov	dword105,[ebp+12]
	mov	dword104,[ebp+8]
; start of inline function vec4f_assign
	movss	sse31,dword ptr [___unnamed_float_1]
	movss	sse30,dword ptr [dword105+8]
	movss	sse29,dword ptr [dword105+4]
	movss	sse28,dword ptr [dword105]
	movss	dword ptr [ebp-16],sse28
	movss	dword ptr [ebp-12],sse29
	movss	dword ptr [ebp-8],sse30
	movss	dword ptr [ebp-4],sse31
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
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
	movss	dword ptr [dword104],sse12
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
	movss	dword ptr [dword104+4],sse15
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
	movss	dword ptr [dword104+8],sse19
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
	movss	dword ptr [dword104+12],sse23
; end of inline function matrix4f_transform
	destroy_stack_frame
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	create_stack_frame
	mov	dword895,[ebp+28]
	mov	dword894,[ebp+24]
	mov	dword893,[ebp+20]
	mov	dword892,[ebp+16]
	mov	dword891,[ebp+12]
	mov	dword890,[ebp+8]
	push_all
	push_arg	dword890,4
	lea	dword2,[ebp-196]
	push_arg	dword2,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword3,[ebp-196]
	add	dword3,16
	mov	dword7,[dword893]
	mov	dword8,[dword893+4]
	mov	[dword3],dword7
	mov	[dword3+4],dword8
	push_all
	push_arg	dword891,4
	lea	dword10,[ebp-196]
	add	dword10,24
	push_arg	dword10,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword12,[ebp-196]
	add	dword12,24
	add	dword12,16
	mov	dword17,[dword894]
	mov	dword18,[dword894+4]
	mov	[dword12],dword17
	mov	[dword12+4],dword18
	push_all
	push_arg	dword892,4
	lea	dword20,[ebp-196]
	add	dword20,48
	push_arg	dword20,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword22,[ebp-196]
	add	dword22,48
	add	dword22,16
	mov	dword27,[dword895]
	mov	dword28,[dword895+4]
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
	lea	dword864,[ebp-196]
; start of inline function _clip_poligon
	mov	dword883,dword864
	push_all
	lea	dword726,dword ptr [__clip_z_far_norm]
	push_arg	dword726,4
	lea	dword727,dword ptr [__clip_z_far_base]
	push_arg	dword727,4
	push_arg	dword883,4
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
	push_arg	dword883,4
	call	__clip_on_plain
	restore_stack	16
	lea	dword734,dword ptr [__clip_plane_left_norm]
	push_arg	dword734,4
	lea	dword735,dword ptr [__clip_plane_left_base]
	push_arg	dword735,4
	push_arg	dword883,4
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
	push_arg	dword883,4
	call	__clip_on_plain
	restore_stack	16
	lea	dword742,dword ptr [__clip_plane_top_norm]
	push_arg	dword742,4
	lea	dword743,dword ptr [__clip_plane_top_base]
	push_arg	dword743,4
	push_arg	dword883,4
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
	push_arg	dword883,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	cmp	dword ptr [dword883+192],1
	setg	byte8
	movzx	dword884,byte8
; end of inline function _clip_poligon
	cmp	dword884,0
	jne	label0000
	jmp	label0007
label0000:
	cmp	dword ptr [dword864+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword865,0
label0003:
	mov	dword51,[dword864+192]
	cmp	dword51,dword865
	jle	label0004
; start of inline function _transform_to_screen_space
	mov	dword886,dword864
	mov	dword56,dword865
	imul	dword56,24
	add	dword886,dword56
	lea	dword885,[ebp-332]
	mov	dword60,dword865
	sal	dword60,4
	add	dword885,dword60
; start of inline function matrix4f_transform
	mov	dword888,dword886
	movss	sse81,dword ptr [dword888+4]
	mulss	sse81,dword ptr [__viewport_matrix+16]
	movss	sse82,dword ptr [dword888]
	mulss	sse82,dword ptr [__viewport_matrix]
	addss	sse82,sse81
	movss	sse83,dword ptr [dword888+8]
	mulss	sse83,dword ptr [__viewport_matrix+32]
	addss	sse82,sse83
	movss	sse84,dword ptr [dword888+12]
	mulss	sse84,dword ptr [__viewport_matrix+48]
	addss	sse82,sse84
	movss	dword ptr [ebp-688],sse82
	movss	sse85,dword ptr [dword888]
	mulss	sse85,dword ptr [__viewport_matrix+4]
	movss	sse86,dword ptr [dword888+4]
	mulss	sse86,dword ptr [__viewport_matrix+20]
	addss	sse85,sse86
	movss	sse87,dword ptr [dword888+8]
	mulss	sse87,dword ptr [__viewport_matrix+36]
	addss	sse85,sse87
	movss	sse88,dword ptr [dword888+12]
	mulss	sse88,dword ptr [__viewport_matrix+52]
	addss	sse85,sse88
	movss	dword ptr [ebp-684],sse85
	movss	sse89,dword ptr [dword888]
	mulss	sse89,dword ptr [__viewport_matrix+8]
	movss	sse90,dword ptr [dword888+4]
	mulss	sse90,dword ptr [__viewport_matrix+24]
	addss	sse89,sse90
	movss	sse91,dword ptr [dword888+8]
	mulss	sse91,dword ptr [__viewport_matrix+40]
	addss	sse89,sse91
	movss	sse92,dword ptr [dword888+12]
	mulss	sse92,dword ptr [__viewport_matrix+56]
	addss	sse89,sse92
	movss	dword ptr [ebp-680],sse89
	movss	sse93,dword ptr [dword888]
	mulss	sse93,dword ptr [__viewport_matrix+12]
	movss	sse94,dword ptr [dword888+4]
	mulss	sse94,dword ptr [__viewport_matrix+28]
	addss	sse93,sse94
	movss	sse95,dword ptr [dword888+8]
	mulss	sse95,dword ptr [__viewport_matrix+44]
	addss	sse93,sse95
	movss	sse96,dword ptr [dword888+12]
	mulss	sse96,dword ptr [__viewport_matrix+60]
	addss	sse93,sse96
	movss	dword ptr [ebp-676],sse93
; end of inline function matrix4f_transform
	lea	dword758,[ebp-688]
	add	dword758,12
	movss	sse112,dword ptr [___unnamed_float_1]
	divss	sse112,dword ptr [dword758]
	movss	sse78,dword ptr [ebp-688]
	mulss	sse78,sse112
	cvttss2si	dword764,sse78
	mov	[dword885],dword764
	lea	dword767,[ebp-688]
	add	dword767,4
	movss	sse79,dword ptr [dword767]
	mulss	sse79,sse112
	cvttss2si	dword770,sse79
	mov	[dword885+4],dword770
	cmp	dword ptr [dword885],0
	jl	label002a
	mov	dword779,[dword885]
	cmp	dword779,dword ptr [__width]
	jge	label002a
	cmp	dword ptr [dword885+4],0
	jl	label002a
	mov	dword786,[dword885+4]
	cmp	dword786,dword ptr [__height]
	jl	label0029
label002a:
	mov	dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
	lea	dword61,[ebp-332]
	mov	dword64,dword865
	sal	dword64,4
	add	dword61,dword64
	add	dword61,8
	mov	dword67,dword864
	mov	dword70,dword865
	imul	dword70,24
	add	dword67,dword70
	add	dword67,16
	mov	dword72,[dword67]
	mov	dword73,[dword67+4]
	mov	[dword61],dword72
	mov	[dword61+4],dword73
	inc	dword865
	jmp	label0003
label0004:
	mov	dword865,2
label0006:
	mov	dword80,[dword864+192]
	dec	dword80
	cmp	dword80,dword865
	jle	label0007
; start of inline function _rasterize_triangle_2i
	lea	dword868,[ebp-332]
	mov	dword85,dword865
	sal	dword85,4
	add	dword868,dword85
	mov	dword88,dword865
	dec	dword88
	sal	dword88,4
	lea	dword867,[ebp-332]
	add	dword867,dword88
	lea	dword866,[ebp-332]
	mov	dword100,[dword866+4]
	cmp	dword100,[dword867+4]
	jle	label0008
	mov	dword869,dword866
	mov	dword866,dword867
	mov	dword867,dword869
label0008:
	mov	dword116,[dword866+4]
	cmp	dword116,[dword868+4]
	jle	label0009
	mov	dword869,dword866
	mov	dword866,dword868
	mov	dword868,dword869
label0009:
	mov	dword132,[dword867+4]
	cmp	dword132,[dword868+4]
	jle	label000a
	mov	dword869,dword867
	mov	dword867,dword868
	mov	dword868,dword869
label000a:
	mov	dword148,[dword866+4]
	cmp	dword148,[dword868+4]
	jne	label000b
	cmp	dword ptr [dword866+4],0
	jl	label000c
	mov	dword157,[dword866+4]
	cmp	dword157,dword ptr [__height]
	jge	label000c
; start of inline function _rasterize_triangle_1i
	movss	sse111,dword ptr [___unnamed_float_2]
	movss	sse110,dword ptr [___unnamed_float_2]
	mov	dword882,dword868
	mov	dword881,dword867
	mov	dword880,dword866
	mov	dword879,[dword866+4]
	mov	dword878,[dword868]
	mov	dword877,[dword867]
	mov	dword876,[dword866]
	cmp	dword876,dword877
	jge	label001c
	cmp	dword878,dword877
	jle	label001d
	push_all
	push_arg	sse111,4
	push_arg	sse110,4
	push_arg	dword ptr [dword880+12],4
	push_arg	dword ptr [dword880+8],4
	push_arg	dword879,4
	push_arg	dword878,4
	push_arg	dword876,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0020
label001d:
	cmp	dword878,dword876
	jge	label001f
	push_all
	push_arg	sse111,4
	push_arg	sse110,4
	push_arg	dword ptr [dword882+12],4
	push_arg	dword ptr [dword882+8],4
	push_arg	dword879,4
	push_arg	dword877,4
	push_arg	dword878,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0020
label001f:
	push_all
	push_arg	sse111,4
	push_arg	sse110,4
	push_arg	dword ptr [dword880+12],4
	push_arg	dword ptr [dword880+8],4
	push_arg	dword879,4
	push_arg	dword877,4
	push_arg	dword876,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0020:
	jmp	label0025
label001c:
	cmp	dword878,dword877
	jge	label0022
	push_all
	movss	sse69,sse111
	xorps	sse69,dword ptr [___unnamed_float_4]
	push_arg	sse69,4
	movss	sse70,sse110
	xorps	sse70,dword ptr [___unnamed_float_4]
	push_arg	sse70,4
	push_arg	dword ptr [dword882+12],4
	push_arg	dword ptr [dword882+8],4
	push_arg	dword879,4
	push_arg	dword876,4
	push_arg	dword878,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0025
label0022:
	cmp	dword878,dword876
	jle	label0024
	push_all
	movss	sse71,sse111
	xorps	sse71,dword ptr [___unnamed_float_4]
	push_arg	sse71,4
	movss	sse72,sse110
	xorps	sse72,dword ptr [___unnamed_float_4]
	push_arg	sse72,4
	push_arg	dword ptr [dword881+12],4
	push_arg	dword ptr [dword881+8],4
	push_arg	dword879,4
	push_arg	dword878,4
	push_arg	dword877,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0025
label0024:
	push_all
	movss	sse73,sse111
	xorps	sse73,dword ptr [___unnamed_float_4]
	push_arg	sse73,4
	movss	sse74,sse110
	xorps	sse74,dword ptr [___unnamed_float_4]
	push_arg	sse74,4
	push_arg	dword ptr [dword881+12],4
	push_arg	dword ptr [dword881+8],4
	push_arg	dword879,4
	push_arg	dword876,4
	push_arg	dword877,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0025:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label0012
label000b:
	mov	dword872,[dword866+4]
label000e:
	mov	dword184,[dword867+4]
	cmp	dword184,dword872
	jle	label000f
	mov	dword870,dword872
	sub	dword870,[dword866+4]
	mov	dword194,[dword867]
	sub	dword194,[dword866]
	imul	dword870,dword194
	mov	dword201,[dword867+4]
	sub	dword201,[dword866+4]
	cdq	dword202
	idiv	dword870,dword201
	add	dword870,[dword866]
	mov	dword871,dword872
	sub	dword871,[dword866+4]
	mov	dword215,[dword868]
	sub	dword215,[dword866]
	imul	dword871,dword215
	mov	dword222,[dword868+4]
	sub	dword222,[dword866+4]
	cdq	dword223
	idiv	dword871,dword222
	add	dword871,[dword866]
	mov	dword231,dword872
	sub	dword231,[dword866+4]
	cvtsi2ss	sse98,dword231
	movss	sse6,dword ptr [dword867+8]
	subss	sse6,dword ptr [dword866+8]
	mulss	sse98,sse6
	mov	dword242,[dword867+4]
	sub	dword242,[dword866+4]
	cvtsi2ss	sse7,dword242
	divss	sse98,sse7
	addss	sse98,dword ptr [dword866+8]
	mov	dword250,dword872
	sub	dword250,[dword866+4]
	cvtsi2ss	sse100,dword250
	movss	sse9,dword ptr [dword868+8]
	subss	sse9,dword ptr [dword866+8]
	mulss	sse100,sse9
	mov	dword261,[dword868+4]
	sub	dword261,[dword866+4]
	cvtsi2ss	sse10,dword261
	divss	sse100,sse10
	addss	sse100,dword ptr [dword866+8]
	mov	dword269,dword872
	sub	dword269,[dword866+4]
	cvtsi2ss	sse99,dword269
	mov	dword271,8
	add	dword271,dword867
	add	dword271,4
	mov	dword274,8
	add	dword274,dword866
	add	dword274,4
	movss	sse12,dword ptr [dword271]
	subss	sse12,dword ptr [dword274]
	mulss	sse99,sse12
	mov	dword282,[dword867+4]
	sub	dword282,[dword866+4]
	cvtsi2ss	sse13,dword282
	divss	sse99,sse13
	mov	dword284,8
	add	dword284,dword866
	add	dword284,4
	addss	sse99,dword ptr [dword284]
	mov	dword291,dword872
	sub	dword291,[dword866+4]
	cvtsi2ss	sse101,dword291
	mov	dword293,8
	add	dword293,dword868
	add	dword293,4
	mov	dword296,8
	add	dword296,dword866
	add	dword296,4
	movss	sse15,dword ptr [dword293]
	subss	sse15,dword ptr [dword296]
	mulss	sse101,sse15
	mov	dword304,[dword868+4]
	sub	dword304,[dword866+4]
	cvtsi2ss	sse16,dword304
	divss	sse101,sse16
	mov	dword306,8
	add	dword306,dword866
	add	dword306,4
	addss	sse101,dword ptr [dword306]
	mov	dword311,dword871
	sub	dword311,dword870
	cvtsi2ss	sse17,dword311
	movss	sse102,sse100
	subss	sse102,sse98
	divss	sse102,sse17
	mov	dword317,dword871
	sub	dword317,dword870
	cvtsi2ss	sse19,dword317
	movss	sse103,sse101
	subss	sse103,sse99
	divss	sse103,sse19
; start of inline function _rasterize_horiz_line__unordered
	movss	sse109,sse103
	movss	sse108,sse102
	movss	sse107,sse101
	movss	sse106,sse100
	movss	sse105,sse99
	movss	sse104,sse98
	mov	dword875,dword872
	mov	dword874,dword871
	mov	dword873,dword870
	cmp	dword873,dword874
	jg	label0013
	push_all
	push_arg	sse109,4
	push_arg	sse108,4
	push_arg	sse105,4
	push_arg	sse104,4
	push_arg	dword875,4
	push_arg	dword874,4
	push_arg	dword873,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0014
label0013:
	push_all
	push_arg	sse109,4
	push_arg	sse108,4
	push_arg	sse107,4
	push_arg	sse106,4
	push_arg	dword875,4
	push_arg	dword873,4
	push_arg	dword874,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword872
	jmp	label000e
label000f:
	mov	dword337,[dword867+4]
	sub	dword337,[dword866+4]
	mov	dword342,[dword868]
	sub	dword342,[dword866]
	imul	dword337,dword342
	mov	dword349,[dword868+4]
	sub	dword349,[dword866+4]
	cdq	dword350
	idiv	dword337,dword349
	add	dword337,[dword866]
	mov	dword871,dword337
	mov	dword360,[dword867+4]
	sub	dword360,[dword866+4]
	cvtsi2ss	sse21,dword360
	movss	sse22,dword ptr [dword868+8]
	subss	sse22,dword ptr [dword866+8]
	mulss	sse21,sse22
	mov	dword371,[dword868+4]
	sub	dword371,[dword866+4]
	cvtsi2ss	sse23,dword371
	divss	sse21,sse23
	addss	sse21,dword ptr [dword866+8]
	movss	sse100,sse21
	mov	dword381,[dword867+4]
	sub	dword381,[dword866+4]
	cvtsi2ss	sse24,dword381
	mov	dword383,8
	add	dword383,dword868
	add	dword383,4
	mov	dword386,8
	add	dword386,dword866
	add	dword386,4
	movss	sse25,dword ptr [dword383]
	subss	sse25,dword ptr [dword386]
	mulss	sse24,sse25
	mov	dword394,[dword868+4]
	sub	dword394,[dword866+4]
	cvtsi2ss	sse26,dword394
	divss	sse24,sse26
	mov	dword396,8
	add	dword396,dword866
	add	dword396,4
	addss	sse24,dword ptr [dword396]
	movss	sse101,sse24
	movss	sse27,sse100
	subss	sse27,dword ptr [dword867+8]
	mov	dword405,dword871
	sub	dword405,[dword867]
	cvtsi2ss	sse28,dword405
	divss	sse27,sse28
	movss	sse102,sse27
	mov	dword408,8
	add	dword408,dword867
	add	dword408,4
	movss	sse29,sse101
	subss	sse29,dword ptr [dword408]
	mov	dword414,dword871
	sub	dword414,[dword867]
	cvtsi2ss	sse30,dword414
	divss	sse29,sse30
	movss	sse103,sse29
; start of inline function _rasterize_horiz_line__unordered
	movss	sse109,sse103
	movss	sse108,sse102
	mov	dword419,8
	add	dword419,dword867
	add	dword419,4
	movss	sse107,dword ptr [dword419]
	movss	sse106,dword ptr [dword867+8]
	movss	sse105,sse101
	movss	sse104,sse100
	mov	dword610,[dword867+4]
	mov	dword875,dword610
	mov	dword609,[dword867]
	mov	dword874,dword609
	mov	dword873,dword871
	cmp	dword873,dword874
	jg	label0016
	push_all
	push_arg	sse109,4
	push_arg	sse108,4
	push_arg	sse105,4
	push_arg	sse104,4
	push_arg	dword875,4
	push_arg	dword874,4
	push_arg	dword873,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0017
label0016:
	push_all
	push_arg	sse109,4
	push_arg	sse108,4
	push_arg	sse107,4
	push_arg	sse106,4
	push_arg	dword875,4
	push_arg	dword873,4
	push_arg	dword874,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword434,1
	add	dword434,[dword867+4]
	mov	dword872,dword434
label0011:
	mov	dword440,[dword868+4]
	cmp	dword440,dword872
	jle	label0012
	mov	dword445,dword872
	sub	dword445,[dword867+4]
	mov	dword450,[dword868]
	sub	dword450,[dword867]
	imul	dword445,dword450
	mov	dword457,[dword868+4]
	sub	dword457,[dword867+4]
	cdq	dword458
	idiv	dword445,dword457
	add	dword445,[dword867]
	mov	dword870,dword445
	mov	dword466,dword872
	sub	dword466,[dword866+4]
	mov	dword471,[dword868]
	sub	dword471,[dword866]
	imul	dword466,dword471
	mov	dword478,[dword868+4]
	sub	dword478,[dword866+4]
	cdq	dword479
	idiv	dword466,dword478
	add	dword466,[dword866]
	mov	dword871,dword466
	mov	dword487,dword872
	sub	dword487,[dword867+4]
	cvtsi2ss	sse31,dword487
	movss	sse32,dword ptr [dword868+8]
	subss	sse32,dword ptr [dword867+8]
	mulss	sse31,sse32
	mov	dword498,[dword868+4]
	sub	dword498,[dword867+4]
	cvtsi2ss	sse33,dword498
	divss	sse31,sse33
	addss	sse31,dword ptr [dword867+8]
	movss	sse98,sse31
	mov	dword506,dword872
	sub	dword506,[dword866+4]
	cvtsi2ss	sse34,dword506
	movss	sse35,dword ptr [dword868+8]
	subss	sse35,dword ptr [dword866+8]
	mulss	sse34,sse35
	mov	dword517,[dword868+4]
	sub	dword517,[dword866+4]
	cvtsi2ss	sse36,dword517
	divss	sse34,sse36
	addss	sse34,dword ptr [dword866+8]
	movss	sse100,sse34
	mov	dword525,dword872
	sub	dword525,[dword867+4]
	cvtsi2ss	sse37,dword525
	mov	dword527,8
	add	dword527,dword868
	add	dword527,4
	mov	dword530,8
	add	dword530,dword867
	add	dword530,4
	movss	sse38,dword ptr [dword527]
	subss	sse38,dword ptr [dword530]
	mulss	sse37,sse38
	mov	dword538,[dword868+4]
	sub	dword538,[dword867+4]
	cvtsi2ss	sse39,dword538
	divss	sse37,sse39
	mov	dword540,8
	add	dword540,dword867
	add	dword540,4
	addss	sse37,dword ptr [dword540]
	movss	sse99,sse37
	mov	dword547,dword872
	sub	dword547,[dword866+4]
	cvtsi2ss	sse40,dword547
	mov	dword549,8
	add	dword549,dword868
	add	dword549,4
	mov	dword552,8
	add	dword552,dword866
	add	dword552,4
	movss	sse41,dword ptr [dword549]
	subss	sse41,dword ptr [dword552]
	mulss	sse40,sse41
	mov	dword560,[dword868+4]
	sub	dword560,[dword866+4]
	cvtsi2ss	sse42,dword560
	divss	sse40,sse42
	mov	dword562,8
	add	dword562,dword866
	add	dword562,4
	addss	sse40,dword ptr [dword562]
	movss	sse101,sse40
	mov	dword567,dword871
	sub	dword567,dword870
	cvtsi2ss	sse43,dword567
	movss	sse44,sse100
	subss	sse44,sse98
	divss	sse44,sse43
	movss	sse102,sse44
	mov	dword573,dword871
	sub	dword573,dword870
	cvtsi2ss	sse45,dword573
	movss	sse46,sse101
	subss	sse46,sse99
	divss	sse46,sse45
	movss	sse103,sse46
; start of inline function _rasterize_horiz_line__unordered
	movss	sse109,sse103
	movss	sse108,sse102
	movss	sse107,sse101
	movss	sse106,sse100
	movss	sse105,sse99
	movss	sse104,sse98
	mov	dword875,dword872
	mov	dword874,dword871
	mov	dword873,dword870
	cmp	dword873,dword874
	jg	label0019
	push_all
	push_arg	sse109,4
	push_arg	sse108,4
	push_arg	sse105,4
	push_arg	sse104,4
	push_arg	dword875,4
	push_arg	dword874,4
	push_arg	dword873,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label001a
label0019:
	push_all
	push_arg	sse109,4
	push_arg	sse108,4
	push_arg	sse107,4
	push_arg	sse106,4
	push_arg	dword875,4
	push_arg	dword873,4
	push_arg	dword874,4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label001a:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword872
	jmp	label0011
label0012:
; end of inline function _rasterize_triangle_2i
	inc	dword865
	jmp	label0006
label0007:
; end of inline function _rasterize_polygon_4f
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
