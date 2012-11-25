
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

_matrix4f_transform proc
        create_stack_frame
        mov     dword76,[ebp+16]
        mov     dword75,[ebp+12]
        mov     dword74,[ebp+8]
        mov     dword2,4
        mov     dword4,16
        movss   sse1,dword ptr [dword2+dword75]
        mulss   sse1,dword ptr [dword4+dword76]
        mov     dword6,dword75
        mov     dword8,dword76
        movss   sse2,dword ptr [dword6]
        mulss   sse2,dword ptr [dword8]
        addss   sse2,sse1
        mov     dword10,8
        mov     dword12,32
        movss   sse3,dword ptr [dword10+dword75]
        mulss   sse3,dword ptr [dword12+dword76]
        addss   sse2,sse3
        mov     dword14,12
        mov     dword16,48
        movss   sse4,dword ptr [dword14+dword75]
        mulss   sse4,dword ptr [dword16+dword76]
        addss   sse2,sse4
        mov     dword18,dword74
        movss   dword ptr [dword18],sse2
        mov     dword20,4
        mov     dword22,dword75
        movss   sse5,dword ptr [dword22]
        mulss   sse5,dword ptr [dword20+dword76]
        mov     dword24,4
        mov     dword26,20
        movss   sse6,dword ptr [dword24+dword75]
        mulss   sse6,dword ptr [dword26+dword76]
        addss   sse5,sse6
        mov     dword28,8
        mov     dword30,36
        movss   sse7,dword ptr [dword28+dword75]
        mulss   sse7,dword ptr [dword30+dword76]
        addss   sse5,sse7
        mov     dword32,12
        mov     dword34,52
        movss   sse8,dword ptr [dword32+dword75]
        mulss   sse8,dword ptr [dword34+dword76]
        addss   sse5,sse8
        mov     dword36,4
        movss   dword ptr [dword36+dword74],sse5
        mov     dword38,8
        mov     dword40,dword75
        movss   sse9,dword ptr [dword40]
        mulss   sse9,dword ptr [dword38+dword76]
        mov     dword42,4
        mov     dword44,24
        movss   sse10,dword ptr [dword42+dword75]
        mulss   sse10,dword ptr [dword44+dword76]
        addss   sse9,sse10
        mov     dword46,8
        mov     dword48,40
        movss   sse11,dword ptr [dword46+dword75]
        mulss   sse11,dword ptr [dword48+dword76]
        addss   sse9,sse11
        mov     dword50,12
        mov     dword52,56
        movss   sse12,dword ptr [dword50+dword75]
        mulss   sse12,dword ptr [dword52+dword76]
        addss   sse9,sse12
        mov     dword54,8
        movss   dword ptr [dword54+dword74],sse9
        mov     dword56,12
        mov     dword58,dword75
        movss   sse13,dword ptr [dword58]
        mulss   sse13,dword ptr [dword56+dword76]
        mov     dword60,4
        mov     dword62,28
        movss   sse14,dword ptr [dword60+dword75]
        mulss   sse14,dword ptr [dword62+dword76]
        addss   sse13,sse14
        mov     dword64,8
        mov     dword66,44
        movss   sse15,dword ptr [dword64+dword75]
        mulss   sse15,dword ptr [dword66+dword76]
        addss   sse13,sse15
        mov     dword68,12
        mov     dword70,60
        movss   sse16,dword ptr [dword68+dword75]
        mulss   sse16,dword ptr [dword70+dword76]
        addss   sse13,sse16
        mov     dword72,12
        movss   dword ptr [dword72+dword74],sse13
        destroy_stack_frame
        ret
_matrix4f_transform endp

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
        movss   sse127,sse191
        movss   sse181,sse127
        movss   sse126,sse190
        movss   sse180,sse126
        movss   sse125,sse189
        movss   sse179,sse125
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
        mov     dword270,4
        movss   sse132,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword270+dword376],sse132
        mov     dword273,8
        movss   sse133,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword273+dword376],sse133
        mov     dword276,12
        movss   sse134,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword276+dword376],sse134
        mov     dword279,16
        movss   sse135,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword279+dword376],sse135
        mov     dword282,20
        movss   sse136,sse179
        divss   sse136,sse183
        movss   dword ptr [dword282+dword376],sse136
        mov     dword286,24
        movss   sse137,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword286+dword376],sse137
        mov     dword289,28
        movss   sse138,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword289+dword376],sse138
        mov     dword292,32
        movss   sse139,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword292+dword376],sse139
        mov     dword295,36
        movss   sse140,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword295+dword376],sse140
        mov     dword298,40
        movss   sse141,sse180
        subss   sse141,sse179
        movss   sse142,sse180
        divss   sse142,sse141
        movss   dword ptr [dword298+dword376],sse142
        mov     dword303,44
        movss   sse143,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword303+dword376],sse143
        mov     dword306,48
        movss   sse144,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword306+dword376],sse144
        mov     dword309,52
        movss   sse145,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword309+dword376],sse145
        mov     dword312,56
        movss   sse146,sse179
        mulss   sse146,sse180
        movss   sse147,sse179
        subss   sse147,sse180
        divss   sse146,sse147
        movss   dword ptr [dword312+dword376],sse146
        mov     dword318,60
        movss   sse148,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword318+dword376],sse148
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   sse150,sse190
        movss   sse188,sse150
        movss   sse149,sse189
        movss   sse187,sse149
        cvtsi2ss        sse3,dword380
        movss   sse186,sse3
        cvtsi2ss        sse4,dword379
        movss   sse185,sse4
        mov     dword377,(offset __viewport_matrix)
        mov     dword322,dword377
        movss   sse153,sse185
        divss   sse153,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword322],sse153
        mov     dword326,4
        movss   sse154,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword326+dword377],sse154
        mov     dword329,8
        movss   sse155,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword329+dword377],sse155
        mov     dword332,12
        movss   sse156,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword332+dword377],sse156
        mov     dword335,16
        movss   sse157,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword335+dword377],sse157
        mov     dword338,20
        movss   sse158,sse186
        xorps   sse158,dword ptr [___unnamed_float_4]
        divss   sse158,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword338+dword377],sse158
        mov     dword342,24
        movss   sse160,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword342+dword377],sse160
        mov     dword345,28
        movss   sse161,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword345+dword377],sse161
        mov     dword348,32
        movss   sse162,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword348+dword377],sse162
        mov     dword351,36
        movss   sse163,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword351+dword377],sse163
        mov     dword354,40
        movss   sse164,sse188
        subss   sse164,sse187
        movss   dword ptr [dword354+dword377],sse164
        mov     dword358,44
        movss   sse165,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword358+dword377],sse165
        mov     dword361,48
        movss   sse167,sse185
        divss   sse167,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword361+dword377],sse167
        mov     dword365,52
        movss   sse169,sse186
        divss   sse169,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword365+dword377],sse169
        mov     dword369,56
        movss   sse170,sse187
        movss   dword ptr [dword369+dword377],sse170
        mov     dword372,60
        movss   sse171,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword372+dword377],sse171
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   sse61,sse189
        movss   sse177,sse61
        mov     dword375,(offset __clip_z_near_base)
        mov     dword104,dword375
        movss   sse63,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword104],sse63
        mov     dword107,4
        movss   sse64,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword107+dword375],sse64
        mov     dword110,8
        movss   sse65,sse177
        movss   dword ptr [dword110+dword375],sse65
        mov     dword113,12
        movss   sse66,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword113+dword375],sse66
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
        movss   sse67,sse173
        movss   sse177,sse67
        mov     dword375,(offset __clip_z_near_norm)
        mov     dword117,dword375
        movss   sse69,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword117],sse69
        mov     dword120,4
        movss   sse70,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword120+dword375],sse70
        mov     dword123,8
        movss   sse71,sse177
        movss   dword ptr [dword123+dword375],sse71
        mov     dword126,12
        movss   sse72,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword126+dword375],sse72
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse73,sse190
        movss   sse177,sse73
        mov     dword375,(offset __clip_z_far_base)
        mov     dword130,dword375
        movss   sse75,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword130],sse75
        mov     dword133,4
        movss   sse76,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword133+dword375],sse76
        mov     dword136,8
        movss   sse77,sse177
        movss   dword ptr [dword136+dword375],sse77
        mov     dword139,12
        movss   sse78,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword139+dword375],sse78
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
        movss   sse79,sse174
        movss   sse177,sse79
        mov     dword375,(offset __clip_z_far_norm)
        mov     dword143,dword375
        movss   sse81,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword143],sse81
        mov     dword146,4
        movss   sse82,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword146+dword375],sse82
        mov     dword149,8
        movss   sse83,sse177
        movss   dword ptr [dword149+dword375],sse83
        mov     dword152,12
        movss   sse84,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword152+dword375],sse84
; end of inline function vec4f_assign
; start of inline function vec4f_assign
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
        mov     dword159,4
        movss   sse87,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword159+dword375],sse87
        mov     dword162,8
        movss   sse88,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword162+dword375],sse88
        mov     dword165,12
        movss   sse89,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword165+dword375],sse89
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_left_norm)
        mov     dword169,dword375
        movss   sse91,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword169],sse91
        mov     dword172,4
        movss   sse92,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword172+dword375],sse92
        mov     dword175,8
        movss   sse93,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword175+dword375],sse93
        mov     dword178,12
        movss   sse94,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword178+dword375],sse94
; end of inline function vec4f_assign
; start of inline function vec4f_assign
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
        mov     dword185,4
        movss   sse97,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword185+dword375],sse97
        mov     dword188,8
        movss   sse98,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword188+dword375],sse98
        mov     dword191,12
        movss   sse99,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword191+dword375],sse99
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_right_norm)
        mov     dword195,dword375
        movss   sse101,dword ptr [___unnamed_float_5]
        movss   dword ptr [dword195],sse101
        mov     dword198,4
        movss   sse102,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword198+dword375],sse102
        mov     dword201,8
        movss   sse103,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword201+dword375],sse103
        mov     dword204,12
        movss   sse104,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword204+dword375],sse104
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        sse45,dword380
        movss   sse46,dword ptr [___unnamed_float_1]
        divss   sse46,sse45
        movss   sse47,dword ptr [___unnamed_float_5]
        addss   sse47,sse46
        movss   sse176,sse47
        mov     dword375,(offset __clip_plane_top_base)
        mov     dword208,dword375
        movss   sse106,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword208],sse106
        mov     dword211,4
        movss   sse107,sse176
        movss   dword ptr [dword211+dword375],sse107
        mov     dword214,8
        movss   sse108,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword214+dword375],sse108
        mov     dword217,12
        movss   sse109,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword217+dword375],sse109
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_top_norm)
        mov     dword221,dword375
        movss   sse111,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword221],sse111
        mov     dword224,4
        movss   sse112,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword224+dword375],sse112
        mov     dword227,8
        movss   sse113,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword227+dword375],sse113
        mov     dword230,12
        movss   sse114,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword230+dword375],sse114
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_bottom_base)
        mov     dword234,dword375
        movss   sse116,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword234],sse116
        mov     dword237,4
        movss   sse117,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword237+dword375],sse117
        mov     dword240,8
        movss   sse118,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword240+dword375],sse118
        mov     dword243,12
        movss   sse119,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword243+dword375],sse119
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_bottom_norm)
        mov     dword247,dword375
        movss   sse121,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword247],sse121
        mov     dword250,4
        movss   sse122,dword ptr [___unnamed_float_5]
        movss   dword ptr [dword250+dword375],sse122
        mov     dword253,8
        movss   sse123,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword253+dword375],sse123
        mov     dword256,12
        movss   sse124,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword256+dword375],sse124
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
        movss   sse12,sse21
        movss   sse19,sse12
        movss   sse11,sse20
        movss   sse18,sse11
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
        mov     dword2,192
        mov     dword ptr [dword2+dword375],0
        mov     dword5,dword376
        mov     dword357,dword5
        mov     dword8,dword376
        add     dword8,24
        mov     dword358,dword8
label0001:
        mov     dword12,192
        mov     dword14,[dword12+dword376]
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
        mov     dword177,4
        mov     dword179,4
        movss   sse27,dword ptr [dword177+dword370]
        subss   sse27,dword ptr [dword179+dword371]
        mov     dword181,4
        movss   dword ptr [dword181+dword369],sse27
        mov     dword183,8
        mov     dword185,8
        movss   sse28,dword ptr [dword183+dword370]
        subss   sse28,dword ptr [dword185+dword371]
        mov     dword187,8
        movss   dword ptr [dword187+dword369],sse28
        mov     dword189,12
        mov     dword191,12
        movss   sse29,dword ptr [dword189+dword370]
        subss   sse29,dword ptr [dword191+dword371]
        mov     dword193,12
        movss   dword ptr [dword193+dword369],sse29
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword271,dword378
        mov     dword373,dword271
        lea     dword23,[ebp-24]
        mov     dword372,dword23
        mov     dword274,4
        mov     dword276,4
        movss   sse46,dword ptr [dword274+dword372]
        mulss   sse46,dword ptr [dword276+dword373]
        mov     dword278,dword372
        mov     dword280,dword373
        movss   sse47,dword ptr [dword278]
        mulss   sse47,dword ptr [dword280]
        addss   sse47,sse46
        mov     dword282,8
        mov     dword284,8
        movss   sse48,dword ptr [dword282+dword372]
        mulss   sse48,dword ptr [dword284+dword373]
        addss   sse47,sse48
        mov     dword286,12
        mov     dword288,12
        movss   sse49,dword ptr [dword286+dword372]
        mulss   sse49,dword ptr [dword288+dword373]
        addss   sse47,sse49
        movss   sse76,sse47
; end of inline function vec4f_dot
        movss   sse1,sse76
        movss   sse72,sse1
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
        mov     dword203,4
        mov     dword205,4
        movss   sse32,dword ptr [dword203+dword370]
        subss   sse32,dword ptr [dword205+dword371]
        mov     dword207,4
        movss   dword ptr [dword207+dword369],sse32
        mov     dword209,8
        mov     dword211,8
        movss   sse33,dword ptr [dword209+dword370]
        subss   sse33,dword ptr [dword211+dword371]
        mov     dword213,8
        movss   dword ptr [dword213+dword369],sse33
        mov     dword215,12
        mov     dword217,12
        movss   sse34,dword ptr [dword215+dword370]
        subss   sse34,dword ptr [dword217+dword371]
        mov     dword219,12
        movss   dword ptr [dword219+dword369],sse34
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword289,dword378
        mov     dword373,dword289
        lea     dword30,[ebp-24]
        mov     dword372,dword30
        mov     dword292,4
        mov     dword294,4
        movss   sse51,dword ptr [dword292+dword372]
        mulss   sse51,dword ptr [dword294+dword373]
        mov     dword296,dword372
        mov     dword298,dword373
        movss   sse52,dword ptr [dword296]
        mulss   sse52,dword ptr [dword298]
        addss   sse52,sse51
        mov     dword300,8
        mov     dword302,8
        movss   sse53,dword ptr [dword300+dword372]
        mulss   sse53,dword ptr [dword302+dword373]
        addss   sse52,sse53
        mov     dword304,12
        mov     dword306,12
        movss   sse54,dword ptr [dword304+dword372]
        mulss   sse54,dword ptr [dword306+dword373]
        addss   sse52,sse54
        movss   sse76,sse52
; end of inline function vec4f_dot
        movss   sse2,sse76
        movss   sse73,sse2
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse72
        ja      label0003
        mov     dword35,192
        mov     dword36,[dword35+dword375]
        inc     dword ptr [dword35+dword375]
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
        mov     dword229,4
        mov     dword231,4
        movss   sse37,dword ptr [dword229+dword370]
        subss   sse37,dword ptr [dword231+dword371]
        mov     dword233,4
        movss   dword ptr [dword233+dword369],sse37
        mov     dword235,8
        mov     dword237,8
        movss   sse38,dword ptr [dword235+dword370]
        subss   sse38,dword ptr [dword237+dword371]
        mov     dword239,8
        movss   dword ptr [dword239+dword369],sse38
        mov     dword241,12
        mov     dword243,12
        movss   sse39,dword ptr [dword241+dword370]
        subss   sse39,dword ptr [dword243+dword371]
        mov     dword245,12
        movss   dword ptr [dword245+dword369],sse39
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
        mov     dword254,4
        mov     dword256,4
        movss   sse42,dword ptr [dword254+dword370]
        subss   sse42,dword ptr [dword256+dword371]
        mov     dword258,4
        movss   dword ptr [dword258+dword369],sse42
        mov     dword260,8
        mov     dword262,8
        movss   sse43,dword ptr [dword260+dword370]
        subss   sse43,dword ptr [dword262+dword371]
        mov     dword264,8
        movss   dword ptr [dword264+dword369],sse43
        mov     dword266,12
        mov     dword268,12
        movss   sse44,dword ptr [dword266+dword370]
        subss   sse44,dword ptr [dword268+dword371]
        mov     dword270,12
        movss   dword ptr [dword270+dword369],sse44
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword307,dword378
        mov     dword373,dword307
        lea     dword63,[ebp-24]
        mov     dword372,dword63
        mov     dword310,4
        mov     dword312,4
        movss   sse56,dword ptr [dword310+dword372]
        mulss   sse56,dword ptr [dword312+dword373]
        mov     dword314,dword372
        mov     dword316,dword373
        movss   sse57,dword ptr [dword314]
        mulss   sse57,dword ptr [dword316]
        addss   sse57,sse56
        mov     dword318,8
        mov     dword320,8
        movss   sse58,dword ptr [dword318+dword372]
        mulss   sse58,dword ptr [dword320+dword373]
        addss   sse57,sse58
        mov     dword322,12
        mov     dword324,12
        movss   sse59,dword ptr [dword322+dword372]
        mulss   sse59,dword ptr [dword324+dword373]
        addss   sse57,sse59
        movss   sse76,sse57
; end of inline function vec4f_dot
        movss   sse8,sse76
; start of inline function vec4f_dot
        mov     dword325,dword378
        mov     dword373,dword325
        lea     dword65,[ebp-40]
        mov     dword372,dword65
        mov     dword328,4
        mov     dword330,4
        movss   sse61,dword ptr [dword328+dword372]
        mulss   sse61,dword ptr [dword330+dword373]
        mov     dword332,dword372
        mov     dword334,dword373
        movss   sse62,dword ptr [dword332]
        mulss   sse62,dword ptr [dword334]
        addss   sse62,sse61
        mov     dword336,8
        mov     dword338,8
        movss   sse63,dword ptr [dword336+dword372]
        mulss   sse63,dword ptr [dword338+dword373]
        addss   sse62,sse63
        mov     dword340,12
        mov     dword342,12
        movss   sse64,dword ptr [dword340+dword372]
        mulss   sse64,dword ptr [dword342+dword373]
        addss   sse62,sse64
        movss   sse76,sse62
; end of inline function vec4f_dot
        movss   sse9,sse76
        divss   sse8,sse9
        movss   sse74,sse8
; start of inline function vec4f_mul
        movss   sse65,sse74
        movss   sse77,sse65
        lea     dword68,[ebp-40]
        mov     dword374,dword68
        mov     dword345,dword374
        movss   sse67,dword ptr [dword345]
        mulss   sse67,sse77
        movss   dword ptr [dword345],sse67
        mov     dword348,4
        movss   sse68,dword ptr [dword348+dword374]
        mulss   sse68,sse77
        movss   dword ptr [dword348+dword374],sse68
        mov     dword351,8
        movss   sse69,dword ptr [dword351+dword374]
        mulss   sse69,sse77
        movss   dword ptr [dword351+dword374],sse69
        mov     dword354,12
        movss   sse70,dword ptr [dword354+dword374]
        mulss   sse70,sse77
        movss   dword ptr [dword354+dword374],sse70
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     dword69,[ebp-40]
        mov     dword368,dword69
        mov     dword71,dword357
        mov     dword367,dword71
        mov     dword73,192
        mov     dword75,[dword73+dword375]
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
        mov     dword151,4
        mov     dword153,4
        movss   sse22,dword ptr [dword151+dword367]
        addss   sse22,dword ptr [dword153+dword368]
        mov     dword155,4
        movss   dword ptr [dword155+dword366],sse22
        mov     dword157,8
        mov     dword159,8
        movss   sse23,dword ptr [dword157+dword367]
        addss   sse23,dword ptr [dword159+dword368]
        mov     dword161,8
        movss   dword ptr [dword161+dword366],sse23
        mov     dword163,12
        mov     dword165,12
        movss   sse24,dword ptr [dword163+dword367]
        addss   sse24,dword ptr [dword165+dword368]
        mov     dword167,12
        movss   dword ptr [dword167+dword366],sse24
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
        mov     dword131,4
        mov     dword133,4
        movss   sse15,dword ptr [dword131+dword363]
        subss   sse15,dword ptr [dword133+dword364]
        mov     dword135,4
        movss   dword ptr [dword135+dword362],sse15
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   sse16,sse74
        movss   sse75,sse16
        lea     dword84,[ebp-48]
        mov     dword365,dword84
        mov     dword138,dword365
        movss   sse18,dword ptr [dword138]
        mulss   sse18,sse75
        movss   dword ptr [dword138],sse18
        mov     dword141,4
        movss   sse19,dword ptr [dword141+dword365]
        mulss   sse19,sse75
        movss   dword ptr [dword141+dword365],sse19
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     dword85,[ebp-48]
        mov     dword361,dword85
        mov     dword87,16
        add     dword87,dword357
        mov     dword360,dword87
        mov     dword89,192
        mov     dword91,[dword89+dword375]
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
        mov     dword118,4
        mov     dword120,4
        movss   sse12,dword ptr [dword118+dword360]
        addss   sse12,dword ptr [dword120+dword361]
        mov     dword122,4
        movss   dword ptr [dword122+dword359],sse12
; end of inline function vec2f_add
        mov     dword96,192
        inc     dword ptr [dword96+dword375]
label0004:
        add     dword357,24
        add     dword358,24
        jmp     label0001
label0002:
        mov     dword100,192
        mov     dword101,[dword100+dword375]
        inc     dword ptr [dword100+dword375]
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

_rasterizer_triangle3f proc
        create_stack_frame
        mov     dword900,[ebp+28]
        mov     dword899,[ebp+24]
        mov     dword898,[ebp+20]
        mov     dword897,[ebp+16]
        mov     dword896,[ebp+12]
        mov     dword895,[ebp+8]
; start of inline function _transform_to_projection_space
        mov     dword790,dword895
        mov     dword893,dword790
        lea     dword2,[ebp-196]
        mov     dword892,dword2
; start of inline function vec4f_assign
        mov     dword794,8
        movss   sse84,dword ptr [dword794+dword893]
        movss   sse128,sse84
        mov     dword796,4
        movss   sse83,dword ptr [dword796+dword893]
        movss   sse127,sse83
        mov     dword798,dword893
        movss   sse82,dword ptr [dword798]
        movss   sse126,sse82
        lea     dword799,[ebp-716]
        mov     dword894,dword799
        mov     dword805,dword894
        movss   sse86,sse126
        movss   dword ptr [dword805],sse86
        mov     dword808,4
        movss   sse87,sse127
        movss   dword ptr [dword808+dword894],sse87
        mov     dword811,8
        movss   sse88,sse128
        movss   dword ptr [dword811+dword894],sse88
        mov     dword814,12
        movss   sse89,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword814+dword894],sse89
; end of inline function vec4f_assign
        push_all
        lea     dword800,dword ptr [__mvproj_matrix]
        push_arg        dword800,4
        lea     dword801,[ebp-716]
        push_arg        dword801,4
        push_arg        dword892,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword6,dword898
        mov     dword7,[dword6]
        mov     dword8,[dword6+4]
        mov     [ebp-180],dword7
        mov     [ebp-176],dword8
; start of inline function _transform_to_projection_space
        mov     dword816,dword896
        mov     dword893,dword816
        lea     dword10,[ebp-196]
        add     dword10,24
        mov     dword892,dword10
; start of inline function vec4f_assign
        mov     dword820,8
        movss   sse94,dword ptr [dword820+dword893]
        movss   sse128,sse94
        mov     dword822,4
        movss   sse93,dword ptr [dword822+dword893]
        movss   sse127,sse93
        mov     dword824,dword893
        movss   sse92,dword ptr [dword824]
        movss   sse126,sse92
        lea     dword825,[ebp-716]
        mov     dword894,dword825
        mov     dword831,dword894
        movss   sse96,sse126
        movss   dword ptr [dword831],sse96
        mov     dword834,4
        movss   sse97,sse127
        movss   dword ptr [dword834+dword894],sse97
        mov     dword837,8
        movss   sse98,sse128
        movss   dword ptr [dword837+dword894],sse98
        mov     dword840,12
        movss   sse99,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword840+dword894],sse99
; end of inline function vec4f_assign
        push_all
        lea     dword826,dword ptr [__mvproj_matrix]
        push_arg        dword826,4
        lea     dword827,[ebp-716]
        push_arg        dword827,4
        push_arg        dword892,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword16,dword899
        mov     dword17,[dword16]
        mov     dword18,[dword16+4]
        mov     [ebp-156],dword17
        mov     [ebp-152],dword18
; start of inline function _transform_to_projection_space
        mov     dword842,dword897
        mov     dword893,dword842
        lea     dword20,[ebp-196]
        add     dword20,48
        mov     dword892,dword20
; start of inline function vec4f_assign
        mov     dword846,8
        movss   sse104,dword ptr [dword846+dword893]
        movss   sse128,sse104
        mov     dword848,4
        movss   sse103,dword ptr [dword848+dword893]
        movss   sse127,sse103
        mov     dword850,dword893
        movss   sse102,dword ptr [dword850]
        movss   sse126,sse102
        lea     dword851,[ebp-716]
        mov     dword894,dword851
        mov     dword857,dword894
        movss   sse106,sse126
        movss   dword ptr [dword857],sse106
        mov     dword860,4
        movss   sse107,sse127
        movss   dword ptr [dword860+dword894],sse107
        mov     dword863,8
        movss   sse108,sse128
        movss   dword ptr [dword863+dword894],sse108
        mov     dword866,12
        movss   sse109,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword866+dword894],sse109
; end of inline function vec4f_assign
        push_all
        lea     dword852,dword ptr [__mvproj_matrix]
        push_arg        dword852,4
        lea     dword853,[ebp-716]
        push_arg        dword853,4
        push_arg        dword892,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword26,dword900
        mov     dword27,[dword26]
        mov     dword28,[dword26+4]
        mov     [ebp-132],dword27
        mov     [ebp-128],dword28
        lea     dword29,[ebp-196]
        add     dword29,72
        lea     dword31,[ebp-196]
        mov     dword32,dword29
        mov     dword33,dword31
        mov     dword34,6
        rep     movsd   dword32,dword33
        mov     dword ptr [ebp-4],4
; start of inline function _rasterize_polygon_4f
        lea     dword38,[ebp-196]
        mov     dword869,dword38
; start of inline function _clip_poligon
        mov     dword725,dword869
        mov     dword888,dword725
        push_all
        lea     dword727,dword ptr [__clip_z_far_norm]
        push_arg        dword727,4
        lea     dword728,dword ptr [__clip_z_far_base]
        push_arg        dword728,4
        push_arg        dword888,4
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
        push_arg        dword888,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword735,dword ptr [__clip_plane_left_norm]
        push_arg        dword735,4
        lea     dword736,dword ptr [__clip_plane_left_base]
        push_arg        dword736,4
        push_arg        dword888,4
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
        push_arg        dword888,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword743,dword ptr [__clip_plane_top_norm]
        push_arg        dword743,4
        lea     dword744,dword ptr [__clip_plane_top_base]
        push_arg        dword744,4
        push_arg        dword888,4
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
        push_arg        dword888,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        mov     dword752,192
        cmp     dword ptr [dword752+dword888],1
        setg    byte8
        movzx   dword754,byte8
        mov     dword889,dword754
; end of inline function _clip_poligon
        mov     dword41,dword889
        cmp     dword41,0
        jne     label0000
        jmp     label002c
label0000:
        mov     dword43,192
        cmp     dword ptr [dword43+dword869],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword870,0
label0003:
        mov     dword50,192
        mov     dword52,[dword50+dword869]
        cmp     dword52,dword870
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword54,dword869
        mov     dword57,dword870
        imul    dword57,24
        add     dword54,dword57
        mov     dword891,dword54
        lea     dword58,[ebp-332]
        mov     dword61,dword870
        sal     dword61,4
        add     dword58,dword61
        mov     dword890,dword58
        push_all
        lea     dword756,dword ptr [__viewport_matrix]
        push_arg        dword756,4
        push_arg        dword891,4
        lea     dword758,[ebp-688]
        push_arg        dword758,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        movss   sse77,dword ptr [___unnamed_float_1]
        divss   sse77,dword ptr [ebp-676]
        movss   sse125,sse77
        movss   sse78,dword ptr [ebp-688]
        mulss   sse78,sse125
        cvttss2si       dword765,sse78
        mov     dword767,dword890
        mov     [dword767],dword765
        movss   sse79,dword ptr [ebp-684]
        mulss   sse79,sse125
        cvttss2si       dword771,sse79
        mov     dword773,4
        mov     [dword773+dword890],dword771
        mov     dword775,dword890
        cmp     dword ptr [dword775],0
        jl      label002a
        mov     dword778,dword890
        mov     dword780,[dword778]
        cmp     dword780,dword ptr [__width]
        jge     label002a
        mov     dword782,4
        cmp     dword ptr [dword782+dword890],0
        jl      label002a
        mov     dword785,4
        mov     dword787,[dword785+dword890]
        cmp     dword787,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     dword62,[ebp-332]
        mov     dword65,dword870
        sal     dword65,4
        mov     dword68,dword869
        mov     dword71,dword870
        imul    dword71,24
        mov     dword73,[dword68+dword71+16]
        mov     dword74,[dword68+dword71+20]
        mov     [dword62+dword65+8],dword73
        mov     [dword62+dword65+12],dword74
        inc     dword870
        jmp     label0003
label0004:
        mov     dword870,2
label0006:
        mov     dword79,192
        mov     dword81,[dword79+dword869]
        dec     dword81
        cmp     dword81,dword870
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     dword83,[ebp-332]
        mov     dword86,dword870
        sal     dword86,4
        add     dword83,dword86
        mov     dword873,dword83
        mov     dword89,dword870
        dec     dword89
        sal     dword89,4
        lea     dword91,[ebp-332]
        add     dword91,dword89
        mov     dword872,dword91
        lea     dword92,[ebp-332]
        mov     dword871,dword92
        mov     dword96,dword871
        mov     dword99,dword872
        mov     dword101,[dword96+4]
        cmp     dword101,[dword99+4]
        jle     label0008
        mov     dword104,dword871
        mov     dword874,dword104
        mov     dword107,dword872
        mov     dword871,dword107
        mov     dword110,dword874
        mov     dword872,dword110
label0008:
        mov     dword112,dword871
        mov     dword115,dword873
        mov     dword117,[dword112+4]
        cmp     dword117,[dword115+4]
        jle     label0009
        mov     dword120,dword871
        mov     dword874,dword120
        mov     dword123,dword873
        mov     dword871,dword123
        mov     dword126,dword874
        mov     dword873,dword126
label0009:
        mov     dword128,dword872
        mov     dword131,dword873
        mov     dword133,[dword128+4]
        cmp     dword133,[dword131+4]
        jle     label000a
        mov     dword136,dword872
        mov     dword874,dword136
        mov     dword139,dword873
        mov     dword872,dword139
        mov     dword142,dword874
        mov     dword873,dword142
label000a:
        mov     dword144,dword871
        mov     dword147,dword873
        mov     dword149,[dword144+4]
        cmp     dword149,[dword147+4]
        jne     label000b
        mov     dword151,dword871
        cmp     dword ptr [dword151+4],0
        jl      label000c
        mov     dword155,dword871
        mov     dword158,[dword155+4]
        cmp     dword158,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   sse124,dword ptr [___unnamed_float_2]
        movss   sse123,dword ptr [___unnamed_float_2]
        mov     dword162,8
        add     dword162,dword873
        mov     dword887,dword162
        mov     dword164,8
        add     dword164,dword872
        mov     dword886,dword164
        mov     dword166,8
        add     dword166,dword871
        mov     dword885,dword166
        mov     dword168,dword871
        mov     dword654,[dword168+4]
        mov     dword884,dword654
        mov     dword171,dword873
        mov     dword653,[dword171]
        mov     dword883,dword653
        mov     dword173,dword872
        mov     dword652,[dword173]
        mov     dword882,dword652
        mov     dword175,dword871
        mov     dword651,[dword175]
        mov     dword881,dword651
        mov     dword658,dword881
        cmp     dword658,dword882
        jge     label001c
        mov     dword661,dword883
        cmp     dword661,dword882
        jle     label001d
        push_all
        push_arg        sse124,4
        push_arg        sse123,4
        mov     dword665,4
        push_arg        dword ptr [dword665+dword885],4
        mov     dword667,dword885
        push_arg        dword ptr [dword667],4
        push_arg        dword884,4
        push_arg        dword883,4
        push_arg        dword881,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        mov     dword673,dword883
        cmp     dword673,dword881
        jge     label001f
        push_all
        push_arg        sse124,4
        push_arg        sse123,4
        mov     dword677,4
        push_arg        dword ptr [dword677+dword887],4
        mov     dword679,dword887
        push_arg        dword ptr [dword679],4
        push_arg        dword884,4
        push_arg        dword882,4
        push_arg        dword883,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        sse124,4
        push_arg        sse123,4
        mov     dword686,4
        push_arg        dword ptr [dword686+dword885],4
        mov     dword688,dword885
        push_arg        dword ptr [dword688],4
        push_arg        dword884,4
        push_arg        dword882,4
        push_arg        dword881,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0020:
label001e:
        jmp     label0021
label001c:
        mov     dword694,dword883
        cmp     dword694,dword882
        jge     label0022
        push_all
        movss   sse69,sse124
        xorps   sse69,dword ptr [___unnamed_float_4]
        push_arg        sse69,4
        movss   sse70,sse123
        xorps   sse70,dword ptr [___unnamed_float_4]
        push_arg        sse70,4
        mov     dword698,4
        push_arg        dword ptr [dword698+dword887],4
        mov     dword700,dword887
        push_arg        dword ptr [dword700],4
        push_arg        dword884,4
        push_arg        dword881,4
        push_arg        dword883,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        mov     dword706,dword883
        cmp     dword706,dword881
        jle     label0024
        push_all
        movss   sse71,sse124
        xorps   sse71,dword ptr [___unnamed_float_4]
        push_arg        sse71,4
        movss   sse72,sse123
        xorps   sse72,dword ptr [___unnamed_float_4]
        push_arg        sse72,4
        mov     dword710,4
        push_arg        dword ptr [dword710+dword886],4
        mov     dword712,dword886
        push_arg        dword ptr [dword712],4
        push_arg        dword884,4
        push_arg        dword883,4
        push_arg        dword882,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0025
label0024:
        push_all
        movss   sse73,sse124
        xorps   sse73,dword ptr [___unnamed_float_4]
        push_arg        sse73,4
        movss   sse74,sse123
        xorps   sse74,dword ptr [___unnamed_float_4]
        push_arg        sse74,4
        mov     dword719,4
        push_arg        dword ptr [dword719+dword886],4
        mov     dword721,dword886
        push_arg        dword ptr [dword721],4
        push_arg        dword884,4
        push_arg        dword881,4
        push_arg        dword882,4
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
        mov     dword177,dword871
        mov     dword180,[dword177+4]
        mov     dword877,dword180
label000e:
        mov     dword182,dword872
        mov     dword185,[dword182+4]
        cmp     dword185,dword877
        jle     label000f
        mov     dword187,dword871
        mov     dword190,dword877
        sub     dword190,[dword187+4]
        mov     dword192,dword872
        mov     dword194,dword871
        mov     dword195,[dword192]
        sub     dword195,[dword194]
        imul    dword190,dword195
        mov     dword197,dword872
        mov     dword200,dword871
        mov     dword202,[dword197+4]
        sub     dword202,[dword200+4]
        cdq     dword203,dword190
        idiv    dword190,dword202
        mov     dword205,dword871
        add     dword190,[dword205]
        mov     dword875,dword190
        mov     dword208,dword871
        mov     dword211,dword877
        sub     dword211,[dword208+4]
        mov     dword213,dword873
        mov     dword215,dword871
        mov     dword216,[dword213]
        sub     dword216,[dword215]
        imul    dword211,dword216
        mov     dword218,dword873
        mov     dword221,dword871
        mov     dword223,[dword218+4]
        sub     dword223,[dword221+4]
        cdq     dword224,dword211
        idiv    dword211,dword223
        mov     dword226,dword871
        add     dword211,[dword226]
        mov     dword876,dword211
        mov     dword229,dword871
        mov     dword232,dword877
        sub     dword232,[dword229+4]
        cvtsi2ss        sse5,dword232
        mov     dword234,8
        mov     dword236,8
        movss   sse6,dword ptr [dword234+dword872]
        subss   sse6,dword ptr [dword236+dword871]
        mulss   sse5,sse6
        mov     dword238,dword872
        mov     dword241,dword871
        mov     dword243,[dword238+4]
        sub     dword243,[dword241+4]
        cvtsi2ss        sse7,dword243
        divss   sse5,sse7
        mov     dword245,8
        addss   sse5,dword ptr [dword245+dword871]
        movss   sse111,sse5
        mov     dword248,dword871
        mov     dword251,dword877
        sub     dword251,[dword248+4]
        cvtsi2ss        sse8,dword251
        mov     dword253,8
        mov     dword255,8
        movss   sse9,dword ptr [dword253+dword873]
        subss   sse9,dword ptr [dword255+dword871]
        mulss   sse8,sse9
        mov     dword257,dword873
        mov     dword260,dword871
        mov     dword262,[dword257+4]
        sub     dword262,[dword260+4]
        cvtsi2ss        sse10,dword262
        divss   sse8,sse10
        mov     dword264,8
        addss   sse8,dword ptr [dword264+dword871]
        movss   sse113,sse8
        mov     dword267,dword871
        mov     dword270,dword877
        sub     dword270,[dword267+4]
        cvtsi2ss        sse11,dword270
        mov     dword272,8
        mov     dword275,8
        movss   sse12,dword ptr [dword272+dword872+4]
        subss   sse12,dword ptr [dword275+dword871+4]
        mulss   sse11,sse12
        mov     dword278,dword872
        mov     dword281,dword871
        mov     dword283,[dword278+4]
        sub     dword283,[dword281+4]
        cvtsi2ss        sse13,dword283
        divss   sse11,sse13
        mov     dword285,8
        addss   sse11,dword ptr [dword285+dword871+4]
        movss   sse112,sse11
        mov     dword289,dword871
        mov     dword292,dword877
        sub     dword292,[dword289+4]
        cvtsi2ss        sse14,dword292
        mov     dword294,8
        mov     dword297,8
        movss   sse15,dword ptr [dword294+dword873+4]
        subss   sse15,dword ptr [dword297+dword871+4]
        mulss   sse14,sse15
        mov     dword300,dword873
        mov     dword303,dword871
        mov     dword305,[dword300+4]
        sub     dword305,[dword303+4]
        cvtsi2ss        sse16,dword305
        divss   sse14,sse16
        mov     dword307,8
        addss   sse14,dword ptr [dword307+dword871+4]
        movss   sse114,sse14
        mov     dword312,dword876
        sub     dword312,dword875
        cvtsi2ss        sse17,dword312
        movss   sse18,sse113
        subss   sse18,sse111
        divss   sse18,sse17
        movss   sse115,sse18
        mov     dword318,dword876
        sub     dword318,dword875
        cvtsi2ss        sse19,dword318
        movss   sse20,sse114
        subss   sse20,sse112
        divss   sse20,sse19
        movss   sse116,sse20
; start of inline function _rasterize_horiz_line__unordered
        movss   sse52,sse116
        movss   sse122,sse52
        movss   sse51,sse115
        movss   sse121,sse51
        movss   sse50,sse114
        movss   sse120,sse50
        movss   sse49,sse113
        movss   sse119,sse49
        movss   sse48,sse112
        movss   sse118,sse48
        movss   sse47,sse111
        movss   sse117,sse47
        mov     dword590,dword877
        mov     dword880,dword590
        mov     dword589,dword876
        mov     dword879,dword589
        mov     dword588,dword875
        mov     dword878,dword588
        mov     dword594,dword878
        cmp     dword594,dword879
        jg      label0013
        push_all
        push_arg        sse122,4
        push_arg        sse121,4
        push_arg        sse118,4
        push_arg        sse117,4
        push_arg        dword880,4
        push_arg        dword879,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0014
label0013:
        push_all
        push_arg        sse122,4
        push_arg        sse121,4
        push_arg        sse120,4
        push_arg        sse119,4
        push_arg        dword880,4
        push_arg        dword878,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword877
        jmp     label000e
label000f:
        mov     dword333,dword872
        mov     dword336,dword871
        mov     dword338,[dword333+4]
        sub     dword338,[dword336+4]
        mov     dword340,dword873
        mov     dword342,dword871
        mov     dword343,[dword340]
        sub     dword343,[dword342]
        imul    dword338,dword343
        mov     dword345,dword873
        mov     dword348,dword871
        mov     dword350,[dword345+4]
        sub     dword350,[dword348+4]
        cdq     dword351,dword338
        idiv    dword338,dword350
        mov     dword353,dword871
        add     dword338,[dword353]
        mov     dword876,dword338
        mov     dword356,dword872
        mov     dword359,dword871
        mov     dword361,[dword356+4]
        sub     dword361,[dword359+4]
        cvtsi2ss        sse21,dword361
        mov     dword363,8
        mov     dword365,8
        movss   sse22,dword ptr [dword363+dword873]
        subss   sse22,dword ptr [dword365+dword871]
        mulss   sse21,sse22
        mov     dword367,dword873
        mov     dword370,dword871
        mov     dword372,[dword367+4]
        sub     dword372,[dword370+4]
        cvtsi2ss        sse23,dword372
        divss   sse21,sse23
        mov     dword374,8
        addss   sse21,dword ptr [dword374+dword871]
        movss   sse113,sse21
        mov     dword377,dword872
        mov     dword380,dword871
        mov     dword382,[dword377+4]
        sub     dword382,[dword380+4]
        cvtsi2ss        sse24,dword382
        mov     dword384,8
        mov     dword387,8
        movss   sse25,dword ptr [dword384+dword873+4]
        subss   sse25,dword ptr [dword387+dword871+4]
        mulss   sse24,sse25
        mov     dword390,dword873
        mov     dword393,dword871
        mov     dword395,[dword390+4]
        sub     dword395,[dword393+4]
        cvtsi2ss        sse26,dword395
        divss   sse24,sse26
        mov     dword397,8
        addss   sse24,dword ptr [dword397+dword871+4]
        movss   sse114,sse24
        mov     dword401,8
        movss   sse27,sse113
        subss   sse27,dword ptr [dword401+dword872]
        mov     dword404,dword872
        mov     dword406,dword876
        sub     dword406,[dword404]
        cvtsi2ss        sse28,dword406
        divss   sse27,sse28
        movss   sse115,sse27
        mov     dword409,8
        movss   sse29,sse114
        subss   sse29,dword ptr [dword409+dword872+4]
        mov     dword413,dword872
        mov     dword415,dword876
        sub     dword415,[dword413]
        cvtsi2ss        sse30,dword415
        divss   sse29,sse30
        movss   sse116,sse29
; start of inline function _rasterize_horiz_line__unordered
        movss   sse59,sse116
        movss   sse122,sse59
        movss   sse58,sse115
        movss   sse121,sse58
        mov     dword420,8
        movss   sse57,dword ptr [dword420+dword872+4]
        movss   sse120,sse57
        mov     dword423,8
        movss   sse56,dword ptr [dword423+dword872]
        movss   sse119,sse56
        movss   sse55,sse114
        movss   sse118,sse55
        movss   sse54,sse113
        movss   sse117,sse54
        mov     dword427,dword872
        mov     dword611,[dword427+4]
        mov     dword880,dword611
        mov     dword430,dword872
        mov     dword610,[dword430]
        mov     dword879,dword610
        mov     dword609,dword876
        mov     dword878,dword609
        mov     dword615,dword878
        cmp     dword615,dword879
        jg      label0016
        push_all
        push_arg        sse122,4
        push_arg        sse121,4
        push_arg        sse118,4
        push_arg        sse117,4
        push_arg        dword880,4
        push_arg        dword879,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0017
label0016:
        push_all
        push_arg        sse122,4
        push_arg        sse121,4
        push_arg        sse120,4
        push_arg        sse119,4
        push_arg        dword880,4
        push_arg        dword878,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     dword433,dword872
        mov     dword435,1
        add     dword435,[dword433+4]
        mov     dword877,dword435
label0011:
        mov     dword438,dword873
        mov     dword441,[dword438+4]
        cmp     dword441,dword877
        jle     label0012
        mov     dword443,dword872
        mov     dword446,dword877
        sub     dword446,[dword443+4]
        mov     dword448,dword873
        mov     dword450,dword872
        mov     dword451,[dword448]
        sub     dword451,[dword450]
        imul    dword446,dword451
        mov     dword453,dword873
        mov     dword456,dword872
        mov     dword458,[dword453+4]
        sub     dword458,[dword456+4]
        cdq     dword459,dword446
        idiv    dword446,dword458
        mov     dword461,dword872
        add     dword446,[dword461]
        mov     dword875,dword446
        mov     dword464,dword871
        mov     dword467,dword877
        sub     dword467,[dword464+4]
        mov     dword469,dword873
        mov     dword471,dword871
        mov     dword472,[dword469]
        sub     dword472,[dword471]
        imul    dword467,dword472
        mov     dword474,dword873
        mov     dword477,dword871
        mov     dword479,[dword474+4]
        sub     dword479,[dword477+4]
        cdq     dword480,dword467
        idiv    dword467,dword479
        mov     dword482,dword871
        add     dword467,[dword482]
        mov     dword876,dword467
        mov     dword485,dword872
        mov     dword488,dword877
        sub     dword488,[dword485+4]
        cvtsi2ss        sse31,dword488
        mov     dword490,8
        mov     dword492,8
        movss   sse32,dword ptr [dword490+dword873]
        subss   sse32,dword ptr [dword492+dword872]
        mulss   sse31,sse32
        mov     dword494,dword873
        mov     dword497,dword872
        mov     dword499,[dword494+4]
        sub     dword499,[dword497+4]
        cvtsi2ss        sse33,dword499
        divss   sse31,sse33
        mov     dword501,8
        addss   sse31,dword ptr [dword501+dword872]
        movss   sse111,sse31
        mov     dword504,dword871
        mov     dword507,dword877
        sub     dword507,[dword504+4]
        cvtsi2ss        sse34,dword507
        mov     dword509,8
        mov     dword511,8
        movss   sse35,dword ptr [dword509+dword873]
        subss   sse35,dword ptr [dword511+dword871]
        mulss   sse34,sse35
        mov     dword513,dword873
        mov     dword516,dword871
        mov     dword518,[dword513+4]
        sub     dword518,[dword516+4]
        cvtsi2ss        sse36,dword518
        divss   sse34,sse36
        mov     dword520,8
        addss   sse34,dword ptr [dword520+dword871]
        movss   sse113,sse34
        mov     dword523,dword872
        mov     dword526,dword877
        sub     dword526,[dword523+4]
        cvtsi2ss        sse37,dword526
        mov     dword528,8
        mov     dword531,8
        movss   sse38,dword ptr [dword528+dword873+4]
        subss   sse38,dword ptr [dword531+dword872+4]
        mulss   sse37,sse38
        mov     dword534,dword873
        mov     dword537,dword872
        mov     dword539,[dword534+4]
        sub     dword539,[dword537+4]
        cvtsi2ss        sse39,dword539
        divss   sse37,sse39
        mov     dword541,8
        addss   sse37,dword ptr [dword541+dword872+4]
        movss   sse112,sse37
        mov     dword545,dword871
        mov     dword548,dword877
        sub     dword548,[dword545+4]
        cvtsi2ss        sse40,dword548
        mov     dword550,8
        mov     dword553,8
        movss   sse41,dword ptr [dword550+dword873+4]
        subss   sse41,dword ptr [dword553+dword871+4]
        mulss   sse40,sse41
        mov     dword556,dword873
        mov     dword559,dword871
        mov     dword561,[dword556+4]
        sub     dword561,[dword559+4]
        cvtsi2ss        sse42,dword561
        divss   sse40,sse42
        mov     dword563,8
        addss   sse40,dword ptr [dword563+dword871+4]
        movss   sse114,sse40
        mov     dword568,dword876
        sub     dword568,dword875
        cvtsi2ss        sse43,dword568
        movss   sse44,sse113
        subss   sse44,sse111
        divss   sse44,sse43
        movss   sse115,sse44
        mov     dword574,dword876
        sub     dword574,dword875
        cvtsi2ss        sse45,dword574
        movss   sse46,sse114
        subss   sse46,sse112
        divss   sse46,sse45
        movss   sse116,sse46
; start of inline function _rasterize_horiz_line__unordered
        movss   sse66,sse116
        movss   sse122,sse66
        movss   sse65,sse115
        movss   sse121,sse65
        movss   sse64,sse114
        movss   sse120,sse64
        movss   sse63,sse113
        movss   sse119,sse63
        movss   sse62,sse112
        movss   sse118,sse62
        movss   sse61,sse111
        movss   sse117,sse61
        mov     dword632,dword877
        mov     dword880,dword632
        mov     dword631,dword876
        mov     dword879,dword631
        mov     dword630,dword875
        mov     dword878,dword630
        mov     dword636,dword878
        cmp     dword636,dword879
        jg      label0019
        push_all
        push_arg        sse122,4
        push_arg        sse121,4
        push_arg        sse118,4
        push_arg        sse117,4
        push_arg        dword880,4
        push_arg        dword879,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001a
label0019:
        push_all
        push_arg        sse122,4
        push_arg        sse121,4
        push_arg        sse120,4
        push_arg        sse119,4
        push_arg        dword880,4
        push_arg        dword878,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword877
        jmp     label0011
label0012:
label0027:
; end of inline function _rasterize_triangle_2i
        inc     dword870
        jmp     label0006
label0007:
label002c:
; end of inline function _rasterize_polygon_4f
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp

end
