
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
        mulss   xmm7,xmm5
        movss   xmm1,xmm7
        mulss   xmm1,xmm0
        movss   xmm0,xmm5
        divss   xmm0,xmm1
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
        movss   xmm2,xmm1
        divss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+4],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+8],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+12],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+16],xmm2
        movss   xmm2,xmm0
        xorps   xmm2,dword ptr [___unnamed_float_4]
        divss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [edi+20],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+24],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+28],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+32],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+36],xmm2
        movss   xmm2,xmm6
        subss   xmm2,xmm5
        movss   dword ptr [edi+40],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [edi+44],xmm2
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
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_base)
        movss   dword ptr [edi],xmm3
        movss   dword ptr [edi+4],xmm4
        movss   dword ptr [edi+8],xmm5
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
        comiss  xmm6,xmm5
        jbe     label0000
        movss   xmm7,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   xmm7,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
        movss   xmm4,dword ptr [___unnamed_float_1]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_near_norm)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm7
        movss   dword ptr [edi+12],xmm4
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_base)
        movss   dword ptr [edi],xmm3
        movss   dword ptr [edi+4],xmm4
        movss   dword ptr [edi+8],xmm6
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
        movss   xmm6,dword ptr [___unnamed_float_1]
        movss   xmm5,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm7
        movss   dword ptr [edi+12],xmm6
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm6,dword ptr [___unnamed_float_2]
        movss   xmm5,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        mov     edi,(offset __clip_plane_left_base)
        movss   dword ptr [edi],xmm0
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm6,dword ptr [___unnamed_float_2]
        movss   xmm5,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_1]
        mov     edi,(offset __clip_plane_left_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm6,dword ptr [___unnamed_float_2]
        movss   xmm5,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,ebx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        mov     edi,(offset __clip_plane_right_base)
        movss   dword ptr [edi],xmm0
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm6,dword ptr [___unnamed_float_2]
        movss   xmm5,dword ptr [___unnamed_float_2]
        movss   xmm4,dword ptr [___unnamed_float_5]
        mov     edi,(offset __clip_plane_right_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm6,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,esi
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   xmm5,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_base)
        movss   dword ptr [edi],xmm5
        movss   dword ptr [edi+4],xmm0
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm6,dword ptr [___unnamed_float_2]
        movss   xmm5,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm6,dword ptr [___unnamed_float_2]
        movss   xmm5,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_base)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm6,dword ptr [___unnamed_float_2]
        movss   xmm5,dword ptr [___unnamed_float_5]
        movss   xmm4,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_norm)
        movss   dword ptr [edi],xmm4
        movss   dword ptr [edi+4],xmm5
        movss   dword ptr [edi+8],xmm6
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
        push    edi
        push    esi
        mov     edi,[ebp+8]
        mov     [ebp+8],edi
        mov     edi,(offset __mvproj_matrix)
        mov     esi,[ebp+8]
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
        mov     ecx,dword ptr [__texture_width]
        dec     ecx
        cvtsi2ss        xmm0,ecx
        mulss   xmm0,xmm4
        cvttss2si       ecx,xmm0
        mov     edx,dword ptr [__texture_height]
        dec     edx
        cvtsi2ss        xmm0,edx
        mulss   xmm0,xmm5
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
        mov     ecx,[eax]
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
        mov     [eax],ebx
label0003:
        addss   xmm4,xmm6
        addss   xmm5,xmm7
        add     eax,4
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
        movss   xmm0,dword ptr [ecx]
        subss   xmm0,dword ptr [esi]
        movss   dword ptr [ebp-24],xmm0
        movss   xmm0,dword ptr [ecx+4]
        subss   xmm0,dword ptr [esi+4]
        movss   dword ptr [ebp-20],xmm0
        movss   xmm0,dword ptr [ecx+8]
        subss   xmm0,dword ptr [esi+8]
        movss   dword ptr [ebp-16],xmm0
        movss   xmm0,dword ptr [ecx+12]
        subss   xmm0,dword ptr [esi+12]
        movss   dword ptr [ebp-12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   xmm0,dword ptr [ebp-20]
        mov     edi,[ebp+20]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [ebp-24]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-16]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [esi]
        movss   dword ptr [ebp-24],xmm0
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [esi+4]
        movss   dword ptr [ebp-20],xmm0
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [esi+8]
        movss   dword ptr [ebp-16],xmm0
        movss   xmm0,dword ptr [eax+12]
        subss   xmm0,dword ptr [esi+12]
        movss   dword ptr [ebp-12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   xmm0,dword ptr [ebp-20]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm2,dword ptr [ebp-24]
        mulss   xmm2,dword ptr [edi]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ebp-16]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ebp-12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm2,xmm0
; end of inline function vec4f_dot
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm1
        ja      label0003
        mov     [ebp+12],ebx
        mov     ebx,[ebp+8]
        mov     edx,[ebx+192]
        mov     [ebp-140],edx
        mov     edx,[ebp+8]
        inc     dword ptr [edx+192]
        mov     [ebp+8],edx
        mov     edx,[ebp-140]
        imul    edx,24
        mov     ebx,[ebp+8]
        add     ebx,edx
        mov     [ebp+20],edi
        mov     edi,ebx
        mov     [ebp+16],esi
        mov     esi,ecx
        mov     [ebp-4],ecx
        mov     ecx,6
        rep     movsd
        mov     [ebp-144],ecx
        mov     ecx,[ebp-4]
        mov     ebx,[ebp+12]
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
        movss   xmm1,dword ptr [esi]
        subss   xmm1,dword ptr [ecx]
        movss   dword ptr [ebp-24],xmm1
        movss   xmm2,dword ptr [esi+4]
        subss   xmm2,dword ptr [ecx+4]
        movss   dword ptr [ebp-20],xmm2
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [ecx+8]
        movss   dword ptr [ebp-16],xmm0
        movss   xmm0,dword ptr [esi+12]
        subss   xmm0,dword ptr [ecx+12]
        movss   dword ptr [ebp-12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        movss   xmm0,dword ptr [eax]
        subss   xmm0,dword ptr [ecx]
        movss   dword ptr [ebp-40],xmm0
        movss   xmm0,dword ptr [eax+4]
        subss   xmm0,dword ptr [ecx+4]
        movss   dword ptr [ebp-36],xmm0
        movss   xmm0,dword ptr [eax+8]
        subss   xmm0,dword ptr [ecx+8]
        movss   dword ptr [ebp-32],xmm0
        movss   xmm0,dword ptr [eax+12]
        subss   xmm0,dword ptr [ecx+12]
        movss   dword ptr [ebp-28],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        movss   xmm0,dword ptr [ebp-20]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [ebp-24]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-16]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_dot
        movss   xmm0,dword ptr [ebp-36]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm2,dword ptr [ebp-40]
        mulss   xmm2,dword ptr [edi]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ebp-32]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [ebp-28]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm2,xmm0
; end of inline function vec4f_dot
        divss   xmm1,xmm2
; start of inline function vec4f_mul
        movss   xmm0,dword ptr [ebp-40]
        mulss   xmm0,xmm1
        movss   dword ptr [ebp-40],xmm0
        movss   xmm0,dword ptr [ebp-36]
        mulss   xmm0,xmm1
        movss   dword ptr [ebp-36],xmm0
        movss   xmm0,dword ptr [ebp-32]
        mulss   xmm0,xmm1
        movss   dword ptr [ebp-32],xmm0
        movss   xmm0,dword ptr [ebp-28]
        mulss   xmm0,xmm1
        movss   dword ptr [ebp-28],xmm0
; end of inline function vec4f_mul
; start of inline function vec4f_add
        mov     [ebp+12],ebx
        mov     ebx,[ebp+8]
        mov     edx,[ebx+192]
        imul    edx,24
        mov     ebx,[ebp+8]
        add     ebx,edx
        movss   xmm0,dword ptr [ecx]
        addss   xmm0,dword ptr [ebp-40]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [ecx+4]
        addss   xmm0,dword ptr [ebp-36]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [ecx+8]
        addss   xmm0,dword ptr [ebp-32]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [ecx+12]
        addss   xmm0,dword ptr [ebp-28]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        movss   xmm0,dword ptr [eax+16]
        subss   xmm0,dword ptr [ecx+16]
        movss   dword ptr [ebp-48],xmm0
        movss   xmm0,dword ptr [eax+20]
        subss   xmm0,dword ptr [ecx+20]
        movss   dword ptr [ebp-44],xmm0
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   xmm0,dword ptr [ebp-48]
        mulss   xmm0,xmm1
        movss   dword ptr [ebp-48],xmm0
        movss   xmm0,dword ptr [ebp-44]
        mulss   xmm0,xmm1
        movss   dword ptr [ebp-44],xmm0
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     ebx,[ebp+8]
        mov     edx,[ebx+192]
        imul    edx,24
        mov     ebx,[ebp+8]
        add     ebx,edx
        add     ebx,16
        movss   xmm0,dword ptr [ecx+16]
        addss   xmm0,dword ptr [ebp-48]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [ecx+20]
        addss   xmm0,dword ptr [ebp-44]
        movss   dword ptr [ebx+4],xmm0
; end of inline function vec2f_add
        mov     edx,[ebp+8]
        inc     dword ptr [edx+192]
        mov     [ebp+8],edx
        mov     ebx,[ebp+12]
label0004:
        add     ecx,24
        add     eax,24
        mov     edx,[ebp+8]
        jmp     label0001
label0002:
        mov     edx,[ebp+8]
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
        movss   dword ptr [ebp-16],xmm4
        movss   dword ptr [ebp-12],xmm5
        movss   dword ptr [ebp-8],xmm6
        movss   dword ptr [ebp-4],xmm7
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        mov     edi,(offset __mvproj_matrix)
        movss   xmm0,dword ptr [ebp-12]
        mulss   xmm0,dword ptr [edi+16]
        movss   xmm1,dword ptr [ebp-16]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-8]
        mulss   xmm0,dword ptr [edi+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-4]
        mulss   xmm0,dword ptr [edi+48]
        addss   xmm1,xmm0
        movss   dword ptr [esi],xmm1
        movss   xmm0,dword ptr [ebp-16]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [ebp-12]
        mulss   xmm1,dword ptr [edi+20]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebp-8]
        mulss   xmm1,dword ptr [edi+36]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebp-4]
        mulss   xmm1,dword ptr [edi+52]
        addss   xmm0,xmm1
        movss   dword ptr [esi+4],xmm0
        movss   xmm0,dword ptr [ebp-16]
        mulss   xmm0,dword ptr [edi+8]
        movss   xmm1,dword ptr [ebp-12]
        mulss   xmm1,dword ptr [edi+24]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebp-8]
        mulss   xmm1,dword ptr [edi+40]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebp-4]
        mulss   xmm1,dword ptr [edi+56]
        addss   xmm0,xmm1
        movss   dword ptr [esi+8],xmm0
        movss   xmm0,dword ptr [ebp-16]
        mulss   xmm0,dword ptr [edi+12]
        movss   xmm1,dword ptr [ebp-12]
        mulss   xmm1,dword ptr [edi+28]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebp-8]
        mulss   xmm1,dword ptr [edi+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebp-4]
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
        mov     [ebp-708],eax
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        push    dword ptr [ebp-708]
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
        push    dword ptr [ebp-708]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        push    dword ptr [ebp-708]
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
        push    dword ptr [ebp-708]
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        push    dword ptr [ebp-708]
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
        push    dword ptr [ebp-708]
        call    __clip_on_plain
        add     esp,16
        mov     eax,[ebp-708]
        cmp     dword ptr [eax+192],1
        setg    cl
        movzx   ecx,cl
; end of inline function _clip_poligon
        cmp     ecx,0
        jne     label0000
        jmp     label002d
label0000:
        cmp     dword ptr [eax+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     edi,0
label0003:
        mov     ecx,[eax+192]
        cmp     ecx,edi
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     ecx,eax
        mov     edx,edi
        imul    edx,24
        add     ecx,edx
        lea     edx,[ebp-332]
        mov     ebx,edi
        sal     ebx,4
        add     edx,ebx
; start of inline function matrix4f_transform
        mov     esi,(offset __viewport_matrix)
        movss   xmm0,dword ptr [ecx+4]
        mulss   xmm0,dword ptr [esi+16]
        movss   xmm1,dword ptr [ecx]
        mulss   xmm1,dword ptr [esi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+8]
        mulss   xmm0,dword ptr [esi+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ecx+12]
        mulss   xmm0,dword ptr [esi+48]
        addss   xmm1,xmm0
        movss   dword ptr [ebp-688],xmm1
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [esi+4]
        movss   xmm1,dword ptr [ecx+4]
        mulss   xmm1,dword ptr [esi+20]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ecx+8]
        mulss   xmm1,dword ptr [esi+36]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ecx+12]
        mulss   xmm1,dword ptr [esi+52]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-684],xmm0
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [esi+8]
        movss   xmm1,dword ptr [ecx+4]
        mulss   xmm1,dword ptr [esi+24]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ecx+8]
        mulss   xmm1,dword ptr [esi+40]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ecx+12]
        mulss   xmm1,dword ptr [esi+56]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-680],xmm0
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,dword ptr [esi+12]
        movss   xmm1,dword ptr [ecx+4]
        mulss   xmm1,dword ptr [esi+28]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ecx+8]
        mulss   xmm1,dword ptr [esi+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ecx+12]
        mulss   xmm1,dword ptr [esi+60]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-676],xmm0
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
        mov     edx,[edx+4]
        cmp     edx,dword ptr [__height]
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
        jmp     label0003
label0004:
        mov     edi,2
label0006:
        mov     ecx,[eax+192]
        dec     ecx
        cmp     ecx,edi
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     ecx,[ebp-332]
        mov     edx,edi
        sal     edx,4
        add     ecx,edx
        mov     edx,edi
        dec     edx
        sal     edx,4
        lea     ebx,[ebp-332]
        add     ebx,edx
        lea     edx,[ebp-332]
        mov     esi,[edx+4]
        cmp     esi,[ebx+4]
        jle     label0008
        mov     [ebp-352],edx
        mov     edx,ebx
        mov     ebx,[ebp-352]
label0008:
        mov     esi,[edx+4]
        cmp     esi,[ecx+4]
        jle     label0009
        mov     [ebp-352],edx
        mov     edx,ecx
        mov     ecx,[ebp-352]
label0009:
        mov     esi,[ebx+4]
        cmp     esi,[ecx+4]
        jle     label000a
        mov     [ebp-348],edx
        mov     edx,ebx
        mov     ebx,ecx
        mov     ecx,edx
        mov     edx,[ebp-348]
label000a:
        mov     esi,[edx+4]
        cmp     esi,[ecx+4]
        jne     label000b
        cmp     dword ptr [edx+4],0
        jl      label000c
        mov     esi,[edx+4]
        cmp     esi,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   xmm6,dword ptr [___unnamed_float_2]
        mov     esi,8
        add     esi,ecx
        mov     [ebp-708],eax
        mov     eax,8
        add     eax,ebx
        mov     [ebp-336],edi
        mov     edi,8
        add     edi,edx
        mov     [ebp-440],eax
        mov     eax,[edx+4]
        mov     ecx,[ecx]
        mov     ebx,[ebx]
        mov     edx,[edx]
        cmp     edx,ebx
        jge     label001c
        cmp     ecx,ebx
        jle     label001d
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    eax
        push    ecx
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
label001d:
        cmp     ecx,edx
        jge     label001f
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [esi+4]
        push    dword ptr [esi]
        push    eax
        push    ebx
        push    ecx
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
        push    ebx
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
label001c:
        cmp     ecx,ebx
        jge     label0022
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [esi+4]
        push    dword ptr [esi]
        push    eax
        push    edx
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
label0022:
        cmp     ecx,edx
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
        push    ecx
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
        mov     [ebp-448],eax
        mov     eax,[ebp-440]
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        push    dword ptr [ebp-448]
        push    edx
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
        mov     eax,[ebp-708]
        mov     edi,[ebp-336]
label000c:
        jmp     label0027
label000b:
        mov     esi,[edx+4]
label000e:
        mov     [ebp-708],eax
        mov     eax,[ebx+4]
        cmp     eax,esi
        jle     label000f
        mov     eax,esi
        sub     eax,[edx+4]
        mov     [ebp-336],edi
        mov     edi,[ebx]
        sub     edi,[edx]
        imul    eax,edi
        mov     edi,[ebx+4]
        sub     edi,[edx+4]
        mov     [ebp-348],edx
        cdq
        idiv    edi
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     [ebp-712],eax
        mov     eax,esi
        sub     eax,[edx+4]
        mov     edi,[ecx]
        sub     edi,[edx]
        imul    eax,edi
        mov     edi,[ecx+4]
        sub     edi,[edx+4]
        mov     [ebp-348],edx
        cdq
        idiv    edi
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     edi,esi
        sub     edi,[edx+4]
        cvtsi2ss        xmm0,edi
        movss   xmm1,dword ptr [ebx+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        mov     edi,[ebx+4]
        sub     edi,[edx+4]
        cvtsi2ss        xmm1,edi
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [edx+8]
        mov     edi,esi
        sub     edi,[edx+4]
        cvtsi2ss        xmm1,edi
        movss   xmm2,dword ptr [ecx+8]
        subss   xmm2,dword ptr [edx+8]
        mulss   xmm1,xmm2
        mov     edi,[ecx+4]
        sub     edi,[edx+4]
        cvtsi2ss        xmm2,edi
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [edx+8]
        mov     edi,esi
        sub     edi,[edx+4]
        cvtsi2ss        xmm2,edi
        mov     edi,8
        add     edi,ebx
        add     edi,4
        mov     [ebp-716],eax
        mov     eax,8
        add     eax,edx
        add     eax,4
        movss   xmm3,dword ptr [edi]
        subss   xmm3,dword ptr [eax]
        mulss   xmm2,xmm3
        mov     eax,[ebx+4]
        sub     eax,[edx+4]
        cvtsi2ss        xmm3,eax
        divss   xmm2,xmm3
        mov     eax,8
        add     eax,edx
        add     eax,4
        addss   xmm2,dword ptr [eax]
        mov     eax,esi
        sub     eax,[edx+4]
        cvtsi2ss        xmm3,eax
        mov     eax,8
        add     eax,ecx
        add     eax,4
        mov     edi,8
        add     edi,edx
        add     edi,4
        movss   xmm4,dword ptr [eax]
        subss   xmm4,dword ptr [edi]
        mulss   xmm3,xmm4
        mov     eax,[ecx+4]
        sub     eax,[edx+4]
        cvtsi2ss        xmm4,eax
        divss   xmm3,xmm4
        mov     eax,8
        add     eax,edx
        add     eax,4
        addss   xmm3,dword ptr [eax]
        mov     eax,[ebp-716]
        sub     eax,[ebp-712]
        cvtsi2ss        xmm4,eax
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     eax,[ebp-716]
        sub     eax,[ebp-712]
        cvtsi2ss        xmm4,eax
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     eax,[ebp-712]
        cmp     eax,[ebp-716]
        jg      label0013
        mov     [ebp-340],ecx
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    esi
        push    dword ptr [ebp-716]
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
label0013:
        mov     [ebp-340],ecx
        mov     [ebp-348],edx
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
        push    dword ptr [ebp-716]
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     esi
        mov     eax,[ebp-708]
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        mov     edi,[ebp-336]
        jmp     label000e
label000f:
        mov     eax,[ebx+4]
        sub     eax,[edx+4]
        mov     esi,[ecx]
        sub     esi,[edx]
        imul    eax,esi
        mov     esi,[ecx+4]
        sub     esi,[edx+4]
        mov     [ebp-348],edx
        cdq
        idiv    esi
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     esi,[ebx+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm0,esi
        movss   xmm1,dword ptr [ecx+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        mov     esi,[ecx+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm1,esi
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [edx+8]
        mov     esi,[ebx+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm1,esi
        mov     esi,8
        add     esi,ecx
        add     esi,4
        mov     [ebp-336],edi
        mov     edi,8
        add     edi,edx
        add     edi,4
        movss   xmm2,dword ptr [esi]
        subss   xmm2,dword ptr [edi]
        mulss   xmm1,xmm2
        mov     esi,[ecx+4]
        sub     esi,[edx+4]
        cvtsi2ss        xmm2,esi
        divss   xmm1,xmm2
        mov     esi,8
        add     esi,edx
        add     esi,4
        addss   xmm1,dword ptr [esi]
        movss   xmm2,xmm0
        subss   xmm2,dword ptr [ebx+8]
        mov     esi,eax
        sub     esi,[ebx]
        cvtsi2ss        xmm3,esi
        divss   xmm2,xmm3
        mov     esi,8
        add     esi,ebx
        add     esi,4
        movss   xmm3,xmm1
        subss   xmm3,dword ptr [esi]
        mov     esi,eax
        sub     esi,[ebx]
        cvtsi2ss        xmm4,esi
        divss   xmm3,xmm4
; start of inline function _rasterize_horiz_line__unordered
        movss   xmm6,xmm3
        movss   xmm5,xmm2
        mov     esi,8
        add     esi,ebx
        add     esi,4
        movss   xmm3,dword ptr [esi]
        movss   dword ptr [ebp-732],xmm1
        movss   xmm1,dword ptr [ebx+8]
        movss   xmm2,dword ptr [ebp-732]
        mov     esi,[ebx+4]
        mov     edi,[ebx]
        cmp     eax,edi
        jg      label0016
        mov     [ebp-340],ecx
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
        mov     [ebp-340],ecx
        mov     [ebp-348],edx
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
        mov     eax,1
        add     eax,[ebx+4]
        mov     esi,eax
label0011:
        mov     ecx,[ebp-340]
        mov     edi,[ecx+4]
        cmp     edi,esi
        jle     label0012
        mov     eax,esi
        sub     eax,[ebx+4]
        mov     edx,[ecx]
        sub     edx,[ebx]
        imul    eax,edx
        mov     edx,[ecx+4]
        sub     edx,[ebx+4]
        mov     [ebp-720],edx
        cdq
        idiv    dword ptr [ebp-720]
        add     eax,[ebx]
        mov     [ebp-724],eax
        mov     eax,esi
        mov     edx,[ebp-348]
        sub     eax,[edx+4]
        mov     edi,[ecx]
        sub     edi,[edx]
        imul    eax,edi
        mov     edi,[ecx+4]
        sub     edi,[edx+4]
        mov     [ebp-348],edx
        cdq
        idiv    edi
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     edi,esi
        sub     edi,[ebx+4]
        cvtsi2ss        xmm1,edi
        movss   xmm3,dword ptr [ecx+8]
        subss   xmm3,dword ptr [ebx+8]
        mulss   xmm1,xmm3
        mov     edi,[ecx+4]
        sub     edi,[ebx+4]
        cvtsi2ss        xmm5,edi
        divss   xmm1,xmm5
        addss   xmm1,dword ptr [ebx+8]
        mov     edi,esi
        sub     edi,[edx+4]
        cvtsi2ss        xmm6,edi
        movss   xmm0,dword ptr [ecx+8]
        subss   xmm0,dword ptr [edx+8]
        mulss   xmm6,xmm0
        mov     edi,[ecx+4]
        sub     edi,[edx+4]
        cvtsi2ss        xmm0,edi
        divss   xmm6,xmm0
        addss   xmm6,dword ptr [edx+8]
        mov     edi,esi
        sub     edi,[ebx+4]
        cvtsi2ss        xmm0,edi
        mov     edi,8
        add     edi,ecx
        add     edi,4
        mov     [ebp-728],eax
        mov     eax,8
        add     eax,ebx
        add     eax,4
        movss   xmm2,dword ptr [edi]
        subss   xmm2,dword ptr [eax]
        mulss   xmm0,xmm2
        mov     eax,[ecx+4]
        sub     eax,[ebx+4]
        cvtsi2ss        xmm2,eax
        divss   xmm0,xmm2
        mov     eax,8
        add     eax,ebx
        add     eax,4
        addss   xmm0,dword ptr [eax]
        mov     eax,esi
        sub     eax,[edx+4]
        cvtsi2ss        xmm2,eax
        mov     eax,8
        add     eax,ecx
        add     eax,4
        mov     edi,8
        add     edi,edx
        add     edi,4
        movss   xmm3,dword ptr [eax]
        subss   xmm3,dword ptr [edi]
        mulss   xmm2,xmm3
        mov     eax,[ecx+4]
        sub     eax,[edx+4]
        cvtsi2ss        xmm3,eax
        divss   xmm2,xmm3
        mov     eax,8
        add     eax,edx
        add     eax,4
        addss   xmm2,dword ptr [eax]
        mov     eax,[ebp-728]
        sub     eax,[ebp-724]
        cvtsi2ss        xmm3,eax
        movss   xmm4,xmm6
        subss   xmm4,xmm1
        divss   xmm4,xmm3
        mov     eax,[ebp-728]
        sub     eax,[ebp-724]
        cvtsi2ss        xmm3,eax
        movss   xmm5,xmm2
        subss   xmm5,xmm0
        divss   xmm5,xmm3
; start of inline function _rasterize_horiz_line__unordered
        movss   dword ptr [ebp-736],xmm5
        movss   xmm5,xmm4
        movss   xmm3,xmm2
        movss   dword ptr [ebp-740],xmm1
        movss   xmm1,xmm6
        movss   xmm2,xmm0
        movss   xmm0,dword ptr [ebp-740]
        mov     edi,esi
        mov     eax,[ebp-724]
        cmp     eax,[ebp-728]
        jg      label0019
        push    dword ptr [ebp-736]
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        push    edi
        push    dword ptr [ebp-728]
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        mov     [ebp-340],ecx
        mov     [ebp-348],edx
        push    dword ptr [ebp-736]
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        push    edi
        push    eax
        push    dword ptr [ebp-728]
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     esi
        jmp     label0011
label0012:
        mov     eax,[ebp-708]
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
