
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
        mov     dword75,[ebp+8]
        mov     dword74,[ebp+16]
        mov     dword73,[ebp+12]
        movss   sse1,dword ptr [dword73+4]
        mulss   sse1,dword ptr [dword74+16]
        mov     dword6,dword73
        mov     dword8,dword74
        movss   sse2,dword ptr [dword6]
        mulss   sse2,dword ptr [dword8]
        addss   sse2,sse1
        movss   sse3,dword ptr [dword73+8]
        mulss   sse3,dword ptr [dword74+32]
        addss   sse2,sse3
        movss   sse4,dword ptr [dword73+12]
        mulss   sse4,dword ptr [dword74+48]
        addss   sse2,sse4
        mov     dword18,dword75
        movss   dword ptr [dword18],sse2
        mov     dword22,dword73
        movss   sse5,dword ptr [dword22]
        mulss   sse5,dword ptr [dword74+4]
        movss   sse6,dword ptr [dword73+4]
        mulss   sse6,dword ptr [dword74+20]
        addss   sse5,sse6
        movss   sse7,dword ptr [dword73+8]
        mulss   sse7,dword ptr [dword74+36]
        addss   sse5,sse7
        movss   sse8,dword ptr [dword73+12]
        mulss   sse8,dword ptr [dword74+52]
        addss   sse5,sse8
        movss   dword ptr [dword75+4],sse5
        mov     dword40,dword73
        movss   sse9,dword ptr [dword40]
        mulss   sse9,dword ptr [dword74+8]
        movss   sse10,dword ptr [dword73+4]
        mulss   sse10,dword ptr [dword74+24]
        addss   sse9,sse10
        movss   sse11,dword ptr [dword73+8]
        mulss   sse11,dword ptr [dword74+40]
        addss   sse9,sse11
        movss   sse12,dword ptr [dword73+12]
        mulss   sse12,dword ptr [dword74+56]
        addss   sse9,sse12
        movss   dword ptr [dword75+8],sse9
        mov     dword58,dword73
        movss   sse13,dword ptr [dword58]
        mulss   sse13,dword ptr [dword74+12]
        movss   sse14,dword ptr [dword73+4]
        mulss   sse14,dword ptr [dword74+28]
        addss   sse13,sse14
        movss   sse15,dword ptr [dword73+8]
        mulss   sse15,dword ptr [dword74+44]
        addss   sse13,sse15
        movss   sse16,dword ptr [dword73+12]
        mulss   sse16,dword ptr [dword74+60]
        addss   sse13,sse16
        movss   dword ptr [dword75+12],sse13
        destroy_stack_frame
        ret
_matrix4f_transform endp

_rasterizer_init proc
        create_stack_frame
        movss   sse177,dword ptr [ebp+24]
        movss   sse175,dword ptr [ebp+28]
        movss   sse173,dword ptr [ebp+32]
        mov     dword377,[ebp+20]
        mov     dword376,[ebp+16]
        mov     dword375,[ebp+12]
        mov     dword374,[ebp+8]
        mov     dword3,dword374
        mov     dword ptr [__dbgprintf],dword3
        mov     dword6,dword375
        mov     dword ptr [__width],dword6
        mov     dword9,dword376
        mov     dword ptr [__height],dword9
        mov     dword12,dword377
        mov     dword ptr [__pitch],dword12
; start of inline function matrix4f_make_perspective
        cvtsi2ss        sse1,dword375
        cvtsi2ss        sse2,dword376
        divss   sse1,sse2
        movss   sse172,sse1
        movss   sse127,sse173
        movss   sse174,sse127
        movss   sse126,sse175
        movss   sse176,sse126
        movss   sse125,sse177
        movss   sse178,sse125
        mov     dword378,(offset __mvproj_matrix)
        movss   sse129,sse174
        mulss   sse129,sse178
        movss   sse179,sse129
        movss   sse130,sse179
        mulss   sse130,sse172
        movss   sse180,sse130
        mov     dword266,dword378
        movss   sse131,sse178
        divss   sse131,sse180
        movss   dword ptr [dword266],sse131
        mov     dword ptr [dword378+4],0
        mov     dword ptr [dword378+8],0
        mov     dword ptr [dword378+12],0
        mov     dword ptr [dword378+16],0
        movss   sse136,sse178
        divss   sse136,sse179
        movss   dword ptr [dword378+20],sse136
        mov     dword ptr [dword378+24],0
        mov     dword ptr [dword378+28],0
        mov     dword ptr [dword378+32],0
        mov     dword ptr [dword378+36],0
        movss   sse141,sse176
        subss   sse141,sse178
        movss   sse142,sse176
        divss   sse142,sse141
        movss   dword ptr [dword378+40],sse142
        mov     dword ptr [dword378+44],1065353216
        mov     dword ptr [dword378+48],0
        mov     dword ptr [dword378+52],0
        movss   sse146,sse178
        mulss   sse146,sse176
        movss   sse147,sse178
        subss   sse147,sse176
        divss   sse146,sse147
        movss   dword ptr [dword378+56],sse146
        mov     dword ptr [dword378+60],0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   sse150,sse175
        movss   sse181,sse150
        movss   sse149,sse177
        movss   sse182,sse149
        cvtsi2ss        sse3,dword376
        movss   sse183,sse3
        cvtsi2ss        sse4,dword375
        movss   sse184,sse4
        mov     dword379,(offset __viewport_matrix)
        mov     dword322,dword379
        movss   sse153,sse184
        mulss   sse153,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword322],sse153
        mov     dword ptr [dword379+4],0
        mov     dword ptr [dword379+8],0
        mov     dword ptr [dword379+12],0
        mov     dword ptr [dword379+16],0
        movss   sse158,sse183
        xorps   sse158,dword ptr [___unnamed_float4_4]
        mulss   sse158,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword379+20],sse158
        mov     dword ptr [dword379+24],0
        mov     dword ptr [dword379+28],0
        mov     dword ptr [dword379+32],0
        mov     dword ptr [dword379+36],0
        movss   sse164,sse181
        subss   sse164,sse182
        movss   dword ptr [dword379+40],sse164
        mov     dword ptr [dword379+44],0
        movss   sse167,sse184
        mulss   sse167,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword379+48],sse167
        movss   sse169,sse183
        mulss   sse169,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword379+52],sse169
        movss   sse170,sse182
        movss   dword ptr [dword379+56],sse170
        mov     dword ptr [dword379+60],1065353216
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   sse61,sse177
        movss   sse186,sse61
        mov     dword380,(offset __clip_z_near_base)
        mov     dword104,dword380
        mov     dword ptr [dword104],0
        mov     dword ptr [dword380+4],0
        movss   sse65,sse186
        movss   dword ptr [dword380+8],sse65
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
        movss   sse8,sse175
        comiss  sse8,sse177
        jbe     label0000
        movss   sse189,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   sse189,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
        movss   sse67,sse189
        movss   sse186,sse67
        mov     dword380,(offset __clip_z_near_norm)
        mov     dword117,dword380
        mov     dword ptr [dword117],0
        mov     dword ptr [dword380+4],0
        movss   sse71,sse186
        movss   dword ptr [dword380+8],sse71
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   sse73,sse175
        movss   sse186,sse73
        mov     dword380,(offset __clip_z_far_base)
        mov     dword130,dword380
        mov     dword ptr [dword130],0
        mov     dword ptr [dword380+4],0
        movss   sse77,sse186
        movss   dword ptr [dword380+8],sse77
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
        movss   sse17,sse175
        comiss  sse17,sse177
        jbe     label0002
        movss   sse190,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   sse190,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
        movss   sse79,sse190
        movss   sse186,sse79
        mov     dword380,(offset __clip_z_far_norm)
        mov     dword143,dword380
        mov     dword ptr [dword143],0
        mov     dword ptr [dword380+4],0
        movss   sse83,sse186
        movss   dword ptr [dword380+8],sse83
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        sse26,dword375
        movss   sse27,dword ptr [___unnamed_float_1]
        divss   sse27,sse26
        movss   sse28,dword ptr [___unnamed_float_5]
        addss   sse28,sse27
        movss   sse188,sse28
        mov     dword380,(offset __clip_plane_left_base)
        mov     dword156,dword380
        movss   sse86,sse188
        movss   dword ptr [dword156],sse86
        mov     dword ptr [dword380+4],0
        mov     dword ptr [dword380+8],0
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword380,(offset __clip_plane_left_norm)
        mov     dword169,dword380
        mov     dword ptr [dword169],1065353216
        mov     dword ptr [dword380+4],0
        mov     dword ptr [dword380+8],0
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        sse36,dword375
        movss   sse37,dword ptr [___unnamed_float_1]
        divss   sse37,sse36
        movss   sse38,dword ptr [___unnamed_float_1]
        subss   sse38,sse37
        movss   sse188,sse38
        mov     dword380,(offset __clip_plane_right_base)
        mov     dword182,dword380
        movss   sse96,sse188
        movss   dword ptr [dword182],sse96
        mov     dword ptr [dword380+4],0
        mov     dword ptr [dword380+8],0
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword380,(offset __clip_plane_right_norm)
        mov     dword195,dword380
        mov     dword ptr [dword195],-1082130432
        mov     dword ptr [dword380+4],0
        mov     dword ptr [dword380+8],0
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        sse45,dword376
        movss   sse46,dword ptr [___unnamed_float_1]
        divss   sse46,sse45
        movss   sse47,dword ptr [___unnamed_float_5]
        addss   sse47,sse46
        movss   sse187,sse47
        mov     dword380,(offset __clip_plane_top_base)
        mov     dword208,dword380
        mov     dword ptr [dword208],0
        movss   sse107,sse187
        movss   dword ptr [dword380+4],sse107
        mov     dword ptr [dword380+8],0
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword380,(offset __clip_plane_top_norm)
        mov     dword221,dword380
        mov     dword ptr [dword221],0
        mov     dword ptr [dword380+4],1065353216
        mov     dword ptr [dword380+8],0
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword380,(offset __clip_plane_bottom_base)
        mov     dword234,dword380
        mov     dword ptr [dword234],0
        mov     dword ptr [dword380+4],1065353216
        mov     dword ptr [dword380+8],0
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword380,(offset __clip_plane_bottom_norm)
        mov     dword247,dword380
        mov     dword ptr [dword247],0
        mov     dword ptr [dword380+4],-1082130432
        mov     dword ptr [dword380+8],0
        mov     dword ptr [dword380+12],1065353216
; end of inline function vec4f_assign
        destroy_stack_frame
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        create_stack_frame
        mov     dword4,[ebp+8]
        mov     dword3,dword4
        mov     dword ptr [__videomem],dword3
        destroy_stack_frame
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        create_stack_frame
        mov     dword7,[ebp+8]
        mov     dword2,dword7
        mov     dword4,(offset __mvproj_matrix)
        mov     dword5,dword2
        mov     dword6,16
        rep     movsd   dword4,dword5
        destroy_stack_frame
        ret
_rasterizer_set_mvproj endp

_rasterizer_set_color proc
        create_stack_frame
        mov     dword4,[ebp+8]
        mov     dword3,dword4
        mov     dword ptr [__color],dword3
        destroy_stack_frame
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        create_stack_frame
        mov     dword12,[ebp+16]
        mov     dword11,[ebp+12]
        mov     dword10,[ebp+8]
        mov     dword3,dword10
        mov     dword ptr [__texture_data],dword3
        mov     dword6,dword11
        mov     dword ptr [__texture_width],dword6
        mov     dword9,dword12
        mov     dword ptr [__texture_height],dword9
        destroy_stack_frame
        ret
_rasterizer_set_texture endp

__rasterize_horiz_line proc
        create_stack_frame
        movss   sse22,dword ptr [ebp+32]
        movss   sse21,dword ptr [ebp+28]
        movss   sse18,dword ptr [ebp+20]
        movss   sse16,dword ptr [ebp+24]
        mov     dword105,[ebp+12]
        mov     dword103,[ebp+8]
        mov     dword102,[ebp+16]
        mov     dword3,dword ptr [__pitch]
        imul    dword3,dword102
        add     dword3,dword ptr [__videomem]
        mov     dword7,dword103
        sal     dword7,2
        add     dword3,dword7
        mov     dword104,dword3
        mov     dword11,dword105
        sal     dword11,2
        add     dword11,dword104
        mov     dword15,dword103
        sal     dword15,2
        sub     dword11,dword15
        mov     dword106,dword11
label0000:
; start of inline function _tex2d
        movss   sse12,sse16
        movss   sse17,sse12
        movss   sse11,sse18
        movss   sse19,sse11
        mov     dword85,dword ptr [__texture_width]
        dec     dword85
        cvtsi2ss        sse14,dword85
        mulss   sse14,sse19
        cvttss2si       dword87,sse14
        mov     dword107,dword87
        mov     dword91,dword ptr [__texture_height]
        dec     dword91
        cvtsi2ss        sse15,dword91
        mulss   sse15,sse17
        cvttss2si       dword93,sse15
        mov     dword108,dword93
        mov     dword97,dword108
        imul    dword97,dword ptr [__texture_width]
        add     dword97,dword107
        sal     dword97,2
        add     dword97,dword ptr [__texture_data]
        mov     dword101,[dword97]
        mov     dword109,dword101
; end of inline function _tex2d
        mov     dword19,dword109
        mov     dword110,dword19
        mov     dword23,dword110
        sar     dword23,24
        and     dword23,255
        mov     dword111,dword23
        cmp     dword111,0
        je      label0003
        cvtsi2ss        sse1,dword111
        mulss   sse1,dword ptr [___unnamed_float_6]
        movss   sse20,sse1
        mov     dword31,dword104
        mov     dword33,[dword31]
        mov     dword112,dword33
        mov     dword36,dword112
        and     dword36,65280
        sar     dword36,8
        mov     dword113,dword36
        mov     dword41,dword112
        and     dword41,255
        mov     dword114,dword41
        mov     dword45,dword110
        and     dword45,65280
        sar     dword45,8
        mov     dword115,dword45
        mov     dword50,dword110
        and     dword50,255
        mov     dword116,dword50
        cvtsi2ss        sse3,dword115
        mulss   sse3,sse20
        cvtsi2ss        sse4,dword113
        movss   sse5,dword ptr [___unnamed_float_1]
        subss   sse5,sse20
        mulss   sse4,sse5
        addss   sse3,sse4
        cvttss2si       dword57,sse3
        mov     dword115,dword57
        cvtsi2ss        sse6,dword116
        mulss   sse6,sse20
        cvtsi2ss        sse7,dword114
        movss   sse8,dword ptr [___unnamed_float_1]
        subss   sse8,sse20
        mulss   sse7,sse8
        addss   sse6,sse7
        cvttss2si       dword64,sse6
        mov     dword116,dword64
        mov     dword68,dword115
        sal     dword68,8
        add     dword68,dword116
        mov     dword117,dword68
        mov     dword72,dword104
        mov     dword74,dword117
        mov     [dword72],dword74
label0003:
        movss   sse9,sse18
        addss   sse9,sse21
        movss   sse18,sse9
        movss   sse10,sse16
        addss   sse10,sse22
        movss   sse16,sse10
        add     dword104,4
        mov     dword81,dword104
        cmp     dword81,dword106
        jl      label0000
        destroy_stack_frame
        ret
__rasterize_horiz_line endp

__clip_on_plain proc
        create_stack_frame
        mov     dword358,[ebp+20]
        mov     dword354,[ebp+16]
        mov     dword351,[ebp+12]
        mov     dword350,[ebp+8]
        mov     dword ptr [dword350+192],0
        mov     dword5,dword351
        mov     dword352,dword5
        mov     dword8,dword351
        add     dword8,24
        mov     dword353,dword8
label0001:
        mov     dword14,[dword351+192]
        imul    dword14,24
        mov     dword16,dword351
        add     dword16,dword14
        cmp     dword16,dword353
        jle     label0002
; start of inline function vec4f_subtract
        mov     dword162,dword354
        mov     dword355,dword162
        mov     dword20,dword352
        mov     dword356,dword20
        lea     dword21,[ebp-24]
        mov     dword357,dword21
        mov     dword165,dword356
        mov     dword167,dword355
        movss   sse28,dword ptr [dword165]
        subss   sse28,dword ptr [dword167]
        mov     dword169,dword357
        movss   dword ptr [dword169],sse28
        movss   sse29,dword ptr [dword356+4]
        subss   sse29,dword ptr [dword355+4]
        movss   dword ptr [dword357+4],sse29
        movss   sse30,dword ptr [dword356+8]
        subss   sse30,dword ptr [dword355+8]
        movss   dword ptr [dword357+8],sse30
        movss   sse31,dword ptr [dword356+12]
        subss   sse31,dword ptr [dword355+12]
        movss   dword ptr [dword357+12],sse31
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword265,dword358
        mov     dword359,dword265
        lea     dword23,[ebp-24]
        mov     dword360,dword23
        movss   sse48,dword ptr [dword360+4]
        mulss   sse48,dword ptr [dword359+4]
        mov     dword272,dword360
        mov     dword274,dword359
        movss   sse49,dword ptr [dword272]
        mulss   sse49,dword ptr [dword274]
        addss   sse49,sse48
        movss   sse50,dword ptr [dword360+8]
        mulss   sse50,dword ptr [dword359+8]
        addss   sse49,sse50
        movss   sse51,dword ptr [dword360+12]
        mulss   sse51,dword ptr [dword359+12]
        addss   sse49,sse51
        movss   sse73,sse49
; end of inline function vec4f_dot
        movss   sse1,sse73
        movss   sse74,sse1
; start of inline function vec4f_subtract
        mov     dword188,dword354
        mov     dword355,dword188
        mov     dword27,dword353
        mov     dword356,dword27
        lea     dword28,[ebp-24]
        mov     dword357,dword28
        mov     dword191,dword356
        mov     dword193,dword355
        movss   sse33,dword ptr [dword191]
        subss   sse33,dword ptr [dword193]
        mov     dword195,dword357
        movss   dword ptr [dword195],sse33
        movss   sse34,dword ptr [dword356+4]
        subss   sse34,dword ptr [dword355+4]
        movss   dword ptr [dword357+4],sse34
        movss   sse35,dword ptr [dword356+8]
        subss   sse35,dword ptr [dword355+8]
        movss   dword ptr [dword357+8],sse35
        movss   sse36,dword ptr [dword356+12]
        subss   sse36,dword ptr [dword355+12]
        movss   dword ptr [dword357+12],sse36
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword283,dword358
        mov     dword359,dword283
        lea     dword30,[ebp-24]
        mov     dword360,dword30
        movss   sse53,dword ptr [dword360+4]
        mulss   sse53,dword ptr [dword359+4]
        mov     dword290,dword360
        mov     dword292,dword359
        movss   sse54,dword ptr [dword290]
        mulss   sse54,dword ptr [dword292]
        addss   sse54,sse53
        movss   sse55,dword ptr [dword360+8]
        mulss   sse55,dword ptr [dword359+8]
        addss   sse54,sse55
        movss   sse56,dword ptr [dword360+12]
        mulss   sse56,dword ptr [dword359+12]
        addss   sse54,sse56
        movss   sse73,sse54
; end of inline function vec4f_dot
        movss   sse2,sse73
        movss   sse75,sse2
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse74
        ja      label0003
        mov     dword36,[dword350+192]
        inc     dword ptr [dword350+192]
        imul    dword36,24
        mov     dword39,dword350
        mov     dword41,dword352
        movq    sse4,qword ptr [dword41]
        movq    qword ptr [dword39+dword36],sse4
        movq    sse4,qword ptr [dword41+8]
        movq    qword ptr [dword39+dword36+8],sse4
        movq    sse4,qword ptr [dword41+16]
        movq    qword ptr [dword39+dword36+16],sse4
label0003:
        movss   sse5,dword ptr [___unnamed_float_2]
        comiss  sse5,sse74
        jae     label0006
        movss   sse6,dword ptr [___unnamed_float_2]
        comiss  sse6,sse75
        ja      label0005
label0006:
        movss   sse7,dword ptr [___unnamed_float_2]
        comiss  sse7,sse75
        ja      label0004
        movss   sse8,dword ptr [___unnamed_float_2]
        comiss  sse8,sse74
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        mov     dword51,dword352
        mov     dword355,dword51
        mov     dword214,dword354
        mov     dword356,dword214
        lea     dword53,[ebp-24]
        mov     dword357,dword53
        mov     dword217,dword356
        mov     dword219,dword355
        movss   sse38,dword ptr [dword217]
        subss   sse38,dword ptr [dword219]
        mov     dword221,dword357
        movss   dword ptr [dword221],sse38
        movss   sse39,dword ptr [dword356+4]
        subss   sse39,dword ptr [dword355+4]
        movss   dword ptr [dword357+4],sse39
        movss   sse40,dword ptr [dword356+8]
        subss   sse40,dword ptr [dword355+8]
        movss   dword ptr [dword357+8],sse40
        movss   sse41,dword ptr [dword356+12]
        subss   sse41,dword ptr [dword355+12]
        movss   dword ptr [dword357+12],sse41
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     dword55,dword352
        mov     dword355,dword55
        mov     dword57,dword353
        mov     dword356,dword57
        lea     dword58,[ebp-40]
        mov     dword357,dword58
        mov     dword242,dword356
        mov     dword244,dword355
        movss   sse43,dword ptr [dword242]
        subss   sse43,dword ptr [dword244]
        mov     dword246,dword357
        movss   dword ptr [dword246],sse43
        movss   sse44,dword ptr [dword356+4]
        subss   sse44,dword ptr [dword355+4]
        movss   dword ptr [dword357+4],sse44
        movss   sse45,dword ptr [dword356+8]
        subss   sse45,dword ptr [dword355+8]
        movss   dword ptr [dword357+8],sse45
        movss   sse46,dword ptr [dword356+12]
        subss   sse46,dword ptr [dword355+12]
        movss   dword ptr [dword357+12],sse46
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword301,dword358
        mov     dword359,dword301
        lea     dword60,[ebp-24]
        mov     dword360,dword60
        movss   sse58,dword ptr [dword360+4]
        mulss   sse58,dword ptr [dword359+4]
        mov     dword308,dword360
        mov     dword310,dword359
        movss   sse59,dword ptr [dword308]
        mulss   sse59,dword ptr [dword310]
        addss   sse59,sse58
        movss   sse60,dword ptr [dword360+8]
        mulss   sse60,dword ptr [dword359+8]
        addss   sse59,sse60
        movss   sse61,dword ptr [dword360+12]
        mulss   sse61,dword ptr [dword359+12]
        addss   sse59,sse61
        movss   sse73,sse59
; end of inline function vec4f_dot
        movss   sse9,sse73
; start of inline function vec4f_dot
        mov     dword319,dword358
        mov     dword359,dword319
        lea     dword62,[ebp-40]
        mov     dword360,dword62
        movss   sse63,dword ptr [dword360+4]
        mulss   sse63,dword ptr [dword359+4]
        mov     dword326,dword360
        mov     dword328,dword359
        movss   sse64,dword ptr [dword326]
        mulss   sse64,dword ptr [dword328]
        addss   sse64,sse63
        movss   sse65,dword ptr [dword360+8]
        mulss   sse65,dword ptr [dword359+8]
        addss   sse64,sse65
        movss   sse66,dword ptr [dword360+12]
        mulss   sse66,dword ptr [dword359+12]
        addss   sse64,sse66
        movss   sse73,sse64
; end of inline function vec4f_dot
        movss   sse10,sse73
        divss   sse9,sse10
        movss   sse76,sse9
; start of inline function vec4f_mul
        movss   sse67,sse76
        movss   sse77,sse67
        lea     dword65,[ebp-40]
        mov     dword361,dword65
        mov     dword339,dword361
        movss   sse69,dword ptr [dword339]
        mulss   sse69,sse77
        movss   dword ptr [dword339],sse69
        movss   sse70,dword ptr [dword361+4]
        mulss   sse70,sse77
        movss   dword ptr [dword361+4],sse70
        movss   sse71,dword ptr [dword361+8]
        mulss   sse71,sse77
        movss   dword ptr [dword361+8],sse71
        movss   sse72,dword ptr [dword361+12]
        mulss   sse72,sse77
        movss   dword ptr [dword361+12],sse72
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     dword66,[ebp-40]
        mov     dword362,dword66
        mov     dword68,dword352
        mov     dword363,dword68
        mov     dword72,[dword350+192]
        imul    dword72,24
        mov     dword74,dword350
        add     dword74,dword72
        mov     dword364,dword74
        mov     dword139,dword363
        mov     dword141,dword362
        movss   sse23,dword ptr [dword139]
        addss   sse23,dword ptr [dword141]
        mov     dword143,dword364
        movss   dword ptr [dword143],sse23
        movss   sse24,dword ptr [dword363+4]
        addss   sse24,dword ptr [dword362+4]
        movss   dword ptr [dword364+4],sse24
        movss   sse25,dword ptr [dword363+8]
        addss   sse25,dword ptr [dword362+8]
        movss   dword ptr [dword364+8],sse25
        movss   sse26,dword ptr [dword363+12]
        addss   sse26,dword ptr [dword362+12]
        movss   dword ptr [dword364+12],sse26
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     dword76,16
        add     dword76,dword352
        mov     dword365,dword76
        mov     dword78,16
        add     dword78,dword353
        mov     dword366,dword78
        lea     dword79,[ebp-48]
        mov     dword367,dword79
        mov     dword119,dword366
        mov     dword121,dword365
        movss   sse16,dword ptr [dword119]
        subss   sse16,dword ptr [dword121]
        mov     dword123,dword367
        movss   dword ptr [dword123],sse16
        movss   sse17,dword ptr [dword366+4]
        subss   sse17,dword ptr [dword365+4]
        movss   dword ptr [dword367+4],sse17
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   sse18,sse76
        movss   sse78,sse18
        lea     dword81,[ebp-48]
        mov     dword368,dword81
        mov     dword132,dword368
        movss   sse20,dword ptr [dword132]
        mulss   sse20,sse78
        movss   dword ptr [dword132],sse20
        movss   sse21,dword ptr [dword368+4]
        mulss   sse21,sse78
        movss   dword ptr [dword368+4],sse21
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     dword82,[ebp-48]
        mov     dword369,dword82
        mov     dword84,16
        add     dword84,dword352
        mov     dword370,dword84
        mov     dword88,[dword350+192]
        imul    dword88,24
        mov     dword90,dword350
        add     dword90,dword88
        add     dword90,16
        mov     dword371,dword90
        mov     dword106,dword370
        mov     dword108,dword369
        movss   sse13,dword ptr [dword106]
        addss   sse13,dword ptr [dword108]
        mov     dword110,dword371
        movss   dword ptr [dword110],sse13
        movss   sse14,dword ptr [dword370+4]
        addss   sse14,dword ptr [dword369+4]
        movss   dword ptr [dword371+4],sse14
; end of inline function vec2f_add
        inc     dword ptr [dword350+192]
label0004:
        add     dword352,24
        add     dword353,24
        jmp     label0001
label0002:
        mov     dword98,[dword350+192]
        inc     dword ptr [dword350+192]
        imul    dword98,24
        mov     dword101,dword350
        mov     dword103,dword350
        movq    sse11,qword ptr [dword103]
        movq    qword ptr [dword101+dword98],sse11
        movq    sse11,qword ptr [dword103+8]
        movq    qword ptr [dword101+dword98+8],sse11
        movq    sse11,qword ptr [dword103+16]
        movq    qword ptr [dword101+dword98+16],sse11
        destroy_stack_frame
        ret
__clip_on_plain endp

_rasterizer_triangle3f proc
        create_stack_frame
        movss   sse125,dword ptr [ebp-684]
        movss   sse124,dword ptr [ebp-688]
        movss   sse122,dword ptr [ebp-676]
        movsd   sse121,qword ptr [ebp-180]
        movsd   sse120,qword ptr [ebp-188]
        movsd   sse119,qword ptr [ebp-196]
        mov     dword865,[ebp+28]
        mov     dword864,[ebp+16]
        mov     dword863,[ebp+24]
        mov     dword862,[ebp+12]
        mov     dword861,[ebp+20]
        mov     dword857,[ebp+8]
; start of inline function _transform_to_projection_space
        mov     dword779,dword857
        mov     dword858,dword779
        lea     dword2,[ebp-196]
        mov     dword859,dword2
; start of inline function vec4f_assign
        movss   sse89,dword ptr [dword858+8]
        movss   sse116,sse89
        movss   sse88,dword ptr [dword858+4]
        movss   sse117,sse88
        mov     dword787,dword858
        movss   sse87,dword ptr [dword787]
        movss   sse118,sse87
        lea     dword788,[ebp-716]
        mov     dword860,dword788
        mov     dword794,dword860
        movss   sse91,sse118
        movss   dword ptr [dword794],sse91
        movss   sse92,sse117
        movss   dword ptr [dword860+4],sse92
        movss   sse93,sse116
        movss   dword ptr [dword860+8],sse93
        mov     dword ptr [dword860+12],1065353216
; end of inline function vec4f_assign
        push_all
        lea     dword789,dword ptr [__mvproj_matrix]
        push_arg        dword789,4
        lea     dword790,[ebp-716]
        push_arg        dword790,4
        push_arg        dword859,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword6,dword861
        movq    sse1,qword ptr [dword6]
        movq    qword ptr [ebp-180],sse1
; start of inline function _transform_to_projection_space
        mov     dword805,dword862
        mov     dword858,dword805
        lea     dword8,[ebp-196]
        add     dword8,24
        mov     dword859,dword8
; start of inline function vec4f_assign
        movss   sse99,dword ptr [dword858+8]
        movss   sse116,sse99
        movss   sse98,dword ptr [dword858+4]
        movss   sse117,sse98
        mov     dword813,dword858
        movss   sse97,dword ptr [dword813]
        movss   sse118,sse97
        lea     dword814,[ebp-716]
        mov     dword860,dword814
        mov     dword820,dword860
        movss   sse101,sse118
        movss   dword ptr [dword820],sse101
        movss   sse102,sse117
        movss   dword ptr [dword860+4],sse102
        movss   sse103,sse116
        movss   dword ptr [dword860+8],sse103
        mov     dword ptr [dword860+12],1065353216
; end of inline function vec4f_assign
        push_all
        lea     dword815,dword ptr [__mvproj_matrix]
        push_arg        dword815,4
        lea     dword816,[ebp-716]
        push_arg        dword816,4
        push_arg        dword859,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword14,dword863
        movq    sse2,qword ptr [dword14]
        movq    qword ptr [ebp-156],sse2
; start of inline function _transform_to_projection_space
        mov     dword831,dword864
        mov     dword858,dword831
        lea     dword16,[ebp-196]
        add     dword16,48
        mov     dword859,dword16
; start of inline function vec4f_assign
        movss   sse109,dword ptr [dword858+8]
        movss   sse116,sse109
        movss   sse108,dword ptr [dword858+4]
        movss   sse117,sse108
        mov     dword839,dword858
        movss   sse107,dword ptr [dword839]
        movss   sse118,sse107
        lea     dword840,[ebp-716]
        mov     dword860,dword840
        mov     dword846,dword860
        movss   sse111,sse118
        movss   dword ptr [dword846],sse111
        movss   sse112,sse117
        movss   dword ptr [dword860+4],sse112
        movss   sse113,sse116
        movss   dword ptr [dword860+8],sse113
        mov     dword ptr [dword860+12],1065353216
; end of inline function vec4f_assign
        push_all
        lea     dword841,dword ptr [__mvproj_matrix]
        push_arg        dword841,4
        lea     dword842,[ebp-716]
        push_arg        dword842,4
        push_arg        dword859,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
; end of inline function _transform_to_projection_space
        mov     dword22,dword865
        movq    sse3,qword ptr [dword22]
        movq    qword ptr [ebp-132],sse3
        movq    sse4,sse119
        movq    qword ptr [ebp-124],sse4
        movq    sse4,sse120
        movq    qword ptr [ebp-116],sse4
        movq    sse4,sse121
        movq    qword ptr [ebp-108],sse4
; start of inline function _rasterize_polygon_4f
        lea     dword29,[ebp-196]
        mov     dword867,dword29
; start of inline function _clip_poligon
        mov     dword714,dword867
        mov     dword868,dword714
        push_all
        lea     dword716,dword ptr [__clip_z_far_norm]
        push_arg        dword716,4
        lea     dword717,dword ptr [__clip_z_far_base]
        push_arg        dword717,4
        push_arg        dword868,4
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
        push_arg        dword868,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword724,dword ptr [__clip_plane_left_norm]
        push_arg        dword724,4
        lea     dword725,dword ptr [__clip_plane_left_base]
        push_arg        dword725,4
        push_arg        dword868,4
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
        push_arg        dword868,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword732,dword ptr [__clip_plane_top_norm]
        push_arg        dword732,4
        lea     dword733,dword ptr [__clip_plane_top_base]
        push_arg        dword733,4
        push_arg        dword868,4
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
        push_arg        dword868,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        cmp     dword ptr [dword868+192],1
        setg    byte8
        movzx   dword743,byte8
        mov     dword869,dword743
; end of inline function _clip_poligon
        mov     dword32,dword869
        cmp     dword32,0
        jne     label0000
        jmp     label002c
label0000:
        cmp     dword ptr [dword867+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword870,0
label0003:
        mov     dword43,[dword867+192]
        cmp     dword43,dword870
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword45,dword867
        mov     dword48,dword870
        imul    dword48,24
        add     dword45,dword48
        mov     dword871,dword45
        lea     dword49,[ebp-332]
        mov     dword52,dword870
        sal     dword52,4
        add     dword49,dword52
        mov     dword872,dword49
        push_all
        lea     dword745,dword ptr [__viewport_matrix]
        push_arg        dword745,4
        push_arg        dword871,4
        lea     dword747,[ebp-688]
        push_arg        dword747,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        movss   sse82,dword ptr [___unnamed_float_1]
        divss   sse82,sse122
        movss   sse123,sse82
        movss   sse83,sse124
        mulss   sse83,sse123
        cvttss2si       dword754,sse83
        mov     dword756,dword872
        mov     [dword756],dword754
        movss   sse84,sse125
        mulss   sse84,sse123
        cvttss2si       dword760,sse84
        mov     [dword872+4],dword760
        mov     dword764,dword872
        cmp     dword ptr [dword764],0
        jl      label002a
        mov     dword767,dword872
        mov     dword769,[dword767]
        cmp     dword769,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [dword872+4],0
        jl      label002a
        mov     dword776,[dword872+4]
        cmp     dword776,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     dword53,[ebp-332]
        mov     dword56,dword870
        sal     dword56,4
        mov     dword59,dword867
        mov     dword62,dword870
        imul    dword62,24
        movq    sse6,qword ptr [dword59+dword62+16]
        movq    qword ptr [dword53+dword56+8],sse6
        inc     dword870
        jmp     label0003
label0004:
        mov     dword870,2
label0006:
        mov     dword70,[dword867+192]
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
        mov     dword85,dword875
        mov     dword88,dword874
        mov     dword90,[dword85+4]
        cmp     dword90,[dword88+4]
        jle     label0008
        mov     dword93,dword875
        mov     dword876,dword93
        mov     dword96,dword874
        mov     dword875,dword96
        mov     dword99,dword876
        mov     dword874,dword99
label0008:
        mov     dword101,dword875
        mov     dword104,dword873
        mov     dword106,[dword101+4]
        cmp     dword106,[dword104+4]
        jle     label0009
        mov     dword109,dword875
        mov     dword876,dword109
        mov     dword112,dword873
        mov     dword875,dword112
        mov     dword115,dword876
        mov     dword873,dword115
label0009:
        mov     dword117,dword874
        mov     dword120,dword873
        mov     dword122,[dword117+4]
        cmp     dword122,[dword120+4]
        jle     label000a
        mov     dword125,dword874
        mov     dword876,dword125
        mov     dword128,dword873
        mov     dword874,dword128
        mov     dword131,dword876
        mov     dword873,dword131
label000a:
        mov     dword133,dword875
        mov     dword136,dword873
        mov     dword138,[dword133+4]
        cmp     dword138,[dword136+4]
        jne     label000b
        mov     dword140,dword875
        cmp     dword ptr [dword140+4],0
        jl      label000c
        mov     dword144,dword875
        mov     dword147,[dword144+4]
        cmp     dword147,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   sse126,dword ptr [___unnamed_float_2]
        movss   sse127,dword ptr [___unnamed_float_2]
        mov     dword151,8
        add     dword151,dword873
        mov     dword877,dword151
        mov     dword153,8
        add     dword153,dword874
        mov     dword878,dword153
        mov     dword155,8
        add     dword155,dword875
        mov     dword879,dword155
        mov     dword157,dword875
        mov     dword643,[dword157+4]
        mov     dword880,dword643
        mov     dword160,dword873
        mov     dword642,[dword160]
        mov     dword881,dword642
        mov     dword162,dword874
        mov     dword641,[dword162]
        mov     dword882,dword641
        mov     dword164,dword875
        mov     dword640,[dword164]
        mov     dword883,dword640
        mov     dword647,dword883
        cmp     dword647,dword882
        jge     label001c
        mov     dword650,dword881
        cmp     dword650,dword882
        jle     label001d
        push_all
        push_arg        sse126,4
        push_arg        sse127,4
        push_arg        dword ptr [dword879+4],4
        mov     dword656,dword879
        push_arg        dword ptr [dword656],4
        push_arg        dword880,4
        push_arg        dword881,4
        push_arg        dword883,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        mov     dword662,dword881
        cmp     dword662,dword883
        jge     label001f
        push_all
        push_arg        sse126,4
        push_arg        sse127,4
        push_arg        dword ptr [dword877+4],4
        mov     dword668,dword877
        push_arg        dword ptr [dword668],4
        push_arg        dword880,4
        push_arg        dword882,4
        push_arg        dword881,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        sse126,4
        push_arg        sse127,4
        push_arg        dword ptr [dword879+4],4
        mov     dword677,dword879
        push_arg        dword ptr [dword677],4
        push_arg        dword880,4
        push_arg        dword882,4
        push_arg        dword883,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0020:
label001e:
        jmp     label0021
label001c:
        mov     dword683,dword881
        cmp     dword683,dword882
        jge     label0022
        push_all
        movss   sse74,sse126
        xorps   sse74,dword ptr [___unnamed_float4_4]
        push_arg        sse74,4
        movss   sse75,sse127
        xorps   sse75,dword ptr [___unnamed_float4_4]
        push_arg        sse75,4
        push_arg        dword ptr [dword877+4],4
        mov     dword689,dword877
        push_arg        dword ptr [dword689],4
        push_arg        dword880,4
        push_arg        dword883,4
        push_arg        dword881,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        mov     dword695,dword881
        cmp     dword695,dword883
        jle     label0024
        push_all
        movss   sse76,sse126
        xorps   sse76,dword ptr [___unnamed_float4_4]
        push_arg        sse76,4
        movss   sse77,sse127
        xorps   sse77,dword ptr [___unnamed_float4_4]
        push_arg        sse77,4
        push_arg        dword ptr [dword878+4],4
        mov     dword701,dword878
        push_arg        dword ptr [dword701],4
        push_arg        dword880,4
        push_arg        dword881,4
        push_arg        dword882,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0025
label0024:
        push_all
        movss   sse78,sse126
        xorps   sse78,dword ptr [___unnamed_float4_4]
        push_arg        sse78,4
        movss   sse79,sse127
        xorps   sse79,dword ptr [___unnamed_float4_4]
        push_arg        sse79,4
        push_arg        dword ptr [dword878+4],4
        mov     dword710,dword878
        push_arg        dword ptr [dword710],4
        push_arg        dword880,4
        push_arg        dword883,4
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
        mov     dword166,dword875
        mov     dword169,[dword166+4]
        mov     dword884,dword169
label000e:
        mov     dword171,dword874
        mov     dword174,[dword171+4]
        cmp     dword174,dword884
        jle     label000f
        mov     dword176,dword875
        mov     dword179,dword884
        sub     dword179,[dword176+4]
        mov     dword181,dword874
        mov     dword183,dword875
        mov     dword184,[dword181]
        sub     dword184,[dword183]
        imul    dword179,dword184
        mov     dword186,dword874
        mov     dword189,dword875
        mov     dword191,[dword186+4]
        sub     dword191,[dword189+4]
        cdq     dword192,dword179
        idiv    dword179,dword191
        mov     dword194,dword875
        add     dword179,[dword194]
        mov     dword885,dword179
        mov     dword197,dword875
        mov     dword200,dword884
        sub     dword200,[dword197+4]
        mov     dword202,dword873
        mov     dword204,dword875
        mov     dword205,[dword202]
        sub     dword205,[dword204]
        imul    dword200,dword205
        mov     dword207,dword873
        mov     dword210,dword875
        mov     dword212,[dword207+4]
        sub     dword212,[dword210+4]
        cdq     dword213,dword200
        idiv    dword200,dword212
        mov     dword215,dword875
        add     dword200,[dword215]
        mov     dword886,dword200
        mov     dword218,dword875
        mov     dword221,dword884
        sub     dword221,[dword218+4]
        cvtsi2ss        sse10,dword221
        movss   sse11,dword ptr [dword874+8]
        subss   sse11,dword ptr [dword875+8]
        mulss   sse10,sse11
        mov     dword227,dword874
        mov     dword230,dword875
        mov     dword232,[dword227+4]
        sub     dword232,[dword230+4]
        cvtsi2ss        sse12,dword232
        divss   sse10,sse12
        addss   sse10,dword ptr [dword875+8]
        movss   sse128,sse10
        mov     dword237,dword875
        mov     dword240,dword884
        sub     dword240,[dword237+4]
        cvtsi2ss        sse13,dword240
        movss   sse14,dword ptr [dword873+8]
        subss   sse14,dword ptr [dword875+8]
        mulss   sse13,sse14
        mov     dword246,dword873
        mov     dword249,dword875
        mov     dword251,[dword246+4]
        sub     dword251,[dword249+4]
        cvtsi2ss        sse15,dword251
        divss   sse13,sse15
        addss   sse13,dword ptr [dword875+8]
        movss   sse129,sse13
        mov     dword256,dword875
        mov     dword259,dword884
        sub     dword259,[dword256+4]
        cvtsi2ss        sse16,dword259
        movss   sse17,dword ptr [dword874+12]
        subss   sse17,dword ptr [dword875+12]
        mulss   sse16,sse17
        mov     dword267,dword874
        mov     dword270,dword875
        mov     dword272,[dword267+4]
        sub     dword272,[dword270+4]
        cvtsi2ss        sse18,dword272
        divss   sse16,sse18
        addss   sse16,dword ptr [dword875+12]
        movss   sse130,sse16
        mov     dword278,dword875
        mov     dword281,dword884
        sub     dword281,[dword278+4]
        cvtsi2ss        sse19,dword281
        movss   sse20,dword ptr [dword873+12]
        subss   sse20,dword ptr [dword875+12]
        mulss   sse19,sse20
        mov     dword289,dword873
        mov     dword292,dword875
        mov     dword294,[dword289+4]
        sub     dword294,[dword292+4]
        cvtsi2ss        sse21,dword294
        divss   sse19,sse21
        addss   sse19,dword ptr [dword875+12]
        movss   sse131,sse19
        mov     dword301,dword886
        sub     dword301,dword885
        cvtsi2ss        sse22,dword301
        movss   sse23,sse129
        subss   sse23,sse128
        divss   sse23,sse22
        movss   sse132,sse23
        mov     dword307,dword886
        sub     dword307,dword885
        cvtsi2ss        sse24,dword307
        movss   sse25,sse131
        subss   sse25,sse130
        divss   sse25,sse24
        movss   sse133,sse25
; start of inline function _rasterize_horiz_line__unordered
        movss   sse57,sse133
        movss   sse134,sse57
        movss   sse56,sse132
        movss   sse135,sse56
        movss   sse55,sse131
        movss   sse136,sse55
        movss   sse54,sse129
        movss   sse137,sse54
        movss   sse53,sse130
        movss   sse138,sse53
        movss   sse52,sse128
        movss   sse139,sse52
        mov     dword579,dword884
        mov     dword887,dword579
        mov     dword578,dword886
        mov     dword888,dword578
        mov     dword577,dword885
        mov     dword889,dword577
        mov     dword583,dword889
        cmp     dword583,dword888
        jg      label0013
        push_all
        push_arg        sse134,4
        push_arg        sse135,4
        push_arg        sse138,4
        push_arg        sse139,4
        push_arg        dword887,4
        push_arg        dword888,4
        push_arg        dword889,4
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
        push_arg        dword887,4
        push_arg        dword889,4
        push_arg        dword888,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword884
        jmp     label000e
label000f:
        mov     dword322,dword874
        mov     dword325,dword875
        mov     dword327,[dword322+4]
        sub     dword327,[dword325+4]
        mov     dword329,dword873
        mov     dword331,dword875
        mov     dword332,[dword329]
        sub     dword332,[dword331]
        imul    dword327,dword332
        mov     dword334,dword873
        mov     dword337,dword875
        mov     dword339,[dword334+4]
        sub     dword339,[dword337+4]
        cdq     dword340,dword327
        idiv    dword327,dword339
        mov     dword342,dword875
        add     dword327,[dword342]
        mov     dword886,dword327
        mov     dword345,dword874
        mov     dword348,dword875
        mov     dword350,[dword345+4]
        sub     dword350,[dword348+4]
        cvtsi2ss        sse26,dword350
        movss   sse27,dword ptr [dword873+8]
        subss   sse27,dword ptr [dword875+8]
        mulss   sse26,sse27
        mov     dword356,dword873
        mov     dword359,dword875
        mov     dword361,[dword356+4]
        sub     dword361,[dword359+4]
        cvtsi2ss        sse28,dword361
        divss   sse26,sse28
        addss   sse26,dword ptr [dword875+8]
        movss   sse129,sse26
        mov     dword366,dword874
        mov     dword369,dword875
        mov     dword371,[dword366+4]
        sub     dword371,[dword369+4]
        cvtsi2ss        sse29,dword371
        movss   sse30,dword ptr [dword873+12]
        subss   sse30,dword ptr [dword875+12]
        mulss   sse29,sse30
        mov     dword379,dword873
        mov     dword382,dword875
        mov     dword384,[dword379+4]
        sub     dword384,[dword382+4]
        cvtsi2ss        sse31,dword384
        divss   sse29,sse31
        addss   sse29,dword ptr [dword875+12]
        movss   sse131,sse29
        movss   sse32,sse129
        subss   sse32,dword ptr [dword874+8]
        mov     dword393,dword874
        mov     dword395,dword886
        sub     dword395,[dword393]
        cvtsi2ss        sse33,dword395
        divss   sse32,sse33
        movss   sse132,sse32
        movss   sse34,sse131
        subss   sse34,dword ptr [dword874+12]
        mov     dword402,dword874
        mov     dword404,dword886
        sub     dword404,[dword402]
        cvtsi2ss        sse35,dword404
        divss   sse34,sse35
        movss   sse133,sse34
; start of inline function _rasterize_horiz_line__unordered
        movss   sse64,sse133
        movss   sse134,sse64
        movss   sse63,sse132
        movss   sse135,sse63
        movss   sse62,dword ptr [dword874+12]
        movss   sse136,sse62
        movss   sse61,dword ptr [dword874+8]
        movss   sse137,sse61
        movss   sse60,sse131
        movss   sse138,sse60
        movss   sse59,sse129
        movss   sse139,sse59
        mov     dword416,dword874
        mov     dword600,[dword416+4]
        mov     dword887,dword600
        mov     dword419,dword874
        mov     dword599,[dword419]
        mov     dword888,dword599
        mov     dword598,dword886
        mov     dword889,dword598
        mov     dword604,dword889
        cmp     dword604,dword888
        jg      label0016
        push_all
        push_arg        sse134,4
        push_arg        sse135,4
        push_arg        sse138,4
        push_arg        sse139,4
        push_arg        dword887,4
        push_arg        dword888,4
        push_arg        dword889,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0017
label0016:
        push_all
        push_arg        sse134,4
        push_arg        sse135,4
        push_arg        sse136,4
        push_arg        sse137,4
        push_arg        dword887,4
        push_arg        dword889,4
        push_arg        dword888,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     dword422,dword874
        mov     dword424,1
        add     dword424,[dword422+4]
        mov     dword884,dword424
label0011:
        mov     dword427,dword873
        mov     dword430,[dword427+4]
        cmp     dword430,dword884
        jle     label0012
        mov     dword432,dword874
        mov     dword435,dword884
        sub     dword435,[dword432+4]
        mov     dword437,dword873
        mov     dword439,dword874
        mov     dword440,[dword437]
        sub     dword440,[dword439]
        imul    dword435,dword440
        mov     dword442,dword873
        mov     dword445,dword874
        mov     dword447,[dword442+4]
        sub     dword447,[dword445+4]
        cdq     dword448,dword435
        idiv    dword435,dword447
        mov     dword450,dword874
        add     dword435,[dword450]
        mov     dword885,dword435
        mov     dword453,dword875
        mov     dword456,dword884
        sub     dword456,[dword453+4]
        mov     dword458,dword873
        mov     dword460,dword875
        mov     dword461,[dword458]
        sub     dword461,[dword460]
        imul    dword456,dword461
        mov     dword463,dword873
        mov     dword466,dword875
        mov     dword468,[dword463+4]
        sub     dword468,[dword466+4]
        cdq     dword469,dword456
        idiv    dword456,dword468
        mov     dword471,dword875
        add     dword456,[dword471]
        mov     dword886,dword456
        mov     dword474,dword874
        mov     dword477,dword884
        sub     dword477,[dword474+4]
        cvtsi2ss        sse36,dword477
        movss   sse37,dword ptr [dword873+8]
        subss   sse37,dword ptr [dword874+8]
        mulss   sse36,sse37
        mov     dword483,dword873
        mov     dword486,dword874
        mov     dword488,[dword483+4]
        sub     dword488,[dword486+4]
        cvtsi2ss        sse38,dword488
        divss   sse36,sse38
        addss   sse36,dword ptr [dword874+8]
        movss   sse128,sse36
        mov     dword493,dword875
        mov     dword496,dword884
        sub     dword496,[dword493+4]
        cvtsi2ss        sse39,dword496
        movss   sse40,dword ptr [dword873+8]
        subss   sse40,dword ptr [dword875+8]
        mulss   sse39,sse40
        mov     dword502,dword873
        mov     dword505,dword875
        mov     dword507,[dword502+4]
        sub     dword507,[dword505+4]
        cvtsi2ss        sse41,dword507
        divss   sse39,sse41
        addss   sse39,dword ptr [dword875+8]
        movss   sse129,sse39
        mov     dword512,dword874
        mov     dword515,dword884
        sub     dword515,[dword512+4]
        cvtsi2ss        sse42,dword515
        movss   sse43,dword ptr [dword873+12]
        subss   sse43,dword ptr [dword874+12]
        mulss   sse42,sse43
        mov     dword523,dword873
        mov     dword526,dword874
        mov     dword528,[dword523+4]
        sub     dword528,[dword526+4]
        cvtsi2ss        sse44,dword528
        divss   sse42,sse44
        addss   sse42,dword ptr [dword874+12]
        movss   sse130,sse42
        mov     dword534,dword875
        mov     dword537,dword884
        sub     dword537,[dword534+4]
        cvtsi2ss        sse45,dword537
        movss   sse46,dword ptr [dword873+12]
        subss   sse46,dword ptr [dword875+12]
        mulss   sse45,sse46
        mov     dword545,dword873
        mov     dword548,dword875
        mov     dword550,[dword545+4]
        sub     dword550,[dword548+4]
        cvtsi2ss        sse47,dword550
        divss   sse45,sse47
        addss   sse45,dword ptr [dword875+12]
        movss   sse131,sse45
        mov     dword557,dword886
        sub     dword557,dword885
        cvtsi2ss        sse48,dword557
        movss   sse49,sse129
        subss   sse49,sse128
        divss   sse49,sse48
        movss   sse132,sse49
        mov     dword563,dword886
        sub     dword563,dword885
        cvtsi2ss        sse50,dword563
        movss   sse51,sse131
        subss   sse51,sse130
        divss   sse51,sse50
        movss   sse133,sse51
; start of inline function _rasterize_horiz_line__unordered
        movss   sse71,sse133
        movss   sse134,sse71
        movss   sse70,sse132
        movss   sse135,sse70
        movss   sse69,sse131
        movss   sse136,sse69
        movss   sse68,sse129
        movss   sse137,sse68
        movss   sse67,sse130
        movss   sse138,sse67
        movss   sse66,sse128
        movss   sse139,sse66
        mov     dword621,dword884
        mov     dword887,dword621
        mov     dword620,dword886
        mov     dword888,dword620
        mov     dword619,dword885
        mov     dword889,dword619
        mov     dword625,dword889
        cmp     dword625,dword888
        jg      label0019
        push_all
        push_arg        sse134,4
        push_arg        sse135,4
        push_arg        sse138,4
        push_arg        sse139,4
        push_arg        dword887,4
        push_arg        dword888,4
        push_arg        dword889,4
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
        push_arg        dword889,4
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
