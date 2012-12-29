
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,36
        mov     eax,2
        mov     ecx,3
        mov     edx,4
        mov     [ebp-4],eax
        mov     eax,ecx
        mov     [ebp-12],edx
        cdq
        idiv    dword ptr [ebp-4]
        mov     [ebp-24],eax
        mov     eax,ecx
        cdq
        idiv    dword ptr [ebp-4]
        mov     [ebp-28],eax
        mov     eax,[ebp-24]
        imul    eax,[ebp-28]
        mov     [ebp-24],eax
        mov     eax,5
        cdq
        idiv    dword ptr [ebp-12]
        mov     [ebp-32],eax
        mov     eax,5
        cdq
        idiv    dword ptr [ebp-12]
        mov     [ebp-36],eax
        mov     eax,[ebp-32]
        imul    eax,[ebp-36]
        mov     [ebp-32],eax
        mov     eax,[ebp-24]
        add     eax,[ebp-32]
        cmp     eax,2
        je      label0000
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        mov     eax,[ebp-12]
        cdq
        idiv    dword ptr [ebp-4]
        cmp     eax,2
        je      label0001
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
label0001:
        mov     eax,5
        cdq
        idiv    ecx
        cmp     edx,2
        je      label0002
        mov     eax,3
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
