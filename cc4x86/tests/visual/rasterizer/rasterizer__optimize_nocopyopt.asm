
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
        mulss   xmm2,xmm5
        movss   xmm6,xmm2
        mulss   xmm6,xmm3
        movss   xmm3,xmm5
        divss   xmm3,xmm6
        movss   dword ptr [__mvproj_matrix],xmm3
        mov     dword ptr [__mvproj_matrix+4],0
        mov     dword ptr [__mvproj_matrix+8],0
        mov     dword ptr [__mvproj_matrix+12],0
        mov     dword ptr [__mvproj_matrix+16],0
        movss   xmm3,xmm5
        divss   xmm3,xmm2
        movss   dword ptr [__mvproj_matrix+20],xmm3
        mov     dword ptr [__mvproj_matrix+24],0
        mov     dword ptr [__mvproj_matrix+28],0
        mov     dword ptr [__mvproj_matrix+32],0
        mov     dword ptr [__mvproj_matrix+36],0
        movss   xmm2,xmm4
        subss   xmm2,xmm5
        movss   xmm3,xmm4
        divss   xmm3,xmm2
        movss   dword ptr [__mvproj_matrix+40],xmm3
        mov     dword ptr [__mvproj_matrix+44],1065353216
        mov     dword ptr [__mvproj_matrix+48],0
        mov     dword ptr [__mvproj_matrix+52],0
        movss   xmm2,xmm5
        mulss   xmm2,xmm4
        subss   xmm5,xmm4
        divss   xmm2,xmm5
        movss   dword ptr [__mvproj_matrix+56],xmm2
        mov     dword ptr [__mvproj_matrix+60],0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   xmm2,xmm1
        movss   xmm3,xmm0
        cvtsi2ss        xmm4,ecx
        cvtsi2ss        xmm5,edx
        movss   xmm6,xmm5
        mulss   xmm6,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix],xmm6
        mov     dword ptr [__viewport_matrix+4],0
        mov     dword ptr [__viewport_matrix+8],0
        mov     dword ptr [__viewport_matrix+12],0
        mov     dword ptr [__viewport_matrix+16],0
        movss   xmm6,xmm4
        xorps   xmm6,dword ptr [___unnamed_float4_4]
        mulss   xmm6,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+20],xmm6
        mov     dword ptr [__viewport_matrix+24],0
        mov     dword ptr [__viewport_matrix+28],0
        mov     dword ptr [__viewport_matrix+32],0
        mov     dword ptr [__viewport_matrix+36],0
        subss   xmm2,xmm3
        movss   dword ptr [__viewport_matrix+40],xmm2
        mov     dword ptr [__viewport_matrix+44],0
        mulss   xmm5,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+48],xmm5
        mulss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+52],xmm4
        movss   dword ptr [__viewport_matrix+56],xmm3
        mov     dword ptr [__viewport_matrix+60],1065353216
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   xmm2,xmm0
        mov     dword ptr [__clip_z_near_base],0
        mov     dword ptr [__clip_z_near_base+4],0
        movss   dword ptr [__clip_z_near_base+8],xmm2
        mov     dword ptr [__clip_z_near_base+12],1065353216
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
        mov     dword ptr [__clip_z_near_norm],0
        mov     dword ptr [__clip_z_near_norm+4],0
        movss   dword ptr [__clip_z_near_norm+8],xmm2
        mov     dword ptr [__clip_z_near_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm2,xmm1
        mov     dword ptr [__clip_z_far_base],0
        mov     dword ptr [__clip_z_far_base+4],0
        movss   dword ptr [__clip_z_far_base+8],xmm2
        mov     dword ptr [__clip_z_far_base+12],1065353216
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
        mov     dword ptr [__clip_z_far_norm],0
        mov     dword ptr [__clip_z_far_norm+4],0
        movss   dword ptr [__clip_z_far_norm+8],xmm2
        mov     dword ptr [__clip_z_far_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        movss   dword ptr [__clip_plane_left_base],xmm0
        mov     dword ptr [__clip_plane_left_base+4],0
        mov     dword ptr [__clip_plane_left_base+8],0
        mov     dword ptr [__clip_plane_left_base+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_left_norm],1065353216
        mov     dword ptr [__clip_plane_left_norm+4],0
        mov     dword ptr [__clip_plane_left_norm+8],0
        mov     dword ptr [__clip_plane_left_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm1
        movss   dword ptr [__clip_plane_right_base],xmm0
        mov     dword ptr [__clip_plane_right_base+4],0
        mov     dword ptr [__clip_plane_right_base+8],0
        mov     dword ptr [__clip_plane_right_base+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_right_norm],-1082130432
        mov     dword ptr [__clip_plane_right_norm+4],0
        mov     dword ptr [__clip_plane_right_norm+8],0
        mov     dword ptr [__clip_plane_right_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm1
        mov     dword ptr [__clip_plane_top_base],0
        movss   dword ptr [__clip_plane_top_base+4],xmm0
        mov     dword ptr [__clip_plane_top_base+8],0
        mov     dword ptr [__clip_plane_top_base+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_top_norm],0
        mov     dword ptr [__clip_plane_top_norm+4],1065353216
        mov     dword ptr [__clip_plane_top_norm+8],0
        mov     dword ptr [__clip_plane_top_norm+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_bottom_base],0
        mov     dword ptr [__clip_plane_bottom_base+4],1065353216
        mov     dword ptr [__clip_plane_bottom_base+8],0
        mov     dword ptr [__clip_plane_bottom_base+12],1065353216
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        mov     dword ptr [__clip_plane_bottom_norm],0
        mov     dword ptr [__clip_plane_bottom_norm+4],-1082130432
        mov     dword ptr [__clip_plane_bottom_norm+8],0
        mov     dword ptr [__clip_plane_bottom_norm+12],1065353216
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
        mov     esi,ebx
        mov     dword ptr [esi+192],0
        mov     esi,edx
        mov     edi,edx
        add     edi,24
label0001:
        mov     [ebp+8],ebx
        mov     ebx,edx
        mov     ebx,[ebx+192]
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
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        mov     esi,edx
        movss   dword ptr [esi+4],xmm0
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        mov     esi,edx
        movss   dword ptr [esi+8],xmm0
        movss   xmm0,dword ptr [ebx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     edx,[ebp-24]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [esi+4]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [esi]
        addss   xmm1,xmm0
        mov     ebx,edx
        mov     esi,eax
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [esi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        mov     eax,ecx
        mov     edx,[ebp-8]
        mov     ebx,edx
        lea     edx,[ebp-24]
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        mov     esi,edx
        movss   dword ptr [esi],xmm0
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        mov     esi,edx
        movss   dword ptr [esi+4],xmm0
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        mov     esi,edx
        movss   dword ptr [esi+8],xmm0
        movss   xmm0,dword ptr [ebx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     edx,[ebp-24]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [esi+4]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm2,dword ptr [ebx]
        mulss   xmm2,dword ptr [esi]
        addss   xmm2,xmm0
        mov     ebx,edx
        mov     esi,eax
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [esi+8]
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
        mov     eax,[ebp+8]
        mov     edx,[eax+192]
        inc     dword ptr [eax+192]
        imul    edx,24
        mov     eax,[ebp+8]
        mov     ebx,[ebp-4]
        movq    xmm0,qword ptr [ebx]
        movq    qword ptr [eax+edx],xmm0
        movq    xmm0,qword ptr [ebx+8]
        movq    qword ptr [eax+edx+8],xmm0
        movq    xmm0,qword ptr [ebx+16]
        movq    qword ptr [eax+edx+16],xmm0
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
        mov     ebx,edx
        lea     edx,[ebp-24]
        mov     esi,ebx
        mov     edi,eax
        movss   xmm1,dword ptr [esi]
        subss   xmm1,dword ptr [edi]
        mov     esi,edx
        movss   dword ptr [esi],xmm1
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        mov     esi,edx
        movss   dword ptr [esi+4],xmm0
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        mov     esi,edx
        movss   dword ptr [esi+8],xmm0
        movss   xmm0,dword ptr [ebx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     eax,[ebp-4]
        mov     edx,[ebp-8]
        mov     ebx,edx
        lea     edx,[ebp-40]
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        mov     esi,edx
        movss   dword ptr [esi],xmm0
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        mov     esi,edx
        movss   dword ptr [esi+4],xmm0
        mov     esi,ebx
        mov     edi,eax
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        mov     esi,edx
        movss   dword ptr [esi+8],xmm0
        movss   xmm0,dword ptr [ebx+12]
        subss   xmm0,dword ptr [eax+12]
        movss   dword ptr [edx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     edx,[ebp-24]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [esi+4]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [esi]
        addss   xmm1,xmm0
        mov     ebx,edx
        mov     esi,eax
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [esi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [eax+12]
        addss   xmm1,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        lea     edx,[ebp-40]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [esi+4]
        mov     ebx,edx
        mov     esi,eax
        movss   xmm2,dword ptr [ebx]
        mulss   xmm2,dword ptr [esi]
        addss   xmm2,xmm0
        mov     ebx,edx
        mov     esi,eax
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [esi+8]
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
        mov     edx,eax
        movss   xmm2,dword ptr [edx+4]
        mulss   xmm2,xmm0
        movss   dword ptr [edx+4],xmm2
        mov     edx,eax
        movss   xmm2,dword ptr [edx+8]
        mulss   xmm2,xmm0
        movss   dword ptr [edx+8],xmm2
        movss   xmm2,dword ptr [eax+12]
        mulss   xmm2,xmm0
        movss   dword ptr [eax+12],xmm2
; end of inline function vec4f_mul
; start of inline function vec4f_add
        lea     eax,[ebp-40]
        mov     edx,[ebp-4]
        mov     ebx,[ebp+8]
        mov     ebx,[ebx+192]
        imul    ebx,24
        mov     esi,[ebp+8]
        add     esi,ebx
        mov     ebx,edx
        mov     edi,eax
        movss   xmm0,dword ptr [ebx]
        addss   xmm0,dword ptr [edi]
        mov     ebx,esi
        movss   dword ptr [ebx],xmm0
        mov     ebx,edx
        mov     edi,eax
        movss   xmm0,dword ptr [ebx+4]
        addss   xmm0,dword ptr [edi+4]
        mov     ebx,esi
        movss   dword ptr [ebx+4],xmm0
        mov     ebx,edx
        mov     edi,eax
        movss   xmm0,dword ptr [ebx+8]
        addss   xmm0,dword ptr [edi+8]
        mov     ebx,esi
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        addss   xmm0,dword ptr [eax+12]
        movss   dword ptr [esi+12],xmm0
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     eax,[ebp-4]
        add     eax,16
        mov     edx,[ebp-8]
        add     edx,16
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
        mov     edx,[ebp-4]
        add     edx,16
        mov     ebx,[ebp+8]
        mov     ebx,[ebx+192]
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
        mov     eax,[ebp+8]
        inc     dword ptr [eax+192]
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
        mov     ecx,[ebp+8]
        mov     edx,[ecx+192]
        inc     dword ptr [ecx+192]
        imul    edx,24
        mov     esi,[ebp+8]
        mov     edi,[ebp+8]
        movq    xmm0,qword ptr [edi]
        movq    qword ptr [esi+edx],xmm0
        movq    xmm0,qword ptr [edi+8]
        movq    qword ptr [esi+edx+8],xmm0
        movq    xmm0,qword ptr [edi+16]
        movq    qword ptr [esi+edx+16],xmm0
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
__clip_on_plain endp

__transform_to_projection_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,48
        mov     eax,[ebp+8]
        mov     ecx,[ebp+12]
; start of inline function vec4f_assign
        mov     edx,ecx
        movss   xmm0,dword ptr [edx+8]
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+4]
        movss   xmm2,dword ptr [ecx]
        lea     ecx,[ebp-16]
        mov     edx,ecx
        movss   dword ptr [edx],xmm2
        mov     edx,ecx
        movss   dword ptr [edx+4],xmm1
        mov     edx,ecx
        movss   dword ptr [edx+8],xmm0
        mov     dword ptr [ecx+12],1065353216
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        lea     ecx,[ebp-16]
        mov     edx,ecx
        movss   xmm0,dword ptr [edx+4]
        mulss   xmm0,dword ptr [__mvproj_matrix+16]
        mov     edx,ecx
        movss   xmm1,dword ptr [edx]
        mulss   xmm1,dword ptr [__mvproj_matrix]
        addss   xmm1,xmm0
        mov     edx,ecx
        movss   xmm0,dword ptr [edx+8]
        mulss   xmm0,dword ptr [__mvproj_matrix+32]
        addss   xmm1,xmm0
        mov     edx,ecx
        movss   xmm0,dword ptr [edx+12]
        mulss   xmm0,dword ptr [__mvproj_matrix+48]
        addss   xmm1,xmm0
        mov     edx,eax
        movss   dword ptr [edx],xmm1
        mov     edx,ecx
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [__mvproj_matrix+4]
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [__mvproj_matrix+20]
        addss   xmm0,xmm1
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [__mvproj_matrix+36]
        addss   xmm0,xmm1
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [__mvproj_matrix+52]
        addss   xmm0,xmm1
        mov     edx,eax
        movss   dword ptr [edx+4],xmm0
        mov     edx,ecx
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [__mvproj_matrix+8]
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [__mvproj_matrix+24]
        addss   xmm0,xmm1
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [__mvproj_matrix+40]
        addss   xmm0,xmm1
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+12]
        mulss   xmm1,dword ptr [__mvproj_matrix+56]
        addss   xmm0,xmm1
        mov     edx,eax
        movss   dword ptr [edx+8],xmm0
        mov     edx,ecx
        movss   xmm0,dword ptr [edx]
        mulss   xmm0,dword ptr [__mvproj_matrix+12]
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+4]
        mulss   xmm1,dword ptr [__mvproj_matrix+28]
        addss   xmm0,xmm1
        mov     edx,ecx
        movss   xmm1,dword ptr [edx+8]
        mulss   xmm1,dword ptr [__mvproj_matrix+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ecx+12]
        mulss   xmm1,dword ptr [__mvproj_matrix+60]
        addss   xmm0,xmm1
        movss   dword ptr [eax+12],xmm0
; end of inline function matrix4f_transform
        mov     esp,ebp
        pop     ebp
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        push    ebp
        mov     ebp,esp
        sub     esp,712
        push    edi
        push    esi
        push    ebx
        mov     eax,[ebp+28]
        mov     ecx,[ebp+24]
        mov     edx,[ebp+20]
        push    dword ptr [ebp+8]
        lea     eax,[ebp-196]
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     eax,[ebp+20]
        movq    xmm0,qword ptr [eax]
        movq    qword ptr [ebp-180],xmm0
        push    dword ptr [ebp+12]
        lea     eax,[ebp-196]
        add     eax,24
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     eax,[ebp+24]
        movq    xmm0,qword ptr [eax]
        movq    qword ptr [ebp-156],xmm0
        push    dword ptr [ebp+16]
        lea     eax,[ebp-196]
        add     eax,48
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     eax,[ebp+28]
        movq    xmm0,qword ptr [eax]
        movq    qword ptr [ebp-132],xmm0
        movq    xmm0,qword ptr [ebp-196]
        movq    qword ptr [ebp-124],xmm0
        movq    xmm0,qword ptr [ebp-188]
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
        mov     eax,0
label0003:
        mov     ecx,[ebp-200]
        mov     ecx,[ecx+192]
        cmp     ecx,eax
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     ecx,[ebp-200]
        mov     edx,eax
        imul    edx,24
        add     ecx,edx
        lea     edx,[ebp-332]
        mov     ebx,eax
        sal     ebx,4
        add     edx,ebx
; start of inline function matrix4f_transform
        lea     ebx,[ebp-688]
        mov     esi,ecx
        movss   xmm0,dword ptr [esi+4]
        mulss   xmm0,dword ptr [__viewport_matrix+16]
        mov     esi,ecx
        movss   xmm1,dword ptr [esi]
        mulss   xmm1,dword ptr [__viewport_matrix]
        addss   xmm1,xmm0
        mov     esi,ecx
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [__viewport_matrix+32]
        addss   xmm1,xmm0
        mov     esi,ecx
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [__viewport_matrix+48]
        addss   xmm1,xmm0
        mov     esi,ebx
        movss   dword ptr [esi],xmm1
        mov     esi,ecx
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [__viewport_matrix+4]
        mov     esi,ecx
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [__viewport_matrix+20]
        addss   xmm0,xmm1
        mov     esi,ecx
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [__viewport_matrix+36]
        addss   xmm0,xmm1
        mov     esi,ecx
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [__viewport_matrix+52]
        addss   xmm0,xmm1
        mov     esi,ebx
        movss   dword ptr [esi+4],xmm0
        mov     esi,ecx
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [__viewport_matrix+8]
        mov     esi,ecx
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [__viewport_matrix+24]
        addss   xmm0,xmm1
        mov     esi,ecx
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [__viewport_matrix+40]
        addss   xmm0,xmm1
        mov     esi,ecx
        movss   xmm1,dword ptr [esi+12]
        mulss   xmm1,dword ptr [__viewport_matrix+56]
        addss   xmm0,xmm1
        mov     esi,ebx
        movss   dword ptr [esi+8],xmm0
        mov     esi,ecx
        movss   xmm0,dword ptr [esi]
        mulss   xmm0,dword ptr [__viewport_matrix+12]
        mov     esi,ecx
        movss   xmm1,dword ptr [esi+4]
        mulss   xmm1,dword ptr [__viewport_matrix+28]
        addss   xmm0,xmm1
        mov     esi,ecx
        movss   xmm1,dword ptr [esi+8]
        mulss   xmm1,dword ptr [__viewport_matrix+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ecx+12]
        mulss   xmm1,dword ptr [__viewport_matrix+60]
        addss   xmm0,xmm1
        movss   dword ptr [ebx+12],xmm0
; end of inline function matrix4f_transform
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,dword ptr [ebp-676]
        movss   xmm1,dword ptr [ebp-688]
        mulss   xmm1,xmm0
        cvttss2si       ecx,xmm1
        mov     ebx,edx
        mov     [ebx],ecx
        movss   xmm1,dword ptr [ebp-684]
        mulss   xmm1,xmm0
        cvttss2si       ecx,xmm1
        mov     ebx,edx
        mov     [ebx+4],ecx
        mov     ecx,edx
        cmp     dword ptr [ecx],0
        jl      label002a
        mov     ecx,edx
        mov     ecx,[ecx]
        cmp     ecx,dword ptr [__width]
        jge     label002a
        mov     ecx,edx
        cmp     dword ptr [ecx+4],0
        jl      label002a
        mov     edx,[edx+4]
        cmp     edx,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     ecx,[ebp-332]
        mov     edx,eax
        sal     edx,4
        mov     ebx,[ebp-200]
        mov     esi,eax
        imul    esi,24
        movq    xmm0,qword ptr [ebx+esi+16]
        movq    qword ptr [ecx+edx+8],xmm0
        inc     eax
        movsd   qword ptr [ebp-712],xmm0
        jmp     label0003
label0004:
        mov     eax,2
label0006:
        mov     ecx,[ebp-200]
        mov     ecx,[ecx+192]
        dec     ecx
        cmp     ecx,eax
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     ecx,[ebp-332]
        mov     edx,eax
        sal     edx,4
        add     ecx,edx
        mov     edx,eax
        dec     edx
        sal     edx,4
        lea     ebx,[ebp-332]
        add     ebx,edx
        lea     edx,[ebp-332]
        mov     esi,edx
        mov     edi,ebx
        mov     esi,[esi+4]
        cmp     esi,[edi+4]
        jle     label0008
        mov     [ebp-352],edx
        mov     edx,ebx
        mov     ebx,[ebp-352]
label0008:
        mov     esi,edx
        mov     edi,ecx
        mov     esi,[esi+4]
        cmp     esi,[edi+4]
        jle     label0009
        mov     [ebp-352],edx
        mov     edx,ecx
        mov     ecx,[ebp-352]
label0009:
        mov     esi,ebx
        mov     edi,ecx
        mov     esi,[esi+4]
        cmp     esi,[edi+4]
        jle     label000a
        mov     [ebp-348],edx
        mov     edx,ebx
        mov     ebx,ecx
        mov     ecx,edx
        mov     edx,[ebp-348]
label000a:
        mov     esi,edx
        mov     edi,ecx
        mov     esi,[esi+4]
        cmp     esi,[edi+4]
        jne     label000b
        mov     esi,edx
        cmp     dword ptr [esi+4],0
        jl      label000c
        mov     esi,edx
        mov     esi,[esi+4]
        cmp     esi,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     esi,ecx
        add     esi,8
        mov     edi,ebx
        add     edi,8
        mov     [ebp-336],eax
        mov     eax,edx
        add     eax,8
        mov     [ebp-440],edi
        mov     edi,edx
        mov     edi,[edi+4]
        mov     ecx,[ecx]
        mov     ebx,[ebx]
        mov     edx,[edx]
        mov     [ebp-436],esi
        mov     esi,edx
        cmp     esi,ebx
        jge     label001c
        mov     esi,ecx
        cmp     esi,ebx
        jle     label001d
        movss   dword ptr [esp-4],xmm0
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        mov     ebx,eax
        push    dword ptr [ebx+4]
        push    dword ptr [eax]
        push    edi
        push    ecx
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
label001d:
        mov     esi,ecx
        cmp     esi,edx
        jge     label001f
        movss   dword ptr [esp-4],xmm0
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        mov     eax,[ebp-436]
        push    dword ptr [eax+4]
        mov     edx,[ebp-436]
        push    dword ptr [edx]
        push    edi
        push    ebx
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        movss   dword ptr [esp-4],xmm0
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        mov     ecx,eax
        push    dword ptr [ecx+4]
        push    dword ptr [eax]
        push    edi
        push    ebx
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
label001c:
        mov     eax,ecx
        cmp     eax,ebx
        jge     label0022
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        mov     ebx,[ebp-436]
        push    dword ptr [ebx+4]
        mov     eax,[ebp-436]
        push    dword ptr [eax]
        push    edi
        push    edx
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
label0022:
        mov     eax,ecx
        cmp     eax,edx
        jle     label0024
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        mov     edx,[ebp-440]
        push    dword ptr [edx+4]
        mov     eax,[ebp-440]
        push    dword ptr [eax]
        push    edi
        push    ecx
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
label0024:
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        mov     ecx,[ebp-440]
        push    dword ptr [ecx+4]
        mov     eax,[ebp-440]
        push    dword ptr [eax]
        push    edi
        push    edx
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
        mov     eax,[ebp-336]
label000c:
        jmp     label0027
label000b:
        mov     esi,edx
        mov     esi,[esi+4]
label000e:
        mov     edi,ebx
        mov     edi,[edi+4]
        cmp     edi,esi
        jle     label000f
        mov     edi,edx
        mov     [ebp-336],eax
        mov     eax,esi
        sub     eax,[edi+4]
        mov     edi,ebx
        mov     [ebp-340],ecx
        mov     ecx,edx
        mov     edi,[edi]
        sub     edi,[ecx]
        imul    eax,edi
        mov     ecx,ebx
        mov     edi,edx
        mov     ecx,[ecx+4]
        sub     ecx,[edi+4]
        mov     [ebp-348],edx
        cdq
        idiv    ecx
        mov     ecx,[ebp-348]
        add     eax,[ecx]
        mov     ecx,[ebp-348]
        mov     [ebp-356],eax
        mov     eax,esi
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
        mov     ecx,[ebp-348]
        mov     edx,esi
        sub     edx,[ecx+4]
        cvtsi2ss        xmm0,edx
        mov     ecx,ebx
        mov     edx,[ebp-348]
        movss   xmm1,dword ptr [ecx+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm0,xmm1
        mov     ecx,ebx
        mov     edx,[ebp-348]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        mov     ecx,[ebp-348]
        addss   xmm0,dword ptr [ecx+8]
        mov     ecx,[ebp-348]
        mov     edx,esi
        sub     edx,[ecx+4]
        cvtsi2ss        xmm1,edx
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        movss   xmm2,dword ptr [ecx+8]
        subss   xmm2,dword ptr [edx+8]
        mulss   xmm1,xmm2
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        mov     ecx,[ebp-348]
        addss   xmm1,dword ptr [ecx+8]
        mov     ecx,[ebp-348]
        mov     edx,esi
        sub     edx,[ecx+4]
        cvtsi2ss        xmm2,edx
        mov     ecx,ebx
        mov     edx,[ebp-348]
        movss   xmm3,dword ptr [ecx+12]
        subss   xmm3,dword ptr [edx+12]
        mulss   xmm2,xmm3
        mov     ecx,ebx
        mov     edx,[ebp-348]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        mov     ecx,[ebp-348]
        addss   xmm2,dword ptr [ecx+12]
        mov     ecx,[ebp-348]
        mov     edx,esi
        sub     edx,[ecx+4]
        cvtsi2ss        xmm3,edx
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        movss   xmm4,dword ptr [ecx+12]
        subss   xmm4,dword ptr [edx+12]
        mulss   xmm3,xmm4
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        mov     ecx,[ebp-348]
        addss   xmm3,dword ptr [ecx+12]
        mov     ecx,eax
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     ecx,eax
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     ecx,esi
        mov     edx,[ebp-356]
        mov     edi,edx
        cmp     edi,eax
        jg      label0013
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm2
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    ecx
        push    eax
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
label0013:
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm1
        sub     esp,16
        push    ecx
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     esi
        mov     eax,[ebp-336]
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        jmp     label000e
label000f:
        mov     esi,ebx
        mov     edi,edx
        mov     [ebp-336],eax
        mov     eax,[esi+4]
        sub     eax,[edi+4]
        mov     esi,ecx
        mov     edi,edx
        mov     esi,[esi]
        sub     esi,[edi]
        imul    eax,esi
        mov     esi,ecx
        mov     edi,edx
        mov     esi,[esi+4]
        sub     esi,[edi+4]
        mov     [ebp-348],edx
        cdq
        idiv    esi
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     edx,ebx
        mov     esi,[ebp-348]
        mov     edx,[edx+4]
        sub     edx,[esi+4]
        cvtsi2ss        xmm0,edx
        mov     edx,ecx
        mov     esi,[ebp-348]
        movss   xmm1,dword ptr [edx+8]
        subss   xmm1,dword ptr [esi+8]
        mulss   xmm0,xmm1
        mov     edx,ecx
        mov     esi,[ebp-348]
        mov     edx,[edx+4]
        sub     edx,[esi+4]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        mov     edx,[ebp-348]
        addss   xmm0,dword ptr [edx+8]
        movss   xmm1,xmm0
        mov     edx,ebx
        mov     esi,[ebp-348]
        mov     edx,[edx+4]
        sub     edx,[esi+4]
        cvtsi2ss        xmm0,edx
        mov     edx,ecx
        mov     esi,[ebp-348]
        movss   xmm2,dword ptr [edx+12]
        subss   xmm2,dword ptr [esi+12]
        mulss   xmm0,xmm2
        mov     edx,ecx
        mov     esi,[ebp-348]
        mov     edx,[edx+4]
        sub     edx,[esi+4]
        cvtsi2ss        xmm2,edx
        divss   xmm0,xmm2
        mov     edx,[ebp-348]
        addss   xmm0,dword ptr [edx+12]
        movss   xmm3,xmm0
        mov     edx,ebx
        movss   xmm0,xmm1
        subss   xmm0,dword ptr [edx+8]
        mov     edx,ebx
        mov     esi,eax
        sub     esi,[edx]
        cvtsi2ss        xmm2,esi
        divss   xmm0,xmm2
        movss   xmm5,xmm0
        mov     edx,ebx
        movss   xmm0,xmm3
        subss   xmm0,dword ptr [edx+12]
        mov     edx,ebx
        mov     esi,eax
        sub     esi,[edx]
        cvtsi2ss        xmm2,esi
        divss   xmm0,xmm2
        movss   xmm6,xmm0
; start of inline function _rasterize_horiz_line__unordered
        mov     edx,ebx
        movss   xmm0,dword ptr [edx+12]
        movss   dword ptr [ebp-380],xmm3
        movss   xmm3,xmm0
        mov     edx,ebx
        movss   xmm0,dword ptr [edx+8]
        movss   dword ptr [ebp-376],xmm1
        movss   xmm1,xmm0
        movss   xmm0,dword ptr [ebp-380]
        movss   xmm2,xmm0
        movss   xmm0,dword ptr [ebp-376]
        mov     edx,ebx
        mov     edx,[edx+4]
        mov     [ebp-340],ecx
        mov     ecx,edx
        mov     edx,ebx
        mov     edx,[edx]
        mov     [ebp-360],eax
        mov     eax,edx
        mov     edx,[ebp-360]
        mov     esi,edx
        cmp     esi,eax
        jg      label0016
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm2
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    ecx
        push    eax
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
label0016:
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm1
        sub     esp,16
        push    ecx
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     eax,ebx
        mov     eax,[eax+4]
        inc     eax
        mov     esi,eax
label0011:
        mov     ecx,[ebp-340]
        mov     ecx,[ecx+4]
        cmp     ecx,esi
        jle     label0012
        mov     edx,ebx
        mov     eax,esi
        sub     eax,[edx+4]
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
        mov     ecx,[ebp-348]
        mov     [ebp-356],eax
        mov     eax,esi
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
        mov     ecx,ebx
        mov     edx,esi
        sub     edx,[ecx+4]
        cvtsi2ss        xmm1,edx
        mov     ecx,[ebp-340]
        mov     edx,ebx
        movss   xmm3,dword ptr [ecx+8]
        subss   xmm3,dword ptr [edx+8]
        mulss   xmm1,xmm3
        mov     ecx,[ebp-340]
        mov     edx,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm5,ecx
        divss   xmm1,xmm5
        mov     ecx,ebx
        addss   xmm1,dword ptr [ecx+8]
        movss   xmm0,xmm1
        mov     ecx,[ebp-348]
        mov     edx,esi
        sub     edx,[ecx+4]
        cvtsi2ss        xmm6,edx
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        movss   xmm1,dword ptr [ecx+8]
        subss   xmm1,dword ptr [edx+8]
        mulss   xmm6,xmm1
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm6,xmm1
        mov     ecx,[ebp-348]
        addss   xmm6,dword ptr [ecx+8]
        movss   xmm1,xmm6
        mov     ecx,ebx
        mov     edx,esi
        sub     edx,[ecx+4]
        cvtsi2ss        xmm2,edx
        mov     ecx,[ebp-340]
        mov     edx,ebx
        movss   xmm3,dword ptr [ecx+12]
        subss   xmm3,dword ptr [edx+12]
        mulss   xmm2,xmm3
        mov     ecx,[ebp-340]
        mov     edx,ebx
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        mov     ecx,ebx
        addss   xmm2,dword ptr [ecx+12]
        mov     ecx,[ebp-348]
        mov     edx,esi
        sub     edx,[ecx+4]
        cvtsi2ss        xmm3,edx
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        movss   xmm4,dword ptr [ecx+12]
        subss   xmm4,dword ptr [edx+12]
        mulss   xmm3,xmm4
        mov     ecx,[ebp-340]
        mov     edx,[ebp-348]
        mov     ecx,[ecx+4]
        sub     ecx,[edx+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        mov     ecx,[ebp-348]
        addss   xmm3,dword ptr [ecx+12]
        mov     ecx,eax
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     ecx,eax
        sub     ecx,[ebp-356]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     ecx,esi
        mov     edx,[ebp-356]
        mov     edi,edx
        cmp     edi,eax
        jg      label0019
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm2
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    ecx
        push    eax
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm1
        sub     esp,16
        push    ecx
        push    edx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     esi
        jmp     label0011
label0012:
        mov     eax,[ebp-336]
label0027:
; end of inline function _rasterize_triangle_2i
        inc     eax
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
_rasterizer_triangle3f endp

end
