
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword30,2
        cmp     dword30,3
        jle     label0000
; start of inline function f
        mov     dword23,dword30
        add     dword23,3
; end of inline function f
        mov     dword35,dword23
        jmp     label0001
label0000:
; start of inline function g
        mov     dword29,dword30
        sub     dword29,3
; end of inline function g
        mov     dword35,dword29
label0001:
        mov     dword17,dword35
        inc     dword17
        set_retval      dword17
        destroy_stack_frame
        ret
_test endp

end
