
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     dword ptr [ebp-4],-16
        mov     dword ptr [ebp-8],-16
        mov     eax,[ebp-4]
        sar     eax,4
        cmp     eax,-1
        je      label0000
        mov     eax,1
        add     esp,8
        pop     ebp
        ret
label0000:
        mov     eax,[ebp-8]
        shr     eax,4
        cmp     eax,268435455
        je      label0001
        mov     eax,2
        add     esp,8
        pop     ebp
        ret
label0001:
        mov     dword ptr [ebp-4],1073741824
        mov     dword ptr [ebp-8],1073741824
        mov     eax,[ebp-4]
        sal     eax,1
        cmp     eax,0
        jl      label0002
        mov     eax,3
        add     esp,8
        pop     ebp
        ret
label0002:
        mov     eax,[ebp-8]
        shl     eax,1
        cmp     eax,-2147483648
        je      label0003
        mov     eax,4
        add     esp,8
        pop     ebp
        ret
label0003:
        mov     dword ptr [ebp-4],1
        mov     dword ptr [ebp-8],1
        mov     ecx,3
        add     ecx,[ebp-8]
        mov     eax,[ebp-4]
        shl     eax,cl
        cmp     eax,16
        je      label0004
        mov     eax,5
        add     esp,8
        pop     ebp
        ret
label0004:
        mov     ecx,5
        add     ecx,[ebp-8]
        mov     eax,[ebp-4]
        sal     eax,cl
        mov     [ebp-4],eax
        cmp     dword ptr [ebp-4],64
        je      label0005
        mov     eax,6
        add     esp,8
        pop     ebp
        ret
label0005:
        mov     eax,0
        add     esp,8
        pop     ebp
        ret
_test endp

end
