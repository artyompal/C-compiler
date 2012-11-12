
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
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        movss   xmm0,dword ptr [esi]
        addss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [esi+4]
        addss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec2f_add endp

_vec2f_subtract proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec2f_subtract endp

_vec2f_mul proc
        push    ebp
        mov     ebp,esp
        push    edi
        movss   xmm7,dword ptr [ebp+12]
        mov     edi,[ebp+8]
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,xmm7
        movss   dword ptr [edi],xmm0
        movss   xmm0,dword ptr [edi+4]
        mulss   xmm0,xmm7
        movss   dword ptr [edi+4],xmm0
        pop     edi
        pop     ebp
        ret
_vec2f_mul endp

_vec4f_assign proc
        push    ebp
        mov     ebp,esp
        push    edi
        movss   xmm7,dword ptr [ebp+24]
        movss   xmm6,dword ptr [ebp+20]
        movss   xmm5,dword ptr [ebp+16]
        movss   xmm4,dword ptr [ebp+12]
        mov     edi,[ebp+8]
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
        pop     edi
        pop     ebp
        ret
_vec4f_assign endp

_vec4f_add proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        movss   xmm0,dword ptr [esi]
        addss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [esi+4]
        addss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [esi+8]
        addss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [esi+12]
        addss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec4f_add endp

_vec4f_subtract proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [esi+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec4f_subtract endp

_vec4f_dot proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
        movss   xmm0,dword ptr [esi+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [esi]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
        movss   xmm0,xmm1
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec4f_dot endp

_vec4f_mul proc
        push    ebp
        mov     ebp,esp
        push    edi
        movss   xmm7,dword ptr [ebp+12]
        mov     edi,[ebp+8]
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,xmm7
        movss   dword ptr [edi],xmm0
        movss   xmm0,dword ptr [edi+4]
        mulss   xmm0,xmm7
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [edi+8]
        mulss   xmm0,xmm7
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [edi+12]
        mulss   xmm0,xmm7
        movss   dword ptr [edi+12],xmm0
        pop     edi
        pop     ebp
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        movss   xmm7,dword ptr [ebp+24]
        movss   xmm6,dword ptr [ebp+20]
        movss   xmm5,dword ptr [ebp+16]
        movss   xmm4,dword ptr [ebp+12]
        mov     edi,[ebp+8]
        mulss   xmm6,xmm4
        movss   xmm0,xmm6
        mulss   xmm0,xmm7
        movss   xmm7,xmm4
        divss   xmm7,xmm0
        movss   dword ptr [edi],xmm7
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+16],xmm0
        movss   xmm0,xmm4
        divss   xmm0,xmm6
        movss   dword ptr [edi+20],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+24],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+28],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+32],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+36],xmm0
        movss   xmm0,xmm5
        subss   xmm0,xmm4
        movss   xmm6,xmm5
        divss   xmm6,xmm0
        movss   dword ptr [edi+40],xmm6
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+44],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+48],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+52],xmm0
        movss   xmm0,xmm4
        mulss   xmm0,xmm5
        subss   xmm4,xmm5
        divss   xmm0,xmm4
        movss   dword ptr [edi+56],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+60],xmm0
        pop     edi
        add     esp,8
        pop     ebp
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        push    ebp
        mov     ebp,esp
        push    edi
        movss   xmm7,dword ptr [ebp+24]
        movss   xmm6,dword ptr [ebp+20]
        movss   xmm5,dword ptr [ebp+16]
        movss   xmm4,dword ptr [ebp+12]
        mov     edi,[ebp+8]
        movss   xmm0,xmm4
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+16],xmm0
        movss   xmm0,xmm5
        xorps   xmm0,dword ptr [___unnamed_float_4]
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+20],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+24],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+28],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+32],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+36],xmm0
        subss   xmm7,xmm6
        movss   dword ptr [edi+40],xmm7
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+44],xmm0
        divss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+48],xmm4
        divss   xmm5,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+52],xmm5
        movss   dword ptr [edi+56],xmm6
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+60],xmm0
        pop     edi
        pop     ebp
        ret
_matrix4f_make_viewport endp

_matrix4f_transform proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        movss   xmm0,dword ptr [esi+4]
        mulss   xmm0,dword ptr [edi+16]
        movss   xmm1,dword ptr [esi]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [edi+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [edi+48]
        addss   xmm1,xmm0
        movss   dword ptr [ebx],xmm1
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [edi+20]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [edi+36]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [edi+52]
        addss   xmm0,xmm1
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [edi+8]
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [edi+24]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [edi+40]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [edi+56]
        addss   xmm0,xmm1
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [edi+12]
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [edi+28]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [edi+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [edi+60]
        addss   xmm0,xmm1
        movss   dword ptr [ebx+12],xmm0
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_matrix4f_transform endp

_rasterizer_init proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        push    esi
        push    ebx
        movss   xmm7,dword ptr [ebp+32]
        movss   xmm6,dword ptr [ebp+28]
        movss   xmm5,dword ptr [ebp+24]
        mov     edi,[ebp+20]
        mov     esi,[ebp+16]
        mov     ebx,[ebp+12]
        mov     edx,[ebp+8]
        mov     dword ptr [__dbgprintf],edx
        mov     dword ptr [__width],ebx
        mov     dword ptr [__height],esi
        mov     dword ptr [__pitch],edi
        cvtsi2ss        xmm0,ebx
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        push    dword ptr [ebp+28]
        push    dword ptr [ebp+24]
        lea     edx,dword ptr [__mvproj_matrix]
        push    edx
        call    _matrix4f_make_perspective
        add     esp,20
        push    dword ptr [ebp+28]
        push    dword ptr [ebp+24]
        cvtsi2ss        xmm0,esi
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        cvtsi2ss        xmm0,ebx
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__viewport_matrix]
        push    edx
        call    _matrix4f_make_viewport
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp+24]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_z_near_base]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm6,dword ptr [ebp+28]
        comiss  xmm6,dword ptr [ebp+24]
        jbe     label0000
        movss   xmm7,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   xmm7,dword ptr [___unnamed_float_5]
label0001:
        movss   dword ptr [ebp+28],xmm6
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_z_near_norm]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp+28]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_z_far_base]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm6,dword ptr [ebp+28]
        comiss  xmm6,dword ptr [ebp+24]
        jbe     label0002
        movss   xmm7,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   xmm7,dword ptr [___unnamed_float_1]
label0003:
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_z_far_norm]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_plane_left_base]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_plane_left_norm]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_plane_right_base]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_plane_right_norm]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        cvtsi2ss        xmm0,esi
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_plane_top_base]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_plane_top_norm]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_plane_bottom_base]
        push    edx
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     edx,dword ptr [__clip_plane_bottom_norm]
        push    edx
        call    _vec4f_assign
        add     esp,20
        pop     ebx
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        push    ebp
        mov     ebp,esp
        push    edi
        mov     edi,[ebp+8]
        mov     dword ptr [__videomem],edi
        pop     edi
        pop     ebp
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        mov     edi,[ebp+8]
        mov     [ebp+8],edi
        mov     edi,(offset __mvproj_matrix)
        mov     esi,[ebp+8]
        mov     ecx,16
        rep     movsd
        pop     esi
        pop     edi
        pop     ebp
        ret
_rasterizer_set_mvproj endp

_rasterizer_set_color proc
        push    ebp
        mov     ebp,esp
        push    edi
        mov     edi,[ebp+8]
        mov     dword ptr [__color],edi
        pop     edi
        pop     ebp
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     dword ptr [__texture_data],ebx
        mov     dword ptr [__texture_width],esi
        mov     dword ptr [__texture_height],edi
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_rasterizer_set_texture endp

__tex2d proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        movss   xmm7,dword ptr [ebp+12]
        movss   xmm6,dword ptr [ebp+8]
        mov     eax,dword ptr [__texture_width]
        dec     eax
        cvtsi2ss        xmm0,eax
        mulss   xmm0,xmm6
        cvttss2si       eax,xmm0
        mov     ecx,dword ptr [__texture_height]
        dec     ecx
        cvtsi2ss        xmm0,ecx
        mulss   xmm0,xmm7
        cvttss2si       ecx,xmm0
        imul    ecx,dword ptr [__texture_width]
        add     ecx,eax
        sal     ecx,2
        add     ecx,dword ptr [__texture_data]
        mov     eax,[ecx]
        add     esp,8
        pop     ebp
        ret
__tex2d endp

__rasterize_horiz_line proc
        push    ebp
        mov     ebp,esp
        sub     esp,48
        push    edi
        push    esi
        push    ebx
        movss   xmm7,dword ptr [ebp+32]
        movss   xmm6,dword ptr [ebp+28]
        movss   xmm5,dword ptr [ebp+24]
        movss   xmm4,dword ptr [ebp+20]
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,dword ptr [__pitch]
        imul    eax,edi
        add     eax,dword ptr [__videomem]
        mov     edi,ebx
        sal     edi,2
        add     eax,edi
        sal     esi,2
        add     esi,eax
        sal     ebx,2
        sub     esi,ebx
label0000:
        mov     [ebp-4],eax
        movss   dword ptr [ebp+20],xmm4
        movss   dword ptr [ebp+24],xmm5
        movss   dword ptr [ebp+28],xmm6
        movss   dword ptr [ebp+32],xmm7
        push    dword ptr [ebp+24]
        push    dword ptr [ebp+20]
        call    __tex2d
        add     esp,8
        mov     ebx,eax
        sar     ebx,24
        and     ebx,255
        cmp     ebx,0
        je      label0003
        cvtsi2ss        xmm0,ebx
        divss   xmm0,dword ptr [___unnamed_float_6]
        mov     [ebp-48],eax
        mov     eax,[ebp-4]
        mov     ebx,[eax]
        mov     edi,ebx
        and     edi,65280
        sar     edi,8
        and     ebx,255
        mov     ecx,[ebp-48]
        and     ecx,65280
        sar     ecx,8
        mov     edx,[ebp-48]
        and     edx,255
        cvtsi2ss        xmm1,ecx
        mulss   xmm1,xmm0
        cvtsi2ss        xmm2,edi
        movss   xmm3,dword ptr [___unnamed_float_1]
        subss   xmm3,xmm0
        mulss   xmm2,xmm3
        addss   xmm1,xmm2
        cvttss2si       ecx,xmm1
        cvtsi2ss        xmm1,edx
        mulss   xmm1,xmm0
        cvtsi2ss        xmm2,ebx
        movss   xmm3,dword ptr [___unnamed_float_1]
        subss   xmm3,xmm0
        mulss   xmm2,xmm3
        addss   xmm1,xmm2
        cvttss2si       edx,xmm1
        sal     ecx,8
        add     ecx,edx
        mov     [eax],ecx
        mov     [ebp-4],eax
label0003:
        movss   xmm0,dword ptr [ebp+20]
        addss   xmm0,dword ptr [ebp+28]
        movss   xmm4,xmm0
        movss   xmm0,dword ptr [ebp+24]
        addss   xmm0,dword ptr [ebp+32]
        movss   xmm5,xmm0
        mov     eax,[ebp-4]
        add     eax,4
        cmp     eax,esi
        movss   xmm6,dword ptr [ebp+28]
        movss   xmm7,dword ptr [ebp+32]
        jl      label0000
        pop     ebx
        pop     esi
        pop     edi
        add     esp,48
        pop     ebp
        ret
__rasterize_horiz_line endp

__rasterize_horiz_line__unordered proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        movss   xmm7,dword ptr [ebp+40]
        movss   xmm6,dword ptr [ebp+36]
        movss   xmm5,dword ptr [ebp+32]
        movss   xmm4,dword ptr [ebp+28]
        movss   xmm3,dword ptr [ebp+24]
        movss   xmm2,dword ptr [ebp+20]
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        cmp     ebx,esi
        jg      label0000
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        push    edi
        push    esi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0001
label0000:
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm4
        sub     esp,4
        push    edi
        push    ebx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0001:
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
__rasterize_horiz_line__unordered endp

__rasterize_triangle_1i proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        movss   xmm7,dword ptr [ebp+40]
        movss   xmm6,dword ptr [ebp+36]
        mov     edi,[ebp+32]
        mov     esi,[ebp+28]
        mov     ebx,[ebp+24]
        mov     edx,[ebp+20]
        mov     ecx,[ebp+16]
        mov     eax,[ebp+12]
        mov     [ebp+28],esi
        mov     esi,[ebp+8]
        cmp     esi,eax
        jge     label0000
        cmp     ecx,eax
        jle     label0001
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [ebx+4]
        push    dword ptr [ebx]
        push    edx
        push    ecx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0002
label0001:
        cmp     ecx,esi
        jge     label0003
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    edx
        push    eax
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0004
label0003:
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [ebx+4]
        push    dword ptr [ebx]
        push    edx
        push    eax
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0004:
label0002:
        jmp     label0005
label0000:
        cmp     ecx,eax
        jge     label0006
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    edx
        push    esi
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0007
label0006:
        cmp     ecx,esi
        jle     label0008
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     esi,[ebp+28]
        push    dword ptr [esi+4]
        push    dword ptr [esi]
        push    edx
        push    ecx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0009
label0008:
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     [ebp+8],esi
        mov     esi,[ebp+28]
        push    dword ptr [esi+4]
        push    dword ptr [esi]
        push    edx
        push    dword ptr [ebp+8]
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0009:
label0007:
label0005:
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
__rasterize_triangle_1i endp

__rasterize_triangle_2i proc
        push    ebp
        mov     ebp,esp
        sub     esp,48
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,[ebx+4]
        cmp     eax,[esi+4]
        jle     label0000
        mov     [ebp-4],ebx
        mov     ebx,esi
        mov     esi,[ebp-4]
label0000:
        mov     eax,[ebx+4]
        cmp     eax,[edi+4]
        jle     label0001
        mov     [ebp-4],ebx
        mov     ebx,edi
        mov     edi,[ebp-4]
label0001:
        mov     eax,[esi+4]
        cmp     eax,[edi+4]
        jle     label0002
        mov     [ebp+8],ebx
        mov     ebx,esi
        mov     esi,edi
        mov     edi,ebx
        mov     ebx,[ebp+8]
label0002:
        mov     eax,[ebx+4]
        cmp     eax,[edi+4]
        jne     label0003
        cmp     dword ptr [ebx+4],0
        jl      label0004
        mov     eax,[ebx+4]
        cmp     eax,dword ptr [__height]
        jge     label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        mov     eax,8
        add     eax,edi
        push    eax
        mov     eax,8
        add     eax,esi
        push    eax
        mov     eax,8
        add     eax,ebx
        push    eax
        push    dword ptr [ebx+4]
        push    dword ptr [edi]
        push    dword ptr [esi]
        push    dword ptr [ebx]
        call    __rasterize_triangle_1i
        add     esp,36
label0004:
        pop     ebx
        pop     esi
        pop     edi
        add     esp,48
        pop     ebp
        ret
label0003:
        mov     eax,[ebx+4]
label0006:
        mov     ecx,[esi+4]
        cmp     ecx,eax
        jle     label0007
        mov     [ebp-16],eax
        mov     eax,[ebp-16]
        sub     eax,[ebx+4]
        mov     ecx,[esi]
        sub     ecx,[ebx]
        imul    eax,ecx
        mov     ecx,[esi+4]
        sub     ecx,[ebx+4]
        cdq
        idiv    ecx
        add     eax,[ebx]
        mov     [ebp-44],eax
        mov     eax,[ebp-16]
        sub     eax,[ebx+4]
        mov     ecx,[edi]
        sub     ecx,[ebx]
        imul    eax,ecx
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cdq
        idiv    ecx
        add     eax,[ebx]
        mov     ecx,[ebp-16]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [esi+8]
        subss   xmm1,dword ptr [ebx+8]
        mulss   xmm0,xmm1
        mov     ecx,[esi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [ebx+8]
        mov     ecx,[ebp-16]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm1,ecx
        movss   xmm2,dword ptr [edi+8]
        subss   xmm2,dword ptr [ebx+8]
        mulss   xmm1,xmm2
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [ebx+8]
        mov     ecx,[ebp-16]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm2,ecx
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        mov     edx,8
        add     edx,ebx
        add     edx,4
        movss   xmm3,dword ptr [ecx]
        subss   xmm3,dword ptr [edx]
        mulss   xmm2,xmm3
        mov     ecx,[esi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        mov     ecx,8
        add     ecx,ebx
        add     ecx,4
        addss   xmm2,dword ptr [ecx]
        mov     ecx,[ebp-16]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm3,ecx
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,ebx
        add     edx,4
        movss   xmm4,dword ptr [ecx]
        subss   xmm4,dword ptr [edx]
        mulss   xmm3,xmm4
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        mov     ecx,8
        add     ecx,ebx
        add     ecx,4
        addss   xmm3,dword ptr [ecx]
        mov     ecx,eax
        sub     ecx,[ebp-44]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     ecx,eax
        sub     ecx,[ebp-44]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp-16]
        push    eax
        push    dword ptr [ebp-44]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        inc     dword ptr [ebp-16]
        mov     eax,[ebp-16]
        jmp     label0006
label0007:
        mov     eax,[esi+4]
        sub     eax,[ebx+4]
        mov     ecx,[edi]
        sub     ecx,[ebx]
        imul    eax,ecx
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cdq
        idiv    ecx
        add     eax,[ebx]
        mov     ecx,[esi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [edi+8]
        subss   xmm1,dword ptr [ebx+8]
        mulss   xmm0,xmm1
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [ebx+8]
        mov     ecx,[esi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm1,ecx
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,ebx
        add     edx,4
        movss   xmm2,dword ptr [ecx]
        subss   xmm2,dword ptr [edx]
        mulss   xmm1,xmm2
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        mov     ecx,8
        add     ecx,ebx
        add     ecx,4
        addss   xmm1,dword ptr [ecx]
        movss   xmm2,xmm0
        subss   xmm2,dword ptr [esi+8]
        mov     ecx,eax
        sub     ecx,[esi]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        movss   xmm3,xmm1
        subss   xmm3,dword ptr [ecx]
        mov     ecx,eax
        sub     ecx,[esi]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        push    dword ptr [ecx]
        push    dword ptr [esi+8]
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [esi+4]
        push    dword ptr [esi]
        push    eax
        call    __rasterize_horiz_line__unordered
        add     esp,36
        mov     eax,1
        add     eax,[esi+4]
label0009:
        mov     ecx,[edi+4]
        cmp     ecx,eax
        jle     label000a
        mov     [ebp-16],eax
        mov     eax,[ebp-16]
        sub     eax,[esi+4]
        mov     ecx,[edi]
        sub     ecx,[esi]
        imul    eax,ecx
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        cdq
        idiv    ecx
        add     eax,[esi]
        mov     [ebp-48],eax
        mov     eax,[ebp-16]
        sub     eax,[ebx+4]
        mov     ecx,[edi]
        sub     ecx,[ebx]
        imul    eax,ecx
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cdq
        idiv    ecx
        add     eax,[ebx]
        mov     ecx,[ebp-16]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [edi+8]
        subss   xmm1,dword ptr [esi+8]
        mulss   xmm0,xmm1
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [esi+8]
        mov     ecx,[ebp-16]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm1,ecx
        movss   xmm2,dword ptr [edi+8]
        subss   xmm2,dword ptr [ebx+8]
        mulss   xmm1,xmm2
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [ebx+8]
        mov     ecx,[ebp-16]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm2,ecx
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,esi
        add     edx,4
        movss   xmm3,dword ptr [ecx]
        subss   xmm3,dword ptr [edx]
        mulss   xmm2,xmm3
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        addss   xmm2,dword ptr [ecx]
        mov     ecx,[ebp-16]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm3,ecx
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,ebx
        add     edx,4
        movss   xmm4,dword ptr [ecx]
        subss   xmm4,dword ptr [edx]
        mulss   xmm3,xmm4
        mov     ecx,[edi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        mov     ecx,8
        add     ecx,ebx
        add     ecx,4
        addss   xmm3,dword ptr [ecx]
        mov     ecx,eax
        sub     ecx,[ebp-48]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     ecx,eax
        sub     ecx,[ebp-48]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp-16]
        push    eax
        push    dword ptr [ebp-48]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        inc     dword ptr [ebp-16]
        mov     eax,[ebp-16]
        jmp     label0009
label000a:
        pop     ebx
        pop     esi
        pop     edi
        add     esp,48
        pop     ebp
        ret
__rasterize_triangle_2i endp

__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,80
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+20]
        mov     esi,[ebp+16]
        mov     ebx,[ebp+12]
        mov     edx,[ebp+8]
        mov     dword ptr [edx+192],0
        mov     ecx,ebx
        lea     eax,[ebx+24]
label0001:
        mov     [ebp+8],edx
        mov     edx,[ebx+192]
        imul    edx,24
        mov     [ebp+20],edi
        mov     edi,ebx
        add     edi,edx
        cmp     edi,eax
        jle     label0002
        mov     [ebp-8],eax
        mov     [ebp-4],ecx
        push    esi
        push    dword ptr [ebp-4]
        lea     edx,[ebp-24]
        push    edx
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     edx,[ebp-24]
        push    edx
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-72],xmm0
        push    esi
        push    dword ptr [ebp-8]
        lea     edx,[ebp-24]
        push    edx
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     edx,[ebp-24]
        push    edx
        call    _vec4f_dot
        add     esp,8
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,dword ptr [ebp-72]
        ja      label0003
        mov     edi,[ebp+8]
        mov     edx,[edi+192]
        mov     [ebp-64],edx
        mov     edx,[ebp+8]
        inc     dword ptr [edx+192]
        mov     [ebp+8],edx
        mov     edx,[ebp-64]
        imul    edx,24
        mov     eax,[ebp+8]
        add     eax,edx
        mov     edi,eax
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        mov     ecx,6
        rep     movsd
        mov     [ebp-68],ecx
        mov     esi,[ebp+16]
label0003:
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,dword ptr [ebp-72]
        jae     label0006
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,xmm0
        ja      label0005
label0006:
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,xmm0
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-72]
        jbe     label0004
label0005:
        push    dword ptr [ebp-4]
        push    esi
        lea     edx,[ebp-24]
        push    edx
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp-4]
        push    dword ptr [ebp-8]
        lea     edx,[ebp-40]
        push    edx
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     edx,[ebp-24]
        push    edx
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-76],xmm0
        push    dword ptr [ebp+20]
        lea     edx,[ebp-40]
        push    edx
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-80],xmm0
        movss   xmm0,dword ptr [ebp-76]
        divss   xmm0,dword ptr [ebp-80]
        movss   dword ptr [ebp-76],xmm0
        push    dword ptr [ebp-76]
        lea     edx,[ebp-40]
        push    edx
        call    _vec4f_mul
        add     esp,8
        lea     edx,[ebp-40]
        push    edx
        push    dword ptr [ebp-4]
        mov     edi,[ebp+8]
        mov     edx,[edi+192]
        imul    edx,24
        mov     eax,[ebp+8]
        add     eax,edx
        push    eax
        call    _vec4f_add
        add     esp,12
        mov     eax,16
        add     eax,[ebp-4]
        push    eax
        mov     eax,16
        add     eax,[ebp-8]
        push    eax
        lea     eax,[ebp-48]
        push    eax
        call    _vec2f_subtract
        add     esp,12
        push    dword ptr [ebp-76]
        lea     eax,[ebp-48]
        push    eax
        call    _vec2f_mul
        add     esp,8
        lea     eax,[ebp-48]
        push    eax
        mov     eax,16
        add     eax,[ebp-4]
        push    eax
        mov     edx,[ebp+8]
        mov     eax,[edx+192]
        imul    eax,24
        mov     ecx,edx
        add     ecx,eax
        add     ecx,16
        push    ecx
        call    _vec2f_add
        add     esp,12
        inc     dword ptr [edx+192]
        mov     [ebp+8],edx
label0004:
        mov     ecx,[ebp-4]
        add     ecx,24
        mov     eax,[ebp-8]
        add     eax,24
        mov     edx,[ebp+8]
        mov     edi,[ebp+20]
        jmp     label0001
label0002:
        mov     edx,[ebp+8]
        mov     eax,[edx+192]
        inc     dword ptr [edx+192]
        imul    eax,24
        mov     ecx,edx
        add     ecx,eax
        mov     edi,ecx
        mov     esi,edx
        mov     ecx,6
        rep     movsd
        pop     ebx
        pop     esi
        pop     edi
        add     esp,80
        pop     ebp
        ret
__clip_on_plain endp

__clip_poligon proc
        push    ebp
        mov     ebp,esp
        sub     esp,196
        push    edi
        mov     edi,[ebp+8]
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        push    edi
        lea     eax,[ebp-196]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_z_near_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_near_base]
        push    eax
        lea     eax,[ebp-196]
        push    eax
        push    edi
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        push    edi
        lea     eax,[ebp-196]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_right_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_right_base]
        push    eax
        lea     eax,[ebp-196]
        push    eax
        push    edi
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        push    edi
        lea     eax,[ebp-196]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_bottom_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_bottom_base]
        push    eax
        lea     eax,[ebp-196]
        push    eax
        push    edi
        call    __clip_on_plain
        add     esp,16
        cmp     dword ptr [edi+192],1
        setg    al
        movzx   eax,al
        pop     edi
        add     esp,196
        pop     ebp
        ret
__clip_poligon endp

__transform_to_screen_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
        lea     eax,dword ptr [__viewport_matrix]
        push    eax
        push    edi
        lea     eax,[ebp-16]
        push    eax
        call    _matrix4f_transform
        add     esp,12
        lea     eax,[ebp-16]
        add     eax,12
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [eax]
        movss   xmm1,dword ptr [ebp-16]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
        mov     [esi],eax
        lea     eax,[ebp-16]
        add     eax,4
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
        mov     [esi+4],eax
        cmp     dword ptr [esi],0
        jl      label0001
        mov     eax,[esi]
        cmp     eax,dword ptr [__width]
        jge     label0001
        cmp     dword ptr [esi+4],0
        jl      label0001
        mov     esi,[esi+4]
        cmp     esi,dword ptr [__height]
        jl      label0000
label0001:
        mov     dword ptr ds:[0],0
label0000:
        pop     esi
        pop     edi
        add     esp,20
        pop     ebp
        ret
__transform_to_screen_space endp

__rasterize_polygon_4f proc
        push    ebp
        mov     ebp,esp
        sub     esp,136
        push    edi
        mov     edi,[ebp+8]
        push    edi
        call    __clip_poligon
        add     esp,4
        cmp     eax,0
        jne     label0000
        pop     edi
        add     esp,136
        pop     ebp
        ret
label0000:
        cmp     dword ptr [edi+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     eax,0
label0003:
        mov     ecx,[edi+192]
        cmp     ecx,eax
        jle     label0004
        mov     [ebp-136],eax
        mov     ecx,edi
        mov     eax,[ebp-136]
        imul    eax,24
        add     ecx,eax
        push    ecx
        lea     eax,[ebp-132]
        mov     ecx,[ebp-136]
        sal     ecx,4
        add     eax,ecx
        push    eax
        call    __transform_to_screen_space
        add     esp,8
        lea     eax,[ebp-132]
        mov     ecx,[ebp-136]
        sal     ecx,4
        add     eax,ecx
        add     eax,8
        mov     ecx,edi
        mov     edx,[ebp-136]
        imul    edx,24
        add     ecx,edx
        add     ecx,16
        mov     edx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ecx
        inc     dword ptr [ebp-136]
        mov     eax,[ebp-136]
        jmp     label0003
label0004:
        mov     eax,2
label0006:
        mov     ecx,[edi+192]
        dec     ecx
        cmp     ecx,eax
        jle     label0007
        mov     [ebp-136],eax
        lea     ecx,[ebp-132]
        mov     eax,[ebp-136]
        sal     eax,4
        add     ecx,eax
        push    ecx
        mov     eax,[ebp-136]
        dec     eax
        sal     eax,4
        lea     ecx,[ebp-132]
        add     ecx,eax
        push    ecx
        lea     eax,[ebp-132]
        push    eax
        call    __rasterize_triangle_2i
        add     esp,12
        inc     dword ptr [ebp-136]
        mov     eax,[ebp-136]
        jmp     label0006
label0007:
        pop     edi
        add     esp,136
        pop     ebp
        ret
__rasterize_polygon_4f endp

__transform_to_projection_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [edi+8]
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        lea     edi,[ebp-16]
        push    edi
        call    _vec4f_assign
        add     esp,20
        lea     edi,dword ptr [__mvproj_matrix]
        push    edi
        lea     edi,[ebp-16]
        push    edi
        push    esi
        call    _matrix4f_transform
        add     esp,12
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        push    ebp
        mov     ebp,esp
        sub     esp,196
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+28]
        mov     esi,[ebp+24]
        mov     ebx,[ebp+20]
        mov     edx,[ebp+16]
        mov     ecx,[ebp+12]
        mov     eax,[ebp+8]
        push    eax
        lea     eax,[ebp-196]
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        add     eax,16
        mov     ecx,[ebx]
        mov     ebx,[ebx+4]
        mov     [eax],ecx
        mov     [eax+4],ebx
        push    dword ptr [ebp+12]
        lea     eax,[ebp-196]
        add     eax,24
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        add     eax,24
        add     eax,16
        mov     ecx,[esi]
        mov     esi,[esi+4]
        mov     [eax],ecx
        mov     [eax+4],esi
        push    dword ptr [ebp+16]
        lea     eax,[ebp-196]
        add     eax,48
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        add     eax,48
        add     eax,16
        mov     ecx,[edi]
        mov     edi,[edi+4]
        mov     [eax],ecx
        mov     [eax+4],edi
        lea     eax,[ebp-196]
        add     eax,72
        lea     ecx,[ebp-196]
        mov     edi,eax
        mov     esi,ecx
        mov     ecx,6
        rep     movsd
        lea     eax,[ebp-196]
        add     eax,192
        mov     dword ptr [eax],4
        lea     eax,[ebp-196]
        push    eax
        call    __rasterize_polygon_4f
        add     esp,4
        pop     ebx
        pop     esi
        pop     edi
        add     esp,196
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
