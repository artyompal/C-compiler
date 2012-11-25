
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
        movss   sse1,dword ptr [dword75+4]
        mulss   sse1,dword ptr [dword76+16]
        movss   sse2,dword ptr [dword75]
        mulss   sse2,dword ptr [dword76]
        addss   sse2,sse1
        movss   sse3,dword ptr [dword75+8]
        mulss   sse3,dword ptr [dword76+32]
        addss   sse2,sse3
        movss   sse4,dword ptr [dword75+12]
        mulss   sse4,dword ptr [dword76+48]
        addss   sse2,sse4
        movss   dword ptr [dword74],sse2
        movss   sse5,dword ptr [dword75]
        mulss   sse5,dword ptr [dword76+4]
        movss   sse6,dword ptr [dword75+4]
        mulss   sse6,dword ptr [dword76+20]
        addss   sse5,sse6
        movss   sse7,dword ptr [dword75+8]
        mulss   sse7,dword ptr [dword76+36]
        addss   sse5,sse7
        movss   sse8,dword ptr [dword75+12]
        mulss   sse8,dword ptr [dword76+52]
        addss   sse5,sse8
        movss   dword ptr [dword74+4],sse5
        movss   sse9,dword ptr [dword75]
        mulss   sse9,dword ptr [dword76+8]
        movss   sse10,dword ptr [dword75+4]
        mulss   sse10,dword ptr [dword76+24]
        addss   sse9,sse10
        movss   sse11,dword ptr [dword75+8]
        mulss   sse11,dword ptr [dword76+40]
        addss   sse9,sse11
        movss   sse12,dword ptr [dword75+12]
        mulss   sse12,dword ptr [dword76+56]
        addss   sse9,sse12
        movss   dword ptr [dword74+8],sse9
        movss   sse13,dword ptr [dword75]
        mulss   sse13,dword ptr [dword76+12]
        movss   sse14,dword ptr [dword75+4]
        mulss   sse14,dword ptr [dword76+28]
        addss   sse13,sse14
        movss   sse15,dword ptr [dword75+8]
        mulss   sse15,dword ptr [dword76+44]
        addss   sse13,sse15
        movss   sse16,dword ptr [dword75+12]
        mulss   sse16,dword ptr [dword76+60]
        addss   sse13,sse16
        movss   dword ptr [dword74+12],sse13
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
        mov     dword375,(offset __clip_z_near_base)
        movss   sse63,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375],sse63
        movss   sse64,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+4],sse64
        movss   dword ptr [dword375+8],sse189
        movss   sse66,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse66
; end of inline function vec4f_assign
        comiss  sse190,sse189
        jbe     label0000
        movss   sse173,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   sse173,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_z_near_norm)
        movss   sse69,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375],sse69
        movss   sse70,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+4],sse70
        movss   dword ptr [dword375+8],sse173
        movss   sse72,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse72
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_z_far_base)
        movss   sse75,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375],sse75
        movss   sse76,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+4],sse76
        movss   dword ptr [dword375+8],sse190
        movss   sse78,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse78
; end of inline function vec4f_assign
        comiss  sse190,sse189
        jbe     label0002
        movss   sse174,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   sse174,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_z_far_norm)
        movss   sse81,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375],sse81
        movss   sse82,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+4],sse82
        movss   dword ptr [dword375+8],sse174
        movss   sse84,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse84
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        sse26,dword379
        movss   sse27,dword ptr [___unnamed_float_1]
        divss   sse27,sse26
        movss   sse28,dword ptr [___unnamed_float_5]
        addss   sse28,sse27
        mov     dword375,(offset __clip_plane_left_base)
        movss   dword ptr [dword375],sse28
        movss   sse87,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+4],sse87
        movss   sse88,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+8],sse88
        movss   sse89,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse89
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_left_norm)
        movss   sse91,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375],sse91
        movss   sse92,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+4],sse92
        movss   sse93,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+8],sse93
        movss   sse94,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse94
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        sse36,dword379
        movss   sse37,dword ptr [___unnamed_float_1]
        divss   sse37,sse36
        movss   sse38,dword ptr [___unnamed_float_1]
        subss   sse38,sse37
        mov     dword375,(offset __clip_plane_right_base)
        movss   dword ptr [dword375],sse38
        movss   sse97,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+4],sse97
        movss   sse98,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+8],sse98
        movss   sse99,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse99
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_right_norm)
        movss   sse101,dword ptr [___unnamed_float_5]
        movss   dword ptr [dword375],sse101
        movss   sse102,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+4],sse102
        movss   sse103,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+8],sse103
        movss   sse104,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse104
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        sse45,dword380
        movss   sse46,dword ptr [___unnamed_float_1]
        divss   sse46,sse45
        movss   sse47,dword ptr [___unnamed_float_5]
        addss   sse47,sse46
        mov     dword375,(offset __clip_plane_top_base)
        movss   sse106,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375],sse106
        movss   dword ptr [dword375+4],sse47
        movss   sse108,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+8],sse108
        movss   sse109,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse109
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_top_norm)
        movss   sse111,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375],sse111
        movss   sse112,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+4],sse112
        movss   sse113,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+8],sse113
        movss   sse114,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse114
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_bottom_base)
        movss   sse116,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375],sse116
        movss   sse117,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+4],sse117
        movss   sse118,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+8],sse118
        movss   sse119,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse119
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword375,(offset __clip_plane_bottom_norm)
        movss   sse121,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375],sse121
        movss   sse122,dword ptr [___unnamed_float_5]
        movss   dword ptr [dword375+4],sse122
        movss   sse123,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword375+8],sse123
        movss   sse124,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword375+12],sse124
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
        cmp     dword23,0
        je      label0003
        cvtsi2ss        sse1,dword23
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
        cvtsi2ss        sse6,dword50
        mulss   sse6,sse1
        cvtsi2ss        sse7,dword41
        movss   sse8,dword ptr [___unnamed_float_1]
        subss   sse8,sse1
        mulss   sse7,sse8
        addss   sse6,sse7
        cvttss2si       dword64,sse6
        mov     dword68,dword57
        sal     dword68,8
        add     dword68,dword64
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
        mov     dword8,dword376
        add     dword8,24
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
; start of inline function vec4f_subtract
        movss   sse31,dword ptr [dword358]
        subss   sse31,dword ptr [dword377]
        movss   dword ptr [ebp-24],sse31
        movss   sse32,dword ptr [dword358+4]
        subss   sse32,dword ptr [dword377+4]
        movss   dword ptr [ebp-20],sse32
        movss   sse33,dword ptr [dword358+8]
        subss   sse33,dword ptr [dword377+8]
        movss   dword ptr [ebp-16],sse33
        movss   sse34,dword ptr [dword358+12]
        subss   sse34,dword ptr [dword377+12]
        movss   dword ptr [ebp-12],sse34
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse51,dword ptr [ebp-20]
        mulss   sse51,dword ptr [dword378+4]
        movss   sse52,dword ptr [ebp-24]
        mulss   sse52,dword ptr [dword378]
        addss   sse52,sse51
        movss   sse53,dword ptr [ebp-16]
        mulss   sse53,dword ptr [dword378+8]
        addss   sse52,sse53
        movss   sse54,dword ptr [ebp-12]
        mulss   sse54,dword ptr [dword378+12]
        addss   sse52,sse54
; end of inline function vec4f_dot
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse47
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
        comiss  sse4,sse47
        jae     label0006
        movss   sse5,dword ptr [___unnamed_float_2]
        comiss  sse5,sse52
        ja      label0005
label0006:
        movss   sse6,dword ptr [___unnamed_float_2]
        comiss  sse6,sse52
        ja      label0004
        movss   sse7,dword ptr [___unnamed_float_2]
        comiss  sse7,sse47
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
; end of inline function vec4f_dot
        divss   sse8,sse62
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
        movss   sse21,dword ptr [dword357]
        addss   sse21,dword ptr [ebp-40]
        movss   dword ptr [dword375+dword75],sse21
        movss   sse22,dword ptr [dword357+4]
        addss   sse22,dword ptr [ebp-36]
        movss   dword ptr [dword375+dword75+4],sse22
        movss   sse23,dword ptr [dword357+8]
        addss   sse23,dword ptr [ebp-32]
        movss   dword ptr [dword375+dword75+8],sse23
        movss   sse24,dword ptr [dword357+12]
        addss   sse24,dword ptr [ebp-28]
        movss   dword ptr [dword375+dword75+12],sse24
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        movss   sse14,dword ptr [dword358+16]
        subss   sse14,dword ptr [dword357+16]
        movss   dword ptr [ebp-48],sse14
        movss   sse15,dword ptr [dword358+20]
        subss   sse15,dword ptr [dword357+20]
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
        mov     dword91,[dword375+192]
        imul    dword91,24
        movss   sse11,dword ptr [dword357+16]
        addss   sse11,dword ptr [ebp-48]
        movss   dword ptr [dword375+dword91+16],sse11
        movss   sse12,dword ptr [dword357+20]
        addss   sse12,dword ptr [ebp-44]
        movss   dword ptr [dword375+dword91+20],sse12
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

_rasterizer_triangle3f proc
        create_stack_frame
        mov     dword900,[ebp+28]
        mov     dword899,[ebp+24]
        mov     dword898,[ebp+20]
        mov     dword897,[ebp+16]
        mov     dword896,[ebp+12]
        mov     dword895,[ebp+8]
; start of inline function _transform_to_projection_space
        lea     dword2,[ebp-196]
; start of inline function vec4f_assign
        movss   sse84,dword ptr [dword895+8]
        movss   sse83,dword ptr [dword895+4]
        movss   sse82,dword ptr [dword895]
        movss   dword ptr [ebp-716],sse82
        movss   dword ptr [ebp-712],sse83
        movss   dword ptr [ebp-708],sse84
        movss   sse89,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-704],sse89
; end of inline function vec4f_assign
        push_all
        lea     dword800,dword ptr [__mvproj_matrix]
        push_arg        dword800,4
        lea     dword801,[ebp-716]
        push_arg        dword801,4
        push_arg        dword2,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword7,[dword898]
        mov     dword8,[dword898+4]
        mov     [ebp-180],dword7
        mov     [ebp-176],dword8
; start of inline function _transform_to_projection_space
        lea     dword10,[ebp-196]
        add     dword10,24
; start of inline function vec4f_assign
        movss   sse94,dword ptr [dword896+8]
        movss   sse93,dword ptr [dword896+4]
        movss   sse92,dword ptr [dword896]
        movss   dword ptr [ebp-716],sse92
        movss   dword ptr [ebp-712],sse93
        movss   dword ptr [ebp-708],sse94
        movss   sse99,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-704],sse99
; end of inline function vec4f_assign
        push_all
        lea     dword826,dword ptr [__mvproj_matrix]
        push_arg        dword826,4
        lea     dword827,[ebp-716]
        push_arg        dword827,4
        push_arg        dword10,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword17,[dword899]
        mov     dword18,[dword899+4]
        mov     [ebp-156],dword17
        mov     [ebp-152],dword18
; start of inline function _transform_to_projection_space
        lea     dword20,[ebp-196]
        add     dword20,48
; start of inline function vec4f_assign
        movss   sse104,dword ptr [dword897+8]
        movss   sse103,dword ptr [dword897+4]
        movss   sse102,dword ptr [dword897]
        movss   dword ptr [ebp-716],sse102
        movss   dword ptr [ebp-712],sse103
        movss   dword ptr [ebp-708],sse104
        movss   sse109,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-704],sse109
; end of inline function vec4f_assign
        push_all
        lea     dword852,dword ptr [__mvproj_matrix]
        push_arg        dword852,4
        lea     dword853,[ebp-716]
        push_arg        dword853,4
        push_arg        dword20,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword27,[dword900]
        mov     dword28,[dword900+4]
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
        jmp     label002c
label0000:
        cmp     dword ptr [dword38+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword870,0
label0003:
        mov     dword52,[dword38+192]
        cmp     dword52,dword870
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword54,dword38
        mov     dword57,dword870
        imul    dword57,24
        add     dword54,dword57
        lea     dword58,[ebp-332]
        mov     dword61,dword870
        sal     dword61,4
        push_all
        lea     dword756,dword ptr [__viewport_matrix]
        push_arg        dword756,4
        push_arg        dword54,4
        lea     dword758,[ebp-688]
        push_arg        dword758,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        movss   sse77,dword ptr [___unnamed_float_1]
        divss   sse77,dword ptr [ebp-676]
        movss   sse78,dword ptr [ebp-688]
        mulss   sse78,sse77
        cvttss2si       dword765,sse78
        mov     [dword58+dword61],dword765
        movss   sse79,dword ptr [ebp-684]
        mulss   sse79,sse77
        cvttss2si       dword771,sse79
        mov     [dword58+dword61+4],dword771
        cmp     dword ptr [dword58+dword61],0
        jl      label002a
        mov     dword780,[dword58+dword61]
        cmp     dword780,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [dword58+dword61+4],0
        jl      label002a
        mov     dword787,[dword58+dword61+4]
        cmp     dword787,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     dword62,[ebp-332]
        mov     dword65,dword870
        sal     dword65,4
        mov     dword71,dword870
        imul    dword71,24
        mov     dword73,[dword38+dword71+16]
        mov     dword74,[dword38+dword71+20]
        mov     [dword62+dword65+8],dword73
        mov     [dword62+dword65+12],dword74
        inc     dword870
        jmp     label0003
label0004:
        mov     dword870,2
label0006:
        mov     dword81,[dword38+192]
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
        mov     dword101,[dword871+4]
        cmp     dword101,[dword872+4]
        jle     label0008
        mov     dword874,dword871
        mov     dword871,dword872
        mov     dword872,dword874
label0008:
        mov     dword117,[dword871+4]
        cmp     dword117,[dword873+4]
        jle     label0009
        mov     dword874,dword871
        mov     dword871,dword873
        mov     dword873,dword874
label0009:
        mov     dword133,[dword872+4]
        cmp     dword133,[dword873+4]
        jle     label000a
        mov     dword874,dword872
        mov     dword872,dword873
        mov     dword873,dword874
label000a:
        mov     dword149,[dword871+4]
        cmp     dword149,[dword873+4]
        jne     label000b
        cmp     dword ptr [dword871+4],0
        jl      label000c
        mov     dword158,[dword871+4]
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
        mov     dword654,[dword871+4]
        mov     dword653,[dword873]
        mov     dword652,[dword872]
        mov     dword651,[dword871]
        cmp     dword651,dword652
        jge     label001c
        cmp     dword653,dword652
        jle     label001d
        push_all
        push_arg        sse124,4
        push_arg        sse123,4
        push_arg        dword ptr [dword885+4],4
        push_arg        dword ptr [dword885],4
        push_arg        dword654,4
        push_arg        dword653,4
        push_arg        dword651,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        cmp     dword653,dword651
        jge     label001f
        push_all
        push_arg        sse124,4
        push_arg        sse123,4
        push_arg        dword ptr [dword887+4],4
        push_arg        dword ptr [dword887],4
        push_arg        dword654,4
        push_arg        dword652,4
        push_arg        dword653,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        sse124,4
        push_arg        sse123,4
        push_arg        dword ptr [dword885+4],4
        push_arg        dword ptr [dword885],4
        push_arg        dword654,4
        push_arg        dword652,4
        push_arg        dword651,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0020:
label001e:
        jmp     label0021
label001c:
        cmp     dword653,dword652
        jge     label0022
        push_all
        movss   sse69,sse124
        xorps   sse69,dword ptr [___unnamed_float_4]
        push_arg        sse69,4
        movss   sse70,sse123
        xorps   sse70,dword ptr [___unnamed_float_4]
        push_arg        sse70,4
        push_arg        dword ptr [dword887+4],4
        push_arg        dword ptr [dword887],4
        push_arg        dword654,4
        push_arg        dword651,4
        push_arg        dword653,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        cmp     dword653,dword651
        jle     label0024
        push_all
        movss   sse71,sse124
        xorps   sse71,dword ptr [___unnamed_float_4]
        push_arg        sse71,4
        movss   sse72,sse123
        xorps   sse72,dword ptr [___unnamed_float_4]
        push_arg        sse72,4
        push_arg        dword ptr [dword886+4],4
        push_arg        dword ptr [dword886],4
        push_arg        dword654,4
        push_arg        dword653,4
        push_arg        dword652,4
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
        push_arg        dword ptr [dword886+4],4
        push_arg        dword ptr [dword886],4
        push_arg        dword654,4
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
        mov     dword180,[dword871+4]
        mov     dword877,dword180
label000e:
        mov     dword185,[dword872+4]
        cmp     dword185,dword877
        jle     label000f
        mov     dword190,dword877
        sub     dword190,[dword871+4]
        mov     dword195,[dword872]
        sub     dword195,[dword871]
        imul    dword190,dword195
        mov     dword202,[dword872+4]
        sub     dword202,[dword871+4]
        cdq     dword203,dword190
        idiv    dword190,dword202
        add     dword190,[dword871]
        mov     dword211,dword877
        sub     dword211,[dword871+4]
        mov     dword216,[dword873]
        sub     dword216,[dword871]
        imul    dword211,dword216
        mov     dword223,[dword873+4]
        sub     dword223,[dword871+4]
        cdq     dword224,dword211
        idiv    dword211,dword223
        add     dword211,[dword871]
        mov     dword232,dword877
        sub     dword232,[dword871+4]
        cvtsi2ss        sse5,dword232
        movss   sse6,dword ptr [dword872+8]
        subss   sse6,dword ptr [dword871+8]
        mulss   sse5,sse6
        mov     dword243,[dword872+4]
        sub     dword243,[dword871+4]
        cvtsi2ss        sse7,dword243
        divss   sse5,sse7
        addss   sse5,dword ptr [dword871+8]
        mov     dword251,dword877
        sub     dword251,[dword871+4]
        cvtsi2ss        sse8,dword251
        movss   sse9,dword ptr [dword873+8]
        subss   sse9,dword ptr [dword871+8]
        mulss   sse8,sse9
        mov     dword262,[dword873+4]
        sub     dword262,[dword871+4]
        cvtsi2ss        sse10,dword262
        divss   sse8,sse10
        addss   sse8,dword ptr [dword871+8]
        mov     dword270,dword877
        sub     dword270,[dword871+4]
        cvtsi2ss        sse11,dword270
        movss   sse12,dword ptr [dword872+12]
        subss   sse12,dword ptr [dword871+12]
        mulss   sse11,sse12
        mov     dword283,[dword872+4]
        sub     dword283,[dword871+4]
        cvtsi2ss        sse13,dword283
        divss   sse11,sse13
        addss   sse11,dword ptr [dword871+12]
        mov     dword292,dword877
        sub     dword292,[dword871+4]
        cvtsi2ss        sse14,dword292
        movss   sse15,dword ptr [dword873+12]
        subss   sse15,dword ptr [dword871+12]
        mulss   sse14,sse15
        mov     dword305,[dword873+4]
        sub     dword305,[dword871+4]
        cvtsi2ss        sse16,dword305
        divss   sse14,sse16
        addss   sse14,dword ptr [dword871+12]
        mov     dword312,dword211
        sub     dword312,dword190
        cvtsi2ss        sse17,dword312
        movss   sse18,sse8
        subss   sse18,sse5
        divss   sse18,sse17
        mov     dword318,dword211
        sub     dword318,dword190
        cvtsi2ss        sse19,dword318
        movss   sse20,sse14
        subss   sse20,sse11
        divss   sse20,sse19
; start of inline function _rasterize_horiz_line__unordered
        movss   sse122,sse20
        movss   sse121,sse18
        movss   sse120,sse14
        movss   sse119,sse8
        movss   sse118,sse11
        movss   sse117,sse5
        cmp     dword190,dword211
        jg      label0013
        push_all
        push_arg        sse122,4
        push_arg        sse121,4
        push_arg        sse118,4
        push_arg        sse117,4
        push_arg        dword877,4
        push_arg        dword211,4
        push_arg        dword190,4
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
        push_arg        dword877,4
        push_arg        dword190,4
        push_arg        dword211,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword877
        jmp     label000e
label000f:
        mov     dword338,[dword872+4]
        sub     dword338,[dword871+4]
        mov     dword343,[dword873]
        sub     dword343,[dword871]
        imul    dword338,dword343
        mov     dword350,[dword873+4]
        sub     dword350,[dword871+4]
        cdq     dword351,dword338
        idiv    dword338,dword350
        add     dword338,[dword871]
        mov     dword361,[dword872+4]
        sub     dword361,[dword871+4]
        cvtsi2ss        sse21,dword361
        movss   sse22,dword ptr [dword873+8]
        subss   sse22,dword ptr [dword871+8]
        mulss   sse21,sse22
        mov     dword372,[dword873+4]
        sub     dword372,[dword871+4]
        cvtsi2ss        sse23,dword372
        divss   sse21,sse23
        addss   sse21,dword ptr [dword871+8]
        mov     dword382,[dword872+4]
        sub     dword382,[dword871+4]
        cvtsi2ss        sse24,dword382
        movss   sse25,dword ptr [dword873+12]
        subss   sse25,dword ptr [dword871+12]
        mulss   sse24,sse25
        mov     dword395,[dword873+4]
        sub     dword395,[dword871+4]
        cvtsi2ss        sse26,dword395
        divss   sse24,sse26
        addss   sse24,dword ptr [dword871+12]
        movss   sse27,sse21
        subss   sse27,dword ptr [dword872+8]
        mov     dword406,dword338
        sub     dword406,[dword872]
        cvtsi2ss        sse28,dword406
        divss   sse27,sse28
        movss   sse29,sse24
        subss   sse29,dword ptr [dword872+12]
        mov     dword415,dword338
        sub     dword415,[dword872]
        cvtsi2ss        sse30,dword415
        divss   sse29,sse30
; start of inline function _rasterize_horiz_line__unordered
        movss   sse57,dword ptr [dword872+12]
        movss   sse56,dword ptr [dword872+8]
        movss   sse118,sse24
        movss   sse117,sse21
        mov     dword611,[dword872+4]
        mov     dword610,[dword872]
        cmp     dword338,dword610
        jg      label0016
        push_all
        push_arg        sse29,4
        push_arg        sse27,4
        push_arg        sse118,4
        push_arg        sse117,4
        push_arg        dword611,4
        push_arg        dword610,4
        push_arg        dword338,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0017
label0016:
        push_all
        push_arg        sse29,4
        push_arg        sse27,4
        push_arg        sse57,4
        push_arg        sse56,4
        push_arg        dword611,4
        push_arg        dword338,4
        push_arg        dword610,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     dword435,1
        add     dword435,[dword872+4]
        mov     dword877,dword435
label0011:
        mov     dword441,[dword873+4]
        cmp     dword441,dword877
        jle     label0012
        mov     dword446,dword877
        sub     dword446,[dword872+4]
        mov     dword451,[dword873]
        sub     dword451,[dword872]
        imul    dword446,dword451
        mov     dword458,[dword873+4]
        sub     dword458,[dword872+4]
        cdq     dword459,dword446
        idiv    dword446,dword458
        add     dword446,[dword872]
        mov     dword467,dword877
        sub     dword467,[dword871+4]
        mov     dword472,[dword873]
        sub     dword472,[dword871]
        imul    dword467,dword472
        mov     dword479,[dword873+4]
        sub     dword479,[dword871+4]
        cdq     dword480,dword467
        idiv    dword467,dword479
        add     dword467,[dword871]
        mov     dword488,dword877
        sub     dword488,[dword872+4]
        cvtsi2ss        sse31,dword488
        movss   sse32,dword ptr [dword873+8]
        subss   sse32,dword ptr [dword872+8]
        mulss   sse31,sse32
        mov     dword499,[dword873+4]
        sub     dword499,[dword872+4]
        cvtsi2ss        sse33,dword499
        divss   sse31,sse33
        addss   sse31,dword ptr [dword872+8]
        mov     dword507,dword877
        sub     dword507,[dword871+4]
        cvtsi2ss        sse34,dword507
        movss   sse35,dword ptr [dword873+8]
        subss   sse35,dword ptr [dword871+8]
        mulss   sse34,sse35
        mov     dword518,[dword873+4]
        sub     dword518,[dword871+4]
        cvtsi2ss        sse36,dword518
        divss   sse34,sse36
        addss   sse34,dword ptr [dword871+8]
        mov     dword526,dword877
        sub     dword526,[dword872+4]
        cvtsi2ss        sse37,dword526
        movss   sse38,dword ptr [dword873+12]
        subss   sse38,dword ptr [dword872+12]
        mulss   sse37,sse38
        mov     dword539,[dword873+4]
        sub     dword539,[dword872+4]
        cvtsi2ss        sse39,dword539
        divss   sse37,sse39
        addss   sse37,dword ptr [dword872+12]
        mov     dword548,dword877
        sub     dword548,[dword871+4]
        cvtsi2ss        sse40,dword548
        movss   sse41,dword ptr [dword873+12]
        subss   sse41,dword ptr [dword871+12]
        mulss   sse40,sse41
        mov     dword561,[dword873+4]
        sub     dword561,[dword871+4]
        cvtsi2ss        sse42,dword561
        divss   sse40,sse42
        addss   sse40,dword ptr [dword871+12]
        mov     dword568,dword467
        sub     dword568,dword446
        cvtsi2ss        sse43,dword568
        movss   sse44,sse34
        subss   sse44,sse31
        divss   sse44,sse43
        mov     dword574,dword467
        sub     dword574,dword446
        cvtsi2ss        sse45,dword574
        movss   sse46,sse40
        subss   sse46,sse37
        divss   sse46,sse45
; start of inline function _rasterize_horiz_line__unordered
        movss   sse122,sse46
        movss   sse121,sse44
        movss   sse120,sse40
        movss   sse119,sse34
        movss   sse118,sse37
        movss   sse117,sse31
        mov     dword880,dword877
        cmp     dword446,dword467
        jg      label0019
        push_all
        push_arg        sse122,4
        push_arg        sse121,4
        push_arg        sse118,4
        push_arg        sse117,4
        push_arg        dword880,4
        push_arg        dword467,4
        push_arg        dword446,4
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
        push_arg        dword446,4
        push_arg        dword467,4
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
