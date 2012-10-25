
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,40
        push    edi
        push    esi
        mov     edi,2
        mov     esi,3
        mov     eax,4
        mov     [ebp-12],eax
        mov     eax,5
        mov     [ebp-16],eax
        mov     eax,esi
        xor     edx,edx
        div     edi
        mov     [ebp-20],eax
        mov     eax,esi
        xor     edx,edx
        div     edi
        mov     [ebp-24],eax
        mov     eax,[ebp-20]
        mul     dword ptr [ebp-24]
        mov     [ebp-20],eax
        mov     eax,[ebp-16]
        xor     edx,edx
        div     dword ptr [ebp-12]
        mov     [ebp-28],eax
        mov     eax,[ebp-16]
        xor     edx,edx
        div     dword ptr [ebp-12]
        mov     [ebp-32],eax
        mov     eax,[ebp-28]
        mul     dword ptr [ebp-32]
        mov     [ebp-28],eax
        mov     eax,[ebp-20]
        add     eax,[ebp-28]
        cmp     eax,2
        mov     [ebp-4],edi
        mov     [ebp-8],esi
        je      label0000
        mov     eax,1
        pop     esi
        pop     edi
        add     esp,40
        pop     ebp
        ret
label0000:
        xor     edx,edx
        mov     eax,[ebp-12]
        div     dword ptr [ebp-4]
        cmp     eax,2
        je      label0001
        mov     eax,2
        pop     esi
        pop     edi
        add     esp,40
        pop     ebp
        ret
label0001:
        mov     eax,[ebp-16]
        xor     edx,edx
        div     dword ptr [ebp-8]
        mov     eax,edx
        cmp     eax,2
        je      label0002
        mov     eax,3
        pop     esi
        pop     edi
        add     esp,40
        pop     ebp
        ret
label0002:
        mov     eax,[ebp-4]
        mul     dword ptr [ebp-8]
        cmp     eax,6
        je      label0003
        mov     eax,4
        pop     esi
        pop     edi
        add     esp,40
        pop     ebp
        ret
label0003:
        mov     eax,[ebp-4]
        mul     dword ptr [ebp-8]
        cmp     eax,6
        je      label0004
        mov     eax,5
        pop     esi
        pop     edi
        add     esp,40
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
        add     esp,40
        pop     ebp
        ret
label0005:
        mov     edi,2
        mov     esi,3
        mov     eax,4
        mov     [ebp-12],eax
        mov     eax,5
        mov     eax,esi
        xor     edx,edx
        div     edi
        mov     [ebp-36],eax
        mov     eax,[ebp-12]
        xor     edx,edx
        div     edi
        mov     [ebp-40],eax
        mov     eax,[ebp-36]
        mul     dword ptr [ebp-40]
        cmp     eax,2
        je      label0006
        mov     eax,7
        pop     esi
        pop     edi
        add     esp,40
        pop     ebp
        ret
label0006:
        mov     eax,0
        pop     esi
        pop     edi
        add     esp,40
        pop     ebp
        ret
_test endp      

end
