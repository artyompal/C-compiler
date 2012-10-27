
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        push    edi
        mov     edi,2
        imul    edi,2
        cmp     edi,4
        jne     label0000
        mov     edi,0
        mov     eax,edi
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0000:
        mov     edi,1
        mov     eax,edi
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test endp      

end
