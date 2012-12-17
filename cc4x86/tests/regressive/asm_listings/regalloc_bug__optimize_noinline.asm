
.686
.model flat
.xmm

.code

_f proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        add     ecx,eax
        mov     eax,ecx
        pop     ebp
        ret
_f endp

_g proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+12]
        mov     ecx,[ebp+8]
        sub     ecx,eax
        mov     eax,ecx
        pop     ebp
        ret
_g endp

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        mov     eax,2
        mov     ecx,3
        cmp     eax,ecx
        jle     label0000
        push    ecx
        push    eax
        call    _f
        add     esp,8
        jmp     label0001
label0000:
        push    ecx
        push    eax
        call    _g
        add     esp,8
label0001:
        mov     ecx,1
        add     ecx,eax
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
