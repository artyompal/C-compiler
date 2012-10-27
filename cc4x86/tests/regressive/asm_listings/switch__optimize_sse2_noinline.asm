
.686
.model flat
.xmm

.code

_test_case proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        mov     edi,3
        cmp     edi,1
        je      label0001
        cmp     edi,2
        je      label0002
        cmp     edi,3
        je      label0003
        jmp     label0004
label0001:
label0002:
        mov     edi,-1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0003:
        mov     edi,0
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0004:
        mov     edi,1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_test_case endp 

_test_case2 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        mov     edi,3
        cmp     edi,0
        je      label0001
        cmp     edi,1
        je      label0002
        cmp     edi,2
        je      label0003
        cmp     edi,3
        je      label0004
        jmp     label0005
label0001:
        mov     edi,-1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0002:
label0003:
label0004:
        mov     edi,0
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0005:
        mov     edi,1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_test_case2 endp        

_test_default proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        mov     edi,100
        cmp     edi,1
        je      label0001
        cmp     edi,2
        je      label0002
        jmp     label0003
label0001:
label0002:
        mov     edi,-1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0003:
        mov     edi,0
        mov     eax,edi
        pop     edi
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
