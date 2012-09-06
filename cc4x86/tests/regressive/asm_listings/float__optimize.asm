
.686
.model flat
.xmm

.data

___unnamed_float_0	dd	03a83126fh
public	___unnamed_float_0
___unnamed_float_1	dd	040000000h
public	___unnamed_float_1
___unnamed_double_2	dq	04008000000000000h
public	___unnamed_double_2
___unnamed_double_3	dq	04014000000000000h
public	___unnamed_double_3
___unnamed_double_4	dq	0bff0000000000000h
public	___unnamed_double_4
___unnamed_double_5	dq	04018000000000000h
public	___unnamed_double_5
___unnamed_double_6	dq	03fe54fdf3b645a1dh
public	___unnamed_double_6
___unnamed_double_7	dq	04010000000000000h
public	___unnamed_double_7
___unnamed_double_8	dq	04008000000000000h
public	___unnamed_double_8
___unnamed_double_9	dq	04018000000000000h
public	___unnamed_double_9
___unnamed_float_10	dd	040400000h
public	___unnamed_float_10
___unnamed_double_11	dq	04000000000000000h
public	___unnamed_double_11

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,80
	fld	dword ptr [___unnamed_float_1]
	fstp	dword ptr [ebp-4]
	fld	qword ptr [___unnamed_double_2]
	fstp	qword ptr [ebp-12]
	fld	dword ptr [ebp-4]
	fadd	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
; start of inline function eq
	fld	qword ptr [___unnamed_double_3]
	fstp	qword ptr [ebp-28]
	fld	qword ptr [ebp-20]
	fstp	qword ptr [ebp-36]
; start of inline function fabs
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
	fldz
	fld	dword ptr [ebp-40]
	fucomip	st,st(1)
	fstp	st
	jb	label0008
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-44]
	jmp	label0009
label0008:
	fld	dword ptr [ebp-40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-44]
label0009:
	fld	dword ptr [ebp-44]
	fstp	dword ptr [ebp-48]
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
; end of inline function eq
	cmp	eax,0
	jne	label0000
	mov	eax,1
	add	esp,80
	pop	ebp
	ret
label0000:
	fld	dword ptr [ebp-4]
	fsub	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
; start of inline function eq
	fld	qword ptr [___unnamed_double_4]
	fstp	qword ptr [ebp-28]
	fld	qword ptr [ebp-20]
	fstp	qword ptr [ebp-36]
; start of inline function fabs
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
	fldz
	fld	dword ptr [ebp-40]
	fucomip	st,st(1)
	fstp	st
	jb	label000c
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-44]
	jmp	label000d
label000c:
	fld	dword ptr [ebp-40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-44]
label000d:
	fld	dword ptr [ebp-44]
	fstp	dword ptr [ebp-48]
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-56],eax
; end of inline function eq
	cmp	eax,0
	jne	label0001
	mov	eax,2
	add	esp,80
	pop	ebp
	ret
label0001:
	fld	dword ptr [ebp-4]
	fmul	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
; start of inline function eq
	fld	qword ptr [___unnamed_double_5]
	fstp	qword ptr [ebp-28]
	fld	qword ptr [ebp-20]
	fstp	qword ptr [ebp-36]
; start of inline function fabs
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
	fldz
	fld	dword ptr [ebp-40]
	fucomip	st,st(1)
	fstp	st
	jb	label0010
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-44]
	jmp	label0011
label0010:
	fld	dword ptr [ebp-40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-44]
label0011:
	fld	dword ptr [ebp-44]
	fstp	dword ptr [ebp-48]
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-60],eax
; end of inline function eq
	cmp	eax,0
	jne	label0002
	mov	eax,3
	add	esp,80
	pop	ebp
	ret
label0002:
	fld	dword ptr [ebp-4]
	fdiv	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
; start of inline function eq
	fld	qword ptr [___unnamed_double_6]
	fstp	qword ptr [ebp-28]
	fld	qword ptr [ebp-20]
	fstp	qword ptr [ebp-36]
; start of inline function fabs
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
	fldz
	fld	dword ptr [ebp-40]
	fucomip	st,st(1)
	fstp	st
	jb	label0014
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-44]
	jmp	label0015
label0014:
	fld	dword ptr [ebp-40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-44]
label0015:
	fld	dword ptr [ebp-44]
	fstp	dword ptr [ebp-48]
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-64],eax
; end of inline function eq
	cmp	eax,0
	jne	label0003
	mov	eax,4
	add	esp,80
	pop	ebp
	ret
label0003:
	fld	dword ptr [___unnamed_float_1]
	fld	dword ptr [ebp-4]
	faddp
	fstp	dword ptr [ebp-4]
; start of inline function eq
	fld	qword ptr [___unnamed_double_7]
	fstp	qword ptr [ebp-28]
	fld	dword ptr [ebp-4]
	fstp	qword ptr [ebp-36]
; start of inline function fabs
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
	fldz
	fld	dword ptr [ebp-40]
	fucomip	st,st(1)
	fstp	st
	jb	label0018
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-44]
	jmp	label0019
label0018:
	fld	dword ptr [ebp-40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-44]
label0019:
	fld	dword ptr [ebp-44]
	fstp	dword ptr [ebp-48]
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-68],eax
; end of inline function eq
	cmp	eax,0
	jne	label0004
	mov	eax,5
	add	esp,80
	pop	ebp
	ret
label0004:
	fld1
	fld	dword ptr [ebp-4]
	fsubrp
	fstp	dword ptr [ebp-4]
; start of inline function eq
	fld	qword ptr [___unnamed_double_8]
	fstp	qword ptr [ebp-28]
	fld	dword ptr [ebp-4]
	fstp	qword ptr [ebp-36]
; start of inline function fabs
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
	fldz
	fld	dword ptr [ebp-40]
	fucomip	st,st(1)
	fstp	st
	jb	label001c
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-44]
	jmp	label001d
label001c:
	fld	dword ptr [ebp-40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-44]
label001d:
	fld	dword ptr [ebp-44]
	fstp	dword ptr [ebp-48]
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-72],eax
; end of inline function eq
	cmp	eax,0
	jne	label0005
	mov	eax,6
	add	esp,80
	pop	ebp
	ret
label0005:
	fld	dword ptr [___unnamed_float_1]
	fld	dword ptr [ebp-4]
	fmulp
	fstp	dword ptr [ebp-4]
; start of inline function eq
	fld	qword ptr [___unnamed_double_9]
	fstp	qword ptr [ebp-28]
	fld	dword ptr [ebp-4]
	fstp	qword ptr [ebp-36]
; start of inline function fabs
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
	fldz
	fld	dword ptr [ebp-40]
	fucomip	st,st(1)
	fstp	st
	jb	label0020
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-44]
	jmp	label0021
label0020:
	fld	dword ptr [ebp-40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-44]
label0021:
	fld	dword ptr [ebp-44]
	fstp	dword ptr [ebp-48]
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-76],eax
; end of inline function eq
	cmp	eax,0
	jne	label0006
	mov	eax,7
	add	esp,80
	pop	ebp
	ret
label0006:
	fld	dword ptr [___unnamed_float_10]
	fld	dword ptr [ebp-4]
	fdivrp
	fstp	dword ptr [ebp-4]
; start of inline function eq
	fld	qword ptr [___unnamed_double_11]
	fstp	qword ptr [ebp-28]
	fld	dword ptr [ebp-4]
	fstp	qword ptr [ebp-36]
; start of inline function fabs
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
	fldz
	fld	dword ptr [ebp-40]
	fucomip	st,st(1)
	fstp	st
	jb	label0024
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-44]
	jmp	label0025
label0024:
	fld	dword ptr [ebp-40]
	fldz
	fsubrp
	fstp	dword ptr [ebp-44]
label0025:
	fld	dword ptr [ebp-44]
	fstp	dword ptr [ebp-48]
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-80],eax
; end of inline function eq
	cmp	eax,0
	jne	label0007
	mov	eax,8
	add	esp,80
	pop	ebp
	ret
label0007:
	mov	eax,0
	add	esp,80
	pop	ebp
	ret
_test endp	

end
