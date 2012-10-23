
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,64
        push    edi
        push    esi
        mov     edi,2
        mov     esi,3
        mov     eax,4
        mov     [ebp-24],eax
        mov     eax,5
        mov     [ebp-28],eax
        mov     eax,esi
        xor     edx,edx
        div     edi
        mov     [ebp-32],eax
        mov     eax,esi
        xor     edx,edx
        div     edi
        mov     [ebp-36],eax
        mov     eax,[ebp-32]
        mul     dword ptr [ebp-36]
        mov     [ebp-32],eax
        mov     eax,[ebp-28]
        xor     edx,edx
        div     dword ptr [ebp-24]
        mov     [ebp-40],eax
        mov     eax,[ebp-28]
        xor     edx,edx
        div     dword ptr [ebp-24]
        mov     [ebp-44],eax
        mov     eax,[ebp-40]
        mul     dword ptr [ebp-44]
        mov     [ebp-40],eax
        mov     eax,[ebp-32]
        add     eax,[ebp-40]
        cmp     eax,2
        mov     [ebp-48],edi
        mov     [ebp-52],esi
        je      label0000
        mov     eax,1
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
label0000:
        xor     edx,edx
        mov     eax,[ebp-24]
        div     dword ptr [ebp-48]
        cmp     eax,2
        je      label0001
        mov     eax,2
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
label0001:
        mov     eax,[ebp-28]
        xor     edx,edx
        div     dword ptr [ebp-52]
        mov     eax,edx
        cmp     eax,2
        je      label0002
        mov     eax,3
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
label0002:
        mov     eax,[ebp-48]
        mul     dword ptr [ebp-52]
        mov     [ebp-56],eax
        mov     eax,[ebp-56]
        cmp     eax,6
        je      label0003
        mov     eax,4
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
label0003:
        mov     eax,[ebp-48]
        mul     dword ptr [ebp-52]
        cmp     eax,6
        je      label0004
        mov     eax,5
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
label0004:
        mov     edi,65536
        mov     esi,65536
        mov     eax,edi
        mul     esi
        cmp     eax,0
        je      label0005
        mov     eax,6
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
label0005:
        mov     edi,2
        mov     esi,3
        mov     eax,4
        mov     [ebp-24],eax
        mov     eax,5
        mov     eax,esi
        xor     edx,edx
        div     edi
        mov     [ebp-60],eax
        mov     eax,[ebp-24]
        xor     edx,edx
        div     edi
        mov     [ebp-64],eax
        mov     eax,[ebp-60]
        mul     dword ptr [ebp-64]
        mov     [ebp-60],eax
        mov     eax,[ebp-60]
        cmp     eax,2
        je      label0006
        mov     eax,7
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
label0006:
        mov     eax,0
        pop     esi
        pop     edi
        add     esp,64
        pop     ebp
        ret
_test endp      

end
