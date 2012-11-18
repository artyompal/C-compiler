
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
        mov     eax,edi
        inc     edi
        cmp     eax,10
        jge     label0001
        jmp     label0000
label0001:
        cmp     edi,11
        je      label0002
        mov     edi,1
        mov     eax,edi
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0002:
        mov     edi,1
        mov     esi,0
label0003:
        sal     edi,1
        inc     esi
        cmp     edi,65536
        jl      label0003
        cmp     esi,16
        je      label0006
        mov     esi,2
        mov     eax,esi
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0006:
        mov     esi,0
        mov     eax,esi
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test endp

end
