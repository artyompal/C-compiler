
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,24
        push    edi
        mov     edi,2
        lea     eax,[ebp-12]
        mov     [ebp-24],eax
        mov     eax,4
        cdq
        idiv    edi
        mov     edx,[ebp-24]
        add     eax,[edx]
        sub     eax,3
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
