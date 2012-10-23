
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,36
        mov     dword ptr [ebp-4],2
        mov     dword ptr [ebp-8],3
        mov     dword ptr [ebp-12],4
        mov     dword ptr [ebp-16],5
        mov     eax,[ebp-8]
        cdq
        idiv    dword ptr [ebp-4]
        mov     [ebp-24],eax
        mov     eax,[ebp-8]
        cdq
        idiv    dword ptr [ebp-4]
        mov     [ebp-28],eax
        mov     eax,[ebp-24]
        imul    eax,[ebp-28]
        mov     [ebp-24],eax
        mov     eax,[ebp-16]
        cdq
        idiv    dword ptr [ebp-12]
        mov     [ebp-32],eax
        mov     eax,[ebp-16]
        cdq
        idiv    dword ptr [ebp-12]
        mov     [ebp-36],eax
        mov     eax,[ebp-32]
        imul    eax,[ebp-36]
        mov     [ebp-32],eax
        mov     eax,[ebp-24]
        add     eax,[ebp-32]
        mov     [ebp-20],eax
        cmp     dword ptr [ebp-20],2
        je      label0000
        mov     eax,1
        add     esp,36
        pop     ebp
        ret
label0000:
        mov     eax,[ebp-12]
        cdq
        idiv    dword ptr [ebp-4]
        mov     [ebp-12],eax
        cmp     dword ptr [ebp-12],2
        je      label0001
        mov     eax,2
        add     esp,36
        pop     ebp
        ret
label0001:
        mov     eax,[ebp-16]
        cdq
        idiv    dword ptr [ebp-8]
        mov     [ebp-16],edx
        cmp     dword ptr [ebp-16],2
        je      label0002
        mov     eax,3
        add     esp,36
        pop     ebp
        ret
label0002:
        mov     eax,0
        add     esp,36
        pop     ebp
        ret
_test endp      

end
