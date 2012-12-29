
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,104
; start of inline function test1
        mov     eax,256
        imul    eax,512
        sub     eax,131072
; end of inline function test1
        cmp     eax,0
        je      label0000
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0000:
; start of inline function test2
        mov     eax,555
        add     eax,666
        sub     eax,1221
; end of inline function test2
        cmp     eax,0
        je      label0001
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
label0001:
; start of inline function test3
        mov     eax,444
        mov     ecx,222
        mov     edx,ecx
        cmp     eax,0
        jle     label0007
        mov     ecx,111
        jmp     label0008
label0007:
        mov     edx,eax
label0008:
        add     edx,ecx
        add     edx,111
        sub     edx,eax
; end of inline function test3
        cmp     edx,0
        je      label0002
        mov     eax,3
        mov     esp,ebp
        pop     ebp
        ret
label0002:
; start of inline function test4
        mov     eax,5
        inc     eax
        add     eax,4
        sub     eax,10
; end of inline function test4
        cmp     eax,0
        je      label0003
        mov     eax,4
        mov     esp,ebp
        pop     ebp
        ret
label0003:
; start of inline function test5
        mov     eax,888
        cmp     eax,0
        jle     label000b
        mov     ecx,444
        jmp     label000c
label000b:
        mov     ecx,222
label000c:
        add     ecx,444
        sub     ecx,eax
; end of inline function test5
        cmp     ecx,0
        je      label0004
        mov     eax,3
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
