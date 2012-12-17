
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,56
        mov     eax,2
        mov     ecx,3
        mov     edx,4
        mov     [ebp-24],eax
        mov     eax,ecx
        mov     [ebp-28],edx
        xor     edx,edx
        div     dword ptr [ebp-24]
        mov     [ebp-32],eax
        mov     eax,ecx
        xor     edx,edx
        div     dword ptr [ebp-24]
        mov     [ebp-36],eax
        mov     eax,[ebp-32]
        mul     dword ptr [ebp-36]
        mov     [ebp-32],eax
        mov     eax,5
        xor     edx,edx
        div     dword ptr [ebp-28]
        mov     [ebp-40],eax
        mov     eax,5
        xor     edx,edx
        div     dword ptr [ebp-28]
        mov     [ebp-44],eax
        mov     eax,[ebp-40]
        mul     dword ptr [ebp-44]
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
        xor     edx,edx
        div     dword ptr [ebp-24]
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
        xor     edx,edx
        div     ecx
        cmp     edx,2
        je      label0002
        mov     ecx,3
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        mov     eax,[ebp-24]
        mul     ecx
        cmp     eax,6
        je      label0003
        mov     ecx,4
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,[ebp-24]
        mov     [ebp-48],eax
        mov     eax,[ebp-48]
        mul     ecx
        cmp     eax,6
        je      label0004
        mov     ecx,5
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        mov     ecx,65536
        mov     eax,65536
        mul     ecx
        cmp     eax,0
        je      label0005
        mov     ecx,6
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0005:
        mov     eax,2
        mov     [ebp-24],eax
        mov     eax,3
        xor     edx,edx
        div     dword ptr [ebp-24]
        mov     [ebp-52],eax
        mov     eax,4
        xor     edx,edx
        div     dword ptr [ebp-24]
        mov     [ebp-56],eax
        mov     eax,[ebp-52]
        mul     dword ptr [ebp-56]
        cmp     eax,2
        je      label0006
        mov     ecx,7
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0006:
        mov     ecx,0
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
