
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
___unnamed_float4_4     dd      080000000h, 00h, 00h, 00h
public  ___unnamed_float4_4
___unnamed_float_5      dd      0bf800000h
public  ___unnamed_float_5
___unnamed_float_6      dd      03b808081h
public  ___unnamed_float_6

.code

_matrix4f_transform proc
        push    ebp
        mov     ebp,esp
        push    esi
        push    ebx
        mov     eax,[ebp+8]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [ecx+16]
        mov     ebx,edx
        mov     esi,ecx
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [esi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [ecx+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [ecx+48]
        addss   xmm1,xmm0
        mov     ebx,eax
        movss   dword ptr [ebx],xmm1
        mov     ebx,edx
        movss   xmm0,dword ptr [ebx]
        mulss   xmm0,dword ptr [ecx+4]
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [ecx+20]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [ecx+36]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [ecx+52]
        addss   xmm0,xmm1
        movss   dword ptr [eax+4],xmm0
        mov     ebx,edx
        movss   xmm0,dword ptr [ebx]
        mulss   xmm0,dword ptr [ecx+8]
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [ecx+24]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [ecx+40]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [ecx+56]
        addss   xmm0,xmm1
        movss   dword ptr [eax+8],xmm0
        mov     ebx,edx
        movss   xmm0,dword ptr [ebx]
        mulss   xmm0,dword ptr [ecx+12]
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [ecx+28]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [ecx+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [ecx+60]
        addss   xmm0,xmm1
        movss   dword ptr [eax+12],xmm0
        pop     ebx
        pop     esi
        pop     ebp
        ret
_matrix4f_transform endp

_rasterizer_init proc
        push    ebp
        mov     ebp,esp
        sub     esp,76
        push    ebx
        movss   xmm0,dword ptr [ebp+24]
        movss   xmm1,dword ptr [ebp+28]
        movss   xmm2,dword ptr [ebp+32]
        mov     eax,[ebp+20]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        mov     ebx,[ebp+8]
        mov     dword ptr [__dbgprintf],ebx
        mov     ebx,edx
        mov     dword ptr [__width],ebx
        mov     ebx,ecx
        mov     dword ptr [__height],ebx
        mov     dword ptr [__pitch],eax
; start of inline function matrix4f_make_perspective
        cvtsi2ss        xmm3,edx
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        movss   xmm4,xmm1
        movss   xmm5,xmm0
        mov     eax,(offset __mvproj_matrix)
        mulss   xmm2,xmm5
        movss   xmm6,xmm2
        mulss   xmm6,xmm3
        mov     ebx,eax
        movss   xmm3,xmm5
        divss   xmm3,xmm6
        movss   dword ptr [ebx],xmm3
        mov     dword ptr [eax+4],0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],0
        mov     dword ptr [eax+16],0
        movss   xmm3,xmm5
        divss   xmm3,xmm2
        movss   dword ptr [eax+20],xmm3
        mov     dword ptr [eax+24],0
        mov     dword ptr [eax+28],0
        mov     dword ptr [eax+32],0
        mov     dword ptr [eax+36],0
        movss   xmm2,xmm4
        subss   xmm2,xmm5
        movss   xmm3,xmm4
        divss   xmm3,xmm2
        movss   dword ptr [eax+40],xmm3
        mov     dword ptr [eax+44],1065353216
        mov     dword ptr [eax+48],0
        mov     dword ptr [eax+52],0
        movss   xmm2,xmm5
        mulss   xmm2,xmm4
        subss   xmm5,xmm4
        divss   xmm2,xmm5
        movss   dword ptr [eax+56],xmm2
        mov     dword ptr [eax+60],0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   xmm2,xmm1
        movss   xmm3,xmm0
        cvtsi2ss        xmm4,ecx
        cvtsi2ss        xmm5,edx
        mov     eax,(offset __viewport_matrix)
        mov     ebx,eax
        movss   xmm6,xmm5
        mulss   xmm6,dword ptr [___unnamed_float_3]
        movss   dword ptr [ebx],xmm6
        mov     dword ptr [eax+4],0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],0
        mov     dword ptr [eax+16],0
        movss   xmm6,xmm4
        xorps   xmm6,dword ptr [___unnamed_float4_4]
        mulss   xmm6,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+20],xmm6
        mov     dword ptr [eax+24],0
        mov     dword ptr [eax+28],0
        mov     dword ptr [eax+32],0
        mov     dword ptr [eax+36],0
        subss   xmm2,xmm3
        movss   dword ptr [eax+40],xmm2
        mov     dword ptr [eax+44],0
        mulss   xmm5,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+48],xmm5
        mulss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [eax+52],xmm4
        movss   dword ptr [eax+56],xmm3
        mov     dword ptr [eax+60],1065353216
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   xmm2,xmm0
        mov     eax,(offset __clip_z_near_base)
        mov     ebx,eax
        mov     dword ptr [ebx],0
        mov     dword ptr [eax+4],0
        movss   dword ptr [eax+8],xmm2
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
        movss   xmm2,xmm1
        comiss  xmm2,xmm0
        jbe     label0000
        movss   xmm2,dword ptr [___unnamed_float_1]
        jmp     label0001
label0000:
        movss   xmm2,dword ptr [___unnamed_float_5]
label0001:
; start of inline function vec4f_assign
        mov     eax,(offset __clip_z_near_norm)
        mov     ebx,eax
        mov     dword ptr [ebx],0
        mov     dword ptr [eax+4],0
        movss   dword ptr [eax+8],xmm2
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm2,xmm1
        mov     eax,(offset __clip_z_far_base)
        mov     ebx,eax
        mov     dword ptr [ebx],0
        mov     dword ptr [eax+4],0
        movss   dword ptr [eax+8],xmm2
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
        comiss  xmm1,xmm0
        jbe     label0002
        movss   xmm0,dword ptr [___unnamed_float_5]
        jmp     label0003
label0002:
        movss   xmm0,dword ptr [___unnamed_float_1]
label0003:
; start of inline function vec4f_assign
        movss   xmm2,xmm0
        mov     eax,(offset __clip_z_far_norm)
        mov     ebx,eax
        mov     dword ptr [ebx],0
        mov     dword ptr [eax+4],0
        movss   dword ptr [eax+8],xmm2
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        mov     eax,(offset __clip_plane_left_base)
        mov     ebx,eax
        movss   dword ptr [ebx],xmm0
        mov     dword ptr [eax+4],0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     eax,(offset __clip_plane_left_norm)
        mov     ebx,eax
        mov     dword ptr [ebx],1065353216
        mov     dword ptr [eax+4],0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        mov     eax,(offset __clip_plane_right_base)
        mov     edx,eax
        movss   dword ptr [edx],xmm0
        mov     dword ptr [eax+4],0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     eax,(offset __clip_plane_right_norm)
        mov     edx,eax
        mov     dword ptr [edx],-1082130432
        mov     dword ptr [eax+4],0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        mov     eax,(offset __clip_plane_top_base)
        mov     ecx,eax
        mov     dword ptr [ecx],0
        movss   dword ptr [eax+4],xmm0
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     eax,(offset __clip_plane_top_norm)
        mov     ecx,eax
        mov     dword ptr [ecx],0
        mov     dword ptr [eax+4],1065353216
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     eax,(offset __clip_plane_bottom_base)
        mov     ecx,eax
        mov     dword ptr [ecx],0
        mov     dword ptr [eax+4],1065353216
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     eax,(offset __clip_plane_bottom_norm)
        mov     ecx,eax
        mov     dword ptr [ecx],0
        mov     dword ptr [eax+4],-1082130432
        mov     dword ptr [eax+8],0
        mov     dword ptr [eax+12],1065353216
; end of inline function vec4f_assign
        pop     ebx
        mov     esp,ebp
        pop     ebp
        ret
_rasterizer_init endp

_rasterizer_begin_frame proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        mov     dword ptr [__videomem],eax
        pop     ebp
        ret
_rasterizer_begin_frame endp

_rasterizer_set_mvproj proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        mov     eax,[ebp+8]
        mov     edi,(offset __mvproj_matrix)
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
        mov     eax,[ebp+8]
        mov     dword ptr [__color],eax
        pop     ebp
        ret
_rasterizer_set_color endp

_rasterizer_set_texture proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        mov     dword ptr [__texture_data],edx
        mov     dword ptr [__texture_width],ecx
        mov     dword ptr [__texture_height],eax
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
        movss   xmm0,dword ptr [ebp+32]
        movss   xmm1,dword ptr [ebp+28]
        movss   xmm2,dword ptr [ebp+20]
        movss   xmm3,dword ptr [ebp+24]
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        mov     edx,[ebp+16]
        mov     ebx,dword ptr [__pitch]
        imul    ebx,edx
        add     ebx,dword ptr [__videomem]
        mov     edx,ecx
        sal     edx,2
        add     ebx,edx
        sal     eax,2
        add     eax,ebx
        sal     ecx,2
        sub     eax,ecx
label0000:
; start of inline function _tex2d
        movss   xmm4,xmm3
        movss   xmm5,xmm2
        mov     ecx,dword ptr [__texture_width]
        dec     ecx
        cvtsi2ss        xmm6,ecx
        mulss   xmm6,xmm5
        cvttss2si       ecx,xmm6
        mov     edx,dword ptr [__texture_height]
        dec     edx
        cvtsi2ss        xmm5,edx
        mulss   xmm5,xmm4
        cvttss2si       edx,xmm5
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
        cvtsi2ss        xmm4,ecx
        mulss   xmm4,dword ptr [___unnamed_float_6]
        mov     ecx,ebx
        mov     ecx,[ecx]
        mov     esi,ecx
        and     esi,65280
        sar     esi,8
        and     ecx,255
        mov     edi,edx
        and     edi,65280
        sar     edi,8
        and     edx,255
        cvtsi2ss        xmm5,edi
        mulss   xmm5,xmm4
        cvtsi2ss        xmm6,esi
        movss   xmm7,dword ptr [___unnamed_float_1]
        subss   xmm7,xmm4
        mulss   xmm6,xmm7
        addss   xmm5,xmm6
        cvttss2si       esi,xmm5
        cvtsi2ss        xmm5,edx
        mulss   xmm5,xmm4
        cvtsi2ss        xmm6,ecx
        movss   xmm7,dword ptr [___unnamed_float_1]
        subss   xmm7,xmm4
        mulss   xmm6,xmm7
        addss   xmm5,xmm6
        cvttss2si       ecx,xmm5
        sal     esi,8
        add     esi,ecx
        mov     ecx,ebx
        mov     [ecx],esi
label0003:
        addss   xmm2,xmm1
        addss   xmm3,xmm0
        add     ebx,4
        mov     ecx,ebx
        cmp     ecx,eax
        jl      label0000
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
__rasterize_horiz_line endp

__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,152
        push    edi
        push    esi
        push    ebx
        mov     eax,[ebp+20]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+12]
        mov     ebx,[ebp+8]
        mov     dword ptr [ebx+192],0
        mov     esi,edx
        mov     edi,edx
        add     edi,24
label0001:
        mov     [ebp+8],ebx
        mov     ebx,[edx+192]
        imul    ebx,24
        mov     [ebp+20],eax
        mov     eax,edx
        add     eax,ebx
        cmp     eax,edi
        jle     label0002
; start of inline function vec4f_subtract
        mov     eax,ecx
        mov     ebx,esi
        mov     [ebp+12],edx
        lea     edx,[ebp-24]
        mov     [ebp-4],esi
        mov     esi,ebx
        mov     [ebp-8],edi
        mov     edi,eax
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        mov     esi,edx
        movss   dword ptr [esi],xmm0
        movss   xmm0,dword ptr [ebx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [edx+4],xmm0
        movss   xmm0,dword ptr [ebx+8]
        subss   xmm0,dword ptr [eax+8]
        movss   dword ptr [edx+8],xmm0
        movss   xmm0,dword ptr [ebx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     edx,[ebp-24]
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [eax+4]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [esi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        mov     eax,ecx
        mov     edx,[ebp-8]
        lea     ebx,[ebp-24]
        mov     esi,edx
        mov     edi,eax
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        mov     esi,ebx
        movss   dword ptr [esi],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        subss   xmm0,dword ptr [eax+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     edx,[ebp-24]
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [eax+4]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm2,dword ptr [ebx]
        mulss   xmm2,dword ptr [esi]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm2,xmm0
        movss   dword ptr [ebp-52],xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        ja      label0003
        mov     ebx,[ebp+8]
        mov     eax,[ebx+192]
        inc     dword ptr [ebx+192]
        imul    eax,24
        mov     edx,ebx
        mov     esi,[ebp-4]
        movq    xmm0,qword ptr [esi]
        movq    qword ptr [edx+eax],xmm0
        movq    xmm0,qword ptr [esi+8]
        movq    qword ptr [edx+eax+8],xmm0
        movq    xmm0,qword ptr [esi+16]
        movq    qword ptr [edx+eax+16],xmm0
        mov     [ebp+8],ebx
        movsd   qword ptr [ebp-144],xmm0
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
        mov     edx,ecx
        lea     ebx,[ebp-24]
        mov     esi,edx
        mov     edi,eax
        movss   xmm1,dword ptr [esi]
        subss   xmm1,dword ptr [edi]
        mov     esi,ebx
        movss   dword ptr [esi],xmm1
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        subss   xmm0,dword ptr [eax+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     eax,[ebp-4]
        mov     edx,[ebp-8]
        lea     ebx,[ebp-40]
        mov     esi,edx
        mov     edi,eax
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        mov     esi,ebx
        movss   dword ptr [esi],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        subss   xmm0,dword ptr [eax+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     edx,[ebp-24]
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [eax+4]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [esi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     edx,[ebp-40]
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [eax+4]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm2,dword ptr [ebx]
        mulss   xmm2,dword ptr [esi]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [eax+8]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm2,xmm0
        movss   dword ptr [ebp-148],xmm1
        movss   xmm1,xmm2
; end of inline function vec4f_dot
        movss   dword ptr [ebp-152],xmm1
        movss   xmm1,dword ptr [ebp-148]
        divss   xmm1,dword ptr [ebp-152]
; start of inline function vec4f_mul
        movss   xmm0,xmm1
        lea     eax,[ebp-40]
        mov     edx,eax
        movss   xmm2,dword ptr [edx]
        mulss   xmm2,xmm0
        movss   dword ptr [edx],xmm2
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
        mov     edx,[ebp-4]
        mov     esi,[ebp+8]
        mov     ebx,[esi+192]
        imul    ebx,24
        mov     esi,[ebp+8]
        add     esi,ebx
        mov     ebx,edx
        mov     edi,eax
        movss   xmm0,dword ptr [ebx]
        addss   xmm0,dword ptr [edi]
        mov     ebx,esi
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [edx+4]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [esi+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        addss   xmm0,dword ptr [eax+8]
        movss   dword ptr [esi+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        addss   xmm0,dword ptr [eax+12]
        movss   dword ptr [esi+12],xmm0
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     eax,16
        add     eax,[ebp-4]
        mov     edx,16
        add     edx,[ebp-8]
        lea     ebx,[ebp-48]
        mov     esi,edx
        mov     edi,eax
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        mov     esi,ebx
        movss   dword ptr [esi],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [eax+4]
        movss   dword ptr [ebx+4],xmm0
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        lea     eax,[ebp-48]
        mov     edx,eax
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,xmm1
        movss   dword ptr [edx],xmm0
        movss   xmm0,dword ptr [eax+4]
        mulss   xmm0,xmm1
        movss   dword ptr [eax+4],xmm0
; end of inline function vec2f_mul
; start of inline function vec2f_add
        lea     eax,[ebp-48]
        mov     edx,16
        add     edx,[ebp-4]
        mov     esi,[ebp+8]
        mov     ebx,[esi+192]
        imul    ebx,24
        mov     esi,[ebp+8]
        add     esi,ebx
        add     esi,16
        mov     ebx,edx
        mov     edi,eax
        movss   xmm0,dword ptr [ebx]
        addss   xmm0,dword ptr [edi]
        mov     ebx,esi
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [edx+4]
        addss   xmm0,dword ptr [eax+4]
        movss   dword ptr [esi+4],xmm0
; end of inline function vec2f_add
        mov     ebx,[ebp+8]
        inc     dword ptr [ebx+192]
        mov     [ebp+8],ebx
label0004:
        mov     esi,[ebp-4]
        add     esi,24
        mov     edi,[ebp-8]
        add     edi,24
        mov     eax,[ebp+20]
        mov     edx,[ebp+12]
        mov     ebx,[ebp+8]
        jmp     label0001
label0002:
        mov     ebx,[ebp+8]
        mov     ecx,[ebx+192]
        inc     dword ptr [ebx+192]
        imul    ecx,24
        mov     edx,ebx
        movq    xmm0,qword ptr [ebx]
        movq    qword ptr [edx+ecx],xmm0
        movq    xmm0,qword ptr [ebx+8]
        movq    qword ptr [edx+ecx+8],xmm0
        movq    xmm0,qword ptr [ebx+16]
        movq    qword ptr [edx+ecx+16],xmm0
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
__clip_on_plain endp

_rasterizer_triangle3f proc
        push    ebp
        mov     ebp,esp
        sub     esp,748
        push    edi
        push    esi
        push    ebx
        mov     eax,[ebp+28]
        mov     ecx,[ebp+16]
        mov     edx,[ebp+24]
        mov     ebx,[ebp+12]
        mov     esi,[ebp+20]
        mov     edi,[ebp+8]
; start of inline function _transform_to_projection_space
        mov     [ebp+28],eax
        lea     eax,[ebp-196]
; start of inline function vec4f_assign
        movss   xmm0,dword ptr [edi+8]
        movss   xmm1,dword ptr [edi+4]
        movss   xmm2,dword ptr [edi]
        lea     edi,[ebp-716]
        mov     [ebp+16],ecx
        mov     ecx,edi
        movss   dword ptr [ecx],xmm2
        movss   dword ptr [edi+4],xmm1
        movss   dword ptr [edi+8],xmm0
        mov     dword ptr [edi+12],1065353216
; end of inline function vec4f_assign
        push    (offset __mvproj_matrix)
        lea     ecx,[ebp-716]
        push    ecx
        push    eax
        call    _matrix4f_transform
        add     esp,12
; end of inline function _transform_to_projection_space
        movq    xmm0,qword ptr [esi]
        movq    xmm1,xmm0
; start of inline function _transform_to_projection_space
        mov     edi,ebx
        lea     eax,[ebp-196]
        add     eax,24
; start of inline function vec4f_assign
        movss   xmm0,dword ptr [edi+8]
        movss   xmm2,dword ptr [edi+4]
        movsd   qword ptr [ebp-180],xmm1
        movss   xmm1,xmm2
        movss   xmm2,dword ptr [edi]
        lea     ecx,[ebp-716]
        mov     edx,ecx
        movss   dword ptr [edx],xmm2
        movss   dword ptr [ecx+4],xmm1
        movss   dword ptr [ecx+8],xmm0
        mov     dword ptr [ecx+12],1065353216
; end of inline function vec4f_assign
        push    (offset __mvproj_matrix)
        lea     ecx,[ebp-716]
        push    ecx
        push    eax
        call    _matrix4f_transform
        add     esp,12
; end of inline function _transform_to_projection_space
        mov     eax,[ebp+24]
        movq    xmm0,qword ptr [eax]
        movq    qword ptr [ebp-156],xmm0
; start of inline function _transform_to_projection_space
        mov     eax,[ebp+16]
        mov     edi,eax
        lea     eax,[ebp-196]
        add     eax,48
; start of inline function vec4f_assign
        movss   xmm0,dword ptr [edi+8]
        movss   xmm1,dword ptr [edi+4]
        movss   xmm2,dword ptr [edi]
        lea     ecx,[ebp-716]
        mov     edx,ecx
        movss   dword ptr [edx],xmm2
        movss   dword ptr [ecx+4],xmm1
        movss   dword ptr [ecx+8],xmm0
        mov     dword ptr [ecx+12],1065353216
; end of inline function vec4f_assign
        push    (offset __mvproj_matrix)
        lea     ecx,[ebp-716]
        push    ecx
        push    eax
        call    _matrix4f_transform
        add     esp,12
; end of inline function _transform_to_projection_space
        mov     eax,[ebp+28]
        movq    xmm0,qword ptr [eax]
        movq    qword ptr [ebp-132],xmm0
        movq    xmm0,xmm1
        movq    qword ptr [ebp-124],xmm0
        movq    xmm0,xmm2
        movq    qword ptr [ebp-116],xmm0
        movq    xmm0,qword ptr [ebp-180]
        movq    qword ptr [ebp-108],xmm0
; start of inline function _rasterize_polygon_4f
        lea     eax,[ebp-196]
; start of inline function _clip_poligon
        mov     ecx,eax
        mov     [ebp-200],eax
        mov     [ebp-464],ecx
        push    (offset __clip_z_far_norm)
        push    (offset __clip_z_far_base)
        push    dword ptr [ebp-464]
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_z_near_norm)
        push    (offset __clip_z_near_base)
        lea     eax,[ebp-660]
        push    eax
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_left_norm)
        push    (offset __clip_plane_left_base)
        push    dword ptr [ebp-464]
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_right_norm)
        push    (offset __clip_plane_right_base)
        lea     eax,[ebp-660]
        push    eax
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_top_norm)
        push    (offset __clip_plane_top_base)
        push    dword ptr [ebp-464]
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_bottom_norm)
        push    (offset __clip_plane_bottom_base)
        lea     eax,[ebp-660]
        push    eax
        push    dword ptr [ebp-464]
        call    __clip_on_plain
        add     esp,16
        mov     ecx,[ebp-464]
        cmp     dword ptr [ecx+192],1
        setg    al
        movzx   eax,al
; end of inline function _clip_poligon
        cmp     eax,0
        jne     label0000
        jmp     label002c
label0000:
        mov     eax,[ebp-200]
        cmp     dword ptr [eax+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     ecx,0
label0003:
        mov     edx,[eax+192]
        cmp     edx,ecx
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     edx,eax
        mov     ebx,ecx
        imul    ebx,24
        add     edx,ebx
        lea     ebx,[ebp-332]
        mov     esi,ecx
        sal     esi,4
        add     ebx,esi
        mov     [ebp-200],eax
        mov     [ebp-336],ecx
        push    (offset __viewport_matrix)
        push    edx
        lea     eax,[ebp-688]
        push    eax
        call    _matrix4f_transform
        add     esp,12
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm2,xmm3
        mulss   xmm2,xmm1
        cvttss2si       eax,xmm2
        mov     ecx,ebx
        mov     [ecx],eax
        movss   xmm2,xmm4
        mulss   xmm2,xmm1
        cvttss2si       eax,xmm2
        mov     [ebx+4],eax
        mov     eax,ebx
        cmp     dword ptr [eax],0
        jl      label002a
        mov     eax,ebx
        mov     eax,[eax]
        cmp     eax,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [ebx+4],0
        jl      label002a
        mov     ebx,[ebx+4]
        cmp     ebx,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     eax,[ebp-332]
        mov     ecx,[ebp-336]
        sal     ecx,4
        mov     edx,[ebp-200]
        mov     ebx,[ebp-336]
        imul    ebx,24
        movq    xmm1,qword ptr [edx+ebx+16]
        movq    qword ptr [eax+ecx+8],xmm1
        inc     dword ptr [ebp-336]
        mov     eax,[ebp-200]
        mov     ecx,[ebp-336]
        movss   dword ptr [ebp-676],xmm0
        movsd   qword ptr [ebp-748],xmm1
        movss   dword ptr [ebp-688],xmm3
        movss   dword ptr [ebp-684],xmm4
        jmp     label0003
label0004:
        mov     ecx,2
label0006:
        mov     edx,[eax+192]
        dec     edx
        cmp     edx,ecx
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     edx,[ebp-332]
        mov     ebx,ecx
        sal     ebx,4
        add     edx,ebx
        mov     ebx,ecx
        dec     ebx
        sal     ebx,4
        lea     esi,[ebp-332]
        add     esi,ebx
        lea     ebx,[ebp-332]
        mov     edi,ebx
        mov     [ebp-200],eax
        mov     eax,esi
        mov     edi,[edi+4]
        cmp     edi,[eax+4]
        jle     label0008
        mov     [ebp-352],ebx
        mov     ebx,esi
        mov     eax,[ebp-352]
        mov     esi,eax
label0008:
        mov     eax,ebx
        mov     edi,edx
        mov     eax,[eax+4]
        cmp     eax,[edi+4]
        jle     label0009
        mov     [ebp-352],ebx
        mov     ebx,edx
        mov     eax,[ebp-352]
        mov     edx,eax
label0009:
        mov     eax,esi
        mov     edi,edx
        mov     eax,[eax+4]
        cmp     eax,[edi+4]
        jle     label000a
        mov     [ebp-348],ebx
        mov     ebx,esi
        mov     esi,edx
        mov     edx,ebx
        mov     ebx,[ebp-348]
label000a:
        mov     eax,ebx
        mov     edi,edx
        mov     eax,[eax+4]
        cmp     eax,[edi+4]
        jne     label000b
        mov     eax,ebx
        cmp     dword ptr [eax+4],0
        jl      label000c
        mov     eax,ebx
        mov     eax,[eax+4]
        cmp     eax,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm1,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     eax,8
        add     eax,edx
        mov     edi,8
        add     edi,esi
        mov     [ebp-336],ecx
        mov     ecx,8
        add     ecx,ebx
        mov     [ebp-440],edi
        mov     edi,ebx
        mov     edi,[edi+4]
        mov     edx,[edx]
        mov     esi,[esi]
        mov     ebx,[ebx]
        mov     [ebp-436],eax
        mov     eax,ebx
        cmp     eax,esi
        jge     label001c
        mov     eax,edx
        cmp     eax,esi
        jle     label001d
        movss   dword ptr [esp-4],xmm1
        movss   dword ptr [esp-8],xmm2
        sub     esp,8
        push    dword ptr [ecx+4]
        push    dword ptr [ecx]
        push    edi
        push    edx
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
label001d:
        mov     eax,edx
        cmp     eax,ebx
        jge     label001f
        movss   dword ptr [esp-4],xmm1
        movss   dword ptr [esp-8],xmm2
        sub     esp,8
        mov     eax,[ebp-436]
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        push    edi
        push    esi
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        movss   dword ptr [esp-4],xmm1
        movss   dword ptr [esp-8],xmm2
        sub     esp,8
        push    dword ptr [ecx+4]
        push    dword ptr [ecx]
        push    edi
        push    esi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
label001c:
        mov     ecx,edx
        cmp     ecx,esi
        jge     label0022
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm1
        xorps   xmm2,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm2
        sub     esp,8
        mov     eax,[ebp-436]
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        push    edi
        push    ebx
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
label0022:
        mov     eax,edx
        cmp     eax,ebx
        jle     label0024
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm1
        xorps   xmm2,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm2
        sub     esp,8
        mov     [ebp-448],edi
        mov     edi,[ebp-440]
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    dword ptr [ebp-448]
        push    edx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
label0024:
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm1
        xorps   xmm2,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm2
        sub     esp,8
        mov     [ebp-448],edi
        mov     edi,[ebp-440]
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    dword ptr [ebp-448]
        push    ebx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
        mov     ecx,[ebp-336]
label000c:
        jmp     label0027
label000b:
        mov     eax,ebx
        mov     eax,[eax+4]
label000e:
        mov     edi,esi
        mov     edi,[edi+4]
        cmp     edi,eax
        jle     label000f
        mov     edi,ebx
        mov     [ebp-364],eax
        mov     eax,[ebp-364]
        sub     eax,[edi+4]
        mov     edi,esi
        mov     [ebp-336],ecx
        mov     ecx,ebx
        mov     edi,[edi]
        sub     edi,[ecx]
        imul    eax,edi
        mov     ecx,esi
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        mov     [ebp-340],edx
        cdq
        idiv    ecx
        mov     ecx,ebx
        add     eax,[ecx]
        mov     ecx,ebx
        mov     [ebp-356],eax
        mov     eax,[ebp-364]
        sub     eax,[ecx+4]
        mov     ecx,[ebp-340]
        mov     edx,ebx
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     ecx,[ebp-340]
        mov     edx,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cdq
        idiv    ecx
        mov     ecx,ebx
        add     eax,[ecx]
        mov     ecx,ebx
        mov     edx,[ebp-364]
        sub     edx,[ecx+4]
        cvtsi2ss        xmm1,edx
        movss   xmm2,dword ptr [esi+8]
        subss   xmm2,dword ptr [ebx+8]
        mulss   xmm1,xmm2
        mov     ecx,esi
        mov     edx,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm0,ecx
        divss   xmm1,xmm0
        addss   xmm1,dword ptr [ebx+8]
        mov     ecx,ebx
        mov     edx,[ebp-364]
        sub     edx,[ecx+4]
        cvtsi2ss        xmm0,edx
        mov     edx,[ebp-340]
        movss   xmm2,dword ptr [edx+8]
        subss   xmm2,dword ptr [ebx+8]
        mulss   xmm0,xmm2
        mov     ecx,edx
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm0,xmm2
        addss   xmm0,dword ptr [ebx+8]
        mov     ecx,ebx
        mov     edi,[ebp-364]
        sub     edi,[ecx+4]
        cvtsi2ss        xmm2,edi
        movss   xmm3,dword ptr [esi+12]
        subss   xmm3,dword ptr [ebx+12]
        mulss   xmm2,xmm3
        mov     ecx,esi
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        addss   xmm2,dword ptr [ebx+12]
        mov     ecx,ebx
        mov     edi,[ebp-364]
        sub     edi,[ecx+4]
        cvtsi2ss        xmm3,edi
        movss   xmm4,dword ptr [edx+12]
        subss   xmm4,dword ptr [ebx+12]
        mulss   xmm3,xmm4
        mov     ecx,edx
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        addss   xmm3,dword ptr [ebx+12]
        mov     ecx,eax
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm0
        subss   xmm5,xmm1
        divss   xmm5,xmm4
        mov     ecx,eax
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     ecx,[ebp-364]
        mov     edi,[ebp-356]
        mov     [ebp-340],edx
        mov     edx,edi
        cmp     edx,eax
        jg      label0013
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm2
        movss   dword ptr [esp-16],xmm1
        sub     esp,16
        push    ecx
        push    eax
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
label0013:
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    ecx
        push    edi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-364]
        mov     eax,[ebp-364]
        mov     ecx,[ebp-336]
        mov     edx,[ebp-340]
        jmp     label000e
label000f:
        mov     eax,esi
        mov     edi,ebx
        mov     [ebp-740],eax
        mov     [ebp-336],ecx
        mov     ecx,[ebp-740]
        mov     eax,[ecx+4]
        sub     eax,[edi+4]
        mov     ecx,edx
        mov     edi,ebx
        mov     ecx,[ecx]
        sub     ecx,[edi]
        imul    eax,ecx
        mov     ecx,edx
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        mov     [ebp-340],edx
        cdq
        idiv    ecx
        mov     ecx,ebx
        add     eax,[ecx]
        mov     ecx,esi
        mov     edx,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm1,ecx
        mov     edx,[ebp-340]
        movss   xmm2,dword ptr [edx+8]
        subss   xmm2,dword ptr [ebx+8]
        mulss   xmm1,xmm2
        mov     ecx,edx
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm0,ecx
        divss   xmm1,xmm0
        addss   xmm1,dword ptr [ebx+8]
        movss   xmm0,xmm1
        mov     ecx,esi
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm1,ecx
        movss   xmm2,dword ptr [edx+12]
        subss   xmm2,dword ptr [ebx+12]
        mulss   xmm1,xmm2
        mov     ecx,edx
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [ebx+12]
        movss   xmm3,xmm1
        movss   xmm1,xmm0
        subss   xmm1,dword ptr [esi+8]
        mov     ecx,esi
        mov     edi,eax
        sub     edi,[ecx]
        cvtsi2ss        xmm2,edi
        divss   xmm1,xmm2
        movss   xmm5,xmm1
        movss   xmm1,xmm3
        subss   xmm1,dword ptr [esi+12]
        mov     ecx,esi
        mov     edi,eax
        sub     edi,[ecx]
        cvtsi2ss        xmm2,edi
        divss   xmm1,xmm2
        movss   xmm6,xmm1
; start of inline function _rasterize_horiz_line__unordered
        movss   xmm1,dword ptr [esi+12]
        movss   dword ptr [ebp-380],xmm3
        movss   xmm3,xmm1
        movss   xmm1,dword ptr [esi+8]
        movss   dword ptr [ebp-376],xmm0
        movss   xmm0,xmm1
        movss   xmm1,dword ptr [ebp-380]
        movss   xmm2,xmm1
        movss   xmm1,dword ptr [ebp-376]
        mov     ecx,esi
        mov     ecx,[ecx+4]
        mov     edi,esi
        mov     edi,[edi]
        mov     [ebp-360],eax
        mov     eax,edi
        mov     edi,[ebp-360]
        mov     [ebp-348],ebx
        mov     ebx,edi
        cmp     ebx,eax
        jg      label0016
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm2
        movss   dword ptr [esp-16],xmm1
        sub     esp,16
        push    ecx
        push    eax
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
label0016:
        mov     [ebp-340],edx
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    ecx
        push    edi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     eax,esi
        mov     ecx,1
        add     ecx,[eax+4]
        mov     eax,ecx
label0011:
        mov     edi,[ebp-340]
        mov     edi,[edi+4]
        cmp     edi,eax
        jle     label0012
        mov     ecx,esi
        mov     [ebp-364],eax
        mov     eax,[ebp-364]
        sub     eax,[ecx+4]
        mov     ecx,[ebp-340]
        mov     edx,esi
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     ecx,[ebp-340]
        mov     edx,esi
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cdq
        idiv    ecx
        mov     ecx,esi
        add     eax,[ecx]
        mov     ecx,[ebp-348]
        mov     [ebp-356],eax
        mov     eax,[ebp-364]
        sub     eax,[ecx+4]
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cdq
        idiv    ecx
        mov     ecx,[ebp-348]
        add     eax,[ecx]
        mov     ecx,esi
        mov     edx,[ebp-364]
        sub     edx,[ecx+4]
        cvtsi2ss        xmm0,edx
        mov     edx,[ebp-340]
        movss   xmm3,dword ptr [edx+8]
        subss   xmm3,dword ptr [esi+8]
        mulss   xmm0,xmm3
        mov     ecx,edx
        mov     ebx,esi
        mov     ecx,[ecx+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm5,ecx
        divss   xmm0,xmm5
        addss   xmm0,dword ptr [esi+8]
        movss   xmm1,xmm0
        mov     ecx,[ebp-348]
        mov     ebx,[ebp-364]
        sub     ebx,[ecx+4]
        cvtsi2ss        xmm6,ebx
        movss   xmm0,dword ptr [edx+8]
        mov     ebx,[ebp-348]
        subss   xmm0,dword ptr [ebx+8]
        mulss   xmm6,xmm0
        mov     ecx,edx
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm0,ecx
        divss   xmm6,xmm0
        addss   xmm6,dword ptr [ebx+8]
        movss   xmm0,xmm6
        mov     ecx,esi
        mov     edi,[ebp-364]
        sub     edi,[ecx+4]
        cvtsi2ss        xmm2,edi
        movss   xmm3,dword ptr [edx+12]
        subss   xmm3,dword ptr [esi+12]
        mulss   xmm2,xmm3
        mov     ecx,edx
        mov     edi,esi
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        addss   xmm2,dword ptr [esi+12]
        mov     ecx,ebx
        mov     edi,[ebp-364]
        sub     edi,[ecx+4]
        cvtsi2ss        xmm3,edi
        movss   xmm4,dword ptr [edx+12]
        subss   xmm4,dword ptr [ebx+12]
        mulss   xmm3,xmm4
        mov     ecx,edx
        mov     edi,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        addss   xmm3,dword ptr [ebx+12]
        mov     ecx,eax
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm0
        subss   xmm5,xmm1
        divss   xmm5,xmm4
        mov     ecx,eax
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     ecx,[ebp-364]
        mov     edi,[ebp-356]
        mov     [ebp-340],edx
        mov     edx,edi
        cmp     edx,eax
        jg      label0019
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm2
        movss   dword ptr [esp-16],xmm1
        sub     esp,16
        push    ecx
        push    eax
        push    edi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    ecx
        push    edi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-364]
        mov     eax,[ebp-364]
        mov     [ebp-348],ebx
        jmp     label0011
label0012:
        mov     ecx,[ebp-336]
label0027:
; end of inline function _rasterize_triangle_2i
        inc     ecx
        mov     eax,[ebp-200]
        jmp     label0006
label0007:
label002c:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
