__clip_on_plain PROC
; _dst$ = ecx
; _src$ = edx
; File d:\prog\compilers2\cc4x86\tests\visual\rasterizer\rasterizer.c
; Line 519
    sub esp, 28                 ; 0000001cH
    push    ebx
    push    ebp
    push    esi
    push    edi
    mov ebx, edx
    mov edi, ecx
; Line 528
    lea esi, DWORD PTR [ebx+24]
    mov DWORD PTR [edi+192], 0
    mov eax, DWORD PTR [ebx+192]
    lea eax, DWORD PTR [eax+eax*2]
    lea eax, DWORD PTR [ebx+eax*8]
    cmp esi, eax
    jae $LN5@clip_on_pl
; Line 526
    mov esi, DWORD PTR _base$[esp+40]
    mov ebp, DWORD PTR _normal$[esp+40]
    lea edx, DWORD PTR [ebx+28]
    npad    9
$LL7@clip_on_pl:
; Line 158
    movss   xmm0, DWORD PTR [edx-24]
    subss   xmm0, DWORD PTR [esi+4]
; Line 165
    movss   xmm4, DWORD PTR [ebp+4]
; Line 157
    movss   xmm3, DWORD PTR [edx-28]
    subss   xmm3, DWORD PTR [esi]
; Line 159
    movss   xmm2, DWORD PTR [edx-20]
    subss   xmm2, DWORD PTR [esi+8]
; Line 165
    movss   xmm6, DWORD PTR [ebp+8]
; Line 160
    movss   xmm1, DWORD PTR [edx-16]
    subss   xmm1, DWORD PTR [esi+12]
; Line 165
    movss   xmm7, DWORD PTR [ebp+12]
    movss   DWORD PTR _mul_end$1$[esp+44], xmm4
    movss   xmm5, DWORD PTR _mul_end$1$[esp+44]
    movss   xmm4, DWORD PTR [ebp]
    mulss   xmm5, xmm0
    movaps  xmm0, xmm4
    mulss   xmm0, xmm3
    movss   xmm3, xmm5
    movss   DWORD PTR _mul_beg$1$[esp+44], xmm5
    addss   xmm3, xmm0
    movss   xmm5, DWORD PTR _mul_end$1$[esp+44]
    movaps  xmm0, xmm6
    mulss   xmm0, xmm2
; Line 159
    movss   xmm2, DWORD PTR [edx+4]
    subss   xmm2, DWORD PTR [esi+8]
; Line 165
    addss   xmm3, xmm0
    movaps  xmm0, xmm7
    mulss   xmm0, xmm1
; Line 160
    movss   xmm1, DWORD PTR [edx+8]
    subss   xmm1, DWORD PTR [esi+12]
; Line 165
    addss   xmm3, xmm0
; Line 158
    movss   xmm0, DWORD PTR [edx]
    subss   xmm0, DWORD PTR [esi+4]
; Line 165
    mulss   xmm6, xmm2
    movss   DWORD PTR _mul_beg$1$[esp+44], xmm3
; Line 157
    movss   xmm3, DWORD PTR [edx-4]
    subss   xmm3, DWORD PTR [esi]
; Line 165
    mulss   xmm5, xmm0
    mulss   xmm7, xmm1
; Line 535
    movss   xmm1, DWORD PTR _mul_beg$1$[esp+44]
; Line 165
    mulss   xmm4, xmm3
    xorps   xmm2, xmm2
; Line 535
    comiss  xmm1, xmm2
; Line 165
    addss   xmm5, xmm4
    addss   xmm5, xmm6
    addss   xmm5, xmm7
; Line 535
    jb  SHORT $LN1@clip_on_pl
; Line 536
    mov eax, DWORD PTR [edi+192]
    movq    xmm0, QWORD PTR [edx-28]
    lea eax, DWORD PTR [eax+eax*2]
    movq    QWORD PTR [edi+eax*8], xmm0
    movq    xmm0, QWORD PTR [edx-20]
    movq    QWORD PTR [edi+eax*8+8], xmm0
    movq    xmm0, QWORD PTR [edx-12]
    movq    QWORD PTR [edi+eax*8+16], xmm0
    inc DWORD PTR [edi+192]
; Line 539
    comiss  xmm1, xmm2
    jbe SHORT $LN1@clip_on_pl
    comiss  xmm2, xmm5
    ja  SHORT $LN2@clip_on_pl
$LN1@clip_on_pl:
    comiss  xmm5, xmm2
    jb  $LN6@clip_on_pl
    comiss  xmm2, xmm1
    jbe $LN6@clip_on_pl
$LN2@clip_on_pl:
; Line 157
    movss   xmm4, DWORD PTR [edx-28]
; Line 159
    movss   xmm2, DWORD PTR [edx+4]
    subss   xmm2, DWORD PTR [edx-20]
; Line 157
    movss   xmm0, DWORD PTR [esi]
; Line 158
    movss   xmm6, DWORD PTR [esi+4]
    subss   xmm6, DWORD PTR [edx-24]
; Line 157
    movss   xmm3, DWORD PTR [edx-4]
    subss   xmm0, xmm4
; Line 160
    movss   xmm1, DWORD PTR [edx+8]
    subss   xmm1, DWORD PTR [edx-16]
; Line 159
    movss   xmm7, DWORD PTR [esi+8]
    subss   xmm7, DWORD PTR [edx-20]
    movss   DWORD PTR _tmp$3$[esp+44], xmm0
; Line 160
    movss   xmm5, DWORD PTR [esi+12]
    subss   xmm5, DWORD PTR [edx-16]
; Line 157
    subss   xmm3, xmm4
; Line 159
    movss   DWORD PTR _tmp2$6$[esp+44], xmm2
; Line 165
    movss   xmm2, DWORD PTR [ebp+4]
    movaps  xmm0, xmm2
    mulss   xmm0, xmm6
; Line 157
    movss   DWORD PTR tv1055[esp+44], xmm4
; Line 165
    movss   xmm4, DWORD PTR [ebp]
    movss   DWORD PTR _scale$1$[esp+44], xmm0
    movss   xmm6, DWORD PTR _scale$1$[esp+44]
    movaps  xmm0, xmm4
    mulss   xmm0, DWORD PTR _tmp$3$[esp+44]
; Line 157
    movss   DWORD PTR _tmp2$2$[esp+44], xmm3
; Line 158
    movss   xmm3, DWORD PTR [edx]
    subss   xmm3, DWORD PTR [edx-24]
; Line 165
    addss   xmm6, xmm0
; Line 160
    movss   DWORD PTR _tmp2$8$[esp+44], xmm1
; Line 165
    movss   xmm1, DWORD PTR [ebp+8]
    movaps  xmm0, xmm1
    mulss   xmm0, xmm7
; Line 158
    movss   DWORD PTR _tmp2$4$[esp+44], xmm3
; Line 165
    movss   xmm3, DWORD PTR [ebp+12]
    addss   xmm6, xmm0
    movaps  xmm0, xmm3
    mulss   xmm0, xmm5
    movss   xmm5, DWORD PTR _tmp2$4$[esp+44]
    mulss   xmm2, xmm5
    addss   xmm6, xmm0
    movss   xmm0, DWORD PTR _tmp2$2$[esp+44]
    mulss   xmm4, xmm0
; Line 547
    mov eax, DWORD PTR [edi+192]
; Line 165
    addss   xmm4, xmm2
    movss   xmm2, DWORD PTR _tmp2$6$[esp+44]
    mulss   xmm1, xmm2
; Line 547
    lea eax, DWORD PTR [eax+eax*2]
; Line 165
    addss   xmm4, xmm1
    movss   xmm1, DWORD PTR _tmp2$8$[esp+44]
    mulss   xmm3, xmm1
    addss   xmm4, xmm3
; Line 149
    movss   xmm3, DWORD PTR tv1055[esp+44]
; Line 543
    divss   xmm6, xmm4
; Line 170
    mulss   xmm0, xmm6
; Line 171
    mulss   xmm5, xmm6
; Line 149
    addss   xmm3, xmm0
; Line 172
    mulss   xmm2, xmm6
; Line 173
    mulss   xmm1, xmm6
; Line 149
    movss   DWORD PTR [edi+eax*8], xmm3
; Line 150
    movss   xmm0, DWORD PTR [edx-24]
    addss   xmm0, xmm5
    movss   DWORD PTR [edi+eax*8+4], xmm0
; Line 151
    movss   xmm0, DWORD PTR [edx-20]
    addss   xmm0, xmm2
    movss   DWORD PTR [edi+eax*8+8], xmm0
; Line 152
    movss   xmm0, DWORD PTR [edx-16]
    addss   xmm0, xmm1
    movss   DWORD PTR [edi+eax*8+12], xmm0
; Line 128
    movss   xmm0, DWORD PTR [edx+12]
    subss   xmm0, DWORD PTR [edx-12]
; Line 129
    movss   xmm1, DWORD PTR [edx+16]
; Line 552
    mov eax, DWORD PTR [edi+192]
; Line 129
    subss   xmm1, DWORD PTR [edx-8]
; Line 552
    lea eax, DWORD PTR [eax+eax*2]
; Line 134
    mulss   xmm0, xmm6
; Line 135
    mulss   xmm1, xmm6
; Line 122
    addss   xmm0, DWORD PTR [edx-12]
    movss   DWORD PTR [edi+eax*8+16], xmm0
; Line 123
    movss   xmm0, DWORD PTR [edx-8]
    addss   xmm0, xmm1
    movss   DWORD PTR [edi+eax*8+20], xmm0
; Line 554
    inc DWORD PTR [edi+192]
$LN6@clip_on_pl:
; Line 528
    mov eax, DWORD PTR [ebx+192]
    add edx, 24                 ; 00000018H
    lea eax, DWORD PTR [eax+eax*2]
    lea ecx, DWORD PTR [ebx+eax*8]
    lea eax, DWORD PTR [edx-4]
    cmp eax, ecx
    jb  $LL7@clip_on_pl
$LN5@clip_on_pl:
; Line 558
    mov eax, DWORD PTR [edi+192]
    movq    xmm0, QWORD PTR [edi]
    lea eax, DWORD PTR [eax+eax*2]
    movq    QWORD PTR [edi+eax*8], xmm0
    movq    xmm0, QWORD PTR [edi+8]
    movq    QWORD PTR [edi+eax*8+8], xmm0
    movq    xmm0, QWORD PTR [edi+16]
    movq    QWORD PTR [edi+eax*8+16], xmm0
    inc DWORD PTR [edi+192]
; Line 559
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 28                 ; 0000001cH
    ret 0
__clip_on_plain ENDP