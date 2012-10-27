
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
        mov     esi,edi
        mov     dword ptr [__pitch],esi
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
        mov     esi,edi
        fld     dword ptr [ebp-44]
        fdiv    dword ptr [ebp-56]
        fstp    dword ptr [esi]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+12]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+16]
        mov     esi,edi
        fld     dword ptr [ebp-44]
        fdiv    dword ptr [ebp-52]
        fstp    dword ptr [esi+20]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+24]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+28]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+32]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+36]
        mov     esi,edi
        fld     dword ptr [ebp-40]
        fsub    dword ptr [ebp-44]
        fdivr   dword ptr [ebp-40]
        fstp    dword ptr [esi+40]
        mov     esi,edi
        fld1
        fstp    dword ptr [esi+44]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+48]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+52]
        mov     esi,edi
        fld     dword ptr [ebp-44]
        fmul    dword ptr [ebp-40]
        fld     dword ptr [ebp-44]
        fsub    dword ptr [ebp-40]
        fdivp
        fstp    dword ptr [esi+56]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+60]
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
        mov     esi,edi
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-72]
        fstp    dword ptr [esi]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+12]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+16]
        mov     esi,edi
        fld     dword ptr [ebp-68]
        fldz
        fsubrp
        fld     dword ptr [___unnamed_float_1]
        fdivp
        fstp    dword ptr [esi+20]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+24]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+28]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+32]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+36]
        mov     esi,edi
        fld     dword ptr [ebp-60]
        fsub    dword ptr [ebp-64]
        fstp    dword ptr [esi+40]
        mov     esi,edi
        fldz
        fstp    dword ptr [esi+44]
        mov     esi,edi
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-72]
        fstp    dword ptr [esi+48]
        mov     esi,edi
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-68]
        fstp    dword ptr [esi+52]
        mov     esi,edi
        fld     dword ptr [ebp-64]
        fstp    dword ptr [esi+56]
        mov     esi,edi
        fld1
        fstp    dword ptr [esi+60]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     esi,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [esi]
        mov     esi,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [esi+4]
        mov     esi,edi
        fld     dword ptr [ebp-16]
        fstp    dword ptr [esi+8]
        mov     esi,edi
        fld     dword ptr [ebp-12]
        fstp    dword ptr [esi+12]
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
        mov     edi,[ebp+8]
        mov     eax,[edi]
        mov     ecx,[edi+4]
        mov     dword ptr [__mvproj_matrix],eax
        mov     dword ptr [__mvproj_matrix+4],ecx
        mov     eax,[edi+8]
        mov     ecx,[edi+12]
        mov     dword ptr [__mvproj_matrix+8],eax
        mov     dword ptr [__mvproj_matrix+12],ecx
        mov     eax,[edi+16]
        mov     ecx,[edi+20]
        mov     dword ptr [__mvproj_matrix+16],eax
        mov     dword ptr [__mvproj_matrix+20],ecx
        mov     eax,[edi+24]
        mov     ecx,[edi+28]
        mov     dword ptr [__mvproj_matrix+24],eax
        mov     dword ptr [__mvproj_matrix+28],ecx
        mov     eax,[edi+32]
        mov     ecx,[edi+36]
        mov     dword ptr [__mvproj_matrix+32],eax
        mov     dword ptr [__mvproj_matrix+36],ecx
        mov     eax,[edi+40]
        mov     ecx,[edi+44]
        mov     dword ptr [__mvproj_matrix+40],eax
        mov     dword ptr [__mvproj_matrix+44],ecx
        mov     eax,[edi+48]
        mov     ecx,[edi+52]
        mov     dword ptr [__mvproj_matrix+48],eax
        mov     dword ptr [__mvproj_matrix+52],ecx
        mov     eax,[edi+56]
        mov     ecx,[edi+60]
        mov     dword ptr [__mvproj_matrix+56],eax
        mov     dword ptr [__mvproj_matrix+60],ecx
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
        mov     ebx,esi
        mov     dword ptr [__texture_width],ebx
        mov     ebx,edi
        mov     dword ptr [__texture_height],ebx
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
        mov     esi,eax
label0000:
; start of inline function _tex2d
        fld     dword ptr [ebp+24]
        fstp    dword ptr [ebp-48]
        fld     dword ptr [ebp+20]
        fstp    dword ptr [ebp-52]
        mov     eax,dword ptr [__texture_width]
        dec     eax
        mov     [ebp-68],eax
        fild    dword ptr [ebp-68]
        fmul    dword ptr [ebp-52]
        fistp   dword ptr [ebp-68]
        mov     eax,[ebp-68]
        mov     ebx,eax
        mov     eax,dword ptr [__texture_height]
        dec     eax
        mov     [ebp-68],eax
        fild    dword ptr [ebp-68]
        fmul    dword ptr [ebp-48]
        fistp   dword ptr [ebp-68]
        mov     eax,[ebp-68]
        imul    eax,dword ptr [__texture_width]
        add     eax,ebx
        sal     eax,2
        add     eax,dword ptr [__texture_data]
        mov     eax,[eax]
        mov     ebx,eax
; end of inline function _tex2d
        mov     eax,ebx
        mov     ebx,eax
        mov     eax,ebx
        sar     eax,24
        and     eax,255
        mov     [ebp-40],eax
        cmp     dword ptr [ebp-40],0
        je      label0003
        fild    dword ptr [ebp-40]
        fld     dword ptr [___unnamed_float_3]
        fdivp
        fstp    dword ptr [ebp-44]
        mov     eax,edi
        mov     eax,[eax]
        mov     ecx,eax
        and     ecx,65280
        sar     ecx,8
        mov     [ebp-32],ecx
        and     eax,255
        mov     [ebp-36],eax
        mov     eax,ebx
        and     eax,65280
        sar     eax,8
        mov     [ebp-20],eax
        mov     eax,ebx
        and     eax,255
        mov     [ebp-24],eax
        fild    dword ptr [ebp-20]
        fmul    dword ptr [ebp-44]
        fild    dword ptr [ebp-32]
        fld1
        fsub    dword ptr [ebp-44]
        fmulp
        faddp
        fistp   dword ptr [ebp-68]
        mov     eax,[ebp-68]
        mov     [ebp-20],eax
        fild    dword ptr [ebp-24]
        fmul    dword ptr [ebp-44]
        fild    dword ptr [ebp-36]
        fld1
        fsub    dword ptr [ebp-44]
        fmulp
        faddp
        fistp   dword ptr [ebp-68]
        mov     eax,[ebp-68]
        mov     [ebp-24],eax
        mov     eax,[ebp-20]
        sal     eax,8
        add     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,edi
        mov     ecx,ebx
        mov     [eax],ecx
label0003:
        fld     dword ptr [ebp+20]
        fadd    dword ptr [ebp+28]
        fstp    dword ptr [ebp+20]
        fld     dword ptr [ebp+24]
        fadd    dword ptr [ebp+32]
        fstp    dword ptr [ebp+24]
        add     edi,4
        mov     eax,edi
        cmp     eax,esi
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
        mov     edx,[ebp+8]
        mov     eax,edx
        mov     dword ptr [eax+192],0
        mov     eax,ebx
        lea     ecx,[ebx+24]
label0001:
        mov     [ebp+8],edx
        mov     edx,ebx
        mov     edx,[edx+192]
        imul    edx,24
        mov     [ebp+20],edi
        mov     edi,ebx
        add     edi,edx
        cmp     edi,ecx
        jle     label0002
; start of inline function vec4f_subtract
        mov     edx,esi
        mov     edi,edx
        mov     edx,eax
        mov     [ebp+12],ebx
        lea     ebx,[ebp-24]
        mov     [ebp-4],eax
        mov     eax,edx
        mov     [ebp-8],ecx
        mov     ecx,edi
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fsub    dword ptr [ecx+4]
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fsub    dword ptr [ecx+8]
        mov     eax,ebx
        fstp    dword ptr [eax+8]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fsub    dword ptr [ecx+12]
        mov     eax,ebx
        fstp    dword ptr [eax+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mov     edi,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+4]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ecx]
        faddp
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+8]
        faddp
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
        fstp    dword ptr [ebp-52]
; start of inline function vec4f_subtract
        mov     eax,esi
        mov     edi,eax
        mov     eax,[ebp-8]
        mov     edx,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fsub    dword ptr [ecx+4]
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fsub    dword ptr [ecx+8]
        mov     eax,ebx
        fstp    dword ptr [eax+8]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fsub    dword ptr [ecx+12]
        mov     eax,ebx
        fstp    dword ptr [eax+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mov     edi,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+4]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ecx]
        faddp
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+8]
        faddp
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+12]
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
        mov     eax,[ebp+8]
        mov     ecx,[eax+192]
        inc     dword ptr [eax+192]
        imul    ecx,24
        mov     eax,[ebp+8]
        add     eax,ecx
        mov     ecx,[ebp-4]
        mov     edx,[ecx]
        mov     ebx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ebx
        mov     edx,[ecx+8]
        mov     ebx,[ecx+12]
        mov     [eax+8],edx
        mov     [eax+12],ebx
        mov     edx,[ecx+16]
        mov     ebx,[ecx+20]
        mov     [eax+16],edx
        mov     [eax+20],ebx
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
        mov     eax,[ebp-4]
        mov     edi,eax
        mov     eax,esi
        mov     edx,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fsub    dword ptr [ecx+4]
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fsub    dword ptr [ecx+8]
        mov     eax,ebx
        fstp    dword ptr [eax+8]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fsub    dword ptr [ecx+12]
        mov     eax,ebx
        fstp    dword ptr [eax+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     eax,[ebp-4]
        mov     edi,eax
        mov     eax,[ebp-8]
        mov     edx,eax
        lea     eax,[ebp-40]
        mov     ebx,eax
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fsub    dword ptr [ecx+4]
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fsub    dword ptr [ecx+8]
        mov     eax,ebx
        fstp    dword ptr [eax+8]
        mov     eax,edx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fsub    dword ptr [ecx+12]
        mov     eax,ebx
        fstp    dword ptr [eax+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mov     edi,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+4]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ecx]
        faddp
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+8]
        faddp
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mov     edi,eax
        lea     eax,[ebp-40]
        mov     ebx,eax
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+4]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ecx]
        faddp
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+8]
        faddp
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
        fdivp
        fstp    dword ptr [ebp-60]
; start of inline function vec4f_mul
        fld     dword ptr [ebp-60]
        fstp    dword ptr [ebp-132]
        lea     eax,[ebp-40]
        mov     edi,eax
        mov     eax,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [eax]
        mov     eax,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [eax+4]
        mov     eax,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [eax+8]
        mov     eax,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [eax+12]
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     eax,[ebp-40]
        mov     edi,eax
        mov     eax,[ebp-4]
        mov     ebx,eax
        mov     eax,[ebp+8]
        mov     eax,[eax+192]
        imul    eax,24
        mov     ecx,[ebp+8]
        add     ecx,eax
        mov     edx,ecx
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax]
        fadd    dword ptr [ecx]
        mov     eax,edx
        fstp    dword ptr [eax]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fadd    dword ptr [ecx+4]
        mov     eax,edx
        fstp    dword ptr [eax+4]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fadd    dword ptr [ecx+8]
        mov     eax,edx
        fstp    dword ptr [eax+8]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fadd    dword ptr [ecx+12]
        mov     eax,edx
        fstp    dword ptr [eax+12]
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     eax,16
        add     eax,[ebp-4]
        mov     edi,eax
        mov     eax,16
        add     eax,[ebp-8]
        mov     ebx,eax
        lea     eax,[ebp-48]
        mov     edx,eax
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        mov     eax,edx
        fstp    dword ptr [eax]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fsub    dword ptr [ecx+4]
        mov     eax,edx
        fstp    dword ptr [eax+4]
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        fld     dword ptr [ebp-60]
        fstp    dword ptr [ebp-88]
        lea     eax,[ebp-48]
        mov     edi,eax
        mov     eax,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ebp-88]
        fstp    dword ptr [eax]
        mov     eax,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ebp-88]
        fstp    dword ptr [eax+4]
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     eax,[ebp-48]
        mov     edi,eax
        mov     eax,16
        add     eax,[ebp-4]
        mov     ebx,eax
        mov     eax,[ebp+8]
        mov     eax,[eax+192]
        imul    eax,24
        mov     ecx,[ebp+8]
        add     ecx,eax
        add     ecx,16
        mov     edx,ecx
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax]
        fadd    dword ptr [ecx]
        mov     eax,edx
        fstp    dword ptr [eax]
        mov     eax,ebx
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fadd    dword ptr [ecx+4]
        mov     eax,edx
        fstp    dword ptr [eax+4]
; end of inline function vec2f_add
        mov     eax,[ebp+8]
        inc     dword ptr [eax+192]
label0004:
        mov     eax,[ebp-4]
        add     eax,24
        mov     ecx,[ebp-8]
        add     ecx,24
        mov     edx,[ebp+8]
        mov     ebx,[ebp+12]
        mov     edi,[ebp+20]
        jmp     label0001
        mov     [ebp+8],edx
label0002:
        mov     eax,[ebp+8]
        mov     ecx,[eax+192]
        inc     dword ptr [eax+192]
        imul    ecx,24
        mov     eax,[ebp+8]
        add     eax,ecx
        mov     ecx,[ebp+8]
        mov     edx,[ecx]
        mov     ebx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ebx
        mov     edx,[ecx+8]
        mov     ebx,[ecx+12]
        mov     [eax+8],edx
        mov     [eax+12],ebx
        mov     edx,[ecx+16]
        mov     ebx,[ecx+20]
        mov     [eax+16],edx
        mov     [eax+20],ebx
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
        mov     eax,edi
        fld     dword ptr [eax+8]
        fstp    dword ptr [ebp-24]
        mov     eax,edi
        fld     dword ptr [eax+4]
        fstp    dword ptr [ebp-28]
        mov     eax,edi
        fld     dword ptr [eax]
        fstp    dword ptr [ebp-32]
        lea     eax,[ebp-16]
        mov     edi,eax
        mov     eax,edi
        fld     dword ptr [ebp-32]
        fstp    dword ptr [eax]
        mov     eax,edi
        fld     dword ptr [ebp-28]
        fstp    dword ptr [eax+4]
        mov     eax,edi
        fld     dword ptr [ebp-24]
        fstp    dword ptr [eax+8]
        mov     eax,edi
        fld     dword ptr [ebp-20]
        fstp    dword ptr [eax+12]
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        mov     edi,(offset __mvproj_matrix)
        lea     eax,[ebp-16]
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+4]
        fmul    dword ptr [edx+16]
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx]
        fmul    dword ptr [edx]
        faddp
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+8]
        fmul    dword ptr [edx+32]
        faddp
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+12]
        fmul    dword ptr [edx+48]
        faddp
        mov     ecx,esi
        fstp    dword ptr [ecx]
        mov     ecx,edi
        mov     edx,eax
        fld     dword ptr [edx]
        fmul    dword ptr [ecx+4]
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+4]
        fmul    dword ptr [edx+20]
        faddp
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+8]
        fmul    dword ptr [edx+36]
        faddp
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+12]
        fmul    dword ptr [edx+52]
        faddp
        mov     ecx,esi
        fstp    dword ptr [ecx+4]
        mov     ecx,edi
        mov     edx,eax
        fld     dword ptr [edx]
        fmul    dword ptr [ecx+8]
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+4]
        fmul    dword ptr [edx+24]
        faddp
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+8]
        fmul    dword ptr [edx+40]
        faddp
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+12]
        fmul    dword ptr [edx+56]
        faddp
        mov     ecx,esi
        fstp    dword ptr [ecx+8]
        mov     ecx,edi
        mov     edx,eax
        fld     dword ptr [edx]
        fmul    dword ptr [ecx+12]
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+4]
        fmul    dword ptr [edx+28]
        faddp
        mov     ecx,eax
        mov     edx,edi
        fld     dword ptr [ecx+8]
        fmul    dword ptr [edx+44]
        faddp
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+60]
        faddp
        mov     eax,esi
        fstp    dword ptr [eax+12]
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
        sub     esp,796
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
        mov     ecx,esi
        mov     ebx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],ebx
        mov     [eax+4],ecx
        push    dword ptr [ebp+16]
        lea     eax,[ebp-196]
        add     eax,48
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        add     eax,48
        add     eax,16
        mov     ecx,edi
        mov     ebx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],ebx
        mov     [eax+4],ecx
        lea     eax,[ebp-196]
        add     eax,72
        mov     ecx,[ebp-196]
        mov     ebx,[ebp-192]
        mov     [eax],ecx
        mov     [eax+4],ebx
        mov     ecx,[ebp-188]
        mov     ebx,[ebp-184]
        mov     [eax+8],ecx
        mov     [eax+12],ebx
        mov     ecx,[ebp-180]
        mov     ebx,[ebp-176]
        mov     [eax+16],ecx
        mov     [eax+20],ebx
        lea     eax,[ebp-196]
        add     eax,192
        mov     dword ptr [eax],4
; start of inline function _rasterize_polygon_4f
        lea     eax,[ebp-196]
        mov     edi,eax
; start of inline function _clip_poligon
        mov     eax,edi
        mov     esi,eax
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        push    esi
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_z_near_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_near_base]
        push    eax
        lea     eax,[ebp-660]
        push    eax
        push    esi
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        push    esi
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_right_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_right_base]
        push    eax
        lea     eax,[ebp-660]
        push    eax
        push    esi
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        push    esi
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_bottom_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_bottom_base]
        push    eax
        lea     eax,[ebp-660]
        push    eax
        push    esi
        call    __clip_on_plain
        add     esp,16
        mov     eax,esi
        cmp     dword ptr [eax+192],1
        setg    al
        movzx   eax,al
        mov     esi,eax
; end of inline function _clip_poligon
        mov     eax,esi
        cmp     eax,0
        jne     label0000
        jmp     label002d
label0000:
        mov     eax,edi
        cmp     dword ptr [eax+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     esi,0
label0003:
        mov     eax,edi
        mov     eax,[eax+192]
        cmp     eax,esi
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     eax,edi
        mov     ecx,esi
        imul    ecx,24
        add     eax,ecx
        mov     ebx,eax
        lea     eax,[ebp-332]
        mov     ecx,esi
        sal     ecx,4
        add     eax,ecx
        mov     ecx,eax
; start of inline function matrix4f_transform
        mov     eax,(offset __viewport_matrix)
        lea     edx,[ebp-688]
        mov     [ebp-200],edi
        mov     edi,ebx
        mov     [ebp-336],esi
        mov     esi,eax
        fld     dword ptr [edi+4]
        fmul    dword ptr [esi+16]
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi]
        fmul    dword ptr [edi]
        faddp
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+8]
        fmul    dword ptr [edi+32]
        faddp
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+12]
        fmul    dword ptr [edi+48]
        faddp
        mov     esi,edx
        fstp    dword ptr [esi]
        mov     esi,eax
        mov     edi,ebx
        fld     dword ptr [edi]
        fmul    dword ptr [esi+4]
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+4]
        fmul    dword ptr [edi+20]
        faddp
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+8]
        fmul    dword ptr [edi+36]
        faddp
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+12]
        fmul    dword ptr [edi+52]
        faddp
        mov     esi,edx
        fstp    dword ptr [esi+4]
        mov     esi,eax
        mov     edi,ebx
        fld     dword ptr [edi]
        fmul    dword ptr [esi+8]
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+4]
        fmul    dword ptr [edi+24]
        faddp
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+8]
        fmul    dword ptr [edi+40]
        faddp
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+12]
        fmul    dword ptr [edi+56]
        faddp
        mov     esi,edx
        fstp    dword ptr [esi+8]
        mov     esi,eax
        mov     edi,ebx
        fld     dword ptr [edi]
        fmul    dword ptr [esi+12]
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+4]
        fmul    dword ptr [edi+28]
        faddp
        mov     esi,ebx
        mov     edi,eax
        fld     dword ptr [esi+8]
        fmul    dword ptr [edi+44]
        faddp
        fld     dword ptr [ebx+12]
        fmul    dword ptr [eax+60]
        faddp
        mov     eax,edx
        fstp    dword ptr [eax+12]
; end of inline function matrix4f_transform
        lea     eax,[ebp-688]
        add     eax,12
        fld1
        fdiv    dword ptr [eax]
        fstp    dword ptr [ebp-692]
        fld     dword ptr [ebp-688]
        fmul    dword ptr [ebp-692]
        fistp   dword ptr [ebp-708]
        mov     eax,[ebp-708]
        mov     edx,ecx
        mov     [edx],eax
        lea     eax,[ebp-688]
        add     eax,4
        fld     dword ptr [eax]
        fmul    dword ptr [ebp-692]
        fistp   dword ptr [ebp-708]
        mov     eax,[ebp-708]
        mov     edx,ecx
        mov     [edx+4],eax
        mov     eax,ecx
        cmp     dword ptr [eax],0
        jl      label002a
        mov     eax,ecx
        mov     eax,[eax]
        cmp     eax,dword ptr [__width]
        jge     label002a
        mov     eax,ecx
        cmp     dword ptr [eax+4],0
        jl      label002a
        mov     eax,ecx
        mov     eax,[eax+4]
        cmp     eax,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     eax,[ebp-332]
        mov     ecx,[ebp-336]
        sal     ecx,4
        add     eax,ecx
        add     eax,8
        mov     ecx,[ebp-200]
        mov     edx,[ebp-336]
        imul    edx,24
        add     ecx,edx
        add     ecx,16
        mov     edx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ecx
        inc     dword ptr [ebp-336]
        mov     esi,[ebp-336]
        mov     edi,[ebp-200]
        jmp     label0003
label0004:
        mov     esi,2
label0006:
        mov     eax,edi
        mov     eax,[eax+192]
        dec     eax
        cmp     eax,esi
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     eax,[ebp-332]
        mov     ecx,esi
        sal     ecx,4
        add     eax,ecx
        mov     ebx,eax
        mov     eax,esi
        dec     eax
        sal     eax,4
        lea     ecx,[ebp-332]
        add     ecx,eax
        lea     eax,[ebp-332]
        lea     edx,[eax+4]
        mov     [ebp-200],edi
        lea     edi,[ecx+4]
        mov     edx,[edx]
        cmp     edx,[edi]
        jle     label0008
        mov     edi,eax
        mov     eax,ecx
        mov     ecx,edi
label0008:
        lea     edx,[eax+4]
        lea     edi,[ebx+4]
        mov     edx,[edx]
        cmp     edx,[edi]
        jle     label0009
        mov     edi,eax
        mov     eax,ebx
        mov     edx,edi
        mov     ebx,edx
label0009:
        lea     edx,[ecx+4]
        lea     edi,[ebx+4]
        mov     edx,[edx]
        cmp     edx,[edi]
        jle     label000a
        mov     edi,ecx
        mov     ecx,ebx
        mov     edx,edi
        mov     ebx,edx
label000a:
        lea     edx,[eax+4]
        lea     edi,[ebx+4]
        mov     edx,[edx]
        cmp     edx,[edi]
        jne     label000b
        lea     edx,[eax+4]
        cmp     dword ptr [edx],0
        jl      label000c
        lea     edx,[eax+4]
        mov     edx,[edx]
        cmp     edx,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        fldz
        fstp    dword ptr [ebp-428]
        fldz
        fstp    dword ptr [ebp-432]
        mov     edx,8
        add     edx,ebx
        mov     edi,edx
        mov     edx,8
        add     edx,ecx
        mov     [ebp-336],esi
        mov     esi,8
        add     esi,eax
        mov     [ebp-440],edx
        lea     edx,[eax+4]
        mov     edx,[edx]
        mov     ebx,[ebx]
        mov     ecx,[ecx]
        mov     eax,[eax]
        mov     [ebp-436],edi
        mov     edi,eax
        cmp     edi,ecx
        jge     label001c
        mov     edi,ebx
        cmp     edi,ecx
        jle     label001d
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        mov     ecx,esi
        push    dword ptr [ecx+4]
        mov     ecx,esi
        push    dword ptr [ecx]
        push    edx
        push    ebx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
        mov     ecx,[ebp-456]
label001d:
        mov     edi,ebx
        cmp     edi,eax
        jge     label001f
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        mov     eax,[ebp-436]
        push    dword ptr [eax+4]
        mov     eax,[ebp-436]
        push    dword ptr [eax]
        push    edx
        push    ecx
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
        mov     eax,[ebp-460]
label001f:
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        mov     ebx,esi
        push    dword ptr [ebx+4]
        mov     ebx,esi
        push    dword ptr [ebx]
        push    edx
        push    ecx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
        mov     ecx,[ebp-456]
label001c:
        mov     esi,ebx
        cmp     esi,ecx
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
        mov     ecx,[ebp-436]
        push    dword ptr [ecx+4]
        mov     ecx,[ebp-436]
        push    dword ptr [ecx]
        push    edx
        push    eax
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
        mov     ecx,[ebp-456]
label0022:
        mov     esi,ebx
        cmp     esi,eax
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
        mov     eax,[ebp-440]
        push    dword ptr [eax+4]
        mov     eax,[ebp-440]
        push    dword ptr [eax]
        push    edx
        push    ebx
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
        mov     eax,[ebp-460]
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
        mov     ebx,[ebp-440]
        push    dword ptr [ebx+4]
        mov     ebx,[ebp-440]
        push    dword ptr [ebx]
        push    edx
        push    eax
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
        mov     esi,[ebp-336]
label000c:
        jmp     label0027
label000b:
        lea     edx,[eax+4]
        mov     edx,[edx]
        mov     edi,edx
label000e:
        lea     edx,[ecx+4]
        mov     edx,[edx]
        cmp     edx,edi
        jle     label000f
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,edi
        sub     eax,[edx]
        mov     edx,ecx
        mov     [ebp-336],esi
        mov     esi,[ebp-348]
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        lea     edx,[ecx+4]
        mov     [ebp-712],eax
        mov     eax,[ebp-348]
        lea     esi,[eax+4]
        mov     edx,[edx]
        sub     edx,[esi]
        mov     [ebp-716],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-712]
        cdq
        idiv    dword ptr [ebp-716]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     esi,eax
        mov     edx,[ebp-348]
        lea     eax,[edx+4]
        mov     [ebp-720],eax
        mov     eax,edi
        mov     edx,[ebp-720]
        sub     eax,[edx]
        mov     edx,ebx
        mov     [ebp-356],esi
        mov     esi,[ebp-348]
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        lea     edx,[ebx+4]
        mov     [ebp-724],eax
        mov     eax,[ebp-348]
        lea     esi,[eax+4]
        mov     edx,[edx]
        sub     edx,[esi]
        mov     [ebp-728],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-724]
        cdq
        idiv    dword ptr [ebp-728]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     esi,eax
        mov     edx,[ebp-348]
        lea     eax,[edx+4]
        mov     edx,edi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     eax,ecx
        mov     edx,[ebp-348]
        fld     dword ptr [eax+8]
        fsub    dword ptr [edx+8]
        fmulp
        lea     eax,[ecx+4]
        mov     [ebp-732],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-360],esi
        mov     [ebp-348],eax
        mov     eax,[ebp-732]
        mov     esi,[eax]
        sub     esi,[edx]
        mov     [ebp-708],esi
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,[ebp-348]
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-368]
        mov     esi,[ebp-348]
        lea     eax,[esi+4]
        mov     edx,edi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     eax,ebx
        mov     edx,[ebp-348]
        fld     dword ptr [eax+8]
        fsub    dword ptr [edx+8]
        fmulp
        lea     eax,[ebx+4]
        mov     [ebp-736],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-736]
        mov     esi,[eax]
        sub     esi,[edx]
        mov     [ebp-708],esi
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,[ebp-348]
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-376]
        mov     esi,[ebp-348]
        lea     eax,[esi+4]
        mov     edx,edi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,ecx
        add     eax,4
        mov     edx,8
        add     edx,[ebp-348]
        add     edx,4
        fld     dword ptr [eax]
        fsub    dword ptr [edx]
        fmulp
        lea     eax,[ecx+4]
        mov     [ebp-740],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-740]
        mov     esi,[eax]
        sub     esi,[edx]
        mov     [ebp-708],esi
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,[ebp-348]
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-372]
        mov     esi,[ebp-348]
        lea     eax,[esi+4]
        mov     edx,edi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,ebx
        add     eax,4
        mov     edx,8
        add     edx,[ebp-348]
        add     edx,4
        fld     dword ptr [eax]
        fsub    dword ptr [edx]
        fmulp
        lea     eax,[ebx+4]
        mov     [ebp-744],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-744]
        mov     esi,[eax]
        sub     esi,[edx]
        mov     [ebp-708],esi
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,[ebp-348]
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
        mov     eax,edi
        mov     esi,eax
        mov     eax,[ebp-360]
        mov     edx,eax
        mov     eax,[ebp-356]
        mov     [ebp-340],ebx
        mov     ebx,eax
        cmp     ebx,edx
        jg      label0013
        mov     [ebp-344],ecx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    esi
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
        mov     ecx,[ebp-344]
label0013:
        mov     [ebp-344],ecx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    esi
        push    eax
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     edi
        mov     eax,[ebp-348]
        mov     ecx,[ebp-344]
        mov     ebx,[ebp-340]
        mov     esi,[ebp-336]
        jmp     label000e
label000f:
        lea     edx,[ecx+4]
        lea     edi,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[edx]
        sub     eax,[edi]
        mov     edx,ebx
        mov     edi,[ebp-348]
        mov     edx,[edx]
        sub     edx,[edi]
        imul    eax,edx
        lea     edx,[ebx+4]
        mov     [ebp-748],eax
        mov     eax,[ebp-348]
        lea     edi,[eax+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-752],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-748]
        cdq
        idiv    dword ptr [ebp-752]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     [ebp-336],esi
        mov     esi,eax
        lea     eax,[ecx+4]
        mov     [ebp-756],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-756]
        mov     edi,[eax]
        sub     edi,[edx]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        mov     eax,ebx
        mov     edx,[ebp-348]
        fld     dword ptr [eax+8]
        fsub    dword ptr [edx+8]
        fmulp
        lea     eax,[ebx+4]
        mov     [ebp-760],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-760]
        mov     edi,[eax]
        sub     edi,[edx]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,[ebp-348]
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-376]
        lea     eax,[ecx+4]
        mov     [ebp-764],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-764]
        mov     edi,[eax]
        sub     edi,[edx]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,ebx
        add     eax,4
        mov     edx,8
        add     edx,[ebp-348]
        add     edx,4
        fld     dword ptr [eax]
        fsub    dword ptr [edx]
        fmulp
        lea     eax,[ebx+4]
        mov     [ebp-768],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-768]
        mov     edi,[eax]
        sub     edi,[edx]
        mov     [ebp-708],edi
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,[ebp-348]
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-380]
        mov     eax,ecx
        fld     dword ptr [ebp-376]
        fsub    dword ptr [eax+8]
        mov     eax,ecx
        mov     edx,esi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        fdivp
        fstp    dword ptr [ebp-384]
        mov     eax,8
        add     eax,ecx
        add     eax,4
        fld     dword ptr [ebp-380]
        fsub    dword ptr [eax]
        mov     eax,ecx
        mov     edx,esi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        fdivp
        fstp    dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
        fld     dword ptr [ebp-388]
        fstp    dword ptr [ebp-392]
        fld     dword ptr [ebp-384]
        fstp    dword ptr [ebp-396]
        mov     eax,8
        add     eax,ecx
        add     eax,4
        fld     dword ptr [eax]
        fstp    dword ptr [ebp-400]
        mov     eax,ecx
        fld     dword ptr [eax+8]
        fstp    dword ptr [ebp-404]
        fld     dword ptr [ebp-380]
        fstp    dword ptr [ebp-408]
        fld     dword ptr [ebp-376]
        fstp    dword ptr [ebp-412]
        lea     eax,[ecx+4]
        mov     eax,[eax]
        mov     [ebp-360],esi
        mov     esi,eax
        mov     eax,ecx
        mov     eax,[eax]
        mov     edx,eax
        mov     eax,[ebp-360]
        mov     edi,eax
        cmp     edi,edx
        jg      label0016
        mov     [ebp-344],ecx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    esi
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
        mov     ecx,[ebp-344]
label0016:
        mov     [ebp-344],ecx
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    esi
        push    eax
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     ecx,[ebp-344]
        lea     eax,[ecx+4]
        mov     edx,1
        add     edx,[eax]
        mov     edi,edx
label0011:
        lea     eax,[ebx+4]
        mov     eax,[eax]
        cmp     eax,edi
        jle     label0012
        lea     eax,[ecx+4]
        mov     [ebp-772],eax
        mov     eax,edi
        mov     edx,[ebp-772]
        sub     eax,[edx]
        mov     esi,ebx
        mov     edx,ecx
        mov     esi,[esi]
        sub     esi,[edx]
        imul    eax,esi
        lea     edx,[ebx+4]
        lea     esi,[ecx+4]
        mov     edx,[edx]
        sub     edx,[esi]
        mov     [ebp-776],edx
        cdq
        idiv    dword ptr [ebp-776]
        mov     edx,ecx
        add     eax,[edx]
        mov     esi,eax
        mov     edx,[ebp-348]
        lea     eax,[edx+4]
        mov     [ebp-780],eax
        mov     eax,edi
        mov     edx,[ebp-780]
        sub     eax,[edx]
        mov     edx,ebx
        mov     [ebp-356],esi
        mov     esi,[ebp-348]
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        lea     edx,[ebx+4]
        mov     [ebp-784],eax
        mov     eax,[ebp-348]
        lea     esi,[eax+4]
        mov     edx,[edx]
        sub     edx,[esi]
        mov     [ebp-788],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-784]
        cdq
        idiv    dword ptr [ebp-788]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     esi,eax
        lea     eax,[ecx+4]
        mov     edx,edi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     eax,ebx
        mov     edx,ecx
        fld     dword ptr [eax+8]
        fsub    dword ptr [edx+8]
        fmulp
        lea     eax,[ebx+4]
        lea     edx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edx]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,ecx
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-368]
        mov     edx,[ebp-348]
        lea     eax,[edx+4]
        mov     edx,edi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     eax,ebx
        mov     edx,[ebp-348]
        fld     dword ptr [eax+8]
        fsub    dword ptr [edx+8]
        fmulp
        lea     eax,[ebx+4]
        mov     [ebp-792],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-360],esi
        mov     [ebp-348],eax
        mov     eax,[ebp-792]
        mov     esi,[eax]
        sub     esi,[edx]
        mov     [ebp-708],esi
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,[ebp-348]
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-376]
        lea     eax,[ecx+4]
        mov     edx,edi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,ebx
        add     eax,4
        mov     edx,8
        add     edx,ecx
        add     edx,4
        fld     dword ptr [eax]
        fsub    dword ptr [edx]
        fmulp
        lea     eax,[ebx+4]
        lea     edx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edx]
        mov     [ebp-708],eax
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,ecx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-372]
        mov     esi,[ebp-348]
        lea     eax,[esi+4]
        mov     edx,edi
        sub     edx,[eax]
        mov     [ebp-708],edx
        fild    dword ptr [ebp-708]
        mov     eax,8
        add     eax,ebx
        add     eax,4
        mov     edx,8
        add     edx,[ebp-348]
        add     edx,4
        fld     dword ptr [eax]
        fsub    dword ptr [edx]
        fmulp
        lea     eax,[ebx+4]
        mov     [ebp-796],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-796]
        mov     esi,[eax]
        sub     esi,[edx]
        mov     [ebp-708],esi
        fild    dword ptr [ebp-708]
        fdivp
        mov     eax,8
        add     eax,[ebp-348]
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
        mov     eax,edi
        mov     esi,eax
        mov     eax,[ebp-360]
        mov     edx,eax
        mov     eax,[ebp-356]
        mov     [ebp-344],ecx
        mov     ecx,eax
        cmp     ecx,edx
        jg      label0019
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    esi
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    esi
        push    eax
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     edi
        mov     ecx,[ebp-344]
        jmp     label0011
label0012:
        mov     esi,[ebp-336]
label0027:
; end of inline function _rasterize_triangle_2i
        inc     esi
        mov     edi,[ebp-200]
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        add     esp,796
        pop     ebp
        ret
_rasterizer_triangle3f endp     

end
