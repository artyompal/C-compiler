
.686
.model flat
.xmm

.code

_test1 proc
        push    ebp
        mov     ebp,esp
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        imul    ebx,esi
        sub     ebx,edi
        mov     eax,ebx
        pop     ebx
        pop     esi
        pop     edi
        pop     ebp
        ret
_test1 endp

_test2 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        add     ebx,esi
        sub     ebx,edi
        mov     eax,ebx
        pop     ebx
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_test2 endp

_test3 proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     edx,0
        mov     edx,ebx
        cmp     edi,0
        jle     label0000
        mov     ebx,esi
        jmp     label0001
label0000:
        mov     edx,edi
label0001:
        add     edx,ebx
        add     edx,esi
        sub     edx,edi
        mov     eax,edx
        pop     ebx
        pop     esi
        pop     edi
        add     esp,4
        pop     ebp
        ret
_test3 endp

_test4 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        inc     ebx
        add     ebx,esi
        sub     ebx,edi
        mov     eax,ebx
        pop     ebx
        pop     esi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_test4 endp

_test5 proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        push    edi
        push    esi
        push    ebx
        mov     edi,[ebp+16]
        mov     esi,[ebp+12]
        mov     ebx,[ebp+8]
        mov     edx,0
        mov     edx,ebx
        cmp     edi,0
        jle     label0000
        mov     edx,esi
        jmp     label0001
label0000:
        mov     edx,ebx
label0001:
        add     edx,esi
        sub     edx,edi
        mov     eax,edx
        pop     ebx
        pop     esi
        pop     edi
        add     esp,4
        pop     ebp
        ret
_test5 endp

_test proc
        push    ebp
        mov     ebp,esp
        mov     eax,131072
        push    eax
        mov     eax,512
        push    eax
        mov     eax,256
        push    eax
        call    _test1
        add     esp,12
        cmp     eax,0
        je      label0000
        mov     eax,1
        pop     ebp
        ret
label0000:
        mov     eax,1221
        push    eax
        mov     eax,666
        push    eax
        mov     eax,555
        push    eax
        call    _test2
        add     esp,12
        cmp     eax,0
        je      label0001
        mov     eax,2
        pop     ebp
        ret
label0001:
        mov     eax,444
        push    eax
        mov     eax,111
        push    eax
        mov     eax,222
        push    eax
        call    _test3
        add     esp,12
        cmp     eax,0
        je      label0002
        mov     eax,3
        pop     ebp
        ret
label0002:
        mov     eax,10
        push    eax
        mov     eax,4
        push    eax
        mov     eax,5
        push    eax
        call    _test4
        add     esp,12
        cmp     eax,0
        je      label0003
        mov     eax,4
        pop     ebp
        ret
label0003:
        mov     eax,888
        push    eax
        mov     eax,444
        push    eax
        mov     eax,222
        push    eax
        call    _test5
        add     esp,12
        cmp     eax,0
        je      label0004
        mov     eax,3
        pop     ebp
        ret
label0004:
        mov     eax,0
        pop     ebp
        ret
_test endp

end
