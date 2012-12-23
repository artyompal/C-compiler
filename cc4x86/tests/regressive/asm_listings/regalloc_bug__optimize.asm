
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,36
        mov     eax,2
        cmp     eax,3
        jle     label0000
; start of inline function f
        add     eax,3
; end of inline function f
        jmp     label0001
label0000:
; start of inline function g
        sub     eax,3
; end of inline function g
label0001:
        inc     eax
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
