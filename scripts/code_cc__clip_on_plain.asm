__clip_on_plain proc
        push    ebp
        mov     ebp,esp
        sub     esp,168
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+20]
        mov     esi,[ebp+16]
        mov     ebx,[ebp+12]
        mov     edx,[ebp+8]
        mov     dword ptr [edx+192],0
        mov     ecx,ebx
        mov     eax,ebx
        add     eax,24
label0001:
        mov     [ebp-140],edx
        mov     edx,[ebx+192]
        imul    edx,24
        mov     [ebp-144],edi
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
        mov     edi,[ebp-144]
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
        mov     [ebp-148],ebx
        mov     ebx,[ebp-140]
        mov     edx,[ebx+192]
        mov     [ebp-152],edx
        mov     edx,[ebp-140]
        inc     dword ptr [edx+192]
        mov     [ebp-140],edx
        mov     edx,[ebp-152]
        imul    edx,24
        mov     ebx,[ebp-140]
        add     ebx,edx
        mov     [ebp-144],edi
        mov     edi,ebx
        mov     [ebp-156],esi
        mov     esi,ecx
        mov     [ebp-160],ecx
        mov     ecx,6
        rep     movsd
        mov     [ebp-164],ecx
        mov     ecx,[ebp-160]
        mov     ebx,[ebp-148]
        mov     esi,[ebp-156]
        mov     edi,[ebp-144]
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
        mov     [ebp-148],ebx
        mov     ebx,[ebp-140]
        mov     edx,[ebx+192]
        imul    edx,24
        movss   xmm0,dword ptr [ecx]
        addss   xmm0,dword ptr [ebp-40]
        mov     [ebp-168],edx
        mov     edx,[ebp-140]
        mov     ebx,[ebp-168]
        movss   dword ptr [edx+ebx],xmm0
        movss   xmm0,dword ptr [ecx+4]
        addss   xmm0,dword ptr [ebp-36]
        mov     ebx,[ebp-168]
        movss   dword ptr [edx+ebx+4],xmm0
        movss   xmm0,dword ptr [ecx+8]
        addss   xmm0,dword ptr [ebp-32]
        mov     ebx,[ebp-168]
        movss   dword ptr [edx+ebx+8],xmm0
        movss   xmm0,dword ptr [ecx+12]
        addss   xmm0,dword ptr [ebp-28]
        mov     ebx,[ebp-168]
        movss   dword ptr [edx+ebx+12],xmm0
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
        mov     ebx,[edx+192]
        imul    ebx,24
        movss   xmm0,dword ptr [ecx+16]
        addss   xmm0,dword ptr [ebp-48]
        movss   dword ptr [edx+ebx+16],xmm0
        movss   xmm0,dword ptr [ecx+20]
        addss   xmm0,dword ptr [ebp-44]
        movss   dword ptr [edx+ebx+20],xmm0
; end of inline function vec2f_add
        inc     dword ptr [edx+192]
        mov     [ebp-140],edx
        mov     ebx,[ebp-148]
label0004:
        add     ecx,24
        add     eax,24
        mov     edx,[ebp-140]
        jmp     label0001
label0002:
        mov     edx,[ebp-140]
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
        add     esp,168
        pop     ebp
        ret
__clip_on_plain endp
