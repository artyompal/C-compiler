
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
        mov     dword ptr [__dbgprintf],dword378
        mov     dword ptr [__width],dword379
        mov     dword ptr [__height],dword380
        mov     dword ptr [__pitch],dword381
; start of inline function matrix4f_make_perspective
        cvtsi2ss        sse1,dword379
        cvtsi2ss        sse2,dword380
        divss   sse1,sse2
        mov     dword376,(offset __mvproj_matrix)
        movss   sse129,sse191
        mulss   sse129,sse189
        movss   sse130,sse129
        mulss   sse130,sse1
        movss   sse131,sse189
        divss   sse131,sse130
        movss   dword ptr [dword376],sse131
        movss   sse132,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+4],sse132
        movss   sse133,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+8],sse133
        movss   sse134,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+12],sse134
        movss   sse135,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+16],sse135
        movss   sse136,sse189
        divss   sse136,sse129
        movss   dword ptr [dword376+20],sse136
        movss   sse137,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+24],sse137
        movss   sse138,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+28],sse138
        movss   sse139,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+32],sse139
        movss   sse140,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+36],sse140
        movss   sse141,sse190
        subss   sse141,sse189
        movss   sse142,sse190
        divss   sse142,sse141
        movss   dword ptr [dword376+40],sse142
        movss   sse143,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword376+44],sse143
        movss   sse144,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+48],sse144
        movss   sse145,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+52],sse145
        movss   sse146,sse189
        mulss   sse146,sse190
        movss   sse147,sse189
        subss   sse147,sse190
        divss   sse146,sse147
        movss   dword ptr [dword376+56],sse146
        movss   sse148,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword376+60],sse148
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        cvtsi2ss        sse3,dword380
        cvtsi2ss        sse4,dword379
        mov     dword377,(offset __viewport_matrix)
        movss   sse153,sse4
        divss   sse153,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword377],sse153
        movss   sse154,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+4],sse154
        movss   sse155,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+8],sse155
        movss   sse156,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+12],sse156
        movss   sse157,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+16],sse157
        movss   sse158,sse3
        xorps   sse158,dword ptr [___unnamed_float_4]
        divss   sse158,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword377+20],sse158
        movss   sse160,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+24],sse160
        movss   sse161,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+28],sse161
        movss   sse162,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+32],sse162
        movss   sse163,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+36],sse163
        movss   sse164,sse190
        subss   sse164,sse189
        movss   dword ptr [dword377+40],sse164
        movss   sse165,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword377+44],sse165
        movss   sse167,sse4
        divss   sse167,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword377+48],sse167
        movss   sse169,sse3
        divss   sse169,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword377+52],sse169
        movss   dword ptr [dword377+56],sse189
        movss   sse171,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword377+60],sse171
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,sse189
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_z_near_base)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
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
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_z_near_norm)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse173
        movss   dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,sse190
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_z_far_base)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
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
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_z_far_norm)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse174
        movss   dword ptr [dword375+12],sse178
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
        mov     dword375,(offset __clip_plane_left_base)
        movss   dword ptr [dword375],sse28
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_1]
        mov     dword375,(offset __clip_plane_left_norm)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
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
        mov     dword375,(offset __clip_plane_right_base)
        movss   dword ptr [dword375],sse38
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_2]
        movss   sse175,dword ptr [___unnamed_float_5]
        mov     dword375,(offset __clip_plane_right_norm)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        cvtsi2ss        sse45,dword380
        movss   sse46,dword ptr [___unnamed_float_1]
        divss   sse46,sse45
        movss   sse47,dword ptr [___unnamed_float_5]
        addss   sse47,sse46
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_plane_top_base)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse47
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_1]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_plane_top_norm)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_1]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_plane_bottom_base)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse178,dword ptr [___unnamed_float_1]
        movss   sse177,dword ptr [___unnamed_float_2]
        movss   sse176,dword ptr [___unnamed_float_5]
        movss   sse175,dword ptr [___unnamed_float_2]
        mov     dword375,(offset __clip_plane_bottom_norm)
        movss   dword ptr [dword375],sse175
        movss   dword ptr [dword375+4],sse176
        movss   dword ptr [dword375+8],sse177
        movss   dword ptr [dword375+12],sse178
; end of inline function vec4f_assign
        destroy_stack_frame
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        create_stack_frame
        mov     dword5,[ebp+8]
        mov     dword ptr [__videomem],dword5
        destroy_stack_frame
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        create_stack_frame
        mov     dword8,[ebp+8]
        mov     dword4,(offset __mvproj_matrix)
        mov     dword5,dword8
        mov     dword6,16
        rep     movsd   dword4,dword5
        destroy_stack_frame
        ret
_rasterizer_set_mvproj endp

_rasterizer_set_color proc
        create_stack_frame
        mov     dword5,[ebp+8]
        mov     dword ptr [__color],dword5
        destroy_stack_frame
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        create_stack_frame
        mov     dword13,[ebp+16]
        mov     dword12,[ebp+12]
        mov     dword11,[ebp+8]
        mov     dword ptr [__texture_data],dword11
        mov     dword ptr [__texture_width],dword12
        mov     dword ptr [__texture_height],dword13
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
label0000:
; start of inline function _tex2d
        mov     dword85,dword ptr [__texture_width]
        dec     dword85
        cvtsi2ss        sse14,dword85
        mulss   sse14,sse20
        cvttss2si       dword87,sse14
        mov     dword91,dword ptr [__texture_height]
        dec     dword91
        cvtsi2ss        sse15,dword91
        mulss   sse15,sse21
        cvttss2si       dword93,sse15
        mov     dword97,dword93
        imul    dword97,dword ptr [__texture_width]
        add     dword97,dword87
        sal     dword97,2
        add     dword97,dword ptr [__texture_data]
        mov     dword101,[dword97]
; end of inline function _tex2d
        mov     dword23,dword101
        sar     dword23,24
        and     dword23,255
        mov     dword112,dword23
        cmp     dword112,0
        je      label0003
        cvtsi2ss        sse1,dword112
        divss   sse1,dword ptr [___unnamed_float_6]
        mov     dword33,[dword103]
        mov     dword36,dword33
        and     dword36,65280
        sar     dword36,8
        mov     dword41,dword33
        and     dword41,255
        mov     dword45,dword101
        and     dword45,65280
        sar     dword45,8
        mov     dword50,dword101
        and     dword50,255
        cvtsi2ss        sse3,dword45
        mulss   sse3,sse1
        cvtsi2ss        sse4,dword36
        movss   sse5,dword ptr [___unnamed_float_1]
        subss   sse5,sse1
        mulss   sse4,sse5
        addss   sse3,sse4
        cvttss2si       dword57,sse3
        mov     dword107,dword57
        cvtsi2ss        sse6,dword50
        mulss   sse6,sse1
        cvtsi2ss        sse7,dword41
        movss   sse8,dword ptr [___unnamed_float_1]
        subss   sse8,sse1
        mulss   sse7,sse8
        addss   sse6,sse7
        cvttss2si       dword64,sse6
        mov     dword108,dword64
        mov     dword68,dword107
        sal     dword68,8
        add     dword68,dword108
        mov     [dword103],dword68
label0003:
        movss   sse9,sse20
        addss   sse9,sse22
        movss   sse20,sse9
        movss   sse10,sse21
        addss   sse10,sse23
        movss   sse21,sse10
        add     dword103,4
        cmp     dword103,dword11
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
        mov     dword ptr [dword375+192],0
        mov     dword357,dword376
        lea     dword8,[dword376+24]
        mov     dword358,dword8
label0001:
        mov     dword14,[dword376+192]
        imul    dword14,24
        mov     dword16,dword376
        add     dword16,dword14
        cmp     dword16,dword358
        jle     label0002
; start of inline function vec4f_subtract
        movss   sse26,dword ptr [dword357]
        subss   sse26,dword ptr [dword377]
        movss   dword ptr [ebp-24],sse26
        movss   sse27,dword ptr [dword357+4]
        subss   sse27,dword ptr [dword377+4]
        movss   dword ptr [ebp-20],sse27
        movss   sse28,dword ptr [dword357+8]
        subss   sse28,dword ptr [dword377+8]
        movss   dword ptr [ebp-16],sse28
        movss   sse29,dword ptr [dword357+12]
        subss   sse29,dword ptr [dword377+12]
        movss   dword ptr [ebp-12],sse29
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse46,dword ptr [ebp-20]
        mulss   sse46,dword ptr [dword378+4]
        movss   sse47,dword ptr [ebp-24]
        mulss   sse47,dword ptr [dword378]
        addss   sse47,sse46
        movss   sse48,dword ptr [ebp-16]
        mulss   sse48,dword ptr [dword378+8]
        addss   sse47,sse48
        movss   sse49,dword ptr [ebp-12]
        mulss   sse49,dword ptr [dword378+12]
        addss   sse47,sse49
; end of inline function vec4f_dot
        movss   sse72,sse47
; start of inline function vec4f_subtract
        mov     dword371,dword377
        mov     dword370,dword358
        lea     dword28,[ebp-24]
        mov     dword369,dword28
        movss   sse31,dword ptr [dword370]
        subss   sse31,dword ptr [dword371]
        movss   dword ptr [dword369],sse31
        movss   sse32,dword ptr [dword370+4]
        subss   sse32,dword ptr [dword371+4]
        movss   dword ptr [dword369+4],sse32
        movss   sse33,dword ptr [dword370+8]
        subss   sse33,dword ptr [dword371+8]
        movss   dword ptr [dword369+8],sse33
        movss   sse34,dword ptr [dword370+12]
        subss   sse34,dword ptr [dword371+12]
        movss   dword ptr [dword369+12],sse34
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword373,dword378
        lea     dword30,[ebp-24]
        mov     dword372,dword30
        movss   sse51,dword ptr [dword372+4]
        mulss   sse51,dword ptr [dword373+4]
        movss   sse52,dword ptr [dword372]
        mulss   sse52,dword ptr [dword373]
        addss   sse52,sse51
        movss   sse53,dword ptr [dword372+8]
        mulss   sse53,dword ptr [dword373+8]
        addss   sse52,sse53
        movss   sse54,dword ptr [dword372+12]
        mulss   sse54,dword ptr [dword373+12]
        addss   sse52,sse54
        movss   sse76,sse52
; end of inline function vec4f_dot
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse72
        ja      label0003
        mov     dword36,[dword375+192]
        inc     dword ptr [dword375+192]
        imul    dword36,24
        mov     dword39,dword375
        add     dword39,dword36
        mov     dword42,dword39
        mov     dword43,dword357
        mov     dword44,6
        rep     movsd   dword42,dword43
label0003:
        movss   sse4,dword ptr [___unnamed_float_2]
        comiss  sse4,sse72
        jae     label0006
        movss   sse5,dword ptr [___unnamed_float_2]
        comiss  sse5,sse76
        ja      label0005
label0006:
        movss   sse6,dword ptr [___unnamed_float_2]
        comiss  sse6,sse76
        ja      label0004
        movss   sse7,dword ptr [___unnamed_float_2]
        comiss  sse7,sse72
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        movss   sse36,dword ptr [dword377]
        subss   sse36,dword ptr [dword357]
        movss   dword ptr [ebp-24],sse36
        movss   sse37,dword ptr [dword377+4]
        subss   sse37,dword ptr [dword357+4]
        movss   dword ptr [ebp-20],sse37
        movss   sse38,dword ptr [dword377+8]
        subss   sse38,dword ptr [dword357+8]
        movss   dword ptr [ebp-16],sse38
        movss   sse39,dword ptr [dword377+12]
        subss   sse39,dword ptr [dword357+12]
        movss   dword ptr [ebp-12],sse39
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        movss   sse41,dword ptr [dword358]
        subss   sse41,dword ptr [dword357]
        movss   dword ptr [ebp-40],sse41
        movss   sse42,dword ptr [dword358+4]
        subss   sse42,dword ptr [dword357+4]
        movss   dword ptr [ebp-36],sse42
        movss   sse43,dword ptr [dword358+8]
        subss   sse43,dword ptr [dword357+8]
        movss   dword ptr [ebp-32],sse43
        movss   sse44,dword ptr [dword358+12]
        subss   sse44,dword ptr [dword357+12]
        movss   dword ptr [ebp-28],sse44
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse56,dword ptr [ebp-20]
        mulss   sse56,dword ptr [dword378+4]
        movss   sse57,dword ptr [ebp-24]
        mulss   sse57,dword ptr [dword378]
        addss   sse57,sse56
        movss   sse58,dword ptr [ebp-16]
        mulss   sse58,dword ptr [dword378+8]
        addss   sse57,sse58
        movss   sse59,dword ptr [ebp-12]
        mulss   sse59,dword ptr [dword378+12]
        addss   sse57,sse59
; end of inline function vec4f_dot
        movss   sse8,sse57
; start of inline function vec4f_dot
        movss   sse61,dword ptr [ebp-36]
        mulss   sse61,dword ptr [dword378+4]
        movss   sse62,dword ptr [ebp-40]
        mulss   sse62,dword ptr [dword378]
        addss   sse62,sse61
        movss   sse63,dword ptr [ebp-32]
        mulss   sse63,dword ptr [dword378+8]
        addss   sse62,sse63
        movss   sse64,dword ptr [ebp-28]
        mulss   sse64,dword ptr [dword378+12]
        addss   sse62,sse64
        movss   sse76,sse62
; end of inline function vec4f_dot
        divss   sse8,sse76
; start of inline function vec4f_mul
        movss   sse67,dword ptr [ebp-40]
        mulss   sse67,sse8
        movss   dword ptr [ebp-40],sse67
        movss   sse68,dword ptr [ebp-36]
        mulss   sse68,sse8
        movss   dword ptr [ebp-36],sse68
        movss   sse69,dword ptr [ebp-32]
        mulss   sse69,sse8
        movss   dword ptr [ebp-32],sse69
        movss   sse70,dword ptr [ebp-28]
        mulss   sse70,sse8
        movss   dword ptr [ebp-28],sse70
; end of inline function vec4f_mul
; start of inline function vec4f_add
        mov     dword75,[dword375+192]
        imul    dword75,24
        mov     dword77,dword375
        add     dword77,dword75
        movss   sse21,dword ptr [dword357]
        addss   sse21,dword ptr [ebp-40]
        movss   dword ptr [dword77],sse21
        movss   sse22,dword ptr [dword357+4]
        addss   sse22,dword ptr [ebp-36]
        movss   dword ptr [dword77+4],sse22
        movss   sse23,dword ptr [dword357+8]
        addss   sse23,dword ptr [ebp-32]
        movss   dword ptr [dword77+8],sse23
        movss   sse24,dword ptr [dword357+12]
        addss   sse24,dword ptr [ebp-28]
        movss   dword ptr [dword77+12],sse24
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     dword79,dword357
        mov     dword81,dword358
        movss   sse14,dword ptr [dword81+16]
        subss   sse14,dword ptr [dword79+16]
        movss   dword ptr [ebp-48],sse14
        movss   sse15,dword ptr [dword81+20]
        subss   sse15,dword ptr [dword79+20]
        movss   dword ptr [ebp-44],sse15
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   sse18,dword ptr [ebp-48]
        mulss   sse18,sse8
        movss   dword ptr [ebp-48],sse18
        movss   sse19,dword ptr [ebp-44]
        mulss   sse19,sse8
        movss   dword ptr [ebp-44],sse19
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     dword87,dword357
        mov     dword91,[dword375+192]
        imul    dword91,24
        mov     dword93,dword375
        add     dword93,dword91
        add     dword93,16
        movss   sse11,dword ptr [dword87+16]
        addss   sse11,dword ptr [ebp-48]
        movss   dword ptr [dword93],sse11
        movss   sse12,dword ptr [dword87+20]
        addss   sse12,dword ptr [ebp-44]
        movss   dword ptr [dword93+4],sse12
; end of inline function vec2f_add
        inc     dword ptr [dword375+192]
label0004:
        add     dword357,24
        add     dword358,24
        jmp     label0001
label0002:
        mov     dword101,[dword375+192]
        inc     dword ptr [dword375+192]
        imul    dword101,24
        mov     dword104,dword375
        add     dword104,dword101
        mov     dword107,dword104
        mov     dword108,dword375
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
        movss   sse30,dword ptr [dword105+8]
        movss   sse29,dword ptr [dword105+4]
        movss   sse28,dword ptr [dword105]
        movss   dword ptr [ebp-16],sse28
        movss   dword ptr [ebp-12],sse29
        movss   dword ptr [ebp-8],sse30
        movss   dword ptr [ebp-4],sse31
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        mov     dword103,(offset __mvproj_matrix)
        movss   sse11,dword ptr [ebp-12]
        mulss   sse11,dword ptr [dword103+16]
        movss   sse12,dword ptr [ebp-16]
        mulss   sse12,dword ptr [dword103]
        addss   sse12,sse11
        movss   sse13,dword ptr [ebp-8]
        mulss   sse13,dword ptr [dword103+32]
        addss   sse12,sse13
        movss   sse14,dword ptr [ebp-4]
        mulss   sse14,dword ptr [dword103+48]
        addss   sse12,sse14
        movss   dword ptr [dword104],sse12
        movss   sse15,dword ptr [ebp-16]
        mulss   sse15,dword ptr [dword103+4]
        movss   sse16,dword ptr [ebp-12]
        mulss   sse16,dword ptr [dword103+20]
        addss   sse15,sse16
        movss   sse17,dword ptr [ebp-8]
        mulss   sse17,dword ptr [dword103+36]
        addss   sse15,sse17
        movss   sse18,dword ptr [ebp-4]
        mulss   sse18,dword ptr [dword103+52]
        addss   sse15,sse18
        movss   dword ptr [dword104+4],sse15
        movss   sse19,dword ptr [ebp-16]
        mulss   sse19,dword ptr [dword103+8]
        movss   sse20,dword ptr [ebp-12]
        mulss   sse20,dword ptr [dword103+24]
        addss   sse19,sse20
        movss   sse21,dword ptr [ebp-8]
        mulss   sse21,dword ptr [dword103+40]
        addss   sse19,sse21
        movss   sse22,dword ptr [ebp-4]
        mulss   sse22,dword ptr [dword103+56]
        addss   sse19,sse22
        movss   dword ptr [dword104+8],sse19
        movss   sse23,dword ptr [ebp-16]
        mulss   sse23,dword ptr [dword103+12]
        movss   sse24,dword ptr [ebp-12]
        mulss   sse24,dword ptr [dword103+28]
        addss   sse23,sse24
        movss   sse25,dword ptr [ebp-8]
        mulss   sse25,dword ptr [dword103+44]
        addss   sse23,sse25
        movss   sse26,dword ptr [ebp-4]
        mulss   sse26,dword ptr [dword103+60]
        addss   sse23,sse26
        movss   dword ptr [dword104+12],sse23
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
        mov     dword7,[dword894]
        mov     dword8,[dword894+4]
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
        mov     dword17,[dword895]
        mov     dword18,[dword895+4]
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
        mov     dword27,[dword896]
        mov     dword28,[dword896+4]
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
; start of inline function _clip_poligon
        push_all
        lea     dword727,dword ptr [__clip_z_far_norm]
        push_arg        dword727,4
        lea     dword728,dword ptr [__clip_z_far_base]
        push_arg        dword728,4
        push_arg        dword38,4
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
        push_arg        dword38,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword735,dword ptr [__clip_plane_left_norm]
        push_arg        dword735,4
        lea     dword736,dword ptr [__clip_plane_left_base]
        push_arg        dword736,4
        push_arg        dword38,4
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
        push_arg        dword38,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword743,dword ptr [__clip_plane_top_norm]
        push_arg        dword743,4
        lea     dword744,dword ptr [__clip_plane_top_base]
        push_arg        dword744,4
        push_arg        dword38,4
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
        push_arg        dword38,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        cmp     dword ptr [dword38+192],1
        setg    byte8
        movzx   dword754,byte8
; end of inline function _clip_poligon
        cmp     dword754,0
        jne     label0000
        jmp     label002d
label0000:
        cmp     dword ptr [dword38+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword866,0
label0003:
        mov     dword52,[dword38+192]
        cmp     dword52,dword866
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword54,dword38
        mov     dword57,dword866
        imul    dword57,24
        add     dword54,dword57
        lea     dword58,[ebp-332]
        mov     dword61,dword866
        sal     dword61,4
        add     dword58,dword61
        mov     dword886,dword58
; start of inline function matrix4f_transform
        mov     dword890,(offset __viewport_matrix)
        movss   sse81,dword ptr [dword54+4]
        mulss   sse81,dword ptr [dword890+16]
        movss   sse82,dword ptr [dword54]
        mulss   sse82,dword ptr [dword890]
        addss   sse82,sse81
        movss   sse83,dword ptr [dword54+8]
        mulss   sse83,dword ptr [dword890+32]
        addss   sse82,sse83
        movss   sse84,dword ptr [dword54+12]
        mulss   sse84,dword ptr [dword890+48]
        addss   sse82,sse84
        movss   dword ptr [ebp-688],sse82
        movss   sse85,dword ptr [dword54]
        mulss   sse85,dword ptr [dword890+4]
        movss   sse86,dword ptr [dword54+4]
        mulss   sse86,dword ptr [dword890+20]
        addss   sse85,sse86
        movss   sse87,dword ptr [dword54+8]
        mulss   sse87,dword ptr [dword890+36]
        addss   sse85,sse87
        movss   sse88,dword ptr [dword54+12]
        mulss   sse88,dword ptr [dword890+52]
        addss   sse85,sse88
        movss   dword ptr [ebp-684],sse85
        movss   sse89,dword ptr [dword54]
        mulss   sse89,dword ptr [dword890+8]
        movss   sse90,dword ptr [dword54+4]
        mulss   sse90,dword ptr [dword890+24]
        addss   sse89,sse90
        movss   sse91,dword ptr [dword54+8]
        mulss   sse91,dword ptr [dword890+40]
        addss   sse89,sse91
        movss   sse92,dword ptr [dword54+12]
        mulss   sse92,dword ptr [dword890+56]
        addss   sse89,sse92
        movss   dword ptr [ebp-680],sse89
        movss   sse93,dword ptr [dword54]
        mulss   sse93,dword ptr [dword890+12]
        movss   sse94,dword ptr [dword54+4]
        mulss   sse94,dword ptr [dword890+28]
        addss   sse93,sse94
        movss   sse95,dword ptr [dword54+8]
        mulss   sse95,dword ptr [dword890+44]
        addss   sse93,sse95
        movss   sse96,dword ptr [dword54+12]
        mulss   sse96,dword ptr [dword890+60]
        addss   sse93,sse96
        movss   dword ptr [ebp-676],sse93
; end of inline function matrix4f_transform
        lea     dword759,[ebp-688]
        add     dword759,12
        movss   sse77,dword ptr [___unnamed_float_1]
        divss   sse77,dword ptr [dword759]
        movss   sse78,dword ptr [ebp-688]
        mulss   sse78,sse77
        cvttss2si       dword765,sse78
        mov     [dword886],dword765
        lea     dword768,[ebp-688]
        add     dword768,4
        movss   sse79,dword ptr [dword768]
        mulss   sse79,sse77
        cvttss2si       dword771,sse79
        mov     [dword886+4],dword771
        cmp     dword ptr [dword886],0
        jl      label002a
        mov     dword780,[dword886]
        cmp     dword780,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [dword886+4],0
        jl      label002a
        mov     dword787,[dword886+4]
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
        mov     dword68,dword38
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
        mov     dword81,[dword38+192]
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
        mov     dword101,[dword867+4]
        cmp     dword101,[dword868+4]
        jle     label0008
        mov     dword870,dword867
        mov     dword867,dword868
        mov     dword868,dword870
label0008:
        mov     dword117,[dword867+4]
        cmp     dword117,[dword869+4]
        jle     label0009
        mov     dword870,dword867
        mov     dword867,dword869
        mov     dword869,dword870
label0009:
        mov     dword133,[dword868+4]
        cmp     dword133,[dword869+4]
        jle     label000a
        mov     dword870,dword868
        mov     dword868,dword869
        mov     dword869,dword870
label000a:
        mov     dword149,[dword867+4]
        cmp     dword149,[dword869+4]
        jne     label000b
        cmp     dword ptr [dword867+4],0
        jl      label000c
        mov     dword158,[dword867+4]
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
        mov     dword654,[dword867+4]
        mov     dword880,dword654
        mov     dword653,[dword869]
        mov     dword879,dword653
        mov     dword652,[dword868]
        mov     dword651,[dword867]
        cmp     dword651,dword652
        jge     label001c
        cmp     dword879,dword652
        jle     label001d
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        push_arg        dword ptr [dword881+4],4
        push_arg        dword ptr [dword881],4
        push_arg        dword880,4
        push_arg        dword879,4
        push_arg        dword651,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        cmp     dword879,dword651
        jge     label001f
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        push_arg        dword ptr [dword883+4],4
        push_arg        dword ptr [dword883],4
        push_arg        dword880,4
        push_arg        dword652,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        sse111,4
        push_arg        sse110,4
        push_arg        dword ptr [dword881+4],4
        push_arg        dword ptr [dword881],4
        push_arg        dword880,4
        push_arg        dword652,4
        push_arg        dword651,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0020:
label001e:
        jmp     label0021
label001c:
        cmp     dword879,dword652
        jge     label0022
        push_all
        movss   sse69,sse111
        xorps   sse69,dword ptr [___unnamed_float_4]
        push_arg        sse69,4
        movss   sse70,sse110
        xorps   sse70,dword ptr [___unnamed_float_4]
        push_arg        sse70,4
        push_arg        dword ptr [dword883+4],4
        push_arg        dword ptr [dword883],4
        push_arg        dword880,4
        push_arg        dword651,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        cmp     dword879,dword651
        jle     label0024
        push_all
        movss   sse71,sse111
        xorps   sse71,dword ptr [___unnamed_float_4]
        push_arg        sse71,4
        movss   sse72,sse110
        xorps   sse72,dword ptr [___unnamed_float_4]
        push_arg        sse72,4
        push_arg        dword ptr [dword882+4],4
        push_arg        dword ptr [dword882],4
        push_arg        dword880,4
        push_arg        dword879,4
        push_arg        dword652,4
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
        push_arg        dword ptr [dword882+4],4
        push_arg        dword ptr [dword882],4
        push_arg        dword880,4
        push_arg        dword651,4
        push_arg        dword652,4
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
        mov     dword180,[dword867+4]
        mov     dword873,dword180
label000e:
        mov     dword185,[dword868+4]
        cmp     dword185,dword873
        jle     label000f
        mov     dword190,dword873
        sub     dword190,[dword867+4]
        mov     dword195,[dword868]
        sub     dword195,[dword867]
        imul    dword190,dword195
        mov     dword202,[dword868+4]
        sub     dword202,[dword867+4]
        cdq     dword203,dword190
        idiv    dword190,dword202
        add     dword190,[dword867]
        mov     dword871,dword190
        mov     dword211,dword873
        sub     dword211,[dword867+4]
        mov     dword216,[dword869]
        sub     dword216,[dword867]
        imul    dword211,dword216
        mov     dword223,[dword869+4]
        sub     dword223,[dword867+4]
        cdq     dword224,dword211
        idiv    dword211,dword223
        add     dword211,[dword867]
        mov     dword872,dword211
        mov     dword232,dword873
        sub     dword232,[dword867+4]
        cvtsi2ss        sse5,dword232
        movss   sse6,dword ptr [dword868+8]
        subss   sse6,dword ptr [dword867+8]
        mulss   sse5,sse6
        mov     dword243,[dword868+4]
        sub     dword243,[dword867+4]
        cvtsi2ss        sse7,dword243
        divss   sse5,sse7
        addss   sse5,dword ptr [dword867+8]
        movss   sse98,sse5
        mov     dword251,dword873
        sub     dword251,[dword867+4]
        cvtsi2ss        sse8,dword251
        movss   sse9,dword ptr [dword869+8]
        subss   sse9,dword ptr [dword867+8]
        mulss   sse8,sse9
        mov     dword262,[dword869+4]
        sub     dword262,[dword867+4]
        cvtsi2ss        sse10,dword262
        divss   sse8,sse10
        addss   sse8,dword ptr [dword867+8]
        movss   sse100,sse8
        mov     dword270,dword873
        sub     dword270,[dword867+4]
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
        mov     dword283,[dword868+4]
        sub     dword283,[dword867+4]
        cvtsi2ss        sse13,dword283
        divss   sse11,sse13
        mov     dword285,8
        add     dword285,dword867
        add     dword285,4
        addss   sse11,dword ptr [dword285]
        movss   sse99,sse11
        mov     dword292,dword873
        sub     dword292,[dword867+4]
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
        mov     dword305,[dword869+4]
        sub     dword305,[dword867+4]
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
        mov     dword876,dword873
        mov     dword875,dword872
        mov     dword874,dword871
        cmp     dword874,dword875
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
        mov     dword338,[dword868+4]
        sub     dword338,[dword867+4]
        mov     dword343,[dword869]
        sub     dword343,[dword867]
        imul    dword338,dword343
        mov     dword350,[dword869+4]
        sub     dword350,[dword867+4]
        cdq     dword351,dword338
        idiv    dword338,dword350
        add     dword338,[dword867]
        mov     dword872,dword338
        mov     dword361,[dword868+4]
        sub     dword361,[dword867+4]
        cvtsi2ss        sse21,dword361
        movss   sse22,dword ptr [dword869+8]
        subss   sse22,dword ptr [dword867+8]
        mulss   sse21,sse22
        mov     dword372,[dword869+4]
        sub     dword372,[dword867+4]
        cvtsi2ss        sse23,dword372
        divss   sse21,sse23
        addss   sse21,dword ptr [dword867+8]
        movss   sse100,sse21
        mov     dword382,[dword868+4]
        sub     dword382,[dword867+4]
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
        mov     dword395,[dword869+4]
        sub     dword395,[dword867+4]
        cvtsi2ss        sse26,dword395
        divss   sse24,sse26
        mov     dword397,8
        add     dword397,dword867
        add     dword397,4
        addss   sse24,dword ptr [dword397]
        movss   sse101,sse24
        movss   sse27,sse100
        subss   sse27,dword ptr [dword868+8]
        mov     dword406,dword872
        sub     dword406,[dword868]
        cvtsi2ss        sse28,dword406
        divss   sse27,sse28
        movss   sse102,sse27
        mov     dword409,8
        add     dword409,dword868
        add     dword409,4
        movss   sse29,sse101
        subss   sse29,dword ptr [dword409]
        mov     dword415,dword872
        sub     dword415,[dword868]
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
        movss   sse106,dword ptr [dword868+8]
        movss   sse105,sse101
        movss   sse104,sse100
        mov     dword611,[dword868+4]
        mov     dword876,dword611
        mov     dword610,[dword868]
        mov     dword875,dword610
        mov     dword874,dword872
        cmp     dword874,dword875
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
        mov     dword435,1
        add     dword435,[dword868+4]
        mov     dword873,dword435
label0011:
        mov     dword441,[dword869+4]
        cmp     dword441,dword873
        jle     label0012
        mov     dword446,dword873
        sub     dword446,[dword868+4]
        mov     dword451,[dword869]
        sub     dword451,[dword868]
        imul    dword446,dword451
        mov     dword458,[dword869+4]
        sub     dword458,[dword868+4]
        cdq     dword459,dword446
        idiv    dword446,dword458
        add     dword446,[dword868]
        mov     dword871,dword446
        mov     dword467,dword873
        sub     dword467,[dword867+4]
        mov     dword472,[dword869]
        sub     dword472,[dword867]
        imul    dword467,dword472
        mov     dword479,[dword869+4]
        sub     dword479,[dword867+4]
        cdq     dword480,dword467
        idiv    dword467,dword479
        add     dword467,[dword867]
        mov     dword872,dword467
        mov     dword488,dword873
        sub     dword488,[dword868+4]
        cvtsi2ss        sse31,dword488
        movss   sse32,dword ptr [dword869+8]
        subss   sse32,dword ptr [dword868+8]
        mulss   sse31,sse32
        mov     dword499,[dword869+4]
        sub     dword499,[dword868+4]
        cvtsi2ss        sse33,dword499
        divss   sse31,sse33
        addss   sse31,dword ptr [dword868+8]
        movss   sse98,sse31
        mov     dword507,dword873
        sub     dword507,[dword867+4]
        cvtsi2ss        sse34,dword507
        movss   sse35,dword ptr [dword869+8]
        subss   sse35,dword ptr [dword867+8]
        mulss   sse34,sse35
        mov     dword518,[dword869+4]
        sub     dword518,[dword867+4]
        cvtsi2ss        sse36,dword518
        divss   sse34,sse36
        addss   sse34,dword ptr [dword867+8]
        movss   sse100,sse34
        mov     dword526,dword873
        sub     dword526,[dword868+4]
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
        mov     dword539,[dword869+4]
        sub     dword539,[dword868+4]
        cvtsi2ss        sse39,dword539
        divss   sse37,sse39
        mov     dword541,8
        add     dword541,dword868
        add     dword541,4
        addss   sse37,dword ptr [dword541]
        movss   sse99,sse37
        mov     dword548,dword873
        sub     dword548,[dword867+4]
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
        mov     dword561,[dword869+4]
        sub     dword561,[dword867+4]
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
        mov     dword876,dword873
        mov     dword875,dword872
        mov     dword874,dword871
        cmp     dword874,dword875
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
