
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        mov     eax,2
        imul    eax,2
        cmp     eax,4
        jne     label0000
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
