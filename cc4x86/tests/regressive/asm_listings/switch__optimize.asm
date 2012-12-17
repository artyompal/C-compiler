
.686
.model flat
.xmm

.code

_test_case proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,3
        cmp     eax,1
        je      label0001
        cmp     eax,2
        je      label0002
        cmp     eax,3
        je      label0003
        jmp     label0004
label0001:
label0002:
        mov     eax,-1
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
label0004:
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
_test_case endp

_test_case2 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,3
        cmp     eax,0
        je      label0001
        cmp     eax,1
        je      label0002
        cmp     eax,2
        je      label0003
        cmp     eax,3
        je      label0004
        jmp     label0005
label0001:
        mov     eax,-1
        mov     esp,ebp
        pop     ebp
        ret
label0002:
label0003:
label0004:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
label0005:
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
_test_case2 endp

_test_default proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        mov     eax,100
        cmp     eax,1
        je      label0001
        cmp     eax,2
        je      label0002
        jmp     label0003
label0001:
label0002:
        mov     eax,-1
        mov     esp,ebp
        pop     ebp
        ret
label0003:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test_default endp

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,36
; start of inline function test_case
        mov     eax,3
        cmp     eax,1
        je      label0004
        cmp     eax,2
        je      label0005
        cmp     eax,3
        je      label0006
        jmp     label0007
label0004:
label0005:
        mov     eax,-1
        jmp     label0008
label0006:
        mov     eax,0
        jmp     label0008
label0007:
        mov     eax,1
        jmp     label0008
label0008:
; end of inline function test_case
        cmp     eax,0
        je      label0000
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0000:
; start of inline function test_case2
        mov     eax,3
        cmp     eax,0
        je      label000a
        cmp     eax,1
        je      label000b
        cmp     eax,2
        je      label000c
        cmp     eax,3
        je      label000d
        jmp     label000e
label000a:
        mov     eax,-1
        jmp     label000f
label000b:
label000c:
label000d:
        mov     eax,0
        jmp     label000f
label000e:
        mov     eax,1
        jmp     label000f
label000f:
; end of inline function test_case2
        cmp     eax,0
        je      label0001
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0001:
; start of inline function test_default
        mov     eax,100
        cmp     eax,1
        je      label0011
        cmp     eax,2
        je      label0012
        jmp     label0013
label0011:
label0012:
        mov     eax,-1
        jmp     label0016
label0013:
        mov     eax,0
        jmp     label0016
label0016:
; end of inline function test_default
        cmp     eax,0
        je      label0002
        mov     eax,1
        mov     esp,ebp
        pop     ebp
        ret
label0002:
        mov     eax,0
        mov     esp,ebp
        pop     ebp
        ret
_test endp

end
