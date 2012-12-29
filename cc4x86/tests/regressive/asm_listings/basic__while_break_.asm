
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
        cmp     dword ptr [ebp-4],10
        jge     label0001
        cmp     dword ptr [ebp-4],5
        jne     label0002
        jmp     label0001
label0002:
        inc     dword ptr [ebp-4]
        jmp     label0000
label0001:
        cmp     dword ptr [ebp-4],5
        je      label0003
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     dword ptr [ebp-8],0
        mov     dword ptr [ebp-12],0
label0004:
        cmp     dword ptr [ebp-8],50
        jne     label0007
        mov     eax,[ebp-8]
        add     eax,50
        mov     [ebp-8],eax
        jmp     label0005
label0007:
        inc     dword ptr [ebp-8]
        inc     dword ptr [ebp-12]
label0005:
        cmp     dword ptr [ebp-8],100
        jl      label0004
        cmp     dword ptr [ebp-12],50
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
