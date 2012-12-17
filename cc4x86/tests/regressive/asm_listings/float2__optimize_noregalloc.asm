
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
        movss   float1,dword ptr [___unnamed_float_1]
        movss   float9,dword ptr [___unnamed_float_0]
        movss   float10,float1
        addss   float10,float9
; end of inline function test1
        movss   float3,dword ptr [___unnamed_float_2]
        comiss  float10,float3
        je      label0000
        mov     dword3,1
        set_retval      dword3
        destroy_stack_frame
        ret
label0000:
; start of inline function test2
        movss   float4,dword ptr [___unnamed_float_0]
        movss   float14,dword ptr [___unnamed_float_0]
        movss   float15,float4
        addss   float15,float14
; end of inline function test2
        movss   float6,dword ptr [___unnamed_float_3]
        comiss  float15,float6
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
