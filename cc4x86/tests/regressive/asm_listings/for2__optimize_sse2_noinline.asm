
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,28
        push    edi
        push    esi
        mov     edi,0
        mov     esi,0
        mov     [ebp-20],esi
        mov     [ebp-24],edi
label0001:
        mov     esi,[ebp-20]
        cmp     esi,8
        mov     [ebp-20],esi
        jge     label0002
        mov     esi,[ebp-20]
        cmp     esi,4
        mov     [ebp-20],esi
        jne     label0003
        jmp     label0002
label0003:
        inc     dword ptr [ebp-20]
        inc     dword ptr [ebp-20]
        inc     dword ptr [ebp-24]
        jmp     label0001
label0002:
        mov     esi,[ebp-20]
        cmp     esi,4
        jne     label0004
        mov     edi,[ebp-24]
        cmp     edi,2
        jne     label0004
        mov     edi,0
        mov     [ebp-28],edi
        jmp     label0005
label0004:
        mov     edi,1
        mov     [ebp-28],edi
label0005:
        mov     eax,[ebp-28]
        pop     esi
        pop     edi
        add     esp,28
        pop     ebp
        ret
_test endp      

end
