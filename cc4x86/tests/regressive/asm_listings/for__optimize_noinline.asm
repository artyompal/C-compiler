
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
        mov     [ebp-4],edi
label0000:
        mov     edi,[ebp-4]
        cmp     edi,8
        jge     label0002
        mov     edi,[ebp-4]
        cmp     edi,4
        jne     label0003
        jmp     label0002
label0003:
        inc     dword ptr [ebp-4]
        jmp     label0000
label0002:
        mov     edi,[ebp-4]
        cmp     edi,4
        setne   al
        movzx   eax,al
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test endp      

end
