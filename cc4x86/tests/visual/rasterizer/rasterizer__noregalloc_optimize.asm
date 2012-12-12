
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
___unnamed_float4_4     dd      080000000h, 00h, 00h, 00h
public  ___unnamed_float4_4
___unnamed_float_5      dd      0bf800000h
public  ___unnamed_float_5
___unnamed_float_6      dd      03b808081h
public  ___unnamed_float_6

.code

_matrix4f_transform proc
        create_stack_frame
        mov     dword81,[ebp+8]
        mov     dword80,[ebp+16]
        mov     dword79,[ebp+12]
        mov     dword78,dword79
        mov     dword77,dword80
        mov     dword76,dword81
        movss   sse1,dword ptr [dword78+4]
        mulss   sse1,dword ptr [dword77+16]
        movss   sse2,dword ptr [dword78]
        mulss   sse2,dword ptr [dword77]
        addss   sse2,sse1
        movss   sse3,dword ptr [dword78+8]
        mulss   sse3,dword ptr [dword77+32]
        addss   sse2,sse3
        movss   sse4,dword ptr [dword78+12]
        mulss   sse4,dword ptr [dword77+48]
        addss   sse2,sse4
        movss   dword ptr [dword76],sse2
        movss   sse5,dword ptr [dword78]
        mulss   sse5,dword ptr [dword77+4]
        movss   sse6,dword ptr [dword78+4]
        mulss   sse6,dword ptr [dword77+20]
        addss   sse5,sse6
        movss   sse7,dword ptr [dword78+8]
        mulss   sse7,dword ptr [dword77+36]
        addss   sse5,sse7
        movss   sse8,dword ptr [dword78+12]
        mulss   sse8,dword ptr [dword77+52]
        addss   sse5,sse8
        movss   dword ptr [dword76+4],sse5
        movss   sse9,dword ptr [dword78]
        mulss   sse9,dword ptr [dword77+8]
        movss   sse10,dword ptr [dword78+4]
        mulss   sse10,dword ptr [dword77+24]
        addss   sse9,sse10
        movss   sse11,dword ptr [dword78+8]
        mulss   sse11,dword ptr [dword77+40]
        addss   sse9,sse11
        movss   sse12,dword ptr [dword78+12]
        mulss   sse12,dword ptr [dword77+56]
        addss   sse9,sse12
        movss   dword ptr [dword76+8],sse9
        movss   sse13,dword ptr [dword78]
        mulss   sse13,dword ptr [dword77+12]
        movss   sse14,dword ptr [dword78+4]
        mulss   sse14,dword ptr [dword77+28]
        addss   sse13,sse14
        movss   sse15,dword ptr [dword78+8]
        mulss   sse15,dword ptr [dword77+44]
        addss   sse13,sse15
        movss   sse16,dword ptr [dword78+12]
        mulss   sse16,dword ptr [dword77+60]
        addss   sse13,sse16
        movss   dword ptr [dword76+12],sse13
        destroy_stack_frame
        ret
_matrix4f_transform endp

_rasterizer_init proc
        create_stack_frame
        movss   sse199,dword ptr [ebp+32]
        movss   sse198,dword ptr [ebp+28]
        movss   sse197,dword ptr [ebp+24]
        mov     dword392,[ebp+8]
        mov     dword391,[ebp+12]
        mov     dword390,[ebp+16]
        mov     dword389,[ebp+20]
        movss   sse196,sse197
        movss   sse195,sse198
        movss   sse194,sse199
        mov     dword388,dword389
        mov     dword387,dword390
        mov     dword386,dword391
        mov     dword385,dword392
        movss   sse177,sse196
        movss   sse175,sse195
        mov     dword ptr [__dbgprintf],dword385
        mov     dword ptr [__width],dword386
        mov     dword ptr [__height],dword387
        mov     dword ptr [__pitch],dword388
; start of inline function matrix4f_make_perspective
        cvtsi2ss        sse1,dword386
        cvtsi2ss        sse2,dword387
        divss   sse1,sse2
        mov     dword378,(offset __mvproj_matrix)
        movss   sse129,sse194
        mulss   sse129,sse177
        movss   sse130,sse129
        mulss   sse130,sse1
        movss   sse131,sse177
        divss   sse131,sse130
        movss   dword ptr [dword378],sse131
        movss   sse132,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+4],sse132
        movss   sse133,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+8],sse133
        movss   sse134,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+12],sse134
        movss   sse135,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+16],sse135
        movss   sse136,sse177
        divss   sse136,sse129
        movss   dword ptr [dword378+20],sse136
        movss   sse137,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+24],sse137
        movss   sse138,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+28],sse138
        movss   sse139,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+32],sse139
        movss   sse140,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+36],sse140
        movss   sse141,sse175
        subss   sse141,sse177
        movss   sse142,sse175
        divss   sse142,sse141
        movss   dword ptr [dword378+40],sse142
        movss   sse143,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword378+44],sse143
        movss   sse144,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+48],sse144
        movss   sse145,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+52],sse145
        movss   sse146,sse177
        mulss   sse146,sse175
        movss   sse147,sse177
        subss   sse147,sse175
        divss   sse146,sse147
        movss   dword ptr [dword378+56],sse146
        movss   sse148,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword378+60],sse148
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        cvtsi2ss        sse3,dword387
        cvtsi2ss        sse4,dword386
        mov     dword379,(offset __viewport_matrix)
        movss   sse152,dword ptr [___unnamed_float_3]
        movss   sse153,sse4
        mulss   sse153,sse152
        movss   dword ptr [dword379],sse153
        movss   sse154,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+4],sse154
        movss   sse155,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+8],sse155
        movss   sse156,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+12],sse156
        movss   sse157,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+16],sse157
        movss   sse158,sse3
        xorps   sse158,dword ptr [___unnamed_float4_4]
        movss   sse159,dword ptr [___unnamed_float_3]
        mulss   sse158,sse159
        movss   dword ptr [dword379+20],sse158
        movss   sse160,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+24],sse160
        movss   sse161,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+28],sse161
        movss   sse162,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+32],sse162
        movss   sse163,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+36],sse163
        movss   sse164,sse175
        subss   sse164,sse177
        movss   dword ptr [dword379+40],sse164
        movss   sse165,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword379+44],sse165
        movss   sse166,dword ptr [___unnamed_float_3]
        movss   sse167,sse4
        mulss   sse167,sse166
        movss   dword ptr [dword379+48],sse167
        movss   sse168,dword ptr [___unnamed_float_3]
        movss   sse169,sse3
        mulss   sse169,sse168
        movss   dword ptr [dword379+52],sse169
        movss   dword ptr [dword379+56],sse177
        movss   sse171,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword379+60],sse171
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   sse5,dword ptr [___unnamed_float_1]
        movss   sse6,dword ptr [___unnamed_float_2]
        movss   sse7,dword ptr [___unnamed_float_2]
        mov     dword380,(offset __clip_z_near_base)
        movss   dword ptr [dword380],sse7
        movss   dword ptr [dword380+4],sse6
        movss   dword ptr [dword380+8],sse177
        movss   dword ptr [dword380+12],sse5
; end of inline function vec4f_assign
        comiss  sse175,sse177
        jbe     label0000
        movss   sse9,dword ptr [___unnamed_float_1]
        movss   sse189,sse9
        jmp     label0001
label0000:
        movss   sse10,dword ptr [___unnamed_float_5]
        movss   sse189,sse10
label0001:
; start of inline function vec4f_assign
        movss   sse11,dword ptr [___unnamed_float_1]
        movss   sse12,dword ptr [___unnamed_float_2]
        movss   sse13,dword ptr [___unnamed_float_2]
        mov     dword380,(offset __clip_z_near_norm)
        movss   dword ptr [dword380],sse13
        movss   dword ptr [dword380+4],sse12
        movss   dword ptr [dword380+8],sse189
        movss   dword ptr [dword380+12],sse11
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse14,dword ptr [___unnamed_float_1]
        movss   sse15,dword ptr [___unnamed_float_2]
        movss   sse16,dword ptr [___unnamed_float_2]
        mov     dword380,(offset __clip_z_far_base)
        movss   dword ptr [dword380],sse16
        movss   dword ptr [dword380+4],sse15
        movss   dword ptr [dword380+8],sse175
        movss   dword ptr [dword380+12],sse14
; end of inline function vec4f_assign
        comiss  sse175,sse177
        jbe     label0002
        movss   sse18,dword ptr [___unnamed_float_5]
        movss   sse190,sse18
        jmp     label0003
label0002:
        movss   sse19,dword ptr [___unnamed_float_1]
        movss   sse190,sse19
label0003:
; start of inline function vec4f_assign
        movss   sse20,dword ptr [___unnamed_float_1]
        movss   sse21,dword ptr [___unnamed_float_2]
        movss   sse22,dword ptr [___unnamed_float_2]
        mov     dword380,(offset __clip_z_far_norm)
        movss   dword ptr [dword380],sse22
        movss   dword ptr [dword380+4],sse21
        movss   dword ptr [dword380+8],sse190
        movss   dword ptr [dword380+12],sse20
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse23,dword ptr [___unnamed_float_1]
        movss   sse24,dword ptr [___unnamed_float_2]
        movss   sse25,dword ptr [___unnamed_float_2]
        cvtsi2ss        sse26,dword386
        movss   sse27,dword ptr [___unnamed_float_1]
        divss   sse27,sse26
        movss   sse28,dword ptr [___unnamed_float_5]
        addss   sse28,sse27
        mov     dword380,(offset __clip_plane_left_base)
        movss   dword ptr [dword380],sse28
        movss   dword ptr [dword380+4],sse25
        movss   dword ptr [dword380+8],sse24
        movss   dword ptr [dword380+12],sse23
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse29,dword ptr [___unnamed_float_1]
        movss   sse30,dword ptr [___unnamed_float_2]
        movss   sse31,dword ptr [___unnamed_float_2]
        movss   sse32,dword ptr [___unnamed_float_1]
        mov     dword380,(offset __clip_plane_left_norm)
        movss   dword ptr [dword380],sse32
        movss   dword ptr [dword380+4],sse31
        movss   dword ptr [dword380+8],sse30
        movss   dword ptr [dword380+12],sse29
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse33,dword ptr [___unnamed_float_1]
        movss   sse34,dword ptr [___unnamed_float_2]
        movss   sse35,dword ptr [___unnamed_float_2]
        cvtsi2ss        sse36,dword386
        movss   sse37,dword ptr [___unnamed_float_1]
        divss   sse37,sse36
        movss   sse38,dword ptr [___unnamed_float_1]
        subss   sse38,sse37
        mov     dword380,(offset __clip_plane_right_base)
        movss   dword ptr [dword380],sse38
        movss   dword ptr [dword380+4],sse35
        movss   dword ptr [dword380+8],sse34
        movss   dword ptr [dword380+12],sse33
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse39,dword ptr [___unnamed_float_1]
        movss   sse40,dword ptr [___unnamed_float_2]
        movss   sse41,dword ptr [___unnamed_float_2]
        movss   sse42,dword ptr [___unnamed_float_5]
        mov     dword380,(offset __clip_plane_right_norm)
        movss   dword ptr [dword380],sse42
        movss   dword ptr [dword380+4],sse41
        movss   dword ptr [dword380+8],sse40
        movss   dword ptr [dword380+12],sse39
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse43,dword ptr [___unnamed_float_1]
        movss   sse44,dword ptr [___unnamed_float_2]
        cvtsi2ss        sse45,dword387
        movss   sse46,dword ptr [___unnamed_float_1]
        divss   sse46,sse45
        movss   sse47,dword ptr [___unnamed_float_5]
        addss   sse47,sse46
        movss   sse48,dword ptr [___unnamed_float_2]
        mov     dword380,(offset __clip_plane_top_base)
        movss   dword ptr [dword380],sse48
        movss   dword ptr [dword380+4],sse47
        movss   dword ptr [dword380+8],sse44
        movss   dword ptr [dword380+12],sse43
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse49,dword ptr [___unnamed_float_1]
        movss   sse50,dword ptr [___unnamed_float_2]
        movss   sse51,dword ptr [___unnamed_float_1]
        movss   sse52,dword ptr [___unnamed_float_2]
        mov     dword380,(offset __clip_plane_top_norm)
        movss   dword ptr [dword380],sse52
        movss   dword ptr [dword380+4],sse51
        movss   dword ptr [dword380+8],sse50
        movss   dword ptr [dword380+12],sse49
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse53,dword ptr [___unnamed_float_1]
        movss   sse54,dword ptr [___unnamed_float_2]
        movss   sse55,dword ptr [___unnamed_float_1]
        movss   sse56,dword ptr [___unnamed_float_2]
        mov     dword380,(offset __clip_plane_bottom_base)
        movss   dword ptr [dword380],sse56
        movss   dword ptr [dword380+4],sse55
        movss   dword ptr [dword380+8],sse54
        movss   dword ptr [dword380+12],sse53
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse57,dword ptr [___unnamed_float_1]
        movss   sse58,dword ptr [___unnamed_float_2]
        movss   sse59,dword ptr [___unnamed_float_5]
        movss   sse60,dword ptr [___unnamed_float_2]
        mov     dword380,(offset __clip_plane_bottom_norm)
        movss   dword ptr [dword380],sse60
        movss   dword ptr [dword380+4],sse59
        movss   dword ptr [dword380+8],sse58
        movss   dword ptr [dword380+12],sse57
; end of inline function vec4f_assign
        destroy_stack_frame
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        create_stack_frame
        mov     dword5,[ebp+8]
        mov     dword4,dword5
        mov     dword ptr [__videomem],dword4
        destroy_stack_frame
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        create_stack_frame
        mov     dword8,[ebp+8]
        mov     dword7,dword8
        mov     dword4,(offset __mvproj_matrix)
        mov     dword5,dword7
        mov     dword6,16
        rep     movsd   dword4,dword5
        destroy_stack_frame
        ret
_rasterizer_set_mvproj endp

_rasterizer_set_color proc
        create_stack_frame
        mov     dword5,[ebp+8]
        mov     dword4,dword5
        mov     dword ptr [__color],dword4
        destroy_stack_frame
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        create_stack_frame
        mov     dword15,[ebp+8]
        mov     dword14,[ebp+12]
        mov     dword13,[ebp+16]
        mov     dword12,dword13
        mov     dword11,dword14
        mov     dword10,dword15
        mov     dword ptr [__texture_data],dword10
        mov     dword ptr [__texture_width],dword11
        mov     dword ptr [__texture_height],dword12
        destroy_stack_frame
        ret
_rasterizer_set_texture endp

__rasterize_horiz_line proc
        create_stack_frame
        movss   sse34,dword ptr [ebp+24]
        movss   sse33,dword ptr [ebp+20]
        movss   sse32,dword ptr [ebp+28]
        movss   sse31,dword ptr [ebp+32]
        mov     dword126,[ebp+16]
        mov     dword125,[ebp+8]
        mov     dword124,[ebp+12]
        movss   sse30,sse31
        movss   sse29,sse32
        movss   sse28,sse33
        movss   sse27,sse34
        mov     dword123,dword124
        mov     dword122,dword125
        mov     dword121,dword126
        movss   sse18,sse28
        movss   sse16,sse27
        mov     dword3,dword ptr [__pitch]
        imul    dword3,dword121
        add     dword3,dword ptr [__videomem]
        mov     dword7,dword122
        sal     dword7,2
        add     dword3,dword7
        mov     dword104,dword3
        mov     dword11,dword123
        sal     dword11,2
        add     dword11,dword104
        mov     dword15,dword122
        sal     dword15,2
        sub     dword11,dword15
label0000:
; start of inline function _tex2d
        mov     dword85,dword ptr [__texture_width]
        dec     dword85
        cvtsi2ss        sse14,dword85
        mulss   sse14,sse18
        cvttss2si       dword87,sse14
        mov     dword91,dword ptr [__texture_height]
        dec     dword91
        cvtsi2ss        sse15,dword91
        mulss   sse15,sse16
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
        je      label0003
        cvtsi2ss        sse1,dword23
        movss   sse2,dword ptr [___unnamed_float_6]
        mulss   sse1,sse2
        mov     dword33,[dword104]
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
        mov     [dword104],dword68
label0003:
        movss   sse9,sse18
        addss   sse9,sse29
        movss   sse18,sse9
        movss   sse10,sse16
        addss   sse10,sse30
        movss   sse16,sse10
        add     dword104,4
        cmp     dword104,dword11
        jl      label0000
        destroy_stack_frame
        ret
__rasterize_horiz_line endp

__clip_on_plain proc
        create_stack_frame
        mov     dword383,[ebp+8]
        mov     dword382,[ebp+12]
        mov     dword381,[ebp+16]
        mov     dword380,[ebp+20]
        mov     dword379,dword380
        mov     dword378,dword381
        mov     dword377,dword382
        mov     dword376,dword383
        mov     dword ptr [dword376+192],0
        mov     dword352,dword377
        mov     dword8,dword377
        add     dword8,24
        mov     dword353,dword8
label0001:
        mov     dword14,[dword377+192]
        imul    dword14,24
        mov     dword16,dword377
        add     dword16,dword14
        cmp     dword16,dword353
        jle     label0002
; start of inline function vec4f_subtract
        movss   sse28,dword ptr [dword352]
        subss   sse28,dword ptr [dword378]
        movss   sse29,dword ptr [dword352+4]
        subss   sse29,dword ptr [dword378+4]
        movss   sse30,dword ptr [dword352+8]
        subss   sse30,dword ptr [dword378+8]
        movss   sse31,dword ptr [dword352+12]
        subss   sse31,dword ptr [dword378+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse48,sse29
        mulss   sse48,dword ptr [dword379+4]
        movss   sse49,sse28
        mulss   sse49,dword ptr [dword379]
        addss   sse49,sse48
        movss   sse50,sse30
        mulss   sse50,dword ptr [dword379+8]
        addss   sse49,sse50
        movss   sse51,sse31
        mulss   sse51,dword ptr [dword379+12]
        addss   sse49,sse51
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        movss   sse33,dword ptr [dword353]
        subss   sse33,dword ptr [dword378]
        movss   sse34,dword ptr [dword353+4]
        subss   sse34,dword ptr [dword378+4]
        movss   sse35,dword ptr [dword353+8]
        subss   sse35,dword ptr [dword378+8]
        movss   sse36,dword ptr [dword353+12]
        subss   sse36,dword ptr [dword378+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse53,sse34
        mulss   sse53,dword ptr [dword379+4]
        movss   sse54,sse33
        mulss   sse54,dword ptr [dword379]
        addss   sse54,sse53
        movss   sse55,sse35
        mulss   sse55,dword ptr [dword379+8]
        addss   sse54,sse55
        movss   sse56,sse36
        mulss   sse56,dword ptr [dword379+12]
        addss   sse54,sse56
; end of inline function vec4f_dot
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse49
        ja      label0003
        mov     dword36,[dword376+192]
        inc     dword ptr [dword376+192]
        imul    dword36,24
        movq    sse4,qword ptr [dword352]
        movq    qword ptr [dword376+dword36],sse4
        movq    sse4,qword ptr [dword352+8]
        movq    qword ptr [dword376+dword36+8],sse4
        movq    sse4,qword ptr [dword352+16]
        movq    qword ptr [dword376+dword36+16],sse4
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
        movss   sse38,dword ptr [dword378]
        subss   sse38,dword ptr [dword352]
        movss   sse39,dword ptr [dword378+4]
        subss   sse39,dword ptr [dword352+4]
        movss   sse40,dword ptr [dword378+8]
        subss   sse40,dword ptr [dword352+8]
        movss   sse41,dword ptr [dword378+12]
        subss   sse41,dword ptr [dword352+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        movss   sse43,dword ptr [dword353]
        subss   sse43,dword ptr [dword352]
        movss   sse44,dword ptr [dword353+4]
        subss   sse44,dword ptr [dword352+4]
        movss   sse45,dword ptr [dword353+8]
        subss   sse45,dword ptr [dword352+8]
        movss   sse46,dword ptr [dword353+12]
        subss   sse46,dword ptr [dword352+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   sse58,sse39
        mulss   sse58,dword ptr [dword379+4]
        movss   sse59,sse38
        mulss   sse59,dword ptr [dword379]
        addss   sse59,sse58
        movss   sse60,sse40
        mulss   sse60,dword ptr [dword379+8]
        addss   sse59,sse60
        movss   sse61,sse41
        mulss   sse61,dword ptr [dword379+12]
        addss   sse59,sse61
; end of inline function vec4f_dot
        movss   sse9,sse59
; start of inline function vec4f_dot
        movss   sse63,sse44
        mulss   sse63,dword ptr [dword379+4]
        movss   sse64,sse43
        mulss   sse64,dword ptr [dword379]
        addss   sse64,sse63
        movss   sse65,sse45
        mulss   sse65,dword ptr [dword379+8]
        addss   sse64,sse65
        movss   sse66,sse46
        mulss   sse66,dword ptr [dword379+12]
        addss   sse64,sse66
; end of inline function vec4f_dot
        divss   sse9,sse64
; start of inline function vec4f_mul
        movss   sse69,sse43
        mulss   sse69,sse9
        movss   sse70,sse44
        mulss   sse70,sse9
        movss   sse71,sse45
        mulss   sse71,sse9
        movss   sse72,sse46
        mulss   sse72,sse9
; end of inline function vec4f_mul
; start of inline function vec4f_add
        mov     dword72,[dword376+192]
        imul    dword72,24
        mov     dword74,dword376
        add     dword74,dword72
        movss   sse23,dword ptr [dword352]
        addss   sse23,sse69
        movss   dword ptr [dword74+dword72],sse23
        movss   sse24,dword ptr [dword352+4]
        addss   sse24,sse70
        movss   dword ptr [dword74+4],sse24
        movss   sse25,dword ptr [dword352+8]
        addss   sse25,sse71
        movss   dword ptr [dword74+8],sse25
        movss   sse26,dword ptr [dword352+12]
        addss   sse26,sse72
        movss   dword ptr [dword74+12],sse26
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     dword76,16
        add     dword76,dword352
        mov     dword78,16
        add     dword78,dword353
        movss   sse16,dword ptr [dword78+dword353]
        subss   sse16,dword ptr [dword76+dword352]
        movss   sse17,dword ptr [dword78+4]
        subss   sse17,dword ptr [dword76+4]
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   sse20,sse16
        mulss   sse20,sse9
        movss   sse21,sse17
        mulss   sse21,sse9
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     dword84,16
        add     dword84,dword352
        mov     dword88,[dword376+192]
        imul    dword88,24
        movss   sse13,dword ptr [dword84+dword352]
        addss   sse13,sse20
        movss   dword ptr [dword376+dword88+16],sse13
        movss   sse14,dword ptr [dword84+4]
        addss   sse14,sse21
        movss   dword ptr [dword376+dword88+20],sse14
; end of inline function vec2f_add
        inc     dword ptr [dword376+192]
label0004:
        add     dword352,24
        add     dword353,24
        jmp     label0001
label0002:
        mov     dword98,[dword376+192]
        inc     dword ptr [dword376+192]
        imul    dword98,24
        movq    sse11,qword ptr [dword376]
        movq    qword ptr [dword376+dword98],sse11
        movq    sse11,qword ptr [dword376+8]
        movq    qword ptr [dword376+dword98+8],sse11
        movq    sse11,qword ptr [dword376+16]
        movq    qword ptr [dword376+dword98+16],sse11
        destroy_stack_frame
        ret
__clip_on_plain endp

_rasterizer_triangle3f proc
        create_stack_frame
        movss   sse167,dword ptr [ebp-684]
        movss   sse166,dword ptr [ebp-688]
        movss   sse165,dword ptr [ebp-676]
        movsd   sse164,qword ptr [ebp-180]
        movsd   sse163,qword ptr [ebp-188]
        movsd   sse162,qword ptr [ebp-196]
        mov     dword913,[ebp+28]
        mov     dword912,[ebp+16]
        mov     dword911,[ebp+24]
        mov     dword910,[ebp+12]
        mov     dword909,[ebp+20]
        mov     dword908,[ebp+8]
        movsd   sse161,sse162
        movsd   sse160,sse163
        movsd   sse159,sse164
        movss   sse158,sse165
        movss   sse157,sse166
        movss   sse156,sse167
        mov     dword907,dword908
        mov     dword906,dword909
        mov     dword905,dword910
        mov     dword904,dword911
        mov     dword903,dword912
        mov     dword902,dword913
        movsd   sse143,sse159
        movss   sse124,sse157
        movss   sse122,sse158
        movsd   sse121,sse143
; start of inline function _transform_to_projection_space
        lea     dword2,[ebp-196]
; start of inline function vec4f_assign
        movss   sse86,dword ptr [___unnamed_float_1]
        movss   sse89,dword ptr [dword907+8]
        movss   sse88,dword ptr [dword907+4]
        movss   sse87,dword ptr [dword907]
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
        movq    sse1,qword ptr [dword906]
        movq    sse143,sse1
; start of inline function _transform_to_projection_space
        lea     dword8,[ebp-196]
        add     dword8,24
; start of inline function vec4f_assign
        movss   sse96,dword ptr [___unnamed_float_1]
        movss   sse99,dword ptr [dword905+8]
        movss   sse98,dword ptr [dword905+4]
        movss   sse97,dword ptr [dword905]
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
        movq    sse2,qword ptr [dword904]
        movq    qword ptr [ebp-156],sse2
; start of inline function _transform_to_projection_space
        lea     dword16,[ebp-196]
        add     dword16,48
; start of inline function vec4f_assign
        movss   sse106,dword ptr [___unnamed_float_1]
        movss   sse109,dword ptr [dword903+8]
        movss   sse108,dword ptr [dword903+4]
        movss   sse107,dword ptr [dword903]
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
        movq    sse3,qword ptr [dword902]
        movq    qword ptr [ebp-132],sse3
        movq    sse4,sse161
        movq    qword ptr [ebp-124],sse4
        movq    sse4,sse160
        movq    qword ptr [ebp-116],sse4
        movq    sse4,sse121
        movq    qword ptr [ebp-108],sse4
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
        mov     dword870,0
label0003:
        mov     dword43,[dword29+192]
        cmp     dword43,dword870
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword45,dword29
        mov     dword48,dword870
        imul    dword48,24
        add     dword45,dword48
        lea     dword49,[ebp-332]
        mov     dword52,dword870
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
        divss   sse82,sse122
        movss   sse83,sse124
        mulss   sse83,sse82
        cvttss2si       dword754,sse83
        mov     [dword49+dword52],dword754
        movss   sse84,sse156
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
        mov     dword56,dword870
        sal     dword56,4
        mov     dword62,dword870
        imul    dword62,24
        movq    sse6,qword ptr [dword29+dword62+16]
        movq    qword ptr [dword53+dword56+8],sse6
        inc     dword870
        jmp     label0003
label0004:
        mov     dword870,2
label0006:
        mov     dword70,[dword29+192]
        dec     dword70
        cmp     dword70,dword870
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     dword72,[ebp-332]
        mov     dword75,dword870
        sal     dword75,4
        add     dword72,dword75
        mov     dword873,dword72
        mov     dword78,dword870
        dec     dword78
        sal     dword78,4
        lea     dword80,[ebp-332]
        add     dword80,dword78
        mov     dword874,dword80
        lea     dword81,[ebp-332]
        mov     dword875,dword81
        mov     dword90,[dword875+4]
        cmp     dword90,[dword874+4]
        jle     label0008
        mov     dword876,dword875
        mov     dword875,dword874
        mov     dword874,dword876
label0008:
        mov     dword106,[dword875+4]
        cmp     dword106,[dword873+4]
        jle     label0009
        mov     dword876,dword875
        mov     dword875,dword873
        mov     dword873,dword876
label0009:
        mov     dword122,[dword874+4]
        cmp     dword122,[dword873+4]
        jle     label000a
        mov     dword876,dword874
        mov     dword874,dword873
        mov     dword873,dword876
label000a:
        mov     dword138,[dword875+4]
        cmp     dword138,[dword873+4]
        jne     label000b
        cmp     dword ptr [dword875+4],0
        jl      label000c
        mov     dword147,[dword875+4]
        cmp     dword147,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   sse8,dword ptr [___unnamed_float_2]
        movss   sse9,dword ptr [___unnamed_float_2]
        mov     dword151,8
        add     dword151,dword873
        mov     dword877,dword151
        mov     dword153,8
        add     dword153,dword874
        mov     dword878,dword153
        mov     dword155,8
        add     dword155,dword875
        mov     dword879,dword155
        mov     dword643,[dword875+4]
        mov     dword880,dword643
        mov     dword642,[dword873]
        mov     dword641,[dword874]
        mov     dword640,[dword875]
        cmp     dword640,dword641
        jge     label001c
        cmp     dword642,dword641
        jle     label001d
        push_all
        push_arg        sse8,4
        push_arg        sse9,4
        push_arg        dword ptr [dword879+4],4
        push_arg        dword ptr [dword879],4
        push_arg        dword880,4
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
        push_arg        sse8,4
        push_arg        sse9,4
        push_arg        dword ptr [dword877+4],4
        push_arg        dword ptr [dword877],4
        push_arg        dword880,4
        push_arg        dword641,4
        push_arg        dword642,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        sse8,4
        push_arg        sse9,4
        push_arg        dword ptr [dword879+4],4
        push_arg        dword ptr [dword879],4
        push_arg        dword880,4
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
        movss   sse74,sse8
        xorps   sse74,dword ptr [___unnamed_float4_4]
        push_arg        sse74,4
        movss   sse75,sse9
        xorps   sse75,dword ptr [___unnamed_float4_4]
        push_arg        sse75,4
        push_arg        dword ptr [dword877+4],4
        push_arg        dword ptr [dword877],4
        push_arg        dword880,4
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
        movss   sse76,sse8
        xorps   sse76,dword ptr [___unnamed_float4_4]
        push_arg        sse76,4
        movss   sse77,sse9
        xorps   sse77,dword ptr [___unnamed_float4_4]
        push_arg        sse77,4
        push_arg        dword ptr [dword878+4],4
        push_arg        dword ptr [dword878],4
        push_arg        dword880,4
        push_arg        dword642,4
        push_arg        dword641,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0025
label0024:
        push_all
        movss   sse78,sse8
        xorps   sse78,dword ptr [___unnamed_float4_4]
        push_arg        sse78,4
        movss   sse79,sse9
        xorps   sse79,dword ptr [___unnamed_float4_4]
        push_arg        sse79,4
        push_arg        dword ptr [dword878+4],4
        push_arg        dword ptr [dword878],4
        push_arg        dword880,4
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
        mov     dword169,[dword875+4]
        mov     dword884,dword169
label000e:
        mov     dword174,[dword874+4]
        cmp     dword174,dword884
        jle     label000f
        mov     dword179,dword884
        sub     dword179,[dword875+4]
        mov     dword184,[dword874]
        sub     dword184,[dword875]
        imul    dword179,dword184
        mov     dword191,[dword874+4]
        sub     dword191,[dword875+4]
        cdq     dword192,dword179
        idiv    dword179,dword191
        add     dword179,[dword875]
        mov     dword200,dword884
        sub     dword200,[dword875+4]
        mov     dword205,[dword873]
        sub     dword205,[dword875]
        imul    dword200,dword205
        mov     dword212,[dword873+4]
        sub     dword212,[dword875+4]
        cdq     dword213,dword200
        idiv    dword200,dword212
        add     dword200,[dword875]
        mov     dword221,dword884
        sub     dword221,[dword875+4]
        cvtsi2ss        sse10,dword221
        movss   sse11,dword ptr [dword874+8]
        subss   sse11,dword ptr [dword875+8]
        mulss   sse10,sse11
        mov     dword232,[dword874+4]
        sub     dword232,[dword875+4]
        cvtsi2ss        sse12,dword232
        divss   sse10,sse12
        addss   sse10,dword ptr [dword875+8]
        mov     dword240,dword884
        sub     dword240,[dword875+4]
        cvtsi2ss        sse13,dword240
        movss   sse14,dword ptr [dword873+8]
        subss   sse14,dword ptr [dword875+8]
        mulss   sse13,sse14
        mov     dword251,[dword873+4]
        sub     dword251,[dword875+4]
        cvtsi2ss        sse15,dword251
        divss   sse13,sse15
        addss   sse13,dword ptr [dword875+8]
        mov     dword259,dword884
        sub     dword259,[dword875+4]
        cvtsi2ss        sse16,dword259
        movss   sse17,dword ptr [dword874+12]
        subss   sse17,dword ptr [dword875+12]
        mulss   sse16,sse17
        mov     dword272,[dword874+4]
        sub     dword272,[dword875+4]
        cvtsi2ss        sse18,dword272
        divss   sse16,sse18
        addss   sse16,dword ptr [dword875+12]
        mov     dword281,dword884
        sub     dword281,[dword875+4]
        cvtsi2ss        sse19,dword281
        movss   sse20,dword ptr [dword873+12]
        subss   sse20,dword ptr [dword875+12]
        mulss   sse19,sse20
        mov     dword294,[dword873+4]
        sub     dword294,[dword875+4]
        cvtsi2ss        sse21,dword294
        divss   sse19,sse21
        addss   sse19,dword ptr [dword875+12]
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
        movss   sse134,sse25
        movss   sse135,sse23
        movss   sse136,sse19
        movss   sse137,sse13
        movss   sse138,sse16
        movss   sse139,sse10
        cmp     dword179,dword200
        jg      label0013
        push_all
        push_arg        sse134,4
        push_arg        sse135,4
        push_arg        sse138,4
        push_arg        sse139,4
        push_arg        dword884,4
        push_arg        dword200,4
        push_arg        dword179,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0014
label0013:
        push_all
        push_arg        sse134,4
        push_arg        sse135,4
        push_arg        sse136,4
        push_arg        sse137,4
        push_arg        dword884,4
        push_arg        dword179,4
        push_arg        dword200,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword884
        jmp     label000e
label000f:
        mov     dword327,[dword874+4]
        sub     dword327,[dword875+4]
        mov     dword332,[dword873]
        sub     dword332,[dword875]
        imul    dword327,dword332
        mov     dword339,[dword873+4]
        sub     dword339,[dword875+4]
        cdq     dword340,dword327
        idiv    dword327,dword339
        add     dword327,[dword875]
        mov     dword350,[dword874+4]
        sub     dword350,[dword875+4]
        cvtsi2ss        sse26,dword350
        movss   sse27,dword ptr [dword873+8]
        subss   sse27,dword ptr [dword875+8]
        mulss   sse26,sse27
        mov     dword361,[dword873+4]
        sub     dword361,[dword875+4]
        cvtsi2ss        sse28,dword361
        divss   sse26,sse28
        addss   sse26,dword ptr [dword875+8]
        mov     dword371,[dword874+4]
        sub     dword371,[dword875+4]
        cvtsi2ss        sse29,dword371
        movss   sse30,dword ptr [dword873+12]
        subss   sse30,dword ptr [dword875+12]
        mulss   sse29,sse30
        mov     dword384,[dword873+4]
        sub     dword384,[dword875+4]
        cvtsi2ss        sse31,dword384
        divss   sse29,sse31
        addss   sse29,dword ptr [dword875+12]
        movss   sse32,sse26
        subss   sse32,dword ptr [dword874+8]
        mov     dword395,dword327
        sub     dword395,[dword874]
        cvtsi2ss        sse33,dword395
        divss   sse32,sse33
        movss   sse34,sse29
        subss   sse34,dword ptr [dword874+12]
        mov     dword404,dword327
        sub     dword404,[dword874]
        cvtsi2ss        sse35,dword404
        divss   sse34,sse35
; start of inline function _rasterize_horiz_line__unordered
        movss   sse135,sse32
        movss   sse62,dword ptr [dword874+12]
        movss   sse136,sse62
        movss   sse61,dword ptr [dword874+8]
        movss   sse137,sse61
        movss   sse138,sse29
        movss   sse139,sse26
        mov     dword600,[dword874+4]
        mov     dword599,[dword874]
        cmp     dword327,dword599
        jg      label0016
        push_all
        push_arg        sse34,4
        push_arg        sse135,4
        push_arg        sse138,4
        push_arg        sse139,4
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
        push_arg        sse135,4
        push_arg        sse136,4
        push_arg        sse137,4
        push_arg        dword600,4
        push_arg        dword327,4
        push_arg        dword599,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     dword424,1
        add     dword424,[dword874+4]
        mov     dword884,dword424
label0011:
        mov     dword430,[dword873+4]
        cmp     dword430,dword884
        jle     label0012
        mov     dword435,dword884
        sub     dword435,[dword874+4]
        mov     dword440,[dword873]
        sub     dword440,[dword874]
        imul    dword435,dword440
        mov     dword447,[dword873+4]
        sub     dword447,[dword874+4]
        cdq     dword448,dword435
        idiv    dword435,dword447
        add     dword435,[dword874]
        mov     dword456,dword884
        sub     dword456,[dword875+4]
        mov     dword461,[dword873]
        sub     dword461,[dword875]
        imul    dword456,dword461
        mov     dword468,[dword873+4]
        sub     dword468,[dword875+4]
        cdq     dword469,dword456
        idiv    dword456,dword468
        add     dword456,[dword875]
        mov     dword477,dword884
        sub     dword477,[dword874+4]
        cvtsi2ss        sse36,dword477
        movss   sse37,dword ptr [dword873+8]
        subss   sse37,dword ptr [dword874+8]
        mulss   sse36,sse37
        mov     dword488,[dword873+4]
        sub     dword488,[dword874+4]
        cvtsi2ss        sse38,dword488
        divss   sse36,sse38
        addss   sse36,dword ptr [dword874+8]
        mov     dword496,dword884
        sub     dword496,[dword875+4]
        cvtsi2ss        sse39,dword496
        movss   sse40,dword ptr [dword873+8]
        subss   sse40,dword ptr [dword875+8]
        mulss   sse39,sse40
        mov     dword507,[dword873+4]
        sub     dword507,[dword875+4]
        cvtsi2ss        sse41,dword507
        divss   sse39,sse41
        addss   sse39,dword ptr [dword875+8]
        mov     dword515,dword884
        sub     dword515,[dword874+4]
        cvtsi2ss        sse42,dword515
        movss   sse43,dword ptr [dword873+12]
        subss   sse43,dword ptr [dword874+12]
        mulss   sse42,sse43
        mov     dword528,[dword873+4]
        sub     dword528,[dword874+4]
        cvtsi2ss        sse44,dword528
        divss   sse42,sse44
        addss   sse42,dword ptr [dword874+12]
        mov     dword537,dword884
        sub     dword537,[dword875+4]
        cvtsi2ss        sse45,dword537
        movss   sse46,dword ptr [dword873+12]
        subss   sse46,dword ptr [dword875+12]
        mulss   sse45,sse46
        mov     dword550,[dword873+4]
        sub     dword550,[dword875+4]
        cvtsi2ss        sse47,dword550
        divss   sse45,sse47
        addss   sse45,dword ptr [dword875+12]
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
        movss   sse134,sse51
        movss   sse135,sse49
        movss   sse136,sse45
        movss   sse137,sse39
        mov     dword887,dword884
        mov     dword888,dword456
        cmp     dword435,dword888
        jg      label0019
        push_all
        push_arg        sse134,4
        push_arg        sse135,4
        push_arg        sse42,4
        push_arg        sse36,4
        push_arg        dword887,4
        push_arg        dword888,4
        push_arg        dword435,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001a
label0019:
        push_all
        push_arg        sse134,4
        push_arg        sse135,4
        push_arg        sse136,4
        push_arg        sse137,4
        push_arg        dword887,4
        push_arg        dword435,4
        push_arg        dword888,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword884
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
