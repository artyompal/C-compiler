
.686
.model flat
.xmm

.code

_test_case proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,3
        cmp     eax,1
        je      label0001
        cmp     eax,2
        je      label0002
        cmp     eax,3
        je      label0003
        jmp     label0004
label0001:
label0002:
        mov     eax,-1
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
_test_case endp

_test_case2 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,3
        cmp     eax,0
        je      label0001
        cmp     eax,1
        je      label0002
        cmp     eax,2
        je      label0003
        cmp     eax,3
        je      label0004
        jmp     label0005
label0001:
        mov     eax,-1
        mov     esp,ebp
        pop     ebp
        ret
label0002:
label0003:
label0004:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
label0005:
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
_test_case2 endp

_test_default proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,100
        cmp     eax,1
        je      label0001
        cmp     eax,2
        je      label0002
        jmp     label0003
label0001:
label0002:
        mov     eax,-1
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,0
        mov     esp,ebp
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
