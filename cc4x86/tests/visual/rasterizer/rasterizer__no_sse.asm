
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
        fld     dword ptr [ebp-36]
        fmul    dword ptr [ebp-44]
        fstp    dword ptr [ebp-52]
        fld     dword ptr [ebp-52]
        fmul    dword ptr [ebp-32]
        fstp    dword ptr [ebp-56]
        fld     dword ptr [ebp-44]
        fdiv    dword ptr [ebp-56]
        fstp    dword ptr [__mvproj_matrix]
        fldz
        fstp    dword ptr [__mvproj_matrix+4]
        fldz
        fstp    dword ptr [__mvproj_matrix+8]
        fldz
        fstp    dword ptr [__mvproj_matrix+12]
        fldz
        fstp    dword ptr [__mvproj_matrix+16]
        fld     dword ptr [ebp-44]
        fdiv    dword ptr [ebp-52]
        fstp    dword ptr [__mvproj_matrix+20]
        fldz
        fstp    dword ptr [__mvproj_matrix+24]
        fldz
        fstp    dword ptr [__mvproj_matrix+28]
        fldz
        fstp    dword ptr [__mvproj_matrix+32]
        fldz
        fstp    dword ptr [__mvproj_matrix+36]
        fld     dword ptr [ebp-40]
        fsub    dword ptr [ebp-44]
        fdivr   dword ptr [ebp-40]
        fstp    dword ptr [__mvproj_matrix+40]
        fld1
        fstp    dword ptr [__mvproj_matrix+44]
        fldz
        fstp    dword ptr [__mvproj_matrix+48]
        fldz
        fstp    dword ptr [__mvproj_matrix+52]
        fld     dword ptr [ebp-44]
        fmul    dword ptr [ebp-40]
        fld     dword ptr [ebp-44]
        fsub    dword ptr [ebp-40]
        fdivp
        fstp    dword ptr [__mvproj_matrix+56]
        fldz
        fstp    dword ptr [__mvproj_matrix+60]
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
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-72]
        fstp    dword ptr [__viewport_matrix]
        fldz
        fstp    dword ptr [__viewport_matrix+4]
        fldz
        fstp    dword ptr [__viewport_matrix+8]
        fldz
        fstp    dword ptr [__viewport_matrix+12]
        fldz
        fstp    dword ptr [__viewport_matrix+16]
        fld     dword ptr [ebp-68]
        fldz
        fsubrp
        fld     dword ptr [___unnamed_float_1]
        fdivp
        fstp    dword ptr [__viewport_matrix+20]
        fldz
        fstp    dword ptr [__viewport_matrix+24]
        fldz
        fstp    dword ptr [__viewport_matrix+28]
        fldz
        fstp    dword ptr [__viewport_matrix+32]
        fldz
        fstp    dword ptr [__viewport_matrix+36]
        fld     dword ptr [ebp-60]
        fsub    dword ptr [ebp-64]
        fstp    dword ptr [__viewport_matrix+40]
        fldz
        fstp    dword ptr [__viewport_matrix+44]
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-72]
        fstp    dword ptr [__viewport_matrix+48]
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp-68]
        fstp    dword ptr [__viewport_matrix+52]
        fld     dword ptr [ebp-64]
        fstp    dword ptr [__viewport_matrix+56]
        fld1
        fstp    dword ptr [__viewport_matrix+60]
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
        lea     edi,dword ptr [__clip_z_near_base]
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
        mov     edx,dword ptr [__pitch]
        imul    edx,edi
        add     edx,dword ptr [__videomem]
        mov     edi,ebx
        sal     edi,2
        add     edx,edi
        mov     edi,esi
        sal     edi,2
        add     edi,edx
        sal     ebx,2
        sub     edi,ebx
        mov     [ebp-4],edx
        mov     [ebp-8],edi
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
        mov     ecx,dword ptr [__texture_height]
        dec     ecx
        mov     [ebp-68],ecx
        fild    dword ptr [ebp-68]
        fmul    dword ptr [ebp-48]
        fistp   dword ptr [ebp-68]
        mov     ecx,[ebp-68]
        imul    ecx,dword ptr [__texture_width]
        add     ecx,eax
        sal     ecx,2
        add     ecx,dword ptr [__texture_data]
        mov     ecx,[ecx]
; end of inline function _tex2d
        mov     eax,ecx
        sar     eax,24
        and     eax,255
        mov     [ebp-40],eax
        cmp     dword ptr [ebp-40],0
        mov     [ebp-12],ecx
        je      label0003
        fild    dword ptr [ebp-40]
        fld     dword ptr [___unnamed_float_3]
        fdivp
        fstp    dword ptr [ebp-44]
        mov     edx,[ebp-4]
        mov     edi,[edx]
        mov     eax,edi
        and     eax,65280
        sar     eax,8
        mov     [ebp-32],eax
        mov     eax,edi
        and     eax,255
        mov     [ebp-36],eax
        mov     eax,[ebp-12]
        and     eax,65280
        sar     eax,8
        mov     [ebp-20],eax
        mov     eax,[ebp-12]
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
        mov     edi,[ebp-20]
        sal     edi,8
        add     edi,[ebp-24]
        mov     [edx],edi
label0003:
        fld     dword ptr [ebp+20]
        fadd    dword ptr [ebp+28]
        fstp    dword ptr [ebp+20]
        fld     dword ptr [ebp+24]
        fadd    dword ptr [ebp+32]
        fstp    dword ptr [ebp+24]
        mov     edx,[ebp-4]
        add     edx,4
        cmp     edx,[ebp-8]
        mov     [ebp-4],edx
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
        sub     esp,140
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
        mov     [ebp-4],ecx
        mov     [ebp-8],eax
label0001:
        mov     ebx,[ebp+12]
        mov     eax,[ebx+192]
        imul    eax,24
        mov     ecx,ebx
        add     ecx,eax
        cmp     ecx,[ebp-8]
        jle     label0002
; start of inline function vec4f_subtract
        mov     edi,[ebp+16]
        mov     esi,[ebp-4]
        lea     ebx,[ebp-24]
        fld     dword ptr [esi]
        fsub    dword ptr [edi]
        fstp    dword ptr [ebx]
        fld     dword ptr [esi+4]
        fsub    dword ptr [edi+4]
        fstp    dword ptr [ebx+4]
        fld     dword ptr [esi+8]
        fsub    dword ptr [edi+8]
        fstp    dword ptr [ebx+8]
        fld     dword ptr [esi+12]
        fsub    dword ptr [edi+12]
        fstp    dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp+20]
        lea     esi,[ebp-24]
        fld     dword ptr [esi+4]
        fmul    dword ptr [edi+4]
        fld     dword ptr [esi]
        fmul    dword ptr [edi]
        faddp
        fld     dword ptr [esi+8]
        fmul    dword ptr [edi+8]
        faddp
        fld     dword ptr [esi+12]
        fmul    dword ptr [edi+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
        fstp    dword ptr [ebp-52]
; start of inline function vec4f_subtract
        mov     edi,[ebp+16]
        mov     esi,[ebp-8]
        lea     ebx,[ebp-24]
        fld     dword ptr [esi]
        fsub    dword ptr [edi]
        fstp    dword ptr [ebx]
        fld     dword ptr [esi+4]
        fsub    dword ptr [edi+4]
        fstp    dword ptr [ebx+4]
        fld     dword ptr [esi+8]
        fsub    dword ptr [edi+8]
        fstp    dword ptr [ebx+8]
        fld     dword ptr [esi+12]
        fsub    dword ptr [edi+12]
        fstp    dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp+20]
        lea     ebx,[ebp-24]
        mov     esi,ebx
        fld     dword ptr [esi+4]
        fmul    dword ptr [edi+4]
        fld     dword ptr [esi]
        fmul    dword ptr [edi]
        faddp
        fld     dword ptr [esi+8]
        fmul    dword ptr [edi+8]
        faddp
        fld     dword ptr [esi+12]
        fmul    dword ptr [edi+12]
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
        mov     edx,[ebp+8]
        mov     eax,[edx+192]
        inc     dword ptr [edx+192]
        imul    eax,24
        mov     ecx,edx
        add     ecx,eax
        mov     [ebp-140],ecx
        mov     ecx,[ebp-4]
        mov     eax,[ecx]
        mov     ebx,[ecx+4]
        mov     [ebp-4],ecx
        mov     ecx,[ebp-140]
        mov     [ecx],eax
        mov     [ecx+4],ebx
        mov     [ebp-140],ecx
        mov     ecx,[ebp-4]
        mov     eax,[ecx+8]
        mov     ebx,[ecx+12]
        mov     [ebp-4],ecx
        mov     ecx,[ebp-140]
        mov     [ecx+8],eax
        mov     [ecx+12],ebx
        mov     [ebp-140],ecx
        mov     ecx,[ebp-4]
        mov     eax,[ecx+16]
        mov     ebx,[ecx+20]
        mov     [ebp-4],ecx
        mov     ecx,[ebp-140]
        mov     [ecx+16],eax
        mov     [ecx+20],ebx
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
        mov     edi,[ebp-4]
        mov     esi,[ebp+16]
        lea     eax,[ebp-24]
        mov     ebx,eax
        fld     dword ptr [esi]
        fsub    dword ptr [edi]
        fstp    dword ptr [ebx]
        fld     dword ptr [esi+4]
        fsub    dword ptr [edi+4]
        fstp    dword ptr [ebx+4]
        fld     dword ptr [esi+8]
        fsub    dword ptr [edi+8]
        fstp    dword ptr [ebx+8]
        fld     dword ptr [esi+12]
        fsub    dword ptr [edi+12]
        fstp    dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     edi,[ebp-4]
        mov     esi,[ebp-8]
        lea     eax,[ebp-40]
        mov     ebx,eax
        fld     dword ptr [esi]
        fsub    dword ptr [edi]
        fstp    dword ptr [ebx]
        fld     dword ptr [esi+4]
        fsub    dword ptr [edi+4]
        fstp    dword ptr [ebx+4]
        fld     dword ptr [esi+8]
        fsub    dword ptr [edi+8]
        fstp    dword ptr [ebx+8]
        fld     dword ptr [esi+12]
        fsub    dword ptr [edi+12]
        fstp    dword ptr [ebx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp+20]
        lea     eax,[ebp-24]
        mov     esi,eax
        fld     dword ptr [esi+4]
        fmul    dword ptr [edi+4]
        fld     dword ptr [esi]
        fmul    dword ptr [edi]
        faddp
        fld     dword ptr [esi+8]
        fmul    dword ptr [edi+8]
        faddp
        fld     dword ptr [esi+12]
        fmul    dword ptr [edi+12]
        faddp
        fstp    dword ptr [ebp-128]
; end of inline function vec4f_dot
        fld     dword ptr [ebp-128]
; start of inline function vec4f_dot
        mov     edi,[ebp+20]
        lea     eax,[ebp-40]
        mov     esi,eax
        fld     dword ptr [esi+4]
        fmul    dword ptr [edi+4]
        fld     dword ptr [esi]
        fmul    dword ptr [edi]
        faddp
        fld     dword ptr [esi+8]
        fmul    dword ptr [edi+8]
        faddp
        fld     dword ptr [esi+12]
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
        fld     dword ptr [ebp-40]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [ebp-40]
        fld     dword ptr [ebp-36]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [ebp-36]
        fld     dword ptr [ebp-32]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [ebp-32]
        fld     dword ptr [ebp-28]
        fmul    dword ptr [ebp-132]
        fstp    dword ptr [ebp-28]
; end of inline function vec4f_mul
; start of inline function vec4f_add
        mov     edi,[ebp-4]
        mov     edx,[ebp+8]
        mov     eax,[edx+192]
        imul    eax,24
        mov     esi,edx
        add     esi,eax
        fld     dword ptr [edi]
        fadd    dword ptr [ebp-40]
        fstp    dword ptr [esi]
        fld     dword ptr [edi+4]
        fadd    dword ptr [ebp-36]
        fstp    dword ptr [esi+4]
        fld     dword ptr [edi+8]
        fadd    dword ptr [ebp-32]
        fstp    dword ptr [esi+8]
        fld     dword ptr [edi+12]
        fadd    dword ptr [ebp-28]
        fstp    dword ptr [esi+12]
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     edi,[ebp-4]
        mov     esi,[ebp-8]
        fld     dword ptr [esi+16]
        fsub    dword ptr [edi+16]
        fstp    dword ptr [ebp-48]
        fld     dword ptr [esi+20]
        fsub    dword ptr [edi+20]
        fstp    dword ptr [ebp-44]
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        fld     dword ptr [ebp-60]
        fstp    dword ptr [ebp-88]
        fld     dword ptr [ebp-48]
        fmul    dword ptr [ebp-88]
        fstp    dword ptr [ebp-48]
        fld     dword ptr [ebp-44]
        fmul    dword ptr [ebp-88]
        fstp    dword ptr [ebp-44]
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     edi,[ebp-4]
        mov     eax,[edx+192]
        imul    eax,24
        mov     esi,edx
        add     esi,eax
        add     esi,16
        fld     dword ptr [edi+16]
        fadd    dword ptr [ebp-48]
        fstp    dword ptr [esi]
        fld     dword ptr [edi+20]
        fadd    dword ptr [ebp-44]
        fstp    dword ptr [esi+4]
; end of inline function vec2f_add
        inc     dword ptr [edx+192]
label0004:
        mov     ecx,[ebp-4]
        add     ecx,24
        mov     eax,[ebp-8]
        add     eax,24
        mov     [ebp-4],ecx
        mov     [ebp-8],eax
        jmp     label0001
label0002:
        mov     edx,[ebp+8]
        mov     eax,[edx+192]
        inc     dword ptr [edx+192]
        imul    eax,24
        mov     ecx,edx
        add     ecx,eax
        mov     eax,[edx]
        mov     ebx,[edx+4]
        mov     [ecx],eax
        mov     [ecx+4],ebx
        mov     eax,[edx+8]
        mov     ebx,[edx+12]
        mov     [ecx+8],eax
        mov     [ecx+12],ebx
        mov     eax,[edx+16]
        mov     ebx,[edx+20]
        mov     [ecx+16],eax
        mov     [ecx+20],ebx
        pop     ebx
        pop     esi
        pop     edi
        add     esp,140
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
        fld     dword ptr [ebp-32]
        fstp    dword ptr [ebp-16]
        fld     dword ptr [ebp-28]
        fstp    dword ptr [ebp-12]
        fld     dword ptr [ebp-24]
        fstp    dword ptr [ebp-8]
        fld     dword ptr [ebp-20]
        fstp    dword ptr [ebp-4]
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        fld     dword ptr [ebp-12]
        fmul    dword ptr [__mvproj_matrix+16]
        fld     dword ptr [ebp-16]
        fmul    dword ptr [__mvproj_matrix]
        faddp
        fld     dword ptr [ebp-8]
        fmul    dword ptr [__mvproj_matrix+32]
        faddp
        fld     dword ptr [ebp-4]
        fmul    dword ptr [__mvproj_matrix+48]
        faddp
        fstp    dword ptr [esi]
        fld     dword ptr [ebp-16]
        fmul    dword ptr [__mvproj_matrix+4]
        fld     dword ptr [ebp-12]
        fmul    dword ptr [__mvproj_matrix+20]
        faddp
        fld     dword ptr [ebp-8]
        fmul    dword ptr [__mvproj_matrix+36]
        faddp
        fld     dword ptr [ebp-4]
        fmul    dword ptr [__mvproj_matrix+52]
        faddp
        fstp    dword ptr [esi+4]
        fld     dword ptr [ebp-16]
        fmul    dword ptr [__mvproj_matrix+8]
        fld     dword ptr [ebp-12]
        fmul    dword ptr [__mvproj_matrix+24]
        faddp
        fld     dword ptr [ebp-8]
        fmul    dword ptr [__mvproj_matrix+40]
        faddp
        fld     dword ptr [ebp-4]
        fmul    dword ptr [__mvproj_matrix+56]
        faddp
        fstp    dword ptr [esi+8]
        fld     dword ptr [ebp-16]
        fmul    dword ptr [__mvproj_matrix+12]
        fld     dword ptr [ebp-12]
        fmul    dword ptr [__mvproj_matrix+28]
        faddp
        fld     dword ptr [ebp-8]
        fmul    dword ptr [__mvproj_matrix+44]
        faddp
        fld     dword ptr [ebp-4]
        fmul    dword ptr [__mvproj_matrix+60]
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
        sub     esp,716
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+28]
        mov     esi,[ebp+24]
        mov     ebx,[ebp+20]
        mov     edx,[ebp+16]
        mov     ecx,[ebp+12]
        mov     eax,[ebp+8]
        mov     [ebp+12],ecx
        mov     [ebp+16],edx
        push    eax
        lea     eax,[ebp-196]
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     edx,[ebp+16]
        mov     ecx,[ebp+12]
        lea     eax,[ebp-196]
        add     eax,16
        mov     [ebp+28],edi
        mov     edi,[ebx]
        mov     ebx,[ebx+4]
        mov     [eax],edi
        mov     [eax+4],ebx
        mov     [ebp+16],edx
        push    ecx
        lea     eax,[ebp-196]
        add     eax,24
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     edx,[ebp+16]
        lea     eax,[ebp-196]
        add     eax,24
        add     eax,16
        mov     ecx,[esi]
        mov     ebx,[esi+4]
        mov     [eax],ecx
        mov     [eax+4],ebx
        push    edx
        lea     eax,[ebp-196]
        add     eax,48
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        add     eax,48
        add     eax,16
        mov     edi,[ebp+28]
        mov     ecx,[edi]
        mov     edx,[edi+4]
        mov     [eax],ecx
        mov     [eax+4],edx
        lea     eax,[ebp-196]
        add     eax,72
        mov     ecx,[ebp-196]
        mov     edx,[ebp-192]
        mov     [eax],ecx
        mov     [eax+4],edx
        mov     ecx,[ebp-188]
        mov     edx,[ebp-184]
        mov     [eax+8],ecx
        mov     [eax+12],edx
        mov     ecx,[ebp-180]
        mov     edx,[ebp-176]
        mov     [eax+16],ecx
        mov     [eax+20],edx
        lea     eax,[ebp-196]
        add     eax,192
        mov     dword ptr [eax],4
; start of inline function _rasterize_polygon_4f
        lea     edi,[ebp-196]
; start of inline function _clip_poligon
        mov     esi,edi
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
        cmp     dword ptr [esi+192],1
        setg    al
        movzx   eax,al
; end of inline function _clip_poligon
        cmp     eax,0
        mov     [ebp-200],edi
        jne     label0000
        jmp     label0007
label0000:
        mov     edi,[ebp-200]
        cmp     dword ptr [edi+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     edi,0
        mov     [ebp-336],edi
label0003:
        mov     edi,[ebp-200]
        mov     eax,[edi+192]
        cmp     eax,[ebp-336]
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     edi,[ebp-200]
        mov     eax,[ebp-336]
        imul    eax,24
        add     edi,eax
        lea     eax,[ebp-332]
        mov     ecx,[ebp-336]
        sal     ecx,4
        add     eax,ecx
; start of inline function matrix4f_transform
        fld     dword ptr [edi+4]
        fmul    dword ptr [__viewport_matrix+16]
        fld     dword ptr [edi]
        fmul    dword ptr [__viewport_matrix]
        faddp
        fld     dword ptr [edi+8]
        fmul    dword ptr [__viewport_matrix+32]
        faddp
        fld     dword ptr [edi+12]
        fmul    dword ptr [__viewport_matrix+48]
        faddp
        fstp    dword ptr [ebp-688]
        fld     dword ptr [edi]
        fmul    dword ptr [__viewport_matrix+4]
        fld     dword ptr [edi+4]
        fmul    dword ptr [__viewport_matrix+20]
        faddp
        fld     dword ptr [edi+8]
        fmul    dword ptr [__viewport_matrix+36]
        faddp
        fld     dword ptr [edi+12]
        fmul    dword ptr [__viewport_matrix+52]
        faddp
        fstp    dword ptr [ebp-684]
        fld     dword ptr [edi]
        fmul    dword ptr [__viewport_matrix+8]
        fld     dword ptr [edi+4]
        fmul    dword ptr [__viewport_matrix+24]
        faddp
        fld     dword ptr [edi+8]
        fmul    dword ptr [__viewport_matrix+40]
        faddp
        fld     dword ptr [edi+12]
        fmul    dword ptr [__viewport_matrix+56]
        faddp
        fstp    dword ptr [ebp-680]
        fld     dword ptr [edi]
        fmul    dword ptr [__viewport_matrix+12]
        fld     dword ptr [edi+4]
        fmul    dword ptr [__viewport_matrix+28]
        faddp
        fld     dword ptr [edi+8]
        fmul    dword ptr [__viewport_matrix+44]
        faddp
        fld     dword ptr [edi+12]
        fmul    dword ptr [__viewport_matrix+60]
        faddp
        fstp    dword ptr [ebp-676]
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
        mov     [eax],ecx
        lea     ecx,[ebp-688]
        add     ecx,4
        fld     dword ptr [ecx]
        fmul    dword ptr [ebp-692]
        fistp   dword ptr [ebp-708]
        mov     ecx,[ebp-708]
        mov     [eax+4],ecx
        cmp     dword ptr [eax],0
        mov     [ebp-672],eax
        jl      label002a
        mov     edi,[ebp-672]
        mov     eax,[edi]
        cmp     eax,dword ptr [__width]
        jge     label002a
        mov     edi,[ebp-672]
        cmp     dword ptr [edi+4],0
        jl      label002a
        mov     edi,[ebp-672]
        mov     eax,[edi+4]
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
        jmp     label0003
label0004:
        mov     edi,2
        mov     [ebp-336],edi
label0006:
        mov     edi,[ebp-200]
        mov     eax,[edi+192]
        dec     eax
        cmp     eax,[ebp-336]
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     edi,[ebp-332]
        mov     eax,[ebp-336]
        sal     eax,4
        add     edi,eax
        mov     eax,[ebp-336]
        dec     eax
        sal     eax,4
        lea     esi,[ebp-332]
        add     esi,eax
        lea     eax,[ebp-332]
        mov     ecx,[eax+4]
        cmp     ecx,[esi+4]
        mov     [ebp-348],eax
        mov     [ebp-344],esi
        mov     [ebp-340],edi
        jle     label0008
        mov     edi,[ebp-348]
        mov     eax,[ebp-344]
        mov     esi,edi
        mov     [ebp-348],eax
        mov     [ebp-344],esi
label0008:
        mov     edi,[ebp-348]
        mov     eax,[edi+4]
        mov     edi,[ebp-340]
        cmp     eax,[edi+4]
        jle     label0009
        mov     edi,[ebp-348]
        mov     eax,[ebp-340]
        mov     [ebp-348],eax
        mov     [ebp-340],edi
label0009:
        mov     esi,[ebp-344]
        mov     eax,[esi+4]
        mov     edi,[ebp-340]
        cmp     eax,[edi+4]
        jle     label000a
        mov     edi,[ebp-344]
        mov     esi,[ebp-340]
        mov     [ebp-344],esi
        mov     [ebp-340],edi
label000a:
        mov     edi,[ebp-348]
        mov     eax,[edi+4]
        mov     edi,[ebp-340]
        cmp     eax,[edi+4]
        jne     label000b
        mov     edi,[ebp-348]
        cmp     dword ptr [edi+4],0
        jl      label000c
        mov     edi,[ebp-348]
        mov     eax,[edi+4]
        cmp     eax,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        fldz
        fstp    dword ptr [ebp-428]
        fldz
        fstp    dword ptr [ebp-432]
        mov     edi,[ebp-340]
        mov     esi,[ebp-344]
        mov     ebx,[ebp-348]
        mov     eax,[ebp-348]
        mov     edx,[eax+4]
        mov     [ebp-436],edi
        mov     edi,[ebp-340]
        mov     ecx,[edi]
        mov     [ebp-440],esi
        mov     esi,[ebp-344]
        mov     edi,[esi]
        mov     esi,[eax]
        cmp     esi,edi
        mov     [ebp-460],esi
        mov     [ebp-456],edi
        mov     [ebp-452],ecx
        mov     [ebp-448],edx
        mov     [ebp-444],ebx
        jge     label001c
        mov     ecx,[ebp-452]
        cmp     ecx,[ebp-456]
        jle     label001d
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        mov     edi,[ebp-444]
        push    dword ptr [edi+12]
        mov     edi,[ebp-444]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-448]
        push    dword ptr [ebp-452]
        push    dword ptr [ebp-460]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001d:
        mov     ecx,[ebp-452]
        cmp     ecx,[ebp-460]
        jge     label001f
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        mov     edi,[ebp-436]
        push    dword ptr [edi+12]
        mov     edi,[ebp-436]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-448]
        push    dword ptr [ebp-456]
        push    dword ptr [ebp-452]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        push    dword ptr [ebp-428]
        push    dword ptr [ebp-432]
        mov     edi,[ebp-444]
        push    dword ptr [edi+12]
        mov     edi,[ebp-444]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-448]
        push    dword ptr [ebp-456]
        push    dword ptr [ebp-460]
        call    __rasterize_horiz_line
        add     esp,28
label0020:
        jmp     label0025
label001c:
        mov     ecx,[ebp-452]
        cmp     ecx,[ebp-456]
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
        mov     edi,[ebp-436]
        push    dword ptr [edi+12]
        mov     edi,[ebp-436]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-448]
        push    dword ptr [ebp-460]
        push    dword ptr [ebp-452]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
label0022:
        mov     ecx,[ebp-452]
        cmp     ecx,[ebp-460]
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
        mov     edi,[ebp-440]
        push    dword ptr [edi+12]
        mov     edi,[ebp-440]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-448]
        push    dword ptr [ebp-452]
        push    dword ptr [ebp-456]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
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
        mov     edi,[ebp-440]
        push    dword ptr [edi+12]
        mov     edi,[ebp-440]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-448]
        push    dword ptr [ebp-460]
        push    dword ptr [ebp-456]
        call    __rasterize_horiz_line
        add     esp,28
label0025:
; end of inline function _rasterize_triangle_1i
label000c:
        jmp     label0012
label000b:
        mov     eax,[ebp-348]
        mov     edi,[eax+4]
        mov     [ebp-364],edi
label000e:
        mov     esi,[ebp-344]
        mov     eax,[esi+4]
        cmp     eax,[ebp-364]
        jle     label000f
        mov     eax,[ebp-364]
        mov     edi,[ebp-348]
        sub     eax,[edi+4]
        mov     esi,[ebp-344]
        mov     ecx,[esi]
        mov     [ebp-356],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax]
        mov     [ebp-348],eax
        mov     eax,[ebp-356]
        imul    eax,ecx
        mov     ecx,[esi+4]
        mov     [ebp-356],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-356]
        cdq
        idiv    ecx
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     [ebp-356],eax
        mov     eax,[ebp-364]
        mov     ecx,[ebp-348]
        sub     eax,[ecx+4]
        mov     edi,[ebp-340]
        mov     ecx,[edi]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax]
        mov     [ebp-348],eax
        mov     eax,[ebp-360]
        imul    eax,ecx
        mov     ecx,[edi+4]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-360]
        cdq
        idiv    ecx
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     ecx,[ebp-364]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fld     dword ptr [esi+8]
        fsub    dword ptr [eax+8]
        fmulp
        mov     ecx,[esi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-368]
        mov     ecx,[ebp-364]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fld     dword ptr [edi+8]
        fsub    dword ptr [eax+8]
        fmulp
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-376]
        mov     ecx,[ebp-364]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        mov     edx,8
        add     edx,eax
        add     edx,4
        fld     dword ptr [ecx]
        fsub    dword ptr [edx]
        fmulp
        mov     ecx,[esi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        fadd    dword ptr [ecx]
        fstp    dword ptr [ebp-372]
        mov     ecx,[ebp-364]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,eax
        add     edx,4
        fld     dword ptr [ecx]
        fsub    dword ptr [edx]
        fmulp
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        fadd    dword ptr [ecx]
        fstp    dword ptr [ebp-380]
        mov     ecx,[ebp-360]
        sub     ecx,[ebp-356]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fld     dword ptr [ebp-376]
        fsub    dword ptr [ebp-368]
        fdivrp
        fstp    dword ptr [ebp-384]
        mov     ecx,[ebp-360]
        sub     ecx,[ebp-356]
        mov     [ebp-708],ecx
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
        mov     edx,[ebp-364]
        mov     ecx,[ebp-360]
        mov     ebx,[ebp-356]
        cmp     ebx,ecx
        mov     [ebp-424],ebx
        mov     [ebp-420],ecx
        mov     [ebp-416],edx
        jg      label0013
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    dword ptr [ebp-416]
        push    dword ptr [ebp-420]
        push    dword ptr [ebp-424]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
label0013:
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    dword ptr [ebp-416]
        push    dword ptr [ebp-424]
        push    dword ptr [ebp-420]
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-364]
        jmp     label000e
label000f:
        mov     esi,[ebp-344]
        mov     eax,[esi+4]
        mov     edi,[ebp-348]
        sub     eax,[edi+4]
        mov     edi,[ebp-340]
        mov     ecx,[edi]
        mov     [ebp-712],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax]
        mov     [ebp-348],eax
        mov     eax,[ebp-712]
        imul    eax,ecx
        mov     ecx,[edi+4]
        mov     [ebp-712],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-712]
        cdq
        idiv    ecx
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     ecx,[esi+4]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fld     dword ptr [edi+8]
        fsub    dword ptr [eax+8]
        fmulp
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-376]
        mov     ecx,[esi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,eax
        add     edx,4
        fld     dword ptr [ecx]
        fsub    dword ptr [edx]
        fmulp
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        fadd    dword ptr [ecx]
        fstp    dword ptr [ebp-380]
        fld     dword ptr [ebp-376]
        fsub    dword ptr [esi+8]
        mov     ecx,[ebp-360]
        sub     ecx,[esi]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        fstp    dword ptr [ebp-384]
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        fld     dword ptr [ebp-380]
        fsub    dword ptr [ecx]
        mov     ecx,[ebp-360]
        sub     ecx,[esi]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        fstp    dword ptr [ebp-388]
; start of inline function _rasterize_horiz_line__unordered
        fld     dword ptr [ebp-388]
        fstp    dword ptr [ebp-392]
        fld     dword ptr [ebp-384]
        fstp    dword ptr [ebp-396]
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        fld     dword ptr [ecx]
        fstp    dword ptr [ebp-400]
        fld     dword ptr [esi+8]
        fstp    dword ptr [ebp-404]
        fld     dword ptr [ebp-380]
        fstp    dword ptr [ebp-408]
        fld     dword ptr [ebp-376]
        fstp    dword ptr [ebp-412]
        mov     ecx,[esi+4]
        mov     edx,ecx
        mov     ecx,[esi]
        mov     ebx,[ebp-360]
        cmp     ebx,ecx
        mov     [ebp-424],ebx
        mov     [ebp-420],ecx
        mov     [ebp-416],edx
        jg      label0016
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    dword ptr [ebp-416]
        push    dword ptr [ebp-420]
        push    dword ptr [ebp-424]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
label0016:
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    dword ptr [ebp-416]
        push    dword ptr [ebp-424]
        push    dword ptr [ebp-420]
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     eax,1
        mov     esi,[ebp-344]
        add     eax,[esi+4]
        mov     edi,eax
        mov     [ebp-364],edi
label0011:
        mov     edi,[ebp-340]
        mov     eax,[edi+4]
        cmp     eax,[ebp-364]
        jle     label0012
        mov     eax,[ebp-364]
        mov     esi,[ebp-344]
        sub     eax,[esi+4]
        mov     edi,[ebp-340]
        mov     ecx,[edi]
        sub     ecx,[esi]
        imul    eax,ecx
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        cdq
        idiv    ecx
        add     eax,[esi]
        mov     [ebp-356],eax
        mov     eax,[ebp-364]
        mov     edx,[ebp-348]
        sub     eax,[edx+4]
        mov     ecx,[edi]
        mov     [ebp-716],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax]
        mov     [ebp-348],eax
        mov     eax,[ebp-716]
        imul    eax,ecx
        mov     ecx,[edi+4]
        mov     [ebp-716],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-716]
        cdq
        idiv    ecx
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     ecx,[ebp-364]
        sub     ecx,[esi+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fld     dword ptr [edi+8]
        fsub    dword ptr [esi+8]
        fmulp
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [esi+8]
        fstp    dword ptr [ebp-368]
        mov     ecx,[ebp-364]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fld     dword ptr [edi+8]
        fsub    dword ptr [eax+8]
        fmulp
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-376]
        mov     ecx,[ebp-364]
        sub     ecx,[esi+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,esi
        add     edx,4
        fld     dword ptr [ecx]
        fsub    dword ptr [edx]
        fmulp
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        fadd    dword ptr [ecx]
        fstp    dword ptr [ebp-372]
        mov     ecx,[ebp-364]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,eax
        add     edx,4
        fld     dword ptr [ecx]
        fsub    dword ptr [edx]
        fmulp
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fdivp
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        fadd    dword ptr [ecx]
        fstp    dword ptr [ebp-380]
        mov     ecx,[ebp-360]
        sub     ecx,[ebp-356]
        mov     [ebp-708],ecx
        fild    dword ptr [ebp-708]
        fld     dword ptr [ebp-376]
        fsub    dword ptr [ebp-368]
        fdivrp
        fstp    dword ptr [ebp-384]
        mov     ecx,[ebp-360]
        sub     ecx,[ebp-356]
        mov     [ebp-708],ecx
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
        mov     edx,[ebp-364]
        mov     ecx,[ebp-360]
        mov     ebx,[ebp-356]
        cmp     ebx,ecx
        mov     [ebp-424],ebx
        mov     [ebp-420],ecx
        mov     [ebp-416],edx
        jg      label0019
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-408]
        push    dword ptr [ebp-412]
        push    dword ptr [ebp-416]
        push    dword ptr [ebp-420]
        push    dword ptr [ebp-424]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        push    dword ptr [ebp-392]
        push    dword ptr [ebp-396]
        push    dword ptr [ebp-400]
        push    dword ptr [ebp-404]
        push    dword ptr [ebp-416]
        push    dword ptr [ebp-424]
        push    dword ptr [ebp-420]
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-364]
        jmp     label0011
label0012:
; end of inline function _rasterize_triangle_2i
        inc     dword ptr [ebp-336]
        jmp     label0006
label0007:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        add     esp,716
        pop     ebp
        ret
_rasterizer_triangle3f endp     

end
