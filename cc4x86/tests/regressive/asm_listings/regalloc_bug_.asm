
.686
.model flat
.xmm

.code

_f proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        add     eax,[ebp+12]
        pop     ebp
        ret
_f endp

_g proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+8]
        sub     eax,[ebp+12]
        pop     ebp
        ret
_g endp

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        mov     dword ptr [ebp-4],2
        mov     dword ptr [ebp-8],3
        mov     eax,[ebp-4]
        cmp     eax,[ebp-8]
        jle     label0000
        push    dword ptr [ebp-8]
        push    dword ptr [ebp-4]
        call    _f
        add     esp,8
        mov     [ebp-12],eax
        jmp     label0001
label0000:
        push    dword ptr [ebp-8]
        push    dword ptr [ebp-4]
        call    _g
        add     esp,8
        mov     [ebp-12],eax
label0001:
        mov     eax,1
        add     eax,[ebp-12]
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
