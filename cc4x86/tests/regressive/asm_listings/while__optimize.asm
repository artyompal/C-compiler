
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        push    edi
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
        mov     eax,1
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0002:
        mov     edi,1
        mov     eax,0
label0003:
        sal     edi,1
        inc     eax
        cmp     edi,65536
        jl      label0003
        cmp     eax,16
        je      label0006
        mov     eax,2
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0006:
        mov     eax,0
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test endp      

end
