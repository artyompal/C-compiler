
.686
.model flat
.xmm

.code

_f proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
        add     esi,edi
        mov     eax,esi
        pop     esi
        pop     edi
        pop     ebp
        ret
_f endp

_g proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        mov     edi,[ebp+12]
        mov     esi,[ebp+8]
        sub     esi,edi
        mov     eax,esi
        pop     esi
        pop     edi
        pop     ebp
        ret
_g endp

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        push    edi
        push    esi
        mov     edi,2
        mov     esi,3
        mov     eax,2
        cmp     eax,3
        jle     label0000
        push    esi
        push    edi
        call    _f
        add     esp,8
        mov     edi,eax
        jmp     label0001
        mov     edi,[ebp-4]
label0000:
        push    esi
        push    edi
        call    _g
        add     esp,8
        mov     edi,eax
label0001:
        mov     eax,1
        add     eax,edi
        pop     esi
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test endp

end
