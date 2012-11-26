
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
___unnamed_float_3      dd      03f000000h
public  ___unnamed_float_3
align 16
___unnamed_float_4      dd      080000000h, 00h, 00h, 00h
public  ___unnamed_float_4
___unnamed_float_5      dd      0bf800000h
public  ___unnamed_float_5
___unnamed_float_6      dd      03b808081h
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
        mulss   sse153,dword ptr [___unnamed_float_3]
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
        mulss   sse158,dword ptr [___unnamed_float_3]
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
        mulss   sse167,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword377+48],sse167
        movss   sse169,sse3
        mulss   sse169,dword ptr [___unnamed_float_3]
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
        mulss   sse1,dword ptr [___unnamed_float_6]
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
        mov     dword372,[ebp+20]
        mov     dword371,[ebp+16]
        mov     dword370,[ebp+12]
        mov     dword369,[ebp+8]
        mov     dword ptr [dword369+192],0
        mov     dword351,dword370
        mov     dword8,dword370
        add     dword8,24
        mov     dword352,dword8
label0001:
        mov     dword14,[dword370+192]
        imul    dword14,24
        mov     dword16,dword370
        add     dword16,dword14
        cmp     dword16,dword352
        jle     label0002
; start of inline function vec4f_subtract
        movss   sse28,dword ptr [dword351]
        subss   sse28,dword ptr [dword371]
        movss   dword ptr [ebp-24],sse28
        movss   sse29,dword ptr [dword351+4]
        subss   sse29,dword ptr [dword371+4]
        movss   dword ptr [ebp-20],sse29
        movss   sse30,dword ptr [dword351+8]
        subss   sse30,dword ptr [dword371+8]
        movss   dword ptr [ebp-16],sse30
        movss   sse31,dword ptr [dword351+12]
        subss   sse31,dword ptr [dword371+12]
        movss   dword ptr [ebp-12],sse31
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse48,dword ptr [ebp-20]
        mulss   sse48,dword ptr [dword372+4]
        movss   sse49,dword ptr [ebp-24]
        mulss   sse49,dword ptr [dword372]
        addss   sse49,sse48
        movss   sse50,dword ptr [ebp-16]
        mulss   sse50,dword ptr [dword372+8]
        addss   sse49,sse50
        movss   sse51,dword ptr [ebp-12]
        mulss   sse51,dword ptr [dword372+12]
        addss   sse49,sse51
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        movss   sse33,dword ptr [dword352]
        subss   sse33,dword ptr [dword371]
        movss   dword ptr [ebp-24],sse33
        movss   sse34,dword ptr [dword352+4]
        subss   sse34,dword ptr [dword371+4]
        movss   dword ptr [ebp-20],sse34
        movss   sse35,dword ptr [dword352+8]
        subss   sse35,dword ptr [dword371+8]
        movss   dword ptr [ebp-16],sse35
        movss   sse36,dword ptr [dword352+12]
        subss   sse36,dword ptr [dword371+12]
        movss   dword ptr [ebp-12],sse36
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse53,dword ptr [ebp-20]
        mulss   sse53,dword ptr [dword372+4]
        movss   sse54,dword ptr [ebp-24]
        mulss   sse54,dword ptr [dword372]
        addss   sse54,sse53
        movss   sse55,dword ptr [ebp-16]
        mulss   sse55,dword ptr [dword372+8]
        addss   sse54,sse55
        movss   sse56,dword ptr [ebp-12]
        mulss   sse56,dword ptr [dword372+12]
        addss   sse54,sse56
; end of inline function vec4f_dot
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse49
        ja      label0003
        mov     dword36,[dword369+192]
        inc     dword ptr [dword369+192]
        imul    dword36,24
        movq    sse4,qword ptr [dword351]
        movq    qword ptr [dword369+dword36],sse4
        movq    sse4,qword ptr [dword351+8]
        movq    qword ptr [dword369+dword36+8],sse4
        movq    sse4,qword ptr [dword351+16]
        movq    qword ptr [dword369+dword36+16],sse4
label0003:
        movss   sse5,dword ptr [___unnamed_float_2]
        comiss  sse5,sse49
        jae     label0006
        movss   sse6,dword ptr [___unnamed_float_2]
        comiss  sse6,sse54
        ja      label0005
label0006:
        movss   sse7,dword ptr [___unnamed_float_2]
        comiss  sse7,sse54
        ja      label0004
        movss   sse8,dword ptr [___unnamed_float_2]
        comiss  sse8,sse49
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        movss   sse38,dword ptr [dword371]
        subss   sse38,dword ptr [dword351]
        movss   dword ptr [ebp-24],sse38
        movss   sse39,dword ptr [dword371+4]
        subss   sse39,dword ptr [dword351+4]
        movss   dword ptr [ebp-20],sse39
        movss   sse40,dword ptr [dword371+8]
        subss   sse40,dword ptr [dword351+8]
        movss   dword ptr [ebp-16],sse40
        movss   sse41,dword ptr [dword371+12]
        subss   sse41,dword ptr [dword351+12]
        movss   dword ptr [ebp-12],sse41
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        movss   sse43,dword ptr [dword352]
        subss   sse43,dword ptr [dword351]
        movss   dword ptr [ebp-40],sse43
        movss   sse44,dword ptr [dword352+4]
        subss   sse44,dword ptr [dword351+4]
        movss   dword ptr [ebp-36],sse44
        movss   sse45,dword ptr [dword352+8]
        subss   sse45,dword ptr [dword351+8]
        movss   dword ptr [ebp-32],sse45
        movss   sse46,dword ptr [dword352+12]
        subss   sse46,dword ptr [dword351+12]
        movss   dword ptr [ebp-28],sse46
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse58,dword ptr [ebp-20]
        mulss   sse58,dword ptr [dword372+4]
        movss   sse59,dword ptr [ebp-24]
        mulss   sse59,dword ptr [dword372]
        addss   sse59,sse58
        movss   sse60,dword ptr [ebp-16]
        mulss   sse60,dword ptr [dword372+8]
        addss   sse59,sse60
        movss   sse61,dword ptr [ebp-12]
        mulss   sse61,dword ptr [dword372+12]
        addss   sse59,sse61
; end of inline function vec4f_dot
        movss   sse9,sse59
; start of inline function vec4f_dot
        movss   sse63,dword ptr [ebp-36]
        mulss   sse63,dword ptr [dword372+4]
        movss   sse64,dword ptr [ebp-40]
        mulss   sse64,dword ptr [dword372]
        addss   sse64,sse63
        movss   sse65,dword ptr [ebp-32]
        mulss   sse65,dword ptr [dword372+8]
        addss   sse64,sse65
        movss   sse66,dword ptr [ebp-28]
        mulss   sse66,dword ptr [dword372+12]
        addss   sse64,sse66
; end of inline function vec4f_dot
        divss   sse9,sse64
; start of inline function vec4f_mul
        movss   sse69,dword ptr [ebp-40]
        mulss   sse69,sse9
        movss   dword ptr [ebp-40],sse69
        movss   sse70,dword ptr [ebp-36]
        mulss   sse70,sse9
        movss   dword ptr [ebp-36],sse70
        movss   sse71,dword ptr [ebp-32]
        mulss   sse71,sse9
        movss   dword ptr [ebp-32],sse71
        movss   sse72,dword ptr [ebp-28]
        mulss   sse72,sse9
        movss   dword ptr [ebp-28],sse72
; end of inline function vec4f_mul
; start of inline function vec4f_add
        mov     dword72,[dword369+192]
        imul    dword72,24
        movss   sse23,dword ptr [dword351]
        addss   sse23,dword ptr [ebp-40]
        movss   dword ptr [dword369+dword72],sse23
        movss   sse24,dword ptr [dword351+4]
        addss   sse24,dword ptr [ebp-36]
        movss   dword ptr [dword369+dword72+4],sse24
        movss   sse25,dword ptr [dword351+8]
        addss   sse25,dword ptr [ebp-32]
        movss   dword ptr [dword369+dword72+8],sse25
        movss   sse26,dword ptr [dword351+12]
        addss   sse26,dword ptr [ebp-28]
        movss   dword ptr [dword369+dword72+12],sse26
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        movss   sse16,dword ptr [dword352+16]
        subss   sse16,dword ptr [dword351+16]
        movss   dword ptr [ebp-48],sse16
        movss   sse17,dword ptr [dword352+20]
        subss   sse17,dword ptr [dword351+20]
        movss   dword ptr [ebp-44],sse17
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   sse20,dword ptr [ebp-48]
        mulss   sse20,sse9
        movss   dword ptr [ebp-48],sse20
        movss   sse21,dword ptr [ebp-44]
        mulss   sse21,sse9
        movss   dword ptr [ebp-44],sse21
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     dword88,[dword369+192]
        imul    dword88,24
        movss   sse13,dword ptr [dword351+16]
        addss   sse13,dword ptr [ebp-48]
        movss   dword ptr [dword369+dword88+16],sse13
        movss   sse14,dword ptr [dword351+20]
        addss   sse14,dword ptr [ebp-44]
        movss   dword ptr [dword369+dword88+20],sse14
; end of inline function vec2f_add
        inc     dword ptr [dword369+192]
label0004:
        add     dword351,24
        add     dword352,24
        jmp     label0001
label0002:
        mov     dword98,[dword369+192]
        inc     dword ptr [dword369+192]
        imul    dword98,24
        movq    sse11,qword ptr [dword369]
        movq    qword ptr [dword369+dword98],sse11
        movq    sse11,qword ptr [dword369+8]
        movq    qword ptr [dword369+dword98+8],sse11
        movq    sse11,qword ptr [dword369+16]
        movq    qword ptr [dword369+dword98+16],sse11
        destroy_stack_frame
        ret
__clip_on_plain endp

_rasterizer_triangle3f proc
        create_stack_frame
        mov     dword889,[ebp+28]
        mov     dword888,[ebp+24]
        mov     dword887,[ebp+20]
        mov     dword886,[ebp+16]
        mov     dword885,[ebp+12]
        mov     dword884,[ebp+8]
; start of inline function _transform_to_projection_space
        lea     dword2,[ebp-196]
; start of inline function vec4f_assign
        movss   sse89,dword ptr [dword884+8]
        movss   sse88,dword ptr [dword884+4]
        movss   sse87,dword ptr [dword884]
        movss   dword ptr [ebp-716],sse87
        movss   dword ptr [ebp-712],sse88
        movss   dword ptr [ebp-708],sse89
        movss   sse94,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-704],sse94
; end of inline function vec4f_assign
        push_all
        lea     dword789,dword ptr [__mvproj_matrix]
        push_arg        dword789,4
        lea     dword790,[ebp-716]
        push_arg        dword790,4
        push_arg        dword2,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        movq    sse1,qword ptr [dword887]
        movq    qword ptr [ebp-180],sse1
; start of inline function _transform_to_projection_space
        lea     dword8,[ebp-196]
        add     dword8,24
; start of inline function vec4f_assign
        movss   sse99,dword ptr [dword885+8]
        movss   sse98,dword ptr [dword885+4]
        movss   sse97,dword ptr [dword885]
        movss   dword ptr [ebp-716],sse97
        movss   dword ptr [ebp-712],sse98
        movss   dword ptr [ebp-708],sse99
        movss   sse104,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-704],sse104
; end of inline function vec4f_assign
        push_all
        lea     dword815,dword ptr [__mvproj_matrix]
        push_arg        dword815,4
        lea     dword816,[ebp-716]
        push_arg        dword816,4
        push_arg        dword8,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        movq    sse2,qword ptr [dword888]
        movq    qword ptr [ebp-156],sse2
; start of inline function _transform_to_projection_space
        lea     dword16,[ebp-196]
        add     dword16,48
; start of inline function vec4f_assign
        movss   sse109,dword ptr [dword886+8]
        movss   sse108,dword ptr [dword886+4]
        movss   sse107,dword ptr [dword886]
        movss   dword ptr [ebp-716],sse107
        movss   dword ptr [ebp-712],sse108
        movss   dword ptr [ebp-708],sse109
        movss   sse114,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-704],sse114
; end of inline function vec4f_assign
        push_all
        lea     dword841,dword ptr [__mvproj_matrix]
        push_arg        dword841,4
        lea     dword842,[ebp-716]
        push_arg        dword842,4
        push_arg        dword16,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        movq    sse3,qword ptr [dword889]
        movq    qword ptr [ebp-132],sse3
        movq    sse4,qword ptr [ebp-196]
        movq    qword ptr [ebp-124],sse4
        movq    sse4,qword ptr [ebp-188]
        movq    qword ptr [ebp-116],sse4
        movq    sse4,qword ptr [ebp-180]
        movq    qword ptr [ebp-108],sse4
        mov     dword ptr [ebp-4],4
; start of inline function _rasterize_polygon_4f
        lea     dword29,[ebp-196]
; start of inline function _clip_poligon
        push_all
        lea     dword716,dword ptr [__clip_z_far_norm]
        push_arg        dword716,4
        lea     dword717,dword ptr [__clip_z_far_base]
        push_arg        dword717,4
        push_arg        dword29,4
        lea     dword719,[ebp-660]
        push_arg        dword719,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword720,dword ptr [__clip_z_near_norm]
        push_arg        dword720,4
        lea     dword721,dword ptr [__clip_z_near_base]
        push_arg        dword721,4
        lea     dword722,[ebp-660]
        push_arg        dword722,4
        push_arg        dword29,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword724,dword ptr [__clip_plane_left_norm]
        push_arg        dword724,4
        lea     dword725,dword ptr [__clip_plane_left_base]
        push_arg        dword725,4
        push_arg        dword29,4
        lea     dword727,[ebp-660]
        push_arg        dword727,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword728,dword ptr [__clip_plane_right_norm]
        push_arg        dword728,4
        lea     dword729,dword ptr [__clip_plane_right_base]
        push_arg        dword729,4
        lea     dword730,[ebp-660]
        push_arg        dword730,4
        push_arg        dword29,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword732,dword ptr [__clip_plane_top_norm]
        push_arg        dword732,4
        lea     dword733,dword ptr [__clip_plane_top_base]
        push_arg        dword733,4
        push_arg        dword29,4
        lea     dword735,[ebp-660]
        push_arg        dword735,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword736,dword ptr [__clip_plane_bottom_norm]
        push_arg        dword736,4
        lea     dword737,dword ptr [__clip_plane_bottom_base]
        push_arg        dword737,4
        lea     dword738,[ebp-660]
        push_arg        dword738,4
        push_arg        dword29,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        cmp     dword ptr [dword29+192],1
        setg    byte8
        movzx   dword743,byte8
; end of inline function _clip_poligon
        cmp     dword743,0
        jne     label0000
        jmp     label002c
label0000:
        cmp     dword ptr [dword29+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword859,0
label0003:
        mov     dword43,[dword29+192]
        cmp     dword43,dword859
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword45,dword29
        mov     dword48,dword859
        imul    dword48,24
        add     dword45,dword48
        lea     dword49,[ebp-332]
        mov     dword52,dword859
        sal     dword52,4
        push_all
        lea     dword745,dword ptr [__viewport_matrix]
        push_arg        dword745,4
        push_arg        dword45,4
        lea     dword747,[ebp-688]
        push_arg        dword747,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        movss   sse82,dword ptr [___unnamed_float_1]
        divss   sse82,dword ptr [ebp-676]
        movss   sse83,dword ptr [ebp-688]
        mulss   sse83,sse82
        cvttss2si       dword754,sse83
        mov     [dword49+dword52],dword754
        movss   sse84,dword ptr [ebp-684]
        mulss   sse84,sse82
        cvttss2si       dword760,sse84
        mov     [dword49+dword52+4],dword760
        cmp     dword ptr [dword49+dword52],0
        jl      label002a
        mov     dword769,[dword49+dword52]
        cmp     dword769,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [dword49+dword52+4],0
        jl      label002a
        mov     dword776,[dword49+dword52+4]
        cmp     dword776,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     dword53,[ebp-332]
        mov     dword56,dword859
        sal     dword56,4
        mov     dword62,dword859
        imul    dword62,24
        movq    sse6,qword ptr [dword29+dword62+16]
        movq    qword ptr [dword53+dword56+8],sse6
        inc     dword859
        jmp     label0003
label0004:
        mov     dword859,2
label0006:
        mov     dword70,[dword29+192]
        dec     dword70
        cmp     dword70,dword859
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     dword72,[ebp-332]
        mov     dword75,dword859
        sal     dword75,4
        add     dword72,dword75
        mov     dword862,dword72
        mov     dword78,dword859
        dec     dword78
        sal     dword78,4
        lea     dword80,[ebp-332]
        add     dword80,dword78
        mov     dword861,dword80
        lea     dword81,[ebp-332]
        mov     dword860,dword81
        mov     dword90,[dword860+4]
        cmp     dword90,[dword861+4]
        jle     label0008
        mov     dword863,dword860
        mov     dword860,dword861
        mov     dword861,dword863
label0008:
        mov     dword106,[dword860+4]
        cmp     dword106,[dword862+4]
        jle     label0009
        mov     dword863,dword860
        mov     dword860,dword862
        mov     dword862,dword863
label0009:
        mov     dword122,[dword861+4]
        cmp     dword122,[dword862+4]
        jle     label000a
        mov     dword863,dword861
        mov     dword861,dword862
        mov     dword862,dword863
label000a:
        mov     dword138,[dword860+4]
        cmp     dword138,[dword862+4]
        jne     label000b
        cmp     dword ptr [dword860+4],0
        jl      label000c
        mov     dword147,[dword860+4]
        cmp     dword147,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   sse129,dword ptr [___unnamed_float_2]
        movss   sse128,dword ptr [___unnamed_float_2]
        mov     dword151,8
        add     dword151,dword862
        mov     dword876,dword151
        mov     dword153,8
        add     dword153,dword861
        mov     dword875,dword153
        mov     dword155,8
        add     dword155,dword860
        mov     dword874,dword155
        mov     dword643,[dword860+4]
        mov     dword873,dword643
        mov     dword642,[dword862]
        mov     dword641,[dword861]
        mov     dword640,[dword860]
        cmp     dword640,dword641
        jge     label001c
        cmp     dword642,dword641
        jle     label001d
        push_all
        push_arg        sse129,4
        push_arg        sse128,4
        push_arg        dword ptr [dword874+4],4
        push_arg        dword ptr [dword874],4
        push_arg        dword873,4
        push_arg        dword642,4
        push_arg        dword640,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        cmp     dword642,dword640
        jge     label001f
        push_all
        push_arg        sse129,4
        push_arg        sse128,4
        push_arg        dword ptr [dword876+4],4
        push_arg        dword ptr [dword876],4
        push_arg        dword873,4
        push_arg        dword641,4
        push_arg        dword642,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        sse129,4
        push_arg        sse128,4
        push_arg        dword ptr [dword874+4],4
        push_arg        dword ptr [dword874],4
        push_arg        dword873,4
        push_arg        dword641,4
        push_arg        dword640,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0020:
label001e:
        jmp     label0021
label001c:
        cmp     dword642,dword641
        jge     label0022
        push_all
        movss   sse74,sse129
        xorps   sse74,dword ptr [___unnamed_float_4]
        push_arg        sse74,4
        movss   sse75,sse128
        xorps   sse75,dword ptr [___unnamed_float_4]
        push_arg        sse75,4
        push_arg        dword ptr [dword876+4],4
        push_arg        dword ptr [dword876],4
        push_arg        dword873,4
        push_arg        dword640,4
        push_arg        dword642,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        cmp     dword642,dword640
        jle     label0024
        push_all
        movss   sse76,sse129
        xorps   sse76,dword ptr [___unnamed_float_4]
        push_arg        sse76,4
        movss   sse77,sse128
        xorps   sse77,dword ptr [___unnamed_float_4]
        push_arg        sse77,4
        push_arg        dword ptr [dword875+4],4
        push_arg        dword ptr [dword875],4
        push_arg        dword873,4
        push_arg        dword642,4
        push_arg        dword641,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0025
label0024:
        push_all
        movss   sse78,sse129
        xorps   sse78,dword ptr [___unnamed_float_4]
        push_arg        sse78,4
        movss   sse79,sse128
        xorps   sse79,dword ptr [___unnamed_float_4]
        push_arg        sse79,4
        push_arg        dword ptr [dword875+4],4
        push_arg        dword ptr [dword875],4
        push_arg        dword873,4
        push_arg        dword640,4
        push_arg        dword641,4
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
        mov     dword169,[dword860+4]
        mov     dword866,dword169
label000e:
        mov     dword174,[dword861+4]
        cmp     dword174,dword866
        jle     label000f
        mov     dword179,dword866
        sub     dword179,[dword860+4]
        mov     dword184,[dword861]
        sub     dword184,[dword860]
        imul    dword179,dword184
        mov     dword191,[dword861+4]
        sub     dword191,[dword860+4]
        cdq     dword192,dword179
        idiv    dword179,dword191
        add     dword179,[dword860]
        mov     dword200,dword866
        sub     dword200,[dword860+4]
        mov     dword205,[dword862]
        sub     dword205,[dword860]
        imul    dword200,dword205
        mov     dword212,[dword862+4]
        sub     dword212,[dword860+4]
        cdq     dword213,dword200
        idiv    dword200,dword212
        add     dword200,[dword860]
        mov     dword221,dword866
        sub     dword221,[dword860+4]
        cvtsi2ss        sse10,dword221
        movss   sse11,dword ptr [dword861+8]
        subss   sse11,dword ptr [dword860+8]
        mulss   sse10,sse11
        mov     dword232,[dword861+4]
        sub     dword232,[dword860+4]
        cvtsi2ss        sse12,dword232
        divss   sse10,sse12
        addss   sse10,dword ptr [dword860+8]
        mov     dword240,dword866
        sub     dword240,[dword860+4]
        cvtsi2ss        sse13,dword240
        movss   sse14,dword ptr [dword862+8]
        subss   sse14,dword ptr [dword860+8]
        mulss   sse13,sse14
        mov     dword251,[dword862+4]
        sub     dword251,[dword860+4]
        cvtsi2ss        sse15,dword251
        divss   sse13,sse15
        addss   sse13,dword ptr [dword860+8]
        mov     dword259,dword866
        sub     dword259,[dword860+4]
        cvtsi2ss        sse16,dword259
        movss   sse17,dword ptr [dword861+12]
        subss   sse17,dword ptr [dword860+12]
        mulss   sse16,sse17
        mov     dword272,[dword861+4]
        sub     dword272,[dword860+4]
        cvtsi2ss        sse18,dword272
        divss   sse16,sse18
        addss   sse16,dword ptr [dword860+12]
        mov     dword281,dword866
        sub     dword281,[dword860+4]
        cvtsi2ss        sse19,dword281
        movss   sse20,dword ptr [dword862+12]
        subss   sse20,dword ptr [dword860+12]
        mulss   sse19,sse20
        mov     dword294,[dword862+4]
        sub     dword294,[dword860+4]
        cvtsi2ss        sse21,dword294
        divss   sse19,sse21
        addss   sse19,dword ptr [dword860+12]
        mov     dword301,dword200
        sub     dword301,dword179
        cvtsi2ss        sse22,dword301
        movss   sse23,sse13
        subss   sse23,sse10
        divss   sse23,sse22
        mov     dword307,dword200
        sub     dword307,dword179
        cvtsi2ss        sse24,dword307
        movss   sse25,sse19
        subss   sse25,sse16
        divss   sse25,sse24
; start of inline function _rasterize_horiz_line__unordered
        movss   sse127,sse25
        movss   sse126,sse23
        movss   sse125,sse19
        movss   sse124,sse13
        movss   sse123,sse16
        movss   sse122,sse10
        cmp     dword179,dword200
        jg      label0013
        push_all
        push_arg        sse127,4
        push_arg        sse126,4
        push_arg        sse123,4
        push_arg        sse122,4
        push_arg        dword866,4
        push_arg        dword200,4
        push_arg        dword179,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0014
label0013:
        push_all
        push_arg        sse127,4
        push_arg        sse126,4
        push_arg        sse125,4
        push_arg        sse124,4
        push_arg        dword866,4
        push_arg        dword179,4
        push_arg        dword200,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword866
        jmp     label000e
label000f:
        mov     dword327,[dword861+4]
        sub     dword327,[dword860+4]
        mov     dword332,[dword862]
        sub     dword332,[dword860]
        imul    dword327,dword332
        mov     dword339,[dword862+4]
        sub     dword339,[dword860+4]
        cdq     dword340,dword327
        idiv    dword327,dword339
        add     dword327,[dword860]
        mov     dword350,[dword861+4]
        sub     dword350,[dword860+4]
        cvtsi2ss        sse26,dword350
        movss   sse27,dword ptr [dword862+8]
        subss   sse27,dword ptr [dword860+8]
        mulss   sse26,sse27
        mov     dword361,[dword862+4]
        sub     dword361,[dword860+4]
        cvtsi2ss        sse28,dword361
        divss   sse26,sse28
        addss   sse26,dword ptr [dword860+8]
        mov     dword371,[dword861+4]
        sub     dword371,[dword860+4]
        cvtsi2ss        sse29,dword371
        movss   sse30,dword ptr [dword862+12]
        subss   sse30,dword ptr [dword860+12]
        mulss   sse29,sse30
        mov     dword384,[dword862+4]
        sub     dword384,[dword860+4]
        cvtsi2ss        sse31,dword384
        divss   sse29,sse31
        addss   sse29,dword ptr [dword860+12]
        movss   sse32,sse26
        subss   sse32,dword ptr [dword861+8]
        mov     dword395,dword327
        sub     dword395,[dword861]
        cvtsi2ss        sse33,dword395
        divss   sse32,sse33
        movss   sse34,sse29
        subss   sse34,dword ptr [dword861+12]
        mov     dword404,dword327
        sub     dword404,[dword861]
        cvtsi2ss        sse35,dword404
        divss   sse34,sse35
; start of inline function _rasterize_horiz_line__unordered
        movss   sse62,dword ptr [dword861+12]
        movss   sse61,dword ptr [dword861+8]
        movss   sse123,sse29
        movss   sse122,sse26
        mov     dword600,[dword861+4]
        mov     dword599,[dword861]
        cmp     dword327,dword599
        jg      label0016
        push_all
        push_arg        sse34,4
        push_arg        sse32,4
        push_arg        sse123,4
        push_arg        sse122,4
        push_arg        dword600,4
        push_arg        dword599,4
        push_arg        dword327,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0017
label0016:
        push_all
        push_arg        sse34,4
        push_arg        sse32,4
        push_arg        sse62,4
        push_arg        sse61,4
        push_arg        dword600,4
        push_arg        dword327,4
        push_arg        dword599,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     dword424,1
        add     dword424,[dword861+4]
        mov     dword866,dword424
label0011:
        mov     dword430,[dword862+4]
        cmp     dword430,dword866
        jle     label0012
        mov     dword435,dword866
        sub     dword435,[dword861+4]
        mov     dword440,[dword862]
        sub     dword440,[dword861]
        imul    dword435,dword440
        mov     dword447,[dword862+4]
        sub     dword447,[dword861+4]
        cdq     dword448,dword435
        idiv    dword435,dword447
        add     dword435,[dword861]
        mov     dword456,dword866
        sub     dword456,[dword860+4]
        mov     dword461,[dword862]
        sub     dword461,[dword860]
        imul    dword456,dword461
        mov     dword468,[dword862+4]
        sub     dword468,[dword860+4]
        cdq     dword469,dword456
        idiv    dword456,dword468
        add     dword456,[dword860]
        mov     dword477,dword866
        sub     dword477,[dword861+4]
        cvtsi2ss        sse36,dword477
        movss   sse37,dword ptr [dword862+8]
        subss   sse37,dword ptr [dword861+8]
        mulss   sse36,sse37
        mov     dword488,[dword862+4]
        sub     dword488,[dword861+4]
        cvtsi2ss        sse38,dword488
        divss   sse36,sse38
        addss   sse36,dword ptr [dword861+8]
        mov     dword496,dword866
        sub     dword496,[dword860+4]
        cvtsi2ss        sse39,dword496
        movss   sse40,dword ptr [dword862+8]
        subss   sse40,dword ptr [dword860+8]
        mulss   sse39,sse40
        mov     dword507,[dword862+4]
        sub     dword507,[dword860+4]
        cvtsi2ss        sse41,dword507
        divss   sse39,sse41
        addss   sse39,dword ptr [dword860+8]
        mov     dword515,dword866
        sub     dword515,[dword861+4]
        cvtsi2ss        sse42,dword515
        movss   sse43,dword ptr [dword862+12]
        subss   sse43,dword ptr [dword861+12]
        mulss   sse42,sse43
        mov     dword528,[dword862+4]
        sub     dword528,[dword861+4]
        cvtsi2ss        sse44,dword528
        divss   sse42,sse44
        addss   sse42,dword ptr [dword861+12]
        mov     dword537,dword866
        sub     dword537,[dword860+4]
        cvtsi2ss        sse45,dword537
        movss   sse46,dword ptr [dword862+12]
        subss   sse46,dword ptr [dword860+12]
        mulss   sse45,sse46
        mov     dword550,[dword862+4]
        sub     dword550,[dword860+4]
        cvtsi2ss        sse47,dword550
        divss   sse45,sse47
        addss   sse45,dword ptr [dword860+12]
        mov     dword557,dword456
        sub     dword557,dword435
        cvtsi2ss        sse48,dword557
        movss   sse49,sse39
        subss   sse49,sse36
        divss   sse49,sse48
        mov     dword563,dword456
        sub     dword563,dword435
        cvtsi2ss        sse50,dword563
        movss   sse51,sse45
        subss   sse51,sse42
        divss   sse51,sse50
; start of inline function _rasterize_horiz_line__unordered
        movss   sse127,sse51
        movss   sse126,sse49
        movss   sse125,sse45
        movss   sse124,sse39
        movss   sse123,sse42
        movss   sse122,sse36
        mov     dword869,dword866
        mov     dword868,dword456
        cmp     dword435,dword868
        jg      label0019
        push_all
        push_arg        sse127,4
        push_arg        sse126,4
        push_arg        sse123,4
        push_arg        sse122,4
        push_arg        dword869,4
        push_arg        dword868,4
        push_arg        dword435,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001a
label0019:
        push_all
        push_arg        sse127,4
        push_arg        sse126,4
        push_arg        sse125,4
        push_arg        sse124,4
        push_arg        dword869,4
        push_arg        dword435,4
        push_arg        dword868,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword866
        jmp     label0011
label0012:
label0027:
; end of inline function _rasterize_triangle_2i
        inc     dword859
        jmp     label0006
label0007:
label002c:
; end of inline function _rasterize_polygon_4f
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp

end
