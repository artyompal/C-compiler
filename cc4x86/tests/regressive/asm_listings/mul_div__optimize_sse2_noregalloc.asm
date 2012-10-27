
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword90,2
        mov     dword91,3
        mov     dword92,4
        mov     dword93,5
        mov     dword11,dword91
        xor_edx_edx     dword12
        div     dword11,dword90
        mov     dword15,dword91
        xor_edx_edx     dword16
        div     dword15,dword90
        mul     dword11,dword15
        mov     dword19,dword93
        xor_edx_edx     dword20
        div     dword19,dword92
        mov     dword23,dword93
        xor_edx_edx     dword24
        div     dword23,dword92
        mul     dword19,dword23
        add     dword11,dword19
        mov     dword94,dword11
        cmp     dword94,2
        je      label0000
        mov     dword28,1
        set_retval      dword28
        destroy_stack_frame
        ret
label0000:
        mov     dword31,dword92
        xor_edx_edx     dword32
        div     dword31,dword90
        mov     dword92,dword31
        cmp     dword92,2
        je      label0001
        mov     dword35,2
        set_retval      dword35
        destroy_stack_frame
        ret
label0001:
        mov     dword38,dword93
        xor_edx_edx     dword39
        div     dword38,dword91
        mov     dword93,dword39
        cmp     dword93,2
        je      label0002
        mov     dword42,3
        set_retval      dword42
        destroy_stack_frame
        ret
label0002:
        mov     dword45,dword90
        mul     dword45,dword91
        mov     dword92,dword45
        cmp     dword92,6
        je      label0003
        mov     dword49,4
        set_retval      dword49
        destroy_stack_frame
        ret
label0003:
        mov     dword52,dword90
        mov     dword93,dword52
        mov     dword55,dword93
        mul     dword55,dword91
        mov     dword93,dword55
        cmp     dword93,6
        je      label0004
        mov     dword58,5
        set_retval      dword58
        destroy_stack_frame
        ret
label0004:
        mov     dword90,65536
        mov     dword91,65536
        mov     dword65,dword90
        mul     dword65,dword91
        cmp     dword65,0
        je      label0005
        mov     dword67,6
        set_retval      dword67
        destroy_stack_frame
        ret
label0005:
        mov     dword90,2
        mov     dword91,3
        mov     dword92,4
        mov     dword93,5
        mov     dword78,dword91
        xor_edx_edx     dword79
        div     dword78,dword90
        mov     dword82,dword92
        xor_edx_edx     dword83
        div     dword82,dword90
        mul     dword78,dword82
        mov     dword94,dword78
        cmp     dword94,2
        je      label0006
        mov     dword87,7
        set_retval      dword87
        destroy_stack_frame
        ret
label0006:
        mov     dword88,0
        set_retval      dword88
        destroy_stack_frame
        ret
_test endp      

end
