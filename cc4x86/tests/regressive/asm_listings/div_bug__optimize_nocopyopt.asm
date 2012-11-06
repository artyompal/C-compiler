
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
        push    edi
        mov     edi,2
        mov     dword ptr [ebp-12],1
        lea     eax,[ebp-12]
        mov     [ebp-16],eax
        mov     eax,4
        cdq
        idiv    edi
        mov     edx,[ebp-16]
        add     eax,[edx]
        lea     eax,[eax-3]
        pop     edi
        add     esp,20
        pop     ebp
        ret
_test endp

end
