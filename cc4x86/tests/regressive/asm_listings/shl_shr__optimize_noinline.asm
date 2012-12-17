
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,-16
        sar     eax,4
        cmp     eax,-1
        je      label0000
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        mov     eax,-16
        shr     eax,4
        cmp     eax,268435455
        je      label0001
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
label0001:
        mov     eax,1073741824
        sal     eax,1
        cmp     eax,0
        jl      label0002
        mov     eax,3
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        mov     eax,1073741824
        shl     eax,1
        cmp     eax,-2147483648
        je      label0003
        mov     eax,4
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     ecx,3
        inc     ecx
        mov     eax,1
        shl     eax,cl
        cmp     eax,16
        je      label0004
        mov     eax,5
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        mov     ecx,5
        inc     ecx
        mov     eax,1
        sal     eax,cl
        cmp     eax,64
        je      label0005
        mov     eax,6
        mov     esp,ebp
        pop     ebp
        ret
label0005:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
