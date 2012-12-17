
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
        lea     dword1,[ebp+12]
        mov     dword2,[dword1]
        lea     dword3,[ebp+16]
        mov     dword4,[dword3]
        movss   float1,dword ptr [dword2]
        addss   float1,dword ptr [dword4]
        lea     dword5,[ebp+8]
        mov     dword6,[dword5]
        movss   dword ptr [dword6],float1
        lea     dword7,[ebp+12]
        mov     dword8,4
        add     dword8,[dword7]
        lea     dword9,[ebp+16]
        mov     dword10,4
        add     dword10,[dword9]
        movss   float2,dword ptr [dword8]
        addss   float2,dword ptr [dword10]
        lea     dword11,[ebp+8]
        mov     dword12,4
        add     dword12,[dword11]
        movss   dword ptr [dword12],float2
        destroy_stack_frame
        ret
_vec2f_add endp

_vec2f_subtract proc
        create_stack_frame
        lea     dword1,[ebp+12]
        mov     dword2,[dword1]
        lea     dword3,[ebp+16]
        mov     dword4,[dword3]
        movss   float1,dword ptr [dword2]
        subss   float1,dword ptr [dword4]
        lea     dword5,[ebp+8]
        mov     dword6,[dword5]
        movss   dword ptr [dword6],float1
        lea     dword7,[ebp+12]
        mov     dword8,4
        add     dword8,[dword7]
        lea     dword9,[ebp+16]
        mov     dword10,4
        add     dword10,[dword9]
        movss   float2,dword ptr [dword8]
        subss   float2,dword ptr [dword10]
        lea     dword11,[ebp+8]
        mov     dword12,4
        add     dword12,[dword11]
        movss   dword ptr [dword12],float2
        destroy_stack_frame
        ret
_vec2f_subtract endp

_vec2f_mul proc
        create_stack_frame
        lea     dword1,[ebp+8]
        mov     dword2,[dword1]
        lea     dword3,[ebp+12]
        movss   float1,dword ptr [dword2]
        mulss   float1,dword ptr [dword3]
        movss   dword ptr [dword2],float1
        lea     dword4,[ebp+8]
        mov     dword5,4
        add     dword5,[dword4]
        lea     dword6,[ebp+12]
        movss   float2,dword ptr [dword5]
        mulss   float2,dword ptr [dword6]
        movss   dword ptr [dword5],float2
        destroy_stack_frame
        ret
_vec2f_mul endp

_vec4f_assign proc
        create_stack_frame
        lea     dword1,[ebp+8]
        mov     dword2,[dword1]
        lea     dword3,[ebp+12]
        movss   float1,dword ptr [dword3]
        movss   dword ptr [dword2],float1
        lea     dword4,[ebp+8]
        mov     dword5,4
        add     dword5,[dword4]
        lea     dword6,[ebp+16]
        movss   float2,dword ptr [dword6]
        movss   dword ptr [dword5],float2
        lea     dword7,[ebp+8]
        mov     dword8,8
        add     dword8,[dword7]
        lea     dword9,[ebp+20]
        movss   float3,dword ptr [dword9]
        movss   dword ptr [dword8],float3
        lea     dword10,[ebp+8]
        mov     dword11,12
        add     dword11,[dword10]
        lea     dword12,[ebp+24]
        movss   float4,dword ptr [dword12]
        movss   dword ptr [dword11],float4
        destroy_stack_frame
        ret
_vec4f_assign endp

_vec4f_add proc
        create_stack_frame
        lea     dword1,[ebp+12]
        mov     dword2,[dword1]
        lea     dword3,[ebp+16]
        mov     dword4,[dword3]
        movss   float1,dword ptr [dword2]
        addss   float1,dword ptr [dword4]
        lea     dword5,[ebp+8]
        mov     dword6,[dword5]
        movss   dword ptr [dword6],float1
        lea     dword7,[ebp+12]
        mov     dword8,4
        add     dword8,[dword7]
        lea     dword9,[ebp+16]
        mov     dword10,4
        add     dword10,[dword9]
        movss   float2,dword ptr [dword8]
        addss   float2,dword ptr [dword10]
        lea     dword11,[ebp+8]
        mov     dword12,4
        add     dword12,[dword11]
        movss   dword ptr [dword12],float2
        lea     dword13,[ebp+12]
        mov     dword14,8
        add     dword14,[dword13]
        lea     dword15,[ebp+16]
        mov     dword16,8
        add     dword16,[dword15]
        movss   float3,dword ptr [dword14]
        addss   float3,dword ptr [dword16]
        lea     dword17,[ebp+8]
        mov     dword18,8
        add     dword18,[dword17]
        movss   dword ptr [dword18],float3
        lea     dword19,[ebp+12]
        mov     dword20,12
        add     dword20,[dword19]
        lea     dword21,[ebp+16]
        mov     dword22,12
        add     dword22,[dword21]
        movss   float4,dword ptr [dword20]
        addss   float4,dword ptr [dword22]
        lea     dword23,[ebp+8]
        mov     dword24,12
        add     dword24,[dword23]
        movss   dword ptr [dword24],float4
        destroy_stack_frame
        ret
_vec4f_add endp

_vec4f_subtract proc
        create_stack_frame
        lea     dword1,[ebp+12]
        mov     dword2,[dword1]
        lea     dword3,[ebp+16]
        mov     dword4,[dword3]
        movss   float1,dword ptr [dword2]
        subss   float1,dword ptr [dword4]
        lea     dword5,[ebp+8]
        mov     dword6,[dword5]
        movss   dword ptr [dword6],float1
        lea     dword7,[ebp+12]
        mov     dword8,4
        add     dword8,[dword7]
        lea     dword9,[ebp+16]
        mov     dword10,4
        add     dword10,[dword9]
        movss   float2,dword ptr [dword8]
        subss   float2,dword ptr [dword10]
        lea     dword11,[ebp+8]
        mov     dword12,4
        add     dword12,[dword11]
        movss   dword ptr [dword12],float2
        lea     dword13,[ebp+12]
        mov     dword14,8
        add     dword14,[dword13]
        lea     dword15,[ebp+16]
        mov     dword16,8
        add     dword16,[dword15]
        movss   float3,dword ptr [dword14]
        subss   float3,dword ptr [dword16]
        lea     dword17,[ebp+8]
        mov     dword18,8
        add     dword18,[dword17]
        movss   dword ptr [dword18],float3
        lea     dword19,[ebp+12]
        mov     dword20,12
        add     dword20,[dword19]
        lea     dword21,[ebp+16]
        mov     dword22,12
        add     dword22,[dword21]
        movss   float4,dword ptr [dword20]
        subss   float4,dword ptr [dword22]
        lea     dword23,[ebp+8]
        mov     dword24,12
        add     dword24,[dword23]
        movss   dword ptr [dword24],float4
        destroy_stack_frame
        ret
_vec4f_subtract endp

_vec4f_dot proc
        create_stack_frame
        lea     dword1,[ebp+8]
        mov     dword2,4
        add     dword2,[dword1]
        lea     dword3,[ebp+12]
        mov     dword4,4
        add     dword4,[dword3]
        movss   float1,dword ptr [dword2]
        mulss   float1,dword ptr [dword4]
        lea     dword5,[ebp+8]
        mov     dword6,[dword5]
        lea     dword7,[ebp+12]
        mov     dword8,[dword7]
        movss   float2,dword ptr [dword6]
        mulss   float2,dword ptr [dword8]
        addss   float2,float1
        lea     dword9,[ebp+8]
        mov     dword10,8
        add     dword10,[dword9]
        lea     dword11,[ebp+12]
        mov     dword12,8
        add     dword12,[dword11]
        movss   float3,dword ptr [dword10]
        mulss   float3,dword ptr [dword12]
        addss   float2,float3
        lea     dword13,[ebp+8]
        mov     dword14,12
        add     dword14,[dword13]
        lea     dword15,[ebp+12]
        mov     dword16,12
        add     dword16,[dword15]
        movss   float4,dword ptr [dword14]
        mulss   float4,dword ptr [dword16]
        addss   float2,float4
        set_retval      float2
        destroy_stack_frame
        ret
_vec4f_dot endp

_vec4f_mul proc
        create_stack_frame
        lea     dword1,[ebp+8]
        mov     dword2,[dword1]
        lea     dword3,[ebp+12]
        movss   float1,dword ptr [dword2]
        mulss   float1,dword ptr [dword3]
        movss   dword ptr [dword2],float1
        lea     dword4,[ebp+8]
        mov     dword5,4
        add     dword5,[dword4]
        lea     dword6,[ebp+12]
        movss   float2,dword ptr [dword5]
        mulss   float2,dword ptr [dword6]
        movss   dword ptr [dword5],float2
        lea     dword7,[ebp+8]
        mov     dword8,8
        add     dword8,[dword7]
        lea     dword9,[ebp+12]
        movss   float3,dword ptr [dword8]
        mulss   float3,dword ptr [dword9]
        movss   dword ptr [dword8],float3
        lea     dword10,[ebp+8]
        mov     dword11,12
        add     dword11,[dword10]
        lea     dword12,[ebp+12]
        movss   float4,dword ptr [dword11]
        mulss   float4,dword ptr [dword12]
        movss   dword ptr [dword11],float4
        destroy_stack_frame
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        create_stack_frame
        lea     dword1,[ebp+20]
        lea     dword2,[ebp+12]
        movss   float1,dword ptr [dword1]
        mulss   float1,dword ptr [dword2]
        lea     dword3,[ebp-4]
        movss   dword ptr [dword3],float1
        lea     dword4,[ebp-4]
        lea     dword5,[ebp+24]
        movss   float2,dword ptr [dword4]
        mulss   float2,dword ptr [dword5]
        lea     dword6,[ebp-8]
        movss   dword ptr [dword6],float2
        lea     dword7,[ebp+8]
        mov     dword8,[dword7]
        lea     dword9,[ebp+12]
        lea     dword10,[ebp-8]
        movss   float3,dword ptr [dword9]
        divss   float3,dword ptr [dword10]
        movss   dword ptr [dword8],float3
        lea     dword11,[ebp+8]
        mov     dword12,4
        add     dword12,[dword11]
        lea     dword13,dword ptr [___unnamed_float_2]
        movss   float4,dword ptr [dword13]
        movss   dword ptr [dword12],float4
        lea     dword14,[ebp+8]
        mov     dword15,8
        add     dword15,[dword14]
        lea     dword16,dword ptr [___unnamed_float_2]
        movss   float5,dword ptr [dword16]
        movss   dword ptr [dword15],float5
        lea     dword17,[ebp+8]
        mov     dword18,12
        add     dword18,[dword17]
        lea     dword19,dword ptr [___unnamed_float_2]
        movss   float6,dword ptr [dword19]
        movss   dword ptr [dword18],float6
        lea     dword20,[ebp+8]
        mov     dword21,16
        add     dword21,[dword20]
        lea     dword22,dword ptr [___unnamed_float_2]
        movss   float7,dword ptr [dword22]
        movss   dword ptr [dword21],float7
        lea     dword23,[ebp+8]
        mov     dword24,20
        add     dword24,[dword23]
        lea     dword25,[ebp+12]
        lea     dword26,[ebp-4]
        movss   float8,dword ptr [dword25]
        divss   float8,dword ptr [dword26]
        movss   dword ptr [dword24],float8
        lea     dword27,[ebp+8]
        mov     dword28,24
        add     dword28,[dword27]
        lea     dword29,dword ptr [___unnamed_float_2]
        movss   float9,dword ptr [dword29]
        movss   dword ptr [dword28],float9
        lea     dword30,[ebp+8]
        mov     dword31,28
        add     dword31,[dword30]
        lea     dword32,dword ptr [___unnamed_float_2]
        movss   float10,dword ptr [dword32]
        movss   dword ptr [dword31],float10
        lea     dword33,[ebp+8]
        mov     dword34,32
        add     dword34,[dword33]
        lea     dword35,dword ptr [___unnamed_float_2]
        movss   float11,dword ptr [dword35]
        movss   dword ptr [dword34],float11
        lea     dword36,[ebp+8]
        mov     dword37,36
        add     dword37,[dword36]
        lea     dword38,dword ptr [___unnamed_float_2]
        movss   float12,dword ptr [dword38]
        movss   dword ptr [dword37],float12
        lea     dword39,[ebp+8]
        mov     dword40,40
        add     dword40,[dword39]
        lea     dword41,[ebp+16]
        lea     dword42,[ebp+12]
        movss   float13,dword ptr [dword41]
        subss   float13,dword ptr [dword42]
        lea     dword43,[ebp+16]
        movss   float14,dword ptr [dword43]
        divss   float14,float13
        movss   dword ptr [dword40],float14
        lea     dword44,[ebp+8]
        mov     dword45,44
        add     dword45,[dword44]
        lea     dword46,dword ptr [___unnamed_float_1]
        movss   float15,dword ptr [dword46]
        movss   dword ptr [dword45],float15
        lea     dword47,[ebp+8]
        mov     dword48,48
        add     dword48,[dword47]
        lea     dword49,dword ptr [___unnamed_float_2]
        movss   float16,dword ptr [dword49]
        movss   dword ptr [dword48],float16
        lea     dword50,[ebp+8]
        mov     dword51,52
        add     dword51,[dword50]
        lea     dword52,dword ptr [___unnamed_float_2]
        movss   float17,dword ptr [dword52]
        movss   dword ptr [dword51],float17
        lea     dword53,[ebp+8]
        mov     dword54,56
        add     dword54,[dword53]
        lea     dword55,[ebp+12]
        lea     dword56,[ebp+16]
        movss   float18,dword ptr [dword55]
        mulss   float18,dword ptr [dword56]
        lea     dword57,[ebp+12]
        lea     dword58,[ebp+16]
        movss   float19,dword ptr [dword57]
        subss   float19,dword ptr [dword58]
        divss   float18,float19
        movss   dword ptr [dword54],float18
        lea     dword59,[ebp+8]
        mov     dword60,60
        add     dword60,[dword59]
        lea     dword61,dword ptr [___unnamed_float_2]
        movss   float20,dword ptr [dword61]
        movss   dword ptr [dword60],float20
        destroy_stack_frame
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        create_stack_frame
        lea     dword1,[ebp+8]
        mov     dword2,[dword1]
        lea     dword3,[ebp+12]
        lea     dword4,dword ptr [___unnamed_float_3]
        movss   float1,dword ptr [dword4]
        movss   float2,dword ptr [dword3]
        mulss   float2,float1
        movss   dword ptr [dword2],float2
        lea     dword5,[ebp+8]
        mov     dword6,4
        add     dword6,[dword5]
        lea     dword7,dword ptr [___unnamed_float_2]
        movss   float3,dword ptr [dword7]
        movss   dword ptr [dword6],float3
        lea     dword8,[ebp+8]
        mov     dword9,8
        add     dword9,[dword8]
        lea     dword10,dword ptr [___unnamed_float_2]
        movss   float4,dword ptr [dword10]
        movss   dword ptr [dword9],float4
        lea     dword11,[ebp+8]
        mov     dword12,12
        add     dword12,[dword11]
        lea     dword13,dword ptr [___unnamed_float_2]
        movss   float5,dword ptr [dword13]
        movss   dword ptr [dword12],float5
        lea     dword14,[ebp+8]
        mov     dword15,16
        add     dword15,[dword14]
        lea     dword16,dword ptr [___unnamed_float_2]
        movss   float6,dword ptr [dword16]
        movss   dword ptr [dword15],float6
        lea     dword17,[ebp+8]
        mov     dword18,20
        add     dword18,[dword17]
        lea     dword19,[ebp+16]
        movss   float7,dword ptr [dword19]
        xorps   float7,dword ptr [___unnamed_float4_4]
        lea     dword20,dword ptr [___unnamed_float_3]
        movss   float8,dword ptr [dword20]
        mulss   float7,float8
        movss   dword ptr [dword18],float7
        lea     dword21,[ebp+8]
        mov     dword22,24
        add     dword22,[dword21]
        lea     dword23,dword ptr [___unnamed_float_2]
        movss   float9,dword ptr [dword23]
        movss   dword ptr [dword22],float9
        lea     dword24,[ebp+8]
        mov     dword25,28
        add     dword25,[dword24]
        lea     dword26,dword ptr [___unnamed_float_2]
        movss   float10,dword ptr [dword26]
        movss   dword ptr [dword25],float10
        lea     dword27,[ebp+8]
        mov     dword28,32
        add     dword28,[dword27]
        lea     dword29,dword ptr [___unnamed_float_2]
        movss   float11,dword ptr [dword29]
        movss   dword ptr [dword28],float11
        lea     dword30,[ebp+8]
        mov     dword31,36
        add     dword31,[dword30]
        lea     dword32,dword ptr [___unnamed_float_2]
        movss   float12,dword ptr [dword32]
        movss   dword ptr [dword31],float12
        lea     dword33,[ebp+8]
        mov     dword34,40
        add     dword34,[dword33]
        lea     dword35,[ebp+24]
        lea     dword36,[ebp+20]
        movss   float13,dword ptr [dword35]
        subss   float13,dword ptr [dword36]
        movss   dword ptr [dword34],float13
        lea     dword37,[ebp+8]
        mov     dword38,44
        add     dword38,[dword37]
        lea     dword39,dword ptr [___unnamed_float_2]
        movss   float14,dword ptr [dword39]
        movss   dword ptr [dword38],float14
        lea     dword40,[ebp+8]
        mov     dword41,48
        add     dword41,[dword40]
        lea     dword42,[ebp+12]
        lea     dword43,dword ptr [___unnamed_float_3]
        movss   float15,dword ptr [dword43]
        movss   float16,dword ptr [dword42]
        mulss   float16,float15
        movss   dword ptr [dword41],float16
        lea     dword44,[ebp+8]
        mov     dword45,52
        add     dword45,[dword44]
        lea     dword46,[ebp+16]
        lea     dword47,dword ptr [___unnamed_float_3]
        movss   float17,dword ptr [dword47]
        movss   float18,dword ptr [dword46]
        mulss   float18,float17
        movss   dword ptr [dword45],float18
        lea     dword48,[ebp+8]
        mov     dword49,56
        add     dword49,[dword48]
        lea     dword50,[ebp+20]
        movss   float19,dword ptr [dword50]
        movss   dword ptr [dword49],float19
        lea     dword51,[ebp+8]
        mov     dword52,60
        add     dword52,[dword51]
        lea     dword53,dword ptr [___unnamed_float_1]
        movss   float20,dword ptr [dword53]
        movss   dword ptr [dword52],float20
        destroy_stack_frame
        ret
_matrix4f_make_viewport endp

_matrix4f_transform proc
        create_stack_frame
        lea     dword1,[ebp+12]
        mov     dword2,4
        add     dword2,[dword1]
        lea     dword3,[ebp+16]
        mov     dword4,16
        add     dword4,[dword3]
        movss   float1,dword ptr [dword2]
        mulss   float1,dword ptr [dword4]
        lea     dword5,[ebp+12]
        mov     dword6,[dword5]
        lea     dword7,[ebp+16]
        mov     dword8,[dword7]
        movss   float2,dword ptr [dword6]
        mulss   float2,dword ptr [dword8]
        addss   float2,float1
        lea     dword9,[ebp+12]
        mov     dword10,8
        add     dword10,[dword9]
        lea     dword11,[ebp+16]
        mov     dword12,32
        add     dword12,[dword11]
        movss   float3,dword ptr [dword10]
        mulss   float3,dword ptr [dword12]
        addss   float2,float3
        lea     dword13,[ebp+12]
        mov     dword14,12
        add     dword14,[dword13]
        lea     dword15,[ebp+16]
        mov     dword16,48
        add     dword16,[dword15]
        movss   float4,dword ptr [dword14]
        mulss   float4,dword ptr [dword16]
        addss   float2,float4
        lea     dword17,[ebp+8]
        mov     dword18,[dword17]
        movss   dword ptr [dword18],float2
        lea     dword19,[ebp+16]
        mov     dword20,4
        add     dword20,[dword19]
        lea     dword21,[ebp+12]
        mov     dword22,[dword21]
        movss   float5,dword ptr [dword22]
        mulss   float5,dword ptr [dword20]
        lea     dword23,[ebp+12]
        mov     dword24,4
        add     dword24,[dword23]
        lea     dword25,[ebp+16]
        mov     dword26,20
        add     dword26,[dword25]
        movss   float6,dword ptr [dword24]
        mulss   float6,dword ptr [dword26]
        addss   float5,float6
        lea     dword27,[ebp+12]
        mov     dword28,8
        add     dword28,[dword27]
        lea     dword29,[ebp+16]
        mov     dword30,36
        add     dword30,[dword29]
        movss   float7,dword ptr [dword28]
        mulss   float7,dword ptr [dword30]
        addss   float5,float7
        lea     dword31,[ebp+12]
        mov     dword32,12
        add     dword32,[dword31]
        lea     dword33,[ebp+16]
        mov     dword34,52
        add     dword34,[dword33]
        movss   float8,dword ptr [dword32]
        mulss   float8,dword ptr [dword34]
        addss   float5,float8
        lea     dword35,[ebp+8]
        mov     dword36,4
        add     dword36,[dword35]
        movss   dword ptr [dword36],float5
        lea     dword37,[ebp+16]
        mov     dword38,8
        add     dword38,[dword37]
        lea     dword39,[ebp+12]
        mov     dword40,[dword39]
        movss   float9,dword ptr [dword40]
        mulss   float9,dword ptr [dword38]
        lea     dword41,[ebp+12]
        mov     dword42,4
        add     dword42,[dword41]
        lea     dword43,[ebp+16]
        mov     dword44,24
        add     dword44,[dword43]
        movss   float10,dword ptr [dword42]
        mulss   float10,dword ptr [dword44]
        addss   float9,float10
        lea     dword45,[ebp+12]
        mov     dword46,8
        add     dword46,[dword45]
        lea     dword47,[ebp+16]
        mov     dword48,40
        add     dword48,[dword47]
        movss   float11,dword ptr [dword46]
        mulss   float11,dword ptr [dword48]
        addss   float9,float11
        lea     dword49,[ebp+12]
        mov     dword50,12
        add     dword50,[dword49]
        lea     dword51,[ebp+16]
        mov     dword52,56
        add     dword52,[dword51]
        movss   float12,dword ptr [dword50]
        mulss   float12,dword ptr [dword52]
        addss   float9,float12
        lea     dword53,[ebp+8]
        mov     dword54,8
        add     dword54,[dword53]
        movss   dword ptr [dword54],float9
        lea     dword55,[ebp+16]
        mov     dword56,12
        add     dword56,[dword55]
        lea     dword57,[ebp+12]
        mov     dword58,[dword57]
        movss   float13,dword ptr [dword58]
        mulss   float13,dword ptr [dword56]
        lea     dword59,[ebp+12]
        mov     dword60,4
        add     dword60,[dword59]
        lea     dword61,[ebp+16]
        mov     dword62,28
        add     dword62,[dword61]
        movss   float14,dword ptr [dword60]
        mulss   float14,dword ptr [dword62]
        addss   float13,float14
        lea     dword63,[ebp+12]
        mov     dword64,8
        add     dword64,[dword63]
        lea     dword65,[ebp+16]
        mov     dword66,44
        add     dword66,[dword65]
        movss   float15,dword ptr [dword64]
        mulss   float15,dword ptr [dword66]
        addss   float13,float15
        lea     dword67,[ebp+12]
        mov     dword68,12
        add     dword68,[dword67]
        lea     dword69,[ebp+16]
        mov     dword70,60
        add     dword70,[dword69]
        movss   float16,dword ptr [dword68]
        mulss   float16,dword ptr [dword70]
        addss   float13,float16
        lea     dword71,[ebp+8]
        mov     dword72,12
        add     dword72,[dword71]
        movss   dword ptr [dword72],float13
        destroy_stack_frame
        ret
_matrix4f_transform endp

_rasterizer_init proc
        create_stack_frame
        lea     dword1,dword ptr [__dbgprintf]
        lea     dword2,[ebp+8]
        mov     dword3,[dword2]
        mov     [dword1],dword3
        lea     dword4,dword ptr [__width]
        lea     dword5,[ebp+12]
        mov     dword6,[dword5]
        mov     [dword4],dword6
        lea     dword7,dword ptr [__height]
        lea     dword8,[ebp+16]
        mov     dword9,[dword8]
        mov     [dword7],dword9
        lea     dword10,dword ptr [__pitch]
        lea     dword11,[ebp+20]
        mov     dword12,[dword11]
        mov     [dword10],dword12
        push_all
        lea     dword13,[ebp+12]
        cvtsi2ss        float1,dword ptr [dword13]
        lea     dword14,[ebp+16]
        cvtsi2ss        float2,dword ptr [dword14]
        divss   float1,float2
        push_arg        float1,4
        lea     dword15,[ebp+32]
        push_arg        dword ptr [dword15],4
        lea     dword16,[ebp+28]
        push_arg        dword ptr [dword16],4
        lea     dword17,[ebp+24]
        push_arg        dword ptr [dword17],4
        lea     dword18,dword ptr [__mvproj_matrix]
        push_arg        dword18,4
        call    _matrix4f_make_perspective
        restore_stack   20
        pop_all
        push_all
        lea     dword19,[ebp+28]
        push_arg        dword ptr [dword19],4
        lea     dword20,[ebp+24]
        push_arg        dword ptr [dword20],4
        lea     dword21,[ebp+16]
        cvtsi2ss        float3,dword ptr [dword21]
        push_arg        float3,4
        lea     dword22,[ebp+12]
        cvtsi2ss        float4,dword ptr [dword22]
        push_arg        float4,4
        lea     dword23,dword ptr [__viewport_matrix]
        push_arg        dword23,4
        call    _matrix4f_make_viewport
        restore_stack   20
        pop_all
        push_all
        lea     dword24,dword ptr [___unnamed_float_1]
        movss   float5,dword ptr [dword24]
        push_arg        float5,4
        lea     dword25,[ebp+24]
        push_arg        dword ptr [dword25],4
        lea     dword26,dword ptr [___unnamed_float_2]
        movss   float6,dword ptr [dword26]
        push_arg        float6,4
        lea     dword27,dword ptr [___unnamed_float_2]
        movss   float7,dword ptr [dword27]
        push_arg        float7,4
        lea     dword28,dword ptr [__clip_z_near_base]
        push_arg        dword28,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        lea     dword29,[ebp+28]
        lea     dword30,[ebp+24]
        movss   float8,dword ptr [dword29]
        comiss  float8,dword ptr [dword30]
        jbe     label0000
        lea     dword31,[ebp-4]
        lea     dword32,dword ptr [___unnamed_float_1]
        movss   float9,dword ptr [dword32]
        movss   dword ptr [dword31],float9
        jmp     label0001
label0000:
        lea     dword33,[ebp-4]
        lea     dword34,dword ptr [___unnamed_float_5]
        movss   float10,dword ptr [dword34]
        movss   dword ptr [dword33],float10
label0001:
        push_all
        lea     dword35,dword ptr [___unnamed_float_1]
        movss   float11,dword ptr [dword35]
        push_arg        float11,4
        lea     dword36,[ebp-4]
        push_arg        dword ptr [dword36],4
        lea     dword37,dword ptr [___unnamed_float_2]
        movss   float12,dword ptr [dword37]
        push_arg        float12,4
        lea     dword38,dword ptr [___unnamed_float_2]
        movss   float13,dword ptr [dword38]
        push_arg        float13,4
        lea     dword39,dword ptr [__clip_z_near_norm]
        push_arg        dword39,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword40,dword ptr [___unnamed_float_1]
        movss   float14,dword ptr [dword40]
        push_arg        float14,4
        lea     dword41,[ebp+28]
        push_arg        dword ptr [dword41],4
        lea     dword42,dword ptr [___unnamed_float_2]
        movss   float15,dword ptr [dword42]
        push_arg        float15,4
        lea     dword43,dword ptr [___unnamed_float_2]
        movss   float16,dword ptr [dword43]
        push_arg        float16,4
        lea     dword44,dword ptr [__clip_z_far_base]
        push_arg        dword44,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        lea     dword45,[ebp+28]
        lea     dword46,[ebp+24]
        movss   float17,dword ptr [dword45]
        comiss  float17,dword ptr [dword46]
        jbe     label0002
        lea     dword47,[ebp-8]
        lea     dword48,dword ptr [___unnamed_float_5]
        movss   float18,dword ptr [dword48]
        movss   dword ptr [dword47],float18
        jmp     label0003
label0002:
        lea     dword49,[ebp-8]
        lea     dword50,dword ptr [___unnamed_float_1]
        movss   float19,dword ptr [dword50]
        movss   dword ptr [dword49],float19
label0003:
        push_all
        lea     dword51,dword ptr [___unnamed_float_1]
        movss   float20,dword ptr [dword51]
        push_arg        float20,4
        lea     dword52,[ebp-8]
        push_arg        dword ptr [dword52],4
        lea     dword53,dword ptr [___unnamed_float_2]
        movss   float21,dword ptr [dword53]
        push_arg        float21,4
        lea     dword54,dword ptr [___unnamed_float_2]
        movss   float22,dword ptr [dword54]
        push_arg        float22,4
        lea     dword55,dword ptr [__clip_z_far_norm]
        push_arg        dword55,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword56,dword ptr [___unnamed_float_1]
        movss   float23,dword ptr [dword56]
        push_arg        float23,4
        lea     dword57,dword ptr [___unnamed_float_2]
        movss   float24,dword ptr [dword57]
        push_arg        float24,4
        lea     dword58,dword ptr [___unnamed_float_2]
        movss   float25,dword ptr [dword58]
        push_arg        float25,4
        lea     dword59,[ebp+12]
        cvtsi2ss        float26,dword ptr [dword59]
        lea     dword60,dword ptr [___unnamed_float_1]
        movss   float27,dword ptr [dword60]
        divss   float27,float26
        lea     dword61,dword ptr [___unnamed_float_5]
        movss   float28,dword ptr [dword61]
        addss   float28,float27
        push_arg        float28,4
        lea     dword62,dword ptr [__clip_plane_left_base]
        push_arg        dword62,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword63,dword ptr [___unnamed_float_1]
        movss   float29,dword ptr [dword63]
        push_arg        float29,4
        lea     dword64,dword ptr [___unnamed_float_2]
        movss   float30,dword ptr [dword64]
        push_arg        float30,4
        lea     dword65,dword ptr [___unnamed_float_2]
        movss   float31,dword ptr [dword65]
        push_arg        float31,4
        lea     dword66,dword ptr [___unnamed_float_1]
        movss   float32,dword ptr [dword66]
        push_arg        float32,4
        lea     dword67,dword ptr [__clip_plane_left_norm]
        push_arg        dword67,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword68,dword ptr [___unnamed_float_1]
        movss   float33,dword ptr [dword68]
        push_arg        float33,4
        lea     dword69,dword ptr [___unnamed_float_2]
        movss   float34,dword ptr [dword69]
        push_arg        float34,4
        lea     dword70,dword ptr [___unnamed_float_2]
        movss   float35,dword ptr [dword70]
        push_arg        float35,4
        lea     dword71,[ebp+12]
        cvtsi2ss        float36,dword ptr [dword71]
        lea     dword72,dword ptr [___unnamed_float_1]
        movss   float37,dword ptr [dword72]
        divss   float37,float36
        lea     dword73,dword ptr [___unnamed_float_1]
        movss   float38,dword ptr [dword73]
        subss   float38,float37
        push_arg        float38,4
        lea     dword74,dword ptr [__clip_plane_right_base]
        push_arg        dword74,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword75,dword ptr [___unnamed_float_1]
        movss   float39,dword ptr [dword75]
        push_arg        float39,4
        lea     dword76,dword ptr [___unnamed_float_2]
        movss   float40,dword ptr [dword76]
        push_arg        float40,4
        lea     dword77,dword ptr [___unnamed_float_2]
        movss   float41,dword ptr [dword77]
        push_arg        float41,4
        lea     dword78,dword ptr [___unnamed_float_5]
        movss   float42,dword ptr [dword78]
        push_arg        float42,4
        lea     dword79,dword ptr [__clip_plane_right_norm]
        push_arg        dword79,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword80,dword ptr [___unnamed_float_1]
        movss   float43,dword ptr [dword80]
        push_arg        float43,4
        lea     dword81,dword ptr [___unnamed_float_2]
        movss   float44,dword ptr [dword81]
        push_arg        float44,4
        lea     dword82,[ebp+16]
        cvtsi2ss        float45,dword ptr [dword82]
        lea     dword83,dword ptr [___unnamed_float_1]
        movss   float46,dword ptr [dword83]
        divss   float46,float45
        lea     dword84,dword ptr [___unnamed_float_5]
        movss   float47,dword ptr [dword84]
        addss   float47,float46
        push_arg        float47,4
        lea     dword85,dword ptr [___unnamed_float_2]
        movss   float48,dword ptr [dword85]
        push_arg        float48,4
        lea     dword86,dword ptr [__clip_plane_top_base]
        push_arg        dword86,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword87,dword ptr [___unnamed_float_1]
        movss   float49,dword ptr [dword87]
        push_arg        float49,4
        lea     dword88,dword ptr [___unnamed_float_2]
        movss   float50,dword ptr [dword88]
        push_arg        float50,4
        lea     dword89,dword ptr [___unnamed_float_1]
        movss   float51,dword ptr [dword89]
        push_arg        float51,4
        lea     dword90,dword ptr [___unnamed_float_2]
        movss   float52,dword ptr [dword90]
        push_arg        float52,4
        lea     dword91,dword ptr [__clip_plane_top_norm]
        push_arg        dword91,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword92,dword ptr [___unnamed_float_1]
        movss   float53,dword ptr [dword92]
        push_arg        float53,4
        lea     dword93,dword ptr [___unnamed_float_2]
        movss   float54,dword ptr [dword93]
        push_arg        float54,4
        lea     dword94,dword ptr [___unnamed_float_1]
        movss   float55,dword ptr [dword94]
        push_arg        float55,4
        lea     dword95,dword ptr [___unnamed_float_2]
        movss   float56,dword ptr [dword95]
        push_arg        float56,4
        lea     dword96,dword ptr [__clip_plane_bottom_base]
        push_arg        dword96,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword97,dword ptr [___unnamed_float_1]
        movss   float57,dword ptr [dword97]
        push_arg        float57,4
        lea     dword98,dword ptr [___unnamed_float_2]
        movss   float58,dword ptr [dword98]
        push_arg        float58,4
        lea     dword99,dword ptr [___unnamed_float_5]
        movss   float59,dword ptr [dword99]
        push_arg        float59,4
        lea     dword100,dword ptr [___unnamed_float_2]
        movss   float60,dword ptr [dword100]
        push_arg        float60,4
        lea     dword101,dword ptr [__clip_plane_bottom_norm]
        push_arg        dword101,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        destroy_stack_frame
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        create_stack_frame
        lea     dword1,dword ptr [__videomem]
        lea     dword2,[ebp+8]
        mov     dword3,[dword2]
        mov     [dword1],dword3
        destroy_stack_frame
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        create_stack_frame
        lea     dword1,[ebp+8]
        mov     dword2,[dword1]
        lea     dword3,dword ptr [__mvproj_matrix]
        mov     dword4,dword3
        mov     dword5,dword2
        mov     dword6,16
        rep     movsd   dword4,dword5
        destroy_stack_frame
        ret
_rasterizer_set_mvproj endp

_rasterizer_set_color proc
        create_stack_frame
        lea     dword1,dword ptr [__color]
        lea     dword2,[ebp+8]
        mov     dword3,[dword2]
        mov     [dword1],dword3
        destroy_stack_frame
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        create_stack_frame
        lea     dword1,dword ptr [__texture_data]
        lea     dword2,[ebp+8]
        mov     dword3,[dword2]
        mov     [dword1],dword3
        lea     dword4,dword ptr [__texture_width]
        lea     dword5,[ebp+12]
        mov     dword6,[dword5]
        mov     [dword4],dword6
        lea     dword7,dword ptr [__texture_height]
        lea     dword8,[ebp+16]
        mov     dword9,[dword8]
        mov     [dword7],dword9
        destroy_stack_frame
        ret
_rasterizer_set_texture endp

__tex2d proc
        create_stack_frame
        lea     dword1,dword ptr [__texture_width]
        mov     dword2,1
        mov     dword3,[dword1]
        sub     dword3,dword2
        cvtsi2ss        float1,dword3
        lea     dword4,[ebp+8]
        mulss   float1,dword ptr [dword4]
        cvttss2si       dword5,float1
        lea     dword6,[ebp-4]
        mov     [dword6],dword5
        lea     dword7,dword ptr [__texture_height]
        mov     dword8,1
        mov     dword9,[dword7]
        sub     dword9,dword8
        cvtsi2ss        float2,dword9
        lea     dword10,[ebp+12]
        mulss   float2,dword ptr [dword10]
        cvttss2si       dword11,float2
        lea     dword12,[ebp-8]
        mov     [dword12],dword11
        lea     dword13,[ebp-8]
        lea     dword14,dword ptr [__texture_width]
        mov     dword15,[dword13]
        imul    dword15,[dword14]
        lea     dword16,[ebp-4]
        add     dword15,[dword16]
        mov     dword17,2
        sal     dword15,dword17
        lea     dword18,dword ptr [__texture_data]
        add     dword15,[dword18]
        set_retval      dword ptr [dword15]
        destroy_stack_frame
        ret
__tex2d endp

__rasterize_horiz_line proc
        create_stack_frame
        lea     dword1,dword ptr [__pitch]
        lea     dword2,[ebp+16]
        mov     dword3,[dword1]
        imul    dword3,[dword2]
        lea     dword4,dword ptr [__videomem]
        add     dword3,[dword4]
        lea     dword5,[ebp+8]
        mov     dword6,2
        mov     dword7,[dword5]
        sal     dword7,dword6
        add     dword3,dword7
        lea     dword8,[ebp-4]
        mov     [dword8],dword3
        lea     dword9,[ebp+12]
        mov     dword10,2
        mov     dword11,[dword9]
        sal     dword11,dword10
        lea     dword12,[ebp-4]
        add     dword11,[dword12]
        lea     dword13,[ebp+8]
        mov     dword14,2
        mov     dword15,[dword13]
        sal     dword15,dword14
        sub     dword11,dword15
        lea     dword16,[ebp-8]
        mov     [dword16],dword11
label0000:
        push_all
        lea     dword17,[ebp+24]
        push_arg        dword ptr [dword17],4
        lea     dword18,[ebp+20]
        push_arg        dword ptr [dword18],4
        call    __tex2d
        restore_stack   8
        pop_all
        read_retval     dword19
        lea     dword20,[ebp-12]
        mov     [dword20],dword19
        lea     dword21,[ebp-12]
        mov     dword22,24
        mov     dword23,[dword21]
        sar     dword23,dword22
        mov     dword24,255
        and     dword23,dword24
        lea     dword25,[ebp-40]
        mov     [dword25],dword23
        lea     dword26,[ebp-40]
        cmp     dword ptr [dword26],0
        je      label0003
        lea     dword27,[ebp-40]
        cvtsi2ss        float1,dword ptr [dword27]
        lea     dword28,dword ptr [___unnamed_float_6]
        movss   float2,dword ptr [dword28]
        mulss   float1,float2
        lea     dword29,[ebp-44]
        movss   dword ptr [dword29],float1
        lea     dword30,[ebp-4]
        mov     dword31,[dword30]
        lea     dword32,[ebp-28]
        mov     dword33,[dword31]
        mov     [dword32],dword33
        lea     dword34,[ebp-28]
        mov     dword35,65280
        mov     dword36,[dword34]
        and     dword36,dword35
        mov     dword37,8
        sar     dword36,dword37
        lea     dword38,[ebp-32]
        mov     [dword38],dword36
        lea     dword39,[ebp-28]
        mov     dword40,255
        mov     dword41,[dword39]
        and     dword41,dword40
        lea     dword42,[ebp-36]
        mov     [dword42],dword41
        lea     dword43,[ebp-12]
        mov     dword44,65280
        mov     dword45,[dword43]
        and     dword45,dword44
        mov     dword46,8
        sar     dword45,dword46
        lea     dword47,[ebp-20]
        mov     [dword47],dword45
        lea     dword48,[ebp-12]
        mov     dword49,255
        mov     dword50,[dword48]
        and     dword50,dword49
        lea     dword51,[ebp-24]
        mov     [dword51],dword50
        lea     dword52,[ebp-20]
        cvtsi2ss        float3,dword ptr [dword52]
        lea     dword53,[ebp-44]
        mulss   float3,dword ptr [dword53]
        lea     dword54,[ebp-32]
        cvtsi2ss        float4,dword ptr [dword54]
        lea     dword55,dword ptr [___unnamed_float_1]
        movss   float5,dword ptr [dword55]
        lea     dword56,[ebp-44]
        subss   float5,dword ptr [dword56]
        mulss   float4,float5
        addss   float3,float4
        cvttss2si       dword57,float3
        lea     dword58,[ebp-20]
        mov     [dword58],dword57
        lea     dword59,[ebp-24]
        cvtsi2ss        float6,dword ptr [dword59]
        lea     dword60,[ebp-44]
        mulss   float6,dword ptr [dword60]
        lea     dword61,[ebp-36]
        cvtsi2ss        float7,dword ptr [dword61]
        lea     dword62,dword ptr [___unnamed_float_1]
        movss   float8,dword ptr [dword62]
        lea     dword63,[ebp-44]
        subss   float8,dword ptr [dword63]
        mulss   float7,float8
        addss   float6,float7
        cvttss2si       dword64,float6
        lea     dword65,[ebp-24]
        mov     [dword65],dword64
        lea     dword66,[ebp-20]
        mov     dword67,8
        mov     dword68,[dword66]
        sal     dword68,dword67
        lea     dword69,[ebp-24]
        add     dword68,[dword69]
        lea     dword70,[ebp-16]
        mov     [dword70],dword68
        lea     dword71,[ebp-4]
        mov     dword72,[dword71]
        lea     dword73,[ebp-16]
        mov     dword74,[dword73]
        mov     [dword72],dword74
label0003:
        lea     dword75,[ebp+20]
        lea     dword76,[ebp+28]
        movss   float9,dword ptr [dword75]
        addss   float9,dword ptr [dword76]
        movss   dword ptr [dword75],float9
        lea     dword77,[ebp+24]
        lea     dword78,[ebp+32]
        movss   float10,dword ptr [dword77]
        addss   float10,dword ptr [dword78]
        movss   dword ptr [dword77],float10
label0001:
        lea     dword79,[ebp-4]
        add     dword ptr [dword79],4
        lea     dword80,[ebp-8]
        mov     dword81,[dword79]
        cmp     dword81,[dword80]
        jl      label0000
label0002:
        destroy_stack_frame
        ret
__rasterize_horiz_line endp

__rasterize_horiz_line__unordered proc
        create_stack_frame
        lea     dword1,[ebp+8]
        lea     dword2,[ebp+12]
        mov     dword3,[dword1]
        cmp     dword3,[dword2]
        jg      label0000
        push_all
        lea     dword4,[ebp+40]
        push_arg        dword ptr [dword4],4
        lea     dword5,[ebp+36]
        push_arg        dword ptr [dword5],4
        lea     dword6,[ebp+24]
        push_arg        dword ptr [dword6],4
        lea     dword7,[ebp+20]
        push_arg        dword ptr [dword7],4
        lea     dword8,[ebp+16]
        push_arg        dword ptr [dword8],4
        lea     dword9,[ebp+12]
        push_arg        dword ptr [dword9],4
        lea     dword10,[ebp+8]
        push_arg        dword ptr [dword10],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0001
label0000:
        push_all
        lea     dword11,[ebp+40]
        push_arg        dword ptr [dword11],4
        lea     dword12,[ebp+36]
        push_arg        dword ptr [dword12],4
        lea     dword13,[ebp+32]
        push_arg        dword ptr [dword13],4
        lea     dword14,[ebp+28]
        push_arg        dword ptr [dword14],4
        lea     dword15,[ebp+16]
        push_arg        dword ptr [dword15],4
        lea     dword16,[ebp+8]
        push_arg        dword ptr [dword16],4
        lea     dword17,[ebp+12]
        push_arg        dword ptr [dword17],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0001:
        destroy_stack_frame
        ret
__rasterize_horiz_line__unordered endp

__rasterize_triangle_1i proc
        create_stack_frame
        lea     dword1,[ebp+8]
        lea     dword2,[ebp+12]
        mov     dword3,[dword1]
        cmp     dword3,[dword2]
        jge     label0000
        lea     dword4,[ebp+16]
        lea     dword5,[ebp+12]
        mov     dword6,[dword4]
        cmp     dword6,[dword5]
        jle     label0001
        push_all
        lea     dword7,[ebp+40]
        push_arg        dword ptr [dword7],4
        lea     dword8,[ebp+36]
        push_arg        dword ptr [dword8],4
        lea     dword9,[ebp+24]
        mov     dword10,4
        add     dword10,[dword9]
        push_arg        dword ptr [dword10],4
        lea     dword11,[ebp+24]
        mov     dword12,[dword11]
        push_arg        dword ptr [dword12],4
        lea     dword13,[ebp+20]
        push_arg        dword ptr [dword13],4
        lea     dword14,[ebp+16]
        push_arg        dword ptr [dword14],4
        lea     dword15,[ebp+8]
        push_arg        dword ptr [dword15],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0002
label0001:
        lea     dword16,[ebp+16]
        lea     dword17,[ebp+8]
        mov     dword18,[dword16]
        cmp     dword18,[dword17]
        jge     label0003
        push_all
        lea     dword19,[ebp+40]
        push_arg        dword ptr [dword19],4
        lea     dword20,[ebp+36]
        push_arg        dword ptr [dword20],4
        lea     dword21,[ebp+32]
        mov     dword22,4
        add     dword22,[dword21]
        push_arg        dword ptr [dword22],4
        lea     dword23,[ebp+32]
        mov     dword24,[dword23]
        push_arg        dword ptr [dword24],4
        lea     dword25,[ebp+20]
        push_arg        dword ptr [dword25],4
        lea     dword26,[ebp+12]
        push_arg        dword ptr [dword26],4
        lea     dword27,[ebp+16]
        push_arg        dword ptr [dword27],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0004
label0003:
        push_all
        lea     dword28,[ebp+40]
        push_arg        dword ptr [dword28],4
        lea     dword29,[ebp+36]
        push_arg        dword ptr [dword29],4
        lea     dword30,[ebp+24]
        mov     dword31,4
        add     dword31,[dword30]
        push_arg        dword ptr [dword31],4
        lea     dword32,[ebp+24]
        mov     dword33,[dword32]
        push_arg        dword ptr [dword33],4
        lea     dword34,[ebp+20]
        push_arg        dword ptr [dword34],4
        lea     dword35,[ebp+12]
        push_arg        dword ptr [dword35],4
        lea     dword36,[ebp+8]
        push_arg        dword ptr [dword36],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0004:
label0002:
        jmp     label0005
label0000:
        lea     dword37,[ebp+16]
        lea     dword38,[ebp+12]
        mov     dword39,[dword37]
        cmp     dword39,[dword38]
        jge     label0006
        push_all
        lea     dword40,[ebp+40]
        movss   float1,dword ptr [dword40]
        xorps   float1,dword ptr [___unnamed_float4_4]
        push_arg        float1,4
        lea     dword41,[ebp+36]
        movss   float2,dword ptr [dword41]
        xorps   float2,dword ptr [___unnamed_float4_4]
        push_arg        float2,4
        lea     dword42,[ebp+32]
        mov     dword43,4
        add     dword43,[dword42]
        push_arg        dword ptr [dword43],4
        lea     dword44,[ebp+32]
        mov     dword45,[dword44]
        push_arg        dword ptr [dword45],4
        lea     dword46,[ebp+20]
        push_arg        dword ptr [dword46],4
        lea     dword47,[ebp+8]
        push_arg        dword ptr [dword47],4
        lea     dword48,[ebp+16]
        push_arg        dword ptr [dword48],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0007
label0006:
        lea     dword49,[ebp+16]
        lea     dword50,[ebp+8]
        mov     dword51,[dword49]
        cmp     dword51,[dword50]
        jle     label0008
        push_all
        lea     dword52,[ebp+40]
        movss   float3,dword ptr [dword52]
        xorps   float3,dword ptr [___unnamed_float4_4]
        push_arg        float3,4
        lea     dword53,[ebp+36]
        movss   float4,dword ptr [dword53]
        xorps   float4,dword ptr [___unnamed_float4_4]
        push_arg        float4,4
        lea     dword54,[ebp+28]
        mov     dword55,4
        add     dword55,[dword54]
        push_arg        dword ptr [dword55],4
        lea     dword56,[ebp+28]
        mov     dword57,[dword56]
        push_arg        dword ptr [dword57],4
        lea     dword58,[ebp+20]
        push_arg        dword ptr [dword58],4
        lea     dword59,[ebp+16]
        push_arg        dword ptr [dword59],4
        lea     dword60,[ebp+12]
        push_arg        dword ptr [dword60],4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0009
label0008:
        push_all
        lea     dword61,[ebp+40]
        movss   float5,dword ptr [dword61]
        xorps   float5,dword ptr [___unnamed_float4_4]
        push_arg        float5,4
        lea     dword62,[ebp+36]
        movss   float6,dword ptr [dword62]
        xorps   float6,dword ptr [___unnamed_float4_4]
        push_arg        float6,4
        lea     dword63,[ebp+28]
        mov     dword64,4
        add     dword64,[dword63]
        push_arg        dword ptr [dword64],4
        lea     dword65,[ebp+28]
        mov     dword66,[dword65]
        push_arg        dword ptr [dword66],4
        lea     dword67,[ebp+20]
        push_arg        dword ptr [dword67],4
        lea     dword68,[ebp+8]
        push_arg        dword ptr [dword68],4
        lea     dword69,[ebp+12]
        push_arg        dword ptr [dword69],4
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
        lea     dword1,[ebp+8]
        mov     dword2,[dword1]
        mov     dword3,4
        add     dword2,dword3
        lea     dword4,[ebp+12]
        mov     dword5,[dword4]
        mov     dword6,4
        add     dword5,dword6
        mov     dword7,[dword2]
        cmp     dword7,[dword5]
        jle     label0000
        lea     dword8,[ebp-4]
        lea     dword9,[ebp+8]
        mov     dword10,[dword9]
        mov     [dword8],dword10
        lea     dword11,[ebp+8]
        lea     dword12,[ebp+12]
        mov     dword13,[dword12]
        mov     [dword11],dword13
        lea     dword14,[ebp+12]
        lea     dword15,[ebp-4]
        mov     dword16,[dword15]
        mov     [dword14],dword16
label0000:
        lea     dword17,[ebp+8]
        mov     dword18,[dword17]
        mov     dword19,4
        add     dword18,dword19
        lea     dword20,[ebp+16]
        mov     dword21,[dword20]
        mov     dword22,4
        add     dword21,dword22
        mov     dword23,[dword18]
        cmp     dword23,[dword21]
        jle     label0001
        lea     dword24,[ebp-4]
        lea     dword25,[ebp+8]
        mov     dword26,[dword25]
        mov     [dword24],dword26
        lea     dword27,[ebp+8]
        lea     dword28,[ebp+16]
        mov     dword29,[dword28]
        mov     [dword27],dword29
        lea     dword30,[ebp+16]
        lea     dword31,[ebp-4]
        mov     dword32,[dword31]
        mov     [dword30],dword32
label0001:
        lea     dword33,[ebp+12]
        mov     dword34,[dword33]
        mov     dword35,4
        add     dword34,dword35
        lea     dword36,[ebp+16]
        mov     dword37,[dword36]
        mov     dword38,4
        add     dword37,dword38
        mov     dword39,[dword34]
        cmp     dword39,[dword37]
        jle     label0002
        lea     dword40,[ebp-4]
        lea     dword41,[ebp+12]
        mov     dword42,[dword41]
        mov     [dword40],dword42
        lea     dword43,[ebp+12]
        lea     dword44,[ebp+16]
        mov     dword45,[dword44]
        mov     [dword43],dword45
        lea     dword46,[ebp+16]
        lea     dword47,[ebp-4]
        mov     dword48,[dword47]
        mov     [dword46],dword48
label0002:
        lea     dword49,[ebp+8]
        mov     dword50,[dword49]
        mov     dword51,4
        add     dword50,dword51
        lea     dword52,[ebp+16]
        mov     dword53,[dword52]
        mov     dword54,4
        add     dword53,dword54
        mov     dword55,[dword50]
        cmp     dword55,[dword53]
        jne     label0003
        lea     dword56,[ebp+8]
        mov     dword57,[dword56]
        mov     dword58,4
        add     dword57,dword58
        mov     dword59,0
        cmp     [dword57],dword59
        jl      label0004
        lea     dword60,[ebp+8]
        mov     dword61,[dword60]
        mov     dword62,4
        add     dword61,dword62
        lea     dword63,dword ptr [__height]
        mov     dword64,[dword61]
        cmp     dword64,[dword63]
        jge     label0004
        push_all
        lea     dword65,dword ptr [___unnamed_float_2]
        movss   float1,dword ptr [dword65]
        push_arg        float1,4
        lea     dword66,dword ptr [___unnamed_float_2]
        movss   float2,dword ptr [dword66]
        push_arg        float2,4
        lea     dword67,[ebp+16]
        mov     dword68,8
        add     dword68,[dword67]
        push_arg        dword68,4
        lea     dword69,[ebp+12]
        mov     dword70,8
        add     dword70,[dword69]
        push_arg        dword70,4
        lea     dword71,[ebp+8]
        mov     dword72,8
        add     dword72,[dword71]
        push_arg        dword72,4
        lea     dword73,[ebp+8]
        mov     dword74,[dword73]
        mov     dword75,4
        add     dword74,dword75
        push_arg        dword ptr [dword74],4
        lea     dword76,[ebp+16]
        mov     dword77,[dword76]
        push_arg        dword ptr [dword77],4
        lea     dword78,[ebp+12]
        mov     dword79,[dword78]
        push_arg        dword ptr [dword79],4
        lea     dword80,[ebp+8]
        mov     dword81,[dword80]
        push_arg        dword ptr [dword81],4
        call    __rasterize_triangle_1i
        restore_stack   36
        pop_all
label0004:
        destroy_stack_frame
        ret
label0003:
        lea     dword82,[ebp+8]
        mov     dword83,[dword82]
        mov     dword84,4
        add     dword83,dword84
        lea     dword85,[ebp-16]
        mov     dword86,[dword83]
        mov     [dword85],dword86
label0005:
label0006:
        lea     dword87,[ebp+12]
        mov     dword88,[dword87]
        mov     dword89,4
        add     dword88,dword89
        lea     dword90,[ebp-16]
        mov     dword91,[dword88]
        cmp     dword91,[dword90]
        jle     label0007
        lea     dword92,[ebp+8]
        mov     dword93,[dword92]
        mov     dword94,4
        add     dword93,dword94
        lea     dword95,[ebp-16]
        mov     dword96,[dword95]
        sub     dword96,[dword93]
        lea     dword97,[ebp+12]
        mov     dword98,[dword97]
        lea     dword99,[ebp+8]
        mov     dword100,[dword99]
        mov     dword101,[dword98]
        sub     dword101,[dword100]
        imul    dword96,dword101
        lea     dword102,[ebp+12]
        mov     dword103,[dword102]
        mov     dword104,4
        add     dword103,dword104
        lea     dword105,[ebp+8]
        mov     dword106,[dword105]
        mov     dword107,4
        add     dword106,dword107
        mov     dword108,[dword103]
        sub     dword108,[dword106]
        cdq     dword109,dword96
        idiv    dword96,dword108
        lea     dword110,[ebp+8]
        mov     dword111,[dword110]
        add     dword96,[dword111]
        lea     dword112,[ebp-8]
        mov     [dword112],dword96
        lea     dword113,[ebp+8]
        mov     dword114,[dword113]
        mov     dword115,4
        add     dword114,dword115
        lea     dword116,[ebp-16]
        mov     dword117,[dword116]
        sub     dword117,[dword114]
        lea     dword118,[ebp+16]
        mov     dword119,[dword118]
        lea     dword120,[ebp+8]
        mov     dword121,[dword120]
        mov     dword122,[dword119]
        sub     dword122,[dword121]
        imul    dword117,dword122
        lea     dword123,[ebp+16]
        mov     dword124,[dword123]
        mov     dword125,4
        add     dword124,dword125
        lea     dword126,[ebp+8]
        mov     dword127,[dword126]
        mov     dword128,4
        add     dword127,dword128
        mov     dword129,[dword124]
        sub     dword129,[dword127]
        cdq     dword130,dword117
        idiv    dword117,dword129
        lea     dword131,[ebp+8]
        mov     dword132,[dword131]
        add     dword117,[dword132]
        lea     dword133,[ebp-12]
        mov     [dword133],dword117
        lea     dword134,[ebp+8]
        mov     dword135,[dword134]
        mov     dword136,4
        add     dword135,dword136
        lea     dword137,[ebp-16]
        mov     dword138,[dword137]
        sub     dword138,[dword135]
        cvtsi2ss        float3,dword138
        lea     dword139,[ebp+12]
        mov     dword140,8
        add     dword140,[dword139]
        lea     dword141,[ebp+8]
        mov     dword142,8
        add     dword142,[dword141]
        movss   float4,dword ptr [dword140]
        subss   float4,dword ptr [dword142]
        mulss   float3,float4
        lea     dword143,[ebp+12]
        mov     dword144,[dword143]
        mov     dword145,4
        add     dword144,dword145
        lea     dword146,[ebp+8]
        mov     dword147,[dword146]
        mov     dword148,4
        add     dword147,dword148
        mov     dword149,[dword144]
        sub     dword149,[dword147]
        cvtsi2ss        float5,dword149
        divss   float3,float5
        lea     dword150,[ebp+8]
        mov     dword151,8
        add     dword151,[dword150]
        addss   float3,dword ptr [dword151]
        lea     dword152,[ebp-20]
        movss   dword ptr [dword152],float3
        lea     dword153,[ebp+8]
        mov     dword154,[dword153]
        mov     dword155,4
        add     dword154,dword155
        lea     dword156,[ebp-16]
        mov     dword157,[dword156]
        sub     dword157,[dword154]
        cvtsi2ss        float6,dword157
        lea     dword158,[ebp+16]
        mov     dword159,8
        add     dword159,[dword158]
        lea     dword160,[ebp+8]
        mov     dword161,8
        add     dword161,[dword160]
        movss   float7,dword ptr [dword159]
        subss   float7,dword ptr [dword161]
        mulss   float6,float7
        lea     dword162,[ebp+16]
        mov     dword163,[dword162]
        mov     dword164,4
        add     dword163,dword164
        lea     dword165,[ebp+8]
        mov     dword166,[dword165]
        mov     dword167,4
        add     dword166,dword167
        mov     dword168,[dword163]
        sub     dword168,[dword166]
        cvtsi2ss        float8,dword168
        divss   float6,float8
        lea     dword169,[ebp+8]
        mov     dword170,8
        add     dword170,[dword169]
        addss   float6,dword ptr [dword170]
        lea     dword171,[ebp-28]
        movss   dword ptr [dword171],float6
        lea     dword172,[ebp+8]
        mov     dword173,[dword172]
        mov     dword174,4
        add     dword173,dword174
        lea     dword175,[ebp-16]
        mov     dword176,[dword175]
        sub     dword176,[dword173]
        cvtsi2ss        float9,dword176
        lea     dword177,[ebp+12]
        mov     dword178,8
        add     dword178,[dword177]
        mov     dword179,4
        add     dword178,dword179
        lea     dword180,[ebp+8]
        mov     dword181,8
        add     dword181,[dword180]
        mov     dword182,4
        add     dword181,dword182
        movss   float10,dword ptr [dword178]
        subss   float10,dword ptr [dword181]
        mulss   float9,float10
        lea     dword183,[ebp+12]
        mov     dword184,[dword183]
        mov     dword185,4
        add     dword184,dword185
        lea     dword186,[ebp+8]
        mov     dword187,[dword186]
        mov     dword188,4
        add     dword187,dword188
        mov     dword189,[dword184]
        sub     dword189,[dword187]
        cvtsi2ss        float11,dword189
        divss   float9,float11
        lea     dword190,[ebp+8]
        mov     dword191,8
        add     dword191,[dword190]
        mov     dword192,4
        add     dword191,dword192
        addss   float9,dword ptr [dword191]
        lea     dword193,[ebp-24]
        movss   dword ptr [dword193],float9
        lea     dword194,[ebp+8]
        mov     dword195,[dword194]
        mov     dword196,4
        add     dword195,dword196
        lea     dword197,[ebp-16]
        mov     dword198,[dword197]
        sub     dword198,[dword195]
        cvtsi2ss        float12,dword198
        lea     dword199,[ebp+16]
        mov     dword200,8
        add     dword200,[dword199]
        mov     dword201,4
        add     dword200,dword201
        lea     dword202,[ebp+8]
        mov     dword203,8
        add     dword203,[dword202]
        mov     dword204,4
        add     dword203,dword204
        movss   float13,dword ptr [dword200]
        subss   float13,dword ptr [dword203]
        mulss   float12,float13
        lea     dword205,[ebp+16]
        mov     dword206,[dword205]
        mov     dword207,4
        add     dword206,dword207
        lea     dword208,[ebp+8]
        mov     dword209,[dword208]
        mov     dword210,4
        add     dword209,dword210
        mov     dword211,[dword206]
        sub     dword211,[dword209]
        cvtsi2ss        float14,dword211
        divss   float12,float14
        lea     dword212,[ebp+8]
        mov     dword213,8
        add     dword213,[dword212]
        mov     dword214,4
        add     dword213,dword214
        addss   float12,dword ptr [dword213]
        lea     dword215,[ebp-32]
        movss   dword ptr [dword215],float12
        lea     dword216,[ebp-12]
        lea     dword217,[ebp-8]
        mov     dword218,[dword216]
        sub     dword218,[dword217]
        cvtsi2ss        float15,dword218
        lea     dword219,[ebp-28]
        lea     dword220,[ebp-20]
        movss   float16,dword ptr [dword219]
        subss   float16,dword ptr [dword220]
        divss   float16,float15
        lea     dword221,[ebp-36]
        movss   dword ptr [dword221],float16
        lea     dword222,[ebp-12]
        lea     dword223,[ebp-8]
        mov     dword224,[dword222]
        sub     dword224,[dword223]
        cvtsi2ss        float17,dword224
        lea     dword225,[ebp-32]
        lea     dword226,[ebp-24]
        movss   float18,dword ptr [dword225]
        subss   float18,dword ptr [dword226]
        divss   float18,float17
        lea     dword227,[ebp-40]
        movss   dword ptr [dword227],float18
        push_all
        lea     dword228,[ebp-40]
        push_arg        dword ptr [dword228],4
        lea     dword229,[ebp-36]
        push_arg        dword ptr [dword229],4
        lea     dword230,[ebp-32]
        push_arg        dword ptr [dword230],4
        lea     dword231,[ebp-28]
        push_arg        dword ptr [dword231],4
        lea     dword232,[ebp-24]
        push_arg        dword ptr [dword232],4
        lea     dword233,[ebp-20]
        push_arg        dword ptr [dword233],4
        lea     dword234,[ebp-16]
        push_arg        dword ptr [dword234],4
        lea     dword235,[ebp-12]
        push_arg        dword ptr [dword235],4
        lea     dword236,[ebp-8]
        push_arg        dword ptr [dword236],4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        lea     dword237,[ebp-16]
        inc     dword ptr [dword237]
        jmp     label0006
label0007:
        lea     dword238,[ebp+12]
        mov     dword239,[dword238]
        mov     dword240,4
        add     dword239,dword240
        lea     dword241,[ebp+8]
        mov     dword242,[dword241]
        mov     dword243,4
        add     dword242,dword243
        mov     dword244,[dword239]
        sub     dword244,[dword242]
        lea     dword245,[ebp+16]
        mov     dword246,[dword245]
        lea     dword247,[ebp+8]
        mov     dword248,[dword247]
        mov     dword249,[dword246]
        sub     dword249,[dword248]
        imul    dword244,dword249
        lea     dword250,[ebp+16]
        mov     dword251,[dword250]
        mov     dword252,4
        add     dword251,dword252
        lea     dword253,[ebp+8]
        mov     dword254,[dword253]
        mov     dword255,4
        add     dword254,dword255
        mov     dword256,[dword251]
        sub     dword256,[dword254]
        cdq     dword257,dword244
        idiv    dword244,dword256
        lea     dword258,[ebp+8]
        mov     dword259,[dword258]
        add     dword244,[dword259]
        lea     dword260,[ebp-12]
        mov     [dword260],dword244
        lea     dword261,[ebp+12]
        mov     dword262,[dword261]
        mov     dword263,4
        add     dword262,dword263
        lea     dword264,[ebp+8]
        mov     dword265,[dword264]
        mov     dword266,4
        add     dword265,dword266
        mov     dword267,[dword262]
        sub     dword267,[dword265]
        cvtsi2ss        float19,dword267
        lea     dword268,[ebp+16]
        mov     dword269,8
        add     dword269,[dword268]
        lea     dword270,[ebp+8]
        mov     dword271,8
        add     dword271,[dword270]
        movss   float20,dword ptr [dword269]
        subss   float20,dword ptr [dword271]
        mulss   float19,float20
        lea     dword272,[ebp+16]
        mov     dword273,[dword272]
        mov     dword274,4
        add     dword273,dword274
        lea     dword275,[ebp+8]
        mov     dword276,[dword275]
        mov     dword277,4
        add     dword276,dword277
        mov     dword278,[dword273]
        sub     dword278,[dword276]
        cvtsi2ss        float21,dword278
        divss   float19,float21
        lea     dword279,[ebp+8]
        mov     dword280,8
        add     dword280,[dword279]
        addss   float19,dword ptr [dword280]
        lea     dword281,[ebp-28]
        movss   dword ptr [dword281],float19
        lea     dword282,[ebp+12]
        mov     dword283,[dword282]
        mov     dword284,4
        add     dword283,dword284
        lea     dword285,[ebp+8]
        mov     dword286,[dword285]
        mov     dword287,4
        add     dword286,dword287
        mov     dword288,[dword283]
        sub     dword288,[dword286]
        cvtsi2ss        float22,dword288
        lea     dword289,[ebp+16]
        mov     dword290,8
        add     dword290,[dword289]
        mov     dword291,4
        add     dword290,dword291
        lea     dword292,[ebp+8]
        mov     dword293,8
        add     dword293,[dword292]
        mov     dword294,4
        add     dword293,dword294
        movss   float23,dword ptr [dword290]
        subss   float23,dword ptr [dword293]
        mulss   float22,float23
        lea     dword295,[ebp+16]
        mov     dword296,[dword295]
        mov     dword297,4
        add     dword296,dword297
        lea     dword298,[ebp+8]
        mov     dword299,[dword298]
        mov     dword300,4
        add     dword299,dword300
        mov     dword301,[dword296]
        sub     dword301,[dword299]
        cvtsi2ss        float24,dword301
        divss   float22,float24
        lea     dword302,[ebp+8]
        mov     dword303,8
        add     dword303,[dword302]
        mov     dword304,4
        add     dword303,dword304
        addss   float22,dword ptr [dword303]
        lea     dword305,[ebp-32]
        movss   dword ptr [dword305],float22
        lea     dword306,[ebp+12]
        mov     dword307,8
        add     dword307,[dword306]
        lea     dword308,[ebp-28]
        movss   float25,dword ptr [dword308]
        subss   float25,dword ptr [dword307]
        lea     dword309,[ebp+12]
        mov     dword310,[dword309]
        lea     dword311,[ebp-12]
        mov     dword312,[dword311]
        sub     dword312,[dword310]
        cvtsi2ss        float26,dword312
        divss   float25,float26
        lea     dword313,[ebp-36]
        movss   dword ptr [dword313],float25
        lea     dword314,[ebp+12]
        mov     dword315,8
        add     dword315,[dword314]
        mov     dword316,4
        add     dword315,dword316
        lea     dword317,[ebp-32]
        movss   float27,dword ptr [dword317]
        subss   float27,dword ptr [dword315]
        lea     dword318,[ebp+12]
        mov     dword319,[dword318]
        lea     dword320,[ebp-12]
        mov     dword321,[dword320]
        sub     dword321,[dword319]
        cvtsi2ss        float28,dword321
        divss   float27,float28
        lea     dword322,[ebp-40]
        movss   dword ptr [dword322],float27
        push_all
        lea     dword323,[ebp-40]
        push_arg        dword ptr [dword323],4
        lea     dword324,[ebp-36]
        push_arg        dword ptr [dword324],4
        lea     dword325,[ebp+12]
        mov     dword326,8
        add     dword326,[dword325]
        mov     dword327,4
        add     dword326,dword327
        push_arg        dword ptr [dword326],4
        lea     dword328,[ebp+12]
        mov     dword329,8
        add     dword329,[dword328]
        push_arg        dword ptr [dword329],4
        lea     dword330,[ebp-32]
        push_arg        dword ptr [dword330],4
        lea     dword331,[ebp-28]
        push_arg        dword ptr [dword331],4
        lea     dword332,[ebp+12]
        mov     dword333,[dword332]
        mov     dword334,4
        add     dword333,dword334
        push_arg        dword ptr [dword333],4
        lea     dword335,[ebp+12]
        mov     dword336,[dword335]
        push_arg        dword ptr [dword336],4
        lea     dword337,[ebp-12]
        push_arg        dword ptr [dword337],4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        lea     dword338,[ebp+12]
        mov     dword339,[dword338]
        mov     dword340,4
        add     dword339,dword340
        mov     dword341,1
        add     dword341,[dword339]
        lea     dword342,[ebp-16]
        mov     [dword342],dword341
label0008:
label0009:
        lea     dword343,[ebp+16]
        mov     dword344,[dword343]
        mov     dword345,4
        add     dword344,dword345
        lea     dword346,[ebp-16]
        mov     dword347,[dword344]
        cmp     dword347,[dword346]
        jle     label000a
        lea     dword348,[ebp+12]
        mov     dword349,[dword348]
        mov     dword350,4
        add     dword349,dword350
        lea     dword351,[ebp-16]
        mov     dword352,[dword351]
        sub     dword352,[dword349]
        lea     dword353,[ebp+16]
        mov     dword354,[dword353]
        lea     dword355,[ebp+12]
        mov     dword356,[dword355]
        mov     dword357,[dword354]
        sub     dword357,[dword356]
        imul    dword352,dword357
        lea     dword358,[ebp+16]
        mov     dword359,[dword358]
        mov     dword360,4
        add     dword359,dword360
        lea     dword361,[ebp+12]
        mov     dword362,[dword361]
        mov     dword363,4
        add     dword362,dword363
        mov     dword364,[dword359]
        sub     dword364,[dword362]
        cdq     dword365,dword352
        idiv    dword352,dword364
        lea     dword366,[ebp+12]
        mov     dword367,[dword366]
        add     dword352,[dword367]
        lea     dword368,[ebp-8]
        mov     [dword368],dword352
        lea     dword369,[ebp+8]
        mov     dword370,[dword369]
        mov     dword371,4
        add     dword370,dword371
        lea     dword372,[ebp-16]
        mov     dword373,[dword372]
        sub     dword373,[dword370]
        lea     dword374,[ebp+16]
        mov     dword375,[dword374]
        lea     dword376,[ebp+8]
        mov     dword377,[dword376]
        mov     dword378,[dword375]
        sub     dword378,[dword377]
        imul    dword373,dword378
        lea     dword379,[ebp+16]
        mov     dword380,[dword379]
        mov     dword381,4
        add     dword380,dword381
        lea     dword382,[ebp+8]
        mov     dword383,[dword382]
        mov     dword384,4
        add     dword383,dword384
        mov     dword385,[dword380]
        sub     dword385,[dword383]
        cdq     dword386,dword373
        idiv    dword373,dword385
        lea     dword387,[ebp+8]
        mov     dword388,[dword387]
        add     dword373,[dword388]
        lea     dword389,[ebp-12]
        mov     [dword389],dword373
        lea     dword390,[ebp+12]
        mov     dword391,[dword390]
        mov     dword392,4
        add     dword391,dword392
        lea     dword393,[ebp-16]
        mov     dword394,[dword393]
        sub     dword394,[dword391]
        cvtsi2ss        float29,dword394
        lea     dword395,[ebp+16]
        mov     dword396,8
        add     dword396,[dword395]
        lea     dword397,[ebp+12]
        mov     dword398,8
        add     dword398,[dword397]
        movss   float30,dword ptr [dword396]
        subss   float30,dword ptr [dword398]
        mulss   float29,float30
        lea     dword399,[ebp+16]
        mov     dword400,[dword399]
        mov     dword401,4
        add     dword400,dword401
        lea     dword402,[ebp+12]
        mov     dword403,[dword402]
        mov     dword404,4
        add     dword403,dword404
        mov     dword405,[dword400]
        sub     dword405,[dword403]
        cvtsi2ss        float31,dword405
        divss   float29,float31
        lea     dword406,[ebp+12]
        mov     dword407,8
        add     dword407,[dword406]
        addss   float29,dword ptr [dword407]
        lea     dword408,[ebp-20]
        movss   dword ptr [dword408],float29
        lea     dword409,[ebp+8]
        mov     dword410,[dword409]
        mov     dword411,4
        add     dword410,dword411
        lea     dword412,[ebp-16]
        mov     dword413,[dword412]
        sub     dword413,[dword410]
        cvtsi2ss        float32,dword413
        lea     dword414,[ebp+16]
        mov     dword415,8
        add     dword415,[dword414]
        lea     dword416,[ebp+8]
        mov     dword417,8
        add     dword417,[dword416]
        movss   float33,dword ptr [dword415]
        subss   float33,dword ptr [dword417]
        mulss   float32,float33
        lea     dword418,[ebp+16]
        mov     dword419,[dword418]
        mov     dword420,4
        add     dword419,dword420
        lea     dword421,[ebp+8]
        mov     dword422,[dword421]
        mov     dword423,4
        add     dword422,dword423
        mov     dword424,[dword419]
        sub     dword424,[dword422]
        cvtsi2ss        float34,dword424
        divss   float32,float34
        lea     dword425,[ebp+8]
        mov     dword426,8
        add     dword426,[dword425]
        addss   float32,dword ptr [dword426]
        lea     dword427,[ebp-28]
        movss   dword ptr [dword427],float32
        lea     dword428,[ebp+12]
        mov     dword429,[dword428]
        mov     dword430,4
        add     dword429,dword430
        lea     dword431,[ebp-16]
        mov     dword432,[dword431]
        sub     dword432,[dword429]
        cvtsi2ss        float35,dword432
        lea     dword433,[ebp+16]
        mov     dword434,8
        add     dword434,[dword433]
        mov     dword435,4
        add     dword434,dword435
        lea     dword436,[ebp+12]
        mov     dword437,8
        add     dword437,[dword436]
        mov     dword438,4
        add     dword437,dword438
        movss   float36,dword ptr [dword434]
        subss   float36,dword ptr [dword437]
        mulss   float35,float36
        lea     dword439,[ebp+16]
        mov     dword440,[dword439]
        mov     dword441,4
        add     dword440,dword441
        lea     dword442,[ebp+12]
        mov     dword443,[dword442]
        mov     dword444,4
        add     dword443,dword444
        mov     dword445,[dword440]
        sub     dword445,[dword443]
        cvtsi2ss        float37,dword445
        divss   float35,float37
        lea     dword446,[ebp+12]
        mov     dword447,8
        add     dword447,[dword446]
        mov     dword448,4
        add     dword447,dword448
        addss   float35,dword ptr [dword447]
        lea     dword449,[ebp-24]
        movss   dword ptr [dword449],float35
        lea     dword450,[ebp+8]
        mov     dword451,[dword450]
        mov     dword452,4
        add     dword451,dword452
        lea     dword453,[ebp-16]
        mov     dword454,[dword453]
        sub     dword454,[dword451]
        cvtsi2ss        float38,dword454
        lea     dword455,[ebp+16]
        mov     dword456,8
        add     dword456,[dword455]
        mov     dword457,4
        add     dword456,dword457
        lea     dword458,[ebp+8]
        mov     dword459,8
        add     dword459,[dword458]
        mov     dword460,4
        add     dword459,dword460
        movss   float39,dword ptr [dword456]
        subss   float39,dword ptr [dword459]
        mulss   float38,float39
        lea     dword461,[ebp+16]
        mov     dword462,[dword461]
        mov     dword463,4
        add     dword462,dword463
        lea     dword464,[ebp+8]
        mov     dword465,[dword464]
        mov     dword466,4
        add     dword465,dword466
        mov     dword467,[dword462]
        sub     dword467,[dword465]
        cvtsi2ss        float40,dword467
        divss   float38,float40
        lea     dword468,[ebp+8]
        mov     dword469,8
        add     dword469,[dword468]
        mov     dword470,4
        add     dword469,dword470
        addss   float38,dword ptr [dword469]
        lea     dword471,[ebp-32]
        movss   dword ptr [dword471],float38
        lea     dword472,[ebp-12]
        lea     dword473,[ebp-8]
        mov     dword474,[dword472]
        sub     dword474,[dword473]
        cvtsi2ss        float41,dword474
        lea     dword475,[ebp-28]
        lea     dword476,[ebp-20]
        movss   float42,dword ptr [dword475]
        subss   float42,dword ptr [dword476]
        divss   float42,float41
        lea     dword477,[ebp-36]
        movss   dword ptr [dword477],float42
        lea     dword478,[ebp-12]
        lea     dword479,[ebp-8]
        mov     dword480,[dword478]
        sub     dword480,[dword479]
        cvtsi2ss        float43,dword480
        lea     dword481,[ebp-32]
        lea     dword482,[ebp-24]
        movss   float44,dword ptr [dword481]
        subss   float44,dword ptr [dword482]
        divss   float44,float43
        lea     dword483,[ebp-40]
        movss   dword ptr [dword483],float44
        push_all
        lea     dword484,[ebp-40]
        push_arg        dword ptr [dword484],4
        lea     dword485,[ebp-36]
        push_arg        dword ptr [dword485],4
        lea     dword486,[ebp-32]
        push_arg        dword ptr [dword486],4
        lea     dword487,[ebp-28]
        push_arg        dword ptr [dword487],4
        lea     dword488,[ebp-24]
        push_arg        dword ptr [dword488],4
        lea     dword489,[ebp-20]
        push_arg        dword ptr [dword489],4
        lea     dword490,[ebp-16]
        push_arg        dword ptr [dword490],4
        lea     dword491,[ebp-12]
        push_arg        dword ptr [dword491],4
        lea     dword492,[ebp-8]
        push_arg        dword ptr [dword492],4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        lea     dword493,[ebp-16]
        inc     dword ptr [dword493]
        jmp     label0009
label000a:
        destroy_stack_frame
        ret
__rasterize_triangle_2i endp

__clip_on_plain proc
        create_stack_frame
        lea     dword1,[ebp+8]
        mov     dword2,192
        add     dword2,[dword1]
        mov     dword3,0
        mov     [dword2],dword3
        lea     dword4,[ebp+12]
        mov     dword5,[dword4]
        lea     dword6,[ebp-4]
        mov     [dword6],dword5
        lea     dword7,[ebp+12]
        mov     dword8,[dword7]
        mov     dword9,24
        add     dword8,dword9
        lea     dword10,[ebp-8]
        mov     [dword10],dword8
label0000:
label0001:
        lea     dword11,[ebp+12]
        mov     dword12,192
        add     dword12,[dword11]
        mov     dword13,24
        mov     dword14,[dword12]
        imul    dword14,dword13
        lea     dword15,[ebp+12]
        mov     dword16,[dword15]
        add     dword16,dword14
        lea     dword17,[ebp-8]
        cmp     dword16,[dword17]
        jle     label0002
        push_all
        lea     dword18,[ebp+16]
        push_arg        dword ptr [dword18],4
        lea     dword19,[ebp-4]
        mov     dword20,[dword19]
        push_arg        dword20,4
        lea     dword21,[ebp-24]
        push_arg        dword21,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        lea     dword22,[ebp+20]
        push_arg        dword ptr [dword22],4
        lea     dword23,[ebp-24]
        push_arg        dword23,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float1
        lea     dword24,[ebp-52]
        movss   dword ptr [dword24],float1
        push_all
        lea     dword25,[ebp+16]
        push_arg        dword ptr [dword25],4
        lea     dword26,[ebp-8]
        mov     dword27,[dword26]
        push_arg        dword27,4
        lea     dword28,[ebp-24]
        push_arg        dword28,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        lea     dword29,[ebp+20]
        push_arg        dword ptr [dword29],4
        lea     dword30,[ebp-24]
        push_arg        dword30,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float2
        lea     dword31,[ebp-56]
        movss   dword ptr [dword31],float2
        lea     dword32,[ebp-52]
        lea     dword33,dword ptr [___unnamed_float_2]
        movss   float3,dword ptr [dword33]
        comiss  float3,dword ptr [dword32]
        ja      label0003
        lea     dword34,[ebp+8]
        mov     dword35,192
        add     dword35,[dword34]
        mov     dword36,[dword35]
        inc     dword ptr [dword35]
        mov     dword37,24
        imul    dword36,dword37
        lea     dword38,[ebp+8]
        mov     dword39,[dword38]
        add     dword39,dword36
        lea     dword40,[ebp-4]
        mov     dword41,[dword40]
        movq    double4,qword ptr [dword41]
        movq    qword ptr [dword39],double4
        movq    double4,qword ptr [dword41+8]
        movq    qword ptr [dword39+8],double4
        movq    double4,qword ptr [dword41+16]
        movq    qword ptr [dword39+16],double4
label0003:
        lea     dword42,[ebp-52]
        lea     dword43,dword ptr [___unnamed_float_2]
        movss   float5,dword ptr [dword43]
        comiss  float5,dword ptr [dword42]
        jae     label0006
        lea     dword44,[ebp-56]
        lea     dword45,dword ptr [___unnamed_float_2]
        movss   float6,dword ptr [dword45]
        comiss  float6,dword ptr [dword44]
        ja      label0005
label0006:
        lea     dword46,[ebp-56]
        lea     dword47,dword ptr [___unnamed_float_2]
        movss   float7,dword ptr [dword47]
        comiss  float7,dword ptr [dword46]
        ja      label0004
        lea     dword48,[ebp-52]
        lea     dword49,dword ptr [___unnamed_float_2]
        movss   float8,dword ptr [dword49]
        comiss  float8,dword ptr [dword48]
        jbe     label0004
label0005:
        push_all
        lea     dword50,[ebp-4]
        mov     dword51,[dword50]
        push_arg        dword51,4
        lea     dword52,[ebp+16]
        push_arg        dword ptr [dword52],4
        lea     dword53,[ebp-24]
        push_arg        dword53,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        lea     dword54,[ebp-4]
        mov     dword55,[dword54]
        push_arg        dword55,4
        lea     dword56,[ebp-8]
        mov     dword57,[dword56]
        push_arg        dword57,4
        lea     dword58,[ebp-40]
        push_arg        dword58,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        lea     dword59,[ebp+20]
        push_arg        dword ptr [dword59],4
        lea     dword60,[ebp-24]
        push_arg        dword60,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float9
        push_all
        lea     dword61,[ebp+20]
        push_arg        dword ptr [dword61],4
        lea     dword62,[ebp-40]
        push_arg        dword62,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     float10
        divss   float9,float10
        lea     dword63,[ebp-60]
        movss   dword ptr [dword63],float9
        push_all
        lea     dword64,[ebp-60]
        push_arg        dword ptr [dword64],4
        lea     dword65,[ebp-40]
        push_arg        dword65,4
        call    _vec4f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword66,[ebp-40]
        push_arg        dword66,4
        lea     dword67,[ebp-4]
        mov     dword68,[dword67]
        push_arg        dword68,4
        lea     dword69,[ebp+8]
        mov     dword70,192
        add     dword70,[dword69]
        mov     dword71,24
        mov     dword72,[dword70]
        imul    dword72,dword71
        lea     dword73,[ebp+8]
        mov     dword74,[dword73]
        add     dword74,dword72
        push_arg        dword74,4
        call    _vec4f_add
        restore_stack   12
        pop_all
        push_all
        lea     dword75,[ebp-4]
        mov     dword76,16
        add     dword76,[dword75]
        push_arg        dword76,4
        lea     dword77,[ebp-8]
        mov     dword78,16
        add     dword78,[dword77]
        push_arg        dword78,4
        lea     dword79,[ebp-48]
        push_arg        dword79,4
        call    _vec2f_subtract
        restore_stack   12
        pop_all
        push_all
        lea     dword80,[ebp-60]
        push_arg        dword ptr [dword80],4
        lea     dword81,[ebp-48]
        push_arg        dword81,4
        call    _vec2f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword82,[ebp-48]
        push_arg        dword82,4
        lea     dword83,[ebp-4]
        mov     dword84,16
        add     dword84,[dword83]
        push_arg        dword84,4
        lea     dword85,[ebp+8]
        mov     dword86,192
        add     dword86,[dword85]
        mov     dword87,24
        mov     dword88,[dword86]
        imul    dword88,dword87
        lea     dword89,[ebp+8]
        mov     dword90,[dword89]
        add     dword90,dword88
        mov     dword91,16
        add     dword90,dword91
        push_arg        dword90,4
        call    _vec2f_add
        restore_stack   12
        pop_all
        lea     dword92,[ebp+8]
        mov     dword93,192
        add     dword93,[dword92]
        inc     dword ptr [dword93]
label0004:
        lea     dword94,[ebp-4]
        add     dword ptr [dword94],24
        lea     dword95,[ebp-8]
        add     dword ptr [dword95],24
        jmp     label0001
label0002:
        lea     dword96,[ebp+8]
        mov     dword97,192
        add     dword97,[dword96]
        mov     dword98,[dword97]
        inc     dword ptr [dword97]
        mov     dword99,24
        imul    dword98,dword99
        lea     dword100,[ebp+8]
        mov     dword101,[dword100]
        add     dword101,dword98
        lea     dword102,[ebp+8]
        mov     dword103,[dword102]
        movq    double11,qword ptr [dword103]
        movq    qword ptr [dword101],double11
        movq    double11,qword ptr [dword103+8]
        movq    qword ptr [dword101+8],double11
        movq    double11,qword ptr [dword103+16]
        movq    qword ptr [dword101+16],double11
        destroy_stack_frame
        ret
__clip_on_plain endp

__clip_poligon proc
        create_stack_frame
        push_all
        lea     dword1,dword ptr [__clip_z_far_norm]
        push_arg        dword1,4
        lea     dword2,dword ptr [__clip_z_far_base]
        push_arg        dword2,4
        lea     dword3,[ebp+8]
        push_arg        dword ptr [dword3],4
        lea     dword4,[ebp-196]
        push_arg        dword4,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword5,dword ptr [__clip_z_near_norm]
        push_arg        dword5,4
        lea     dword6,dword ptr [__clip_z_near_base]
        push_arg        dword6,4
        lea     dword7,[ebp-196]
        push_arg        dword7,4
        lea     dword8,[ebp+8]
        push_arg        dword ptr [dword8],4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword9,dword ptr [__clip_plane_left_norm]
        push_arg        dword9,4
        lea     dword10,dword ptr [__clip_plane_left_base]
        push_arg        dword10,4
        lea     dword11,[ebp+8]
        push_arg        dword ptr [dword11],4
        lea     dword12,[ebp-196]
        push_arg        dword12,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword13,dword ptr [__clip_plane_right_norm]
        push_arg        dword13,4
        lea     dword14,dword ptr [__clip_plane_right_base]
        push_arg        dword14,4
        lea     dword15,[ebp-196]
        push_arg        dword15,4
        lea     dword16,[ebp+8]
        push_arg        dword ptr [dword16],4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword17,dword ptr [__clip_plane_top_norm]
        push_arg        dword17,4
        lea     dword18,dword ptr [__clip_plane_top_base]
        push_arg        dword18,4
        lea     dword19,[ebp+8]
        push_arg        dword ptr [dword19],4
        lea     dword20,[ebp-196]
        push_arg        dword20,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword21,dword ptr [__clip_plane_bottom_norm]
        push_arg        dword21,4
        lea     dword22,dword ptr [__clip_plane_bottom_base]
        push_arg        dword22,4
        lea     dword23,[ebp-196]
        push_arg        dword23,4
        lea     dword24,[ebp+8]
        push_arg        dword ptr [dword24],4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        lea     dword25,[ebp+8]
        mov     dword26,192
        add     dword26,[dword25]
        mov     dword27,1
        cmp     [dword26],dword27
        setg    byte1
        movzx   dword28,byte1
        set_retval      dword28
        destroy_stack_frame
        ret
__clip_poligon endp

__transform_to_screen_space proc
        create_stack_frame
        push_all
        lea     dword1,dword ptr [__viewport_matrix]
        push_arg        dword1,4
        lea     dword2,[ebp+12]
        push_arg        dword ptr [dword2],4
        lea     dword3,[ebp-16]
        push_arg        dword3,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        lea     dword4,[ebp-16]
        mov     dword5,12
        add     dword4,dword5
        lea     dword6,dword ptr [___unnamed_float_1]
        movss   float1,dword ptr [dword6]
        divss   float1,dword ptr [dword4]
        lea     dword7,[ebp-20]
        movss   dword ptr [dword7],float1
        lea     dword8,[ebp-16]
        lea     dword9,[ebp-20]
        movss   float2,dword ptr [dword8]
        mulss   float2,dword ptr [dword9]
        cvttss2si       dword10,float2
        lea     dword11,[ebp+8]
        mov     dword12,[dword11]
        mov     [dword12],dword10
        lea     dword13,[ebp-16]
        mov     dword14,4
        add     dword13,dword14
        lea     dword15,[ebp-20]
        movss   float3,dword ptr [dword13]
        mulss   float3,dword ptr [dword15]
        cvttss2si       dword16,float3
        lea     dword17,[ebp+8]
        mov     dword18,4
        add     dword18,[dword17]
        mov     [dword18],dword16
        lea     dword19,[ebp+8]
        mov     dword20,[dword19]
        mov     dword21,0
        cmp     [dword20],dword21
        jl      label0001
        lea     dword22,[ebp+8]
        mov     dword23,[dword22]
        lea     dword24,dword ptr [__width]
        mov     dword25,[dword23]
        cmp     dword25,[dword24]
        jge     label0001
        lea     dword26,[ebp+8]
        mov     dword27,4
        add     dword27,[dword26]
        mov     dword28,0
        cmp     [dword27],dword28
        jl      label0001
        lea     dword29,[ebp+8]
        mov     dword30,4
        add     dword30,[dword29]
        lea     dword31,dword ptr [__height]
        mov     dword32,[dword30]
        cmp     dword32,[dword31]
        jl      label0000
label0001:
        mov     dword33,0
        mov     dword34,0
        mov     [dword33],dword34
label0000:
        destroy_stack_frame
        ret
__transform_to_screen_space endp

__rasterize_polygon_4f proc
        create_stack_frame
        push_all
        lea     dword1,[ebp+8]
        push_arg        dword ptr [dword1],4
        call    __clip_poligon
        restore_stack   4
        pop_all
        read_retval     dword2
        cmp     dword2,0
        jne     label0000
        destroy_stack_frame
        ret
label0000:
        lea     dword3,[ebp+8]
        mov     dword4,192
        add     dword4,[dword3]
        mov     dword5,8
        cmp     [dword4],dword5
        jle     label0001
        mov     dword6,0
        mov     dword7,0
        mov     [dword6],dword7
label0001:
        lea     dword8,[ebp-136]
        mov     dword9,0
        mov     [dword8],dword9
label0002:
label0003:
        lea     dword10,[ebp+8]
        mov     dword11,192
        add     dword11,[dword10]
        lea     dword12,[ebp-136]
        mov     dword13,[dword11]
        cmp     dword13,[dword12]
        jle     label0004
        push_all
        lea     dword14,[ebp+8]
        mov     dword15,[dword14]
        lea     dword16,[ebp-136]
        mov     dword17,24
        mov     dword18,[dword16]
        imul    dword18,dword17
        add     dword15,dword18
        push_arg        dword15,4
        lea     dword19,[ebp-132]
        lea     dword20,[ebp-136]
        mov     dword21,4
        mov     dword22,[dword20]
        sal     dword22,dword21
        add     dword19,dword22
        push_arg        dword19,4
        call    __transform_to_screen_space
        restore_stack   8
        pop_all
        lea     dword23,[ebp-132]
        lea     dword24,[ebp-136]
        mov     dword25,4
        mov     dword26,[dword24]
        sal     dword26,dword25
        add     dword23,dword26
        mov     dword27,8
        add     dword23,dword27
        lea     dword28,[ebp+8]
        mov     dword29,[dword28]
        lea     dword30,[ebp-136]
        mov     dword31,24
        mov     dword32,[dword30]
        imul    dword32,dword31
        add     dword29,dword32
        mov     dword33,16
        add     dword29,dword33
        movq    double1,qword ptr [dword29]
        movq    qword ptr [dword23],double1
        lea     dword34,[ebp-136]
        inc     dword ptr [dword34]
        jmp     label0003
label0004:
        lea     dword35,[ebp-136]
        mov     dword36,2
        mov     [dword35],dword36
label0005:
label0006:
        lea     dword37,[ebp+8]
        mov     dword38,192
        add     dword38,[dword37]
        mov     dword39,1
        mov     dword40,[dword38]
        sub     dword40,dword39
        lea     dword41,[ebp-136]
        cmp     dword40,[dword41]
        jle     label0007
        push_all
        lea     dword42,[ebp-132]
        lea     dword43,[ebp-136]
        mov     dword44,4
        mov     dword45,[dword43]
        sal     dword45,dword44
        add     dword42,dword45
        push_arg        dword42,4
        lea     dword46,[ebp-136]
        mov     dword47,1
        mov     dword48,[dword46]
        sub     dword48,dword47
        mov     dword49,4
        sal     dword48,dword49
        lea     dword50,[ebp-132]
        add     dword50,dword48
        push_arg        dword50,4
        lea     dword51,[ebp-132]
        push_arg        dword51,4
        call    __rasterize_triangle_2i
        restore_stack   12
        pop_all
        lea     dword52,[ebp-136]
        inc     dword ptr [dword52]
        jmp     label0006
label0007:
        destroy_stack_frame
        ret
__rasterize_polygon_4f endp

__transform_to_projection_space proc
        create_stack_frame
        push_all
        lea     dword1,dword ptr [___unnamed_float_1]
        movss   float1,dword ptr [dword1]
        push_arg        float1,4
        lea     dword2,[ebp+12]
        mov     dword3,8
        add     dword3,[dword2]
        push_arg        dword ptr [dword3],4
        lea     dword4,[ebp+12]
        mov     dword5,4
        add     dword5,[dword4]
        push_arg        dword ptr [dword5],4
        lea     dword6,[ebp+12]
        mov     dword7,[dword6]
        push_arg        dword ptr [dword7],4
        lea     dword8,[ebp-16]
        push_arg        dword8,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        lea     dword9,dword ptr [__mvproj_matrix]
        push_arg        dword9,4
        lea     dword10,[ebp-16]
        push_arg        dword10,4
        lea     dword11,[ebp+8]
        push_arg        dword ptr [dword11],4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        destroy_stack_frame
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        create_stack_frame
        push_all
        lea     dword1,[ebp+8]
        push_arg        dword ptr [dword1],4
        lea     dword2,[ebp-196]
        push_arg        dword2,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword3,[ebp-196]
        mov     dword4,16
        add     dword3,dword4
        lea     dword5,[ebp+20]
        mov     dword6,[dword5]
        movq    double1,qword ptr [dword6]
        movq    qword ptr [dword3],double1
        push_all
        lea     dword7,[ebp+12]
        push_arg        dword ptr [dword7],4
        lea     dword8,[ebp-196]
        mov     dword9,24
        add     dword8,dword9
        push_arg        dword8,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword10,[ebp-196]
        mov     dword11,24
        add     dword10,dword11
        mov     dword12,16
        add     dword10,dword12
        lea     dword13,[ebp+24]
        mov     dword14,[dword13]
        movq    double2,qword ptr [dword14]
        movq    qword ptr [dword10],double2
        push_all
        lea     dword15,[ebp+16]
        push_arg        dword ptr [dword15],4
        lea     dword16,[ebp-196]
        mov     dword17,48
        add     dword16,dword17
        push_arg        dword16,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        lea     dword18,[ebp-196]
        mov     dword19,48
        add     dword18,dword19
        mov     dword20,16
        add     dword18,dword20
        lea     dword21,[ebp+28]
        mov     dword22,[dword21]
        movq    double3,qword ptr [dword22]
        movq    qword ptr [dword18],double3
        lea     dword23,[ebp-196]
        mov     dword24,72
        add     dword23,dword24
        lea     dword25,[ebp-196]
        movq    double4,qword ptr [dword25]
        movq    qword ptr [dword23],double4
        movq    double4,qword ptr [dword25+8]
        movq    qword ptr [dword23+8],double4
        movq    double4,qword ptr [dword25+16]
        movq    qword ptr [dword23+16],double4
        lea     dword26,[ebp-196]
        mov     dword27,192
        add     dword26,dword27
        mov     dword28,4
        mov     [dword26],dword28
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
