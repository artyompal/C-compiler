
.686
.model flat

.data

__dbgprintf	dd	?
public	__dbgprintf
__width	dd	?
public	__width
__height	dd	?
public	__height
__pitch	dd	?
public	__pitch
__color	dd	?
public	__color
__videomem	dd	?
public	__videomem
__mvproj_matrix	db	 64 dup (?)
public	__mvproj_matrix
__viewport_matrix	db	 64 dup (?)
public	__viewport_matrix
__clip_z_near_base	db	 16 dup (?)
public	__clip_z_near_base
__clip_z_near_norm	db	 16 dup (?)
public	__clip_z_near_norm
__clip_z_far_base	db	 16 dup (?)
public	__clip_z_far_base
__clip_z_far_norm	db	 16 dup (?)
public	__clip_z_far_norm
__clip_plane_left_base	db	 16 dup (?)
public	__clip_plane_left_base
__clip_plane_left_norm	db	 16 dup (?)
public	__clip_plane_left_norm
__clip_plane_right_base	db	 16 dup (?)
public	__clip_plane_right_base
__clip_plane_right_norm	db	 16 dup (?)
public	__clip_plane_right_norm
__clip_plane_top_base	db	 16 dup (?)
public	__clip_plane_top_base
__clip_plane_top_norm	db	 16 dup (?)
public	__clip_plane_top_norm
__clip_plane_bottom_base	db	 16 dup (?)
public	__clip_plane_bottom_base
__clip_plane_bottom_norm	db	 16 dup (?)
public	__clip_plane_bottom_norm
__texture_data	dd	?
public	__texture_data
__texture_width	dd	?
public	__texture_width
__texture_height	dd	?
public	__texture_height

.code

_vec2f_add proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	mov	reg4,[reg3]
	lea	reg5,[ebp+16]
	mov	reg6,[reg5]
	fld	dword ptr [reg4]
	fadd	dword ptr [reg6]
	fstp	dword ptr [reg2]
	lea	reg7,[ebp+8]
	mov	reg8,4
	add	reg8,[reg7]
	lea	reg9,[ebp+12]
	mov	reg10,4
	add	reg10,[reg9]
	lea	reg11,[ebp+16]
	mov	reg12,4
	add	reg12,[reg11]
	fld	dword ptr [reg10]
	fadd	dword ptr [reg12]
	fstp	dword ptr [reg8]
	x86instr_destroy_stack_frame	0
	ret
_vec2f_add endp	

_vec2f_subtract proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	mov	reg4,[reg3]
	lea	reg5,[ebp+16]
	mov	reg6,[reg5]
	fld	dword ptr [reg4]
	fsub	dword ptr [reg6]
	fstp	dword ptr [reg2]
	lea	reg7,[ebp+8]
	mov	reg8,4
	add	reg8,[reg7]
	lea	reg9,[ebp+12]
	mov	reg10,4
	add	reg10,[reg9]
	lea	reg11,[ebp+16]
	mov	reg12,4
	add	reg12,[reg11]
	fld	dword ptr [reg10]
	fsub	dword ptr [reg12]
	fstp	dword ptr [reg8]
	x86instr_destroy_stack_frame	0
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	fld	dword ptr [reg2]
	fmul	dword ptr [reg3]
	fstp	dword ptr [reg2]
	lea	reg4,[ebp+8]
	mov	reg5,4
	add	reg5,[reg4]
	lea	reg6,[ebp+12]
	fld	dword ptr [reg5]
	fmul	dword ptr [reg6]
	fstp	dword ptr [reg5]
	x86instr_destroy_stack_frame	0
	ret
_vec2f_mul endp	

_vec4f_assign proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	fld	dword ptr [reg3]
	fstp	dword ptr [reg2]
	lea	reg4,[ebp+8]
	mov	reg5,4
	add	reg5,[reg4]
	lea	reg6,[ebp+16]
	fld	dword ptr [reg6]
	fstp	dword ptr [reg5]
	lea	reg7,[ebp+8]
	mov	reg8,8
	add	reg8,[reg7]
	lea	reg9,[ebp+20]
	fld	dword ptr [reg9]
	fstp	dword ptr [reg8]
	lea	reg10,[ebp+8]
	mov	reg11,12
	add	reg11,[reg10]
	lea	reg12,[ebp+24]
	fld	dword ptr [reg12]
	fstp	dword ptr [reg11]
	x86instr_destroy_stack_frame	0
	ret
_vec4f_assign endp	

_vec4f_add proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	mov	reg4,[reg3]
	lea	reg5,[ebp+16]
	mov	reg6,[reg5]
	fld	dword ptr [reg4]
	fadd	dword ptr [reg6]
	fstp	dword ptr [reg2]
	lea	reg7,[ebp+8]
	mov	reg8,4
	add	reg8,[reg7]
	lea	reg9,[ebp+12]
	mov	reg10,4
	add	reg10,[reg9]
	lea	reg11,[ebp+16]
	mov	reg12,4
	add	reg12,[reg11]
	fld	dword ptr [reg10]
	fadd	dword ptr [reg12]
	fstp	dword ptr [reg8]
	lea	reg13,[ebp+8]
	mov	reg14,8
	add	reg14,[reg13]
	lea	reg15,[ebp+12]
	mov	reg16,8
	add	reg16,[reg15]
	lea	reg17,[ebp+16]
	mov	reg18,8
	add	reg18,[reg17]
	fld	dword ptr [reg16]
	fadd	dword ptr [reg18]
	fstp	dword ptr [reg14]
	lea	reg19,[ebp+8]
	mov	reg20,12
	add	reg20,[reg19]
	lea	reg21,[ebp+12]
	mov	reg22,12
	add	reg22,[reg21]
	lea	reg23,[ebp+16]
	mov	reg24,12
	add	reg24,[reg23]
	fld	dword ptr [reg22]
	fadd	dword ptr [reg24]
	fstp	dword ptr [reg20]
	x86instr_destroy_stack_frame	0
	ret
_vec4f_add endp	

_vec4f_subtract proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	mov	reg4,[reg3]
	lea	reg5,[ebp+16]
	mov	reg6,[reg5]
	fld	dword ptr [reg4]
	fsub	dword ptr [reg6]
	fstp	dword ptr [reg2]
	lea	reg7,[ebp+8]
	mov	reg8,4
	add	reg8,[reg7]
	lea	reg9,[ebp+12]
	mov	reg10,4
	add	reg10,[reg9]
	lea	reg11,[ebp+16]
	mov	reg12,4
	add	reg12,[reg11]
	fld	dword ptr [reg10]
	fsub	dword ptr [reg12]
	fstp	dword ptr [reg8]
	lea	reg13,[ebp+8]
	mov	reg14,8
	add	reg14,[reg13]
	lea	reg15,[ebp+12]
	mov	reg16,8
	add	reg16,[reg15]
	lea	reg17,[ebp+16]
	mov	reg18,8
	add	reg18,[reg17]
	fld	dword ptr [reg16]
	fsub	dword ptr [reg18]
	fstp	dword ptr [reg14]
	lea	reg19,[ebp+8]
	mov	reg20,12
	add	reg20,[reg19]
	lea	reg21,[ebp+12]
	mov	reg22,12
	add	reg22,[reg21]
	lea	reg23,[ebp+16]
	mov	reg24,12
	add	reg24,[reg23]
	fld	dword ptr [reg22]
	fsub	dword ptr [reg24]
	fstp	dword ptr [reg20]
	x86instr_destroy_stack_frame	0
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	mov	reg4,[reg3]
	fld	dword ptr [reg2]
	fmul	dword ptr [reg4]
	lea	reg5,[ebp+8]
	mov	reg6,4
	add	reg6,[reg5]
	lea	reg7,[ebp+12]
	mov	reg8,4
	add	reg8,[reg7]
	fld	dword ptr [reg6]
	fmul	dword ptr [reg8]
	faddp
	lea	reg9,[ebp+8]
	mov	reg10,8
	add	reg10,[reg9]
	lea	reg11,[ebp+12]
	mov	reg12,8
	add	reg12,[reg11]
	fld	dword ptr [reg10]
	fmul	dword ptr [reg12]
	faddp
	lea	reg13,[ebp+8]
	mov	reg14,12
	add	reg14,[reg13]
	lea	reg15,[ebp+12]
	mov	reg16,12
	add	reg16,[reg15]
	fld	dword ptr [reg14]
	fmul	dword ptr [reg16]
	faddp
	x86instr_destroy_stack_frame	0
	ret
_vec4f_dot endp	

_vec4f_mul proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	fld	dword ptr [reg2]
	fmul	dword ptr [reg3]
	fstp	dword ptr [reg2]
	lea	reg4,[ebp+8]
	mov	reg5,4
	add	reg5,[reg4]
	lea	reg6,[ebp+12]
	fld	dword ptr [reg5]
	fmul	dword ptr [reg6]
	fstp	dword ptr [reg5]
	lea	reg7,[ebp+8]
	mov	reg8,8
	add	reg8,[reg7]
	lea	reg9,[ebp+12]
	fld	dword ptr [reg8]
	fmul	dword ptr [reg9]
	fstp	dword ptr [reg8]
	lea	reg10,[ebp+8]
	mov	reg11,12
	add	reg11,[reg10]
	lea	reg12,[ebp+12]
	fld	dword ptr [reg11]
	fmul	dword ptr [reg12]
	fstp	dword ptr [reg11]
	x86instr_destroy_stack_frame	0
	ret
_vec4f_mul endp	

.data

___unnamed_float_0	dd	0.000100
public	___unnamed_float_0

.code

_vec4f_is_equal proc
	x86instr_create_stack_frame	20
	x86instr_push_all
	lea	reg1,[ebp+12]
	push	dword ptr [reg1]
	lea	reg2,[ebp+8]
	push	dword ptr [reg2]
	lea	reg3,[ebp-16]
	push	reg3
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	lea	reg4,[ebp-20]
	x86instr_push_all
	lea	reg5,[ebp-16]
	push	reg5
	lea	reg6,[ebp-16]
	push	reg6
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	fstp	dword ptr [reg4]
	lea	reg7,[ebp-20]
	lea	reg8,[___unnamed_float_0]
	fld	dword ptr [reg8]
	fld	dword ptr [reg7]
	fucomip	st,st(1)
	fstp	st
	setb	al
	movzx	reg9,al
	mov	eax,reg9
	x86instr_destroy_stack_frame	20
	ret
_vec4f_is_equal endp	

_matrix4f_make_identity proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	fld1
	fstp	dword ptr [reg2]
	lea	reg3,[ebp+8]
	mov	reg4,4
	add	reg4,[reg3]
	fldz
	fstp	dword ptr [reg4]
	lea	reg5,[ebp+8]
	mov	reg6,8
	add	reg6,[reg5]
	fldz
	fstp	dword ptr [reg6]
	lea	reg7,[ebp+8]
	mov	reg8,12
	add	reg8,[reg7]
	fldz
	fstp	dword ptr [reg8]
	lea	reg9,[ebp+8]
	mov	reg10,16
	add	reg10,[reg9]
	fldz
	fstp	dword ptr [reg10]
	lea	reg11,[ebp+8]
	mov	reg12,20
	add	reg12,[reg11]
	fld1
	fstp	dword ptr [reg12]
	lea	reg13,[ebp+8]
	mov	reg14,24
	add	reg14,[reg13]
	fldz
	fstp	dword ptr [reg14]
	lea	reg15,[ebp+8]
	mov	reg16,28
	add	reg16,[reg15]
	fldz
	fstp	dword ptr [reg16]
	lea	reg17,[ebp+8]
	mov	reg18,32
	add	reg18,[reg17]
	fldz
	fstp	dword ptr [reg18]
	lea	reg19,[ebp+8]
	mov	reg20,36
	add	reg20,[reg19]
	fldz
	fstp	dword ptr [reg20]
	lea	reg21,[ebp+8]
	mov	reg22,40
	add	reg22,[reg21]
	fld1
	fstp	dword ptr [reg22]
	lea	reg23,[ebp+8]
	mov	reg24,44
	add	reg24,[reg23]
	fldz
	fstp	dword ptr [reg24]
	lea	reg25,[ebp+8]
	mov	reg26,48
	add	reg26,[reg25]
	fldz
	fstp	dword ptr [reg26]
	lea	reg27,[ebp+8]
	mov	reg28,52
	add	reg28,[reg27]
	fldz
	fstp	dword ptr [reg28]
	lea	reg29,[ebp+8]
	mov	reg30,56
	add	reg30,[reg29]
	fldz
	fstp	dword ptr [reg30]
	lea	reg31,[ebp+8]
	mov	reg32,60
	add	reg32,[reg31]
	fld1
	fstp	dword ptr [reg32]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_make_identity endp	

_matrix4f_make_perspective proc
	x86instr_create_stack_frame	8
	lea	reg1,[ebp-4]
	lea	reg2,[ebp+20]
	lea	reg3,[ebp+12]
	fld	dword ptr [reg2]
	fmul	dword ptr [reg3]
	fstp	dword ptr [reg1]
	lea	reg4,[ebp-8]
	lea	reg5,[ebp-4]
	lea	reg6,[ebp+24]
	fld	dword ptr [reg5]
	fmul	dword ptr [reg6]
	fstp	dword ptr [reg4]
	lea	reg7,[ebp+8]
	mov	reg8,[reg7]
	lea	reg9,[ebp+12]
	lea	reg10,[ebp-8]
	fld	dword ptr [reg9]
	fdiv	dword ptr [reg10]
	fstp	dword ptr [reg8]
	lea	reg11,[ebp+8]
	mov	reg12,4
	add	reg12,[reg11]
	fldz
	fstp	dword ptr [reg12]
	lea	reg13,[ebp+8]
	mov	reg14,8
	add	reg14,[reg13]
	fldz
	fstp	dword ptr [reg14]
	lea	reg15,[ebp+8]
	mov	reg16,12
	add	reg16,[reg15]
	fldz
	fstp	dword ptr [reg16]
	lea	reg17,[ebp+8]
	mov	reg18,16
	add	reg18,[reg17]
	fldz
	fstp	dword ptr [reg18]
	lea	reg19,[ebp+8]
	mov	reg20,20
	add	reg20,[reg19]
	lea	reg21,[ebp+12]
	lea	reg22,[ebp-4]
	fld	dword ptr [reg21]
	fdiv	dword ptr [reg22]
	fstp	dword ptr [reg20]
	lea	reg23,[ebp+8]
	mov	reg24,24
	add	reg24,[reg23]
	fldz
	fstp	dword ptr [reg24]
	lea	reg25,[ebp+8]
	mov	reg26,28
	add	reg26,[reg25]
	fldz
	fstp	dword ptr [reg26]
	lea	reg27,[ebp+8]
	mov	reg28,32
	add	reg28,[reg27]
	fldz
	fstp	dword ptr [reg28]
	lea	reg29,[ebp+8]
	mov	reg30,36
	add	reg30,[reg29]
	fldz
	fstp	dword ptr [reg30]
	lea	reg31,[ebp+8]
	mov	reg32,40
	add	reg32,[reg31]
	lea	reg33,[ebp+16]
	lea	reg34,[ebp+16]
	lea	reg35,[ebp+12]
	fld	dword ptr [reg34]
	fsub	dword ptr [reg35]
	fdivr	dword ptr [reg33]
	fstp	dword ptr [reg32]
	lea	reg36,[ebp+8]
	mov	reg37,44
	add	reg37,[reg36]
	fld1
	fstp	dword ptr [reg37]
	lea	reg38,[ebp+8]
	mov	reg39,48
	add	reg39,[reg38]
	fldz
	fstp	dword ptr [reg39]
	lea	reg40,[ebp+8]
	mov	reg41,52
	add	reg41,[reg40]
	fldz
	fstp	dword ptr [reg41]
	lea	reg42,[ebp+8]
	mov	reg43,56
	add	reg43,[reg42]
	lea	reg44,[ebp+12]
	lea	reg45,[ebp+16]
	fld	dword ptr [reg44]
	fmul	dword ptr [reg45]
	lea	reg46,[ebp+12]
	lea	reg47,[ebp+16]
	fld	dword ptr [reg46]
	fsub	dword ptr [reg47]
	fdivp
	fstp	dword ptr [reg43]
	lea	reg48,[ebp+8]
	mov	reg49,60
	add	reg49,[reg48]
	fldz
	fstp	dword ptr [reg49]
	x86instr_destroy_stack_frame	8
	ret
_matrix4f_make_perspective endp	

.data

___unnamed_float_1	dd	2.000000
public	___unnamed_float_1

.code

_matrix4f_make_viewport proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	lea	reg4,[___unnamed_float_1]
	fld	dword ptr [reg4]
	fdivr	dword ptr [reg3]
	fstp	dword ptr [reg2]
	lea	reg5,[ebp+8]
	mov	reg6,4
	add	reg6,[reg5]
	fldz
	fstp	dword ptr [reg6]
	lea	reg7,[ebp+8]
	mov	reg8,8
	add	reg8,[reg7]
	fldz
	fstp	dword ptr [reg8]
	lea	reg9,[ebp+8]
	mov	reg10,12
	add	reg10,[reg9]
	fldz
	fstp	dword ptr [reg10]
	lea	reg11,[ebp+8]
	mov	reg12,16
	add	reg12,[reg11]
	fldz
	fstp	dword ptr [reg12]
	lea	reg13,[ebp+8]
	mov	reg14,20
	add	reg14,[reg13]
	lea	reg15,[ebp+16]
	fld	dword ptr [reg15]
	fldz
	fsubrp
	lea	reg16,[___unnamed_float_1]
	fld	dword ptr [reg16]
	fdivp
	fstp	dword ptr [reg14]
	lea	reg17,[ebp+8]
	mov	reg18,24
	add	reg18,[reg17]
	fldz
	fstp	dword ptr [reg18]
	lea	reg19,[ebp+8]
	mov	reg20,28
	add	reg20,[reg19]
	fldz
	fstp	dword ptr [reg20]
	lea	reg21,[ebp+8]
	mov	reg22,32
	add	reg22,[reg21]
	fldz
	fstp	dword ptr [reg22]
	lea	reg23,[ebp+8]
	mov	reg24,36
	add	reg24,[reg23]
	fldz
	fstp	dword ptr [reg24]
	lea	reg25,[ebp+8]
	mov	reg26,40
	add	reg26,[reg25]
	lea	reg27,[ebp+24]
	lea	reg28,[ebp+20]
	fld	dword ptr [reg27]
	fsub	dword ptr [reg28]
	fstp	dword ptr [reg26]
	lea	reg29,[ebp+8]
	mov	reg30,44
	add	reg30,[reg29]
	fldz
	fstp	dword ptr [reg30]
	lea	reg31,[ebp+8]
	mov	reg32,48
	add	reg32,[reg31]
	lea	reg33,[ebp+12]
	lea	reg34,[___unnamed_float_1]
	fld	dword ptr [reg34]
	fdivr	dword ptr [reg33]
	fstp	dword ptr [reg32]
	lea	reg35,[ebp+8]
	mov	reg36,52
	add	reg36,[reg35]
	lea	reg37,[ebp+16]
	lea	reg38,[___unnamed_float_1]
	fld	dword ptr [reg38]
	fdivr	dword ptr [reg37]
	fstp	dword ptr [reg36]
	lea	reg39,[ebp+8]
	mov	reg40,56
	add	reg40,[reg39]
	lea	reg41,[ebp+20]
	fld	dword ptr [reg41]
	fstp	dword ptr [reg40]
	lea	reg42,[ebp+8]
	mov	reg43,60
	add	reg43,[reg42]
	fld1
	fstp	dword ptr [reg43]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_make_viewport endp	

_matrix4f_mul proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	mov	reg4,[reg3]
	lea	reg5,[ebp+16]
	mov	reg6,[reg5]
	fld	dword ptr [reg4]
	fmul	dword ptr [reg6]
	lea	reg7,[ebp+12]
	mov	reg8,4
	add	reg8,[reg7]
	lea	reg9,[ebp+16]
	mov	reg10,16
	add	reg10,[reg9]
	fld	dword ptr [reg8]
	fmul	dword ptr [reg10]
	faddp
	lea	reg11,[ebp+12]
	mov	reg12,8
	add	reg12,[reg11]
	lea	reg13,[ebp+16]
	mov	reg14,32
	add	reg14,[reg13]
	fld	dword ptr [reg12]
	fmul	dword ptr [reg14]
	faddp
	lea	reg15,[ebp+12]
	mov	reg16,12
	add	reg16,[reg15]
	lea	reg17,[ebp+16]
	mov	reg18,48
	add	reg18,[reg17]
	fld	dword ptr [reg16]
	fmul	dword ptr [reg18]
	faddp
	fstp	dword ptr [reg2]
	lea	reg19,[ebp+8]
	mov	reg20,4
	add	reg20,[reg19]
	lea	reg21,[ebp+12]
	mov	reg22,[reg21]
	lea	reg23,[ebp+16]
	mov	reg24,4
	add	reg24,[reg23]
	fld	dword ptr [reg22]
	fmul	dword ptr [reg24]
	lea	reg25,[ebp+12]
	mov	reg26,4
	add	reg26,[reg25]
	lea	reg27,[ebp+16]
	mov	reg28,20
	add	reg28,[reg27]
	fld	dword ptr [reg26]
	fmul	dword ptr [reg28]
	faddp
	lea	reg29,[ebp+12]
	mov	reg30,8
	add	reg30,[reg29]
	lea	reg31,[ebp+16]
	mov	reg32,36
	add	reg32,[reg31]
	fld	dword ptr [reg30]
	fmul	dword ptr [reg32]
	faddp
	lea	reg33,[ebp+12]
	mov	reg34,12
	add	reg34,[reg33]
	lea	reg35,[ebp+16]
	mov	reg36,52
	add	reg36,[reg35]
	fld	dword ptr [reg34]
	fmul	dword ptr [reg36]
	faddp
	fstp	dword ptr [reg20]
	lea	reg37,[ebp+8]
	mov	reg38,8
	add	reg38,[reg37]
	lea	reg39,[ebp+12]
	mov	reg40,[reg39]
	lea	reg41,[ebp+16]
	mov	reg42,8
	add	reg42,[reg41]
	fld	dword ptr [reg40]
	fmul	dword ptr [reg42]
	lea	reg43,[ebp+12]
	mov	reg44,4
	add	reg44,[reg43]
	lea	reg45,[ebp+16]
	mov	reg46,24
	add	reg46,[reg45]
	fld	dword ptr [reg44]
	fmul	dword ptr [reg46]
	faddp
	lea	reg47,[ebp+12]
	mov	reg48,8
	add	reg48,[reg47]
	lea	reg49,[ebp+16]
	mov	reg50,40
	add	reg50,[reg49]
	fld	dword ptr [reg48]
	fmul	dword ptr [reg50]
	faddp
	lea	reg51,[ebp+12]
	mov	reg52,12
	add	reg52,[reg51]
	lea	reg53,[ebp+16]
	mov	reg54,56
	add	reg54,[reg53]
	fld	dword ptr [reg52]
	fmul	dword ptr [reg54]
	faddp
	fstp	dword ptr [reg38]
	lea	reg55,[ebp+8]
	mov	reg56,12
	add	reg56,[reg55]
	lea	reg57,[ebp+12]
	mov	reg58,[reg57]
	lea	reg59,[ebp+16]
	mov	reg60,12
	add	reg60,[reg59]
	fld	dword ptr [reg58]
	fmul	dword ptr [reg60]
	lea	reg61,[ebp+12]
	mov	reg62,4
	add	reg62,[reg61]
	lea	reg63,[ebp+16]
	mov	reg64,28
	add	reg64,[reg63]
	fld	dword ptr [reg62]
	fmul	dword ptr [reg64]
	faddp
	lea	reg65,[ebp+12]
	mov	reg66,8
	add	reg66,[reg65]
	lea	reg67,[ebp+16]
	mov	reg68,44
	add	reg68,[reg67]
	fld	dword ptr [reg66]
	fmul	dword ptr [reg68]
	faddp
	lea	reg69,[ebp+12]
	mov	reg70,12
	add	reg70,[reg69]
	lea	reg71,[ebp+16]
	mov	reg72,60
	add	reg72,[reg71]
	fld	dword ptr [reg70]
	fmul	dword ptr [reg72]
	faddp
	fstp	dword ptr [reg56]
	lea	reg73,[ebp+8]
	mov	reg74,16
	add	reg74,[reg73]
	lea	reg75,[ebp+12]
	mov	reg76,16
	add	reg76,[reg75]
	lea	reg77,[ebp+16]
	mov	reg78,[reg77]
	fld	dword ptr [reg76]
	fmul	dword ptr [reg78]
	lea	reg79,[ebp+12]
	mov	reg80,20
	add	reg80,[reg79]
	lea	reg81,[ebp+16]
	mov	reg82,16
	add	reg82,[reg81]
	fld	dword ptr [reg80]
	fmul	dword ptr [reg82]
	faddp
	lea	reg83,[ebp+12]
	mov	reg84,24
	add	reg84,[reg83]
	lea	reg85,[ebp+16]
	mov	reg86,32
	add	reg86,[reg85]
	fld	dword ptr [reg84]
	fmul	dword ptr [reg86]
	faddp
	lea	reg87,[ebp+12]
	mov	reg88,28
	add	reg88,[reg87]
	lea	reg89,[ebp+16]
	mov	reg90,48
	add	reg90,[reg89]
	fld	dword ptr [reg88]
	fmul	dword ptr [reg90]
	faddp
	fstp	dword ptr [reg74]
	lea	reg91,[ebp+8]
	mov	reg92,20
	add	reg92,[reg91]
	lea	reg93,[ebp+12]
	mov	reg94,16
	add	reg94,[reg93]
	lea	reg95,[ebp+16]
	mov	reg96,4
	add	reg96,[reg95]
	fld	dword ptr [reg94]
	fmul	dword ptr [reg96]
	lea	reg97,[ebp+12]
	mov	reg98,20
	add	reg98,[reg97]
	lea	reg99,[ebp+16]
	mov	reg100,20
	add	reg100,[reg99]
	fld	dword ptr [reg98]
	fmul	dword ptr [reg100]
	faddp
	lea	reg101,[ebp+12]
	mov	reg102,24
	add	reg102,[reg101]
	lea	reg103,[ebp+16]
	mov	reg104,36
	add	reg104,[reg103]
	fld	dword ptr [reg102]
	fmul	dword ptr [reg104]
	faddp
	lea	reg105,[ebp+12]
	mov	reg106,28
	add	reg106,[reg105]
	lea	reg107,[ebp+16]
	mov	reg108,52
	add	reg108,[reg107]
	fld	dword ptr [reg106]
	fmul	dword ptr [reg108]
	faddp
	fstp	dword ptr [reg92]
	lea	reg109,[ebp+8]
	mov	reg110,24
	add	reg110,[reg109]
	lea	reg111,[ebp+12]
	mov	reg112,16
	add	reg112,[reg111]
	lea	reg113,[ebp+16]
	mov	reg114,8
	add	reg114,[reg113]
	fld	dword ptr [reg112]
	fmul	dword ptr [reg114]
	lea	reg115,[ebp+12]
	mov	reg116,20
	add	reg116,[reg115]
	lea	reg117,[ebp+16]
	mov	reg118,24
	add	reg118,[reg117]
	fld	dword ptr [reg116]
	fmul	dword ptr [reg118]
	faddp
	lea	reg119,[ebp+12]
	mov	reg120,24
	add	reg120,[reg119]
	lea	reg121,[ebp+16]
	mov	reg122,40
	add	reg122,[reg121]
	fld	dword ptr [reg120]
	fmul	dword ptr [reg122]
	faddp
	lea	reg123,[ebp+12]
	mov	reg124,28
	add	reg124,[reg123]
	lea	reg125,[ebp+16]
	mov	reg126,56
	add	reg126,[reg125]
	fld	dword ptr [reg124]
	fmul	dword ptr [reg126]
	faddp
	fstp	dword ptr [reg110]
	lea	reg127,[ebp+8]
	mov	reg128,28
	add	reg128,[reg127]
	lea	reg129,[ebp+12]
	mov	reg130,16
	add	reg130,[reg129]
	lea	reg131,[ebp+16]
	mov	reg132,12
	add	reg132,[reg131]
	fld	dword ptr [reg130]
	fmul	dword ptr [reg132]
	lea	reg133,[ebp+12]
	mov	reg134,20
	add	reg134,[reg133]
	lea	reg135,[ebp+16]
	mov	reg136,28
	add	reg136,[reg135]
	fld	dword ptr [reg134]
	fmul	dword ptr [reg136]
	faddp
	lea	reg137,[ebp+12]
	mov	reg138,24
	add	reg138,[reg137]
	lea	reg139,[ebp+16]
	mov	reg140,44
	add	reg140,[reg139]
	fld	dword ptr [reg138]
	fmul	dword ptr [reg140]
	faddp
	lea	reg141,[ebp+12]
	mov	reg142,28
	add	reg142,[reg141]
	lea	reg143,[ebp+16]
	mov	reg144,60
	add	reg144,[reg143]
	fld	dword ptr [reg142]
	fmul	dword ptr [reg144]
	faddp
	fstp	dword ptr [reg128]
	lea	reg145,[ebp+8]
	mov	reg146,32
	add	reg146,[reg145]
	lea	reg147,[ebp+12]
	mov	reg148,32
	add	reg148,[reg147]
	lea	reg149,[ebp+16]
	mov	reg150,[reg149]
	fld	dword ptr [reg148]
	fmul	dword ptr [reg150]
	lea	reg151,[ebp+12]
	mov	reg152,36
	add	reg152,[reg151]
	lea	reg153,[ebp+16]
	mov	reg154,16
	add	reg154,[reg153]
	fld	dword ptr [reg152]
	fmul	dword ptr [reg154]
	faddp
	lea	reg155,[ebp+12]
	mov	reg156,40
	add	reg156,[reg155]
	lea	reg157,[ebp+16]
	mov	reg158,32
	add	reg158,[reg157]
	fld	dword ptr [reg156]
	fmul	dword ptr [reg158]
	faddp
	lea	reg159,[ebp+12]
	mov	reg160,44
	add	reg160,[reg159]
	lea	reg161,[ebp+16]
	mov	reg162,48
	add	reg162,[reg161]
	fld	dword ptr [reg160]
	fmul	dword ptr [reg162]
	faddp
	fstp	dword ptr [reg146]
	lea	reg163,[ebp+8]
	mov	reg164,36
	add	reg164,[reg163]
	lea	reg165,[ebp+12]
	mov	reg166,32
	add	reg166,[reg165]
	lea	reg167,[ebp+16]
	mov	reg168,4
	add	reg168,[reg167]
	fld	dword ptr [reg166]
	fmul	dword ptr [reg168]
	lea	reg169,[ebp+12]
	mov	reg170,36
	add	reg170,[reg169]
	lea	reg171,[ebp+16]
	mov	reg172,20
	add	reg172,[reg171]
	fld	dword ptr [reg170]
	fmul	dword ptr [reg172]
	faddp
	lea	reg173,[ebp+12]
	mov	reg174,40
	add	reg174,[reg173]
	lea	reg175,[ebp+16]
	mov	reg176,36
	add	reg176,[reg175]
	fld	dword ptr [reg174]
	fmul	dword ptr [reg176]
	faddp
	lea	reg177,[ebp+12]
	mov	reg178,44
	add	reg178,[reg177]
	lea	reg179,[ebp+16]
	mov	reg180,52
	add	reg180,[reg179]
	fld	dword ptr [reg178]
	fmul	dword ptr [reg180]
	faddp
	fstp	dword ptr [reg164]
	lea	reg181,[ebp+8]
	mov	reg182,40
	add	reg182,[reg181]
	lea	reg183,[ebp+12]
	mov	reg184,32
	add	reg184,[reg183]
	lea	reg185,[ebp+16]
	mov	reg186,8
	add	reg186,[reg185]
	fld	dword ptr [reg184]
	fmul	dword ptr [reg186]
	lea	reg187,[ebp+12]
	mov	reg188,36
	add	reg188,[reg187]
	lea	reg189,[ebp+16]
	mov	reg190,24
	add	reg190,[reg189]
	fld	dword ptr [reg188]
	fmul	dword ptr [reg190]
	faddp
	lea	reg191,[ebp+12]
	mov	reg192,40
	add	reg192,[reg191]
	lea	reg193,[ebp+16]
	mov	reg194,40
	add	reg194,[reg193]
	fld	dword ptr [reg192]
	fmul	dword ptr [reg194]
	faddp
	lea	reg195,[ebp+12]
	mov	reg196,44
	add	reg196,[reg195]
	lea	reg197,[ebp+16]
	mov	reg198,56
	add	reg198,[reg197]
	fld	dword ptr [reg196]
	fmul	dword ptr [reg198]
	faddp
	fstp	dword ptr [reg182]
	lea	reg199,[ebp+8]
	mov	reg200,44
	add	reg200,[reg199]
	lea	reg201,[ebp+12]
	mov	reg202,32
	add	reg202,[reg201]
	lea	reg203,[ebp+16]
	mov	reg204,12
	add	reg204,[reg203]
	fld	dword ptr [reg202]
	fmul	dword ptr [reg204]
	lea	reg205,[ebp+12]
	mov	reg206,36
	add	reg206,[reg205]
	lea	reg207,[ebp+16]
	mov	reg208,28
	add	reg208,[reg207]
	fld	dword ptr [reg206]
	fmul	dword ptr [reg208]
	faddp
	lea	reg209,[ebp+12]
	mov	reg210,40
	add	reg210,[reg209]
	lea	reg211,[ebp+16]
	mov	reg212,44
	add	reg212,[reg211]
	fld	dword ptr [reg210]
	fmul	dword ptr [reg212]
	faddp
	lea	reg213,[ebp+12]
	mov	reg214,44
	add	reg214,[reg213]
	lea	reg215,[ebp+16]
	mov	reg216,60
	add	reg216,[reg215]
	fld	dword ptr [reg214]
	fmul	dword ptr [reg216]
	faddp
	fstp	dword ptr [reg200]
	lea	reg217,[ebp+8]
	mov	reg218,48
	add	reg218,[reg217]
	lea	reg219,[ebp+12]
	mov	reg220,48
	add	reg220,[reg219]
	lea	reg221,[ebp+16]
	mov	reg222,[reg221]
	fld	dword ptr [reg220]
	fmul	dword ptr [reg222]
	lea	reg223,[ebp+12]
	mov	reg224,52
	add	reg224,[reg223]
	lea	reg225,[ebp+16]
	mov	reg226,16
	add	reg226,[reg225]
	fld	dword ptr [reg224]
	fmul	dword ptr [reg226]
	faddp
	lea	reg227,[ebp+12]
	mov	reg228,56
	add	reg228,[reg227]
	lea	reg229,[ebp+16]
	mov	reg230,32
	add	reg230,[reg229]
	fld	dword ptr [reg228]
	fmul	dword ptr [reg230]
	faddp
	lea	reg231,[ebp+12]
	mov	reg232,60
	add	reg232,[reg231]
	lea	reg233,[ebp+16]
	mov	reg234,48
	add	reg234,[reg233]
	fld	dword ptr [reg232]
	fmul	dword ptr [reg234]
	faddp
	fstp	dword ptr [reg218]
	lea	reg235,[ebp+8]
	mov	reg236,52
	add	reg236,[reg235]
	lea	reg237,[ebp+12]
	mov	reg238,48
	add	reg238,[reg237]
	lea	reg239,[ebp+16]
	mov	reg240,4
	add	reg240,[reg239]
	fld	dword ptr [reg238]
	fmul	dword ptr [reg240]
	lea	reg241,[ebp+12]
	mov	reg242,52
	add	reg242,[reg241]
	lea	reg243,[ebp+16]
	mov	reg244,20
	add	reg244,[reg243]
	fld	dword ptr [reg242]
	fmul	dword ptr [reg244]
	faddp
	lea	reg245,[ebp+12]
	mov	reg246,56
	add	reg246,[reg245]
	lea	reg247,[ebp+16]
	mov	reg248,36
	add	reg248,[reg247]
	fld	dword ptr [reg246]
	fmul	dword ptr [reg248]
	faddp
	lea	reg249,[ebp+12]
	mov	reg250,60
	add	reg250,[reg249]
	lea	reg251,[ebp+16]
	mov	reg252,52
	add	reg252,[reg251]
	fld	dword ptr [reg250]
	fmul	dword ptr [reg252]
	faddp
	fstp	dword ptr [reg236]
	lea	reg253,[ebp+8]
	mov	reg254,56
	add	reg254,[reg253]
	lea	reg255,[ebp+12]
	mov	reg256,48
	add	reg256,[reg255]
	lea	reg257,[ebp+16]
	mov	reg258,8
	add	reg258,[reg257]
	fld	dword ptr [reg256]
	fmul	dword ptr [reg258]
	lea	reg259,[ebp+12]
	mov	reg260,52
	add	reg260,[reg259]
	lea	reg261,[ebp+16]
	mov	reg262,24
	add	reg262,[reg261]
	fld	dword ptr [reg260]
	fmul	dword ptr [reg262]
	faddp
	lea	reg263,[ebp+12]
	mov	reg264,56
	add	reg264,[reg263]
	lea	reg265,[ebp+16]
	mov	reg266,40
	add	reg266,[reg265]
	fld	dword ptr [reg264]
	fmul	dword ptr [reg266]
	faddp
	lea	reg267,[ebp+12]
	mov	reg268,60
	add	reg268,[reg267]
	lea	reg269,[ebp+16]
	mov	reg270,56
	add	reg270,[reg269]
	fld	dword ptr [reg268]
	fmul	dword ptr [reg270]
	faddp
	fstp	dword ptr [reg254]
	lea	reg271,[ebp+8]
	mov	reg272,60
	add	reg272,[reg271]
	lea	reg273,[ebp+12]
	mov	reg274,48
	add	reg274,[reg273]
	lea	reg275,[ebp+16]
	mov	reg276,12
	add	reg276,[reg275]
	fld	dword ptr [reg274]
	fmul	dword ptr [reg276]
	lea	reg277,[ebp+12]
	mov	reg278,52
	add	reg278,[reg277]
	lea	reg279,[ebp+16]
	mov	reg280,28
	add	reg280,[reg279]
	fld	dword ptr [reg278]
	fmul	dword ptr [reg280]
	faddp
	lea	reg281,[ebp+12]
	mov	reg282,56
	add	reg282,[reg281]
	lea	reg283,[ebp+16]
	mov	reg284,44
	add	reg284,[reg283]
	fld	dword ptr [reg282]
	fmul	dword ptr [reg284]
	faddp
	lea	reg285,[ebp+12]
	mov	reg286,60
	add	reg286,[reg285]
	lea	reg287,[ebp+16]
	mov	reg288,60
	add	reg288,[reg287]
	fld	dword ptr [reg286]
	fmul	dword ptr [reg288]
	faddp
	fstp	dword ptr [reg272]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_mul endp	

_matrix4f_transform proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[ebp+12]
	mov	reg4,[reg3]
	lea	reg5,[ebp+16]
	mov	reg6,[reg5]
	fld	dword ptr [reg4]
	fmul	dword ptr [reg6]
	lea	reg7,[ebp+12]
	mov	reg8,4
	add	reg8,[reg7]
	lea	reg9,[ebp+16]
	mov	reg10,16
	add	reg10,[reg9]
	fld	dword ptr [reg8]
	fmul	dword ptr [reg10]
	faddp
	lea	reg11,[ebp+12]
	mov	reg12,8
	add	reg12,[reg11]
	lea	reg13,[ebp+16]
	mov	reg14,32
	add	reg14,[reg13]
	fld	dword ptr [reg12]
	fmul	dword ptr [reg14]
	faddp
	lea	reg15,[ebp+12]
	mov	reg16,12
	add	reg16,[reg15]
	lea	reg17,[ebp+16]
	mov	reg18,48
	add	reg18,[reg17]
	fld	dword ptr [reg16]
	fmul	dword ptr [reg18]
	faddp
	fstp	dword ptr [reg2]
	lea	reg19,[ebp+8]
	mov	reg20,4
	add	reg20,[reg19]
	lea	reg21,[ebp+12]
	mov	reg22,[reg21]
	lea	reg23,[ebp+16]
	mov	reg24,4
	add	reg24,[reg23]
	fld	dword ptr [reg22]
	fmul	dword ptr [reg24]
	lea	reg25,[ebp+12]
	mov	reg26,4
	add	reg26,[reg25]
	lea	reg27,[ebp+16]
	mov	reg28,20
	add	reg28,[reg27]
	fld	dword ptr [reg26]
	fmul	dword ptr [reg28]
	faddp
	lea	reg29,[ebp+12]
	mov	reg30,8
	add	reg30,[reg29]
	lea	reg31,[ebp+16]
	mov	reg32,36
	add	reg32,[reg31]
	fld	dword ptr [reg30]
	fmul	dword ptr [reg32]
	faddp
	lea	reg33,[ebp+12]
	mov	reg34,12
	add	reg34,[reg33]
	lea	reg35,[ebp+16]
	mov	reg36,52
	add	reg36,[reg35]
	fld	dword ptr [reg34]
	fmul	dword ptr [reg36]
	faddp
	fstp	dword ptr [reg20]
	lea	reg37,[ebp+8]
	mov	reg38,8
	add	reg38,[reg37]
	lea	reg39,[ebp+12]
	mov	reg40,[reg39]
	lea	reg41,[ebp+16]
	mov	reg42,8
	add	reg42,[reg41]
	fld	dword ptr [reg40]
	fmul	dword ptr [reg42]
	lea	reg43,[ebp+12]
	mov	reg44,4
	add	reg44,[reg43]
	lea	reg45,[ebp+16]
	mov	reg46,24
	add	reg46,[reg45]
	fld	dword ptr [reg44]
	fmul	dword ptr [reg46]
	faddp
	lea	reg47,[ebp+12]
	mov	reg48,8
	add	reg48,[reg47]
	lea	reg49,[ebp+16]
	mov	reg50,40
	add	reg50,[reg49]
	fld	dword ptr [reg48]
	fmul	dword ptr [reg50]
	faddp
	lea	reg51,[ebp+12]
	mov	reg52,12
	add	reg52,[reg51]
	lea	reg53,[ebp+16]
	mov	reg54,56
	add	reg54,[reg53]
	fld	dword ptr [reg52]
	fmul	dword ptr [reg54]
	faddp
	fstp	dword ptr [reg38]
	lea	reg55,[ebp+8]
	mov	reg56,12
	add	reg56,[reg55]
	lea	reg57,[ebp+12]
	mov	reg58,[reg57]
	lea	reg59,[ebp+16]
	mov	reg60,12
	add	reg60,[reg59]
	fld	dword ptr [reg58]
	fmul	dword ptr [reg60]
	lea	reg61,[ebp+12]
	mov	reg62,4
	add	reg62,[reg61]
	lea	reg63,[ebp+16]
	mov	reg64,28
	add	reg64,[reg63]
	fld	dword ptr [reg62]
	fmul	dword ptr [reg64]
	faddp
	lea	reg65,[ebp+12]
	mov	reg66,8
	add	reg66,[reg65]
	lea	reg67,[ebp+16]
	mov	reg68,44
	add	reg68,[reg67]
	fld	dword ptr [reg66]
	fmul	dword ptr [reg68]
	faddp
	lea	reg69,[ebp+12]
	mov	reg70,12
	add	reg70,[reg69]
	lea	reg71,[ebp+16]
	mov	reg72,60
	add	reg72,[reg71]
	fld	dword ptr [reg70]
	fmul	dword ptr [reg72]
	faddp
	fstp	dword ptr [reg56]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_transform endp	

_matrix4f_transpose proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,4
	add	reg2,[reg1]
	lea	reg3,[ebp+8]
	mov	reg4,16
	add	reg4,[reg3]
	fld	dword ptr [reg4]
	fstp	dword ptr [reg2]
	lea	reg5,[ebp+8]
	mov	reg6,8
	add	reg6,[reg5]
	lea	reg7,[ebp+8]
	mov	reg8,32
	add	reg8,[reg7]
	fld	dword ptr [reg8]
	fstp	dword ptr [reg6]
	lea	reg9,[ebp+8]
	mov	reg10,12
	add	reg10,[reg9]
	lea	reg11,[ebp+8]
	mov	reg12,48
	add	reg12,[reg11]
	fld	dword ptr [reg12]
	fstp	dword ptr [reg10]
	lea	reg13,[ebp+8]
	mov	reg14,24
	add	reg14,[reg13]
	lea	reg15,[ebp+8]
	mov	reg16,36
	add	reg16,[reg15]
	fld	dword ptr [reg16]
	fstp	dword ptr [reg14]
	lea	reg17,[ebp+8]
	mov	reg18,28
	add	reg18,[reg17]
	lea	reg19,[ebp+8]
	mov	reg20,52
	add	reg20,[reg19]
	fld	dword ptr [reg20]
	fstp	dword ptr [reg18]
	lea	reg21,[ebp+8]
	mov	reg22,44
	add	reg22,[reg21]
	lea	reg23,[ebp+8]
	mov	reg24,56
	add	reg24,[reg23]
	fld	dword ptr [reg24]
	fstp	dword ptr [reg22]
	x86instr_destroy_stack_frame	0
	ret
_matrix4f_transpose endp	

.data

___unnamed_float_2	dd	-1.000000
public	___unnamed_float_2

.code

_rasterizer_init proc
	x86instr_create_stack_frame	8
	lea	reg1,[__dbgprintf]
	lea	reg2,[ebp+8]
	mov	reg3,[reg2]
	mov	[reg1],reg3
	lea	reg4,[__width]
	lea	reg5,[ebp+12]
	mov	reg6,[reg5]
	mov	[reg4],reg6
	lea	reg7,[__height]
	lea	reg8,[ebp+16]
	mov	reg9,[reg8]
	mov	[reg7],reg9
	lea	reg10,[__pitch]
	lea	reg11,[ebp+20]
	mov	reg12,[reg11]
	mov	[reg10],reg12
	x86instr_push_all
	lea	reg13,[ebp+12]
	fild	dword ptr [reg13]
	lea	reg14,[ebp+16]
	fild	dword ptr [reg14]
	fdivp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg15,[ebp+32]
	push	dword ptr [reg15]
	lea	reg16,[ebp+28]
	push	dword ptr [reg16]
	lea	reg17,[ebp+24]
	push	dword ptr [reg17]
	lea	reg18,[__mvproj_matrix]
	push	reg18
	call	_matrix4f_make_perspective
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	lea	reg19,[ebp+28]
	push	dword ptr [reg19]
	lea	reg20,[ebp+24]
	push	dword ptr [reg20]
	lea	reg21,[ebp+16]
	fild	dword ptr [reg21]
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg22,[ebp+12]
	fild	dword ptr [reg22]
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg23,[__viewport_matrix]
	push	reg23
	call	_matrix4f_make_viewport
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg24,[ebp+24]
	push	dword ptr [reg24]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg25,[__clip_z_near_base]
	push	reg25
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	lea	reg26,[ebp+28]
	lea	reg27,[ebp+24]
	fld	dword ptr [reg27]
	fld	dword ptr [reg26]
	fucomip	st,st(1)
	fstp	st
	jbe	label0000
	lea	reg28,[ebp-4]
	fld1
	fstp	dword ptr [reg28]
	jmp	label0001
label0000:
	lea	reg29,[ebp-4]
	lea	reg30,[___unnamed_float_2]
	fld	dword ptr [reg30]
	fstp	dword ptr [reg29]
label0001:
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg31,[ebp-4]
	push	dword ptr [reg31]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg32,[__clip_z_near_norm]
	push	reg32
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg33,[ebp+28]
	push	dword ptr [reg33]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg34,[__clip_z_far_base]
	push	reg34
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	lea	reg35,[ebp+28]
	lea	reg36,[ebp+24]
	fld	dword ptr [reg36]
	fld	dword ptr [reg35]
	fucomip	st,st(1)
	fstp	st
	jbe	label0002
	lea	reg37,[ebp-8]
	lea	reg38,[___unnamed_float_2]
	fld	dword ptr [reg38]
	fstp	dword ptr [reg37]
	jmp	label0003
label0002:
	lea	reg39,[ebp-8]
	fld1
	fstp	dword ptr [reg39]
label0003:
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg40,[ebp-8]
	push	dword ptr [reg40]
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg41,[__clip_z_far_norm]
	push	reg41
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg42,[___unnamed_float_2]
	fld	dword ptr [reg42]
	fld1
	lea	reg43,[ebp+12]
	fild	dword ptr [reg43]
	fdivp
	faddp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg44,[__clip_plane_left_base]
	push	reg44
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg45,[__clip_plane_left_norm]
	push	reg45
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld1
	fld1
	lea	reg46,[ebp+12]
	fild	dword ptr [reg46]
	fdivp
	fsubp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg47,[__clip_plane_right_base]
	push	reg47
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg48,[___unnamed_float_2]
	fld	dword ptr [reg48]
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg49,[__clip_plane_right_norm]
	push	reg49
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg50,[___unnamed_float_2]
	fld	dword ptr [reg50]
	fld1
	lea	reg51,[ebp+16]
	fild	dword ptr [reg51]
	fdivp
	faddp
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg52,[__clip_plane_top_base]
	push	reg52
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg53,[__clip_plane_top_norm]
	push	reg53
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg54,[__clip_plane_bottom_base]
	push	reg54
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg55,[___unnamed_float_2]
	fld	dword ptr [reg55]
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg56,[__clip_plane_bottom_norm]
	push	reg56
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_destroy_stack_frame	8
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	x86instr_create_stack_frame	0
	lea	reg1,[__videomem]
	lea	reg2,[ebp+8]
	mov	reg3,[reg2]
	mov	[reg1],reg3
	x86instr_destroy_stack_frame	0
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	lea	reg3,[__mvproj_matrix]
	lea	reg4,[reg2]
	lea	reg5,[reg3]
	mov	reg6,16
label0000:
	mov	reg7,[reg4]
	mov	[reg5],reg7
	dec	reg6
	lea	reg4,[reg4+4]
	lea	reg5,[reg5+4]
	jne	label0000
	x86instr_destroy_stack_frame	0
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	x86instr_create_stack_frame	0
	lea	reg1,[__color]
	lea	reg2,[ebp+8]
	mov	reg3,[reg2]
	mov	[reg1],reg3
	x86instr_destroy_stack_frame	0
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	x86instr_create_stack_frame	0
	lea	reg1,[__texture_data]
	lea	reg2,[ebp+8]
	mov	reg3,[reg2]
	mov	[reg1],reg3
	lea	reg4,[__texture_width]
	lea	reg5,[ebp+12]
	mov	reg6,[reg5]
	mov	[reg4],reg6
	lea	reg7,[__texture_height]
	lea	reg8,[ebp+16]
	mov	reg9,[reg8]
	mov	[reg7],reg9
	x86instr_destroy_stack_frame	0
	ret
_rasterizer_set_texture endp	

__tex2d proc
	x86instr_create_stack_frame	12
	lea	reg1,[__texture_width]
	mov	reg2,1
	mov	reg3,[reg1]
	sub	reg3,reg2
	mov	[ebp-12],reg3
	fild	dword ptr [ebp-12]
	lea	reg4,[ebp+8]
	fmul	dword ptr [reg4]
	fistp	dword ptr [ebp-12]
	lea	reg5,[ebp-4]
	mov	reg6,[ebp-12]
	mov	[reg5],reg6
	lea	reg7,[__texture_height]
	mov	reg8,1
	mov	reg9,[reg7]
	sub	reg9,reg8
	mov	[ebp-12],reg9
	fild	dword ptr [ebp-12]
	lea	reg10,[ebp+12]
	fmul	dword ptr [reg10]
	fistp	dword ptr [ebp-12]
	lea	reg11,[ebp-8]
	mov	reg12,[ebp-12]
	mov	[reg11],reg12
	lea	reg13,[ebp-8]
	lea	reg14,[__texture_width]
	mov	reg15,[reg13]
	imul	reg15,[reg14]
	lea	reg16,[ebp-4]
	add	reg15,[reg16]
	mov	reg17,2
	sal	reg15,reg17
	lea	reg18,[__texture_data]
	add	reg15,[reg18]
	mov	eax,[reg15]
	x86instr_destroy_stack_frame	12
	ret
__tex2d endp	

.data

___unnamed_float_3	dd	255.000000
public	___unnamed_float_3

.code

__rasterize_horiz_line proc
	x86instr_create_stack_frame	48
	lea	reg1,[__pitch]
	lea	reg2,[ebp+16]
	mov	reg3,[reg1]
	imul	reg3,[reg2]
	lea	reg4,[__videomem]
	add	reg3,[reg4]
	lea	reg5,[ebp+8]
	mov	reg6,2
	mov	reg7,[reg5]
	sal	reg7,reg6
	add	reg3,reg7
	lea	reg8,[ebp-4]
	mov	[reg8],reg3
	lea	reg9,[ebp+12]
	mov	reg10,2
	mov	reg11,[reg9]
	sal	reg11,reg10
	lea	reg12,[ebp-4]
	add	reg11,[reg12]
	lea	reg13,[ebp+8]
	mov	reg14,2
	mov	reg15,[reg13]
	sal	reg15,reg14
	sub	reg11,reg15
	lea	reg16,[ebp-8]
	mov	[reg16],reg11
label0000:
	x86instr_push_all
	lea	reg17,[ebp+24]
	push	dword ptr [reg17]
	lea	reg18,[ebp+20]
	push	dword ptr [reg18]
	call	__tex2d
	add	esp,8
	x86instr_pop_all
	mov	reg19,eax
	lea	reg20,[ebp-12]
	mov	[reg20],reg19
	lea	reg21,[ebp-12]
	mov	reg22,24
	mov	reg23,[reg21]
	sar	reg23,reg22
	mov	reg24,255
	and	reg23,reg24
	lea	reg25,[ebp-40]
	mov	[reg25],reg23
	lea	reg26,[ebp-40]
	cmp	dword ptr [reg26],0
	je	label0003
	lea	reg27,[ebp-44]
	lea	reg28,[ebp-40]
	fild	dword ptr [reg28]
	lea	reg29,[___unnamed_float_3]
	fld	dword ptr [reg29]
	fdivp
	fstp	dword ptr [reg27]
	lea	reg30,[ebp-4]
	mov	reg31,[reg30]
	lea	reg32,[ebp-28]
	mov	reg33,[reg31]
	mov	[reg32],reg33
	lea	reg34,[ebp-28]
	mov	reg35,65280
	mov	reg36,[reg34]
	and	reg36,reg35
	mov	reg37,8
	sar	reg36,reg37
	lea	reg38,[ebp-32]
	mov	[reg38],reg36
	lea	reg39,[ebp-28]
	mov	reg40,255
	mov	reg41,[reg39]
	and	reg41,reg40
	lea	reg42,[ebp-36]
	mov	[reg42],reg41
	lea	reg43,[ebp-12]
	mov	reg44,65280
	mov	reg45,[reg43]
	and	reg45,reg44
	mov	reg46,8
	sar	reg45,reg46
	lea	reg47,[ebp-20]
	mov	[reg47],reg45
	lea	reg48,[ebp-12]
	mov	reg49,255
	mov	reg50,[reg48]
	and	reg50,reg49
	lea	reg51,[ebp-24]
	mov	[reg51],reg50
	lea	reg52,[ebp-20]
	fild	dword ptr [reg52]
	lea	reg53,[ebp-44]
	fmul	dword ptr [reg53]
	lea	reg54,[ebp-32]
	fild	dword ptr [reg54]
	fld1
	lea	reg55,[ebp-44]
	fsub	dword ptr [reg55]
	fmulp
	faddp
	fistp	dword ptr [ebp-48]
	lea	reg56,[ebp-20]
	mov	reg57,[ebp-48]
	mov	[reg56],reg57
	lea	reg58,[ebp-24]
	fild	dword ptr [reg58]
	lea	reg59,[ebp-44]
	fmul	dword ptr [reg59]
	lea	reg60,[ebp-36]
	fild	dword ptr [reg60]
	fld1
	lea	reg61,[ebp-44]
	fsub	dword ptr [reg61]
	fmulp
	faddp
	fistp	dword ptr [ebp-48]
	lea	reg62,[ebp-24]
	mov	reg63,[ebp-48]
	mov	[reg62],reg63
	lea	reg64,[ebp-20]
	mov	reg65,8
	mov	reg66,[reg64]
	sal	reg66,reg65
	lea	reg67,[ebp-24]
	add	reg66,[reg67]
	lea	reg68,[ebp-16]
	mov	[reg68],reg66
	lea	reg69,[ebp-4]
	mov	reg70,[reg69]
	lea	reg71,[ebp-16]
	mov	reg72,[reg71]
	mov	[reg70],reg72
label0003:
	lea	reg73,[ebp+20]
	lea	reg74,[ebp+28]
	fld	dword ptr [reg73]
	fadd	dword ptr [reg74]
	fstp	dword ptr [reg73]
	lea	reg75,[ebp+24]
	lea	reg76,[ebp+32]
	fld	dword ptr [reg75]
	fadd	dword ptr [reg76]
	fstp	dword ptr [reg75]
label0001:
	lea	reg77,[ebp-4]
	add	dword ptr [reg77],4
	lea	reg78,[ebp-8]
	mov	reg79,[reg77]
	cmp	reg79,[reg78]
	jl	label0000
label0002:
	x86instr_destroy_stack_frame	48
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	lea	reg2,[ebp+12]
	mov	reg3,[reg1]
	cmp	reg3,[reg2]
	jg	label0000
	x86instr_push_all
	lea	reg4,[ebp+40]
	push	dword ptr [reg4]
	lea	reg5,[ebp+36]
	push	dword ptr [reg5]
	lea	reg6,[ebp+24]
	push	dword ptr [reg6]
	lea	reg7,[ebp+20]
	push	dword ptr [reg7]
	lea	reg8,[ebp+16]
	push	dword ptr [reg8]
	lea	reg9,[ebp+12]
	push	dword ptr [reg9]
	lea	reg10,[ebp+8]
	push	dword ptr [reg10]
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0001
label0000:
	x86instr_push_all
	lea	reg11,[ebp+40]
	push	dword ptr [reg11]
	lea	reg12,[ebp+36]
	push	dword ptr [reg12]
	lea	reg13,[ebp+32]
	push	dword ptr [reg13]
	lea	reg14,[ebp+28]
	push	dword ptr [reg14]
	lea	reg15,[ebp+16]
	push	dword ptr [reg15]
	lea	reg16,[ebp+8]
	push	dword ptr [reg16]
	lea	reg17,[ebp+12]
	push	dword ptr [reg17]
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
label0001:
	x86instr_destroy_stack_frame	0
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	x86instr_create_stack_frame	0
	lea	reg1,[ebp+8]
	lea	reg2,[ebp+12]
	mov	reg3,[reg1]
	cmp	reg3,[reg2]
	jge	label0000
	lea	reg4,[ebp+16]
	lea	reg5,[ebp+12]
	mov	reg6,[reg4]
	cmp	reg6,[reg5]
	jle	label0001
	x86instr_push_all
	lea	reg7,[ebp+40]
	push	dword ptr [reg7]
	lea	reg8,[ebp+36]
	push	dword ptr [reg8]
	lea	reg9,[ebp+24]
	mov	reg10,4
	add	reg10,[reg9]
	push	dword ptr [reg10]
	lea	reg11,[ebp+24]
	mov	reg12,[reg11]
	push	dword ptr [reg12]
	lea	reg13,[ebp+20]
	push	dword ptr [reg13]
	lea	reg14,[ebp+16]
	push	dword ptr [reg14]
	lea	reg15,[ebp+8]
	push	dword ptr [reg15]
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0002
label0001:
	lea	reg16,[ebp+16]
	lea	reg17,[ebp+8]
	mov	reg18,[reg16]
	cmp	reg18,[reg17]
	jge	label0003
	x86instr_push_all
	lea	reg19,[ebp+40]
	push	dword ptr [reg19]
	lea	reg20,[ebp+36]
	push	dword ptr [reg20]
	lea	reg21,[ebp+32]
	mov	reg22,4
	add	reg22,[reg21]
	push	dword ptr [reg22]
	lea	reg23,[ebp+32]
	mov	reg24,[reg23]
	push	dword ptr [reg24]
	lea	reg25,[ebp+20]
	push	dword ptr [reg25]
	lea	reg26,[ebp+12]
	push	dword ptr [reg26]
	lea	reg27,[ebp+16]
	push	dword ptr [reg27]
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0004
label0003:
	x86instr_push_all
	lea	reg28,[ebp+40]
	push	dword ptr [reg28]
	lea	reg29,[ebp+36]
	push	dword ptr [reg29]
	lea	reg30,[ebp+24]
	mov	reg31,4
	add	reg31,[reg30]
	push	dword ptr [reg31]
	lea	reg32,[ebp+24]
	mov	reg33,[reg32]
	push	dword ptr [reg33]
	lea	reg34,[ebp+20]
	push	dword ptr [reg34]
	lea	reg35,[ebp+12]
	push	dword ptr [reg35]
	lea	reg36,[ebp+8]
	push	dword ptr [reg36]
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
label0004:
label0002:
	jmp	label0005
label0000:
	lea	reg37,[ebp+16]
	lea	reg38,[ebp+12]
	mov	reg39,[reg37]
	cmp	reg39,[reg38]
	jge	label0006
	x86instr_push_all
	lea	reg40,[ebp+40]
	fld	dword ptr [reg40]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg41,[ebp+36]
	fld	dword ptr [reg41]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg42,[ebp+32]
	mov	reg43,4
	add	reg43,[reg42]
	push	dword ptr [reg43]
	lea	reg44,[ebp+32]
	mov	reg45,[reg44]
	push	dword ptr [reg45]
	lea	reg46,[ebp+20]
	push	dword ptr [reg46]
	lea	reg47,[ebp+8]
	push	dword ptr [reg47]
	lea	reg48,[ebp+16]
	push	dword ptr [reg48]
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0007
label0006:
	lea	reg49,[ebp+16]
	lea	reg50,[ebp+8]
	mov	reg51,[reg49]
	cmp	reg51,[reg50]
	jle	label0008
	x86instr_push_all
	lea	reg52,[ebp+40]
	fld	dword ptr [reg52]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg53,[ebp+36]
	fld	dword ptr [reg53]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg54,[ebp+28]
	mov	reg55,4
	add	reg55,[reg54]
	push	dword ptr [reg55]
	lea	reg56,[ebp+28]
	mov	reg57,[reg56]
	push	dword ptr [reg57]
	lea	reg58,[ebp+20]
	push	dword ptr [reg58]
	lea	reg59,[ebp+16]
	push	dword ptr [reg59]
	lea	reg60,[ebp+12]
	push	dword ptr [reg60]
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
	jmp	label0009
label0008:
	x86instr_push_all
	lea	reg61,[ebp+40]
	fld	dword ptr [reg61]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg62,[ebp+36]
	fld	dword ptr [reg62]
	fldz
	fsubrp
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg63,[ebp+28]
	mov	reg64,4
	add	reg64,[reg63]
	push	dword ptr [reg64]
	lea	reg65,[ebp+28]
	mov	reg66,[reg65]
	push	dword ptr [reg66]
	lea	reg67,[ebp+20]
	push	dword ptr [reg67]
	lea	reg68,[ebp+8]
	push	dword ptr [reg68]
	lea	reg69,[ebp+12]
	push	dword ptr [reg69]
	call	__rasterize_horiz_line
	add	esp,28
	x86instr_pop_all
label0009:
label0007:
label0005:
	x86instr_destroy_stack_frame	0
	ret
__rasterize_triangle_1i endp	

__rasterize_triangle_2i proc
	x86instr_create_stack_frame	44
	lea	reg1,[ebp+8]
	mov	reg2,[reg1]
	mov	reg3,4
	add	reg2,reg3
	lea	reg4,[ebp+12]
	mov	reg5,[reg4]
	mov	reg6,4
	add	reg5,reg6
	mov	reg7,[reg2]
	cmp	reg7,[reg5]
	jle	label0000
	lea	reg8,[ebp-4]
	lea	reg9,[ebp+8]
	mov	reg10,[reg9]
	mov	[reg8],reg10
	lea	reg11,[ebp+8]
	lea	reg12,[ebp+12]
	mov	reg13,[reg12]
	mov	[reg11],reg13
	lea	reg14,[ebp+12]
	lea	reg15,[ebp-4]
	mov	reg16,[reg15]
	mov	[reg14],reg16
label0000:
	lea	reg17,[ebp+8]
	mov	reg18,[reg17]
	mov	reg19,4
	add	reg18,reg19
	lea	reg20,[ebp+16]
	mov	reg21,[reg20]
	mov	reg22,4
	add	reg21,reg22
	mov	reg23,[reg18]
	cmp	reg23,[reg21]
	jle	label0001
	lea	reg24,[ebp-4]
	lea	reg25,[ebp+8]
	mov	reg26,[reg25]
	mov	[reg24],reg26
	lea	reg27,[ebp+8]
	lea	reg28,[ebp+16]
	mov	reg29,[reg28]
	mov	[reg27],reg29
	lea	reg30,[ebp+16]
	lea	reg31,[ebp-4]
	mov	reg32,[reg31]
	mov	[reg30],reg32
label0001:
	lea	reg33,[ebp+12]
	mov	reg34,[reg33]
	mov	reg35,4
	add	reg34,reg35
	lea	reg36,[ebp+16]
	mov	reg37,[reg36]
	mov	reg38,4
	add	reg37,reg38
	mov	reg39,[reg34]
	cmp	reg39,[reg37]
	jle	label0002
	lea	reg40,[ebp-4]
	lea	reg41,[ebp+12]
	mov	reg42,[reg41]
	mov	[reg40],reg42
	lea	reg43,[ebp+12]
	lea	reg44,[ebp+16]
	mov	reg45,[reg44]
	mov	[reg43],reg45
	lea	reg46,[ebp+16]
	lea	reg47,[ebp-4]
	mov	reg48,[reg47]
	mov	[reg46],reg48
label0002:
	lea	reg49,[ebp+8]
	mov	reg50,[reg49]
	mov	reg51,4
	add	reg50,reg51
	lea	reg52,[ebp+16]
	mov	reg53,[reg52]
	mov	reg54,4
	add	reg53,reg54
	mov	reg55,[reg50]
	cmp	reg55,[reg53]
	jne	label0003
	lea	reg56,[ebp+8]
	mov	reg57,[reg56]
	mov	reg58,4
	add	reg57,reg58
	mov	reg59,0
	cmp	[reg57],reg59
	jl	label0004
	lea	reg60,[ebp+8]
	mov	reg61,[reg60]
	mov	reg62,4
	add	reg61,reg62
	lea	reg63,[__height]
	mov	reg64,[reg61]
	cmp	reg64,[reg63]
	jge	label0004
	x86instr_push_all
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	fldz
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg65,[ebp+16]
	mov	reg66,8
	add	reg66,[reg65]
	push	reg66
	lea	reg67,[ebp+12]
	mov	reg68,8
	add	reg68,[reg67]
	push	reg68
	lea	reg69,[ebp+8]
	mov	reg70,8
	add	reg70,[reg69]
	push	reg70
	lea	reg71,[ebp+8]
	mov	reg72,[reg71]
	mov	reg73,4
	add	reg72,reg73
	push	dword ptr [reg72]
	lea	reg74,[ebp+16]
	mov	reg75,[reg74]
	push	dword ptr [reg75]
	lea	reg76,[ebp+12]
	mov	reg77,[reg76]
	push	dword ptr [reg77]
	lea	reg78,[ebp+8]
	mov	reg79,[reg78]
	push	dword ptr [reg79]
	call	__rasterize_triangle_1i
	add	esp,36
	x86instr_pop_all
label0004:
	x86instr_destroy_stack_frame	44
	ret
label0003:
	lea	reg80,[ebp+8]
	mov	reg81,[reg80]
	mov	reg82,4
	add	reg81,reg82
	lea	reg83,[ebp-16]
	mov	reg84,[reg81]
	mov	[reg83],reg84
label0005:
label0006:
	lea	reg85,[ebp-16]
	lea	reg86,[ebp+12]
	mov	reg87,[reg86]
	mov	reg88,4
	add	reg87,reg88
	mov	reg89,[reg85]
	cmp	reg89,[reg87]
	jge	label0007
	lea	reg90,[ebp+8]
	mov	reg91,[reg90]
	mov	reg92,4
	add	reg91,reg92
	lea	reg93,[ebp-16]
	mov	reg94,[reg93]
	sub	reg94,[reg91]
	lea	reg95,[ebp+12]
	mov	reg96,[reg95]
	lea	reg97,[ebp+8]
	mov	reg98,[reg97]
	mov	reg99,[reg96]
	sub	reg99,[reg98]
	imul	reg94,reg99
	lea	reg100,[ebp+12]
	mov	reg101,[reg100]
	mov	reg102,4
	add	reg101,reg102
	lea	reg103,[ebp+8]
	mov	reg104,[reg103]
	mov	reg105,4
	add	reg104,reg105
	mov	reg106,[reg101]
	sub	reg106,[reg104]
	mov	eax,reg94
	cdq
	idiv	reg106
	mov	reg107,eax
	lea	reg108,[ebp+8]
	mov	reg109,[reg108]
	add	reg107,[reg109]
	lea	reg110,[ebp-8]
	mov	[reg110],reg107
	lea	reg111,[ebp+8]
	mov	reg112,[reg111]
	mov	reg113,4
	add	reg112,reg113
	lea	reg114,[ebp-16]
	mov	reg115,[reg114]
	sub	reg115,[reg112]
	lea	reg116,[ebp+16]
	mov	reg117,[reg116]
	lea	reg118,[ebp+8]
	mov	reg119,[reg118]
	mov	reg120,[reg117]
	sub	reg120,[reg119]
	imul	reg115,reg120
	lea	reg121,[ebp+16]
	mov	reg122,[reg121]
	mov	reg123,4
	add	reg122,reg123
	lea	reg124,[ebp+8]
	mov	reg125,[reg124]
	mov	reg126,4
	add	reg125,reg126
	mov	reg127,[reg122]
	sub	reg127,[reg125]
	mov	eax,reg115
	cdq
	idiv	reg127
	mov	reg128,eax
	lea	reg129,[ebp+8]
	mov	reg130,[reg129]
	add	reg128,[reg130]
	lea	reg131,[ebp-12]
	mov	[reg131],reg128
	lea	reg132,[ebp-20]
	lea	reg133,[ebp+8]
	mov	reg134,[reg133]
	mov	reg135,4
	add	reg134,reg135
	lea	reg136,[ebp-16]
	mov	reg137,[reg136]
	sub	reg137,[reg134]
	mov	[ebp-44],reg137
	fild	dword ptr [ebp-44]
	lea	reg138,[ebp+12]
	mov	reg139,8
	add	reg139,[reg138]
	lea	reg140,[ebp+8]
	mov	reg141,8
	add	reg141,[reg140]
	fld	dword ptr [reg139]
	fsub	dword ptr [reg141]
	fmulp
	lea	reg142,[ebp+12]
	mov	reg143,[reg142]
	mov	reg144,4
	add	reg143,reg144
	lea	reg145,[ebp+8]
	mov	reg146,[reg145]
	mov	reg147,4
	add	reg146,reg147
	mov	reg148,[reg143]
	sub	reg148,[reg146]
	mov	[ebp-44],reg148
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg149,[ebp+8]
	mov	reg150,8
	add	reg150,[reg149]
	fadd	dword ptr [reg150]
	fstp	dword ptr [reg132]
	lea	reg151,[ebp-28]
	lea	reg152,[ebp+8]
	mov	reg153,[reg152]
	mov	reg154,4
	add	reg153,reg154
	lea	reg155,[ebp-16]
	mov	reg156,[reg155]
	sub	reg156,[reg153]
	mov	[ebp-44],reg156
	fild	dword ptr [ebp-44]
	lea	reg157,[ebp+16]
	mov	reg158,8
	add	reg158,[reg157]
	lea	reg159,[ebp+8]
	mov	reg160,8
	add	reg160,[reg159]
	fld	dword ptr [reg158]
	fsub	dword ptr [reg160]
	fmulp
	lea	reg161,[ebp+16]
	mov	reg162,[reg161]
	mov	reg163,4
	add	reg162,reg163
	lea	reg164,[ebp+8]
	mov	reg165,[reg164]
	mov	reg166,4
	add	reg165,reg166
	mov	reg167,[reg162]
	sub	reg167,[reg165]
	mov	[ebp-44],reg167
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg168,[ebp+8]
	mov	reg169,8
	add	reg169,[reg168]
	fadd	dword ptr [reg169]
	fstp	dword ptr [reg151]
	lea	reg170,[ebp-24]
	lea	reg171,[ebp+8]
	mov	reg172,[reg171]
	mov	reg173,4
	add	reg172,reg173
	lea	reg174,[ebp-16]
	mov	reg175,[reg174]
	sub	reg175,[reg172]
	mov	[ebp-44],reg175
	fild	dword ptr [ebp-44]
	lea	reg176,[ebp+12]
	mov	reg177,8
	add	reg177,[reg176]
	mov	reg178,4
	add	reg177,reg178
	lea	reg179,[ebp+8]
	mov	reg180,8
	add	reg180,[reg179]
	mov	reg181,4
	add	reg180,reg181
	fld	dword ptr [reg177]
	fsub	dword ptr [reg180]
	fmulp
	lea	reg182,[ebp+12]
	mov	reg183,[reg182]
	mov	reg184,4
	add	reg183,reg184
	lea	reg185,[ebp+8]
	mov	reg186,[reg185]
	mov	reg187,4
	add	reg186,reg187
	mov	reg188,[reg183]
	sub	reg188,[reg186]
	mov	[ebp-44],reg188
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg189,[ebp+8]
	mov	reg190,8
	add	reg190,[reg189]
	mov	reg191,4
	add	reg190,reg191
	fadd	dword ptr [reg190]
	fstp	dword ptr [reg170]
	lea	reg192,[ebp-32]
	lea	reg193,[ebp+8]
	mov	reg194,[reg193]
	mov	reg195,4
	add	reg194,reg195
	lea	reg196,[ebp-16]
	mov	reg197,[reg196]
	sub	reg197,[reg194]
	mov	[ebp-44],reg197
	fild	dword ptr [ebp-44]
	lea	reg198,[ebp+16]
	mov	reg199,8
	add	reg199,[reg198]
	mov	reg200,4
	add	reg199,reg200
	lea	reg201,[ebp+8]
	mov	reg202,8
	add	reg202,[reg201]
	mov	reg203,4
	add	reg202,reg203
	fld	dword ptr [reg199]
	fsub	dword ptr [reg202]
	fmulp
	lea	reg204,[ebp+16]
	mov	reg205,[reg204]
	mov	reg206,4
	add	reg205,reg206
	lea	reg207,[ebp+8]
	mov	reg208,[reg207]
	mov	reg209,4
	add	reg208,reg209
	mov	reg210,[reg205]
	sub	reg210,[reg208]
	mov	[ebp-44],reg210
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg211,[ebp+8]
	mov	reg212,8
	add	reg212,[reg211]
	mov	reg213,4
	add	reg212,reg213
	fadd	dword ptr [reg212]
	fstp	dword ptr [reg192]
	lea	reg214,[ebp-36]
	lea	reg215,[ebp-28]
	lea	reg216,[ebp-20]
	fld	dword ptr [reg215]
	fsub	dword ptr [reg216]
	lea	reg217,[ebp-12]
	lea	reg218,[ebp-8]
	mov	reg219,[reg217]
	sub	reg219,[reg218]
	mov	[ebp-44],reg219
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [reg214]
	lea	reg220,[ebp-40]
	lea	reg221,[ebp-32]
	lea	reg222,[ebp-24]
	fld	dword ptr [reg221]
	fsub	dword ptr [reg222]
	lea	reg223,[ebp-12]
	lea	reg224,[ebp-8]
	mov	reg225,[reg223]
	sub	reg225,[reg224]
	mov	[ebp-44],reg225
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [reg220]
	x86instr_push_all
	lea	reg226,[ebp-40]
	push	dword ptr [reg226]
	lea	reg227,[ebp-36]
	push	dword ptr [reg227]
	lea	reg228,[ebp-32]
	push	dword ptr [reg228]
	lea	reg229,[ebp-28]
	push	dword ptr [reg229]
	lea	reg230,[ebp-24]
	push	dword ptr [reg230]
	lea	reg231,[ebp-20]
	push	dword ptr [reg231]
	lea	reg232,[ebp-16]
	push	dword ptr [reg232]
	lea	reg233,[ebp-12]
	push	dword ptr [reg233]
	lea	reg234,[ebp-8]
	push	dword ptr [reg234]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	x86instr_pop_all
	lea	reg235,[ebp-16]
	inc	dword ptr [reg235]
	jmp	label0006
label0007:
	lea	reg236,[ebp+12]
	mov	reg237,[reg236]
	mov	reg238,4
	add	reg237,reg238
	lea	reg239,[ebp+8]
	mov	reg240,[reg239]
	mov	reg241,4
	add	reg240,reg241
	mov	reg242,[reg237]
	sub	reg242,[reg240]
	lea	reg243,[ebp+16]
	mov	reg244,[reg243]
	lea	reg245,[ebp+8]
	mov	reg246,[reg245]
	mov	reg247,[reg244]
	sub	reg247,[reg246]
	imul	reg242,reg247
	lea	reg248,[ebp+16]
	mov	reg249,[reg248]
	mov	reg250,4
	add	reg249,reg250
	lea	reg251,[ebp+8]
	mov	reg252,[reg251]
	mov	reg253,4
	add	reg252,reg253
	mov	reg254,[reg249]
	sub	reg254,[reg252]
	mov	eax,reg242
	cdq
	idiv	reg254
	mov	reg255,eax
	lea	reg256,[ebp+8]
	mov	reg257,[reg256]
	add	reg255,[reg257]
	lea	reg258,[ebp-12]
	mov	[reg258],reg255
	lea	reg259,[ebp-28]
	lea	reg260,[ebp+12]
	mov	reg261,[reg260]
	mov	reg262,4
	add	reg261,reg262
	lea	reg263,[ebp+8]
	mov	reg264,[reg263]
	mov	reg265,4
	add	reg264,reg265
	mov	reg266,[reg261]
	sub	reg266,[reg264]
	mov	[ebp-44],reg266
	fild	dword ptr [ebp-44]
	lea	reg267,[ebp+16]
	mov	reg268,8
	add	reg268,[reg267]
	lea	reg269,[ebp+8]
	mov	reg270,8
	add	reg270,[reg269]
	fld	dword ptr [reg268]
	fsub	dword ptr [reg270]
	fmulp
	lea	reg271,[ebp+16]
	mov	reg272,[reg271]
	mov	reg273,4
	add	reg272,reg273
	lea	reg274,[ebp+8]
	mov	reg275,[reg274]
	mov	reg276,4
	add	reg275,reg276
	mov	reg277,[reg272]
	sub	reg277,[reg275]
	mov	[ebp-44],reg277
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg278,[ebp+8]
	mov	reg279,8
	add	reg279,[reg278]
	fadd	dword ptr [reg279]
	fstp	dword ptr [reg259]
	lea	reg280,[ebp-32]
	lea	reg281,[ebp+12]
	mov	reg282,[reg281]
	mov	reg283,4
	add	reg282,reg283
	lea	reg284,[ebp+8]
	mov	reg285,[reg284]
	mov	reg286,4
	add	reg285,reg286
	mov	reg287,[reg282]
	sub	reg287,[reg285]
	mov	[ebp-44],reg287
	fild	dword ptr [ebp-44]
	lea	reg288,[ebp+16]
	mov	reg289,8
	add	reg289,[reg288]
	mov	reg290,4
	add	reg289,reg290
	lea	reg291,[ebp+8]
	mov	reg292,8
	add	reg292,[reg291]
	mov	reg293,4
	add	reg292,reg293
	fld	dword ptr [reg289]
	fsub	dword ptr [reg292]
	fmulp
	lea	reg294,[ebp+16]
	mov	reg295,[reg294]
	mov	reg296,4
	add	reg295,reg296
	lea	reg297,[ebp+8]
	mov	reg298,[reg297]
	mov	reg299,4
	add	reg298,reg299
	mov	reg300,[reg295]
	sub	reg300,[reg298]
	mov	[ebp-44],reg300
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg301,[ebp+8]
	mov	reg302,8
	add	reg302,[reg301]
	mov	reg303,4
	add	reg302,reg303
	fadd	dword ptr [reg302]
	fstp	dword ptr [reg280]
	lea	reg304,[ebp-36]
	lea	reg305,[ebp-28]
	lea	reg306,[ebp+12]
	mov	reg307,8
	add	reg307,[reg306]
	fld	dword ptr [reg305]
	fsub	dword ptr [reg307]
	lea	reg308,[ebp+12]
	mov	reg309,[reg308]
	lea	reg310,[ebp-12]
	mov	reg311,[reg310]
	sub	reg311,[reg309]
	mov	[ebp-44],reg311
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [reg304]
	lea	reg312,[ebp-40]
	lea	reg313,[ebp-32]
	lea	reg314,[ebp+12]
	mov	reg315,8
	add	reg315,[reg314]
	mov	reg316,4
	add	reg315,reg316
	fld	dword ptr [reg313]
	fsub	dword ptr [reg315]
	lea	reg317,[ebp+12]
	mov	reg318,[reg317]
	lea	reg319,[ebp-12]
	mov	reg320,[reg319]
	sub	reg320,[reg318]
	mov	[ebp-44],reg320
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [reg312]
	x86instr_push_all
	lea	reg321,[ebp-40]
	push	dword ptr [reg321]
	lea	reg322,[ebp-36]
	push	dword ptr [reg322]
	lea	reg323,[ebp+12]
	mov	reg324,8
	add	reg324,[reg323]
	mov	reg325,4
	add	reg324,reg325
	push	dword ptr [reg324]
	lea	reg326,[ebp+12]
	mov	reg327,8
	add	reg327,[reg326]
	push	dword ptr [reg327]
	lea	reg328,[ebp-32]
	push	dword ptr [reg328]
	lea	reg329,[ebp-28]
	push	dword ptr [reg329]
	lea	reg330,[ebp+12]
	mov	reg331,[reg330]
	mov	reg332,4
	add	reg331,reg332
	push	dword ptr [reg331]
	lea	reg333,[ebp+12]
	mov	reg334,[reg333]
	push	dword ptr [reg334]
	lea	reg335,[ebp-12]
	push	dword ptr [reg335]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	x86instr_pop_all
	lea	reg336,[ebp+12]
	mov	reg337,[reg336]
	mov	reg338,4
	add	reg337,reg338
	mov	reg339,1
	add	reg339,[reg337]
	lea	reg340,[ebp-16]
	mov	[reg340],reg339
label0008:
label0009:
	lea	reg341,[ebp-16]
	lea	reg342,[ebp+16]
	mov	reg343,[reg342]
	mov	reg344,4
	add	reg343,reg344
	mov	reg345,[reg341]
	cmp	reg345,[reg343]
	jge	label000a
	lea	reg346,[ebp+12]
	mov	reg347,[reg346]
	mov	reg348,4
	add	reg347,reg348
	lea	reg349,[ebp-16]
	mov	reg350,[reg349]
	sub	reg350,[reg347]
	lea	reg351,[ebp+16]
	mov	reg352,[reg351]
	lea	reg353,[ebp+12]
	mov	reg354,[reg353]
	mov	reg355,[reg352]
	sub	reg355,[reg354]
	imul	reg350,reg355
	lea	reg356,[ebp+16]
	mov	reg357,[reg356]
	mov	reg358,4
	add	reg357,reg358
	lea	reg359,[ebp+12]
	mov	reg360,[reg359]
	mov	reg361,4
	add	reg360,reg361
	mov	reg362,[reg357]
	sub	reg362,[reg360]
	mov	eax,reg350
	cdq
	idiv	reg362
	mov	reg363,eax
	lea	reg364,[ebp+12]
	mov	reg365,[reg364]
	add	reg363,[reg365]
	lea	reg366,[ebp-8]
	mov	[reg366],reg363
	lea	reg367,[ebp+8]
	mov	reg368,[reg367]
	mov	reg369,4
	add	reg368,reg369
	lea	reg370,[ebp-16]
	mov	reg371,[reg370]
	sub	reg371,[reg368]
	lea	reg372,[ebp+16]
	mov	reg373,[reg372]
	lea	reg374,[ebp+8]
	mov	reg375,[reg374]
	mov	reg376,[reg373]
	sub	reg376,[reg375]
	imul	reg371,reg376
	lea	reg377,[ebp+16]
	mov	reg378,[reg377]
	mov	reg379,4
	add	reg378,reg379
	lea	reg380,[ebp+8]
	mov	reg381,[reg380]
	mov	reg382,4
	add	reg381,reg382
	mov	reg383,[reg378]
	sub	reg383,[reg381]
	mov	eax,reg371
	cdq
	idiv	reg383
	mov	reg384,eax
	lea	reg385,[ebp+8]
	mov	reg386,[reg385]
	add	reg384,[reg386]
	lea	reg387,[ebp-12]
	mov	[reg387],reg384
	lea	reg388,[ebp-20]
	lea	reg389,[ebp+12]
	mov	reg390,[reg389]
	mov	reg391,4
	add	reg390,reg391
	lea	reg392,[ebp-16]
	mov	reg393,[reg392]
	sub	reg393,[reg390]
	mov	[ebp-44],reg393
	fild	dword ptr [ebp-44]
	lea	reg394,[ebp+16]
	mov	reg395,8
	add	reg395,[reg394]
	lea	reg396,[ebp+12]
	mov	reg397,8
	add	reg397,[reg396]
	fld	dword ptr [reg395]
	fsub	dword ptr [reg397]
	fmulp
	lea	reg398,[ebp+16]
	mov	reg399,[reg398]
	mov	reg400,4
	add	reg399,reg400
	lea	reg401,[ebp+12]
	mov	reg402,[reg401]
	mov	reg403,4
	add	reg402,reg403
	mov	reg404,[reg399]
	sub	reg404,[reg402]
	mov	[ebp-44],reg404
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg405,[ebp+12]
	mov	reg406,8
	add	reg406,[reg405]
	fadd	dword ptr [reg406]
	fstp	dword ptr [reg388]
	lea	reg407,[ebp-28]
	lea	reg408,[ebp+8]
	mov	reg409,[reg408]
	mov	reg410,4
	add	reg409,reg410
	lea	reg411,[ebp-16]
	mov	reg412,[reg411]
	sub	reg412,[reg409]
	mov	[ebp-44],reg412
	fild	dword ptr [ebp-44]
	lea	reg413,[ebp+16]
	mov	reg414,8
	add	reg414,[reg413]
	lea	reg415,[ebp+8]
	mov	reg416,8
	add	reg416,[reg415]
	fld	dword ptr [reg414]
	fsub	dword ptr [reg416]
	fmulp
	lea	reg417,[ebp+16]
	mov	reg418,[reg417]
	mov	reg419,4
	add	reg418,reg419
	lea	reg420,[ebp+8]
	mov	reg421,[reg420]
	mov	reg422,4
	add	reg421,reg422
	mov	reg423,[reg418]
	sub	reg423,[reg421]
	mov	[ebp-44],reg423
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg424,[ebp+8]
	mov	reg425,8
	add	reg425,[reg424]
	fadd	dword ptr [reg425]
	fstp	dword ptr [reg407]
	lea	reg426,[ebp-24]
	lea	reg427,[ebp+12]
	mov	reg428,[reg427]
	mov	reg429,4
	add	reg428,reg429
	lea	reg430,[ebp-16]
	mov	reg431,[reg430]
	sub	reg431,[reg428]
	mov	[ebp-44],reg431
	fild	dword ptr [ebp-44]
	lea	reg432,[ebp+16]
	mov	reg433,8
	add	reg433,[reg432]
	mov	reg434,4
	add	reg433,reg434
	lea	reg435,[ebp+12]
	mov	reg436,8
	add	reg436,[reg435]
	mov	reg437,4
	add	reg436,reg437
	fld	dword ptr [reg433]
	fsub	dword ptr [reg436]
	fmulp
	lea	reg438,[ebp+16]
	mov	reg439,[reg438]
	mov	reg440,4
	add	reg439,reg440
	lea	reg441,[ebp+12]
	mov	reg442,[reg441]
	mov	reg443,4
	add	reg442,reg443
	mov	reg444,[reg439]
	sub	reg444,[reg442]
	mov	[ebp-44],reg444
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg445,[ebp+12]
	mov	reg446,8
	add	reg446,[reg445]
	mov	reg447,4
	add	reg446,reg447
	fadd	dword ptr [reg446]
	fstp	dword ptr [reg426]
	lea	reg448,[ebp-32]
	lea	reg449,[ebp+8]
	mov	reg450,[reg449]
	mov	reg451,4
	add	reg450,reg451
	lea	reg452,[ebp-16]
	mov	reg453,[reg452]
	sub	reg453,[reg450]
	mov	[ebp-44],reg453
	fild	dword ptr [ebp-44]
	lea	reg454,[ebp+16]
	mov	reg455,8
	add	reg455,[reg454]
	mov	reg456,4
	add	reg455,reg456
	lea	reg457,[ebp+8]
	mov	reg458,8
	add	reg458,[reg457]
	mov	reg459,4
	add	reg458,reg459
	fld	dword ptr [reg455]
	fsub	dword ptr [reg458]
	fmulp
	lea	reg460,[ebp+16]
	mov	reg461,[reg460]
	mov	reg462,4
	add	reg461,reg462
	lea	reg463,[ebp+8]
	mov	reg464,[reg463]
	mov	reg465,4
	add	reg464,reg465
	mov	reg466,[reg461]
	sub	reg466,[reg464]
	mov	[ebp-44],reg466
	fild	dword ptr [ebp-44]
	fdivp
	lea	reg467,[ebp+8]
	mov	reg468,8
	add	reg468,[reg467]
	mov	reg469,4
	add	reg468,reg469
	fadd	dword ptr [reg468]
	fstp	dword ptr [reg448]
	lea	reg470,[ebp-36]
	lea	reg471,[ebp-28]
	lea	reg472,[ebp-20]
	fld	dword ptr [reg471]
	fsub	dword ptr [reg472]
	lea	reg473,[ebp-12]
	lea	reg474,[ebp-8]
	mov	reg475,[reg473]
	sub	reg475,[reg474]
	mov	[ebp-44],reg475
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [reg470]
	lea	reg476,[ebp-40]
	lea	reg477,[ebp-32]
	lea	reg478,[ebp-24]
	fld	dword ptr [reg477]
	fsub	dword ptr [reg478]
	lea	reg479,[ebp-12]
	lea	reg480,[ebp-8]
	mov	reg481,[reg479]
	sub	reg481,[reg480]
	mov	[ebp-44],reg481
	fild	dword ptr [ebp-44]
	fdivp
	fstp	dword ptr [reg476]
	x86instr_push_all
	lea	reg482,[ebp-40]
	push	dword ptr [reg482]
	lea	reg483,[ebp-36]
	push	dword ptr [reg483]
	lea	reg484,[ebp-32]
	push	dword ptr [reg484]
	lea	reg485,[ebp-28]
	push	dword ptr [reg485]
	lea	reg486,[ebp-24]
	push	dword ptr [reg486]
	lea	reg487,[ebp-20]
	push	dword ptr [reg487]
	lea	reg488,[ebp-16]
	push	dword ptr [reg488]
	lea	reg489,[ebp-12]
	push	dword ptr [reg489]
	lea	reg490,[ebp-8]
	push	dword ptr [reg490]
	call	__rasterize_horiz_line__unordered
	add	esp,36
	x86instr_pop_all
	lea	reg491,[ebp-16]
	inc	dword ptr [reg491]
	jmp	label0009
label000a:
	x86instr_destroy_stack_frame	44
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	x86instr_create_stack_frame	60
	lea	reg1,[ebp+8]
	mov	reg2,192
	add	reg2,[reg1]
	mov	reg3,0
	mov	[reg2],reg3
	lea	reg4,[ebp+12]
	mov	reg5,[reg4]
	lea	reg6,[ebp-4]
	mov	[reg6],reg5
	lea	reg7,[ebp+12]
	mov	reg8,[reg7]
	mov	reg9,24
	add	reg8,reg9
	lea	reg10,[ebp-8]
	mov	[reg10],reg8
label0000:
label0001:
	lea	reg11,[ebp-8]
	lea	reg12,[ebp+12]
	mov	reg13,192
	add	reg13,[reg12]
	mov	reg14,24
	imul	reg14,[reg13]
	lea	reg15,[ebp+12]
	mov	reg16,[reg15]
	add	reg16,reg14
	cmp	[reg11],reg16
	jge	label0002
	x86instr_push_all
	lea	reg17,[ebp+16]
	push	dword ptr [reg17]
	lea	reg18,[ebp-4]
	mov	reg19,[reg18]
	push	reg19
	lea	reg20,[ebp-24]
	push	reg20
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	lea	reg21,[ebp-52]
	x86instr_push_all
	lea	reg22,[ebp+20]
	push	dword ptr [reg22]
	lea	reg23,[ebp-24]
	push	reg23
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	fstp	dword ptr [reg21]
	x86instr_push_all
	lea	reg24,[ebp+16]
	push	dword ptr [reg24]
	lea	reg25,[ebp-8]
	mov	reg26,[reg25]
	push	reg26
	lea	reg27,[ebp-24]
	push	reg27
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	lea	reg28,[ebp-56]
	x86instr_push_all
	lea	reg29,[ebp+20]
	push	dword ptr [reg29]
	lea	reg30,[ebp-24]
	push	reg30
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	fstp	dword ptr [reg28]
	lea	reg31,[ebp-52]
	fldz
	fld	dword ptr [reg31]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	lea	reg32,[ebp+8]
	mov	reg33,192
	add	reg33,[reg32]
	mov	reg34,[reg33]
	inc	dword ptr [reg33]
	mov	reg35,24
	imul	reg34,reg35
	lea	reg36,[ebp+8]
	mov	reg37,[reg36]
	add	reg37,reg34
	lea	reg38,[ebp-4]
	mov	reg39,[reg38]
	mov	reg40,[reg39]
	mov	reg41,[reg39+4]
	mov	[reg37],reg40
	mov	[reg37+4],reg41
	mov	reg40,[reg39+8]
	mov	reg41,[reg39+12]
	mov	[reg37+8],reg40
	mov	[reg37+12],reg41
	mov	reg40,[reg39+16]
	mov	reg41,[reg39+20]
	mov	[reg37+16],reg40
	mov	[reg37+20],reg41
label0003:
	lea	reg42,[ebp-52]
	fldz
	fld	dword ptr [reg42]
	fucomip	st,st(1)
	fstp	st
	jbe	label0006
	lea	reg43,[ebp-56]
	fldz
	fld	dword ptr [reg43]
	fucomip	st,st(1)
	fstp	st
	jb	label0005
label0006:
	lea	reg44,[ebp-56]
	fldz
	fld	dword ptr [reg44]
	fucomip	st,st(1)
	fstp	st
	jb	label0004
	lea	reg45,[ebp-52]
	fldz
	fld	dword ptr [reg45]
	fucomip	st,st(1)
	fstp	st
	jae	label0004
label0005:
	x86instr_push_all
	lea	reg46,[ebp-4]
	mov	reg47,[reg46]
	push	reg47
	lea	reg48,[ebp+16]
	push	dword ptr [reg48]
	lea	reg49,[ebp-24]
	push	reg49
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	lea	reg50,[ebp-4]
	mov	reg51,[reg50]
	push	reg51
	lea	reg52,[ebp-8]
	mov	reg53,[reg52]
	push	reg53
	lea	reg54,[ebp-40]
	push	reg54
	call	_vec4f_subtract
	add	esp,12
	x86instr_pop_all
	lea	reg55,[ebp-60]
	x86instr_push_all
	lea	reg56,[ebp+20]
	push	dword ptr [reg56]
	lea	reg57,[ebp-24]
	push	reg57
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	x86instr_push_all
	lea	reg58,[ebp+20]
	push	dword ptr [reg58]
	lea	reg59,[ebp-40]
	push	reg59
	call	_vec4f_dot
	add	esp,8
	x86instr_pop_all
	fdivp
	fstp	dword ptr [reg55]
	x86instr_push_all
	lea	reg60,[ebp-60]
	push	dword ptr [reg60]
	lea	reg61,[ebp-40]
	push	reg61
	call	_vec4f_mul
	add	esp,8
	x86instr_pop_all
	x86instr_push_all
	lea	reg62,[ebp-40]
	push	reg62
	lea	reg63,[ebp-4]
	mov	reg64,[reg63]
	push	reg64
	lea	reg65,[ebp+8]
	mov	reg66,192
	add	reg66,[reg65]
	mov	reg67,24
	imul	reg67,[reg66]
	lea	reg68,[ebp+8]
	mov	reg69,[reg68]
	add	reg69,reg67
	push	reg69
	call	_vec4f_add
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	lea	reg70,[ebp-4]
	mov	reg71,16
	add	reg71,[reg70]
	push	reg71
	lea	reg72,[ebp-8]
	mov	reg73,16
	add	reg73,[reg72]
	push	reg73
	lea	reg74,[ebp-48]
	push	reg74
	call	_vec2f_subtract
	add	esp,12
	x86instr_pop_all
	x86instr_push_all
	lea	reg75,[ebp-60]
	push	dword ptr [reg75]
	lea	reg76,[ebp-48]
	push	reg76
	call	_vec2f_mul
	add	esp,8
	x86instr_pop_all
	x86instr_push_all
	lea	reg77,[ebp-48]
	push	reg77
	lea	reg78,[ebp-4]
	mov	reg79,16
	add	reg79,[reg78]
	push	reg79
	lea	reg80,[ebp+8]
	mov	reg81,192
	add	reg81,[reg80]
	mov	reg82,24
	imul	reg82,[reg81]
	lea	reg83,[ebp+8]
	mov	reg84,[reg83]
	add	reg84,reg82
	mov	reg85,16
	add	reg84,reg85
	push	reg84
	call	_vec2f_add
	add	esp,12
	x86instr_pop_all
	lea	reg86,[ebp+8]
	mov	reg87,192
	add	reg87,[reg86]
	inc	dword ptr [reg87]
label0004:
	lea	reg88,[ebp-4]
	add	dword ptr [reg88],24
	lea	reg89,[ebp-8]
	add	dword ptr [reg89],24
	jmp	label0001
label0002:
	lea	reg90,[ebp+8]
	mov	reg91,192
	add	reg91,[reg90]
	mov	reg92,[reg91]
	inc	dword ptr [reg91]
	mov	reg93,24
	imul	reg92,reg93
	lea	reg94,[ebp+8]
	mov	reg95,[reg94]
	add	reg95,reg92
	lea	reg96,[ebp+8]
	mov	reg97,[reg96]
	mov	reg98,[reg97]
	mov	reg99,[reg97+4]
	mov	[reg95],reg98
	mov	[reg95+4],reg99
	mov	reg98,[reg97+8]
	mov	reg99,[reg97+12]
	mov	[reg95+8],reg98
	mov	[reg95+12],reg99
	mov	reg98,[reg97+16]
	mov	reg99,[reg97+20]
	mov	[reg95+16],reg98
	mov	[reg95+20],reg99
	x86instr_destroy_stack_frame	60
	ret
__clip_on_plain endp	

__clip_poligon proc
	x86instr_create_stack_frame	196
	x86instr_push_all
	lea	reg1,[__clip_z_far_norm]
	push	reg1
	lea	reg2,[__clip_z_far_base]
	push	reg2
	lea	reg3,[ebp+8]
	push	dword ptr [reg3]
	lea	reg4,[ebp-196]
	push	reg4
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg5,[__clip_z_near_norm]
	push	reg5
	lea	reg6,[__clip_z_near_base]
	push	reg6
	lea	reg7,[ebp-196]
	push	reg7
	lea	reg8,[ebp+8]
	push	dword ptr [reg8]
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg9,[__clip_plane_left_norm]
	push	reg9
	lea	reg10,[__clip_plane_left_base]
	push	reg10
	lea	reg11,[ebp+8]
	push	dword ptr [reg11]
	lea	reg12,[ebp-196]
	push	reg12
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg13,[__clip_plane_right_norm]
	push	reg13
	lea	reg14,[__clip_plane_right_base]
	push	reg14
	lea	reg15,[ebp-196]
	push	reg15
	lea	reg16,[ebp+8]
	push	dword ptr [reg16]
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg17,[__clip_plane_top_norm]
	push	reg17
	lea	reg18,[__clip_plane_top_base]
	push	reg18
	lea	reg19,[ebp+8]
	push	dword ptr [reg19]
	lea	reg20,[ebp-196]
	push	reg20
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	x86instr_push_all
	lea	reg21,[__clip_plane_bottom_norm]
	push	reg21
	lea	reg22,[__clip_plane_bottom_base]
	push	reg22
	lea	reg23,[ebp-196]
	push	reg23
	lea	reg24,[ebp+8]
	push	dword ptr [reg24]
	call	__clip_on_plain
	add	esp,16
	x86instr_pop_all
	lea	reg25,[ebp+8]
	mov	reg26,192
	add	reg26,[reg25]
	mov	reg27,1
	cmp	[reg26],reg27
	setg	al
	movzx	reg28,al
	mov	eax,reg28
	x86instr_destroy_stack_frame	196
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	x86instr_create_stack_frame	24
	x86instr_push_all
	lea	reg1,[__viewport_matrix]
	push	reg1
	lea	reg2,[ebp+12]
	push	dword ptr [reg2]
	lea	reg3,[ebp-16]
	push	reg3
	call	_matrix4f_transform
	add	esp,12
	x86instr_pop_all
	lea	reg4,[ebp-20]
	fld1
	lea	reg5,[ebp-16]
	mov	reg6,12
	add	reg5,reg6
	fdiv	dword ptr [reg5]
	fstp	dword ptr [reg4]
	lea	reg7,[ebp-16]
	lea	reg8,[ebp-20]
	fld	dword ptr [reg7]
	fmul	dword ptr [reg8]
	fistp	dword ptr [ebp-24]
	lea	reg9,[ebp+8]
	mov	reg10,[reg9]
	mov	reg11,[ebp-24]
	mov	[reg10],reg11
	lea	reg12,[ebp-16]
	mov	reg13,4
	add	reg12,reg13
	lea	reg14,[ebp-20]
	fld	dword ptr [reg12]
	fmul	dword ptr [reg14]
	fistp	dword ptr [ebp-24]
	lea	reg15,[ebp+8]
	mov	reg16,4
	add	reg16,[reg15]
	mov	reg17,[ebp-24]
	mov	[reg16],reg17
	lea	reg18,[ebp+8]
	mov	reg19,[reg18]
	mov	reg20,0
	cmp	[reg19],reg20
	jl	label0001
	lea	reg21,[ebp+8]
	mov	reg22,[reg21]
	lea	reg23,[__width]
	mov	reg24,[reg22]
	cmp	reg24,[reg23]
	jge	label0001
	lea	reg25,[ebp+8]
	mov	reg26,4
	add	reg26,[reg25]
	mov	reg27,0
	cmp	[reg26],reg27
	jl	label0001
	lea	reg28,[ebp+8]
	mov	reg29,4
	add	reg29,[reg28]
	lea	reg30,[__height]
	mov	reg31,[reg29]
	cmp	reg31,[reg30]
	jl	label0000
label0001:
	mov	reg32,0
	mov	reg33,0
	mov	[reg32],reg33
label0000:
	x86instr_destroy_stack_frame	24
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	x86instr_create_stack_frame	136
	x86instr_push_all
	lea	reg1,[ebp+8]
	push	dword ptr [reg1]
	call	__clip_poligon
	add	esp,4
	x86instr_pop_all
	mov	reg2,eax
	cmp	reg2,0
	jne	label0000
	x86instr_destroy_stack_frame	136
	ret
label0000:
	lea	reg3,[ebp+8]
	mov	reg4,192
	add	reg4,[reg3]
	mov	reg5,8
	cmp	[reg4],reg5
	jle	label0001
	mov	reg6,0
	mov	reg7,0
	mov	[reg6],reg7
label0001:
	lea	reg8,[ebp-136]
	mov	reg9,0
	mov	[reg8],reg9
label0002:
label0003:
	lea	reg10,[ebp-136]
	lea	reg11,[ebp+8]
	mov	reg12,192
	add	reg12,[reg11]
	mov	reg13,[reg10]
	cmp	reg13,[reg12]
	jge	label0004
	x86instr_push_all
	lea	reg14,[ebp+8]
	mov	reg15,[reg14]
	lea	reg16,[ebp-136]
	mov	reg17,24
	imul	reg17,[reg16]
	add	reg15,reg17
	push	reg15
	lea	reg18,[ebp-132]
	lea	reg19,[ebp-136]
	mov	reg20,4
	mov	reg21,[reg19]
	sal	reg21,reg20
	add	reg18,reg21
	push	reg18
	call	__transform_to_screen_space
	add	esp,8
	x86instr_pop_all
	lea	reg22,[ebp-132]
	lea	reg23,[ebp-136]
	mov	reg24,4
	mov	reg25,[reg23]
	sal	reg25,reg24
	add	reg22,reg25
	mov	reg26,8
	add	reg22,reg26
	lea	reg27,[ebp+8]
	mov	reg28,[reg27]
	lea	reg29,[ebp-136]
	mov	reg30,24
	imul	reg30,[reg29]
	add	reg28,reg30
	mov	reg31,16
	add	reg28,reg31
	mov	reg32,[reg28]
	mov	reg33,[reg28+4]
	mov	[reg22],reg32
	mov	[reg22+4],reg33
	lea	reg34,[ebp-136]
	inc	dword ptr [reg34]
	jmp	label0003
label0004:
	lea	reg35,[ebp-136]
	mov	reg36,2
	mov	[reg35],reg36
label0005:
label0006:
	lea	reg37,[ebp-136]
	lea	reg38,[ebp+8]
	mov	reg39,192
	add	reg39,[reg38]
	mov	reg40,1
	mov	reg41,[reg39]
	sub	reg41,reg40
	cmp	[reg37],reg41
	jge	label0007
	x86instr_push_all
	lea	reg42,[ebp-132]
	lea	reg43,[ebp-136]
	mov	reg44,4
	mov	reg45,[reg43]
	sal	reg45,reg44
	add	reg42,reg45
	push	reg42
	lea	reg46,[ebp-136]
	mov	reg47,1
	mov	reg48,[reg46]
	sub	reg48,reg47
	mov	reg49,4
	sal	reg48,reg49
	lea	reg50,[ebp-132]
	add	reg50,reg48
	push	reg50
	lea	reg51,[ebp-132]
	push	reg51
	call	__rasterize_triangle_2i
	add	esp,12
	x86instr_pop_all
	lea	reg52,[ebp-136]
	inc	dword ptr [reg52]
	jmp	label0006
label0007:
	x86instr_destroy_stack_frame	136
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	x86instr_create_stack_frame	16
	x86instr_push_all
	fld1
	fstp	dword ptr [esp-4]
	sub	esp,4
	lea	reg1,[ebp+12]
	mov	reg2,8
	add	reg2,[reg1]
	push	dword ptr [reg2]
	lea	reg3,[ebp+12]
	mov	reg4,4
	add	reg4,[reg3]
	push	dword ptr [reg4]
	lea	reg5,[ebp+12]
	mov	reg6,[reg5]
	push	dword ptr [reg6]
	lea	reg7,[ebp-16]
	push	reg7
	call	_vec4f_assign
	add	esp,20
	x86instr_pop_all
	x86instr_push_all
	lea	reg8,[__mvproj_matrix]
	push	reg8
	lea	reg9,[ebp-16]
	push	reg9
	lea	reg10,[ebp+8]
	push	dword ptr [reg10]
	call	_matrix4f_transform
	add	esp,12
	x86instr_pop_all
	x86instr_destroy_stack_frame	16
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	x86instr_create_stack_frame	196
	x86instr_push_all
	lea	reg1,[ebp+8]
	push	dword ptr [reg1]
	lea	reg2,[ebp-196]
	push	reg2
	call	__transform_to_projection_space
	add	esp,8
	x86instr_pop_all
	lea	reg3,[ebp-196]
	mov	reg4,16
	add	reg3,reg4
	lea	reg5,[ebp+20]
	mov	reg6,[reg5]
	mov	reg7,[reg6]
	mov	reg8,[reg6+4]
	mov	[reg3],reg7
	mov	[reg3+4],reg8
	x86instr_push_all
	lea	reg9,[ebp+12]
	push	dword ptr [reg9]
	lea	reg10,[ebp-196]
	mov	reg11,24
	add	reg10,reg11
	push	reg10
	call	__transform_to_projection_space
	add	esp,8
	x86instr_pop_all
	lea	reg12,[ebp-196]
	mov	reg13,24
	add	reg12,reg13
	mov	reg14,16
	add	reg12,reg14
	lea	reg15,[ebp+24]
	mov	reg16,[reg15]
	mov	reg17,[reg16]
	mov	reg18,[reg16+4]
	mov	[reg12],reg17
	mov	[reg12+4],reg18
	x86instr_push_all
	lea	reg19,[ebp+16]
	push	dword ptr [reg19]
	lea	reg20,[ebp-196]
	mov	reg21,48
	add	reg20,reg21
	push	reg20
	call	__transform_to_projection_space
	add	esp,8
	x86instr_pop_all
	lea	reg22,[ebp-196]
	mov	reg23,48
	add	reg22,reg23
	mov	reg24,16
	add	reg22,reg24
	lea	reg25,[ebp+28]
	mov	reg26,[reg25]
	mov	reg27,[reg26]
	mov	reg28,[reg26+4]
	mov	[reg22],reg27
	mov	[reg22+4],reg28
	lea	reg29,[ebp-196]
	mov	reg30,72
	add	reg29,reg30
	lea	reg31,[ebp-196]
	mov	reg32,[reg31]
	mov	reg33,[reg31+4]
	mov	[reg29],reg32
	mov	[reg29+4],reg33
	mov	reg32,[reg31+8]
	mov	reg33,[reg31+12]
	mov	[reg29+8],reg32
	mov	[reg29+12],reg33
	mov	reg32,[reg31+16]
	mov	reg33,[reg31+20]
	mov	[reg29+16],reg32
	mov	[reg29+20],reg33
	lea	reg34,[ebp-196]
	mov	reg35,192
	add	reg34,reg35
	mov	reg36,4
	mov	[reg34],reg36
	x86instr_push_all
	lea	reg37,[ebp-196]
	push	reg37
	call	__rasterize_polygon_4f
	add	esp,4
	x86instr_pop_all
	x86instr_destroy_stack_frame	196
	ret
_rasterizer_triangle3f endp	

end
