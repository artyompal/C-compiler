
.686
.model flat
.xmm

.code

_test_case proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        mov     edi,3
        cmp     edi,1
        je      label0001
        cmp     edi,2
        je      label0002
        cmp     edi,3
        je      label0003
        jmp     label0004
label0001:
label0002:
        mov     edi,-1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0003:
        mov     edi,0
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0004:
        mov     edi,1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_test_case endp 

_test_case2 proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        mov     edi,3
        cmp     edi,0
        je      label0001
        cmp     edi,1
        je      label0002
        cmp     edi,2
        je      label0003
        cmp     edi,3
        je      label0004
        jmp     label0005
label0001:
        mov     edi,-1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0002:
label0003:
label0004:
        mov     edi,0
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0005:
        mov     edi,1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_test_case2 endp        

_test_default proc
        push    ebp
        mov     ebp,esp
        sub     esp,8
        push    edi
        mov     edi,100
        cmp     edi,1
        je      label0001
        cmp     edi,2
        je      label0002
        jmp     label0003
label0001:
label0002:
        mov     edi,-1
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
label0003:
        mov     edi,0
        mov     eax,edi
        pop     edi
        add     esp,8
        pop     ebp
        ret
_test_default endp      

_test proc
        push    ebp
        mov     ebp,esp
        sub     esp,36
        push    edi
; start of inline function test_case
        mov     edi,3
        cmp     edi,1
        je      label0004
        cmp     edi,2
        je      label0005
        cmp     edi,3
        je      label0006
        jmp     label0007
label0004:
label0005:
        mov     edi,-1
        jmp     label0008
label0006:
        mov     edi,0
        jmp     label0008
label0007:
        mov     edi,1
        jmp     label0008
label0008:
; end of inline function test_case
        cmp     edi,0
        je      label0000
        mov     edi,1
        mov     eax,edi
        pop     edi
        add     esp,36
        pop     ebp
        ret
label0000:
; start of inline function test_case2
        mov     edi,3
        cmp     edi,0
        je      label000a
        cmp     edi,1
        je      label000b
        cmp     edi,2
        je      label000c
        cmp     edi,3
        je      label000d
        jmp     label000e
label000a:
        mov     edi,-1
        jmp     label000f
label000b:
label000c:
label000d:
        mov     edi,0
        jmp     label000f
label000e:
        mov     edi,1
        jmp     label000f
label000f:
; end of inline function test_case2
        cmp     edi,0
        je      label0001
        mov     edi,1
        mov     eax,edi
        pop     edi
        add     esp,36
        pop     ebp
        ret
label0001:
; start of inline function test_default
        mov     edi,100
        cmp     edi,1
        je      label0011
        cmp     edi,2
        je      label0012
        jmp     label0013
label0011:
label0012:
        mov     edi,-1
        jmp     label0016
label0013:
        mov     edi,0
        jmp     label0016
label0016:
; end of inline function test_default
        cmp     edi,0
        je      label0002
        mov     edi,1
        mov     eax,edi
        pop     edi
        add     esp,36
        pop     ebp
        ret
label0002:
        mov     edi,0
        mov     eax,edi
        pop     edi
        add     esp,36
        pop     ebp
        ret
_test endp      

end
