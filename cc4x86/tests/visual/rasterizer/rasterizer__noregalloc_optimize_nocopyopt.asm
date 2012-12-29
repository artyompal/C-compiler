
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

_rasterizer_init proc
        create_stack_frame
        movss   float177,dword ptr [ebp+24]
        movss   float175,dword ptr [ebp+28]
        movss   float173,dword ptr [ebp+32]
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
        cvtsi2ss        float1,dword375
        cvtsi2ss        float2,dword376
        divss   float1,float2
        movss   float172,float1
        movss   float127,float173
        movss   float174,float127
        movss   float126,float175
        movss   float176,float126
        movss   float125,float177
        movss   float178,float125
        movss   float129,float174
        mulss   float129,float178
        movss   float179,float129
        movss   float130,float179
        mulss   float130,float172
        movss   float180,float130
        movss   float131,float178
        divss   float131,float180
        movss   dword ptr [__mvproj_matrix],float131
        mov     dword ptr [__mvproj_matrix+4],0
        mov     dword ptr [__mvproj_matrix+8],0
        mov     dword ptr [__mvproj_matrix+12],0
        mov     dword ptr [__mvproj_matrix+16],0
        movss   float136,float178
        divss   float136,float179
        movss   dword ptr [__mvproj_matrix+20],float136
        mov     dword ptr [__mvproj_matrix+24],0
        mov     dword ptr [__mvproj_matrix+28],0
        mov     dword ptr [__mvproj_matrix+32],0
        mov     dword ptr [__mvproj_matrix+36],0
        movss   float141,float176
        subss   float141,float178
        movss   float142,float176
        divss   float142,float141
        movss   dword ptr [__mvproj_matrix+40],float142
        mov     dword ptr [__mvproj_matrix+44],1065353216
        mov     dword ptr [__mvproj_matrix+48],0
        mov     dword ptr [__mvproj_matrix+52],0
        movss   float146,float178
        mulss   float146,float176
        movss   float147,float178
        subss   float147,float176
        divss   float146,float147
        movss   dword ptr [__mvproj_matrix+56],float146
        mov     dword ptr [__mvproj_matrix+60],0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   float150,float175
        movss   float181,float150
        movss   float149,float177
        movss   float182,float149
        cvtsi2ss        float3,dword376
        movss   float183,float3
        cvtsi2ss        float4,dword375
        movss   float184,float4
        movss   float153,float184
        mulss   float153,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix],float153
        mov     dword ptr [__viewport_matrix+4],0
        mov     dword ptr [__viewport_matrix+8],0
        mov     dword ptr [__viewport_matrix+12],0
        mov     dword ptr [__viewport_matrix+16],0
        movss   float158,float183
        xorps   float158,dword ptr [___unnamed_float4_4]
        mulss   float158,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+20],float158
        mov     dword ptr [__viewport_matrix+24],0
        mov     dword ptr [__viewport_matrix+28],0
        mov     dword ptr [__viewport_matrix+32],0
        mov     dword ptr [__viewport_matrix+36],0
        movss   float164,float181
        subss   float164,float182
        movss   dword ptr [__viewport_matrix+40],float164
        mov     dword ptr [__viewport_matrix+44],0
        movss   float167,float184
        mulss   float167,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+48],float167
        movss   float169,float183
        mulss   float169,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+52],float169
        movss   float170,float182
        movss   dword ptr [__viewport_matrix+56],float170
        mov     dword ptr [__viewport_matrix+60],1065353216
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   float61,float177
        movss   float186,float61
        mov     dword ptr [__clip_z_near_base],0
        mov     dword ptr [__clip_z_near_base+4],0
        movss   float65,float186
        movss   dword ptr [__clip_z_near_base+8],float65
        mov     dword ptr [__clip_z_near_base+12],1065353216
; end of inline function vec4f_assign
        movss   float8,float175
        comiss  float8,float177
        jbe     label0000
        movss   float189,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   float189,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
        movss   float67,float189
        movss   float186,float67
        mov     dword ptr [__clip_z_near_norm],0
        mov     dword ptr [__clip_z_near_norm+4],0
        movss   float71,float186
        movss   dword ptr [__clip_z_near_norm+8],float71
        mov     dword ptr [__clip_z_near_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   float73,float175
        movss   float186,float73
        mov     dword ptr [__clip_z_far_base],0
        mov     dword ptr [__clip_z_far_base+4],0
        movss   float77,float186
        movss   dword ptr [__clip_z_far_base+8],float77
        mov     dword ptr [__clip_z_far_base+12],1065353216
; end of inline function vec4f_assign
        movss   float17,float175
        comiss  float17,float177
        jbe     label0002
        movss   float190,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   float190,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
        movss   float79,float190
        movss   float186,float79
        mov     dword ptr [__clip_z_far_norm],0
        mov     dword ptr [__clip_z_far_norm+4],0
        movss   float83,float186
        movss   dword ptr [__clip_z_far_norm+8],float83
        mov     dword ptr [__clip_z_far_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        float26,dword375
        movss   float27,dword ptr [___unnamed_float_1]
        divss   float27,float26
        movss   float28,dword ptr [___unnamed_float_5]
        addss   float28,float27
        movss   float188,float28
        movss   float86,float188
        movss   dword ptr [__clip_plane_left_base],float86
        mov     dword ptr [__clip_plane_left_base+4],0
        mov     dword ptr [__clip_plane_left_base+8],0
        mov     dword ptr [__clip_plane_left_base+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_left_norm],1065353216
        mov     dword ptr [__clip_plane_left_norm+4],0
        mov     dword ptr [__clip_plane_left_norm+8],0
        mov     dword ptr [__clip_plane_left_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        float36,dword375
        movss   float37,dword ptr [___unnamed_float_1]
        divss   float37,float36
        movss   float38,dword ptr [___unnamed_float_1]
        subss   float38,float37
        movss   float188,float38
        movss   float96,float188
        movss   dword ptr [__clip_plane_right_base],float96
        mov     dword ptr [__clip_plane_right_base+4],0
        mov     dword ptr [__clip_plane_right_base+8],0
        mov     dword ptr [__clip_plane_right_base+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_right_norm],-1082130432
        mov     dword ptr [__clip_plane_right_norm+4],0
        mov     dword ptr [__clip_plane_right_norm+8],0
        mov     dword ptr [__clip_plane_right_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        float45,dword376
        movss   float46,dword ptr [___unnamed_float_1]
        divss   float46,float45
        movss   float47,dword ptr [___unnamed_float_5]
        addss   float47,float46
        movss   float187,float47
        mov     dword ptr [__clip_plane_top_base],0
        movss   float107,float187
        movss   dword ptr [__clip_plane_top_base+4],float107
        mov     dword ptr [__clip_plane_top_base+8],0
        mov     dword ptr [__clip_plane_top_base+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_top_norm],0
        mov     dword ptr [__clip_plane_top_norm+4],1065353216
        mov     dword ptr [__clip_plane_top_norm+8],0
        mov     dword ptr [__clip_plane_top_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_bottom_base],0
        mov     dword ptr [__clip_plane_bottom_base+4],1065353216
        mov     dword ptr [__clip_plane_bottom_base+8],0
        mov     dword ptr [__clip_plane_bottom_base+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_bottom_norm],0
        mov     dword ptr [__clip_plane_bottom_norm+4],-1082130432
        mov     dword ptr [__clip_plane_bottom_norm+8],0
        mov     dword ptr [__clip_plane_bottom_norm+12],1065353216
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
        rep     movsd   dword4,dword5,dword6
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
        movss   float22,dword ptr [ebp+32]
        movss   float21,dword ptr [ebp+28]
        movss   float18,dword ptr [ebp+20]
        movss   float16,dword ptr [ebp+24]
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
        movss   float12,float16
        movss   float17,float12
        movss   float11,float18
        movss   float19,float11
        mov     dword85,dword ptr [__texture_width]
        dec     dword85
        cvtsi2ss        float14,dword85
        mulss   float14,float19
        cvttss2si       dword87,float14
        mov     dword107,dword87
        mov     dword91,dword ptr [__texture_height]
        dec     dword91
        cvtsi2ss        float15,dword91
        mulss   float15,float17
        cvttss2si       dword93,float15
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
        cvtsi2ss        float1,dword111
        mulss   float1,dword ptr [___unnamed_float_6]
        movss   float20,float1
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
        cvtsi2ss        float3,dword115
        mulss   float3,float20
        cvtsi2ss        float4,dword113
        movss   float5,dword ptr [___unnamed_float_1]
        subss   float5,float20
        mulss   float4,float5
        addss   float3,float4
        cvttss2si       dword57,float3
        mov     dword115,dword57
        cvtsi2ss        float6,dword116
        mulss   float6,float20
        cvtsi2ss        float7,dword114
        movss   float8,dword ptr [___unnamed_float_1]
        subss   float8,float20
        mulss   float7,float8
        addss   float6,float7
        cvttss2si       dword64,float6
        mov     dword116,dword64
        mov     dword68,dword115
        sal     dword68,8
        add     dword68,dword116
        mov     dword117,dword68
        mov     dword72,dword104
        mov     dword74,dword117
        mov     [dword72],dword74
label0003:
        movss   float9,float18
        addss   float9,float21
        movss   float18,float9
        movss   float10,float16
        addss   float10,float22
        movss   float16,float10
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
        mov     dword2,dword350
        mov     dword ptr [dword2+192],0
        mov     dword5,dword351
        mov     dword352,dword5
        mov     dword8,dword351
        add     dword8,24
        mov     dword353,dword8
label0001:
        mov     dword12,dword351
        mov     dword14,[dword12+192]
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
        movss   float28,dword ptr [dword165]
        subss   float28,dword ptr [dword167]
        mov     dword169,dword357
        movss   dword ptr [dword169],float28
        mov     dword171,dword356
        mov     dword173,dword355
        movss   float29,dword ptr [dword171+4]
        subss   float29,dword ptr [dword173+4]
        mov     dword175,dword357
        movss   dword ptr [dword175+4],float29
        mov     dword177,dword356
        mov     dword179,dword355
        movss   float30,dword ptr [dword177+8]
        subss   float30,dword ptr [dword179+8]
        mov     dword181,dword357
        movss   dword ptr [dword181+8],float30
        mov     dword183,dword356
        mov     dword185,dword355
        movss   float31,dword ptr [dword183+12]
        subss   float31,dword ptr [dword185+12]
        mov     dword187,dword357
        movss   dword ptr [dword187+12],float31
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword265,dword358
        mov     dword359,dword265
        lea     dword23,[ebp-24]
        mov     dword360,dword23
        mov     dword268,dword360
        mov     dword270,dword359
        movss   float48,dword ptr [dword268+4]
        mulss   float48,dword ptr [dword270+4]
        mov     dword272,dword360
        mov     dword274,dword359
        movss   float49,dword ptr [dword272]
        mulss   float49,dword ptr [dword274]
        addss   float49,float48
        mov     dword276,dword360
        mov     dword278,dword359
        movss   float50,dword ptr [dword276+8]
        mulss   float50,dword ptr [dword278+8]
        addss   float49,float50
        mov     dword280,dword360
        mov     dword282,dword359
        movss   float51,dword ptr [dword280+12]
        mulss   float51,dword ptr [dword282+12]
        addss   float49,float51
        movss   float73,float49
; end of inline function vec4f_dot
        movss   float1,float73
        movss   float74,float1
; start of inline function vec4f_subtract
        mov     dword188,dword354
        mov     dword355,dword188
        mov     dword27,dword353
        mov     dword356,dword27
        lea     dword28,[ebp-24]
        mov     dword357,dword28
        mov     dword191,dword356
        mov     dword193,dword355
        movss   float33,dword ptr [dword191]
        subss   float33,dword ptr [dword193]
        mov     dword195,dword357
        movss   dword ptr [dword195],float33
        mov     dword197,dword356
        mov     dword199,dword355
        movss   float34,dword ptr [dword197+4]
        subss   float34,dword ptr [dword199+4]
        mov     dword201,dword357
        movss   dword ptr [dword201+4],float34
        mov     dword203,dword356
        mov     dword205,dword355
        movss   float35,dword ptr [dword203+8]
        subss   float35,dword ptr [dword205+8]
        mov     dword207,dword357
        movss   dword ptr [dword207+8],float35
        mov     dword209,dword356
        mov     dword211,dword355
        movss   float36,dword ptr [dword209+12]
        subss   float36,dword ptr [dword211+12]
        mov     dword213,dword357
        movss   dword ptr [dword213+12],float36
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword283,dword358
        mov     dword359,dword283
        lea     dword30,[ebp-24]
        mov     dword360,dword30
        mov     dword286,dword360
        mov     dword288,dword359
        movss   float53,dword ptr [dword286+4]
        mulss   float53,dword ptr [dword288+4]
        mov     dword290,dword360
        mov     dword292,dword359
        movss   float54,dword ptr [dword290]
        mulss   float54,dword ptr [dword292]
        addss   float54,float53
        mov     dword294,dword360
        mov     dword296,dword359
        movss   float55,dword ptr [dword294+8]
        mulss   float55,dword ptr [dword296+8]
        addss   float54,float55
        mov     dword298,dword360
        mov     dword300,dword359
        movss   float56,dword ptr [dword298+12]
        mulss   float56,dword ptr [dword300+12]
        addss   float54,float56
        movss   float73,float54
; end of inline function vec4f_dot
        movss   float2,float73
        movss   float75,float2
        movss   float3,dword ptr [___unnamed_float_2]
        comiss  float3,float74
        ja      label0003
        mov     dword35,dword350
        mov     dword36,[dword35+192]
        inc     dword ptr [dword35+192]
        imul    dword36,24
        mov     dword39,dword350
        mov     dword41,dword352
        movq    double4,qword ptr [dword41]
        movq    qword ptr [dword39+dword36],double4
        movq    double4,qword ptr [dword41+8]
        movq    qword ptr [dword39+dword36+8],double4
        movq    double4,qword ptr [dword41+16]
        movq    qword ptr [dword39+dword36+16],double4
label0003:
        movss   float5,dword ptr [___unnamed_float_2]
        comiss  float5,float74
        jae     label0006
        movss   float6,dword ptr [___unnamed_float_2]
        comiss  float6,float75
        ja      label0005
label0006:
        movss   float7,dword ptr [___unnamed_float_2]
        comiss  float7,float75
        ja      label0004
        movss   float8,dword ptr [___unnamed_float_2]
        comiss  float8,float74
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
        movss   float38,dword ptr [dword217]
        subss   float38,dword ptr [dword219]
        mov     dword221,dword357
        movss   dword ptr [dword221],float38
        mov     dword223,dword356
        mov     dword225,dword355
        movss   float39,dword ptr [dword223+4]
        subss   float39,dword ptr [dword225+4]
        mov     dword227,dword357
        movss   dword ptr [dword227+4],float39
        mov     dword229,dword356
        mov     dword231,dword355
        movss   float40,dword ptr [dword229+8]
        subss   float40,dword ptr [dword231+8]
        mov     dword233,dword357
        movss   dword ptr [dword233+8],float40
        mov     dword235,dword356
        mov     dword237,dword355
        movss   float41,dword ptr [dword235+12]
        subss   float41,dword ptr [dword237+12]
        mov     dword239,dword357
        movss   dword ptr [dword239+12],float41
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
        movss   float43,dword ptr [dword242]
        subss   float43,dword ptr [dword244]
        mov     dword246,dword357
        movss   dword ptr [dword246],float43
        mov     dword248,dword356
        mov     dword250,dword355
        movss   float44,dword ptr [dword248+4]
        subss   float44,dword ptr [dword250+4]
        mov     dword252,dword357
        movss   dword ptr [dword252+4],float44
        mov     dword254,dword356
        mov     dword256,dword355
        movss   float45,dword ptr [dword254+8]
        subss   float45,dword ptr [dword256+8]
        mov     dword258,dword357
        movss   dword ptr [dword258+8],float45
        mov     dword260,dword356
        mov     dword262,dword355
        movss   float46,dword ptr [dword260+12]
        subss   float46,dword ptr [dword262+12]
        mov     dword264,dword357
        movss   dword ptr [dword264+12],float46
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     dword301,dword358
        mov     dword359,dword301
        lea     dword60,[ebp-24]
        mov     dword360,dword60
        mov     dword304,dword360
        mov     dword306,dword359
        movss   float58,dword ptr [dword304+4]
        mulss   float58,dword ptr [dword306+4]
        mov     dword308,dword360
        mov     dword310,dword359
        movss   float59,dword ptr [dword308]
        mulss   float59,dword ptr [dword310]
        addss   float59,float58
        mov     dword312,dword360
        mov     dword314,dword359
        movss   float60,dword ptr [dword312+8]
        mulss   float60,dword ptr [dword314+8]
        addss   float59,float60
        mov     dword316,dword360
        mov     dword318,dword359
        movss   float61,dword ptr [dword316+12]
        mulss   float61,dword ptr [dword318+12]
        addss   float59,float61
        movss   float73,float59
; end of inline function vec4f_dot
        movss   float9,float73
; start of inline function vec4f_dot
        mov     dword319,dword358
        mov     dword359,dword319
        lea     dword62,[ebp-40]
        mov     dword360,dword62
        mov     dword322,dword360
        mov     dword324,dword359
        movss   float63,dword ptr [dword322+4]
        mulss   float63,dword ptr [dword324+4]
        mov     dword326,dword360
        mov     dword328,dword359
        movss   float64,dword ptr [dword326]
        mulss   float64,dword ptr [dword328]
        addss   float64,float63
        mov     dword330,dword360
        mov     dword332,dword359
        movss   float65,dword ptr [dword330+8]
        mulss   float65,dword ptr [dword332+8]
        addss   float64,float65
        mov     dword334,dword360
        mov     dword336,dword359
        movss   float66,dword ptr [dword334+12]
        mulss   float66,dword ptr [dword336+12]
        addss   float64,float66
        movss   float73,float64
; end of inline function vec4f_dot
        movss   float10,float73
        divss   float9,float10
        movss   float76,float9
; start of inline function vec4f_mul
        movss   float67,float76
        movss   float77,float67
        lea     dword65,[ebp-40]
        mov     dword361,dword65
        mov     dword339,dword361
        movss   float69,dword ptr [dword339]
        mulss   float69,float77
        movss   dword ptr [dword339],float69
        mov     dword342,dword361
        movss   float70,dword ptr [dword342+4]
        mulss   float70,float77
        movss   dword ptr [dword342+4],float70
        mov     dword345,dword361
        movss   float71,dword ptr [dword345+8]
        mulss   float71,float77
        movss   dword ptr [dword345+8],float71
        mov     dword348,dword361
        movss   float72,dword ptr [dword348+12]
        mulss   float72,float77
        movss   dword ptr [dword348+12],float72
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     dword66,[ebp-40]
        mov     dword362,dword66
        mov     dword68,dword352
        mov     dword363,dword68
        mov     dword70,dword350
        mov     dword72,[dword70+192]
        imul    dword72,24
        mov     dword74,dword350
        add     dword74,dword72
        mov     dword364,dword74
        mov     dword139,dword363
        mov     dword141,dword362
        movss   float23,dword ptr [dword139]
        addss   float23,dword ptr [dword141]
        mov     dword143,dword364
        movss   dword ptr [dword143],float23
        mov     dword145,dword363
        mov     dword147,dword362
        movss   float24,dword ptr [dword145+4]
        addss   float24,dword ptr [dword147+4]
        mov     dword149,dword364
        movss   dword ptr [dword149+4],float24
        mov     dword151,dword363
        mov     dword153,dword362
        movss   float25,dword ptr [dword151+8]
        addss   float25,dword ptr [dword153+8]
        mov     dword155,dword364
        movss   dword ptr [dword155+8],float25
        mov     dword157,dword363
        mov     dword159,dword362
        movss   float26,dword ptr [dword157+12]
        addss   float26,dword ptr [dword159+12]
        mov     dword161,dword364
        movss   dword ptr [dword161+12],float26
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     dword76,dword352
        add     dword76,16
        mov     dword365,dword76
        mov     dword78,dword353
        add     dword78,16
        mov     dword366,dword78
        lea     dword79,[ebp-48]
        mov     dword367,dword79
        mov     dword119,dword366
        mov     dword121,dword365
        movss   float16,dword ptr [dword119]
        subss   float16,dword ptr [dword121]
        mov     dword123,dword367
        movss   dword ptr [dword123],float16
        mov     dword125,dword366
        mov     dword127,dword365
        movss   float17,dword ptr [dword125+4]
        subss   float17,dword ptr [dword127+4]
        mov     dword129,dword367
        movss   dword ptr [dword129+4],float17
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   float18,float76
        movss   float78,float18
        lea     dword81,[ebp-48]
        mov     dword368,dword81
        mov     dword132,dword368
        movss   float20,dword ptr [dword132]
        mulss   float20,float78
        movss   dword ptr [dword132],float20
        mov     dword135,dword368
        movss   float21,dword ptr [dword135+4]
        mulss   float21,float78
        movss   dword ptr [dword135+4],float21
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     dword82,[ebp-48]
        mov     dword369,dword82
        mov     dword84,dword352
        add     dword84,16
        mov     dword370,dword84
        mov     dword86,dword350
        mov     dword88,[dword86+192]
        imul    dword88,24
        mov     dword90,dword350
        add     dword90,dword88
        add     dword90,16
        mov     dword371,dword90
        mov     dword106,dword370
        mov     dword108,dword369
        movss   float13,dword ptr [dword106]
        addss   float13,dword ptr [dword108]
        mov     dword110,dword371
        movss   dword ptr [dword110],float13
        mov     dword112,dword370
        mov     dword114,dword369
        movss   float14,dword ptr [dword112+4]
        addss   float14,dword ptr [dword114+4]
        mov     dword116,dword371
        movss   dword ptr [dword116+4],float14
; end of inline function vec2f_add
        mov     dword93,dword350
        inc     dword ptr [dword93+192]
label0004:
        add     dword352,24
        add     dword353,24
        jmp     label0001
label0002:
        mov     dword97,dword350
        mov     dword98,[dword97+192]
        inc     dword ptr [dword97+192]
        imul    dword98,24
        mov     dword101,dword350
        mov     dword103,dword350
        movq    double11,qword ptr [dword103]
        movq    qword ptr [dword101+dword98],double11
        movq    double11,qword ptr [dword103+8]
        movq    qword ptr [dword101+dword98+8],double11
        movq    double11,qword ptr [dword103+16]
        movq    qword ptr [dword101+dword98+16],double11
        destroy_stack_frame
        ret
__clip_on_plain endp

__transform_to_projection_space proc
        create_stack_frame
        mov     dword103,[ebp+8]
        mov     dword99,[ebp+12]
; start of inline function vec4f_assign
        mov     dword3,dword99
        movss   float4,dword ptr [dword3+8]
        movss   float28,float4
        mov     dword5,dword99
        movss   float3,dword ptr [dword5+4]
        movss   float29,float3
        mov     dword7,dword99
        movss   float2,dword ptr [dword7]
        movss   float30,float2
        lea     dword8,[ebp-16]
        mov     dword100,dword8
        mov     dword14,dword100
        movss   float6,float30
        movss   dword ptr [dword14],float6
        mov     dword17,dword100
        movss   float7,float29
        movss   dword ptr [dword17+4],float7
        mov     dword20,dword100
        movss   float8,float28
        movss   dword ptr [dword20+8],float8
        mov     dword23,dword100
        mov     dword ptr [dword23+12],1065353216
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        lea     dword10,[ebp-16]
        mov     dword102,dword10
        mov     dword25,dword103
        mov     dword104,dword25
        mov     dword28,dword102
        movss   float11,dword ptr [dword28+4]
        mulss   float11,dword ptr [__mvproj_matrix+16]
        mov     dword32,dword102
        movss   float12,dword ptr [dword32]
        mulss   float12,dword ptr [__mvproj_matrix]
        addss   float12,float11
        mov     dword36,dword102
        movss   float13,dword ptr [dword36+8]
        mulss   float13,dword ptr [__mvproj_matrix+32]
        addss   float12,float13
        mov     dword40,dword102
        movss   float14,dword ptr [dword40+12]
        mulss   float14,dword ptr [__mvproj_matrix+48]
        addss   float12,float14
        mov     dword44,dword104
        movss   dword ptr [dword44],float12
        mov     dword48,dword102
        movss   float15,dword ptr [dword48]
        mulss   float15,dword ptr [__mvproj_matrix+4]
        mov     dword50,dword102
        movss   float16,dword ptr [dword50+4]
        mulss   float16,dword ptr [__mvproj_matrix+20]
        addss   float15,float16
        mov     dword54,dword102
        movss   float17,dword ptr [dword54+8]
        mulss   float17,dword ptr [__mvproj_matrix+36]
        addss   float15,float17
        mov     dword58,dword102
        movss   float18,dword ptr [dword58+12]
        mulss   float18,dword ptr [__mvproj_matrix+52]
        addss   float15,float18
        mov     dword62,dword104
        movss   dword ptr [dword62+4],float15
        mov     dword66,dword102
        movss   float19,dword ptr [dword66]
        mulss   float19,dword ptr [__mvproj_matrix+8]
        mov     dword68,dword102
        movss   float20,dword ptr [dword68+4]
        mulss   float20,dword ptr [__mvproj_matrix+24]
        addss   float19,float20
        mov     dword72,dword102
        movss   float21,dword ptr [dword72+8]
        mulss   float21,dword ptr [__mvproj_matrix+40]
        addss   float19,float21
        mov     dword76,dword102
        movss   float22,dword ptr [dword76+12]
        mulss   float22,dword ptr [__mvproj_matrix+56]
        addss   float19,float22
        mov     dword80,dword104
        movss   dword ptr [dword80+8],float19
        mov     dword84,dword102
        movss   float23,dword ptr [dword84]
        mulss   float23,dword ptr [__mvproj_matrix+12]
        mov     dword86,dword102
        movss   float24,dword ptr [dword86+4]
        mulss   float24,dword ptr [__mvproj_matrix+28]
        addss   float23,float24
        mov     dword90,dword102
        movss   float25,dword ptr [dword90+8]
        mulss   float25,dword ptr [__mvproj_matrix+44]
        addss   float23,float25
        mov     dword94,dword102
        movss   float26,dword ptr [dword94+12]
        mulss   float26,dword ptr [__mvproj_matrix+60]
        addss   float23,float26
        mov     dword98,dword104
        movss   dword ptr [dword98+12],float23
; end of inline function matrix4f_transform
        destroy_stack_frame
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        create_stack_frame
        mov     dword858,[ebp+28]
        mov     dword857,[ebp+16]
        mov     dword856,[ebp+24]
        mov     dword855,[ebp+12]
        mov     dword854,[ebp+20]
        mov     dword853,[ebp+8]
        push_all
        push_arg        dword853,4
        lea     dword2,[ebp-196]
        push_arg        dword2,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        mov     dword6,dword854
        movq    double1,qword ptr [dword6]
        movq    qword ptr [ebp-180],double1
        push_all
        push_arg        dword855,4
        lea     dword8,[ebp-196]
        add     dword8,24
        push_arg        dword8,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        mov     dword14,dword856
        movq    double2,qword ptr [dword14]
        movq    qword ptr [ebp-156],double2
        push_all
        push_arg        dword857,4
        lea     dword16,[ebp-196]
        add     dword16,48
        push_arg        dword16,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        mov     dword22,dword858
        movq    double3,qword ptr [dword22]
        movq    qword ptr [ebp-132],double3
        movq    double4,qword ptr [ebp-196]
        movq    qword ptr [ebp-124],double4
        movq    double4,qword ptr [ebp-188]
        movq    qword ptr [ebp-116],double4
        movq    double4,qword ptr [ebp-180]
        movq    qword ptr [ebp-108],double4
; start of inline function _rasterize_polygon_4f
        mov     dword ptr [ebp-4],4
        lea     dword29,[ebp-196]
        mov     dword860,dword29
; start of inline function _clip_poligon
        mov     dword714,dword860
        mov     dword861,dword714
        push_all
        push_arg        (offset __clip_z_far_norm),4
        push_arg        (offset __clip_z_far_base),4
        push_arg        dword861,4
        lea     dword719,[ebp-660]
        push_arg        dword719,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_z_near_norm),4
        push_arg        (offset __clip_z_near_base),4
        lea     dword722,[ebp-660]
        push_arg        dword722,4
        push_arg        dword861,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_left_norm),4
        push_arg        (offset __clip_plane_left_base),4
        push_arg        dword861,4
        lea     dword727,[ebp-660]
        push_arg        dword727,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_right_norm),4
        push_arg        (offset __clip_plane_right_base),4
        lea     dword730,[ebp-660]
        push_arg        dword730,4
        push_arg        dword861,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_top_norm),4
        push_arg        (offset __clip_plane_top_base),4
        push_arg        dword861,4
        lea     dword735,[ebp-660]
        push_arg        dword735,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_bottom_norm),4
        push_arg        (offset __clip_plane_bottom_base),4
        lea     dword738,[ebp-660]
        push_arg        dword738,4
        push_arg        dword861,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        mov     dword741,dword861
        cmp     dword ptr [dword741+192],1
        setg    byte8
        movzx   dword743,byte8
        mov     dword862,dword743
; end of inline function _clip_poligon
        mov     dword32,dword862
        cmp     dword32,0
        jne     label0000
        jmp     label002d
label0000:
        mov     dword34,dword860
        cmp     dword ptr [dword34+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword863,0
label0003:
        mov     dword41,dword860
        mov     dword43,[dword41+192]
        cmp     dword43,dword863
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword45,dword860
        mov     dword48,dword863
        imul    dword48,24
        add     dword45,dword48
        mov     dword864,dword45
        lea     dword49,[ebp-332]
        mov     dword52,dword863
        sal     dword52,4
        add     dword49,dword52
        mov     dword865,dword49
; start of inline function matrix4f_transform
        mov     dword779,dword864
        mov     dword867,dword779
        lea     dword747,[ebp-688]
        mov     dword868,dword747
        mov     dword782,dword867
        movss   float86,dword ptr [dword782+4]
        mulss   float86,dword ptr [__viewport_matrix+16]
        mov     dword786,dword867
        movss   float87,dword ptr [dword786]
        mulss   float87,dword ptr [__viewport_matrix]
        addss   float87,float86
        mov     dword790,dword867
        movss   float88,dword ptr [dword790+8]
        mulss   float88,dword ptr [__viewport_matrix+32]
        addss   float87,float88
        mov     dword794,dword867
        movss   float89,dword ptr [dword794+12]
        mulss   float89,dword ptr [__viewport_matrix+48]
        addss   float87,float89
        mov     dword798,dword868
        movss   dword ptr [dword798],float87
        mov     dword802,dword867
        movss   float90,dword ptr [dword802]
        mulss   float90,dword ptr [__viewport_matrix+4]
        mov     dword804,dword867
        movss   float91,dword ptr [dword804+4]
        mulss   float91,dword ptr [__viewport_matrix+20]
        addss   float90,float91
        mov     dword808,dword867
        movss   float92,dword ptr [dword808+8]
        mulss   float92,dword ptr [__viewport_matrix+36]
        addss   float90,float92
        mov     dword812,dword867
        movss   float93,dword ptr [dword812+12]
        mulss   float93,dword ptr [__viewport_matrix+52]
        addss   float90,float93
        mov     dword816,dword868
        movss   dword ptr [dword816+4],float90
        mov     dword820,dword867
        movss   float94,dword ptr [dword820]
        mulss   float94,dword ptr [__viewport_matrix+8]
        mov     dword822,dword867
        movss   float95,dword ptr [dword822+4]
        mulss   float95,dword ptr [__viewport_matrix+24]
        addss   float94,float95
        mov     dword826,dword867
        movss   float96,dword ptr [dword826+8]
        mulss   float96,dword ptr [__viewport_matrix+40]
        addss   float94,float96
        mov     dword830,dword867
        movss   float97,dword ptr [dword830+12]
        mulss   float97,dword ptr [__viewport_matrix+56]
        addss   float94,float97
        mov     dword834,dword868
        movss   dword ptr [dword834+8],float94
        mov     dword838,dword867
        movss   float98,dword ptr [dword838]
        mulss   float98,dword ptr [__viewport_matrix+12]
        mov     dword840,dword867
        movss   float99,dword ptr [dword840+4]
        mulss   float99,dword ptr [__viewport_matrix+28]
        addss   float98,float99
        mov     dword844,dword867
        movss   float100,dword ptr [dword844+8]
        mulss   float100,dword ptr [__viewport_matrix+44]
        addss   float98,float100
        mov     dword848,dword867
        movss   float101,dword ptr [dword848+12]
        mulss   float101,dword ptr [__viewport_matrix+60]
        addss   float98,float101
        mov     dword852,dword868
        movss   dword ptr [dword852+12],float98
; end of inline function matrix4f_transform
        movss   float82,dword ptr [___unnamed_float_1]
        divss   float82,float102
        movss   float103,float82
        movss   float83,float104
        mulss   float83,float103
        cvttss2si       dword754,float83
        mov     dword756,dword865
        mov     [dword756],dword754
        movss   float84,float105
        mulss   float84,float103
        cvttss2si       dword760,float84
        mov     dword762,dword865
        mov     [dword762+4],dword760
        mov     dword764,dword865
        cmp     dword ptr [dword764],0
        jl      label002a
        mov     dword767,dword865
        mov     dword769,[dword767]
        cmp     dword769,dword ptr [__width]
        jge     label002a
        mov     dword771,dword865
        cmp     dword ptr [dword771+4],0
        jl      label002a
        mov     dword774,dword865
        mov     dword776,[dword774+4]
        cmp     dword776,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     dword53,[ebp-332]
        mov     dword56,dword863
        sal     dword56,4
        mov     dword59,dword860
        mov     dword62,dword863
        imul    dword62,24
        movq    double6,qword ptr [dword59+dword62+16]
        movq    qword ptr [dword53+dword56+8],double6
        inc     dword863
        jmp     label0003
label0004:
        mov     dword863,2
label0006:
        mov     dword68,dword860
        mov     dword70,[dword68+192]
        dec     dword70
        cmp     dword70,dword863
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     dword72,[ebp-332]
        mov     dword75,dword863
        sal     dword75,4
        add     dword72,dword75
        mov     dword869,dword72
        mov     dword78,dword863
        dec     dword78
        sal     dword78,4
        lea     dword80,[ebp-332]
        add     dword80,dword78
        mov     dword870,dword80
        lea     dword81,[ebp-332]
        mov     dword871,dword81
        mov     dword85,dword871
        mov     dword88,dword870
        mov     dword90,[dword85+4]
        cmp     dword90,[dword88+4]
        jle     label0008
        mov     dword93,dword871
        mov     dword872,dword93
        mov     dword96,dword870
        mov     dword871,dword96
        mov     dword99,dword872
        mov     dword870,dword99
label0008:
        mov     dword101,dword871
        mov     dword104,dword869
        mov     dword106,[dword101+4]
        cmp     dword106,[dword104+4]
        jle     label0009
        mov     dword109,dword871
        mov     dword872,dword109
        mov     dword112,dword869
        mov     dword871,dword112
        mov     dword115,dword872
        mov     dword869,dword115
label0009:
        mov     dword117,dword870
        mov     dword120,dword869
        mov     dword122,[dword117+4]
        cmp     dword122,[dword120+4]
        jle     label000a
        mov     dword125,dword870
        mov     dword872,dword125
        mov     dword128,dword869
        mov     dword870,dword128
        mov     dword131,dword872
        mov     dword869,dword131
label000a:
        mov     dword133,dword871
        mov     dword136,dword869
        mov     dword138,[dword133+4]
        cmp     dword138,[dword136+4]
        jne     label000b
        mov     dword140,dword871
        cmp     dword ptr [dword140+4],0
        jl      label000c
        mov     dword144,dword871
        mov     dword147,[dword144+4]
        cmp     dword147,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   float106,dword ptr [___unnamed_float_2]
        movss   float107,dword ptr [___unnamed_float_2]
        mov     dword151,dword869
        add     dword151,8
        mov     dword873,dword151
        mov     dword153,dword870
        add     dword153,8
        mov     dword874,dword153
        mov     dword155,dword871
        add     dword155,8
        mov     dword875,dword155
        mov     dword157,dword871
        mov     dword643,[dword157+4]
        mov     dword876,dword643
        mov     dword160,dword869
        mov     dword642,[dword160]
        mov     dword877,dword642
        mov     dword162,dword870
        mov     dword641,[dword162]
        mov     dword878,dword641
        mov     dword164,dword871
        mov     dword640,[dword164]
        mov     dword879,dword640
        mov     dword647,dword879
        cmp     dword647,dword878
        jge     label001c
        mov     dword650,dword877
        cmp     dword650,dword878
        jle     label001d
        push_all
        push_arg        float106,4
        push_arg        float107,4
        mov     dword654,dword875
        push_arg        dword ptr [dword654+4],4
        mov     dword656,dword875
        push_arg        dword ptr [dword656],4
        push_arg        dword876,4
        push_arg        dword877,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        mov     dword662,dword877
        cmp     dword662,dword879
        jge     label001f
        push_all
        push_arg        float106,4
        push_arg        float107,4
        mov     dword666,dword873
        push_arg        dword ptr [dword666+4],4
        mov     dword668,dword873
        push_arg        dword ptr [dword668],4
        push_arg        dword876,4
        push_arg        dword878,4
        push_arg        dword877,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        float106,4
        push_arg        float107,4
        mov     dword675,dword875
        push_arg        dword ptr [dword675+4],4
        mov     dword677,dword875
        push_arg        dword ptr [dword677],4
        push_arg        dword876,4
        push_arg        dword878,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0020:
label001e:
        jmp     label0021
label001c:
        mov     dword683,dword877
        cmp     dword683,dword878
        jge     label0022
        push_all
        movss   float74,float106
        xorps   float74,dword ptr [___unnamed_float4_4]
        push_arg        float74,4
        movss   float75,float107
        xorps   float75,dword ptr [___unnamed_float4_4]
        push_arg        float75,4
        mov     dword687,dword873
        push_arg        dword ptr [dword687+4],4
        mov     dword689,dword873
        push_arg        dword ptr [dword689],4
        push_arg        dword876,4
        push_arg        dword879,4
        push_arg        dword877,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        mov     dword695,dword877
        cmp     dword695,dword879
        jle     label0024
        push_all
        movss   float76,float106
        xorps   float76,dword ptr [___unnamed_float4_4]
        push_arg        float76,4
        movss   float77,float107
        xorps   float77,dword ptr [___unnamed_float4_4]
        push_arg        float77,4
        mov     dword699,dword874
        push_arg        dword ptr [dword699+4],4
        mov     dword701,dword874
        push_arg        dword ptr [dword701],4
        push_arg        dword876,4
        push_arg        dword877,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0025
label0024:
        push_all
        movss   float78,float106
        xorps   float78,dword ptr [___unnamed_float4_4]
        push_arg        float78,4
        movss   float79,float107
        xorps   float79,dword ptr [___unnamed_float4_4]
        push_arg        float79,4
        mov     dword708,dword874
        push_arg        dword ptr [dword708+4],4
        mov     dword710,dword874
        push_arg        dword ptr [dword710],4
        push_arg        dword876,4
        push_arg        dword879,4
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
        mov     dword166,dword871
        mov     dword169,[dword166+4]
        mov     dword880,dword169
label000e:
        mov     dword171,dword870
        mov     dword174,[dword171+4]
        cmp     dword174,dword880
        jle     label000f
        mov     dword176,dword871
        mov     dword179,dword880
        sub     dword179,[dword176+4]
        mov     dword181,dword870
        mov     dword183,dword871
        mov     dword184,[dword181]
        sub     dword184,[dword183]
        imul    dword179,dword184
        mov     dword186,dword870
        mov     dword189,dword871
        mov     dword191,[dword186+4]
        sub     dword191,[dword189+4]
        cdq     dword192,dword179
        idiv    dword179,dword191,dword192
        mov     dword194,dword871
        add     dword179,[dword194]
        mov     dword881,dword179
        mov     dword197,dword871
        mov     dword200,dword880
        sub     dword200,[dword197+4]
        mov     dword202,dword869
        mov     dword204,dword871
        mov     dword205,[dword202]
        sub     dword205,[dword204]
        imul    dword200,dword205
        mov     dword207,dword869
        mov     dword210,dword871
        mov     dword212,[dword207+4]
        sub     dword212,[dword210+4]
        cdq     dword213,dword200
        idiv    dword200,dword212,dword213
        mov     dword215,dword871
        add     dword200,[dword215]
        mov     dword882,dword200
        mov     dword218,dword871
        mov     dword221,dword880
        sub     dword221,[dword218+4]
        cvtsi2ss        float10,dword221
        mov     dword223,dword870
        mov     dword225,dword871
        movss   float11,dword ptr [dword223+8]
        subss   float11,dword ptr [dword225+8]
        mulss   float10,float11
        mov     dword227,dword870
        mov     dword230,dword871
        mov     dword232,[dword227+4]
        sub     dword232,[dword230+4]
        cvtsi2ss        float12,dword232
        divss   float10,float12
        mov     dword234,dword871
        addss   float10,dword ptr [dword234+8]
        movss   float108,float10
        mov     dword237,dword871
        mov     dword240,dword880
        sub     dword240,[dword237+4]
        cvtsi2ss        float13,dword240
        mov     dword242,dword869
        mov     dword244,dword871
        movss   float14,dword ptr [dword242+8]
        subss   float14,dword ptr [dword244+8]
        mulss   float13,float14
        mov     dword246,dword869
        mov     dword249,dword871
        mov     dword251,[dword246+4]
        sub     dword251,[dword249+4]
        cvtsi2ss        float15,dword251
        divss   float13,float15
        mov     dword253,dword871
        addss   float13,dword ptr [dword253+8]
        movss   float109,float13
        mov     dword256,dword871
        mov     dword259,dword880
        sub     dword259,[dword256+4]
        cvtsi2ss        float16,dword259
        mov     dword261,dword870
        mov     dword264,dword871
        movss   float17,dword ptr [dword261+12]
        subss   float17,dword ptr [dword264+12]
        mulss   float16,float17
        mov     dword267,dword870
        mov     dword270,dword871
        mov     dword272,[dword267+4]
        sub     dword272,[dword270+4]
        cvtsi2ss        float18,dword272
        divss   float16,float18
        mov     dword274,dword871
        addss   float16,dword ptr [dword274+12]
        movss   float110,float16
        mov     dword278,dword871
        mov     dword281,dword880
        sub     dword281,[dword278+4]
        cvtsi2ss        float19,dword281
        mov     dword283,dword869
        mov     dword286,dword871
        movss   float20,dword ptr [dword283+12]
        subss   float20,dword ptr [dword286+12]
        mulss   float19,float20
        mov     dword289,dword869
        mov     dword292,dword871
        mov     dword294,[dword289+4]
        sub     dword294,[dword292+4]
        cvtsi2ss        float21,dword294
        divss   float19,float21
        mov     dword296,dword871
        addss   float19,dword ptr [dword296+12]
        movss   float111,float19
        mov     dword301,dword882
        sub     dword301,dword881
        cvtsi2ss        float22,dword301
        movss   float23,float109
        subss   float23,float108
        divss   float23,float22
        movss   float112,float23
        mov     dword307,dword882
        sub     dword307,dword881
        cvtsi2ss        float24,dword307
        movss   float25,float111
        subss   float25,float110
        divss   float25,float24
        movss   float113,float25
; start of inline function _rasterize_horiz_line__unordered
        movss   float57,float113
        movss   float114,float57
        movss   float56,float112
        movss   float115,float56
        movss   float55,float111
        movss   float116,float55
        movss   float54,float109
        movss   float117,float54
        movss   float53,float110
        movss   float118,float53
        movss   float52,float108
        movss   float119,float52
        mov     dword579,dword880
        mov     dword883,dword579
        mov     dword578,dword882
        mov     dword884,dword578
        mov     dword577,dword881
        mov     dword885,dword577
        mov     dword583,dword885
        cmp     dword583,dword884
        jg      label0013
        push_all
        push_arg        float114,4
        push_arg        float115,4
        push_arg        float118,4
        push_arg        float119,4
        push_arg        dword883,4
        push_arg        dword884,4
        push_arg        dword885,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0014
label0013:
        push_all
        push_arg        float114,4
        push_arg        float115,4
        push_arg        float116,4
        push_arg        float117,4
        push_arg        dword883,4
        push_arg        dword885,4
        push_arg        dword884,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword880
        jmp     label000e
label000f:
        mov     dword322,dword870
        mov     dword325,dword871
        mov     dword327,[dword322+4]
        sub     dword327,[dword325+4]
        mov     dword329,dword869
        mov     dword331,dword871
        mov     dword332,[dword329]
        sub     dword332,[dword331]
        imul    dword327,dword332
        mov     dword334,dword869
        mov     dword337,dword871
        mov     dword339,[dword334+4]
        sub     dword339,[dword337+4]
        cdq     dword340,dword327
        idiv    dword327,dword339,dword340
        mov     dword342,dword871
        add     dword327,[dword342]
        mov     dword882,dword327
        mov     dword345,dword870
        mov     dword348,dword871
        mov     dword350,[dword345+4]
        sub     dword350,[dword348+4]
        cvtsi2ss        float26,dword350
        mov     dword352,dword869
        mov     dword354,dword871
        movss   float27,dword ptr [dword352+8]
        subss   float27,dword ptr [dword354+8]
        mulss   float26,float27
        mov     dword356,dword869
        mov     dword359,dword871
        mov     dword361,[dword356+4]
        sub     dword361,[dword359+4]
        cvtsi2ss        float28,dword361
        divss   float26,float28
        mov     dword363,dword871
        addss   float26,dword ptr [dword363+8]
        movss   float109,float26
        mov     dword366,dword870
        mov     dword369,dword871
        mov     dword371,[dword366+4]
        sub     dword371,[dword369+4]
        cvtsi2ss        float29,dword371
        mov     dword373,dword869
        mov     dword376,dword871
        movss   float30,dword ptr [dword373+12]
        subss   float30,dword ptr [dword376+12]
        mulss   float29,float30
        mov     dword379,dword869
        mov     dword382,dword871
        mov     dword384,[dword379+4]
        sub     dword384,[dword382+4]
        cvtsi2ss        float31,dword384
        divss   float29,float31
        mov     dword386,dword871
        addss   float29,dword ptr [dword386+12]
        movss   float111,float29
        mov     dword390,dword870
        movss   float32,float109
        subss   float32,dword ptr [dword390+8]
        mov     dword393,dword870
        mov     dword395,dword882
        sub     dword395,[dword393]
        cvtsi2ss        float33,dword395
        divss   float32,float33
        movss   float112,float32
        mov     dword398,dword870
        movss   float34,float111
        subss   float34,dword ptr [dword398+12]
        mov     dword402,dword870
        mov     dword404,dword882
        sub     dword404,[dword402]
        cvtsi2ss        float35,dword404
        divss   float34,float35
        movss   float113,float34
; start of inline function _rasterize_horiz_line__unordered
        movss   float64,float113
        movss   float114,float64
        movss   float63,float112
        movss   float115,float63
        mov     dword409,dword870
        movss   float62,dword ptr [dword409+12]
        movss   float116,float62
        mov     dword412,dword870
        movss   float61,dword ptr [dword412+8]
        movss   float117,float61
        movss   float60,float111
        movss   float118,float60
        movss   float59,float109
        movss   float119,float59
        mov     dword416,dword870
        mov     dword600,[dword416+4]
        mov     dword883,dword600
        mov     dword419,dword870
        mov     dword599,[dword419]
        mov     dword884,dword599
        mov     dword598,dword882
        mov     dword885,dword598
        mov     dword604,dword885
        cmp     dword604,dword884
        jg      label0016
        push_all
        push_arg        float114,4
        push_arg        float115,4
        push_arg        float118,4
        push_arg        float119,4
        push_arg        dword883,4
        push_arg        dword884,4
        push_arg        dword885,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0017
label0016:
        push_all
        push_arg        float114,4
        push_arg        float115,4
        push_arg        float116,4
        push_arg        float117,4
        push_arg        dword883,4
        push_arg        dword885,4
        push_arg        dword884,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     dword422,dword870
        mov     dword424,[dword422+4]
        inc     dword424
        mov     dword880,dword424
label0011:
        mov     dword427,dword869
        mov     dword430,[dword427+4]
        cmp     dword430,dword880
        jle     label0012
        mov     dword432,dword870
        mov     dword435,dword880
        sub     dword435,[dword432+4]
        mov     dword437,dword869
        mov     dword439,dword870
        mov     dword440,[dword437]
        sub     dword440,[dword439]
        imul    dword435,dword440
        mov     dword442,dword869
        mov     dword445,dword870
        mov     dword447,[dword442+4]
        sub     dword447,[dword445+4]
        cdq     dword448,dword435
        idiv    dword435,dword447,dword448
        mov     dword450,dword870
        add     dword435,[dword450]
        mov     dword881,dword435
        mov     dword453,dword871
        mov     dword456,dword880
        sub     dword456,[dword453+4]
        mov     dword458,dword869
        mov     dword460,dword871
        mov     dword461,[dword458]
        sub     dword461,[dword460]
        imul    dword456,dword461
        mov     dword463,dword869
        mov     dword466,dword871
        mov     dword468,[dword463+4]
        sub     dword468,[dword466+4]
        cdq     dword469,dword456
        idiv    dword456,dword468,dword469
        mov     dword471,dword871
        add     dword456,[dword471]
        mov     dword882,dword456
        mov     dword474,dword870
        mov     dword477,dword880
        sub     dword477,[dword474+4]
        cvtsi2ss        float36,dword477
        mov     dword479,dword869
        mov     dword481,dword870
        movss   float37,dword ptr [dword479+8]
        subss   float37,dword ptr [dword481+8]
        mulss   float36,float37
        mov     dword483,dword869
        mov     dword486,dword870
        mov     dword488,[dword483+4]
        sub     dword488,[dword486+4]
        cvtsi2ss        float38,dword488
        divss   float36,float38
        mov     dword490,dword870
        addss   float36,dword ptr [dword490+8]
        movss   float108,float36
        mov     dword493,dword871
        mov     dword496,dword880
        sub     dword496,[dword493+4]
        cvtsi2ss        float39,dword496
        mov     dword498,dword869
        mov     dword500,dword871
        movss   float40,dword ptr [dword498+8]
        subss   float40,dword ptr [dword500+8]
        mulss   float39,float40
        mov     dword502,dword869
        mov     dword505,dword871
        mov     dword507,[dword502+4]
        sub     dword507,[dword505+4]
        cvtsi2ss        float41,dword507
        divss   float39,float41
        mov     dword509,dword871
        addss   float39,dword ptr [dword509+8]
        movss   float109,float39
        mov     dword512,dword870
        mov     dword515,dword880
        sub     dword515,[dword512+4]
        cvtsi2ss        float42,dword515
        mov     dword517,dword869
        mov     dword520,dword870
        movss   float43,dword ptr [dword517+12]
        subss   float43,dword ptr [dword520+12]
        mulss   float42,float43
        mov     dword523,dword869
        mov     dword526,dword870
        mov     dword528,[dword523+4]
        sub     dword528,[dword526+4]
        cvtsi2ss        float44,dword528
        divss   float42,float44
        mov     dword530,dword870
        addss   float42,dword ptr [dword530+12]
        movss   float110,float42
        mov     dword534,dword871
        mov     dword537,dword880
        sub     dword537,[dword534+4]
        cvtsi2ss        float45,dword537
        mov     dword539,dword869
        mov     dword542,dword871
        movss   float46,dword ptr [dword539+12]
        subss   float46,dword ptr [dword542+12]
        mulss   float45,float46
        mov     dword545,dword869
        mov     dword548,dword871
        mov     dword550,[dword545+4]
        sub     dword550,[dword548+4]
        cvtsi2ss        float47,dword550
        divss   float45,float47
        mov     dword552,dword871
        addss   float45,dword ptr [dword552+12]
        movss   float111,float45
        mov     dword557,dword882
        sub     dword557,dword881
        cvtsi2ss        float48,dword557
        movss   float49,float109
        subss   float49,float108
        divss   float49,float48
        movss   float112,float49
        mov     dword563,dword882
        sub     dword563,dword881
        cvtsi2ss        float50,dword563
        movss   float51,float111
        subss   float51,float110
        divss   float51,float50
        movss   float113,float51
; start of inline function _rasterize_horiz_line__unordered
        movss   float71,float113
        movss   float114,float71
        movss   float70,float112
        movss   float115,float70
        movss   float69,float111
        movss   float116,float69
        movss   float68,float109
        movss   float117,float68
        movss   float67,float110
        movss   float118,float67
        movss   float66,float108
        movss   float119,float66
        mov     dword621,dword880
        mov     dword883,dword621
        mov     dword620,dword882
        mov     dword884,dword620
        mov     dword619,dword881
        mov     dword885,dword619
        mov     dword625,dword885
        cmp     dword625,dword884
        jg      label0019
        push_all
        push_arg        float114,4
        push_arg        float115,4
        push_arg        float118,4
        push_arg        float119,4
        push_arg        dword883,4
        push_arg        dword884,4
        push_arg        dword885,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001a
label0019:
        push_all
        push_arg        float114,4
        push_arg        float115,4
        push_arg        float116,4
        push_arg        float117,4
        push_arg        dword883,4
        push_arg        dword885,4
        push_arg        dword884,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword880
        jmp     label0011
label0012:
label0027:
; end of inline function _rasterize_triangle_2i
        inc     dword863
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp

end
