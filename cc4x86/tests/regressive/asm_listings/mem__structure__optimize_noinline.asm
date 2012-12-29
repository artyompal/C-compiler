
.686
.model flat
.xmm

.code

_memset proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        mov     eax,[ebp+13]
        mov     ecx,[ebp+8]
label0000:
        mov     edx,eax
        dec     eax
        cmp     edx,0
        je      label0001
        mov     edx,ecx
        inc     ecx
        mov     byte1,[ebp+12]
        mov     [edx],byte1
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
        mov     eax,12
        push    eax
        mov     eax,0
        push    eax
        mov     dword ptr [ebp-8],2
        mov     dword ptr [ebp-4],3
        mov     dword ptr [ebp-12],1
        lea     eax,[ebp-12]
        push    eax
        call    _memset
        add     esp,12
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
