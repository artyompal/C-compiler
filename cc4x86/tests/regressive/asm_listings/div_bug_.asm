
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
        mov     dword ptr [ebp-4],4
        mov     dword ptr [ebp-8],2
        mov     dword ptr [ebp-12],1
        lea     eax,[ebp-12]
        mov     [ebp-16],eax
        mov     eax,[ebp-4]
        cdq
        idiv    dword ptr [ebp-8]
        mov     edx,[ebp-16]
        add     eax,[edx]
        mov     [ebp-20],eax
        mov     eax,[ebp-20]
        sub     eax,3
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
