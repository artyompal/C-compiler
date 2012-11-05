
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,36
        push    edi
        push    esi
        push    ebx
        mov     edi,2
        mov     esi,3
        mov     ebx,4
        mov     eax,3
        cdq
        idiv    edi
        mov     [ebp-24],eax
        mov     eax,3
        cdq
        idiv    edi
        mov     [ebp-28],eax
        mov     eax,[ebp-24]
        imul    eax,[ebp-28]
        mov     [ebp-24],eax
        mov     eax,5
        cdq
        idiv    ebx
        mov     [ebp-32],eax
        mov     eax,5
        cdq
        idiv    ebx
        mov     [ebp-36],eax
        mov     eax,[ebp-32]
        imul    eax,[ebp-36]
        mov     [ebp-32],eax
        mov     eax,[ebp-24]
        add     eax,[ebp-32]
        cmp     eax,2
        je      label0000
        mov     eax,1
        pop     ebx
        pop     esi
        pop     edi
        add     esp,36
        pop     ebp
        ret
label0000:
        mov     eax,ebx
        cdq
        idiv    edi
        cmp     eax,2
        je      label0001
        mov     eax,2
        pop     ebx
        pop     esi
        pop     edi
        add     esp,36
        pop     ebp
        ret
label0001:
        mov     eax,5
        cdq
        idiv    esi
        cmp     edx,2
        je      label0002
        mov     eax,3
        pop     ebx
        pop     esi
        pop     edi
        add     esp,36
        pop     ebp
        ret
label0002:
        mov     eax,0
        pop     ebx
        pop     esi
        pop     edi
        add     esp,36
        pop     ebp
        ret
_test endp

end
