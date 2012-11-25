
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        push    edi
        push    esi
        mov     edi,0
label0000:
        cmp     edi,10
        jge     label0001
        cmp     edi,5
        jne     label0002
        jmp     label0001
label0002:
        inc     edi
        jmp     label0000
label0001:
        cmp     edi,5
        je      label0003
        mov     eax,1
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0003:
        mov     edi,0
        mov     esi,0
label0004:
        cmp     edi,50
        jne     label0007
        add     edi,50
        jmp     label0005
label0007:
        inc     edi
        inc     esi
label0005:
        cmp     edi,100
        jl      label0004
        cmp     esi,50
        je      label0008
        mov     edi,1
        mov     eax,edi
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0008:
        mov     edi,0
        mov     eax,edi
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test endp

end
