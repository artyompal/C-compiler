
.686
.model flat
.xmm

.code

_memset proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        mov     eax,[ebp+8]
        mov     [ebp-4],eax
label0000:
        mov     eax,[ebp+13]
        dec     dword ptr [ebp+13]
        cmp     eax,0
        je      label0001
        mov     eax,[ebp-4]
        inc     dword ptr [ebp-4]
        mov     byte1,[ebp+12]
        mov     [eax],byte1
        jmp     label0000
label0001:
        mov     esp,ebp
        pop     ebp
        ret
_memset endp

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        mov     dword ptr [ebp-12],1
        mov     dword ptr [ebp-8],2
        mov     dword ptr [ebp-4],3
        mov     eax,12
        push    eax
        mov     eax,0
        push    eax
        lea     eax,[ebp-12]
        push    eax
        call    _memset
        add     esp,12
        mov     eax,[ebp-8]
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
