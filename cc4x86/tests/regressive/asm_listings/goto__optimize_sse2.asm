
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        push    edi
        mov     edi,0
        jmp     label0002
label0000:
        jmp     label0001
label0001:
        cmp     edi,1
        setne   al
        movzx   eax,al
        pop     edi
        add     esp,4
        pop     ebp
        ret
label0002:
        inc     edi
        jmp     label0000
_test endp      

end
