
.686
.model flat
.xmm

.code

_test_case proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     dword ptr [ebp-4],3
        mov     eax,[ebp-4]
        mov     [ebp-8],eax
        cmp     dword ptr [ebp-8],1
        je      label0001
        cmp     dword ptr [ebp-8],2
        je      label0002
        cmp     dword ptr [ebp-8],3
        je      label0003
        jmp     label0004
label0001:
label0002:
        mov     eax,-1
        add     esp,8
        pop     ebp
        ret
label0003:
        mov     eax,0
        add     esp,8
        pop     ebp
        ret
label0004:
        mov     eax,1
        add     esp,8
        pop     ebp
        ret
_test_case endp

_test_case2 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     dword ptr [ebp-4],3
        mov     eax,[ebp-4]
        mov     [ebp-8],eax
        cmp     dword ptr [ebp-8],0
        je      label0001
        cmp     dword ptr [ebp-8],1
        je      label0002
        cmp     dword ptr [ebp-8],2
        je      label0003
        cmp     dword ptr [ebp-8],3
        je      label0004
        jmp     label0005
label0001:
        mov     eax,-1
        add     esp,8
        pop     ebp
        ret
label0002:
label0003:
label0004:
        mov     eax,0
        add     esp,8
        pop     ebp
        ret
label0005:
        mov     eax,1
        add     esp,8
        pop     ebp
        ret
_test_case2 endp

_test_default proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     dword ptr [ebp-4],100
        mov     eax,[ebp-4]
        mov     [ebp-8],eax
        cmp     dword ptr [ebp-8],1
        je      label0001
        cmp     dword ptr [ebp-8],2
        je      label0002
        jmp     label0003
label0001:
label0002:
        mov     eax,-1
        add     esp,8
        pop     ebp
        ret
label0003:
        mov     eax,0
        add     esp,8
        pop     ebp
        ret
_test_default endp

_test proc
        push    ebp
        mov     ebp,esp
        call    _test_case
        cmp     eax,0
        je      label0000
        mov     eax,1
        pop     ebp
        ret
label0000:
        call    _test_case2
        cmp     eax,0
        je      label0001
        mov     eax,1
        pop     ebp
        ret
label0001:
        call    _test_default
        cmp     eax,0
        je      label0002
        mov     eax,1
        pop     ebp
        ret
label0002:
        mov     eax,0
        pop     ebp
        ret
_test endp

end
