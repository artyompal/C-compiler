
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

_vec2f_add proc
        create_stack_frame
        mov     dword15,[ebp+8]
        mov     dword14,[ebp+16]
        mov     dword13,[ebp+12]
        movss   float1,dword ptr [dword13]
        addss   float1,dword ptr [dword14]
        movss   dword ptr [dword15],float1
        movss   float2,dword ptr [dword13+4]
        addss   float2,dword ptr [dword14+4]
        movss   dword ptr [dword15+4],float2
        destroy_stack_frame
        ret
_vec2f_add endp

_vec2f_subtract proc
        create_stack_frame
        mov     dword15,[ebp+8]
        mov     dword14,[ebp+16]
        mov     dword13,[ebp+12]
        movss   float1,dword ptr [dword13]
        subss   float1,dword ptr [dword14]
        movss   dword ptr [dword15],float1
        movss   float2,dword ptr [dword13+4]
        subss   float2,dword ptr [dword14+4]
        movss   dword ptr [dword15+4],float2
        destroy_stack_frame
        ret
_vec2f_subtract endp

_vec2f_mul proc
        create_stack_frame
        movss   float3,dword ptr [ebp+12]
        mov     dword7,[ebp+8]
        movss   float1,dword ptr [dword7]
        mulss   float1,float3
        movss   dword ptr [dword7],float1
        movss   float2,dword ptr [dword7+4]
        mulss   float2,float3
        movss   dword ptr [dword7+4],float2
        destroy_stack_frame
        ret
_vec2f_mul endp

_vec4f_assign proc
        create_stack_frame
        movss   float8,dword ptr [ebp+24]
        movss   float7,dword ptr [ebp+20]
        movss   float6,dword ptr [ebp+16]
        movss   float5,dword ptr [ebp+12]
        mov     dword13,[ebp+8]
        movss   dword ptr [dword13],float5
        movss   dword ptr [dword13+4],float6
        movss   dword ptr [dword13+8],float7
        movss   dword ptr [dword13+12],float8
        destroy_stack_frame
        ret
_vec4f_assign endp

_vec4f_add proc
        create_stack_frame
        mov     dword27,[ebp+8]
        mov     dword26,[ebp+16]
        mov     dword25,[ebp+12]
        movss   float1,dword ptr [dword25]
        addss   float1,dword ptr [dword26]
        movss   dword ptr [dword27],float1
        movss   float2,dword ptr [dword25+4]
        addss   float2,dword ptr [dword26+4]
        movss   dword ptr [dword27+4],float2
        movss   float3,dword ptr [dword25+8]
        addss   float3,dword ptr [dword26+8]
        movss   dword ptr [dword27+8],float3
        movss   float4,dword ptr [dword25+12]
        addss   float4,dword ptr [dword26+12]
        movss   dword ptr [dword27+12],float4
        destroy_stack_frame
        ret
_vec4f_add endp

_vec4f_subtract proc
        create_stack_frame
        mov     dword27,[ebp+8]
        mov     dword26,[ebp+16]
        mov     dword25,[ebp+12]
        movss   float1,dword ptr [dword25]
        subss   float1,dword ptr [dword26]
        movss   dword ptr [dword27],float1
        movss   float2,dword ptr [dword25+4]
        subss   float2,dword ptr [dword26+4]
        movss   dword ptr [dword27+4],float2
        movss   float3,dword ptr [dword25+8]
        subss   float3,dword ptr [dword26+8]
        movss   dword ptr [dword27+8],float3
        movss   float4,dword ptr [dword25+12]
        subss   float4,dword ptr [dword26+12]
        movss   dword ptr [dword27+12],float4
        destroy_stack_frame
        ret
_vec4f_subtract endp

_vec4f_dot proc
        create_stack_frame
        mov     dword18,[ebp+12]
        mov     dword17,[ebp+8]
        movss   float1,dword ptr [dword17+4]
        mulss   float1,dword ptr [dword18+4]
        movss   float2,dword ptr [dword17]
        mulss   float2,dword ptr [dword18]
        addss   float2,float1
        movss   float3,dword ptr [dword17+8]
        mulss   float3,dword ptr [dword18+8]
        addss   float2,float3
        movss   float4,dword ptr [dword17+12]
        mulss   float4,dword ptr [dword18+12]
        addss   float2,float4
        set_retval      float2
        destroy_stack_frame
        ret
_vec4f_dot endp

_vec4f_mul proc
        create_stack_frame
        movss   float5,dword ptr [ebp+12]
        mov     dword13,[ebp+8]
        movss   float1,dword ptr [dword13]
        mulss   float1,float5
        movss   dword ptr [dword13],float1
        movss   float2,dword ptr [dword13+4]
        mulss   float2,float5
        movss   dword ptr [dword13+4],float2
        movss   float3,dword ptr [dword13+8]
        mulss   float3,float5
        movss   dword ptr [dword13+8],float3
        movss   float4,dword ptr [dword13+12]
        mulss   float4,float5
        movss   dword ptr [dword13+12],float4
        destroy_stack_frame
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        create_stack_frame
        movss   float26,dword ptr [ebp+16]
        movss   float24,dword ptr [ebp+24]
        movss   float22,dword ptr [ebp+12]
        movss   float21,dword ptr [ebp+20]
        mov     dword62,[ebp+8]
        movss   float1,float21
        mulss   float1,float22
        movss   float2,float1
        mulss   float2,float24
        movss   float3,float22
        divss   float3,float2
        movss   dword ptr [dword62],float3
        mov     dword ptr [dword62+4],0
        mov     dword ptr [dword62+8],0
        mov     dword ptr [dword62+12],0
        mov     dword ptr [dword62+16],0
        movss   float8,float22
        divss   float8,float1
        movss   dword ptr [dword62+20],float8
        mov     dword ptr [dword62+24],0
        mov     dword ptr [dword62+28],0
        mov     dword ptr [dword62+32],0
        mov     dword ptr [dword62+36],0
        movss   float13,float26
        subss   float13,float22
        movss   float14,float26
        divss   float14,float13
        movss   dword ptr [dword62+40],float14
        mov     dword ptr [dword62+44],1065353216
        mov     dword ptr [dword62+48],0
        mov     dword ptr [dword62+52],0
        movss   float18,float22
        mulss   float18,float26
        movss   float19,float22
        subss   float19,float26
        divss   float18,float19
        movss   dword ptr [dword62+56],float18
        mov     dword ptr [dword62+60],0
        destroy_stack_frame
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        create_stack_frame
        movss   float24,dword ptr [ebp+20]
        movss   float23,dword ptr [ebp+24]
        movss   float22,dword ptr [ebp+16]
        movss   float21,dword ptr [ebp+12]
        mov     dword54,[ebp+8]
        movss   float2,float21
        mulss   float2,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword54],float2
        mov     dword ptr [dword54+4],0
        mov     dword ptr [dword54+8],0
        mov     dword ptr [dword54+12],0
        mov     dword ptr [dword54+16],0
        movss   float7,float22
        xorps   float7,dword ptr [___unnamed_float4_4]
        mulss   float7,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword54+20],float7
        mov     dword ptr [dword54+24],0
        mov     dword ptr [dword54+28],0
        mov     dword ptr [dword54+32],0
        mov     dword ptr [dword54+36],0
        movss   float13,float23
        subss   float13,float24
        movss   dword ptr [dword54+40],float13
        mov     dword ptr [dword54+44],0
        movss   float16,float21
        mulss   float16,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword54+48],float16
        movss   float18,float22
        mulss   float18,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword54+52],float18
        movss   dword ptr [dword54+56],float24
        mov     dword ptr [dword54+60],1065353216
        destroy_stack_frame
        ret
_matrix4f_make_viewport endp

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
        movss   float63,dword ptr [ebp+24]
        movss   float62,dword ptr [ebp+28]
        movss   float61,dword ptr [ebp+32]
        mov     dword105,[ebp+20]
        mov     dword104,[ebp+16]
        mov     dword103,[ebp+12]
        mov     dword102,[ebp+8]
        mov     dword ptr [__dbgprintf],dword102
        mov     dword ptr [__width],dword103
        mov     dword ptr [__height],dword104
        mov     dword ptr [__pitch],dword105
        push_all
        cvtsi2ss        float1,dword103
        cvtsi2ss        float2,dword104
        divss   float1,float2
        push_arg        float1,4
        push_arg        float61,4
        push_arg        float62,4
        push_arg        float63,4
        push_arg        (offset __mvproj_matrix),4
        call    _matrix4f_make_perspective
        restore_stack   20
        pop_all
        push_all
        push_arg        float62,4
        push_arg        float63,4
        cvtsi2ss        float3,dword104
        push_arg        float3,4
        cvtsi2ss        float4,dword103
        push_arg        float4,4
        push_arg        (offset __viewport_matrix),4
        call    _matrix4f_make_viewport
        restore_stack   20
        pop_all
        push_all
        movss   float5,dword ptr [___unnamed_float_1]
        push_arg        float5,4
        push_arg        float63,4
        movss   float6,dword ptr [___unnamed_float_2]
        push_arg        float6,4
        movss   float7,dword ptr [___unnamed_float_2]
        push_arg        float7,4
        push_arg        (offset __clip_z_near_base),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        comiss  float62,float63
        jbe     label0000
        movss   float64,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   float64,dword ptr [___unnamed_float_5]
label0001:
        push_all
        movss   float11,dword ptr [___unnamed_float_1]
        push_arg        float11,4
        push_arg        float64,4
        movss   float12,dword ptr [___unnamed_float_2]
        push_arg        float12,4
        movss   float13,dword ptr [___unnamed_float_2]
        push_arg        float13,4
        push_arg        (offset __clip_z_near_norm),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float14,dword ptr [___unnamed_float_1]
        push_arg        float14,4
        push_arg        float62,4
        movss   float15,dword ptr [___unnamed_float_2]
        push_arg        float15,4
        movss   float16,dword ptr [___unnamed_float_2]
        push_arg        float16,4
        push_arg        (offset __clip_z_far_base),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        comiss  float62,float63
        jbe     label0002
        movss   float65,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   float65,dword ptr [___unnamed_float_1]
label0003:
        push_all
        movss   float20,dword ptr [___unnamed_float_1]
        push_arg        float20,4
        push_arg        float65,4
        movss   float21,dword ptr [___unnamed_float_2]
        push_arg        float21,4
        movss   float22,dword ptr [___unnamed_float_2]
        push_arg        float22,4
        push_arg        (offset __clip_z_far_norm),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float23,dword ptr [___unnamed_float_1]
        push_arg        float23,4
        movss   float24,dword ptr [___unnamed_float_2]
        push_arg        float24,4
        movss   float25,dword ptr [___unnamed_float_2]
        push_arg        float25,4
        cvtsi2ss        float26,dword103
        movss   float27,dword ptr [___unnamed_float_1]
        divss   float27,float26
        movss   float28,dword ptr [___unnamed_float_5]
        addss   float28,float27
        push_arg        float28,4
        push_arg        (offset __clip_plane_left_base),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float29,dword ptr [___unnamed_float_1]
        push_arg        float29,4
        movss   float30,dword ptr [___unnamed_float_2]
        push_arg        float30,4
        movss   float31,dword ptr [___unnamed_float_2]
        push_arg        float31,4
        movss   float32,dword ptr [___unnamed_float_1]
        push_arg        float32,4
        push_arg        (offset __clip_plane_left_norm),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float33,dword ptr [___unnamed_float_1]
        push_arg        float33,4
        movss   float34,dword ptr [___unnamed_float_2]
        push_arg        float34,4
        movss   float35,dword ptr [___unnamed_float_2]
        push_arg        float35,4
        cvtsi2ss        float36,dword103
        movss   float37,dword ptr [___unnamed_float_1]
        divss   float37,float36
        movss   float38,dword ptr [___unnamed_float_1]
        subss   float38,float37
        push_arg        float38,4
        push_arg        (offset __clip_plane_right_base),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float39,dword ptr [___unnamed_float_1]
        push_arg        float39,4
        movss   float40,dword ptr [___unnamed_float_2]
        push_arg        float40,4
        movss   float41,dword ptr [___unnamed_float_2]
        push_arg        float41,4
        movss   float42,dword ptr [___unnamed_float_5]
        push_arg        float42,4
        push_arg        (offset __clip_plane_right_norm),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float43,dword ptr [___unnamed_float_1]
        push_arg        float43,4
        movss   float44,dword ptr [___unnamed_float_2]
        push_arg        float44,4
        cvtsi2ss        float45,dword104
        movss   float46,dword ptr [___unnamed_float_1]
        divss   float46,float45
        movss   float47,dword ptr [___unnamed_float_5]
        addss   float47,float46
        push_arg        float47,4
        movss   float48,dword ptr [___unnamed_float_2]
        push_arg        float48,4
        push_arg        (offset __clip_plane_top_base),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float49,dword ptr [___unnamed_float_1]
        push_arg        float49,4
        movss   float50,dword ptr [___unnamed_float_2]
        push_arg        float50,4
        movss   float51,dword ptr [___unnamed_float_1]
        push_arg        float51,4
        movss   float52,dword ptr [___unnamed_float_2]
        push_arg        float52,4
        push_arg        (offset __clip_plane_top_norm),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float53,dword ptr [___unnamed_float_1]
        push_arg        float53,4
        movss   float54,dword ptr [___unnamed_float_2]
        push_arg        float54,4
        movss   float55,dword ptr [___unnamed_float_1]
        push_arg        float55,4
        movss   float56,dword ptr [___unnamed_float_2]
        push_arg        float56,4
        push_arg        (offset __clip_plane_bottom_base),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   float57,dword ptr [___unnamed_float_1]
        push_arg        float57,4
        movss   float58,dword ptr [___unnamed_float_2]
        push_arg        float58,4
        movss   float59,dword ptr [___unnamed_float_5]
        push_arg        float59,4
        movss   float60,dword ptr [___unnamed_float_2]
        push_arg        float60,4
        push_arg        (offset __clip_plane_bottom_norm),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
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

__tex2d proc
        create_stack_frame
        movss   float4,dword ptr [ebp+12]
        movss   float3,dword ptr [ebp+8]
        mov     dword3,dword ptr [__texture_width]
        dec     dword3
        cvtsi2ss        float1,dword3
        mulss   float1,float3
        cvttss2si       dword5,float1
        mov     dword9,dword ptr [__texture_height]
        dec     dword9
        cvtsi2ss        float2,dword9
        mulss   float2,float4
        cvttss2si       dword11,float2
        mov     dword15,dword11
        imul    dword15,dword ptr [__texture_width]
        add     dword15,dword5
        sal     dword15,2
        add     dword15,dword ptr [__texture_data]
        set_retval      dword ptr [dword15]
        destroy_stack_frame
        ret
__tex2d endp

__rasterize_horiz_line proc
        create_stack_frame
        movss   float15,dword ptr [ebp+32]
        movss   float14,dword ptr [ebp+28]
        movss   float12,dword ptr [ebp+20]
        movss   float11,dword ptr [ebp+24]
        mov     dword85,[ebp+12]
        mov     dword83,[ebp+8]
        mov     dword82,[ebp+16]
        mov     dword3,dword ptr [__pitch]
        imul    dword3,dword82
        add     dword3,dword ptr [__videomem]
        mov     dword7,dword83
        sal     dword7,2
        add     dword3,dword7
        mov     dword84,dword3
        mov     dword11,dword85
        sal     dword11,2
        add     dword11,dword84
        mov     dword15,dword83
        sal     dword15,2
        sub     dword11,dword15
label0000:
        push_all
        push_arg        float11,4
        push_arg        float12,4
        call    __tex2d
        restore_stack   8
        pop_all
        read_retval     dword19
        mov     dword23,dword19
        sar     dword23,24
        and     dword23,255
        je      label0003
        cvtsi2ss        float1,dword23
        mulss   float1,dword ptr [___unnamed_float_6]
        mov     dword33,[dword84]
        mov     dword36,dword33
        and     dword36,65280
        sar     dword36,8
        mov     dword41,dword33
        and     dword41,255
        mov     dword45,dword19
        and     dword45,65280
        sar     dword45,8
        mov     dword50,dword19
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
        mov     [dword84],dword68
label0003:
        movss   float9,float12
        addss   float9,float14
        movss   float12,float9
        movss   float10,float11
        addss   float10,float15
        movss   float11,float10
        add     dword84,4
        cmp     dword84,dword11
        jl      label0000
        destroy_stack_frame
        ret
__rasterize_horiz_line endp

__rasterize_horiz_line__unordered proc
        create_stack_frame
        movss   float6,dword ptr [ebp+28]
        movss   float5,dword ptr [ebp+32]
        movss   float4,dword ptr [ebp+20]
        movss   float3,dword ptr [ebp+24]
        movss   float2,dword ptr [ebp+36]
        movss   float1,dword ptr [ebp+40]
        mov     dword20,[ebp+16]
        mov     dword19,[ebp+12]
        mov     dword18,[ebp+8]
        cmp     dword18,dword19
        jg      label0000
        push_all
        push_arg        float1,4
        push_arg        float2,4
        push_arg        float3,4
        push_arg        float4,4
        push_arg        dword20,4
        push_arg        dword19,4
        push_arg        dword18,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0001
label0000:
        push_all
        push_arg        float1,4
        push_arg        float2,4
        push_arg        float5,4
        push_arg        float6,4
        push_arg        dword20,4
        push_arg        dword18,4
        push_arg        dword19,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0001:
        destroy_stack_frame
        ret
__rasterize_horiz_line__unordered endp

__rasterize_triangle_1i proc
        create_stack_frame
        movss   float8,dword ptr [ebp+36]
        movss   float7,dword ptr [ebp+40]
        mov     dword76,[ebp+28]
        mov     dword75,[ebp+32]
        mov     dword74,[ebp+20]
        mov     dword73,[ebp+24]
        mov     dword72,[ebp+16]
        mov     dword71,[ebp+12]
        mov     dword70,[ebp+8]
        cmp     dword70,dword71
        jge     label0000
        cmp     dword72,dword71
        jle     label0001
        push_all
        push_arg        float7,4
        push_arg        float8,4
        push_arg        dword ptr [dword73+4],4
        push_arg        dword ptr [dword73],4
        push_arg        dword74,4
        push_arg        dword72,4
        push_arg        dword70,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0002
label0001:
        cmp     dword72,dword70
        jge     label0003
        push_all
        push_arg        float7,4
        push_arg        float8,4
        push_arg        dword ptr [dword75+4],4
        push_arg        dword ptr [dword75],4
        push_arg        dword74,4
        push_arg        dword71,4
        push_arg        dword72,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0004
label0003:
        push_all
        push_arg        float7,4
        push_arg        float8,4
        push_arg        dword ptr [dword73+4],4
        push_arg        dword ptr [dword73],4
        push_arg        dword74,4
        push_arg        dword71,4
        push_arg        dword70,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0004:
label0002:
        jmp     label0005
label0000:
        cmp     dword72,dword71
        jge     label0006
        push_all
        movss   float1,float7
        xorps   float1,dword ptr [___unnamed_float4_4]
        push_arg        float1,4
        movss   float2,float8
        xorps   float2,dword ptr [___unnamed_float4_4]
        push_arg        float2,4
        push_arg        dword ptr [dword75+4],4
        push_arg        dword ptr [dword75],4
        push_arg        dword74,4
        push_arg        dword70,4
        push_arg        dword72,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0007
label0006:
        cmp     dword72,dword70
        jle     label0008
        push_all
        movss   float3,float7
        xorps   float3,dword ptr [___unnamed_float4_4]
        push_arg        float3,4
        movss   float4,float8
        xorps   float4,dword ptr [___unnamed_float4_4]
        push_arg        float4,4
        push_arg        dword ptr [dword76+4],4
        push_arg        dword ptr [dword76],4
        push_arg        dword74,4
        push_arg        dword72,4
        push_arg        dword71,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0009
label0008:
        push_all
        movss   float5,float7
        xorps   float5,dword ptr [___unnamed_float4_4]
        push_arg        float5,4
        movss   float6,float8
        xorps   float6,dword ptr [___unnamed_float4_4]
        push_arg        float6,4
        push_arg        dword ptr [dword76+4],4
        push_arg        dword ptr [dword76],4
        push_arg        dword74,4
        push_arg        dword70,4
        push_arg        dword71,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0009:
label0007:
label0005:
        destroy_stack_frame
        ret
__rasterize_triangle_1i endp

__rasterize_triangle_2i proc
        create_stack_frame
        mov     dword497,[ebp+16]
        mov     dword495,[ebp+12]
        mov     dword494,[ebp+8]
        mov     dword7,[dword494+4]
        cmp     dword7,[dword495+4]
        jle     label0000
        mov     dword496,dword494
        mov     dword494,dword495
        mov     dword495,dword496
label0000:
        mov     dword23,[dword494+4]
        cmp     dword23,[dword497+4]
        jle     label0001
        mov     dword496,dword494
        mov     dword494,dword497
        mov     dword497,dword496
label0001:
        mov     dword39,[dword495+4]
        cmp     dword39,[dword497+4]
        jle     label0002
        mov     dword496,dword495
        mov     dword495,dword497
        mov     dword497,dword496
label0002:
        mov     dword55,[dword494+4]
        cmp     dword55,[dword497+4]
        jne     label0003
        cmp     dword ptr [dword494+4],0
        jl      label0004
        mov     dword64,[dword494+4]
        cmp     dword64,dword ptr [__height]
        jge     label0004
        push_all
        movss   float1,dword ptr [___unnamed_float_2]
        push_arg        float1,4
        movss   float2,dword ptr [___unnamed_float_2]
        push_arg        float2,4
        mov     dword68,dword497
        add     dword68,8
        push_arg        dword68,4
        mov     dword70,dword495
        add     dword70,8
        push_arg        dword70,4
        mov     dword72,dword494
        add     dword72,8
        push_arg        dword72,4
        push_arg        dword ptr [dword494+4],4
        push_arg        dword ptr [dword497],4
        push_arg        dword ptr [dword495],4
        push_arg        dword ptr [dword494],4
        call    __rasterize_triangle_1i
        restore_stack   36
        pop_all
label0004:
        destroy_stack_frame
        ret
label0003:
        mov     dword86,[dword494+4]
        mov     dword498,dword86
label0006:
        mov     dword91,[dword495+4]
        cmp     dword91,dword498
        jle     label0007
        mov     dword96,dword498
        sub     dword96,[dword494+4]
        mov     dword101,[dword495]
        sub     dword101,[dword494]
        imul    dword96,dword101
        mov     dword108,[dword495+4]
        sub     dword108,[dword494+4]
        cdq     dword109,dword96
        idiv    dword96,dword108,dword109
        add     dword96,[dword494]
        mov     dword117,dword498
        sub     dword117,[dword494+4]
        mov     dword122,[dword497]
        sub     dword122,[dword494]
        imul    dword117,dword122
        mov     dword129,[dword497+4]
        sub     dword129,[dword494+4]
        cdq     dword130,dword117
        idiv    dword117,dword129,dword130
        add     dword117,[dword494]
        mov     dword138,dword498
        sub     dword138,[dword494+4]
        cvtsi2ss        float3,dword138
        movss   float4,dword ptr [dword495+8]
        subss   float4,dword ptr [dword494+8]
        mulss   float3,float4
        mov     dword149,[dword495+4]
        sub     dword149,[dword494+4]
        cvtsi2ss        float5,dword149
        divss   float3,float5
        addss   float3,dword ptr [dword494+8]
        mov     dword157,dword498
        sub     dword157,[dword494+4]
        cvtsi2ss        float6,dword157
        movss   float7,dword ptr [dword497+8]
        subss   float7,dword ptr [dword494+8]
        mulss   float6,float7
        mov     dword168,[dword497+4]
        sub     dword168,[dword494+4]
        cvtsi2ss        float8,dword168
        divss   float6,float8
        addss   float6,dword ptr [dword494+8]
        mov     dword176,dword498
        sub     dword176,[dword494+4]
        cvtsi2ss        float9,dword176
        movss   float10,dword ptr [dword495+12]
        subss   float10,dword ptr [dword494+12]
        mulss   float9,float10
        mov     dword189,[dword495+4]
        sub     dword189,[dword494+4]
        cvtsi2ss        float11,dword189
        divss   float9,float11
        addss   float9,dword ptr [dword494+12]
        mov     dword198,dword498
        sub     dword198,[dword494+4]
        cvtsi2ss        float12,dword198
        movss   float13,dword ptr [dword497+12]
        subss   float13,dword ptr [dword494+12]
        mulss   float12,float13
        mov     dword211,[dword497+4]
        sub     dword211,[dword494+4]
        cvtsi2ss        float14,dword211
        divss   float12,float14
        addss   float12,dword ptr [dword494+12]
        mov     dword218,dword117
        sub     dword218,dword96
        cvtsi2ss        float15,dword218
        movss   float16,float6
        subss   float16,float3
        divss   float16,float15
        mov     dword224,dword117
        sub     dword224,dword96
        cvtsi2ss        float17,dword224
        movss   float18,float12
        subss   float18,float9
        divss   float18,float17
        push_all
        push_arg        float18,4
        push_arg        float16,4
        push_arg        float12,4
        push_arg        float6,4
        push_arg        float9,4
        push_arg        float3,4
        push_arg        dword498,4
        push_arg        dword117,4
        push_arg        dword96,4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        inc     dword498
        jmp     label0006
label0007:
        mov     dword244,[dword495+4]
        sub     dword244,[dword494+4]
        mov     dword249,[dword497]
        sub     dword249,[dword494]
        imul    dword244,dword249
        mov     dword256,[dword497+4]
        sub     dword256,[dword494+4]
        cdq     dword257,dword244
        idiv    dword244,dword256,dword257
        add     dword244,[dword494]
        mov     dword267,[dword495+4]
        sub     dword267,[dword494+4]
        cvtsi2ss        float19,dword267
        movss   float20,dword ptr [dword497+8]
        subss   float20,dword ptr [dword494+8]
        mulss   float19,float20
        mov     dword278,[dword497+4]
        sub     dword278,[dword494+4]
        cvtsi2ss        float21,dword278
        divss   float19,float21
        addss   float19,dword ptr [dword494+8]
        mov     dword288,[dword495+4]
        sub     dword288,[dword494+4]
        cvtsi2ss        float22,dword288
        movss   float23,dword ptr [dword497+12]
        subss   float23,dword ptr [dword494+12]
        mulss   float22,float23
        mov     dword301,[dword497+4]
        sub     dword301,[dword494+4]
        cvtsi2ss        float24,dword301
        divss   float22,float24
        addss   float22,dword ptr [dword494+12]
        movss   float25,float19
        subss   float25,dword ptr [dword495+8]
        mov     dword312,dword244
        sub     dword312,[dword495]
        cvtsi2ss        float26,dword312
        divss   float25,float26
        movss   float27,float22
        subss   float27,dword ptr [dword495+12]
        mov     dword321,dword244
        sub     dword321,[dword495]
        cvtsi2ss        float28,dword321
        divss   float27,float28
        push_all
        push_arg        float27,4
        push_arg        float25,4
        push_arg        dword ptr [dword495+12],4
        push_arg        dword ptr [dword495+8],4
        push_arg        float22,4
        push_arg        float19,4
        push_arg        dword ptr [dword495+4],4
        push_arg        dword ptr [dword495],4
        push_arg        dword244,4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        mov     dword341,[dword495+4]
        inc     dword341
        mov     dword498,dword341
label0009:
        mov     dword347,[dword497+4]
        cmp     dword347,dword498
        jle     label000a
        mov     dword352,dword498
        sub     dword352,[dword495+4]
        mov     dword357,[dword497]
        sub     dword357,[dword495]
        imul    dword352,dword357
        mov     dword364,[dword497+4]
        sub     dword364,[dword495+4]
        cdq     dword365,dword352
        idiv    dword352,dword364,dword365
        add     dword352,[dword495]
        mov     dword373,dword498
        sub     dword373,[dword494+4]
        mov     dword378,[dword497]
        sub     dword378,[dword494]
        imul    dword373,dword378
        mov     dword385,[dword497+4]
        sub     dword385,[dword494+4]
        cdq     dword386,dword373
        idiv    dword373,dword385,dword386
        add     dword373,[dword494]
        mov     dword394,dword498
        sub     dword394,[dword495+4]
        cvtsi2ss        float29,dword394
        movss   float30,dword ptr [dword497+8]
        subss   float30,dword ptr [dword495+8]
        mulss   float29,float30
        mov     dword405,[dword497+4]
        sub     dword405,[dword495+4]
        cvtsi2ss        float31,dword405
        divss   float29,float31
        addss   float29,dword ptr [dword495+8]
        mov     dword413,dword498
        sub     dword413,[dword494+4]
        cvtsi2ss        float32,dword413
        movss   float33,dword ptr [dword497+8]
        subss   float33,dword ptr [dword494+8]
        mulss   float32,float33
        mov     dword424,[dword497+4]
        sub     dword424,[dword494+4]
        cvtsi2ss        float34,dword424
        divss   float32,float34
        addss   float32,dword ptr [dword494+8]
        mov     dword432,dword498
        sub     dword432,[dword495+4]
        cvtsi2ss        float35,dword432
        movss   float36,dword ptr [dword497+12]
        subss   float36,dword ptr [dword495+12]
        mulss   float35,float36
        mov     dword445,[dword497+4]
        sub     dword445,[dword495+4]
        cvtsi2ss        float37,dword445
        divss   float35,float37
        addss   float35,dword ptr [dword495+12]
        mov     dword454,dword498
        sub     dword454,[dword494+4]
        cvtsi2ss        float38,dword454
        movss   float39,dword ptr [dword497+12]
        subss   float39,dword ptr [dword494+12]
        mulss   float38,float39
        mov     dword467,[dword497+4]
        sub     dword467,[dword494+4]
        cvtsi2ss        float40,dword467
        divss   float38,float40
        addss   float38,dword ptr [dword494+12]
        mov     dword474,dword373
        sub     dword474,dword352
        cvtsi2ss        float41,dword474
        movss   float42,float32
        subss   float42,float29
        divss   float42,float41
        mov     dword480,dword373
        sub     dword480,dword352
        cvtsi2ss        float43,dword480
        movss   float44,float38
        subss   float44,float35
        divss   float44,float43
        push_all
        push_arg        float44,4
        push_arg        float42,4
        push_arg        float38,4
        push_arg        float32,4
        push_arg        float35,4
        push_arg        float29,4
        push_arg        dword498,4
        push_arg        dword373,4
        push_arg        dword352,4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        inc     dword498
        jmp     label0009
label000a:
        destroy_stack_frame
        ret
__rasterize_triangle_2i endp

__clip_on_plain proc
        create_stack_frame
        mov     dword109,[ebp+20]
        mov     dword108,[ebp+16]
        mov     dword105,[ebp+12]
        mov     dword104,[ebp+8]
        mov     dword ptr [dword104+192],0
        mov     dword106,dword105
        mov     dword8,dword105
        add     dword8,24
        mov     dword107,dword8
label0001:
        mov     dword14,[dword105+192]
        imul    dword14,24
        mov     dword16,dword105
        add     dword16,dword14
        cmp     dword16,dword107
        jle     label0002
        push_all
        push_arg        dword108,4
        push_arg        dword106,4
        lea     dword21,[ebp-24]
        push_arg        dword21,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword109,4
        lea     dword23,[ebp-24]
        push_arg        dword23,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float1
        push_all
        push_arg        dword108,4
        push_arg        dword107,4
        lea     dword28,[ebp-24]
        push_arg        dword28,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword109,4
        lea     dword30,[ebp-24]
        push_arg        dword30,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float2
        movss   float3,dword ptr [___unnamed_float_2]
        comiss  float3,float1
        ja      label0003
        mov     dword36,[dword104+192]
        inc     dword ptr [dword104+192]
        imul    dword36,24
        movq    double4,qword ptr [dword106]
        movq    qword ptr [dword104+dword36],double4
        movq    double4,qword ptr [dword106+8]
        movq    qword ptr [dword104+dword36+8],double4
        movq    double4,qword ptr [dword106+16]
        movq    qword ptr [dword104+dword36+16],double4
label0003:
        movss   float5,dword ptr [___unnamed_float_2]
        comiss  float5,float1
        jae     label0006
        movss   float6,dword ptr [___unnamed_float_2]
        comiss  float6,float2
        ja      label0005
label0006:
        movss   float7,dword ptr [___unnamed_float_2]
        comiss  float7,float2
        ja      label0004
        movss   float8,dword ptr [___unnamed_float_2]
        comiss  float8,float1
        jbe     label0004
label0005:
        push_all
        push_arg        dword106,4
        push_arg        dword108,4
        lea     dword53,[ebp-24]
        push_arg        dword53,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword106,4
        push_arg        dword107,4
        lea     dword58,[ebp-40]
        push_arg        dword58,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword109,4
        lea     dword60,[ebp-24]
        push_arg        dword60,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float9
        push_all
        push_arg        dword109,4
        lea     dword62,[ebp-40]
        push_arg        dword62,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float10
        divss   float9,float10
        push_all
        push_arg        float9,4
        lea     dword65,[ebp-40]
        push_arg        dword65,4
        call    _vec4f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword66,[ebp-40]
        push_arg        dword66,4
        push_arg        dword106,4
        mov     dword72,[dword104+192]
        imul    dword72,24
        mov     dword74,dword104
        add     dword74,dword72
        push_arg        dword74,4
        call    _vec4f_add
        restore_stack   12
        pop_all
        push_all
        mov     dword76,dword106
        add     dword76,16
        push_arg        dword76,4
        mov     dword78,dword107
        add     dword78,16
        push_arg        dword78,4
        lea     dword79,[ebp-48]
        push_arg        dword79,4
        call    _vec2f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        float9,4
        lea     dword81,[ebp-48]
        push_arg        dword81,4
        call    _vec2f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword82,[ebp-48]
        push_arg        dword82,4
        mov     dword84,dword106
        add     dword84,16
        push_arg        dword84,4
        mov     dword88,[dword104+192]
        imul    dword88,24
        mov     dword90,dword104
        add     dword90,dword88
        add     dword90,16
        push_arg        dword90,4
        call    _vec2f_add
        restore_stack   12
        pop_all
        inc     dword ptr [dword104+192]
label0004:
        add     dword106,24
        add     dword107,24
        jmp     label0001
label0002:
        mov     dword98,[dword104+192]
        inc     dword ptr [dword104+192]
        imul    dword98,24
        movq    double11,qword ptr [dword104]
        movq    qword ptr [dword104+dword98],double11
        movq    double11,qword ptr [dword104+8]
        movq    qword ptr [dword104+dword98+8],double11
        movq    double11,qword ptr [dword104+16]
        movq    qword ptr [dword104+dword98+16],double11
        destroy_stack_frame
        ret
__clip_on_plain endp

__clip_poligon proc
        create_stack_frame
        mov     dword29,[ebp+8]
        push_all
        push_arg        (offset __clip_z_far_norm),4
        push_arg        (offset __clip_z_far_base),4
        push_arg        dword29,4
        lea     dword4,[ebp-196]
        push_arg        dword4,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_z_near_norm),4
        push_arg        (offset __clip_z_near_base),4
        lea     dword7,[ebp-196]
        push_arg        dword7,4
        push_arg        dword29,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_left_norm),4
        push_arg        (offset __clip_plane_left_base),4
        push_arg        dword29,4
        lea     dword12,[ebp-196]
        push_arg        dword12,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_right_norm),4
        push_arg        (offset __clip_plane_right_base),4
        lea     dword15,[ebp-196]
        push_arg        dword15,4
        push_arg        dword29,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_top_norm),4
        push_arg        (offset __clip_plane_top_base),4
        push_arg        dword29,4
        lea     dword20,[ebp-196]
        push_arg        dword20,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_bottom_norm),4
        push_arg        (offset __clip_plane_bottom_base),4
        lea     dword23,[ebp-196]
        push_arg        dword23,4
        push_arg        dword29,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        cmp     dword ptr [dword29+192],1
        setg    byte1
        movzx   dword28,byte1
        set_retval      dword28
        destroy_stack_frame
        ret
__clip_poligon endp

__transform_to_screen_space proc
        create_stack_frame
        mov     dword36,[ebp+8]
        mov     dword35,[ebp+12]
        push_all
        push_arg        (offset __viewport_matrix),4
        push_arg        dword35,4
        lea     dword3,[ebp-16]
        push_arg        dword3,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        movss   float1,dword ptr [___unnamed_float_1]
        divss   float1,dword ptr [ebp-4]
        movss   float2,dword ptr [ebp-16]
        mulss   float2,float1
        cvttss2si       dword10,float2
        mov     [dword36],dword10
        movss   float3,dword ptr [ebp-12]
        mulss   float3,float1
        cvttss2si       dword16,float3
        mov     [dword36+4],dword16
        cmp     dword ptr [dword36],0
        jl      label0001
        mov     dword25,[dword36]
        cmp     dword25,dword ptr [__width]
        jge     label0001
        cmp     dword ptr [dword36+4],0
        jl      label0001
        mov     dword32,[dword36+4]
        cmp     dword32,dword ptr [__height]
        jl      label0000
label0001:
        mov     dword ptr ds:[0],0
label0000:
        destroy_stack_frame
        ret
__transform_to_screen_space endp

__rasterize_polygon_4f proc
        create_stack_frame
        mov     dword53,[ebp+8]
        push_all
        push_arg        dword53,4
        call    __clip_poligon
        restore_stack   4
        pop_all
        read_retval     dword2
        cmp     dword2,0
        jne     label0000
        destroy_stack_frame
        ret
label0000:
        cmp     dword ptr [dword53+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword54,0
label0003:
        mov     dword13,[dword53+192]
        cmp     dword13,dword54
        jle     label0004
        push_all
        mov     dword15,dword53
        mov     dword18,dword54
        imul    dword18,24
        add     dword15,dword18
        push_arg        dword15,4
        lea     dword19,[ebp-132]
        mov     dword22,dword54
        sal     dword22,4
        add     dword19,dword22
        push_arg        dword19,4
        call    __transform_to_screen_space
        restore_stack   8
        pop_all
        lea     dword23,[ebp-132]
        mov     dword26,dword54
        sal     dword26,4
        mov     dword32,dword54
        imul    dword32,24
        movq    double1,qword ptr [dword53+dword32+16]
        movq    qword ptr [dword23+dword26+8],double1
        inc     dword54
        jmp     label0003
label0004:
        mov     dword54,2
label0006:
        mov     dword40,[dword53+192]
        dec     dword40
        cmp     dword40,dword54
        jle     label0007
        push_all
        lea     dword42,[ebp-132]
        mov     dword45,dword54
        sal     dword45,4
        add     dword42,dword45
        push_arg        dword42,4
        mov     dword48,dword54
        dec     dword48
        sal     dword48,4
        lea     dword50,[ebp-132]
        add     dword50,dword48
        push_arg        dword50,4
        lea     dword51,[ebp-132]
        push_arg        dword51,4
        call    __rasterize_triangle_2i
        restore_stack   12
        pop_all
        inc     dword54
        jmp     label0006
label0007:
        destroy_stack_frame
        ret
__rasterize_polygon_4f endp

__transform_to_projection_space proc
        create_stack_frame
        mov     dword13,[ebp+8]
        mov     dword12,[ebp+12]
        push_all
        movss   float1,dword ptr [___unnamed_float_1]
        push_arg        float1,4
        push_arg        dword ptr [dword12+8],4
        push_arg        dword ptr [dword12+4],4
        push_arg        dword ptr [dword12],4
        lea     dword8,[ebp-16]
        push_arg        dword8,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        push_arg        (offset __mvproj_matrix),4
        lea     dword10,[ebp-16]
        push_arg        dword10,4
        push_arg        dword13,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        destroy_stack_frame
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        create_stack_frame
        mov     dword35,[ebp+28]
        mov     dword34,[ebp+16]
        mov     dword33,[ebp+24]
        mov     dword32,[ebp+12]
        mov     dword31,[ebp+20]
        mov     dword30,[ebp+8]
        push_all
        push_arg        dword30,4
        lea     dword2,[ebp-196]
        push_arg        dword2,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        movq    double1,qword ptr [dword31]
        movq    double5,double1
        push_all
        push_arg        dword32,4
        movsd   qword ptr [ebp-180],double5
        lea     dword8,[ebp-196]
        add     dword8,24
        push_arg        dword8,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        movq    double2,qword ptr [dword33]
        movq    double6,double2
        push_all
        push_arg        dword34,4
        movsd   qword ptr [ebp-156],double6
        movsd   qword ptr [ebp-180],double5
        lea     dword16,[ebp-196]
        add     dword16,48
        push_arg        dword16,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        movq    double3,qword ptr [dword35]
        movq    double7,double3
        movsd   qword ptr [ebp-132],double7
        movsd   qword ptr [ebp-156],double6
        movsd   qword ptr [ebp-180],double5
        movq    double4,qword ptr [ebp-196]
        movq    double8,double4
        movsd   qword ptr [ebp-124],double8
        movsd   qword ptr [ebp-132],double7
        movsd   qword ptr [ebp-156],double6
        movsd   qword ptr [ebp-180],double5
        movq    double4,qword ptr [ebp-188]
        movq    double9,double4
        movq    double4,double5
        movq    double10,double4
        push_all
        movsd   qword ptr [ebp-108],double10
        movsd   qword ptr [ebp-116],double9
        movsd   qword ptr [ebp-124],double8
        movsd   qword ptr [ebp-132],double7
        movsd   qword ptr [ebp-156],double6
        movsd   qword ptr [ebp-180],double5
        mov     dword ptr [ebp-4],4
        movsd   qword ptr [ebp-108],double10
        movsd   qword ptr [ebp-116],double9
        movsd   qword ptr [ebp-124],double8
        movsd   qword ptr [ebp-132],double7
        movsd   qword ptr [ebp-156],double6
        movsd   qword ptr [ebp-180],double5
        lea     dword29,[ebp-196]
        push_arg        dword29,4
        call    __rasterize_polygon_4f
        restore_stack   4
        pop_all
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp

end
