
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        mov     eax,-16
        mov     ecx,-16
        sar     eax,4
        cmp     eax,-1
        je      label0000
        mov     ecx,1
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0000:
        shr     ecx,4
        cmp     ecx,268435455
        je      label0001
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
label0001:
        mov     eax,1073741824
        mov     ecx,1073741824
        sal     eax,1
        cmp     eax,0
        jl      label0002
        mov     ecx,3
        mov     eax,ecx
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        shl     ecx,1
        cmp     ecx,-2147483648
        je      label0003
        mov     eax,4
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,1
        mov     ecx,1
        mov     [ebp-12],ecx
        mov     ecx,3
        add     ecx,[ebp-12]
        mov     edx,eax
        shl     edx,cl
        cmp     edx,16
        je      label0004
        mov     eax,5
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        mov     ecx,5
        add     ecx,[ebp-12]
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
