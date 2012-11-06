
.686
.model flat
.xmm

.data

__dbgprintf     dd      ?
public  __dbgprintf
__width dd      ?
public  __width
__height        dd      ?
public  __height
__pitch dd      ?
public  __pitch
__color dd      ?
public  __color
__videomem      dd      ?
public  __videomem
__mvproj_matrix db       64 dup (?)
public  __mvproj_matrix
__viewport_matrix       db       64 dup (?)
public  __viewport_matrix
__clip_z_near_base      db       16 dup (?)
public  __clip_z_near_base
__clip_z_near_norm      db       16 dup (?)
public  __clip_z_near_norm
__clip_z_far_base       db       16 dup (?)
public  __clip_z_far_base
__clip_z_far_norm       db       16 dup (?)
public  __clip_z_far_norm
__clip_plane_left_base  db       16 dup (?)
public  __clip_plane_left_base
__clip_plane_left_norm  db       16 dup (?)
public  __clip_plane_left_norm
__clip_plane_right_base db       16 dup (?)
public  __clip_plane_right_base
__clip_plane_right_norm db       16 dup (?)
public  __clip_plane_right_norm
__clip_plane_top_base   db       16 dup (?)
public  __clip_plane_top_base
__clip_plane_top_norm   db       16 dup (?)
public  __clip_plane_top_norm
__clip_plane_bottom_base        db       16 dup (?)
public  __clip_plane_bottom_base
__clip_plane_bottom_norm        db       16 dup (?)
public  __clip_plane_bottom_norm
__texture_data  dd      ?
public  __texture_data
__texture_width dd      ?
public  __texture_width
__texture_height        dd      ?
public  __texture_height
___unnamed_double_0     dq      03f1a36e2eb1c432dh
public  ___unnamed_double_0
___unnamed_float_1      dd      03f800000h
public  ___unnamed_float_1
___unnamed_float_2      dd      00h
public  ___unnamed_float_2
___unnamed_float_3      dd      040000000h
public  ___unnamed_float_3
align 16
___unnamed_float_4      dd      080000000h, 00h, 00h, 00h
public  ___unnamed_float_4
___unnamed_float_5      dd      0bf800000h
public  ___unnamed_float_5
___unnamed_float_6      dd      0437f0000h
public  ___unnamed_float_6

.code

_rasterizer_init proc
        create_stack_frame
        movss   sse191,dword ptr [ebp+32]
        movss   sse190,dword ptr [ebp+28]
        movss   sse189,dword ptr [ebp+24]
        mov     dword381,[ebp+20]
        mov     dword380,[ebp+16]
        mov     dword379,[ebp+12]
        mov     dword378,[ebp+8]
        mov     dword3,dword378
        mov     dword ptr [__dbgprintf],dword3
        mov     dword6,dword379
        mov     dword ptr [__width],dword6
        mov     dword9,dword380
        mov     dword ptr [__height],dword9
        mov     dword12,dword381
        mov     dword ptr [__pitch],dword12
; start of inline function matrix4f_make_perspective
        cvtsi2ss        sse1,dword379
        cvtsi2ss        sse2,dword380
        divss   sse1,sse2
        movss   sse182,sse1
        movss   sse181,sse191
        movss   sse180,sse190
        movss   sse179,sse189
        mov     dword376,(offset __mvproj_matrix)
        movss   sse129,sse181
        mulss   sse129,sse179
        movss   sse183,sse129
        movss   sse130,sse183
        mulss   sse130,sse182
        movss   sse184,sse130
        mov     dword266,dword376
        movss   sse131,sse179
        divss   sse131,sse184
        movss   dword ptr [dword266],sse131
        mov     dword270,dword376
        movss   sse132,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword270+4],sse132
        mov     dword273,dword376
        movss   sse133,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword273+8],sse133
        mov     dword276,dword376
        movss   sse134,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword276+12],sse134
        mov     dword279,dword376
        movss   sse135,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword279+16],sse135
        mov     dword282,dword376
        movss   sse136,sse179
        divss   sse136,sse183
        movss   dword ptr [dword282+20],sse136
        mov     dword286,dword376
        movss   sse137,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword286+24],sse137
        mov     dword289,dword376
        movss   sse138,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword289+28],sse138
        mov     dword292,dword376
        movss   sse139,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword292+32],sse139
        mov     dword295,dword376
        movss   sse140,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword295+36],sse140
        mov     dword298,dword376
        movss   sse141,sse180
        subss   sse141,sse179
        movss   sse142,sse180
        divss   sse142,sse141
        movss   dword ptr [dword298+40],sse142
        mov     dword303,dword376
        movss   sse143,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword303+44],sse143
        mov     dword306,dword376
        movss   sse144,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword306+48],sse144
        mov     dword309,dword376
        movss   sse145,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword309+52],sse145
        mov     dword312,dword376
        movss   sse146,sse179
        mulss   sse146,sse180
        movss   sse147,sse179
        subss   sse147,sse180
        divss   sse146,sse147
        movss   dword ptr [dword312+56],sse146
        mov     dword318,dword376
        movss   sse148,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword318+60],sse148
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   sse188,sse190
        movss   sse187,sse189
        cvtsi2ss        sse3,dword380
        movss   sse186,sse3
        cvtsi2ss        sse4,dword379
        movss   sse185,sse4
        mov     dword377,(offset __viewport_matrix)
        mov     dword322,dword377
        movss   sse153,sse185
        divss   sse153,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword322],sse153
        mov     dword326,dword377
        movss   sse154,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword326+4],sse154
        mov     dword329,dword377
        movss   sse155,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword329+8],sse155
        mov     dword332,dword377
        movss   sse156,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword332+12],sse156
        mov     dword335,dword377
        movss   sse157,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword335+16],sse157
        mov     dword338,dword377
        movss   sse158,sse186
        xorps   sse158,dword ptr [___unnamed_float_4]
        divss   sse158,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword338+20],sse158
        mov     dword342,dword377
        movss   sse160,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword342+24],sse160
        mov     dword345,dword377
        movss   sse161,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword345+28],sse161
        mov     dword348,dword377
        movss   sse162,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword348+32],sse162
        mov     dword351,dword377
        movss   sse163,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword351+36],sse163
        mov     dword354,dword377
        movss   sse164,sse188
        subss   sse164,sse187
        movss   dword ptr [dword354+40],sse164
        mov     dword358,dword377
        movss   sse165,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword358+44],sse165
        mov     dword361,dword377
        movss   sse167,sse185
        divss   sse167,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword361+48],sse167
        mov     dword365,dword377
        movss   sse169,sse186
        divss   sse169,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword365+52],sse169
        mov     dword369,dword377
        movss   sse170,sse187
        movss   dword ptr [dword369+56],sse170
        mov     dword372,dword377
        movss   sse171,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword372+60],sse171
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,sse189
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_z_near_base)
        mov     dword104,dword375
        movss   sse63,sse175
        movss   dword ptr [dword104],sse63
        mov     dword107,dword375
        movss   sse64,sse176
        movss   dword ptr [dword107+4],sse64
        mov     dword110,dword375
        movss   sse65,sse177
        movss   dword ptr [dword110+8],sse65
        mov     dword113,dword375
        movss   sse66,sse178
        movss   dword ptr [dword113+12],sse66
; end of inline function vec4f_assign
        movss   sse8,sse190
        comiss  sse8,sse189
        jbe     label0000
        movss   sse173,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   sse173,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,sse173
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_z_near_norm)
        mov     dword117,dword375
        movss   sse69,sse175
        movss   dword ptr [dword117],sse69
        mov     dword120,dword375
        movss   sse70,sse176
        movss   dword ptr [dword120+4],sse70
        mov     dword123,dword375
        movss   sse71,sse177
        movss   dword ptr [dword123+8],sse71
        mov     dword126,dword375
        movss   sse72,sse178
        movss   dword ptr [dword126+12],sse72
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,sse190
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_z_far_base)
        mov     dword130,dword375
        movss   sse75,sse175
        movss   dword ptr [dword130],sse75
        mov     dword133,dword375
        movss   sse76,sse176
        movss   dword ptr [dword133+4],sse76
        mov     dword136,dword375
        movss   sse77,sse177
        movss   dword ptr [dword136+8],sse77
        mov     dword139,dword375
        movss   sse78,sse178
        movss   dword ptr [dword139+12],sse78
; end of inline function vec4f_assign
        movss   sse17,sse190
        comiss  sse17,sse189
        jbe     label0002
        movss   sse174,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   sse174,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,sse174
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_z_far_norm)
        mov     dword143,dword375
        movss   sse81,sse175
        movss   dword ptr [dword143],sse81
        mov     dword146,dword375
        movss   sse82,sse176
        movss   dword ptr [dword146+4],sse82
        mov     dword149,dword375
        movss   sse83,sse177
        movss   dword ptr [dword149+8],sse83
        mov     dword152,dword375
        movss   sse84,sse178
        movss   dword ptr [dword152+12],sse84
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_2]
        cvtsi2ss        sse26,dword379
        movss   sse27,dword ptr [___unnamed_float_1]
        divss   sse27,sse26
        movss   sse28,dword ptr [___unnamed_float_5]
        addss   sse28,sse27
        movss   sse175,sse28
        mov     dword375,(offset __clip_plane_left_base)
        mov     dword156,dword375
        movss   sse86,sse175
        movss   dword ptr [dword156],sse86
        mov     dword159,dword375
        movss   sse87,sse176
        movss   dword ptr [dword159+4],sse87
        mov     dword162,dword375
        movss   sse88,sse177
        movss   dword ptr [dword162+8],sse88
        mov     dword165,dword375
        movss   sse89,sse178
        movss   dword ptr [dword165+12],sse89
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_1]
        mov     dword375,(offset __clip_plane_left_norm)
        mov     dword169,dword375
        movss   sse91,sse175
        movss   dword ptr [dword169],sse91
        mov     dword172,dword375
        movss   sse92,sse176
        movss   dword ptr [dword172+4],sse92
        mov     dword175,dword375
        movss   sse93,sse177
        movss   dword ptr [dword175+8],sse93
        mov     dword178,dword375
        movss   sse94,sse178
        movss   dword ptr [dword178+12],sse94
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_2]
        cvtsi2ss        sse36,dword379
        movss   sse37,dword ptr [___unnamed_float_1]
        divss   sse37,sse36
        movss   sse38,dword ptr [___unnamed_float_1]
        subss   sse38,sse37
        movss   sse175,sse38
        mov     dword375,(offset __clip_plane_right_base)
        mov     dword182,dword375
        movss   sse96,sse175
        movss   dword ptr [dword182],sse96
        mov     dword185,dword375
        movss   sse97,sse176
        movss   dword ptr [dword185+4],sse97
        mov     dword188,dword375
        movss   sse98,sse177
        movss   dword ptr [dword188+8],sse98
        mov     dword191,dword375
        movss   sse99,sse178
        movss   dword ptr [dword191+12],sse99
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_5]
        mov     dword375,(offset __clip_plane_right_norm)
        mov     dword195,dword375
        movss   sse101,sse175
        movss   dword ptr [dword195],sse101
        mov     dword198,dword375
        movss   sse102,sse176
        movss   dword ptr [dword198+4],sse102
        mov     dword201,dword375
        movss   sse103,sse177
        movss   dword ptr [dword201+8],sse103
        mov     dword204,dword375
        movss   sse104,sse178
        movss   dword ptr [dword204+12],sse104
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        cvtsi2ss        sse45,dword380
        movss   sse46,dword ptr [___unnamed_float_1]
        divss   sse46,sse45
        movss   sse47,dword ptr [___unnamed_float_5]
        addss   sse47,sse46
        movss   sse176,sse47
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_plane_top_base)
        mov     dword208,dword375
        movss   sse106,sse175
        movss   dword ptr [dword208],sse106
        mov     dword211,dword375
        movss   sse107,sse176
        movss   dword ptr [dword211+4],sse107
        mov     dword214,dword375
        movss   sse108,sse177
        movss   dword ptr [dword214+8],sse108
        mov     dword217,dword375
        movss   sse109,sse178
        movss   dword ptr [dword217+12],sse109
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_1]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_plane_top_norm)
        mov     dword221,dword375
        movss   sse111,sse175
        movss   dword ptr [dword221],sse111
        mov     dword224,dword375
        movss   sse112,sse176
        movss   dword ptr [dword224+4],sse112
        mov     dword227,dword375
        movss   sse113,sse177
        movss   dword ptr [dword227+8],sse113
        mov     dword230,dword375
        movss   sse114,sse178
        movss   dword ptr [dword230+12],sse114
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_1]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_plane_bottom_base)
        mov     dword234,dword375
        movss   sse116,sse175
        movss   dword ptr [dword234],sse116
        mov     dword237,dword375
        movss   sse117,sse176
        movss   dword ptr [dword237+4],sse117
        mov     dword240,dword375
        movss   sse118,sse177
        movss   dword ptr [dword240+8],sse118
        mov     dword243,dword375
        movss   sse119,sse178
        movss   dword ptr [dword243+12],sse119
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_5]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_plane_bottom_norm)
        mov     dword247,dword375
        movss   sse121,sse175
        movss   dword ptr [dword247],sse121
        mov     dword250,dword375
        movss   sse122,sse176
        movss   dword ptr [dword250+4],sse122
        mov     dword253,dword375
        movss   sse123,sse177
        movss   dword ptr [dword253+8],sse123
        mov     dword256,dword375
        movss   sse124,sse178
        movss   dword ptr [dword256+12],sse124
; end of inline function vec4f_assign
        destroy_stack_frame
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        create_stack_frame
        mov     dword5,[ebp+8]
        mov     dword3,dword5
        mov     dword ptr [__videomem],dword3
        destroy_stack_frame
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        create_stack_frame
        mov     dword8,[ebp+8]
        mov     dword2,dword8
        mov     dword4,(offset __mvproj_matrix)
        mov     dword5,dword2
        mov     dword6,16
        rep     movsd   dword4,dword5
        destroy_stack_frame
        ret
_rasterizer_set_mvproj endp

_rasterizer_set_color proc
        create_stack_frame
        mov     dword5,[ebp+8]
        mov     dword3,dword5
        mov     dword ptr [__color],dword3
        destroy_stack_frame
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        create_stack_frame
        mov     dword13,[ebp+16]
        mov     dword12,[ebp+12]
        mov     dword11,[ebp+8]
        mov     dword3,dword11
        mov     dword ptr [__texture_data],dword3
        mov     dword6,dword12
        mov     dword ptr [__texture_width],dword6
        mov     dword9,dword13
        mov     dword ptr [__texture_height],dword9
        destroy_stack_frame
        ret
_rasterizer_set_texture endp

__rasterize_horiz_line proc
        create_stack_frame
        movss   sse23,dword ptr [ebp+32]
        movss   sse22,dword ptr [ebp+28]
        movss   sse21,dword ptr [ebp+24]
        movss   sse20,dword ptr [ebp+20]
        mov     dword118,[ebp+16]
        mov     dword117,[ebp+12]
        mov     dword116,[ebp+8]
        mov     dword3,dword ptr [__pitch]
        imul    dword3,dword118
        add     dword3,dword ptr [__videomem]
        mov     dword7,dword116
        sal     dword7,2
        add     dword3,dword7
        mov     dword103,dword3
        mov     dword11,dword117
        sal     dword11,2
        add     dword11,dword103
        mov     dword15,dword116
        sal     dword15,2
        sub     dword11,dword15
        mov     dword104,dword11
label0000:
; start of inline function _tex2d
        movss   sse19,sse21
        movss   sse18,sse20
        mov     dword85,dword ptr [__texture_width]
        dec     dword85
        cvtsi2ss        sse14,dword85
        mulss   sse14,sse18
        cvttss2si       dword87,sse14
        mov     dword113,dword87
        mov     dword91,dword ptr [__texture_height]
        dec     dword91
        cvtsi2ss        sse15,dword91
        mulss   sse15,sse19
        cvttss2si       dword93,sse15
        mov     dword114,dword93
        mov     dword97,dword114
        imul    dword97,dword ptr [__texture_width]
        add     dword97,dword113
        sal     dword97,2
        add     dword97,dword ptr [__texture_data]
        mov     dword101,[dword97]
        mov     dword115,dword101
; end of inline function _tex2d
        mov     dword19,dword115
        mov     dword105,dword19
        mov     dword23,dword105
        sar     dword23,24
        and     dword23,255
        mov     dword112,dword23
        cmp     dword112,0
        je      label0003
        cvtsi2ss        sse1,dword112
        divss   sse1,dword ptr [___unnamed_float_6]
        movss   sse17,sse1
        mov     dword31,dword103
        mov     dword33,[dword31]
        mov     dword109,dword33
        mov     dword36,dword109
        and     dword36,65280
        sar     dword36,8
        mov     dword110,dword36
        mov     dword41,dword109
        and     dword41,255
        mov     dword111,dword41
        mov     dword45,dword105
        and     dword45,65280
        sar     dword45,8
        mov     dword107,dword45
        mov     dword50,dword105
        and     dword50,255
        mov     dword108,dword50
        cvtsi2ss        sse3,dword107
        mulss   sse3,sse17
        cvtsi2ss        sse4,dword110
        movss   sse5,dword ptr [___unnamed_float_1]
        subss   sse5,sse17
        mulss   sse4,sse5
        addss   sse3,sse4
        cvttss2si       dword57,sse3
        mov     dword107,dword57
        cvtsi2ss        sse6,dword108
        mulss   sse6,sse17
        cvtsi2ss        sse7,dword111
        movss   sse8,dword ptr [___unnamed_float_1]
        subss   sse8,sse17
        mulss   sse7,sse8
        addss   sse6,sse7
        cvttss2si       dword64,sse6
        mov     dword108,dword64
        mov     dword68,dword107
        sal     dword68,8
        add     dword68,dword108
        mov     dword106,dword68
        mov     dword72,dword103
        mov     dword74,dword106
        mov     [dword72],dword74
label0003:
        movss   sse9,sse20
        addss   sse9,sse22
        movss   sse20,sse9
        movss   sse10,sse21
        addss   sse10,sse23
        movss   sse21,sse10
        add     dword103,4
        mov     dword81,dword103
        cmp     dword81,dword104
        jl      label0000
        destroy_stack_frame
        ret
__rasterize_horiz_line endp

__clip_on_plain proc
        create_stack_frame
        mov     dword378,[ebp+20]
        mov     dword377,[ebp+16]
        mov     dword376,[ebp+12]
        mov     dword375,[ebp+8]
        mov     dword2,dword375
        mov     dword ptr [dword2+192],0
        mov     dword5,dword376
        mov     dword357,dword5
        lea     dword8,[dword376+24]
        mov     dword358,dword8
label0001:
        mov     dword12,dword376
        mov     dword14,[dword12+192]
        imul    dword14,24
        mov     dword16,dword376
        add     dword16,dword14
        cmp     dword16,dword358
        jle     label0002
; start of inline function vec4f_subtract
        mov     dword168,dword377
        mov     dword371,dword168
        mov     dword20,dword357
        mov     dword370,dword20
        lea     dword21,[ebp-24]
        mov     dword369,dword21
        mov     dword171,dword370
        mov     dword173,dword371
        movss   sse26,dword ptr [dword171]
        subss   sse26,dword ptr [dword173]
        mov     dword175,dword369
        movss   dword ptr [dword175],sse26
        mov     dword177,dword370
        mov     dword179,dword371
        movss   sse27,dword ptr [dword177+4]
        subss   sse27,dword ptr [dword179+4]
        mov     dword181,dword369
        movss   dword ptr [dword181+4],sse27
        mov     dword183,dword370
        mov     dword185,dword371
        movss   sse28,dword ptr [dword183+8]
        subss   sse28,dword ptr [dword185+8]
        mov     dword187,dword369
        movss   dword ptr [dword187+8],sse28
        mov     dword189,dword370
        mov     dword191,dword371
        movss   sse29,dword ptr [dword189+12]
        subss   sse29,dword ptr [dword191+12]
        mov     dword193,dword369
        movss   dword ptr [dword193+12],sse29
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword271,dword378
        mov     dword373,dword271
        lea     dword23,[ebp-24]
        mov     dword372,dword23
        mov     dword274,dword372
        mov     dword276,dword373
        movss   sse46,dword ptr [dword274+4]
        mulss   sse46,dword ptr [dword276+4]
        mov     dword278,dword372
        mov     dword280,dword373
        movss   sse47,dword ptr [dword278]
        mulss   sse47,dword ptr [dword280]
        addss   sse47,sse46
        mov     dword282,dword372
        mov     dword284,dword373
        movss   sse48,dword ptr [dword282+8]
        mulss   sse48,dword ptr [dword284+8]
        addss   sse47,sse48
        mov     dword286,dword372
        mov     dword288,dword373
        movss   sse49,dword ptr [dword286+12]
        mulss   sse49,dword ptr [dword288+12]
        addss   sse47,sse49
        movss   sse76,sse47
; end of inline function vec4f_dot
        movss   sse72,sse76
; start of inline function vec4f_subtract
        mov     dword194,dword377
        mov     dword371,dword194
        mov     dword27,dword358
        mov     dword370,dword27
        lea     dword28,[ebp-24]
        mov     dword369,dword28
        mov     dword197,dword370
        mov     dword199,dword371
        movss   sse31,dword ptr [dword197]
        subss   sse31,dword ptr [dword199]
        mov     dword201,dword369
        movss   dword ptr [dword201],sse31
        mov     dword203,dword370
        mov     dword205,dword371
        movss   sse32,dword ptr [dword203+4]
        subss   sse32,dword ptr [dword205+4]
        mov     dword207,dword369
        movss   dword ptr [dword207+4],sse32
        mov     dword209,dword370
        mov     dword211,dword371
        movss   sse33,dword ptr [dword209+8]
        subss   sse33,dword ptr [dword211+8]
        mov     dword213,dword369
        movss   dword ptr [dword213+8],sse33
        mov     dword215,dword370
        mov     dword217,dword371
        movss   sse34,dword ptr [dword215+12]
        subss   sse34,dword ptr [dword217+12]
        mov     dword219,dword369
        movss   dword ptr [dword219+12],sse34
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword289,dword378
        mov     dword373,dword289
        lea     dword30,[ebp-24]
        mov     dword372,dword30
        mov     dword292,dword372
        mov     dword294,dword373
        movss   sse51,dword ptr [dword292+4]
        mulss   sse51,dword ptr [dword294+4]
        mov     dword296,dword372
        mov     dword298,dword373
        movss   sse52,dword ptr [dword296]
        mulss   sse52,dword ptr [dword298]
        addss   sse52,sse51
        mov     dword300,dword372
        mov     dword302,dword373
        movss   sse53,dword ptr [dword300+8]
        mulss   sse53,dword ptr [dword302+8]
        addss   sse52,sse53
        mov     dword304,dword372
        mov     dword306,dword373
        movss   sse54,dword ptr [dword304+12]
        mulss   sse54,dword ptr [dword306+12]
        addss   sse52,sse54
        movss   sse76,sse52
; end of inline function vec4f_dot
        movss   sse73,sse76
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse72
        ja      label0003
        mov     dword35,dword375
        mov     dword36,[dword35+192]
        inc     dword ptr [dword35+192]
        imul    dword36,24
        mov     dword39,dword375
        add     dword39,dword36
        mov     dword41,dword357
        mov     dword42,dword39
        mov     dword43,dword41
        mov     dword44,6
        rep     movsd   dword42,dword43
label0003:
        movss   sse4,dword ptr [___unnamed_float_2]
        comiss  sse4,sse72
        jae     label0006
        movss   sse5,dword ptr [___unnamed_float_2]
        comiss  sse5,sse73
        ja      label0005
label0006:
        movss   sse6,dword ptr [___unnamed_float_2]
        comiss  sse6,sse73
        ja      label0004
        movss   sse7,dword ptr [___unnamed_float_2]
        comiss  sse7,sse72
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        mov     dword54,dword357
        mov     dword371,dword54
        mov     dword220,dword377
        mov     dword370,dword220
        lea     dword56,[ebp-24]
        mov     dword369,dword56
        mov     dword223,dword370
        mov     dword225,dword371
        movss   sse36,dword ptr [dword223]
        subss   sse36,dword ptr [dword225]
        mov     dword227,dword369
        movss   dword ptr [dword227],sse36
        mov     dword229,dword370
        mov     dword231,dword371
        movss   sse37,dword ptr [dword229+4]
        subss   sse37,dword ptr [dword231+4]
        mov     dword233,dword369
        movss   dword ptr [dword233+4],sse37
        mov     dword235,dword370
        mov     dword237,dword371
        movss   sse38,dword ptr [dword235+8]
        subss   sse38,dword ptr [dword237+8]
        mov     dword239,dword369
        movss   dword ptr [dword239+8],sse38
        mov     dword241,dword370
        mov     dword243,dword371
        movss   sse39,dword ptr [dword241+12]
        subss   sse39,dword ptr [dword243+12]
        mov     dword245,dword369
        movss   dword ptr [dword245+12],sse39
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     dword58,dword357
        mov     dword371,dword58
        mov     dword60,dword358
        mov     dword370,dword60
        lea     dword61,[ebp-40]
        mov     dword369,dword61
        mov     dword248,dword370
        mov     dword250,dword371
        movss   sse41,dword ptr [dword248]
        subss   sse41,dword ptr [dword250]
        mov     dword252,dword369
        movss   dword ptr [dword252],sse41
        mov     dword254,dword370
        mov     dword256,dword371
        movss   sse42,dword ptr [dword254+4]
        subss   sse42,dword ptr [dword256+4]
        mov     dword258,dword369
        movss   dword ptr [dword258+4],sse42
        mov     dword260,dword370
        mov     dword262,dword371
        movss   sse43,dword ptr [dword260+8]
        subss   sse43,dword ptr [dword262+8]
        mov     dword264,dword369
        movss   dword ptr [dword264+8],sse43
        mov     dword266,dword370
        mov     dword268,dword371
        movss   sse44,dword ptr [dword266+12]
        subss   sse44,dword ptr [dword268+12]
        mov     dword270,dword369
        movss   dword ptr [dword270+12],sse44
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword307,dword378
        mov     dword373,dword307
        lea     dword63,[ebp-24]
        mov     dword372,dword63
        mov     dword310,dword372
        mov     dword312,dword373
        movss   sse56,dword ptr [dword310+4]
        mulss   sse56,dword ptr [dword312+4]
        mov     dword314,dword372
        mov     dword316,dword373
        movss   sse57,dword ptr [dword314]
        mulss   sse57,dword ptr [dword316]
        addss   sse57,sse56
        mov     dword318,dword372
        mov     dword320,dword373
        movss   sse58,dword ptr [dword318+8]
        mulss   sse58,dword ptr [dword320+8]
        addss   sse57,sse58
        mov     dword322,dword372
        mov     dword324,dword373
        movss   sse59,dword ptr [dword322+12]
        mulss   sse59,dword ptr [dword324+12]
        addss   sse57,sse59
        movss   sse76,sse57
; end of inline function vec4f_dot
        movss   sse8,sse76
; start of inline function vec4f_dot
        mov     dword325,dword378
        mov     dword373,dword325
        lea     dword65,[ebp-40]
        mov     dword372,dword65
        mov     dword328,dword372
        mov     dword330,dword373
        movss   sse61,dword ptr [dword328+4]
        mulss   sse61,dword ptr [dword330+4]
        mov     dword332,dword372
        mov     dword334,dword373
        movss   sse62,dword ptr [dword332]
        mulss   sse62,dword ptr [dword334]
        addss   sse62,sse61
        mov     dword336,dword372
        mov     dword338,dword373
        movss   sse63,dword ptr [dword336+8]
        mulss   sse63,dword ptr [dword338+8]
        addss   sse62,sse63
        mov     dword340,dword372
        mov     dword342,dword373
        movss   sse64,dword ptr [dword340+12]
        mulss   sse64,dword ptr [dword342+12]
        addss   sse62,sse64
        movss   sse76,sse62
; end of inline function vec4f_dot
        divss   sse8,sse76
        movss   sse74,sse8
; start of inline function vec4f_mul
        movss   sse77,sse74
        lea     dword68,[ebp-40]
        mov     dword374,dword68
        mov     dword345,dword374
        movss   sse67,dword ptr [dword345]
        mulss   sse67,sse77
        movss   dword ptr [dword345],sse67
        mov     dword348,dword374
        movss   sse68,dword ptr [dword348+4]
        mulss   sse68,sse77
        movss   dword ptr [dword348+4],sse68
        mov     dword351,dword374
        movss   sse69,dword ptr [dword351+8]
        mulss   sse69,sse77
        movss   dword ptr [dword351+8],sse69
        mov     dword354,dword374
        movss   sse70,dword ptr [dword354+12]
        mulss   sse70,sse77
        movss   dword ptr [dword354+12],sse70
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     dword69,[ebp-40]
        mov     dword368,dword69
        mov     dword71,dword357
        mov     dword367,dword71
        mov     dword73,dword375
        mov     dword75,[dword73+192]
        imul    dword75,24
        mov     dword77,dword375
        add     dword77,dword75
        mov     dword366,dword77
        mov     dword145,dword367
        mov     dword147,dword368
        movss   sse21,dword ptr [dword145]
        addss   sse21,dword ptr [dword147]
        mov     dword149,dword366
        movss   dword ptr [dword149],sse21
        mov     dword151,dword367
        mov     dword153,dword368
        movss   sse22,dword ptr [dword151+4]
        addss   sse22,dword ptr [dword153+4]
        mov     dword155,dword366
        movss   dword ptr [dword155+4],sse22
        mov     dword157,dword367
        mov     dword159,dword368
        movss   sse23,dword ptr [dword157+8]
        addss   sse23,dword ptr [dword159+8]
        mov     dword161,dword366
        movss   dword ptr [dword161+8],sse23
        mov     dword163,dword367
        mov     dword165,dword368
        movss   sse24,dword ptr [dword163+12]
        addss   sse24,dword ptr [dword165+12]
        mov     dword167,dword366
        movss   dword ptr [dword167+12],sse24
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     dword79,16
        add     dword79,dword357
        mov     dword364,dword79
        mov     dword81,16
        add     dword81,dword358
        mov     dword363,dword81
        lea     dword82,[ebp-48]
        mov     dword362,dword82
        mov     dword125,dword363
        mov     dword127,dword364
        movss   sse14,dword ptr [dword125]
        subss   sse14,dword ptr [dword127]
        mov     dword129,dword362
        movss   dword ptr [dword129],sse14
        mov     dword131,dword363
        mov     dword133,dword364
        movss   sse15,dword ptr [dword131+4]
        subss   sse15,dword ptr [dword133+4]
        mov     dword135,dword362
        movss   dword ptr [dword135+4],sse15
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   sse75,sse74
        lea     dword84,[ebp-48]
        mov     dword365,dword84
        mov     dword138,dword365
        movss   sse18,dword ptr [dword138]
        mulss   sse18,sse75
        movss   dword ptr [dword138],sse18
        mov     dword141,dword365
        movss   sse19,dword ptr [dword141+4]
        mulss   sse19,sse75
        movss   dword ptr [dword141+4],sse19
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     dword85,[ebp-48]
        mov     dword361,dword85
        mov     dword87,16
        add     dword87,dword357
        mov     dword360,dword87
        mov     dword89,dword375
        mov     dword91,[dword89+192]
        imul    dword91,24
        mov     dword93,dword375
        add     dword93,dword91
        add     dword93,16
        mov     dword359,dword93
        mov     dword112,dword360
        mov     dword114,dword361
        movss   sse11,dword ptr [dword112]
        addss   sse11,dword ptr [dword114]
        mov     dword116,dword359
        movss   dword ptr [dword116],sse11
        mov     dword118,dword360
        mov     dword120,dword361
        movss   sse12,dword ptr [dword118+4]
        addss   sse12,dword ptr [dword120+4]
        mov     dword122,dword359
        movss   dword ptr [dword122+4],sse12
; end of inline function vec2f_add
        mov     dword96,dword375
        inc     dword ptr [dword96+192]
label0004:
        add     dword357,24
        add     dword358,24
        jmp     label0001
label0002:
        mov     dword100,dword375
        mov     dword101,[dword100+192]
        inc     dword ptr [dword100+192]
        imul    dword101,24
        mov     dword104,dword375
        add     dword104,dword101
        mov     dword106,dword375
        mov     dword107,dword104
        mov     dword108,dword106
        mov     dword109,6
        rep     movsd   dword107,dword108
        destroy_stack_frame
        ret
__clip_on_plain endp

__transform_to_projection_space proc
        create_stack_frame
        mov     dword105,[ebp+12]
        mov     dword104,[ebp+8]
; start of inline function vec4f_assign
        movss   sse31,dword ptr [___unnamed_float_1]
        mov     dword3,dword105
        movss   sse30,dword ptr [dword3+8]
        mov     dword5,dword105
        movss   sse29,dword ptr [dword5+4]
        mov     dword7,dword105
        movss   sse28,dword ptr [dword7]
        lea     dword8,[ebp-16]
        mov     dword100,dword8
        mov     dword14,dword100
        movss   sse6,sse28
        movss   dword ptr [dword14],sse6
        mov     dword17,dword100
        movss   sse7,sse29
        movss   dword ptr [dword17+4],sse7
        mov     dword20,dword100
        movss   sse8,sse30
        movss   dword ptr [dword20+8],sse8
        mov     dword23,dword100
        movss   sse9,sse31
        movss   dword ptr [dword23+12],sse9
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        mov     dword103,(offset __mvproj_matrix)
        lea     dword10,[ebp-16]
        mov     dword102,dword10
        mov     dword25,dword104
        mov     dword101,dword25
        mov     dword28,dword102
        mov     dword30,dword103
        movss   sse11,dword ptr [dword28+4]
        mulss   sse11,dword ptr [dword30+16]
        mov     dword32,dword102
        mov     dword34,dword103
        movss   sse12,dword ptr [dword32]
        mulss   sse12,dword ptr [dword34]
        addss   sse12,sse11
        mov     dword36,dword102
        mov     dword38,dword103
        movss   sse13,dword ptr [dword36+8]
        mulss   sse13,dword ptr [dword38+32]
        addss   sse12,sse13
        mov     dword40,dword102
        mov     dword42,dword103
        movss   sse14,dword ptr [dword40+12]
        mulss   sse14,dword ptr [dword42+48]
        addss   sse12,sse14
        mov     dword44,dword101
        movss   dword ptr [dword44],sse12
        mov     dword46,dword103
        mov     dword48,dword102
        movss   sse15,dword ptr [dword48]
        mulss   sse15,dword ptr [dword46+4]
        mov     dword50,dword102
        mov     dword52,dword103
        movss   sse16,dword ptr [dword50+4]
        mulss   sse16,dword ptr [dword52+20]
        addss   sse15,sse16
        mov     dword54,dword102
        mov     dword56,dword103
        movss   sse17,dword ptr [dword54+8]
        mulss   sse17,dword ptr [dword56+36]
        addss   sse15,sse17
        mov     dword58,dword102
        mov     dword60,dword103
        movss   sse18,dword ptr [dword58+12]
        mulss   sse18,dword ptr [dword60+52]
        addss   sse15,sse18
        mov     dword62,dword101
        movss   dword ptr [dword62+4],sse15
        mov     dword64,dword103
        mov     dword66,dword102
        movss   sse19,dword ptr [dword66]
        mulss   sse19,dword ptr [dword64+8]
        mov     dword68,dword102
        mov     dword70,dword103
        movss   sse20,dword ptr [dword68+4]
        mulss   sse20,dword ptr [dword70+24]
        addss   sse19,sse20
        mov     dword72,dword102
        mov     dword74,dword103
        movss   sse21,dword ptr [dword72+8]
        mulss   sse21,dword ptr [dword74+40]
        addss   sse19,sse21
        mov     dword76,dword102
        mov     dword78,dword103
        movss   sse22,dword ptr [dword76+12]
        mulss   sse22,dword ptr [dword78+56]
        addss   sse19,sse22
        mov     dword80,dword101
        movss   dword ptr [dword80+8],sse19
        mov     dword82,dword103
        mov     dword84,dword102
        movss   sse23,dword ptr [dword84]
        mulss   sse23,dword ptr [dword82+12]
        mov     dword86,dword102
        mov     dword88,dword103
        movss   sse24,dword ptr [dword86+4]
        mulss   sse24,dword ptr [dword88+28]
        addss   sse23,sse24
        mov     dword90,dword102
        mov     dword92,dword103
        movss   sse25,dword ptr [dword90+8]
        mulss   sse25,dword ptr [dword92+44]
        addss   sse23,sse25
        mov     dword94,dword102
        mov     dword96,dword103
        movss   sse26,dword ptr [dword94+12]
        mulss   sse26,dword ptr [dword96+60]
        addss   sse23,sse26
        mov     dword98,dword101
        movss   dword ptr [dword98+12],sse23
; end of inline function matrix4f_transform
        destroy_stack_frame
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        create_stack_frame
        mov     dword896,[ebp+28]
        mov     dword895,[ebp+24]
        mov     dword894,[ebp+20]
        mov     dword893,[ebp+16]
        mov     dword892,[ebp+12]
        mov     dword891,[ebp+8]
        push_all
        push_arg        dword891,4
        lea     dword2,[ebp-196]
        push_arg        dword2,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword3,[ebp-196]
        add     dword3,16
        mov     dword6,dword894
        mov     dword7,[dword6]
        mov     dword8,[dword6+4]
        mov     [dword3],dword7
        mov     [dword3+4],dword8
        push_all
        push_arg        dword892,4
        lea     dword10,[ebp-196]
        add     dword10,24
        push_arg        dword10,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword12,[ebp-196]
        add     dword12,24
        add     dword12,16
        mov     dword16,dword895
        mov     dword17,[dword16]
        mov     dword18,[dword16+4]
        mov     [dword12],dword17
        mov     [dword12+4],dword18
        push_all
        push_arg        dword893,4
        lea     dword20,[ebp-196]
        add     dword20,48
        push_arg        dword20,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword22,[ebp-196]
        add     dword22,48
        add     dword22,16
        mov     dword26,dword896
        mov     dword27,[dword26]
        mov     dword28,[dword26+4]
        mov     [dword22],dword27
        mov     [dword22+4],dword28
        lea     dword29,[ebp-196]
        add     dword29,72
        lea     dword31,[ebp-196]
        mov     dword32,dword29
        mov     dword33,dword31
        mov     dword34,6
        rep     movsd   dword32,dword33
        lea     dword35,[ebp-196]
        add     dword35,192
        mov     dword ptr [dword35],4
; start of inline function _rasterize_polygon_4f
        lea     dword38,[ebp-196]
        mov     dword865,dword38
; start of inline function _clip_poligon
        mov     dword725,dword865
        mov     dword884,dword725
        push_all
        lea     dword727,dword ptr [__clip_z_far_norm]
        push_arg        dword727,4
        lea     dword728,dword ptr [__clip_z_far_base]
        push_arg        dword728,4
        push_arg        dword884,4
        lea     dword730,[ebp-660]
        push_arg        dword730,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword731,dword ptr [__clip_z_near_norm]
        push_arg        dword731,4
        lea     dword732,dword ptr [__clip_z_near_base]
        push_arg        dword732,4
        lea     dword733,[ebp-660]
        push_arg        dword733,4
        push_arg        dword884,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword735,dword ptr [__clip_plane_left_norm]
        push_arg        dword735,4
        lea     dword736,dword ptr [__clip_plane_left_base]
        push_arg        dword736,4
        push_arg        dword884,4
        lea     dword738,[ebp-660]
        push_arg        dword738,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword739,dword ptr [__clip_plane_right_norm]
        push_arg        dword739,4
        lea     dword740,dword ptr [__clip_plane_right_base]
        push_arg        dword740,4
        lea     dword741,[ebp-660]
        push_arg        dword741,4
        push_arg        dword884,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword743,dword ptr [__clip_plane_top_norm]
        push_arg        dword743,4
        lea     dword744,dword ptr [__clip_plane_top_base]
        push_arg        dword744,4
        push_arg        dword884,4
        lea     dword746,[ebp-660]
        push_arg        dword746,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword747,dword ptr [__clip_plane_bottom_norm]
        push_arg        dword747,4
        lea     dword748,dword ptr [__clip_plane_bottom_base]
        push_arg        dword748,4
        lea     dword749,[ebp-660]
        push_arg        dword749,4
        push_arg        dword884,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        mov     dword752,dword884
        cmp     dword ptr [dword752+192],1
        setg    byte8
        movzx   dword754,byte8
        mov     dword885,dword754
; end of inline function _clip_poligon
        mov     dword41,dword885
        cmp     dword41,0
        jne     label0000
        jmp     label002d
label0000:
        mov     dword43,dword865
        cmp     dword ptr [dword43+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword866,0
label0003:
        mov     dword50,dword865
        mov     dword52,[dword50+192]
        cmp     dword52,dword866
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword54,dword865
        mov     dword57,dword866
        imul    dword57,24
        add     dword54,dword57
        mov     dword887,dword54
        lea     dword58,[ebp-332]
        mov     dword61,dword866
        sal     dword61,4
        add     dword58,dword61
        mov     dword886,dword58
; start of inline function matrix4f_transform
        mov     dword890,(offset __viewport_matrix)
        mov     dword790,dword887
        mov     dword889,dword790
        lea     dword758,[ebp-688]
        mov     dword888,dword758
        mov     dword793,dword889
        mov     dword795,dword890
        movss   sse81,dword ptr [dword793+4]
        mulss   sse81,dword ptr [dword795+16]
        mov     dword797,dword889
        mov     dword799,dword890
        movss   sse82,dword ptr [dword797]
        mulss   sse82,dword ptr [dword799]
        addss   sse82,sse81
        mov     dword801,dword889
        mov     dword803,dword890
        movss   sse83,dword ptr [dword801+8]
        mulss   sse83,dword ptr [dword803+32]
        addss   sse82,sse83
        mov     dword805,dword889
        mov     dword807,dword890
        movss   sse84,dword ptr [dword805+12]
        mulss   sse84,dword ptr [dword807+48]
        addss   sse82,sse84
        mov     dword809,dword888
        movss   dword ptr [dword809],sse82
        mov     dword811,dword890
        mov     dword813,dword889
        movss   sse85,dword ptr [dword813]
        mulss   sse85,dword ptr [dword811+4]
        mov     dword815,dword889
        mov     dword817,dword890
        movss   sse86,dword ptr [dword815+4]
        mulss   sse86,dword ptr [dword817+20]
        addss   sse85,sse86
        mov     dword819,dword889
        mov     dword821,dword890
        movss   sse87,dword ptr [dword819+8]
        mulss   sse87,dword ptr [dword821+36]
        addss   sse85,sse87
        mov     dword823,dword889
        mov     dword825,dword890
        movss   sse88,dword ptr [dword823+12]
        mulss   sse88,dword ptr [dword825+52]
        addss   sse85,sse88
        mov     dword827,dword888
        movss   dword ptr [dword827+4],sse85
        mov     dword829,dword890
        mov     dword831,dword889
        movss   sse89,dword ptr [dword831]
        mulss   sse89,dword ptr [dword829+8]
        mov     dword833,dword889
        mov     dword835,dword890
        movss   sse90,dword ptr [dword833+4]
        mulss   sse90,dword ptr [dword835+24]
        addss   sse89,sse90
        mov     dword837,dword889
        mov     dword839,dword890
        movss   sse91,dword ptr [dword837+8]
        mulss   sse91,dword ptr [dword839+40]
        addss   sse89,sse91
        mov     dword841,dword889
        mov     dword843,dword890
        movss   sse92,dword ptr [dword841+12]
        mulss   sse92,dword ptr [dword843+56]
        addss   sse89,sse92
        mov     dword845,dword888
        movss   dword ptr [dword845+8],sse89
        mov     dword847,dword890
        mov     dword849,dword889
        movss   sse93,dword ptr [dword849]
        mulss   sse93,dword ptr [dword847+12]
        mov     dword851,dword889
        mov     dword853,dword890
        movss   sse94,dword ptr [dword851+4]
        mulss   sse94,dword ptr [dword853+28]
        addss   sse93,sse94
        mov     dword855,dword889
        mov     dword857,dword890
        movss   sse95,dword ptr [dword855+8]
        mulss   sse95,dword ptr [dword857+44]
        addss   sse93,sse95
        mov     dword859,dword889
        mov     dword861,dword890
        movss   sse96,dword ptr [dword859+12]
        mulss   sse96,dword ptr [dword861+60]
        addss   sse93,sse96
        mov     dword863,dword888
        movss   dword ptr [dword863+12],sse93
; end of inline function matrix4f_transform
        lea     dword759,[ebp-688]
        add     dword759,12
        movss   sse77,dword ptr [___unnamed_float_1]
        divss   sse77,dword ptr [dword759]
        movss   sse112,sse77
        movss   sse78,dword ptr [ebp-688]
        mulss   sse78,sse112
        cvttss2si       dword765,sse78
        mov     dword767,dword886
        mov     [dword767],dword765
        lea     dword768,[ebp-688]
        add     dword768,4
        movss   sse79,dword ptr [dword768]
        mulss   sse79,sse112
        cvttss2si       dword771,sse79
        mov     dword773,dword886
        mov     [dword773+4],dword771
        mov     dword775,dword886
        cmp     dword ptr [dword775],0
        jl      label002a
        mov     dword778,dword886
        mov     dword780,[dword778]
        cmp     dword780,dword ptr [__width]
        jge     label002a
        mov     dword782,dword886
        cmp     dword ptr [dword782+4],0
        jl      label002a
        mov     dword785,dword886
        mov     dword787,[dword785+4]
        cmp     dword787,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     dword62,[ebp-332]
        mov     dword65,dword866
        sal     dword65,4
        add     dword62,dword65
        add     dword62,8
        mov     dword68,dword865
        mov     dword71,dword866
        imul    dword71,24
        add     dword68,dword71
        add     dword68,16
        mov     dword73,[dword68]
        mov     dword74,[dword68+4]
        mov     [dword62],dword73
        mov     [dword62+4],dword74
        inc     dword866
        jmp     label0003
label0004:
        mov     dword866,2
label0006:
        mov     dword79,dword865
        mov     dword81,[dword79+192]
        dec     dword81
        cmp     dword81,dword866
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     dword83,[ebp-332]
        mov     dword86,dword866
        sal     dword86,4
        add     dword83,dword86
        mov     dword869,dword83
        mov     dword89,dword866
        dec     dword89
        sal     dword89,4
        lea     dword91,[ebp-332]
        add     dword91,dword89
        mov     dword868,dword91
        lea     dword92,[ebp-332]
        mov     dword867,dword92
        lea     dword96,[dword867+4]
        lea     dword99,[dword868+4]
        mov     dword101,[dword96]
        cmp     dword101,[dword99]
        jle     label0008
        mov     dword104,dword867
        mov     dword870,dword104
        mov     dword107,dword868
        mov     dword867,dword107
        mov     dword110,dword870
        mov     dword868,dword110
label0008:
        lea     dword112,[dword867+4]
        lea     dword115,[dword869+4]
        mov     dword117,[dword112]
        cmp     dword117,[dword115]
        jle     label0009
        mov     dword120,dword867
        mov     dword870,dword120
        mov     dword123,dword869
        mov     dword867,dword123
        mov     dword126,dword870
        mov     dword869,dword126
label0009:
        lea     dword128,[dword868+4]
        lea     dword131,[dword869+4]
        mov     dword133,[dword128]
        cmp     dword133,[dword131]
        jle     label000a
        mov     dword136,dword868
        mov     dword870,dword136
        mov     dword139,dword869
        mov     dword868,dword139
        mov     dword142,dword870
        mov     dword869,dword142
label000a:
        lea     dword144,[dword867+4]
        lea     dword147,[dword869+4]
        mov     dword149,[dword144]
        cmp     dword149,[dword147]
        jne     label000b
        lea     dword151,[dword867+4]
        cmp     dword ptr [dword151],0
        jl      label000c
        lea     dword155,[dword867+4]
        mov     dword158,[dword155]
        cmp     dword158,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   sse111,dword ptr [___unnamed_float_2]
        movss   sse110,dword ptr [___unnamed_float_2]
        mov     dword162,8
        add     dword162,dword869
        mov     dword883,dword162
        mov     dword164,8
        add     dword164,dword868
        mov     dword882,dword164
        mov     dword166,8
        add     dword166,dword867
        mov     dword881,dword166
        lea     dword168,[dword867+4]
        mov     dword654,[dword168]
        mov     dword880,dword654
        mov     dword171,dword869
        mov     dword653,[dword171]
        mov     dword879,dword653
        mov     dword173,dword868
        mov     dword652,[dword173]
        mov     dword878,dword652
        mov     dword175,dword867
        mov     dword651,[dword175]
        mov     dword877,dword651
        mov     dword658,dword877
        cmp     dword658,dword878
        jge     label001c
        mov     dword661,dword879
        cmp     dword661,dword878
        jle     label001d
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        mov     dword665,dword881
        push_arg        dword ptr [dword665+4],4
        mov     dword667,dword881
        push_arg        dword ptr [dword667],4
        push_arg        dword880,4
        push_arg        dword879,4
        push_arg        dword877,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        mov     dword673,dword879
        cmp     dword673,dword877
        jge     label001f
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        mov     dword677,dword883
        push_arg        dword ptr [dword677+4],4
        mov     dword679,dword883
        push_arg        dword ptr [dword679],4
        push_arg        dword880,4
        push_arg        dword878,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        mov     dword686,dword881
        push_arg        dword ptr [dword686+4],4
        mov     dword688,dword881
        push_arg        dword ptr [dword688],4
        push_arg        dword880,4
        push_arg        dword878,4
        push_arg        dword877,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0020:
label001e:
        jmp     label0021
label001c:
        mov     dword694,dword879
        cmp     dword694,dword878
        jge     label0022
        push_all
        movss   sse69,sse111
        xorps   sse69,dword ptr [___unnamed_float_4]
        push_arg        sse69,4
        movss   sse70,sse110
        xorps   sse70,dword ptr [___unnamed_float_4]
        push_arg        sse70,4
        mov     dword698,dword883
        push_arg        dword ptr [dword698+4],4
        mov     dword700,dword883
        push_arg        dword ptr [dword700],4
        push_arg        dword880,4
        push_arg        dword877,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        mov     dword706,dword879
        cmp     dword706,dword877
        jle     label0024
        push_all
        movss   sse71,sse111
        xorps   sse71,dword ptr [___unnamed_float_4]
        push_arg        sse71,4
        movss   sse72,sse110
        xorps   sse72,dword ptr [___unnamed_float_4]
        push_arg        sse72,4
        mov     dword710,dword882
        push_arg        dword ptr [dword710+4],4
        mov     dword712,dword882
        push_arg        dword ptr [dword712],4
        push_arg        dword880,4
        push_arg        dword879,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0025
label0024:
        push_all
        movss   sse73,sse111
        xorps   sse73,dword ptr [___unnamed_float_4]
        push_arg        sse73,4
        movss   sse74,sse110
        xorps   sse74,dword ptr [___unnamed_float_4]
        push_arg        sse74,4
        mov     dword719,dword882
        push_arg        dword ptr [dword719+4],4
        mov     dword721,dword882
        push_arg        dword ptr [dword721],4
        push_arg        dword880,4
        push_arg        dword877,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
label000c:
        jmp     label0027
label000b:
        lea     dword177,[dword867+4]
        mov     dword180,[dword177]
        mov     dword873,dword180
label000e:
        lea     dword182,[dword868+4]
        mov     dword185,[dword182]
        cmp     dword185,dword873
        jle     label000f
        lea     dword187,[dword867+4]
        mov     dword190,dword873
        sub     dword190,[dword187]
        mov     dword192,dword868
        mov     dword194,dword867
        mov     dword195,[dword192]
        sub     dword195,[dword194]
        imul    dword190,dword195
        lea     dword197,[dword868+4]
        lea     dword200,[dword867+4]
        mov     dword202,[dword197]
        sub     dword202,[dword200]
        cdq     dword203,dword190
        idiv    dword190,dword202
        mov     dword205,dword867
        add     dword190,[dword205]
        mov     dword871,dword190
        lea     dword208,[dword867+4]
        mov     dword211,dword873
        sub     dword211,[dword208]
        mov     dword213,dword869
        mov     dword215,dword867
        mov     dword216,[dword213]
        sub     dword216,[dword215]
        imul    dword211,dword216
        lea     dword218,[dword869+4]
        lea     dword221,[dword867+4]
        mov     dword223,[dword218]
        sub     dword223,[dword221]
        cdq     dword224,dword211
        idiv    dword211,dword223
        mov     dword226,dword867
        add     dword211,[dword226]
        mov     dword872,dword211
        lea     dword229,[dword867+4]
        mov     dword232,dword873
        sub     dword232,[dword229]
        cvtsi2ss        sse5,dword232
        mov     dword234,dword868
        mov     dword236,dword867
        movss   sse6,dword ptr [dword234+8]
        subss   sse6,dword ptr [dword236+8]
        mulss   sse5,sse6
        lea     dword238,[dword868+4]
        lea     dword241,[dword867+4]
        mov     dword243,[dword238]
        sub     dword243,[dword241]
        cvtsi2ss        sse7,dword243
        divss   sse5,sse7
        mov     dword245,dword867
        addss   sse5,dword ptr [dword245+8]
        movss   sse98,sse5
        lea     dword248,[dword867+4]
        mov     dword251,dword873
        sub     dword251,[dword248]
        cvtsi2ss        sse8,dword251
        mov     dword253,dword869
        mov     dword255,dword867
        movss   sse9,dword ptr [dword253+8]
        subss   sse9,dword ptr [dword255+8]
        mulss   sse8,sse9
        lea     dword257,[dword869+4]
        lea     dword260,[dword867+4]
        mov     dword262,[dword257]
        sub     dword262,[dword260]
        cvtsi2ss        sse10,dword262
        divss   sse8,sse10
        mov     dword264,dword867
        addss   sse8,dword ptr [dword264+8]
        movss   sse100,sse8
        lea     dword267,[dword867+4]
        mov     dword270,dword873
        sub     dword270,[dword267]
        cvtsi2ss        sse11,dword270
        mov     dword272,8
        add     dword272,dword868
        add     dword272,4
        mov     dword275,8
        add     dword275,dword867
        add     dword275,4
        movss   sse12,dword ptr [dword272]
        subss   sse12,dword ptr [dword275]
        mulss   sse11,sse12
        lea     dword278,[dword868+4]
        lea     dword281,[dword867+4]
        mov     dword283,[dword278]
        sub     dword283,[dword281]
        cvtsi2ss        sse13,dword283
        divss   sse11,sse13
        mov     dword285,8
        add     dword285,dword867
        add     dword285,4
        addss   sse11,dword ptr [dword285]
        movss   sse99,sse11
        lea     dword289,[dword867+4]
        mov     dword292,dword873
        sub     dword292,[dword289]
        cvtsi2ss        sse14,dword292
        mov     dword294,8
        add     dword294,dword869
        add     dword294,4
        mov     dword297,8
        add     dword297,dword867
        add     dword297,4
        movss   sse15,dword ptr [dword294]
        subss   sse15,dword ptr [dword297]
        mulss   sse14,sse15
        lea     dword300,[dword869+4]
        lea     dword303,[dword867+4]
        mov     dword305,[dword300]
        sub     dword305,[dword303]
        cvtsi2ss        sse16,dword305
        divss   sse14,sse16
        mov     dword307,8
        add     dword307,dword867
        add     dword307,4
        addss   sse14,dword ptr [dword307]
        movss   sse101,sse14
        mov     dword312,dword872
        sub     dword312,dword871
        cvtsi2ss        sse17,dword312
        movss   sse18,sse100
        subss   sse18,sse98
        divss   sse18,sse17
        movss   sse102,sse18
        mov     dword318,dword872
        sub     dword318,dword871
        cvtsi2ss        sse19,dword318
        movss   sse20,sse101
        subss   sse20,sse99
        divss   sse20,sse19
        movss   sse103,sse20
; start of inline function _rasterize_horiz_line__unordered
        movss   sse109,sse103
        movss   sse108,sse102
        movss   sse107,sse101
        movss   sse106,sse100
        movss   sse105,sse99
        movss   sse104,sse98
        mov     dword590,dword873
        mov     dword876,dword590
        mov     dword589,dword872
        mov     dword875,dword589
        mov     dword588,dword871
        mov     dword874,dword588
        mov     dword594,dword874
        cmp     dword594,dword875
        jg      label0013
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse105,4
        push_arg        sse104,4
        push_arg        dword876,4
        push_arg        dword875,4
        push_arg        dword874,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0014
label0013:
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse107,4
        push_arg        sse106,4
        push_arg        dword876,4
        push_arg        dword874,4
        push_arg        dword875,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword873
        jmp     label000e
label000f:
        lea     dword333,[dword868+4]
        lea     dword336,[dword867+4]
        mov     dword338,[dword333]
        sub     dword338,[dword336]
        mov     dword340,dword869
        mov     dword342,dword867
        mov     dword343,[dword340]
        sub     dword343,[dword342]
        imul    dword338,dword343
        lea     dword345,[dword869+4]
        lea     dword348,[dword867+4]
        mov     dword350,[dword345]
        sub     dword350,[dword348]
        cdq     dword351,dword338
        idiv    dword338,dword350
        mov     dword353,dword867
        add     dword338,[dword353]
        mov     dword872,dword338
        lea     dword356,[dword868+4]
        lea     dword359,[dword867+4]
        mov     dword361,[dword356]
        sub     dword361,[dword359]
        cvtsi2ss        sse21,dword361
        mov     dword363,dword869
        mov     dword365,dword867
        movss   sse22,dword ptr [dword363+8]
        subss   sse22,dword ptr [dword365+8]
        mulss   sse21,sse22
        lea     dword367,[dword869+4]
        lea     dword370,[dword867+4]
        mov     dword372,[dword367]
        sub     dword372,[dword370]
        cvtsi2ss        sse23,dword372
        divss   sse21,sse23
        mov     dword374,dword867
        addss   sse21,dword ptr [dword374+8]
        movss   sse100,sse21
        lea     dword377,[dword868+4]
        lea     dword380,[dword867+4]
        mov     dword382,[dword377]
        sub     dword382,[dword380]
        cvtsi2ss        sse24,dword382
        mov     dword384,8
        add     dword384,dword869
        add     dword384,4
        mov     dword387,8
        add     dword387,dword867
        add     dword387,4
        movss   sse25,dword ptr [dword384]
        subss   sse25,dword ptr [dword387]
        mulss   sse24,sse25
        lea     dword390,[dword869+4]
        lea     dword393,[dword867+4]
        mov     dword395,[dword390]
        sub     dword395,[dword393]
        cvtsi2ss        sse26,dword395
        divss   sse24,sse26
        mov     dword397,8
        add     dword397,dword867
        add     dword397,4
        addss   sse24,dword ptr [dword397]
        movss   sse101,sse24
        mov     dword401,dword868
        movss   sse27,sse100
        subss   sse27,dword ptr [dword401+8]
        mov     dword404,dword868
        mov     dword406,dword872
        sub     dword406,[dword404]
        cvtsi2ss        sse28,dword406
        divss   sse27,sse28
        movss   sse102,sse27
        mov     dword409,8
        add     dword409,dword868
        add     dword409,4
        movss   sse29,sse101
        subss   sse29,dword ptr [dword409]
        mov     dword413,dword868
        mov     dword415,dword872
        sub     dword415,[dword413]
        cvtsi2ss        sse30,dword415
        divss   sse29,sse30
        movss   sse103,sse29
; start of inline function _rasterize_horiz_line__unordered
        movss   sse109,sse103
        movss   sse108,sse102
        mov     dword420,8
        add     dword420,dword868
        add     dword420,4
        movss   sse107,dword ptr [dword420]
        mov     dword423,dword868
        movss   sse106,dword ptr [dword423+8]
        movss   sse105,sse101
        movss   sse104,sse100
        lea     dword427,[dword868+4]
        mov     dword611,[dword427]
        mov     dword876,dword611
        mov     dword430,dword868
        mov     dword610,[dword430]
        mov     dword875,dword610
        mov     dword609,dword872
        mov     dword874,dword609
        mov     dword615,dword874
        cmp     dword615,dword875
        jg      label0016
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse105,4
        push_arg        sse104,4
        push_arg        dword876,4
        push_arg        dword875,4
        push_arg        dword874,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0017
label0016:
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse107,4
        push_arg        sse106,4
        push_arg        dword876,4
        push_arg        dword874,4
        push_arg        dword875,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        lea     dword433,[dword868+4]
        mov     dword435,1
        add     dword435,[dword433]
        mov     dword873,dword435
label0011:
        lea     dword438,[dword869+4]
        mov     dword441,[dword438]
        cmp     dword441,dword873
        jle     label0012
        lea     dword443,[dword868+4]
        mov     dword446,dword873
        sub     dword446,[dword443]
        mov     dword448,dword869
        mov     dword450,dword868
        mov     dword451,[dword448]
        sub     dword451,[dword450]
        imul    dword446,dword451
        lea     dword453,[dword869+4]
        lea     dword456,[dword868+4]
        mov     dword458,[dword453]
        sub     dword458,[dword456]
        cdq     dword459,dword446
        idiv    dword446,dword458
        mov     dword461,dword868
        add     dword446,[dword461]
        mov     dword871,dword446
        lea     dword464,[dword867+4]
        mov     dword467,dword873
        sub     dword467,[dword464]
        mov     dword469,dword869
        mov     dword471,dword867
        mov     dword472,[dword469]
        sub     dword472,[dword471]
        imul    dword467,dword472
        lea     dword474,[dword869+4]
        lea     dword477,[dword867+4]
        mov     dword479,[dword474]
        sub     dword479,[dword477]
        cdq     dword480,dword467
        idiv    dword467,dword479
        mov     dword482,dword867
        add     dword467,[dword482]
        mov     dword872,dword467
        lea     dword485,[dword868+4]
        mov     dword488,dword873
        sub     dword488,[dword485]
        cvtsi2ss        sse31,dword488
        mov     dword490,dword869
        mov     dword492,dword868
        movss   sse32,dword ptr [dword490+8]
        subss   sse32,dword ptr [dword492+8]
        mulss   sse31,sse32
        lea     dword494,[dword869+4]
        lea     dword497,[dword868+4]
        mov     dword499,[dword494]
        sub     dword499,[dword497]
        cvtsi2ss        sse33,dword499
        divss   sse31,sse33
        mov     dword501,dword868
        addss   sse31,dword ptr [dword501+8]
        movss   sse98,sse31
        lea     dword504,[dword867+4]
        mov     dword507,dword873
        sub     dword507,[dword504]
        cvtsi2ss        sse34,dword507
        mov     dword509,dword869
        mov     dword511,dword867
        movss   sse35,dword ptr [dword509+8]
        subss   sse35,dword ptr [dword511+8]
        mulss   sse34,sse35
        lea     dword513,[dword869+4]
        lea     dword516,[dword867+4]
        mov     dword518,[dword513]
        sub     dword518,[dword516]
        cvtsi2ss        sse36,dword518
        divss   sse34,sse36
        mov     dword520,dword867
        addss   sse34,dword ptr [dword520+8]
        movss   sse100,sse34
        lea     dword523,[dword868+4]
        mov     dword526,dword873
        sub     dword526,[dword523]
        cvtsi2ss        sse37,dword526
        mov     dword528,8
        add     dword528,dword869
        add     dword528,4
        mov     dword531,8
        add     dword531,dword868
        add     dword531,4
        movss   sse38,dword ptr [dword528]
        subss   sse38,dword ptr [dword531]
        mulss   sse37,sse38
        lea     dword534,[dword869+4]
        lea     dword537,[dword868+4]
        mov     dword539,[dword534]
        sub     dword539,[dword537]
        cvtsi2ss        sse39,dword539
        divss   sse37,sse39
        mov     dword541,8
        add     dword541,dword868
        add     dword541,4
        addss   sse37,dword ptr [dword541]
        movss   sse99,sse37
        lea     dword545,[dword867+4]
        mov     dword548,dword873
        sub     dword548,[dword545]
        cvtsi2ss        sse40,dword548
        mov     dword550,8
        add     dword550,dword869
        add     dword550,4
        mov     dword553,8
        add     dword553,dword867
        add     dword553,4
        movss   sse41,dword ptr [dword550]
        subss   sse41,dword ptr [dword553]
        mulss   sse40,sse41
        lea     dword556,[dword869+4]
        lea     dword559,[dword867+4]
        mov     dword561,[dword556]
        sub     dword561,[dword559]
        cvtsi2ss        sse42,dword561
        divss   sse40,sse42
        mov     dword563,8
        add     dword563,dword867
        add     dword563,4
        addss   sse40,dword ptr [dword563]
        movss   sse101,sse40
        mov     dword568,dword872
        sub     dword568,dword871
        cvtsi2ss        sse43,dword568
        movss   sse44,sse100
        subss   sse44,sse98
        divss   sse44,sse43
        movss   sse102,sse44
        mov     dword574,dword872
        sub     dword574,dword871
        cvtsi2ss        sse45,dword574
        movss   sse46,sse101
        subss   sse46,sse99
        divss   sse46,sse45
        movss   sse103,sse46
; start of inline function _rasterize_horiz_line__unordered
        movss   sse109,sse103
        movss   sse108,sse102
        movss   sse107,sse101
        movss   sse106,sse100
        movss   sse105,sse99
        movss   sse104,sse98
        mov     dword632,dword873
        mov     dword876,dword632
        mov     dword631,dword872
        mov     dword875,dword631
        mov     dword630,dword871
        mov     dword874,dword630
        mov     dword636,dword874
        cmp     dword636,dword875
        jg      label0019
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse105,4
        push_arg        sse104,4
        push_arg        dword876,4
        push_arg        dword875,4
        push_arg        dword874,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001a
label0019:
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse107,4
        push_arg        sse106,4
        push_arg        dword876,4
        push_arg        dword874,4
        push_arg        dword875,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword873
        jmp     label0011
label0012:
label0027:
; end of inline function _rasterize_triangle_2i
        inc     dword866
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp

end
