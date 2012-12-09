
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,44
        push    edi
        push    esi
        push    ebx
        mov     edi,2
        mov     esi,3
        mov     ebx,4
        mov     eax,esi
        xor     edx,edx
        div     edi
        mov     [ebp-24],eax
        mov     eax,esi
        xor     edx,edx
        div     edi
        mov     [ebp-28],eax
        mov     eax,[ebp-24]
        mul     dword ptr [ebp-28]
        mov     [ebp-24],eax
        mov     eax,5
        xor     edx,edx
        div     ebx
        mov     [ebp-32],eax
        mov     eax,5
        xor     edx,edx
        div     ebx
        mov     [ebp-36],eax
        mov     eax,[ebp-32]
        mul     dword ptr [ebp-36]
        mov     [ebp-32],eax
        mov     eax,[ebp-24]
        add     eax,[ebp-32]
        cmp     eax,2
        je      label0000
        mov     edx,1
        mov     eax,edx
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        mov     eax,ebx
        xor     edx,edx
        div     edi
        cmp     eax,2
        je      label0001
        mov     edx,2
        mov     eax,edx
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
label0001:
        mov     eax,5
        xor     edx,edx
        div     esi
        cmp     edx,2
        je      label0002
        mov     esi,3
        mov     eax,esi
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        mov     eax,edi
        mul     esi
        cmp     eax,6
        je      label0003
        mov     esi,4
        mov     eax,esi
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,edi
        mul     esi
        cmp     eax,6
        je      label0004
        mov     esi,5
        mov     eax,esi
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        mov     esi,65536
        mov     eax,65536
        mul     esi
        cmp     eax,0
        je      label0005
        mov     esi,6
        mov     eax,esi
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
label0005:
        mov     esi,2
        mov     eax,3
        xor     edx,edx
        div     esi
        mov     [ebp-40],eax
        mov     eax,4
        xor     edx,edx
        div     esi
        mov     [ebp-44],eax
        mov     eax,[ebp-40]
        mul     dword ptr [ebp-44]
        cmp     eax,2
        je      label0006
        mov     edx,7
        mov     eax,edx
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
label0006:
        mov     edx,0
        mov     eax,edx
        pop     ebx
        pop     esi
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
