
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
        mov     [ebp-4],edi
        jle     label0000
; start of inline function f
        mov     edi,[ebp-4]
        lea     edi,[edi+3]
; end of inline function f
        mov     [ebp-12],edi
        jmp     label0001
label0000:
; start of inline function g
        mov     edi,[ebp-4]
        lea     edi,[edi-3]
; end of inline function g
        mov     [ebp-12],edi
label0001:
        mov     eax,1
        add     eax,[ebp-12]
        pop     edi
        add     esp,36
        pop     ebp
        ret
_test endp      

end
