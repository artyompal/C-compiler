
.686
.model flat
.xmm

.code

_test proc
        create_stack_frame
        mov     dword45,2
        mov     dword46,3
        mov     dword47,4
        mov     dword48,5
        mov     dword49,3
        cdq     dword12,dword49
        idiv    dword49,dword45
        mov     dword15,3
        cdq     dword16,dword15
        idiv    dword15,dword45
        imul    dword49,dword15
        mov     dword19,dword48
        cdq     dword20,dword19
        idiv    dword19,dword47
        mov     dword23,dword48
        cdq     dword24,dword23
        idiv    dword23,dword47
        imul    dword19,dword23
        add     dword49,dword19
        cmp     dword49,2
        je      label0000
        mov     dword28,1
        set_retval      dword28
        destroy_stack_frame
        ret
label0000:
        cdq     dword32,dword47
        idiv    dword47,dword45
        cmp     dword47,2
        je      label0001
        mov     dword35,2
        set_retval      dword35
        destroy_stack_frame
        ret
label0001:
        mov     dword38,dword48
        cdq     dword39,dword38
        idiv    dword38,dword46
        mov     dword48,dword39
        cmp     dword48,2
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
