
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
        movss   float1,dword ptr [dword73+4]
        mulss   float1,dword ptr [dword74+16]
        movss   float2,dword ptr [dword73]
        mulss   float2,dword ptr [dword74]
        addss   float2,float1
        movss   float3,dword ptr [dword73+8]
        mulss   float3,dword ptr [dword74+32]
        addss   float2,float3
        movss   float4,dword ptr [dword73+12]
        mulss   float4,dword ptr [dword74+48]
        addss   float2,float4
        movss   dword ptr [dword75],float2
        movss   float5,dword ptr [dword73]
        mulss   float5,dword ptr [dword74+4]
        movss   float6,dword ptr [dword73+4]
        mulss   float6,dword ptr [dword74+20]
        addss   float5,float6
        movss   float7,dword ptr [dword73+8]
        mulss   float7,dword ptr [dword74+36]
        addss   float5,float7
        movss   float8,dword ptr [dword73+12]
        mulss   float8,dword ptr [dword74+52]
        addss   float5,float8
        movss   dword ptr [dword75+4],float5
        movss   float9,dword ptr [dword73]
        mulss   float9,dword ptr [dword74+8]
        movss   float10,dword ptr [dword73+4]
        mulss   float10,dword ptr [dword74+24]
        addss   float9,float10
        movss   float11,dword ptr [dword73+8]
        mulss   float11,dword ptr [dword74+40]
        addss   float9,float11
        movss   float12,dword ptr [dword73+12]
        mulss   float12,dword ptr [dword74+56]
        addss   float9,float12
        movss   dword ptr [dword75+8],float9
        movss   float13,dword ptr [dword73]
        mulss   float13,dword ptr [dword74+12]
        movss   float14,dword ptr [dword73+4]
        mulss   float14,dword ptr [dword74+28]
        addss   float13,float14
        movss   float15,dword ptr [dword73+8]
        mulss   float15,dword ptr [dword74+44]
        addss   float13,float15
        movss   float16,dword ptr [dword73+12]
        mulss   float16,dword ptr [dword74+60]
        addss   float13,float16
        movss   dword ptr [dword75+12],float13
        destroy_stack_frame
        ret
_matrix4f_transform endp

_rasterizer_init proc
        create_stack_frame
        movss   float190,dword ptr [ebp-8]
        movss   float189,dword ptr [ebp-4]
        movss   float188,dword ptr [ebp-12]
        movss   float187,dword ptr [ebp-20]
        movss   float186,dword ptr [ebp-24]
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
        mov     dword378,(offset __mvproj_matrix)
        movss   float129,float173
        mulss   float129,float177
        movss   float130,float129
        mulss   float130,float1
        movss   float131,float177
        divss   float131,float130
        movss   dword ptr [dword378],float131
        mov     dword ptr [dword378+4],0
        mov     dword ptr [dword378+8],0
        mov     dword ptr [dword378+12],0
        mov     dword ptr [dword378+16],0
        movss   float136,float177
        divss   float136,float129
        movss   dword ptr [dword378+20],float136
        mov     dword ptr [dword378+24],0
        mov     dword ptr [dword378+28],0
        mov     dword ptr [dword378+32],0
        mov     dword ptr [dword378+36],0
        movss   float141,float175
        subss   float141,float177
        movss   float142,float175
        divss   float142,float141
        movss   dword ptr [dword378+40],float142
        mov     dword ptr [dword378+44],1065353216
        mov     dword ptr [dword378+48],0
        mov     dword ptr [dword378+52],0
        movss   float146,float177
        mulss   float146,float175
        movss   float147,float177
        subss   float147,float175
        divss   float146,float147
        movss   dword ptr [dword378+56],float146
        mov     dword ptr [dword378+60],0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        cvtsi2ss        float3,dword376
        cvtsi2ss        float4,dword375
        mov     dword379,(offset __viewport_matrix)
        movss   float153,float4
        mulss   float153,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword379],float153
        mov     dword ptr [dword379+4],0
        mov     dword ptr [dword379+8],0
        mov     dword ptr [dword379+12],0
        mov     dword ptr [dword379+16],0
        movss   float158,float3
        xorps   float158,dword ptr [___unnamed_float4_4]
        mulss   float158,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword379+20],float158
        mov     dword ptr [dword379+24],0
        mov     dword ptr [dword379+28],0
        mov     dword ptr [dword379+32],0
        mov     dword ptr [dword379+36],0
        movss   float164,float175
        subss   float164,float177
        movss   dword ptr [dword379+40],float164
        mov     dword ptr [dword379+44],0
        movss   float167,float4
        mulss   float167,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword379+48],float167
        movss   float169,float3
        mulss   float169,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword379+52],float169
        movss   dword ptr [dword379+56],float177
        mov     dword ptr [dword379+60],1065353216
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_z_near_base)
        movss   dword ptr [dword383],float186
        movss   dword ptr [dword383+4],float187
        movss   dword ptr [dword383+8],float177
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
        comiss  float175,float177
        jbe     label0000
        jmp     label0001
label0000:
label0001:
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_z_near_norm)
        movss   dword ptr [dword383],float186
        movss   dword ptr [dword383+4],float187
        movss   dword ptr [dword383+8],float189
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_z_far_base)
        movss   dword ptr [dword383],float186
        movss   dword ptr [dword383+4],float187
        movss   dword ptr [dword383+8],float175
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
        comiss  float175,float177
        jbe     label0002
        jmp     label0003
label0002:
label0003:
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_z_far_norm)
        movss   dword ptr [dword383],float186
        movss   dword ptr [dword383+4],float187
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        float26,dword375
        movss   float27,dword ptr [___unnamed_float_1]
        divss   float27,float26
        movss   float28,dword ptr [___unnamed_float_5]
        addss   float28,float27
        mov     dword383,(offset __clip_plane_left_base)
        movss   dword ptr [dword383],float28
        movss   dword ptr [dword383+4],float187
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_plane_left_norm)
        movss   dword ptr [dword383],float28
        movss   dword ptr [dword383+4],float187
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        float36,dword375
        movss   float37,dword ptr [___unnamed_float_1]
        divss   float37,float36
        movss   float38,dword ptr [___unnamed_float_1]
        subss   float38,float37
        mov     dword383,(offset __clip_plane_right_base)
        movss   dword ptr [dword383],float38
        movss   dword ptr [dword383+4],float187
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_plane_right_norm)
        movss   dword ptr [dword383],float38
        movss   dword ptr [dword383+4],float187
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        float45,dword376
        movss   float46,dword ptr [___unnamed_float_1]
        divss   float46,float45
        movss   float47,dword ptr [___unnamed_float_5]
        addss   float47,float46
        mov     dword383,(offset __clip_plane_top_base)
        movss   dword ptr [dword383],float38
        movss   dword ptr [dword383+4],float47
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_plane_top_norm)
        movss   dword ptr [dword383],float38
        movss   dword ptr [dword383+4],float47
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_plane_bottom_base)
        movss   dword ptr [dword383],float38
        movss   dword ptr [dword383+4],float47
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword383,(offset __clip_plane_bottom_norm)
        movss   dword ptr [dword383],float38
        movss   dword ptr [dword383+4],float47
        movss   dword ptr [dword383+8],float190
        movss   dword ptr [dword383+12],float188
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
        rep     movsd   dword4,dword5
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
        movss   dword ptr [ebp-24],float28
        movss   float29,dword ptr [dword352+4]
        subss   float29,dword ptr [dword354+4]
        movss   dword ptr [ebp-20],float29
        movss   float30,dword ptr [dword352+8]
        subss   float30,dword ptr [dword354+8]
        movss   dword ptr [ebp-16],float30
        movss   float31,dword ptr [dword352+12]
        subss   float31,dword ptr [dword354+12]
        movss   dword ptr [ebp-12],float31
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   float48,dword ptr [ebp-20]
        mulss   float48,dword ptr [dword358+4]
        movss   float49,dword ptr [ebp-24]
        mulss   float49,dword ptr [dword358]
        addss   float49,float48
        movss   float50,dword ptr [ebp-16]
        mulss   float50,dword ptr [dword358+8]
        addss   float49,float50
        movss   float51,dword ptr [ebp-12]
        mulss   float51,dword ptr [dword358+12]
        addss   float49,float51
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        movss   float33,dword ptr [dword353]
        subss   float33,dword ptr [dword354]
        movss   dword ptr [ebp-24],float33
        movss   float34,dword ptr [dword353+4]
        subss   float34,dword ptr [dword354+4]
        movss   dword ptr [ebp-20],float34
        movss   float35,dword ptr [dword353+8]
        subss   float35,dword ptr [dword354+8]
        movss   dword ptr [ebp-16],float35
        movss   float36,dword ptr [dword353+12]
        subss   float36,dword ptr [dword354+12]
        movss   dword ptr [ebp-12],float36
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   float53,dword ptr [ebp-20]
        mulss   float53,dword ptr [dword358+4]
        movss   float54,dword ptr [ebp-24]
        mulss   float54,dword ptr [dword358]
        addss   float54,float53
        movss   float55,dword ptr [ebp-16]
        mulss   float55,dword ptr [dword358+8]
        addss   float54,float55
        movss   float56,dword ptr [ebp-12]
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
        movss   dword ptr [ebp-24],float38
        movss   float39,dword ptr [dword354+4]
        subss   float39,dword ptr [dword352+4]
        movss   dword ptr [ebp-20],float39
        movss   float40,dword ptr [dword354+8]
        subss   float40,dword ptr [dword352+8]
        movss   dword ptr [ebp-16],float40
        movss   float41,dword ptr [dword354+12]
        subss   float41,dword ptr [dword352+12]
        movss   dword ptr [ebp-12],float41
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        movss   float43,dword ptr [dword353]
        subss   float43,dword ptr [dword352]
        movss   dword ptr [ebp-40],float43
        movss   float44,dword ptr [dword353+4]
        subss   float44,dword ptr [dword352+4]
        movss   dword ptr [ebp-36],float44
        movss   float45,dword ptr [dword353+8]
        subss   float45,dword ptr [dword352+8]
        movss   dword ptr [ebp-32],float45
        movss   float46,dword ptr [dword353+12]
        subss   float46,dword ptr [dword352+12]
        movss   dword ptr [ebp-28],float46
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   float58,dword ptr [ebp-20]
        mulss   float58,dword ptr [dword358+4]
        movss   float59,dword ptr [ebp-24]
        mulss   float59,dword ptr [dword358]
        addss   float59,float58
        movss   float60,dword ptr [ebp-16]
        mulss   float60,dword ptr [dword358+8]
        addss   float59,float60
        movss   float61,dword ptr [ebp-12]
        mulss   float61,dword ptr [dword358+12]
        addss   float59,float61
; end of inline function vec4f_dot
        movss   float9,float59
; start of inline function vec4f_dot
        movss   float63,dword ptr [ebp-36]
        mulss   float63,dword ptr [dword358+4]
        movss   float64,dword ptr [ebp-40]
        mulss   float64,dword ptr [dword358]
        addss   float64,float63
        movss   float65,dword ptr [ebp-32]
        mulss   float65,dword ptr [dword358+8]
        addss   float64,float65
        movss   float66,dword ptr [ebp-28]
        mulss   float66,dword ptr [dword358+12]
        addss   float64,float66
; end of inline function vec4f_dot
        divss   float9,float64
; start of inline function vec4f_mul
        movss   float69,dword ptr [ebp-40]
        mulss   float69,float9
        movss   dword ptr [ebp-40],float69
        movss   float70,dword ptr [ebp-36]
        mulss   float70,float9
        movss   dword ptr [ebp-36],float70
        movss   float71,dword ptr [ebp-32]
        mulss   float71,float9
        movss   dword ptr [ebp-32],float71
        movss   float72,dword ptr [ebp-28]
        mulss   float72,float9
        movss   dword ptr [ebp-28],float72
; end of inline function vec4f_mul
; start of inline function vec4f_add
        mov     dword72,[dword350+192]
        imul    dword72,24
        mov     dword74,dword350
        add     dword74,dword72
        movss   float23,dword ptr [dword352]
        addss   float23,dword ptr [ebp-40]
        movss   dword ptr [dword74+dword72],float23
        movss   float24,dword ptr [dword352+4]
        addss   float24,dword ptr [ebp-36]
        movss   dword ptr [dword74+4],float24
        movss   float25,dword ptr [dword352+8]
        addss   float25,dword ptr [ebp-32]
        movss   dword ptr [dword74+8],float25
        movss   float26,dword ptr [dword352+12]
        addss   float26,dword ptr [ebp-28]
        movss   dword ptr [dword74+12],float26
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     dword76,16
        add     dword76,dword352
        mov     dword78,16
        add     dword78,dword353
        movss   float16,dword ptr [dword78+dword353]
        subss   float16,dword ptr [dword76+dword352]
        movss   dword ptr [ebp-48],float16
        movss   float17,dword ptr [dword78+4]
        subss   float17,dword ptr [dword76+4]
        movss   dword ptr [ebp-44],float17
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   float20,dword ptr [ebp-48]
        mulss   float20,float9
        movss   dword ptr [ebp-48],float20
        movss   float21,dword ptr [ebp-44]
        mulss   float21,float9
        movss   dword ptr [ebp-44],float21
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     dword84,16
        add     dword84,dword352
        mov     dword88,[dword350+192]
        imul    dword88,24
        movss   float13,dword ptr [dword84+dword352]
        addss   float13,dword ptr [ebp-48]
        movss   dword ptr [dword350+dword88+16],float13
        movss   float14,dword ptr [dword84+4]
        addss   float14,dword ptr [ebp-44]
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

_rasterizer_triangle3f proc
        create_stack_frame
        movss   float127,dword ptr [ebp-432]
        movss   float126,dword ptr [ebp-428]
        movss   float125,dword ptr [ebp-684]
        movss   float124,dword ptr [ebp-688]
        movss   float122,dword ptr [ebp-676]
        movsd   double121,qword ptr [ebp-180]
        movsd   double120,qword ptr [ebp-188]
        movsd   double119,qword ptr [ebp-196]
        movss   float118,dword ptr [ebp-720]
        mov     dword866,[ebp+28]
        mov     dword865,[ebp+16]
        mov     dword864,[ebp+24]
        mov     dword863,[ebp+12]
        mov     dword862,[ebp+20]
        mov     dword857,[ebp+8]
; start of inline function _transform_to_projection_space
        lea     dword2,[ebp-196]
; start of inline function vec4f_assign
        movss   float89,dword ptr [dword857+8]
        movss   float88,dword ptr [dword857+4]
        movss   float87,dword ptr [dword857]
        movss   dword ptr [ebp-716],float87
        movss   dword ptr [ebp-712],float88
        movss   dword ptr [ebp-708],float89
        movss   dword ptr [ebp-704],float118
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
        movq    double1,qword ptr [dword862]
        movq    qword ptr [ebp-180],double1
; start of inline function _transform_to_projection_space
        lea     dword8,[ebp-196]
        add     dword8,24
; start of inline function vec4f_assign
        movss   float99,dword ptr [dword863+8]
        movss   float98,dword ptr [dword863+4]
        movss   float97,dword ptr [dword863]
        movss   dword ptr [ebp-716],float97
        movss   dword ptr [ebp-712],float98
        movss   dword ptr [ebp-708],float99
        movss   dword ptr [ebp-704],float118
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
        movq    double2,qword ptr [dword864]
        movq    qword ptr [ebp-156],double2
; start of inline function _transform_to_projection_space
        lea     dword16,[ebp-196]
        add     dword16,48
; start of inline function vec4f_assign
        movss   float109,dword ptr [dword865+8]
        movss   float108,dword ptr [dword865+4]
        movss   float107,dword ptr [dword865]
        movss   dword ptr [ebp-716],float107
        movss   dword ptr [ebp-712],float108
        movss   dword ptr [ebp-708],float109
        movss   dword ptr [ebp-704],float118
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
        movq    double3,qword ptr [dword866]
        movq    qword ptr [ebp-132],double3
        movq    double4,double119
        movq    qword ptr [ebp-124],double4
        movq    double4,double120
        movq    qword ptr [ebp-116],double4
        movq    double4,double121
        movq    qword ptr [ebp-108],double4
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
        mov     dword871,0
label0003:
        mov     dword43,[dword29+192]
        cmp     dword43,dword871
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     dword45,dword29
        mov     dword48,dword871
        imul    dword48,24
        add     dword45,dword48
        lea     dword49,[ebp-332]
        mov     dword52,dword871
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
        movss   float82,dword ptr [___unnamed_float_1]
        divss   float82,float122
        movss   float83,float124
        mulss   float83,float82
        cvttss2si       dword754,float83
        mov     [dword49+dword52],dword754
        movss   float84,float125
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
        mov     dword56,dword871
        sal     dword56,4
        mov     dword62,dword871
        imul    dword62,24
        movq    double6,qword ptr [dword29+dword62+16]
        movq    qword ptr [dword53+dword56+8],double6
        inc     dword871
        jmp     label0003
label0004:
        mov     dword871,2
label0006:
        mov     dword70,[dword29+192]
        dec     dword70
        cmp     dword70,dword871
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     dword72,[ebp-332]
        mov     dword75,dword871
        sal     dword75,4
        add     dword72,dword75
        mov     dword874,dword72
        mov     dword78,dword871
        dec     dword78
        sal     dword78,4
        lea     dword80,[ebp-332]
        add     dword80,dword78
        mov     dword875,dword80
        lea     dword81,[ebp-332]
        mov     dword876,dword81
        mov     dword90,[dword876+4]
        cmp     dword90,[dword875+4]
        jle     label0008
        mov     dword877,dword876
        mov     dword876,dword875
        mov     dword875,dword877
label0008:
        mov     dword106,[dword876+4]
        cmp     dword106,[dword874+4]
        jle     label0009
        mov     dword877,dword876
        mov     dword876,dword874
        mov     dword874,dword877
label0009:
        mov     dword122,[dword875+4]
        cmp     dword122,[dword874+4]
        jle     label000a
        mov     dword877,dword875
        mov     dword875,dword874
        mov     dword874,dword877
label000a:
        mov     dword138,[dword876+4]
        cmp     dword138,[dword874+4]
        jne     label000b
        cmp     dword ptr [dword876+4],0
        jl      label000c
        mov     dword147,[dword876+4]
        cmp     dword147,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        mov     dword151,8
        add     dword151,dword874
        mov     dword880,dword151
        mov     dword153,8
        add     dword153,dword875
        mov     dword881,dword153
        mov     dword155,8
        add     dword155,dword876
        mov     dword882,dword155
        mov     dword643,[dword876+4]
        mov     dword883,dword643
        mov     dword642,[dword874]
        mov     dword641,[dword875]
        mov     dword640,[dword876]
        cmp     dword640,dword641
        jge     label001c
        cmp     dword642,dword641
        jle     label001d
        push_all
        push_arg        dword ptr [ebp-428],4
        push_arg        dword ptr [ebp-432],4
        push_arg        dword ptr [dword882+4],4
        push_arg        dword ptr [dword882],4
        push_arg        dword883,4
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
        push_arg        dword ptr [ebp-428],4
        push_arg        dword ptr [ebp-432],4
        push_arg        dword ptr [dword880+4],4
        push_arg        dword ptr [dword880],4
        push_arg        dword883,4
        push_arg        dword641,4
        push_arg        dword642,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0020
label001f:
        push_all
        push_arg        dword ptr [ebp-428],4
        push_arg        dword ptr [ebp-432],4
        push_arg        dword ptr [dword882+4],4
        push_arg        dword ptr [dword882],4
        push_arg        dword883,4
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
        movss   float74,float126
        xorps   float74,dword ptr [___unnamed_float4_4]
        push_arg        float74,4
        movss   float75,float127
        xorps   float75,dword ptr [___unnamed_float4_4]
        push_arg        float75,4
        push_arg        dword ptr [dword880+4],4
        push_arg        dword ptr [dword880],4
        push_arg        dword883,4
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
        movss   float76,float126
        xorps   float76,dword ptr [___unnamed_float4_4]
        push_arg        float76,4
        movss   float77,float127
        xorps   float77,dword ptr [___unnamed_float4_4]
        push_arg        float77,4
        push_arg        dword ptr [dword881+4],4
        push_arg        dword ptr [dword881],4
        push_arg        dword883,4
        push_arg        dword642,4
        push_arg        dword641,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0025
label0024:
        push_all
        movss   float78,float126
        xorps   float78,dword ptr [___unnamed_float4_4]
        push_arg        float78,4
        movss   float79,float127
        xorps   float79,dword ptr [___unnamed_float4_4]
        push_arg        float79,4
        push_arg        dword ptr [dword881+4],4
        push_arg        dword ptr [dword881],4
        push_arg        dword883,4
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
        mov     dword169,[dword876+4]
        mov     dword887,dword169
label000e:
        mov     dword174,[dword875+4]
        cmp     dword174,dword887
        jle     label000f
        mov     dword179,dword887
        sub     dword179,[dword876+4]
        mov     dword184,[dword875]
        sub     dword184,[dword876]
        imul    dword179,dword184
        mov     dword191,[dword875+4]
        sub     dword191,[dword876+4]
        cdq     dword192,dword179
        idiv    dword179,dword191
        add     dword179,[dword876]
        mov     dword200,dword887
        sub     dword200,[dword876+4]
        mov     dword205,[dword874]
        sub     dword205,[dword876]
        imul    dword200,dword205
        mov     dword212,[dword874+4]
        sub     dword212,[dword876+4]
        cdq     dword213,dword200
        idiv    dword200,dword212
        add     dword200,[dword876]
        mov     dword221,dword887
        sub     dword221,[dword876+4]
        cvtsi2ss        float10,dword221
        movss   float11,dword ptr [dword875+8]
        subss   float11,dword ptr [dword876+8]
        mulss   float10,float11
        mov     dword232,[dword875+4]
        sub     dword232,[dword876+4]
        cvtsi2ss        float12,dword232
        divss   float10,float12
        addss   float10,dword ptr [dword876+8]
        mov     dword240,dword887
        sub     dword240,[dword876+4]
        cvtsi2ss        float13,dword240
        movss   float14,dword ptr [dword874+8]
        subss   float14,dword ptr [dword876+8]
        mulss   float13,float14
        mov     dword251,[dword874+4]
        sub     dword251,[dword876+4]
        cvtsi2ss        float15,dword251
        divss   float13,float15
        addss   float13,dword ptr [dword876+8]
        mov     dword259,dword887
        sub     dword259,[dword876+4]
        cvtsi2ss        float16,dword259
        movss   float17,dword ptr [dword875+12]
        subss   float17,dword ptr [dword876+12]
        mulss   float16,float17
        mov     dword272,[dword875+4]
        sub     dword272,[dword876+4]
        cvtsi2ss        float18,dword272
        divss   float16,float18
        addss   float16,dword ptr [dword876+12]
        mov     dword281,dword887
        sub     dword281,[dword876+4]
        cvtsi2ss        float19,dword281
        movss   float20,dword ptr [dword874+12]
        subss   float20,dword ptr [dword876+12]
        mulss   float19,float20
        mov     dword294,[dword874+4]
        sub     dword294,[dword876+4]
        cvtsi2ss        float21,dword294
        divss   float19,float21
        addss   float19,dword ptr [dword876+12]
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
        movss   float134,float25
        movss   float135,float23
        movss   float136,float19
        movss   float137,float13
        movss   float138,float16
        movss   float139,float10
        cmp     dword179,dword200
        jg      label0013
        push_all
        push_arg        float134,4
        push_arg        float135,4
        push_arg        float138,4
        push_arg        float139,4
        push_arg        dword887,4
        push_arg        dword200,4
        push_arg        dword179,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0014
label0013:
        push_all
        push_arg        float134,4
        push_arg        float135,4
        push_arg        float136,4
        push_arg        float137,4
        push_arg        dword887,4
        push_arg        dword179,4
        push_arg        dword200,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword887
        jmp     label000e
label000f:
        mov     dword327,[dword875+4]
        sub     dword327,[dword876+4]
        mov     dword332,[dword874]
        sub     dword332,[dword876]
        imul    dword327,dword332
        mov     dword339,[dword874+4]
        sub     dword339,[dword876+4]
        cdq     dword340,dword327
        idiv    dword327,dword339
        add     dword327,[dword876]
        mov     dword350,[dword875+4]
        sub     dword350,[dword876+4]
        cvtsi2ss        float26,dword350
        movss   float27,dword ptr [dword874+8]
        subss   float27,dword ptr [dword876+8]
        mulss   float26,float27
        mov     dword361,[dword874+4]
        sub     dword361,[dword876+4]
        cvtsi2ss        float28,dword361
        divss   float26,float28
        addss   float26,dword ptr [dword876+8]
        mov     dword371,[dword875+4]
        sub     dword371,[dword876+4]
        cvtsi2ss        float29,dword371
        movss   float30,dword ptr [dword874+12]
        subss   float30,dword ptr [dword876+12]
        mulss   float29,float30
        mov     dword384,[dword874+4]
        sub     dword384,[dword876+4]
        cvtsi2ss        float31,dword384
        divss   float29,float31
        addss   float29,dword ptr [dword876+12]
        movss   float32,float26
        subss   float32,dword ptr [dword875+8]
        mov     dword395,dword327
        sub     dword395,[dword875]
        cvtsi2ss        float33,dword395
        divss   float32,float33
        movss   float34,float29
        subss   float34,dword ptr [dword875+12]
        mov     dword404,dword327
        sub     dword404,[dword875]
        cvtsi2ss        float35,dword404
        divss   float34,float35
; start of inline function _rasterize_horiz_line__unordered
        movss   float62,dword ptr [dword875+12]
        movss   float61,dword ptr [dword875+8]
        movss   float137,float61
        movss   float138,float29
        movss   float139,float26
        mov     dword600,[dword875+4]
        mov     dword599,[dword875]
        cmp     dword327,dword599
        jg      label0016
        push_all
        push_arg        float34,4
        push_arg        float32,4
        push_arg        float138,4
        push_arg        float139,4
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
        push_arg        float32,4
        push_arg        float62,4
        push_arg        float137,4
        push_arg        dword600,4
        push_arg        dword327,4
        push_arg        dword599,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     dword424,1
        add     dword424,[dword875+4]
        mov     dword887,dword424
label0011:
        mov     dword430,[dword874+4]
        cmp     dword430,dword887
        jle     label0012
        mov     dword435,dword887
        sub     dword435,[dword875+4]
        mov     dword440,[dword874]
        sub     dword440,[dword875]
        imul    dword435,dword440
        mov     dword447,[dword874+4]
        sub     dword447,[dword875+4]
        cdq     dword448,dword435
        idiv    dword435,dword447
        add     dword435,[dword875]
        mov     dword456,dword887
        sub     dword456,[dword876+4]
        mov     dword461,[dword874]
        sub     dword461,[dword876]
        imul    dword456,dword461
        mov     dword468,[dword874+4]
        sub     dword468,[dword876+4]
        cdq     dword469,dword456
        idiv    dword456,dword468
        add     dword456,[dword876]
        mov     dword477,dword887
        sub     dword477,[dword875+4]
        cvtsi2ss        float36,dword477
        movss   float37,dword ptr [dword874+8]
        subss   float37,dword ptr [dword875+8]
        mulss   float36,float37
        mov     dword488,[dword874+4]
        sub     dword488,[dword875+4]
        cvtsi2ss        float38,dword488
        divss   float36,float38
        addss   float36,dword ptr [dword875+8]
        mov     dword496,dword887
        sub     dword496,[dword876+4]
        cvtsi2ss        float39,dword496
        movss   float40,dword ptr [dword874+8]
        subss   float40,dword ptr [dword876+8]
        mulss   float39,float40
        mov     dword507,[dword874+4]
        sub     dword507,[dword876+4]
        cvtsi2ss        float41,dword507
        divss   float39,float41
        addss   float39,dword ptr [dword876+8]
        mov     dword515,dword887
        sub     dword515,[dword875+4]
        cvtsi2ss        float42,dword515
        movss   float43,dword ptr [dword874+12]
        subss   float43,dword ptr [dword875+12]
        mulss   float42,float43
        mov     dword528,[dword874+4]
        sub     dword528,[dword875+4]
        cvtsi2ss        float44,dword528
        divss   float42,float44
        addss   float42,dword ptr [dword875+12]
        mov     dword537,dword887
        sub     dword537,[dword876+4]
        cvtsi2ss        float45,dword537
        movss   float46,dword ptr [dword874+12]
        subss   float46,dword ptr [dword876+12]
        mulss   float45,float46
        mov     dword550,[dword874+4]
        sub     dword550,[dword876+4]
        cvtsi2ss        float47,dword550
        divss   float45,float47
        addss   float45,dword ptr [dword876+12]
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
        movss   float134,float51
        movss   float135,float49
        movss   float136,float45
        movss   float137,float39
        movss   float138,float42
        mov     dword890,dword887
        mov     dword891,dword456
        cmp     dword435,dword891
        jg      label0019
        push_all
        push_arg        float134,4
        push_arg        float135,4
        push_arg        float138,4
        push_arg        float36,4
        push_arg        dword890,4
        push_arg        dword891,4
        push_arg        dword435,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label001a
label0019:
        push_all
        push_arg        float134,4
        push_arg        float135,4
        push_arg        float136,4
        push_arg        float137,4
        push_arg        dword890,4
        push_arg        dword435,4
        push_arg        dword891,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword887
        jmp     label0011
label0012:
label0027:
; end of inline function _rasterize_triangle_2i
        inc     dword871
        jmp     label0006
label0007:
label002c:
; end of inline function _rasterize_polygon_4f
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp

end
