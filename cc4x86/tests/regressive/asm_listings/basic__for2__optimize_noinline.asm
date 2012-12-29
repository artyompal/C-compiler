
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        mov     eax,0
        mov     ecx,0
label0001:
        cmp     ecx,8
        jge     label0002
        cmp     ecx,4
        jne     label0003
        jmp     label0002
label0003:
        inc     ecx
        inc     ecx
        inc     eax
        jmp     label0001
label0002:
        cmp     ecx,4
        jne     label0004
        cmp     eax,2
        jne     label0004
        mov     eax,0
        jmp     label0005
label0004:
        mov     eax,1
label0005:
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
