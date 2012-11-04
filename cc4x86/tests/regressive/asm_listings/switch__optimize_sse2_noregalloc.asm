
.686
.model flat
.xmm

.code

_test_case proc
        create_stack_frame
        mov     dword17,3
        cmp     dword17,1
        je      label0001
        cmp     dword17,2
        je      label0002
        cmp     dword17,3
        je      label0003
        jmp     label0004
label0001:
label0002:
        mov     dword12,-1
        set_retval      dword12
        destroy_stack_frame
        ret
label0003:
        mov     dword13,0
        set_retval      dword13
        destroy_stack_frame
        ret
label0004:
        mov     dword14,1
        set_retval      dword14
        destroy_stack_frame
        ret
_test_case endp

_test_case2 proc
        create_stack_frame
        mov     dword19,3
        cmp     dword19,0
        je      label0001
        cmp     dword19,1
        je      label0002
        cmp     dword19,2
        je      label0003
        cmp     dword19,3
        je      label0004
        jmp     label0005
label0001:
        mov     dword14,-1
        set_retval      dword14
        destroy_stack_frame
        ret
label0002:
label0003:
label0004:
        mov     dword15,0
        set_retval      dword15
        destroy_stack_frame
        ret
label0005:
        mov     dword16,1
        set_retval      dword16
        destroy_stack_frame
        ret
_test_case2 endp

_test_default proc
        create_stack_frame
        mov     dword19,100
        cmp     dword19,1
        je      label0001
        cmp     dword19,2
        je      label0002
        jmp     label0003
label0001:
label0002:
        mov     dword14,-1
        set_retval      dword14
        destroy_stack_frame
        ret
label0003:
        mov     dword15,0
        set_retval      dword15
        destroy_stack_frame
        ret
_test_default endp

_test proc
        create_stack_frame
; start of inline function test_case
        mov     dword62,3
        cmp     dword62,1
        je      label0004
        cmp     dword62,2
        je      label0005
        cmp     dword62,3
        je      label0006
        jmp     label0007
label0004:
label0005:
        mov     dword63,-1
        jmp     label0008
label0006:
        mov     dword63,0
        jmp     label0008
label0007:
        mov     dword63,1
        jmp     label0008
label0008:
; end of inline function test_case
        mov     dword1,dword63
        cmp     dword1,0
        je      label0000
        mov     dword3,1
        set_retval      dword3
        destroy_stack_frame
        ret
label0000:
; start of inline function test_case2
        mov     dword65,3
        cmp     dword65,0
        je      label000a
        cmp     dword65,1
        je      label000b
        cmp     dword65,2
        je      label000c
        cmp     dword65,3
        je      label000d
        jmp     label000e
label000a:
        mov     dword66,-1
        jmp     label000f
label000b:
label000c:
label000d:
        mov     dword66,0
        jmp     label000f
label000e:
        mov     dword66,1
        jmp     label000f
label000f:
; end of inline function test_case2
        mov     dword4,dword66
        cmp     dword4,0
        je      label0001
        mov     dword6,1
        set_retval      dword6
        destroy_stack_frame
        ret
label0001:
; start of inline function test_default
        mov     dword68,100
        cmp     dword68,1
        je      label0011
        cmp     dword68,2
        je      label0012
        jmp     label0013
label0011:
label0012:
        mov     dword69,-1
        jmp     label0016
label0013:
        mov     dword69,0
        jmp     label0016
label0016:
; end of inline function test_default
        mov     dword7,dword69
        cmp     dword7,0
        je      label0002
        mov     dword9,1
        set_retval      dword9
        destroy_stack_frame
        ret
label0002:
        mov     dword10,0
        set_retval      dword10
        destroy_stack_frame
        ret
_test endp

end
