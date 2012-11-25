
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

_vec2f_add proc
        create_stack_frame
        mov     dword2,[ebp+12]
        mov     dword4,[ebp+16]
        movss   sse1,dword ptr [dword2]
        addss   sse1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        movss   dword ptr [dword6],sse1
        mov     dword8,4
        add     dword8,[ebp+12]
        mov     dword10,4
        add     dword10,[ebp+16]
        movss   sse2,dword ptr [dword8]
        addss   sse2,dword ptr [dword10]
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   dword ptr [dword12],sse2
        destroy_stack_frame
        ret
_vec2f_add endp

_vec2f_subtract proc
        create_stack_frame
        mov     dword2,[ebp+12]
        mov     dword4,[ebp+16]
        movss   sse1,dword ptr [dword2]
        subss   sse1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        movss   dword ptr [dword6],sse1
        mov     dword8,4
        add     dword8,[ebp+12]
        mov     dword10,4
        add     dword10,[ebp+16]
        movss   sse2,dword ptr [dword8]
        subss   sse2,dword ptr [dword10]
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   dword ptr [dword12],sse2
        destroy_stack_frame
        ret
_vec2f_subtract endp

_vec2f_mul proc
        create_stack_frame
        mov     dword2,[ebp+8]
        movss   sse1,dword ptr [dword2]
        mulss   sse1,dword ptr [ebp+12]
        movss   dword ptr [dword2],sse1
        mov     dword5,4
        add     dword5,[ebp+8]
        movss   sse2,dword ptr [dword5]
        mulss   sse2,dword ptr [ebp+12]
        movss   dword ptr [dword5],sse2
        destroy_stack_frame
        ret
_vec2f_mul endp

_vec4f_assign proc
        create_stack_frame
        mov     dword2,[ebp+8]
        movss   sse1,dword ptr [ebp+12]
        movss   dword ptr [dword2],sse1
        mov     dword5,4
        add     dword5,[ebp+8]
        movss   sse2,dword ptr [ebp+16]
        movss   dword ptr [dword5],sse2
        mov     dword8,8
        add     dword8,[ebp+8]
        movss   sse3,dword ptr [ebp+20]
        movss   dword ptr [dword8],sse3
        mov     dword11,12
        add     dword11,[ebp+8]
        movss   sse4,dword ptr [ebp+24]
        movss   dword ptr [dword11],sse4
        destroy_stack_frame
        ret
_vec4f_assign endp

_vec4f_add proc
        create_stack_frame
        mov     dword2,[ebp+12]
        mov     dword4,[ebp+16]
        movss   sse1,dword ptr [dword2]
        addss   sse1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        movss   dword ptr [dword6],sse1
        mov     dword8,4
        add     dword8,[ebp+12]
        mov     dword10,4
        add     dword10,[ebp+16]
        movss   sse2,dword ptr [dword8]
        addss   sse2,dword ptr [dword10]
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   dword ptr [dword12],sse2
        mov     dword14,8
        add     dword14,[ebp+12]
        mov     dword16,8
        add     dword16,[ebp+16]
        movss   sse3,dword ptr [dword14]
        addss   sse3,dword ptr [dword16]
        mov     dword18,8
        add     dword18,[ebp+8]
        movss   dword ptr [dword18],sse3
        mov     dword20,12
        add     dword20,[ebp+12]
        mov     dword22,12
        add     dword22,[ebp+16]
        movss   sse4,dword ptr [dword20]
        addss   sse4,dword ptr [dword22]
        mov     dword24,12
        add     dword24,[ebp+8]
        movss   dword ptr [dword24],sse4
        destroy_stack_frame
        ret
_vec4f_add endp

_vec4f_subtract proc
        create_stack_frame
        mov     dword2,[ebp+12]
        mov     dword4,[ebp+16]
        movss   sse1,dword ptr [dword2]
        subss   sse1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        movss   dword ptr [dword6],sse1
        mov     dword8,4
        add     dword8,[ebp+12]
        mov     dword10,4
        add     dword10,[ebp+16]
        movss   sse2,dword ptr [dword8]
        subss   sse2,dword ptr [dword10]
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   dword ptr [dword12],sse2
        mov     dword14,8
        add     dword14,[ebp+12]
        mov     dword16,8
        add     dword16,[ebp+16]
        movss   sse3,dword ptr [dword14]
        subss   sse3,dword ptr [dword16]
        mov     dword18,8
        add     dword18,[ebp+8]
        movss   dword ptr [dword18],sse3
        mov     dword20,12
        add     dword20,[ebp+12]
        mov     dword22,12
        add     dword22,[ebp+16]
        movss   sse4,dword ptr [dword20]
        subss   sse4,dword ptr [dword22]
        mov     dword24,12
        add     dword24,[ebp+8]
        movss   dword ptr [dword24],sse4
        destroy_stack_frame
        ret
_vec4f_subtract endp

_vec4f_dot proc
        create_stack_frame
        mov     dword2,4
        add     dword2,[ebp+8]
        mov     dword4,4
        add     dword4,[ebp+12]
        movss   sse1,dword ptr [dword2]
        mulss   sse1,dword ptr [dword4]
        mov     dword6,[ebp+8]
        mov     dword8,[ebp+12]
        movss   sse2,dword ptr [dword6]
        mulss   sse2,dword ptr [dword8]
        addss   sse2,sse1
        mov     dword10,8
        add     dword10,[ebp+8]
        mov     dword12,8
        add     dword12,[ebp+12]
        movss   sse3,dword ptr [dword10]
        mulss   sse3,dword ptr [dword12]
        addss   sse2,sse3
        mov     dword14,12
        add     dword14,[ebp+8]
        mov     dword16,12
        add     dword16,[ebp+12]
        movss   sse4,dword ptr [dword14]
        mulss   sse4,dword ptr [dword16]
        addss   sse2,sse4
        set_retval      sse2
        destroy_stack_frame
        ret
_vec4f_dot endp

_vec4f_mul proc
        create_stack_frame
        mov     dword2,[ebp+8]
        movss   sse1,dword ptr [dword2]
        mulss   sse1,dword ptr [ebp+12]
        movss   dword ptr [dword2],sse1
        mov     dword5,4
        add     dword5,[ebp+8]
        movss   sse2,dword ptr [dword5]
        mulss   sse2,dword ptr [ebp+12]
        movss   dword ptr [dword5],sse2
        mov     dword8,8
        add     dword8,[ebp+8]
        movss   sse3,dword ptr [dword8]
        mulss   sse3,dword ptr [ebp+12]
        movss   dword ptr [dword8],sse3
        mov     dword11,12
        add     dword11,[ebp+8]
        movss   sse4,dword ptr [dword11]
        mulss   sse4,dword ptr [ebp+12]
        movss   dword ptr [dword11],sse4
        destroy_stack_frame
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        create_stack_frame
        movss   sse1,dword ptr [ebp+20]
        mulss   sse1,dword ptr [ebp+12]
        movss   dword ptr [ebp-4],sse1
        movss   sse2,dword ptr [ebp-4]
        mulss   sse2,dword ptr [ebp+24]
        movss   dword ptr [ebp-8],sse2
        mov     dword8,[ebp+8]
        movss   sse3,dword ptr [ebp+12]
        divss   sse3,dword ptr [ebp-8]
        movss   dword ptr [dword8],sse3
        mov     dword12,4
        add     dword12,[ebp+8]
        movss   sse4,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword12],sse4
        mov     dword15,8
        add     dword15,[ebp+8]
        movss   sse5,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword15],sse5
        mov     dword18,12
        add     dword18,[ebp+8]
        movss   sse6,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword18],sse6
        mov     dword21,16
        add     dword21,[ebp+8]
        movss   sse7,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword21],sse7
        mov     dword24,20
        add     dword24,[ebp+8]
        movss   sse8,dword ptr [ebp+12]
        divss   sse8,dword ptr [ebp-4]
        movss   dword ptr [dword24],sse8
        mov     dword28,24
        add     dword28,[ebp+8]
        movss   sse9,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword28],sse9
        mov     dword31,28
        add     dword31,[ebp+8]
        movss   sse10,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword31],sse10
        mov     dword34,32
        add     dword34,[ebp+8]
        movss   sse11,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword34],sse11
        mov     dword37,36
        add     dword37,[ebp+8]
        movss   sse12,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword37],sse12
        mov     dword40,40
        add     dword40,[ebp+8]
        movss   sse13,dword ptr [ebp+16]
        subss   sse13,dword ptr [ebp+12]
        movss   sse14,dword ptr [ebp+16]
        divss   sse14,sse13
        movss   dword ptr [dword40],sse14
        mov     dword45,44
        add     dword45,[ebp+8]
        movss   sse15,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword45],sse15
        mov     dword48,48
        add     dword48,[ebp+8]
        movss   sse16,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword48],sse16
        mov     dword51,52
        add     dword51,[ebp+8]
        movss   sse17,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword51],sse17
        mov     dword54,56
        add     dword54,[ebp+8]
        movss   sse18,dword ptr [ebp+12]
        mulss   sse18,dword ptr [ebp+16]
        movss   sse19,dword ptr [ebp+12]
        subss   sse19,dword ptr [ebp+16]
        divss   sse18,sse19
        movss   dword ptr [dword54],sse18
        mov     dword60,60
        add     dword60,[ebp+8]
        movss   sse20,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword60],sse20
        destroy_stack_frame
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        create_stack_frame
        mov     dword2,[ebp+8]
        movss   sse2,dword ptr [ebp+12]
        divss   sse2,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword2],sse2
        mov     dword6,4
        add     dword6,[ebp+8]
        movss   sse3,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword6],sse3
        mov     dword9,8
        add     dword9,[ebp+8]
        movss   sse4,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword9],sse4
        mov     dword12,12
        add     dword12,[ebp+8]
        movss   sse5,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword12],sse5
        mov     dword15,16
        add     dword15,[ebp+8]
        movss   sse6,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword15],sse6
        mov     dword18,20
        add     dword18,[ebp+8]
        movss   sse7,dword ptr [ebp+16]
        xorps   sse7,dword ptr [___unnamed_float_4]
        divss   sse7,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword18],sse7
        mov     dword22,24
        add     dword22,[ebp+8]
        movss   sse9,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword22],sse9
        mov     dword25,28
        add     dword25,[ebp+8]
        movss   sse10,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword25],sse10
        mov     dword28,32
        add     dword28,[ebp+8]
        movss   sse11,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword28],sse11
        mov     dword31,36
        add     dword31,[ebp+8]
        movss   sse12,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword31],sse12
        mov     dword34,40
        add     dword34,[ebp+8]
        movss   sse13,dword ptr [ebp+24]
        subss   sse13,dword ptr [ebp+20]
        movss   dword ptr [dword34],sse13
        mov     dword38,44
        add     dword38,[ebp+8]
        movss   sse14,dword ptr [___unnamed_float_2]
        movss   dword ptr [dword38],sse14
        mov     dword41,48
        add     dword41,[ebp+8]
        movss   sse16,dword ptr [ebp+12]
        divss   sse16,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword41],sse16
        mov     dword45,52
        add     dword45,[ebp+8]
        movss   sse18,dword ptr [ebp+16]
        divss   sse18,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword45],sse18
        mov     dword49,56
        add     dword49,[ebp+8]
        movss   sse19,dword ptr [ebp+20]
        movss   dword ptr [dword49],sse19
        mov     dword52,60
        add     dword52,[ebp+8]
        movss   sse20,dword ptr [___unnamed_float_1]
        movss   dword ptr [dword52],sse20
        destroy_stack_frame
        ret
_matrix4f_make_viewport endp

_matrix4f_transform proc
        create_stack_frame
        mov     dword2,4
        add     dword2,[ebp+12]
        mov     dword4,16
        add     dword4,[ebp+16]
        movss   sse1,dword ptr [dword2]
        mulss   sse1,dword ptr [dword4]
        mov     dword6,[ebp+12]
        mov     dword8,[ebp+16]
        movss   sse2,dword ptr [dword6]
        mulss   sse2,dword ptr [dword8]
        addss   sse2,sse1
        mov     dword10,8
        add     dword10,[ebp+12]
        mov     dword12,32
        add     dword12,[ebp+16]
        movss   sse3,dword ptr [dword10]
        mulss   sse3,dword ptr [dword12]
        addss   sse2,sse3
        mov     dword14,12
        add     dword14,[ebp+12]
        mov     dword16,48
        add     dword16,[ebp+16]
        movss   sse4,dword ptr [dword14]
        mulss   sse4,dword ptr [dword16]
        addss   sse2,sse4
        mov     dword18,[ebp+8]
        movss   dword ptr [dword18],sse2
        mov     dword20,4
        add     dword20,[ebp+16]
        mov     dword22,[ebp+12]
        movss   sse5,dword ptr [dword22]
        mulss   sse5,dword ptr [dword20]
        mov     dword24,4
        add     dword24,[ebp+12]
        mov     dword26,20
        add     dword26,[ebp+16]
        movss   sse6,dword ptr [dword24]
        mulss   sse6,dword ptr [dword26]
        addss   sse5,sse6
        mov     dword28,8
        add     dword28,[ebp+12]
        mov     dword30,36
        add     dword30,[ebp+16]
        movss   sse7,dword ptr [dword28]
        mulss   sse7,dword ptr [dword30]
        addss   sse5,sse7
        mov     dword32,12
        add     dword32,[ebp+12]
        mov     dword34,52
        add     dword34,[ebp+16]
        movss   sse8,dword ptr [dword32]
        mulss   sse8,dword ptr [dword34]
        addss   sse5,sse8
        mov     dword36,4
        add     dword36,[ebp+8]
        movss   dword ptr [dword36],sse5
        mov     dword38,8
        add     dword38,[ebp+16]
        mov     dword40,[ebp+12]
        movss   sse9,dword ptr [dword40]
        mulss   sse9,dword ptr [dword38]
        mov     dword42,4
        add     dword42,[ebp+12]
        mov     dword44,24
        add     dword44,[ebp+16]
        movss   sse10,dword ptr [dword42]
        mulss   sse10,dword ptr [dword44]
        addss   sse9,sse10
        mov     dword46,8
        add     dword46,[ebp+12]
        mov     dword48,40
        add     dword48,[ebp+16]
        movss   sse11,dword ptr [dword46]
        mulss   sse11,dword ptr [dword48]
        addss   sse9,sse11
        mov     dword50,12
        add     dword50,[ebp+12]
        mov     dword52,56
        add     dword52,[ebp+16]
        movss   sse12,dword ptr [dword50]
        mulss   sse12,dword ptr [dword52]
        addss   sse9,sse12
        mov     dword54,8
        add     dword54,[ebp+8]
        movss   dword ptr [dword54],sse9
        mov     dword56,12
        add     dword56,[ebp+16]
        mov     dword58,[ebp+12]
        movss   sse13,dword ptr [dword58]
        mulss   sse13,dword ptr [dword56]
        mov     dword60,4
        add     dword60,[ebp+12]
        mov     dword62,28
        add     dword62,[ebp+16]
        movss   sse14,dword ptr [dword60]
        mulss   sse14,dword ptr [dword62]
        addss   sse13,sse14
        mov     dword64,8
        add     dword64,[ebp+12]
        mov     dword66,44
        add     dword66,[ebp+16]
        movss   sse15,dword ptr [dword64]
        mulss   sse15,dword ptr [dword66]
        addss   sse13,sse15
        mov     dword68,12
        add     dword68,[ebp+12]
        mov     dword70,60
        add     dword70,[ebp+16]
        movss   sse16,dword ptr [dword68]
        mulss   sse16,dword ptr [dword70]
        addss   sse13,sse16
        mov     dword72,12
        add     dword72,[ebp+8]
        movss   dword ptr [dword72],sse13
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
        cvtsi2ss        sse1,dword ptr [ebp+12]
        cvtsi2ss        sse2,dword ptr [ebp+16]
        divss   sse1,sse2
        push_arg        sse1,4
        push_arg        dword ptr [ebp+32],4
        push_arg        dword ptr [ebp+28],4
        push_arg        dword ptr [ebp+24],4
        lea     dword18,dword ptr [__mvproj_matrix]
        push_arg        dword18,4
        call    _matrix4f_make_perspective
        restore_stack   20
        pop_all
        push_all
        push_arg        dword ptr [ebp+28],4
        push_arg        dword ptr [ebp+24],4
        cvtsi2ss        sse3,dword ptr [ebp+16]
        push_arg        sse3,4
        cvtsi2ss        sse4,dword ptr [ebp+12]
        push_arg        sse4,4
        lea     dword23,dword ptr [__viewport_matrix]
        push_arg        dword23,4
        call    _matrix4f_make_viewport
        restore_stack   20
        pop_all
        push_all
        movss   sse5,dword ptr [___unnamed_float_1]
        push_arg        sse5,4
        push_arg        dword ptr [ebp+24],4
        movss   sse6,dword ptr [___unnamed_float_2]
        push_arg        sse6,4
        movss   sse7,dword ptr [___unnamed_float_2]
        push_arg        sse7,4
        lea     dword28,dword ptr [__clip_z_near_base]
        push_arg        dword28,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        movss   sse8,dword ptr [ebp+28]
        comiss  sse8,dword ptr [ebp+24]
        jbe     label0000
        movss   sse9,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-4],sse9
        jmp     label0001
label0000:
        movss   sse10,dword ptr [___unnamed_float_5]
        movss   dword ptr [ebp-4],sse10
label0001:
        push_all
        movss   sse11,dword ptr [___unnamed_float_1]
        push_arg        sse11,4
        push_arg        dword ptr [ebp-4],4
        movss   sse12,dword ptr [___unnamed_float_2]
        push_arg        sse12,4
        movss   sse13,dword ptr [___unnamed_float_2]
        push_arg        sse13,4
        lea     dword39,dword ptr [__clip_z_near_norm]
        push_arg        dword39,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse14,dword ptr [___unnamed_float_1]
        push_arg        sse14,4
        push_arg        dword ptr [ebp+28],4
        movss   sse15,dword ptr [___unnamed_float_2]
        push_arg        sse15,4
        movss   sse16,dword ptr [___unnamed_float_2]
        push_arg        sse16,4
        lea     dword44,dword ptr [__clip_z_far_base]
        push_arg        dword44,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        movss   sse17,dword ptr [ebp+28]
        comiss  sse17,dword ptr [ebp+24]
        jbe     label0002
        movss   sse18,dword ptr [___unnamed_float_5]
        movss   dword ptr [ebp-8],sse18
        jmp     label0003
label0002:
        movss   sse19,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-8],sse19
label0003:
        push_all
        movss   sse20,dword ptr [___unnamed_float_1]
        push_arg        sse20,4
        push_arg        dword ptr [ebp-8],4
        movss   sse21,dword ptr [___unnamed_float_2]
        push_arg        sse21,4
        movss   sse22,dword ptr [___unnamed_float_2]
        push_arg        sse22,4
        lea     dword55,dword ptr [__clip_z_far_norm]
        push_arg        dword55,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse23,dword ptr [___unnamed_float_1]
        push_arg        sse23,4
        movss   sse24,dword ptr [___unnamed_float_2]
        push_arg        sse24,4
        movss   sse25,dword ptr [___unnamed_float_2]
        push_arg        sse25,4
        cvtsi2ss        sse26,dword ptr [ebp+12]
        movss   sse27,dword ptr [___unnamed_float_1]
        divss   sse27,sse26
        movss   sse28,dword ptr [___unnamed_float_5]
        addss   sse28,sse27
        push_arg        sse28,4
        lea     dword62,dword ptr [__clip_plane_left_base]
        push_arg        dword62,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse29,dword ptr [___unnamed_float_1]
        push_arg        sse29,4
        movss   sse30,dword ptr [___unnamed_float_2]
        push_arg        sse30,4
        movss   sse31,dword ptr [___unnamed_float_2]
        push_arg        sse31,4
        movss   sse32,dword ptr [___unnamed_float_1]
        push_arg        sse32,4
        lea     dword67,dword ptr [__clip_plane_left_norm]
        push_arg        dword67,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse33,dword ptr [___unnamed_float_1]
        push_arg        sse33,4
        movss   sse34,dword ptr [___unnamed_float_2]
        push_arg        sse34,4
        movss   sse35,dword ptr [___unnamed_float_2]
        push_arg        sse35,4
        cvtsi2ss        sse36,dword ptr [ebp+12]
        movss   sse37,dword ptr [___unnamed_float_1]
        divss   sse37,sse36
        movss   sse38,dword ptr [___unnamed_float_1]
        subss   sse38,sse37
        push_arg        sse38,4
        lea     dword74,dword ptr [__clip_plane_right_base]
        push_arg        dword74,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse39,dword ptr [___unnamed_float_1]
        push_arg        sse39,4
        movss   sse40,dword ptr [___unnamed_float_2]
        push_arg        sse40,4
        movss   sse41,dword ptr [___unnamed_float_2]
        push_arg        sse41,4
        movss   sse42,dword ptr [___unnamed_float_5]
        push_arg        sse42,4
        lea     dword79,dword ptr [__clip_plane_right_norm]
        push_arg        dword79,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse43,dword ptr [___unnamed_float_1]
        push_arg        sse43,4
        movss   sse44,dword ptr [___unnamed_float_2]
        push_arg        sse44,4
        cvtsi2ss        sse45,dword ptr [ebp+16]
        movss   sse46,dword ptr [___unnamed_float_1]
        divss   sse46,sse45
        movss   sse47,dword ptr [___unnamed_float_5]
        addss   sse47,sse46
        push_arg        sse47,4
        movss   sse48,dword ptr [___unnamed_float_2]
        push_arg        sse48,4
        lea     dword86,dword ptr [__clip_plane_top_base]
        push_arg        dword86,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse49,dword ptr [___unnamed_float_1]
        push_arg        sse49,4
        movss   sse50,dword ptr [___unnamed_float_2]
        push_arg        sse50,4
        movss   sse51,dword ptr [___unnamed_float_1]
        push_arg        sse51,4
        movss   sse52,dword ptr [___unnamed_float_2]
        push_arg        sse52,4
        lea     dword91,dword ptr [__clip_plane_top_norm]
        push_arg        dword91,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse53,dword ptr [___unnamed_float_1]
        push_arg        sse53,4
        movss   sse54,dword ptr [___unnamed_float_2]
        push_arg        sse54,4
        movss   sse55,dword ptr [___unnamed_float_1]
        push_arg        sse55,4
        movss   sse56,dword ptr [___unnamed_float_2]
        push_arg        sse56,4
        lea     dword96,dword ptr [__clip_plane_bottom_base]
        push_arg        dword96,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        push_all
        movss   sse57,dword ptr [___unnamed_float_1]
        push_arg        sse57,4
        movss   sse58,dword ptr [___unnamed_float_2]
        push_arg        sse58,4
        movss   sse59,dword ptr [___unnamed_float_5]
        push_arg        sse59,4
        movss   sse60,dword ptr [___unnamed_float_2]
        push_arg        sse60,4
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
        rep     movsd   dword4,dword5
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
        cvtsi2ss        sse1,dword3
        mulss   sse1,dword ptr [ebp+8]
        cvttss2si       dword5,sse1
        mov     [ebp-4],dword5
        mov     dword9,dword ptr [__texture_height]
        dec     dword9
        cvtsi2ss        sse2,dword9
        mulss   sse2,dword ptr [ebp+12]
        cvttss2si       dword11,sse2
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
        cvtsi2ss        sse1,dword ptr [ebp-40]
        divss   sse1,dword ptr [___unnamed_float_6]
        movss   dword ptr [ebp-44],sse1
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
        cvtsi2ss        sse3,dword ptr [ebp-20]
        mulss   sse3,dword ptr [ebp-44]
        cvtsi2ss        sse4,dword ptr [ebp-32]
        movss   sse5,dword ptr [___unnamed_float_1]
        subss   sse5,dword ptr [ebp-44]
        mulss   sse4,sse5
        addss   sse3,sse4
        cvttss2si       dword57,sse3
        mov     [ebp-20],dword57
        cvtsi2ss        sse6,dword ptr [ebp-24]
        mulss   sse6,dword ptr [ebp-44]
        cvtsi2ss        sse7,dword ptr [ebp-36]
        movss   sse8,dword ptr [___unnamed_float_1]
        subss   sse8,dword ptr [ebp-44]
        mulss   sse7,sse8
        addss   sse6,sse7
        cvttss2si       dword64,sse6
        mov     [ebp-24],dword64
        mov     dword68,[ebp-20]
        sal     dword68,8
        add     dword68,[ebp-24]
        mov     [ebp-16],dword68
        mov     dword72,[ebp-4]
        mov     dword74,[ebp-16]
        mov     [dword72],dword74
label0003:
        movss   sse9,dword ptr [ebp+20]
        addss   sse9,dword ptr [ebp+28]
        movss   dword ptr [ebp+20],sse9
        movss   sse10,dword ptr [ebp+24]
        addss   sse10,dword ptr [ebp+32]
        movss   dword ptr [ebp+24],sse10
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
        movss   sse1,dword ptr [ebp+40]
        xorps   sse1,dword ptr [___unnamed_float_4]
        push_arg        sse1,4
        movss   sse2,dword ptr [ebp+36]
        xorps   sse2,dword ptr [___unnamed_float_4]
        push_arg        sse2,4
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
        movss   sse3,dword ptr [ebp+40]
        xorps   sse3,dword ptr [___unnamed_float_4]
        push_arg        sse3,4
        movss   sse4,dword ptr [ebp+36]
        xorps   sse4,dword ptr [___unnamed_float_4]
        push_arg        sse4,4
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
        movss   sse5,dword ptr [ebp+40]
        xorps   sse5,dword ptr [___unnamed_float_4]
        push_arg        sse5,4
        movss   sse6,dword ptr [ebp+36]
        xorps   sse6,dword ptr [___unnamed_float_4]
        push_arg        sse6,4
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
        movss   sse1,dword ptr [___unnamed_float_2]
        push_arg        sse1,4
        movss   sse2,dword ptr [___unnamed_float_2]
        push_arg        sse2,4
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
        idiv    dword96,dword108
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
        idiv    dword117,dword129
        mov     dword132,[ebp+8]
        add     dword117,[dword132]
        mov     [ebp-12],dword117
        mov     dword135,[ebp+8]
        mov     dword138,[ebp-16]
        sub     dword138,[dword135+4]
        cvtsi2ss        sse3,dword138
        mov     dword140,8
        add     dword140,[ebp+12]
        mov     dword142,8
        add     dword142,[ebp+8]
        movss   sse4,dword ptr [dword140]
        subss   sse4,dword ptr [dword142]
        mulss   sse3,sse4
        mov     dword144,[ebp+12]
        mov     dword147,[ebp+8]
        mov     dword149,[dword144+4]
        sub     dword149,[dword147+4]
        cvtsi2ss        sse5,dword149
        divss   sse3,sse5
        mov     dword151,8
        add     dword151,[ebp+8]
        addss   sse3,dword ptr [dword151]
        movss   dword ptr [ebp-20],sse3
        mov     dword154,[ebp+8]
        mov     dword157,[ebp-16]
        sub     dword157,[dword154+4]
        cvtsi2ss        sse6,dword157
        mov     dword159,8
        add     dword159,[ebp+16]
        mov     dword161,8
        add     dword161,[ebp+8]
        movss   sse7,dword ptr [dword159]
        subss   sse7,dword ptr [dword161]
        mulss   sse6,sse7
        mov     dword163,[ebp+16]
        mov     dword166,[ebp+8]
        mov     dword168,[dword163+4]
        sub     dword168,[dword166+4]
        cvtsi2ss        sse8,dword168
        divss   sse6,sse8
        mov     dword170,8
        add     dword170,[ebp+8]
        addss   sse6,dword ptr [dword170]
        movss   dword ptr [ebp-28],sse6
        mov     dword173,[ebp+8]
        mov     dword176,[ebp-16]
        sub     dword176,[dword173+4]
        cvtsi2ss        sse9,dword176
        mov     dword178,8
        add     dword178,[ebp+12]
        mov     dword181,8
        add     dword181,[ebp+8]
        movss   sse10,dword ptr [dword178+4]
        subss   sse10,dword ptr [dword181+4]
        mulss   sse9,sse10
        mov     dword184,[ebp+12]
        mov     dword187,[ebp+8]
        mov     dword189,[dword184+4]
        sub     dword189,[dword187+4]
        cvtsi2ss        sse11,dword189
        divss   sse9,sse11
        mov     dword191,8
        add     dword191,[ebp+8]
        addss   sse9,dword ptr [dword191+4]
        movss   dword ptr [ebp-24],sse9
        mov     dword195,[ebp+8]
        mov     dword198,[ebp-16]
        sub     dword198,[dword195+4]
        cvtsi2ss        sse12,dword198
        mov     dword200,8
        add     dword200,[ebp+16]
        mov     dword203,8
        add     dword203,[ebp+8]
        movss   sse13,dword ptr [dword200+4]
        subss   sse13,dword ptr [dword203+4]
        mulss   sse12,sse13
        mov     dword206,[ebp+16]
        mov     dword209,[ebp+8]
        mov     dword211,[dword206+4]
        sub     dword211,[dword209+4]
        cvtsi2ss        sse14,dword211
        divss   sse12,sse14
        mov     dword213,8
        add     dword213,[ebp+8]
        addss   sse12,dword ptr [dword213+4]
        movss   dword ptr [ebp-32],sse12
        mov     dword218,[ebp-12]
        sub     dword218,[ebp-8]
        cvtsi2ss        sse15,dword218
        movss   sse16,dword ptr [ebp-28]
        subss   sse16,dword ptr [ebp-20]
        divss   sse16,sse15
        movss   dword ptr [ebp-36],sse16
        mov     dword224,[ebp-12]
        sub     dword224,[ebp-8]
        cvtsi2ss        sse17,dword224
        movss   sse18,dword ptr [ebp-32]
        subss   sse18,dword ptr [ebp-24]
        divss   sse18,sse17
        movss   dword ptr [ebp-40],sse18
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
        idiv    dword244,dword256
        mov     dword259,[ebp+8]
        add     dword244,[dword259]
        mov     [ebp-12],dword244
        mov     dword262,[ebp+12]
        mov     dword265,[ebp+8]
        mov     dword267,[dword262+4]
        sub     dword267,[dword265+4]
        cvtsi2ss        sse19,dword267
        mov     dword269,8
        add     dword269,[ebp+16]
        mov     dword271,8
        add     dword271,[ebp+8]
        movss   sse20,dword ptr [dword269]
        subss   sse20,dword ptr [dword271]
        mulss   sse19,sse20
        mov     dword273,[ebp+16]
        mov     dword276,[ebp+8]
        mov     dword278,[dword273+4]
        sub     dword278,[dword276+4]
        cvtsi2ss        sse21,dword278
        divss   sse19,sse21
        mov     dword280,8
        add     dword280,[ebp+8]
        addss   sse19,dword ptr [dword280]
        movss   dword ptr [ebp-28],sse19
        mov     dword283,[ebp+12]
        mov     dword286,[ebp+8]
        mov     dword288,[dword283+4]
        sub     dword288,[dword286+4]
        cvtsi2ss        sse22,dword288
        mov     dword290,8
        add     dword290,[ebp+16]
        mov     dword293,8
        add     dword293,[ebp+8]
        movss   sse23,dword ptr [dword290+4]
        subss   sse23,dword ptr [dword293+4]
        mulss   sse22,sse23
        mov     dword296,[ebp+16]
        mov     dword299,[ebp+8]
        mov     dword301,[dword296+4]
        sub     dword301,[dword299+4]
        cvtsi2ss        sse24,dword301
        divss   sse22,sse24
        mov     dword303,8
        add     dword303,[ebp+8]
        addss   sse22,dword ptr [dword303+4]
        movss   dword ptr [ebp-32],sse22
        mov     dword307,8
        add     dword307,[ebp+12]
        movss   sse25,dword ptr [ebp-28]
        subss   sse25,dword ptr [dword307]
        mov     dword310,[ebp+12]
        mov     dword312,[ebp-12]
        sub     dword312,[dword310]
        cvtsi2ss        sse26,dword312
        divss   sse25,sse26
        movss   dword ptr [ebp-36],sse25
        mov     dword315,8
        add     dword315,[ebp+12]
        movss   sse27,dword ptr [ebp-32]
        subss   sse27,dword ptr [dword315+4]
        mov     dword319,[ebp+12]
        mov     dword321,[ebp-12]
        sub     dword321,[dword319]
        cvtsi2ss        sse28,dword321
        divss   sse27,sse28
        movss   dword ptr [ebp-40],sse27
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
        idiv    dword352,dword364
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
        idiv    dword373,dword385
        mov     dword388,[ebp+8]
        add     dword373,[dword388]
        mov     [ebp-12],dword373
        mov     dword391,[ebp+12]
        mov     dword394,[ebp-16]
        sub     dword394,[dword391+4]
        cvtsi2ss        sse29,dword394
        mov     dword396,8
        add     dword396,[ebp+16]
        mov     dword398,8
        add     dword398,[ebp+12]
        movss   sse30,dword ptr [dword396]
        subss   sse30,dword ptr [dword398]
        mulss   sse29,sse30
        mov     dword400,[ebp+16]
        mov     dword403,[ebp+12]
        mov     dword405,[dword400+4]
        sub     dword405,[dword403+4]
        cvtsi2ss        sse31,dword405
        divss   sse29,sse31
        mov     dword407,8
        add     dword407,[ebp+12]
        addss   sse29,dword ptr [dword407]
        movss   dword ptr [ebp-20],sse29
        mov     dword410,[ebp+8]
        mov     dword413,[ebp-16]
        sub     dword413,[dword410+4]
        cvtsi2ss        sse32,dword413
        mov     dword415,8
        add     dword415,[ebp+16]
        mov     dword417,8
        add     dword417,[ebp+8]
        movss   sse33,dword ptr [dword415]
        subss   sse33,dword ptr [dword417]
        mulss   sse32,sse33
        mov     dword419,[ebp+16]
        mov     dword422,[ebp+8]
        mov     dword424,[dword419+4]
        sub     dword424,[dword422+4]
        cvtsi2ss        sse34,dword424
        divss   sse32,sse34
        mov     dword426,8
        add     dword426,[ebp+8]
        addss   sse32,dword ptr [dword426]
        movss   dword ptr [ebp-28],sse32
        mov     dword429,[ebp+12]
        mov     dword432,[ebp-16]
        sub     dword432,[dword429+4]
        cvtsi2ss        sse35,dword432
        mov     dword434,8
        add     dword434,[ebp+16]
        mov     dword437,8
        add     dword437,[ebp+12]
        movss   sse36,dword ptr [dword434+4]
        subss   sse36,dword ptr [dword437+4]
        mulss   sse35,sse36
        mov     dword440,[ebp+16]
        mov     dword443,[ebp+12]
        mov     dword445,[dword440+4]
        sub     dword445,[dword443+4]
        cvtsi2ss        sse37,dword445
        divss   sse35,sse37
        mov     dword447,8
        add     dword447,[ebp+12]
        addss   sse35,dword ptr [dword447+4]
        movss   dword ptr [ebp-24],sse35
        mov     dword451,[ebp+8]
        mov     dword454,[ebp-16]
        sub     dword454,[dword451+4]
        cvtsi2ss        sse38,dword454
        mov     dword456,8
        add     dword456,[ebp+16]
        mov     dword459,8
        add     dword459,[ebp+8]
        movss   sse39,dword ptr [dword456+4]
        subss   sse39,dword ptr [dword459+4]
        mulss   sse38,sse39
        mov     dword462,[ebp+16]
        mov     dword465,[ebp+8]
        mov     dword467,[dword462+4]
        sub     dword467,[dword465+4]
        cvtsi2ss        sse40,dword467
        divss   sse38,sse40
        mov     dword469,8
        add     dword469,[ebp+8]
        addss   sse38,dword ptr [dword469+4]
        movss   dword ptr [ebp-32],sse38
        mov     dword474,[ebp-12]
        sub     dword474,[ebp-8]
        cvtsi2ss        sse41,dword474
        movss   sse42,dword ptr [ebp-28]
        subss   sse42,dword ptr [ebp-20]
        divss   sse42,sse41
        movss   dword ptr [ebp-36],sse42
        mov     dword480,[ebp-12]
        sub     dword480,[ebp-8]
        cvtsi2ss        sse43,dword480
        movss   sse44,dword ptr [ebp-32]
        subss   sse44,dword ptr [ebp-24]
        divss   sse44,sse43
        movss   dword ptr [ebp-40],sse44
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
        read_retval     sse1
        movss   dword ptr [ebp-52],sse1
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
        read_retval     sse2
        movss   dword ptr [ebp-56],sse2
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,dword ptr [ebp-52]
        ja      label0003
        mov     dword35,192
        add     dword35,[ebp+8]
        mov     dword36,[dword35]
        inc     dword ptr [dword35]
        imul    dword36,24
        mov     dword39,[ebp+8]
        add     dword39,dword36
        mov     dword41,[ebp-4]
        mov     dword42,dword39
        mov     dword43,dword41
        mov     dword44,6
        rep     movsd   dword42,dword43
label0003:
        movss   sse4,dword ptr [___unnamed_float_2]
        comiss  sse4,dword ptr [ebp-52]
        jae     label0006
        movss   sse5,dword ptr [___unnamed_float_2]
        comiss  sse5,dword ptr [ebp-56]
        ja      label0005
label0006:
        movss   sse6,dword ptr [___unnamed_float_2]
        comiss  sse6,dword ptr [ebp-56]
        ja      label0004
        movss   sse7,dword ptr [___unnamed_float_2]
        comiss  sse7,dword ptr [ebp-52]
        jbe     label0004
label0005:
        push_all
        mov     dword54,[ebp-4]
        push_arg        dword54,4
        push_arg        dword ptr [ebp+16],4
        lea     dword56,[ebp-24]
        push_arg        dword56,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        mov     dword58,[ebp-4]
        push_arg        dword58,4
        mov     dword60,[ebp-8]
        push_arg        dword60,4
        lea     dword61,[ebp-40]
        push_arg        dword61,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword ptr [ebp+20],4
        lea     dword63,[ebp-24]
        push_arg        dword63,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     sse8
        push_all
        push_arg        dword ptr [ebp+20],4
        lea     dword65,[ebp-40]
        push_arg        dword65,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     sse9
        divss   sse8,sse9
        movss   dword ptr [ebp-60],sse8
        push_all
        push_arg        dword ptr [ebp-60],4
        lea     dword68,[ebp-40]
        push_arg        dword68,4
        call    _vec4f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword69,[ebp-40]
        push_arg        dword69,4
        mov     dword71,[ebp-4]
        push_arg        dword71,4
        mov     dword73,192
        add     dword73,[ebp+8]
        mov     dword75,[dword73]
        imul    dword75,24
        mov     dword77,[ebp+8]
        add     dword77,dword75
        push_arg        dword77,4
        call    _vec4f_add
        restore_stack   12
        pop_all
        push_all
        mov     dword79,16
        add     dword79,[ebp-4]
        push_arg        dword79,4
        mov     dword81,16
        add     dword81,[ebp-8]
        push_arg        dword81,4
        lea     dword82,[ebp-48]
        push_arg        dword82,4
        call    _vec2f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword ptr [ebp-60],4
        lea     dword84,[ebp-48]
        push_arg        dword84,4
        call    _vec2f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword85,[ebp-48]
        push_arg        dword85,4
        mov     dword87,16
        add     dword87,[ebp-4]
        push_arg        dword87,4
        mov     dword89,192
        add     dword89,[ebp+8]
        mov     dword91,[dword89]
        imul    dword91,24
        mov     dword93,[ebp+8]
        add     dword93,dword91
        add     dword93,16
        push_arg        dword93,4
        call    _vec2f_add
        restore_stack   12
        pop_all
        mov     dword96,192
        add     dword96,[ebp+8]
        inc     dword ptr [dword96]
label0004:
        add     dword ptr [ebp-4],24
        add     dword ptr [ebp-8],24
        jmp     label0001
label0002:
        mov     dword100,192
        add     dword100,[ebp+8]
        mov     dword101,[dword100]
        inc     dword ptr [dword100]
        imul    dword101,24
        mov     dword104,[ebp+8]
        add     dword104,dword101
        mov     dword106,[ebp+8]
        mov     dword107,dword104
        mov     dword108,dword106
        mov     dword109,6
        rep     movsd   dword107,dword108
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
        push_arg        dword ptr [ebp+8],4
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
        push_arg        dword ptr [ebp+8],4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword9,dword ptr [__clip_plane_left_norm]
        push_arg        dword9,4
        lea     dword10,dword ptr [__clip_plane_left_base]
        push_arg        dword10,4
        push_arg        dword ptr [ebp+8],4
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
        push_arg        dword ptr [ebp+8],4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword17,dword ptr [__clip_plane_top_norm]
        push_arg        dword17,4
        lea     dword18,dword ptr [__clip_plane_top_base]
        push_arg        dword18,4
        push_arg        dword ptr [ebp+8],4
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
        lea     dword1,dword ptr [__viewport_matrix]
        push_arg        dword1,4
        push_arg        dword ptr [ebp+12],4
        lea     dword3,[ebp-16]
        push_arg        dword3,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        movss   sse1,dword ptr [___unnamed_float_1]
        divss   sse1,dword ptr [ebp-4]
        movss   dword ptr [ebp-20],sse1
        movss   sse2,dword ptr [ebp-16]
        mulss   sse2,dword ptr [ebp-20]
        cvttss2si       dword10,sse2
        mov     dword12,[ebp+8]
        mov     [dword12],dword10
        movss   sse3,dword ptr [ebp-12]
        mulss   sse3,dword ptr [ebp-20]
        cvttss2si       dword16,sse3
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
        mov     dword34,[dword29+dword32+16]
        mov     dword35,[dword29+dword32+20]
        mov     [dword23+dword26+8],dword34
        mov     [dword23+dword26+12],dword35
        inc     dword ptr [ebp-136]
        jmp     label0003
label0004:
        mov     dword ptr [ebp-136],2
label0006:
        mov     dword40,192
        add     dword40,[ebp+8]
        mov     dword42,[dword40]
        dec     dword42
        cmp     dword42,[ebp-136]
        jle     label0007
        push_all
        lea     dword44,[ebp-132]
        mov     dword47,[ebp-136]
        sal     dword47,4
        add     dword44,dword47
        push_arg        dword44,4
        mov     dword50,[ebp-136]
        dec     dword50
        sal     dword50,4
        lea     dword52,[ebp-132]
        add     dword52,dword50
        push_arg        dword52,4
        lea     dword53,[ebp-132]
        push_arg        dword53,4
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
        movss   sse1,dword ptr [___unnamed_float_1]
        push_arg        sse1,4
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
        lea     dword9,dword ptr [__mvproj_matrix]
        push_arg        dword9,4
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
        mov     dword7,[dword6]
        mov     dword8,[dword6+4]
        mov     [ebp-180],dword7
        mov     [ebp-176],dword8
        push_all
        push_arg        dword ptr [ebp+12],4
        lea     dword10,[ebp-196]
        add     dword10,24
        push_arg        dword10,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        mov     dword16,[ebp+24]
        mov     dword17,[dword16]
        mov     dword18,[dword16+4]
        mov     [ebp-156],dword17
        mov     [ebp-152],dword18
        push_all
        push_arg        dword ptr [ebp+16],4
        lea     dword20,[ebp-196]
        add     dword20,48
        push_arg        dword20,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        mov     dword26,[ebp+28]
        mov     dword27,[dword26]
        mov     dword28,[dword26+4]
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
        push_all
        lea     dword38,[ebp-196]
        push_arg        dword38,4
        call    __rasterize_polygon_4f
        restore_stack   4
        pop_all
        destroy_stack_frame
        ret
_rasterizer_triangle3f endp

end
