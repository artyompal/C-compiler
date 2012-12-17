
.686
.model flat
.xmm

.code

_test1 proc
        push    ebp
        mov     ebp,esp
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        imul    edx,ecx
        sub     edx,eax
        mov     eax,edx
        pop     ebp
        ret
_test1 endp

_test2 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        add     edx,ecx
        sub     edx,eax
        mov     eax,edx
        mov     esp,ebp
        pop     ebp
        ret
_test2 endp

_test3 proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        push    ebx
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        mov     ebx,edx
        cmp     dword ptr [ebp+16],0
        jle     label0000
        mov     edx,ecx
        jmp     label0001
label0000:
        mov     ebx,eax
label0001:
        add     ebx,edx
        add     ebx,ecx
        sub     ebx,eax
        mov     eax,ebx
        pop     ebx
        mov     esp,ebp
        pop     ebp
        ret
_test3 endp

_test4 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        inc     edx
        add     edx,ecx
        sub     edx,eax
        mov     eax,edx
        mov     esp,ebp
        pop     ebp
        ret
_test4 endp

_test5 proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        mov     eax,[ebp+16]
        mov     ecx,[ebp+12]
        mov     edx,[ebp+8]
        cmp     dword ptr [ebp+16],0
        jle     label0000
        mov     edx,ecx
        jmp     label0001
label0000:
label0001:
        add     edx,ecx
        sub     edx,eax
        mov     eax,edx
        mov     esp,ebp
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
