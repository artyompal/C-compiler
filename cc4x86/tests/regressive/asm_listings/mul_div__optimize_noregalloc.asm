
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword95,2
        mov     dword96,3
        mov     dword97,4
        mov     dword11,dword96
        xor_edx_edx     dword12
        div     dword11,dword95,dword12
        mov     dword15,dword96
        xor_edx_edx     dword16
        div     dword15,dword95,dword16
        mul     dword11,dword15,dword17
        mov     dword20,5
        xor_edx_edx     dword21
        div     dword20,dword97,dword21
        mov     dword24,5
        xor_edx_edx     dword25
        div     dword24,dword97,dword25
        mul     dword20,dword24,dword26
        add     dword11,dword20
        cmp     dword11,2
        je      label0000
        mov     dword30,1
        set_retval      dword30
        destroy_stack_frame
        ret
label0000:
        mov     dword33,dword97
        xor_edx_edx     dword34
        div     dword33,dword95,dword34
        cmp     dword33,2
        je      label0001
        mov     dword37,2
        set_retval      dword37
        destroy_stack_frame
        ret
label0001:
        mov     dword40,5
        xor_edx_edx     dword41
        div     dword40,dword96,dword41
        cmp     dword41,2
        je      label0002
        mov     dword44,3
        set_retval      dword44
        destroy_stack_frame
        ret
label0002:
        mov     dword47,dword95
        mul     dword47,dword96,dword48
        cmp     dword47,6
        je      label0003
        mov     dword52,4
        set_retval      dword52
        destroy_stack_frame
        ret
label0003:
        mov     dword58,dword95
        mul     dword58,dword96,dword59
        cmp     dword58,6
        je      label0004
        mov     dword62,5
        set_retval      dword62
        destroy_stack_frame
        ret
label0004:
        mov     dword96,65536
        mov     dword69,65536
        mul     dword69,dword96,dword70
        cmp     dword69,0
        je      label0005
        mov     dword72,6
        set_retval      dword72
        destroy_stack_frame
        ret
label0005:
        mov     dword95,2
        mov     dword83,3
        xor_edx_edx     dword84
        div     dword83,dword95,dword84
        mov     dword87,4
        xor_edx_edx     dword88
        div     dword87,dword95,dword88
        mul     dword83,dword87,dword89
        cmp     dword83,2
        je      label0006
        mov     dword93,7
        set_retval      dword93
        destroy_stack_frame
        ret
label0006:
        mov     dword94,0
        set_retval      dword94
        destroy_stack_frame
        ret
_test endp

end
