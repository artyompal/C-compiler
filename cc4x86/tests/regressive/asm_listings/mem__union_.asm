
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        mov     dword ptr [ebp-4],2
        mov     dword ptr [ebp-4],1
        dec     dword ptr [ebp-4]
        mov     eax,[ebp-4]
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
