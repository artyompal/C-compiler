
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
        mov     dword ptr [__dbgprintf],dword374
        mov     dword ptr [__width],dword375
        mov     dword ptr [__height],dword376
        mov     dword ptr [__pitch],dword377
; start of inline function matrix4f_make_perspective
        cvtsi2ss        float1,dword375
        cvtsi2ss        float2,dword376
        divss   float1,float2
        movss   float129,float173
        mulss   float129,float177
        movss   float130,float129
        mulss   float130,float1
        movss   float131,float177
        divss   float131,float130
        movss   dword ptr [__mvproj_matrix],float131
        mov     dword ptr [__mvproj_matrix+4],0
        mov     dword ptr [__mvproj_matrix+8],0
        mov     dword ptr [__mvproj_matrix+12],0
        mov     dword ptr [__mvproj_matrix+16],0
        movss   float136,float177
        divss   float136,float129
        movss   dword ptr [__mvproj_matrix+20],float136
        mov     dword ptr [__mvproj_matrix+24],0
        mov     dword ptr [__mvproj_matrix+28],0
        mov     dword ptr [__mvproj_matrix+32],0
        mov     dword ptr [__mvproj_matrix+36],0
        movss   float141,float175
        subss   float141,float177
        movss   float142,float175
        divss   float142,float141
        movss   dword ptr [__mvproj_matrix+40],float142
        mov     dword ptr [__mvproj_matrix+44],1065353216
        mov     dword ptr [__mvproj_matrix+48],0
        mov     dword ptr [__mvproj_matrix+52],0
        movss   float146,float177
        mulss   float146,float175
        movss   float147,float177
        subss   float147,float175
        divss   float146,float147
        movss   dword ptr [__mvproj_matrix+56],float146
        mov     dword ptr [__mvproj_matrix+60],0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        cvtsi2ss        float3,dword376
        cvtsi2ss        float4,dword375
        movss   float153,float4
        mulss   float153,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix],float153
        mov     dword ptr [__viewport_matrix+4],0
        mov     dword ptr [__viewport_matrix+8],0
        mov     dword ptr [__viewport_matrix+12],0
        mov     dword ptr [__viewport_matrix+16],0
        movss   float158,float3
        xorps   float158,dword ptr [___unnamed_float4_4]
        mulss   float158,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+20],float158
        mov     dword ptr [__viewport_matrix+24],0
        mov     dword ptr [__viewport_matrix+28],0
        mov     dword ptr [__viewport_matrix+32],0
        mov     dword ptr [__viewport_matrix+36],0
        movss   float164,float175
        subss   float164,float177
        movss   dword ptr [__viewport_matrix+40],float164
        mov     dword ptr [__viewport_matrix+44],0
        movss   float167,float4
        mulss   float167,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+48],float167
        movss   float169,float3
        mulss   float169,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+52],float169
        movss   dword ptr [__viewport_matrix+56],float177
        mov     dword ptr [__viewport_matrix+60],1065353216
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        mov     dword ptr [__clip_z_near_base],0
        mov     dword ptr [__clip_z_near_base+4],0
        movss   dword ptr [__clip_z_near_base+8],float177
        mov     dword ptr [__clip_z_near_base+12],1065353216
; end of inline function vec4f_assign
        comiss  float175,float177
        jbe     label0000
        movss   float189,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   float189,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
        mov     dword ptr [__clip_z_near_norm],0
        mov     dword ptr [__clip_z_near_norm+4],0
        movss   dword ptr [__clip_z_near_norm+8],float189
        mov     dword ptr [__clip_z_near_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_z_far_base],0
        mov     dword ptr [__clip_z_far_base+4],0
        movss   dword ptr [__clip_z_far_base+8],float175
        mov     dword ptr [__clip_z_far_base+12],1065353216
; end of inline function vec4f_assign
        comiss  float175,float177
        jbe     label0002
        movss   float190,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   float190,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
        mov     dword ptr [__clip_z_far_norm],0
        mov     dword ptr [__clip_z_far_norm+4],0
        movss   dword ptr [__clip_z_far_norm+8],float190
        mov     dword ptr [__clip_z_far_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        float26,dword375
        movss   float27,dword ptr [___unnamed_float_1]
        divss   float27,float26
        movss   float28,dword ptr [___unnamed_float_5]
        addss   float28,float27
        movss   dword ptr [__clip_plane_left_base],float28
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
        movss   dword ptr [__clip_plane_right_base],float38
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
        mov     dword ptr [__clip_plane_top_base],0
        movss   dword ptr [__clip_plane_top_base+4],float47
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
        mov     dword ptr [__videomem],dword4
        destroy_stack_frame
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        create_stack_frame
        mov     dword7,[ebp+8]
        mov     dword4,(offset __mvproj_matrix)
        mov     dword5,dword7
        mov     dword6,16
        rep     movsd   dword4,dword5,dword6
        destroy_stack_frame
        ret
_rasterizer_set_mvproj endp

_rasterizer_set_color proc
        create_stack_frame
        mov     dword4,[ebp+8]
        mov     dword ptr [__color],dword4
        destroy_stack_frame
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        create_stack_frame
        mov     dword12,[ebp+16]
        mov     dword11,[ebp+12]
        mov     dword10,[ebp+8]
        mov     dword ptr [__texture_data],dword10
        mov     dword ptr [__texture_width],dword11
        mov     dword ptr [__texture_height],dword12
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
label0000:
; start of inline function _tex2d
        mov     dword85,dword ptr [__texture_width]
        dec     dword85
        cvtsi2ss        float14,dword85
        mulss   float14,float18
        cvttss2si       dword87,float14
        mov     dword91,dword ptr [__texture_height]
        dec     dword91
        cvtsi2ss        float15,dword91
        mulss   float15,float16
        cvttss2si       dword93,float15
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
        cvtsi2ss        float1,dword23
        mulss   float1,dword ptr [___unnamed_float_6]
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
        cvtsi2ss        float3,dword45
        mulss   float3,float1
        cvtsi2ss        float4,dword36
        movss   float5,dword ptr [___unnamed_float_1]
        subss   float5,float1
        mulss   float4,float5
        addss   float3,float4
        cvttss2si       dword57,float3
        cvtsi2ss        float6,dword50
        mulss   float6,float1
        cvtsi2ss        float7,dword41
        movss   float8,dword ptr [___unnamed_float_1]
        subss   float8,float1
        mulss   float7,float8
        addss   float6,float7
        cvttss2si       dword64,float6
        mov     dword68,dword57
        sal     dword68,8
        add     dword68,dword64
        mov     [dword104],dword68
label0003:
        movss   float9,float18
        addss   float9,float21
        movss   float18,float9
        movss   float10,float16
        addss   float10,float22
        movss   float16,float10
        add     dword104,4
        cmp     dword104,dword11
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
        mov     dword352,dword351
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
        movss   float28,dword ptr [dword352]
        subss   float28,dword ptr [dword354]
        movss   float29,dword ptr [dword352+4]
        subss   float29,dword ptr [dword354+4]
        movss   float30,dword ptr [dword352+8]
        subss   float30,dword ptr [dword354+8]
        movss   float31,dword ptr [dword352+12]
        subss   float31,dword ptr [dword354+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   float48,float29
        mulss   float48,dword ptr [dword358+4]
        movss   float49,float28
        mulss   float49,dword ptr [dword358]
        addss   float49,float48
        movss   float50,float30
        mulss   float50,dword ptr [dword358+8]
        addss   float49,float50
        movss   float51,float31
        mulss   float51,dword ptr [dword358+12]
        addss   float49,float51
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        movss   float33,dword ptr [dword353]
        subss   float33,dword ptr [dword354]
        movss   float34,dword ptr [dword353+4]
        subss   float34,dword ptr [dword354+4]
        movss   float35,dword ptr [dword353+8]
        subss   float35,dword ptr [dword354+8]
        movss   float36,dword ptr [dword353+12]
        subss   float36,dword ptr [dword354+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   float53,float34
        mulss   float53,dword ptr [dword358+4]
        movss   float54,float33
        mulss   float54,dword ptr [dword358]
        addss   float54,float53
        movss   float55,float35
        mulss   float55,dword ptr [dword358+8]
        addss   float54,float55
        movss   float56,float36
        mulss   float56,dword ptr [dword358+12]
        addss   float54,float56
; end of inline function vec4f_dot
        movss   float3,dword ptr [___unnamed_float_2]
        comiss  float3,float49
        ja      label0003
        mov     dword36,[dword350+192]
        inc     dword ptr [dword350+192]
        imul    dword36,24
        movq    double4,qword ptr [dword352]
        movq    qword ptr [dword350+dword36],double4
        movq    double4,qword ptr [dword352+8]
        movq    qword ptr [dword350+dword36+8],double4
        movq    double4,qword ptr [dword352+16]
        movq    qword ptr [dword350+dword36+16],double4
label0003:
        movss   float5,dword ptr [___unnamed_float_2]
        comiss  float5,float49
        jae     label0006
        movss   float6,dword ptr [___unnamed_float_2]
        comiss  float6,float54
        ja      label0005
label0006:
        movss   float7,dword ptr [___unnamed_float_2]
        comiss  float7,float54
        ja      label0004
        movss   float8,dword ptr [___unnamed_float_2]
        comiss  float8,float49
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        movss   float38,dword ptr [dword354]
        subss   float38,dword ptr [dword352]
        movss   float39,dword ptr [dword354+4]
        subss   float39,dword ptr [dword352+4]
        movss   float40,dword ptr [dword354+8]
        subss   float40,dword ptr [dword352+8]
        movss   float41,dword ptr [dword354+12]
        subss   float41,dword ptr [dword352+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        movss   float43,dword ptr [dword353]
        subss   float43,dword ptr [dword352]
        movss   float44,dword ptr [dword353+4]
        subss   float44,dword ptr [dword352+4]
        movss   float45,dword ptr [dword353+8]
        subss   float45,dword ptr [dword352+8]
        movss   float46,dword ptr [dword353+12]
        subss   float46,dword ptr [dword352+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   float58,float39
        mulss   float58,dword ptr [dword358+4]
        movss   float59,float38
        mulss   float59,dword ptr [dword358]
        addss   float59,float58
        movss   float60,float40
        mulss   float60,dword ptr [dword358+8]
        addss   float59,float60
        movss   float61,float41
        mulss   float61,dword ptr [dword358+12]
        addss   float59,float61
; end of inline function vec4f_dot
        movss   float9,float59
; start of inline function vec4f_dot
        movss   float63,float44
        mulss   float63,dword ptr [dword358+4]
        movss   float64,float43
        mulss   float64,dword ptr [dword358]
        addss   float64,float63
        movss   float65,float45
        mulss   float65,dword ptr [dword358+8]
        addss   float64,float65
        movss   float66,float46
        mulss   float66,dword ptr [dword358+12]
        addss   float64,float66
; end of inline function vec4f_dot
        divss   float9,float64
; start of inline function vec4f_mul
        movss   float69,float43
        mulss   float69,float9
        movss   float70,float44
        mulss   float70,float9
        movss   float71,float45
        mulss   float71,float9
        movss   float72,float46
        mulss   float72,float9
; end of inline function vec4f_mul
; start of inline function vec4f_add
        mov     dword72,[dword350+192]
        imul    dword72,24
        movss   float23,dword ptr [dword352]
        addss   float23,float69
        movss   dword ptr [dword350+dword72],float23
        movss   float24,dword ptr [dword352+4]
        addss   float24,float70
        movss   dword ptr [dword350+dword72+4],float24
        movss   float25,dword ptr [dword352+8]
        addss   float25,float71
        movss   dword ptr [dword350+dword72+8],float25
        movss   float26,dword ptr [dword352+12]
        addss   float26,float72
        movss   dword ptr [dword350+dword72+12],float26
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        movss   float16,dword ptr [dword353+16]
        subss   float16,dword ptr [dword352+16]
        movss   float17,dword ptr [dword353+20]
        subss   float17,dword ptr [dword352+20]
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   float20,float16
        mulss   float20,float9
        movss   float21,float17
        mulss   float21,float9
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     dword88,[dword350+192]
        imul    dword88,24
        movss   float13,dword ptr [dword352+16]
        addss   float13,float20
        movss   dword ptr [dword350+dword88+16],float13
        movss   float14,dword ptr [dword352+20]
        addss   float14,float21
        movss   dword ptr [dword350+dword88+20],float14
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
        movq    double11,qword ptr [dword350]
        movq    qword ptr [dword350+dword98],double11
        movq    double11,qword ptr [dword350+8]
        movq    qword ptr [dword350+dword98+8],double11
        movq    double11,qword ptr [dword350+16]
        movq    qword ptr [dword350+dword98+16],double11
        destroy_stack_frame
        ret
__clip_on_plain endp

__transform_to_projection_space proc
        create_stack_frame
        mov     dword103,[ebp+8]
        mov     dword99,[ebp+12]
; start of inline function vec4f_assign
        movss   float4,dword ptr [dword99+8]
        movss   float3,dword ptr [dword99+4]
        movss   float2,dword ptr [dword99]
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        movss   float11,float3
        mulss   float11,dword ptr [__mvproj_matrix+16]
        movss   float12,float2
        mulss   float12,dword ptr [__mvproj_matrix]
        addss   float12,float11
        movss   float13,float4
        mulss   float13,dword ptr [__mvproj_matrix+32]
        addss   float12,float13
        movss   float14,dword ptr [___unnamed_float_1]
        mulss   float14,dword ptr [__mvproj_matrix+48]
        addss   float12,float14
        movss   dword ptr [dword103],float12
        movss   float15,float2
        mulss   float15,dword ptr [__mvproj_matrix+4]
        movss   float16,float3
        mulss   float16,dword ptr [__mvproj_matrix+20]
        addss   float15,float16
        movss   float17,float4
        mulss   float17,dword ptr [__mvproj_matrix+36]
        addss   float15,float17
        movss   float18,dword ptr [___unnamed_float_1]
        mulss   float18,dword ptr [__mvproj_matrix+52]
        addss   float15,float18
        movss   dword ptr [dword103+4],float15
        movss   float19,float2
        mulss   float19,dword ptr [__mvproj_matrix+8]
        movss   float20,float3
        mulss   float20,dword ptr [__mvproj_matrix+24]
        addss   float19,float20
        movss   float21,float4
        mulss   float21,dword ptr [__mvproj_matrix+40]
        addss   float19,float21
        movss   float22,dword ptr [___unnamed_float_1]
        mulss   float22,dword ptr [__mvproj_matrix+56]
        addss   float19,float22
        movss   dword ptr [dword103+8],float19
        movss   float23,float2
        mulss   float23,dword ptr [__mvproj_matrix+12]
        movss   float24,float3
        mulss   float24,dword ptr [__mvproj_matrix+28]
        addss   float23,float24
        movss   float25,float4
        mulss   float25,dword ptr [__mvproj_matrix+44]
        addss   float23,float25
        movss   float26,dword ptr [___unnamed_float_1]
        mulss   float26,dword ptr [__mvproj_matrix+60]
        addss   float23,float26
        movss   dword ptr [dword103+12],float23
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
        movq    double1,qword ptr [dword854]
        movq    qword ptr [ebp-180],double1
        push_all
        push_arg        dword855,4
        lea     dword8,[ebp-196]
        add     dword8,24
        push_arg        dword8,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        movq    double2,qword ptr [dword856]
        movq    qword ptr [ebp-156],double2
        push_all
        push_arg        dword857,4
        lea     dword16,[ebp-196]
        add     dword16,48
        push_arg        dword16,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        movq    double3,qword ptr [dword858]
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
; start of inline function _clip_poligon
        push_all
        push_arg        (offset __clip_z_far_norm),4
        push_arg        (offset __clip_z_far_base),4
        push_arg        dword29,4
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
        push_arg        dword29,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_left_norm),4
        push_arg        (offset __clip_plane_left_base),4
        push_arg        dword29,4
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
        push_arg        dword29,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_top_norm),4
        push_arg        (offset __clip_plane_top_base),4
        push_arg        dword29,4
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
        jmp     label002d
label0000:
        cmp     dword ptr [dword29+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword863,0
label0003:
        mov     dword43,[dword29+192]
        cmp     dword43,dword863
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword48,dword863
        imul    dword48,24
        lea     dword49,[ebp-332]
        mov     dword52,dword863
        sal     dword52,4
; start of inline function matrix4f_transform
        movss   float86,dword ptr [dword29+dword48+4]
        mulss   float86,dword ptr [__viewport_matrix+16]
        movss   float87,dword ptr [dword29+dword48]
        mulss   float87,dword ptr [__viewport_matrix]
        addss   float87,float86
        movss   float88,dword ptr [dword29+dword48+8]
        mulss   float88,dword ptr [__viewport_matrix+32]
        addss   float87,float88
        movss   float89,dword ptr [dword29+dword48+12]
        mulss   float89,dword ptr [__viewport_matrix+48]
        addss   float87,float89
        movss   dword ptr [ebp-680],float120
        movss   dword ptr [ebp-688],float87
        movss   float90,dword ptr [dword29+dword48]
        mulss   float90,dword ptr [__viewport_matrix+4]
        movss   float91,dword ptr [dword29+dword48+4]
        mulss   float91,dword ptr [__viewport_matrix+20]
        addss   float90,float91
        movss   float92,dword ptr [dword29+dword48+8]
        mulss   float92,dword ptr [__viewport_matrix+36]
        addss   float90,float92
        movss   float93,dword ptr [dword29+dword48+12]
        mulss   float93,dword ptr [__viewport_matrix+52]
        addss   float90,float93
        movss   dword ptr [ebp-680],float120
        movss   dword ptr [ebp-684],float90
        movss   float94,dword ptr [dword29+dword48]
        mulss   float94,dword ptr [__viewport_matrix+8]
        movss   float95,dword ptr [dword29+dword48+4]
        mulss   float95,dword ptr [__viewport_matrix+24]
        addss   float94,float95
        movss   float96,dword ptr [dword29+dword48+8]
        mulss   float96,dword ptr [__viewport_matrix+40]
        addss   float94,float96
        movss   float97,dword ptr [dword29+dword48+12]
        mulss   float97,dword ptr [__viewport_matrix+56]
        addss   float94,float97
        movss   float120,float94
        movss   float98,dword ptr [dword29+dword48]
        mulss   float98,dword ptr [__viewport_matrix+12]
        movss   float99,dword ptr [dword29+dword48+4]
        mulss   float99,dword ptr [__viewport_matrix+28]
        addss   float98,float99
        movss   float100,dword ptr [dword29+dword48+8]
        mulss   float100,dword ptr [__viewport_matrix+44]
        addss   float98,float100
        movss   float101,dword ptr [dword29+dword48+12]
        mulss   float101,dword ptr [__viewport_matrix+60]
        addss   float98,float101
        movss   dword ptr [ebp-680],float120
        movss   dword ptr [ebp-676],float98
; end of inline function matrix4f_transform
        movss   float82,dword ptr [___unnamed_float_1]
        divss   float82,float102
        movss   float83,float104
        mulss   float83,float82
        cvttss2si       dword754,float83
        mov     [dword49+dword52],dword754
        movss   float84,float105
        mulss   float84,float82
        cvttss2si       dword760,float84
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
        mov     dword56,dword863
        sal     dword56,4
        mov     dword62,dword863
        imul    dword62,24
        movq    double6,qword ptr [dword29+dword62+16]
        movq    qword ptr [dword53+dword56+8],double6
        inc     dword863
        jmp     label0003
label0004:
        mov     dword863,2
label0006:
        mov     dword70,[dword29+192]
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
        mov     dword90,[dword871+4]
        cmp     dword90,[dword870+4]
        jle     label0008
        mov     dword872,dword871
        mov     dword871,dword870
        mov     dword870,dword872
label0008:
        mov     dword106,[dword871+4]
        cmp     dword106,[dword869+4]
        jle     label0009
        mov     dword872,dword871
        mov     dword871,dword869
        mov     dword869,dword872
label0009:
        mov     dword122,[dword870+4]
        cmp     dword122,[dword869+4]
        jle     label000a
        mov     dword872,dword870
        mov     dword870,dword869
        mov     dword869,dword872
label000a:
        mov     dword138,[dword871+4]
        cmp     dword138,[dword869+4]
        jne     label000b
        cmp     dword ptr [dword871+4],0
        jl      label000c
        mov     dword147,[dword871+4]
        cmp     dword147,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   float8,dword ptr [___unnamed_float_2]
        movss   float9,dword ptr [___unnamed_float_2]
        mov     dword151,dword869
        mov     dword153,dword870
        mov     dword155,dword871
        mov     dword643,[dword871+4]
        mov     dword876,dword643
        mov     dword642,[dword869]
        mov     dword877,dword642
        mov     dword641,[dword870]
        mov     dword878,dword641
        mov     dword640,[dword871]
        mov     dword879,dword640
        cmp     dword879,dword878
        jge     label001c
        cmp     dword877,dword878
        jle     label001d
        push_all
        push_arg        float8,4
        push_arg        float9,4
        push_arg        dword ptr [dword155+12],4
        push_arg        dword ptr [dword155+8],4
        push_arg        dword876,4
        push_arg        dword877,4
        push_arg        dword879,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001e
label001d:
        cmp     dword877,dword879
        jge     label001f
        push_all
        push_arg        float8,4
        push_arg        float9,4
        push_arg        dword ptr [dword151+12],4
        push_arg        dword ptr [dword151+8],4
        push_arg        dword876,4
        push_arg        dword878,4
        push_arg        dword877,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        float8,4
        push_arg        float9,4
        push_arg        dword ptr [dword155+4],4
        push_arg        dword ptr [dword155],4
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
        cmp     dword877,dword878
        jge     label0022
        push_all
        movss   float74,float8
        xorps   float74,dword ptr [___unnamed_float4_4]
        push_arg        float74,4
        movss   float75,float9
        xorps   float75,dword ptr [___unnamed_float4_4]
        push_arg        float75,4
        push_arg        dword ptr [dword151+4],4
        push_arg        dword ptr [dword151],4
        push_arg        dword876,4
        push_arg        dword879,4
        push_arg        dword877,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0023
label0022:
        cmp     dword877,dword879
        jle     label0024
        push_all
        movss   float76,float8
        xorps   float76,dword ptr [___unnamed_float4_4]
        push_arg        float76,4
        movss   float77,float9
        xorps   float77,dword ptr [___unnamed_float4_4]
        push_arg        float77,4
        push_arg        dword ptr [dword153+12],4
        push_arg        dword ptr [dword153+8],4
        push_arg        dword876,4
        push_arg        dword877,4
        push_arg        dword878,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0025
label0024:
        push_all
        movss   float78,float8
        xorps   float78,dword ptr [___unnamed_float4_4]
        push_arg        float78,4
        movss   float79,float9
        xorps   float79,dword ptr [___unnamed_float4_4]
        push_arg        float79,4
        push_arg        dword ptr [dword153+4],4
        push_arg        dword ptr [dword153],4
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
        mov     dword169,[dword871+4]
        mov     dword880,dword169
label000e:
        mov     dword174,[dword870+4]
        cmp     dword174,dword880
        jle     label000f
        mov     dword179,dword880
        sub     dword179,[dword871+4]
        mov     dword184,[dword870]
        sub     dword184,[dword871]
        imul    dword179,dword184
        mov     dword191,[dword870+4]
        sub     dword191,[dword871+4]
        cdq     dword192,dword179
        idiv    dword179,dword191,dword192
        add     dword179,[dword871]
        mov     dword200,dword880
        sub     dword200,[dword871+4]
        mov     dword205,[dword869]
        sub     dword205,[dword871]
        imul    dword200,dword205
        mov     dword212,[dword869+4]
        sub     dword212,[dword871+4]
        cdq     dword213,dword200
        idiv    dword200,dword212,dword213
        add     dword200,[dword871]
        mov     dword221,dword880
        sub     dword221,[dword871+4]
        cvtsi2ss        float10,dword221
        movss   float11,dword ptr [dword870+8]
        subss   float11,dword ptr [dword871+8]
        mulss   float10,float11
        mov     dword232,[dword870+4]
        sub     dword232,[dword871+4]
        cvtsi2ss        float12,dword232
        divss   float10,float12
        addss   float10,dword ptr [dword871+8]
        mov     dword240,dword880
        sub     dword240,[dword871+4]
        cvtsi2ss        float13,dword240
        movss   float14,dword ptr [dword869+8]
        subss   float14,dword ptr [dword871+8]
        mulss   float13,float14
        mov     dword251,[dword869+4]
        sub     dword251,[dword871+4]
        cvtsi2ss        float15,dword251
        divss   float13,float15
        addss   float13,dword ptr [dword871+8]
        mov     dword259,dword880
        sub     dword259,[dword871+4]
        cvtsi2ss        float16,dword259
        movss   float17,dword ptr [dword870+12]
        subss   float17,dword ptr [dword871+12]
        mulss   float16,float17
        mov     dword272,[dword870+4]
        sub     dword272,[dword871+4]
        cvtsi2ss        float18,dword272
        divss   float16,float18
        addss   float16,dword ptr [dword871+12]
        mov     dword281,dword880
        sub     dword281,[dword871+4]
        cvtsi2ss        float19,dword281
        movss   float20,dword ptr [dword869+12]
        subss   float20,dword ptr [dword871+12]
        mulss   float19,float20
        mov     dword294,[dword869+4]
        sub     dword294,[dword871+4]
        cvtsi2ss        float21,dword294
        divss   float19,float21
        addss   float19,dword ptr [dword871+12]
        mov     dword301,dword200
        sub     dword301,dword179
        cvtsi2ss        float22,dword301
        movss   float23,float13
        subss   float23,float10
        divss   float23,float22
        mov     dword307,dword200
        sub     dword307,dword179
        cvtsi2ss        float24,dword307
        movss   float25,float19
        subss   float25,float16
        divss   float25,float24
; start of inline function _rasterize_horiz_line__unordered
        movss   float114,float25
        movss   float115,float23
        movss   float116,float19
        movss   float117,float13
        movss   float118,float16
        movss   float119,float10
        cmp     dword179,dword200
        jg      label0013
        push_all
        push_arg        float114,4
        push_arg        float115,4
        push_arg        float118,4
        push_arg        float119,4
        push_arg        dword880,4
        push_arg        dword200,4
        push_arg        dword179,4
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
        push_arg        dword880,4
        push_arg        dword179,4
        push_arg        dword200,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword880
        jmp     label000e
label000f:
        mov     dword327,[dword870+4]
        sub     dword327,[dword871+4]
        mov     dword332,[dword869]
        sub     dword332,[dword871]
        imul    dword327,dword332
        mov     dword339,[dword869+4]
        sub     dword339,[dword871+4]
        cdq     dword340,dword327
        idiv    dword327,dword339,dword340
        add     dword327,[dword871]
        mov     dword350,[dword870+4]
        sub     dword350,[dword871+4]
        cvtsi2ss        float26,dword350
        movss   float27,dword ptr [dword869+8]
        subss   float27,dword ptr [dword871+8]
        mulss   float26,float27
        mov     dword361,[dword869+4]
        sub     dword361,[dword871+4]
        cvtsi2ss        float28,dword361
        divss   float26,float28
        addss   float26,dword ptr [dword871+8]
        mov     dword371,[dword870+4]
        sub     dword371,[dword871+4]
        cvtsi2ss        float29,dword371
        movss   float30,dword ptr [dword869+12]
        subss   float30,dword ptr [dword871+12]
        mulss   float29,float30
        mov     dword384,[dword869+4]
        sub     dword384,[dword871+4]
        cvtsi2ss        float31,dword384
        divss   float29,float31
        addss   float29,dword ptr [dword871+12]
        movss   float32,float26
        subss   float32,dword ptr [dword870+8]
        mov     dword395,dword327
        sub     dword395,[dword870]
        cvtsi2ss        float33,dword395
        divss   float32,float33
        movss   float34,float29
        subss   float34,dword ptr [dword870+12]
        mov     dword404,dword327
        sub     dword404,[dword870]
        cvtsi2ss        float35,dword404
        divss   float34,float35
; start of inline function _rasterize_horiz_line__unordered
        movss   float115,float32
        movss   float62,dword ptr [dword870+12]
        movss   float116,float62
        movss   float61,dword ptr [dword870+8]
        movss   float117,float61
        movss   float118,float29
        movss   float119,float26
        mov     dword600,[dword870+4]
        mov     dword599,[dword870]
        cmp     dword327,dword599
        jg      label0016
        push_all
        push_arg        float34,4
        push_arg        float115,4
        push_arg        float118,4
        push_arg        float119,4
        push_arg        dword600,4
        push_arg        dword599,4
        push_arg        dword327,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0017
label0016:
        push_all
        push_arg        float34,4
        push_arg        float115,4
        push_arg        float116,4
        push_arg        float117,4
        push_arg        dword600,4
        push_arg        dword327,4
        push_arg        dword599,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     dword424,[dword870+4]
        inc     dword424
        mov     dword880,dword424
label0011:
        mov     dword430,[dword869+4]
        cmp     dword430,dword880
        jle     label0012
        mov     dword435,dword880
        sub     dword435,[dword870+4]
        mov     dword440,[dword869]
        sub     dword440,[dword870]
        imul    dword435,dword440
        mov     dword447,[dword869+4]
        sub     dword447,[dword870+4]
        cdq     dword448,dword435
        idiv    dword435,dword447,dword448
        add     dword435,[dword870]
        mov     dword456,dword880
        sub     dword456,[dword871+4]
        mov     dword461,[dword869]
        sub     dword461,[dword871]
        imul    dword456,dword461
        mov     dword468,[dword869+4]
        sub     dword468,[dword871+4]
        cdq     dword469,dword456
        idiv    dword456,dword468,dword469
        add     dword456,[dword871]
        mov     dword477,dword880
        sub     dword477,[dword870+4]
        cvtsi2ss        float36,dword477
        movss   float37,dword ptr [dword869+8]
        subss   float37,dword ptr [dword870+8]
        mulss   float36,float37
        mov     dword488,[dword869+4]
        sub     dword488,[dword870+4]
        cvtsi2ss        float38,dword488
        divss   float36,float38
        addss   float36,dword ptr [dword870+8]
        mov     dword496,dword880
        sub     dword496,[dword871+4]
        cvtsi2ss        float39,dword496
        movss   float40,dword ptr [dword869+8]
        subss   float40,dword ptr [dword871+8]
        mulss   float39,float40
        mov     dword507,[dword869+4]
        sub     dword507,[dword871+4]
        cvtsi2ss        float41,dword507
        divss   float39,float41
        addss   float39,dword ptr [dword871+8]
        mov     dword515,dword880
        sub     dword515,[dword870+4]
        cvtsi2ss        float42,dword515
        movss   float43,dword ptr [dword869+12]
        subss   float43,dword ptr [dword870+12]
        mulss   float42,float43
        mov     dword528,[dword869+4]
        sub     dword528,[dword870+4]
        cvtsi2ss        float44,dword528
        divss   float42,float44
        addss   float42,dword ptr [dword870+12]
        mov     dword537,dword880
        sub     dword537,[dword871+4]
        cvtsi2ss        float45,dword537
        movss   float46,dword ptr [dword869+12]
        subss   float46,dword ptr [dword871+12]
        mulss   float45,float46
        mov     dword550,[dword869+4]
        sub     dword550,[dword871+4]
        cvtsi2ss        float47,dword550
        divss   float45,float47
        addss   float45,dword ptr [dword871+12]
        mov     dword557,dword456
        sub     dword557,dword435
        cvtsi2ss        float48,dword557
        movss   float49,float39
        subss   float49,float36
        divss   float49,float48
        mov     dword563,dword456
        sub     dword563,dword435
        cvtsi2ss        float50,dword563
        movss   float51,float45
        subss   float51,float42
        divss   float51,float50
; start of inline function _rasterize_horiz_line__unordered
        movss   float114,float51
        movss   float115,float49
        movss   float116,float45
        movss   float117,float39
        mov     dword883,dword880
        mov     dword884,dword456
        mov     dword885,dword435
        cmp     dword885,dword884
        jg      label0019
        push_all
        push_arg        float114,4
        push_arg        float115,4
        push_arg        float42,4
        push_arg        float36,4
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
