
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
        mov     edx,ebx
        mov     dword ptr [__width],edx
        mov     edx,esi
        mov     dword ptr [__height],edx
        mov     dword ptr [__pitch],edi
; start of inline function matrix4f_make_perspective
        cvtsi2ss        xmm0,ebx
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        movss   xmm1,xmm6
        movss   xmm4,xmm5
        mov     edi,(offset __mvproj_matrix)
        mulss   xmm7,xmm4
        movss   xmm2,xmm7
        mulss   xmm2,xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        divss   xmm0,xmm2
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+12],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+16],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        divss   xmm0,xmm7
        movss   dword ptr [edx+20],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+24],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+28],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+32],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+36],xmm0
        mov     edx,edi
        movss   xmm0,xmm1
        subss   xmm0,xmm4
        movss   xmm2,xmm1
        divss   xmm2,xmm0
        movss   dword ptr [edx+40],xmm2
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edx+44],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+48],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+52],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        mulss   xmm0,xmm1
        subss   xmm4,xmm1
        divss   xmm0,xmm4
        movss   dword ptr [edx+56],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+60],xmm0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   xmm7,xmm6
        movss   xmm4,xmm5
        cvtsi2ss        xmm0,esi
        cvtsi2ss        xmm1,ebx
        mov     edi,(offset __viewport_matrix)
        mov     edx,edi
        movss   xmm2,xmm1
        divss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [edx],xmm2
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+8],xmm2
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+12],xmm2
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+16],xmm2
        mov     edx,edi
        movss   xmm2,xmm0
        xorps   xmm2,dword ptr [___unnamed_float_4]
        divss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [edx+20],xmm2
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+24],xmm2
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+28],xmm2
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+32],xmm2
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+36],xmm2
        mov     edx,edi
        subss   xmm7,xmm4
        movss   dword ptr [edx+40],xmm7
        mov     edx,edi
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+44],xmm2
        mov     edx,edi
        divss   xmm1,dword ptr [___unnamed_float_3]
        movss   dword ptr [edx+48],xmm1
        mov     edx,edi
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [edx+52],xmm0
        mov     edx,edi
        movss   dword ptr [edx+56],xmm4
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+60],xmm0
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,xmm5
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_base)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
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
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_norm)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,xmm6
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_base)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
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
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_norm)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   xmm1,xmm0
        mov     edi,(offset __clip_plane_left_base)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_1]
        mov     edi,(offset __clip_plane_left_norm)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        movss   xmm1,xmm0
        mov     edi,(offset __clip_plane_right_base)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_5]
        mov     edi,(offset __clip_plane_right_norm)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
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
        movss   xmm2,xmm0
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_base)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_norm)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_base)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_5]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_norm)
        mov     edx,edi
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   dword ptr [edx+4],xmm2
        mov     edx,edi
        movss   dword ptr [edx+8],xmm4
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
        sub     esp,8
        push    edi
        push    esi
        mov     edi,[ebp+8]
        mov     [ebp-4],edi
        lea     edi, [__mvproj_matrix]
        mov     [ebp-8],edi
        mov     edi,[ebp-4]
        lea     esi,[edi]
        mov     ecx,16
        mov     edi,[ebp-8]
        rep     movsd
        pop     esi
        pop     edi
        add     esp,8
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
        mov     edi,ebx
        sal     edi,2
        add     eax,edi
        sal     esi,2
        add     esi,eax
        sal     ebx,2
        sub     esi,ebx
label0000:
; start of inline function _tex2d
        movss   xmm3,xmm5
        movss   xmm2,xmm4
        mov     ebx,dword ptr [__texture_width]
        dec     ebx
        cvtsi2ss        xmm0,ebx
        mulss   xmm0,xmm2
        cvttss2si       ebx,xmm0
        mov     edi,dword ptr [__texture_height]
        dec     edi
        cvtsi2ss        xmm0,edi
        mulss   xmm0,xmm3
        cvttss2si       edi,xmm0
        imul    edi,dword ptr [__texture_width]
        add     edi,ebx
        sal     edi,2
        add     edi,dword ptr [__texture_data]
        mov     edi,[edi]
; end of inline function _tex2d
        mov     ebx,edi
        sar     ebx,24
        and     ebx,255
        cmp     ebx,0
        je      label0003
        cvtsi2ss        xmm0,ebx
        divss   xmm0,dword ptr [___unnamed_float_6]
        mov     ebx,eax
        mov     ebx,[ebx]
        mov     ecx,ebx
        and     ecx,65280
        sar     ecx,8
        and     ebx,255
        mov     edx,edi
        and     edx,65280
        sar     edx,8
        and     edi,255
        cvtsi2ss        xmm2,edx
        mulss   xmm2,xmm0
        cvtsi2ss        xmm3,ecx
        movss   xmm1,dword ptr [___unnamed_float_1]
        subss   xmm1,xmm0
        mulss   xmm3,xmm1
        addss   xmm2,xmm3
        cvttss2si       ecx,xmm2
        mov     edx,ecx
        cvtsi2ss        xmm1,edi
        mulss   xmm1,xmm0
        cvtsi2ss        xmm2,ebx
        movss   xmm3,dword ptr [___unnamed_float_1]
        subss   xmm3,xmm0
        mulss   xmm2,xmm3
        addss   xmm1,xmm2
        cvttss2si       ecx,xmm1
        mov     edi,ecx
        sal     edx,8
        add     edx,edi
        mov     ecx,eax
        mov     [ecx],edx
label0003:
        addss   xmm4,xmm6
        addss   xmm5,xmm7
        add     eax,4
        mov     ebx,eax
        cmp     ebx,esi
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
        sub     esp,140
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
        lea     edi,[eax]
        mov     [ebp+16],esi
        lea     esi,[ecx]
        mov     ecx,6
        rep     movsd
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
        movss   dword ptr [ebp-140],xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        movss   dword ptr [ebp-128],xmm1
        movss   xmm1,dword ptr [ebp-140]
        divss   xmm1,dword ptr [ebp-128]
; start of inline function vec4f_mul
        movss   xmm2,xmm1
        lea     eax,[ebp-40]
        mov     ecx,eax
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,xmm2
        movss   dword ptr [ecx],xmm0
        mov     ecx,eax
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,xmm2
        movss   dword ptr [ecx+4],xmm0
        mov     ecx,eax
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,xmm2
        movss   dword ptr [ecx+8],xmm0
        movss   xmm0,dword ptr [eax+12]
        mulss   xmm0,xmm2
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
        mov     [ebp+8],edx
label0002:
        mov     eax,[ebp+8]
        mov     ecx,[eax+192]
        inc     dword ptr [eax+192]
        imul    ecx,24
        mov     eax,[ebp+8]
        add     eax,ecx
        mov     ecx,[ebp+8]
        lea     edi,[eax]
        lea     esi,[ecx]
        mov     ecx,6
        rep     movsd
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
        movss   xmm7,dword ptr [___unnamed_float_1]
        mov     eax,edi
        movss   xmm6,dword ptr [eax+8]
        mov     eax,edi
        movss   xmm5,dword ptr [eax+4]
        movss   xmm4,dword ptr [edi]
        lea     eax,[ebp-16]
        mov     edi,eax
        movss   dword ptr [edi],xmm4
        mov     edi,eax
        movss   dword ptr [edi+4],xmm5
        mov     edi,eax
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [eax+12],xmm7
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        mov     edi,(offset __mvproj_matrix)
        lea     eax,[ebp-16]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm4,dword ptr [ecx+4]
        mulss   xmm4,dword ptr [edx+16]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx]
        mulss   xmm5,dword ptr [edx]
        addss   xmm5,xmm4
        mov     ecx,eax
        mov     edx,edi
        movss   xmm4,dword ptr [ecx+8]
        mulss   xmm4,dword ptr [edx+32]
        addss   xmm5,xmm4
        mov     ecx,eax
        mov     edx,edi
        movss   xmm4,dword ptr [ecx+12]
        mulss   xmm4,dword ptr [edx+48]
        addss   xmm5,xmm4
        mov     ecx,esi
        movss   dword ptr [ecx],xmm5
        mov     ecx,edi
        mov     edx,eax
        movss   xmm4,dword ptr [edx]
        mulss   xmm4,dword ptr [ecx+4]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx+4]
        mulss   xmm5,dword ptr [edx+20]
        addss   xmm4,xmm5
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx+8]
        mulss   xmm5,dword ptr [edx+36]
        addss   xmm4,xmm5
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx+12]
        mulss   xmm5,dword ptr [edx+52]
        addss   xmm4,xmm5
        mov     ecx,esi
        movss   dword ptr [ecx+4],xmm4
        mov     ecx,edi
        mov     edx,eax
        movss   xmm4,dword ptr [edx]
        mulss   xmm4,dword ptr [ecx+8]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx+4]
        mulss   xmm5,dword ptr [edx+24]
        addss   xmm4,xmm5
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx+8]
        mulss   xmm5,dword ptr [edx+40]
        addss   xmm4,xmm5
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx+12]
        mulss   xmm5,dword ptr [edx+56]
        addss   xmm4,xmm5
        mov     ecx,esi
        movss   dword ptr [ecx+8],xmm4
        mov     ecx,edi
        mov     edx,eax
        movss   xmm4,dword ptr [edx]
        mulss   xmm4,dword ptr [ecx+12]
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx+4]
        mulss   xmm5,dword ptr [edx+28]
        addss   xmm4,xmm5
        mov     ecx,eax
        mov     edx,edi
        movss   xmm5,dword ptr [ecx+8]
        mulss   xmm5,dword ptr [edx+44]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [eax+12]
        mulss   xmm5,dword ptr [edi+60]
        addss   xmm4,xmm5
        movss   dword ptr [esi+12],xmm4
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
        sub     esp,728
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
        lea     edi,[eax]
        lea     esi,[ebp-196]
        mov     ecx,6
        rep     movsd
        lea     eax,[ebp-196]
        add     eax,192
        mov     dword ptr [eax],4
; start of inline function _rasterize_polygon_4f
        lea     eax,[ebp-196]
; start of inline function _clip_poligon
        mov     ecx,eax
        mov     [ebp-200],eax
        mov     [ebp-464],ecx
        lea     ebx,dword ptr [__clip_z_far_norm]
        push    ebx
        lea     ebx,dword ptr [__clip_z_far_base]
        push    ebx
        push    dword ptr [ebp-464]
        lea     ebx,[ebp-660]
        push    ebx
        call    __clip_on_plain
        add     esp,16
        lea     ebx,dword ptr [__clip_z_near_norm]
        push    ebx
        lea     ebx,dword ptr [__clip_z_near_base]
        push    ebx
        lea     ebx,[ebp-660]
        push    ebx
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        lea     ebx,dword ptr [__clip_plane_left_norm]
        push    ebx
        lea     ebx,dword ptr [__clip_plane_left_base]
        push    ebx
        push    dword ptr [ebp-464]
        lea     ebx,[ebp-660]
        push    ebx
        call    __clip_on_plain
        add     esp,16
        lea     ebx,dword ptr [__clip_plane_right_norm]
        push    ebx
        lea     ebx,dword ptr [__clip_plane_right_base]
        push    ebx
        lea     ebx,[ebp-660]
        push    ebx
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        lea     ebx,dword ptr [__clip_plane_top_norm]
        push    ebx
        lea     ebx,dword ptr [__clip_plane_top_base]
        push    ebx
        push    dword ptr [ebp-464]
        lea     ebx,[ebp-660]
        push    ebx
        call    __clip_on_plain
        add     esp,16
        lea     ebx,dword ptr [__clip_plane_bottom_norm]
        push    ebx
        lea     ebx,dword ptr [__clip_plane_bottom_base]
        push    ebx
        lea     ebx,[ebp-660]
        push    ebx
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        mov     ebx,[ebp-464]
        cmp     dword ptr [ebx+192],1
        setg    bl
        movzx   ebx,bl
; end of inline function _clip_poligon
        cmp     ebx,0
        jne     label0000
        jmp     label002d
label0000:
        mov     ebx,[ebp-200]
        cmp     dword ptr [ebx+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     edi,0
label0003:
        mov     ebx,[ebp-200]
        mov     ebx,[ebx+192]
        cmp     ebx,edi
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     ebx,[ebp-200]
        mov     esi,edi
        imul    esi,24
        add     ebx,esi
        lea     esi,[ebp-332]
        mov     eax,edi
        sal     eax,4
        add     esi,eax
; start of inline function matrix4f_transform
        mov     eax,(offset __viewport_matrix)
        lea     ecx,[ebp-688]
        mov     edx,ebx
        mov     [ebp-336],edi
        mov     edi,eax
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [edi+16]
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        mov     edx,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [edi+32]
        addss   xmm1,xmm0
        mov     edx,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [edi+48]
        addss   xmm1,xmm0
        mov     edx,ecx
        movss   dword ptr [edx],xmm1
        mov     edx,eax
        mov     edi,ebx
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [edx+4]
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [edi+20]
        addss   xmm0,xmm1
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [edi+36]
        addss   xmm0,xmm1
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [edi+52]
        addss   xmm0,xmm1
        mov     edx,ecx
        movss   dword ptr [edx+4],xmm0
        mov     edx,eax
        mov     edi,ebx
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [edx+8]
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [edi+24]
        addss   xmm0,xmm1
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [edi+40]
        addss   xmm0,xmm1
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [edi+56]
        addss   xmm0,xmm1
        mov     edx,ecx
        movss   dword ptr [edx+8],xmm0
        mov     edx,eax
        mov     edi,ebx
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [edx+12]
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [edi+28]
        addss   xmm0,xmm1
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [edi+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebx+12]
        mulss   xmm1,dword ptr [eax+60]
        addss   xmm0,xmm1
        movss   dword ptr [ecx+12],xmm0
; end of inline function matrix4f_transform
        lea     eax,[ebp-688]
        add     eax,12
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [eax]
        movss   xmm1,dword ptr [ebp-688]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
        mov     ecx,esi
        mov     [ecx],eax
        lea     eax,[ebp-688]
        add     eax,4
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,xmm0
        cvttss2si       eax,xmm1
        mov     ecx,esi
        mov     [ecx+4],eax
        mov     eax,esi
        cmp     dword ptr [eax],0
        jl      label002a
        mov     eax,esi
        mov     eax,[eax]
        cmp     eax,dword ptr [__width]
        jge     label002a
        mov     eax,esi
        cmp     dword ptr [eax+4],0
        jl      label002a
        mov     esi,[esi+4]
        cmp     esi,dword ptr [__height]
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
        mov     ebx,[ebp-200]
        mov     ebx,[ebx+192]
        dec     ebx
        cmp     ebx,edi
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     ebx,[ebp-332]
        mov     esi,edi
        sal     esi,4
        add     ebx,esi
        mov     esi,edi
        dec     esi
        sal     esi,4
        lea     eax,[ebp-332]
        add     eax,esi
        lea     esi,[ebp-332]
        lea     ecx,[esi+4]
        lea     edx,[eax+4]
        mov     ecx,[ecx]
        cmp     ecx,[edx]
        jle     label0008
        mov     [ebp-352],esi
        mov     esi,eax
        mov     eax,[ebp-352]
label0008:
        lea     ecx,[esi+4]
        lea     edx,[ebx+4]
        mov     ecx,[ecx]
        cmp     ecx,[edx]
        jle     label0009
        mov     [ebp-352],esi
        mov     esi,ebx
        mov     ecx,[ebp-352]
        mov     ebx,ecx
label0009:
        lea     ecx,[eax+4]
        lea     edx,[ebx+4]
        mov     ecx,[ecx]
        cmp     ecx,[edx]
        jle     label000a
        mov     [ebp-348],esi
        mov     esi,eax
        mov     eax,ebx
        mov     ebx,esi
        mov     esi,[ebp-348]
label000a:
        lea     ecx,[esi+4]
        lea     edx,[ebx+4]
        mov     ecx,[ecx]
        cmp     ecx,[edx]
        jne     label000b
        lea     ecx,[esi+4]
        cmp     dword ptr [ecx],0
        jl      label000c
        lea     ecx,[esi+4]
        mov     ecx,[ecx]
        cmp     ecx,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   xmm6,dword ptr [___unnamed_float_2]
        mov     ecx,8
        add     ecx,ebx
        mov     edx,8
        add     edx,eax
        mov     [ebp-336],edi
        mov     edi,8
        add     edi,esi
        mov     [ebp-440],edx
        lea     edx,[esi+4]
        mov     edx,[edx]
        mov     ebx,[ebx]
        mov     eax,[eax]
        mov     esi,[esi]
        mov     [ebp-436],ecx
        mov     ecx,esi
        cmp     ecx,eax
        jge     label001c
        mov     ecx,ebx
        cmp     ecx,eax
        jle     label001d
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     eax,edi
        push    dword ptr [eax+4]
        push    dword ptr [edi]
        push    edx
        push    ebx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
        mov     eax,[ebp-456]
        mov     edi,[ebp-444]
label001d:
        mov     ecx,ebx
        cmp     ecx,esi
        jge     label001f
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
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
        jmp     label0020
label001f:
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     ecx,edi
        push    dword ptr [ecx+4]
        push    dword ptr [edi]
        push    edx
        push    eax
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
        mov     eax,[ebp-456]
label001c:
        mov     ecx,ebx
        cmp     ecx,eax
        jge     label0022
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     eax,[ebp-436]
        push    dword ptr [eax+4]
        mov     eax,[ebp-436]
        push    dword ptr [eax]
        push    edx
        push    esi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
        mov     eax,[ebp-456]
        movss   xmm6,dword ptr [ebp-432]
        movss   xmm7,dword ptr [ebp-428]
label0022:
        mov     ecx,ebx
        cmp     ecx,esi
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
        push    edx
        push    ebx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
        movss   xmm6,dword ptr [ebp-432]
        movss   xmm7,dword ptr [ebp-428]
label0024:
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
        push    edx
        push    esi
        push    eax
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
        lea     ecx,[esi+4]
        mov     ecx,[ecx]
label000e:
        lea     edx,[eax+4]
        mov     edx,[edx]
        cmp     edx,ecx
        jle     label000f
        lea     edx,[esi+4]
        mov     [ebp-344],eax
        mov     eax,ecx
        sub     eax,[edx]
        mov     edx,[ebp-344]
        mov     [ebp-336],edi
        mov     edi,esi
        mov     edx,[edx]
        sub     edx,[edi]
        imul    eax,edx
        mov     [ebp-708],eax
        mov     eax,[ebp-344]
        lea     edx,[eax+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-712],edx
        mov     [ebp-344],eax
        mov     eax,[ebp-708]
        cdq
        idiv    dword ptr [ebp-712]
        mov     edx,esi
        add     eax,[edx]
        lea     edx,[esi+4]
        mov     [ebp-356],eax
        mov     eax,ecx
        sub     eax,[edx]
        mov     edx,ebx
        mov     edi,esi
        mov     edx,[edx]
        sub     edx,[edi]
        imul    eax,edx
        lea     edx,[ebx+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-716],edx
        cdq
        idiv    dword ptr [ebp-716]
        mov     edx,esi
        add     eax,[edx]
        lea     edx,[esi+4]
        mov     edi,ecx
        sub     edi,[edx]
        cvtsi2ss        xmm0,edi
        mov     edx,[ebp-344]
        mov     edi,esi
        movss   xmm1,dword ptr [edx+8]
        subss   xmm1,dword ptr [edi+8]
        mulss   xmm0,xmm1
        mov     [ebp-360],eax
        mov     eax,[ebp-344]
        lea     edx,[eax+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        mov     edx,esi
        addss   xmm0,dword ptr [edx+8]
        lea     edx,[esi+4]
        mov     edi,ecx
        sub     edi,[edx]
        cvtsi2ss        xmm1,edi
        mov     edx,ebx
        mov     edi,esi
        movss   xmm2,dword ptr [edx+8]
        subss   xmm2,dword ptr [edi+8]
        mulss   xmm1,xmm2
        lea     edx,[ebx+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        cvtsi2ss        xmm2,edx
        divss   xmm1,xmm2
        mov     edx,esi
        addss   xmm1,dword ptr [edx+8]
        lea     edx,[esi+4]
        mov     edi,ecx
        sub     edi,[edx]
        cvtsi2ss        xmm2,edi
        mov     edx,8
        add     edx,eax
        add     edx,4
        mov     edi,8
        add     edi,esi
        add     edi,4
        movss   xmm3,dword ptr [edx]
        subss   xmm3,dword ptr [edi]
        mulss   xmm2,xmm3
        lea     edx,[eax+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        cvtsi2ss        xmm3,edx
        divss   xmm2,xmm3
        mov     edx,8
        add     edx,esi
        add     edx,4
        addss   xmm2,dword ptr [edx]
        lea     edx,[esi+4]
        mov     edi,ecx
        sub     edi,[edx]
        cvtsi2ss        xmm3,edi
        mov     edx,8
        add     edx,ebx
        add     edx,4
        mov     edi,8
        add     edi,esi
        add     edi,4
        movss   xmm4,dword ptr [edx]
        subss   xmm4,dword ptr [edi]
        mulss   xmm3,xmm4
        lea     edx,[ebx+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        cvtsi2ss        xmm4,edx
        divss   xmm3,xmm4
        mov     edx,8
        add     edx,esi
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
        mov     edx,ecx
        mov     edi,[ebp-360]
        mov     [ebp-340],ebx
        mov     ebx,[ebp-356]
        mov     [ebp-348],esi
        mov     esi,ebx
        cmp     esi,edi
        jg      label0013
        mov     [ebp-364],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    edx
        push    edi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
        mov     eax,[ebp-344]
        mov     ecx,[ebp-364]
label0013:
        mov     [ebp-344],eax
        mov     [ebp-364],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    edx
        push    ebx
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-364]
        mov     eax,[ebp-344]
        mov     ecx,[ebp-364]
        mov     ebx,[ebp-340]
        mov     esi,[ebp-348]
        mov     edi,[ebp-336]
        jmp     label000e
label000f:
        lea     ecx,[eax+4]
        lea     edx,[esi+4]
        mov     [ebp-344],eax
        mov     eax,[ecx]
        sub     eax,[edx]
        mov     ecx,ebx
        mov     edx,esi
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        lea     ecx,[ebx+4]
        lea     edx,[esi+4]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        mov     ecx,esi
        add     eax,[ecx]
        mov     [ebp-360],eax
        mov     eax,[ebp-344]
        lea     ecx,[eax+4]
        lea     edx,[esi+4]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cvtsi2ss        xmm0,ecx
        mov     ecx,ebx
        mov     edx,esi
        movss   xmm1,dword ptr [ecx+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        lea     ecx,[ebx+4]
        lea     edx,[esi+4]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        mov     ecx,esi
        addss   xmm0,dword ptr [ecx+8]
        movss   xmm1,xmm0
        lea     ecx,[eax+4]
        lea     edx,[esi+4]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cvtsi2ss        xmm0,ecx
        mov     ecx,8
        add     ecx,ebx
        add     ecx,4
        mov     edx,8
        add     edx,esi
        add     edx,4
        movss   xmm2,dword ptr [ecx]
        subss   xmm2,dword ptr [edx]
        mulss   xmm0,xmm2
        lea     ecx,[ebx+4]
        lea     edx,[esi+4]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cvtsi2ss        xmm2,ecx
        divss   xmm0,xmm2
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        addss   xmm0,dword ptr [ecx]
        movss   xmm3,xmm0
        mov     ecx,eax
        movss   xmm0,xmm1
        subss   xmm0,dword ptr [ecx+8]
        mov     ecx,eax
        mov     edx,[ebp-360]
        sub     edx,[ecx]
        cvtsi2ss        xmm2,edx
        divss   xmm0,xmm2
        movss   xmm5,xmm0
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        movss   xmm0,xmm3
        subss   xmm0,dword ptr [ecx]
        mov     ecx,eax
        mov     edx,[ebp-360]
        sub     edx,[ecx]
        cvtsi2ss        xmm2,edx
        divss   xmm0,xmm2
        movss   xmm6,xmm0
; start of inline function _rasterize_horiz_line__unordered
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        movss   dword ptr [ebp-380],xmm3
        movss   xmm3,dword ptr [ecx]
        mov     ecx,eax
        movss   dword ptr [ebp-376],xmm1
        movss   xmm1,dword ptr [ecx+8]
        movss   xmm2,dword ptr [ebp-380]
        movss   xmm0,dword ptr [ebp-376]
        lea     ecx,[eax+4]
        mov     ecx,[ecx]
        mov     edx,ecx
        mov     ecx,eax
        mov     ecx,[ecx]
        mov     [ebp-336],edi
        mov     edi,ecx
        mov     ecx,[ebp-360]
        mov     [ebp-340],ebx
        mov     ebx,ecx
        mov     ecx,ebx
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
        push    edx
        push    edi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
        mov     eax,[ebp-344]
label0016:
        mov     [ebp-344],eax
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    edx
        push    ebx
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     eax,[ebp-344]
        lea     ecx,[eax+4]
        mov     edx,1
        add     edx,[ecx]
        mov     ecx,edx
label0011:
        mov     ebx,[ebp-340]
        lea     edx,[ebx+4]
        mov     edx,[edx]
        cmp     edx,ecx
        jle     label0012
        lea     edx,[eax+4]
        mov     [ebp-344],eax
        mov     eax,ecx
        sub     eax,[edx]
        mov     edx,ebx
        mov     edi,[ebp-344]
        mov     edx,[edx]
        sub     edx,[edi]
        imul    eax,edx
        lea     edx,[ebx+4]
        mov     [ebp-720],eax
        mov     eax,[ebp-344]
        lea     edi,[eax+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-724],edx
        mov     [ebp-344],eax
        mov     eax,[ebp-720]
        cdq
        idiv    dword ptr [ebp-724]
        mov     edx,[ebp-344]
        add     eax,[edx]
        lea     edx,[esi+4]
        mov     [ebp-356],eax
        mov     eax,ecx
        sub     eax,[edx]
        mov     edx,ebx
        mov     edi,esi
        mov     edx,[edx]
        sub     edx,[edi]
        imul    eax,edx
        lea     edx,[ebx+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-728],edx
        cdq
        idiv    dword ptr [ebp-728]
        mov     edx,esi
        add     eax,[edx]
        mov     [ebp-360],eax
        mov     eax,[ebp-344]
        lea     edx,[eax+4]
        mov     edi,ecx
        sub     edi,[edx]
        cvtsi2ss        xmm0,edi
        mov     edx,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [edx+8]
        subss   xmm1,dword ptr [edi+8]
        mulss   xmm0,xmm1
        lea     edx,[ebx+4]
        lea     edi,[eax+4]
        mov     edx,[edx]
        sub     edx,[edi]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        mov     edx,eax
        addss   xmm0,dword ptr [edx+8]
        lea     edx,[esi+4]
        mov     edi,ecx
        sub     edi,[edx]
        cvtsi2ss        xmm1,edi
        mov     edx,ebx
        mov     edi,esi
        movss   xmm2,dword ptr [edx+8]
        subss   xmm2,dword ptr [edi+8]
        mulss   xmm1,xmm2
        lea     edx,[ebx+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        cvtsi2ss        xmm2,edx
        divss   xmm1,xmm2
        mov     edx,esi
        addss   xmm1,dword ptr [edx+8]
        lea     edx,[eax+4]
        mov     edi,ecx
        sub     edi,[edx]
        cvtsi2ss        xmm2,edi
        mov     edx,8
        add     edx,ebx
        add     edx,4
        mov     edi,8
        add     edi,eax
        add     edi,4
        movss   xmm3,dword ptr [edx]
        subss   xmm3,dword ptr [edi]
        mulss   xmm2,xmm3
        lea     edx,[ebx+4]
        lea     edi,[eax+4]
        mov     edx,[edx]
        sub     edx,[edi]
        cvtsi2ss        xmm3,edx
        divss   xmm2,xmm3
        mov     edx,8
        add     edx,eax
        add     edx,4
        addss   xmm2,dword ptr [edx]
        lea     edx,[esi+4]
        mov     edi,ecx
        sub     edi,[edx]
        cvtsi2ss        xmm3,edi
        mov     edx,8
        add     edx,ebx
        add     edx,4
        mov     edi,8
        add     edi,esi
        add     edi,4
        movss   xmm5,dword ptr [edx]
        subss   xmm5,dword ptr [edi]
        mulss   xmm3,xmm5
        lea     edx,[ebx+4]
        lea     edi,[esi+4]
        mov     edx,[edx]
        sub     edx,[edi]
        cvtsi2ss        xmm5,edx
        divss   xmm3,xmm5
        mov     edx,8
        add     edx,esi
        add     edx,4
        addss   xmm3,dword ptr [edx]
        mov     edx,[ebp-360]
        sub     edx,[ebp-356]
        cvtsi2ss        xmm5,edx
        movss   xmm6,xmm1
        subss   xmm6,xmm0
        divss   xmm6,xmm5
        movss   xmm5,xmm6
        mov     edx,[ebp-360]
        sub     edx,[ebp-356]
        cvtsi2ss        xmm6,edx
        movss   xmm4,xmm3
        subss   xmm4,xmm2
        divss   xmm4,xmm6
        movss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     edx,ecx
        mov     edi,[ebp-360]
        mov     [ebp-344],eax
        mov     eax,[ebp-356]
        mov     [ebp-340],ebx
        mov     ebx,eax
        mov     eax,ebx
        cmp     eax,edi
        jg      label0019
        mov     [ebp-364],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    edx
        push    edi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
        mov     ecx,[ebp-364]
label0019:
        mov     [ebp-364],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    edx
        push    ebx
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-364]
        mov     eax,[ebp-344]
        mov     ecx,[ebp-364]
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
        add     esp,728
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
