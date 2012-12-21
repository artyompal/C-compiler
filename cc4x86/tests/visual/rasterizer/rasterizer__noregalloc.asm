
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
        mov     dword2,[ebp+12]
        mov     dword4,[ebp+16]
        movss   float1,dword ptr [dword2]
        addss   float1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        movss   dword ptr [dword6],float1
        mov     dword8,4
        add     dword8,[ebp+12]
        mov     dword10,4
        add     dword10,[ebp+16]
        movss   float2,dword ptr [dword8]
        addss   float2,dword ptr [dword10]
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   dword ptr [dword12],float2
        destroy_stack_frame
        ret
_vec2f_add endp

_vec2f_subtract proc
        create_stack_frame
        mov     dword2,[ebp+12]
        mov     dword4,[ebp+16]
        movss   float1,dword ptr [dword2]
        subss   float1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        movss   dword ptr [dword6],float1
        mov     dword8,4
        add     dword8,[ebp+12]
        mov     dword10,4
        add     dword10,[ebp+16]
        movss   float2,dword ptr [dword8]
        subss   float2,dword ptr [dword10]
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   dword ptr [dword12],float2
        destroy_stack_frame
        ret
_vec2f_subtract endp

_vec2f_mul proc
        create_stack_frame
        mov     dword2,[ebp+8]
        movss   float1,dword ptr [dword2]
        mulss   float1,dword ptr [ebp+12]
        movss   dword ptr [dword2],float1
        mov     dword5,4
        add     dword5,[ebp+8]
        movss   float2,dword ptr [dword5]
        mulss   float2,dword ptr [ebp+12]
        movss   dword ptr [dword5],float2
        destroy_stack_frame
        ret
_vec2f_mul endp

_vec4f_assign proc
        create_stack_frame
        mov     dword2,[ebp+8]
        movss   float1,dword ptr [ebp+12]
        movss   dword ptr [dword2],float1
        mov     dword5,4
        add     dword5,[ebp+8]
        movss   float2,dword ptr [ebp+16]
        movss   dword ptr [dword5],float2
        mov     dword8,8
        add     dword8,[ebp+8]
        movss   float3,dword ptr [ebp+20]
        movss   dword ptr [dword8],float3
        mov     dword11,12
        add     dword11,[ebp+8]
        movss   float4,dword ptr [ebp+24]
        movss   dword ptr [dword11],float4
        destroy_stack_frame
        ret
_vec4f_assign endp

_vec4f_add proc
        create_stack_frame
        mov     dword2,[ebp+12]
        mov     dword4,[ebp+16]
        movss   float1,dword ptr [dword2]
        addss   float1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        movss   dword ptr [dword6],float1
        mov     dword8,4
        add     dword8,[ebp+12]
        mov     dword10,4
        add     dword10,[ebp+16]
        movss   float2,dword ptr [dword8]
        addss   float2,dword ptr [dword10]
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   dword ptr [dword12],float2
        mov     dword14,8
        add     dword14,[ebp+12]
        mov     dword16,8
        add     dword16,[ebp+16]
        movss   float3,dword ptr [dword14]
        addss   float3,dword ptr [dword16]
        mov     dword18,8
        add     dword18,[ebp+8]
        movss   dword ptr [dword18],float3
        mov     dword20,12
        add     dword20,[ebp+12]
        mov     dword22,12
        add     dword22,[ebp+16]
        movss   float4,dword ptr [dword20]
        addss   float4,dword ptr [dword22]
        mov     dword24,12
        add     dword24,[ebp+8]
        movss   dword ptr [dword24],float4
        destroy_stack_frame
        ret
_vec4f_add endp

_vec4f_subtract proc
        create_stack_frame
        mov     dword2,[ebp+12]
        mov     dword4,[ebp+16]
        movss   float1,dword ptr [dword2]
        subss   float1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        movss   dword ptr [dword6],float1
        mov     dword8,4
        add     dword8,[ebp+12]
        mov     dword10,4
        add     dword10,[ebp+16]
        movss   float2,dword ptr [dword8]
        subss   float2,dword ptr [dword10]
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   dword ptr [dword12],float2
        mov     dword14,8
        add     dword14,[ebp+12]
        mov     dword16,8
        add     dword16,[ebp+16]
        movss   float3,dword ptr [dword14]
        subss   float3,dword ptr [dword16]
        mov     dword18,8
        add     dword18,[ebp+8]
        movss   dword ptr [dword18],float3
        mov     dword20,12
        add     dword20,[ebp+12]
        mov     dword22,12
        add     dword22,[ebp+16]
        movss   float4,dword ptr [dword20]
        subss   float4,dword ptr [dword22]
        mov     dword24,12
        add     dword24,[ebp+8]
        movss   dword ptr [dword24],float4
        destroy_stack_frame
        ret
_vec4f_subtract endp

_vec4f_dot proc
        create_stack_frame
        mov     dword2,4
        add     dword2,[ebp+8]
        mov     dword4,4
        add     dword4,[ebp+12]
        movss   float1,dword ptr [dword2]
        mulss   float1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        mov     dword8,[ebp+12]
        movss   float2,dword ptr [dword6]
        mulss   float2,dword ptr [dword8]
        addss   float2,float1
        mov     dword10,8
        add     dword10,[ebp+8]
        mov     dword12,8
        add     dword12,[ebp+12]
        movss   float3,dword ptr [dword10]
        mulss   float3,dword ptr [dword12]
        addss   float2,float3
        mov     dword14,12
        add     dword14,[ebp+8]
        mov     dword16,12
        add     dword16,[ebp+12]
        movss   float4,dword ptr [dword14]
        mulss   float4,dword ptr [dword16]
        addss   float2,float4
        set_retval      float2
        destroy_stack_frame
        ret
_vec4f_dot endp

_vec4f_mul proc
        create_stack_frame
        mov     dword2,[ebp+8]
        movss   float1,dword ptr [dword2]
        mulss   float1,dword ptr [ebp+12]
        movss   dword ptr [dword2],float1
        mov     dword5,4
        add     dword5,[ebp+8]
        movss   float2,dword ptr [dword5]
        mulss   float2,dword ptr [ebp+12]
        movss   dword ptr [dword5],float2
        mov     dword8,8
        add     dword8,[ebp+8]
        movss   float3,dword ptr [dword8]
        mulss   float3,dword ptr [ebp+12]
        movss   dword ptr [dword8],float3
        mov     dword11,12
        add     dword11,[ebp+8]
        movss   float4,dword ptr [dword11]
        mulss   float4,dword ptr [ebp+12]
        movss   dword ptr [dword11],float4
        destroy_stack_frame
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        create_stack_frame
        movss   float1,dword ptr [ebp+20]
        mulss   float1,dword ptr [ebp+12]
        movss   dword ptr [ebp-4],float1
        movss   float2,dword ptr [ebp-4]
        mulss   float2,dword ptr [ebp+24]
        movss   dword ptr [ebp-8],float2
        mov     dword8,[ebp+8]
        movss   float3,dword ptr [ebp+12]
        divss   float3,dword ptr [ebp-8]
        movss   dword ptr [dword8],float3
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   float4,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword12],float4
        mov     dword15,8
        add     dword15,[ebp+8]
        movss   float5,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword15],float5
        mov     dword18,12
        add     dword18,[ebp+8]
        movss   float6,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword18],float6
        mov     dword21,16
        add     dword21,[ebp+8]
        movss   float7,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword21],float7
        mov     dword24,20
        add     dword24,[ebp+8]
        movss   float8,dword ptr [ebp+12]
        divss   float8,dword ptr [ebp-4]
        movss   dword ptr [dword24],float8
        mov     dword28,24
        add     dword28,[ebp+8]
        movss   float9,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword28],float9
        mov     dword31,28
        add     dword31,[ebp+8]
        movss   float10,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword31],float10
        mov     dword34,32
        add     dword34,[ebp+8]
        movss   float11,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword34],float11
        mov     dword37,36
        add     dword37,[ebp+8]
        movss   float12,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword37],float12
        mov     dword40,40
        add     dword40,[ebp+8]
        movss   float13,dword ptr [ebp+16]
        subss   float13,dword ptr [ebp+12]
        movss   float14,dword ptr [ebp+16]
        divss   float14,float13
        movss   dword ptr [dword40],float14
        mov     dword45,44
        add     dword45,[ebp+8]
        movss   float15,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword45],float15
        mov     dword48,48
        add     dword48,[ebp+8]
        movss   float16,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword48],float16
        mov     dword51,52
        add     dword51,[ebp+8]
        movss   float17,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword51],float17
        mov     dword54,56
        add     dword54,[ebp+8]
        movss   float18,dword ptr [ebp+12]
        mulss   float18,dword ptr [ebp+16]
        movss   float19,dword ptr [ebp+12]
        subss   float19,dword ptr [ebp+16]
        divss   float18,float19
        movss   dword ptr [dword54],float18
        mov     dword60,60
        add     dword60,[ebp+8]
        movss   float20,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword60],float20
        destroy_stack_frame
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        create_stack_frame
        mov     dword2,[ebp+8]
        movss   float2,dword ptr [ebp+12]
        mulss   float2,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword2],float2
        mov     dword6,4
        add     dword6,[ebp+8]
        movss   float3,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword6],float3
        mov     dword9,8
        add     dword9,[ebp+8]
        movss   float4,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword9],float4
        mov     dword12,12
        add     dword12,[ebp+8]
        movss   float5,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword12],float5
        mov     dword15,16
        add     dword15,[ebp+8]
        movss   float6,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword15],float6
        mov     dword18,20
        add     dword18,[ebp+8]
        movss   float7,dword ptr [ebp+16]
        xorps   float7,dword ptr [___unnamed_float4_4]
        mulss   float7,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword18],float7
        mov     dword22,24
        add     dword22,[ebp+8]
        movss   float9,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword22],float9
        mov     dword25,28
        add     dword25,[ebp+8]
        movss   float10,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword25],float10
        mov     dword28,32
        add     dword28,[ebp+8]
        movss   float11,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword28],float11
        mov     dword31,36
        add     dword31,[ebp+8]
        movss   float12,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword31],float12
        mov     dword34,40
        add     dword34,[ebp+8]
        movss   float13,dword ptr [ebp+24]
        subss   float13,dword ptr [ebp+20]
        movss   dword ptr [dword34],float13
        mov     dword38,44
        add     dword38,[ebp+8]
        movss   float14,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword38],float14
        mov     dword41,48
        add     dword41,[ebp+8]
        movss   float16,dword ptr [ebp+12]
        mulss   float16,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword41],float16
        mov     dword45,52
        add     dword45,[ebp+8]
        movss   float18,dword ptr [ebp+16]
        mulss   float18,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword45],float18
        mov     dword49,56
        add     dword49,[ebp+8]
        movss   float19,dword ptr [ebp+20]
        movss   dword ptr [dword49],float19
        mov     dword52,60
        add     dword52,[ebp+8]
        movss   float20,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword52],float20
        destroy_stack_frame
        ret
_matrix4f_make_viewport endp

_matrix4f_transform proc
        create_stack_frame
        mov     dword2,4
        add     dword2,[ebp+12]
        mov     dword4,16
        add     dword4,[ebp+16]
        movss   float1,dword ptr [dword2]
        mulss   float1,dword ptr [dword4]
        mov     dword6,[ebp+12]
        mov     dword8,[ebp+16]
        movss   float2,dword ptr [dword6]
        mulss   float2,dword ptr [dword8]
        addss   float2,float1
        mov     dword10,8
        add     dword10,[ebp+12]
        mov     dword12,32
        add     dword12,[ebp+16]
        movss   float3,dword ptr [dword10]
        mulss   float3,dword ptr [dword12]
        addss   float2,float3
        mov     dword14,12
        add     dword14,[ebp+12]
        mov     dword16,48
        add     dword16,[ebp+16]
        movss   float4,dword ptr [dword14]
        mulss   float4,dword ptr [dword16]
        addss   float2,float4
        mov     dword18,[ebp+8]
        movss   dword ptr [dword18],float2
        mov     dword20,4
        add     dword20,[ebp+16]
        mov     dword22,[ebp+12]
        movss   float5,dword ptr [dword22]
        mulss   float5,dword ptr [dword20]
        mov     dword24,4
        add     dword24,[ebp+12]
        mov     dword26,20
        add     dword26,[ebp+16]
        movss   float6,dword ptr [dword24]
        mulss   float6,dword ptr [dword26]
        addss   float5,float6
        mov     dword28,8
        add     dword28,[ebp+12]
        mov     dword30,36
        add     dword30,[ebp+16]
        movss   float7,dword ptr [dword28]
        mulss   float7,dword ptr [dword30]
        addss   float5,float7
        mov     dword32,12
        add     dword32,[ebp+12]
        mov     dword34,52
        add     dword34,[ebp+16]
        movss   float8,dword ptr [dword32]
        mulss   float8,dword ptr [dword34]
        addss   float5,float8
        mov     dword36,4
        add     dword36,[ebp+8]
        movss   dword ptr [dword36],float5
        mov     dword38,8
        add     dword38,[ebp+16]
        mov     dword40,[ebp+12]
        movss   float9,dword ptr [dword40]
        mulss   float9,dword ptr [dword38]
        mov     dword42,4
        add     dword42,[ebp+12]
        mov     dword44,24
        add     dword44,[ebp+16]
        movss   float10,dword ptr [dword42]
        mulss   float10,dword ptr [dword44]
        addss   float9,float10
        mov     dword46,8
        add     dword46,[ebp+12]
        mov     dword48,40
        add     dword48,[ebp+16]
        movss   float11,dword ptr [dword46]
        mulss   float11,dword ptr [dword48]
        addss   float9,float11
        mov     dword50,12
        add     dword50,[ebp+12]
        mov     dword52,56
        add     dword52,[ebp+16]
        movss   float12,dword ptr [dword50]
        mulss   float12,dword ptr [dword52]
        addss   float9,float12
        mov     dword54,8
        add     dword54,[ebp+8]
        movss   dword ptr [dword54],float9
        mov     dword56,12
        add     dword56,[ebp+16]
        mov     dword58,[ebp+12]
        movss   float13,dword ptr [dword58]
        mulss   float13,dword ptr [dword56]
        mov     dword60,4
        add     dword60,[ebp+12]
        mov     dword62,28
        add     dword62,[ebp+16]
        movss   float14,dword ptr [dword60]
        mulss   float14,dword ptr [dword62]
        addss   float13,float14
        mov     dword64,8
        add     dword64,[ebp+12]
        mov     dword66,44
        add     dword66,[ebp+16]
        movss   float15,dword ptr [dword64]
        mulss   float15,dword ptr [dword66]
        addss   float13,float15
        mov     dword68,12
        add     dword68,[ebp+12]
        mov     dword70,60
        add     dword70,[ebp+16]
        movss   float16,dword ptr [dword68]
        mulss   float16,dword ptr [dword70]
        addss   float13,float16
        mov     dword72,12
        add     dword72,[ebp+8]
        movss   dword ptr [dword72],float13
        destroy_stack_frame
        ret
_matrix4f_transform endp

_rasterizer_init proc
        create_stack_frame
        mov     dword3,[ebp+8]
        mov     dword ptr [__dbgprintf],dword3
        mov     dword6,[ebp+12]
        mov     dword ptr [__width],dword6
        mov     dword9,[ebp+16]
        mov     dword ptr [__height],dword9
        mov     dword12,[ebp+20]
        mov     dword ptr [__pitch],dword12
        push_all
        cvtsi2ss        float1,dword ptr [ebp+12]
        cvtsi2ss        float2,dword ptr [ebp+16]
        divss   float1,float2
        push_arg        float1,4
        push_arg        dword ptr [ebp+32],4
        push_arg        dword ptr [ebp+28],4
        push_arg        dword ptr [ebp+24],4
        push_arg        (offset __mvproj_matrix),4
        call    _matrix4f_make_perspective
        restore_stack   20
        pop_all
        push_all
        push_arg        dword ptr [ebp+28],4
        push_arg        dword ptr [ebp+24],4
        cvtsi2ss        float3,dword ptr [ebp+16]
        push_arg        float3,4
        cvtsi2ss        float4,dword ptr [ebp+12]
        push_arg        float4,4
        push_arg        (offset __viewport_matrix),4
        call    _matrix4f_make_viewport
        restore_stack   20
        pop_all
        push_all
        movss   float5,dword ptr [___unnamed_float_1]
        push_arg        float5,4
        push_arg        dword ptr [ebp+24],4
        movss   float6,dword ptr [___unnamed_float_2]
        push_arg        float6,4
        movss   float7,dword ptr [___unnamed_float_2]
        push_arg        float7,4
        push_arg        (offset __clip_z_near_base),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        movss   float8,dword ptr [ebp+28]
        comiss  float8,dword ptr [ebp+24]
        jbe     label0000
        movss   float9,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-4],float9
        jmp     label0001
label0000:
        movss   float10,dword ptr [___unnamed_float_5]
        movss   dword ptr [ebp-4],float10
label0001:
        push_all
        movss   float11,dword ptr [___unnamed_float_1]
        push_arg        float11,4
        push_arg        dword ptr [ebp-4],4
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
        push_arg        dword ptr [ebp+28],4
        movss   float15,dword ptr [___unnamed_float_2]
        push_arg        float15,4
        movss   float16,dword ptr [___unnamed_float_2]
        push_arg        float16,4
        push_arg        (offset __clip_z_far_base),4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        movss   float17,dword ptr [ebp+28]
        comiss  float17,dword ptr [ebp+24]
        jbe     label0002
        movss   float18,dword ptr [___unnamed_float_5]
        movss   dword ptr [ebp-8],float18
        jmp     label0003
label0002:
        movss   float19,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-8],float19
label0003:
        push_all
        movss   float20,dword ptr [___unnamed_float_1]
        push_arg        float20,4
        push_arg        dword ptr [ebp-8],4
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
        cvtsi2ss        float26,dword ptr [ebp+12]
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
        cvtsi2ss        float36,dword ptr [ebp+12]
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
        cvtsi2ss        float45,dword ptr [ebp+16]
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
        mov     dword3,[ebp+8]
        mov     dword ptr [__videomem],dword3
        destroy_stack_frame
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        create_stack_frame
        mov     dword2,[ebp+8]
        mov     dword4,(offset __mvproj_matrix)
        mov     dword5,dword2
        mov     dword6,16
        rep     movsd   dword4,dword5,dword6
        destroy_stack_frame
        ret
_rasterizer_set_mvproj endp

_rasterizer_set_color proc
        create_stack_frame
        mov     dword3,[ebp+8]
        mov     dword ptr [__color],dword3
        destroy_stack_frame
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        create_stack_frame
        mov     dword3,[ebp+8]
        mov     dword ptr [__texture_data],dword3
        mov     dword6,[ebp+12]
        mov     dword ptr [__texture_width],dword6
        mov     dword9,[ebp+16]
        mov     dword ptr [__texture_height],dword9
        destroy_stack_frame
        ret
_rasterizer_set_texture endp

__tex2d proc
        create_stack_frame
        mov     dword3,dword ptr [__texture_width]
        dec     dword3
        cvtsi2ss        float1,dword3
        mulss   float1,dword ptr [ebp+8]
        cvttss2si       dword5,float1
        mov     [ebp-4],dword5
        mov     dword9,dword ptr [__texture_height]
        dec     dword9
        cvtsi2ss        float2,dword9
        mulss   float2,dword ptr [ebp+12]
        cvttss2si       dword11,float2
        mov     [ebp-8],dword11
        mov     dword15,[ebp-8]
        imul    dword15,dword ptr [__texture_width]
        add     dword15,[ebp-4]
        sal     dword15,2
        add     dword15,dword ptr [__texture_data]
        set_retval      dword ptr [dword15]
        destroy_stack_frame
        ret
__tex2d endp

__rasterize_horiz_line proc
        create_stack_frame
        mov     dword3,dword ptr [__pitch]
        imul    dword3,[ebp+16]
        add     dword3,dword ptr [__videomem]
        mov     dword7,[ebp+8]
        sal     dword7,2
        add     dword3,dword7
        mov     [ebp-4],dword3
        mov     dword11,[ebp+12]
        sal     dword11,2
        add     dword11,[ebp-4]
        mov     dword15,[ebp+8]
        sal     dword15,2
        sub     dword11,dword15
        mov     [ebp-8],dword11
label0000:
        push_all
        push_arg        dword ptr [ebp+24],4
        push_arg        dword ptr [ebp+20],4
        call    __tex2d
        restore_stack   8
        pop_all
        read_retval     dword19
        mov     [ebp-12],dword19
        mov     dword23,[ebp-12]
        sar     dword23,24
        and     dword23,255
        mov     [ebp-40],dword23
        cmp     dword ptr [ebp-40],0
        je      label0003
        cvtsi2ss        float1,dword ptr [ebp-40]
        mulss   float1,dword ptr [___unnamed_float_6]
        movss   dword ptr [ebp-44],float1
        mov     dword31,[ebp-4]
        mov     dword33,[dword31]
        mov     [ebp-28],dword33
        mov     dword36,[ebp-28]
        and     dword36,65280
        sar     dword36,8
        mov     [ebp-32],dword36
        mov     dword41,[ebp-28]
        and     dword41,255
        mov     [ebp-36],dword41
        mov     dword45,[ebp-12]
        and     dword45,65280
        sar     dword45,8
        mov     [ebp-20],dword45
        mov     dword50,[ebp-12]
        and     dword50,255
        mov     [ebp-24],dword50
        cvtsi2ss        float3,dword ptr [ebp-20]
        mulss   float3,dword ptr [ebp-44]
        cvtsi2ss        float4,dword ptr [ebp-32]
        movss   float5,dword ptr [___unnamed_float_1]
        subss   float5,dword ptr [ebp-44]
        mulss   float4,float5
        addss   float3,float4
        cvttss2si       dword57,float3
        mov     [ebp-20],dword57
        cvtsi2ss        float6,dword ptr [ebp-24]
        mulss   float6,dword ptr [ebp-44]
        cvtsi2ss        float7,dword ptr [ebp-36]
        movss   float8,dword ptr [___unnamed_float_1]
        subss   float8,dword ptr [ebp-44]
        mulss   float7,float8
        addss   float6,float7
        cvttss2si       dword64,float6
        mov     [ebp-24],dword64
        mov     dword68,[ebp-20]
        sal     dword68,8
        add     dword68,[ebp-24]
        mov     [ebp-16],dword68
        mov     dword72,[ebp-4]
        mov     dword74,[ebp-16]
        mov     [dword72],dword74
label0003:
        movss   float9,dword ptr [ebp+20]
        addss   float9,dword ptr [ebp+28]
        movss   dword ptr [ebp+20],float9
        movss   float10,dword ptr [ebp+24]
        addss   float10,dword ptr [ebp+32]
        movss   dword ptr [ebp+24],float10
        add     dword ptr [ebp-4],4
        mov     dword81,[ebp-4]
        cmp     dword81,[ebp-8]
        jl      label0000
        destroy_stack_frame
        ret
__rasterize_horiz_line endp

__rasterize_horiz_line__unordered proc
        create_stack_frame
        mov     dword3,[ebp+8]
        cmp     dword3,[ebp+12]
        jg      label0000
        push_all
        push_arg        dword ptr [ebp+40],4
        push_arg        dword ptr [ebp+36],4
        push_arg        dword ptr [ebp+24],4
        push_arg        dword ptr [ebp+20],4
        push_arg        dword ptr [ebp+16],4
        push_arg        dword ptr [ebp+12],4
        push_arg        dword ptr [ebp+8],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0001
label0000:
        push_all
        push_arg        dword ptr [ebp+40],4
        push_arg        dword ptr [ebp+36],4
        push_arg        dword ptr [ebp+32],4
        push_arg        dword ptr [ebp+28],4
        push_arg        dword ptr [ebp+16],4
        push_arg        dword ptr [ebp+8],4
        push_arg        dword ptr [ebp+12],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0001:
        destroy_stack_frame
        ret
__rasterize_horiz_line__unordered endp

__rasterize_triangle_1i proc
        create_stack_frame
        mov     dword3,[ebp+8]
        cmp     dword3,[ebp+12]
        jge     label0000
        mov     dword6,[ebp+16]
        cmp     dword6,[ebp+12]
        jle     label0001
        push_all
        push_arg        dword ptr [ebp+40],4
        push_arg        dword ptr [ebp+36],4
        mov     dword10,4
        add     dword10,[ebp+24]
        push_arg        dword ptr [dword10],4
        mov     dword12,[ebp+24]
        push_arg        dword ptr [dword12],4
        push_arg        dword ptr [ebp+20],4
        push_arg        dword ptr [ebp+16],4
        push_arg        dword ptr [ebp+8],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0002
label0001:
        mov     dword18,[ebp+16]
        cmp     dword18,[ebp+8]
        jge     label0003
        push_all
        push_arg        dword ptr [ebp+40],4
        push_arg        dword ptr [ebp+36],4
        mov     dword22,4
        add     dword22,[ebp+32]
        push_arg        dword ptr [dword22],4
        mov     dword24,[ebp+32]
        push_arg        dword ptr [dword24],4
        push_arg        dword ptr [ebp+20],4
        push_arg        dword ptr [ebp+12],4
        push_arg        dword ptr [ebp+16],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0004
label0003:
        push_all
        push_arg        dword ptr [ebp+40],4
        push_arg        dword ptr [ebp+36],4
        mov     dword31,4
        add     dword31,[ebp+24]
        push_arg        dword ptr [dword31],4
        mov     dword33,[ebp+24]
        push_arg        dword ptr [dword33],4
        push_arg        dword ptr [ebp+20],4
        push_arg        dword ptr [ebp+12],4
        push_arg        dword ptr [ebp+8],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0004:
label0002:
        jmp     label0005
label0000:
        mov     dword39,[ebp+16]
        cmp     dword39,[ebp+12]
        jge     label0006
        push_all
        movss   float1,dword ptr [ebp+40]
        xorps   float1,dword ptr [___unnamed_float4_4]
        push_arg        float1,4
        movss   float2,dword ptr [ebp+36]
        xorps   float2,dword ptr [___unnamed_float4_4]
        push_arg        float2,4
        mov     dword43,4
        add     dword43,[ebp+32]
        push_arg        dword ptr [dword43],4
        mov     dword45,[ebp+32]
        push_arg        dword ptr [dword45],4
        push_arg        dword ptr [ebp+20],4
        push_arg        dword ptr [ebp+8],4
        push_arg        dword ptr [ebp+16],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0007
label0006:
        mov     dword51,[ebp+16]
        cmp     dword51,[ebp+8]
        jle     label0008
        push_all
        movss   float3,dword ptr [ebp+40]
        xorps   float3,dword ptr [___unnamed_float4_4]
        push_arg        float3,4
        movss   float4,dword ptr [ebp+36]
        xorps   float4,dword ptr [___unnamed_float4_4]
        push_arg        float4,4
        mov     dword55,4
        add     dword55,[ebp+28]
        push_arg        dword ptr [dword55],4
        mov     dword57,[ebp+28]
        push_arg        dword ptr [dword57],4
        push_arg        dword ptr [ebp+20],4
        push_arg        dword ptr [ebp+16],4
        push_arg        dword ptr [ebp+12],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0009
label0008:
        push_all
        movss   float5,dword ptr [ebp+40]
        xorps   float5,dword ptr [___unnamed_float4_4]
        push_arg        float5,4
        movss   float6,dword ptr [ebp+36]
        xorps   float6,dword ptr [___unnamed_float4_4]
        push_arg        float6,4
        mov     dword64,4
        add     dword64,[ebp+28]
        push_arg        dword ptr [dword64],4
        mov     dword66,[ebp+28]
        push_arg        dword ptr [dword66],4
        push_arg        dword ptr [ebp+20],4
        push_arg        dword ptr [ebp+8],4
        push_arg        dword ptr [ebp+12],4
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
        mov     dword2,[ebp+8]
        mov     dword5,[ebp+12]
        mov     dword7,[dword2+4]
        cmp     dword7,[dword5+4]
        jle     label0000
        mov     dword10,[ebp+8]
        mov     [ebp-4],dword10
        mov     dword13,[ebp+12]
        mov     [ebp+8],dword13
        mov     dword16,[ebp-4]
        mov     [ebp+12],dword16
label0000:
        mov     dword18,[ebp+8]
        mov     dword21,[ebp+16]
        mov     dword23,[dword18+4]
        cmp     dword23,[dword21+4]
        jle     label0001
        mov     dword26,[ebp+8]
        mov     [ebp-4],dword26
        mov     dword29,[ebp+16]
        mov     [ebp+8],dword29
        mov     dword32,[ebp-4]
        mov     [ebp+16],dword32
label0001:
        mov     dword34,[ebp+12]
        mov     dword37,[ebp+16]
        mov     dword39,[dword34+4]
        cmp     dword39,[dword37+4]
        jle     label0002
        mov     dword42,[ebp+12]
        mov     [ebp-4],dword42
        mov     dword45,[ebp+16]
        mov     [ebp+12],dword45
        mov     dword48,[ebp-4]
        mov     [ebp+16],dword48
label0002:
        mov     dword50,[ebp+8]
        mov     dword53,[ebp+16]
        mov     dword55,[dword50+4]
        cmp     dword55,[dword53+4]
        jne     label0003
        mov     dword57,[ebp+8]
        cmp     dword ptr [dword57+4],0
        jl      label0004
        mov     dword61,[ebp+8]
        mov     dword64,[dword61+4]
        cmp     dword64,dword ptr [__height]
        jge     label0004
        push_all
        movss   float1,dword ptr [___unnamed_float_2]
        push_arg        float1,4
        movss   float2,dword ptr [___unnamed_float_2]
        push_arg        float2,4
        mov     dword68,8
        add     dword68,[ebp+16]
        push_arg        dword68,4
        mov     dword70,8
        add     dword70,[ebp+12]
        push_arg        dword70,4
        mov     dword72,8
        add     dword72,[ebp+8]
        push_arg        dword72,4
        mov     dword74,[ebp+8]
        push_arg        dword ptr [dword74+4],4
        mov     dword77,[ebp+16]
        push_arg        dword ptr [dword77],4
        mov     dword79,[ebp+12]
        push_arg        dword ptr [dword79],4
        mov     dword81,[ebp+8]
        push_arg        dword ptr [dword81],4
        call    __rasterize_triangle_1i
        restore_stack   36
        pop_all
label0004:
        destroy_stack_frame
        ret
label0003:
        mov     dword83,[ebp+8]
        mov     dword86,[dword83+4]
        mov     [ebp-16],dword86
label0006:
        mov     dword88,[ebp+12]
        mov     dword91,[dword88+4]
        cmp     dword91,[ebp-16]
        jle     label0007
        mov     dword93,[ebp+8]
        mov     dword96,[ebp-16]
        sub     dword96,[dword93+4]
        mov     dword98,[ebp+12]
        mov     dword100,[ebp+8]
        mov     dword101,[dword98]
        sub     dword101,[dword100]
        imul    dword96,dword101
        mov     dword103,[ebp+12]
        mov     dword106,[ebp+8]
        mov     dword108,[dword103+4]
        sub     dword108,[dword106+4]
        cdq     dword109,dword96
        idiv    dword96,dword108,dword109
        mov     dword111,[ebp+8]
        add     dword96,[dword111]
        mov     [ebp-8],dword96
        mov     dword114,[ebp+8]
        mov     dword117,[ebp-16]
        sub     dword117,[dword114+4]
        mov     dword119,[ebp+16]
        mov     dword121,[ebp+8]
        mov     dword122,[dword119]
        sub     dword122,[dword121]
        imul    dword117,dword122
        mov     dword124,[ebp+16]
        mov     dword127,[ebp+8]
        mov     dword129,[dword124+4]
        sub     dword129,[dword127+4]
        cdq     dword130,dword117
        idiv    dword117,dword129,dword130
        mov     dword132,[ebp+8]
        add     dword117,[dword132]
        mov     [ebp-12],dword117
        mov     dword135,[ebp+8]
        mov     dword138,[ebp-16]
        sub     dword138,[dword135+4]
        cvtsi2ss        float3,dword138
        mov     dword140,8
        add     dword140,[ebp+12]
        mov     dword142,8
        add     dword142,[ebp+8]
        movss   float4,dword ptr [dword140]
        subss   float4,dword ptr [dword142]
        mulss   float3,float4
        mov     dword144,[ebp+12]
        mov     dword147,[ebp+8]
        mov     dword149,[dword144+4]
        sub     dword149,[dword147+4]
        cvtsi2ss        float5,dword149
        divss   float3,float5
        mov     dword151,8
        add     dword151,[ebp+8]
        addss   float3,dword ptr [dword151]
        movss   dword ptr [ebp-20],float3
        mov     dword154,[ebp+8]
        mov     dword157,[ebp-16]
        sub     dword157,[dword154+4]
        cvtsi2ss        float6,dword157
        mov     dword159,8
        add     dword159,[ebp+16]
        mov     dword161,8
        add     dword161,[ebp+8]
        movss   float7,dword ptr [dword159]
        subss   float7,dword ptr [dword161]
        mulss   float6,float7
        mov     dword163,[ebp+16]
        mov     dword166,[ebp+8]
        mov     dword168,[dword163+4]
        sub     dword168,[dword166+4]
        cvtsi2ss        float8,dword168
        divss   float6,float8
        mov     dword170,8
        add     dword170,[ebp+8]
        addss   float6,dword ptr [dword170]
        movss   dword ptr [ebp-28],float6
        mov     dword173,[ebp+8]
        mov     dword176,[ebp-16]
        sub     dword176,[dword173+4]
        cvtsi2ss        float9,dword176
        mov     dword178,8
        add     dword178,[ebp+12]
        mov     dword181,8
        add     dword181,[ebp+8]
        movss   float10,dword ptr [dword178+4]
        subss   float10,dword ptr [dword181+4]
        mulss   float9,float10
        mov     dword184,[ebp+12]
        mov     dword187,[ebp+8]
        mov     dword189,[dword184+4]
        sub     dword189,[dword187+4]
        cvtsi2ss        float11,dword189
        divss   float9,float11
        mov     dword191,8
        add     dword191,[ebp+8]
        addss   float9,dword ptr [dword191+4]
        movss   dword ptr [ebp-24],float9
        mov     dword195,[ebp+8]
        mov     dword198,[ebp-16]
        sub     dword198,[dword195+4]
        cvtsi2ss        float12,dword198
        mov     dword200,8
        add     dword200,[ebp+16]
        mov     dword203,8
        add     dword203,[ebp+8]
        movss   float13,dword ptr [dword200+4]
        subss   float13,dword ptr [dword203+4]
        mulss   float12,float13
        mov     dword206,[ebp+16]
        mov     dword209,[ebp+8]
        mov     dword211,[dword206+4]
        sub     dword211,[dword209+4]
        cvtsi2ss        float14,dword211
        divss   float12,float14
        mov     dword213,8
        add     dword213,[ebp+8]
        addss   float12,dword ptr [dword213+4]
        movss   dword ptr [ebp-32],float12
        mov     dword218,[ebp-12]
        sub     dword218,[ebp-8]
        cvtsi2ss        float15,dword218
        movss   float16,dword ptr [ebp-28]
        subss   float16,dword ptr [ebp-20]
        divss   float16,float15
        movss   dword ptr [ebp-36],float16
        mov     dword224,[ebp-12]
        sub     dword224,[ebp-8]
        cvtsi2ss        float17,dword224
        movss   float18,dword ptr [ebp-32]
        subss   float18,dword ptr [ebp-24]
        divss   float18,float17
        movss   dword ptr [ebp-40],float18
        push_all
        push_arg        dword ptr [ebp-40],4
        push_arg        dword ptr [ebp-36],4
        push_arg        dword ptr [ebp-32],4
        push_arg        dword ptr [ebp-28],4
        push_arg        dword ptr [ebp-24],4
        push_arg        dword ptr [ebp-20],4
        push_arg        dword ptr [ebp-16],4
        push_arg        dword ptr [ebp-12],4
        push_arg        dword ptr [ebp-8],4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        inc     dword ptr [ebp-16]
        jmp     label0006
label0007:
        mov     dword239,[ebp+12]
        mov     dword242,[ebp+8]
        mov     dword244,[dword239+4]
        sub     dword244,[dword242+4]
        mov     dword246,[ebp+16]
        mov     dword248,[ebp+8]
        mov     dword249,[dword246]
        sub     dword249,[dword248]
        imul    dword244,dword249
        mov     dword251,[ebp+16]
        mov     dword254,[ebp+8]
        mov     dword256,[dword251+4]
        sub     dword256,[dword254+4]
        cdq     dword257,dword244
        idiv    dword244,dword256,dword257
        mov     dword259,[ebp+8]
        add     dword244,[dword259]
        mov     [ebp-12],dword244
        mov     dword262,[ebp+12]
        mov     dword265,[ebp+8]
        mov     dword267,[dword262+4]
        sub     dword267,[dword265+4]
        cvtsi2ss        float19,dword267
        mov     dword269,8
        add     dword269,[ebp+16]
        mov     dword271,8
        add     dword271,[ebp+8]
        movss   float20,dword ptr [dword269]
        subss   float20,dword ptr [dword271]
        mulss   float19,float20
        mov     dword273,[ebp+16]
        mov     dword276,[ebp+8]
        mov     dword278,[dword273+4]
        sub     dword278,[dword276+4]
        cvtsi2ss        float21,dword278
        divss   float19,float21
        mov     dword280,8
        add     dword280,[ebp+8]
        addss   float19,dword ptr [dword280]
        movss   dword ptr [ebp-28],float19
        mov     dword283,[ebp+12]
        mov     dword286,[ebp+8]
        mov     dword288,[dword283+4]
        sub     dword288,[dword286+4]
        cvtsi2ss        float22,dword288
        mov     dword290,8
        add     dword290,[ebp+16]
        mov     dword293,8
        add     dword293,[ebp+8]
        movss   float23,dword ptr [dword290+4]
        subss   float23,dword ptr [dword293+4]
        mulss   float22,float23
        mov     dword296,[ebp+16]
        mov     dword299,[ebp+8]
        mov     dword301,[dword296+4]
        sub     dword301,[dword299+4]
        cvtsi2ss        float24,dword301
        divss   float22,float24
        mov     dword303,8
        add     dword303,[ebp+8]
        addss   float22,dword ptr [dword303+4]
        movss   dword ptr [ebp-32],float22
        mov     dword307,8
        add     dword307,[ebp+12]
        movss   float25,dword ptr [ebp-28]
        subss   float25,dword ptr [dword307]
        mov     dword310,[ebp+12]
        mov     dword312,[ebp-12]
        sub     dword312,[dword310]
        cvtsi2ss        float26,dword312
        divss   float25,float26
        movss   dword ptr [ebp-36],float25
        mov     dword315,8
        add     dword315,[ebp+12]
        movss   float27,dword ptr [ebp-32]
        subss   float27,dword ptr [dword315+4]
        mov     dword319,[ebp+12]
        mov     dword321,[ebp-12]
        sub     dword321,[dword319]
        cvtsi2ss        float28,dword321
        divss   float27,float28
        movss   dword ptr [ebp-40],float27
        push_all
        push_arg        dword ptr [ebp-40],4
        push_arg        dword ptr [ebp-36],4
        mov     dword326,8
        add     dword326,[ebp+12]
        push_arg        dword ptr [dword326+4],4
        mov     dword329,8
        add     dword329,[ebp+12]
        push_arg        dword ptr [dword329],4
        push_arg        dword ptr [ebp-32],4
        push_arg        dword ptr [ebp-28],4
        mov     dword333,[ebp+12]
        push_arg        dword ptr [dword333+4],4
        mov     dword336,[ebp+12]
        push_arg        dword ptr [dword336],4
        push_arg        dword ptr [ebp-12],4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        mov     dword339,[ebp+12]
        mov     dword341,1
        add     dword341,[dword339+4]
        mov     [ebp-16],dword341
label0009:
        mov     dword344,[ebp+16]
        mov     dword347,[dword344+4]
        cmp     dword347,[ebp-16]
        jle     label000a
        mov     dword349,[ebp+12]
        mov     dword352,[ebp-16]
        sub     dword352,[dword349+4]
        mov     dword354,[ebp+16]
        mov     dword356,[ebp+12]
        mov     dword357,[dword354]
        sub     dword357,[dword356]
        imul    dword352,dword357
        mov     dword359,[ebp+16]
        mov     dword362,[ebp+12]
        mov     dword364,[dword359+4]
        sub     dword364,[dword362+4]
        cdq     dword365,dword352
        idiv    dword352,dword364,dword365
        mov     dword367,[ebp+12]
        add     dword352,[dword367]
        mov     [ebp-8],dword352
        mov     dword370,[ebp+8]
        mov     dword373,[ebp-16]
        sub     dword373,[dword370+4]
        mov     dword375,[ebp+16]
        mov     dword377,[ebp+8]
        mov     dword378,[dword375]
        sub     dword378,[dword377]
        imul    dword373,dword378
        mov     dword380,[ebp+16]
        mov     dword383,[ebp+8]
        mov     dword385,[dword380+4]
        sub     dword385,[dword383+4]
        cdq     dword386,dword373
        idiv    dword373,dword385,dword386
        mov     dword388,[ebp+8]
        add     dword373,[dword388]
        mov     [ebp-12],dword373
        mov     dword391,[ebp+12]
        mov     dword394,[ebp-16]
        sub     dword394,[dword391+4]
        cvtsi2ss        float29,dword394
        mov     dword396,8
        add     dword396,[ebp+16]
        mov     dword398,8
        add     dword398,[ebp+12]
        movss   float30,dword ptr [dword396]
        subss   float30,dword ptr [dword398]
        mulss   float29,float30
        mov     dword400,[ebp+16]
        mov     dword403,[ebp+12]
        mov     dword405,[dword400+4]
        sub     dword405,[dword403+4]
        cvtsi2ss        float31,dword405
        divss   float29,float31
        mov     dword407,8
        add     dword407,[ebp+12]
        addss   float29,dword ptr [dword407]
        movss   dword ptr [ebp-20],float29
        mov     dword410,[ebp+8]
        mov     dword413,[ebp-16]
        sub     dword413,[dword410+4]
        cvtsi2ss        float32,dword413
        mov     dword415,8
        add     dword415,[ebp+16]
        mov     dword417,8
        add     dword417,[ebp+8]
        movss   float33,dword ptr [dword415]
        subss   float33,dword ptr [dword417]
        mulss   float32,float33
        mov     dword419,[ebp+16]
        mov     dword422,[ebp+8]
        mov     dword424,[dword419+4]
        sub     dword424,[dword422+4]
        cvtsi2ss        float34,dword424
        divss   float32,float34
        mov     dword426,8
        add     dword426,[ebp+8]
        addss   float32,dword ptr [dword426]
        movss   dword ptr [ebp-28],float32
        mov     dword429,[ebp+12]
        mov     dword432,[ebp-16]
        sub     dword432,[dword429+4]
        cvtsi2ss        float35,dword432
        mov     dword434,8
        add     dword434,[ebp+16]
        mov     dword437,8
        add     dword437,[ebp+12]
        movss   float36,dword ptr [dword434+4]
        subss   float36,dword ptr [dword437+4]
        mulss   float35,float36
        mov     dword440,[ebp+16]
        mov     dword443,[ebp+12]
        mov     dword445,[dword440+4]
        sub     dword445,[dword443+4]
        cvtsi2ss        float37,dword445
        divss   float35,float37
        mov     dword447,8
        add     dword447,[ebp+12]
        addss   float35,dword ptr [dword447+4]
        movss   dword ptr [ebp-24],float35
        mov     dword451,[ebp+8]
        mov     dword454,[ebp-16]
        sub     dword454,[dword451+4]
        cvtsi2ss        float38,dword454
        mov     dword456,8
        add     dword456,[ebp+16]
        mov     dword459,8
        add     dword459,[ebp+8]
        movss   float39,dword ptr [dword456+4]
        subss   float39,dword ptr [dword459+4]
        mulss   float38,float39
        mov     dword462,[ebp+16]
        mov     dword465,[ebp+8]
        mov     dword467,[dword462+4]
        sub     dword467,[dword465+4]
        cvtsi2ss        float40,dword467
        divss   float38,float40
        mov     dword469,8
        add     dword469,[ebp+8]
        addss   float38,dword ptr [dword469+4]
        movss   dword ptr [ebp-32],float38
        mov     dword474,[ebp-12]
        sub     dword474,[ebp-8]
        cvtsi2ss        float41,dword474
        movss   float42,dword ptr [ebp-28]
        subss   float42,dword ptr [ebp-20]
        divss   float42,float41
        movss   dword ptr [ebp-36],float42
        mov     dword480,[ebp-12]
        sub     dword480,[ebp-8]
        cvtsi2ss        float43,dword480
        movss   float44,dword ptr [ebp-32]
        subss   float44,dword ptr [ebp-24]
        divss   float44,float43
        movss   dword ptr [ebp-40],float44
        push_all
        push_arg        dword ptr [ebp-40],4
        push_arg        dword ptr [ebp-36],4
        push_arg        dword ptr [ebp-32],4
        push_arg        dword ptr [ebp-28],4
        push_arg        dword ptr [ebp-24],4
        push_arg        dword ptr [ebp-20],4
        push_arg        dword ptr [ebp-16],4
        push_arg        dword ptr [ebp-12],4
        push_arg        dword ptr [ebp-8],4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        inc     dword ptr [ebp-16]
        jmp     label0009
label000a:
        destroy_stack_frame
        ret
__rasterize_triangle_2i endp

__clip_on_plain proc
        create_stack_frame
        mov     dword2,192
        add     dword2,[ebp+8]
        mov     dword ptr [dword2],0
        mov     dword5,[ebp+12]
        mov     [ebp-4],dword5
        mov     dword8,[ebp+12]
        add     dword8,24
        mov     [ebp-8],dword8
label0001:
        mov     dword12,192
        add     dword12,[ebp+12]
        mov     dword14,[dword12]
        imul    dword14,24
        mov     dword16,[ebp+12]
        add     dword16,dword14
        cmp     dword16,[ebp-8]
        jle     label0002
        push_all
        push_arg        dword ptr [ebp+16],4
        mov     dword20,[ebp-4]
        push_arg        dword20,4
        lea     dword21,[ebp-24]
        push_arg        dword21,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword ptr [ebp+20],4
        lea     dword23,[ebp-24]
        push_arg        dword23,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float1
        movss   dword ptr [ebp-52],float1
        push_all
        push_arg        dword ptr [ebp+16],4
        mov     dword27,[ebp-8]
        push_arg        dword27,4
        lea     dword28,[ebp-24]
        push_arg        dword28,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword ptr [ebp+20],4
        lea     dword30,[ebp-24]
        push_arg        dword30,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float2
        movss   dword ptr [ebp-56],float2
        movss   float3,dword ptr [___unnamed_float_2]
        comiss  float3,dword ptr [ebp-52]
        ja      label0003
        mov     dword35,192
        add     dword35,[ebp+8]
        mov     dword36,[dword35]
        inc     dword ptr [dword35]
        imul    dword36,24
        mov     dword39,[ebp+8]
        mov     dword41,[ebp-4]
        movq    double4,qword ptr [dword41]
        movq    qword ptr [dword39+dword36],double4
        movq    double4,qword ptr [dword41+8]
        movq    qword ptr [dword39+dword36+8],double4
        movq    double4,qword ptr [dword41+16]
        movq    qword ptr [dword39+dword36+16],double4
label0003:
        movss   float5,dword ptr [___unnamed_float_2]
        comiss  float5,dword ptr [ebp-52]
        jae     label0006
        movss   float6,dword ptr [___unnamed_float_2]
        comiss  float6,dword ptr [ebp-56]
        ja      label0005
label0006:
        movss   float7,dword ptr [___unnamed_float_2]
        comiss  float7,dword ptr [ebp-56]
        ja      label0004
        movss   float8,dword ptr [___unnamed_float_2]
        comiss  float8,dword ptr [ebp-52]
        jbe     label0004
label0005:
        push_all
        mov     dword51,[ebp-4]
        push_arg        dword51,4
        push_arg        dword ptr [ebp+16],4
        lea     dword53,[ebp-24]
        push_arg        dword53,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        mov     dword55,[ebp-4]
        push_arg        dword55,4
        mov     dword57,[ebp-8]
        push_arg        dword57,4
        lea     dword58,[ebp-40]
        push_arg        dword58,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword ptr [ebp+20],4
        lea     dword60,[ebp-24]
        push_arg        dword60,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float9
        push_all
        push_arg        dword ptr [ebp+20],4
        lea     dword62,[ebp-40]
        push_arg        dword62,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float10
        divss   float9,float10
        movss   dword ptr [ebp-60],float9
        push_all
        push_arg        dword ptr [ebp-60],4
        lea     dword65,[ebp-40]
        push_arg        dword65,4
        call    _vec4f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword66,[ebp-40]
        push_arg        dword66,4
        mov     dword68,[ebp-4]
        push_arg        dword68,4
        mov     dword70,192
        add     dword70,[ebp+8]
        mov     dword72,[dword70]
        imul    dword72,24
        mov     dword74,[ebp+8]
        add     dword74,dword72
        push_arg        dword74,4
        call    _vec4f_add
        restore_stack   12
        pop_all
        push_all
        mov     dword76,16
        add     dword76,[ebp-4]
        push_arg        dword76,4
        mov     dword78,16
        add     dword78,[ebp-8]
        push_arg        dword78,4
        lea     dword79,[ebp-48]
        push_arg        dword79,4
        call    _vec2f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword ptr [ebp-60],4
        lea     dword81,[ebp-48]
        push_arg        dword81,4
        call    _vec2f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword82,[ebp-48]
        push_arg        dword82,4
        mov     dword84,16
        add     dword84,[ebp-4]
        push_arg        dword84,4
        mov     dword86,192
        add     dword86,[ebp+8]
        mov     dword88,[dword86]
        imul    dword88,24
        mov     dword90,[ebp+8]
        add     dword90,dword88
        add     dword90,16
        push_arg        dword90,4
        call    _vec2f_add
        restore_stack   12
        pop_all
        mov     dword93,192
        add     dword93,[ebp+8]
        inc     dword ptr [dword93]
label0004:
        add     dword ptr [ebp-4],24
        add     dword ptr [ebp-8],24
        jmp     label0001
label0002:
        mov     dword97,192
        add     dword97,[ebp+8]
        mov     dword98,[dword97]
        inc     dword ptr [dword97]
        imul    dword98,24
        mov     dword101,[ebp+8]
        mov     dword103,[ebp+8]
        movq    double11,qword ptr [dword103]
        movq    qword ptr [dword101+dword98],double11
        movq    double11,qword ptr [dword103+8]
        movq    qword ptr [dword101+dword98+8],double11
        movq    double11,qword ptr [dword103+16]
        movq    qword ptr [dword101+dword98+16],double11
        destroy_stack_frame
        ret
__clip_on_plain endp

__clip_poligon proc
        create_stack_frame
        push_all
        push_arg        (offset __clip_z_far_norm),4
        push_arg        (offset __clip_z_far_base),4
        push_arg        dword ptr [ebp+8],4
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
        push_arg        dword ptr [ebp+8],4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_left_norm),4
        push_arg        (offset __clip_plane_left_base),4
        push_arg        dword ptr [ebp+8],4
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
        push_arg        dword ptr [ebp+8],4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        push_arg        (offset __clip_plane_top_norm),4
        push_arg        (offset __clip_plane_top_base),4
        push_arg        dword ptr [ebp+8],4
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
        push_arg        dword ptr [ebp+8],4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        mov     dword26,192
        add     dword26,[ebp+8]
        cmp     dword ptr [dword26],1
        setg    byte1
        movzx   dword28,byte1
        set_retval      dword28
        destroy_stack_frame
        ret
__clip_poligon endp

__transform_to_screen_space proc
        create_stack_frame
        push_all
        push_arg        (offset __viewport_matrix),4
        push_arg        dword ptr [ebp+12],4
        lea     dword3,[ebp-16]
        push_arg        dword3,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        movss   float1,dword ptr [___unnamed_float_1]
        divss   float1,dword ptr [ebp-4]
        movss   dword ptr [ebp-20],float1
        movss   float2,dword ptr [ebp-16]
        mulss   float2,dword ptr [ebp-20]
        cvttss2si       dword10,float2
        mov     dword12,[ebp+8]
        mov     [dword12],dword10
        movss   float3,dword ptr [ebp-12]
        mulss   float3,dword ptr [ebp-20]
        cvttss2si       dword16,float3
        mov     dword18,4
        add     dword18,[ebp+8]
        mov     [dword18],dword16
        mov     dword20,[ebp+8]
        cmp     dword ptr [dword20],0
        jl      label0001
        mov     dword23,[ebp+8]
        mov     dword25,[dword23]
        cmp     dword25,dword ptr [__width]
        jge     label0001
        mov     dword27,4
        add     dword27,[ebp+8]
        cmp     dword ptr [dword27],0
        jl      label0001
        mov     dword30,4
        add     dword30,[ebp+8]
        mov     dword32,[dword30]
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
        push_all
        push_arg        dword ptr [ebp+8],4
        call    __clip_poligon
        restore_stack   4
        pop_all
        read_retval     dword2
        cmp     dword2,0
        jne     label0000
        destroy_stack_frame
        ret
label0000:
        mov     dword4,192
        add     dword4,[ebp+8]
        cmp     dword ptr [dword4],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword ptr [ebp-136],0
label0003:
        mov     dword11,192
        add     dword11,[ebp+8]
        mov     dword13,[dword11]
        cmp     dword13,[ebp-136]
        jle     label0004
        push_all
        mov     dword15,[ebp+8]
        mov     dword18,[ebp-136]
        imul    dword18,24
        add     dword15,dword18
        push_arg        dword15,4
        lea     dword19,[ebp-132]
        mov     dword22,[ebp-136]
        sal     dword22,4
        add     dword19,dword22
        push_arg        dword19,4
        call    __transform_to_screen_space
        restore_stack   8
        pop_all
        lea     dword23,[ebp-132]
        mov     dword26,[ebp-136]
        sal     dword26,4
        mov     dword29,[ebp+8]
        mov     dword32,[ebp-136]
        imul    dword32,24
        movq    double1,qword ptr [dword29+dword32+16]
        movq    qword ptr [dword23+dword26+8],double1
        inc     dword ptr [ebp-136]
        jmp     label0003
label0004:
        mov     dword ptr [ebp-136],2
label0006:
        mov     dword38,192
        add     dword38,[ebp+8]
        mov     dword40,[dword38]
        dec     dword40
        cmp     dword40,[ebp-136]
        jle     label0007
        push_all
        lea     dword42,[ebp-132]
        mov     dword45,[ebp-136]
        sal     dword45,4
        add     dword42,dword45
        push_arg        dword42,4
        mov     dword48,[ebp-136]
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
        inc     dword ptr [ebp-136]
        jmp     label0006
label0007:
        destroy_stack_frame
        ret
__rasterize_polygon_4f endp

__transform_to_projection_space proc
        create_stack_frame
        push_all
        movss   float1,dword ptr [___unnamed_float_1]
        push_arg        float1,4
        mov     dword3,8
        add     dword3,[ebp+12]
        push_arg        dword ptr [dword3],4
        mov     dword5,4
        add     dword5,[ebp+12]
        push_arg        dword ptr [dword5],4
        mov     dword7,[ebp+12]
        push_arg        dword ptr [dword7],4
        lea     dword8,[ebp-16]
        push_arg        dword8,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        push_arg        (offset __mvproj_matrix),4
        lea     dword10,[ebp-16]
        push_arg        dword10,4
        push_arg        dword ptr [ebp+8],4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        destroy_stack_frame
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        create_stack_frame
        push_all
        push_arg        dword ptr [ebp+8],4
        lea     dword2,[ebp-196]
        push_arg        dword2,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        mov     dword6,[ebp+20]
        movq    double1,qword ptr [dword6]
        movq    qword ptr [ebp-180],double1
        push_all
        push_arg        dword ptr [ebp+12],4
        lea     dword8,[ebp-196]
        add     dword8,24
        push_arg        dword8,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        mov     dword14,[ebp+24]
        movq    double2,qword ptr [dword14]
        movq    qword ptr [ebp-156],double2
        push_all
        push_arg        dword ptr [ebp+16],4
        lea     dword16,[ebp-196]
        add     dword16,48
        push_arg        dword16,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        mov     dword22,[ebp+28]
        movq    double3,qword ptr [dword22]
        movq    qword ptr [ebp-132],double3
        movq    double4,qword ptr [ebp-196]
        movq    qword ptr [ebp-124],double4
        movq    double4,qword ptr [ebp-188]
        movq    qword ptr [ebp-116],double4
        movq    double4,qword ptr [ebp-180]
        movq    qword ptr [ebp-108],double4
        mov     dword ptr [ebp-4],4
        push_all
        lea     dword29,[ebp-196]
        push_arg        dword29,4
        call    __rasterize_polygon_4f
        restore_stack   4
        pop_all
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp

end
