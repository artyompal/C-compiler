
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
        mov     dword7,[ebp+8]
        mov     dword2,dword7
        mov     dword4,[dword2]
        mov     dword5,[dword2+4]
        mov     dword ptr [__mvproj_matrix],dword4
        mov     dword ptr [__mvproj_matrix+4],dword5
        mov     dword4,[dword2+8]
        mov     dword5,[dword2+12]
        mov     dword ptr [__mvproj_matrix+8],dword4
        mov     dword ptr [__mvproj_matrix+12],dword5
        mov     dword4,[dword2+16]
        mov     dword5,[dword2+20]
        mov     dword ptr [__mvproj_matrix+16],dword4
        mov     dword ptr [__mvproj_matrix+20],dword5
        mov     dword4,[dword2+24]
        mov     dword5,[dword2+28]
        mov     dword ptr [__mvproj_matrix+24],dword4
        mov     dword ptr [__mvproj_matrix+28],dword5
        mov     dword4,[dword2+32]
        mov     dword5,[dword2+36]
        mov     dword ptr [__mvproj_matrix+32],dword4
        mov     dword ptr [__mvproj_matrix+36],dword5
        mov     dword4,[dword2+40]
        mov     dword5,[dword2+44]
        mov     dword ptr [__mvproj_matrix+40],dword4
        mov     dword ptr [__mvproj_matrix+44],dword5
        mov     dword4,[dword2+48]
        mov     dword5,[dword2+52]
        mov     dword ptr [__mvproj_matrix+48],dword4
        mov     dword ptr [__mvproj_matrix+52],dword5
        mov     dword4,[dword2+56]
        mov     dword5,[dword2+60]
        mov     dword ptr [__mvproj_matrix+56],dword4
        mov     dword ptr [__mvproj_matrix+60],dword5
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
        mov     dword376,[ebp+20]
        mov     dword375,[ebp+16]
        mov     dword374,[ebp+12]
        mov     dword373,[ebp+8]
        mov     dword2,dword373
        mov     dword ptr [dword2+192],0
        mov     dword5,dword374
        mov     dword355,dword5
        lea     dword8,[dword374+24]
        mov     dword356,dword8
label0001:
        mov     dword12,dword374
        mov     dword14,[dword12+192]
        imul    dword14,24
        mov     dword16,dword374
        add     dword16,dword14
        cmp     dword16,dword356
        jle     label0002
; start of inline function vec4f_subtract
        mov     dword166,dword375
        mov     dword369,dword166
        mov     dword20,dword355
        mov     dword368,dword20
        lea     dword21,[ebp-24]
        mov     dword367,dword21
        mov     dword169,dword368
        mov     dword171,dword369
        movss   sse26,dword ptr [dword169]
        subss   sse26,dword ptr [dword171]
        mov     dword173,dword367
        movss   dword ptr [dword173],sse26
        mov     dword175,dword368
        mov     dword177,dword369
        movss   sse27,dword ptr [dword175+4]
        subss   sse27,dword ptr [dword177+4]
        mov     dword179,dword367
        movss   dword ptr [dword179+4],sse27
        mov     dword181,dword368
        mov     dword183,dword369
        movss   sse28,dword ptr [dword181+8]
        subss   sse28,dword ptr [dword183+8]
        mov     dword185,dword367
        movss   dword ptr [dword185+8],sse28
        mov     dword187,dword368
        mov     dword189,dword369
        movss   sse29,dword ptr [dword187+12]
        subss   sse29,dword ptr [dword189+12]
        mov     dword191,dword367
        movss   dword ptr [dword191+12],sse29
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword269,dword376
        mov     dword371,dword269
        lea     dword23,[ebp-24]
        mov     dword370,dword23
        mov     dword272,dword370
        mov     dword274,dword371
        movss   sse46,dword ptr [dword272+4]
        mulss   sse46,dword ptr [dword274+4]
        mov     dword276,dword370
        mov     dword278,dword371
        movss   sse47,dword ptr [dword276]
        mulss   sse47,dword ptr [dword278]
        addss   sse47,sse46
        mov     dword280,dword370
        mov     dword282,dword371
        movss   sse48,dword ptr [dword280+8]
        mulss   sse48,dword ptr [dword282+8]
        addss   sse47,sse48
        mov     dword284,dword370
        mov     dword286,dword371
        movss   sse49,dword ptr [dword284+12]
        mulss   sse49,dword ptr [dword286+12]
        addss   sse47,sse49
        movss   sse76,sse47
; end of inline function vec4f_dot
        movss   sse72,sse76
; start of inline function vec4f_subtract
        mov     dword192,dword375
        mov     dword369,dword192
        mov     dword27,dword356
        mov     dword368,dword27
        lea     dword28,[ebp-24]
        mov     dword367,dword28
        mov     dword195,dword368
        mov     dword197,dword369
        movss   sse31,dword ptr [dword195]
        subss   sse31,dword ptr [dword197]
        mov     dword199,dword367
        movss   dword ptr [dword199],sse31
        mov     dword201,dword368
        mov     dword203,dword369
        movss   sse32,dword ptr [dword201+4]
        subss   sse32,dword ptr [dword203+4]
        mov     dword205,dword367
        movss   dword ptr [dword205+4],sse32
        mov     dword207,dword368
        mov     dword209,dword369
        movss   sse33,dword ptr [dword207+8]
        subss   sse33,dword ptr [dword209+8]
        mov     dword211,dword367
        movss   dword ptr [dword211+8],sse33
        mov     dword213,dword368
        mov     dword215,dword369
        movss   sse34,dword ptr [dword213+12]
        subss   sse34,dword ptr [dword215+12]
        mov     dword217,dword367
        movss   dword ptr [dword217+12],sse34
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword287,dword376
        mov     dword371,dword287
        lea     dword30,[ebp-24]
        mov     dword370,dword30
        mov     dword290,dword370
        mov     dword292,dword371
        movss   sse51,dword ptr [dword290+4]
        mulss   sse51,dword ptr [dword292+4]
        mov     dword294,dword370
        mov     dword296,dword371
        movss   sse52,dword ptr [dword294]
        mulss   sse52,dword ptr [dword296]
        addss   sse52,sse51
        mov     dword298,dword370
        mov     dword300,dword371
        movss   sse53,dword ptr [dword298+8]
        mulss   sse53,dword ptr [dword300+8]
        addss   sse52,sse53
        mov     dword302,dword370
        mov     dword304,dword371
        movss   sse54,dword ptr [dword302+12]
        mulss   sse54,dword ptr [dword304+12]
        addss   sse52,sse54
        movss   sse76,sse52
; end of inline function vec4f_dot
        movss   sse73,sse76
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse72
        ja      label0003
        mov     dword35,dword373
        mov     dword36,[dword35+192]
        inc     dword ptr [dword35+192]
        imul    dword36,24
        mov     dword39,dword373
        add     dword39,dword36
        mov     dword41,dword355
        mov     dword42,[dword41]
        mov     dword43,[dword41+4]
        mov     [dword39],dword42
        mov     [dword39+4],dword43
        mov     dword42,[dword41+8]
        mov     dword43,[dword41+12]
        mov     [dword39+8],dword42
        mov     [dword39+12],dword43
        mov     dword42,[dword41+16]
        mov     dword43,[dword41+20]
        mov     [dword39+16],dword42
        mov     [dword39+20],dword43
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
        mov     dword53,dword355
        mov     dword369,dword53
        mov     dword218,dword375
        mov     dword368,dword218
        lea     dword55,[ebp-24]
        mov     dword367,dword55
        mov     dword221,dword368
        mov     dword223,dword369
        movss   sse36,dword ptr [dword221]
        subss   sse36,dword ptr [dword223]
        mov     dword225,dword367
        movss   dword ptr [dword225],sse36
        mov     dword227,dword368
        mov     dword229,dword369
        movss   sse37,dword ptr [dword227+4]
        subss   sse37,dword ptr [dword229+4]
        mov     dword231,dword367
        movss   dword ptr [dword231+4],sse37
        mov     dword233,dword368
        mov     dword235,dword369
        movss   sse38,dword ptr [dword233+8]
        subss   sse38,dword ptr [dword235+8]
        mov     dword237,dword367
        movss   dword ptr [dword237+8],sse38
        mov     dword239,dword368
        mov     dword241,dword369
        movss   sse39,dword ptr [dword239+12]
        subss   sse39,dword ptr [dword241+12]
        mov     dword243,dword367
        movss   dword ptr [dword243+12],sse39
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     dword57,dword355
        mov     dword369,dword57
        mov     dword59,dword356
        mov     dword368,dword59
        lea     dword60,[ebp-40]
        mov     dword367,dword60
        mov     dword246,dword368
        mov     dword248,dword369
        movss   sse41,dword ptr [dword246]
        subss   sse41,dword ptr [dword248]
        mov     dword250,dword367
        movss   dword ptr [dword250],sse41
        mov     dword252,dword368
        mov     dword254,dword369
        movss   sse42,dword ptr [dword252+4]
        subss   sse42,dword ptr [dword254+4]
        mov     dword256,dword367
        movss   dword ptr [dword256+4],sse42
        mov     dword258,dword368
        mov     dword260,dword369
        movss   sse43,dword ptr [dword258+8]
        subss   sse43,dword ptr [dword260+8]
        mov     dword262,dword367
        movss   dword ptr [dword262+8],sse43
        mov     dword264,dword368
        mov     dword266,dword369
        movss   sse44,dword ptr [dword264+12]
        subss   sse44,dword ptr [dword266+12]
        mov     dword268,dword367
        movss   dword ptr [dword268+12],sse44
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword305,dword376
        mov     dword371,dword305
        lea     dword62,[ebp-24]
        mov     dword370,dword62
        mov     dword308,dword370
        mov     dword310,dword371
        movss   sse56,dword ptr [dword308+4]
        mulss   sse56,dword ptr [dword310+4]
        mov     dword312,dword370
        mov     dword314,dword371
        movss   sse57,dword ptr [dword312]
        mulss   sse57,dword ptr [dword314]
        addss   sse57,sse56
        mov     dword316,dword370
        mov     dword318,dword371
        movss   sse58,dword ptr [dword316+8]
        mulss   sse58,dword ptr [dword318+8]
        addss   sse57,sse58
        mov     dword320,dword370
        mov     dword322,dword371
        movss   sse59,dword ptr [dword320+12]
        mulss   sse59,dword ptr [dword322+12]
        addss   sse57,sse59
        movss   sse76,sse57
; end of inline function vec4f_dot
        movss   sse8,sse76
; start of inline function vec4f_dot
        mov     dword323,dword376
        mov     dword371,dword323
        lea     dword64,[ebp-40]
        mov     dword370,dword64
        mov     dword326,dword370
        mov     dword328,dword371
        movss   sse61,dword ptr [dword326+4]
        mulss   sse61,dword ptr [dword328+4]
        mov     dword330,dword370
        mov     dword332,dword371
        movss   sse62,dword ptr [dword330]
        mulss   sse62,dword ptr [dword332]
        addss   sse62,sse61
        mov     dword334,dword370
        mov     dword336,dword371
        movss   sse63,dword ptr [dword334+8]
        mulss   sse63,dword ptr [dword336+8]
        addss   sse62,sse63
        mov     dword338,dword370
        mov     dword340,dword371
        movss   sse64,dword ptr [dword338+12]
        mulss   sse64,dword ptr [dword340+12]
        addss   sse62,sse64
        movss   sse76,sse62
; end of inline function vec4f_dot
        divss   sse8,sse76
        movss   sse74,sse8
; start of inline function vec4f_mul
        movss   sse77,sse74
        lea     dword67,[ebp-40]
        mov     dword372,dword67
        mov     dword343,dword372
        movss   sse67,dword ptr [dword343]
        mulss   sse67,sse77
        movss   dword ptr [dword343],sse67
        mov     dword346,dword372
        movss   sse68,dword ptr [dword346+4]
        mulss   sse68,sse77
        movss   dword ptr [dword346+4],sse68
        mov     dword349,dword372
        movss   sse69,dword ptr [dword349+8]
        mulss   sse69,sse77
        movss   dword ptr [dword349+8],sse69
        mov     dword352,dword372
        movss   sse70,dword ptr [dword352+12]
        mulss   sse70,sse77
        movss   dword ptr [dword352+12],sse70
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     dword68,[ebp-40]
        mov     dword366,dword68
        mov     dword70,dword355
        mov     dword365,dword70
        mov     dword72,dword373
        mov     dword74,[dword72+192]
        imul    dword74,24
        mov     dword76,dword373
        add     dword76,dword74
        mov     dword364,dword76
        mov     dword143,dword365
        mov     dword145,dword366
        movss   sse21,dword ptr [dword143]
        addss   sse21,dword ptr [dword145]
        mov     dword147,dword364
        movss   dword ptr [dword147],sse21
        mov     dword149,dword365
        mov     dword151,dword366
        movss   sse22,dword ptr [dword149+4]
        addss   sse22,dword ptr [dword151+4]
        mov     dword153,dword364
        movss   dword ptr [dword153+4],sse22
        mov     dword155,dword365
        mov     dword157,dword366
        movss   sse23,dword ptr [dword155+8]
        addss   sse23,dword ptr [dword157+8]
        mov     dword159,dword364
        movss   dword ptr [dword159+8],sse23
        mov     dword161,dword365
        mov     dword163,dword366
        movss   sse24,dword ptr [dword161+12]
        addss   sse24,dword ptr [dword163+12]
        mov     dword165,dword364
        movss   dword ptr [dword165+12],sse24
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     dword78,16
        add     dword78,dword355
        mov     dword362,dword78
        mov     dword80,16
        add     dword80,dword356
        mov     dword361,dword80
        lea     dword81,[ebp-48]
        mov     dword360,dword81
        mov     dword123,dword361
        mov     dword125,dword362
        movss   sse14,dword ptr [dword123]
        subss   sse14,dword ptr [dword125]
        mov     dword127,dword360
        movss   dword ptr [dword127],sse14
        mov     dword129,dword361
        mov     dword131,dword362
        movss   sse15,dword ptr [dword129+4]
        subss   sse15,dword ptr [dword131+4]
        mov     dword133,dword360
        movss   dword ptr [dword133+4],sse15
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   sse75,sse74
        lea     dword83,[ebp-48]
        mov     dword363,dword83
        mov     dword136,dword363
        movss   sse18,dword ptr [dword136]
        mulss   sse18,sse75
        movss   dword ptr [dword136],sse18
        mov     dword139,dword363
        movss   sse19,dword ptr [dword139+4]
        mulss   sse19,sse75
        movss   dword ptr [dword139+4],sse19
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     dword84,[ebp-48]
        mov     dword359,dword84
        mov     dword86,16
        add     dword86,dword355
        mov     dword358,dword86
        mov     dword88,dword373
        mov     dword90,[dword88+192]
        imul    dword90,24
        mov     dword92,dword373
        add     dword92,dword90
        add     dword92,16
        mov     dword357,dword92
        mov     dword110,dword358
        mov     dword112,dword359
        movss   sse11,dword ptr [dword110]
        addss   sse11,dword ptr [dword112]
        mov     dword114,dword357
        movss   dword ptr [dword114],sse11
        mov     dword116,dword358
        mov     dword118,dword359
        movss   sse12,dword ptr [dword116+4]
        addss   sse12,dword ptr [dword118+4]
        mov     dword120,dword357
        movss   dword ptr [dword120+4],sse12
; end of inline function vec2f_add
        mov     dword95,dword373
        inc     dword ptr [dword95+192]
label0004:
        add     dword355,24
        add     dword356,24
        jmp     label0001
label0002:
        mov     dword99,dword373
        mov     dword100,[dword99+192]
        inc     dword ptr [dword99+192]
        imul    dword100,24
        mov     dword103,dword373
        add     dword103,dword100
        mov     dword105,dword373
        mov     dword106,[dword105]
        mov     dword107,[dword105+4]
        mov     [dword103],dword106
        mov     [dword103+4],dword107
        mov     dword106,[dword105+8]
        mov     dword107,[dword105+12]
        mov     [dword103+8],dword106
        mov     [dword103+12],dword107
        mov     dword106,[dword105+16]
        mov     dword107,[dword105+20]
        mov     [dword103+16],dword106
        mov     [dword103+20],dword107
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
        mov     dword895,[ebp+28]
        mov     dword894,[ebp+24]
        mov     dword893,[ebp+20]
        mov     dword892,[ebp+16]
        mov     dword891,[ebp+12]
        mov     dword890,[ebp+8]
        push_all
        push_arg        dword890,4
        lea     dword2,[ebp-196]
        push_arg        dword2,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword3,[ebp-196]
        add     dword3,16
        mov     dword6,dword893
        mov     dword7,[dword6]
        mov     dword8,[dword6+4]
        mov     [dword3],dword7
        mov     [dword3+4],dword8
        push_all
        push_arg        dword891,4
        lea     dword10,[ebp-196]
        add     dword10,24
        push_arg        dword10,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword12,[ebp-196]
        add     dword12,24
        add     dword12,16
        mov     dword16,dword894
        mov     dword17,[dword16]
        mov     dword18,[dword16+4]
        mov     [dword12],dword17
        mov     [dword12+4],dword18
        push_all
        push_arg        dword892,4
        lea     dword20,[ebp-196]
        add     dword20,48
        push_arg        dword20,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword22,[ebp-196]
        add     dword22,48
        add     dword22,16
        mov     dword26,dword895
        mov     dword27,[dword26]
        mov     dword28,[dword26+4]
        mov     [dword22],dword27
        mov     [dword22+4],dword28
        lea     dword29,[ebp-196]
        add     dword29,72
        mov     dword32,[ebp-196]
        mov     dword33,[ebp-192]
        mov     [dword29],dword32
        mov     [dword29+4],dword33
        mov     dword32,[ebp-188]
        mov     dword33,[ebp-184]
        mov     [dword29+8],dword32
        mov     [dword29+12],dword33
        mov     dword32,[ebp-180]
        mov     dword33,[ebp-176]
        mov     [dword29+16],dword32
        mov     [dword29+20],dword33
        lea     dword34,[ebp-196]
        add     dword34,192
        mov     dword ptr [dword34],4
; start of inline function _rasterize_polygon_4f
        lea     dword37,[ebp-196]
        mov     dword864,dword37
; start of inline function _clip_poligon
        mov     dword724,dword864
        mov     dword883,dword724
        push_all
        lea     dword726,dword ptr [__clip_z_far_norm]
        push_arg        dword726,4
        lea     dword727,dword ptr [__clip_z_far_base]
        push_arg        dword727,4
        push_arg        dword883,4
        lea     dword729,[ebp-660]
        push_arg        dword729,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword730,dword ptr [__clip_z_near_norm]
        push_arg        dword730,4
        lea     dword731,dword ptr [__clip_z_near_base]
        push_arg        dword731,4
        lea     dword732,[ebp-660]
        push_arg        dword732,4
        push_arg        dword883,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword734,dword ptr [__clip_plane_left_norm]
        push_arg        dword734,4
        lea     dword735,dword ptr [__clip_plane_left_base]
        push_arg        dword735,4
        push_arg        dword883,4
        lea     dword737,[ebp-660]
        push_arg        dword737,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword738,dword ptr [__clip_plane_right_norm]
        push_arg        dword738,4
        lea     dword739,dword ptr [__clip_plane_right_base]
        push_arg        dword739,4
        lea     dword740,[ebp-660]
        push_arg        dword740,4
        push_arg        dword883,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword742,dword ptr [__clip_plane_top_norm]
        push_arg        dword742,4
        lea     dword743,dword ptr [__clip_plane_top_base]
        push_arg        dword743,4
        push_arg        dword883,4
        lea     dword745,[ebp-660]
        push_arg        dword745,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword746,dword ptr [__clip_plane_bottom_norm]
        push_arg        dword746,4
        lea     dword747,dword ptr [__clip_plane_bottom_base]
        push_arg        dword747,4
        lea     dword748,[ebp-660]
        push_arg        dword748,4
        push_arg        dword883,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        mov     dword751,dword883
        cmp     dword ptr [dword751+192],1
        setg    byte8
        movzx   dword753,byte8
        mov     dword884,dword753
; end of inline function _clip_poligon
        mov     dword40,dword884
        cmp     dword40,0
        jne     label0000
        jmp     label002d
label0000:
        mov     dword42,dword864
        cmp     dword ptr [dword42+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword865,0
label0003:
        mov     dword49,dword864
        mov     dword51,[dword49+192]
        cmp     dword51,dword865
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword53,dword864
        mov     dword56,dword865
        imul    dword56,24
        add     dword53,dword56
        mov     dword886,dword53
        lea     dword57,[ebp-332]
        mov     dword60,dword865
        sal     dword60,4
        add     dword57,dword60
        mov     dword885,dword57
; start of inline function matrix4f_transform
        mov     dword889,(offset __viewport_matrix)
        mov     dword789,dword886
        mov     dword888,dword789
        lea     dword757,[ebp-688]
        mov     dword887,dword757
        mov     dword792,dword888
        mov     dword794,dword889
        movss   sse81,dword ptr [dword792+4]
        mulss   sse81,dword ptr [dword794+16]
        mov     dword796,dword888
        mov     dword798,dword889
        movss   sse82,dword ptr [dword796]
        mulss   sse82,dword ptr [dword798]
        addss   sse82,sse81
        mov     dword800,dword888
        mov     dword802,dword889
        movss   sse83,dword ptr [dword800+8]
        mulss   sse83,dword ptr [dword802+32]
        addss   sse82,sse83
        mov     dword804,dword888
        mov     dword806,dword889
        movss   sse84,dword ptr [dword804+12]
        mulss   sse84,dword ptr [dword806+48]
        addss   sse82,sse84
        mov     dword808,dword887
        movss   dword ptr [dword808],sse82
        mov     dword810,dword889
        mov     dword812,dword888
        movss   sse85,dword ptr [dword812]
        mulss   sse85,dword ptr [dword810+4]
        mov     dword814,dword888
        mov     dword816,dword889
        movss   sse86,dword ptr [dword814+4]
        mulss   sse86,dword ptr [dword816+20]
        addss   sse85,sse86
        mov     dword818,dword888
        mov     dword820,dword889
        movss   sse87,dword ptr [dword818+8]
        mulss   sse87,dword ptr [dword820+36]
        addss   sse85,sse87
        mov     dword822,dword888
        mov     dword824,dword889
        movss   sse88,dword ptr [dword822+12]
        mulss   sse88,dword ptr [dword824+52]
        addss   sse85,sse88
        mov     dword826,dword887
        movss   dword ptr [dword826+4],sse85
        mov     dword828,dword889
        mov     dword830,dword888
        movss   sse89,dword ptr [dword830]
        mulss   sse89,dword ptr [dword828+8]
        mov     dword832,dword888
        mov     dword834,dword889
        movss   sse90,dword ptr [dword832+4]
        mulss   sse90,dword ptr [dword834+24]
        addss   sse89,sse90
        mov     dword836,dword888
        mov     dword838,dword889
        movss   sse91,dword ptr [dword836+8]
        mulss   sse91,dword ptr [dword838+40]
        addss   sse89,sse91
        mov     dword840,dword888
        mov     dword842,dword889
        movss   sse92,dword ptr [dword840+12]
        mulss   sse92,dword ptr [dword842+56]
        addss   sse89,sse92
        mov     dword844,dword887
        movss   dword ptr [dword844+8],sse89
        mov     dword846,dword889
        mov     dword848,dword888
        movss   sse93,dword ptr [dword848]
        mulss   sse93,dword ptr [dword846+12]
        mov     dword850,dword888
        mov     dword852,dword889
        movss   sse94,dword ptr [dword850+4]
        mulss   sse94,dword ptr [dword852+28]
        addss   sse93,sse94
        mov     dword854,dword888
        mov     dword856,dword889
        movss   sse95,dword ptr [dword854+8]
        mulss   sse95,dword ptr [dword856+44]
        addss   sse93,sse95
        mov     dword858,dword888
        mov     dword860,dword889
        movss   sse96,dword ptr [dword858+12]
        mulss   sse96,dword ptr [dword860+60]
        addss   sse93,sse96
        mov     dword862,dword887
        movss   dword ptr [dword862+12],sse93
; end of inline function matrix4f_transform
        lea     dword758,[ebp-688]
        add     dword758,12
        movss   sse77,dword ptr [___unnamed_float_1]
        divss   sse77,dword ptr [dword758]
        movss   sse112,sse77
        movss   sse78,dword ptr [ebp-688]
        mulss   sse78,sse112
        cvttss2si       dword764,sse78
        mov     dword766,dword885
        mov     [dword766],dword764
        lea     dword767,[ebp-688]
        add     dword767,4
        movss   sse79,dword ptr [dword767]
        mulss   sse79,sse112
        cvttss2si       dword770,sse79
        mov     dword772,dword885
        mov     [dword772+4],dword770
        mov     dword774,dword885
        cmp     dword ptr [dword774],0
        jl      label002a
        mov     dword777,dword885
        mov     dword779,[dword777]
        cmp     dword779,dword ptr [__width]
        jge     label002a
        mov     dword781,dword885
        cmp     dword ptr [dword781+4],0
        jl      label002a
        mov     dword784,dword885
        mov     dword786,[dword784+4]
        cmp     dword786,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     dword61,[ebp-332]
        mov     dword64,dword865
        sal     dword64,4
        add     dword61,dword64
        add     dword61,8
        mov     dword67,dword864
        mov     dword70,dword865
        imul    dword70,24
        add     dword67,dword70
        add     dword67,16
        mov     dword72,[dword67]
        mov     dword73,[dword67+4]
        mov     [dword61],dword72
        mov     [dword61+4],dword73
        inc     dword865
        jmp     label0003
label0004:
        mov     dword865,2
label0006:
        mov     dword78,dword864
        mov     dword80,[dword78+192]
        dec     dword80
        cmp     dword80,dword865
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     dword82,[ebp-332]
        mov     dword85,dword865
        sal     dword85,4
        add     dword82,dword85
        mov     dword868,dword82
        mov     dword88,dword865
        dec     dword88
        sal     dword88,4
        lea     dword90,[ebp-332]
        add     dword90,dword88
        mov     dword867,dword90
        lea     dword91,[ebp-332]
        mov     dword866,dword91
        lea     dword95,[dword866+4]
        lea     dword98,[dword867+4]
        mov     dword100,[dword95]
        cmp     dword100,[dword98]
        jle     label0008
        mov     dword103,dword866
        mov     dword869,dword103
        mov     dword106,dword867
        mov     dword866,dword106
        mov     dword109,dword869
        mov     dword867,dword109
label0008:
        lea     dword111,[dword866+4]
        lea     dword114,[dword868+4]
        mov     dword116,[dword111]
        cmp     dword116,[dword114]
        jle     label0009
        mov     dword119,dword866
        mov     dword869,dword119
        mov     dword122,dword868
        mov     dword866,dword122
        mov     dword125,dword869
        mov     dword868,dword125
label0009:
        lea     dword127,[dword867+4]
        lea     dword130,[dword868+4]
        mov     dword132,[dword127]
        cmp     dword132,[dword130]
        jle     label000a
        mov     dword135,dword867
        mov     dword869,dword135
        mov     dword138,dword868
        mov     dword867,dword138
        mov     dword141,dword869
        mov     dword868,dword141
label000a:
        lea     dword143,[dword866+4]
        lea     dword146,[dword868+4]
        mov     dword148,[dword143]
        cmp     dword148,[dword146]
        jne     label000b
        lea     dword150,[dword866+4]
        cmp     dword ptr [dword150],0
        jl      label000c
        lea     dword154,[dword866+4]
        mov     dword157,[dword154]
        cmp     dword157,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   sse111,dword ptr [___unnamed_float_2]
        movss   sse110,dword ptr [___unnamed_float_2]
        mov     dword161,8
        add     dword161,dword868
        mov     dword882,dword161
        mov     dword163,8
        add     dword163,dword867
        mov     dword881,dword163
        mov     dword165,8
        add     dword165,dword866
        mov     dword880,dword165
        lea     dword167,[dword866+4]
        mov     dword653,[dword167]
        mov     dword879,dword653
        mov     dword170,dword868
        mov     dword652,[dword170]
        mov     dword878,dword652
        mov     dword172,dword867
        mov     dword651,[dword172]
        mov     dword877,dword651
        mov     dword174,dword866
        mov     dword650,[dword174]
        mov     dword876,dword650
        mov     dword657,dword876
        cmp     dword657,dword877
        jge     label001c
        mov     dword660,dword878
        cmp     dword660,dword877
        jle     label001d
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        mov     dword664,dword880
        push_arg        dword ptr [dword664+4],4
        mov     dword666,dword880
        push_arg        dword ptr [dword666],4
        push_arg        dword879,4
        push_arg        dword878,4
        push_arg        dword876,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        mov     dword672,dword878
        cmp     dword672,dword876
        jge     label001f
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        mov     dword676,dword882
        push_arg        dword ptr [dword676+4],4
        mov     dword678,dword882
        push_arg        dword ptr [dword678],4
        push_arg        dword879,4
        push_arg        dword877,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        mov     dword685,dword880
        push_arg        dword ptr [dword685+4],4
        mov     dword687,dword880
        push_arg        dword ptr [dword687],4
        push_arg        dword879,4
        push_arg        dword877,4
        push_arg        dword876,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0020:
label001e:
        jmp     label0021
label001c:
        mov     dword693,dword878
        cmp     dword693,dword877
        jge     label0022
        push_all
        movss   sse69,sse111
        xorps   sse69,dword ptr [___unnamed_float_4]
        push_arg        sse69,4
        movss   sse70,sse110
        xorps   sse70,dword ptr [___unnamed_float_4]
        push_arg        sse70,4
        mov     dword697,dword882
        push_arg        dword ptr [dword697+4],4
        mov     dword699,dword882
        push_arg        dword ptr [dword699],4
        push_arg        dword879,4
        push_arg        dword876,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        mov     dword705,dword878
        cmp     dword705,dword876
        jle     label0024
        push_all
        movss   sse71,sse111
        xorps   sse71,dword ptr [___unnamed_float_4]
        push_arg        sse71,4
        movss   sse72,sse110
        xorps   sse72,dword ptr [___unnamed_float_4]
        push_arg        sse72,4
        mov     dword709,dword881
        push_arg        dword ptr [dword709+4],4
        mov     dword711,dword881
        push_arg        dword ptr [dword711],4
        push_arg        dword879,4
        push_arg        dword878,4
        push_arg        dword877,4
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
        mov     dword718,dword881
        push_arg        dword ptr [dword718+4],4
        mov     dword720,dword881
        push_arg        dword ptr [dword720],4
        push_arg        dword879,4
        push_arg        dword876,4
        push_arg        dword877,4
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
        lea     dword176,[dword866+4]
        mov     dword179,[dword176]
        mov     dword872,dword179
label000e:
        lea     dword181,[dword867+4]
        mov     dword184,[dword181]
        cmp     dword184,dword872
        jle     label000f
        lea     dword186,[dword866+4]
        mov     dword189,dword872
        sub     dword189,[dword186]
        mov     dword191,dword867
        mov     dword193,dword866
        mov     dword194,[dword191]
        sub     dword194,[dword193]
        imul    dword189,dword194
        lea     dword196,[dword867+4]
        lea     dword199,[dword866+4]
        mov     dword201,[dword196]
        sub     dword201,[dword199]
        cdq     dword202,dword189
        idiv    dword189,dword201
        mov     dword204,dword866
        add     dword189,[dword204]
        mov     dword870,dword189
        lea     dword207,[dword866+4]
        mov     dword210,dword872
        sub     dword210,[dword207]
        mov     dword212,dword868
        mov     dword214,dword866
        mov     dword215,[dword212]
        sub     dword215,[dword214]
        imul    dword210,dword215
        lea     dword217,[dword868+4]
        lea     dword220,[dword866+4]
        mov     dword222,[dword217]
        sub     dword222,[dword220]
        cdq     dword223,dword210
        idiv    dword210,dword222
        mov     dword225,dword866
        add     dword210,[dword225]
        mov     dword871,dword210
        lea     dword228,[dword866+4]
        mov     dword231,dword872
        sub     dword231,[dword228]
        cvtsi2ss        sse5,dword231
        mov     dword233,dword867
        mov     dword235,dword866
        movss   sse6,dword ptr [dword233+8]
        subss   sse6,dword ptr [dword235+8]
        mulss   sse5,sse6
        lea     dword237,[dword867+4]
        lea     dword240,[dword866+4]
        mov     dword242,[dword237]
        sub     dword242,[dword240]
        cvtsi2ss        sse7,dword242
        divss   sse5,sse7
        mov     dword244,dword866
        addss   sse5,dword ptr [dword244+8]
        movss   sse98,sse5
        lea     dword247,[dword866+4]
        mov     dword250,dword872
        sub     dword250,[dword247]
        cvtsi2ss        sse8,dword250
        mov     dword252,dword868
        mov     dword254,dword866
        movss   sse9,dword ptr [dword252+8]
        subss   sse9,dword ptr [dword254+8]
        mulss   sse8,sse9
        lea     dword256,[dword868+4]
        lea     dword259,[dword866+4]
        mov     dword261,[dword256]
        sub     dword261,[dword259]
        cvtsi2ss        sse10,dword261
        divss   sse8,sse10
        mov     dword263,dword866
        addss   sse8,dword ptr [dword263+8]
        movss   sse100,sse8
        lea     dword266,[dword866+4]
        mov     dword269,dword872
        sub     dword269,[dword266]
        cvtsi2ss        sse11,dword269
        mov     dword271,8
        add     dword271,dword867
        add     dword271,4
        mov     dword274,8
        add     dword274,dword866
        add     dword274,4
        movss   sse12,dword ptr [dword271]
        subss   sse12,dword ptr [dword274]
        mulss   sse11,sse12
        lea     dword277,[dword867+4]
        lea     dword280,[dword866+4]
        mov     dword282,[dword277]
        sub     dword282,[dword280]
        cvtsi2ss        sse13,dword282
        divss   sse11,sse13
        mov     dword284,8
        add     dword284,dword866
        add     dword284,4
        addss   sse11,dword ptr [dword284]
        movss   sse99,sse11
        lea     dword288,[dword866+4]
        mov     dword291,dword872
        sub     dword291,[dword288]
        cvtsi2ss        sse14,dword291
        mov     dword293,8
        add     dword293,dword868
        add     dword293,4
        mov     dword296,8
        add     dword296,dword866
        add     dword296,4
        movss   sse15,dword ptr [dword293]
        subss   sse15,dword ptr [dword296]
        mulss   sse14,sse15
        lea     dword299,[dword868+4]
        lea     dword302,[dword866+4]
        mov     dword304,[dword299]
        sub     dword304,[dword302]
        cvtsi2ss        sse16,dword304
        divss   sse14,sse16
        mov     dword306,8
        add     dword306,dword866
        add     dword306,4
        addss   sse14,dword ptr [dword306]
        movss   sse101,sse14
        mov     dword311,dword871
        sub     dword311,dword870
        cvtsi2ss        sse17,dword311
        movss   sse18,sse100
        subss   sse18,sse98
        divss   sse18,sse17
        movss   sse102,sse18
        mov     dword317,dword871
        sub     dword317,dword870
        cvtsi2ss        sse19,dword317
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
        mov     dword589,dword872
        mov     dword875,dword589
        mov     dword588,dword871
        mov     dword874,dword588
        mov     dword587,dword870
        mov     dword873,dword587
        mov     dword593,dword873
        cmp     dword593,dword874
        jg      label0013
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse105,4
        push_arg        sse104,4
        push_arg        dword875,4
        push_arg        dword874,4
        push_arg        dword873,4
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
        push_arg        dword875,4
        push_arg        dword873,4
        push_arg        dword874,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword872
        jmp     label000e
label000f:
        lea     dword332,[dword867+4]
        lea     dword335,[dword866+4]
        mov     dword337,[dword332]
        sub     dword337,[dword335]
        mov     dword339,dword868
        mov     dword341,dword866
        mov     dword342,[dword339]
        sub     dword342,[dword341]
        imul    dword337,dword342
        lea     dword344,[dword868+4]
        lea     dword347,[dword866+4]
        mov     dword349,[dword344]
        sub     dword349,[dword347]
        cdq     dword350,dword337
        idiv    dword337,dword349
        mov     dword352,dword866
        add     dword337,[dword352]
        mov     dword871,dword337
        lea     dword355,[dword867+4]
        lea     dword358,[dword866+4]
        mov     dword360,[dword355]
        sub     dword360,[dword358]
        cvtsi2ss        sse21,dword360
        mov     dword362,dword868
        mov     dword364,dword866
        movss   sse22,dword ptr [dword362+8]
        subss   sse22,dword ptr [dword364+8]
        mulss   sse21,sse22
        lea     dword366,[dword868+4]
        lea     dword369,[dword866+4]
        mov     dword371,[dword366]
        sub     dword371,[dword369]
        cvtsi2ss        sse23,dword371
        divss   sse21,sse23
        mov     dword373,dword866
        addss   sse21,dword ptr [dword373+8]
        movss   sse100,sse21
        lea     dword376,[dword867+4]
        lea     dword379,[dword866+4]
        mov     dword381,[dword376]
        sub     dword381,[dword379]
        cvtsi2ss        sse24,dword381
        mov     dword383,8
        add     dword383,dword868
        add     dword383,4
        mov     dword386,8
        add     dword386,dword866
        add     dword386,4
        movss   sse25,dword ptr [dword383]
        subss   sse25,dword ptr [dword386]
        mulss   sse24,sse25
        lea     dword389,[dword868+4]
        lea     dword392,[dword866+4]
        mov     dword394,[dword389]
        sub     dword394,[dword392]
        cvtsi2ss        sse26,dword394
        divss   sse24,sse26
        mov     dword396,8
        add     dword396,dword866
        add     dword396,4
        addss   sse24,dword ptr [dword396]
        movss   sse101,sse24
        mov     dword400,dword867
        movss   sse27,sse100
        subss   sse27,dword ptr [dword400+8]
        mov     dword403,dword867
        mov     dword405,dword871
        sub     dword405,[dword403]
        cvtsi2ss        sse28,dword405
        divss   sse27,sse28
        movss   sse102,sse27
        mov     dword408,8
        add     dword408,dword867
        add     dword408,4
        movss   sse29,sse101
        subss   sse29,dword ptr [dword408]
        mov     dword412,dword867
        mov     dword414,dword871
        sub     dword414,[dword412]
        cvtsi2ss        sse30,dword414
        divss   sse29,sse30
        movss   sse103,sse29
; start of inline function _rasterize_horiz_line__unordered
        movss   sse109,sse103
        movss   sse108,sse102
        mov     dword419,8
        add     dword419,dword867
        add     dword419,4
        movss   sse107,dword ptr [dword419]
        mov     dword422,dword867
        movss   sse106,dword ptr [dword422+8]
        movss   sse105,sse101
        movss   sse104,sse100
        lea     dword426,[dword867+4]
        mov     dword610,[dword426]
        mov     dword875,dword610
        mov     dword429,dword867
        mov     dword609,[dword429]
        mov     dword874,dword609
        mov     dword608,dword871
        mov     dword873,dword608
        mov     dword614,dword873
        cmp     dword614,dword874
        jg      label0016
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse105,4
        push_arg        sse104,4
        push_arg        dword875,4
        push_arg        dword874,4
        push_arg        dword873,4
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
        push_arg        dword875,4
        push_arg        dword873,4
        push_arg        dword874,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        lea     dword432,[dword867+4]
        mov     dword434,1
        add     dword434,[dword432]
        mov     dword872,dword434
label0011:
        lea     dword437,[dword868+4]
        mov     dword440,[dword437]
        cmp     dword440,dword872
        jle     label0012
        lea     dword442,[dword867+4]
        mov     dword445,dword872
        sub     dword445,[dword442]
        mov     dword447,dword868
        mov     dword449,dword867
        mov     dword450,[dword447]
        sub     dword450,[dword449]
        imul    dword445,dword450
        lea     dword452,[dword868+4]
        lea     dword455,[dword867+4]
        mov     dword457,[dword452]
        sub     dword457,[dword455]
        cdq     dword458,dword445
        idiv    dword445,dword457
        mov     dword460,dword867
        add     dword445,[dword460]
        mov     dword870,dword445
        lea     dword463,[dword866+4]
        mov     dword466,dword872
        sub     dword466,[dword463]
        mov     dword468,dword868
        mov     dword470,dword866
        mov     dword471,[dword468]
        sub     dword471,[dword470]
        imul    dword466,dword471
        lea     dword473,[dword868+4]
        lea     dword476,[dword866+4]
        mov     dword478,[dword473]
        sub     dword478,[dword476]
        cdq     dword479,dword466
        idiv    dword466,dword478
        mov     dword481,dword866
        add     dword466,[dword481]
        mov     dword871,dword466
        lea     dword484,[dword867+4]
        mov     dword487,dword872
        sub     dword487,[dword484]
        cvtsi2ss        sse31,dword487
        mov     dword489,dword868
        mov     dword491,dword867
        movss   sse32,dword ptr [dword489+8]
        subss   sse32,dword ptr [dword491+8]
        mulss   sse31,sse32
        lea     dword493,[dword868+4]
        lea     dword496,[dword867+4]
        mov     dword498,[dword493]
        sub     dword498,[dword496]
        cvtsi2ss        sse33,dword498
        divss   sse31,sse33
        mov     dword500,dword867
        addss   sse31,dword ptr [dword500+8]
        movss   sse98,sse31
        lea     dword503,[dword866+4]
        mov     dword506,dword872
        sub     dword506,[dword503]
        cvtsi2ss        sse34,dword506
        mov     dword508,dword868
        mov     dword510,dword866
        movss   sse35,dword ptr [dword508+8]
        subss   sse35,dword ptr [dword510+8]
        mulss   sse34,sse35
        lea     dword512,[dword868+4]
        lea     dword515,[dword866+4]
        mov     dword517,[dword512]
        sub     dword517,[dword515]
        cvtsi2ss        sse36,dword517
        divss   sse34,sse36
        mov     dword519,dword866
        addss   sse34,dword ptr [dword519+8]
        movss   sse100,sse34
        lea     dword522,[dword867+4]
        mov     dword525,dword872
        sub     dword525,[dword522]
        cvtsi2ss        sse37,dword525
        mov     dword527,8
        add     dword527,dword868
        add     dword527,4
        mov     dword530,8
        add     dword530,dword867
        add     dword530,4
        movss   sse38,dword ptr [dword527]
        subss   sse38,dword ptr [dword530]
        mulss   sse37,sse38
        lea     dword533,[dword868+4]
        lea     dword536,[dword867+4]
        mov     dword538,[dword533]
        sub     dword538,[dword536]
        cvtsi2ss        sse39,dword538
        divss   sse37,sse39
        mov     dword540,8
        add     dword540,dword867
        add     dword540,4
        addss   sse37,dword ptr [dword540]
        movss   sse99,sse37
        lea     dword544,[dword866+4]
        mov     dword547,dword872
        sub     dword547,[dword544]
        cvtsi2ss        sse40,dword547
        mov     dword549,8
        add     dword549,dword868
        add     dword549,4
        mov     dword552,8
        add     dword552,dword866
        add     dword552,4
        movss   sse41,dword ptr [dword549]
        subss   sse41,dword ptr [dword552]
        mulss   sse40,sse41
        lea     dword555,[dword868+4]
        lea     dword558,[dword866+4]
        mov     dword560,[dword555]
        sub     dword560,[dword558]
        cvtsi2ss        sse42,dword560
        divss   sse40,sse42
        mov     dword562,8
        add     dword562,dword866
        add     dword562,4
        addss   sse40,dword ptr [dword562]
        movss   sse101,sse40
        mov     dword567,dword871
        sub     dword567,dword870
        cvtsi2ss        sse43,dword567
        movss   sse44,sse100
        subss   sse44,sse98
        divss   sse44,sse43
        movss   sse102,sse44
        mov     dword573,dword871
        sub     dword573,dword870
        cvtsi2ss        sse45,dword573
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
        mov     dword631,dword872
        mov     dword875,dword631
        mov     dword630,dword871
        mov     dword874,dword630
        mov     dword629,dword870
        mov     dword873,dword629
        mov     dword635,dword873
        cmp     dword635,dword874
        jg      label0019
        push_all
        push_arg        sse109,4
        push_arg        sse108,4
        push_arg        sse105,4
        push_arg        sse104,4
        push_arg        dword875,4
        push_arg        dword874,4
        push_arg        dword873,4
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
        push_arg        dword875,4
        push_arg        dword873,4
        push_arg        dword874,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword872
        jmp     label0011
label0012:
label0027:
; end of inline function _rasterize_triangle_2i
        inc     dword865
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp     

end
