
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        mov     eax,0
        jmp     label0002
label0000:
        jmp     label0001
label0001:
        cmp     eax,1
        setne   cl
        movzx   ecx,cl
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        inc     eax
        jmp     label0000
_test endp

end
