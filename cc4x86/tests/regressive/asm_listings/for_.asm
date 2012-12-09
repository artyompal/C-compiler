
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        mov     dword ptr [ebp-4],0
label0000:
        cmp     dword ptr [ebp-4],8
        jge     label0002
        cmp     dword ptr [ebp-4],4
        jne     label0003
        jmp     label0002
label0003:
        inc     dword ptr [ebp-4]
        jmp     label0000
label0002:
        cmp     dword ptr [ebp-4],4
        setne   al
        movzx   eax,al
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
