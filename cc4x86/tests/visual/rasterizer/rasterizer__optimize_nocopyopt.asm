
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
        mov     edx,edi
        mov     dword ptr [__pitch],edx
; start of inline function matrix4f_make_perspective
        cvtsi2ss        xmm0,ebx
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        movss   xmm1,xmm0
        movss   xmm0,xmm6
        movss   xmm4,xmm5
        mov     edi,(offset __mvproj_matrix)
        mulss   xmm7,xmm4
        movss   xmm2,xmm7
        mulss   xmm2,xmm1
        mov     edx,edi
        movss   xmm1,xmm4
        divss   xmm1,xmm2
        movss   dword ptr [edx],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+4],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+8],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+12],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+16],xmm1
        mov     edx,edi
        movss   xmm1,xmm4
        divss   xmm1,xmm7
        movss   dword ptr [edx+20],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+24],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+28],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+32],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+36],xmm1
        mov     edx,edi
        movss   xmm1,xmm0
        subss   xmm1,xmm4
        movss   xmm2,xmm0
        divss   xmm2,xmm1
        movss   dword ptr [edx+40],xmm2
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_1]
        movss   dword ptr [edx+44],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+48],xmm1
        mov     edx,edi
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+52],xmm1
        mov     edx,edi
        movss   xmm1,xmm4
        mulss   xmm1,xmm0
        movss   xmm2,xmm4
        subss   xmm2,xmm0
        divss   xmm1,xmm2
        movss   dword ptr [edx+56],xmm1
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+60],xmm0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   xmm7,xmm6
        movss   xmm4,xmm5
        cvtsi2ss        xmm0,esi
        movss   xmm2,xmm0
        cvtsi2ss        xmm0,ebx
        movss   xmm1,xmm0
        mov     edi,(offset __viewport_matrix)
        mov     edx,edi
        movss   xmm0,xmm1
        divss   xmm0,dword ptr [___unnamed_float_3]
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
        movss   xmm0,xmm2
        xorps   xmm0,dword ptr [___unnamed_float_4]
        divss   xmm0,dword ptr [___unnamed_float_3]
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
        movss   xmm0,xmm7
        subss   xmm0,xmm4
        movss   dword ptr [edx+40],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edx+44],xmm0
        mov     edx,edi
        movss   xmm0,xmm1
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [edx+48],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [edx+52],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+56],xmm0
        mov     edx,edi
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edx+60],xmm0
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,xmm5
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_base)
        mov     edx,edi
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
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
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,xmm6
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_base)
        mov     edx,edi
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_assign
        movss   xmm0,xmm6
        comiss  xmm0,xmm5
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
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
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
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_1]
        mov     edi,(offset __clip_plane_left_norm)
        mov     edx,edi
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
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
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_5]
        mov     edi,(offset __clip_plane_right_norm)
        mov     edx,edi
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
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
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_norm)
        mov     edx,edi
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_base)
        mov     edx,edi
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_5]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_norm)
        mov     edx,edi
        movss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        mov     edx,edi
        movss   xmm0,xmm2
        movss   dword ptr [edx+4],xmm0
        mov     edx,edi
        movss   xmm0,xmm4
        movss   dword ptr [edx+8],xmm0
        mov     edx,edi
        movss   xmm0,xmm7
        movss   dword ptr [edx+12],xmm0
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
        mov     edi,eax
        mov     eax,esi
        sal     eax,2
        add     eax,edi
        sal     ebx,2
        sub     eax,ebx
        mov     esi,eax
label0000:
; start of inline function _tex2d
        movss   xmm3,xmm5
        movss   xmm2,xmm4
        mov     eax,dword ptr [__texture_width]
        dec     eax
        cvtsi2ss        xmm0,eax
        mulss   xmm0,xmm2
        cvttss2si       eax,xmm0
        mov     ebx,eax
        mov     eax,dword ptr [__texture_height]
        dec     eax
        cvtsi2ss        xmm0,eax
        mulss   xmm0,xmm3
        cvttss2si       eax,xmm0
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
        cmp     eax,0
        je      label0003
        cvtsi2ss        xmm0,eax
        divss   xmm0,dword ptr [___unnamed_float_6]
        movss   xmm3,xmm0
        mov     eax,edi
        mov     eax,[eax]
        mov     ecx,eax
        and     ecx,65280
        sar     ecx,8
        and     eax,255
        mov     edx,ebx
        and     edx,65280
        sar     edx,8
        and     ebx,255
        cvtsi2ss        xmm0,edx
        mulss   xmm0,xmm3
        cvtsi2ss        xmm2,ecx
        movss   xmm1,dword ptr [___unnamed_float_1]
        subss   xmm1,xmm3
        mulss   xmm2,xmm1
        addss   xmm0,xmm2
        cvttss2si       ecx,xmm0
        mov     edx,ecx
        cvtsi2ss        xmm0,ebx
        mulss   xmm0,xmm3
        cvtsi2ss        xmm1,eax
        movss   xmm2,dword ptr [___unnamed_float_1]
        subss   xmm2,xmm3
        mulss   xmm1,xmm2
        addss   xmm0,xmm1
        cvttss2si       eax,xmm0
        mov     ebx,eax
        mov     eax,edx
        sal     eax,8
        add     eax,ebx
        mov     ebx,eax
        mov     eax,edi
        mov     ecx,ebx
        mov     [eax],ecx
label0003:
        movss   xmm0,xmm4
        addss   xmm0,xmm6
        movss   xmm4,xmm0
        movss   xmm0,xmm5
        addss   xmm0,xmm7
        movss   xmm5,xmm0
        add     edi,4
        mov     eax,edi
        cmp     eax,esi
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
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        movss   dword ptr [eax+4],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     eax,ebx
        movss   dword ptr [eax+8],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+12]
        subss   xmm0,dword ptr [ecx+12]
        mov     eax,ebx
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mov     edi,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        mulss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+8]
        mulss   xmm0,dword ptr [ecx+8]
        addss   xmm1,xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+12]
        mulss   xmm0,dword ptr [ecx+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        mov     eax,esi
        mov     edi,eax
        mov     eax,[ebp-8]
        mov     edx,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        movss   dword ptr [eax+4],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     eax,ebx
        movss   dword ptr [eax+8],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+12]
        subss   xmm0,dword ptr [ecx+12]
        mov     eax,ebx
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mov     edi,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        mulss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm2,dword ptr [eax]
        mulss   xmm2,dword ptr [ecx]
        addss   xmm2,xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+8]
        mulss   xmm0,dword ptr [ecx+8]
        addss   xmm2,xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+12]
        mulss   xmm0,dword ptr [ecx+12]
        addss   xmm2,xmm0
        movss   dword ptr [ebp-52],xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        movss   xmm2,xmm1
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
        comiss  xmm0,xmm2
        ja      label0005
label0006:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm2
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        jbe     label0004
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
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        movss   dword ptr [eax+4],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     eax,ebx
        movss   dword ptr [eax+8],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+12]
        subss   xmm0,dword ptr [ecx+12]
        mov     eax,ebx
        movss   dword ptr [eax+12],xmm0
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
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,ebx
        movss   dword ptr [eax],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        movss   dword ptr [eax+4],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     eax,ebx
        movss   dword ptr [eax+8],xmm0
        mov     eax,edx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+12]
        subss   xmm0,dword ptr [ecx+12]
        mov     eax,ebx
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mov     edi,eax
        lea     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        mulss   xmm0,dword ptr [ecx+4]
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+8]
        mulss   xmm0,dword ptr [ecx+8]
        addss   xmm1,xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+12]
        mulss   xmm0,dword ptr [ecx+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
        movss   xmm0,xmm1
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mov     edi,eax
        lea     eax,[ebp-40]
        mov     ebx,eax
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm1,dword ptr [eax+4]
        mulss   xmm1,dword ptr [ecx+4]
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm2,dword ptr [eax]
        mulss   xmm2,dword ptr [ecx]
        addss   xmm2,xmm1
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm1,dword ptr [eax+8]
        mulss   xmm1,dword ptr [ecx+8]
        addss   xmm2,xmm1
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm1,dword ptr [eax+12]
        mulss   xmm1,dword ptr [ecx+12]
        addss   xmm2,xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        divss   xmm0,xmm1
        movss   xmm2,xmm0
; start of inline function vec4f_mul
        movss   xmm1,xmm2
        lea     eax,[ebp-40]
        mov     edi,eax
        mov     eax,edi
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,xmm1
        movss   dword ptr [eax],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [eax+4]
        mulss   xmm0,xmm1
        movss   dword ptr [eax+4],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [eax+8]
        mulss   xmm0,xmm1
        movss   dword ptr [eax+8],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [eax+12]
        mulss   xmm0,xmm1
        movss   dword ptr [eax+12],xmm0
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
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        mov     eax,edx
        movss   dword ptr [eax],xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        addss   xmm0,dword ptr [ecx+4]
        mov     eax,edx
        movss   dword ptr [eax+4],xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+8]
        addss   xmm0,dword ptr [ecx+8]
        mov     eax,edx
        movss   dword ptr [eax+8],xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+12]
        addss   xmm0,dword ptr [ecx+12]
        mov     eax,edx
        movss   dword ptr [eax+12],xmm0
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
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     eax,edx
        movss   dword ptr [eax],xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     eax,edx
        movss   dword ptr [eax+4],xmm0
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        lea     eax,[ebp-48]
        mov     edi,eax
        mov     eax,edi
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,xmm2
        movss   dword ptr [eax],xmm0
        mov     eax,edi
        movss   xmm0,dword ptr [eax+4]
        mulss   xmm0,xmm2
        movss   dword ptr [eax+4],xmm0
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
        movss   xmm0,dword ptr [eax]
        addss   xmm0,dword ptr [ecx]
        mov     eax,edx
        movss   dword ptr [eax],xmm0
        mov     eax,ebx
        mov     ecx,edi
        movss   xmm0,dword ptr [eax+4]
        addss   xmm0,dword ptr [ecx+4]
        mov     eax,edx
        movss   dword ptr [eax+4],xmm0
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
        movss   xmm7,dword ptr [___unnamed_float_1]
        mov     eax,edi
        movss   xmm6,dword ptr [eax+8]
        mov     eax,edi
        movss   xmm5,dword ptr [eax+4]
        mov     eax,edi
        movss   xmm4,dword ptr [eax]
        lea     eax,[ebp-16]
        mov     edi,eax
        mov     eax,edi
        movss   dword ptr [eax],xmm4
        mov     eax,edi
        movss   xmm4,xmm5
        movss   dword ptr [eax+4],xmm4
        mov     eax,edi
        movss   xmm4,xmm6
        movss   dword ptr [eax+8],xmm4
        mov     eax,edi
        movss   xmm4,xmm7
        movss   dword ptr [eax+12],xmm4
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
        mov     ecx,edi
        movss   xmm5,dword ptr [eax+12]
        mulss   xmm5,dword ptr [ecx+60]
        addss   xmm4,xmm5
        mov     eax,esi
        movss   dword ptr [eax+12],xmm4
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
        sub     esp,792
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
        lea     edi,[eax]
        lea     esi,[ebp-196]
        mov     ecx,6
        rep     movsd
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
        movss   xmm0,dword ptr [edi+4]
        mulss   xmm0,dword ptr [esi+16]
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [edi+32]
        addss   xmm1,xmm0
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [edi+48]
        addss   xmm1,xmm0
        mov     esi,edx
        movss   dword ptr [esi],xmm1
        mov     esi,eax
        mov     edi,ebx
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [esi+4]
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [edi+20]
        addss   xmm0,xmm1
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [edi+36]
        addss   xmm0,xmm1
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [edi+52]
        addss   xmm0,xmm1
        mov     esi,edx
        movss   dword ptr [esi+4],xmm0
        mov     esi,eax
        mov     edi,ebx
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [esi+8]
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [edi+24]
        addss   xmm0,xmm1
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [edi+40]
        addss   xmm0,xmm1
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [edi+56]
        addss   xmm0,xmm1
        mov     esi,edx
        movss   dword ptr [esi+8],xmm0
        mov     esi,eax
        mov     edi,ebx
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [esi+12]
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [edi+28]
        addss   xmm0,xmm1
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [edi+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebx+12]
        mulss   xmm1,dword ptr [eax+60]
        addss   xmm0,xmm1
        mov     eax,edx
        movss   dword ptr [eax+12],xmm0
; end of inline function matrix4f_transform
        lea     eax,[ebp-688]
        add     eax,12
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [eax]
        movss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-688]
        mulss   xmm0,xmm1
        cvttss2si       eax,xmm0
        mov     edx,ecx
        mov     [edx],eax
        lea     eax,[ebp-688]
        add     eax,4
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,xmm1
        cvttss2si       eax,xmm0
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
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   xmm6,dword ptr [___unnamed_float_2]
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
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
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
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
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
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
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
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
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
        jmp     label0023
        mov     ecx,[ebp-456]
        movss   xmm6,dword ptr [ebp-432]
        movss   xmm7,dword ptr [ebp-428]
label0022:
        mov     esi,ebx
        cmp     esi,eax
        jle     label0024
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
        push    edx
        push    ebx
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
        mov     eax,[ebp-460]
        movss   xmm6,dword ptr [ebp-432]
        movss   xmm7,dword ptr [ebp-428]
label0024:
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
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
        mov     [ebp-708],eax
        mov     eax,[ebp-348]
        lea     esi,[eax+4]
        mov     edx,[edx]
        sub     edx,[esi]
        mov     [ebp-712],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-708]
        cdq
        idiv    dword ptr [ebp-712]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     esi,eax
        mov     edx,[ebp-348]
        lea     eax,[edx+4]
        mov     [ebp-716],eax
        mov     eax,edi
        mov     edx,[ebp-716]
        sub     eax,[edx]
        mov     edx,ebx
        mov     [ebp-356],esi
        mov     esi,[ebp-348]
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        lea     edx,[ebx+4]
        mov     [ebp-720],eax
        mov     eax,[ebp-348]
        lea     esi,[eax+4]
        mov     edx,[edx]
        sub     edx,[esi]
        mov     [ebp-724],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-720]
        cdq
        idiv    dword ptr [ebp-724]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     esi,eax
        mov     edx,[ebp-348]
        lea     eax,[edx+4]
        mov     edx,edi
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     eax,ecx
        mov     edx,[ebp-348]
        movss   xmm1,dword ptr [eax+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        lea     eax,[ecx+4]
        mov     [ebp-728],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-360],esi
        mov     [ebp-348],eax
        mov     eax,[ebp-728]
        mov     esi,[eax]
        sub     esi,[edx]
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        mov     eax,[ebp-348]
        addss   xmm0,dword ptr [eax+8]
        movss   xmm1,xmm0
        mov     esi,[ebp-348]
        lea     eax,[esi+4]
        mov     edx,edi
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     eax,ebx
        mov     edx,[ebp-348]
        movss   xmm2,dword ptr [eax+8]
        subss   xmm2,dword ptr [edx+8]
        mulss   xmm0,xmm2
        lea     eax,[ebx+4]
        mov     [ebp-732],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-732]
        mov     esi,[eax]
        sub     esi,[edx]
        cvtsi2ss        xmm2,esi
        divss   xmm0,xmm2
        mov     eax,[ebp-348]
        addss   xmm0,dword ptr [eax+8]
        movss   xmm2,xmm0
        mov     esi,[ebp-348]
        lea     eax,[esi+4]
        mov     edx,edi
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     eax,8
        add     eax,ecx
        add     eax,4
        mov     edx,8
        add     edx,[ebp-348]
        add     edx,4
        movss   xmm3,dword ptr [eax]
        subss   xmm3,dword ptr [edx]
        mulss   xmm0,xmm3
        lea     eax,[ecx+4]
        mov     [ebp-736],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-736]
        mov     esi,[eax]
        sub     esi,[edx]
        cvtsi2ss        xmm3,esi
        divss   xmm0,xmm3
        mov     eax,8
        add     eax,[ebp-348]
        add     eax,4
        addss   xmm0,dword ptr [eax]
        movss   xmm3,xmm0
        mov     esi,[ebp-348]
        lea     eax,[esi+4]
        mov     edx,edi
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     eax,8
        add     eax,ebx
        add     eax,4
        mov     edx,8
        add     edx,[ebp-348]
        add     edx,4
        movss   xmm4,dword ptr [eax]
        subss   xmm4,dword ptr [edx]
        mulss   xmm0,xmm4
        lea     eax,[ebx+4]
        mov     [ebp-740],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-740]
        mov     esi,[eax]
        sub     esi,[edx]
        cvtsi2ss        xmm4,esi
        divss   xmm0,xmm4
        mov     eax,8
        add     eax,[ebp-348]
        add     eax,4
        addss   xmm0,dword ptr [eax]
        movss   xmm4,xmm0
        mov     eax,[ebp-360]
        sub     eax,[ebp-356]
        cvtsi2ss        xmm0,eax
        movss   xmm5,xmm2
        subss   xmm5,xmm1
        divss   xmm5,xmm0
        mov     eax,[ebp-360]
        sub     eax,[ebp-356]
        cvtsi2ss        xmm0,eax
        movss   xmm6,xmm4
        subss   xmm6,xmm3
        divss   xmm6,xmm0
; start of inline function _rasterize_horiz_line__unordered
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
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    esi
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
        mov     ecx,[ebp-344]
label0013:
        mov     [ebp-344],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm4
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
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
        mov     [ebp-744],eax
        mov     eax,[ebp-348]
        lea     edi,[eax+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-748],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-744]
        cdq
        idiv    dword ptr [ebp-748]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     [ebp-336],esi
        mov     esi,eax
        lea     eax,[ecx+4]
        mov     [ebp-752],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-752]
        mov     edi,[eax]
        sub     edi,[edx]
        cvtsi2ss        xmm0,edi
        mov     eax,ebx
        mov     edx,[ebp-348]
        movss   xmm1,dword ptr [eax+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        lea     eax,[ebx+4]
        mov     [ebp-756],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-756]
        mov     edi,[eax]
        sub     edi,[edx]
        cvtsi2ss        xmm1,edi
        divss   xmm0,xmm1
        mov     eax,[ebp-348]
        addss   xmm0,dword ptr [eax+8]
        movss   xmm2,xmm0
        lea     eax,[ecx+4]
        mov     [ebp-760],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-760]
        mov     edi,[eax]
        sub     edi,[edx]
        cvtsi2ss        xmm0,edi
        mov     eax,8
        add     eax,ebx
        add     eax,4
        mov     edx,8
        add     edx,[ebp-348]
        add     edx,4
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [edx]
        mulss   xmm0,xmm1
        lea     eax,[ebx+4]
        mov     [ebp-764],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-764]
        mov     edi,[eax]
        sub     edi,[edx]
        cvtsi2ss        xmm1,edi
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,[ebp-348]
        add     eax,4
        addss   xmm0,dword ptr [eax]
        movss   xmm4,xmm0
        mov     eax,ecx
        movss   xmm0,xmm2
        subss   xmm0,dword ptr [eax+8]
        mov     eax,ecx
        mov     edx,esi
        sub     edx,[eax]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        movss   xmm5,xmm0
        mov     eax,8
        add     eax,ecx
        add     eax,4
        movss   xmm0,xmm4
        subss   xmm0,dword ptr [eax]
        mov     eax,ecx
        mov     edx,esi
        sub     edx,[eax]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        movss   xmm6,xmm0
; start of inline function _rasterize_horiz_line__unordered
        mov     eax,8
        add     eax,ecx
        add     eax,4
        movss   dword ptr [ebp-380],xmm4
        movss   xmm4,dword ptr [eax]
        mov     eax,ecx
        movss   dword ptr [ebp-376],xmm2
        movss   xmm2,dword ptr [eax+8]
        movss   xmm3,dword ptr [ebp-380]
        movss   xmm1,dword ptr [ebp-376]
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
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    esi
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
        mov     ecx,[ebp-344]
label0016:
        mov     [ebp-344],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm4
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
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
        mov     [ebp-768],eax
        mov     eax,edi
        mov     edx,[ebp-768]
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
        mov     [ebp-772],edx
        cdq
        idiv    dword ptr [ebp-772]
        mov     edx,ecx
        add     eax,[edx]
        mov     esi,eax
        mov     edx,[ebp-348]
        lea     eax,[edx+4]
        mov     [ebp-776],eax
        mov     eax,edi
        mov     edx,[ebp-776]
        sub     eax,[edx]
        mov     edx,ebx
        mov     [ebp-356],esi
        mov     esi,[ebp-348]
        mov     edx,[edx]
        sub     edx,[esi]
        imul    eax,edx
        lea     edx,[ebx+4]
        mov     [ebp-780],eax
        mov     eax,[ebp-348]
        lea     esi,[eax+4]
        mov     edx,[edx]
        sub     edx,[esi]
        mov     [ebp-784],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-780]
        cdq
        idiv    dword ptr [ebp-784]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     esi,eax
        lea     eax,[ecx+4]
        mov     edx,edi
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     eax,ebx
        mov     edx,ecx
        movss   xmm1,dword ptr [eax+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        lea     eax,[ebx+4]
        lea     edx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,ecx
        addss   xmm0,dword ptr [eax+8]
        movss   xmm1,xmm0
        mov     edx,[ebp-348]
        lea     eax,[edx+4]
        mov     edx,edi
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     eax,ebx
        mov     edx,[ebp-348]
        movss   xmm2,dword ptr [eax+8]
        subss   xmm2,dword ptr [edx+8]
        mulss   xmm0,xmm2
        lea     eax,[ebx+4]
        mov     [ebp-788],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-360],esi
        mov     [ebp-348],eax
        mov     eax,[ebp-788]
        mov     esi,[eax]
        sub     esi,[edx]
        cvtsi2ss        xmm2,esi
        divss   xmm0,xmm2
        mov     eax,[ebp-348]
        addss   xmm0,dword ptr [eax+8]
        movss   xmm2,xmm0
        lea     eax,[ecx+4]
        mov     edx,edi
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     eax,8
        add     eax,ebx
        add     eax,4
        mov     edx,8
        add     edx,ecx
        add     edx,4
        movss   xmm3,dword ptr [eax]
        subss   xmm3,dword ptr [edx]
        mulss   xmm0,xmm3
        lea     eax,[ebx+4]
        lea     edx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edx]
        cvtsi2ss        xmm3,eax
        divss   xmm0,xmm3
        mov     eax,8
        add     eax,ecx
        add     eax,4
        addss   xmm0,dword ptr [eax]
        movss   xmm3,xmm0
        mov     esi,[ebp-348]
        lea     eax,[esi+4]
        mov     edx,edi
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     eax,8
        add     eax,ebx
        add     eax,4
        mov     edx,8
        add     edx,[ebp-348]
        add     edx,4
        movss   xmm4,dword ptr [eax]
        subss   xmm4,dword ptr [edx]
        mulss   xmm0,xmm4
        lea     eax,[ebx+4]
        mov     [ebp-792],eax
        mov     eax,[ebp-348]
        lea     edx,[eax+4]
        mov     [ebp-348],eax
        mov     eax,[ebp-792]
        mov     esi,[eax]
        sub     esi,[edx]
        cvtsi2ss        xmm4,esi
        divss   xmm0,xmm4
        mov     eax,8
        add     eax,[ebp-348]
        add     eax,4
        addss   xmm0,dword ptr [eax]
        movss   xmm4,xmm0
        mov     eax,[ebp-360]
        sub     eax,[ebp-356]
        cvtsi2ss        xmm0,eax
        movss   xmm5,xmm2
        subss   xmm5,xmm1
        divss   xmm5,xmm0
        mov     eax,[ebp-360]
        sub     eax,[ebp-356]
        cvtsi2ss        xmm0,eax
        movss   xmm6,xmm4
        subss   xmm6,xmm3
        divss   xmm6,xmm0
; start of inline function _rasterize_horiz_line__unordered
        mov     eax,edi
        mov     esi,eax
        mov     eax,[ebp-360]
        mov     edx,eax
        mov     eax,[ebp-356]
        mov     [ebp-344],ecx
        mov     ecx,eax
        cmp     ecx,edx
        jg      label0019
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    esi
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm4
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
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
        add     esp,792
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
