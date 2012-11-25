__rasterize_horiz_line PROC
; _x1$ = ecx
; _x2$ = edx
; _u$ = xmm3s
; File d:\prog\compilers2\cc4x86\tests\visual\rasterizer\rasterizer.c
; Line 323
    push    ecx
; Line 332
    mov eax, DWORD PTR __pitch
    imul    eax, DWORD PTR _y$[esp]
    add eax, DWORD PTR __videomem
; Line 333
    movss   xmm6, DWORD PTR _dvdx$[esp]
    movss   xmm7, DWORD PTR _dudx$[esp]
    movss   xmm5, DWORD PTR _v$[esp]
    push    ebx
    push    ebp
    mov ebp, DWORD PTR __texture_width
    push    esi
    lea esi, DWORD PTR [eax+ecx*4]
    mov eax, DWORD PTR __texture_height
    sub edx, ecx
    dec eax
    movd    xmm0, eax
    lea eax, DWORD PTR [ebp-1]
    movd    xmm1, eax
    cvtdq2ps xmm0, xmm0
    cvtdq2ps xmm1, xmm1
    push    edi
    movaps  xmm4, xmm3
    lea edi, DWORD PTR [esi+edx*4]
    movss   DWORD PTR tv214[esp+20], xmm0
    movss   DWORD PTR tv215[esp+16], xmm1
    npad    5
$LL4@rasterize_:
; Line 313
    mulss   xmm0, xmm5
    cvttss2si ecx, xmm0
    movaps  xmm0, xmm1
    mulss   xmm0, xmm4
; Line 319
    imul    ecx, ebp
    cvttss2si eax, xmm0
    add ecx, eax
    mov eax, DWORD PTR __texture_data
    mov ebx, DWORD PTR [eax+ecx*4]
; Line 381
    mov eax, ebx
    sar eax, 24                 ; 00000018H
    and eax, 255                ; 000000ffH
; Line 383
    je  $LN1@rasterize_
; Line 386
    mov edx, DWORD PTR [esi]
; Line 393
    movss   xmm2, DWORD PTR __real@3f800000
    movd    xmm3, eax
; Line 404
    mov eax, edx
    sar eax, 8
    and eax, 255                ; 000000ffH
    movd    xmm1, eax
    cvtdq2ps xmm3, xmm3
    mov eax, ebx
    mulss   xmm3, DWORD PTR __real@3b808081
    sar eax, 8
    and eax, 255                ; 000000ffH
    cvtdq2ps xmm1, xmm1
    movd    xmm0, eax
    cvtdq2ps xmm0, xmm0
    subss   xmm2, xmm3
    mulss   xmm0, xmm3
    movzx   eax, dl
    mulss   xmm1, xmm2
    addss   xmm1, xmm0
    cvttss2si ecx, xmm1
    movd    xmm1, eax
    movzx   eax, bl
    movd    xmm0, eax
    cvtdq2ps xmm1, xmm1
    cvtdq2ps xmm0, xmm0
    mulss   xmm1, xmm2
    mulss   xmm0, xmm3
    shl ecx, 8
    addss   xmm1, xmm0
    cvttss2si eax, xmm1
    movss   xmm1, DWORD PTR tv215[esp+16]
    add ecx, eax
    mov DWORD PTR [esi], ecx
$LN1@rasterize_:
; Line 410
    movss   xmm0, DWORD PTR tv214[esp+20]
    add esi, 4
    addss   xmm4, xmm7
    addss   xmm5, xmm6
    cmp esi, edi
    jb  $LL4@rasterize_
    pop edi
    pop esi
    pop ebp
    pop ebx
; Line 411
    pop ecx
    ret 0
__rasterize_horiz_line ENDP
