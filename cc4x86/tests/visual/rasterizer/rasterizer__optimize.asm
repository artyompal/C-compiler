
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
        mov     dword ptr [__width],edx
        mov     dword ptr [__height],ecx
        mov     dword ptr [__pitch],eax
; start of inline function matrix4f_make_perspective
        cvtsi2ss        xmm3,edx
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        mulss   xmm2,xmm0
        movss   xmm4,xmm2
        mulss   xmm4,xmm3
        movss   xmm3,xmm0
        divss   xmm3,xmm4
        movss   dword ptr [__mvproj_matrix],xmm3
        mov     dword ptr [__mvproj_matrix+4],0
        mov     dword ptr [__mvproj_matrix+8],0
        mov     dword ptr [__mvproj_matrix+12],0
        mov     dword ptr [__mvproj_matrix+16],0
        movss   xmm3,xmm0
        divss   xmm3,xmm2
        movss   dword ptr [__mvproj_matrix+20],xmm3
        mov     dword ptr [__mvproj_matrix+24],0
        mov     dword ptr [__mvproj_matrix+28],0
        mov     dword ptr [__mvproj_matrix+32],0
        mov     dword ptr [__mvproj_matrix+36],0
        movss   xmm2,xmm1
        subss   xmm2,xmm0
        movss   xmm3,xmm1
        divss   xmm3,xmm2
        movss   dword ptr [__mvproj_matrix+40],xmm3
        mov     dword ptr [__mvproj_matrix+44],1065353216
        mov     dword ptr [__mvproj_matrix+48],0
        mov     dword ptr [__mvproj_matrix+52],0
        movss   xmm2,xmm0
        mulss   xmm2,xmm1
        movss   xmm3,xmm0
        subss   xmm3,xmm1
        divss   xmm2,xmm3
        movss   dword ptr [__mvproj_matrix+56],xmm2
        mov     dword ptr [__mvproj_matrix+60],0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        cvtsi2ss        xmm2,ecx
        cvtsi2ss        xmm3,edx
        movss   xmm4,xmm3
        mulss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix],xmm4
        mov     dword ptr [__viewport_matrix+4],0
        mov     dword ptr [__viewport_matrix+8],0
        mov     dword ptr [__viewport_matrix+12],0
        mov     dword ptr [__viewport_matrix+16],0
        movss   xmm4,xmm2
        xorps   xmm4,dword ptr [___unnamed_float4_4]
        mulss   xmm4,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+20],xmm4
        mov     dword ptr [__viewport_matrix+24],0
        mov     dword ptr [__viewport_matrix+28],0
        mov     dword ptr [__viewport_matrix+32],0
        mov     dword ptr [__viewport_matrix+36],0
        movss   xmm4,xmm1
        subss   xmm4,xmm0
        movss   dword ptr [__viewport_matrix+40],xmm4
        mov     dword ptr [__viewport_matrix+44],0
        mulss   xmm3,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+48],xmm3
        mulss   xmm2,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+52],xmm2
        movss   dword ptr [__viewport_matrix+56],xmm0
        mov     dword ptr [__viewport_matrix+60],1065353216
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        mov     dword ptr [__clip_z_near_base],0
        mov     dword ptr [__clip_z_near_base+4],0
        movss   dword ptr [__clip_z_near_base+8],xmm0
        mov     dword ptr [__clip_z_near_base+12],1065353216
; end of inline function vec4f_assign
        comiss  xmm1,xmm0
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
        mov     dword ptr [__clip_z_far_base],0
        mov     dword ptr [__clip_z_far_base+4],0
        movss   dword ptr [__clip_z_far_base+8],xmm1
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
        mov     dword ptr [__clip_z_far_norm],0
        mov     dword ptr [__clip_z_far_norm+4],0
        movss   dword ptr [__clip_z_far_norm+8],xmm0
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
        mov     ecx,dword ptr [__texture_width]
        dec     ecx
        cvtsi2ss        xmm4,ecx
        mulss   xmm4,xmm2
        cvttss2si       ecx,xmm4
        mov     edx,dword ptr [__texture_height]
        dec     edx
        cvtsi2ss        xmm4,edx
        mulss   xmm4,xmm3
        cvttss2si       edx,xmm4
        imul    edx,dword ptr [__texture_width]
        add     edx,ecx
        sal     edx,2
        add     edx,dword ptr [__texture_data]
        mov     edx,[edx]
; end of inline function _tex2d
        mov     ecx,edx
        sar     ecx,24
        and     ecx,255
        je      label0003
        cvtsi2ss        xmm4,ecx
        mulss   xmm4,dword ptr [___unnamed_float_6]
        mov     ecx,[ebx]
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
        mov     [ebx],esi
label0003:
        addss   xmm2,xmm1
        addss   xmm3,xmm0
        add     ebx,4
        cmp     ebx,eax
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
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [ecx]
        movss   xmm1,dword ptr [esi+4]
        subss   xmm1,dword ptr [ecx+4]
        movss   xmm2,dword ptr [esi+8]
        subss   xmm2,dword ptr [ecx+8]
        movss   xmm3,dword ptr [esi+12]
        subss   xmm3,dword ptr [ecx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     eax,[ebp+20]
        mulss   xmm1,dword ptr [eax+4]
        mulss   xmm0,dword ptr [eax]
        addss   xmm0,xmm1
        mulss   xmm2,dword ptr [eax+8]
        addss   xmm0,xmm2
        mulss   xmm3,dword ptr [eax+12]
        addss   xmm0,xmm3
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        movss   xmm1,dword ptr [edi]
        subss   xmm1,dword ptr [ecx]
        movss   xmm2,dword ptr [edi+4]
        subss   xmm2,dword ptr [ecx+4]
        movss   xmm3,dword ptr [edi+8]
        subss   xmm3,dword ptr [ecx+8]
        movss   xmm4,dword ptr [edi+12]
        subss   xmm4,dword ptr [ecx+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mulss   xmm2,dword ptr [eax+4]
        mulss   xmm1,dword ptr [eax]
        addss   xmm1,xmm2
        mulss   xmm3,dword ptr [eax+8]
        addss   xmm1,xmm3
        mulss   xmm4,dword ptr [eax+12]
        addss   xmm1,xmm4
; end of inline function vec4f_dot
        movss   xmm2,dword ptr [___unnamed_float_2]
        comiss  xmm2,xmm0
        ja      label0003
        mov     [ebp+12],edx
        mov     edx,[ebp+8]
        mov     ebx,[edx+192]
        mov     [ebp-140],ebx
        mov     ebx,[ebp+8]
        inc     dword ptr [ebx+192]
        mov     [ebp+8],ebx
        mov     ebx,[ebp-140]
        imul    ebx,24
        movq    xmm2,qword ptr [esi]
        mov     [ebp-140],ebx
        mov     ebx,[ebp+8]
        mov     edx,[ebp-140]
        movq    qword ptr [ebx+edx],xmm2
        movq    xmm2,qword ptr [esi+8]
        mov     edx,[ebp-140]
        movq    qword ptr [ebx+edx+8],xmm2
        movq    xmm2,qword ptr [esi+16]
        mov     edx,[ebp-140]
        movq    qword ptr [ebx+edx+16],xmm2
        mov     edx,[ebp+12]
        mov     [ebp+8],ebx
        movsd   qword ptr [ebp-152],xmm2
label0003:
        movss   xmm2,dword ptr [___unnamed_float_2]
        comiss  xmm2,xmm0
        jae     label0006
        movss   xmm2,dword ptr [___unnamed_float_2]
        comiss  xmm2,xmm1
        ja      label0005
label0006:
        movss   xmm2,dword ptr [___unnamed_float_2]
        comiss  xmm2,xmm1
        ja      label0004
        movss   xmm1,dword ptr [___unnamed_float_2]
        comiss  xmm1,xmm0
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        movss   xmm0,dword ptr [ecx]
        subss   xmm0,dword ptr [esi]
        movss   xmm1,dword ptr [ecx+4]
        subss   xmm1,dword ptr [esi+4]
        movss   xmm2,dword ptr [ecx+8]
        subss   xmm2,dword ptr [esi+8]
        movss   xmm3,dword ptr [ecx+12]
        subss   xmm3,dword ptr [esi+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        movss   xmm4,dword ptr [edi]
        subss   xmm4,dword ptr [esi]
        movss   xmm5,dword ptr [edi+4]
        subss   xmm5,dword ptr [esi+4]
        movss   xmm6,dword ptr [edi+8]
        subss   xmm6,dword ptr [esi+8]
        movss   xmm7,dword ptr [edi+12]
        subss   xmm7,dword ptr [esi+12]
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mulss   xmm1,dword ptr [eax+4]
        mulss   xmm0,dword ptr [eax]
        addss   xmm0,xmm1
        mulss   xmm2,dword ptr [eax+8]
        addss   xmm0,xmm2
        mulss   xmm3,dword ptr [eax+12]
        addss   xmm0,xmm3
; end of inline function vec4f_dot
; start of inline function vec4f_dot
        movss   xmm1,xmm5
        mulss   xmm1,dword ptr [eax+4]
        movss   xmm2,xmm4
        mulss   xmm2,dword ptr [eax]
        addss   xmm2,xmm1
        movss   xmm1,xmm6
        mulss   xmm1,dword ptr [eax+8]
        addss   xmm2,xmm1
        movss   xmm1,xmm7
        mulss   xmm1,dword ptr [eax+12]
        addss   xmm2,xmm1
; end of inline function vec4f_dot
        divss   xmm0,xmm2
; start of inline function vec4f_mul
        mulss   xmm4,xmm0
        mulss   xmm5,xmm0
        mulss   xmm6,xmm0
        mulss   xmm7,xmm0
; end of inline function vec4f_mul
; start of inline function vec4f_add
        mov     [ebp+20],eax
        mov     eax,[ebp+8]
        mov     ebx,[eax+192]
        imul    ebx,24
        movss   xmm1,dword ptr [esi]
        addss   xmm1,xmm4
        mov     [ebp-144],ebx
        mov     ebx,[ebp+8]
        mov     eax,[ebp-144]
        movss   dword ptr [ebx+eax],xmm1
        movss   xmm1,dword ptr [esi+4]
        addss   xmm1,xmm5
        mov     eax,[ebp-144]
        movss   dword ptr [ebx+eax+4],xmm1
        movss   xmm1,dword ptr [esi+8]
        addss   xmm1,xmm6
        mov     eax,[ebp-144]
        movss   dword ptr [ebx+eax+8],xmm1
        movss   xmm1,dword ptr [esi+12]
        addss   xmm1,xmm7
        mov     eax,[ebp-144]
        movss   dword ptr [ebx+eax+12],xmm1
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        movss   xmm1,dword ptr [edi+16]
        subss   xmm1,dword ptr [esi+16]
        movss   xmm2,dword ptr [edi+20]
        subss   xmm2,dword ptr [esi+20]
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        mulss   xmm1,xmm0
        mulss   xmm2,xmm0
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     eax,[ebx+192]
        imul    eax,24
        movss   xmm0,dword ptr [esi+16]
        addss   xmm0,xmm1
        movss   dword ptr [ebx+eax+16],xmm0
        movss   xmm0,dword ptr [esi+20]
        addss   xmm0,xmm2
        movss   dword ptr [ebx+eax+20],xmm0
; end of inline function vec2f_add
        inc     dword ptr [ebx+192]
        mov     eax,[ebp+20]
        mov     [ebp+8],ebx
label0004:
        add     esi,24
        add     edi,24
        mov     ebx,[ebp+8]
        jmp     label0001
label0002:
        mov     ebx,[ebp+8]
        mov     ecx,[ebx+192]
        inc     dword ptr [ebx+192]
        imul    ecx,24
        movq    xmm0,qword ptr [ebx]
        movq    qword ptr [ebx+ecx],xmm0
        movq    xmm0,qword ptr [ebx+8]
        movq    qword ptr [ebx+ecx+8],xmm0
        movq    xmm0,qword ptr [ebx+16]
        movq    qword ptr [ebx+ecx+16],xmm0
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
        movss   xmm0,dword ptr [ecx+8]
        movss   xmm1,dword ptr [ecx+4]
        movss   xmm2,dword ptr [ecx]
; end of inline function vec4f_assign
; start of inline function matrix4f_transform
        movss   xmm3,xmm1
        mulss   xmm3,dword ptr [__mvproj_matrix+16]
        movss   xmm4,xmm2
        mulss   xmm4,dword ptr [__mvproj_matrix]
        addss   xmm4,xmm3
        movss   xmm3,xmm0
        mulss   xmm3,dword ptr [__mvproj_matrix+32]
        addss   xmm4,xmm3
        movss   xmm3,dword ptr [___unnamed_float_1]
        mulss   xmm3,dword ptr [__mvproj_matrix+48]
        addss   xmm4,xmm3
        movss   dword ptr [eax],xmm4
        movss   xmm3,xmm2
        mulss   xmm3,dword ptr [__mvproj_matrix+4]
        movss   xmm4,xmm1
        mulss   xmm4,dword ptr [__mvproj_matrix+20]
        addss   xmm3,xmm4
        movss   xmm4,xmm0
        mulss   xmm4,dword ptr [__mvproj_matrix+36]
        addss   xmm3,xmm4
        movss   xmm4,dword ptr [___unnamed_float_1]
        mulss   xmm4,dword ptr [__mvproj_matrix+52]
        addss   xmm3,xmm4
        movss   dword ptr [eax+4],xmm3
        movss   xmm3,xmm2
        mulss   xmm3,dword ptr [__mvproj_matrix+8]
        movss   xmm4,xmm1
        mulss   xmm4,dword ptr [__mvproj_matrix+24]
        addss   xmm3,xmm4
        movss   xmm4,xmm0
        mulss   xmm4,dword ptr [__mvproj_matrix+40]
        addss   xmm3,xmm4
        movss   xmm4,dword ptr [___unnamed_float_1]
        mulss   xmm4,dword ptr [__mvproj_matrix+56]
        addss   xmm3,xmm4
        movss   dword ptr [eax+8],xmm3
        mulss   xmm2,dword ptr [__mvproj_matrix+12]
        mulss   xmm1,dword ptr [__mvproj_matrix+28]
        addss   xmm2,xmm1
        mulss   xmm0,dword ptr [__mvproj_matrix+44]
        addss   xmm2,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        mulss   xmm0,dword ptr [__mvproj_matrix+60]
        addss   xmm2,xmm0
        movss   dword ptr [eax+12],xmm2
; end of inline function matrix4f_transform
        mov     esp,ebp
        pop     ebp
        ret
__transform_to_projection_space endp

_rasterizer_triangle3f proc
        push    ebp
        mov     ebp,esp
        sub     esp,744
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
        mov     edx,[ebp+20]
        movq    xmm0,qword ptr [edx]
        movq    qword ptr [ebp-180],xmm0
        push    dword ptr [ebp+12]
        lea     eax,[ebp-196]
        add     eax,24
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     ecx,[ebp+24]
        movq    xmm0,qword ptr [ecx]
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
        mov     [ebp-708],eax
        push    (offset __clip_z_far_norm)
        push    (offset __clip_z_far_base)
        push    dword ptr [ebp-708]
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_z_near_norm)
        push    (offset __clip_z_near_base)
        lea     eax,[ebp-660]
        push    eax
        push    dword ptr [ebp-708]
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_left_norm)
        push    (offset __clip_plane_left_base)
        push    dword ptr [ebp-708]
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_right_norm)
        push    (offset __clip_plane_right_base)
        lea     eax,[ebp-660]
        push    eax
        push    dword ptr [ebp-708]
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_top_norm)
        push    (offset __clip_plane_top_base)
        push    dword ptr [ebp-708]
        lea     eax,[ebp-660]
        push    eax
        call    __clip_on_plain
        add     esp,16
        push    (offset __clip_plane_bottom_norm)
        push    (offset __clip_plane_bottom_base)
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
        mov     ecx,0
label0003:
        mov     edx,[eax+192]
        cmp     edx,ecx
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     edx,ecx
        imul    edx,24
        lea     ebx,[ebp-332]
        mov     esi,ecx
        sal     esi,4
; start of inline function matrix4f_transform
        movss   xmm0,dword ptr [eax+edx+4]
        mulss   xmm0,dword ptr [__viewport_matrix+16]
        movss   xmm1,dword ptr [eax+edx]
        mulss   xmm1,dword ptr [__viewport_matrix]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [eax+edx+8]
        mulss   xmm0,dword ptr [__viewport_matrix+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [eax+edx+12]
        mulss   xmm0,dword ptr [__viewport_matrix+48]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [eax+edx]
        mulss   xmm0,dword ptr [__viewport_matrix+4]
        movss   xmm2,dword ptr [eax+edx+4]
        mulss   xmm2,dword ptr [__viewport_matrix+20]
        addss   xmm0,xmm2
        movss   xmm2,dword ptr [eax+edx+8]
        mulss   xmm2,dword ptr [__viewport_matrix+36]
        addss   xmm0,xmm2
        movss   xmm2,dword ptr [eax+edx+12]
        mulss   xmm2,dword ptr [__viewport_matrix+52]
        addss   xmm0,xmm2
        movss   xmm2,dword ptr [eax+edx]
        mulss   xmm2,dword ptr [__viewport_matrix+12]
        movss   xmm3,dword ptr [eax+edx+4]
        mulss   xmm3,dword ptr [__viewport_matrix+28]
        addss   xmm2,xmm3
        movss   xmm3,dword ptr [eax+edx+8]
        mulss   xmm3,dword ptr [__viewport_matrix+44]
        addss   xmm2,xmm3
        movss   xmm3,dword ptr [eax+edx+12]
        mulss   xmm3,dword ptr [__viewport_matrix+60]
        addss   xmm2,xmm3
; end of inline function matrix4f_transform
        movss   xmm3,dword ptr [___unnamed_float_1]
        divss   xmm3,xmm2
        mulss   xmm1,xmm3
        cvttss2si       edx,xmm1
        mov     [ebx+esi],edx
        mulss   xmm0,xmm3
        cvttss2si       edx,xmm0
        mov     [ebx+esi+4],edx
        cmp     dword ptr [ebx+esi],0
        jl      label002a
        mov     edx,[ebx+esi]
        cmp     edx,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [ebx+esi+4],0
        jl      label002a
        mov     ebx,[ebx+esi+4]
        cmp     ebx,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     edx,[ebp-332]
        mov     ebx,ecx
        sal     ebx,4
        mov     esi,ecx
        imul    esi,24
        movq    xmm0,qword ptr [eax+esi+16]
        movq    qword ptr [edx+ebx+8],xmm0
        inc     ecx
        movsd   qword ptr [ebp-732],xmm0
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
        mov     edi,[ebx+4]
        cmp     edi,[esi+4]
        jle     label0008
        mov     [ebp-352],ebx
        mov     ebx,esi
        mov     esi,[ebp-352]
label0008:
        mov     edi,[ebx+4]
        cmp     edi,[edx+4]
        jle     label0009
        mov     [ebp-352],ebx
        mov     ebx,edx
        mov     edx,[ebp-352]
label0009:
        mov     edi,[esi+4]
        cmp     edi,[edx+4]
        jle     label000a
        mov     [ebp-348],ebx
        mov     ebx,esi
        mov     esi,edx
        mov     edx,ebx
        mov     ebx,[ebp-348]
label000a:
        mov     edi,[ebx+4]
        cmp     edi,[edx+4]
        jne     label000b
        cmp     dword ptr [ebx+4],0
        jl      label000c
        mov     edi,[ebx+4]
        cmp     edi,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   xmm1,dword ptr [___unnamed_float_2]
        mov     edi,edx
        mov     [ebp-708],eax
        mov     eax,esi
        mov     [ebp-336],ecx
        mov     ecx,ebx
        mov     [ebp-712],eax
        mov     eax,[ebx+4]
        mov     edx,[edx]
        mov     esi,[esi]
        mov     ebx,[ebx]
        cmp     ebx,esi
        jge     label001c
        cmp     edx,esi
        jle     label001d
        movss   dword ptr [esp-4],xmm0
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        push    dword ptr [ecx+12]
        push    dword ptr [ecx+8]
        push    eax
        push    edx
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
label001d:
        cmp     edx,ebx
        jge     label001f
        movss   dword ptr [esp-4],xmm0
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        push    dword ptr [edi+12]
        push    dword ptr [edi+8]
        push    eax
        push    esi
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        movss   dword ptr [esp-4],xmm0
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        push    dword ptr [ecx+4]
        push    dword ptr [ecx]
        push    eax
        push    esi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
label001c:
        cmp     edx,esi
        jge     label0022
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        push    dword ptr [edi+4]
        push    dword ptr [edi]
        push    eax
        push    ebx
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
label0022:
        cmp     edx,ebx
        jle     label0024
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        mov     [ebp-448],eax
        mov     eax,[ebp-712]
        push    dword ptr [eax+12]
        push    dword ptr [eax+8]
        push    dword ptr [ebp-448]
        push    edx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
label0024:
        xorps   xmm0,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-4],xmm0
        xorps   xmm1,dword ptr [___unnamed_float4_4]
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        mov     [ebp-448],eax
        mov     eax,[ebp-712]
        push    dword ptr [eax+4]
        push    dword ptr [eax]
        push    dword ptr [ebp-448]
        push    ebx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
        mov     eax,[ebp-708]
        mov     ecx,[ebp-336]
label000c:
        jmp     label0027
label000b:
        mov     edi,[ebx+4]
label000e:
        mov     [ebp-708],eax
        mov     eax,[esi+4]
        cmp     eax,edi
        jle     label000f
        mov     eax,edi
        sub     eax,[ebx+4]
        mov     [ebp-336],ecx
        mov     ecx,[esi]
        sub     ecx,[ebx]
        imul    eax,ecx
        mov     ecx,[esi+4]
        sub     ecx,[ebx+4]
        mov     [ebp-340],edx
        cdq
        idiv    ecx
        add     eax,[ebx]
        mov     [ebp-716],eax
        mov     eax,edi
        sub     eax,[ebx+4]
        mov     edx,[ebp-340]
        mov     ecx,[edx]
        sub     ecx,[ebx]
        imul    eax,ecx
        mov     ecx,[edx+4]
        sub     ecx,[ebx+4]
        mov     [ebp-340],edx
        cdq
        idiv    ecx
        add     eax,[ebx]
        mov     ecx,edi
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [esi+8]
        subss   xmm1,dword ptr [ebx+8]
        mulss   xmm0,xmm1
        mov     ecx,[esi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [ebx+8]
        mov     ecx,edi
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm1,ecx
        mov     edx,[ebp-340]
        movss   xmm2,dword ptr [edx+8]
        subss   xmm2,dword ptr [ebx+8]
        mulss   xmm1,xmm2
        mov     ecx,[edx+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [ebx+8]
        mov     ecx,edi
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm2,ecx
        movss   xmm3,dword ptr [esi+12]
        subss   xmm3,dword ptr [ebx+12]
        mulss   xmm2,xmm3
        mov     ecx,[esi+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        addss   xmm2,dword ptr [ebx+12]
        mov     ecx,edi
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm3,ecx
        movss   xmm4,dword ptr [edx+12]
        subss   xmm4,dword ptr [ebx+12]
        mulss   xmm3,xmm4
        mov     ecx,[edx+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        addss   xmm3,dword ptr [ebx+12]
        mov     ecx,eax
        sub     ecx,[ebp-716]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm1
        subss   xmm5,xmm0
        divss   xmm5,xmm4
        mov     ecx,eax
        sub     ecx,[ebp-716]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        mov     [ebp-720],eax
        mov     eax,[ebp-716]
        cmp     eax,[ebp-720]
        jg      label0013
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm2
        movss   dword ptr [esp-16],xmm0
        sub     esp,16
        push    edi
        push    dword ptr [ebp-720]
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
label0013:
        mov     [ebp-340],edx
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm3
        movss   dword ptr [esp-16],xmm1
        sub     esp,16
        push    edi
        push    eax
        push    dword ptr [ebp-720]
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     edi
        mov     eax,[ebp-708]
        mov     ecx,[ebp-336]
        mov     edx,[ebp-340]
        jmp     label000e
label000f:
        mov     eax,[esi+4]
        sub     eax,[ebx+4]
        mov     edi,[edx]
        sub     edi,[ebx]
        imul    eax,edi
        mov     edi,[edx+4]
        sub     edi,[ebx+4]
        mov     [ebp-340],edx
        cdq
        idiv    edi
        add     eax,[ebx]
        mov     edx,[esi+4]
        sub     edx,[ebx+4]
        cvtsi2ss        xmm0,edx
        mov     edx,[ebp-340]
        movss   xmm1,dword ptr [edx+8]
        subss   xmm1,dword ptr [ebx+8]
        mulss   xmm0,xmm1
        mov     edi,[edx+4]
        sub     edi,[ebx+4]
        cvtsi2ss        xmm1,edi
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [ebx+8]
        mov     edi,[esi+4]
        sub     edi,[ebx+4]
        cvtsi2ss        xmm1,edi
        movss   xmm2,dword ptr [edx+12]
        subss   xmm2,dword ptr [ebx+12]
        mulss   xmm1,xmm2
        mov     edi,[edx+4]
        sub     edi,[ebx+4]
        cvtsi2ss        xmm2,edi
        divss   xmm1,xmm2
        addss   xmm1,dword ptr [ebx+12]
        movss   xmm2,xmm0
        subss   xmm2,dword ptr [esi+8]
        mov     edi,eax
        sub     edi,[esi]
        cvtsi2ss        xmm3,edi
        divss   xmm2,xmm3
        movss   xmm3,xmm1
        subss   xmm3,dword ptr [esi+12]
        mov     edi,eax
        sub     edi,[esi]
        cvtsi2ss        xmm4,edi
        divss   xmm3,xmm4
; start of inline function _rasterize_horiz_line__unordered
        movss   xmm4,dword ptr [esi+12]
        movss   xmm5,dword ptr [esi+8]
        movss   dword ptr [ebp-736],xmm1
        movss   xmm1,xmm5
        movss   dword ptr [ebp-740],xmm2
        movss   xmm2,dword ptr [ebp-736]
        mov     edi,[esi+4]
        mov     [ebp-336],ecx
        mov     ecx,[esi]
        cmp     eax,ecx
        jg      label0016
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        push    dword ptr [ebp-740]
        movss   dword ptr [esp-4],xmm2
        movss   dword ptr [esp-8],xmm0
        sub     esp,8
        push    edi
        push    ecx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
label0016:
        mov     [ebp-340],edx
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        push    dword ptr [ebp-740]
        movss   dword ptr [esp-4],xmm4
        movss   dword ptr [esp-8],xmm1
        sub     esp,8
        push    edi
        push    eax
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     eax,[esi+4]
        inc     eax
        mov     edi,eax
label0011:
        mov     edx,[ebp-340]
        mov     ecx,[edx+4]
        cmp     ecx,edi
        jle     label0012
        mov     eax,edi
        sub     eax,[esi+4]
        mov     ecx,[edx]
        sub     ecx,[esi]
        imul    eax,ecx
        mov     ecx,[edx+4]
        sub     ecx,[esi+4]
        mov     [ebp-340],edx
        cdq
        idiv    ecx
        add     eax,[esi]
        mov     [ebp-724],eax
        mov     eax,edi
        sub     eax,[ebx+4]
        mov     edx,[ebp-340]
        mov     ecx,[edx]
        sub     ecx,[ebx]
        imul    eax,ecx
        mov     ecx,[edx+4]
        sub     ecx,[ebx+4]
        mov     [ebp-340],edx
        cdq
        idiv    ecx
        add     eax,[ebx]
        mov     ecx,edi
        sub     ecx,[esi+4]
        cvtsi2ss        xmm1,ecx
        mov     edx,[ebp-340]
        movss   xmm3,dword ptr [edx+8]
        subss   xmm3,dword ptr [esi+8]
        mulss   xmm1,xmm3
        mov     ecx,[edx+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm1,xmm4
        addss   xmm1,dword ptr [esi+8]
        mov     ecx,edi
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm2,dword ptr [edx+8]
        subss   xmm2,dword ptr [ebx+8]
        mulss   xmm0,xmm2
        mov     ecx,[edx+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm0,xmm2
        addss   xmm0,dword ptr [ebx+8]
        mov     ecx,edi
        sub     ecx,[esi+4]
        cvtsi2ss        xmm2,ecx
        movss   xmm3,dword ptr [edx+12]
        subss   xmm3,dword ptr [esi+12]
        mulss   xmm2,xmm3
        mov     ecx,[edx+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        addss   xmm2,dword ptr [esi+12]
        mov     ecx,edi
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm3,ecx
        movss   xmm4,dword ptr [edx+12]
        subss   xmm4,dword ptr [ebx+12]
        mulss   xmm3,xmm4
        mov     ecx,[edx+4]
        sub     ecx,[ebx+4]
        cvtsi2ss        xmm4,ecx
        divss   xmm3,xmm4
        addss   xmm3,dword ptr [ebx+12]
        mov     ecx,eax
        sub     ecx,[ebp-724]
        cvtsi2ss        xmm4,ecx
        movss   xmm5,xmm0
        subss   xmm5,xmm1
        divss   xmm5,xmm4
        mov     ecx,eax
        sub     ecx,[ebp-724]
        cvtsi2ss        xmm4,ecx
        movss   xmm6,xmm3
        subss   xmm6,xmm2
        divss   xmm6,xmm4
; start of inline function _rasterize_horiz_line__unordered
        movss   dword ptr [ebp-744],xmm1
        movss   xmm1,xmm0
        mov     ecx,edi
        mov     [ebp-340],edx
        mov     edx,[ebp-724]
        cmp     edx,eax
        jg      label0019
        movss   dword ptr [esp-4],xmm6
        movss   dword ptr [esp-8],xmm5
        movss   dword ptr [esp-12],xmm2
        sub     esp,12
        push    dword ptr [ebp-744]
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
        inc     edi
        jmp     label0011
label0012:
        mov     eax,[ebp-708]
        mov     ecx,[ebp-336]
label0027:
; end of inline function _rasterize_triangle_2i
        inc     ecx
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
