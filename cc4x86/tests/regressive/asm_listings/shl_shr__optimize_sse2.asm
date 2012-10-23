
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,16
        push    edi
        push    esi
        mov     edi,-16
        mov     esi,-16
        sar     edi,4
        cmp     edi,-1
        mov     [ebp-12],esi
        je      label0000
        mov     eax,1
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
label0000:
        mov     eax,[ebp-12]
        shr     eax,4
        cmp     eax,268435455
        je      label0001
        mov     eax,2
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
label0001:
        mov     edi,1073741824
        mov     esi,1073741824
        sal     edi,1
        cmp     edi,0
        mov     [ebp-12],esi
        jl      label0002
        mov     eax,3
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
label0002:
        mov     eax,[ebp-12]
        shl     eax,1
        cmp     eax,-2147483648
        je      label0003
        mov     eax,4
        pop     esi
        pop     edi
        add     esp,16
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
        mov     [ebp-16],edi
        mov     [ebp-12],esi
        je      label0004
        mov     eax,5
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
label0004:
        mov     ecx,5
        add     ecx,[ebp-12]
        mov     edi,[ebp-16]
        sal     edi,cl
        cmp     edi,64
        je      label0005
        mov     eax,6
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
label0005:
        mov     eax,0
        pop     esi
        pop     edi
        add     esp,16
        pop     ebp
        ret
_test endp      

end
