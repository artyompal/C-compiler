
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
___unnamed_float_1      dd      040000000h
public  ___unnamed_float_1
___unnamed_float_2      dd      0bf800000h
public  ___unnamed_float_2
___unnamed_float_3      dd      0437f0000h
public  ___unnamed_float_3

.code

_rasterizer_init proc
        push    ebp
        mov     ebp,esp
        sub     esp,76
        push    edi
        push    esi
        mov     edi,[ebp+20]
        mov     esi,[ebp+8]
        mov     dword ptr [__dbgprintf],esi
        mov     esi,[ebp+12]
        mov     dword ptr [__width],esi
        mov     esi,[ebp+16]
        mov     dword ptr [__height],esi
        mov     dword ptr [__pitch],edi
; start of inline function matrix4f_make_perspective
        fild    dword ptr [ebp+12]
        fild    dword ptr [ebp+16]
        fdivp
        fstp    dword ptr [ebp-32]
        fld     dword ptr [ebp+32]
        fstp    dword ptr [ebp-36]
        fld     dword ptr [ebp+28]
        fstp    dword ptr [ebp-40]
        fld     dword ptr [ebp+24]
        fstp    dword ptr [ebp-44]
        mov     edi,(offset __mvproj_matrix)
        fld     dword ptr [ebp-36]
        fmul    dword ptr [ebp-44]
        fstp    dword ptr [ebp-52]
        fld     dword ptr [ebp-52]
        fmul    dword ptr [ebp-32]
        fstp    dword ptr [ebp-56]
        fld     dword ptr [ebp-44]
        fdiv    dword ptr [ebp-56]
        fstp    dword ptr [edi]
        fldz
        fstp    dword ptr [edi+4]
        fldz
        fstp    dword ptr [edi+8]
        fldz
        fstp    dword ptr [edi+12]
        fldz
        fstp    dword ptr [edi+16]
        fld     dword ptr [ebp-44]
        fdiv    dword ptr [ebp-52]
        fstp    dword ptr [edi+20]
        fldz
        fstp    dword ptr [edi+24]
        fldz
        fstp    dword ptr [edi+28]
        fldz
        fstp    dword ptr [edi+32]
        fldz
        fstp    dword ptr [edi+36]
        fld     dword ptr [ebp-40]
        fsub    dword ptr [ebp-44]
        fdivr   dword ptr [ebp-40]
        fstp    dword ptr [edi+40]
        fld1
        fstp    dword ptr [edi+44]
        fldz
        fstp    dword ptr [edi+48]
        fldz
        fstp    dword ptr [edi+52]
        fld     dword ptr [ebp-44]
        fmul    dword ptr [ebp-40]
        fld     dword ptr [ebp-44]
        fsub    dword ptr [ebp-40]
        fdivp
        fstp    dword ptr [edi+56]
        fldz
        fstp    dword ptr [edi+60]
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        fld     dword ptr [ebp+28]
        fstp    dword ptr [ebp-60]
        fld     dword ptr [ebp+24]
        fstp    dword ptr [ebp-64]
        fild    dword ptr [ebp+16]
        fstp    dword ptr [ebp-68]
        fild    dword ptr [ebp+12]
        fstp    dword ptr [ebp-72]
        mov     edi,(offset __viewport_matrix)
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-72]
        fstp    dword ptr [edi]
        fldz
        fstp    dword ptr [edi+4]
        fldz
        fstp    dword ptr [edi+8]
        fldz
        fstp    dword ptr [edi+12]
        fldz
        fstp    dword ptr [edi+16]
        fld     dword ptr [ebp-68]
        fldz
        fsubrp
        fld     dword ptr [___unnamed_float_1]
        fdivp
        fstp    dword ptr [edi+20]
        fldz
        fstp    dword ptr [edi+24]
        fldz
        fstp    dword ptr [edi+28]
        fldz
        fstp    dword ptr [edi+32]
        fldz
        fstp    dword ptr [edi+36]
        fld     dword ptr [ebp-60]
        fsub    dword ptr [ebp-64]
        fstp    dword ptr [edi+40]
        fldz
        fstp    dword ptr [edi+44]
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-72]
        fstp    dword ptr [edi+48]
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-68]
        fstp    dword ptr [edi+52]
        fld     dword ptr [ebp-64]
        fstp    dword ptr [edi+56]
        fld1
        fstp    dword ptr [edi+60]
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fld     dword ptr [ebp+24]
        fstp    dword ptr [ebp-16]
        fldz
        fstp    dword ptr [ebp-20]
        fldz
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_z_near_base)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
        fld     dword ptr [ebp+24]
        fld     dword ptr [ebp+28]
        fucomip st,st(1)
        fstp    st
        jbe     label0000
        fld1
        fstp    dword ptr [ebp-4]
        jmp     label0001
label0000:
        fld     dword ptr [___unnamed_float_2]
        fstp    dword ptr [ebp-4]
label0001:
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fld     dword ptr [ebp-4]
        fstp    dword ptr [ebp-16]
        fldz
        fstp    dword ptr [ebp-20]
        fldz
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_z_near_norm)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fld     dword ptr [ebp+28]
        fstp    dword ptr [ebp-16]
        fldz
        fstp    dword ptr [ebp-20]
        fldz
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_z_far_base)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
        fld     dword ptr [ebp+24]
        fld     dword ptr [ebp+28]
        fucomip st,st(1)
        fstp    st
        jbe     label0002
        fld     dword ptr [___unnamed_float_2]
        fstp    dword ptr [ebp-8]
        jmp     label0003
label0002:
        fld1
        fstp    dword ptr [ebp-8]
label0003:
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fld     dword ptr [ebp-8]
        fstp    dword ptr [ebp-16]
        fldz
        fstp    dword ptr [ebp-20]
        fldz
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_z_far_norm)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fldz
        fstp    dword ptr [ebp-16]
        fldz
        fstp    dword ptr [ebp-20]
        fild    dword ptr [ebp+12]
        fld1
        fdivrp
        fld     dword ptr [___unnamed_float_2]
        faddp
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_plane_left_base)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fldz
        fstp    dword ptr [ebp-16]
        fldz
        fstp    dword ptr [ebp-20]
        fld1
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_plane_left_norm)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fldz
        fstp    dword ptr [ebp-16]
        fldz
        fstp    dword ptr [ebp-20]
        fild    dword ptr [ebp+12]
        fld1
        fdivrp
        fld1
        fsubrp
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_plane_right_base)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fldz
        fstp    dword ptr [ebp-16]
        fldz
        fstp    dword ptr [ebp-20]
        fld     dword ptr [___unnamed_float_2]
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_plane_right_norm)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fldz
        fstp    dword ptr [ebp-16]
        fild    dword ptr [ebp+16]
        fld1
        fdivrp
        fld     dword ptr [___unnamed_float_2]
        faddp
        fstp    dword ptr [ebp-20]
        fldz
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_plane_top_base)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fldz
        fstp    dword ptr [ebp-16]
        fld1
        fstp    dword ptr [ebp-20]
        fldz
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_plane_top_norm)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fldz
        fstp    dword ptr [ebp-16]
        fld1
        fstp    dword ptr [ebp-20]
        fldz
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_plane_bottom_base)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-12]
        fldz
        fstp    dword ptr [ebp-16]
        fld     dword ptr [___unnamed_float_2]
        fstp    dword ptr [ebp-20]
        fldz
        fstp    dword ptr [ebp-24]
        mov     edi,(offset __clip_plane_bottom_norm)
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-16]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-12]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
        pop     esi
        pop     edi
        add     esp,76
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
        mov     esi,[ebp+8]
        lea     edi, [__mvproj_matrix]
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

__rasterize_horiz_line proc
        push    ebp
        mov     ebp,esp
        sub     esp,68
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,dword ptr [__pitch]
        imul    eax,edi
        add     eax,dword ptr [__videomem]
        mov     edi,ebx
        sal     edi,2
        add     eax,edi
        mov     edi,eax
        mov     eax,esi
        sal     eax,2
        add     eax,edi
        sal     ebx,2
        sub     eax,ebx
label0000:
; start of inline function _tex2d
        fld     dword ptr [ebp+24]
        fstp    dword ptr [ebp-48]
        fld     dword ptr [ebp+20]
        fstp    dword ptr [ebp-52]
        mov     ebx,dword ptr [__texture_width]
        dec     ebx
        mov     [ebp-68],ebx
        fild    dword ptr [ebp-68]
        fmul    dword ptr [ebp-52]
        fistp   dword ptr [ebp-68]
        mov     ebx,[ebp-68]
        mov     esi,dword ptr [__texture_height]
        dec     esi
        mov     [ebp-68],esi
        fild    dword ptr [ebp-68]
        fmul    dword ptr [ebp-48]
        fistp   dword ptr [ebp-68]
        mov     esi,[ebp-68]
        imul    esi,dword ptr [__texture_width]
        add     esi,ebx
        sal     esi,2
        add     esi,dword ptr [__texture_data]
        mov     ebx,[esi]
; end of inline function _tex2d
        mov     esi,ebx
        sar     esi,24
        and     esi,255
        mov     [ebp-40],esi
        cmp     dword ptr [ebp-40],0
        je      label0003
        fild    dword ptr [ebp-40]
        fld     dword ptr [___unnamed_float_3]
        fdivp
        fstp    dword ptr [ebp-44]
        mov     esi,[edi]
        mov     ecx,esi
        and     ecx,65280
        sar     ecx,8
        mov     [ebp-32],ecx
        mov     ecx,esi
        and     ecx,255
        mov     [ebp-36],ecx
        mov     ecx,ebx
        and     ecx,65280
        sar     ecx,8
        mov     [ebp-20],ecx
        mov     ecx,ebx
        and     ecx,255
        mov     [ebp-24],ecx
        fild    dword ptr [ebp-20]
        fmul    dword ptr [ebp-44]
        fild    dword ptr [ebp-32]
        fld1
        fsub    dword ptr [ebp-44]
        fmulp
        faddp
        fistp   dword ptr [ebp-68]
        mov     ecx,[ebp-68]
        mov     [ebp-20],ecx
        fild    dword ptr [ebp-24]
        fmul    dword ptr [ebp-44]
        fild    dword ptr [ebp-36]
        fld1
        fsub    dword ptr [ebp-44]
        fmulp
        faddp
        fistp   dword ptr [ebp-68]
        mov     ecx,[ebp-68]
        mov     [ebp-24],ecx
        mov     ecx,[ebp-20]
        sal     ecx,8
        add     ecx,[ebp-24]
        mov     [edi],ecx
label0003:
        fld     dword ptr [ebp+20]
        fadd    dword ptr [ebp+28]
        fstp    dword ptr [ebp+20]
        fld     dword ptr [ebp+24]
        fadd    dword ptr [ebp+32]
        fstp    dword ptr [ebp+24]
        add     edi,4
        cmp     edi,eax
        jl      label0000
        pop     ebx
        pop     esi
        pop     edi
        add     esp,68
        pop     ebp
        ret
__rasterize_horiz_line endp

__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,136
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+20]
        mov     esi,[ebp+16]
        mov     ebx,[ebp+12]
        mov     [ebp+16],esi
        mov     esi,[ebp+8]
        mov     dword ptr [esi+192],0
        mov     [ebp+8],esi
        mov     esi,ebx
        lea     eax,[ebx+24]
label0001:
        mov     ecx,[ebx+192]
        imul    ecx,24
        mov     edx,ebx
        add     edx,ecx
        cmp     edx,eax
        jle     label0002
; start of inline function vec4f_subtract
        lea     ecx,[ebp-24]
        fld     dword ptr [esi]
        mov     [ebp-4],esi
        mov     esi,[ebp+16]
        fsub    dword ptr [esi]
        fstp    dword ptr [ecx]
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        fld     dword ptr [esi+4]
        mov     [ebp-4],esi
        mov     esi,[ebp+16]
        fsub    dword ptr [esi+4]
        fstp    dword ptr [ecx+4]
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        fld     dword ptr [esi+8]
        mov     [ebp-4],esi
        mov     esi,[ebp+16]
        fsub    dword ptr [esi+8]
        fstp    dword ptr [ecx+8]
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        fld     dword ptr [esi+12]
        mov     [ebp-4],esi
        mov     esi,[ebp+16]
        fsub    dword ptr [esi+12]
        fstp    dword ptr [ecx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        lea     ecx,[ebp-24]
        fld     dword ptr [ecx+4]
        fmul    dword ptr [edi+4]
        fld     dword ptr [ecx]
        fmul    dword ptr [edi]
        faddp
        fld     dword ptr [ecx+8]
        fmul    dword ptr [edi+8]
        faddp
        fld     dword ptr [ecx+12]
        fmul    dword ptr [edi+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
        fstp    dword ptr [ebp-52]
; start of inline function vec4f_subtract
        mov     edx,esi
        mov     ecx,eax
        mov     [ebp+12],ebx
        lea     ebx,[ebp-24]
        fld     dword ptr [ecx]
        fsub    dword ptr [edx]
        fstp    dword ptr [ebx]
        fld     dword ptr [ecx+4]
        fsub    dword ptr [edx+4]
        fstp    dword ptr [ebx+4]
        fld     dword ptr [ecx+8]
        fsub    dword ptr [edx+8]
        fstp    dword ptr [ebx+8]
        fld     dword ptr [ecx+12]
        fsub    dword ptr [edx+12]
        fstp    dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     ebx,edi
        lea     ecx,[ebp-24]
        mov     edx,ecx
        fld     dword ptr [edx+4]
        fmul    dword ptr [ebx+4]
        fld     dword ptr [edx]
        fmul    dword ptr [ebx]
        faddp
        fld     dword ptr [edx+8]
        fmul    dword ptr [ebx+8]
        faddp
        fld     dword ptr [edx+12]
        fmul    dword ptr [ebx+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
        fstp    dword ptr [ebp-56]
        fldz
        fld     dword ptr [ebp-52]
        fucomip st,st(1)
        fstp    st
        jb      label0003
        mov     [ebp+16],esi
        mov     esi,[ebp+8]
        mov     ecx,[esi+192]
        inc     dword ptr [esi+192]
        imul    ecx,24
        mov     [ebp+20],edi
        mov     edi,esi
        add     edi,ecx
        mov     ecx,6
        rep     movsd
        mov     [ebp+8],esi
        mov     esi,[ebp+16]
        mov     edi,[ebp+20]
label0003:
        fldz
        fld     dword ptr [ebp-52]
        fucomip st,st(1)
        fstp    st
        jbe     label0006
        fldz
        fld     dword ptr [ebp-56]
        fucomip st,st(1)
        fstp    st
        jb      label0005
label0006:
        fldz
        fld     dword ptr [ebp-56]
        fucomip st,st(1)
        fstp    st
        jb      label0004
        fldz
        fld     dword ptr [ebp-52]
        fucomip st,st(1)
        fstp    st
        jae     label0004
label0005:
; start of inline function vec4f_subtract
        lea     ecx,[ebp-24]
        fld     dword ptr [esi]
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        fsub    dword ptr [esi]
        fstp    dword ptr [ecx]
        mov     [ebp-4],esi
        mov     esi,[ebp+16]
        fld     dword ptr [esi+4]
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        fsub    dword ptr [esi+4]
        fstp    dword ptr [ecx+4]
        mov     [ebp-4],esi
        mov     esi,[ebp+16]
        fld     dword ptr [esi+8]
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        fsub    dword ptr [esi+8]
        fstp    dword ptr [ecx+8]
        mov     [ebp-4],esi
        mov     esi,[ebp+16]
        fld     dword ptr [esi+12]
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        fsub    dword ptr [esi+12]
        fstp    dword ptr [ecx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        lea     ecx,[ebp-40]
        fld     dword ptr [eax]
        fsub    dword ptr [esi]
        fstp    dword ptr [ecx]
        fld     dword ptr [eax+4]
        fsub    dword ptr [esi+4]
        fstp    dword ptr [ecx+4]
        fld     dword ptr [eax+8]
        fsub    dword ptr [esi+8]
        fstp    dword ptr [ecx+8]
        fld     dword ptr [eax+12]
        fsub    dword ptr [esi+12]
        fstp    dword ptr [ecx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        lea     ecx,[ebp-24]
        fld     dword ptr [ecx+4]
        fmul    dword ptr [edi+4]
        fld     dword ptr [ecx]
        fmul    dword ptr [edi]
        faddp
        fld     dword ptr [ecx+8]
        fmul    dword ptr [edi+8]
        faddp
        fld     dword ptr [ecx+12]
        fmul    dword ptr [edi+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
; start of inline function vec4f_dot
        lea     ecx,[ebp-40]
        fld     dword ptr [ecx+4]
        fmul    dword ptr [edi+4]
        fld     dword ptr [ecx]
        fmul    dword ptr [edi]
        faddp
        fld     dword ptr [ecx+8]
        fmul    dword ptr [edi+8]
        faddp
        fld     dword ptr [ecx+12]
        fmul    dword ptr [edi+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
        fdivp
        fstp    dword ptr [ebp-60]
; start of inline function vec4f_mul
        fld     dword ptr [ebp-60]
        fstp    dword ptr [ebp-132]
        lea     ecx,[ebp-40]
        fld     dword ptr [ecx]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [ecx]
        fld     dword ptr [ecx+4]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [ecx+4]
        fld     dword ptr [ecx+8]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [ecx+8]
        fld     dword ptr [ecx+12]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [ecx+12]
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     ecx,[ebp-40]
        mov     [ebp-4],esi
        mov     esi,[ebp+8]
        mov     edx,[esi+192]
        imul    edx,24
        mov     ebx,esi
        add     ebx,edx
        mov     [ebp+8],esi
        mov     esi,[ebp-4]
        fld     dword ptr [esi]
        fadd    dword ptr [ecx]
        fstp    dword ptr [ebx]
        fld     dword ptr [esi+4]
        fadd    dword ptr [ecx+4]
        fstp    dword ptr [ebx+4]
        fld     dword ptr [esi+8]
        fadd    dword ptr [ecx+8]
        fstp    dword ptr [ebx+8]
        fld     dword ptr [esi+12]
        fadd    dword ptr [ecx+12]
        fstp    dword ptr [ebx+12]
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     ecx,16
        add     ecx,esi
        mov     edx,16
        add     edx,eax
        lea     ebx,[ebp-48]
        fld     dword ptr [edx]
        fsub    dword ptr [ecx]
        fstp    dword ptr [ebx]
        fld     dword ptr [edx+4]
        fsub    dword ptr [ecx+4]
        fstp    dword ptr [ebx+4]
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        fld     dword ptr [ebp-60]
        fstp    dword ptr [ebp-88]
        lea     ecx,[ebp-48]
        fld     dword ptr [ecx]
        fmul    dword ptr [ebp-88]
        fstp    dword ptr [ecx]
        fld     dword ptr [ecx+4]
        fmul    dword ptr [ebp-88]
        fstp    dword ptr [ecx+4]
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     ecx,[ebp-48]
        mov     edx,16
        add     edx,esi
        mov     [ebp-4],esi
        mov     esi,[ebp+8]
        mov     ebx,[esi+192]
        imul    ebx,24
        mov     [ebp+20],edi
        mov     edi,esi
        add     edi,ebx
        add     edi,16
        fld     dword ptr [edx]
        fadd    dword ptr [ecx]
        fstp    dword ptr [edi]
        fld     dword ptr [edx+4]
        fadd    dword ptr [ecx+4]
        fstp    dword ptr [edi+4]
; end of inline function vec2f_add
        inc     dword ptr [esi+192]
        mov     [ebp+8],esi
        mov     esi,[ebp+16]
        mov     edi,[ebp+20]
label0004:
        mov     [ebp+16],esi
        mov     esi,[ebp-4]
        add     esi,24
        add     eax,24
        mov     ebx,[ebp+12]
        jmp     label0001
label0002:
        mov     esi,[ebp+8]
        mov     eax,[esi+192]
        inc     dword ptr [esi+192]
        imul    eax,24
        mov     edi,esi
        add     edi,eax
        mov     ecx,6
        rep     movsd
        pop     ebx
        pop     esi
        pop     edi
        add     esp,136
        pop     ebp
        ret
__clip_on_plain endp

__transform_to_projection_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,48
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
; start of inline function vec4f_assign
        fld1
        fstp    dword ptr [ebp-20]
        fld     dword ptr [edi+8]
        fstp    dword ptr [ebp-24]
        fld     dword ptr [edi+4]
        fstp    dword ptr [ebp-28]
        fld     dword ptr [edi]
        fstp    dword ptr [ebp-32]
        lea     edi,[ebp-16]
        fld     dword ptr [ebp-32]
        fstp    dword ptr [edi]
        fld     dword ptr [ebp-28]
        fstp    dword ptr [edi+4]
        fld     dword ptr [ebp-24]
        fstp    dword ptr [edi+8]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [edi+12]
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        mov     edi,(offset __mvproj_matrix)
        lea     eax,[ebp-16]
        fld     dword ptr [eax+4]
        fmul    dword ptr [edi+16]
        fld     dword ptr [eax]
        fmul    dword ptr [edi]
        faddp
        fld     dword ptr [eax+8]
        fmul    dword ptr [edi+32]
        faddp
        fld     dword ptr [eax+12]
        fmul    dword ptr [edi+48]
        faddp
        fstp    dword ptr [esi]
        fld     dword ptr [eax]
        fmul    dword ptr [edi+4]
        fld     dword ptr [eax+4]
        fmul    dword ptr [edi+20]
        faddp
        fld     dword ptr [eax+8]
        fmul    dword ptr [edi+36]
        faddp
        fld     dword ptr [eax+12]
        fmul    dword ptr [edi+52]
        faddp
        fstp    dword ptr [esi+4]
        fld     dword ptr [eax]
        fmul    dword ptr [edi+8]
        fld     dword ptr [eax+4]
        fmul    dword ptr [edi+24]
        faddp
        fld     dword ptr [eax+8]
        fmul    dword ptr [edi+40]
        faddp
        fld     dword ptr [eax+12]
        fmul    dword ptr [edi+56]
        faddp
        fstp    dword ptr [esi+8]
        fld     dword ptr [eax]
        fmul    dword ptr [edi+12]
        fld     dword ptr [eax+4]
        fmul    dword ptr [edi+28]
        faddp
        fld     dword ptr [eax+8]
        fmul    dword ptr [edi+44]
        faddp
        fld     dword ptr [eax+12]
        fmul    dword ptr [edi+60]
        faddp
        fstp    dword ptr [esi+12]
; end of inline function matrix4f_transform
        pop     esi
        pop     edi
        add     esp,48
        pop     ebp
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        push    ebp
        mov     ebp,esp
        sub     esp,736
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
        mov     ebx,[esi+4]
        mov     [eax],ecx
        mov     [eax+4],ebx
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
        mov     ebx,[edi+4]
        mov     [eax],ecx
        mov     [eax+4],ebx
        lea     edi,[ebp-196]
        add     edi,72
        lea     esi,[ebp-196]
        mov     ecx,6
        rep     movsd
        lea     eax,[ebp-196]
        add     eax,192
        mov     dword ptr [eax],4
; start of inline function _rasterize_polygon_4f
        lea     eax,[ebp-196]
; start of inline function _clip_poligon
        mov     [ebp-712],eax
        lea     ecx,dword ptr [__clip_z_far_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_z_far_base]
        push    ecx
        push    dword ptr [ebp-712]
        lea     ecx,[ebp-660]
        push    ecx
        call    __clip_on_plain
        add     esp,16
        lea     ecx,dword ptr [__clip_z_near_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_z_near_base]
        push    ecx
        lea     ecx,[ebp-660]
        push    ecx
        push    dword ptr [ebp-712]
        call    __clip_on_plain
        add     esp,16
        lea     ecx,dword ptr [__clip_plane_left_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_plane_left_base]
        push    ecx
        push    dword ptr [ebp-712]
        lea     ecx,[ebp-660]
        push    ecx
        call    __clip_on_plain
        add     esp,16
        lea     ecx,dword ptr [__clip_plane_right_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_plane_right_base]
        push    ecx
        lea     ecx,[ebp-660]
        push    ecx
        push    dword ptr [ebp-712]
        call    __clip_on_plain
        add     esp,16
        lea     ecx,dword ptr [__clip_plane_top_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_plane_top_base]
        push    ecx
        push    dword ptr [ebp-712]
        lea     ecx,[ebp-660]
        push    ecx
        call    __clip_on_plain
        add     esp,16
        lea     ecx,dword ptr [__clip_plane_bottom_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_plane_bottom_base]
        push    ecx
        lea     ecx,[ebp-660]
        push    ecx
        push    dword ptr [ebp-712]
        call    __clip_on_plain
        add     esp,16
        mov     ecx,[ebp-712]
        cmp     dword ptr [ecx+192],1
        setg    bl
        movzx   ebx,bl
; end of inline function _clip_poligon
        cmp     ebx,0
        jne     label0000
        jmp     label002d
label0000:
        mov     ebx,[ebp-712]
        cmp     dword ptr [ebx+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     edi,0
label0003:
        mov     eax,[ebp-712]
        mov     esi,[eax+192]
        cmp     esi,edi
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     esi,eax
        mov     ecx,edi
        imul    ecx,24
        add     esi,ecx
        lea     ecx,[ebp-332]
        mov     edx,edi
        sal     edx,4
        add     ecx,edx
        mov     edx,ecx
; start of inline function matrix4f_transform
        mov     ecx,(offset __viewport_matrix)
        lea     ebx,[ebp-688]
        fld     dword ptr [esi+4]
        fmul    dword ptr [ecx+16]
        fld     dword ptr [esi]
        fmul    dword ptr [ecx]
        faddp
        fld     dword ptr [esi+8]
        fmul    dword ptr [ecx+32]
        faddp
        fld     dword ptr [esi+12]
        fmul    dword ptr [ecx+48]
        faddp
        fstp    dword ptr [ebx]
        fld     dword ptr [esi]
        fmul    dword ptr [ecx+4]
        fld     dword ptr [esi+4]
        fmul    dword ptr [ecx+20]
        faddp
        fld     dword ptr [esi+8]
        fmul    dword ptr [ecx+36]
        faddp
        fld     dword ptr [esi+12]
        fmul    dword ptr [ecx+52]
        faddp
        fstp    dword ptr [ebx+4]
        fld     dword ptr [esi]
        fmul    dword ptr [ecx+8]
        fld     dword ptr [esi+4]
        fmul    dword ptr [ecx+24]
        faddp
        fld     dword ptr [esi+8]
        fmul    dword ptr [ecx+40]
        faddp
        fld     dword ptr [esi+12]
        fmul    dword ptr [ecx+56]
        faddp
        fstp    dword ptr [ebx+8]
        fld     dword ptr [esi]
        fmul    dword ptr [ecx+12]
        fld     dword ptr [esi+4]
        fmul    dword ptr [ecx+28]
        faddp
        fld     dword ptr [esi+8]
        fmul    dword ptr [ecx+44]
        faddp
        fld     dword ptr [esi+12]
        fmul    dword ptr [ecx+60]
        faddp
        fstp    dword ptr [ebx+12]
; end of inline function matrix4f_transform
        lea     ecx,[ebp-688]
        add     ecx,12
        fld1
        fdiv    dword ptr [ecx]
        fstp    dword ptr [ebp-692]
        fld     dword ptr [ebp-688]
        fmul    dword ptr [ebp-692]
        fistp   dword ptr [ebp-708]
        mov     ecx,[ebp-708]
        mov     [edx],ecx
        lea     ecx,[ebp-688]
        add     ecx,4
        fld     dword ptr [ecx]
        fmul    dword ptr [ebp-692]
        fistp   dword ptr [ebp-708]
        mov     ecx,[ebp-708]
        mov     [edx+4],ecx
        cmp     dword ptr [edx],0
        jl      label002a
        mov     ecx,[edx]
        cmp     ecx,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [edx+4],0
        jl      label002a
        mov     ecx,[edx+4]
        cmp     ecx,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     ecx,[ebp-332]
        mov     edx,edi
        sal     edx,4
        add     ecx,edx
        add     ecx,8
        mov     edx,eax
        mov     ebx,edi
        imul    ebx,24
        add     edx,ebx
        add     edx,16
        mov     ebx,[edx]
        mov     edx,[edx+4]
        mov     [ecx],ebx
        mov     [ecx+4],edx
        inc     edi
        mov     [ebp-712],eax
        jmp     label0003
        mov     eax,[ebp-712]
label0004:
        mov     edi,2
label0006:
        mov     esi,[eax+192]
        dec     esi
        cmp     esi,edi
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     esi,[ebp-332]
        mov     ecx,edi
        sal     ecx,4
        add     esi,ecx
        mov     ecx,edi
        dec     ecx
        sal     ecx,4
        lea     edx,[ebp-332]
        add     edx,ecx
        lea     ecx,[ebp-332]
        lea     ebx,[ecx+4]
        mov     [ebp-712],eax
        lea     eax,[edx+4]
        mov     ebx,[ebx]
        cmp     ebx,[eax]
        jle     label0008
        mov     ebx,ecx
        mov     ecx,edx
        mov     edx,ebx
label0008:
        lea     eax,[ecx+4]
        lea     ebx,[esi+4]
        mov     eax,[eax]
        cmp     eax,[ebx]
        jle     label0009
        mov     ebx,ecx
        mov     ecx,esi
        mov     esi,ebx
label0009:
        lea     eax,[edx+4]
        lea     ebx,[esi+4]
        mov     eax,[eax]
        cmp     eax,[ebx]
        jle     label000a
        mov     ebx,edx
        mov     edx,esi
        mov     esi,ebx
label000a:
        lea     eax,[ecx+4]
        lea     ebx,[esi+4]
        mov     eax,[eax]
        cmp     eax,[ebx]
        jne     label000b
        lea     eax,[ecx+4]
        cmp     dword ptr [eax],0
        jl      label000c
        lea     eax,[ecx+4]
        mov     eax,[eax]
        cmp     eax,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        fldz
        fstp    dword ptr [ebp-428]
        fldz
        fstp    dword ptr [ebp-432]
        mov     eax,8
        add     eax,esi
        mov     ebx,eax
        mov     eax,8
        add     eax,edx
        mov     [ebp-336],edi
        mov     edi,8
        add     edi,ecx
        mov     [ebp-440],eax
        lea     eax,[ecx+4]
        mov     eax,[eax]
        mov     esi,[esi]
        mov     edx,[edx]
        mov     ecx,[ecx]
        cmp     ecx,edx
        jge     label001c
        cmp     esi,edx
        jle     label001d
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    eax
        push    esi
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
label001d:
        cmp     esi,ecx
        jge     label001f
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        push    dword ptr [ebx+4]
        push    dword ptr [ebx]
        push    eax
        push    edx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    eax
        push    edx
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
label001c:
        cmp     esi,edx
        jge     label0022
        fld     dword ptr [ebp-428]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld     dword ptr [ebp-432]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        push    dword ptr [ebx+4]
        push    dword ptr [ebx]
        push    eax
        push    ecx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
label0022:
        cmp     esi,ecx
        jle     label0024
        fld     dword ptr [ebp-428]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld     dword ptr [ebp-432]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        mov     [ebp-448],eax
        mov     eax,[ebp-440]
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        push    dword ptr [ebp-448]
        push    esi
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
        mov     [ebp-440],eax
        mov     eax,[ebp-448]
label0024:
        fld     dword ptr [ebp-428]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld     dword ptr [ebp-432]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        mov     [ebp-448],eax
        mov     eax,[ebp-440]
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        push    dword ptr [ebp-448]
        push    ecx
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
        mov     edi,[ebp-336]
label000c:
        jmp     label0027
label000b:
        lea     eax,[ecx+4]
        mov     eax,[eax]
        mov     ebx,eax
label000e:
        lea     eax,[edx+4]
        mov     eax,[eax]
        cmp     eax,ebx
        jle     label000f
        lea     eax,[ecx+4]
        mov     [ebp-716],eax
        mov     eax,ebx
        mov     [ebp-336],edi
        mov     edi,[ebp-716]
        sub     eax,[edi]
        mov     edi,[edx]
        sub     edi,[ecx]
        imul    eax,edi
        lea     edi,[edx+4]
        mov     [ebp-344],edx
        lea     edx,[ecx+4]
        mov     edi,[edi]
        sub     edi,[edx]
        cdq
        idiv    edi
        add     eax,[ecx]
        mov     edi,eax
        lea     eax,[ecx+4]
        mov     [ebp-720],eax
        mov     eax,ebx
        mov     edx,[ebp-720]
        sub     eax,[edx]
        mov     edx,[esi]
        sub     edx,[ecx]
        imul    eax,edx
        lea     edx,[esi+4]
        mov     [ebp-356],edi
        lea     edi,[ecx+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-724],edx
        cdq
        idiv    dword ptr [ebp-724]
        add     eax,[ecx]
        mov     edi,eax
        lea     eax,[ecx+4]
        mov     edx,ebx
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     edx,[ebp-344]
        fld     dword ptr [edx+8]
        fsub    dword ptr [ecx+8]
        fmulp
        lea     eax,[edx+4]
        mov     [ebp-360],edi
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [ecx+8]
        fstp    dword ptr [ebp-368]
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        fld     dword ptr [esi+8]
        fsub    dword ptr [ecx+8]
        fmulp
        lea     eax,[esi+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [ecx+8]
        fstp    dword ptr [ebp-376]
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,edx
        add     eax,4
        mov     edi,8
        add     edi,ecx
        add     edi,4
        fld     dword ptr [eax]
        fsub    dword ptr [edi]
        fmulp
        lea     eax,[edx+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,ecx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-372]
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     edi,8
        add     edi,ecx
        add     edi,4
        fld     dword ptr [eax]
        fsub    dword ptr [edi]
        fmulp
        lea     eax,[esi+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,ecx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-380]
        mov     eax,[ebp-360]
        sub     eax,[ebp-356]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fld     dword ptr [ebp-376]
        fsub    dword ptr [ebp-368]
        fdivrp
        fstp    dword ptr [ebp-384]
        mov     eax,[ebp-360]
        sub     eax,[ebp-356]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fld     dword ptr [ebp-380]
        fsub    dword ptr [ebp-372]
        fdivrp
        fstp    dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
        fld     dword ptr [ebp-388]
        fstp    dword ptr [ebp-392]
        fld     dword ptr [ebp-384]
        fstp    dword ptr [ebp-396]
        fld     dword ptr [ebp-380]
        fstp    dword ptr [ebp-400]
        fld     dword ptr [ebp-376]
        fstp    dword ptr [ebp-404]
        fld     dword ptr [ebp-372]
        fstp    dword ptr [ebp-408]
        fld     dword ptr [ebp-368]
        fstp    dword ptr [ebp-412]
        mov     edi,ebx
        mov     eax,[ebp-360]
        mov     [ebp-340],esi
        mov     esi,[ebp-356]
        cmp     esi,eax
        jg      label0013
        mov     [ebp-348],ecx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    edi
        push    eax
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
        mov     ecx,[ebp-348]
        mov     edx,[ebp-344]
label0013:
        mov     [ebp-348],ecx
        mov     [ebp-344],edx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    edi
        push    esi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     ebx
        mov     ecx,[ebp-348]
        mov     edx,[ebp-344]
        mov     esi,[ebp-340]
        mov     edi,[ebp-336]
        jmp     label000e
label000f:
        lea     eax,[edx+4]
        lea     ebx,[ecx+4]
        mov     [ebp-728],eax
        mov     [ebp-336],edi
        mov     edi,[ebp-728]
        mov     eax,[edi]
        sub     eax,[ebx]
        mov     ebx,[esi]
        sub     ebx,[ecx]
        imul    eax,ebx
        lea     ebx,[esi+4]
        lea     edi,[ecx+4]
        mov     ebx,[ebx]
        sub     ebx,[edi]
        mov     [ebp-344],edx
        cdq
        idiv    ebx
        add     eax,[ecx]
        mov     edi,eax
        mov     edx,[ebp-344]
        lea     eax,[edx+4]
        lea     ebx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[ebx]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fld     dword ptr [esi+8]
        fsub    dword ptr [ecx+8]
        fmulp
        lea     eax,[esi+4]
        lea     ebx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[ebx]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [ecx+8]
        fstp    dword ptr [ebp-376]
        lea     eax,[edx+4]
        lea     ebx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[ebx]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     ebx,8
        add     ebx,ecx
        add     ebx,4
        fld     dword ptr [eax]
        fsub    dword ptr [ebx]
        fmulp
        lea     eax,[esi+4]
        lea     ebx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[ebx]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,ecx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-380]
        fld     dword ptr [ebp-376]
        fsub    dword ptr [edx+8]
        mov     eax,edi
        sub     eax,[edx]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        fstp    dword ptr [ebp-384]
        mov     eax,8
        add     eax,edx
        add     eax,4
        fld     dword ptr [ebp-380]
        fsub    dword ptr [eax]
        mov     eax,edi
        sub     eax,[edx]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        fstp    dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
        fld     dword ptr [ebp-388]
        fstp    dword ptr [ebp-392]
        fld     dword ptr [ebp-384]
        fstp    dword ptr [ebp-396]
        mov     eax,8
        add     eax,edx
        add     eax,4
        fld     dword ptr [eax]
        fstp    dword ptr [ebp-400]
        fld     dword ptr [edx+8]
        fstp    dword ptr [ebp-404]
        fld     dword ptr [ebp-380]
        fstp    dword ptr [ebp-408]
        fld     dword ptr [ebp-376]
        fstp    dword ptr [ebp-412]
        lea     eax,[edx+4]
        mov     eax,[eax]
        mov     [ebp-360],edi
        mov     edi,eax
        mov     eax,[edx]
        mov     [ebp-340],esi
        mov     esi,[ebp-360]
        cmp     esi,eax
        jg      label0016
        mov     [ebp-348],ecx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    edi
        push    eax
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
        mov     ecx,[ebp-348]
        mov     edx,[ebp-344]
label0016:
        mov     [ebp-348],ecx
        mov     [ebp-344],edx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    edi
        push    esi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     edx,[ebp-344]
        lea     eax,[edx+4]
        mov     ebx,1
        add     ebx,[eax]
label0011:
        mov     esi,[ebp-340]
        lea     eax,[esi+4]
        mov     eax,[eax]
        cmp     eax,ebx
        jle     label0012
        lea     eax,[edx+4]
        mov     [ebp-732],eax
        mov     eax,ebx
        mov     edi,[ebp-732]
        sub     eax,[edi]
        mov     ecx,[esi]
        sub     ecx,[edx]
        imul    eax,ecx
        lea     ecx,[esi+4]
        lea     edi,[edx+4]
        mov     ecx,[ecx]
        sub     ecx,[edi]
        mov     [ebp-344],edx
        cdq
        idiv    ecx
        mov     edx,[ebp-344]
        add     eax,[edx]
        mov     edi,eax
        mov     ecx,[ebp-348]
        lea     eax,[ecx+4]
        mov     [ebp-736],eax
        mov     eax,ebx
        mov     [ebp-356],edi
        mov     edi,[ebp-736]
        sub     eax,[edi]
        mov     edi,[esi]
        sub     edi,[ecx]
        imul    eax,edi
        lea     edi,[esi+4]
        mov     [ebp-340],esi
        lea     esi,[ecx+4]
        mov     edi,[edi]
        sub     edi,[esi]
        mov     [ebp-344],edx
        cdq
        idiv    edi
        add     eax,[ecx]
        mov     edi,eax
        mov     edx,[ebp-344]
        lea     eax,[edx+4]
        mov     esi,ebx
        sub     esi,[eax]
        mov     [ebp-708],esi
        fild    dword ptr [ebp-708]
        mov     esi,[ebp-340]
        fld     dword ptr [esi+8]
        fsub    dword ptr [edx+8]
        fmulp
        lea     eax,[esi+4]
        mov     [ebp-360],edi
        lea     edi,[edx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [edx+8]
        fstp    dword ptr [ebp-368]
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        fld     dword ptr [esi+8]
        fsub    dword ptr [ecx+8]
        fmulp
        lea     eax,[esi+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [ecx+8]
        fstp    dword ptr [ebp-376]
        lea     eax,[edx+4]
        mov     edi,ebx
        sub     edi,[eax]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     edi,8
        add     edi,edx
        add     edi,4
        fld     dword ptr [eax]
        fsub    dword ptr [edi]
        fmulp
        lea     eax,[esi+4]
        lea     edi,[edx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,edx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-372]
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     edi,8
        add     edi,ecx
        add     edi,4
        fld     dword ptr [eax]
        fsub    dword ptr [edi]
        fmulp
        lea     eax,[esi+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,ecx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-380]
        mov     eax,[ebp-360]
        sub     eax,[ebp-356]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fld     dword ptr [ebp-376]
        fsub    dword ptr [ebp-368]
        fdivrp
        fstp    dword ptr [ebp-384]
        mov     eax,[ebp-360]
        sub     eax,[ebp-356]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fld     dword ptr [ebp-380]
        fsub    dword ptr [ebp-372]
        fdivrp
        fstp    dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
        fld     dword ptr [ebp-388]
        fstp    dword ptr [ebp-392]
        fld     dword ptr [ebp-384]
        fstp    dword ptr [ebp-396]
        fld     dword ptr [ebp-380]
        fstp    dword ptr [ebp-400]
        fld     dword ptr [ebp-376]
        fstp    dword ptr [ebp-404]
        fld     dword ptr [ebp-372]
        fstp    dword ptr [ebp-408]
        fld     dword ptr [ebp-368]
        fstp    dword ptr [ebp-412]
        mov     edi,ebx
        mov     eax,[ebp-360]
        mov     [ebp-340],esi
        mov     esi,[ebp-356]
        cmp     esi,eax
        jg      label0019
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    edi
        push    eax
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
        mov     ecx,[ebp-348]
        mov     edx,[ebp-344]
label0019:
        mov     [ebp-348],ecx
        mov     [ebp-344],edx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    edi
        push    esi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     ebx
        mov     edx,[ebp-344]
        jmp     label0011
label0012:
        mov     edi,[ebp-336]
label0027:
; end of inline function _rasterize_triangle_2i
        inc     edi
        mov     eax,[ebp-712]
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        add     esp,736
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
