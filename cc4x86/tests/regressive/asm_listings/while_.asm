
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
        mov     eax,[ebp-4]
        inc     dword ptr [ebp-4]
        cmp     eax,10
        jge     label0001
        jmp     label0000
label0001:
        cmp     dword ptr [ebp-4],11
        je      label0002
        mov     eax,1
        add     esp,12
        pop     ebp
        ret
label0002:
        mov     dword ptr [ebp-8],1
        mov     dword ptr [ebp-12],0
label0003:
        mov     eax,[ebp-8]
        sal     eax,1
        mov     [ebp-8],eax
        inc     dword ptr [ebp-12]
        cmp     dword ptr [ebp-8],65536
        jl      label0003
        cmp     dword ptr [ebp-12],16
        je      label0006
        mov     eax,2
        add     esp,12
        pop     ebp
        ret
label0006:
        mov     eax,0
        add     esp,12
        pop     ebp
        ret
_test endp

end
