
.686
.model flat
.xmm

.code

_memset proc
        push    ebp
        mov     ebp,esp
        sub     esp,4
        mov     eax,[ebp+13]
        mov     ecx,[ebp+8]
label0000:
        mov     edx,eax
        dec     eax
        cmp     edx,0
        je      label0001
        mov     edx,ecx
        inc     ecx
        mov     byte1,[ebp+12]
        mov     [edx],byte1
        jmp     label0000
label0001:
        mov     esp,ebp
        pop     ebp
        ret
_memset endp

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,28
; start of inline function memset
        mov     dword ptr [ebp-8],2
        mov     dword ptr [ebp-4],3
        mov     dword ptr [ebp-12],1
        lea     eax,[ebp-12]
label0000:
        mov     ecx,edx
        dec     edx
        cmp     ecx,0
        je      label0001
        mov     ecx,eax
        inc     eax
        mov     dword ptr [ebp-20],0
        mov     byte2,[ebp-20]
        mov     [ecx],byte2
        mov     [ebp-19],edx
        jmp     label0000
label0001:
; end of inline function memset
        mov     eax,2
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
