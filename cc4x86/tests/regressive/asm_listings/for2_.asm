
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        mov     dword ptr [ebp-8],0
        mov     dword ptr [ebp-4],0
label0001:
        cmp     dword ptr [ebp-4],8
        jge     label0002
        cmp     dword ptr [ebp-4],4
        jne     label0003
        jmp     label0002
label0003:
        inc     dword ptr [ebp-4]
        inc     dword ptr [ebp-4]
        inc     dword ptr [ebp-8]
        jmp     label0001
label0002:
        cmp     dword ptr [ebp-4],4
        jne     label0004
        cmp     dword ptr [ebp-8],2
        jne     label0004
        mov     dword ptr [ebp-16],0
        jmp     label0005
label0004:
        mov     dword ptr [ebp-16],1
label0005:
        mov     eax,[ebp-16]
        add     esp,16
        pop     ebp
        ret
_test endp

end
