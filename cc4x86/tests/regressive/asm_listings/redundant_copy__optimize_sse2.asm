
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
        cmp     eax,0
        jle     label0007
        mov     edi,111
        jmp     label0008
label0007:
        mov     esi,eax
label0008:
        add     edi,edi
        add     edi,111
        sub     edi,eax
; end of inline function test3
        cmp     edi,0
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
        lea     eax,[edi+4]
        sub     eax,10
; end of inline function test4
        cmp     eax,0
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
        lea     eax,[esi+444]
        sub     eax,edi
; end of inline function test5
        cmp     eax,0
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
