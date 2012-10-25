
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        push    edi
        push    esi
        mov     edi,0
        mov     [ebp-4],edi
label0000:
        mov     eax,[ebp-4]
        inc     dword ptr [ebp-4]
        cmp     eax,10
        jge     label0001
        jmp     label0000
label0001:
        mov     edi,[ebp-4]
        cmp     edi,11
        je      label0002
        mov     eax,1
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0002:
        mov     edi,1
        mov     esi,0
        mov     [ebp-8],edi
        mov     [ebp-12],esi
label0003:
        mov     edi,[ebp-8]
        sal     edi,1
        inc     dword ptr [ebp-12]
        cmp     edi,65536
        mov     [ebp-8],edi
        jl      label0003
        mov     esi,[ebp-12]
        cmp     esi,16
        je      label0006
        mov     eax,2
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0006:
        mov     eax,0
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test endp      

end
