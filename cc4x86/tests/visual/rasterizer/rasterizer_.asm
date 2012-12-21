
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
        mov     eax,[ebp+12]
        mov     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        mov     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        mov     eax,4
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_vec2f_add endp

_vec2f_subtract proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+12]
        mov     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,4
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_vec2f_subtract endp

_vec2f_mul proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ebp+12]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ebp+12]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_vec2f_mul endp

_vec4f_assign proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+12]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+16]
        movss   dword ptr [eax],xmm0
        mov     eax,8
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+20]
        movss   dword ptr [eax],xmm0
        mov     eax,12
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+24]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_vec4f_assign endp

_vec4f_add proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+12]
        mov     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        mov     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        mov     eax,4
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,8
        add     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        mov     eax,8
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,12
        add     eax,[ebp+12]
        mov     ecx,12
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        mov     eax,12
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_vec4f_add endp

_vec4f_subtract proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+12]
        mov     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,4
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,8
        add     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,8
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,12
        add     eax,[ebp+12]
        mov     ecx,12
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,12
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_vec4f_subtract endp

_vec4f_dot proc
        push    ebp
        mov     ebp,esp
        mov     eax,4
        add     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[ebp+12]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        mov     eax,[ebp+8]
        mov     ecx,[ebp+12]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        mov     eax,8
        add     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[ebp+12]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        addss   xmm1,xmm0
        mov     eax,12
        add     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[ebp+12]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        addss   xmm1,xmm0
        movss   xmm0,xmm1
        pop     ebp
        ret
_vec4f_dot endp

_vec4f_mul proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ebp+12]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ebp+12]
        movss   dword ptr [eax],xmm0
        mov     eax,8
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ebp+12]
        movss   dword ptr [eax],xmm0
        mov     eax,12
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ebp+12]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        movss   xmm0,dword ptr [ebp+20]
        mulss   xmm0,dword ptr [ebp+12]
        movss   dword ptr [ebp-4],xmm0
        movss   xmm0,dword ptr [ebp-4]
        mulss   xmm0,dword ptr [ebp+24]
        movss   dword ptr [ebp-8],xmm0
        mov     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+12]
        divss   xmm0,dword ptr [ebp-8]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,8
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,12
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,16
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,20
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+12]
        divss   xmm0,dword ptr [ebp-4]
        movss   dword ptr [eax],xmm0
        mov     eax,24
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,28
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,32
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,36
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,40
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+16]
        subss   xmm0,dword ptr [ebp+12]
        movss   xmm1,dword ptr [ebp+16]
        divss   xmm1,xmm0
        movss   dword ptr [eax],xmm1
        mov     eax,44
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [eax],xmm0
        mov     eax,48
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,52
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,56
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+12]
        mulss   xmm0,dword ptr [ebp+16]
        movss   xmm1,dword ptr [ebp+12]
        subss   xmm1,dword ptr [ebp+16]
        divss   xmm0,xmm1
        movss   dword ptr [eax],xmm0
        mov     eax,60
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     esp,ebp
        pop     ebp
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+12]
        mulss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax],xmm0
        mov     eax,4
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,8
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,12
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,16
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,20
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+16]
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        mulss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax],xmm0
        mov     eax,24
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,28
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,32
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,36
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,40
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+24]
        subss   xmm0,dword ptr [ebp+20]
        movss   dword ptr [eax],xmm0
        mov     eax,44
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        mov     eax,48
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+12]
        mulss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax],xmm0
        mov     eax,52
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+16]
        mulss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax],xmm0
        mov     eax,56
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [ebp+20]
        movss   dword ptr [eax],xmm0
        mov     eax,60
        add     eax,[ebp+8]
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_matrix4f_make_viewport endp

_matrix4f_transform proc
        push    ebp
        mov     ebp,esp
        mov     eax,4
        add     eax,[ebp+12]
        mov     ecx,16
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        mov     eax,[ebp+12]
        mov     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        mov     eax,8
        add     eax,[ebp+12]
        mov     ecx,32
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        addss   xmm1,xmm0
        mov     eax,12
        add     eax,[ebp+12]
        mov     ecx,48
        add     ecx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        addss   xmm1,xmm0
        mov     eax,[ebp+8]
        movss   dword ptr [eax],xmm1
        mov     eax,4
        add     eax,[ebp+16]
        mov     ecx,[ebp+12]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [eax]
        mov     eax,4
        add     eax,[ebp+12]
        mov     ecx,20
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+12]
        mov     ecx,36
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,12
        add     eax,[ebp+12]
        mov     ecx,52
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,4
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,[ebp+12]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [eax]
        mov     eax,4
        add     eax,[ebp+12]
        mov     ecx,24
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+12]
        mov     ecx,40
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,12
        add     eax,[ebp+12]
        mov     ecx,56
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        mov     eax,12
        add     eax,[ebp+16]
        mov     ecx,[ebp+12]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [eax]
        mov     eax,4
        add     eax,[ebp+12]
        mov     ecx,28
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+12]
        mov     ecx,44
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,12
        add     eax,[ebp+12]
        mov     ecx,60
        add     ecx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm0,xmm1
        mov     eax,12
        add     eax,[ebp+8]
        movss   dword ptr [eax],xmm0
        pop     ebp
        ret
_matrix4f_transform endp

_rasterizer_init proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,[ebp+8]
        mov     dword ptr [__dbgprintf],eax
        mov     eax,[ebp+12]
        mov     dword ptr [__width],eax
        mov     eax,[ebp+16]
        mov     dword ptr [__height],eax
        mov     eax,[ebp+20]
        mov     dword ptr [__pitch],eax
        cvtsi2ss        xmm0,dword ptr [ebp+12]
        cvtsi2ss        xmm1,dword ptr [ebp+16]
        divss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp+32]
        push    dword ptr [ebp+28]
        push    dword ptr [ebp+24]
        lea     eax,dword ptr [__mvproj_matrix]
        push    eax
        call    _matrix4f_make_perspective
        add     esp,20
        push    dword ptr [ebp+28]
        push    dword ptr [ebp+24]
        cvtsi2ss        xmm0,dword ptr [ebp+16]
        movss   dword ptr [esp-4],xmm0
        cvtsi2ss        xmm0,dword ptr [ebp+12]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        lea     eax,dword ptr [__viewport_matrix]
        push    eax
        call    _matrix4f_make_viewport
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp+24]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        lea     eax,dword ptr [__clip_z_near_base]
        push    eax
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [ebp+28]
        comiss  xmm0,dword ptr [ebp+24]
        jbe     label0000
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-4],xmm0
        jmp     label0001
label0000:
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   dword ptr [ebp-4],xmm0
label0001:
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp-4]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        lea     eax,dword ptr [__clip_z_near_norm]
        push    eax
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
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [ebp+28]
        comiss  xmm0,dword ptr [ebp+24]
        jbe     label0002
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   dword ptr [ebp-8],xmm0
        jmp     label0003
label0002:
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-8],xmm0
label0003:
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    dword ptr [ebp-8]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-12],xmm0
        cvtsi2ss        xmm0,dword ptr [ebp+12]
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
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
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-12],xmm0
        cvtsi2ss        xmm0,dword ptr [ebp+12]
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        lea     eax,dword ptr [__clip_plane_right_base]
        push    eax
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
        lea     eax,dword ptr [__clip_plane_right_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        cvtsi2ss        xmm0,dword ptr [ebp+16]
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   dword ptr [esp-12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
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
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
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
        lea     eax,dword ptr [__clip_plane_bottom_base]
        push    eax
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
        lea     eax,dword ptr [__clip_plane_bottom_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
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
        mov     eax,[ebp+8]
        mov     dword ptr [__texture_data],eax
        mov     eax,[ebp+12]
        mov     dword ptr [__texture_width],eax
        mov     eax,[ebp+16]
        mov     dword ptr [__texture_height],eax
        pop     ebp
        ret
_rasterizer_set_texture endp

__tex2d proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,dword ptr [__texture_width]
        dec     eax
        cvtsi2ss        xmm0,eax
        mulss   xmm0,dword ptr [ebp+8]
        cvttss2si       eax,xmm0
        mov     [ebp-4],eax
        mov     eax,dword ptr [__texture_height]
        dec     eax
        cvtsi2ss        xmm0,eax
        mulss   xmm0,dword ptr [ebp+12]
        cvttss2si       eax,xmm0
        mov     [ebp-8],eax
        mov     eax,[ebp-8]
        imul    eax,dword ptr [__texture_width]
        add     eax,[ebp-4]
        sal     eax,2
        add     eax,dword ptr [__texture_data]
        mov     eax,[eax]
        mov     esp,ebp
        pop     ebp
        ret
__tex2d endp

__rasterize_horiz_line proc
        push    ebp
        mov     ebp,esp
        sub     esp,44
        mov     eax,dword ptr [__pitch]
        imul    eax,[ebp+16]
        add     eax,dword ptr [__videomem]
        mov     ecx,[ebp+8]
        sal     ecx,2
        add     eax,ecx
        mov     [ebp-4],eax
        mov     eax,[ebp+12]
        sal     eax,2
        add     eax,[ebp-4]
        mov     ecx,[ebp+8]
        sal     ecx,2
        sub     eax,ecx
        mov     [ebp-8],eax
label0000:
        push    dword ptr [ebp+24]
        push    dword ptr [ebp+20]
        call    __tex2d
        add     esp,8
        mov     [ebp-12],eax
        mov     eax,[ebp-12]
        sar     eax,24
        and     eax,255
        mov     [ebp-40],eax
        cmp     dword ptr [ebp-40],0
        je      label0003
        cvtsi2ss        xmm0,dword ptr [ebp-40]
        mulss   xmm0,dword ptr [___unnamed_float_6]
        movss   dword ptr [ebp-44],xmm0
        mov     eax,[ebp-4]
        mov     eax,[eax]
        mov     [ebp-28],eax
        mov     eax,[ebp-28]
        and     eax,65280
        sar     eax,8
        mov     [ebp-32],eax
        mov     eax,[ebp-28]
        and     eax,255
        mov     [ebp-36],eax
        mov     eax,[ebp-12]
        and     eax,65280
        sar     eax,8
        mov     [ebp-20],eax
        mov     eax,[ebp-12]
        and     eax,255
        mov     [ebp-24],eax
        cvtsi2ss        xmm0,dword ptr [ebp-20]
        mulss   xmm0,dword ptr [ebp-44]
        cvtsi2ss        xmm1,dword ptr [ebp-32]
        movss   xmm2,dword ptr [___unnamed_float_1]
        subss   xmm2,dword ptr [ebp-44]
        mulss   xmm1,xmm2
        addss   xmm0,xmm1
        cvttss2si       eax,xmm0
        mov     [ebp-20],eax
        cvtsi2ss        xmm0,dword ptr [ebp-24]
        mulss   xmm0,dword ptr [ebp-44]
        cvtsi2ss        xmm1,dword ptr [ebp-36]
        movss   xmm2,dword ptr [___unnamed_float_1]
        subss   xmm2,dword ptr [ebp-44]
        mulss   xmm1,xmm2
        addss   xmm0,xmm1
        cvttss2si       eax,xmm0
        mov     [ebp-24],eax
        mov     eax,[ebp-20]
        sal     eax,8
        add     eax,[ebp-24]
        mov     [ebp-16],eax
        mov     eax,[ebp-4]
        mov     ecx,[ebp-16]
        mov     [eax],ecx
label0003:
        movss   xmm0,dword ptr [ebp+20]
        addss   xmm0,dword ptr [ebp+28]
        movss   dword ptr [ebp+20],xmm0
        movss   xmm0,dword ptr [ebp+24]
        addss   xmm0,dword ptr [ebp+32]
        movss   dword ptr [ebp+24],xmm0
        add     dword ptr [ebp-4],4
        mov     eax,[ebp-4]
        cmp     eax,[ebp-8]
        jl      label0000
        mov     esp,ebp
        pop     ebp
        ret
__rasterize_horiz_line endp

__rasterize_horiz_line__unordered proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        cmp     eax,[ebp+12]
        jg      label0000
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        push    dword ptr [ebp+24]
        push    dword ptr [ebp+20]
        push    dword ptr [ebp+16]
        push    dword ptr [ebp+12]
        push    dword ptr [ebp+8]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0001
label0000:
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        push    dword ptr [ebp+32]
        push    dword ptr [ebp+28]
        push    dword ptr [ebp+16]
        push    dword ptr [ebp+8]
        push    dword ptr [ebp+12]
        call    __rasterize_horiz_line
        add     esp,28
label0001:
        pop     ebp
        ret
__rasterize_horiz_line__unordered endp

__rasterize_triangle_1i proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        cmp     eax,[ebp+12]
        jge     label0000
        mov     eax,[ebp+16]
        cmp     eax,[ebp+12]
        jle     label0001
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        mov     eax,4
        add     eax,[ebp+24]
        push    dword ptr [eax]
        mov     eax,[ebp+24]
        push    dword ptr [eax]
        push    dword ptr [ebp+20]
        push    dword ptr [ebp+16]
        push    dword ptr [ebp+8]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0002
label0001:
        mov     eax,[ebp+16]
        cmp     eax,[ebp+8]
        jge     label0003
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        mov     eax,4
        add     eax,[ebp+32]
        push    dword ptr [eax]
        mov     eax,[ebp+32]
        push    dword ptr [eax]
        push    dword ptr [ebp+20]
        push    dword ptr [ebp+12]
        push    dword ptr [ebp+16]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0004
label0003:
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        mov     eax,4
        add     eax,[ebp+24]
        push    dword ptr [eax]
        mov     eax,[ebp+24]
        push    dword ptr [eax]
        push    dword ptr [ebp+20]
        push    dword ptr [ebp+12]
        push    dword ptr [ebp+8]
        call    __rasterize_horiz_line
        add     esp,28
label0004:
label0002:
        jmp     label0005
label0000:
        mov     eax,[ebp+16]
        cmp     eax,[ebp+12]
        jge     label0006
        movss   xmm0,dword ptr [ebp+40]
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [ebp+36]
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        mov     eax,4
        add     eax,[ebp+32]
        push    dword ptr [eax]
        mov     eax,[ebp+32]
        push    dword ptr [eax]
        push    dword ptr [ebp+20]
        push    dword ptr [ebp+8]
        push    dword ptr [ebp+16]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0007
label0006:
        mov     eax,[ebp+16]
        cmp     eax,[ebp+8]
        jle     label0008
        movss   xmm0,dword ptr [ebp+40]
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [ebp+36]
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        mov     eax,4
        add     eax,[ebp+28]
        push    dword ptr [eax]
        mov     eax,[ebp+28]
        push    dword ptr [eax]
        push    dword ptr [ebp+20]
        push    dword ptr [ebp+16]
        push    dword ptr [ebp+12]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0009
label0008:
        movss   xmm0,dword ptr [ebp+40]
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [ebp+36]
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        mov     eax,4
        add     eax,[ebp+28]
        push    dword ptr [eax]
        mov     eax,[ebp+28]
        push    dword ptr [eax]
        push    dword ptr [ebp+20]
        push    dword ptr [ebp+8]
        push    dword ptr [ebp+12]
        call    __rasterize_horiz_line
        add     esp,28
label0009:
label0007:
label0005:
        pop     ebp
        ret
__rasterize_triangle_1i endp

__rasterize_triangle_2i proc
        push    ebp
        mov     ebp,esp
        sub     esp,60
        mov     eax,[ebp+8]
        mov     ecx,[ebp+12]
        mov     eax,[eax+4]
        cmp     eax,[ecx+4]
        jle     label0000
        mov     eax,[ebp+8]
        mov     [ebp-4],eax
        mov     eax,[ebp+12]
        mov     [ebp+8],eax
        mov     eax,[ebp-4]
        mov     [ebp+12],eax
label0000:
        mov     eax,[ebp+8]
        mov     ecx,[ebp+16]
        mov     eax,[eax+4]
        cmp     eax,[ecx+4]
        jle     label0001
        mov     eax,[ebp+8]
        mov     [ebp-4],eax
        mov     eax,[ebp+16]
        mov     [ebp+8],eax
        mov     eax,[ebp-4]
        mov     [ebp+16],eax
label0001:
        mov     eax,[ebp+12]
        mov     ecx,[ebp+16]
        mov     eax,[eax+4]
        cmp     eax,[ecx+4]
        jle     label0002
        mov     eax,[ebp+12]
        mov     [ebp-4],eax
        mov     eax,[ebp+16]
        mov     [ebp+12],eax
        mov     eax,[ebp-4]
        mov     [ebp+16],eax
label0002:
        mov     eax,[ebp+8]
        mov     ecx,[ebp+16]
        mov     eax,[eax+4]
        cmp     eax,[ecx+4]
        jne     label0003
        mov     eax,[ebp+8]
        cmp     dword ptr [eax+4],0
        jl      label0004
        mov     eax,[ebp+8]
        mov     eax,[eax+4]
        cmp     eax,dword ptr [__height]
        jge     label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        mov     eax,8
        add     eax,[ebp+16]
        push    eax
        mov     eax,8
        add     eax,[ebp+12]
        push    eax
        mov     eax,8
        add     eax,[ebp+8]
        push    eax
        mov     eax,[ebp+8]
        push    dword ptr [eax+4]
        mov     eax,[ebp+16]
        push    dword ptr [eax]
        mov     eax,[ebp+12]
        push    dword ptr [eax]
        mov     eax,[ebp+8]
        push    dword ptr [eax]
        call    __rasterize_triangle_1i
        add     esp,36
label0004:
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,[ebp+8]
        mov     eax,[eax+4]
        mov     [ebp-16],eax
label0006:
        mov     eax,[ebp+12]
        mov     eax,[eax+4]
        cmp     eax,[ebp-16]
        jle     label0007
        mov     eax,[ebp+8]
        mov     [ebp-44],eax
        mov     eax,[ebp-16]
        mov     ecx,[ebp-44]
        sub     eax,[ecx+4]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cdq
        idiv    ecx
        mov     ecx,[ebp+8]
        add     eax,[ecx]
        mov     [ebp-8],eax
        mov     eax,[ebp+8]
        mov     [ebp-48],eax
        mov     eax,[ebp-16]
        mov     ecx,[ebp-48]
        sub     eax,[ecx+4]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+8]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     ecx,[ebp+16]
        mov     edx,[ebp+8]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cdq
        idiv    ecx
        mov     ecx,[ebp+8]
        add     eax,[ecx]
        mov     [ebp-12],eax
        mov     eax,[ebp+8]
        mov     ecx,[ebp-16]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        mov     eax,8
        add     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[ebp+8]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        mulss   xmm0,xmm1
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        addss   xmm0,dword ptr [eax]
        movss   dword ptr [ebp-20],xmm0
        mov     eax,[ebp+8]
        mov     ecx,[ebp-16]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[ebp+8]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        mulss   xmm0,xmm1
        mov     eax,[ebp+16]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        addss   xmm0,dword ptr [eax]
        movss   dword ptr [ebp-28],xmm0
        mov     eax,[ebp+8]
        mov     ecx,[ebp-16]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        mov     eax,8
        add     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[ebp+8]
        movss   xmm1,dword ptr [eax+4]
        subss   xmm1,dword ptr [ecx+4]
        mulss   xmm0,xmm1
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebp-24],xmm0
        mov     eax,[ebp+8]
        mov     ecx,[ebp-16]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[ebp+8]
        movss   xmm1,dword ptr [eax+4]
        subss   xmm1,dword ptr [ecx+4]
        mulss   xmm0,xmm1
        mov     eax,[ebp+16]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebp-32],xmm0
        mov     eax,[ebp-12]
        sub     eax,[ebp-8]
        cvtsi2ss        xmm0,eax
        movss   xmm1,dword ptr [ebp-28]
        subss   xmm1,dword ptr [ebp-20]
        divss   xmm1,xmm0
        movss   dword ptr [ebp-36],xmm1
        mov     eax,[ebp-12]
        sub     eax,[ebp-8]
        cvtsi2ss        xmm0,eax
        movss   xmm1,dword ptr [ebp-32]
        subss   xmm1,dword ptr [ebp-24]
        divss   xmm1,xmm0
        movss   dword ptr [ebp-40],xmm1
        push    dword ptr [ebp-40]
        push    dword ptr [ebp-36]
        push    dword ptr [ebp-32]
        push    dword ptr [ebp-28]
        push    dword ptr [ebp-24]
        push    dword ptr [ebp-20]
        push    dword ptr [ebp-16]
        push    dword ptr [ebp-12]
        push    dword ptr [ebp-8]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        inc     dword ptr [ebp-16]
        jmp     label0006
label0007:
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        mov     [ebp-52],eax
        mov     edx,[ebp-52]
        mov     eax,[edx+4]
        sub     eax,[ecx+4]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+8]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     ecx,[ebp+16]
        mov     edx,[ebp+8]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cdq
        idiv    ecx
        mov     ecx,[ebp+8]
        add     eax,[ecx]
        mov     [ebp-12],eax
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm0,eax
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[ebp+8]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        mulss   xmm0,xmm1
        mov     eax,[ebp+16]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        addss   xmm0,dword ptr [eax]
        movss   dword ptr [ebp-28],xmm0
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm0,eax
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[ebp+8]
        movss   xmm1,dword ptr [eax+4]
        subss   xmm1,dword ptr [ecx+4]
        mulss   xmm0,xmm1
        mov     eax,[ebp+16]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebp-32],xmm0
        mov     eax,8
        add     eax,[ebp+12]
        movss   xmm0,dword ptr [ebp-28]
        subss   xmm0,dword ptr [eax]
        mov     eax,[ebp+12]
        mov     ecx,[ebp-12]
        sub     ecx,[eax]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        movss   dword ptr [ebp-36],xmm0
        mov     eax,8
        add     eax,[ebp+12]
        movss   xmm0,dword ptr [ebp-32]
        subss   xmm0,dword ptr [eax+4]
        mov     eax,[ebp+12]
        mov     ecx,[ebp-12]
        sub     ecx,[eax]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        movss   dword ptr [ebp-40],xmm0
        push    dword ptr [ebp-40]
        push    dword ptr [ebp-36]
        mov     eax,8
        add     eax,[ebp+12]
        push    dword ptr [eax+4]
        mov     eax,8
        add     eax,[ebp+12]
        push    dword ptr [eax]
        push    dword ptr [ebp-32]
        push    dword ptr [ebp-28]
        mov     eax,[ebp+12]
        push    dword ptr [eax+4]
        mov     eax,[ebp+12]
        push    dword ptr [eax]
        push    dword ptr [ebp-12]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        mov     eax,[ebp+12]
        mov     ecx,1
        add     ecx,[eax+4]
        mov     [ebp-16],ecx
label0009:
        mov     eax,[ebp+16]
        mov     eax,[eax+4]
        cmp     eax,[ebp-16]
        jle     label000a
        mov     eax,[ebp+12]
        mov     [ebp-56],eax
        mov     eax,[ebp-16]
        mov     ecx,[ebp-56]
        sub     eax,[ecx+4]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cdq
        idiv    ecx
        mov     ecx,[ebp+12]
        add     eax,[ecx]
        mov     [ebp-8],eax
        mov     eax,[ebp+8]
        mov     [ebp-60],eax
        mov     eax,[ebp-16]
        mov     ecx,[ebp-60]
        sub     eax,[ecx+4]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+8]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     ecx,[ebp+16]
        mov     edx,[ebp+8]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cdq
        idiv    ecx
        mov     ecx,[ebp+8]
        add     eax,[ecx]
        mov     [ebp-12],eax
        mov     eax,[ebp+12]
        mov     ecx,[ebp-16]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[ebp+12]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        mulss   xmm0,xmm1
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+12]
        addss   xmm0,dword ptr [eax]
        movss   dword ptr [ebp-20],xmm0
        mov     eax,[ebp+8]
        mov     ecx,[ebp-16]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[ebp+8]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        mulss   xmm0,xmm1
        mov     eax,[ebp+16]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        addss   xmm0,dword ptr [eax]
        movss   dword ptr [ebp-28],xmm0
        mov     eax,[ebp+12]
        mov     ecx,[ebp-16]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[ebp+12]
        movss   xmm1,dword ptr [eax+4]
        subss   xmm1,dword ptr [ecx+4]
        mulss   xmm0,xmm1
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+12]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebp-24],xmm0
        mov     eax,[ebp+8]
        mov     ecx,[ebp-16]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        mov     eax,8
        add     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[ebp+8]
        movss   xmm1,dword ptr [eax+4]
        subss   xmm1,dword ptr [ecx+4]
        mulss   xmm0,xmm1
        mov     eax,[ebp+16]
        mov     ecx,[ebp+8]
        mov     eax,[eax+4]
        sub     eax,[ecx+4]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp+8]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebp-32],xmm0
        mov     eax,[ebp-12]
        sub     eax,[ebp-8]
        cvtsi2ss        xmm0,eax
        movss   xmm1,dword ptr [ebp-28]
        subss   xmm1,dword ptr [ebp-20]
        divss   xmm1,xmm0
        movss   dword ptr [ebp-36],xmm1
        mov     eax,[ebp-12]
        sub     eax,[ebp-8]
        cvtsi2ss        xmm0,eax
        movss   xmm1,dword ptr [ebp-32]
        subss   xmm1,dword ptr [ebp-24]
        divss   xmm1,xmm0
        movss   dword ptr [ebp-40],xmm1
        push    dword ptr [ebp-40]
        push    dword ptr [ebp-36]
        push    dword ptr [ebp-32]
        push    dword ptr [ebp-28]
        push    dword ptr [ebp-24]
        push    dword ptr [ebp-20]
        push    dword ptr [ebp-16]
        push    dword ptr [ebp-12]
        push    dword ptr [ebp-8]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        inc     dword ptr [ebp-16]
        jmp     label0009
label000a:
        mov     esp,ebp
        pop     ebp
        ret
__rasterize_triangle_2i endp

__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,76
        mov     eax,192
        add     eax,[ebp+8]
        mov     dword ptr [eax],0
        mov     eax,[ebp+12]
        mov     [ebp-4],eax
        mov     eax,[ebp+12]
        add     eax,24
        mov     [ebp-8],eax
label0001:
        mov     eax,192
        add     eax,[ebp+12]
        mov     eax,[eax]
        imul    eax,24
        mov     ecx,[ebp+12]
        add     ecx,eax
        cmp     ecx,[ebp-8]
        jle     label0002
        push    dword ptr [ebp+16]
        mov     eax,[ebp-4]
        push    eax
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-52],xmm0
        push    dword ptr [ebp+16]
        mov     eax,[ebp-8]
        push    eax
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-56],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        ja      label0003
        mov     eax,192
        add     eax,[ebp+8]
        mov     ecx,[eax]
        inc     dword ptr [eax]
        imul    ecx,24
        mov     eax,[ebp+8]
        mov     edx,[ebp-4]
        movq    xmm0,qword ptr [edx]
        movq    qword ptr [eax+ecx],xmm0
        movq    xmm0,qword ptr [edx+8]
        movq    qword ptr [eax+ecx+8],xmm0
        movq    xmm0,qword ptr [edx+16]
        movq    qword ptr [eax+ecx+16],xmm0
        movsd   qword ptr [ebp-68],xmm0
label0003:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        jae     label0006
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-56]
        ja      label0005
label0006:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-56]
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        jbe     label0004
label0005:
        mov     eax,[ebp-4]
        push    eax
        push    dword ptr [ebp+16]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        mov     eax,[ebp-4]
        push    eax
        mov     eax,[ebp-8]
        push    eax
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        push    dword ptr [ebp+20]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-72],xmm0
        push    dword ptr [ebp+20]
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-76],xmm0
        movss   xmm0,dword ptr [ebp-72]
        divss   xmm0,dword ptr [ebp-76]
        movss   dword ptr [ebp-60],xmm0
        push    dword ptr [ebp-60]
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_mul
        add     esp,8
        lea     eax,[ebp-40]
        push    eax
        mov     eax,[ebp-4]
        push    eax
        mov     eax,192
        add     eax,[ebp+8]
        mov     eax,[eax]
        imul    eax,24
        mov     ecx,[ebp+8]
        add     ecx,eax
        push    ecx
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
        push    dword ptr [ebp-60]
        lea     eax,[ebp-48]
        push    eax
        call    _vec2f_mul
        add     esp,8
        lea     eax,[ebp-48]
        push    eax
        mov     eax,16
        add     eax,[ebp-4]
        push    eax
        mov     eax,192
        add     eax,[ebp+8]
        mov     eax,[eax]
        imul    eax,24
        mov     ecx,[ebp+8]
        add     ecx,eax
        add     ecx,16
        push    ecx
        call    _vec2f_add
        add     esp,12
        mov     eax,192
        add     eax,[ebp+8]
        inc     dword ptr [eax]
label0004:
        add     dword ptr [ebp-4],24
        add     dword ptr [ebp-8],24
        jmp     label0001
label0002:
        mov     eax,192
        add     eax,[ebp+8]
        mov     ecx,[eax]
        inc     dword ptr [eax]
        imul    ecx,24
        mov     eax,[ebp+8]
        mov     edx,[ebp+8]
        movq    xmm0,qword ptr [edx]
        movq    qword ptr [eax+ecx],xmm0
        movq    xmm0,qword ptr [edx+8]
        movq    qword ptr [eax+ecx+8],xmm0
        movq    xmm0,qword ptr [edx+16]
        movq    qword ptr [eax+ecx+16],xmm0
        mov     esp,ebp
        pop     ebp
        ret
__clip_on_plain endp

__clip_poligon proc
        push    ebp
        mov     ebp,esp
        sub     esp,196
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        push    dword ptr [ebp+8]
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
        push    dword ptr [ebp+8]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        push    dword ptr [ebp+8]
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
        push    dword ptr [ebp+8]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        push    dword ptr [ebp+8]
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
        push    dword ptr [ebp+8]
        call    __clip_on_plain
        add     esp,16
        mov     eax,192
        add     eax,[ebp+8]
        cmp     dword ptr [eax],1
        setg    al
        movzx   eax,al
        mov     esp,ebp
        pop     ebp
        ret
__clip_poligon endp

__transform_to_screen_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
        lea     eax,dword ptr [__viewport_matrix]
        push    eax
        push    dword ptr [ebp+12]
        lea     eax,[ebp-16]
        push    eax
        call    _matrix4f_transform
        add     esp,12
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [ebp-4]
        movss   dword ptr [ebp-20],xmm0
        movss   xmm0,dword ptr [ebp-16]
        mulss   xmm0,dword ptr [ebp-20]
        cvttss2si       eax,xmm0
        mov     ecx,[ebp+8]
        mov     [ecx],eax
        movss   xmm0,dword ptr [ebp-12]
        mulss   xmm0,dword ptr [ebp-20]
        cvttss2si       eax,xmm0
        mov     ecx,4
        add     ecx,[ebp+8]
        mov     [ecx],eax
        mov     eax,[ebp+8]
        cmp     dword ptr [eax],0
        jl      label0001
        mov     eax,[ebp+8]
        mov     eax,[eax]
        cmp     eax,dword ptr [__width]
        jge     label0001
        mov     eax,4
        add     eax,[ebp+8]
        cmp     dword ptr [eax],0
        jl      label0001
        mov     eax,4
        add     eax,[ebp+8]
        mov     eax,[eax]
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
        sub     esp,144
        push    ebx
        push    dword ptr [ebp+8]
        call    __clip_poligon
        add     esp,4
        cmp     eax,0
        jne     label0000
        pop     ebx
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        mov     eax,192
        add     eax,[ebp+8]
        cmp     dword ptr [eax],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     dword ptr [ebp-136],0
label0003:
        mov     eax,192
        add     eax,[ebp+8]
        mov     eax,[eax]
        cmp     eax,[ebp-136]
        jle     label0004
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
        mov     edx,[ebp+8]
        mov     ebx,[ebp-136]
        imul    ebx,24
        movq    xmm0,qword ptr [edx+ebx+16]
        movq    qword ptr [eax+ecx+8],xmm0
        inc     dword ptr [ebp-136]
        movsd   qword ptr [ebp-144],xmm0
        jmp     label0003
label0004:
        mov     dword ptr [ebp-136],2
label0006:
        mov     eax,192
        add     eax,[ebp+8]
        mov     eax,[eax]
        dec     eax
        cmp     eax,[ebp-136]
        jle     label0007
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
        jmp     label0006
label0007:
        pop     ebx
        mov     esp,ebp
        pop     ebp
        ret
__rasterize_polygon_4f endp

__transform_to_projection_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        mov     eax,8
        add     eax,[ebp+12]
        push    dword ptr [eax]
        mov     eax,4
        add     eax,[ebp+12]
        push    dword ptr [eax]
        mov     eax,[ebp+12]
        push    dword ptr [eax]
        lea     eax,[ebp-16]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [__mvproj_matrix]
        push    eax
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
        push    dword ptr [ebp+8]
        lea     eax,[ebp-196]
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     eax,[ebp+20]
        movq    xmm0,qword ptr [eax]
        movq    qword ptr [ebp-180],xmm0
        push    dword ptr [ebp+12]
        lea     eax,[ebp-196]
        add     eax,24
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     eax,[ebp+24]
        movq    xmm0,qword ptr [eax]
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
