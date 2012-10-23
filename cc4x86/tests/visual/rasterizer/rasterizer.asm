
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
        sub     esp,100
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
        mov     [ebp-80],ebx
        mov     [ebp-84],esi
        movss   dword ptr [ebp-88],xmm5
        movss   dword ptr [ebp-92],xmm6
        jbe     label0000
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-96],xmm7
        jmp     label0001
label0000:
        movss   xmm7,dword ptr [___unnamed_float_5]
        movss   dword ptr [ebp-96],xmm7
label0001:
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [ebp-96]
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
        movss   xmm4,dword ptr [ebp-92]
        movss   xmm3,dword ptr [___unnamed_float_2]
        movss   xmm2,dword ptr [___unnamed_float_2]
        mov     edi,(offset __clip_z_far_base)
        movss   dword ptr [edi],xmm2
        movss   dword ptr [edi+4],xmm3
        movss   dword ptr [edi+8],xmm4
        movss   dword ptr [edi+12],xmm7
; end of inline function vec4f_assign
        movss   xmm2,dword ptr [ebp-92]
        comiss  xmm2,dword ptr [ebp-88]
        jbe     label0002
        movss   xmm7,dword ptr [___unnamed_float_5]
        movss   dword ptr [ebp-100],xmm7
        jmp     label0003
label0002:
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   dword ptr [ebp-100],xmm7
label0003:
; start of inline function vec4f_assign
        movss   xmm7,dword ptr [___unnamed_float_1]
        movss   xmm4,dword ptr [ebp-100]
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
        cvtsi2ss        xmm2,dword ptr [ebp-80]
        movss   xmm0,dword ptr [___unnamed_float_1]
        divss   xmm0,xmm2
        movss   xmm2,dword ptr [___unnamed_float_5]
        addss   xmm2,xmm0
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
        cvtsi2ss        xmm0,dword ptr [ebp-80]
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
        cvtsi2ss        xmm0,dword ptr [ebp-84]
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
        add     esp,100
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
        sub     esp,96
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
        mov     [ebp-68],edx
        mov     [ebp-72],edi
        movss   dword ptr [ebp-84],xmm4
        movss   dword ptr [ebp-88],xmm5
        movss   dword ptr [ebp-92],xmm6
        movss   dword ptr [ebp-96],xmm7
label0000:
; start of inline function _tex2d
        movss   xmm7,dword ptr [ebp-88]
        movss   xmm6,dword ptr [ebp-84]
        mov     eax,dword ptr [__texture_width]
        dec     eax
        cvtsi2ss        xmm0,eax
        mulss   xmm0,xmm6
        cvttss2si       eax,xmm0
        mov     ecx,dword ptr [__texture_height]
        dec     ecx
        cvtsi2ss        xmm0,ecx
        mulss   xmm0,xmm7
        cvttss2si       ecx,xmm0
        imul    ecx,dword ptr [__texture_width]
        add     ecx,eax
        sal     ecx,2
        add     ecx,dword ptr [__texture_data]
        mov     ecx,[ecx]
; end of inline function _tex2d
        mov     eax,ecx
        sar     eax,24
        and     eax,255
        cmp     eax,0
        mov     [ebp-76],ecx
        mov     [ebp-80],eax
        je      label0003
        cvtsi2ss        xmm7,dword ptr [ebp-80]
        divss   xmm7,dword ptr [___unnamed_float_6]
        mov     edx,[ebp-68]
        mov     edi,[edx]
        mov     esi,edi
        and     esi,65280
        sar     esi,8
        and     edi,255
        mov     ebx,[ebp-76]
        and     ebx,65280
        sar     ebx,8
        mov     ecx,[ebp-76]
        and     ecx,255
        cvtsi2ss        xmm0,ebx
        mulss   xmm0,xmm7
        cvtsi2ss        xmm1,esi
        movss   xmm2,dword ptr [___unnamed_float_1]
        subss   xmm2,xmm7
        mulss   xmm1,xmm2
        addss   xmm0,xmm1
        cvttss2si       ebx,xmm0
        cvtsi2ss        xmm0,ecx
        mulss   xmm0,xmm7
        cvtsi2ss        xmm1,edi
        movss   xmm2,dword ptr [___unnamed_float_1]
        subss   xmm2,xmm7
        mulss   xmm1,xmm2
        addss   xmm0,xmm1
        cvttss2si       ecx,xmm0
        mov     edi,ebx
        sal     edi,8
        add     edi,ecx
        mov     [edx],edi
label0003:
        movss   xmm4,dword ptr [ebp-84]
        addss   xmm4,dword ptr [ebp-92]
        movss   xmm5,dword ptr [ebp-88]
        addss   xmm5,dword ptr [ebp-96]
        mov     edx,[ebp-68]
        add     edx,4
        cmp     edx,[ebp-72]
        mov     [ebp-68],edx
        movss   dword ptr [ebp-84],xmm4
        movss   dword ptr [ebp-88],xmm5
        jl      label0000
        pop     ebx
        pop     esi
        pop     edi
        add     esp,96
        pop     ebp
        ret
__rasterize_horiz_line endp     

__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,180
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
        mov     [ebp-140],ecx
        mov     [ebp-144],eax
        mov     [ebp-148],edx
        mov     [ebp-152],ebx
        mov     [ebp-156],esi
        mov     [ebp-160],edi
label0001:
        mov     ebx,[ebp-152]
        mov     eax,[ebx+192]
        imul    eax,24
        mov     ecx,ebx
        add     ecx,eax
        cmp     ecx,[ebp-144]
        jle     label0002
; start of inline function vec4f_subtract
        mov     edi,[ebp-156]
        mov     esi,[ebp-140]
        lea     ebx,[ebp-24]
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [esi+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp-160]
        lea     esi,[ebp-24]
        movss   xmm0,dword ptr [esi+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm7,dword ptr [esi]
        mulss   xmm7,dword ptr [edi]
        addss   xmm7,xmm0
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm7,xmm0
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm7,xmm0
; end of inline function vec4f_dot
; start of inline function vec4f_subtract
        mov     edi,[ebp-156]
        mov     esi,[ebp-144]
        lea     ebx,[ebp-24]
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [esi+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp-160]
        lea     ebx,[ebp-24]
        mov     esi,ebx
        movss   xmm0,dword ptr [esi+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [esi]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
        movss   dword ptr [ebp-168],xmm7
        movss   xmm7,xmm1
; end of inline function vec4f_dot
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-168]
        movss   dword ptr [ebp-172],xmm7
        ja      label0003
        mov     edx,[ebp-148]
        mov     eax,[edx+192]
        inc     dword ptr [edx+192]
        imul    eax,24
        mov     ecx,edx
        add     ecx,eax
        mov     [ebp-164],ecx
        mov     ecx,[ebp-140]
        mov     eax,[ecx]
        mov     ebx,[ecx+4]
        mov     [ebp-140],ecx
        mov     ecx,[ebp-164]
        mov     [ecx],eax
        mov     [ecx+4],ebx
        mov     [ebp-164],ecx
        mov     ecx,[ebp-140]
        mov     eax,[ecx+8]
        mov     ebx,[ecx+12]
        mov     [ebp-140],ecx
        mov     ecx,[ebp-164]
        mov     [ecx+8],eax
        mov     [ecx+12],ebx
        mov     [ebp-164],ecx
        mov     ecx,[ebp-140]
        mov     eax,[ecx+16]
        mov     ebx,[ecx+20]
        mov     [ebp-140],ecx
        mov     ecx,[ebp-164]
        mov     [ecx+16],eax
        mov     [ecx+20],ebx
label0003:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-168]
        jae     label0006
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-172]
        ja      label0005
label0006:
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-172]
        ja      label0004
        movss   xmm0,dword ptr [___unnamed_float_2]
        comiss  xmm0,dword ptr [ebp-168]
        jbe     label0004
label0005:
; start of inline function vec4f_subtract
        mov     edi,[ebp-140]
        mov     esi,[ebp-156]
        lea     eax,[ebp-24]
        mov     ebx,eax
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [esi+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_subtract
        mov     edi,[ebp-140]
        mov     esi,[ebp-144]
        lea     eax,[ebp-40]
        mov     ebx,eax
        movss   xmm0,dword ptr [esi]
        subss   xmm0,dword ptr [edi]
        movss   dword ptr [ebx],xmm0
        movss   xmm0,dword ptr [esi+4]
        subss   xmm0,dword ptr [edi+4]
        movss   dword ptr [ebx+4],xmm0
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [edi+8]
        movss   dword ptr [ebx+8],xmm0
        movss   xmm0,dword ptr [esi+12]
        subss   xmm0,dword ptr [edi+12]
        movss   dword ptr [ebx+12],xmm0
; end of inline function vec4f_subtract
; start of inline function vec4f_dot
        mov     edi,[ebp-160]
        lea     eax,[ebp-24]
        mov     esi,eax
        movss   xmm0,dword ptr [esi+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [esi]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
        movss   xmm7,xmm1
; end of inline function vec4f_dot
; start of inline function vec4f_dot
        mov     edi,[ebp-160]
        lea     eax,[ebp-40]
        mov     esi,eax
        movss   xmm0,dword ptr [esi+4]
        mulss   xmm0,dword ptr [edi+4]
        movss   xmm1,dword ptr [esi]
        mulss   xmm1,dword ptr [edi]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+8]
        mulss   xmm0,dword ptr [edi+8]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [esi+12]
        mulss   xmm0,dword ptr [edi+12]
        addss   xmm1,xmm0
        movss   dword ptr [ebp-176],xmm7
        movss   xmm7,xmm1
; end of inline function vec4f_dot
        movss   dword ptr [ebp-180],xmm7
        movss   xmm7,dword ptr [ebp-176]
        divss   xmm7,dword ptr [ebp-180]
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
        mov     edi,[ebp-140]
        mov     edx,[ebp-148]
        mov     eax,[edx+192]
        imul    eax,24
        mov     esi,edx
        add     esi,eax
        movss   xmm0,dword ptr [edi]
        addss   xmm0,dword ptr [ebp-40]
        movss   dword ptr [esi],xmm0
        movss   xmm0,dword ptr [edi+4]
        addss   xmm0,dword ptr [ebp-36]
        movss   dword ptr [esi+4],xmm0
        movss   xmm0,dword ptr [edi+8]
        addss   xmm0,dword ptr [ebp-32]
        movss   dword ptr [esi+8],xmm0
        movss   xmm0,dword ptr [edi+12]
        addss   xmm0,dword ptr [ebp-28]
        movss   dword ptr [esi+12],xmm0
; end of inline function vec4f_add
; start of inline function vec2f_subtract
        mov     edi,[ebp-140]
        mov     esi,[ebp-144]
        movss   xmm0,dword ptr [esi+16]
        subss   xmm0,dword ptr [edi+16]
        movss   dword ptr [ebp-48],xmm0
        movss   xmm0,dword ptr [esi+20]
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
        mov     edi,[ebp-140]
        mov     eax,[edx+192]
        imul    eax,24
        mov     esi,edx
        add     esi,eax
        add     esi,16
        movss   xmm0,dword ptr [edi+16]
        addss   xmm0,dword ptr [ebp-48]
        movss   dword ptr [esi],xmm0
        movss   xmm0,dword ptr [edi+20]
        addss   xmm0,dword ptr [ebp-44]
        movss   dword ptr [esi+4],xmm0
; end of inline function vec2f_add
        inc     dword ptr [edx+192]
label0004:
        mov     ecx,[ebp-140]
        add     ecx,24
        mov     eax,[ebp-144]
        add     eax,24
        mov     [ebp-140],ecx
        mov     [ebp-144],eax
        jmp     label0001
label0002:
        mov     edx,[ebp-148]
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
        add     esp,180
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
        sub     esp,836
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+28]
        mov     esi,[ebp+24]
        mov     ebx,[ebp+20]
        mov     edx,[ebp+16]
        mov     ecx,[ebp+12]
        mov     eax,[ebp+8]
        mov     [ebp-708],ecx
        mov     [ebp-712],edx
        push    eax
        lea     eax,[ebp-196]
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     edx,[ebp-712]
        mov     ecx,[ebp-708]
        lea     eax,[ebp-196]
        add     eax,16
        mov     [ebp-716],edi
        mov     edi,[ebx]
        mov     ebx,[ebx+4]
        mov     [eax],edi
        mov     [eax+4],ebx
        mov     [ebp-712],edx
        push    ecx
        lea     eax,[ebp-196]
        add     eax,24
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        mov     edx,[ebp-712]
        lea     eax,[ebp-196]
        add     eax,24
        add     eax,16
        mov     ecx,[esi]
        mov     ebx,[esi+4]
        mov     [eax],ecx
        mov     [eax+4],ebx
        push    edx
        lea     eax,[ebp-196]
        add     eax,48
        push    eax
        call    __transform_to_projection_space
        add     esp,8
        lea     eax,[ebp-196]
        add     eax,48
        add     eax,16
        mov     edi,[ebp-716]
        mov     ecx,[edi]
        mov     edx,[edi+4]
        mov     [eax],ecx
        mov     [eax+4],edx
        lea     eax,[ebp-196]
        add     eax,72
        mov     ecx,[ebp-196]
        mov     edx,[ebp-192]
        mov     [eax],ecx
        mov     [eax+4],edx
        mov     ecx,[ebp-188]
        mov     edx,[ebp-184]
        mov     [eax+8],ecx
        mov     [eax+12],edx
        mov     ecx,[ebp-180]
        mov     edx,[ebp-176]
        mov     [eax+16],ecx
        mov     [eax+20],edx
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
        mov     [ebp-720],edi
        jne     label0000
        jmp     label0007
label0000:
        mov     edi,[ebp-720]
        cmp     dword ptr [edi+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     edi,0
        mov     [ebp-724],edi
label0003:
        mov     edi,[ebp-720]
        mov     eax,[edi+192]
        cmp     eax,[ebp-724]
        jle     label0004
; start of inline function _transform_to_screen_space
        mov     edi,[ebp-720]
        mov     eax,[ebp-724]
        imul    eax,24
        add     edi,eax
        lea     eax,[ebp-332]
        mov     ecx,[ebp-724]
        sal     ecx,4
        add     eax,ecx
; start of inline function matrix4f_transform
        movss   xmm0,dword ptr [edi+4]
        mulss   xmm0,dword ptr [__viewport_matrix+16]
        movss   xmm1,dword ptr [edi]
        mulss   xmm1,dword ptr [__viewport_matrix]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edi+8]
        mulss   xmm0,dword ptr [__viewport_matrix+32]
        addss   xmm1,xmm0
        movss   xmm0,dword ptr [edi+12]
        mulss   xmm0,dword ptr [__viewport_matrix+48]
        addss   xmm1,xmm0
        movss   dword ptr [ebp-688],xmm1
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [__viewport_matrix+4]
        movss   xmm1,dword ptr [edi+4]
        mulss   xmm1,dword ptr [__viewport_matrix+20]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edi+8]
        mulss   xmm1,dword ptr [__viewport_matrix+36]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edi+12]
        mulss   xmm1,dword ptr [__viewport_matrix+52]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-684],xmm0
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [__viewport_matrix+8]
        movss   xmm1,dword ptr [edi+4]
        mulss   xmm1,dword ptr [__viewport_matrix+24]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edi+8]
        mulss   xmm1,dword ptr [__viewport_matrix+40]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edi+12]
        mulss   xmm1,dword ptr [__viewport_matrix+56]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-680],xmm0
        movss   xmm0,dword ptr [edi]
        mulss   xmm0,dword ptr [__viewport_matrix+12]
        movss   xmm1,dword ptr [edi+4]
        mulss   xmm1,dword ptr [__viewport_matrix+28]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edi+8]
        mulss   xmm1,dword ptr [__viewport_matrix+44]
        addss   xmm0,xmm1
        movss   xmm1,dword ptr [edi+12]
        mulss   xmm1,dword ptr [__viewport_matrix+60]
        addss   xmm0,xmm1
        movss   dword ptr [ebp-676],xmm0
; end of inline function matrix4f_transform
        lea     ecx,[ebp-688]
        add     ecx,12
        movss   xmm1,dword ptr [___unnamed_float_1]
        divss   xmm1,dword ptr [ecx]
        movss   xmm0,dword ptr [ebp-688]
        mulss   xmm0,xmm1
        cvttss2si       ecx,xmm0
        mov     [eax],ecx
        lea     ecx,[ebp-688]
        add     ecx,4
        movss   xmm0,dword ptr [ecx]
        mulss   xmm0,xmm1
        cvttss2si       ecx,xmm0
        mov     [eax+4],ecx
        cmp     dword ptr [eax],0
        mov     [ebp-728],eax
        jl      label002a
        mov     edi,[ebp-728]
        mov     eax,[edi]
        cmp     eax,dword ptr [__width]
        jge     label002a
        mov     edi,[ebp-728]
        cmp     dword ptr [edi+4],0
        jl      label002a
        mov     edi,[ebp-728]
        mov     eax,[edi+4]
        cmp     eax,dword ptr [__height]
        jl      label0029
label002a:
        mov     dword ptr ds:[0],0
label0029:
; end of inline function _transform_to_screen_space
        lea     eax,[ebp-332]
        mov     ecx,[ebp-724]
        sal     ecx,4
        add     eax,ecx
        add     eax,8
        mov     ecx,[ebp-720]
        mov     edx,[ebp-724]
        imul    edx,24
        add     ecx,edx
        add     ecx,16
        mov     edx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ecx
        inc     dword ptr [ebp-724]
        jmp     label0003
label0004:
        mov     edi,2
        mov     [ebp-724],edi
label0006:
        mov     edi,[ebp-720]
        mov     eax,[edi+192]
        dec     eax
        cmp     eax,[ebp-724]
        jle     label0007
; start of inline function _rasterize_triangle_2i
        lea     edi,[ebp-332]
        mov     eax,[ebp-724]
        sal     eax,4
        add     edi,eax
        mov     eax,[ebp-724]
        dec     eax
        sal     eax,4
        lea     esi,[ebp-332]
        add     esi,eax
        lea     eax,[ebp-332]
        mov     ecx,[eax+4]
        cmp     ecx,[esi+4]
        mov     [ebp-732],eax
        mov     [ebp-736],esi
        mov     [ebp-740],edi
        jle     label0008
        mov     edi,[ebp-732]
        mov     eax,[ebp-736]
        mov     esi,edi
        mov     [ebp-732],eax
        mov     [ebp-736],esi
label0008:
        mov     edi,[ebp-732]
        mov     eax,[edi+4]
        mov     edi,[ebp-740]
        cmp     eax,[edi+4]
        jle     label0009
        mov     edi,[ebp-732]
        mov     eax,[ebp-740]
        mov     [ebp-732],eax
        mov     [ebp-740],edi
label0009:
        mov     esi,[ebp-736]
        mov     eax,[esi+4]
        mov     edi,[ebp-740]
        cmp     eax,[edi+4]
        jle     label000a
        mov     edi,[ebp-736]
        mov     esi,[ebp-740]
        mov     [ebp-736],esi
        mov     [ebp-740],edi
label000a:
        mov     edi,[ebp-732]
        mov     eax,[edi+4]
        mov     edi,[ebp-740]
        cmp     eax,[edi+4]
        jne     label000b
        mov     edi,[ebp-732]
        cmp     dword ptr [edi+4],0
        jl      label000c
        mov     edi,[ebp-732]
        mov     eax,[edi+4]
        cmp     eax,dword ptr [__height]
        jge     label000c
; start of inline function _rasterize_triangle_1i
        movss   xmm7,dword ptr [___unnamed_float_2]
        movss   xmm6,dword ptr [___unnamed_float_2]
        mov     edi,[ebp-740]
        mov     esi,[ebp-736]
        mov     ebx,[ebp-732]
        mov     eax,[ebp-732]
        mov     edx,[eax+4]
        mov     [ebp-744],edi
        mov     edi,[ebp-740]
        mov     ecx,[edi]
        mov     [ebp-748],esi
        mov     esi,[ebp-736]
        mov     edi,[esi]
        mov     esi,[eax]
        cmp     esi,edi
        mov     [ebp-752],esi
        mov     [ebp-756],edi
        mov     [ebp-760],ecx
        mov     [ebp-764],edx
        mov     [ebp-768],ebx
        movss   dword ptr [ebp-804],xmm6
        movss   dword ptr [ebp-808],xmm7
        jge     label001c
        mov     ecx,[ebp-760]
        cmp     ecx,[ebp-756]
        jle     label001d
        push    dword ptr [ebp-808]
        push    dword ptr [ebp-804]
        mov     edi,[ebp-768]
        push    dword ptr [edi+12]
        mov     edi,[ebp-768]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-764]
        push    dword ptr [ebp-760]
        push    dword ptr [ebp-752]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001d:
        mov     ecx,[ebp-760]
        cmp     ecx,[ebp-752]
        jge     label001f
        push    dword ptr [ebp-808]
        push    dword ptr [ebp-804]
        mov     edi,[ebp-744]
        push    dword ptr [edi+12]
        mov     edi,[ebp-744]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-764]
        push    dword ptr [ebp-756]
        push    dword ptr [ebp-760]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0020
label001f:
        push    dword ptr [ebp-808]
        push    dword ptr [ebp-804]
        mov     edi,[ebp-768]
        push    dword ptr [edi+12]
        mov     edi,[ebp-768]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-764]
        push    dword ptr [ebp-756]
        push    dword ptr [ebp-752]
        call    __rasterize_horiz_line
        add     esp,28
label0020:
        jmp     label0025
label001c:
        mov     ecx,[ebp-760]
        cmp     ecx,[ebp-756]
        jge     label0022
        movss   xmm0,dword ptr [ebp-808]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [ebp-804]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        mov     edi,[ebp-744]
        push    dword ptr [edi+12]
        mov     edi,[ebp-744]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-764]
        push    dword ptr [ebp-752]
        push    dword ptr [ebp-760]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
label0022:
        mov     ecx,[ebp-760]
        cmp     ecx,[ebp-752]
        jle     label0024
        movss   xmm0,dword ptr [ebp-808]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [ebp-804]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        mov     edi,[ebp-748]
        push    dword ptr [edi+12]
        mov     edi,[ebp-748]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-764]
        push    dword ptr [ebp-760]
        push    dword ptr [ebp-756]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0025
label0024:
        movss   xmm0,dword ptr [ebp-808]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        movss   xmm0,dword ptr [ebp-804]
        xorps   xmm0,dword ptr [___unnamed_float_4]
        movss   dword ptr [esp-4],xmm0
        sub     esp,4
        mov     edi,[ebp-748]
        push    dword ptr [edi+12]
        mov     edi,[ebp-748]
        push    dword ptr [edi+8]
        push    dword ptr [ebp-764]
        push    dword ptr [ebp-752]
        push    dword ptr [ebp-756]
        call    __rasterize_horiz_line
        add     esp,28
label0025:
; end of inline function _rasterize_triangle_1i
label000c:
        jmp     label0012
label000b:
        mov     eax,[ebp-732]
        mov     edi,[eax+4]
        mov     [ebp-772],edi
label000e:
        mov     esi,[ebp-736]
        mov     eax,[esi+4]
        cmp     eax,[ebp-772]
        jle     label000f
        mov     eax,[ebp-772]
        mov     edi,[ebp-732]
        sub     eax,[edi+4]
        mov     esi,[ebp-736]
        mov     ecx,[esi]
        mov     [ebp-776],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax]
        mov     [ebp-732],eax
        mov     eax,[ebp-776]
        imul    eax,ecx
        mov     ecx,[esi+4]
        mov     [ebp-776],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax+4]
        mov     [ebp-732],eax
        mov     eax,[ebp-776]
        cdq
        idiv    ecx
        mov     edx,[ebp-732]
        add     eax,[edx]
        mov     [ebp-776],eax
        mov     eax,[ebp-772]
        mov     ecx,[ebp-732]
        sub     eax,[ecx+4]
        mov     edi,[ebp-740]
        mov     ecx,[edi]
        mov     [ebp-780],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax]
        mov     [ebp-732],eax
        mov     eax,[ebp-780]
        imul    eax,ecx
        mov     ecx,[edi+4]
        mov     [ebp-780],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax+4]
        mov     [ebp-732],eax
        mov     eax,[ebp-780]
        cdq
        idiv    ecx
        mov     edx,[ebp-732]
        add     eax,[edx]
        mov     ecx,[ebp-772]
        mov     [ebp-780],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm7,ecx
        movss   xmm0,dword ptr [esi+8]
        subss   xmm0,dword ptr [eax+8]
        mulss   xmm7,xmm0
        mov     ecx,[esi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        divss   xmm7,xmm0
        addss   xmm7,dword ptr [eax+8]
        mov     ecx,[ebp-772]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [edi+8]
        subss   xmm1,dword ptr [eax+8]
        mulss   xmm0,xmm1
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [eax+8]
        mov     ecx,[ebp-772]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm1,ecx
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        mov     edx,8
        add     edx,eax
        add     edx,4
        movss   xmm2,dword ptr [ecx]
        subss   xmm2,dword ptr [edx]
        mulss   xmm1,xmm2
        mov     ecx,[esi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        addss   xmm1,dword ptr [ecx]
        mov     ecx,[ebp-772]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm2,ecx
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,eax
        add     edx,4
        movss   xmm3,dword ptr [ecx]
        subss   xmm3,dword ptr [edx]
        mulss   xmm2,xmm3
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        addss   xmm2,dword ptr [ecx]
        mov     ecx,[ebp-780]
        sub     ecx,[ebp-776]
        cvtsi2ss        xmm3,ecx
        movss   xmm6,xmm0
        subss   xmm6,xmm7
        divss   xmm6,xmm3
        mov     ecx,[ebp-780]
        sub     ecx,[ebp-776]
        cvtsi2ss        xmm3,ecx
        movss   xmm5,xmm2
        subss   xmm5,xmm1
        divss   xmm5,xmm3
; start of inline function _rasterize_horiz_line__unordered
        movss   xmm3,xmm2
        movss   xmm2,xmm0
        mov     edx,[ebp-772]
        mov     ecx,[ebp-780]
        mov     ebx,[ebp-776]
        cmp     ebx,ecx
        mov     [ebp-784],ebx
        mov     [ebp-788],ecx
        mov     [ebp-792],edx
        movss   dword ptr [ebp-812],xmm7
        movss   dword ptr [ebp-816],xmm1
        movss   dword ptr [ebp-820],xmm2
        movss   dword ptr [ebp-824],xmm3
        movss   dword ptr [ebp-828],xmm6
        movss   dword ptr [ebp-832],xmm5
        jg      label0013
        push    dword ptr [ebp-832]
        push    dword ptr [ebp-828]
        push    dword ptr [ebp-816]
        push    dword ptr [ebp-812]
        push    dword ptr [ebp-792]
        push    dword ptr [ebp-788]
        push    dword ptr [ebp-784]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0014
label0013:
        push    dword ptr [ebp-832]
        push    dword ptr [ebp-828]
        push    dword ptr [ebp-824]
        push    dword ptr [ebp-820]
        push    dword ptr [ebp-792]
        push    dword ptr [ebp-784]
        push    dword ptr [ebp-788]
        call    __rasterize_horiz_line
        add     esp,28
label0014:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-772]
        jmp     label000e
label000f:
        mov     esi,[ebp-736]
        mov     eax,[esi+4]
        mov     edi,[ebp-732]
        sub     eax,[edi+4]
        mov     edi,[ebp-740]
        mov     ecx,[edi]
        mov     [ebp-796],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax]
        mov     [ebp-732],eax
        mov     eax,[ebp-796]
        imul    eax,ecx
        mov     ecx,[edi+4]
        mov     [ebp-796],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax+4]
        mov     [ebp-732],eax
        mov     eax,[ebp-796]
        cdq
        idiv    ecx
        mov     edx,[ebp-732]
        add     eax,[edx]
        mov     ecx,[esi+4]
        mov     [ebp-780],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [edi+8]
        subss   xmm1,dword ptr [eax+8]
        mulss   xmm0,xmm1
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [eax+8]
        mov     ecx,[esi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm1,ecx
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,eax
        add     edx,4
        movss   xmm2,dword ptr [ecx]
        subss   xmm2,dword ptr [edx]
        mulss   xmm1,xmm2
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        addss   xmm1,dword ptr [ecx]
        movss   xmm2,xmm1
        movss   xmm1,xmm0
        subss   xmm1,dword ptr [esi+8]
        mov     ecx,[ebp-780]
        sub     ecx,[esi]
        cvtsi2ss        xmm3,ecx
        divss   xmm1,xmm3
        movss   xmm6,xmm1
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        movss   xmm1,xmm2
        subss   xmm1,dword ptr [ecx]
        mov     ecx,[ebp-780]
        sub     ecx,[esi]
        cvtsi2ss        xmm3,ecx
        divss   xmm1,xmm3
        movss   xmm5,xmm1
; start of inline function _rasterize_horiz_line__unordered
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        movss   xmm3,dword ptr [ecx]
        movss   dword ptr [ebp-836],xmm2
        movss   xmm2,dword ptr [esi+8]
        movss   xmm1,dword ptr [ebp-836]
        movss   xmm7,xmm0
        mov     ecx,[esi+4]
        mov     edx,ecx
        mov     ecx,[esi]
        mov     ebx,[ebp-780]
        cmp     ebx,ecx
        mov     [ebp-784],ebx
        mov     [ebp-788],ecx
        mov     [ebp-792],edx
        movss   dword ptr [ebp-812],xmm7
        movss   dword ptr [ebp-816],xmm1
        movss   dword ptr [ebp-820],xmm2
        movss   dword ptr [ebp-824],xmm3
        movss   dword ptr [ebp-828],xmm6
        movss   dword ptr [ebp-832],xmm5
        jg      label0016
        push    dword ptr [ebp-832]
        push    dword ptr [ebp-828]
        push    dword ptr [ebp-816]
        push    dword ptr [ebp-812]
        push    dword ptr [ebp-792]
        push    dword ptr [ebp-788]
        push    dword ptr [ebp-784]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0017
label0016:
        push    dword ptr [ebp-832]
        push    dword ptr [ebp-828]
        push    dword ptr [ebp-824]
        push    dword ptr [ebp-820]
        push    dword ptr [ebp-792]
        push    dword ptr [ebp-784]
        push    dword ptr [ebp-788]
        call    __rasterize_horiz_line
        add     esp,28
label0017:
; end of inline function _rasterize_horiz_line__unordered
        mov     eax,1
        mov     esi,[ebp-736]
        add     eax,[esi+4]
        mov     edi,eax
        mov     [ebp-772],edi
label0011:
        mov     edi,[ebp-740]
        mov     eax,[edi+4]
        cmp     eax,[ebp-772]
        jle     label0012
        mov     eax,[ebp-772]
        mov     esi,[ebp-736]
        sub     eax,[esi+4]
        mov     edi,[ebp-740]
        mov     ecx,[edi]
        sub     ecx,[esi]
        imul    eax,ecx
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        cdq
        idiv    ecx
        add     eax,[esi]
        mov     [ebp-776],eax
        mov     eax,[ebp-772]
        mov     edx,[ebp-732]
        sub     eax,[edx+4]
        mov     ecx,[edi]
        mov     [ebp-800],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax]
        mov     [ebp-732],eax
        mov     eax,[ebp-800]
        imul    eax,ecx
        mov     ecx,[edi+4]
        mov     [ebp-800],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax+4]
        mov     [ebp-732],eax
        mov     eax,[ebp-800]
        cdq
        idiv    ecx
        mov     edx,[ebp-732]
        add     eax,[edx]
        mov     ecx,[ebp-772]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [edi+8]
        subss   xmm1,dword ptr [esi+8]
        mulss   xmm0,xmm1
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [esi+8]
        movss   xmm7,xmm0
        mov     ecx,[ebp-772]
        mov     [ebp-780],eax
        mov     eax,[ebp-732]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm0,ecx
        movss   xmm1,dword ptr [edi+8]
        subss   xmm1,dword ptr [eax+8]
        mulss   xmm0,xmm1
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm1,ecx
        divss   xmm0,xmm1
        addss   xmm0,dword ptr [eax+8]
        mov     ecx,[ebp-772]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm1,ecx
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,esi
        add     edx,4
        movss   xmm2,dword ptr [ecx]
        subss   xmm2,dword ptr [edx]
        mulss   xmm1,xmm2
        mov     ecx,[edi+4]
        sub     ecx,[esi+4]
        cvtsi2ss        xmm2,ecx
        divss   xmm1,xmm2
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        addss   xmm1,dword ptr [ecx]
        mov     ecx,[ebp-772]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm2,ecx
        mov     ecx,8
        add     ecx,edi
        add     ecx,4
        mov     edx,8
        add     edx,eax
        add     edx,4
        movss   xmm3,dword ptr [ecx]
        subss   xmm3,dword ptr [edx]
        mulss   xmm2,xmm3
        mov     ecx,[edi+4]
        sub     ecx,[eax+4]
        cvtsi2ss        xmm3,ecx
        divss   xmm2,xmm3
        mov     ecx,8
        add     ecx,eax
        add     ecx,4
        addss   xmm2,dword ptr [ecx]
        mov     ecx,[ebp-780]
        sub     ecx,[ebp-776]
        cvtsi2ss        xmm3,ecx
        movss   xmm4,xmm0
        subss   xmm4,xmm7
        divss   xmm4,xmm3
        movss   xmm6,xmm4
        mov     ecx,[ebp-780]
        sub     ecx,[ebp-776]
        cvtsi2ss        xmm3,ecx
        movss   xmm4,xmm2
        subss   xmm4,xmm1
        divss   xmm4,xmm3
        movss   xmm5,xmm4
; start of inline function _rasterize_horiz_line__unordered
        movss   xmm3,xmm2
        movss   xmm2,xmm0
        mov     edx,[ebp-772]
        mov     ecx,[ebp-780]
        mov     ebx,[ebp-776]
        cmp     ebx,ecx
        mov     [ebp-784],ebx
        mov     [ebp-788],ecx
        mov     [ebp-792],edx
        movss   dword ptr [ebp-812],xmm7
        movss   dword ptr [ebp-816],xmm1
        movss   dword ptr [ebp-820],xmm2
        movss   dword ptr [ebp-824],xmm3
        movss   dword ptr [ebp-828],xmm6
        movss   dword ptr [ebp-832],xmm5
        jg      label0019
        push    dword ptr [ebp-832]
        push    dword ptr [ebp-828]
        push    dword ptr [ebp-816]
        push    dword ptr [ebp-812]
        push    dword ptr [ebp-792]
        push    dword ptr [ebp-788]
        push    dword ptr [ebp-784]
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label001a
label0019:
        push    dword ptr [ebp-832]
        push    dword ptr [ebp-828]
        push    dword ptr [ebp-824]
        push    dword ptr [ebp-820]
        push    dword ptr [ebp-792]
        push    dword ptr [ebp-784]
        push    dword ptr [ebp-788]
        call    __rasterize_horiz_line
        add     esp,28
label001a:
; end of inline function _rasterize_horiz_line__unordered
        inc     dword ptr [ebp-772]
        jmp     label0011
label0012:
; end of inline function _rasterize_triangle_2i
        inc     dword ptr [ebp-724]
        jmp     label0006
label0007:
; end of inline function _rasterize_polygon_4f
        pop     ebx
        pop     esi
        pop     edi
        add     esp,836
        pop     ebp
        ret
_rasterizer_triangle3f endp     

end
