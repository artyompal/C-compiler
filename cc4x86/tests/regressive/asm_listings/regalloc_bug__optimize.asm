
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,36
        push    edi
        mov     edi,2
        cmp     edi,3
        jle     label0000
; start of inline function f
        lea     edi,[edi+3]
; end of inline function f
        jmp     label0001
        mov     edi,[ebp-4]
label0000:
; start of inline function g
        lea     edi,[edi-3]
; end of inline function g
label0001:
        mov     eax,1
        add     eax,edi
        pop     edi
        add     esp,36
        pop     ebp
        ret
_test endp      

end
