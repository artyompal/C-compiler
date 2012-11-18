
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
        movss   xmm4,xmm6
        movss   xmm3,xmm5
        mov     edi,(offset __mvproj_matrix)
        mulss   xmm7,xmm3
        movss   xmm1,xmm7
        mulss   xmm1,xmm0
        mov     eax,edi
        movss   xmm0,xmm3
        divss   xmm0,xmm1
        movss   dword ptr [eax],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+4],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+8],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+12],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+16],xmm0
        mov     eax,edi
        movss   xmm0,xmm3
        divss   xmm0,xmm7
        movss   dword ptr [eax+20],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+24],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+28],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+32],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+36],xmm0
        mov     eax,edi
        movss   xmm0,xmm4
        subss   xmm0,xmm3
        movss   xmm1,xmm4
        divss   xmm1,xmm0
        movss   dword ptr [eax+40],xmm1
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [eax+44],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+48],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+52],xmm0
        mov     eax,edi
        movss   xmm0,xmm3
        mulss   xmm0,xmm4
        subss   xmm3,xmm4
        divss   xmm0,xmm3
        movss   dword ptr [eax+56],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+60],xmm0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   xmm7,xmm6
        movss   xmm4,xmm5
        cvtsi2ss        xmm0,esi
        cvtsi2ss        xmm1,ebx
        mov     edi,(offset __viewport_matrix)
        mov     eax,edi
        movss   xmm2,xmm1
        divss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+4],xmm2
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+8],xmm2
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+12],xmm2
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+16],xmm2
        mov     eax,edi
        movss   xmm2,xmm0
        xorps   xmm2,dword ptr [___unnamed_float_4]
        divss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+20],xmm2
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+24],xmm2
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+28],xmm2
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+32],xmm2
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+36],xmm2
        mov     eax,edi
        subss   xmm7,xmm4
        movss   dword ptr [eax+40],xmm7
        mov     eax,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [eax+44],xmm2
        mov     eax,edi
        divss   xmm1,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+48],xmm1
        mov     eax,edi
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+52],xmm0
        mov     eax,edi
        movss   dword ptr [eax+56],xmm4
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+60],xmm0
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,xmm5
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_base)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
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
        movss   dword ptr [ebp-4],xmm7
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [ebp-4]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_norm)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,xmm6
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_base)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
        comiss  xmm6,xmm5
        jbe     label0002
        movss   xmm7,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   xmm7,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
        movss   dword ptr [ebp-8],xmm7
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [ebp-8]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_norm)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   xmm2,xmm0
        mov     edi,(offset __clip_plane_left_base)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_1]
        mov     edi,(offset __clip_plane_left_norm)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        movss   xmm2,xmm0
        mov     edi,(offset __clip_plane_right_base)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_5]
        mov     edi,(offset __clip_plane_right_norm)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,esi
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   xmm3,xmm0
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_base)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_1]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_norm)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_1]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_base)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_5]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_norm)
        mov     eax,edi
        movss   dword ptr [eax],xmm2
        mov     eax,edi
        movss   dword ptr [eax+4],xmm3
        mov     eax,edi
        movss   dword ptr [eax+8],xmm4
        movss   dword ptr [edi+12],xmm7
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
        movss   xmm3,xmm5
        movss   xmm2,xmm4
        mov     ecx,dword ptr [__texture_width]
        dec     ecx
        cvtsi2ss        xmm0,ecx
        mulss   xmm0,xmm2
        cvttss2si       ecx,xmm0
        mov     edx,dword ptr [__texture_height]
        dec     edx
        cvtsi2ss        xmm0,edx
        mulss   xmm0,xmm3
        cvttss2si       edx,xmm0
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
        divss   xmm0,dword ptr [___unnamed_float_6]
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
        sub     esp,148
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
        mov     edi,eax
        mov     [ebp+12],ebx
        lea     ebx,[ebp-24]
        mov     [ebp-4],eax
        mov     eax,edi
        mov     [ebp-8],ecx
        mov     ecx,edx
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm0
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        movss   dword ptr [eax+4],xmm0
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     eax,ebx
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [edi+12]
        subss   xmm0,dword ptr [edx+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     ecx,[ebp-24]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [ebx+4]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm1,dword ptr [edx]
        mulss   xmm1,dword ptr [ebx]
        addss   xmm1,xmm0
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [ebx+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        mov     eax,esi
        mov     edx,eax
        mov     eax,[ebp-8]
        mov     edi,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm0
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        movss   dword ptr [eax+4],xmm0
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     eax,ebx
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [edi+12]
        subss   xmm0,dword ptr [edx+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     ecx,[ebp-24]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [ebx+4]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm2,dword ptr [edx]
        mulss   xmm2,dword ptr [ebx]
        addss   xmm2,xmm0
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [ebx+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm2,xmm0
        movss   dword ptr [ebp-52],xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        ja      label0003
        mov     eax,[ebp+8]
        mov     ecx,[eax+192]
        inc     dword ptr [eax+192]
        imul    ecx,24
        mov     eax,[ebp+8]
        add     eax,ecx
        mov     ecx,[ebp-4]
        mov     edi,eax
        mov     [ebp+16],esi
        mov     esi,ecx
        mov     ecx,6
        rep     movsd
        mov     [ebp-140],ecx
        mov     esi,[ebp+16]
label0003:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        jae     label0006
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm1
        ja      label0005
label0006:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm1
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        mov     eax,[ebp-4]
        mov     edx,eax
        mov     eax,esi
        mov     edi,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,edi
        mov     ecx,edx
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm1
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        movss   dword ptr [eax+4],xmm0
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     eax,ebx
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [edi+12]
        subss   xmm0,dword ptr [edx+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     eax,[ebp-4]
        mov     edx,eax
        mov     eax,[ebp-8]
        mov     edi,eax
        lea     eax,[ebp-40]
        mov     ebx,eax
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm0
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        movss   dword ptr [eax+4],xmm0
        mov     eax,edi
        mov     ecx,edx
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     eax,ebx
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [edi+12]
        subss   xmm0,dword ptr [edx+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     ecx,[ebp-24]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [ebx+4]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm1,dword ptr [edx]
        mulss   xmm1,dword ptr [ebx]
        addss   xmm1,xmm0
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [ebx+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     ecx,[ebp-40]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [ebx+4]
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm2,dword ptr [edx]
        mulss   xmm2,dword ptr [ebx]
        addss   xmm2,xmm0
        mov     edx,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [ebx+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm2,xmm0
        movss   dword ptr [ebp-148],xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        movss   dword ptr [ebp-128],xmm1
        movss   xmm1,dword ptr [ebp-148]
        divss   xmm1,dword ptr [ebp-128]
; start of inline function vec4f_mul
        movss   xmm7,xmm1
        lea     eax,[ebp-40]
        mov     ecx,eax
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,xmm7
        movss   dword ptr [ecx],xmm0
        mov     ecx,eax
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,xmm7
        movss   dword ptr [ecx+4],xmm0
        mov     ecx,eax
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,xmm7
        movss   dword ptr [ecx+8],xmm0
        movss   xmm0,dword ptr [eax+12]
        mulss   xmm0,xmm7
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     eax,[ebp-40]
        mov     ecx,[ebp-4]
        mov     edx,[ebp+8]
        mov     edx,[edx+192]
        imul    edx,24
        mov     ebx,[ebp+8]
        add     ebx,edx
        mov     edx,ecx
        mov     edi,eax
        movss   xmm0,dword ptr [edx]
        addss   xmm0,dword ptr [edi]
        mov     edx,ebx
        movss   dword ptr [edx],xmm0
        mov     edx,ecx
        mov     edi,eax
        movss   xmm0,dword ptr [edx+4]
        addss   xmm0,dword ptr [edi+4]
        mov     edx,ebx
        movss   dword ptr [edx+4],xmm0
        mov     edx,ecx
        mov     edi,eax
        movss   xmm0,dword ptr [edx+8]
        addss   xmm0,dword ptr [edi+8]
        mov     edx,ebx
        movss   dword ptr [edx+8],xmm0
        movss   xmm0,dword ptr [ecx+12]
        addss   xmm0,dword ptr [eax+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     eax,16
        add     eax,[ebp-4]
        mov     ecx,16
        add     ecx,[ebp-8]
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
        add     ecx,[ebp-4]
        mov     edx,[ebp+8]
        mov     edx,[edx+192]
        imul    edx,24
        mov     ebx,[ebp+8]
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
label0002:
        mov     eax,[ebp+8]
        mov     ecx,[eax+192]
        inc     dword ptr [eax+192]
        imul    ecx,24
        mov     ebx,[ebp+8]
        add     ebx,ecx
        mov     esi,[ebp+8]
        mov     edi,ebx
        mov     [ebp-144],esi
        mov     esi,[ebp-144]
        mov     ecx,6
        rep     movsd
        pop     ebx
        pop     esi
        pop     edi
        add     esp,148
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
        movss   xmm7,dword ptr [___unnamed_float_1]
        mov     eax,edi
        movss   xmm6,dword ptr [eax+8]
        mov     eax,edi
        movss   xmm5,dword ptr [eax+4]
        movss   xmm4,dword ptr [edi]
        lea     eax,[ebp-16]
        mov     ecx,eax
        movss   dword ptr [ecx],xmm4
        mov     ecx,eax
        movss   dword ptr [ecx+4],xmm5
        mov     ecx,eax
        movss   dword ptr [ecx+8],xmm6
        movss   dword ptr [eax+12],xmm7
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        mov     edi,(offset __mvproj_matrix)
        lea     eax,[ebp-16]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,dword ptr [edx+16]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [edx]
        addss   xmm1,xmm0
        mov     ecx,eax
        mov     edx,edi
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,dword ptr [edx+32]
        addss   xmm1,xmm0
        mov     ecx,eax
        mov     edx,edi
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [edx+48]
        addss   xmm1,xmm0
        mov     ecx,esi
        movss   dword ptr [ecx],xmm1
        mov     ecx,edi
        mov     edx,eax
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [ecx+4]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx+4]
        mulss   xmm1,dword ptr [edx+20]
        addss   xmm0,xmm1
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx+8]
        mulss   xmm1,dword ptr [edx+36]
        addss   xmm0,xmm1
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx+12]
        mulss   xmm1,dword ptr [edx+52]
        addss   xmm0,xmm1
        mov     ecx,esi
        movss   dword ptr [ecx+4],xmm0
        mov     ecx,edi
        mov     edx,eax
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [ecx+8]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx+4]
        mulss   xmm1,dword ptr [edx+24]
        addss   xmm0,xmm1
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx+8]
        mulss   xmm1,dword ptr [edx+40]
        addss   xmm0,xmm1
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx+12]
        mulss   xmm1,dword ptr [edx+56]
        addss   xmm0,xmm1
        mov     ecx,esi
        movss   dword ptr [ecx+8],xmm0
        mov     ecx,edi
        mov     edx,eax
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [ecx+12]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx+4]
        mulss   xmm1,dword ptr [edx+28]
        addss   xmm0,xmm1
        mov     ecx,eax
        mov     edx,edi
        movss   xmm1,dword ptr [ecx+8]
        mulss   xmm1,dword ptr [edx+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [eax+12]
        mulss   xmm1,dword ptr [edi+60]
        addss   xmm0,xmm1
        movss   dword ptr [esi+12],xmm0
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
        sub     esp,740
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
        lea     ecx,[ebp-196]
        add     ecx,192
        mov     dword ptr [ecx],4
; start of inline function _rasterize_polygon_4f
        lea     eax,[ebp-196]
; start of inline function _clip_poligon
        mov     ecx,eax
        mov     [ebp-200],eax
        mov     [ebp-464],ecx
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        push    dword ptr [ebp-464]
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
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        push    dword ptr [ebp-464]
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
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        push    dword ptr [ebp-464]
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
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        mov     eax,[ebp-464]
        cmp     dword ptr [eax+192],1
        setg    al
        movzx   eax,al
; end of inline function _clip_poligon
        cmp     eax,0
        jne     label0000
        jmp     label002d
label0000:
        mov     eax,[ebp-200]
        cmp     dword ptr [eax+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     edi,0
label0003:
        mov     eax,[ebp-200]
        mov     eax,[eax+192]
        cmp     eax,edi
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     eax,[ebp-200]
        mov     ecx,edi
        imul    ecx,24
        add     eax,ecx
        lea     ecx,[ebp-332]
        mov     edx,edi
        sal     edx,4
        add     ecx,edx
; start of inline function matrix4f_transform
        mov     esi,(offset __viewport_matrix)
        lea     edx,[ebp-688]
        mov     ebx,eax
        mov     [ebp-336],edi
        mov     edi,esi
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [edi+16]
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        mov     ebx,eax
        mov     edi,esi
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [edi+32]
        addss   xmm1,xmm0
        mov     ebx,eax
        mov     edi,esi
        movss   xmm0,dword ptr [ebx+12]
        mulss   xmm0,dword ptr [edi+48]
        addss   xmm1,xmm0
        mov     ebx,edx
        movss   dword ptr [ebx],xmm1
        mov     ebx,esi
        mov     edi,eax
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [ebx+4]
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx+4]
        mulss   xmm1,dword ptr [edi+20]
        addss   xmm0,xmm1
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx+8]
        mulss   xmm1,dword ptr [edi+36]
        addss   xmm0,xmm1
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx+12]
        mulss   xmm1,dword ptr [edi+52]
        addss   xmm0,xmm1
        mov     ebx,edx
        movss   dword ptr [ebx+4],xmm0
        mov     ebx,esi
        mov     edi,eax
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [ebx+8]
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx+4]
        mulss   xmm1,dword ptr [edi+24]
        addss   xmm0,xmm1
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx+8]
        mulss   xmm1,dword ptr [edi+40]
        addss   xmm0,xmm1
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx+12]
        mulss   xmm1,dword ptr [edi+56]
        addss   xmm0,xmm1
        mov     ebx,edx
        movss   dword ptr [ebx+8],xmm0
        mov     ebx,esi
        mov     edi,eax
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [ebx+12]
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx+4]
        mulss   xmm1,dword ptr [edi+28]
        addss   xmm0,xmm1
        mov     ebx,eax
        mov     edi,esi
        movss   xmm1,dword ptr [ebx+8]
        mulss   xmm1,dword ptr [edi+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [eax+12]
        mulss   xmm1,dword ptr [esi+60]
        addss   xmm0,xmm1
        movss   dword ptr [edx+12],xmm0
; end of inline function matrix4f_transform
        lea     eax,[ebp-688]
        add     eax,12
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [eax]
        movss   xmm1,dword ptr [ebp-688]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
        mov     edx,ecx
        mov     [edx],eax
        lea     eax,[ebp-688]
        add     eax,4
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
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
        mov     ecx,[ecx+4]
        cmp     ecx,dword ptr [__height]
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
        mov     edi,[ebp-336]
        jmp     label0003
label0004:
        mov     edi,2
label0006:
        mov     eax,[ebp-200]
        mov     eax,[eax+192]
        dec     eax
        cmp     eax,edi
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     eax,[ebp-332]
        mov     ecx,edi
        sal     ecx,4
        add     eax,ecx
        mov     ecx,edi
        dec     ecx
        sal     ecx,4
        lea     edx,[ebp-332]
        add     edx,ecx
        lea     ecx,[ebp-332]
        lea     ebx,[ecx+4]
        lea     esi,[edx+4]
        mov     ebx,[ebx]
        cmp     ebx,[esi]
        jle     label0008
        mov     [ebp-352],ecx
        mov     ecx,edx
        mov     edx,[ebp-352]
label0008:
        lea     ebx,[ecx+4]
        lea     esi,[eax+4]
        mov     ebx,[ebx]
        cmp     ebx,[esi]
        jle     label0009
        mov     [ebp-352],ecx
        mov     ecx,eax
        mov     eax,[ebp-352]
label0009:
        lea     ebx,[edx+4]
        lea     esi,[eax+4]
        mov     ebx,[ebx]
        cmp     ebx,[esi]
        jle     label000a
        mov     [ebp-348],ecx
        mov     ecx,edx
        mov     edx,eax
        mov     eax,ecx
        mov     ecx,[ebp-348]
label000a:
        lea     ebx,[ecx+4]
        lea     esi,[eax+4]
        mov     ebx,[ebx]
        cmp     ebx,[esi]
        jne     label000b
        lea     ebx,[ecx+4]
        cmp     dword ptr [ebx],0
        jl      label000c
        lea     ebx,[ecx+4]
        mov     ebx,[ebx]
        cmp     ebx,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   xmm6,dword ptr [___unnamed_float_2]
        mov     ebx,8
        add     ebx,eax
        mov     esi,8
        add     esi,edx
        mov     [ebp-336],edi
        mov     edi,8
        add     edi,ecx
        mov     [ebp-440],esi
        lea     esi,[ecx+4]
        mov     esi,[esi]
        mov     eax,[eax]
        mov     edx,[edx]
        mov     ecx,[ecx]
        mov     [ebp-436],ebx
        mov     ebx,ecx
        cmp     ebx,edx
        jge     label001c
        mov     ebx,eax
        cmp     ebx,edx
        jle     label001d
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     edx,edi
        push    dword ptr [edx+4]
        push    dword ptr [edi]
        push    esi
        push    eax
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
label001d:
        mov     ebx,eax
        cmp     ebx,ecx
        jge     label001f
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     ecx,[ebp-436]
        push    dword ptr [ecx+4]
        mov     edi,[ebp-436]
        push    dword ptr [edi]
        push    esi
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     eax,edi
        push    dword ptr [eax+4]
        push    dword ptr [edi]
        push    esi
        push    edx
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
label001c:
        mov     edi,eax
        cmp     edi,edx
        jge     label0022
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     edx,[ebp-436]
        push    dword ptr [edx+4]
        mov     edx,[ebp-436]
        push    dword ptr [edx]
        push    esi
        push    ecx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
label0022:
        mov     ebx,eax
        cmp     ebx,ecx
        jle     label0024
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     ecx,[ebp-440]
        push    dword ptr [ecx+4]
        mov     ecx,[ebp-440]
        push    dword ptr [ecx]
        push    esi
        push    eax
        push    edx
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
        mov     eax,[ebp-440]
        push    dword ptr [eax+4]
        mov     eax,[ebp-440]
        push    dword ptr [eax]
        push    esi
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
        lea     ebx,[ecx+4]
        mov     ebx,[ebx]
label000e:
        lea     esi,[edx+4]
        mov     esi,[esi]
        cmp     esi,ebx
        jle     label000f
        lea     esi,[ecx+4]
        mov     [ebp-340],eax
        mov     eax,ebx
        sub     eax,[esi]
        mov     esi,edx
        mov     [ebp-336],edi
        mov     edi,ecx
        mov     esi,[esi]
        sub     esi,[edi]
        imul    eax,esi
        lea     esi,[edx+4]
        lea     edi,[ecx+4]
        mov     esi,[esi]
        sub     esi,[edi]
        mov     [ebp-344],edx
        cdq
        idiv    esi
        mov     edx,ecx
        add     eax,[edx]
        lea     edx,[ecx+4]
        mov     [ebp-356],eax
        mov     eax,ebx
        sub     eax,[edx]
        mov     edx,[ebp-340]
        mov     esi,ecx
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        mov     [ebp-708],eax
        mov     eax,[ebp-340]
        lea     edx,[eax+4]
        lea     esi,[ecx+4]
        mov     edx,[edx]
        sub     edx,[esi]
        mov     [ebp-712],edx
        mov     [ebp-340],eax
        mov     eax,[ebp-708]
        cdq
        idiv    dword ptr [ebp-712]
        mov     edx,ecx
        add     eax,[edx]
        lea     edx,[ecx+4]
        mov     esi,ebx
        sub     esi,[edx]
        cvtsi2ss        xmm0,esi
        mov     edx,[ebp-344]
        mov     esi,ecx
        movss   xmm1,dword ptr [edx+8]
        subss   xmm1,dword ptr [esi+8]
        mulss   xmm0,xmm1
        mov     edi,[ebp-344]
        lea     edx,[edi+4]
        lea     esi,[ecx+4]
        mov     edx,[edx]
        sub     edx,[esi]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        mov     edx,ecx
        addss   xmm0,dword ptr [edx+8]
        lea     edx,[ecx+4]
        mov     esi,ebx
        sub     esi,[edx]
        cvtsi2ss        xmm1,esi
        mov     edx,[ebp-340]
        mov     esi,ecx
        movss   xmm2,dword ptr [edx+8]
        subss   xmm2,dword ptr [esi+8]
        mulss   xmm1,xmm2
        mov     [ebp-360],eax
        mov     eax,[ebp-340]
        lea     edx,[eax+4]
        lea     esi,[ecx+4]
        mov     edx,[edx]
        sub     edx,[esi]
        cvtsi2ss        xmm2,edx
        divss   xmm1,xmm2
        mov     edx,ecx
        addss   xmm1,dword ptr [edx+8]
        lea     edx,[ecx+4]
        mov     esi,ebx
        sub     esi,[edx]
        cvtsi2ss        xmm2,esi
        mov     edx,8
        add     edx,[ebp-344]
        add     edx,4
        mov     esi,8
        add     esi,ecx
        add     esi,4
        movss   xmm3,dword ptr [edx]
        subss   xmm3,dword ptr [esi]
        mulss   xmm2,xmm3
        mov     edi,[ebp-344]
        lea     edx,[edi+4]
        lea     esi,[ecx+4]
        mov     edx,[edx]
        sub     edx,[esi]
        cvtsi2ss        xmm3,edx
        divss   xmm2,xmm3
        mov     edx,8
        add     edx,ecx
        add     edx,4
        addss   xmm2,dword ptr [edx]
        lea     edx,[ecx+4]
        mov     esi,ebx
        sub     esi,[edx]
        cvtsi2ss        xmm3,esi
        mov     edx,8
        add     edx,eax
        add     edx,4
        mov     esi,8
        add     esi,ecx
        add     esi,4
        movss   xmm4,dword ptr [edx]
        subss   xmm4,dword ptr [esi]
        mulss   xmm3,xmm4
        lea     edx,[eax+4]
        lea     esi,[ecx+4]
        mov     edx,[edx]
        sub     edx,[esi]
        cvtsi2ss        xmm4,edx
        divss   xmm3,xmm4
        mov     edx,8
        add     edx,ecx
        add     edx,4
        addss   xmm3,dword ptr [edx]
        mov     edx,[ebp-360]
        sub     edx,[ebp-356]
        cvtsi2ss        xmm4,edx
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     edx,[ebp-360]
        sub     edx,[ebp-356]
        cvtsi2ss        xmm4,edx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     edx,ebx
        mov     esi,[ebp-360]
        mov     edi,[ebp-356]
        mov     [ebp-340],eax
        mov     eax,edi
        cmp     eax,esi
        jg      label0013
        mov     [ebp-348],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    edx
        push    esi
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
label0013:
        mov     [ebp-348],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    edx
        push    edi
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     ebx
        mov     eax,[ebp-340]
        mov     ecx,[ebp-348]
        mov     edx,[ebp-344]
        mov     edi,[ebp-336]
        jmp     label000e
label000f:
        lea     ebx,[edx+4]
        lea     esi,[ecx+4]
        mov     [ebp-340],eax
        mov     eax,[ebx]
        sub     eax,[esi]
        mov     ebx,[ebp-340]
        mov     esi,ecx
        mov     ebx,[ebx]
        sub     ebx,[esi]
        imul    eax,ebx
        mov     [ebp-716],eax
        mov     eax,[ebp-340]
        lea     ebx,[eax+4]
        lea     esi,[ecx+4]
        mov     ebx,[ebx]
        sub     ebx,[esi]
        mov     [ebp-344],edx
        mov     [ebp-340],eax
        mov     eax,[ebp-716]
        cdq
        idiv    ebx
        mov     edx,ecx
        add     eax,[edx]
        mov     esi,[ebp-344]
        lea     edx,[esi+4]
        lea     ebx,[ecx+4]
        mov     edx,[edx]
        sub     edx,[ebx]
        cvtsi2ss        xmm0,edx
        mov     edx,[ebp-340]
        mov     ebx,ecx
        movss   xmm1,dword ptr [edx+8]
        subss   xmm1,dword ptr [ebx+8]
        mulss   xmm0,xmm1
        mov     [ebp-360],eax
        mov     eax,[ebp-340]
        lea     edx,[eax+4]
        lea     ebx,[ecx+4]
        mov     edx,[edx]
        sub     edx,[ebx]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        mov     edx,ecx
        addss   xmm0,dword ptr [edx+8]
        movss   xmm1,xmm0
        mov     esi,[ebp-344]
        lea     edx,[esi+4]
        lea     ebx,[ecx+4]
        mov     edx,[edx]
        sub     edx,[ebx]
        cvtsi2ss        xmm0,edx
        mov     edx,8
        add     edx,eax
        add     edx,4
        mov     ebx,8
        add     ebx,ecx
        add     ebx,4
        movss   xmm2,dword ptr [edx]
        subss   xmm2,dword ptr [ebx]
        mulss   xmm0,xmm2
        lea     edx,[eax+4]
        lea     ebx,[ecx+4]
        mov     edx,[edx]
        sub     edx,[ebx]
        cvtsi2ss        xmm2,edx
        divss   xmm0,xmm2
        mov     edx,8
        add     edx,ecx
        add     edx,4
        addss   xmm0,dword ptr [edx]
        movss   xmm3,xmm0
        mov     edx,[ebp-344]
        movss   xmm0,xmm1
        subss   xmm0,dword ptr [edx+8]
        mov     edx,[ebp-344]
        mov     ebx,[ebp-360]
        sub     ebx,[edx]
        cvtsi2ss        xmm2,ebx
        divss   xmm0,xmm2
        movss   xmm5,xmm0
        mov     edx,8
        add     edx,[ebp-344]
        add     edx,4
        movss   xmm0,xmm3
        subss   xmm0,dword ptr [edx]
        mov     edx,[ebp-344]
        mov     ebx,[ebp-360]
        sub     ebx,[edx]
        cvtsi2ss        xmm2,ebx
        divss   xmm0,xmm2
        movss   xmm6,xmm0
; start of inline function _rasterize_horiz_line__unordered
        mov     edx,8
        add     edx,[ebp-344]
        add     edx,4
        movss   dword ptr [ebp-380],xmm3
        movss   xmm3,dword ptr [edx]
        mov     edx,[ebp-344]
        movss   dword ptr [ebp-376],xmm1
        movss   xmm1,dword ptr [edx+8]
        movss   xmm2,dword ptr [ebp-380]
        movss   xmm0,dword ptr [ebp-376]
        mov     esi,[ebp-344]
        lea     edx,[esi+4]
        mov     edx,[edx]
        mov     ebx,[ebp-344]
        mov     ebx,[ebx]
        mov     esi,ebx
        mov     ebx,[ebp-360]
        mov     [ebp-336],edi
        mov     edi,ebx
        mov     ebx,edi
        cmp     ebx,esi
        jg      label0016
        mov     [ebp-348],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    edx
        push    esi
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
label0016:
        mov     [ebp-340],eax
        mov     [ebp-348],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    edx
        push    edi
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     edi,[ebp-344]
        lea     edx,[edi+4]
        mov     esi,1
        add     esi,[edx]
        mov     ebx,esi
label0011:
        mov     edi,[ebp-340]
        lea     eax,[edi+4]
        mov     eax,[eax]
        cmp     eax,ebx
        jle     label0012
        mov     edx,[ebp-344]
        lea     eax,[edx+4]
        mov     [ebp-720],eax
        mov     eax,ebx
        mov     ecx,[ebp-720]
        sub     eax,[ecx]
        mov     ecx,[ebp-340]
        mov     esi,edx
        mov     ecx,[ecx]
        sub     ecx,[esi]
        imul    eax,ecx
        mov     [ebp-724],eax
        mov     eax,[ebp-340]
        lea     ecx,[eax+4]
        lea     esi,[edx+4]
        mov     ecx,[ecx]
        sub     ecx,[esi]
        mov     [ebp-344],edx
        mov     [ebp-340],eax
        mov     eax,[ebp-724]
        cdq
        idiv    ecx
        mov     ecx,[ebp-344]
        add     eax,[ecx]
        mov     edi,[ebp-348]
        lea     ecx,[edi+4]
        mov     [ebp-356],eax
        mov     eax,ebx
        sub     eax,[ecx]
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     [ebp-728],eax
        mov     eax,[ebp-340]
        lea     ecx,[eax+4]
        mov     [ebp-732],ecx
        mov     ecx,[ebp-348]
        lea     edx,[ecx+4]
        mov     [ebp-348],ecx
        mov     ecx,[ebp-732]
        mov     esi,[ecx]
        sub     esi,[edx]
        mov     [ebp-340],eax
        mov     eax,[ebp-728]
        cdq
        idiv    esi
        mov     ecx,[ebp-348]
        add     eax,[ecx]
        mov     edx,[ebp-344]
        lea     ecx,[edx+4]
        mov     esi,ebx
        sub     esi,[ecx]
        cvtsi2ss        xmm1,esi
        mov     ecx,[ebp-340]
        mov     esi,edx
        movss   xmm3,dword ptr [ecx+8]
        subss   xmm3,dword ptr [esi+8]
        mulss   xmm1,xmm3
        mov     [ebp-360],eax
        mov     eax,[ebp-340]
        lea     ecx,[eax+4]
        lea     esi,[edx+4]
        mov     ecx,[ecx]
        sub     ecx,[esi]
        cvtsi2ss        xmm5,ecx
        divss   xmm1,xmm5
        mov     ecx,edx
        addss   xmm1,dword ptr [ecx+8]
        movss   xmm0,xmm1
        mov     edi,[ebp-348]
        lea     ecx,[edi+4]
        mov     esi,ebx
        sub     esi,[ecx]
        cvtsi2ss        xmm6,esi
        mov     ecx,eax
        mov     esi,[ebp-348]
        movss   xmm1,dword ptr [ecx+8]
        subss   xmm1,dword ptr [esi+8]
        mulss   xmm6,xmm1
        lea     ecx,[eax+4]
        mov     [ebp-736],ecx
        mov     ecx,[ebp-348]
        lea     esi,[ecx+4]
        mov     [ebp-348],ecx
        mov     ecx,[ebp-736]
        mov     edi,[ecx]
        sub     edi,[esi]
        cvtsi2ss        xmm1,edi
        divss   xmm6,xmm1
        mov     ecx,[ebp-348]
        addss   xmm6,dword ptr [ecx+8]
        movss   xmm1,xmm6
        lea     ecx,[edx+4]
        mov     esi,ebx
        sub     esi,[ecx]
        cvtsi2ss        xmm2,esi
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        mov     esi,8
        add     esi,edx
        add     esi,4
        movss   xmm3,dword ptr [ecx]
        subss   xmm3,dword ptr [esi]
        mulss   xmm2,xmm3
        lea     ecx,[eax+4]
        lea     esi,[edx+4]
        mov     ecx,[ecx]
        sub     ecx,[esi]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        mov     ecx,8
        add     ecx,edx
        add     ecx,4
        addss   xmm2,dword ptr [ecx]
        mov     edi,[ebp-348]
        lea     ecx,[edi+4]
        mov     esi,ebx
        sub     esi,[ecx]
        cvtsi2ss        xmm3,esi
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        mov     esi,8
        add     esi,[ebp-348]
        add     esi,4
        movss   xmm4,dword ptr [ecx]
        subss   xmm4,dword ptr [esi]
        mulss   xmm3,xmm4
        lea     ecx,[eax+4]
        mov     [ebp-740],ecx
        mov     ecx,[ebp-348]
        lea     esi,[ecx+4]
        mov     [ebp-348],ecx
        mov     ecx,[ebp-740]
        mov     edi,[ecx]
        sub     edi,[esi]
        cvtsi2ss        xmm4,edi
        divss   xmm3,xmm4
        mov     ecx,8
        add     ecx,[ebp-348]
        add     ecx,4
        addss   xmm3,dword ptr [ecx]
        mov     ecx,[ebp-360]
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     ecx,[ebp-360]
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     ecx,ebx
        mov     [ebp-344],edx
        mov     edx,ecx
        mov     ecx,[ebp-360]
        mov     esi,ecx
        mov     ecx,[ebp-356]
        mov     edi,ecx
        mov     ecx,edi
        cmp     ecx,esi
        jg      label0019
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    edx
        push    esi
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        mov     [ebp-340],eax
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    edx
        push    edi
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     ebx
        jmp     label0011
label0012:
        mov     edi,[ebp-336]
label0027:
; end of inline function _rasterize_triangle_2i
        inc     edi
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        add     esp,740
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
