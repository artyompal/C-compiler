
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
        mov     eax,esi
        mov     ecx,edi
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [edi+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [edi+48]
        addss   xmm1,xmm0
        mov     eax,ebx
        movss   dword ptr [eax],xmm1
        mov     eax,esi
        movss   xmm0,dword ptr [eax]
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
        mov     eax,esi
        movss   xmm0,dword ptr [eax]
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
        mov     eax,esi
        movss   xmm0,dword ptr [eax]
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
        sub     esp,76
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
        mov     eax,ebx
        mov     dword ptr [__width],eax
        mov     eax,esi
        mov     dword ptr [__height],eax
        mov     dword ptr [__pitch],edi
; start of inline function matrix4f_make_perspective
        cvtsi2ss        xmm0,ebx
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        movss   xmm1,xmm6
        movss   xmm2,xmm5
        mov     edi,(offset __mvproj_matrix)
        mulss   xmm7,xmm2
        movss   xmm3,xmm7
        mulss   xmm3,xmm0
        mov     eax,edi
        movss   xmm0,xmm2
        divss   xmm0,xmm3
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+16],xmm0
        movss   xmm0,xmm2
        divss   xmm0,xmm7
        movss   dword ptr [edi+20],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+24],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+28],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+32],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+36],xmm0
        movss   xmm0,xmm1
        subss   xmm0,xmm2
        movss   xmm3,xmm1
        divss   xmm3,xmm0
        movss   dword ptr [edi+40],xmm3
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+44],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+48],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+52],xmm0
        movss   xmm0,xmm2
        mulss   xmm0,xmm1
        subss   xmm2,xmm1
        divss   xmm0,xmm2
        movss   dword ptr [edi+56],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+60],xmm0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   xmm0,xmm6
        movss   xmm1,xmm5
        cvtsi2ss        xmm2,esi
        cvtsi2ss        xmm3,ebx
        mov     edi,(offset __viewport_matrix)
        mov     eax,edi
        movss   xmm4,xmm3
        mulss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax],xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+12],xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+16],xmm4
        movss   xmm4,xmm2
        xorps   xmm4,dword ptr [___unnamed_float_4]
        mulss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+20],xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+24],xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+28],xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+32],xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+36],xmm4
        subss   xmm0,xmm1
        movss   dword ptr [edi+40],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+44],xmm0
        mulss   xmm3,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+48],xmm3
        mulss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+52],xmm2
        movss   dword ptr [edi+56],xmm1
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+60],xmm0
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   xmm0,xmm5
        mov     edi,(offset __clip_z_near_base)
        mov     eax,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm1
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm1
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
        movss   xmm0,xmm6
        comiss  xmm0,xmm5
        jbe     label0000
        movss   xmm7,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   xmm7,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
        movss   xmm0,xmm7
        mov     edi,(offset __clip_z_near_norm)
        mov     eax,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm1
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm1
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm0,xmm6
        mov     edi,(offset __clip_z_far_base)
        mov     eax,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm1
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm1
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
        comiss  xmm6,xmm5
        jbe     label0002
        movss   xmm7,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   xmm7,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
        movss   xmm0,xmm7
        mov     edi,(offset __clip_z_far_norm)
        mov     eax,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm1
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm1
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        mov     edi,(offset __clip_plane_left_base)
        mov     eax,edi
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     edi,(offset __clip_plane_left_norm)
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        mov     edi,(offset __clip_plane_right_base)
        mov     eax,edi
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     edi,(offset __clip_plane_right_norm)
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,esi
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        mov     edi,(offset __clip_plane_top_base)
        mov     eax,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm1
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     edi,(offset __clip_plane_top_norm)
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     edi,(offset __clip_plane_bottom_base)
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     edi,(offset __clip_plane_bottom_norm)
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+12],xmm0
; end of inline function vec4f_assign
        pop     ebx
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
        sub     esp,4
        push    edi
        push    esi
        mov     edi,[ebp+8]
        mov     [ebp-4],edi
        mov     edi,(offset __mvproj_matrix)
        mov     esi,[ebp-4]
        mov     ecx,16
        rep     movsd
        pop     esi
        pop     edi
        add     esp,4
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
        sub     esp,64
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
        mov     ecx,ebx
        sal     ecx,2
        add     eax,ecx
        sal     esi,2
        add     esi,eax
        sal     ebx,2
        sub     esi,ebx
label0000:
; start of inline function _tex2d
        movss   xmm0,xmm5
        movss   xmm1,xmm4
        mov     ecx,dword ptr [__texture_width]
        dec     ecx
        cvtsi2ss        xmm2,ecx
        mulss   xmm2,xmm1
        cvttss2si       ecx,xmm2
        mov     edx,dword ptr [__texture_height]
        dec     edx
        cvtsi2ss        xmm1,edx
        mulss   xmm1,xmm0
        cvttss2si       edx,xmm1
        imul    edx,dword ptr [__texture_width]
        add     edx,ecx
        sal     edx,2
        add     edx,dword ptr [__texture_data]
        mov     edx,[edx]
; end of inline function _tex2d
        mov     ecx,edx
        sar     ecx,24
        and     ecx,255
        cmp     ecx,0
        je      label0003
        cvtsi2ss        xmm0,ecx
        mulss   xmm0,dword ptr [___unnamed_float_6]
        mov     ecx,eax
        mov     ecx,[ecx]
        mov     ebx,ecx
        and     ebx,65280
        sar     ebx,8
        and     ecx,255
        mov     edi,edx
        and     edi,65280
        sar     edi,8
        and     edx,255
        cvtsi2ss        xmm1,edi
        mulss   xmm1,xmm0
        cvtsi2ss        xmm2,ebx
        movss   xmm3,dword ptr [___unnamed_float_1]
        subss   xmm3,xmm0
        mulss   xmm2,xmm3
        addss   xmm1,xmm2
        cvttss2si       ebx,xmm1
        cvtsi2ss        xmm1,edx
        mulss   xmm1,xmm0
        cvtsi2ss        xmm2,ecx
        movss   xmm3,dword ptr [___unnamed_float_1]
        subss   xmm3,xmm0
        mulss   xmm2,xmm3
        addss   xmm1,xmm2
        cvttss2si       ecx,xmm1
        sal     ebx,8
        add     ebx,ecx
        mov     ecx,eax
        mov     [ecx],ebx
label0003:
        addss   xmm4,xmm6
        addss   xmm5,xmm7
        add     eax,4
        mov     ecx,eax
        cmp     ecx,esi
        jl      label0000
        pop     ebx
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
__rasterize_horiz_line endp

__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,176
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+20]
        mov     esi,[ebp+16]
        mov     ebx,[ebp+12]
        mov     edx,[ebp+8]
        mov     dword ptr [edx+192],0
        mov     eax,ebx
        mov     ecx,ebx
        add     ecx,24
label0001:
        mov     [ebp-140],edx
        mov     edx,[ebx+192]
        imul    edx,24
        mov     [ebp-144],edi
        mov     edi,ebx
        add     edi,edx
        cmp     edi,ecx
        jle     label0002
; start of inline function vec4f_subtract
        mov     edx,esi
        mov     edi,eax
        mov     [ebp-148],ebx
        lea     ebx,[ebp-24]
        mov     [ebp-152],eax
        mov     eax,edi
        mov     [ebp-156],ecx
        mov     ecx,edx
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [edi+4]
        subss   xmm0,dword ptr [edx+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edi+8]
        subss   xmm0,dword ptr [edx+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edi+12]
        subss   xmm0,dword ptr [edx+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp-144]
        lea     ecx,[ebp-24]
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,dword ptr [eax+4]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm1,dword ptr [edx]
        mulss   xmm1,dword ptr [ebx]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        mov     eax,esi
        mov     ecx,[ebp-156]
        lea     edx,[ebp-24]
        mov     ebx,ecx
        mov     edi,eax
        movss   xmm0,dword ptr [ebx]
        subss   xmm0,dword ptr [edi]
        mov     ebx,edx
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [ecx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [edx+4],xmm0
        movss   xmm0,dword ptr [ecx+8]
        subss   xmm0,dword ptr [eax+8]
        movss   dword ptr [edx+8],xmm0
        movss   xmm0,dword ptr [ecx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp-144]
        lea     ecx,[ebp-24]
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,dword ptr [eax+4]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm2,dword ptr [edx]
        mulss   xmm2,dword ptr [ebx]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm2,xmm0
        movss   dword ptr [ebp-168],xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-168]
        ja      label0003
        mov     edx,[ebp-140]
        mov     eax,[edx+192]
        inc     dword ptr [edx+192]
        imul    eax,24
        mov     ecx,edx
        add     ecx,eax
        mov     eax,[ebp-152]
        mov     edi,ecx
        mov     [ebp-160],esi
        mov     esi,eax
        mov     ecx,6
        rep     movsd
        mov     [ebp-164],ecx
        mov     [ebp-140],edx
        mov     esi,[ebp-160]
label0003:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-168]
        jae     label0006
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm1
        ja      label0005
label0006:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm1
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-168]
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        mov     eax,[ebp-152]
        mov     ecx,esi
        lea     edx,[ebp-24]
        mov     ebx,ecx
        mov     edi,eax
        movss   xmm1,dword ptr [ebx]
        subss   xmm1,dword ptr [edi]
        mov     ebx,edx
        movss   dword ptr [ebx],xmm1
        movss   xmm0,dword ptr [ecx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [edx+4],xmm0
        movss   xmm0,dword ptr [ecx+8]
        subss   xmm0,dword ptr [eax+8]
        movss   dword ptr [edx+8],xmm0
        movss   xmm0,dword ptr [ecx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     eax,[ebp-152]
        mov     ecx,[ebp-156]
        lea     edx,[ebp-40]
        mov     ebx,ecx
        mov     edi,eax
        movss   xmm0,dword ptr [ebx]
        subss   xmm0,dword ptr [edi]
        mov     ebx,edx
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [ecx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [edx+4],xmm0
        movss   xmm0,dword ptr [ecx+8]
        subss   xmm0,dword ptr [eax+8]
        movss   dword ptr [edx+8],xmm0
        movss   xmm0,dword ptr [ecx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp-144]
        lea     ecx,[ebp-24]
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,dword ptr [eax+4]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm1,dword ptr [edx]
        mulss   xmm1,dword ptr [ebx]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_dot
        mov     eax,[ebp-144]
        lea     ecx,[ebp-40]
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,dword ptr [eax+4]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm2,dword ptr [edx]
        mulss   xmm2,dword ptr [ebx]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm2,xmm0
        movss   dword ptr [ebp-172],xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        movss   dword ptr [ebp-176],xmm1
        movss   xmm1,dword ptr [ebp-172]
        divss   xmm1,dword ptr [ebp-176]
; start of inline function vec4f_mul
        movss   xmm0,xmm1
        lea     eax,[ebp-40]
        mov     ecx,eax
        movss   xmm2,dword ptr [ecx]
        mulss   xmm2,xmm0
        movss   dword ptr [ecx],xmm2
        movss   xmm2,dword ptr [eax+4]
        mulss   xmm2,xmm0
        movss   dword ptr [eax+4],xmm2
        movss   xmm2,dword ptr [eax+8]
        mulss   xmm2,xmm0
        movss   dword ptr [eax+8],xmm2
        movss   xmm2,dword ptr [eax+12]
        mulss   xmm2,xmm0
        movss   dword ptr [eax+12],xmm2
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     eax,[ebp-40]
        mov     ecx,[ebp-152]
        mov     edi,[ebp-140]
        mov     edx,[edi+192]
        imul    edx,24
        mov     ebx,[ebp-140]
        add     ebx,edx
        mov     edx,ecx
        mov     edi,eax
        movss   xmm0,dword ptr [edx]
        addss   xmm0,dword ptr [edi]
        mov     edx,ebx
        movss   dword ptr [edx],xmm0
        movss   xmm0,dword ptr [ecx+4]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [ecx+8]
        addss   xmm0,dword ptr [eax+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [ecx+12]
        addss   xmm0,dword ptr [eax+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     eax,16
        add     eax,[ebp-152]
        mov     ecx,16
        add     ecx,[ebp-156]
        lea     edx,[ebp-48]
        mov     ebx,ecx
        mov     edi,eax
        movss   xmm0,dword ptr [ebx]
        subss   xmm0,dword ptr [edi]
        mov     ebx,edx
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [ecx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [edx+4],xmm0
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        lea     eax,[ebp-48]
        mov     ecx,eax
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,xmm1
        movss   dword ptr [ecx],xmm0
        movss   xmm0,dword ptr [eax+4]
        mulss   xmm0,xmm1
        movss   dword ptr [eax+4],xmm0
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     eax,[ebp-48]
        mov     ecx,16
        add     ecx,[ebp-152]
        mov     edi,[ebp-140]
        mov     edx,[edi+192]
        imul    edx,24
        mov     ebx,[ebp-140]
        add     ebx,edx
        add     ebx,16
        mov     edx,ecx
        mov     edi,eax
        movss   xmm0,dword ptr [edx]
        addss   xmm0,dword ptr [edi]
        mov     edx,ebx
        movss   dword ptr [edx],xmm0
        movss   xmm0,dword ptr [ecx+4]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebx+4],xmm0
; end of inline function vec2f_add
        mov     edx,[ebp-140]
        inc     dword ptr [edx+192]
        mov     [ebp-140],edx
label0004:
        mov     eax,[ebp-152]
        add     eax,24
        mov     ecx,[ebp-156]
        add     ecx,24
        mov     edx,[ebp-140]
        mov     ebx,[ebp-148]
        mov     edi,[ebp-144]
        jmp     label0001
label0002:
        mov     edx,[ebp-140]
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
        add     esp,176
        pop     ebp
        ret
__clip_on_plain endp

_rasterizer_triangle3f proc
        push    ebp
        mov     ebp,esp
        sub     esp,824
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+28]
        mov     esi,[ebp+24]
        mov     ebx,[ebp+20]
        mov     edx,[ebp+16]
        mov     ecx,[ebp+12]
        mov     eax,[ebp+8]
; start of inline function _transform_to_projection_space
        mov     [ebp-740],edi
        lea     edi,[ebp-196]
; start of inline function vec4f_assign
        movss   xmm0,dword ptr [eax+8]
        movss   xmm1,dword ptr [eax+4]
        movss   xmm2,dword ptr [eax]
        lea     eax,[ebp-716]
        mov     [ebp-744],edx
        mov     edx,eax
        movss   dword ptr [edx],xmm2
        movss   dword ptr [eax+4],xmm1
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_assign
        mov     [ebp-748],ecx
        lea     eax,dword ptr [__mvproj_matrix]
        push    eax
        lea     eax,[ebp-716]
        push    eax
        push    edi
        call    _matrix4f_transform
        add     esp,12
; end of inline function _transform_to_projection_space
        mov     eax,[ebx]
        mov     ebx,[ebx+4]
        mov     [ebp-180],eax
        mov     [ebp-176],ebx
; start of inline function _transform_to_projection_space
        mov     eax,[ebp-748]
        lea     ecx,[ebp-196]
        add     ecx,24
; start of inline function vec4f_assign
        movss   xmm0,dword ptr [eax+8]
        movss   xmm1,dword ptr [eax+4]
        movss   xmm2,dword ptr [eax]
        lea     eax,[ebp-716]
        mov     edx,eax
        movss   dword ptr [edx],xmm2
        movss   dword ptr [eax+4],xmm1
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_assign
        lea     eax,dword ptr [__mvproj_matrix]
        push    eax
        lea     eax,[ebp-716]
        push    eax
        push    ecx
        call    _matrix4f_transform
        add     esp,12
; end of inline function _transform_to_projection_space
        mov     eax,[esi]
        mov     esi,[esi+4]
        mov     [ebp-156],eax
        mov     [ebp-152],esi
; start of inline function _transform_to_projection_space
        mov     eax,[ebp-744]
        lea     ecx,[ebp-196]
        add     ecx,48
; start of inline function vec4f_assign
        movss   xmm0,dword ptr [eax+8]
        movss   xmm1,dword ptr [eax+4]
        movss   xmm2,dword ptr [eax]
        lea     eax,[ebp-716]
        mov     edx,eax
        movss   dword ptr [edx],xmm2
        movss   dword ptr [eax+4],xmm1
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_assign
        lea     eax,dword ptr [__mvproj_matrix]
        push    eax
        lea     eax,[ebp-716]
        push    eax
        push    ecx
        call    _matrix4f_transform
        add     esp,12
; end of inline function _transform_to_projection_space
        mov     eax,[ebp-740]
        mov     ecx,[eax]
        mov     eax,[eax+4]
        mov     [ebp-132],ecx
        mov     [ebp-128],eax
        lea     eax,[ebp-196]
        add     eax,72
        lea     ecx,[ebp-196]
        mov     edi,eax
        mov     esi,ecx
        mov     ecx,6
        rep     movsd
        mov     dword ptr [ebp-4],4
; start of inline function _rasterize_polygon_4f
        lea     ecx,[ebp-196]
; start of inline function _clip_poligon
        mov     eax,ecx
        mov     [ebp-752],eax
        mov     [ebp-756],ecx
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        push    dword ptr [ebp-752]
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
        push    dword ptr [ebp-752]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        push    dword ptr [ebp-752]
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
        push    dword ptr [ebp-752]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        push    dword ptr [ebp-752]
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
        push    dword ptr [ebp-752]
        call    __clip_on_plain
        add     esp,16
        mov     eax,[ebp-752]
        cmp     dword ptr [eax+192],1
        setg    al
        movzx   eax,al
; end of inline function _clip_poligon
        cmp     eax,0
        jne     label0000
        jmp     label002c
label0000:
        mov     ecx,[ebp-756]
        cmp     dword ptr [ecx+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     edi,0
label0003:
        mov     eax,[ecx+192]
        cmp     eax,edi
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     eax,ecx
        mov     edx,edi
        imul    edx,24
        add     eax,edx
        lea     edx,[ebp-332]
        mov     ebx,edi
        sal     ebx,4
        add     edx,ebx
        mov     [ebp-756],ecx
        mov     [ebp-760],edx
        lea     ecx,dword ptr [__viewport_matrix]
        push    ecx
        push    eax
        lea     eax,[ebp-688]
        push    eax
        call    _matrix4f_transform
        add     esp,12
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [ebp-676]
        movss   xmm1,dword ptr [ebp-688]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
        mov     ecx,[ebp-760]
        mov     [ecx],eax
        movss   xmm1,dword ptr [ebp-684]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
        mov     edx,[ebp-760]
        mov     [edx+4],eax
        mov     eax,edx
        cmp     dword ptr [eax],0
        jl      label002a
        mov     eax,edx
        mov     eax,[eax]
        cmp     eax,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [edx+4],0
        jl      label002a
        mov     edx,[edx+4]
        cmp     edx,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     eax,[ebp-332]
        mov     ecx,edi
        sal     ecx,4
        mov     edx,[ebp-756]
        mov     ebx,edi
        imul    ebx,24
        mov     esi,[edx+ebx+16]
        mov     edx,[edx+ebx+20]
        mov     [eax+ecx+8],esi
        mov     [eax+ecx+12],edx
        inc     edi
        mov     ecx,[ebp-756]
        jmp     label0003
label0004:
        mov     edi,2
label0006:
        mov     eax,[ecx+192]
        dec     eax
        cmp     eax,edi
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     eax,[ebp-332]
        mov     edx,edi
        sal     edx,4
        add     eax,edx
        mov     edx,edi
        dec     edx
        sal     edx,4
        lea     ebx,[ebp-332]
        add     ebx,edx
        lea     edx,[ebp-332]
        mov     esi,edx
        mov     [ebp-756],ecx
        mov     ecx,ebx
        mov     esi,[esi+4]
        cmp     esi,[ecx+4]
        jle     label0008
        mov     [ebp-764],edx
        mov     edx,ebx
        mov     ecx,[ebp-764]
        mov     ebx,ecx
label0008:
        mov     ecx,edx
        mov     esi,eax
        mov     ecx,[ecx+4]
        cmp     ecx,[esi+4]
        jle     label0009
        mov     [ebp-764],edx
        mov     edx,eax
        mov     eax,[ebp-764]
label0009:
        mov     ecx,ebx
        mov     esi,eax
        mov     ecx,[ecx+4]
        cmp     ecx,[esi+4]
        jle     label000a
        mov     [ebp-768],edx
        mov     edx,ebx
        mov     ebx,eax
        mov     eax,edx
        mov     edx,[ebp-768]
label000a:
        mov     ecx,edx
        mov     esi,eax
        mov     ecx,[ecx+4]
        cmp     ecx,[esi+4]
        jne     label000b
        mov     ecx,edx
        cmp     dword ptr [ecx+4],0
        jl      label000c
        mov     ecx,edx
        mov     ecx,[ecx+4]
        cmp     ecx,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   xmm6,dword ptr [___unnamed_float_2]
        mov     ecx,8
        add     ecx,eax
        mov     esi,8
        add     esi,ebx
        mov     [ebp-772],edi
        mov     edi,8
        add     edi,edx
        mov     [ebp-776],esi
        mov     esi,edx
        mov     esi,[esi+4]
        mov     eax,[eax]
        mov     ebx,[ebx]
        mov     edx,[edx]
        mov     [ebp-780],ecx
        mov     ecx,edx
        cmp     ecx,ebx
        jge     label001c
        mov     ecx,eax
        cmp     ecx,ebx
        jle     label001d
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    esi
        push    eax
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
label001d:
        mov     ecx,eax
        cmp     ecx,edx
        jge     label001f
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     ecx,[ebp-780]
        push    dword ptr [ecx+4]
        push    dword ptr [ecx]
        push    esi
        push    ebx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    esi
        push    ebx
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
label001c:
        mov     edi,eax
        cmp     edi,ebx
        jge     label0022
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     ecx,[ebp-780]
        push    dword ptr [ecx+4]
        push    dword ptr [ecx]
        push    esi
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
label0022:
        mov     ecx,eax
        cmp     ecx,edx
        jle     label0024
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     [ebp-784],esi
        mov     esi,[ebp-776]
        push    dword ptr [esi+4]
        push    dword ptr [esi]
        push    dword ptr [ebp-784]
        push    eax
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
label0024:
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     [ebp-784],esi
        mov     esi,[ebp-776]
        push    dword ptr [esi+4]
        push    dword ptr [esi]
        push    dword ptr [ebp-784]
        push    edx
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
        mov     edi,[ebp-772]
label000c:
        jmp     label0027
label000b:
        mov     ecx,edx
        mov     ecx,[ecx+4]
label000e:
        mov     esi,ebx
        mov     esi,[esi+4]
        cmp     esi,ecx
        jle     label000f
        mov     esi,edx
        mov     [ebp-788],eax
        mov     eax,ecx
        sub     eax,[esi+4]
        mov     esi,ebx
        mov     [ebp-772],edi
        mov     edi,edx
        mov     esi,[esi]
        sub     esi,[edi]
        imul    eax,esi
        mov     esi,ebx
        mov     edi,edx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        mov     [ebp-768],edx
        cdq
        idiv    esi
        mov     edx,[ebp-768]
        add     eax,[edx]
        mov     edx,[ebp-768]
        mov     [ebp-792],eax
        mov     eax,ecx
        sub     eax,[edx+4]
        mov     edx,[ebp-788]
        mov     esi,[ebp-768]
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        mov     edx,[ebp-788]
        mov     esi,[ebp-768]
        mov     edx,[edx+4]
        sub     edx,[esi+4]
        mov     [ebp-796],edx
        cdq
        idiv    dword ptr [ebp-796]
        mov     edx,[ebp-768]
        add     eax,[edx]
        mov     edx,[ebp-768]
        mov     esi,ecx
        sub     esi,[edx+4]
        cvtsi2ss        xmm0,esi
        movss   xmm1,dword ptr [ebx+8]
        mov     edx,[ebp-768]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        mov     esi,ebx
        mov     edi,edx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [edx+8]
        mov     esi,edx
        mov     edi,ecx
        sub     edi,[esi+4]
        cvtsi2ss        xmm1,edi
        mov     [ebp-800],eax
        mov     eax,[ebp-788]
        movss   xmm2,dword ptr [eax+8]
        subss   xmm2,dword ptr [edx+8]
        mulss   xmm1,xmm2
        mov     esi,eax
        mov     edi,edx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        cvtsi2ss        xmm2,esi
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [edx+8]
        mov     esi,edx
        mov     edi,ecx
        sub     edi,[esi+4]
        cvtsi2ss        xmm2,edi
        movss   xmm3,dword ptr [ebx+12]
        subss   xmm3,dword ptr [edx+12]
        mulss   xmm2,xmm3
        mov     esi,ebx
        mov     edi,edx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        cvtsi2ss        xmm3,esi
        divss   xmm2,xmm3
        addss   xmm2,dword ptr [edx+12]
        mov     esi,edx
        mov     edi,ecx
        sub     edi,[esi+4]
        cvtsi2ss        xmm3,edi
        movss   xmm4,dword ptr [eax+12]
        subss   xmm4,dword ptr [edx+12]
        mulss   xmm3,xmm4
        mov     esi,eax
        mov     edi,edx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        cvtsi2ss        xmm4,esi
        divss   xmm3,xmm4
        addss   xmm3,dword ptr [edx+12]
        mov     esi,[ebp-800]
        sub     esi,[ebp-792]
        cvtsi2ss        xmm4,esi
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     esi,[ebp-800]
        sub     esi,[ebp-792]
        cvtsi2ss        xmm4,esi
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     esi,ecx
        mov     edi,[ebp-800]
        mov     [ebp-788],eax
        mov     eax,[ebp-792]
        mov     [ebp-768],edx
        mov     edx,eax
        cmp     edx,edi
        jg      label0013
        mov     [ebp-804],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    esi
        push    edi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
label0013:
        mov     [ebp-804],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    esi
        push    eax
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-804]
        mov     eax,[ebp-788]
        mov     ecx,[ebp-804]
        mov     edx,[ebp-768]
        mov     edi,[ebp-772]
        jmp     label000e
label000f:
        mov     ecx,ebx
        mov     esi,edx
        mov     [ebp-788],eax
        mov     eax,[ecx+4]
        sub     eax,[esi+4]
        mov     ecx,[ebp-788]
        mov     esi,edx
        mov     ecx,[ecx]
        sub     ecx,[esi]
        imul    eax,ecx
        mov     ecx,[ebp-788]
        mov     esi,edx
        mov     ecx,[ecx+4]
        sub     ecx,[esi+4]
        mov     [ebp-768],edx
        cdq
        idiv    ecx
        mov     ecx,[ebp-768]
        add     eax,[ecx]
        mov     ecx,ebx
        mov     edx,[ebp-768]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm0,ecx
        mov     [ebp-800],eax
        mov     eax,[ebp-788]
        movss   xmm1,dword ptr [eax+8]
        mov     edx,[ebp-768]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        mov     ecx,eax
        mov     esi,edx
        mov     ecx,[ecx+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [edx+8]
        movss   xmm1,xmm0
        mov     ecx,ebx
        mov     esi,edx
        mov     ecx,[ecx+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm2,dword ptr [eax+12]
        subss   xmm2,dword ptr [edx+12]
        mulss   xmm0,xmm2
        mov     ecx,eax
        mov     esi,edx
        mov     ecx,[ecx+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm0,xmm2
        addss   xmm0,dword ptr [edx+12]
        movss   xmm3,xmm0
        movss   xmm0,xmm1
        subss   xmm0,dword ptr [ebx+8]
        mov     ecx,ebx
        mov     esi,[ebp-800]
        sub     esi,[ecx]
        cvtsi2ss        xmm2,esi
        divss   xmm0,xmm2
        movss   xmm5,xmm0
        movss   xmm0,xmm3
        subss   xmm0,dword ptr [ebx+12]
        mov     ecx,ebx
        mov     esi,[ebp-800]
        sub     esi,[ecx]
        cvtsi2ss        xmm2,esi
        divss   xmm0,xmm2
        movss   xmm6,xmm0
; start of inline function _rasterize_horiz_line__unordered
        movss   xmm0,dword ptr [ebx+12]
        movss   dword ptr [ebp-820],xmm3
        movss   xmm3,xmm0
        movss   xmm0,dword ptr [ebx+8]
        movss   dword ptr [ebp-824],xmm1
        movss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-820]
        movss   xmm2,xmm0
        movss   xmm0,dword ptr [ebp-824]
        mov     ecx,ebx
        mov     ecx,[ecx+4]
        mov     esi,ecx
        mov     ecx,ebx
        mov     ecx,[ecx]
        mov     [ebp-772],edi
        mov     edi,ecx
        mov     ecx,[ebp-800]
        mov     [ebp-788],eax
        mov     eax,ecx
        mov     ecx,eax
        cmp     ecx,edi
        jg      label0016
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    esi
        push    edi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
label0016:
        mov     [ebp-768],edx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    esi
        push    eax
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     eax,ebx
        mov     esi,1
        add     esi,[eax+4]
        mov     ecx,esi
label0011:
        mov     edi,[ebp-788]
        mov     edi,[edi+4]
        cmp     edi,ecx
        jle     label0012
        mov     eax,ebx
        mov     [ebp-808],eax
        mov     eax,ecx
        mov     edx,[ebp-808]
        sub     eax,[edx+4]
        mov     edx,[ebp-788]
        mov     esi,ebx
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        mov     edx,[ebp-788]
        mov     esi,ebx
        mov     edx,[edx+4]
        sub     edx,[esi+4]
        mov     [ebp-812],edx
        cdq
        idiv    dword ptr [ebp-812]
        mov     edx,ebx
        add     eax,[edx]
        mov     edx,[ebp-768]
        mov     [ebp-792],eax
        mov     eax,ecx
        sub     eax,[edx+4]
        mov     edx,[ebp-788]
        mov     esi,[ebp-768]
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        mov     edx,[ebp-788]
        mov     esi,[ebp-768]
        mov     edx,[edx+4]
        sub     edx,[esi+4]
        mov     [ebp-816],edx
        cdq
        idiv    dword ptr [ebp-816]
        mov     edx,[ebp-768]
        add     eax,[edx]
        mov     edx,ebx
        mov     esi,ecx
        sub     esi,[edx+4]
        cvtsi2ss        xmm1,esi
        mov     [ebp-800],eax
        mov     eax,[ebp-788]
        movss   xmm3,dword ptr [eax+8]
        subss   xmm3,dword ptr [ebx+8]
        mulss   xmm1,xmm3
        mov     edx,eax
        mov     esi,ebx
        mov     edx,[edx+4]
        sub     edx,[esi+4]
        cvtsi2ss        xmm5,edx
        divss   xmm1,xmm5
        addss   xmm1,dword ptr [ebx+8]
        movss   xmm0,xmm1
        mov     edx,[ebp-768]
        mov     esi,ecx
        sub     esi,[edx+4]
        cvtsi2ss        xmm6,esi
        movss   xmm1,dword ptr [eax+8]
        mov     edx,[ebp-768]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm6,xmm1
        mov     esi,eax
        mov     edi,edx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        cvtsi2ss        xmm1,esi
        divss   xmm6,xmm1
        addss   xmm6,dword ptr [edx+8]
        movss   xmm1,xmm6
        mov     esi,ebx
        mov     edi,ecx
        sub     edi,[esi+4]
        cvtsi2ss        xmm2,edi
        movss   xmm3,dword ptr [eax+12]
        subss   xmm3,dword ptr [ebx+12]
        mulss   xmm2,xmm3
        mov     esi,eax
        mov     edi,ebx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        cvtsi2ss        xmm3,esi
        divss   xmm2,xmm3
        addss   xmm2,dword ptr [ebx+12]
        mov     esi,edx
        mov     edi,ecx
        sub     edi,[esi+4]
        cvtsi2ss        xmm3,edi
        movss   xmm4,dword ptr [eax+12]
        subss   xmm4,dword ptr [edx+12]
        mulss   xmm3,xmm4
        mov     esi,eax
        mov     edi,edx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        cvtsi2ss        xmm4,esi
        divss   xmm3,xmm4
        addss   xmm3,dword ptr [edx+12]
        mov     esi,[ebp-800]
        sub     esi,[ebp-792]
        cvtsi2ss        xmm4,esi
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     esi,[ebp-800]
        sub     esi,[ebp-792]
        cvtsi2ss        xmm4,esi
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     esi,ecx
        mov     edi,[ebp-800]
        mov     [ebp-788],eax
        mov     eax,[ebp-792]
        mov     [ebp-768],edx
        mov     edx,eax
        cmp     edx,edi
        jg      label0019
        mov     [ebp-804],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    esi
        push    edi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        mov     [ebp-804],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    esi
        push    eax
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-804]
        mov     ecx,[ebp-804]
        jmp     label0011
label0012:
        mov     edi,[ebp-772]
label0027:
; end of inline function _rasterize_triangle_2i
        inc     edi
        mov     ecx,[ebp-756]
        jmp     label0006
label0007:
label002c:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        add     esp,824
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
