
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,24
        mov     eax,2
        mov     [ebp-24],eax
        mov     eax,4
        cdq
        idiv    dword ptr [ebp-24]
        add     eax,[ebp-12]
        sub     eax,3
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
