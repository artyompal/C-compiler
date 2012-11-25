
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
___unnamed_float_4      dd      080000000h, 00h, 00h, 00h
public  ___unnamed_float_4
___unnamed_float_5      dd      0bf800000h
public  ___unnamed_float_5
___unnamed_float_6      dd      03b808081h
public  ___unnamed_float_6

.code

_vec2f_add proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+12]
        mov     eax,[eax]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+8]
        mov     eax,[eax]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,4
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        addss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_vec2f_add endp

_vec2f_subtract proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+12]
        mov     eax,[eax]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+8]
        mov     eax,[eax]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,4
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        subss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_vec2f_subtract endp

_vec2f_mul proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,[ebp+12]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+12]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_vec2f_mul endp

_vec4f_assign proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,[ebp+12]
        movss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+20]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+24]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_vec4f_assign endp

_vec4f_add proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+12]
        mov     eax,[eax]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+8]
        mov     eax,[eax]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,4
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        addss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,8
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        addss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+12]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,12
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        addss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_vec4f_add endp

_vec4f_subtract proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+12]
        mov     eax,[eax]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+8]
        mov     eax,[eax]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,4
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        subss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,8
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        subss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+12]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,12
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        subss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_vec4f_subtract endp

_vec4f_dot proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+12]
        mov     edx,4
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [edx]
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+12]
        mov     edx,8
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [edx]
        addss   xmm1,xmm0
        lea     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+12]
        mov     edx,12
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [edx]
        addss   xmm1,xmm0
        movss   xmm0,xmm1
        pop     ebp
        ret
_vec4f_dot endp

_vec4f_mul proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,[ebp+12]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+12]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+12]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+12]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_vec4f_mul endp

_matrix4f_make_perspective proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        lea     eax,[ebp+20]
        lea     ecx,[ebp+12]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-4]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp-4]
        lea     ecx,[ebp+24]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-8]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,[ebp+12]
        lea     edx,[ebp-8]
        movss   xmm0,dword ptr [ecx]
        divss   xmm0,dword ptr [edx]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,16
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,20
        add     ecx,[eax]
        lea     eax,[ebp+12]
        lea     edx,[ebp-4]
        movss   xmm0,dword ptr [eax]
        divss   xmm0,dword ptr [edx]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,24
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,28
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,32
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,36
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,40
        add     ecx,[eax]
        lea     eax,[ebp+16]
        lea     edx,[ebp+12]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [edx]
        lea     eax,[ebp+16]
        movss   xmm1,dword ptr [eax]
        divss   xmm1,xmm0
        movss   dword ptr [ecx],xmm1
        lea     eax,[ebp+8]
        mov     ecx,44
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,48
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,52
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,56
        add     ecx,[eax]
        lea     eax,[ebp+12]
        lea     edx,[ebp+16]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [edx]
        lea     eax,[ebp+12]
        lea     edx,[ebp+16]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [edx]
        divss   xmm0,xmm1
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,60
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        add     esp,8
        pop     ebp
        ret
_matrix4f_make_perspective endp

_matrix4f_make_viewport proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,[ebp+12]
        lea     edx,dword ptr [___unnamed_float_3]
        movss   xmm0,dword ptr [edx]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,xmm0
        movss   dword ptr [eax],xmm1
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,16
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,20
        add     ecx,[eax]
        lea     eax,[ebp+16]
        movss   xmm0,dword ptr [eax]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        lea     eax,dword ptr [___unnamed_float_3]
        movss   xmm1,dword ptr [eax]
        mulss   xmm0,xmm1
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,24
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,28
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,32
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,36
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,40
        add     ecx,[eax]
        lea     eax,[ebp+24]
        lea     edx,[ebp+20]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [edx]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,44
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,48
        add     ecx,[eax]
        lea     eax,[ebp+12]
        lea     edx,dword ptr [___unnamed_float_3]
        movss   xmm0,dword ptr [edx]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,xmm0
        movss   dword ptr [ecx],xmm1
        lea     eax,[ebp+8]
        mov     ecx,52
        add     ecx,[eax]
        lea     eax,[ebp+16]
        lea     edx,dword ptr [___unnamed_float_3]
        movss   xmm0,dword ptr [edx]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,xmm0
        movss   dword ptr [ecx],xmm1
        lea     eax,[ebp+8]
        mov     ecx,56
        add     ecx,[eax]
        lea     eax,[ebp+20]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+8]
        mov     ecx,60
        add     ecx,[eax]
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_matrix4f_make_viewport endp

_matrix4f_transform proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,16
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [edx]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,32
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [edx]
        addss   xmm1,xmm0
        lea     eax,[ebp+12]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,48
        add     edx,[eax]
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [edx]
        addss   xmm1,xmm0
        lea     eax,[ebp+8]
        mov     eax,[eax]
        movss   dword ptr [eax],xmm1
        lea     eax,[ebp+16]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,20
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,36
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,52
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,24
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,40
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,56
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        lea     eax,[ebp+16]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,28
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,44
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     ecx,12
        add     ecx,[eax]
        lea     eax,[ebp+16]
        mov     edx,60
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,12
        add     ecx,[eax]
        movss   dword ptr [ecx],xmm0
        pop     ebp
        ret
_matrix4f_transform endp

_rasterizer_init proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        lea     eax,dword ptr [__dbgprintf]
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,dword ptr [__width]
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,dword ptr [__height]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,dword ptr [__pitch]
        lea     ecx,[ebp+20]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,[ebp+12]
        cvtsi2ss        xmm0,dword ptr [eax]
        lea     eax,[ebp+16]
        cvtsi2ss        xmm1,dword ptr [eax]
        divss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+32]
        push    dword ptr [eax]
        lea     eax,[ebp+28]
        push    dword ptr [eax]
        lea     eax,[ebp+24]
        push    dword ptr [eax]
        lea     eax,dword ptr [__mvproj_matrix]
        push    eax
        call    _matrix4f_make_perspective
        add     esp,20
        lea     eax,[ebp+28]
        push    dword ptr [eax]
        lea     eax,[ebp+24]
        push    dword ptr [eax]
        lea     eax,[ebp+16]
        cvtsi2ss        xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+12]
        cvtsi2ss        xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__viewport_matrix]
        push    eax
        call    _matrix4f_make_viewport
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+24]
        push    dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_z_near_base]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,[ebp+28]
        lea     ecx,[ebp+24]
        movss   xmm0,dword ptr [eax]
        comiss  xmm0,dword ptr [ecx]
        jbe     label0000
        lea     eax,[ebp-4]
        lea     ecx,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        jmp     label0001
label0000:
        lea     eax,[ebp-4]
        lea     ecx,dword ptr [___unnamed_float_5]
        movss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
label0001:
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp-4]
        push    dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_z_near_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+28]
        push    dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,[ebp+28]
        lea     ecx,[ebp+24]
        movss   xmm0,dword ptr [eax]
        comiss  xmm0,dword ptr [ecx]
        jbe     label0002
        lea     eax,[ebp-8]
        lea     ecx,dword ptr [___unnamed_float_5]
        movss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        jmp     label0003
label0002:
        lea     eax,[ebp-8]
        lea     ecx,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
label0003:
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp-8]
        push    dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+12]
        cvtsi2ss        xmm0,dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [eax]
        divss   xmm1,xmm0
        lea     eax,dword ptr [___unnamed_float_5]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+12]
        cvtsi2ss        xmm0,dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [eax]
        divss   xmm1,xmm0
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_plane_right_base]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_5]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_plane_right_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+16]
        cvtsi2ss        xmm0,dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [eax]
        divss   xmm1,xmm0
        lea     eax,dword ptr [___unnamed_float_5]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,xmm1
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_plane_bottom_base]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_5]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [__clip_plane_bottom_norm]
        push    eax
        call    _vec4f_assign
        add     esp,20
        add     esp,8
        pop     ebp
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        push    ebp
        mov     ebp,esp
        lea     eax,dword ptr [__videomem]
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     [eax],ecx
        pop     ebp
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,dword ptr [__mvproj_matrix]
        mov     edi,ecx
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
        lea     eax,dword ptr [__color]
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     [eax],ecx
        pop     ebp
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        push    ebp
        mov     ebp,esp
        lea     eax,dword ptr [__texture_data]
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,dword ptr [__texture_width]
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,dword ptr [__texture_height]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     [eax],ecx
        pop     ebp
        ret
_rasterizer_set_texture endp

__tex2d proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        lea     eax,dword ptr [__texture_width]
        mov     ecx,1
        mov     eax,[eax]
        sub     eax,ecx
        cvtsi2ss        xmm0,eax
        lea     eax,[ebp+8]
        mulss   xmm0,dword ptr [eax]
        cvttss2si       eax,xmm0
        lea     ecx,[ebp-4]
        mov     [ecx],eax
        lea     eax,dword ptr [__texture_height]
        mov     ecx,1
        mov     eax,[eax]
        sub     eax,ecx
        cvtsi2ss        xmm0,eax
        lea     eax,[ebp+12]
        mulss   xmm0,dword ptr [eax]
        cvttss2si       eax,xmm0
        lea     ecx,[ebp-8]
        mov     [ecx],eax
        lea     eax,[ebp-8]
        lea     ecx,dword ptr [__texture_width]
        mov     eax,[eax]
        imul    eax,[ecx]
        lea     ecx,[ebp-4]
        add     eax,[ecx]
        mov     ecx,2
        sal     eax,cl
        lea     ecx,dword ptr [__texture_data]
        add     eax,[ecx]
        mov     eax,[eax]
        add     esp,8
        pop     ebp
        ret
__tex2d endp

__rasterize_horiz_line proc
        push    ebp
        mov     ebp,esp
        sub     esp,60
        lea     eax,dword ptr [__pitch]
        lea     ecx,[ebp+16]
        mov     eax,[eax]
        imul    eax,[ecx]
        lea     ecx,dword ptr [__videomem]
        add     eax,[ecx]
        lea     ecx,[ebp+8]
        mov     [ebp-48],ecx
        mov     ecx,2
        mov     [ebp-52],ecx
        mov     ecx,[ebp-48]
        mov     edx,[ecx]
        mov     ecx,[ebp-52]
        sal     edx,cl
        add     eax,edx
        lea     ecx,[ebp-4]
        mov     [ecx],eax
        lea     eax,[ebp+12]
        mov     ecx,2
        mov     eax,[eax]
        sal     eax,cl
        lea     ecx,[ebp-4]
        add     eax,[ecx]
        lea     ecx,[ebp+8]
        mov     [ebp-56],ecx
        mov     ecx,2
        mov     [ebp-60],ecx
        mov     ecx,[ebp-56]
        mov     edx,[ecx]
        mov     ecx,[ebp-60]
        sal     edx,cl
        sub     eax,edx
        lea     ecx,[ebp-8]
        mov     [ecx],eax
label0000:
        lea     eax,[ebp+24]
        push    dword ptr [eax]
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        call    __tex2d
        add     esp,8
        lea     ecx,[ebp-12]
        mov     [ecx],eax
        lea     eax,[ebp-12]
        mov     ecx,24
        mov     eax,[eax]
        sar     eax,cl
        mov     ecx,255
        and     eax,ecx
        lea     ecx,[ebp-40]
        mov     [ecx],eax
        lea     eax,[ebp-40]
        cmp     dword ptr [eax],0
        je      label0003
        lea     eax,[ebp-40]
        cvtsi2ss        xmm0,dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_6]
        movss   xmm1,dword ptr [eax]
        mulss   xmm0,xmm1
        lea     eax,[ebp-44]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp-4]
        mov     eax,[eax]
        lea     ecx,[ebp-28]
        mov     eax,[eax]
        mov     [ecx],eax
        lea     eax,[ebp-28]
        mov     ecx,65280
        mov     eax,[eax]
        and     eax,ecx
        mov     ecx,8
        sar     eax,cl
        lea     ecx,[ebp-32]
        mov     [ecx],eax
        lea     eax,[ebp-28]
        mov     ecx,255
        mov     eax,[eax]
        and     eax,ecx
        lea     ecx,[ebp-36]
        mov     [ecx],eax
        lea     eax,[ebp-12]
        mov     ecx,65280
        mov     eax,[eax]
        and     eax,ecx
        mov     ecx,8
        sar     eax,cl
        lea     ecx,[ebp-20]
        mov     [ecx],eax
        lea     eax,[ebp-12]
        mov     ecx,255
        mov     eax,[eax]
        and     eax,ecx
        lea     ecx,[ebp-24]
        mov     [ecx],eax
        lea     eax,[ebp-20]
        cvtsi2ss        xmm0,dword ptr [eax]
        lea     eax,[ebp-44]
        mulss   xmm0,dword ptr [eax]
        lea     eax,[ebp-32]
        cvtsi2ss        xmm1,dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm2,dword ptr [eax]
        lea     eax,[ebp-44]
        subss   xmm2,dword ptr [eax]
        mulss   xmm1,xmm2
        addss   xmm0,xmm1
        cvttss2si       eax,xmm0
        lea     ecx,[ebp-20]
        mov     [ecx],eax
        lea     eax,[ebp-24]
        cvtsi2ss        xmm0,dword ptr [eax]
        lea     eax,[ebp-44]
        mulss   xmm0,dword ptr [eax]
        lea     eax,[ebp-36]
        cvtsi2ss        xmm1,dword ptr [eax]
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm2,dword ptr [eax]
        lea     eax,[ebp-44]
        subss   xmm2,dword ptr [eax]
        mulss   xmm1,xmm2
        addss   xmm0,xmm1
        cvttss2si       eax,xmm0
        lea     ecx,[ebp-24]
        mov     [ecx],eax
        lea     eax,[ebp-20]
        mov     ecx,8
        mov     eax,[eax]
        sal     eax,cl
        lea     ecx,[ebp-24]
        add     eax,[ecx]
        lea     ecx,[ebp-16]
        mov     [ecx],eax
        lea     eax,[ebp-4]
        mov     eax,[eax]
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        mov     [eax],ecx
label0003:
        lea     eax,[ebp+20]
        lea     ecx,[ebp+28]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+24]
        lea     ecx,[ebp+32]
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
label0001:
        lea     eax,[ebp-4]
        add     dword ptr [eax],4
        lea     ecx,[ebp-8]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jl      label0000
label0002:
        add     esp,60
        pop     ebp
        ret
__rasterize_horiz_line endp

__rasterize_horiz_line__unordered proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+8]
        lea     ecx,[ebp+12]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jg      label0000
        lea     eax,[ebp+40]
        push    dword ptr [eax]
        lea     eax,[ebp+36]
        push    dword ptr [eax]
        lea     eax,[ebp+24]
        push    dword ptr [eax]
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        push    dword ptr [eax]
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0001
label0000:
        lea     eax,[ebp+40]
        push    dword ptr [eax]
        lea     eax,[ebp+36]
        push    dword ptr [eax]
        lea     eax,[ebp+32]
        push    dword ptr [eax]
        lea     eax,[ebp+28]
        push    dword ptr [eax]
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        push    dword ptr [eax]
        call    __rasterize_horiz_line
        add     esp,28
label0001:
        pop     ebp
        ret
__rasterize_horiz_line__unordered endp

__rasterize_triangle_1i proc
        push    ebp
        mov     ebp,esp
        lea     eax,[ebp+8]
        lea     ecx,[ebp+12]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jge     label0000
        lea     eax,[ebp+16]
        lea     ecx,[ebp+12]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0001
        lea     eax,[ebp+40]
        push    dword ptr [eax]
        lea     eax,[ebp+36]
        push    dword ptr [eax]
        lea     eax,[ebp+24]
        mov     ecx,4
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp+24]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0002
label0001:
        lea     eax,[ebp+16]
        lea     ecx,[ebp+8]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jge     label0003
        lea     eax,[ebp+40]
        push    dword ptr [eax]
        lea     eax,[ebp+36]
        push    dword ptr [eax]
        lea     eax,[ebp+32]
        mov     ecx,4
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp+32]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        push    dword ptr [eax]
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0004
label0003:
        lea     eax,[ebp+40]
        push    dword ptr [eax]
        lea     eax,[ebp+36]
        push    dword ptr [eax]
        lea     eax,[ebp+24]
        mov     ecx,4
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp+24]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        push    dword ptr [eax]
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        call    __rasterize_horiz_line
        add     esp,28
label0004:
label0002:
        jmp     label0005
label0000:
        lea     eax,[ebp+16]
        lea     ecx,[ebp+12]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jge     label0006
        lea     eax,[ebp+40]
        movss   xmm0,dword ptr [eax]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+36]
        movss   xmm0,dword ptr [eax]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+32]
        mov     ecx,4
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp+32]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0007
label0006:
        lea     eax,[ebp+16]
        lea     ecx,[ebp+8]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0008
        lea     eax,[ebp+40]
        movss   xmm0,dword ptr [eax]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+36]
        movss   xmm0,dword ptr [eax]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+28]
        mov     ecx,4
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp+28]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        push    dword ptr [eax]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0009
label0008:
        lea     eax,[ebp+40]
        movss   xmm0,dword ptr [eax]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+36]
        movss   xmm0,dword ptr [eax]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+28]
        mov     ecx,4
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp+28]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        push    dword ptr [eax]
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
        push    ebx
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0000
        lea     eax,[ebp-4]
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,[ebp+8]
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,[ebp+12]
        lea     ecx,[ebp-4]
        mov     ecx,[ecx]
        mov     [eax],ecx
label0000:
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0001
        lea     eax,[ebp-4]
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,[ebp+8]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,[ebp+16]
        lea     ecx,[ebp-4]
        mov     ecx,[ecx]
        mov     [eax],ecx
label0001:
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0002
        lea     eax,[ebp-4]
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,[ebp+12]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     [eax],ecx
        lea     eax,[ebp+16]
        lea     ecx,[ebp-4]
        mov     ecx,[ecx]
        mov     [eax],ecx
label0002:
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        cmp     eax,[ecx]
        jne     label0003
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        mov     ecx,0
        cmp     [eax],ecx
        jl      label0004
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,dword ptr [__height]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jge     label0004
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        push    ecx
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        push    ecx
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        push    ecx
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        push    dword ptr [eax]
        lea     eax,[ebp+16]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp+8]
        mov     eax,[eax]
        push    dword ptr [eax]
        call    __rasterize_triangle_1i
        add     esp,36
label0004:
        pop     ebx
        add     esp,60
        pop     ebp
        ret
label0003:
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     eax,[eax]
        mov     [ecx],eax
label0005:
label0006:
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0007
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     [ebp-44],eax
        mov     eax,[ecx]
        mov     ecx,[ebp-44]
        sub     eax,[ecx]
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        lea     edx,[ebp+8]
        mov     edx,[edx]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        lea     edx,[ebp+8]
        mov     edx,[edx]
        mov     ebx,4
        add     edx,ebx
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        add     eax,[ecx]
        lea     ecx,[ebp-8]
        mov     [ecx],eax
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     [ebp-48],eax
        mov     eax,[ecx]
        mov     ecx,[ebp-48]
        sub     eax,[ecx]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        lea     edx,[ebp+8]
        mov     edx,[edx]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        lea     edx,[ebp+8]
        mov     edx,[edx]
        mov     ebx,4
        add     edx,ebx
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        add     eax,[ecx]
        lea     ecx,[ebp-12]
        mov     [ecx],eax
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm0,ecx
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+8]
        mov     edx,8
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-20]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm0,ecx
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+8]
        mov     edx,8
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-28]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm0,ecx
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        lea     eax,[ebp+8]
        mov     edx,8
        add     edx,[eax]
        mov     eax,4
        add     edx,eax
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-24]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm0,ecx
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        lea     eax,[ebp+8]
        mov     edx,8
        add     edx,[eax]
        mov     eax,4
        add     edx,eax
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-32]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp-12]
        lea     ecx,[ebp-8]
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm0,eax
        lea     eax,[ebp-28]
        lea     ecx,[ebp-20]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        divss   xmm1,xmm0
        lea     eax,[ebp-36]
        movss   dword ptr [eax],xmm1
        lea     eax,[ebp-12]
        lea     ecx,[ebp-8]
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm0,eax
        lea     eax,[ebp-32]
        lea     ecx,[ebp-24]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        divss   xmm1,xmm0
        lea     eax,[ebp-40]
        movss   dword ptr [eax],xmm1
        lea     eax,[ebp-40]
        push    dword ptr [eax]
        lea     eax,[ebp-36]
        push    dword ptr [eax]
        lea     eax,[ebp-32]
        push    dword ptr [eax]
        lea     eax,[ebp-28]
        push    dword ptr [eax]
        lea     eax,[ebp-24]
        push    dword ptr [eax]
        lea     eax,[ebp-20]
        push    dword ptr [eax]
        lea     eax,[ebp-16]
        push    dword ptr [eax]
        lea     eax,[ebp-12]
        push    dword ptr [eax]
        lea     eax,[ebp-8]
        push    dword ptr [eax]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        lea     eax,[ebp-16]
        inc     dword ptr [eax]
        jmp     label0006
label0007:
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     [ebp-52],eax
        mov     edx,[ebp-52]
        mov     eax,[edx]
        sub     eax,[ecx]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        lea     edx,[ebp+8]
        mov     edx,[edx]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        lea     edx,[ebp+8]
        mov     edx,[edx]
        mov     ebx,4
        add     edx,ebx
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        lea     edx,[ebp+8]
        mov     edx,[edx]
        add     eax,[edx]
        lea     ecx,[ebp-12]
        mov     [ecx],eax
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm0,eax
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+8]
        mov     edx,8
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-28]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm0,eax
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        lea     eax,[ebp+8]
        mov     edx,8
        add     edx,[eax]
        mov     eax,4
        add     edx,eax
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-32]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp-28]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        lea     ecx,[ebp-12]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        lea     eax,[ebp-36]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        lea     eax,[ebp-32]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        lea     ecx,[ebp-12]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        lea     eax,[ebp-40]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp-40]
        push    dword ptr [eax]
        lea     eax,[ebp-36]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        push    dword ptr [ecx]
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp-32]
        push    dword ptr [eax]
        lea     eax,[ebp-28]
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        push    dword ptr [eax]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp-12]
        push    dword ptr [eax]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        mov     ecx,1
        add     ecx,[eax]
        lea     eax,[ebp-16]
        mov     [eax],ecx
label0008:
label0009:
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label000a
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     [ebp-56],eax
        mov     eax,[ecx]
        mov     ecx,[ebp-56]
        sub     eax,[ecx]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        lea     edx,[ebp+12]
        mov     edx,[edx]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        lea     edx,[ebp+12]
        mov     edx,[edx]
        mov     ebx,4
        add     edx,ebx
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        add     eax,[ecx]
        lea     ecx,[ebp-8]
        mov     [ecx],eax
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     [ebp-60],eax
        mov     eax,[ecx]
        mov     ecx,[ebp-60]
        sub     eax,[ecx]
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        lea     edx,[ebp+8]
        mov     edx,[edx]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        lea     ecx,[ebp+16]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        lea     edx,[ebp+8]
        mov     edx,[edx]
        mov     ebx,4
        add     edx,ebx
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        add     eax,[ecx]
        lea     ecx,[ebp-12]
        mov     [ecx],eax
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm0,ecx
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+12]
        mov     edx,8
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-20]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm0,ecx
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        lea     eax,[ebp+8]
        mov     edx,8
        add     edx,[eax]
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-28]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm0,ecx
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        lea     eax,[ebp+12]
        mov     edx,8
        add     edx,[eax]
        mov     eax,4
        add     edx,eax
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+12]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-24]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-16]
        mov     ecx,[ecx]
        sub     ecx,[eax]
        cvtsi2ss        xmm0,ecx
        lea     eax,[ebp+16]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        lea     eax,[ebp+8]
        mov     edx,8
        add     edx,[eax]
        mov     eax,4
        add     edx,eax
        movss   xmm1,dword ptr [ecx]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebp+16]
        mov     eax,[eax]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     edx,4
        add     ecx,edx
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        lea     eax,[ebp+8]
        mov     ecx,8
        add     ecx,[eax]
        mov     eax,4
        add     ecx,eax
        addss   xmm0,dword ptr [ecx]
        lea     eax,[ebp-32]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp-12]
        lea     ecx,[ebp-8]
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm0,eax
        lea     eax,[ebp-28]
        lea     ecx,[ebp-20]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        divss   xmm1,xmm0
        lea     eax,[ebp-36]
        movss   dword ptr [eax],xmm1
        lea     eax,[ebp-12]
        lea     ecx,[ebp-8]
        mov     eax,[eax]
        sub     eax,[ecx]
        cvtsi2ss        xmm0,eax
        lea     eax,[ebp-32]
        lea     ecx,[ebp-24]
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        divss   xmm1,xmm0
        lea     eax,[ebp-40]
        movss   dword ptr [eax],xmm1
        lea     eax,[ebp-40]
        push    dword ptr [eax]
        lea     eax,[ebp-36]
        push    dword ptr [eax]
        lea     eax,[ebp-32]
        push    dword ptr [eax]
        lea     eax,[ebp-28]
        push    dword ptr [eax]
        lea     eax,[ebp-24]
        push    dword ptr [eax]
        lea     eax,[ebp-20]
        push    dword ptr [eax]
        lea     eax,[ebp-16]
        push    dword ptr [eax]
        lea     eax,[ebp-12]
        push    dword ptr [eax]
        lea     eax,[ebp-8]
        push    dword ptr [eax]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        lea     eax,[ebp-16]
        inc     dword ptr [eax]
        jmp     label0009
label000a:
        pop     ebx
        add     esp,60
        pop     ebp
        ret
__rasterize_triangle_2i endp

__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,72
        push    edi
        push    esi
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,0
        mov     [ecx],eax
        lea     eax,[ebp+12]
        mov     eax,[eax]
        lea     ecx,[ebp-4]
        mov     [ecx],eax
        lea     eax,[ebp+12]
        mov     eax,[eax]
        mov     ecx,24
        add     eax,ecx
        lea     ecx,[ebp-8]
        mov     [ecx],eax
label0000:
label0001:
        lea     eax,[ebp+12]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,24
        mov     ecx,[ecx]
        imul    ecx,eax
        lea     eax,[ebp+12]
        mov     eax,[eax]
        add     eax,ecx
        lea     ecx,[ebp-8]
        cmp     eax,[ecx]
        jle     label0002
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        lea     eax,[ebp-4]
        mov     eax,[eax]
        push    eax
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        lea     eax,[ebp-52]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        lea     eax,[ebp-8]
        mov     eax,[eax]
        push    eax
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        lea     eax,[ebp-56]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp-52]
        lea     ecx,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [ecx]
        comiss  xmm0,dword ptr [eax]
        ja      label0003
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,[ecx]
        inc     dword ptr [ecx]
        mov     ecx,24
        imul    eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        add     ecx,eax
        lea     eax,[ebp-4]
        mov     eax,[eax]
        mov     edi,ecx
        mov     esi,eax
        mov     ecx,6
        rep     movsd
        mov     [ebp-64],ecx
label0003:
        lea     eax,[ebp-52]
        lea     ecx,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [ecx]
        comiss  xmm0,dword ptr [eax]
        jae     label0006
        lea     eax,[ebp-56]
        lea     ecx,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [ecx]
        comiss  xmm0,dword ptr [eax]
        ja      label0005
label0006:
        lea     eax,[ebp-56]
        lea     ecx,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [ecx]
        comiss  xmm0,dword ptr [eax]
        ja      label0004
        lea     eax,[ebp-52]
        lea     ecx,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [ecx]
        comiss  xmm0,dword ptr [eax]
        jbe     label0004
label0005:
        lea     eax,[ebp-4]
        mov     eax,[eax]
        push    eax
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        lea     eax,[ebp-4]
        mov     eax,[eax]
        push    eax
        lea     eax,[ebp-8]
        mov     eax,[eax]
        push    eax
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_subtract
        add     esp,12
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp-24]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-68],xmm0
        lea     eax,[ebp+20]
        push    dword ptr [eax]
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_dot
        add     esp,8
        movss   dword ptr [ebp-72],xmm0
        movss   xmm0,dword ptr [ebp-68]
        divss   xmm0,dword ptr [ebp-72]
        lea     eax,[ebp-60]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp-60]
        push    dword ptr [eax]
        lea     eax,[ebp-40]
        push    eax
        call    _vec4f_mul
        add     esp,8
        lea     eax,[ebp-40]
        push    eax
        lea     eax,[ebp-4]
        mov     eax,[eax]
        push    eax
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,24
        mov     ecx,[ecx]
        imul    ecx,eax
        lea     eax,[ebp+8]
        mov     eax,[eax]
        add     eax,ecx
        push    eax
        call    _vec4f_add
        add     esp,12
        lea     eax,[ebp-4]
        mov     ecx,16
        add     ecx,[eax]
        push    ecx
        lea     eax,[ebp-8]
        mov     ecx,16
        add     ecx,[eax]
        push    ecx
        lea     eax,[ebp-48]
        push    eax
        call    _vec2f_subtract
        add     esp,12
        lea     eax,[ebp-60]
        push    dword ptr [eax]
        lea     eax,[ebp-48]
        push    eax
        call    _vec2f_mul
        add     esp,8
        lea     eax,[ebp-48]
        push    eax
        lea     eax,[ebp-4]
        mov     ecx,16
        add     ecx,[eax]
        push    ecx
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,24
        mov     ecx,[ecx]
        imul    ecx,eax
        lea     eax,[ebp+8]
        mov     eax,[eax]
        add     eax,ecx
        mov     ecx,16
        add     eax,ecx
        push    eax
        call    _vec2f_add
        add     esp,12
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        inc     dword ptr [ecx]
label0004:
        lea     eax,[ebp-4]
        add     dword ptr [eax],24
        lea     eax,[ebp-8]
        add     dword ptr [eax],24
        jmp     label0001
label0002:
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,[ecx]
        inc     dword ptr [ecx]
        mov     ecx,24
        imul    eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        add     ecx,eax
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     edi,ecx
        mov     esi,eax
        mov     ecx,6
        rep     movsd
        pop     esi
        pop     edi
        add     esp,72
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
        lea     eax,[ebp+8]
        push    dword ptr [eax]
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
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        lea     eax,[ebp+8]
        push    dword ptr [eax]
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
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        lea     eax,[ebp+8]
        push    dword ptr [eax]
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
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        call    __clip_on_plain
        add     esp,16
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,1
        cmp     [ecx],eax
        setg    al
        movzx   eax,al
        add     esp,196
        pop     ebp
        ret
__clip_poligon endp

__transform_to_screen_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
        lea     eax,dword ptr [__viewport_matrix]
        push    eax
        lea     eax,[ebp+12]
        push    dword ptr [eax]
        lea     eax,[ebp-16]
        push    eax
        call    _matrix4f_transform
        add     esp,12
        lea     eax,[ebp-16]
        mov     ecx,12
        add     eax,ecx
        lea     ecx,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [ecx]
        divss   xmm0,dword ptr [eax]
        lea     eax,[ebp-20]
        movss   dword ptr [eax],xmm0
        lea     eax,[ebp-16]
        lea     ecx,[ebp-20]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        cvttss2si       eax,xmm0
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        mov     [ecx],eax
        lea     eax,[ebp-16]
        mov     ecx,4
        add     eax,ecx
        lea     ecx,[ebp-20]
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,dword ptr [ecx]
        cvttss2si       eax,xmm0
        lea     ecx,[ebp+8]
        mov     edx,4
        add     edx,[ecx]
        mov     [edx],eax
        lea     eax,[ebp+8]
        mov     eax,[eax]
        mov     ecx,0
        cmp     [eax],ecx
        jl      label0001
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,dword ptr [__width]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jge     label0001
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        mov     eax,0
        cmp     [ecx],eax
        jl      label0001
        lea     eax,[ebp+8]
        mov     ecx,4
        add     ecx,[eax]
        lea     eax,dword ptr [__height]
        mov     ecx,[ecx]
        cmp     ecx,[eax]
        jl      label0000
label0001:
        mov     eax,0
        mov     ecx,0
        mov     [eax],ecx
label0000:
        add     esp,20
        pop     ebp
        ret
__transform_to_screen_space endp

__rasterize_polygon_4f proc
        push    ebp
        mov     ebp,esp
        sub     esp,160
        push    ebx
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        call    __clip_poligon
        add     esp,4
        cmp     eax,0
        jne     label0000
        pop     ebx
        add     esp,160
        pop     ebp
        ret
label0000:
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,8
        cmp     [ecx],eax
        jle     label0001
        mov     eax,0
        mov     ecx,0
        mov     [eax],ecx
label0001:
        lea     eax,[ebp-136]
        mov     ecx,0
        mov     [eax],ecx
label0002:
label0003:
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        lea     eax,[ebp-136]
        mov     ecx,[ecx]
        cmp     ecx,[eax]
        jle     label0004
        lea     eax,[ebp+8]
        mov     eax,[eax]
        lea     ecx,[ebp-136]
        mov     edx,24
        mov     ecx,[ecx]
        imul    ecx,edx
        add     eax,ecx
        push    eax
        lea     eax,[ebp-132]
        lea     ecx,[ebp-136]
        mov     [ebp-140],ecx
        mov     ecx,4
        mov     [ebp-144],ecx
        mov     ecx,[ebp-140]
        mov     edx,[ecx]
        mov     ecx,[ebp-144]
        sal     edx,cl
        add     eax,edx
        push    eax
        call    __transform_to_screen_space
        add     esp,8
        lea     eax,[ebp-132]
        lea     ecx,[ebp-136]
        mov     [ebp-148],ecx
        mov     ecx,4
        mov     [ebp-152],ecx
        mov     ecx,[ebp-148]
        mov     edx,[ecx]
        mov     ecx,[ebp-152]
        sal     edx,cl
        add     eax,edx
        mov     ecx,8
        add     eax,ecx
        lea     ecx,[ebp+8]
        mov     ecx,[ecx]
        lea     edx,[ebp-136]
        mov     ebx,24
        mov     edx,[edx]
        imul    edx,ebx
        add     ecx,edx
        mov     edx,16
        add     ecx,edx
        mov     edx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ecx
        lea     eax,[ebp-136]
        inc     dword ptr [eax]
        jmp     label0003
label0004:
        lea     eax,[ebp-136]
        mov     ecx,2
        mov     [eax],ecx
label0005:
label0006:
        lea     eax,[ebp+8]
        mov     ecx,192
        add     ecx,[eax]
        mov     eax,1
        mov     ecx,[ecx]
        sub     ecx,eax
        lea     eax,[ebp-136]
        cmp     ecx,[eax]
        jle     label0007
        lea     eax,[ebp-132]
        lea     ecx,[ebp-136]
        mov     [ebp-156],ecx
        mov     ecx,4
        mov     [ebp-160],ecx
        mov     ecx,[ebp-156]
        mov     edx,[ecx]
        mov     ecx,[ebp-160]
        sal     edx,cl
        add     eax,edx
        push    eax
        lea     eax,[ebp-136]
        mov     ecx,1
        mov     eax,[eax]
        sub     eax,ecx
        mov     ecx,4
        sal     eax,cl
        lea     ecx,[ebp-132]
        add     ecx,eax
        push    ecx
        lea     eax,[ebp-132]
        push    eax
        call    __rasterize_triangle_2i
        add     esp,12
        lea     eax,[ebp-136]
        inc     dword ptr [eax]
        jmp     label0006
label0007:
        pop     ebx
        add     esp,160
        pop     ebp
        ret
__rasterize_polygon_4f endp

__transform_to_projection_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        lea     eax,dword ptr [___unnamed_float_1]
        movss   xmm0,dword ptr [eax]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        lea     eax,[ebp+12]
        mov     ecx,8
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp+12]
        mov     ecx,4
        add     ecx,[eax]
        push    dword ptr [ecx]
        lea     eax,[ebp+12]
        mov     eax,[eax]
        push    dword ptr [eax]
        lea     eax,[ebp-16]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [__mvproj_matrix]
        push    eax
        lea     eax,[ebp-16]
        push    eax
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        call    _matrix4f_transform
        add     esp,12
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
        lea     eax,[ebp+8]
        push    dword ptr [eax]
        lea     eax,[ebp-196]
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        mov     ecx,16
        add     eax,ecx
        lea     ecx,[ebp+20]
        mov     ecx,[ecx]
        mov     edx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ecx
        lea     eax,[ebp+12]
        push    dword ptr [eax]
        lea     eax,[ebp-196]
        mov     ecx,24
        add     eax,ecx
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        mov     ecx,24
        add     eax,ecx
        mov     ecx,16
        add     eax,ecx
        lea     ecx,[ebp+24]
        mov     ecx,[ecx]
        mov     edx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ecx
        lea     eax,[ebp+16]
        push    dword ptr [eax]
        lea     eax,[ebp-196]
        mov     ecx,48
        add     eax,ecx
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        mov     ecx,48
        add     eax,ecx
        mov     ecx,16
        add     eax,ecx
        lea     ecx,[ebp+28]
        mov     ecx,[ecx]
        mov     edx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ecx
        lea     eax,[ebp-196]
        mov     ecx,72
        add     eax,ecx
        lea     ecx,[ebp-196]
        mov     edi,eax
        mov     esi,ecx
        mov     ecx,6
        rep     movsd
        lea     ecx,[ebp-196]
        mov     eax,192
        add     ecx,eax
        mov     eax,4
        mov     [ecx],eax
        lea     eax,[ebp-196]
        push    eax
        call    __rasterize_polygon_4f
        add     esp,4
        pop     esi
        pop     edi
        add     esp,196
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
