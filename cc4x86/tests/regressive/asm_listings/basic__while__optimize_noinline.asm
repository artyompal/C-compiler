
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
        mov     ecx,eax
        inc     eax
        cmp     ecx,10
        jge     label0001
        jmp     label0000
label0001:
        cmp     eax,11
        je      label0002
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        mov     eax,1
        mov     ecx,0
label0003:
        sal     eax,1
        inc     ecx
        cmp     eax,65536
        jl      label0003
        cmp     ecx,16
        je      label0006
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
label0006:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
