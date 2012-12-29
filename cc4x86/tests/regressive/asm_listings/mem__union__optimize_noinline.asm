
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        mov     eax,1
        dec     eax
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
