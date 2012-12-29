
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        mov     eax,0
label0000:
        cmp     eax,8
        jge     label0002
        cmp     eax,4
        jne     label0003
        jmp     label0002
label0003:
        inc     eax
        jmp     label0000
label0002:
        cmp     eax,4
        setne   al
        movzx   eax,al
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
