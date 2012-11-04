
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword7,2
        cmp     dword7,3
        jle     label0000
; start of inline function f
        mov     dword23,2
        add     dword23,3
        mov     dword36,dword23
; end of inline function f
        mov     dword10,dword36
        mov     dword33,dword10
        jmp     label0001
label0000:
; start of inline function g
        mov     dword29,2
        sub     dword29,3
        mov     dword39,dword29
; end of inline function g
        mov     dword14,dword39
        mov     dword33,dword14
label0001:
        mov     dword17,1
        add     dword17,dword33
        set_retval      dword17
        destroy_stack_frame
        ret
_test endp

end
