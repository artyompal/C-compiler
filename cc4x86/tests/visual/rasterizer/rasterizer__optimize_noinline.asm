
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
___unnamed_float_1      dd      040000000h
public  ___unnamed_float_1
___unnamed_float_2      dd      0bf800000h
public  ___unnamed_float_2
___unnamed_float_3      dd      0437f0000h
public  ___unnamed_float_3

.code

_vec2f_add proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax]
        fadd    dword ptr [ecx]
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fadd    dword ptr [ecx+4]
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec2f_add endp 

_vec2f_subtract proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fsub    dword ptr [ecx+4]
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec2f_subtract endp    

_vec2f_mul proc
        push    ebp
        mov     ebp,esp
        push    edi
        mov     edi,[ebp+8]
        mov     eax,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ebp+12]
        fstp    dword ptr [eax]
        mov     eax,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ebp+12]
        fstp    dword ptr [eax+4]
        pop     edi
        pop     ebp
        ret
_vec2f_mul endp 

_vec4f_assign proc
        push    ebp
        mov     ebp,esp
        push    edi
        mov     edi,[ebp+8]
        mov     eax,edi
        fld     dword ptr [ebp+12]
        fstp    dword ptr [eax]
        mov     eax,edi
        fld     dword ptr [ebp+16]
        fstp    dword ptr [eax+4]
        mov     eax,edi
        fld     dword ptr [ebp+20]
        fstp    dword ptr [eax+8]
        mov     eax,edi
        fld     dword ptr [ebp+24]
        fstp    dword ptr [eax+12]
        pop     edi
        pop     ebp
        ret
_vec4f_assign endp      

_vec4f_add proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax]
        fadd    dword ptr [ecx]
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fadd    dword ptr [ecx+4]
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fadd    dword ptr [ecx+8]
        mov     eax,ebx
        fstp    dword ptr [eax+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fadd    dword ptr [ecx+12]
        mov     eax,ebx
        fstp    dword ptr [eax+12]
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec4f_add endp 

_vec4f_subtract proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fsub    dword ptr [ecx+4]
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fsub    dword ptr [ecx+8]
        mov     eax,ebx
        fstp    dword ptr [eax+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fsub    dword ptr [ecx+12]
        mov     eax,ebx
        fstp    dword ptr [eax+12]
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec4f_subtract endp    

_vec4f_dot proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+4]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ecx]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+8]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+12]
        faddp
        pop     esi
        pop     edi
        pop     ebp
        ret
_vec4f_dot endp 

_vec4f_mul proc
        push    ebp
        mov     ebp,esp
        push    edi
        mov     edi,[ebp+8]
        mov     eax,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ebp+12]
        fstp    dword ptr [eax]
        mov     eax,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ebp+12]
        fstp    dword ptr [eax+4]
        mov     eax,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ebp+12]
        fstp    dword ptr [eax+8]
        mov     eax,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ebp+12]
        fstp    dword ptr [eax+12]
        pop     edi
        pop     ebp
        ret
_vec4f_mul endp 

_matrix4f_make_perspective proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        mov     edi,[ebp+8]
        fld     dword ptr [ebp+20]
        fmul    dword ptr [ebp+12]
        fstp    dword ptr [ebp-4]
        fld     dword ptr [ebp-4]
        fmul    dword ptr [ebp+24]
        fstp    dword ptr [ebp-8]
        mov     eax,edi
        fld     dword ptr [ebp+12]
        fdiv    dword ptr [ebp-8]
        fstp    dword ptr [eax]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+4]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+8]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+12]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+16]
        mov     eax,edi
        fld     dword ptr [ebp+12]
        fdiv    dword ptr [ebp-4]
        fstp    dword ptr [eax+20]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+24]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+28]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+32]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+36]
        mov     eax,edi
        fld     dword ptr [ebp+16]
        fsub    dword ptr [ebp+12]
        fdivr   dword ptr [ebp+16]
        fstp    dword ptr [eax+40]
        mov     eax,edi
        fld1
        fstp    dword ptr [eax+44]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+48]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+52]
        mov     eax,edi
        fld     dword ptr [ebp+12]
        fmul    dword ptr [ebp+16]
        fld     dword ptr [ebp+12]
        fsub    dword ptr [ebp+16]
        fdivp
        fstp    dword ptr [eax+56]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+60]
        pop     edi
        add     esp,8
        pop     ebp
        ret
_matrix4f_make_perspective endp 

_matrix4f_make_viewport proc
        push    ebp
        mov     ebp,esp
        push    edi
        mov     edi,[ebp+8]
        mov     eax,edi
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp+12]
        fstp    dword ptr [eax]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+4]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+8]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+12]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+16]
        mov     eax,edi
        fld     dword ptr [ebp+16]
        fldz
        fsubrp
        fld     dword ptr [___unnamed_float_1]
        fdivp
        fstp    dword ptr [eax+20]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+24]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+28]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+32]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+36]
        mov     eax,edi
        fld     dword ptr [ebp+24]
        fsub    dword ptr [ebp+20]
        fstp    dword ptr [eax+40]
        mov     eax,edi
        fldz
        fstp    dword ptr [eax+44]
        mov     eax,edi
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp+12]
        fstp    dword ptr [eax+48]
        mov     eax,edi
        fld     dword ptr [___unnamed_float_1]
        fdivr   dword ptr [ebp+16]
        fstp    dword ptr [eax+52]
        mov     eax,edi
        fld     dword ptr [ebp+20]
        fstp    dword ptr [eax+56]
        mov     eax,edi
        fld1
        fstp    dword ptr [eax+60]
        pop     edi
        pop     ebp
        ret
_matrix4f_make_viewport endp    

_matrix4f_transform proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+16]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax]
        fmul    dword ptr [ecx]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+32]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+48]
        faddp
        mov     eax,ebx
        fstp    dword ptr [eax]
        mov     eax,edi
        mov     ecx,esi
        fld     dword ptr [ecx]
        fmul    dword ptr [eax+4]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+20]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+36]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+52]
        faddp
        mov     eax,ebx
        fstp    dword ptr [eax+4]
        mov     eax,edi
        mov     ecx,esi
        fld     dword ptr [ecx]
        fmul    dword ptr [eax+8]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+24]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+40]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+56]
        faddp
        mov     eax,ebx
        fstp    dword ptr [eax+8]
        mov     eax,edi
        mov     ecx,esi
        fld     dword ptr [ecx]
        fmul    dword ptr [eax+12]
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+4]
        fmul    dword ptr [ecx+28]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+8]
        fmul    dword ptr [ecx+44]
        faddp
        mov     eax,esi
        mov     ecx,edi
        fld     dword ptr [eax+12]
        fmul    dword ptr [ecx+60]
        faddp
        mov     eax,ebx
        fstp    dword ptr [eax+12]
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_matrix4f_transform endp        

_rasterizer_init proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        push    esi
        mov     edi,[ebp+20]
        mov     esi,[ebp+8]
        mov     dword ptr [__dbgprintf],esi
        mov     esi,[ebp+12]
        mov     dword ptr [__width],esi
        mov     esi,[ebp+16]
        mov     dword ptr [__height],esi
        mov     esi,edi
        mov     dword ptr [__pitch],esi
        fild    dword ptr [ebp+12]
        fild    dword ptr [ebp+16]
        fdivp
        fstp    dword ptr [esp-4]
        sub     esp,4
        push    dword ptr [ebp+32]
        push    dword ptr [ebp+28]
        push    dword ptr [ebp+24]
        lea     esi,dword ptr [__mvproj_matrix]
        push    esi
        call    _matrix4f_make_perspective
        add     esp,20
        push    dword ptr [ebp+28]
        push    dword ptr [ebp+24]
        fild    dword ptr [ebp+16]
        fstp    dword ptr [esp-4]
        sub     esp,4
        fild    dword ptr [ebp+12]
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__viewport_matrix]
        push    esi
        call    _matrix4f_make_viewport
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        push    dword ptr [ebp+24]
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_z_near_base]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld     dword ptr [ebp+24]
        fld     dword ptr [ebp+28]
        fucomip st,st(1)
        fstp    st
        jbe     label0000
        fld1
        fstp    dword ptr [ebp-4]
        jmp     label0001
label0000:
        fld     dword ptr [___unnamed_float_2]
        fstp    dword ptr [ebp-4]
label0001:
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        push    dword ptr [ebp-4]
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_z_near_norm]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        push    dword ptr [ebp+28]
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_z_far_base]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld     dword ptr [ebp+24]
        fld     dword ptr [ebp+28]
        fucomip st,st(1)
        fstp    st
        jbe     label0002
        fld     dword ptr [___unnamed_float_2]
        fstp    dword ptr [ebp-8]
        jmp     label0003
label0002:
        fld1
        fstp    dword ptr [ebp-8]
label0003:
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        push    dword ptr [ebp-8]
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_z_far_norm]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fild    dword ptr [ebp+12]
        fld1
        fdivrp
        fld     dword ptr [___unnamed_float_2]
        faddp
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_plane_left_base]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_plane_left_norm]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fild    dword ptr [ebp+12]
        fld1
        fdivrp
        fld1
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_plane_right_base]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld     dword ptr [___unnamed_float_2]
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_plane_right_norm]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fild    dword ptr [ebp+16]
        fld1
        fdivrp
        fld     dword ptr [___unnamed_float_2]
        faddp
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_plane_top_base]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_plane_top_norm]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_plane_bottom_base]
        push    esi
        call    _vec4f_assign
        add     esp,20
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld     dword ptr [___unnamed_float_2]
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        lea     esi,dword ptr [__clip_plane_bottom_norm]
        push    esi
        call    _vec4f_assign
        add     esp,20
        pop     esi
        pop     edi
        add     esp,8
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

__tex2d proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        mov     eax,dword ptr [__texture_width]
        dec     eax
        mov     [ebp-12],eax
        fild    dword ptr [ebp-12]
        fmul    dword ptr [ebp+8]
        fistp   dword ptr [ebp-12]
        mov     eax,[ebp-12]
        mov     ecx,dword ptr [__texture_height]
        dec     ecx
        mov     [ebp-12],ecx
        fild    dword ptr [ebp-12]
        fmul    dword ptr [ebp+12]
        fistp   dword ptr [ebp-12]
        mov     ecx,[ebp-12]
        imul    ecx,dword ptr [__texture_width]
        add     ecx,eax
        sal     ecx,2
        add     ecx,dword ptr [__texture_data]
        mov     eax,[ecx]
        add     esp,12
        pop     ebp
        ret
__tex2d endp    

__rasterize_horiz_line proc
        push    ebp
        mov     ebp,esp
        sub     esp,48
        push    edi
        push    esi
        push    ebx
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
        push    dword ptr [ebp+24]
        push    dword ptr [ebp+20]
        call    __tex2d
        add     esp,8
        mov     ebx,eax
        mov     eax,ebx
        sar     eax,24
        and     eax,255
        mov     [ebp-40],eax
        cmp     dword ptr [ebp-40],0
        je      label0003
        fild    dword ptr [ebp-40]
        fld     dword ptr [___unnamed_float_3]
        fdivp
        fstp    dword ptr [ebp-44]
        mov     eax,edi
        mov     eax,[eax]
        mov     ecx,eax
        and     ecx,65280
        sar     ecx,8
        mov     [ebp-32],ecx
        and     eax,255
        mov     [ebp-36],eax
        mov     eax,ebx
        and     eax,65280
        sar     eax,8
        mov     [ebp-20],eax
        mov     eax,ebx
        and     eax,255
        mov     [ebp-24],eax
        fild    dword ptr [ebp-20]
        fmul    dword ptr [ebp-44]
        fild    dword ptr [ebp-32]
        fld1
        fsub    dword ptr [ebp-44]
        fmulp
        faddp
        fistp   dword ptr [ebp-48]
        mov     eax,[ebp-48]
        mov     [ebp-20],eax
        fild    dword ptr [ebp-24]
        fmul    dword ptr [ebp-44]
        fild    dword ptr [ebp-36]
        fld1
        fsub    dword ptr [ebp-44]
        fmulp
        faddp
        fistp   dword ptr [ebp-48]
        mov     eax,[ebp-48]
        mov     [ebp-24],eax
        mov     eax,[ebp-20]
        sal     eax,8
        add     eax,[ebp-24]
        mov     ebx,eax
        mov     eax,edi
        mov     ecx,ebx
        mov     [eax],ecx
label0003:
        fld     dword ptr [ebp+20]
        fadd    dword ptr [ebp+28]
        fstp    dword ptr [ebp+20]
        fld     dword ptr [ebp+24]
        fadd    dword ptr [ebp+32]
        fstp    dword ptr [ebp+24]
        add     edi,4
        mov     eax,edi
        cmp     eax,esi
        jl      label0000
        pop     ebx
        pop     esi
        pop     edi
        add     esp,48
        pop     ebp
        ret
__rasterize_horiz_line endp     

__rasterize_horiz_line__unordered proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     eax,ebx
        cmp     eax,esi
        jg      label0000
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        push    dword ptr [ebp+24]
        push    dword ptr [ebp+20]
        push    edi
        push    esi
        push    ebx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0001
label0000:
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        push    dword ptr [ebp+32]
        push    dword ptr [ebp+28]
        push    edi
        push    ebx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0001:
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
__rasterize_horiz_line__unordered endp  

__rasterize_triangle_1i proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+32]
        mov     esi,[ebp+28]
        mov     ebx,[ebp+24]
        mov     edx,[ebp+20]
        mov     ecx,[ebp+16]
        mov     eax,[ebp+12]
        mov     [ebp+28],esi
        mov     esi,[ebp+8]
        mov     [ebp+32],edi
        mov     edi,esi
        cmp     edi,eax
        jge     label0000
        mov     edi,ecx
        cmp     edi,eax
        jle     label0001
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        mov     eax,ebx
        push    dword ptr [eax+4]
        mov     eax,ebx
        push    dword ptr [eax]
        push    edx
        push    ecx
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0002
        mov     eax,[ebp+12]
label0001:
        mov     edi,ecx
        cmp     edi,esi
        jge     label0003
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        mov     ebx,[ebp+32]
        push    dword ptr [ebx+4]
        mov     ebx,[ebp+32]
        push    dword ptr [ebx]
        push    edx
        push    eax
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0004
        mov     ebx,[ebp+24]
label0003:
        push    dword ptr [ebp+40]
        push    dword ptr [ebp+36]
        mov     ecx,ebx
        push    dword ptr [ecx+4]
        mov     ecx,ebx
        push    dword ptr [ecx]
        push    edx
        push    eax
        push    esi
        call    __rasterize_horiz_line
        add     esp,28
label0004:
label0002:
        jmp     label0005
        mov     eax,[ebp+12]
label0000:
        mov     ebx,ecx
        cmp     ebx,eax
        jge     label0006
        fld     dword ptr [ebp+40]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld     dword ptr [ebp+36]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        mov     eax,[ebp+32]
        push    dword ptr [eax+4]
        mov     eax,[ebp+32]
        push    dword ptr [eax]
        push    edx
        push    esi
        push    ecx
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0007
        mov     eax,[ebp+12]
label0006:
        mov     ebx,ecx
        cmp     ebx,esi
        jle     label0008
        fld     dword ptr [ebp+40]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld     dword ptr [ebp+36]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        mov     ebx,[ebp+28]
        push    dword ptr [ebx+4]
        mov     ebx,[ebp+28]
        push    dword ptr [ebx]
        push    edx
        push    ecx
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
        jmp     label0009
label0008:
        fld     dword ptr [ebp+40]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        fld     dword ptr [ebp+36]
        fldz
        fsubrp
        fstp    dword ptr [esp-4]
        sub     esp,4
        mov     ecx,[ebp+28]
        push    dword ptr [ecx+4]
        mov     ecx,[ebp+28]
        push    dword ptr [ecx]
        push    edx
        push    esi
        push    eax
        call    __rasterize_horiz_line
        add     esp,28
label0009:
label0007:
label0005:
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
__rasterize_triangle_1i endp    

__rasterize_triangle_2i proc
        push    ebp
        mov     ebp,esp
        sub     esp,72
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        lea     eax,[ebx+4]
        lea     ecx,[esi+4]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0000
        mov     eax,ebx
        mov     ebx,eax
        mov     eax,esi
        mov     [ebp-4],ebx
        mov     ebx,eax
        mov     eax,[ebp-4]
        mov     esi,eax
label0000:
        lea     eax,[ebx+4]
        lea     ecx,[edi+4]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0001
        mov     eax,ebx
        mov     ebx,eax
        mov     eax,edi
        mov     [ebp-4],ebx
        mov     ebx,eax
        mov     eax,[ebp-4]
        mov     edi,eax
label0001:
        lea     eax,[esi+4]
        lea     ecx,[edi+4]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jle     label0002
        mov     eax,esi
        mov     [ebp+8],ebx
        mov     ebx,eax
        mov     eax,edi
        mov     esi,eax
        mov     eax,ebx
        mov     edi,eax
        mov     ebx,[ebp+8]
label0002:
        lea     eax,[ebx+4]
        lea     ecx,[edi+4]
        mov     eax,[eax]
        cmp     eax,[ecx]
        jne     label0003
        lea     eax,[ebx+4]
        cmp     dword ptr [eax],0
        jl      label0004
        lea     eax,[ebx+4]
        mov     eax,[eax]
        cmp     eax,dword ptr [__height]
        jge     label0004
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        fldz
        fstp    dword ptr [esp-4]
        sub     esp,4
        mov     eax,8
        add     eax,edi
        push    eax
        mov     eax,8
        add     eax,esi
        push    eax
        mov     eax,8
        add     eax,ebx
        push    eax
        lea     eax,[ebx+4]
        push    dword ptr [eax]
        mov     eax,edi
        push    dword ptr [eax]
        mov     eax,esi
        push    dword ptr [eax]
        mov     eax,ebx
        push    dword ptr [eax]
        call    __rasterize_triangle_1i
        add     esp,36
label0004:
        pop     ebx
        pop     esi
        pop     edi
        add     esp,72
        pop     ebp
        ret
label0003:
        lea     eax,[ebx+4]
        mov     eax,[eax]
        mov     ecx,eax
label0006:
        lea     eax,[esi+4]
        mov     eax,[eax]
        cmp     eax,ecx
        jle     label0007
        lea     eax,[ebx+4]
        mov     [ebp-48],eax
        mov     eax,ecx
        mov     edx,[ebp-48]
        sub     eax,[edx]
        mov     edx,esi
        mov     [ebp+16],edi
        mov     edi,ebx
        mov     edx,[edx]
        sub     edx,[edi]
        imul    eax,edx
        lea     edx,[esi+4]
        lea     edi,[ebx+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-52],edx
        cdq
        idiv    dword ptr [ebp-52]
        mov     edx,ebx
        add     eax,[edx]
        mov     edi,eax
        lea     eax,[ebx+4]
        mov     [ebp-56],eax
        mov     eax,ecx
        mov     edx,[ebp-56]
        sub     eax,[edx]
        mov     edx,[ebp+16]
        mov     [ebp-8],edi
        mov     edi,ebx
        mov     edx,[edx]
        sub     edx,[edi]
        imul    eax,edx
        mov     edi,[ebp+16]
        lea     edx,[edi+4]
        mov     [ebp+16],edi
        lea     edi,[ebx+4]
        mov     edx,[edx]
        sub     edx,[edi]
        mov     [ebp-60],edx
        cdq
        idiv    dword ptr [ebp-60]
        mov     edx,ebx
        add     eax,[edx]
        mov     edi,eax
        lea     eax,[ebx+4]
        mov     edx,ecx
        sub     edx,[eax]
        mov     [ebp-44],edx
        fild    dword ptr [ebp-44]
        mov     eax,esi
        mov     edx,ebx
        fld     dword ptr [eax+8]
        fsub    dword ptr [edx+8]
        fmulp
        lea     eax,[esi+4]
        lea     edx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[edx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,ebx
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-20]
        lea     eax,[ebx+4]
        mov     edx,ecx
        sub     edx,[eax]
        mov     [ebp-44],edx
        fild    dword ptr [ebp-44]
        mov     eax,[ebp+16]
        mov     edx,ebx
        fld     dword ptr [eax+8]
        fsub    dword ptr [edx+8]
        fmulp
        mov     [ebp-12],edi
        mov     edi,[ebp+16]
        lea     eax,[edi+4]
        lea     edx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[edx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,ebx
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-28]
        lea     eax,[ebx+4]
        mov     edx,ecx
        sub     edx,[eax]
        mov     [ebp-44],edx
        fild    dword ptr [ebp-44]
        mov     eax,8
        add     eax,esi
        add     eax,4
        mov     edx,8
        add     edx,ebx
        add     edx,4
        fld     dword ptr [eax]
        fsub    dword ptr [edx]
        fmulp
        lea     eax,[esi+4]
        lea     edx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[edx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,8
        add     eax,ebx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-24]
        lea     eax,[ebx+4]
        mov     edx,ecx
        sub     edx,[eax]
        mov     [ebp-44],edx
        fild    dword ptr [ebp-44]
        mov     eax,8
        add     eax,edi
        add     eax,4
        mov     edx,8
        add     edx,ebx
        add     edx,4
        fld     dword ptr [eax]
        fsub    dword ptr [edx]
        fmulp
        lea     eax,[edi+4]
        lea     edx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[edx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,8
        add     eax,ebx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-32]
        mov     eax,[ebp-12]
        sub     eax,[ebp-8]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fld     dword ptr [ebp-28]
        fsub    dword ptr [ebp-20]
        fdivrp
        fstp    dword ptr [ebp-36]
        mov     eax,[ebp-12]
        sub     eax,[ebp-8]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fld     dword ptr [ebp-32]
        fsub    dword ptr [ebp-24]
        fdivrp
        fstp    dword ptr [ebp-40]
        mov     [ebp-16],ecx
        push    dword ptr [ebp-40]
        push    dword ptr [ebp-36]
        push    dword ptr [ebp-32]
        push    dword ptr [ebp-28]
        push    dword ptr [ebp-24]
        push    dword ptr [ebp-20]
        push    dword ptr [ebp-16]
        push    dword ptr [ebp-12]
        push    dword ptr [ebp-8]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        inc     dword ptr [ebp-16]
        mov     ecx,[ebp-16]
        jmp     label0006
label0007:
        lea     eax,[esi+4]
        lea     ecx,[ebx+4]
        mov     [ebp-64],eax
        mov     edx,[ebp-64]
        mov     eax,[edx]
        sub     eax,[ecx]
        mov     ecx,edi
        mov     edx,ebx
        mov     ecx,[ecx]
        sub     ecx,[edx]
        imul    eax,ecx
        lea     ecx,[edi+4]
        lea     edx,[ebx+4]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        mov     ecx,ebx
        add     eax,[ecx]
        mov     [ebp+16],edi
        mov     edi,eax
        lea     eax,[esi+4]
        lea     ecx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[ecx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        mov     eax,[ebp+16]
        mov     ecx,ebx
        fld     dword ptr [eax+8]
        fsub    dword ptr [ecx+8]
        fmulp
        mov     [ebp-12],edi
        mov     edi,[ebp+16]
        lea     eax,[edi+4]
        lea     ecx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[ecx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,ebx
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-28]
        lea     eax,[esi+4]
        lea     ecx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[ecx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        mov     eax,8
        add     eax,edi
        add     eax,4
        mov     ecx,8
        add     ecx,ebx
        add     ecx,4
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        fmulp
        lea     eax,[edi+4]
        lea     ecx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[ecx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,8
        add     eax,ebx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-32]
        mov     eax,esi
        fld     dword ptr [ebp-28]
        fsub    dword ptr [eax+8]
        mov     eax,esi
        mov     ecx,[ebp-12]
        sub     ecx,[eax]
        mov     [ebp-44],ecx
        fild    dword ptr [ebp-44]
        fdivp
        fstp    dword ptr [ebp-36]
        mov     eax,8
        add     eax,esi
        add     eax,4
        fld     dword ptr [ebp-32]
        fsub    dword ptr [eax]
        mov     eax,esi
        mov     ecx,[ebp-12]
        sub     ecx,[eax]
        mov     [ebp-44],ecx
        fild    dword ptr [ebp-44]
        fdivp
        fstp    dword ptr [ebp-40]
        push    dword ptr [ebp-40]
        push    dword ptr [ebp-36]
        mov     eax,8
        add     eax,esi
        add     eax,4
        push    dword ptr [eax]
        mov     eax,esi
        push    dword ptr [eax+8]
        push    dword ptr [ebp-32]
        push    dword ptr [ebp-28]
        lea     eax,[esi+4]
        push    dword ptr [eax]
        mov     eax,esi
        push    dword ptr [eax]
        push    dword ptr [ebp-12]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        lea     eax,[esi+4]
        mov     ecx,1
        add     ecx,[eax]
label0009:
        lea     eax,[edi+4]
        mov     eax,[eax]
        cmp     eax,ecx
        jle     label000a
        lea     eax,[esi+4]
        mov     [ebp-68],eax
        mov     eax,ecx
        mov     edx,[ebp-68]
        sub     eax,[edx]
        mov     edx,edi
        mov     [ebp-16],ecx
        mov     ecx,esi
        mov     edx,[edx]
        sub     edx,[ecx]
        imul    eax,edx
        lea     ecx,[edi+4]
        lea     edx,[esi+4]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        mov     ecx,esi
        add     eax,[ecx]
        mov     [ebp+16],edi
        mov     edi,eax
        lea     eax,[ebx+4]
        mov     [ebp-72],eax
        mov     eax,[ebp-16]
        mov     ecx,[ebp-72]
        sub     eax,[ecx]
        mov     edx,[ebp+16]
        mov     ecx,ebx
        mov     edx,[edx]
        sub     edx,[ecx]
        imul    eax,edx
        mov     [ebp-8],edi
        mov     edi,[ebp+16]
        lea     ecx,[edi+4]
        lea     edx,[ebx+4]
        mov     ecx,[ecx]
        sub     ecx,[edx]
        cdq
        idiv    ecx
        mov     ecx,ebx
        add     eax,[ecx]
        mov     [ebp+16],edi
        mov     edi,eax
        lea     eax,[esi+4]
        mov     ecx,[ebp-16]
        sub     ecx,[eax]
        mov     [ebp-44],ecx
        fild    dword ptr [ebp-44]
        mov     eax,[ebp+16]
        mov     ecx,esi
        fld     dword ptr [eax+8]
        fsub    dword ptr [ecx+8]
        fmulp
        mov     [ebp-12],edi
        mov     edi,[ebp+16]
        lea     eax,[edi+4]
        lea     ecx,[esi+4]
        mov     eax,[eax]
        sub     eax,[ecx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,esi
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-20]
        lea     eax,[ebx+4]
        mov     ecx,[ebp-16]
        sub     ecx,[eax]
        mov     [ebp-44],ecx
        fild    dword ptr [ebp-44]
        mov     eax,edi
        mov     ecx,ebx
        fld     dword ptr [eax+8]
        fsub    dword ptr [ecx+8]
        fmulp
        lea     eax,[edi+4]
        lea     ecx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[ecx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,ebx
        fadd    dword ptr [eax+8]
        fstp    dword ptr [ebp-28]
        lea     eax,[esi+4]
        mov     ecx,[ebp-16]
        sub     ecx,[eax]
        mov     [ebp-44],ecx
        fild    dword ptr [ebp-44]
        mov     eax,8
        add     eax,edi
        add     eax,4
        mov     ecx,8
        add     ecx,esi
        add     ecx,4
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        fmulp
        lea     eax,[edi+4]
        lea     ecx,[esi+4]
        mov     eax,[eax]
        sub     eax,[ecx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,8
        add     eax,esi
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-24]
        lea     eax,[ebx+4]
        mov     ecx,[ebp-16]
        sub     ecx,[eax]
        mov     [ebp-44],ecx
        fild    dword ptr [ebp-44]
        mov     eax,8
        add     eax,edi
        add     eax,4
        mov     ecx,8
        add     ecx,ebx
        add     ecx,4
        fld     dword ptr [eax]
        fsub    dword ptr [ecx]
        fmulp
        lea     eax,[edi+4]
        lea     ecx,[ebx+4]
        mov     eax,[eax]
        sub     eax,[ecx]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fdivp
        mov     eax,8
        add     eax,ebx
        add     eax,4
        fadd    dword ptr [eax]
        fstp    dword ptr [ebp-32]
        mov     eax,[ebp-12]
        sub     eax,[ebp-8]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fld     dword ptr [ebp-28]
        fsub    dword ptr [ebp-20]
        fdivrp
        fstp    dword ptr [ebp-36]
        mov     eax,[ebp-12]
        sub     eax,[ebp-8]
        mov     [ebp-44],eax
        fild    dword ptr [ebp-44]
        fld     dword ptr [ebp-32]
        fsub    dword ptr [ebp-24]
        fdivrp
        fstp    dword ptr [ebp-40]
        push    dword ptr [ebp-40]
        push    dword ptr [ebp-36]
        push    dword ptr [ebp-32]
        push    dword ptr [ebp-28]
        push    dword ptr [ebp-24]
        push    dword ptr [ebp-20]
        push    dword ptr [ebp-16]
        push    dword ptr [ebp-12]
        push    dword ptr [ebp-8]
        call    __rasterize_horiz_line__unordered
        add     esp,36
        inc     dword ptr [ebp-16]
        mov     ecx,[ebp-16]
        jmp     label0009
label000a:
        pop     ebx
        pop     esi
        pop     edi
        add     esp,72
        pop     ebp
        ret
__rasterize_triangle_2i endp    

__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,60
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
        mov     [ebp-4],eax
        lea     eax,[ebx+24]
label0001:
        mov     ecx,ebx
        mov     ecx,[ecx+192]
        imul    ecx,24
        mov     [ebp+8],edx
        mov     edx,ebx
        add     edx,ecx
        cmp     edx,eax
        jle     label0002
        mov     [ebp-8],eax
        push    esi
        mov     ecx,[ebp-4]
        push    ecx
        lea     ecx,[ebp-24]
        push    ecx
        call    _vec4f_subtract
        add     esp,12
        push    edi
        lea     ecx,[ebp-24]
        push    ecx
        call    _vec4f_dot
        add     esp,8
        fstp    dword ptr [ebp-52]
        push    esi
        mov     ecx,[ebp-8]
        push    ecx
        lea     ecx,[ebp-24]
        push    ecx
        call    _vec4f_subtract
        add     esp,12
        push    edi
        lea     ecx,[ebp-24]
        push    ecx
        call    _vec4f_dot
        add     esp,8
        fstp    dword ptr [ebp-56]
        fldz
        fld     dword ptr [ebp-52]
        fucomip st,st(1)
        fstp    st
        jb      label0003
        mov     ecx,[ebp+8]
        mov     edx,[ecx+192]
        inc     dword ptr [ecx+192]
        imul    edx,24
        mov     ecx,[ebp+8]
        add     ecx,edx
        mov     edx,[ebp-4]
        mov     eax,[edx]
        mov     [ebp+12],ebx
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
        mov     ebx,[ebp+12]
label0003:
        fldz
        fld     dword ptr [ebp-52]
        fucomip st,st(1)
        fstp    st
        jbe     label0006
        fldz
        fld     dword ptr [ebp-56]
        fucomip st,st(1)
        fstp    st
        jb      label0005
label0006:
        fldz
        fld     dword ptr [ebp-56]
        fucomip st,st(1)
        fstp    st
        jb      label0004
        fldz
        fld     dword ptr [ebp-52]
        fucomip st,st(1)
        fstp    st
        jae     label0004
label0005:
        mov     ecx,[ebp-4]
        push    ecx
        push    esi
        lea     ecx,[ebp-24]
        push    ecx
        call    _vec4f_subtract
        add     esp,12
        mov     ecx,[ebp-4]
        push    ecx
        mov     ecx,[ebp-8]
        push    ecx
        lea     ecx,[ebp-40]
        push    ecx
        call    _vec4f_subtract
        add     esp,12
        push    edi
        lea     ecx,[ebp-24]
        push    ecx
        call    _vec4f_dot
        add     esp,8
        fstp    qword ptr [esp-8]
        sub     esp,8
        push    edi
        lea     ecx,[ebp-40]
        push    ecx
        call    _vec4f_dot
        add     esp,8
        fstp    qword ptr [esp-8]
        fld     qword ptr [esp]
        fld     qword ptr [esp-8]
        add     esp,8
        fdivp
        fstp    dword ptr [ebp-60]
        push    dword ptr [ebp-60]
        lea     ecx,[ebp-40]
        push    ecx
        call    _vec4f_mul
        add     esp,8
        lea     ecx,[ebp-40]
        push    ecx
        mov     ecx,[ebp-4]
        push    ecx
        mov     ecx,[ebp+8]
        mov     ecx,[ecx+192]
        imul    ecx,24
        mov     edx,[ebp+8]
        add     edx,ecx
        push    edx
        call    _vec4f_add
        add     esp,12
        mov     ecx,16
        add     ecx,[ebp-4]
        push    ecx
        mov     ecx,16
        add     ecx,[ebp-8]
        push    ecx
        lea     ecx,[ebp-48]
        push    ecx
        call    _vec2f_subtract
        add     esp,12
        push    dword ptr [ebp-60]
        lea     ecx,[ebp-48]
        push    ecx
        call    _vec2f_mul
        add     esp,8
        lea     ecx,[ebp-48]
        push    ecx
        mov     ecx,16
        add     ecx,[ebp-4]
        push    ecx
        mov     ecx,[ebp+8]
        mov     ecx,[ecx+192]
        imul    ecx,24
        mov     edx,[ebp+8]
        add     edx,ecx
        add     edx,16
        push    edx
        call    _vec2f_add
        add     esp,12
        mov     ecx,[ebp+8]
        inc     dword ptr [ecx+192]
label0004:
        mov     eax,[ebp-4]
        add     eax,24
        mov     [ebp-4],eax
        mov     eax,[ebp-8]
        add     eax,24
        mov     edx,[ebp+8]
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
        mov     edx,[ecx]
        mov     ebx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ebx
        mov     edx,[ecx+8]
        mov     ebx,[ecx+12]
        mov     [eax+8],edx
        mov     [eax+12],ebx
        mov     edx,[ecx+16]
        mov     ebx,[ecx+20]
        mov     [eax+16],edx
        mov     [eax+20],ebx
        pop     ebx
        pop     esi
        pop     edi
        add     esp,60
        pop     ebp
        ret
__clip_on_plain endp    

__clip_poligon proc
        push    ebp
        mov     ebp,esp
        sub     esp,196
        push    edi
        mov     edi,[ebp+8]
        lea     eax,dword ptr [__clip_z_far_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_far_base]
        push    eax
        push    edi
        lea     eax,[ebp-196]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_z_near_norm]
        push    eax
        lea     eax,dword ptr [__clip_z_near_base]
        push    eax
        lea     eax,[ebp-196]
        push    eax
        push    edi
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_left_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_left_base]
        push    eax
        push    edi
        lea     eax,[ebp-196]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_right_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_right_base]
        push    eax
        lea     eax,[ebp-196]
        push    eax
        push    edi
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_top_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_top_base]
        push    eax
        push    edi
        lea     eax,[ebp-196]
        push    eax
        call    __clip_on_plain
        add     esp,16
        lea     eax,dword ptr [__clip_plane_bottom_norm]
        push    eax
        lea     eax,dword ptr [__clip_plane_bottom_base]
        push    eax
        lea     eax,[ebp-196]
        push    eax
        push    edi
        call    __clip_on_plain
        add     esp,16
        mov     eax,edi
        cmp     dword ptr [eax+192],1
        setg    al
        movzx   eax,al
        pop     edi
        add     esp,196
        pop     ebp
        ret
__clip_poligon endp     

__transform_to_screen_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,24
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
        lea     eax,dword ptr [__viewport_matrix]
        push    eax
        push    edi
        lea     eax,[ebp-16]
        push    eax
        call    _matrix4f_transform
        add     esp,12
        lea     eax,[ebp-16]
        add     eax,12
        fld1
        fdiv    dword ptr [eax]
        fstp    dword ptr [ebp-20]
        fld     dword ptr [ebp-16]
        fmul    dword ptr [ebp-20]
        fistp   dword ptr [ebp-24]
        mov     eax,[ebp-24]
        mov     edi,esi
        mov     [edi],eax
        lea     eax,[ebp-16]
        add     eax,4
        fld     dword ptr [eax]
        fmul    dword ptr [ebp-20]
        fistp   dword ptr [ebp-24]
        mov     eax,[ebp-24]
        mov     edi,esi
        mov     [edi+4],eax
        mov     eax,esi
        cmp     dword ptr [eax],0
        jl      label0001
        mov     eax,esi
        mov     eax,[eax]
        cmp     eax,dword ptr [__width]
        jge     label0001
        mov     eax,esi
        cmp     dword ptr [eax+4],0
        jl      label0001
        mov     eax,esi
        mov     eax,[eax+4]
        cmp     eax,dword ptr [__height]
        jl      label0000
label0001:
        mov     dword ptr ds:[0],0
label0000:
        pop     esi
        pop     edi
        add     esp,24
        pop     ebp
        ret
__transform_to_screen_space endp        

__rasterize_polygon_4f proc
        push    ebp
        mov     ebp,esp
        sub     esp,136
        push    edi
        mov     edi,[ebp+8]
        push    edi
        call    __clip_poligon
        add     esp,4
        cmp     eax,0
        jne     label0000
        pop     edi
        add     esp,136
        pop     ebp
        ret
label0000:
        mov     eax,edi
        cmp     dword ptr [eax+192],8
        jle     label0001
        mov     dword ptr ds:[0],0
label0001:
        mov     eax,0
label0003:
        mov     ecx,edi
        mov     ecx,[ecx+192]
        cmp     ecx,eax
        jle     label0004
        mov     [ebp-136],eax
        mov     ecx,edi
        mov     eax,[ebp-136]
        imul    eax,24
        add     ecx,eax
        push    ecx
        lea     eax,[ebp-132]
        mov     ecx,[ebp-136]
        sal     ecx,4
        add     eax,ecx
        push    eax
        call    __transform_to_screen_space
        add     esp,8
        lea     eax,[ebp-132]
        mov     ecx,[ebp-136]
        sal     ecx,4
        add     eax,ecx
        add     eax,8
        mov     ecx,edi
        mov     edx,[ebp-136]
        imul    edx,24
        add     ecx,edx
        add     ecx,16
        mov     edx,[ecx]
        mov     ecx,[ecx+4]
        mov     [eax],edx
        mov     [eax+4],ecx
        inc     dword ptr [ebp-136]
        mov     eax,[ebp-136]
        jmp     label0003
label0004:
        mov     eax,2
label0006:
        mov     ecx,edi
        mov     ecx,[ecx+192]
        dec     ecx
        cmp     ecx,eax
        jle     label0007
        mov     [ebp-136],eax
        lea     ecx,[ebp-132]
        mov     eax,[ebp-136]
        sal     eax,4
        add     ecx,eax
        push    ecx
        mov     eax,[ebp-136]
        dec     eax
        sal     eax,4
        lea     ecx,[ebp-132]
        add     ecx,eax
        push    ecx
        lea     eax,[ebp-132]
        push    eax
        call    __rasterize_triangle_2i
        add     esp,12
        inc     dword ptr [ebp-136]
        mov     eax,[ebp-136]
        jmp     label0006
label0007:
        pop     edi
        add     esp,136
        pop     ebp
        ret
__rasterize_polygon_4f endp     

__transform_to_projection_space proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
        fld1
        fstp    dword ptr [esp-4]
        sub     esp,4
        mov     eax,edi
        push    dword ptr [eax+8]
        mov     eax,edi
        push    dword ptr [eax+4]
        mov     eax,edi
        push    dword ptr [eax]
        lea     eax,[ebp-16]
        push    eax
        call    _vec4f_assign
        add     esp,20
        lea     eax,dword ptr [__mvproj_matrix]
        push    eax
        lea     eax,[ebp-16]
        push    eax
        push    esi
        call    _matrix4f_transform
        add     esp,12
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
__transform_to_projection_space endp    

_rasterizer_triangle3f proc
        push    ebp
        mov     ebp,esp
        sub     esp,196
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
        lea     eax,[ebp-196]
        push    eax
        call    __rasterize_polygon_4f
        add     esp,4
        pop     ebx
        pop     esi
        pop     edi
        add     esp,196
        pop     ebp
        ret
_rasterizer_triangle3f endp     

end