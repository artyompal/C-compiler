
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
___unnamed_float_4	dd	080000000h
public	___unnamed_float_4
___unnamed_float_5	dd	0bf800000h
public	___unnamed_float_5
___unnamed_float_6	dd	0437f0000h
public	___unnamed_float_6

.code

_rasterizer_init proc
	create_stack_frame
	movss	sse174,dword ptr [ebp+28]
	movss	sse173,dword ptr [ebp+24]
	mov	dword3,[ebp+8]
	mov	dword ptr [__dbgprintf],dword3
	mov	dword6,[ebp+12]
	mov	dword ptr [__width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__height],dword9
	mov	dword12,[ebp+20]
	mov	dword ptr [__pitch],dword12
	cvtsi2ss	sse1,[ebp+12]
	cvtsi2ss	sse2,[ebp+16]
	divss	sse1,sse2
	movss	dword ptr [ebp-32],sse1
	movss	sse127,dword ptr [ebp+32]
	movss	dword ptr [ebp-36],sse127
	movss	dword ptr [ebp-40],sse174
	movss	dword ptr [ebp-44],sse173
	mov	[ebp-48],(offset __mvproj_matrix)
; start of inline function matrix4f_make_perspective
	movss	sse129,dword ptr [ebp-36]
	mulss	sse129,dword ptr [ebp-44]
	movss	dword ptr [ebp-52],sse129
	movss	sse130,dword ptr [ebp-52]
	mulss	sse130,dword ptr [ebp-32]
	movss	dword ptr [ebp-56],sse130
	mov	dword266,[ebp-48]
	movss	sse131,dword ptr [ebp-44]
	divss	sse131,dword ptr [ebp-56]
	movss	dword ptr [dword266],sse131
	mov	dword270,[ebp-48]
	movss	sse132,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword270+4],sse132
	mov	dword273,[ebp-48]
	movss	sse133,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword273+8],sse133
	mov	dword276,[ebp-48]
	movss	sse134,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword276+12],sse134
	mov	dword279,[ebp-48]
	movss	sse135,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword279+16],sse135
	mov	dword282,[ebp-48]
	movss	sse136,dword ptr [ebp-44]
	divss	sse136,dword ptr [ebp-52]
	movss	dword ptr [dword282+20],sse136
	mov	dword286,[ebp-48]
	movss	sse137,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword286+24],sse137
	mov	dword289,[ebp-48]
	movss	sse138,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword289+28],sse138
	mov	dword292,[ebp-48]
	movss	sse139,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword292+32],sse139
	mov	dword295,[ebp-48]
	movss	sse140,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword295+36],sse140
	mov	dword298,[ebp-48]
	movss	sse141,dword ptr [ebp-40]
	subss	sse141,dword ptr [ebp-44]
	movss	sse142,dword ptr [ebp-40]
	divss	sse142,sse141
	movss	dword ptr [dword298+40],sse142
	mov	dword303,[ebp-48]
	movss	sse143,dword ptr [___unnamed_float_1]
	movss	dword ptr [dword303+44],sse143
	mov	dword306,[ebp-48]
	movss	sse144,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword306+48],sse144
	mov	dword309,[ebp-48]
	movss	sse145,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword309+52],sse145
	mov	dword312,[ebp-48]
	movss	sse146,dword ptr [ebp-44]
	mulss	sse146,dword ptr [ebp-40]
	movss	sse147,dword ptr [ebp-44]
	subss	sse147,dword ptr [ebp-40]
	divss	sse146,sse147
	movss	dword ptr [dword312+56],sse146
	mov	dword318,[ebp-48]
	movss	sse148,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword318+60],sse148
label0010:
; end of inline function matrix4f_make_perspective
	movss	dword ptr [ebp-60],sse174
	movss	dword ptr [ebp-64],sse173
	cvtsi2ss	sse3,[ebp+16]
	movss	dword ptr [ebp-68],sse3
	cvtsi2ss	sse4,[ebp+12]
	movss	dword ptr [ebp-72],sse4
	mov	[ebp-76],(offset __viewport_matrix)
; start of inline function matrix4f_make_viewport
	mov	dword322,[ebp-76]
	movss	sse152,dword ptr [___unnamed_float_3]
	movss	sse153,dword ptr [ebp-72]
	divss	sse153,sse152
	movss	dword ptr [dword322],sse153
	mov	dword326,[ebp-76]
	movss	sse154,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword326+4],sse154
	mov	dword329,[ebp-76]
	movss	sse155,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword329+8],sse155
	mov	dword332,[ebp-76]
	movss	sse156,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword332+12],sse156
	mov	dword335,[ebp-76]
	movss	sse157,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword335+16],sse157
	mov	dword338,[ebp-76]
	movss	sse158,dword ptr [ebp-68]
	xorps	sse158,dword ptr [___unnamed_float_4]
	movss	sse159,dword ptr [___unnamed_float_3]
	divss	sse158,sse159
	movss	dword ptr [dword338+20],sse158
	mov	dword342,[ebp-76]
	movss	sse160,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword342+24],sse160
	mov	dword345,[ebp-76]
	movss	sse161,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword345+28],sse161
	mov	dword348,[ebp-76]
	movss	sse162,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword348+32],sse162
	mov	dword351,[ebp-76]
	movss	sse163,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword351+36],sse163
	mov	dword354,[ebp-76]
	movss	sse164,dword ptr [ebp-60]
	subss	sse164,dword ptr [ebp-64]
	movss	dword ptr [dword354+40],sse164
	mov	dword358,[ebp-76]
	movss	sse165,dword ptr [___unnamed_float_2]
	movss	dword ptr [dword358+44],sse165
	mov	dword361,[ebp-76]
	movss	sse166,dword ptr [___unnamed_float_3]
	movss	sse167,dword ptr [ebp-72]
	divss	sse167,sse166
	movss	dword ptr [dword361+48],sse167
	mov	dword365,[ebp-76]
	movss	sse168,dword ptr [___unnamed_float_3]
	movss	sse169,dword ptr [ebp-68]
	divss	sse169,sse168
	movss	dword ptr [dword365+52],sse169
	mov	dword369,[ebp-76]
	movss	sse170,dword ptr [ebp-64]
	movss	dword ptr [dword369+56],sse170
	mov	dword372,[ebp-76]
	movss	sse171,dword ptr [___unnamed_float_1]
	movss	dword ptr [dword372+60],sse171
label0011:
; end of inline function matrix4f_make_viewport
	movss	sse5,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse5
	movss	dword ptr [ebp-16],sse173
	movss	sse6,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],sse6
	movss	sse7,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],sse7
	mov	[ebp-28],(offset __clip_z_near_base)
; start of inline function vec4f_assign
	mov	dword104,[ebp-28]
	movss	sse63,dword ptr [ebp-24]
	movss	dword ptr [dword104],sse63
	mov	dword107,[ebp-28]
	movss	sse64,dword ptr [ebp-20]
	movss	dword ptr [dword107+4],sse64
	mov	dword110,[ebp-28]
	movss	sse65,dword ptr [ebp-16]
	movss	dword ptr [dword110+8],sse65
	mov	dword113,[ebp-28]
	movss	sse66,dword ptr [ebp-12]
	movss	dword ptr [dword113+12],sse66
label0004:
; end of inline function vec4f_assign
	movss	sse8,sse174
	comiss	sse8,sse173
	jbe	label0000
	movss	sse175,dword ptr [___unnamed_float_1]
	jmp	label0001
label0000:
	movss	sse10,dword ptr [___unnamed_float_5]
	movss	sse175,sse10
label0001:
	movss	sse11,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse11
	movss	dword ptr [ebp-16],sse175
	movss	sse12,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],sse12
	movss	sse13,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],sse13
	mov	[ebp-28],(offset __clip_z_near_norm)
; start of inline function vec4f_assign
	mov	dword117,[ebp-28]
	movss	sse69,dword ptr [ebp-24]
	movss	dword ptr [dword117],sse69
	mov	dword120,[ebp-28]
	movss	sse70,dword ptr [ebp-20]
	movss	dword ptr [dword120+4],sse70
	mov	dword123,[ebp-28]
	movss	sse71,dword ptr [ebp-16]
	movss	dword ptr [dword123+8],sse71
	mov	dword126,[ebp-28]
	movss	sse72,dword ptr [ebp-12]
	movss	dword ptr [dword126+12],sse72
label0005:
; end of inline function vec4f_assign
	movss	sse14,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse14
	movss	dword ptr [ebp-16],sse174
	movss	sse15,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],sse15
	movss	sse16,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],sse16
	mov	[ebp-28],(offset __clip_z_far_base)
; start of inline function vec4f_assign
	mov	dword130,[ebp-28]
	movss	sse75,dword ptr [ebp-24]
	movss	dword ptr [dword130],sse75
	mov	dword133,[ebp-28]
	movss	sse76,dword ptr [ebp-20]
	movss	dword ptr [dword133+4],sse76
	mov	dword136,[ebp-28]
	movss	sse77,dword ptr [ebp-16]
	movss	dword ptr [dword136+8],sse77
	mov	dword139,[ebp-28]
	movss	sse78,dword ptr [ebp-12]
	movss	dword ptr [dword139+12],sse78
label0006:
; end of inline function vec4f_assign
	movss	sse17,sse174
	comiss	sse17,sse173
	jbe	label0002
	movss	sse176,dword ptr [___unnamed_float_5]
	jmp	label0003
label0002:
	movss	sse19,dword ptr [___unnamed_float_1]
	movss	sse176,sse19
label0003:
	movss	sse20,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse20
	movss	dword ptr [ebp-16],sse176
	movss	sse21,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],sse21
	movss	sse22,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],sse22
	mov	[ebp-28],(offset __clip_z_far_norm)
; start of inline function vec4f_assign
	mov	dword143,[ebp-28]
	movss	sse81,dword ptr [ebp-24]
	movss	dword ptr [dword143],sse81
	mov	dword146,[ebp-28]
	movss	sse82,dword ptr [ebp-20]
	movss	dword ptr [dword146+4],sse82
	mov	dword149,[ebp-28]
	movss	sse83,dword ptr [ebp-16]
	movss	dword ptr [dword149+8],sse83
	mov	dword152,[ebp-28]
	movss	sse84,dword ptr [ebp-12]
	movss	dword ptr [dword152+12],sse84
label0007:
; end of inline function vec4f_assign
	movss	sse23,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse23
	movss	sse24,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],sse24
	movss	sse25,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],sse25
	cvtsi2ss	sse26,[ebp+12]
	movss	sse27,dword ptr [___unnamed_float_1]
	divss	sse27,sse26
	movss	sse28,dword ptr [___unnamed_float_5]
	addss	sse28,sse27
	movss	dword ptr [ebp-24],sse28
	mov	[ebp-28],(offset __clip_plane_left_base)
; start of inline function vec4f_assign
	mov	dword156,[ebp-28]
	movss	sse86,dword ptr [ebp-24]
	movss	dword ptr [dword156],sse86
	mov	dword159,[ebp-28]
	movss	sse87,dword ptr [ebp-20]
	movss	dword ptr [dword159+4],sse87
	mov	dword162,[ebp-28]
	movss	sse88,dword ptr [ebp-16]
	movss	dword ptr [dword162+8],sse88
	mov	dword165,[ebp-28]
	movss	sse89,dword ptr [ebp-12]
	movss	dword ptr [dword165+12],sse89
label0008:
; end of inline function vec4f_assign
	movss	sse29,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse29
	movss	sse30,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],sse30
	movss	sse31,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],sse31
	movss	sse32,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-24],sse32
	mov	[ebp-28],(offset __clip_plane_left_norm)
; start of inline function vec4f_assign
	mov	dword169,[ebp-28]
	movss	sse91,dword ptr [ebp-24]
	movss	dword ptr [dword169],sse91
	mov	dword172,[ebp-28]
	movss	sse92,dword ptr [ebp-20]
	movss	dword ptr [dword172+4],sse92
	mov	dword175,[ebp-28]
	movss	sse93,dword ptr [ebp-16]
	movss	dword ptr [dword175+8],sse93
	mov	dword178,[ebp-28]
	movss	sse94,dword ptr [ebp-12]
	movss	dword ptr [dword178+12],sse94
label0009:
; end of inline function vec4f_assign
	movss	sse33,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse33
	movss	sse34,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],sse34
	movss	sse35,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],sse35
	cvtsi2ss	sse36,[ebp+12]
	movss	sse37,dword ptr [___unnamed_float_1]
	divss	sse37,sse36
	movss	sse38,dword ptr [___unnamed_float_1]
	subss	sse38,sse37
	movss	dword ptr [ebp-24],sse38
	mov	[ebp-28],(offset __clip_plane_right_base)
; start of inline function vec4f_assign
	mov	dword182,[ebp-28]
	movss	sse96,dword ptr [ebp-24]
	movss	dword ptr [dword182],sse96
	mov	dword185,[ebp-28]
	movss	sse97,dword ptr [ebp-20]
	movss	dword ptr [dword185+4],sse97
	mov	dword188,[ebp-28]
	movss	sse98,dword ptr [ebp-16]
	movss	dword ptr [dword188+8],sse98
	mov	dword191,[ebp-28]
	movss	sse99,dword ptr [ebp-12]
	movss	dword ptr [dword191+12],sse99
label000a:
; end of inline function vec4f_assign
	movss	sse39,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse39
	movss	sse40,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],sse40
	movss	sse41,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-20],sse41
	movss	sse42,dword ptr [___unnamed_float_5]
	movss	dword ptr [ebp-24],sse42
	mov	[ebp-28],(offset __clip_plane_right_norm)
; start of inline function vec4f_assign
	mov	dword195,[ebp-28]
	movss	sse101,dword ptr [ebp-24]
	movss	dword ptr [dword195],sse101
	mov	dword198,[ebp-28]
	movss	sse102,dword ptr [ebp-20]
	movss	dword ptr [dword198+4],sse102
	mov	dword201,[ebp-28]
	movss	sse103,dword ptr [ebp-16]
	movss	dword ptr [dword201+8],sse103
	mov	dword204,[ebp-28]
	movss	sse104,dword ptr [ebp-12]
	movss	dword ptr [dword204+12],sse104
label000b:
; end of inline function vec4f_assign
	movss	sse43,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse43
	movss	sse44,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],sse44
	cvtsi2ss	sse45,[ebp+16]
	movss	sse46,dword ptr [___unnamed_float_1]
	divss	sse46,sse45
	movss	sse47,dword ptr [___unnamed_float_5]
	addss	sse47,sse46
	movss	dword ptr [ebp-20],sse47
	movss	sse48,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],sse48
	mov	[ebp-28],(offset __clip_plane_top_base)
; start of inline function vec4f_assign
	mov	dword208,[ebp-28]
	movss	sse106,dword ptr [ebp-24]
	movss	dword ptr [dword208],sse106
	mov	dword211,[ebp-28]
	movss	sse107,dword ptr [ebp-20]
	movss	dword ptr [dword211+4],sse107
	mov	dword214,[ebp-28]
	movss	sse108,dword ptr [ebp-16]
	movss	dword ptr [dword214+8],sse108
	mov	dword217,[ebp-28]
	movss	sse109,dword ptr [ebp-12]
	movss	dword ptr [dword217+12],sse109
label000c:
; end of inline function vec4f_assign
	movss	sse49,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse49
	movss	sse50,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],sse50
	movss	sse51,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-20],sse51
	movss	sse52,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],sse52
	mov	[ebp-28],(offset __clip_plane_top_norm)
; start of inline function vec4f_assign
	mov	dword221,[ebp-28]
	movss	sse111,dword ptr [ebp-24]
	movss	dword ptr [dword221],sse111
	mov	dword224,[ebp-28]
	movss	sse112,dword ptr [ebp-20]
	movss	dword ptr [dword224+4],sse112
	mov	dword227,[ebp-28]
	movss	sse113,dword ptr [ebp-16]
	movss	dword ptr [dword227+8],sse113
	mov	dword230,[ebp-28]
	movss	sse114,dword ptr [ebp-12]
	movss	dword ptr [dword230+12],sse114
label000d:
; end of inline function vec4f_assign
	movss	sse53,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse53
	movss	sse54,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],sse54
	movss	sse55,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-20],sse55
	movss	sse56,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],sse56
	mov	[ebp-28],(offset __clip_plane_bottom_base)
; start of inline function vec4f_assign
	mov	dword234,[ebp-28]
	movss	sse116,dword ptr [ebp-24]
	movss	dword ptr [dword234],sse116
	mov	dword237,[ebp-28]
	movss	sse117,dword ptr [ebp-20]
	movss	dword ptr [dword237+4],sse117
	mov	dword240,[ebp-28]
	movss	sse118,dword ptr [ebp-16]
	movss	dword ptr [dword240+8],sse118
	mov	dword243,[ebp-28]
	movss	sse119,dword ptr [ebp-12]
	movss	dword ptr [dword243+12],sse119
label000e:
; end of inline function vec4f_assign
	movss	sse57,dword ptr [___unnamed_float_1]
	movss	dword ptr [ebp-12],sse57
	movss	sse58,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-16],sse58
	movss	sse59,dword ptr [___unnamed_float_5]
	movss	dword ptr [ebp-20],sse59
	movss	sse60,dword ptr [___unnamed_float_2]
	movss	dword ptr [ebp-24],sse60
	mov	[ebp-28],(offset __clip_plane_bottom_norm)
; start of inline function vec4f_assign
	mov	dword247,[ebp-28]
	movss	sse121,dword ptr [ebp-24]
	movss	dword ptr [dword247],sse121
	mov	dword250,[ebp-28]
	movss	sse122,dword ptr [ebp-20]
	movss	dword ptr [dword250+4],sse122
	mov	dword253,[ebp-28]
	movss	sse123,dword ptr [ebp-16]
	movss	dword ptr [dword253+8],sse123
	mov	dword256,[ebp-28]
	movss	sse124,dword ptr [ebp-12]
	movss	dword ptr [dword256+12],sse124
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
	movss	sse19,dword ptr [ebp+24]
	movss	sse18,dword ptr [ebp+20]
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
	movss	dword ptr [ebp-48],sse19
	movss	dword ptr [ebp-52],sse18
; start of inline function _tex2d
	mov	dword85,dword ptr [__texture_width]
	dec	dword85
	cvtsi2ss	sse14,dword85
	mulss	sse14,dword ptr [ebp-52]
	cvttss2si	dword87,sse14
	mov	[ebp-56],dword87
	mov	dword91,dword ptr [__texture_height]
	dec	dword91
	cvtsi2ss	sse15,dword91
	mulss	sse15,dword ptr [ebp-48]
	cvttss2si	dword93,sse15
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
	cvtsi2ss	sse17,[ebp-40]
	movss	sse2,dword ptr [___unnamed_float_6]
	divss	sse17,sse2
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
	cvtsi2ss	sse3,[ebp-20]
	mulss	sse3,sse17
	cvtsi2ss	sse4,[ebp-32]
	movss	sse5,dword ptr [___unnamed_float_1]
	subss	sse5,sse17
	mulss	sse4,sse5
	addss	sse3,sse4
	cvttss2si	dword57,sse3
	mov	[ebp-20],dword57
	cvtsi2ss	sse6,[ebp-24]
	mulss	sse6,sse17
	cvtsi2ss	sse7,[ebp-36]
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
	movss	sse9,sse18
	addss	sse9,dword ptr [ebp+28]
	movss	sse18,sse9
	movss	sse10,sse19
	addss	sse10,dword ptr [ebp+32]
	movss	sse19,sse10
label0001:
	add	dword103,4
	cmp	dword103,dword106
	jl	label0000
label0002:
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	
