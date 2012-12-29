
.686
.model flat
.xmm

.code

_memset proc
        create_stack_frame
        mov     dword11,[ebp+13]
        mov     dword9,[ebp+8]
        mov     dword10,dword9
label0000:
        mov     dword5,dword11
        dec     dword11
        cmp     dword5,0
        je      label0001
        mov     dword7,dword10
        inc     dword10
        mov     byte1,[ebp+12]
        mov     [dword7],byte1
        jmp     label0000
label0001:
        destroy_stack_frame
        ret
_memset endp

_test proc
        create_stack_frame
; start of inline function memset
        mov     dword ptr [ebp-8],2
        mov     dword ptr [ebp-4],3
        mov     dword ptr [ebp-12],1
        lea     dword11,[ebp-12]
        mov     dword29,dword11
label0000:
        mov     dword19,dword30
        dec     dword30
        cmp     dword19,0
        je      label0001
        mov     dword21,dword29
        inc     dword29
        mov     dword ptr [ebp-20],0
        mov     byte2,[ebp-20]
        mov     [dword21],byte2
        jmp     label0000
label0001:
; end of inline function memset
        set_retval      2
        destroy_stack_frame
        ret
_test endp

end
