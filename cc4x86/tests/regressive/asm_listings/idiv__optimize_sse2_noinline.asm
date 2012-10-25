
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,32
        push    edi
        push    esi
        push    ebx
        mov     edi,2
        mov     esi,3
        mov     eax,4
        mov     ebx,5
        mov     [ebp-12],eax
        mov     eax,3
        cdq
        idiv    edi
        mov     [ebp-20],eax
        mov     eax,3
        cdq
        idiv    edi
        mov     [ebp-24],eax
        mov     eax,[ebp-20]
        imul    eax,[ebp-24]
        mov     [ebp-20],eax
        mov     eax,ebx
        cdq
        idiv    dword ptr [ebp-12]
        mov     [ebp-28],eax
        mov     eax,ebx
        cdq
        idiv    dword ptr [ebp-12]
        mov     [ebp-32],eax
        mov     eax,[ebp-28]
        imul    eax,[ebp-32]
        mov     [ebp-28],eax
        mov     eax,[ebp-20]
        add     eax,[ebp-28]
        cmp     eax,2
        mov     [ebp-4],edi
        mov     [ebp-8],esi
        mov     [ebp-16],ebx
        je      label0000
        mov     eax,1
        pop     ebx
        pop     esi
        pop     edi
        add     esp,32
        pop     ebp
        ret
label0000:
        mov     eax,[ebp-12]
        cdq
        idiv    dword ptr [ebp-4]
        cmp     eax,2
        je      label0001
        mov     eax,2
        pop     ebx
        pop     esi
        pop     edi
        add     esp,32
        pop     ebp
        ret
label0001:
        mov     eax,[ebp-16]
        cdq
        idiv    dword ptr [ebp-8]
        mov     ebx,edx
        cmp     ebx,2
        je      label0002
        mov     eax,3
        pop     ebx
        pop     esi
        pop     edi
        add     esp,32
        pop     ebp
        ret
label0002:
        mov     eax,0
        pop     ebx
        pop     esi
        pop     edi
        add     esp,32
        pop     ebp
        ret
_test endp      

end
