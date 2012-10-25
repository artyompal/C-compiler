
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        push    edi
        push    esi
        mov     edi,0
        mov     esi,0
        mov     [ebp-4],esi
        mov     [ebp-8],edi
label0001:
        mov     esi,[ebp-4]
        cmp     esi,8
        jge     label0002
        mov     esi,[ebp-4]
        cmp     esi,4
        jne     label0003
        jmp     label0002
label0003:
        inc     dword ptr [ebp-4]
        inc     dword ptr [ebp-4]
        inc     dword ptr [ebp-8]
        jmp     label0001
label0002:
        mov     esi,[ebp-4]
        cmp     esi,4
        jne     label0004
        mov     edi,[ebp-8]
        cmp     edi,2
        jne     label0004
        mov     edi,0
        mov     [ebp-16],edi
        jmp     label0005
label0004:
        mov     edi,1
        mov     [ebp-16],edi
label0005:
        mov     eax,[ebp-16]
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
_test endp      

end
