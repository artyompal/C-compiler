
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
        cmp     eax,10
        jge     label0001
        cmp     eax,5
        jne     label0002
        jmp     label0001
label0002:
        inc     eax
        jmp     label0000
label0001:
        cmp     eax,5
        je      label0003
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,0
        mov     ecx,0
label0004:
        cmp     eax,50
        jne     label0007
        add     eax,50
        jmp     label0005
label0007:
        inc     eax
        inc     ecx
label0005:
        cmp     eax,100
        jl      label0004
        cmp     ecx,50
        je      label0008
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0008:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
