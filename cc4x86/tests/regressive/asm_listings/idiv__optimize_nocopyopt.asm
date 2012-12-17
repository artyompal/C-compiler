
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,44
        mov     eax,2
        mov     ecx,3
        mov     edx,4
        mov     [ebp-24],eax
        mov     eax,ecx
        mov     [ebp-28],edx
        cdq
        idiv    dword ptr [ebp-24]
        mov     [ebp-32],eax
        mov     eax,ecx
        cdq
        idiv    dword ptr [ebp-24]
        mov     [ebp-36],eax
        mov     eax,[ebp-32]
        imul    eax,[ebp-36]
        mov     [ebp-32],eax
        mov     eax,5
        cdq
        idiv    dword ptr [ebp-28]
        mov     [ebp-40],eax
        mov     eax,5
        cdq
        idiv    dword ptr [ebp-28]
        mov     [ebp-44],eax
        mov     eax,[ebp-40]
        imul    eax,[ebp-44]
        mov     [ebp-40],eax
        mov     eax,[ebp-32]
        add     eax,[ebp-40]
        cmp     eax,2
        je      label0000
        mov     ecx,1
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        mov     eax,[ebp-28]
        cdq
        idiv    dword ptr [ebp-24]
        mov     edx,eax
        cmp     edx,2
        je      label0001
        mov     ecx,2
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0001:
        mov     eax,5
        cdq
        idiv    ecx
        cmp     edx,2
        je      label0002
        mov     ecx,3
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        mov     ecx,0
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
