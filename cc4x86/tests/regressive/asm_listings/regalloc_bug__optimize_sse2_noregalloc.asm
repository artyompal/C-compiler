
.686
.model flat
.xmm

.code

_test proc
	create_stack_frame
	mov	dword31,2
	cmp	dword31,3
	jle	label0000
; start of inline function f
	mov	dword34,dword31
	lea	dword36,[dword34+3]
; end of inline function f
	mov	dword33,dword36
	jmp	label0001
label0000:
; start of inline function g
	mov	dword37,dword31
	lea	dword39,[dword37-3]
; end of inline function g
	mov	dword33,dword39
label0001:
	mov	dword17,1
	add	dword17,dword33
	set_retval	dword17
	destroy_stack_frame
	ret
_test endp	

end
