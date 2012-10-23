
.686
.model flat
.xmm

.code

_test_case proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        push    edi
        mov     edi,3
        cmp     edi,1
        mov     [ebp-12],edi
        je      label0001
        mov     edi,[ebp-12]
        cmp     edi,2
        je      label0001
        mov     edi,[ebp-12]
        cmp     edi,3
        je      label0003
        jmp     label0004
label0001:
        mov     eax,-1
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0003:
        mov     eax,0
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0004:
        mov     eax,1
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test_case endp 

_test_case2 proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        push    edi
        mov     edi,3
        cmp     edi,0
        mov     [ebp-12],edi
        je      label0001
        mov     edi,[ebp-12]
        cmp     edi,1
        je      label0002
        mov     edi,[ebp-12]
        cmp     edi,2
        je      label0002
        mov     edi,[ebp-12]
        cmp     edi,3
        je      label0002
        jmp     label0005
label0001:
        mov     eax,-1
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0002:
        mov     eax,0
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0005:
        mov     eax,1
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test_case2 endp        

_test_default proc
        push    ebp
        mov     ebp,esp
        sub     esp,12
        push    edi
        mov     edi,100
        cmp     edi,1
        mov     [ebp-12],edi
        je      label0001
        mov     edi,[ebp-12]
        cmp     edi,2
        je      label0001
        jmp     label0003
label0001:
        mov     eax,-1
        pop     edi
        add     esp,12
        pop     ebp
        ret
label0003:
        mov     eax,0
        pop     edi
        add     esp,12
        pop     ebp
        ret
_test_default endp      

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,60
        push    edi
; start of inline function test_case
        mov     edi,3
        cmp     edi,1
        mov     [ebp-40],edi
        je      label0004
        mov     edi,[ebp-40]
        cmp     edi,2
        je      label0004
        mov     edi,[ebp-40]
        cmp     edi,3
        je      label0006
        jmp     label0007
label0004:
        mov     edi,-1
        mov     [ebp-44],edi
        jmp     label0008
label0006:
        mov     edi,0
        mov     [ebp-44],edi
        jmp     label0008
label0007:
        mov     edi,1
        mov     [ebp-44],edi
        jmp     label0008
label0008:
; end of inline function test_case
        mov     edi,[ebp-44]
        cmp     edi,0
        je      label0000
        mov     eax,1
        pop     edi
        add     esp,60
        pop     ebp
        ret
label0000:
; start of inline function test_case2
        mov     edi,3
        cmp     edi,0
        mov     [ebp-48],edi
        je      label000a
        mov     edi,[ebp-48]
        cmp     edi,1
        je      label000b
        mov     edi,[ebp-48]
        cmp     edi,2
        je      label000b
        mov     edi,[ebp-48]
        cmp     edi,3
        je      label000b
        jmp     label000e
label000a:
        mov     edi,-1
        mov     [ebp-52],edi
        jmp     label000f
label000b:
        mov     edi,0
        mov     [ebp-52],edi
        jmp     label000f
label000e:
        mov     edi,1
        mov     [ebp-52],edi
        jmp     label000f
label000f:
; end of inline function test_case2
        mov     edi,[ebp-52]
        cmp     edi,0
        je      label0001
        mov     eax,1
        pop     edi
        add     esp,60
        pop     ebp
        ret
label0001:
; start of inline function test_default
        mov     edi,100
        cmp     edi,1
        mov     [ebp-56],edi
        je      label0011
        mov     edi,[ebp-56]
        cmp     edi,2
        je      label0011
        jmp     label0013
label0011:
        mov     edi,-1
        mov     [ebp-60],edi
        jmp     label0016
label0013:
        mov     edi,0
        mov     [ebp-60],edi
        jmp     label0016
label0016:
; end of inline function test_default
        mov     edi,[ebp-60]
        cmp     edi,0
        je      label0002
        mov     eax,1
        pop     edi
        add     esp,60
        pop     ebp
        ret
label0002:
        mov     eax,0
        pop     edi
        add     esp,60
        pop     ebp
        ret
_test endp      

end
