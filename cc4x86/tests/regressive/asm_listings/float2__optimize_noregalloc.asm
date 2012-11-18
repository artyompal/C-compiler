
.686
.model flat
.xmm

.data

___unnamed_float_0      dd      040000000h
public  ___unnamed_float_0
___unnamed_float_1      dd      03f800000h
public  ___unnamed_float_1
___unnamed_float_2      dd      040400000h
public  ___unnamed_float_2
___unnamed_float_3      dd      040800000h
public  ___unnamed_float_3

.code

_test proc
        create_stack_frame
; start of inline function test1
        movss   sse10,dword ptr [___unnamed_float_1]
        addss   sse10,dword ptr [___unnamed_float_0]
; end of inline function test1
        comiss  sse10,dword ptr [___unnamed_float_2]
        je      label0000
        mov     dword3,1
        set_retval      dword3
        destroy_stack_frame
        ret
label0000:
; start of inline function test2
        movss   sse15,dword ptr [___unnamed_float_0]
        addss   sse15,dword ptr [___unnamed_float_0]
; end of inline function test2
        comiss  sse15,dword ptr [___unnamed_float_3]
        je      label0001
        mov     dword6,2
        set_retval      dword6
        destroy_stack_frame
        ret
label0001:
        mov     dword7,0
        set_retval      dword7
        destroy_stack_frame
        ret
_test endp

end
