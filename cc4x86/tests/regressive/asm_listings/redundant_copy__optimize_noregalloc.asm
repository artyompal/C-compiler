
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
; start of inline function test1
        mov     dword30,256
        imul    dword30,512
        sub     dword30,131072
; end of inline function test1
        cmp     dword30,0
        je      label0000
        mov     dword5,1
        set_retval      dword5
        destroy_stack_frame
        ret
label0000:
; start of inline function test2
        mov     dword41,555
        add     dword41,666
        sub     dword41,1221
; end of inline function test2
        cmp     dword41,0
        je      label0001
        mov     dword10,2
        set_retval      dword10
        destroy_stack_frame
        ret
label0001:
; start of inline function test3
        mov     dword102,444
        mov     dword104,222
        mov     dword105,dword104
        cmp     dword102,0
        jle     label0007
        mov     dword104,111
        jmp     label0008
label0007:
        mov     dword105,dword102
label0008:
        mov     dword59,dword105
        add     dword59,dword104
        add     dword59,111
        sub     dword59,dword102
; end of inline function test3
        cmp     dword59,0
        je      label0002
        mov     dword15,3
        set_retval      dword15
        destroy_stack_frame
        ret
label0002:
; start of inline function test4
        mov     dword110,5
        inc     dword110
        mov     dword72,dword110
        add     dword72,4
        sub     dword72,10
; end of inline function test4
        cmp     dword72,0
        je      label0003
        mov     dword20,4
        set_retval      dword20
        destroy_stack_frame
        ret
label0003:
; start of inline function test5
        mov     dword113,888
        cmp     dword113,0
        jle     label000b
        mov     dword116,444
        jmp     label000c
label000b:
        mov     dword116,222
label000c:
        mov     dword90,dword116
        add     dword90,444
        sub     dword90,dword113
; end of inline function test5
        cmp     dword90,0
        je      label0004
        mov     dword25,3
        set_retval      dword25
        destroy_stack_frame
        ret
label0004:
        mov     dword26,0
        set_retval      dword26
        destroy_stack_frame
        ret
_test endp

end
