
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,104
        push    edi
        push    esi
; start of inline function test1
        mov     eax,256
        imul    eax,512
        sub     eax,131072
; end of inline function test1
        cmp     eax,0
        je      label0000
        mov     eax,1
        pop     esi
        pop     edi
        add     esp,104
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
        pop     esi
        pop     edi
        add     esp,104
        pop     ebp
        ret
label0001:
; start of inline function test3
        mov     eax,444
        mov     edi,222
        mov     esi,0
        mov     esi,edi
        cmp     eax,0
        jle     label0007
        mov     edi,111
        jmp     label0008
label0007:
        mov     esi,eax
label0008:
        add     esi,edi
        add     esi,111
        sub     esi,eax
; end of inline function test3
        cmp     esi,0
        je      label0002
        mov     eax,3
        pop     esi
        pop     edi
        add     esp,104
        pop     ebp
        ret
label0002:
; start of inline function test4
        mov     edi,5
        inc     edi
        lea     edi,[edi+4]
        sub     edi,10
; end of inline function test4
        cmp     edi,0
        je      label0003
        mov     eax,4
        pop     esi
        pop     edi
        add     esp,104
        pop     ebp
        ret
label0003:
; start of inline function test5
        mov     edi,888
        mov     esi,0
        mov     esi,222
        cmp     edi,0
        jle     label000b
        mov     esi,444
        jmp     label000c
label000b:
        mov     esi,222
label000c:
        lea     esi,[esi+444]
        sub     esi,edi
; end of inline function test5
        cmp     esi,0
        je      label0004
        mov     eax,3
        pop     esi
        pop     edi
        add     esp,104
        pop     ebp
        ret
label0004:
        mov     eax,0
        pop     esi
        pop     edi
        add     esp,104
        pop     ebp
        ret
_test endp

end
