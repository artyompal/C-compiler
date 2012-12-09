
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
        mov     eax,4
        cdq
        idiv    edi
        add     eax,[ebp-12]
        sub     eax,3
        pop     edi
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
