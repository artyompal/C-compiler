
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,44
        mov     dword ptr [ebp-4],2
        mov     dword ptr [ebp-8],3
        mov     dword ptr [ebp-12],4
        mov     dword ptr [ebp-16],5
        mov     eax,[ebp-8]
        xor     edx,edx
        div     dword ptr [ebp-4]
        mov     [ebp-24],eax
        mov     eax,[ebp-8]
        xor     edx,edx
        div     dword ptr [ebp-4]
        mov     [ebp-28],eax
        mov     eax,[ebp-24]
        mul     dword ptr [ebp-28]
        mov     [ebp-24],eax
        mov     eax,[ebp-16]
        xor     edx,edx
        div     dword ptr [ebp-12]
        mov     [ebp-32],eax
        mov     eax,[ebp-16]
        xor     edx,edx
        div     dword ptr [ebp-12]
        mov     [ebp-36],eax
        mov     eax,[ebp-32]
        mul     dword ptr [ebp-36]
        mov     [ebp-32],eax
        mov     eax,[ebp-24]
        add     eax,[ebp-32]
        mov     [ebp-20],eax
        cmp     dword ptr [ebp-20],2
        je      label0000
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        mov     eax,[ebp-12]
        xor     edx,edx
        div     dword ptr [ebp-4]
        mov     [ebp-12],eax
        cmp     dword ptr [ebp-12],2
        je      label0001
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
label0001:
        mov     eax,[ebp-16]
        xor     edx,edx
        div     dword ptr [ebp-8]
        mov     [ebp-16],edx
        cmp     dword ptr [ebp-16],2
        je      label0002
        mov     eax,3
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        mov     eax,[ebp-4]
        mul     dword ptr [ebp-8]
        mov     [ebp-12],eax
        cmp     dword ptr [ebp-12],6
        je      label0003
        mov     eax,4
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     edx,[ebp-4]
        mov     [ebp-16],edx
        mov     eax,[ebp-16]
        mul     dword ptr [ebp-8]
        mov     [ebp-16],eax
        cmp     dword ptr [ebp-16],6
        je      label0004
        mov     eax,5
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        mov     dword ptr [ebp-4],65536
        mov     dword ptr [ebp-8],65536
        mov     eax,[ebp-4]
        mul     dword ptr [ebp-8]
        cmp     eax,0
        je      label0005
        mov     eax,6
        mov     esp,ebp
        pop     ebp
        ret
label0005:
        mov     dword ptr [ebp-4],2
        mov     dword ptr [ebp-8],3
        mov     dword ptr [ebp-12],4
        mov     dword ptr [ebp-16],5
        mov     eax,[ebp-8]
        xor     edx,edx
        div     dword ptr [ebp-4]
        mov     [ebp-40],eax
        mov     eax,[ebp-12]
        xor     edx,edx
        div     dword ptr [ebp-4]
        mov     [ebp-44],eax
        mov     eax,[ebp-40]
        mul     dword ptr [ebp-44]
        mov     [ebp-20],eax
        cmp     dword ptr [ebp-20],2
        je      label0006
        mov     eax,7
        mov     esp,ebp
        pop     ebp
        ret
label0006:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
