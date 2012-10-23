
.686
.model flat
.xmm

.code

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,48
        push    edi
        push    esi
        mov     edi,2
        cmp     edi,3
        mov     [ebp-40],edi
        jle     label0000
; start of inline function f
        mov     esi,[ebp-40]
        mov     edi,esi
        lea     edi,[edi+3]
; end of inline function f
        mov     [ebp-44],edi
        jmp     label0001
label0000:
; start of inline function g
        mov     esi,[ebp-40]
        mov     edi,esi
        lea     edi,[edi-3]
; end of inline function g
        mov     [ebp-48],edi
        mov     esi,[ebp-48]
        mov     edi,esi
        mov     [ebp-44],edi
label0001:
        mov     eax,1
        mov     edi,[ebp-44]
        add     eax,edi
        pop     esi
        pop     edi
        add     esp,48
        pop     ebp
        ret
_test endp      

end
