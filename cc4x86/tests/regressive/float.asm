
.686
.model flat

.data

___unnamed_float_0	dd	0.001000
public	___unnamed_float_0
___unnamed_float_1	dd	2.000000
public	___unnamed_float_1
___unnamed_double_2	dq	3.000000
public	___unnamed_double_2
___unnamed_double_3	dq	5.000000
public	___unnamed_double_3
___unnamed_double_4	dq	-1.000000
public	___unnamed_double_4
___unnamed_double_5	dq	6.000000
public	___unnamed_double_5
___unnamed_double_6	dq	0.666000
public	___unnamed_double_6
___unnamed_double_7	dq	4.000000
public	___unnamed_double_7
___unnamed_float_8	dd	3.000000
public	___unnamed_float_8
___unnamed_double_9	dq	2.000000
public	___unnamed_double_9

.code

_test proc
	push	ebp
	mov	ebp,esp
	sub	esp,52
	fld	dword ptr [___unnamed_float_1]
	fstp	dword ptr [ebp-4]
	fld	qword ptr [___unnamed_double_2]
	fstp	qword ptr [ebp-12]
	fld	dword ptr [ebp-4]
	fadd	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
	fld	qword ptr [___unnamed_double_3]
	fstp	qword ptr [ebp-28]
	fld	qword ptr [ebp-20]
	fstp	qword ptr [ebp-36]
; start of inline function eq
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
; start of inline function fabs
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
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-48]
label000a:
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-52],eax
label000b:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0000
	mov	eax,1
	add	esp,52
	pop	ebp
	ret
label0000:
	fld	dword ptr [ebp-4]
	fsub	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
	fld	qword ptr [___unnamed_double_4]
	fstp	qword ptr [ebp-28]
	fld	qword ptr [ebp-20]
	fstp	qword ptr [ebp-36]
; start of inline function eq
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
; start of inline function fabs
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
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-48]
label000e:
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-52],eax
label000f:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0001
	mov	eax,2
	add	esp,52
	pop	ebp
	ret
label0001:
	fld	dword ptr [ebp-4]
	fmul	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
	fld	qword ptr [___unnamed_double_5]
	fstp	qword ptr [ebp-28]
	fld	qword ptr [ebp-20]
	fstp	qword ptr [ebp-36]
; start of inline function eq
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
; start of inline function fabs
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
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-48]
label0012:
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-52],eax
label0013:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0002
	mov	eax,3
	add	esp,52
	pop	ebp
	ret
label0002:
	fld	dword ptr [ebp-4]
	fdiv	qword ptr [ebp-12]
	fstp	qword ptr [ebp-20]
	fld	qword ptr [___unnamed_double_6]
	fstp	qword ptr [ebp-28]
	fld	qword ptr [ebp-20]
	fstp	qword ptr [ebp-36]
; start of inline function eq
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
; start of inline function fabs
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
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-48]
label0016:
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-52],eax
label0017:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0003
	mov	eax,4
	add	esp,52
	pop	ebp
	ret
label0003:
	fld	dword ptr [___unnamed_float_1]
	fld	dword ptr [ebp-4]
	faddp
	fstp	dword ptr [ebp-4]
	fld	qword ptr [___unnamed_double_7]
	fstp	qword ptr [ebp-28]
	fld	dword ptr [ebp-4]
	fstp	qword ptr [ebp-36]
; start of inline function eq
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
; start of inline function fabs
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
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-48]
label001a:
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-52],eax
label001b:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0004
	mov	eax,5
	add	esp,52
	pop	ebp
	ret
label0004:
	fld1
	fld	dword ptr [ebp-4]
	fsubrp
	fstp	dword ptr [ebp-4]
	fld	qword ptr [___unnamed_double_2]
	fstp	qword ptr [ebp-28]
	fld	dword ptr [ebp-4]
	fstp	qword ptr [ebp-36]
; start of inline function eq
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
; start of inline function fabs
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
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-48]
label001e:
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-52],eax
label001f:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0005
	mov	eax,6
	add	esp,52
	pop	ebp
	ret
label0005:
	fld	dword ptr [___unnamed_float_1]
	fld	dword ptr [ebp-4]
	fmulp
	fstp	dword ptr [ebp-4]
	fld	qword ptr [___unnamed_double_5]
	fstp	qword ptr [ebp-28]
	fld	dword ptr [ebp-4]
	fstp	qword ptr [ebp-36]
; start of inline function eq
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
; start of inline function fabs
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
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-48]
label0022:
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-52],eax
label0023:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0006
	mov	eax,7
	add	esp,52
	pop	ebp
	ret
label0006:
	fld	dword ptr [___unnamed_float_8]
	fld	dword ptr [ebp-4]
	fdivrp
	fstp	dword ptr [ebp-4]
	fld	qword ptr [___unnamed_double_9]
	fstp	qword ptr [ebp-28]
	fld	dword ptr [ebp-4]
	fstp	qword ptr [ebp-36]
; start of inline function eq
	fld	qword ptr [ebp-36]
	fsub	qword ptr [ebp-28]
	fstp	dword ptr [ebp-40]
; start of inline function fabs
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
	fld	dword ptr [ebp-40]
	fstp	dword ptr [ebp-48]
label0026:
; end of inline function fabs
	fld	dword ptr [ebp-48]
	fld	dword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	al
	movzx	eax,al
	mov	[ebp-52],eax
label0027:
; end of inline function eq
	mov	eax,[ebp-52]
	cmp	eax,0
	jne	label0007
	mov	eax,8
	add	esp,52
	pop	ebp
	ret
label0007:
	mov	eax,0
	add	esp,52
	pop	ebp
	ret
_test endp	

end
