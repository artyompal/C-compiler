
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
        cvtsi2ss        xmm4,ebx
        cvtsi2ss        xmm0,esi
        divss   xmm4,xmm0
        movss   xmm0,xmm6
        movss   xmm3,xmm5
        mulss   xmm7,xmm3
        movss   xmm2,xmm7
        mulss   xmm2,xmm4
        movss   xmm4,xmm3
        divss   xmm4,xmm2
        movss   dword ptr [__mvproj_matrix],xmm4
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+4],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+8],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+12],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+16],xmm2
        movss   xmm2,xmm3
        divss   xmm2,xmm7
        movss   dword ptr [__mvproj_matrix+20],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+24],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+28],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+32],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+36],xmm2
        movss   xmm2,xmm0
        subss   xmm2,xmm3
        movss   xmm4,xmm0
        divss   xmm4,xmm2
        movss   dword ptr [__mvproj_matrix+40],xmm4
        movss   xmm2,dword ptr [___unnamed_float_1]
        movss   dword ptr [__mvproj_matrix+44],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+48],xmm2
        movss   xmm2,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+52],xmm2
        movss   xmm2,xmm3
        mulss   xmm2,xmm0
        subss   xmm3,xmm0
        divss   xmm2,xmm3
        movss   dword ptr [__mvproj_matrix+56],xmm2
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__mvproj_matrix+60],xmm0
; end of inline function matrix4f_make_perspective
; start of inline function matrix4f_make_viewport
        movss   xmm7,xmm6
        movss   xmm4,xmm5
        cvtsi2ss        xmm3,esi
        cvtsi2ss        xmm2,ebx
        movss   xmm0,xmm2
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+4],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+8],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+12],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+16],xmm0
        movss   xmm0,xmm3
        xorps   xmm0,dword ptr [___unnamed_float_4]
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+20],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+24],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+28],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+32],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+36],xmm0
        movss   xmm0,xmm7
        subss   xmm0,xmm4
        movss   dword ptr [__viewport_matrix+40],xmm0
        movss   xmm0,dword ptr [___unnamed_float_2]
        movss   dword ptr [__viewport_matrix+44],xmm0
        movss   xmm0,xmm2
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+48],xmm0
        movss   xmm0,xmm3
        divss   xmm0,dword ptr [___unnamed_float_3]
        movss   dword ptr [__viewport_matrix+52],xmm0
        movss   dword ptr [__viewport_matrix+56],xmm4
        movss   xmm0,dword ptr [___unnamed_float_1]
        movss   dword ptr [__viewport_matrix+60],xmm0
; end of inline function matrix4f_make_viewport
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,xmm5
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        lea     edi,dword ptr [__clip_z_near_base]
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
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
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,xmm6
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_base)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
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
        movss   xmm4,dword ptr [ebp-8]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_norm)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,ebx
        movss   xmm2,dword ptr [___unnamed_float_1]
        divss   xmm2,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm2
        movss   xmm2,xmm0
        mov     edi,(offset __clip_plane_left_base)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_1]
        mov     edi,(offset __clip_plane_left_norm)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,ebx
        movss   xmm2,dword ptr [___unnamed_float_1]
        divss   xmm2,xmm0
        movss   xmm0,dword ptr [___unnamed_float_1]
        subss   xmm0,xmm2
        movss   xmm2,xmm0
        mov     edi,(offset __clip_plane_right_base)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_5]
        mov     edi,(offset __clip_plane_right_norm)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        cvtsi2ss        xmm0,esi
        movss   xmm2,dword ptr [___unnamed_float_1]
        divss   xmm2,xmm0
        movss   xmm0,dword ptr [___unnamed_float_5]
        addss   xmm0,xmm2
        movss   xmm3,xmm0
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_base)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_1]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_top_norm)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_1]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_base)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [___unnamed_float_2]
        movss   xmm3,dword ptr [___unnamed_float_5]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_plane_bottom_norm)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
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
label0000:
; start of inline function _tex2d
        movss   xmm3,xmm5
        movss   xmm2,xmm4
        mov     ebx,dword ptr [__texture_width]
        dec     ebx
        cvtsi2ss        xmm0,ebx
        mulss   xmm0,xmm2
        cvttss2si       esi,xmm0
        mov     ebx,dword ptr [__texture_height]
        dec     ebx
        cvtsi2ss        xmm0,ebx
        mulss   xmm0,xmm3
        cvttss2si       ebx,xmm0
        imul    ebx,dword ptr [__texture_width]
        add     ebx,esi
        sal     ebx,2
        add     ebx,dword ptr [__texture_data]
        mov     esi,[ebx]
; end of inline function _tex2d
        mov     ebx,esi
        sar     ebx,24
        and     ebx,255
        cmp     ebx,0
        je      label0003
        cvtsi2ss        xmm3,ebx
        divss   xmm3,dword ptr [___unnamed_float_6]
        mov     ebx,[edx]
        mov     ecx,ebx
        and     ecx,65280
        sar     ecx,8
        and     ebx,255
        mov     eax,esi
        and     eax,65280
        sar     eax,8
        and     esi,255
        cvtsi2ss        xmm0,eax
        mulss   xmm0,xmm3
        cvtsi2ss        xmm2,ecx
        movss   xmm1,dword ptr [___unnamed_float_1]
        subss   xmm1,xmm3
        mulss   xmm2,xmm1
        addss   xmm0,xmm2
        cvttss2si       eax,xmm0
        cvtsi2ss        xmm0,esi
        mulss   xmm0,xmm3
        cvtsi2ss        xmm1,ebx
        movss   xmm2,dword ptr [___unnamed_float_1]
        subss   xmm2,xmm3
        mulss   xmm1,xmm2
        addss   xmm0,xmm1
        cvttss2si       ecx,xmm0
        mov     esi,ecx
        mov     ebx,eax
        sal     ebx,8
        add     ebx,esi
        mov     [edx],ebx
label0003:
        addss   xmm4,xmm6
        addss   xmm5,xmm7
        add     edx,4
        cmp     edx,edi
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
        mov     edi,esi
        mov     edx,ecx
        mov     [ebp+12],ebx
        lea     ebx,[ebp-24]
        movss   xmm0,dword ptr [edx]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp+20]
        lea     ebx,[ebp-24]
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm7,dword ptr [ebx]
        mulss   xmm7,dword ptr [edi]
        addss   xmm7,xmm0
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm7,xmm0
        movss   xmm0,dword ptr [ebx+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm7,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        mov     edi,esi
        mov     edx,eax
        lea     ebx,[ebp-24]
        movss   xmm0,dword ptr [edx]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp+20]
        lea     edx,[ebp-24]
        mov     ebx,edx
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebx+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
        movss   dword ptr [ebp-52],xmm7
        movss   xmm7,xmm1
; end of inline function vec4f_dot
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        ja      label0003
        mov     edi,[ebp+8]
        mov     edx,[edi+192]
        mov     [ebp-140],edx
        mov     edx,[ebp+8]
        inc     dword ptr [edx+192]
        mov     [ebp+8],edx
        mov     edx,[ebp-140]
        imul    edx,24
        mov     ebx,[ebp+8]
        add     ebx,edx
        mov     edx,[ecx]
        mov     edi,[ecx+4]
        mov     [ebx],edx
        mov     [ebx+4],edi
        mov     edx,[ecx+8]
        mov     edi,[ecx+12]
        mov     [ebx+8],edx
        mov     [ebx+12],edi
        mov     edx,[ecx+16]
        mov     edi,[ecx+20]
        mov     [ebx+16],edx
        mov     [ebx+20],edi
label0003:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        jae     label0006
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm7
        ja      label0005
label0006:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,xmm7
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-52]
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        mov     edi,ecx
        mov     edx,esi
        lea     ebx,[ebp-24]
        movss   xmm0,dword ptr [edx]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     edi,ecx
        mov     edx,eax
        lea     ebx,[ebp-40]
        movss   xmm0,dword ptr [edx]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [edx+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edx+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edx+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp+20]
        lea     edx,[ebp-24]
        mov     ebx,edx
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebx+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
        movss   xmm7,xmm1
; end of inline function vec4f_dot
; start of inline function vec4f_dot
        mov     edi,[ebp+20]
        lea     edx,[ebp-40]
        mov     ebx,edx
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebx+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
        movss   dword ptr [ebp-60],xmm7
        movss   xmm7,xmm1
; end of inline function vec4f_dot
        movss   dword ptr [ebp-128],xmm7
        movss   xmm7,dword ptr [ebp-60]
        divss   xmm7,dword ptr [ebp-128]
; start of inline function vec4f_mul
        movss   xmm1,xmm7
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
        mov     edi,ecx
        mov     ebx,[ebp+8]
        mov     edx,[ebx+192]
        imul    edx,24
        mov     ebx,[ebp+8]
        add     ebx,edx
        movss   xmm0,dword ptr [edi]
        addss   xmm0,dword ptr [ebp-40]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [edi+4]
        addss   xmm0,dword ptr [ebp-36]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [edi+8]
        addss   xmm0,dword ptr [ebp-32]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [edi+12]
        addss   xmm0,dword ptr [ebp-28]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     edi,ecx
        mov     ebx,eax
        movss   xmm0,dword ptr [ebx+16]
        subss   xmm0,dword ptr [edi+16]
        movss   dword ptr [ebp-48],xmm0
        movss   xmm0,dword ptr [ebx+20]
        subss   xmm0,dword ptr [edi+20]
        movss   dword ptr [ebp-44],xmm0
; end of inline function vec2f_subtract
; start of inline function vec2f_mul
        movss   xmm0,dword ptr [ebp-48]
        mulss   xmm0,xmm7
        movss   dword ptr [ebp-48],xmm0
        movss   xmm0,dword ptr [ebp-44]
        mulss   xmm0,xmm7
        movss   dword ptr [ebp-44],xmm0
; end of inline function vec2f_mul
; start of inline function vec2f_add
        mov     edi,ecx
        mov     ebx,[ebp+8]
        mov     edx,[ebx+192]
        imul    edx,24
        mov     ebx,[ebp+8]
        add     ebx,edx
        add     ebx,16
        movss   xmm0,dword ptr [edi+16]
        addss   xmm0,dword ptr [ebp-48]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [edi+20]
        addss   xmm0,dword ptr [ebp-44]
        movss   dword ptr [ebx+4],xmm0
; end of inline function vec2f_add
        mov     edx,[ebp+8]
        inc     dword ptr [edx+192]
        mov     [ebp+8],edx
label0004:
        add     ecx,24
        add     eax,24
        mov     edx,[ebp+8]
        mov     ebx,[ebp+12]
        mov     edi,[ebp+20]
        jmp     label0001
        mov     [ebp+8],edx
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
        movss   xmm4,dword ptr [ebp-12]
        mulss   xmm4,dword ptr [__mvproj_matrix+16]
        movss   xmm5,dword ptr [ebp-16]
        mulss   xmm5,dword ptr [__mvproj_matrix]
        addss   xmm5,xmm4
        movss   xmm4,dword ptr [ebp-8]
        mulss   xmm4,dword ptr [__mvproj_matrix+32]
        addss   xmm5,xmm4
        movss   xmm4,dword ptr [ebp-4]
        mulss   xmm4,dword ptr [__mvproj_matrix+48]
        addss   xmm5,xmm4
        movss   dword ptr [esi],xmm5
        movss   xmm4,dword ptr [ebp-16]
        mulss   xmm4,dword ptr [__mvproj_matrix+4]
        movss   xmm5,dword ptr [ebp-12]
        mulss   xmm5,dword ptr [__mvproj_matrix+20]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [ebp-8]
        mulss   xmm5,dword ptr [__mvproj_matrix+36]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [ebp-4]
        mulss   xmm5,dword ptr [__mvproj_matrix+52]
        addss   xmm4,xmm5
        movss   dword ptr [esi+4],xmm4
        movss   xmm4,dword ptr [ebp-16]
        mulss   xmm4,dword ptr [__mvproj_matrix+8]
        movss   xmm5,dword ptr [ebp-12]
        mulss   xmm5,dword ptr [__mvproj_matrix+24]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [ebp-8]
        mulss   xmm5,dword ptr [__mvproj_matrix+40]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [ebp-4]
        mulss   xmm5,dword ptr [__mvproj_matrix+56]
        addss   xmm4,xmm5
        movss   dword ptr [esi+8],xmm4
        movss   xmm4,dword ptr [ebp-16]
        mulss   xmm4,dword ptr [__mvproj_matrix+12]
        movss   xmm5,dword ptr [ebp-12]
        mulss   xmm5,dword ptr [__mvproj_matrix+28]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [ebp-8]
        mulss   xmm5,dword ptr [__mvproj_matrix+44]
        addss   xmm4,xmm5
        movss   xmm5,dword ptr [ebp-4]
        mulss   xmm5,dword ptr [__mvproj_matrix+60]
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
        sub     esp,724
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
        mov     ecx,[ebp-196]
        mov     ebx,[ebp-192]
        mov     [eax],ecx
        mov     [eax+4],ebx
        mov     ecx,[ebp-188]
        mov     ebx,[ebp-184]
        mov     [eax+8],ecx
        mov     [eax+12],ebx
        mov     ecx,[ebp-180]
        mov     ebx,[ebp-176]
        mov     [eax+16],ecx
        mov     [eax+20],ebx
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
        jne     label0000
        jmp     label002d
label0000:
        cmp     dword ptr [edi+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     esi,0
label0003:
        mov     eax,[edi+192]
        cmp     eax,esi
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     ebx,edi
        mov     eax,esi
        imul    eax,24
        add     ebx,eax
        lea     ecx,[ebp-332]
        mov     eax,esi
        sal     eax,4
        add     ecx,eax
; start of inline function matrix4f_transform
        movss   xmm0,dword ptr [ebx+4]
        mulss   xmm0,dword ptr [__viewport_matrix+16]
        movss   xmm1,dword ptr [ebx]
        mulss   xmm1,dword ptr [__viewport_matrix]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebx+8]
        mulss   xmm0,dword ptr [__viewport_matrix+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [ebx+12]
        mulss   xmm0,dword ptr [__viewport_matrix+48]
        addss   xmm1,xmm0
        movss   dword ptr [ebp-688],xmm1
        movss   xmm0,dword ptr [ebx]
        mulss   xmm0,dword ptr [__viewport_matrix+4]
        movss   xmm1,dword ptr [ebx+4]
        mulss   xmm1,dword ptr [__viewport_matrix+20]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebx+8]
        mulss   xmm1,dword ptr [__viewport_matrix+36]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebx+12]
        mulss   xmm1,dword ptr [__viewport_matrix+52]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-684],xmm0
        movss   xmm0,dword ptr [ebx]
        mulss   xmm0,dword ptr [__viewport_matrix+8]
        movss   xmm1,dword ptr [ebx+4]
        mulss   xmm1,dword ptr [__viewport_matrix+24]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebx+8]
        mulss   xmm1,dword ptr [__viewport_matrix+40]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebx+12]
        mulss   xmm1,dword ptr [__viewport_matrix+56]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-680],xmm0
        movss   xmm0,dword ptr [ebx]
        mulss   xmm0,dword ptr [__viewport_matrix+12]
        movss   xmm1,dword ptr [ebx+4]
        mulss   xmm1,dword ptr [__viewport_matrix+28]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebx+8]
        mulss   xmm1,dword ptr [__viewport_matrix+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [ebx+12]
        mulss   xmm1,dword ptr [__viewport_matrix+60]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-676],xmm0
; end of inline function matrix4f_transform
        lea     eax,[ebp-688]
        add     eax,12
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,dword ptr [eax]
        movss   xmm0,dword ptr [ebp-688]
        mulss   xmm0,xmm1
        cvttss2si       eax,xmm0
        mov     [ecx],eax
        lea     eax,[ebp-688]
        add     eax,4
        movss   xmm0,dword ptr [eax]
        mulss   xmm0,xmm1
        cvttss2si       eax,xmm0
        mov     [ecx+4],eax
        cmp     dword ptr [ecx],0
        jl      label002a
        mov     eax,[ecx]
        cmp     eax,dword ptr [__width]
        jge     label002a
        cmp     dword ptr [ecx+4],0
        jl      label002a
        mov     eax,[ecx+4]
        cmp     eax,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     eax,[ebp-332]
        mov     ecx,esi
        sal     ecx,4
        add     eax,ecx
        add     eax,8
        mov     ecx,edi
        mov     ebx,esi
        imul    ebx,24
        add     ecx,ebx
        add     ecx,16
        mov     ebx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],ebx
        mov     [eax+4],ecx
        inc     esi
        jmp     label0003
label0004:
        mov     esi,2
label0006:
        mov     eax,[edi+192]
        dec     eax
        cmp     eax,esi
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     ebx,[ebp-332]
        mov     eax,esi
        sal     eax,4
        add     ebx,eax
        mov     eax,esi
        dec     eax
        sal     eax,4
        lea     ecx,[ebp-332]
        add     ecx,eax
        lea     eax,[ebp-332]
        mov     edx,[eax+4]
        cmp     edx,[ecx+4]
        jle     label0008
        mov     edx,eax
        mov     eax,ecx
        mov     ecx,edx
label0008:
        mov     edx,[eax+4]
        cmp     edx,[ebx+4]
        jle     label0009
        mov     edx,eax
        mov     eax,ebx
        mov     ebx,edx
label0009:
        mov     edx,[ecx+4]
        cmp     edx,[ebx+4]
        jle     label000a
        mov     edx,ecx
        mov     ecx,ebx
        mov     ebx,edx
label000a:
        mov     edx,[eax+4]
        cmp     edx,[ebx+4]
        jne     label000b
        cmp     dword ptr [eax+4],0
        jl      label000c
        mov     edx,[eax+4]
        cmp     edx,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   xmm6,dword ptr [___unnamed_float_2]
        mov     edx,ebx
        mov     [ebp-200],edi
        mov     edi,ecx
        mov     [ebp-336],esi
        mov     esi,eax
        mov     [ebp-440],edi
        mov     edi,[eax+4]
        mov     ebx,[ebx]
        mov     ecx,[ecx]
        mov     eax,[eax]
        cmp     eax,ecx
        jge     label001c
        cmp     ebx,ecx
        jle     label001d
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [esi+12]
        push    dword ptr [esi+8]
        push    edi
        push    ebx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001e
label001d:
        cmp     ebx,eax
        jge     label001f
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [edx+12]
        push    dword ptr [edx+8]
        push    edi
        push    ecx
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [esi+12]
        push    dword ptr [esi+8]
        push    edi
        push    ecx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0020:
label001e:
        jmp     label0021
label001c:
        cmp     ebx,ecx
        jge     label0022
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        push    dword ptr [edx+12]
        push    dword ptr [edx+8]
        push    edi
        push    eax
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0023
        movss   xmm6,dword ptr [ebp-432]
        movss   xmm7,dword ptr [ebp-428]
label0022:
        cmp     ebx,eax
        jle     label0024
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     [ebp-448],edi
        mov     edi,[ebp-440]
        push    dword ptr [edi+12]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-448]
        push    ebx
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
        mov     [ebp-440],edi
        mov     edi,[ebp-448]
        movss   xmm6,dword ptr [ebp-432]
        movss   xmm7,dword ptr [ebp-428]
label0024:
        xorps   xmm7,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        xorps   xmm6,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        mov     [ebp-448],edi
        mov     edi,[ebp-440]
        push    dword ptr [edi+12]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-448]
        push    eax
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
label0025:
label0023:
label0021:
; end of inline function _rasterize_triangle_1i
        mov     esi,[ebp-336]
        mov     edi,[ebp-200]
label000c:
        jmp     label0027
label000b:
        mov     edx,[eax+4]
label000e:
        mov     [ebp-200],edi
        mov     edi,[ecx+4]
        cmp     edi,edx
        jle     label000f
        mov     [ebp-348],eax
        mov     eax,edx
        mov     edi,[ebp-348]
        sub     eax,[edi+4]
        mov     edi,[ecx]
        mov     [ebp-356],eax
        mov     eax,[ebp-348]
        sub     edi,[eax]
        mov     [ebp-348],eax
        mov     eax,[ebp-356]
        imul    eax,edi
        mov     edi,[ecx+4]
        mov     [ebp-356],eax
        mov     eax,[ebp-348]
        sub     edi,[eax+4]
        mov     [ebp-364],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-356]
        cdq
        idiv    edi
        mov     edi,[ebp-348]
        add     eax,[edi]
        mov     [ebp-356],eax
        mov     eax,[ebp-364]
        mov     edx,[ebp-348]
        sub     eax,[edx+4]
        mov     edx,[ebx]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     edx,[eax]
        mov     [ebp-348],eax
        mov     eax,[ebp-360]
        imul    eax,edx
        mov     edx,[ebx+4]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     edx,[eax+4]
        mov     [ebp-708],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-360]
        cdq
        idiv    dword ptr [ebp-708]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     edx,[ebp-364]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     edx,[eax+4]
        cvtsi2ss        xmm7,edx
        movss   xmm0,dword ptr [ecx+8]
        subss   xmm0,dword ptr [eax+8]
        mulss   xmm7,xmm0
        mov     edx,[ecx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm0,edx
        divss   xmm7,xmm0
        addss   xmm7,dword ptr [eax+8]
        mov     edx,[ebp-364]
        sub     edx,[eax+4]
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [ebx+8]
        subss   xmm1,dword ptr [eax+8]
        mulss   xmm0,xmm1
        mov     edx,[ebx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [eax+8]
        mov     edx,[ebp-364]
        sub     edx,[eax+4]
        cvtsi2ss        xmm1,edx
        mov     edx,8
        add     edx,ecx
        add     edx,4
        mov     edi,8
        add     edi,eax
        add     edi,4
        movss   xmm2,dword ptr [edx]
        subss   xmm2,dword ptr [edi]
        mulss   xmm1,xmm2
        mov     edx,[ecx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm2,edx
        divss   xmm1,xmm2
        mov     edx,8
        add     edx,eax
        add     edx,4
        addss   xmm1,dword ptr [edx]
        mov     edx,[ebp-364]
        sub     edx,[eax+4]
        cvtsi2ss        xmm2,edx
        mov     edx,8
        add     edx,ebx
        add     edx,4
        mov     edi,8
        add     edi,eax
        add     edi,4
        movss   xmm3,dword ptr [edx]
        subss   xmm3,dword ptr [edi]
        mulss   xmm2,xmm3
        mov     edx,[ebx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm3,edx
        divss   xmm2,xmm3
        mov     edx,8
        add     edx,eax
        add     edx,4
        addss   xmm2,dword ptr [edx]
        mov     edx,[ebp-360]
        sub     edx,[ebp-356]
        cvtsi2ss        xmm3,edx
        movss   xmm6,xmm0
        subss   xmm6,xmm7
        divss   xmm6,xmm3
        mov     edx,[ebp-360]
        sub     edx,[ebp-356]
        cvtsi2ss        xmm3,edx
        movss   xmm5,xmm2
        subss   xmm5,xmm1
        divss   xmm5,xmm3
; start of inline function _rasterize_horiz_line__unordered
        movss   xmm3,xmm2
        movss   xmm2,xmm0
        mov     edi,[ebp-364]
        mov     edx,[ebp-360]
        mov     [ebp-336],esi
        mov     esi,[ebp-356]
        cmp     esi,edx
        jg      label0013
        mov     [ebp-344],ecx
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        push    edi
        push    edx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
        mov     eax,[ebp-348]
        mov     ecx,[ebp-344]
label0013:
        mov     [ebp-348],eax
        mov     [ebp-344],ecx
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        push    edi
        push    esi
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-364]
        mov     eax,[ebp-348]
        mov     ecx,[ebp-344]
        mov     edx,[ebp-364]
        mov     esi,[ebp-336]
        mov     edi,[ebp-200]
        jmp     label000e
        mov     [ebp-200],edi
label000f:
        mov     [ebp-348],eax
        mov     eax,[ecx+4]
        mov     edi,[ebp-348]
        sub     eax,[edi+4]
        mov     edx,[ebx]
        mov     [ebp-712],eax
        mov     eax,[ebp-348]
        sub     edx,[eax]
        mov     [ebp-348],eax
        mov     eax,[ebp-712]
        imul    eax,edx
        mov     edx,[ebx+4]
        mov     [ebp-712],eax
        mov     eax,[ebp-348]
        sub     edx,[eax+4]
        mov     [ebp-716],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-712]
        cdq
        idiv    dword ptr [ebp-716]
        mov     edx,[ebp-348]
        add     eax,[edx]
        mov     edx,[ecx+4]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     edx,[eax+4]
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [ebx+8]
        subss   xmm1,dword ptr [eax+8]
        mulss   xmm0,xmm1
        mov     edx,[ebx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [eax+8]
        mov     edx,[ecx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm1,edx
        mov     edx,8
        add     edx,ebx
        add     edx,4
        mov     edi,8
        add     edi,eax
        add     edi,4
        movss   xmm2,dword ptr [edx]
        subss   xmm2,dword ptr [edi]
        mulss   xmm1,xmm2
        mov     edx,[ebx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm2,edx
        divss   xmm1,xmm2
        mov     edx,8
        add     edx,eax
        add     edx,4
        addss   xmm1,dword ptr [edx]
        movss   xmm2,xmm1
        movss   xmm1,xmm0
        subss   xmm1,dword ptr [ecx+8]
        mov     edx,[ebp-360]
        sub     edx,[ecx]
        cvtsi2ss        xmm3,edx
        divss   xmm1,xmm3
        movss   xmm6,xmm1
        mov     edx,8
        add     edx,ecx
        add     edx,4
        movss   xmm1,xmm2
        subss   xmm1,dword ptr [edx]
        mov     edx,[ebp-360]
        sub     edx,[ecx]
        cvtsi2ss        xmm3,edx
        divss   xmm1,xmm3
        movss   xmm5,xmm1
; start of inline function _rasterize_horiz_line__unordered
        mov     edx,8
        add     edx,ecx
        add     edx,4
        movss   xmm3,dword ptr [edx]
        movss   dword ptr [ebp-380],xmm2
        movss   xmm2,dword ptr [ecx+8]
        movss   xmm1,dword ptr [ebp-380]
        movss   xmm7,xmm0
        mov     edx,[ecx+4]
        mov     edi,edx
        mov     edx,[ecx]
        mov     [ebp-336],esi
        mov     esi,[ebp-360]
        cmp     esi,edx
        jg      label0016
        mov     [ebp-344],ecx
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        push    edi
        push    edx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
        mov     eax,[ebp-348]
        mov     ecx,[ebp-344]
label0016:
        mov     [ebp-348],eax
        mov     [ebp-344],ecx
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        push    edi
        push    esi
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     edx,1
        mov     ecx,[ebp-344]
        add     edx,[ecx+4]
label0011:
        mov     esi,[ebx+4]
        cmp     esi,edx
        jle     label0012
        mov     eax,edx
        sub     eax,[ecx+4]
        mov     esi,[ebx]
        sub     esi,[ecx]
        imul    eax,esi
        mov     esi,[ebx+4]
        sub     esi,[ecx+4]
        mov     [ebp-364],edx
        cdq
        idiv    esi
        add     eax,[ecx]
        mov     [ebp-356],eax
        mov     eax,[ebp-364]
        mov     edi,[ebp-348]
        sub     eax,[edi+4]
        mov     edx,[ebx]
        mov     [ebp-720],eax
        mov     eax,[ebp-348]
        sub     edx,[eax]
        mov     [ebp-348],eax
        mov     eax,[ebp-720]
        imul    eax,edx
        mov     edx,[ebx+4]
        mov     [ebp-720],eax
        mov     eax,[ebp-348]
        sub     edx,[eax+4]
        mov     [ebp-724],edx
        mov     [ebp-348],eax
        mov     eax,[ebp-720]
        cdq
        idiv    dword ptr [ebp-724]
        mov     esi,[ebp-348]
        add     eax,[esi]
        mov     edx,[ebp-364]
        sub     edx,[ecx+4]
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [ebx+8]
        subss   xmm1,dword ptr [ecx+8]
        mulss   xmm0,xmm1
        mov     edx,[ebx+4]
        sub     edx,[ecx+4]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [ecx+8]
        movss   xmm7,xmm0
        mov     edx,[ebp-364]
        mov     [ebp-360],eax
        mov     eax,[ebp-348]
        sub     edx,[eax+4]
        cvtsi2ss        xmm0,edx
        movss   xmm1,dword ptr [ebx+8]
        subss   xmm1,dword ptr [eax+8]
        mulss   xmm0,xmm1
        mov     edx,[ebx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm1,edx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [eax+8]
        mov     edx,[ebp-364]
        sub     edx,[ecx+4]
        cvtsi2ss        xmm1,edx
        mov     edx,8
        add     edx,ebx
        add     edx,4
        mov     esi,8
        add     esi,ecx
        add     esi,4
        movss   xmm2,dword ptr [edx]
        subss   xmm2,dword ptr [esi]
        mulss   xmm1,xmm2
        mov     edx,[ebx+4]
        sub     edx,[ecx+4]
        cvtsi2ss        xmm2,edx
        divss   xmm1,xmm2
        mov     edx,8
        add     edx,ecx
        add     edx,4
        addss   xmm1,dword ptr [edx]
        mov     edx,[ebp-364]
        sub     edx,[eax+4]
        cvtsi2ss        xmm2,edx
        mov     edx,8
        add     edx,ebx
        add     edx,4
        mov     esi,8
        add     esi,eax
        add     esi,4
        movss   xmm3,dword ptr [edx]
        subss   xmm3,dword ptr [esi]
        mulss   xmm2,xmm3
        mov     edx,[ebx+4]
        sub     edx,[eax+4]
        cvtsi2ss        xmm3,edx
        divss   xmm2,xmm3
        mov     edx,8
        add     edx,eax
        add     edx,4
        addss   xmm2,dword ptr [edx]
        mov     edx,[ebp-360]
        sub     edx,[ebp-356]
        cvtsi2ss        xmm3,edx
        movss   xmm5,xmm0
        subss   xmm5,xmm7
        divss   xmm5,xmm3
        movss   xmm6,xmm5
        mov     edx,[ebp-360]
        sub     edx,[ebp-356]
        cvtsi2ss        xmm3,edx
        movss   xmm5,xmm2
        subss   xmm5,xmm1
        divss   xmm5,xmm3
; start of inline function _rasterize_horiz_line__unordered
        movss   xmm3,xmm2
        movss   xmm2,xmm0
        mov     edi,[ebp-364]
        mov     edx,[ebp-360]
        mov     esi,[ebp-356]
        cmp     esi,edx
        jg      label0019
        mov     [ebp-344],ecx
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm1
        sub     esp,4
        movss   dword ptr [esp-4],xmm7
        sub     esp,4
        push    edi
        push    edx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
        mov     eax,[ebp-348]
        mov     ecx,[ebp-344]
label0019:
        mov     [ebp-348],eax
        mov     [ebp-344],ecx
        movss   dword ptr [esp-4],xmm5
        sub     esp,4
        movss   dword ptr [esp-4],xmm6
        sub     esp,4
        movss   dword ptr [esp-4],xmm3
        sub     esp,4
        movss   dword ptr [esp-4],xmm2
        sub     esp,4
        push    edi
        push    esi
        push    edx
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-364]
        mov     ecx,[ebp-344]
        mov     edx,[ebp-364]
        jmp     label0011
label0012:
        mov     esi,[ebp-336]
        mov     edi,[ebp-200]
label0027:
; end of inline function _rasterize_triangle_2i
        inc     esi
        jmp     label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        add     esp,724
        pop     ebp
        ret
_rasterizer_triangle3f endp     

end
