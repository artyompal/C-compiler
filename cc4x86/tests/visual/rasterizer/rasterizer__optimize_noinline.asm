
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
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        movss   xmm0,dword ptr [edx]
        addss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [edx+4]
        addss   xmm0,dword ptr [ecx+4]
        movss   dword ptr [eax+4],xmm0
        pop     ebp
        ret
_vec2f_add endp

_vec2f_subtract proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        movss   xmm0,dword ptr [edx]
        subss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [ecx+4]
        movss   dword ptr [eax+4],xmm0
        pop     ebp
        ret
_vec2f_subtract endp

_vec2f_mul proc
        push    ebp
        mov     ebp,esp
        movss   xmm0,dword ptr [ebp+12]
        mov     eax,[ebp+8]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,xmm0
        movss   dword ptr [eax],xmm1
        movss   xmm1,dword ptr [eax+4]
        mulss   xmm1,xmm0
        movss   dword ptr [eax+4],xmm1
        pop     ebp
        ret
_vec2f_mul endp

_vec4f_assign proc
        push    ebp
        mov     ebp,esp
        movss   xmm0,dword ptr [ebp+24]
        movss   xmm1,dword ptr [ebp+20]
        movss   xmm2,dword ptr [ebp+16]
        movss   xmm3,dword ptr [ebp+12]
        mov     eax,[ebp+8]
        movss   dword ptr [eax],xmm3
        movss   dword ptr [eax+4],xmm2
        movss   dword ptr [eax+8],xmm1
        movss   dword ptr [eax+12],xmm0
        pop     ebp
        ret
_vec4f_assign endp

_vec4f_add proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        movss   xmm0,dword ptr [edx]
        addss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [edx+4]
        addss   xmm0,dword ptr [ecx+4]
        movss   dword ptr [eax+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        addss   xmm0,dword ptr [ecx+8]
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        addss   xmm0,dword ptr [ecx+12]
        movss   dword ptr [eax+12],xmm0
        pop     ebp
        ret
_vec4f_add endp

_vec4f_subtract proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        movss   xmm0,dword ptr [edx]
        subss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [ecx+4]
        movss   dword ptr [eax+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        subss   xmm0,dword ptr [ecx+8]
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        subss   xmm0,dword ptr [ecx+12]
        movss   dword ptr [eax+12],xmm0
        pop     ebp
        ret
_vec4f_subtract endp

_vec4f_dot proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,dword ptr [eax+4]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [eax]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
        movss   xmm0,xmm1
        pop     ebp
        ret
_vec4f_dot endp

_vec4f_mul proc
        push    ebp
        mov     ebp,esp
        movss   xmm0,dword ptr [ebp+12]
        mov     eax,[ebp+8]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,xmm0
        movss   dword ptr [eax],xmm1
        movss   xmm1,dword ptr [eax+4]
        mulss   xmm1,xmm0
        movss   dword ptr [eax+4],xmm1
        movss   xmm1,dword ptr [eax+8]
        mulss   xmm1,xmm0
        movss   dword ptr [eax+8],xmm1
        movss   xmm1,dword ptr [eax+12]
        mulss   xmm1,xmm0
        movss   dword ptr [eax+12],xmm1
        pop     ebp
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        movss   xmm0,dword ptr [ebp+16]
        movss   xmm1,dword ptr [ebp+24]
        movss   xmm2,dword ptr [ebp+12]
        movss   xmm3,dword ptr [ebp+20]
        mov     eax,[ebp+8]
        mulss   xmm3,xmm2
        movss   xmm4,xmm3
        mulss   xmm4,xmm1
        movss   xmm1,xmm2
        divss   xmm1,xmm4
        movss   dword ptr [eax],xmm1
        mov     dword ptr [eax+4],0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],0
        mov     dword ptr [eax+16],0
        movss   xmm1,xmm2
        divss   xmm1,xmm3
        movss   dword ptr [eax+20],xmm1
        mov     dword ptr [eax+24],0
        mov     dword ptr [eax+28],0
        mov     dword ptr [eax+32],0
        mov     dword ptr [eax+36],0
        movss   xmm1,xmm0
        subss   xmm1,xmm2
        movss   xmm3,xmm0
        divss   xmm3,xmm1
        movss   dword ptr [eax+40],xmm3
        mov     dword ptr [eax+44],1065353216
        mov     dword ptr [eax+48],0
        mov     dword ptr [eax+52],0
        movss   xmm1,xmm2
        mulss   xmm1,xmm0
        subss   xmm2,xmm0
        divss   xmm1,xmm2
        movss   dword ptr [eax+56],xmm1
        mov     dword ptr [eax+60],0
        mov     esp,ebp
        pop     ebp
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        push    ebp
        mov     ebp,esp
        movss   xmm0,dword ptr [ebp+20]
        movss   xmm1,dword ptr [ebp+24]
        movss   xmm2,dword ptr [ebp+16]
        movss   xmm3,dword ptr [ebp+12]
        mov     eax,[ebp+8]
        movss   xmm4,xmm3
        mulss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax],xmm4
        mov     dword ptr [eax+4],0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],0
        mov     dword ptr [eax+16],0
        movss   xmm4,xmm2
        xorps   xmm4,dword ptr [___unnamed_float4_4]
        mulss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+20],xmm4
        mov     dword ptr [eax+24],0
        mov     dword ptr [eax+28],0
        mov     dword ptr [eax+32],0
        mov     dword ptr [eax+36],0
        subss   xmm1,xmm0
        movss   dword ptr [eax+40],xmm1
        mov     dword ptr [eax+44],0
        mulss   xmm3,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+48],xmm3
        mulss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+52],xmm2
        movss   dword ptr [eax+56],xmm0
        mov     dword ptr [eax+60],1065353216
        pop     ebp
        ret
_matrix4f_make_viewport endp

_matrix4f_transform proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [ecx+16]
        movss   xmm1,dword ptr [edx]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [ecx+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [ecx+48]
        addss   xmm1,xmm0
        movss   dword ptr [eax],xmm1
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [ecx+4]
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [ecx+20]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [ecx+36]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [ecx+52]
        addss   xmm0,xmm1
        movss   dword ptr [eax+4],xmm0
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [ecx+8]
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [ecx+24]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [ecx+40]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [ecx+56]
        addss   xmm0,xmm1
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [ecx+12]
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [ecx+28]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [ecx+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [ecx+60]
        addss   xmm0,xmm1
        movss   dword ptr [eax+12],xmm0
        pop     ebp
        ret
_matrix4f_transform endp

_rasterizer_init proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    ebx
        movss   xmm0,dword ptr [ebp+24]
        movss   xmm1,dword ptr [ebp+28]
        mov     eax,[ebp+20]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        mov     ebx,[ebp+8]
        mov     dword ptr [__dbgprintf],ebx
        mov     dword ptr [__width],edx
        mov     dword ptr [__height],ecx
        mov     dword ptr [__pitch],eax
        mov     edx,[ebp+12]
        cvtsi2ss        xmm0,edx
        mov     ecx,[ebp+16]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp+32]
        movss   xmm1,dword ptr [ebp+28]
        movss   dword ptr [ebp+28],xmm1
        push    dword ptr [ebp+28]
        movss   xmm0,dword ptr [ebp+24]
        movss   dword ptr [ebp+24],xmm0
        push    dword ptr [ebp+24]
        push    (offset __mvproj_matrix)
        call    _matrix4f_make_perspective
        add     esp,20
        movss   xmm1,dword ptr [ebp+28]
        movss   dword ptr [ebp+28],xmm1
        push    dword ptr [ebp+28]
        movss   xmm0,dword ptr [ebp+24]
        movss   dword ptr [ebp+24],xmm0
        push    dword ptr [ebp+24]
        mov     ecx,[ebp+16]
        cvtsi2ss        xmm2,ecx
        movss   dword ptr [esp-4],xmm2
        mov     edx,[ebp+12]
        cvtsi2ss        xmm2,edx
        movss   dword ptr [esp-8],xmm2
        sub     esp,8
        push    (offset __viewport_matrix)
        call    _matrix4f_make_viewport
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [ebp+24]
        movss   dword ptr [ebp+24],xmm0
        push    dword ptr [ebp+24]
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm1
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        push    (offset __clip_z_near_base)
        call    _vec4f_assign
        add     esp,20
        movss   xmm1,dword ptr [ebp+28]
        comiss  xmm1,xmm0
        jbe     label0000
        movss   xmm2,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   xmm2,dword ptr [___unnamed_float_5]
label0001:
        movss   dword ptr [ebp+24],xmm0
        movss   dword ptr [ebp+28],xmm1
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   dword ptr [esp-8],xmm2
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_z_near_norm)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp+28]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        push    (offset __clip_z_far_base)
        call    _vec4f_assign
        add     esp,20
        movss   xmm1,dword ptr [ebp+28]
        comiss  xmm1,dword ptr [ebp+24]
        jbe     label0002
        movss   xmm0,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   xmm0,dword ptr [___unnamed_float_1]
label0003:
        movss   xmm1,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm1
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_z_far_norm)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-12],xmm0
        mov     edx,[ebp+12]
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_plane_left_base)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_plane_left_norm)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-12],xmm0
        mov     edx,[ebp+12]
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_plane_right_base)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_plane_right_norm)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        mov     ecx,[ebp+16]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_plane_top_base)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_plane_top_norm)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_plane_bottom_base)
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    (offset __clip_plane_bottom_norm)
        call    _vec4f_assign
        add     esp,20
        pop     ebx
        mov     esp,ebp
        pop     ebp
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        mov     dword ptr [__videomem],eax
        pop     ebp
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        mov     eax,[ebp+8]
        mov     edi,(offset __mvproj_matrix)
        mov     esi,eax
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
        mov     eax,[ebp+8]
        mov     dword ptr [__color],eax
        pop     ebp
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        mov     dword ptr [__texture_data],edx
        mov     dword ptr [__texture_width],ecx
        mov     dword ptr [__texture_height],eax
        pop     ebp
        ret
_rasterizer_set_texture endp

__tex2d proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        movss   xmm0,dword ptr [ebp+12]
        movss   xmm1,dword ptr [ebp+8]
        mov     eax,dword ptr [__texture_width]
        dec     eax
        cvtsi2ss        xmm2,eax
        mulss   xmm2,xmm1
        cvttss2si       eax,xmm2
        mov     ecx,dword ptr [__texture_height]
        dec     ecx
        cvtsi2ss        xmm1,ecx
        mulss   xmm1,xmm0
        cvttss2si       ecx,xmm1
        imul    ecx,dword ptr [__texture_width]
        add     ecx,eax
        sal     ecx,2
        add     ecx,dword ptr [__texture_data]
        mov     eax,[ecx]
        mov     esp,ebp
        pop     ebp
        ret
__tex2d endp

__rasterize_horiz_line proc
        push    ebp
        mov     ebp,esp
        sub     esp,48
        push    esi
        push    ebx
        movss   xmm0,dword ptr [ebp+32]
        movss   xmm1,dword ptr [ebp+24]
        movss   xmm2,dword ptr [ebp+28]
        movss   xmm3,dword ptr [ebp+20]
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        mov     edx,[ebp+16]
        mov     ebx,dword ptr [__pitch]
        imul    ebx,edx
        add     ebx,dword ptr [__videomem]
        mov     edx,ecx
        sal     edx,2
        add     ebx,edx
        sal     eax,2
        add     eax,ebx
        sal     ecx,2
        sub     eax,ecx
label0000:
        mov     [ebp-48],eax
        movss   dword ptr [ebp+32],xmm0
        movss   dword ptr [ebp+24],xmm1
        movss   dword ptr [ebp+28],xmm2
        movss   dword ptr [ebp+20],xmm3
        movss   xmm1,dword ptr [ebp+24]
        movss   dword ptr [ebp+24],xmm1
        push    dword ptr [ebp+24]
        movss   xmm3,dword ptr [ebp+20]
        movss   dword ptr [ebp+20],xmm3
        push    dword ptr [ebp+20]
        call    __tex2d
        add     esp,8
        mov     ecx,eax
        sar     ecx,24
        and     ecx,255
        je      label0003
        cvtsi2ss        xmm0,ecx
        mulss   xmm0,dword ptr [___unnamed_float_6]
        mov     ecx,[ebx]
        mov     edx,ecx
        and     edx,65280
        sar     edx,8
        and     ecx,255
        mov     esi,eax
        and     esi,65280
        sar     esi,8
        and     eax,255
        cvtsi2ss        xmm2,esi
        mulss   xmm2,xmm0
        cvtsi2ss        xmm4,edx
        movss   xmm5,dword ptr [___unnamed_float_1]
        subss   xmm5,xmm0
        mulss   xmm4,xmm5
        addss   xmm2,xmm4
        cvttss2si       edx,xmm2
        cvtsi2ss        xmm2,eax
        mulss   xmm2,xmm0
        cvtsi2ss        xmm4,ecx
        movss   xmm5,dword ptr [___unnamed_float_1]
        subss   xmm5,xmm0
        mulss   xmm4,xmm5
        addss   xmm2,xmm4
        cvttss2si       eax,xmm2
        sal     edx,8
        add     edx,eax
        mov     [ebx],edx
label0003:
        addss   xmm3,dword ptr [ebp+28]
        addss   xmm1,dword ptr [ebp+32]
        add     ebx,4
        cmp     ebx,[ebp-48]
        mov     eax,[ebp-48]
        movss   xmm0,dword ptr [ebp+32]
        movss   xmm2,dword ptr [ebp+28]
        jl      label0000
        pop     ebx
        pop     esi
        mov     esp,ebp
        pop     ebp
        ret
__rasterize_horiz_line endp

__rasterize_horiz_line__unordered proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        cmp     ecx,eax
        jg      label0000
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        push    dword ptr [ebp+24]
        push    dword ptr [ebp+20]
        push    dword ptr [ebp+16]
        push    eax
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0001
label0000:
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        push    dword ptr [ebp+32]
        push    dword ptr [ebp+28]
        push    dword ptr [ebp+16]
        push    ecx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0001:
        pop     ebp
        ret
__rasterize_horiz_line__unordered endp

__rasterize_triangle_1i proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        movss   xmm0,dword ptr [ebp+36]
        movss   xmm1,dword ptr [ebp+40]
        mov     eax,[ebp+28]
        mov     ecx,[ebp+32]
        mov     edx,[ebp+24]
        mov     ebx,[ebp+16]
        mov     esi,[ebp+12]
        mov     edi,[ebp+8]
        cmp     edi,esi
        jge     label0000
        cmp     ebx,esi
        jle     label0001
        movss   dword ptr [ebp+40],xmm1
        push    dword ptr [ebp+40]
        movss   dword ptr [ebp+36],xmm0
        push    dword ptr [ebp+36]
        push    dword ptr [edx+4]
        push    dword ptr [edx]
        push    dword ptr [ebp+20]
        push    ebx
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0002
label0001:
        cmp     ebx,edi
        jge     label0003
        movss   dword ptr [ebp+40],xmm1
        push    dword ptr [ebp+40]
        movss   dword ptr [ebp+36],xmm0
        push    dword ptr [ebp+36]
        push    dword ptr [ecx+4]
        push    dword ptr [ecx]
        push    dword ptr [ebp+20]
        push    esi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0004
label0003:
        movss   dword ptr [ebp+40],xmm1
        push    dword ptr [ebp+40]
        movss   dword ptr [ebp+36],xmm0
        push    dword ptr [ebp+36]
        push    dword ptr [edx+4]
        push    dword ptr [edx]
        push    dword ptr [ebp+20]
        push    esi
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
label0004:
label0002:
        jmp     label0005
label0000:
        cmp     ebx,esi
        jge     label0006
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm1
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        push    dword ptr [ecx+4]
        push    dword ptr [ecx]
        push    dword ptr [ebp+20]
        push    edi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0007
label0006:
        cmp     ebx,edi
        jle     label0008
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm1
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        push    dword ptr [ebp+20]
        push    ebx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0009
label0008:
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm1
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        push    dword ptr [ebp+20]
        push    edi
        push    esi
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
        sub     esp,64
        push    esi
        push    ebx
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        mov     ebx,[edx+4]
        cmp     ebx,[ecx+4]
        jle     label0000
        mov     [ebp-4],edx
        mov     edx,ecx
        mov     ecx,[ebp-4]
label0000:
        mov     ebx,[edx+4]
        cmp     ebx,[eax+4]
        jle     label0001
        mov     [ebp-4],edx
        mov     edx,eax
        mov     eax,[ebp-4]
label0001:
        mov     ebx,[ecx+4]
        cmp     ebx,[eax+4]
        jle     label0002
        mov     [ebp+8],edx
        mov     edx,ecx
        mov     ecx,eax
        mov     eax,edx
        mov     edx,[ebp+8]
label0002:
        mov     ebx,[edx+4]
        cmp     ebx,[eax+4]
        jne     label0003
        cmp     dword ptr [edx+4],0
        jl      label0004
        mov     ebx,[edx+4]
        cmp     ebx,dword ptr [__height]
        jge     label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        mov     ebx,eax
        add     ebx,8
        push    ebx
        mov     ebx,ecx
        add     ebx,8
        push    ebx
        mov     ebx,edx
        add     ebx,8
        push    ebx
        push    dword ptr [edx+4]
        push    dword ptr [eax]
        push    dword ptr [ecx]
        push    dword ptr [edx]
        call    __rasterize_triangle_1i
        add     esp,36
label0004:
        pop     ebx
        pop     esi
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     ebx,[edx+4]
label0006:
        mov     esi,[ecx+4]
        cmp     esi,ebx
        jle     label0007
        mov     [ebp+16],eax
        mov     eax,ebx
        sub     eax,[edx+4]
        mov     esi,[ecx]
        sub     esi,[edx]
        imul    eax,esi
        mov     esi,[ecx+4]
        sub     esi,[edx+4]
        mov     [ebp+8],edx
        cdq
        idiv    esi
        mov     edx,[ebp+8]
        add     eax,[edx]
        mov     [ebp-44],eax
        mov     eax,ebx
        sub     eax,[edx+4]
        mov     [ebp-48],eax
        mov     eax,[ebp+16]
        mov     esi,[eax]
        sub     esi,[edx]
        mov     [ebp+16],eax
        mov     eax,[ebp-48]
        imul    eax,esi
        mov     [ebp-48],eax
        mov     eax,[ebp+16]
        mov     esi,[eax+4]
        sub     esi,[edx+4]
        mov     [ebp+8],edx
        mov     [ebp+16],eax
        mov     eax,[ebp-48]
        cdq
        idiv    esi
        mov     edx,[ebp+8]
        add     eax,[edx]
        mov     esi,ebx
        sub     esi,[edx+4]
        cvtsi2ss        xmm0,esi
        movss   xmm1,dword ptr [ecx+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        mov     esi,[ecx+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [edx+8]
        mov     esi,ebx
        sub     esi,[edx+4]
        cvtsi2ss        xmm1,esi
        mov     [ebp-48],eax
        mov     eax,[ebp+16]
        movss   xmm2,dword ptr [eax+8]
        subss   xmm2,dword ptr [edx+8]
        mulss   xmm1,xmm2
        mov     esi,[eax+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm2,esi
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [edx+8]
        mov     esi,ebx
        sub     esi,[edx+4]
        cvtsi2ss        xmm2,esi
        movss   xmm3,dword ptr [ecx+12]
        subss   xmm3,dword ptr [edx+12]
        mulss   xmm2,xmm3
        mov     esi,[ecx+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm3,esi
        divss   xmm2,xmm3
        addss   xmm2,dword ptr [edx+12]
        mov     esi,ebx
        sub     esi,[edx+4]
        cvtsi2ss        xmm3,esi
        movss   xmm4,dword ptr [eax+12]
        subss   xmm4,dword ptr [edx+12]
        mulss   xmm3,xmm4
        mov     esi,[eax+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm4,esi
        divss   xmm3,xmm4
        addss   xmm3,dword ptr [edx+12]
        mov     esi,[ebp-48]
        sub     esi,[ebp-44]
        cvtsi2ss        xmm4,esi
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     esi,[ebp-48]
        sub     esi,[ebp-44]
        cvtsi2ss        xmm4,esi
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
        mov     [ebp+12],ecx
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm1
        movss   dword ptr [esp-20],xmm2
        movss   dword ptr [esp-24],xmm0
        sub     esp,24
        push    ebx
        push    dword ptr [ebp-48]
        push    dword ptr [ebp-44]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        inc     ebx
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        jmp     label0006
label0007:
        mov     [ebp+16],eax
        mov     eax,[ecx+4]
        sub     eax,[edx+4]
        mov     [ebp-52],eax
        mov     eax,[ebp+16]
        mov     ebx,[eax]
        sub     ebx,[edx]
        mov     [ebp+16],eax
        mov     eax,[ebp-52]
        imul    eax,ebx
        mov     [ebp-52],eax
        mov     eax,[ebp+16]
        mov     ebx,[eax+4]
        sub     ebx,[edx+4]
        mov     [ebp+8],edx
        mov     [ebp+16],eax
        mov     eax,[ebp-52]
        cdq
        idiv    ebx
        mov     edx,[ebp+8]
        add     eax,[edx]
        mov     ebx,[ecx+4]
        sub     ebx,[edx+4]
        cvtsi2ss        xmm0,ebx
        mov     [ebp-52],eax
        mov     eax,[ebp+16]
        movss   xmm1,dword ptr [eax+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        mov     ebx,[eax+4]
        sub     ebx,[edx+4]
        cvtsi2ss        xmm1,ebx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [edx+8]
        mov     ebx,[ecx+4]
        sub     ebx,[edx+4]
        cvtsi2ss        xmm1,ebx
        movss   xmm2,dword ptr [eax+12]
        subss   xmm2,dword ptr [edx+12]
        mulss   xmm1,xmm2
        mov     ebx,[eax+4]
        sub     ebx,[edx+4]
        cvtsi2ss        xmm2,ebx
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [edx+12]
        movss   xmm2,xmm0
        subss   xmm2,dword ptr [ecx+8]
        mov     ebx,[ebp-52]
        sub     ebx,[ecx]
        cvtsi2ss        xmm3,ebx
        divss   xmm2,xmm3
        movss   xmm3,xmm1
        subss   xmm3,dword ptr [ecx+12]
        mov     ebx,[ebp-52]
        sub     ebx,[ecx]
        cvtsi2ss        xmm4,ebx
        divss   xmm3,xmm4
        mov     [ebp+12],ecx
        movss   dword ptr [esp-4],xmm3
        movss   dword ptr [esp-8],xmm2
        sub     esp,8
        mov     ecx,[ebp+12]
        push    dword ptr [ecx+12]
        push    dword ptr [ecx+8]
        movss   dword ptr [esp-4],xmm1
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        push    dword ptr [ecx+4]
        push    dword ptr [ecx]
        push    dword ptr [ebp-52]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        mov     eax,[ecx+4]
        inc     eax
        mov     ebx,eax
label0009:
        mov     edx,[ebp+16]
        mov     eax,[edx+4]
        cmp     eax,ebx
        jle     label000a
        mov     eax,ebx
        sub     eax,[ecx+4]
        mov     [ebp-56],eax
        mov     eax,[ebp+16]
        mov     edx,[eax]
        sub     edx,[ecx]
        mov     [ebp+16],eax
        mov     eax,[ebp-56]
        imul    eax,edx
        mov     [ebp-56],eax
        mov     eax,[ebp+16]
        mov     edx,[eax+4]
        sub     edx,[ecx+4]
        mov     [ebp-60],edx
        mov     [ebp+16],eax
        mov     eax,[ebp-56]
        cdq
        idiv    dword ptr [ebp-60]
        add     eax,[ecx]
        mov     [ebp-56],eax
        mov     eax,ebx
        mov     edx,[ebp+8]
        sub     eax,[edx+4]
        mov     [ebp-64],eax
        mov     eax,[ebp+16]
        mov     esi,[eax]
        sub     esi,[edx]
        mov     [ebp+16],eax
        mov     eax,[ebp-64]
        imul    eax,esi
        mov     [ebp-64],eax
        mov     eax,[ebp+16]
        mov     esi,[eax+4]
        sub     esi,[edx+4]
        mov     [ebp+8],edx
        mov     [ebp+16],eax
        mov     eax,[ebp-64]
        cdq
        idiv    esi
        mov     edx,[ebp+8]
        add     eax,[edx]
        mov     esi,ebx
        sub     esi,[ecx+4]
        cvtsi2ss        xmm0,esi
        mov     [ebp-64],eax
        mov     eax,[ebp+16]
        movss   xmm1,dword ptr [eax+8]
        subss   xmm1,dword ptr [ecx+8]
        mulss   xmm0,xmm1
        mov     esi,[eax+4]
        sub     esi,[ecx+4]
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [ecx+8]
        mov     esi,ebx
        sub     esi,[edx+4]
        cvtsi2ss        xmm1,esi
        movss   xmm2,dword ptr [eax+8]
        subss   xmm2,dword ptr [edx+8]
        mulss   xmm1,xmm2
        mov     esi,[eax+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm2,esi
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [edx+8]
        mov     esi,ebx
        sub     esi,[ecx+4]
        cvtsi2ss        xmm2,esi
        movss   xmm3,dword ptr [eax+12]
        subss   xmm3,dword ptr [ecx+12]
        mulss   xmm2,xmm3
        mov     esi,[eax+4]
        sub     esi,[ecx+4]
        cvtsi2ss        xmm3,esi
        divss   xmm2,xmm3
        addss   xmm2,dword ptr [ecx+12]
        mov     esi,ebx
        sub     esi,[edx+4]
        cvtsi2ss        xmm3,esi
        movss   xmm4,dword ptr [eax+12]
        subss   xmm4,dword ptr [edx+12]
        mulss   xmm3,xmm4
        mov     esi,[eax+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm4,esi
        divss   xmm3,xmm4
        addss   xmm3,dword ptr [edx+12]
        mov     esi,[ebp-64]
        sub     esi,[ebp-56]
        cvtsi2ss        xmm4,esi
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     esi,[ebp-64]
        sub     esi,[ebp-56]
        cvtsi2ss        xmm4,esi
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
        mov     [ebp+12],ecx
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm1
        movss   dword ptr [esp-20],xmm2
        movss   dword ptr [esp-24],xmm0
        sub     esp,24
        push    ebx
        push    dword ptr [ebp-64]
        push    dword ptr [ebp-56]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        inc     ebx
        mov     ecx,[ebp+12]
        jmp     label0009
label000a:
        pop     ebx
        pop     esi
        mov     esp,ebp
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
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        mov     dword ptr [ecx+192],0
        mov     edx,eax
        mov     ebx,eax
        add     ebx,24
label0001:
        mov     esi,[eax+192]
        imul    esi,24
        mov     edi,eax
        add     edi,esi
        cmp     edi,ebx
        jle     label0002
        mov     [ebp+12],eax
        mov     [ebp+8],ecx
        mov     [ebp-4],edx
        push    dword ptr [ebp+16]
        push    dword ptr [ebp-4]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-64],xmm0
        push    dword ptr [ebp+16]
        push    ebx
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,dword ptr [ebp-64]
        ja      label0003
        mov     ecx,[ebp+8]
        mov     eax,[ecx+192]
        inc     dword ptr [ecx+192]
        imul    eax,24
        mov     edx,[ebp-4]
        movq    xmm1,qword ptr [edx]
        movq    qword ptr [ecx+eax],xmm1
        movq    xmm1,qword ptr [edx+8]
        movq    qword ptr [ecx+eax+8],xmm1
        movq    xmm1,qword ptr [edx+16]
        movq    qword ptr [ecx+eax+16],xmm1
        mov     [ebp+8],ecx
        mov     [ebp-4],edx
        movsd   qword ptr [ebp-72],xmm1
label0003:
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,dword ptr [ebp-64]
        jae     label0006
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,xmm0
        ja      label0005
label0006:
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,xmm0
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-64]
        jbe     label0004
label0005:
        push    dword ptr [ebp-4]
        push    dword ptr [ebp+16]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp-4]
        push    ebx
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-76],xmm0
        push    dword ptr [ebp+20]
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-80],xmm0
        movss   xmm0,dword ptr [ebp-76]
        divss   xmm0,dword ptr [ebp-80]
        movss   dword ptr [ebp-76],xmm0
        push    dword ptr [ebp-76]
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_mul
        add     esp,8
        lea     eax,[ebp-40]
        push    eax
        push    dword ptr [ebp-4]
        mov     ecx,[ebp+8]
        mov     eax,[ecx+192]
        imul    eax,24
        mov     edx,ecx
        add     edx,eax
        push    edx
        call    _vec4f_add
        add     esp,12
        mov     eax,[ebp-4]
        add     eax,16
        push    eax
        mov     eax,ebx
        add     eax,16
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
        mov     eax,[ebp-4]
        add     eax,16
        push    eax
        mov     ecx,[ebp+8]
        mov     eax,[ecx+192]
        imul    eax,24
        mov     edx,ecx
        add     edx,eax
        add     edx,16
        push    edx
        call    _vec2f_add
        add     esp,12
        inc     dword ptr [ecx+192]
        mov     [ebp+8],ecx
label0004:
        mov     edx,[ebp-4]
        add     edx,24
        add     ebx,24
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        jmp     label0001
label0002:
        mov     eax,[ecx+192]
        inc     dword ptr [ecx+192]
        imul    eax,24
        movq    xmm0,qword ptr [ecx]
        movq    qword ptr [ecx+eax],xmm0
        movq    xmm0,qword ptr [ecx+8]
        movq    qword ptr [ecx+eax+8],xmm0
        movq    xmm0,qword ptr [ecx+16]
        movq    qword ptr [ecx+eax+16],xmm0
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
__clip_on_plain endp

__clip_poligon proc
        push    ebp
        mov     ebp,esp
        sub     esp,196
        mov     eax,[ebp+8]
        push    (offset __clip_z_far_norm)
        push    (offset __clip_z_far_base)
        mov     eax,[ebp+8]
        mov     [ebp+8],eax
        push    dword ptr [ebp+8]
        lea     ecx,[ebp-196]
        push    ecx
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_z_near_norm)
        push    (offset __clip_z_near_base)
        lea     eax,[ebp-196]
        push    eax
        mov     eax,[ebp+8]
        mov     [ebp+8],eax
        push    dword ptr [ebp+8]
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_left_norm)
        push    (offset __clip_plane_left_base)
        mov     eax,[ebp+8]
        mov     [ebp+8],eax
        push    dword ptr [ebp+8]
        lea     ecx,[ebp-196]
        push    ecx
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_right_norm)
        push    (offset __clip_plane_right_base)
        lea     eax,[ebp-196]
        push    eax
        mov     eax,[ebp+8]
        mov     [ebp+8],eax
        push    dword ptr [ebp+8]
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_top_norm)
        push    (offset __clip_plane_top_base)
        mov     eax,[ebp+8]
        mov     [ebp+8],eax
        push    dword ptr [ebp+8]
        lea     ecx,[ebp-196]
        push    ecx
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_bottom_norm)
        push    (offset __clip_plane_bottom_base)
        lea     eax,[ebp-196]
        push    eax
        mov     eax,[ebp+8]
        mov     [ebp+8],eax
        push    dword ptr [ebp+8]
        call    __clip_on_plain
        add     esp,16
        cmp     dword ptr [eax+192],1
        setg    al
        movzx   eax,al
        mov     esp,ebp
        pop     ebp
        ret
__clip_poligon endp

__transform_to_screen_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,24
        mov     eax,[ebp+8]
        push    (offset __viewport_matrix)
        push    dword ptr [ebp+12]
        lea     eax,[ebp-16]
        push    eax
        call    _matrix4f_transform
        add     esp,12
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [ebp-4]
        movss   xmm1,dword ptr [ebp-16]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
        mov     [ebp-24],eax
        mov     eax,[ebp+8]
        mov     ecx,[ebp-24]
        mov     [eax],ecx
        movss   xmm1,dword ptr [ebp-12]
        mulss   xmm1,xmm0
        cvttss2si       ecx,xmm1
        mov     [eax+4],ecx
        cmp     dword ptr [eax],0
        jl      label0001
        mov     ecx,[eax]
        cmp     ecx,dword ptr [__width]
        jge     label0001
        cmp     dword ptr [eax+4],0
        jl      label0001
        mov     eax,[eax+4]
        cmp     eax,dword ptr [__height]
        jl      label0000
label0001:
        mov     dword ptr ds:[0],0
label0000:
        mov     esp,ebp
        pop     ebp
        ret
__transform_to_screen_space endp

__rasterize_polygon_4f proc
        push    ebp
        mov     ebp,esp
        sub     esp,148
        mov     eax,[ebp+8]
        mov     eax,[ebp+8]
        mov     [ebp+8],eax
        push    dword ptr [ebp+8]
        call    __clip_poligon
        add     esp,4
        mov     [ebp+8],eax
        cmp     eax,0
        jne     label0000
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        mov     eax,[ebp+8]
        cmp     dword ptr [eax+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     ecx,0
label0003:
        mov     edx,[eax+192]
        cmp     edx,ecx
        jle     label0004
        mov     [ebp+8],eax
        mov     [ebp-136],ecx
        mov     eax,[ebp+8]
        mov     ecx,[ebp-136]
        imul    ecx,24
        add     eax,ecx
        push    eax
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
        mov     edx,[ebp-136]
        imul    edx,24
        mov     [ebp-140],eax
        mov     eax,[ebp+8]
        movq    xmm0,qword ptr [eax+edx+16]
        mov     [ebp+8],eax
        mov     eax,[ebp-140]
        movq    qword ptr [eax+ecx+8],xmm0
        inc     dword ptr [ebp-136]
        mov     eax,[ebp+8]
        mov     ecx,[ebp-136]
        movsd   qword ptr [ebp-148],xmm0
        jmp     label0003
label0004:
        mov     ecx,2
label0006:
        mov     edx,[eax+192]
        dec     edx
        cmp     edx,ecx
        jle     label0007
        mov     [ebp+8],eax
        mov     [ebp-136],ecx
        lea     eax,[ebp-132]
        mov     ecx,[ebp-136]
        sal     ecx,4
        add     eax,ecx
        push    eax
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
        mov     eax,[ebp+8]
        mov     ecx,[ebp-136]
        jmp     label0006
label0007:
        mov     esp,ebp
        pop     ebp
        ret
__rasterize_polygon_4f endp

__transform_to_projection_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        mov     eax,[ebp+12]
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [eax+8]
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        lea     eax,[ebp-16]
        push    eax
        call    _vec4f_assign
        add     esp,20
        push    (offset __mvproj_matrix)
        lea     eax,[ebp-16]
        push    eax
        push    dword ptr [ebp+8]
        call    _matrix4f_transform
        add     esp,12
        mov     esp,ebp
        pop     ebp
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        push    ebp
        mov     ebp,esp
        sub     esp,196
        mov     eax,[ebp+28]
        mov     ecx,[ebp+24]
        mov     edx,[ebp+20]
        push    dword ptr [ebp+8]
        lea     eax,[ebp-196]
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     edx,[ebp+20]
        movq    xmm0,qword ptr [edx]
        movq    qword ptr [ebp-180],xmm0
        push    dword ptr [ebp+12]
        lea     eax,[ebp-196]
        add     eax,24
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     ecx,[ebp+24]
        movq    xmm0,qword ptr [ecx]
        movq    qword ptr [ebp-156],xmm0
        push    dword ptr [ebp+16]
        lea     eax,[ebp-196]
        add     eax,48
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     eax,[ebp+28]
        movq    xmm0,qword ptr [eax]
        movq    qword ptr [ebp-132],xmm0
        movq    xmm0,qword ptr [ebp-196]
        movq    qword ptr [ebp-124],xmm0
        movq    xmm0,qword ptr [ebp-188]
        movq    qword ptr [ebp-116],xmm0
        movq    xmm0,qword ptr [ebp-180]
        movq    qword ptr [ebp-108],xmm0
        mov     dword ptr [ebp-4],4
        lea     eax,[ebp-196]
        push    eax
        call    __rasterize_polygon_4f
        add     esp,4
        mov     esp,ebp
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
