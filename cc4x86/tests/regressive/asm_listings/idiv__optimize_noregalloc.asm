
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword44,2
        mov     dword45,3
        mov     dword46,4
        mov     dword11,dword45
        cdq     dword12,dword11
        idiv    dword11,dword44
        mov     dword15,dword45
        cdq     dword16,dword15
        idiv    dword15,dword44
        imul    dword11,dword15
        mov     dword19,5
        cdq     dword20,dword19
        idiv    dword19,dword46
        mov     dword23,5
        cdq     dword24,dword23
        idiv    dword23,dword46
        imul    dword19,dword23
        add     dword11,dword19
        cmp     dword11,2
        je      label0000
        mov     dword28,1
        set_retval      dword28
        destroy_stack_frame
        ret
label0000:
        mov     dword31,dword46
        cdq     dword32,dword31
        idiv    dword31,dword44
        cmp     dword31,2
        je      label0001
        mov     dword35,2
        set_retval      dword35
        destroy_stack_frame
        ret
label0001:
        mov     dword38,5
        cdq     dword39,dword38
        idiv    dword38,dword45
        cmp     dword39,2
        je      label0002
        mov     dword42,3
        set_retval      dword42
        destroy_stack_frame
        ret
label0002:
        mov     dword43,0
        set_retval      dword43
        destroy_stack_frame
        ret
_test endp

end
