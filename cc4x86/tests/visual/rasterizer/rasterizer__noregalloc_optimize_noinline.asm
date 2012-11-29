
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
        mov     dword16,[ebp+16]
        mov     dword15,[ebp+12]
        mov     dword14,[ebp+8]
        movss   sse1,dword ptr [dword15]
        addss   sse1,dword ptr [dword16]
        movss   dword ptr [dword14],sse1
        movss   sse2,dword ptr [dword15+4]
        addss   sse2,dword ptr [dword16+4]
        movss   dword ptr [dword14+4],sse2
        destroy_stack_frame
        ret
_vec2f_add endp

_vec2f_subtract proc
        create_stack_frame
        mov     dword16,[ebp+16]
        mov     dword15,[ebp+12]
        mov     dword14,[ebp+8]
        movss   sse1,dword ptr [dword15]
        subss   sse1,dword ptr [dword16]
        movss   dword ptr [dword14],sse1
        movss   sse2,dword ptr [dword15+4]
        subss   sse2,dword ptr [dword16+4]
        movss   dword ptr [dword14+4],sse2
        destroy_stack_frame
        ret
_vec2f_subtract endp

_vec2f_mul proc
        create_stack_frame
        movss   sse4,dword ptr [ebp+12]
        mov     dword8,[ebp+8]
        movss   sse1,dword ptr [dword8]
        mulss   sse1,sse4
        movss   dword ptr [dword8],sse1
        movss   sse2,dword ptr [dword8+4]
        mulss   sse2,sse4
        movss   dword ptr [dword8+4],sse2
        destroy_stack_frame
        ret
_vec2f_mul endp

_vec4f_assign proc
        create_stack_frame
        movss   sse9,dword ptr [ebp+24]
        movss   sse8,dword ptr [ebp+20]
        movss   sse7,dword ptr [ebp+16]
        movss   sse6,dword ptr [ebp+12]
        mov     dword14,[ebp+8]
        movss   dword ptr [dword14],sse6
        movss   dword ptr [dword14+4],sse7
        movss   dword ptr [dword14+8],sse8
        movss   dword ptr [dword14+12],sse9
        destroy_stack_frame
        ret
_vec4f_assign endp

_vec4f_add proc
        create_stack_frame
        mov     dword28,[ebp+16]
        mov     dword27,[ebp+12]
        mov     dword26,[ebp+8]
        movss   sse1,dword ptr [dword27]
        addss   sse1,dword ptr [dword28]
        movss   dword ptr [dword26],sse1
        movss   sse2,dword ptr [dword27+4]
        addss   sse2,dword ptr [dword28+4]
        movss   dword ptr [dword26+4],sse2
        movss   sse3,dword ptr [dword27+8]
        addss   sse3,dword ptr [dword28+8]
        movss   dword ptr [dword26+8],sse3
        movss   sse4,dword ptr [dword27+12]
        addss   sse4,dword ptr [dword28+12]
        movss   dword ptr [dword26+12],sse4
        destroy_stack_frame
        ret
_vec4f_add endp

_vec4f_subtract proc
        create_stack_frame
        mov     dword28,[ebp+16]
        mov     dword27,[ebp+12]
        mov     dword26,[ebp+8]
        movss   sse1,dword ptr [dword27]
        subss   sse1,dword ptr [dword28]
        movss   dword ptr [dword26],sse1
        movss   sse2,dword ptr [dword27+4]
        subss   sse2,dword ptr [dword28+4]
        movss   dword ptr [dword26+4],sse2
        movss   sse3,dword ptr [dword27+8]
        subss   sse3,dword ptr [dword28+8]
        movss   dword ptr [dword26+8],sse3
        movss   sse4,dword ptr [dword27+12]
        subss   sse4,dword ptr [dword28+12]
        movss   dword ptr [dword26+12],sse4
        destroy_stack_frame
        ret
_vec4f_subtract endp

_vec4f_dot proc
        create_stack_frame
        mov     dword19,[ebp+12]
        mov     dword18,[ebp+8]
        movss   sse1,dword ptr [dword18+4]
        mulss   sse1,dword ptr [dword19+4]
        movss   sse2,dword ptr [dword18]
        mulss   sse2,dword ptr [dword19]
        addss   sse2,sse1
        movss   sse3,dword ptr [dword18+8]
        mulss   sse3,dword ptr [dword19+8]
        addss   sse2,sse3
        movss   sse4,dword ptr [dword18+12]
        mulss   sse4,dword ptr [dword19+12]
        addss   sse2,sse4
        set_retval      sse2
        destroy_stack_frame
        ret
_vec4f_dot endp

_vec4f_mul proc
        create_stack_frame
        movss   sse6,dword ptr [ebp+12]
        mov     dword14,[ebp+8]
        movss   sse1,dword ptr [dword14]
        mulss   sse1,sse6
        movss   dword ptr [dword14],sse1
        movss   sse2,dword ptr [dword14+4]
        mulss   sse2,sse6
        movss   dword ptr [dword14+4],sse2
        movss   sse3,dword ptr [dword14+8]
        mulss   sse3,sse6
        movss   dword ptr [dword14+8],sse3
        movss   sse4,dword ptr [dword14+12]
        mulss   sse4,sse6
        movss   dword ptr [dword14+12],sse4
        destroy_stack_frame
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        create_stack_frame
        movss   sse27,dword ptr [ebp+24]
        movss   sse26,dword ptr [ebp+20]
        movss   sse25,dword ptr [ebp+16]
        movss   sse24,dword ptr [ebp+12]
        mov     dword63,[ebp+8]
        movss   sse1,sse26
        mulss   sse1,sse24
        movss   sse2,sse1
        mulss   sse2,sse27
        movss   sse3,sse24
        divss   sse3,sse2
        movss   dword ptr [dword63],sse3
        mov     dword ptr [dword63+4],0
        mov     dword ptr [dword63+8],0
        mov     dword ptr [dword63+12],0
        mov     dword ptr [dword63+16],0
        movss   sse8,sse24
        divss   sse8,sse1
        movss   dword ptr [dword63+20],sse8
        mov     dword ptr [dword63+24],0
        mov     dword ptr [dword63+28],0
        mov     dword ptr [dword63+32],0
        mov     dword ptr [dword63+36],0
        movss   sse13,sse25
        subss   sse13,sse24
        movss   sse14,sse25
        divss   sse14,sse13
        movss   dword ptr [dword63+40],sse14
        mov     dword ptr [dword63+44],1065353216
        mov     dword ptr [dword63+48],0
        mov     dword ptr [dword63+52],0
        movss   sse18,sse24
        mulss   sse18,sse25
        movss   sse19,sse24
        subss   sse19,sse25
        divss   sse18,sse19
        movss   dword ptr [dword63+56],sse18
        mov     dword ptr [dword63+60],0
        destroy_stack_frame
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        create_stack_frame
        movss   sse25,dword ptr [ebp+24]
        movss   sse24,dword ptr [ebp+20]
        movss   sse23,dword ptr [ebp+16]
        movss   sse22,dword ptr [ebp+12]
        mov     dword55,[ebp+8]
        movss   sse2,sse22
        mulss   sse2,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword55],sse2
        mov     dword ptr [dword55+4],0
        mov     dword ptr [dword55+8],0
        mov     dword ptr [dword55+12],0
        mov     dword ptr [dword55+16],0
        movss   sse7,sse23
        xorps   sse7,dword ptr [___unnamed_float4_4]
        mulss   sse7,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword55+20],sse7
        mov     dword ptr [dword55+24],0
        mov     dword ptr [dword55+28],0
        mov     dword ptr [dword55+32],0
        mov     dword ptr [dword55+36],0
        movss   sse13,sse25
        subss   sse13,sse24
        movss   dword ptr [dword55+40],sse13
        mov     dword ptr [dword55+44],0
        movss   sse16,sse22
        mulss   sse16,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword55+48],sse16
        movss   sse18,sse23
        mulss   sse18,dword ptr [___unnamed_float_3]
        movss   dword ptr [dword55+52],sse18
        movss   dword ptr [dword55+56],sse24
        mov     dword ptr [dword55+60],1065353216
        destroy_stack_frame
        ret
_matrix4f_make_viewport endp

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
        movss   sse66,dword ptr [ebp+32]
        movss   sse65,dword ptr [ebp+28]
        movss   sse64,dword ptr [ebp+24]
        mov     dword106,[ebp+20]
        mov     dword105,[ebp+16]
        mov     dword104,[ebp+12]
        mov     dword103,[ebp+8]
        mov     dword ptr [__dbgprintf],dword103
        mov     dword ptr [__width],dword104
        mov     dword ptr [__height],dword105
        mov     dword ptr [__pitch],dword106
        push_all
        cvtsi2ss        sse1,dword104
        cvtsi2ss        sse2,dword105
        divss   sse1,sse2
        push_arg        sse1,4
        push_arg        sse66,4
        push_arg        sse65,4
        push_arg        sse64,4
        lea     dword18,dword ptr [__mvproj_matrix]
        push_arg        dword18,4
        call    _matrix4f_make_perspective
        restore_stack   20
        pop_all
        push_all
        push_arg        sse65,4
        push_arg        sse64,4
        cvtsi2ss        sse3,dword105
        push_arg        sse3,4
        cvtsi2ss        sse4,dword104
        push_arg        sse4,4
        lea     dword23,dword ptr [__viewport_matrix]
        push_arg        dword23,4
        call    _matrix4f_make_viewport
        restore_stack   20
        pop_all
        push_all
        movss   sse5,dword ptr [___unnamed_float_1]
        push_arg        sse5,4
        push_arg        sse64,4
        movss   sse6,dword ptr [___unnamed_float_2]
        push_arg        sse6,4
        movss   sse7,dword ptr [___unnamed_float_2]
        push_arg        sse7,4
        lea     dword28,dword ptr [__clip_z_near_base]
        push_arg        dword28,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        comiss  sse65,sse64
        jbe     label0000
        movss   sse62,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   sse62,dword ptr [___unnamed_float_5]
label0001:
        push_all
        movss   sse11,dword ptr [___unnamed_float_1]
        push_arg        sse11,4
        push_arg        sse62,4
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
        push_arg        sse65,4
        movss   sse15,dword ptr [___unnamed_float_2]
        push_arg        sse15,4
        movss   sse16,dword ptr [___unnamed_float_2]
        push_arg        sse16,4
        lea     dword44,dword ptr [__clip_z_far_base]
        push_arg        dword44,4
        call    _vec4f_assign
        restore_stack   20
        pop_all
        comiss  sse65,sse64
        jbe     label0002
        movss   sse63,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   sse63,dword ptr [___unnamed_float_1]
label0003:
        push_all
        movss   sse20,dword ptr [___unnamed_float_1]
        push_arg        sse20,4
        push_arg        sse63,4
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
        cvtsi2ss        sse26,dword104
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
        cvtsi2ss        sse36,dword104
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
        cvtsi2ss        sse45,dword105
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

__tex2d proc
        create_stack_frame
        movss   sse5,dword ptr [ebp+12]
        movss   sse4,dword ptr [ebp+8]
        mov     dword3,dword ptr [__texture_width]
        dec     dword3
        cvtsi2ss        sse1,dword3
        mulss   sse1,sse4
        cvttss2si       dword5,sse1
        mov     dword9,dword ptr [__texture_height]
        dec     dword9
        cvtsi2ss        sse2,dword9
        mulss   sse2,sse5
        cvttss2si       dword11,sse2
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
        movss   sse16,dword ptr [ebp+32]
        movss   sse15,dword ptr [ebp+28]
        movss   sse14,dword ptr [ebp+24]
        movss   sse13,dword ptr [ebp+20]
        mov     dword95,[ebp+16]
        mov     dword94,[ebp+12]
        mov     dword93,[ebp+8]
        mov     dword3,dword ptr [__pitch]
        imul    dword3,dword95
        add     dword3,dword ptr [__videomem]
        mov     dword7,dword93
        sal     dword7,2
        add     dword3,dword7
        mov     dword83,dword3
        mov     dword11,dword94
        sal     dword11,2
        add     dword11,dword83
        mov     dword15,dword93
        sal     dword15,2
        sub     dword11,dword15
label0000:
        push_all
        push_arg        sse14,4
        push_arg        sse13,4
        call    __tex2d
        restore_stack   8
        pop_all
        read_retval     dword19
        mov     dword23,dword19
        sar     dword23,24
        and     dword23,255
        je      label0003
        cvtsi2ss        sse1,dword23
        mulss   sse1,dword ptr [___unnamed_float_6]
        mov     dword33,[dword83]
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
        mov     [dword83],dword68
label0003:
        movss   sse9,sse13
        addss   sse9,sse15
        movss   sse13,sse9
        movss   sse10,sse14
        addss   sse10,sse16
        movss   sse14,sse10
        add     dword83,4
        cmp     dword83,dword11
        jl      label0000
        destroy_stack_frame
        ret
__rasterize_horiz_line endp

__rasterize_horiz_line__unordered proc
        create_stack_frame
        movss   sse7,dword ptr [ebp+40]
        movss   sse6,dword ptr [ebp+36]
        movss   sse5,dword ptr [ebp+32]
        movss   sse4,dword ptr [ebp+28]
        movss   sse3,dword ptr [ebp+24]
        movss   sse2,dword ptr [ebp+20]
        mov     dword21,[ebp+16]
        mov     dword20,[ebp+12]
        mov     dword19,[ebp+8]
        cmp     dword19,dword20
        jg      label0000
        push_all
        push_arg        sse7,4
        push_arg        sse6,4
        push_arg        sse3,4
        push_arg        sse2,4
        push_arg        dword21,4
        push_arg        dword20,4
        push_arg        dword19,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0001
label0000:
        push_all
        push_arg        sse7,4
        push_arg        sse6,4
        push_arg        sse5,4
        push_arg        sse4,4
        push_arg        dword21,4
        push_arg        dword19,4
        push_arg        dword20,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0001:
        destroy_stack_frame
        ret
__rasterize_horiz_line__unordered endp

__rasterize_triangle_1i proc
        create_stack_frame
        movss   sse9,dword ptr [ebp+40]
        movss   sse8,dword ptr [ebp+36]
        mov     dword77,[ebp+32]
        mov     dword76,[ebp+28]
        mov     dword75,[ebp+24]
        mov     dword74,[ebp+20]
        mov     dword73,[ebp+16]
        mov     dword72,[ebp+12]
        mov     dword71,[ebp+8]
        cmp     dword71,dword72
        jge     label0000
        cmp     dword73,dword72
        jle     label0001
        push_all
        push_arg        sse9,4
        push_arg        sse8,4
        push_arg        dword ptr [dword75+4],4
        push_arg        dword ptr [dword75],4
        push_arg        dword74,4
        push_arg        dword73,4
        push_arg        dword71,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0002
label0001:
        cmp     dword73,dword71
        jge     label0003
        push_all
        push_arg        sse9,4
        push_arg        sse8,4
        push_arg        dword ptr [dword77+4],4
        push_arg        dword ptr [dword77],4
        push_arg        dword74,4
        push_arg        dword72,4
        push_arg        dword73,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0004
label0003:
        push_all
        push_arg        sse9,4
        push_arg        sse8,4
        push_arg        dword ptr [dword75+4],4
        push_arg        dword ptr [dword75],4
        push_arg        dword74,4
        push_arg        dword72,4
        push_arg        dword71,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
label0004:
label0002:
        jmp     label0005
label0000:
        cmp     dword73,dword72
        jge     label0006
        push_all
        movss   sse1,sse9
        xorps   sse1,dword ptr [___unnamed_float4_4]
        push_arg        sse1,4
        movss   sse2,sse8
        xorps   sse2,dword ptr [___unnamed_float4_4]
        push_arg        sse2,4
        push_arg        dword ptr [dword77+4],4
        push_arg        dword ptr [dword77],4
        push_arg        dword74,4
        push_arg        dword71,4
        push_arg        dword73,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0007
label0006:
        cmp     dword73,dword71
        jle     label0008
        push_all
        movss   sse3,sse9
        xorps   sse3,dword ptr [___unnamed_float4_4]
        push_arg        sse3,4
        movss   sse4,sse8
        xorps   sse4,dword ptr [___unnamed_float4_4]
        push_arg        sse4,4
        push_arg        dword ptr [dword76+4],4
        push_arg        dword ptr [dword76],4
        push_arg        dword74,4
        push_arg        dword73,4
        push_arg        dword72,4
        call    __rasterize_horiz_line
        restore_stack   28
        pop_all
        jmp     label0009
label0008:
        push_all
        movss   sse5,sse9
        xorps   sse5,dword ptr [___unnamed_float4_4]
        push_arg        sse5,4
        movss   sse6,sse8
        xorps   sse6,dword ptr [___unnamed_float4_4]
        push_arg        sse6,4
        push_arg        dword ptr [dword76+4],4
        push_arg        dword ptr [dword76],4
        push_arg        dword74,4
        push_arg        dword71,4
        push_arg        dword72,4
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
        mov     dword501,[ebp+16]
        mov     dword500,[ebp+12]
        mov     dword499,[ebp+8]
        mov     dword7,[dword499+4]
        cmp     dword7,[dword500+4]
        jle     label0000
        mov     dword495,dword499
        mov     dword499,dword500
        mov     dword500,dword495
label0000:
        mov     dword23,[dword499+4]
        cmp     dword23,[dword501+4]
        jle     label0001
        mov     dword495,dword499
        mov     dword499,dword501
        mov     dword501,dword495
label0001:
        mov     dword39,[dword500+4]
        cmp     dword39,[dword501+4]
        jle     label0002
        mov     dword495,dword500
        mov     dword500,dword501
        mov     dword501,dword495
label0002:
        mov     dword55,[dword499+4]
        cmp     dword55,[dword501+4]
        jne     label0003
        cmp     dword ptr [dword499+4],0
        jl      label0004
        mov     dword64,[dword499+4]
        cmp     dword64,dword ptr [__height]
        jge     label0004
        push_all
        movss   sse1,dword ptr [___unnamed_float_2]
        push_arg        sse1,4
        movss   sse2,dword ptr [___unnamed_float_2]
        push_arg        sse2,4
        mov     dword68,8
        add     dword68,dword501
        push_arg        dword68,4
        mov     dword70,8
        add     dword70,dword500
        push_arg        dword70,4
        mov     dword72,8
        add     dword72,dword499
        push_arg        dword72,4
        push_arg        dword ptr [dword499+4],4
        push_arg        dword ptr [dword501],4
        push_arg        dword ptr [dword500],4
        push_arg        dword ptr [dword499],4
        call    __rasterize_triangle_1i
        restore_stack   36
        pop_all
label0004:
        destroy_stack_frame
        ret
label0003:
        mov     dword86,[dword499+4]
        mov     dword498,dword86
label0006:
        mov     dword91,[dword500+4]
        cmp     dword91,dword498
        jle     label0007
        mov     dword96,dword498
        sub     dword96,[dword499+4]
        mov     dword101,[dword500]
        sub     dword101,[dword499]
        imul    dword96,dword101
        mov     dword108,[dword500+4]
        sub     dword108,[dword499+4]
        cdq     dword109,dword96
        idiv    dword96,dword108
        add     dword96,[dword499]
        mov     dword117,dword498
        sub     dword117,[dword499+4]
        mov     dword122,[dword501]
        sub     dword122,[dword499]
        imul    dword117,dword122
        mov     dword129,[dword501+4]
        sub     dword129,[dword499+4]
        cdq     dword130,dword117
        idiv    dword117,dword129
        add     dword117,[dword499]
        mov     dword138,dword498
        sub     dword138,[dword499+4]
        cvtsi2ss        sse3,dword138
        movss   sse4,dword ptr [dword500+8]
        subss   sse4,dword ptr [dword499+8]
        mulss   sse3,sse4
        mov     dword149,[dword500+4]
        sub     dword149,[dword499+4]
        cvtsi2ss        sse5,dword149
        divss   sse3,sse5
        addss   sse3,dword ptr [dword499+8]
        mov     dword157,dword498
        sub     dword157,[dword499+4]
        cvtsi2ss        sse6,dword157
        movss   sse7,dword ptr [dword501+8]
        subss   sse7,dword ptr [dword499+8]
        mulss   sse6,sse7
        mov     dword168,[dword501+4]
        sub     dword168,[dword499+4]
        cvtsi2ss        sse8,dword168
        divss   sse6,sse8
        addss   sse6,dword ptr [dword499+8]
        mov     dword176,dword498
        sub     dword176,[dword499+4]
        cvtsi2ss        sse9,dword176
        movss   sse10,dword ptr [dword500+12]
        subss   sse10,dword ptr [dword499+12]
        mulss   sse9,sse10
        mov     dword189,[dword500+4]
        sub     dword189,[dword499+4]
        cvtsi2ss        sse11,dword189
        divss   sse9,sse11
        addss   sse9,dword ptr [dword499+12]
        mov     dword198,dword498
        sub     dword198,[dword499+4]
        cvtsi2ss        sse12,dword198
        movss   sse13,dword ptr [dword501+12]
        subss   sse13,dword ptr [dword499+12]
        mulss   sse12,sse13
        mov     dword211,[dword501+4]
        sub     dword211,[dword499+4]
        cvtsi2ss        sse14,dword211
        divss   sse12,sse14
        addss   sse12,dword ptr [dword499+12]
        mov     dword218,dword117
        sub     dword218,dword96
        cvtsi2ss        sse15,dword218
        movss   sse16,sse6
        subss   sse16,sse3
        divss   sse16,sse15
        mov     dword224,dword117
        sub     dword224,dword96
        cvtsi2ss        sse17,dword224
        movss   sse18,sse12
        subss   sse18,sse9
        divss   sse18,sse17
        push_all
        push_arg        sse18,4
        push_arg        sse16,4
        push_arg        sse12,4
        push_arg        sse6,4
        push_arg        sse9,4
        push_arg        sse3,4
        push_arg        dword498,4
        push_arg        dword117,4
        push_arg        dword96,4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        inc     dword498
        jmp     label0006
label0007:
        mov     dword244,[dword500+4]
        sub     dword244,[dword499+4]
        mov     dword249,[dword501]
        sub     dword249,[dword499]
        imul    dword244,dword249
        mov     dword256,[dword501+4]
        sub     dword256,[dword499+4]
        cdq     dword257,dword244
        idiv    dword244,dword256
        add     dword244,[dword499]
        mov     dword267,[dword500+4]
        sub     dword267,[dword499+4]
        cvtsi2ss        sse19,dword267
        movss   sse20,dword ptr [dword501+8]
        subss   sse20,dword ptr [dword499+8]
        mulss   sse19,sse20
        mov     dword278,[dword501+4]
        sub     dword278,[dword499+4]
        cvtsi2ss        sse21,dword278
        divss   sse19,sse21
        addss   sse19,dword ptr [dword499+8]
        mov     dword288,[dword500+4]
        sub     dword288,[dword499+4]
        cvtsi2ss        sse22,dword288
        movss   sse23,dword ptr [dword501+12]
        subss   sse23,dword ptr [dword499+12]
        mulss   sse22,sse23
        mov     dword301,[dword501+4]
        sub     dword301,[dword499+4]
        cvtsi2ss        sse24,dword301
        divss   sse22,sse24
        addss   sse22,dword ptr [dword499+12]
        movss   sse25,sse19
        subss   sse25,dword ptr [dword500+8]
        mov     dword312,dword244
        sub     dword312,[dword500]
        cvtsi2ss        sse26,dword312
        divss   sse25,sse26
        movss   sse27,sse22
        subss   sse27,dword ptr [dword500+12]
        mov     dword321,dword244
        sub     dword321,[dword500]
        cvtsi2ss        sse28,dword321
        divss   sse27,sse28
        push_all
        push_arg        sse27,4
        push_arg        sse25,4
        push_arg        dword ptr [dword500+12],4
        push_arg        dword ptr [dword500+8],4
        push_arg        sse22,4
        push_arg        sse19,4
        push_arg        dword ptr [dword500+4],4
        push_arg        dword ptr [dword500],4
        push_arg        dword244,4
        call    __rasterize_horiz_line__unordered
        restore_stack   36
        pop_all
        mov     dword341,1
        add     dword341,[dword500+4]
        mov     dword498,dword341
label0009:
        mov     dword347,[dword501+4]
        cmp     dword347,dword498
        jle     label000a
        mov     dword352,dword498
        sub     dword352,[dword500+4]
        mov     dword357,[dword501]
        sub     dword357,[dword500]
        imul    dword352,dword357
        mov     dword364,[dword501+4]
        sub     dword364,[dword500+4]
        cdq     dword365,dword352
        idiv    dword352,dword364
        add     dword352,[dword500]
        mov     dword373,dword498
        sub     dword373,[dword499+4]
        mov     dword378,[dword501]
        sub     dword378,[dword499]
        imul    dword373,dword378
        mov     dword385,[dword501+4]
        sub     dword385,[dword499+4]
        cdq     dword386,dword373
        idiv    dword373,dword385
        add     dword373,[dword499]
        mov     dword394,dword498
        sub     dword394,[dword500+4]
        cvtsi2ss        sse29,dword394
        movss   sse30,dword ptr [dword501+8]
        subss   sse30,dword ptr [dword500+8]
        mulss   sse29,sse30
        mov     dword405,[dword501+4]
        sub     dword405,[dword500+4]
        cvtsi2ss        sse31,dword405
        divss   sse29,sse31
        addss   sse29,dword ptr [dword500+8]
        mov     dword413,dword498
        sub     dword413,[dword499+4]
        cvtsi2ss        sse32,dword413
        movss   sse33,dword ptr [dword501+8]
        subss   sse33,dword ptr [dword499+8]
        mulss   sse32,sse33
        mov     dword424,[dword501+4]
        sub     dword424,[dword499+4]
        cvtsi2ss        sse34,dword424
        divss   sse32,sse34
        addss   sse32,dword ptr [dword499+8]
        mov     dword432,dword498
        sub     dword432,[dword500+4]
        cvtsi2ss        sse35,dword432
        movss   sse36,dword ptr [dword501+12]
        subss   sse36,dword ptr [dword500+12]
        mulss   sse35,sse36
        mov     dword445,[dword501+4]
        sub     dword445,[dword500+4]
        cvtsi2ss        sse37,dword445
        divss   sse35,sse37
        addss   sse35,dword ptr [dword500+12]
        mov     dword454,dword498
        sub     dword454,[dword499+4]
        cvtsi2ss        sse38,dword454
        movss   sse39,dword ptr [dword501+12]
        subss   sse39,dword ptr [dword499+12]
        mulss   sse38,sse39
        mov     dword467,[dword501+4]
        sub     dword467,[dword499+4]
        cvtsi2ss        sse40,dword467
        divss   sse38,sse40
        addss   sse38,dword ptr [dword499+12]
        mov     dword474,dword373
        sub     dword474,dword352
        cvtsi2ss        sse41,dword474
        movss   sse42,sse32
        subss   sse42,sse29
        divss   sse42,sse41
        mov     dword480,dword373
        sub     dword480,dword352
        cvtsi2ss        sse43,dword480
        movss   sse44,sse38
        subss   sse44,sse35
        divss   sse44,sse43
        push_all
        push_arg        sse44,4
        push_arg        sse42,4
        push_arg        sse38,4
        push_arg        sse32,4
        push_arg        sse35,4
        push_arg        sse29,4
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
        mov     dword110,[ebp+20]
        mov     dword109,[ebp+16]
        mov     dword108,[ebp+12]
        mov     dword107,[ebp+8]
        mov     dword ptr [dword107+192],0
        mov     dword105,dword108
        mov     dword8,dword108
        add     dword8,24
        mov     dword106,dword8
label0001:
        mov     dword14,[dword108+192]
        imul    dword14,24
        mov     dword16,dword108
        add     dword16,dword14
        cmp     dword16,dword106
        jle     label0002
        push_all
        push_arg        dword109,4
        push_arg        dword105,4
        lea     dword21,[ebp-24]
        push_arg        dword21,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword110,4
        lea     dword23,[ebp-24]
        push_arg        dword23,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     sse1
        push_all
        push_arg        dword109,4
        push_arg        dword106,4
        lea     dword28,[ebp-24]
        push_arg        dword28,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword110,4
        lea     dword30,[ebp-24]
        push_arg        dword30,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     sse2
        movss   sse3,dword ptr [___unnamed_float_2]
        comiss  sse3,sse1
        ja      label0003
        mov     dword36,[dword107+192]
        inc     dword ptr [dword107+192]
        imul    dword36,24
        movq    sse4,qword ptr [dword105]
        movq    qword ptr [dword107+dword36],sse4
        movq    sse4,qword ptr [dword105+8]
        movq    qword ptr [dword107+dword36+8],sse4
        movq    sse4,qword ptr [dword105+16]
        movq    qword ptr [dword107+dword36+16],sse4
label0003:
        movss   sse5,dword ptr [___unnamed_float_2]
        comiss  sse5,sse1
        jae     label0006
        movss   sse6,dword ptr [___unnamed_float_2]
        comiss  sse6,sse2
        ja      label0005
label0006:
        movss   sse7,dword ptr [___unnamed_float_2]
        comiss  sse7,sse2
        ja      label0004
        movss   sse8,dword ptr [___unnamed_float_2]
        comiss  sse8,sse1
        jbe     label0004
label0005:
        push_all
        push_arg        dword105,4
        push_arg        dword109,4
        lea     dword53,[ebp-24]
        push_arg        dword53,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword105,4
        push_arg        dword106,4
        lea     dword58,[ebp-40]
        push_arg        dword58,4
        call    _vec4f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        dword110,4
        lea     dword60,[ebp-24]
        push_arg        dword60,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     sse9
        push_all
        push_arg        dword110,4
        lea     dword62,[ebp-40]
        push_arg        dword62,4
        call    _vec4f_dot
        restore_stack   8
        pop_all
        read_retval     sse10
        divss   sse9,sse10
        push_all
        push_arg        sse9,4
        lea     dword65,[ebp-40]
        push_arg        dword65,4
        call    _vec4f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword66,[ebp-40]
        push_arg        dword66,4
        push_arg        dword105,4
        mov     dword72,[dword107+192]
        imul    dword72,24
        mov     dword74,dword107
        add     dword74,dword72
        push_arg        dword74,4
        call    _vec4f_add
        restore_stack   12
        pop_all
        push_all
        mov     dword76,16
        add     dword76,dword105
        push_arg        dword76,4
        mov     dword78,16
        add     dword78,dword106
        push_arg        dword78,4
        lea     dword79,[ebp-48]
        push_arg        dword79,4
        call    _vec2f_subtract
        restore_stack   12
        pop_all
        push_all
        push_arg        sse9,4
        lea     dword81,[ebp-48]
        push_arg        dword81,4
        call    _vec2f_mul
        restore_stack   8
        pop_all
        push_all
        lea     dword82,[ebp-48]
        push_arg        dword82,4
        mov     dword84,16
        add     dword84,dword105
        push_arg        dword84,4
        mov     dword88,[dword107+192]
        imul    dword88,24
        mov     dword90,dword107
        add     dword90,dword88
        add     dword90,16
        push_arg        dword90,4
        call    _vec2f_add
        restore_stack   12
        pop_all
        inc     dword ptr [dword107+192]
label0004:
        add     dword105,24
        add     dword106,24
        jmp     label0001
label0002:
        mov     dword98,[dword107+192]
        inc     dword ptr [dword107+192]
        imul    dword98,24
        movq    sse11,qword ptr [dword107]
        movq    qword ptr [dword107+dword98],sse11
        movq    sse11,qword ptr [dword107+8]
        movq    qword ptr [dword107+dword98+8],sse11
        movq    sse11,qword ptr [dword107+16]
        movq    qword ptr [dword107+dword98+16],sse11
        destroy_stack_frame
        ret
__clip_on_plain endp

__clip_poligon proc
        create_stack_frame
        mov     dword30,[ebp+8]
        push_all
        lea     dword1,dword ptr [__clip_z_far_norm]
        push_arg        dword1,4
        lea     dword2,dword ptr [__clip_z_far_base]
        push_arg        dword2,4
        push_arg        dword30,4
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
        push_arg        dword30,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword9,dword ptr [__clip_plane_left_norm]
        push_arg        dword9,4
        lea     dword10,dword ptr [__clip_plane_left_base]
        push_arg        dword10,4
        push_arg        dword30,4
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
        push_arg        dword30,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        push_all
        lea     dword17,dword ptr [__clip_plane_top_norm]
        push_arg        dword17,4
        lea     dword18,dword ptr [__clip_plane_top_base]
        push_arg        dword18,4
        push_arg        dword30,4
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
        push_arg        dword30,4
        call    __clip_on_plain
        restore_stack   16
        pop_all
        cmp     dword ptr [dword30+192],1
        setg    byte1
        movzx   dword28,byte1
        set_retval      dword28
        destroy_stack_frame
        ret
__clip_poligon endp

__transform_to_screen_space proc
        create_stack_frame
        mov     dword37,[ebp+12]
        mov     dword36,[ebp+8]
        push_all
        lea     dword1,dword ptr [__viewport_matrix]
        push_arg        dword1,4
        push_arg        dword37,4
        lea     dword3,[ebp-16]
        push_arg        dword3,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        movss   sse1,dword ptr [___unnamed_float_1]
        divss   sse1,dword ptr [ebp-4]
        movss   sse2,dword ptr [ebp-16]
        mulss   sse2,sse1
        cvttss2si       dword10,sse2
        mov     [dword36],dword10
        movss   sse3,dword ptr [ebp-12]
        mulss   sse3,sse1
        cvttss2si       dword16,sse3
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
        mov     dword55,[ebp+8]
        push_all
        push_arg        dword55,4
        call    __clip_poligon
        restore_stack   4
        pop_all
        read_retval     dword2
        cmp     dword2,0
        jne     label0000
        destroy_stack_frame
        ret
label0000:
        cmp     dword ptr [dword55+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword54,0
label0003:
        mov     dword13,[dword55+192]
        cmp     dword13,dword54
        jle     label0004
        push_all
        mov     dword15,dword55
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
        movq    sse1,qword ptr [dword55+dword32+16]
        movq    qword ptr [dword23+dword26+8],sse1
        inc     dword54
        jmp     label0003
label0004:
        mov     dword54,2
label0006:
        mov     dword40,[dword55+192]
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
        mov     dword14,[ebp+12]
        mov     dword13,[ebp+8]
        push_all
        movss   sse1,dword ptr [___unnamed_float_1]
        push_arg        sse1,4
        push_arg        dword ptr [dword14+8],4
        push_arg        dword ptr [dword14+4],4
        push_arg        dword ptr [dword14],4
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
        push_arg        dword13,4
        call    _matrix4f_transform
        restore_stack   12
        pop_all
        destroy_stack_frame
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        create_stack_frame
        mov     dword36,[ebp+28]
        mov     dword35,[ebp+24]
        mov     dword34,[ebp+20]
        mov     dword33,[ebp+16]
        mov     dword32,[ebp+12]
        mov     dword31,[ebp+8]
        push_all
        push_arg        dword31,4
        lea     dword2,[ebp-196]
        push_arg        dword2,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        movq    sse1,qword ptr [dword34]
        movq    qword ptr [ebp-180],sse1
        push_all
        push_arg        dword32,4
        lea     dword8,[ebp-196]
        add     dword8,24
        push_arg        dword8,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        movq    sse2,qword ptr [dword35]
        movq    qword ptr [ebp-156],sse2
        push_all
        push_arg        dword33,4
        lea     dword16,[ebp-196]
        add     dword16,48
        push_arg        dword16,4
        call    __transform_to_projection_space
        restore_stack   8
        pop_all
        movq    sse3,qword ptr [dword36]
        movq    qword ptr [ebp-132],sse3
        movq    sse4,qword ptr [ebp-196]
        movq    qword ptr [ebp-124],sse4
        movq    sse4,qword ptr [ebp-188]
        movq    qword ptr [ebp-116],sse4
        movq    sse4,qword ptr [ebp-180]
        movq    qword ptr [ebp-108],sse4
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
