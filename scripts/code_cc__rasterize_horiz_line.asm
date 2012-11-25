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
        mulss   xmm0,dword ptr [___unnamed_float_6]
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
