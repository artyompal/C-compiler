
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
        mov     dword ptr [__width],ebx
        mov     dword ptr [__height],esi
        mov     dword ptr [__pitch],edi
; start of inline function matrix4f_make_perspective
        cvtsi2ss        xmm0,ebx
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        mov     edi,(offset __mvproj_matrix)
        movss   xmm1,xmm7
        mulss   xmm1,xmm5
        movss   xmm7,xmm1
        mulss   xmm7,xmm0
        movss   xmm0,xmm5
        divss   xmm0,xmm7
        movss   dword ptr [edi],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+16],xmm0
        movss   xmm0,xmm5
        divss   xmm0,xmm1
        movss   dword ptr [edi+20],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+24],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+28],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+32],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+36],xmm0
        movss   xmm0,xmm6
        subss   xmm0,xmm5
        movss   xmm1,xmm6
        divss   xmm1,xmm0
        movss   dword ptr [edi+40],xmm1
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+44],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+48],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+52],xmm0
        movss   xmm0,xmm5
        mulss   xmm0,xmm6
        movss   xmm1,xmm5
        subss   xmm1,xmm6
        divss   xmm0,xmm1
        movss   dword ptr [edi+56],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+60],xmm0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        cvtsi2ss        xmm0,esi
        cvtsi2ss        xmm1,ebx
        mov     edi,(offset __viewport_matrix)
        movss   xmm7,xmm1
        divss   xmm7,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+12],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+16],xmm7
        movss   xmm7,xmm0
        xorps   xmm7,dword ptr [___unnamed_float_4]
        divss   xmm7,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+20],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+24],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+28],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+32],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+36],xmm7
        movss   xmm7,xmm6
        subss   xmm7,xmm5
        movss   dword ptr [edi+40],xmm7
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+44],xmm7
        divss   xmm1,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+48],xmm1
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+52],xmm0
        movss   dword ptr [edi+56],xmm5
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [edi+60],xmm0
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,xmm5
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_base)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
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
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [ebp-12],xmm7
        movss   xmm7,dword ptr [ebp-4]
        movss   dword ptr [edi+8],xmm7
        movss   xmm7,dword ptr [ebp-12]
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,xmm6
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_base)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
        movss   dword ptr [edi+12],xmm7
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
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [ebp-12],xmm7
        movss   xmm7,dword ptr [ebp-8]
        movss   dword ptr [edi+8],xmm7
        movss   xmm7,dword ptr [ebp-12]
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm4,ebx
        movss   xmm5,dword ptr [___unnamed_float_1]
        divss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_5]
        addss   xmm4,xmm5
        mov     edi,(offset __clip_plane_left_base)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_1]
        mov     edi,(offset __clip_plane_left_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm4,ebx
        movss   xmm5,dword ptr [___unnamed_float_1]
        divss   xmm5,xmm4
        movss   xmm4,dword ptr [___unnamed_float_1]
        subss   xmm4,xmm5
        mov     edi,(offset __clip_plane_right_base)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_5]
        mov     edi,(offset __clip_plane_right_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,esi
        movss   xmm4,dword ptr [___unnamed_float_1]
        divss   xmm4,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm4
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_base)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_base)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   xmm0,dword ptr [___unnamed_float_5]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm1
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
        mov     [ebp+8],edi
        lea     edi, [__mvproj_matrix]
        mov     [ebp-4],edi
        mov     edi,[ebp+8]
        lea     esi,[edi]
        mov     ecx,16
        mov     edi,[ebp-4]
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
        mov     ebx,dword ptr [__texture_width]
        dec     ebx
        cvtsi2ss        xmm0,ebx
        mulss   xmm0,xmm4
        cvttss2si       ebx,xmm0
        mov     esi,dword ptr [__texture_height]
        dec     esi
        cvtsi2ss        xmm0,esi
        mulss   xmm0,xmm5
        cvttss2si       esi,xmm0
        imul    esi,dword ptr [__texture_width]
        add     esi,ebx
        sal     esi,2
        add     esi,dword ptr [__texture_data]
        mov     ebx,[esi]
; end of inline function _tex2d
        mov     esi,ebx
        sar     esi,24
        and     esi,255
        cmp     esi,0
        je      label0003
        cvtsi2ss        xmm0,esi
        divss   xmm0,dword ptr [___unnamed_float_6]
        mov     esi,[edi]
        mov     ecx,esi
        and     ecx,65280
        sar     ecx,8
        and     esi,255
        mov     edx,ebx
        and     edx,65280
        sar     edx,8
        and     ebx,255
        cvtsi2ss        xmm1,edx
        mulss   xmm1,xmm0
        cvtsi2ss        xmm2,ecx
        movss   xmm3,dword ptr [___unnamed_float_1]
        subss   xmm3,xmm0
        mulss   xmm2,xmm3
        addss   xmm1,xmm2
        cvttss2si       ecx,xmm1
        mov     edx,ecx
        cvtsi2ss        xmm1,ebx
        mulss   xmm1,xmm0
        cvtsi2ss        xmm2,esi
        movss   xmm3,dword ptr [___unnamed_float_1]
        subss   xmm3,xmm0
        mulss   xmm2,xmm3
        addss   xmm1,xmm2
        cvttss2si       ecx,xmm1
        mov     esi,ecx
        mov     ecx,edx
        sal     ecx,8
        add     ecx,esi
        mov     [edi],ecx
label0003:
        movss   xmm0,xmm4
        addss   xmm0,xmm6
        movss   xmm4,xmm0
        movss   xmm0,xmm5
        addss   xmm0,xmm7
        movss   xmm5,xmm0
        add     edi,4
        cmp     edi,eax
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
        sub     esp,144
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
label0001:
        mov     [ebp+8],edx
        mov     edx,[ebx+192]
        imul    edx,24
        mov     [ebp+20],edi
        mov     edi,ebx
        add     edi,edx
        cmp     edi,eax
        jle     label0002
; start of inline function vec4f_subtract
        lea     edx,[ebp-24]
        movss   xmm0,dword ptr [ecx]
        subss   xmm0,dword ptr [esi]
        movss   dword ptr [edx],xmm0
        movss   xmm0,dword ptr [ecx+4]
        subss   xmm0,dword ptr [esi+4]
        movss   dword ptr [edx+4],xmm0
        movss   xmm0,dword ptr [ecx+8]
        subss   xmm0,dword ptr [esi+8]
        movss   dword ptr [edx+8],xmm0
        movss   xmm0,dword ptr [ecx+12]
        subss   xmm0,dword ptr [esi+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        lea     edx,[ebp-24]
        movss   xmm0,dword ptr [edx+4]
        mov     edi,[ebp+20]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [edx]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        mov     edx,esi
        mov     [ebp+12],ebx
        mov     ebx,eax
        mov     [ebp-8],eax
        lea     eax,[ebp-24]
        movss   xmm0,dword ptr [ebx]
        subss   xmm0,dword ptr [edx]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [ebx+4]
        subss   xmm0,dword ptr [edx+4]
        movss   dword ptr [eax+4],xmm0
        movss   xmm0,dword ptr [ebx+8]
        subss   xmm0,dword ptr [edx+8]
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [ebx+12]
        subss   xmm0,dword ptr [edx+12]
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     ebx,edi
        lea     eax,[ebp-24]
        mov     edx,eax
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [ebx+4]
        movss   xmm2,dword ptr [edx]
        mulss   xmm2,dword ptr [ebx]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [ebx+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [ebx+12]
        addss   xmm2,xmm0
; end of inline function vec4f_dot
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm1
        ja      label0003
        mov     edx,[ebp+8]
        mov     eax,[edx+192]
        inc     dword ptr [edx+192]
        imul    eax,24
        mov     ebx,edx
        add     ebx,eax
        mov     [ebp+20],edi
        lea     edi,[ebx]
        mov     [ebp+16],esi
        lea     esi,[ecx]
        mov     [ebp-4],ecx
        mov     ecx,6
        rep     movsd
        mov     ecx,[ebp-4]
        mov     [ebp+8],edx
        mov     esi,[ebp+16]
        mov     edi,[ebp+20]
label0003:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm1
        jae     label0006
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm2
        ja      label0005
label0006:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm2
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm1
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        lea     eax,[ebp-24]
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [ecx]
        movss   dword ptr [eax],xmm0
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [ecx+4]
        movss   dword ptr [eax+4],xmm0
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [ecx+8]
        movss   dword ptr [eax+8],xmm0
        movss   xmm0,dword ptr [esi+12]
        subss   xmm0,dword ptr [ecx+12]
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        lea     eax,[ebp-40]
        mov     [ebp-140],eax
        mov     eax,[ebp-8]
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        mov     [ebp-8],eax
        mov     eax,[ebp-140]
        movss   dword ptr [eax],xmm0
        mov     [ebp-140],eax
        mov     eax,[ebp-8]
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        mov     [ebp-8],eax
        mov     eax,[ebp-140]
        movss   dword ptr [eax+4],xmm0
        mov     [ebp-140],eax
        mov     eax,[ebp-8]
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        mov     [ebp-8],eax
        mov     eax,[ebp-140]
        movss   dword ptr [eax+8],xmm0
        mov     [ebp-140],eax
        mov     eax,[ebp-8]
        movss   xmm0,dword ptr [eax+12]
        subss   xmm0,dword ptr [ecx+12]
        mov     [ebp-8],eax
        mov     eax,[ebp-140]
        movss   dword ptr [eax+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        lea     eax,[ebp-24]
        movss   xmm0,dword ptr [eax+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [eax+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [eax+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
        movss   xmm0,xmm1
; start of inline function vec4f_dot
        lea     eax,[ebp-40]
        movss   xmm1,dword ptr [eax+4]
        mulss   xmm1,dword ptr [edi+4]
        movss   xmm2,dword ptr [eax]
        mulss   xmm2,dword ptr [edi]
        addss   xmm2,xmm1
        movss   xmm1,dword ptr [eax+8]
        mulss   xmm1,dword ptr [edi+8]
        addss   xmm2,xmm1
        movss   xmm1,dword ptr [eax+12]
        mulss   xmm1,dword ptr [edi+12]
        addss   xmm2,xmm1
; end of inline function vec4f_dot
        divss   xmm0,xmm2
; start of inline function vec4f_mul
        lea     eax,[ebp-40]
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
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     eax,[ebp-40]
        mov     ebx,[ebp+8]
        mov     edx,[ebx+192]
        imul    edx,24
        mov     ebx,[ebp+8]
        add     ebx,edx
        movss   xmm1,dword ptr [ecx]
        addss   xmm1,dword ptr [eax]
        movss   dword ptr [ebx],xmm1
        movss   xmm1,dword ptr [ecx+4]
        addss   xmm1,dword ptr [eax+4]
        movss   dword ptr [ebx+4],xmm1
        movss   xmm1,dword ptr [ecx+8]
        addss   xmm1,dword ptr [eax+8]
        movss   dword ptr [ebx+8],xmm1
        movss   xmm1,dword ptr [ecx+12]
        addss   xmm1,dword ptr [eax+12]
        movss   dword ptr [ebx+12],xmm1
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     eax,16
        add     eax,ecx
        mov     edx,16
        add     edx,[ebp-8]
        lea     ebx,[ebp-48]
        movss   xmm1,dword ptr [edx]
        subss   xmm1,dword ptr [eax]
        movss   dword ptr [ebx],xmm1
        movss   xmm1,dword ptr [edx+4]
        subss   xmm1,dword ptr [eax+4]
        movss   dword ptr [ebx+4],xmm1
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        lea     eax,[ebp-48]
        movss   xmm1,dword ptr [eax]
        mulss   xmm1,xmm0
        movss   dword ptr [eax],xmm1
        movss   xmm1,dword ptr [eax+4]
        mulss   xmm1,xmm0
        movss   dword ptr [eax+4],xmm1
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     eax,[ebp-48]
        mov     edx,16
        add     edx,ecx
        mov     [ebp-144],edx
        mov     edx,[ebp+8]
        mov     ebx,[edx+192]
        imul    ebx,24
        mov     [ebp+16],esi
        mov     esi,edx
        add     esi,ebx
        add     esi,16
        mov     [ebp+8],edx
        mov     edx,[ebp-144]
        movss   xmm0,dword ptr [edx]
        addss   xmm0,dword ptr [eax]
        movss   dword ptr [esi],xmm0
        movss   xmm0,dword ptr [edx+4]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [esi+4],xmm0
; end of inline function vec2f_add
        mov     edx,[ebp+8]
        inc     dword ptr [edx+192]
        mov     [ebp+8],edx
        mov     esi,[ebp+16]
label0004:
        add     ecx,24
        mov     eax,[ebp-8]
        add     eax,24
        mov     edx,[ebp+8]
        mov     ebx,[ebp+12]
        jmp     label0001
        mov     [ebp+8],edx
label0002:
        mov     edx,[ebp+8]
        mov     eax,[edx+192]
        inc     dword ptr [edx+192]
        imul    eax,24
        mov     ecx,edx
        add     ecx,eax
        lea     edi,[ecx]
        lea     esi,[edx]
        mov     ecx,6
        rep     movsd
        pop     ebx
        pop     esi
        pop     edi
        add     esp,144
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
        movss   xmm6,dword ptr [edi+8]
        movss   xmm5,dword ptr [edi+4]
        movss   xmm4,dword ptr [edi]
        lea     edi,[ebp-16]
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        mov     edi,(offset __mvproj_matrix)
        lea     eax,[ebp-16]
        movss   xmm4,dword ptr [eax+4]
        mulss   xmm4,dword ptr [edi+16]
        movss   xmm5,dword ptr [eax]
        mulss   xmm5,dword ptr [edi]
        addss   xmm5,xmm4
        movss   xmm4,dword ptr [eax+8]
        mulss   xmm4,dword ptr [edi+32]
        addss   xmm5,xmm4
        movss   xmm4,dword ptr [eax+12]
        mulss   xmm4,dword ptr [edi+48]
        addss   xmm5,xmm4
        movss   dword ptr [esi],xmm5
        movss   xmm4,dword ptr [eax]
        mulss   xmm4,dword ptr [edi+4]
        movss   xmm5,dword ptr [eax+4]
        mulss   xmm5,dword ptr [edi+20]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [eax+8]
        mulss   xmm5,dword ptr [edi+36]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [eax+12]
        mulss   xmm5,dword ptr [edi+52]
        addss   xmm4,xmm5
        movss   dword ptr [esi+4],xmm4
        movss   xmm4,dword ptr [eax]
        mulss   xmm4,dword ptr [edi+8]
        movss   xmm5,dword ptr [eax+4]
        mulss   xmm5,dword ptr [edi+24]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [eax+8]
        mulss   xmm5,dword ptr [edi+40]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [eax+12]
        mulss   xmm5,dword ptr [edi+56]
        addss   xmm4,xmm5
        movss   dword ptr [esi+8],xmm4
        movss   xmm4,dword ptr [eax]
        mulss   xmm4,dword ptr [edi+12]
        movss   xmm5,dword ptr [eax+4]
        mulss   xmm5,dword ptr [edi+28]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [eax+8]
        mulss   xmm5,dword ptr [edi+44]
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
        sub     esp,732
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
        mov     [ebp-708],eax
        lea     ecx,dword ptr [__clip_z_far_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_z_far_base]
        push    ecx
        push    dword ptr [ebp-708]
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
        push    dword ptr [ebp-708]
        call    __clip_on_plain
        add     esp,16
        lea     ecx,dword ptr [__clip_plane_left_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_plane_left_base]
        push    ecx
        push    dword ptr [ebp-708]
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
        push    dword ptr [ebp-708]
        call    __clip_on_plain
        add     esp,16
        lea     ecx,dword ptr [__clip_plane_top_norm]
        push    ecx
        lea     ecx,dword ptr [__clip_plane_top_base]
        push    ecx
        push    dword ptr [ebp-708]
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
        push    dword ptr [ebp-708]
        call    __clip_on_plain
        add     esp,16
        mov     ecx,[ebp-708]
        cmp     dword ptr [ecx+192],1
        setg    bl
        movzx   ebx,bl
; end of inline function _clip_poligon
        cmp     ebx,0
        jne     label0000
        jmp     label002d
label0000:
        mov     ebx,[ebp-708]
        cmp     dword ptr [ebx+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     edi,0
label0003:
        mov     eax,[ebp-708]
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
        movss   xmm0,dword ptr [esi+4]
        mulss   xmm0,dword ptr [ecx+16]
        movss   xmm1,dword ptr [esi]
        mulss   xmm1,dword ptr [ecx]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [ecx+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [ecx+48]
        addss   xmm1,xmm0
        movss   dword ptr [ebx],xmm1
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [ecx+4]
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [ecx+20]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [ecx+36]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [ecx+52]
        addss   xmm0,xmm1
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [ecx+8]
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [ecx+24]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [ecx+40]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [ecx+56]
        addss   xmm0,xmm1
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [ecx+12]
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [ecx+28]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [ecx+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [ecx+60]
        addss   xmm0,xmm1
        movss   dword ptr [ebx+12],xmm0
; end of inline function matrix4f_transform
        lea     ecx,[ebp-688]
        add     ecx,12
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [ecx]
        movss   xmm1,dword ptr [ebp-688]
        mulss   xmm1,xmm0
        cvttss2si       ecx,xmm1
        mov     [edx],ecx
        lea     ecx,[ebp-688]
        add     ecx,4
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,xmm0
        cvttss2si       ecx,xmm1
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
        mov     [ebp-708],eax
        jmp     label0003
        mov     eax,[ebp-708]
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
        mov     [ebp-708],eax
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
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   xmm6,dword ptr [___unnamed_float_2]
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
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
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
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [ebx+4]
        push    dword ptr [ebx]
        push    eax
        push    edx
        push    esi
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
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [ebx+4]
        push    dword ptr [ebx]
        push    eax
        push    ecx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
        movss   xmm6,dword ptr [ebp-432]
        movss   xmm7,dword ptr [ebp-428]
label0022:
        cmp     esi,ecx
        jle     label0024
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
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
        movss   xmm6,dword ptr [ebp-432]
        movss   xmm7,dword ptr [ebp-428]
label0024:
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
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
        mov     [ebp-712],eax
        mov     eax,ebx
        mov     [ebp-336],edi
        mov     edi,[ebp-712]
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
        mov     [ebp-716],eax
        mov     eax,ebx
        mov     edx,[ebp-716]
        sub     eax,[edx]
        mov     edx,[esi]
        sub     edx,[ecx]
        imul    eax,edx
        lea     edx,[esi+4]
        mov     [ebp-356],edi
        lea     edi,[ecx+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-720],edx
        cdq
        idiv    dword ptr [ebp-720]
        add     eax,[ecx]
        mov     edi,eax
        lea     eax,[ecx+4]
        mov     edx,ebx
        sub     edx,[eax]
        cvtsi2ss        xmm0,edx
        mov     edx,[ebp-344]
        movss   xmm1,dword ptr [edx+8]
        subss   xmm1,dword ptr [ecx+8]
        mulss   xmm0,xmm1
        lea     eax,[edx+4]
        mov     [ebp-360],edi
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [ecx+8]
        movss   xmm1,xmm0
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        cvtsi2ss        xmm0,edi
        movss   xmm2,dword ptr [esi+8]
        subss   xmm2,dword ptr [ecx+8]
        mulss   xmm0,xmm2
        lea     eax,[esi+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        cvtsi2ss        xmm2,eax
        divss   xmm0,xmm2
        addss   xmm0,dword ptr [ecx+8]
        movss   xmm2,xmm0
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        cvtsi2ss        xmm0,edi
        mov     eax,8
        add     eax,edx
        add     eax,4
        mov     edi,8
        add     edi,ecx
        add     edi,4
        movss   xmm3,dword ptr [eax]
        subss   xmm3,dword ptr [edi]
        mulss   xmm0,xmm3
        lea     eax,[edx+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        cvtsi2ss        xmm3,eax
        divss   xmm0,xmm3
        mov     eax,8
        add     eax,ecx
        add     eax,4
        addss   xmm0,dword ptr [eax]
        movss   xmm3,xmm0
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        cvtsi2ss        xmm0,edi
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     edi,8
        add     edi,ecx
        add     edi,4
        movss   xmm4,dword ptr [eax]
        subss   xmm4,dword ptr [edi]
        mulss   xmm0,xmm4
        lea     eax,[esi+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        cvtsi2ss        xmm4,eax
        divss   xmm0,xmm4
        mov     eax,8
        add     eax,ecx
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
        mov     edi,ebx
        mov     eax,[ebp-360]
        mov     [ebp-340],esi
        mov     esi,[ebp-356]
        cmp     esi,eax
        jg      label0013
        mov     [ebp-348],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
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
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm4
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
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
        mov     [ebp-724],eax
        mov     [ebp-336],edi
        mov     edi,[ebp-724]
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
        cvtsi2ss        xmm0,eax
        movss   xmm1,dword ptr [esi+8]
        subss   xmm1,dword ptr [ecx+8]
        mulss   xmm0,xmm1
        lea     eax,[esi+4]
        lea     ebx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[ebx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [ecx+8]
        movss   xmm2,xmm0
        lea     eax,[edx+4]
        lea     ebx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[ebx]
        cvtsi2ss        xmm0,eax
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     ebx,8
        add     ebx,ecx
        add     ebx,4
        movss   xmm1,dword ptr [eax]
        subss   xmm1,dword ptr [ebx]
        mulss   xmm0,xmm1
        lea     eax,[esi+4]
        lea     ebx,[ecx+4]
        mov     eax,[eax]
        sub     eax,[ebx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        mov     eax,8
        add     eax,ecx
        add     eax,4
        addss   xmm0,dword ptr [eax]
        movss   xmm4,xmm0
        movss   xmm0,xmm2
        subss   xmm0,dword ptr [edx+8]
        mov     eax,edi
        sub     eax,[edx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        movss   xmm5,xmm0
        mov     eax,8
        add     eax,edx
        add     eax,4
        movss   xmm0,xmm4
        subss   xmm0,dword ptr [eax]
        mov     eax,edi
        sub     eax,[edx]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        movss   xmm6,xmm0
; start of inline function _rasterize_horiz_line__unordered
        mov     eax,8
        add     eax,edx
        add     eax,4
        movss   dword ptr [ebp-380],xmm4
        movss   xmm4,dword ptr [eax]
        movss   dword ptr [ebp-376],xmm2
        movss   xmm2,dword ptr [edx+8]
        movss   xmm3,dword ptr [ebp-380]
        movss   xmm1,dword ptr [ebp-376]
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
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
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
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm4
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
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
        mov     [ebp-728],eax
        mov     eax,ebx
        mov     edi,[ebp-728]
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
        mov     [ebp-732],eax
        mov     eax,ebx
        mov     [ebp-356],edi
        mov     edi,[ebp-732]
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
        cvtsi2ss        xmm0,esi
        mov     esi,[ebp-340]
        movss   xmm1,dword ptr [esi+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        lea     eax,[esi+4]
        mov     [ebp-360],edi
        lea     edi,[edx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        cvtsi2ss        xmm1,eax
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [edx+8]
        movss   xmm1,xmm0
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        cvtsi2ss        xmm0,edi
        movss   xmm2,dword ptr [esi+8]
        subss   xmm2,dword ptr [ecx+8]
        mulss   xmm0,xmm2
        lea     eax,[esi+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        cvtsi2ss        xmm2,eax
        divss   xmm0,xmm2
        addss   xmm0,dword ptr [ecx+8]
        movss   xmm2,xmm0
        lea     eax,[edx+4]
        mov     edi,ebx
        sub     edi,[eax]
        cvtsi2ss        xmm0,edi
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     edi,8
        add     edi,edx
        add     edi,4
        movss   xmm3,dword ptr [eax]
        subss   xmm3,dword ptr [edi]
        mulss   xmm0,xmm3
        lea     eax,[esi+4]
        lea     edi,[edx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        cvtsi2ss        xmm3,eax
        divss   xmm0,xmm3
        mov     eax,8
        add     eax,edx
        add     eax,4
        addss   xmm0,dword ptr [eax]
        movss   xmm3,xmm0
        lea     eax,[ecx+4]
        mov     edi,ebx
        sub     edi,[eax]
        cvtsi2ss        xmm0,edi
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     edi,8
        add     edi,ecx
        add     edi,4
        movss   xmm4,dword ptr [eax]
        subss   xmm4,dword ptr [edi]
        mulss   xmm0,xmm4
        lea     eax,[esi+4]
        lea     edi,[ecx+4]
        mov     eax,[eax]
        sub     eax,[edi]
        cvtsi2ss        xmm4,eax
        divss   xmm0,xmm4
        mov     eax,8
        add     eax,ecx
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
        mov     edi,ebx
        mov     eax,[ebp-360]
        mov     [ebp-340],esi
        mov     esi,[ebp-356]
        cmp     esi,eax
        jg      label0019
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
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
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm4
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
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
        mov     eax,[ebp-708]
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        add     esp,732
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
