
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,24
        push    edi
        push    esi
        mov     edi,0
        mov     [ebp-16],edi
label0000:
        mov     edi,[ebp-16]
        cmp     edi,10
        jge     label0001
        mov     edi,[ebp-16]
        cmp     edi,5
        jne     label0002
        jmp     label0001
label0002:
        inc     dword ptr [ebp-16]
        jmp     label0000
label0001:
        mov     edi,[ebp-16]
        cmp     edi,5
        je      label0003
        mov     eax,1
        pop     esi
        pop     edi
        add     esp,24
        pop     ebp
        ret
label0003:
        mov     edi,0
        mov     esi,0
        mov     [ebp-20],edi
        mov     [ebp-24],esi
label0004:
        mov     edi,[ebp-20]
        cmp     edi,50
        jne     label0007
        mov     edi,[ebp-20]
        add     edi,50
        mov     [ebp-20],edi
        jmp     label0005
label0007:
        inc     dword ptr [ebp-20]
        inc     dword ptr [ebp-24]
label0005:
        mov     edi,[ebp-20]
        cmp     edi,100
        jl      label0004
        mov     esi,[ebp-24]
        cmp     esi,50
        je      label0008
        mov     eax,1
        pop     esi
        pop     edi
        add     esp,24
        pop     ebp
        ret
label0008:
        mov     eax,0
        pop     esi
        pop     edi
        add     esp,24
        pop     ebp
        ret
_test endp      

end
