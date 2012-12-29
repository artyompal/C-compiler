
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
        movss   float10,dword ptr [___unnamed_float_1]
        addss   float10,dword ptr [___unnamed_float_0]
; end of inline function test1
        comiss  float10,dword ptr [___unnamed_float_2]
        je      label0000
        set_retval      1
        destroy_stack_frame
        ret
label0000:
; start of inline function test2
        movss   float15,dword ptr [___unnamed_float_0]
        addss   float15,dword ptr [___unnamed_float_0]
; end of inline function test2
        comiss  float15,dword ptr [___unnamed_float_3]
        je      label0001
        set_retval      2
        destroy_stack_frame
        ret
label0001:
        set_retval      0
        destroy_stack_frame
        ret
_test endp

end
