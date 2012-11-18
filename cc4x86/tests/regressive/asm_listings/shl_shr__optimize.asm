
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        push    esi
        mov     edi,-16
        mov     esi,-16
        sar     edi,4
        cmp     edi,-1
        je      label0000
        mov     esi,1
        mov     eax,esi
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0000:
        shr     esi,4
        cmp     esi,268435455
        je      label0001
        mov     eax,2
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0001:
        mov     edi,1073741824
        mov     esi,1073741824
        sal     edi,1
        cmp     edi,0
        jl      label0002
        mov     esi,3
        mov     eax,esi
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0002:
        shl     esi,1
        cmp     esi,-2147483648
        je      label0003
        mov     eax,4
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0003:
        mov     edi,1
        mov     esi,1
        mov     ecx,3
        add     ecx,esi
        mov     eax,edi
        shl     eax,cl
        cmp     eax,16
        je      label0004
        mov     esi,5
        mov     eax,esi
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0004:
        mov     ecx,5
        add     ecx,esi
        sal     edi,cl
        cmp     edi,64
        je      label0005
        mov     esi,6
        mov     eax,esi
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0005:
        mov     esi,0
        mov     eax,esi
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_test endp

end
