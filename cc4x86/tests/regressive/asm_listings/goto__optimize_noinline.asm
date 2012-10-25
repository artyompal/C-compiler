
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
        mov     [ebp-4],edi
        jmp     label0002
label0000:
        jmp     label0001
label0001:
        mov     edi,[ebp-4]
        cmp     edi,1
        setne   al
        movzx   eax,al
        pop     edi
        add     esp,4
        pop     ebp
        ret
label0002:
        inc     dword ptr [ebp-4]
        jmp     label0000
_test endp      

end
