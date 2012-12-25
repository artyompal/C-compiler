
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,20
        mov     eax,2
        mov     dword ptr [ebp-12],1
        mov     [ebp-8],eax
        mov     eax,4
        cdq
        idiv    dword ptr [ebp-8]
        add     eax,[ebp-12]
        sub     eax,3
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
