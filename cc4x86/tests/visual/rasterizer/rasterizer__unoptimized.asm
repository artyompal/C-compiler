
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
___unnamed_float_0	dd	0.000100
public	___unnamed_float_0
___unnamed_float_1	dd	2.000000
public	___unnamed_float_1
___unnamed_float_2	dd	-1.000000
public	___unnamed_float_2
___unnamed_float_3	dd	255.000000
public	___unnamed_float_3

.code

_vec2f_add proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2]
	fadd	dword ptr [dword4]
	mov	dword6,[ebp+8]
	fstp	dword ptr [dword6]
	mov	dword8,[ebp+12]
	mov	dword10,[ebp+16]
	fld	dword ptr [dword8+4]
	fadd	dword ptr [dword10+4]
	mov	dword12,[ebp+8]
	fstp	dword ptr [dword12+4]
	destroy_stack_frame
	ret
_vec2f_add endp	

_vec2f_subtract proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2]
	fsub	dword ptr [dword4]
	mov	dword6,[ebp+8]
	fstp	dword ptr [dword6]
	mov	dword8,[ebp+12]
	mov	dword10,[ebp+16]
	fld	dword ptr [dword8+4]
	fsub	dword ptr [dword10+4]
	mov	dword12,[ebp+8]
	fstp	dword ptr [dword12+4]
	destroy_stack_frame
	ret
_vec2f_subtract endp	

_vec2f_mul proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld	dword ptr [dword2]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword2]
	mov	dword5,[ebp+8]
	fld	dword ptr [dword5+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword5+4]
	destroy_stack_frame
	ret
_vec2f_mul endp	

_vec4f_assign proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld	dword ptr [ebp+12]
	fstp	dword ptr [dword2]
	mov	dword5,[ebp+8]
	fld	dword ptr [ebp+16]
	fstp	dword ptr [dword5+4]
	mov	dword8,[ebp+8]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [dword8+8]
	mov	dword11,[ebp+8]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [dword11+12]
	destroy_stack_frame
	ret
_vec4f_assign endp	

_vec4f_add proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2]
	fadd	dword ptr [dword4]
	mov	dword6,[ebp+8]
	fstp	dword ptr [dword6]
	mov	dword8,[ebp+12]
	mov	dword10,[ebp+16]
	fld	dword ptr [dword8+4]
	fadd	dword ptr [dword10+4]
	mov	dword12,[ebp+8]
	fstp	dword ptr [dword12+4]
	mov	dword14,[ebp+12]
	mov	dword16,[ebp+16]
	fld	dword ptr [dword14+8]
	fadd	dword ptr [dword16+8]
	mov	dword18,[ebp+8]
	fstp	dword ptr [dword18+8]
	mov	dword20,[ebp+12]
	mov	dword22,[ebp+16]
	fld	dword ptr [dword20+12]
	fadd	dword ptr [dword22+12]
	mov	dword24,[ebp+8]
	fstp	dword ptr [dword24+12]
	destroy_stack_frame
	ret
_vec4f_add endp	

_vec4f_subtract proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2]
	fsub	dword ptr [dword4]
	mov	dword6,[ebp+8]
	fstp	dword ptr [dword6]
	mov	dword8,[ebp+12]
	mov	dword10,[ebp+16]
	fld	dword ptr [dword8+4]
	fsub	dword ptr [dword10+4]
	mov	dword12,[ebp+8]
	fstp	dword ptr [dword12+4]
	mov	dword14,[ebp+12]
	mov	dword16,[ebp+16]
	fld	dword ptr [dword14+8]
	fsub	dword ptr [dword16+8]
	mov	dword18,[ebp+8]
	fstp	dword ptr [dword18+8]
	mov	dword20,[ebp+12]
	mov	dword22,[ebp+16]
	fld	dword ptr [dword20+12]
	fsub	dword ptr [dword22+12]
	mov	dword24,[ebp+8]
	fstp	dword ptr [dword24+12]
	destroy_stack_frame
	ret
_vec4f_subtract endp	

_vec4f_dot proc
	create_stack_frame
	mov	dword2,[ebp+8]
	mov	dword4,[ebp+12]
	fld	dword ptr [dword2+4]
	fmul	dword ptr [dword4+4]
	mov	dword6,[ebp+8]
	mov	dword8,[ebp+12]
	fld	dword ptr [dword6]
	fmul	dword ptr [dword8]
	faddp
	mov	dword10,[ebp+8]
	mov	dword12,[ebp+12]
	fld	dword ptr [dword10+8]
	fmul	dword ptr [dword12+8]
	faddp
	mov	dword14,[ebp+8]
	mov	dword16,[ebp+12]
	fld	dword ptr [dword14+12]
	fmul	dword ptr [dword16+12]
	faddp
	return_valuep
	destroy_stack_frame
	ret
_vec4f_dot endp	

_vec4f_mul proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld	dword ptr [dword2]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword2]
	mov	dword5,[ebp+8]
	fld	dword ptr [dword5+4]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword5+4]
	mov	dword8,[ebp+8]
	fld	dword ptr [dword8+8]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword8+8]
	mov	dword11,[ebp+8]
	fld	dword ptr [dword11+12]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [dword11+12]
	destroy_stack_frame
	ret
_vec4f_mul endp	

_vec4f_is_equal proc
	create_stack_frame
	push_all
	push_arg	dword ptr [ebp+12],4
	push_arg	dword ptr [ebp+8],4
	lea	dword3,[ebp-16]
	push_arg	dword3,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	lea	dword4,[ebp-16]
	push_arg	dword4,4
	lea	dword5,[ebp-16]
	push_arg	dword5,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-20]
	fld	qword ptr [___unnamed_float_0]
	fucomip	st,st(1)
	fstp	st
	seta	byte1
	movzx	dword9,byte1
	return_value	dword9
	destroy_stack_frame
	ret
_vec4f_is_equal endp	

_matrix4f_make_identity proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld1
	fstp	dword ptr [dword2]
	mov	dword4,[ebp+8]
	fldz
	fstp	dword ptr [dword4+4]
	mov	dword6,[ebp+8]
	fldz
	fstp	dword ptr [dword6+8]
	mov	dword8,[ebp+8]
	fldz
	fstp	dword ptr [dword8+12]
	mov	dword10,[ebp+8]
	fldz
	fstp	dword ptr [dword10+16]
	mov	dword12,[ebp+8]
	fld1
	fstp	dword ptr [dword12+20]
	mov	dword14,[ebp+8]
	fldz
	fstp	dword ptr [dword14+24]
	mov	dword16,[ebp+8]
	fldz
	fstp	dword ptr [dword16+28]
	mov	dword18,[ebp+8]
	fldz
	fstp	dword ptr [dword18+32]
	mov	dword20,[ebp+8]
	fldz
	fstp	dword ptr [dword20+36]
	mov	dword22,[ebp+8]
	fld1
	fstp	dword ptr [dword22+40]
	mov	dword24,[ebp+8]
	fldz
	fstp	dword ptr [dword24+44]
	mov	dword26,[ebp+8]
	fldz
	fstp	dword ptr [dword26+48]
	mov	dword28,[ebp+8]
	fldz
	fstp	dword ptr [dword28+52]
	mov	dword30,[ebp+8]
	fldz
	fstp	dword ptr [dword30+56]
	mov	dword32,[ebp+8]
	fld1
	fstp	dword ptr [dword32+60]
	destroy_stack_frame
	ret
_matrix4f_make_identity endp	

_matrix4f_make_perspective proc
	create_stack_frame
	fld	dword ptr [ebp+20]
	fmul	dword ptr [ebp+12]
	fstp	dword ptr [ebp-4]
	fld	dword ptr [ebp-4]
	fmul	dword ptr [ebp+24]
	fstp	dword ptr [ebp-8]
	mov	dword8,[ebp+8]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-8]
	fstp	dword ptr [dword8]
	mov	dword12,[ebp+8]
	fldz
	fstp	dword ptr [dword12+4]
	mov	dword14,[ebp+8]
	fldz
	fstp	dword ptr [dword14+8]
	mov	dword16,[ebp+8]
	fldz
	fstp	dword ptr [dword16+12]
	mov	dword18,[ebp+8]
	fldz
	fstp	dword ptr [dword18+16]
	mov	dword20,[ebp+8]
	fld	dword ptr [ebp+12]
	fdiv	dword ptr [ebp-4]
	fstp	dword ptr [dword20+20]
	mov	dword24,[ebp+8]
	fldz
	fstp	dword ptr [dword24+24]
	mov	dword26,[ebp+8]
	fldz
	fstp	dword ptr [dword26+28]
	mov	dword28,[ebp+8]
	fldz
	fstp	dword ptr [dword28+32]
	mov	dword30,[ebp+8]
	fldz
	fstp	dword ptr [dword30+36]
	mov	dword32,[ebp+8]
	fld	dword ptr [ebp+16]
	fsub	dword ptr [ebp+12]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [dword32+40]
	mov	dword37,[ebp+8]
	fld1
	fstp	dword ptr [dword37+44]
	mov	dword39,[ebp+8]
	fldz
	fstp	dword ptr [dword39+48]
	mov	dword41,[ebp+8]
	fldz
	fstp	dword ptr [dword41+52]
	mov	dword43,[ebp+8]
	fld	dword ptr [ebp+12]
	fmul	dword ptr [ebp+16]
	fld	dword ptr [ebp+12]
	fsub	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [dword43+56]
	mov	dword49,[ebp+8]
	fldz
	fstp	dword ptr [dword49+60]
	destroy_stack_frame
	ret
_matrix4f_make_perspective endp	

_matrix4f_make_viewport proc
	create_stack_frame
	mov	dword2,[ebp+8]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [dword2]
	mov	dword6,[ebp+8]
	fldz
	fstp	dword ptr [dword6+4]
	mov	dword8,[ebp+8]
	fldz
	fstp	dword ptr [dword8+8]
	mov	dword10,[ebp+8]
	fldz
	fstp	dword ptr [dword10+12]
	mov	dword12,[ebp+8]
	fldz
	fstp	dword ptr [dword12+16]
	mov	dword14,[ebp+8]
	fld	dword ptr [ebp+16]
	fldz
	fsubrp
	fld	dword ptr [___unnamed_float_1]
	fdivp
	fstp	dword ptr [dword14+20]
	mov	dword18,[ebp+8]
	fldz
	fstp	dword ptr [dword18+24]
	mov	dword20,[ebp+8]
	fldz
	fstp	dword ptr [dword20+28]
	mov	dword22,[ebp+8]
	fldz
	fstp	dword ptr [dword22+32]
	mov	dword24,[ebp+8]
	fldz
	fstp	dword ptr [dword24+36]
	mov	dword26,[ebp+8]
	fld	dword ptr [ebp+24]
	fsub	dword ptr [ebp+20]
	fstp	dword ptr [dword26+40]
	mov	dword30,[ebp+8]
	fldz
	fstp	dword ptr [dword30+44]
	mov	dword32,[ebp+8]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+12]
	fstp	dword ptr [dword32+48]
	mov	dword36,[ebp+8]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp+16]
	fstp	dword ptr [dword36+52]
	mov	dword40,[ebp+8]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [dword40+56]
	mov	dword43,[ebp+8]
	fld1
	fstp	dword ptr [dword43+60]
	destroy_stack_frame
	ret
_matrix4f_make_viewport endp	

_matrix4f_mul proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2+4]
	fmul	dword ptr [dword4+16]
	mov	dword6,[ebp+12]
	mov	dword8,[ebp+16]
	fld	dword ptr [dword6]
	fmul	dword ptr [dword8]
	faddp
	mov	dword10,[ebp+12]
	mov	dword12,[ebp+16]
	fld	dword ptr [dword10+8]
	fmul	dword ptr [dword12+32]
	faddp
	mov	dword14,[ebp+12]
	mov	dword16,[ebp+16]
	fld	dword ptr [dword14+12]
	fmul	dword ptr [dword16+48]
	faddp
	mov	dword18,[ebp+8]
	fstp	dword ptr [dword18]
	mov	dword20,[ebp+16]
	mov	dword22,[ebp+12]
	fld	dword ptr [dword22]
	fmul	dword ptr [dword20+4]
	mov	dword24,[ebp+12]
	mov	dword26,[ebp+16]
	fld	dword ptr [dword24+4]
	fmul	dword ptr [dword26+20]
	faddp
	mov	dword28,[ebp+12]
	mov	dword30,[ebp+16]
	fld	dword ptr [dword28+8]
	fmul	dword ptr [dword30+36]
	faddp
	mov	dword32,[ebp+12]
	mov	dword34,[ebp+16]
	fld	dword ptr [dword32+12]
	fmul	dword ptr [dword34+52]
	faddp
	mov	dword36,[ebp+8]
	fstp	dword ptr [dword36+4]
	mov	dword38,[ebp+16]
	mov	dword40,[ebp+12]
	fld	dword ptr [dword40]
	fmul	dword ptr [dword38+8]
	mov	dword42,[ebp+12]
	mov	dword44,[ebp+16]
	fld	dword ptr [dword42+4]
	fmul	dword ptr [dword44+24]
	faddp
	mov	dword46,[ebp+12]
	mov	dword48,[ebp+16]
	fld	dword ptr [dword46+8]
	fmul	dword ptr [dword48+40]
	faddp
	mov	dword50,[ebp+12]
	mov	dword52,[ebp+16]
	fld	dword ptr [dword50+12]
	fmul	dword ptr [dword52+56]
	faddp
	mov	dword54,[ebp+8]
	fstp	dword ptr [dword54+8]
	mov	dword56,[ebp+16]
	mov	dword58,[ebp+12]
	fld	dword ptr [dword58]
	fmul	dword ptr [dword56+12]
	mov	dword60,[ebp+12]
	mov	dword62,[ebp+16]
	fld	dword ptr [dword60+4]
	fmul	dword ptr [dword62+28]
	faddp
	mov	dword64,[ebp+12]
	mov	dword66,[ebp+16]
	fld	dword ptr [dword64+8]
	fmul	dword ptr [dword66+44]
	faddp
	mov	dword68,[ebp+12]
	mov	dword70,[ebp+16]
	fld	dword ptr [dword68+12]
	fmul	dword ptr [dword70+60]
	faddp
	mov	dword72,[ebp+8]
	fstp	dword ptr [dword72+12]
	mov	dword74,[ebp+12]
	mov	dword76,[ebp+16]
	fld	dword ptr [dword74+16]
	fmul	dword ptr [dword76]
	mov	dword78,[ebp+12]
	mov	dword80,[ebp+16]
	fld	dword ptr [dword78+20]
	fmul	dword ptr [dword80+16]
	faddp
	mov	dword82,[ebp+12]
	mov	dword84,[ebp+16]
	fld	dword ptr [dword82+24]
	fmul	dword ptr [dword84+32]
	faddp
	mov	dword86,[ebp+12]
	mov	dword88,[ebp+16]
	fld	dword ptr [dword86+28]
	fmul	dword ptr [dword88+48]
	faddp
	mov	dword90,[ebp+8]
	fstp	dword ptr [dword90+16]
	mov	dword92,[ebp+12]
	mov	dword94,[ebp+16]
	fld	dword ptr [dword92+16]
	fmul	dword ptr [dword94+4]
	mov	dword96,[ebp+12]
	mov	dword98,[ebp+16]
	fld	dword ptr [dword96+20]
	fmul	dword ptr [dword98+20]
	faddp
	mov	dword100,[ebp+12]
	mov	dword102,[ebp+16]
	fld	dword ptr [dword100+24]
	fmul	dword ptr [dword102+36]
	faddp
	mov	dword104,[ebp+12]
	mov	dword106,[ebp+16]
	fld	dword ptr [dword104+28]
	fmul	dword ptr [dword106+52]
	faddp
	mov	dword108,[ebp+8]
	fstp	dword ptr [dword108+20]
	mov	dword110,[ebp+12]
	mov	dword112,[ebp+16]
	fld	dword ptr [dword110+16]
	fmul	dword ptr [dword112+8]
	mov	dword114,[ebp+12]
	mov	dword116,[ebp+16]
	fld	dword ptr [dword114+20]
	fmul	dword ptr [dword116+24]
	faddp
	mov	dword118,[ebp+12]
	mov	dword120,[ebp+16]
	fld	dword ptr [dword118+24]
	fmul	dword ptr [dword120+40]
	faddp
	mov	dword122,[ebp+12]
	mov	dword124,[ebp+16]
	fld	dword ptr [dword122+28]
	fmul	dword ptr [dword124+56]
	faddp
	mov	dword126,[ebp+8]
	fstp	dword ptr [dword126+24]
	mov	dword128,[ebp+12]
	mov	dword130,[ebp+16]
	fld	dword ptr [dword128+16]
	fmul	dword ptr [dword130+12]
	mov	dword132,[ebp+12]
	mov	dword134,[ebp+16]
	fld	dword ptr [dword132+20]
	fmul	dword ptr [dword134+28]
	faddp
	mov	dword136,[ebp+12]
	mov	dword138,[ebp+16]
	fld	dword ptr [dword136+24]
	fmul	dword ptr [dword138+44]
	faddp
	mov	dword140,[ebp+12]
	mov	dword142,[ebp+16]
	fld	dword ptr [dword140+28]
	fmul	dword ptr [dword142+60]
	faddp
	mov	dword144,[ebp+8]
	fstp	dword ptr [dword144+28]
	mov	dword146,[ebp+12]
	mov	dword148,[ebp+16]
	fld	dword ptr [dword146+32]
	fmul	dword ptr [dword148]
	mov	dword150,[ebp+12]
	mov	dword152,[ebp+16]
	fld	dword ptr [dword150+36]
	fmul	dword ptr [dword152+16]
	faddp
	mov	dword154,[ebp+12]
	mov	dword156,[ebp+16]
	fld	dword ptr [dword154+40]
	fmul	dword ptr [dword156+32]
	faddp
	mov	dword158,[ebp+12]
	mov	dword160,[ebp+16]
	fld	dword ptr [dword158+44]
	fmul	dword ptr [dword160+48]
	faddp
	mov	dword162,[ebp+8]
	fstp	dword ptr [dword162+32]
	mov	dword164,[ebp+12]
	mov	dword166,[ebp+16]
	fld	dword ptr [dword164+32]
	fmul	dword ptr [dword166+4]
	mov	dword168,[ebp+12]
	mov	dword170,[ebp+16]
	fld	dword ptr [dword168+36]
	fmul	dword ptr [dword170+20]
	faddp
	mov	dword172,[ebp+12]
	mov	dword174,[ebp+16]
	fld	dword ptr [dword172+40]
	fmul	dword ptr [dword174+36]
	faddp
	mov	dword176,[ebp+12]
	mov	dword178,[ebp+16]
	fld	dword ptr [dword176+44]
	fmul	dword ptr [dword178+52]
	faddp
	mov	dword180,[ebp+8]
	fstp	dword ptr [dword180+36]
	mov	dword182,[ebp+12]
	mov	dword184,[ebp+16]
	fld	dword ptr [dword182+32]
	fmul	dword ptr [dword184+8]
	mov	dword186,[ebp+12]
	mov	dword188,[ebp+16]
	fld	dword ptr [dword186+36]
	fmul	dword ptr [dword188+24]
	faddp
	mov	dword190,[ebp+12]
	mov	dword192,[ebp+16]
	fld	dword ptr [dword190+40]
	fmul	dword ptr [dword192+40]
	faddp
	mov	dword194,[ebp+12]
	mov	dword196,[ebp+16]
	fld	dword ptr [dword194+44]
	fmul	dword ptr [dword196+56]
	faddp
	mov	dword198,[ebp+8]
	fstp	dword ptr [dword198+40]
	mov	dword200,[ebp+12]
	mov	dword202,[ebp+16]
	fld	dword ptr [dword200+32]
	fmul	dword ptr [dword202+12]
	mov	dword204,[ebp+12]
	mov	dword206,[ebp+16]
	fld	dword ptr [dword204+36]
	fmul	dword ptr [dword206+28]
	faddp
	mov	dword208,[ebp+12]
	mov	dword210,[ebp+16]
	fld	dword ptr [dword208+40]
	fmul	dword ptr [dword210+44]
	faddp
	mov	dword212,[ebp+12]
	mov	dword214,[ebp+16]
	fld	dword ptr [dword212+44]
	fmul	dword ptr [dword214+60]
	faddp
	mov	dword216,[ebp+8]
	fstp	dword ptr [dword216+44]
	mov	dword218,[ebp+12]
	mov	dword220,[ebp+16]
	fld	dword ptr [dword218+48]
	fmul	dword ptr [dword220]
	mov	dword222,[ebp+12]
	mov	dword224,[ebp+16]
	fld	dword ptr [dword222+52]
	fmul	dword ptr [dword224+16]
	faddp
	mov	dword226,[ebp+12]
	mov	dword228,[ebp+16]
	fld	dword ptr [dword226+56]
	fmul	dword ptr [dword228+32]
	faddp
	mov	dword230,[ebp+12]
	mov	dword232,[ebp+16]
	fld	dword ptr [dword230+60]
	fmul	dword ptr [dword232+48]
	faddp
	mov	dword234,[ebp+8]
	fstp	dword ptr [dword234+48]
	mov	dword236,[ebp+12]
	mov	dword238,[ebp+16]
	fld	dword ptr [dword236+48]
	fmul	dword ptr [dword238+4]
	mov	dword240,[ebp+12]
	mov	dword242,[ebp+16]
	fld	dword ptr [dword240+52]
	fmul	dword ptr [dword242+20]
	faddp
	mov	dword244,[ebp+12]
	mov	dword246,[ebp+16]
	fld	dword ptr [dword244+56]
	fmul	dword ptr [dword246+36]
	faddp
	mov	dword248,[ebp+12]
	mov	dword250,[ebp+16]
	fld	dword ptr [dword248+60]
	fmul	dword ptr [dword250+52]
	faddp
	mov	dword252,[ebp+8]
	fstp	dword ptr [dword252+52]
	mov	dword254,[ebp+12]
	mov	dword256,[ebp+16]
	fld	dword ptr [dword254+48]
	fmul	dword ptr [dword256+8]
	mov	dword258,[ebp+12]
	mov	dword260,[ebp+16]
	fld	dword ptr [dword258+52]
	fmul	dword ptr [dword260+24]
	faddp
	mov	dword262,[ebp+12]
	mov	dword264,[ebp+16]
	fld	dword ptr [dword262+56]
	fmul	dword ptr [dword264+40]
	faddp
	mov	dword266,[ebp+12]
	mov	dword268,[ebp+16]
	fld	dword ptr [dword266+60]
	fmul	dword ptr [dword268+56]
	faddp
	mov	dword270,[ebp+8]
	fstp	dword ptr [dword270+56]
	mov	dword272,[ebp+12]
	mov	dword274,[ebp+16]
	fld	dword ptr [dword272+48]
	fmul	dword ptr [dword274+12]
	mov	dword276,[ebp+12]
	mov	dword278,[ebp+16]
	fld	dword ptr [dword276+52]
	fmul	dword ptr [dword278+28]
	faddp
	mov	dword280,[ebp+12]
	mov	dword282,[ebp+16]
	fld	dword ptr [dword280+56]
	fmul	dword ptr [dword282+44]
	faddp
	mov	dword284,[ebp+12]
	mov	dword286,[ebp+16]
	fld	dword ptr [dword284+60]
	fmul	dword ptr [dword286+60]
	faddp
	mov	dword288,[ebp+8]
	fstp	dword ptr [dword288+60]
	destroy_stack_frame
	ret
_matrix4f_mul endp	

_matrix4f_transform proc
	create_stack_frame
	mov	dword2,[ebp+12]
	mov	dword4,[ebp+16]
	fld	dword ptr [dword2+4]
	fmul	dword ptr [dword4+16]
	mov	dword6,[ebp+12]
	mov	dword8,[ebp+16]
	fld	dword ptr [dword6]
	fmul	dword ptr [dword8]
	faddp
	mov	dword10,[ebp+12]
	mov	dword12,[ebp+16]
	fld	dword ptr [dword10+8]
	fmul	dword ptr [dword12+32]
	faddp
	mov	dword14,[ebp+12]
	mov	dword16,[ebp+16]
	fld	dword ptr [dword14+12]
	fmul	dword ptr [dword16+48]
	faddp
	mov	dword18,[ebp+8]
	fstp	dword ptr [dword18]
	mov	dword20,[ebp+16]
	mov	dword22,[ebp+12]
	fld	dword ptr [dword22]
	fmul	dword ptr [dword20+4]
	mov	dword24,[ebp+12]
	mov	dword26,[ebp+16]
	fld	dword ptr [dword24+4]
	fmul	dword ptr [dword26+20]
	faddp
	mov	dword28,[ebp+12]
	mov	dword30,[ebp+16]
	fld	dword ptr [dword28+8]
	fmul	dword ptr [dword30+36]
	faddp
	mov	dword32,[ebp+12]
	mov	dword34,[ebp+16]
	fld	dword ptr [dword32+12]
	fmul	dword ptr [dword34+52]
	faddp
	mov	dword36,[ebp+8]
	fstp	dword ptr [dword36+4]
	mov	dword38,[ebp+16]
	mov	dword40,[ebp+12]
	fld	dword ptr [dword40]
	fmul	dword ptr [dword38+8]
	mov	dword42,[ebp+12]
	mov	dword44,[ebp+16]
	fld	dword ptr [dword42+4]
	fmul	dword ptr [dword44+24]
	faddp
	mov	dword46,[ebp+12]
	mov	dword48,[ebp+16]
	fld	dword ptr [dword46+8]
	fmul	dword ptr [dword48+40]
	faddp
	mov	dword50,[ebp+12]
	mov	dword52,[ebp+16]
	fld	dword ptr [dword50+12]
	fmul	dword ptr [dword52+56]
	faddp
	mov	dword54,[ebp+8]
	fstp	dword ptr [dword54+8]
	mov	dword56,[ebp+16]
	mov	dword58,[ebp+12]
	fld	dword ptr [dword58]
	fmul	dword ptr [dword56+12]
	mov	dword60,[ebp+12]
	mov	dword62,[ebp+16]
	fld	dword ptr [dword60+4]
	fmul	dword ptr [dword62+28]
	faddp
	mov	dword64,[ebp+12]
	mov	dword66,[ebp+16]
	fld	dword ptr [dword64+8]
	fmul	dword ptr [dword66+44]
	faddp
	mov	dword68,[ebp+12]
	mov	dword70,[ebp+16]
	fld	dword ptr [dword68+12]
	fmul	dword ptr [dword70+60]
	faddp
	mov	dword72,[ebp+8]
	fstp	dword ptr [dword72+12]
	destroy_stack_frame
	ret
_matrix4f_transform endp	

_matrix4f_transpose proc
	create_stack_frame
	mov	dword2,[ebp+8]
	mov	dword4,[ebp+8]
	fld	dword ptr [dword4+16]
	fstp	dword ptr [dword2+4]
	mov	dword6,[ebp+8]
	mov	dword8,[ebp+8]
	fld	dword ptr [dword8+32]
	fstp	dword ptr [dword6+8]
	mov	dword10,[ebp+8]
	mov	dword12,[ebp+8]
	fld	dword ptr [dword12+48]
	fstp	dword ptr [dword10+12]
	mov	dword14,[ebp+8]
	mov	dword16,[ebp+8]
	fld	dword ptr [dword16+36]
	fstp	dword ptr [dword14+24]
	mov	dword18,[ebp+8]
	mov	dword20,[ebp+8]
	fld	dword ptr [dword20+52]
	fstp	dword ptr [dword18+28]
	mov	dword22,[ebp+8]
	mov	dword24,[ebp+8]
	fld	dword ptr [dword24+56]
	fstp	dword ptr [dword22+44]
	destroy_stack_frame
	ret
_matrix4f_transpose endp	

_rasterizer_init proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__dbgprintf],dword3
	mov	dword6,[ebp+12]
	mov	dword ptr [__width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__height],dword9
	mov	dword12,[ebp+20]
	mov	dword ptr [__pitch],dword12
	push_all
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	push_arg	sse1,4
	push_arg	dword ptr [ebp+32],4
	push_arg	dword ptr [ebp+28],4
	push_arg	dword ptr [ebp+24],4
	lea	dword18,dword ptr [__mvproj_matrix]
	push_arg	dword18,4
	call	_matrix4f_make_perspective
	restore_stack	20
	pop_all
	push_all
	push_arg	dword ptr [ebp+28],4
	push_arg	dword ptr [ebp+24],4
	fild	dword ptr [ebp+16]
	push_arg	sse20,4
	fild	dword ptr [ebp+12]
	push_arg	sse20,4
	lea	dword23,dword ptr [__viewport_matrix]
	push_arg	dword23,4
	call	_matrix4f_make_viewport
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse2,4
	push_arg	dword ptr [ebp+24],4
	fldz
	push_arg	sse3,4
	fldz
	push_arg	sse4,4
	lea	dword25,dword ptr [__clip_z_near_base]
	push_arg	dword25,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	fld	dword ptr [ebp+24]
	fld	dword ptr [ebp+28]
	fucomip	st,st(1)
	fstp	st
	jbe	label0000
	fld1
	fstp	dword ptr [ebp-4]
	jmp	label0001
label0000:
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-4]
label0001:
	push_all
	fld1
	push_arg	sse7,4
	push_arg	dword ptr [ebp-4],4
	fldz
	push_arg	sse8,4
	fldz
	push_arg	sse9,4
	lea	dword32,dword ptr [__clip_z_near_norm]
	push_arg	dword32,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse10,4
	push_arg	dword ptr [ebp+28],4
	fldz
	push_arg	sse11,4
	fldz
	push_arg	sse12,4
	lea	dword34,dword ptr [__clip_z_far_base]
	push_arg	dword34,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	fld	dword ptr [ebp+24]
	fld	dword ptr [ebp+28]
	fucomip	st,st(1)
	fstp	st
	jbe	label0002
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-8]
	jmp	label0003
label0002:
	fld1
	fstp	dword ptr [ebp-8]
label0003:
	push_all
	fld1
	push_arg	sse15,4
	push_arg	dword ptr [ebp-8],4
	fldz
	push_arg	sse16,4
	fldz
	push_arg	sse17,4
	lea	dword41,dword ptr [__clip_z_far_norm]
	push_arg	dword41,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse18,4
	fldz
	push_arg	sse19,4
	fldz
	push_arg	sse20,4
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	push_arg	sse24,4
	lea	dword44,dword ptr [__clip_plane_left_base]
	push_arg	dword44,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse25,4
	fldz
	push_arg	sse26,4
	fldz
	push_arg	sse27,4
	fld1
	push_arg	sse28,4
	lea	dword45,dword ptr [__clip_plane_left_norm]
	push_arg	dword45,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse29,4
	fldz
	push_arg	sse30,4
	fldz
	push_arg	sse31,4
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld1
	fsubrp
	push_arg	sse35,4
	lea	dword47,dword ptr [__clip_plane_right_base]
	push_arg	dword47,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse36,4
	fldz
	push_arg	sse37,4
	fldz
	push_arg	sse38,4
	fld	dword ptr [___unnamed_float_2]
	push_arg	sse39,4
	lea	dword49,dword ptr [__clip_plane_right_norm]
	push_arg	dword49,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse40,4
	fldz
	push_arg	sse41,4
	fild	dword ptr [ebp+16]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	push_arg	sse45,4
	fldz
	push_arg	sse46,4
	lea	dword52,dword ptr [__clip_plane_top_base]
	push_arg	dword52,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse47,4
	fldz
	push_arg	sse48,4
	fld1
	push_arg	sse49,4
	fldz
	push_arg	sse50,4
	lea	dword53,dword ptr [__clip_plane_top_norm]
	push_arg	dword53,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse51,4
	fldz
	push_arg	sse52,4
	fld1
	push_arg	sse53,4
	fldz
	push_arg	sse54,4
	lea	dword54,dword ptr [__clip_plane_bottom_base]
	push_arg	dword54,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	fld1
	push_arg	sse55,4
	fldz
	push_arg	sse56,4
	fld	dword ptr [___unnamed_float_2]
	push_arg	sse57,4
	fldz
	push_arg	sse58,4
	lea	dword56,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword56,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	destroy_stack_frame
	ret
_rasterizer_init endp	

_rasterizer_begin_frame proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__videomem],dword3
	destroy_stack_frame
	ret
_rasterizer_begin_frame endp	

_rasterizer_set_mvproj proc
	create_stack_frame
	mov	dword2,[ebp+8]
	mov	dword4,[dword2]
	mov	dword5,[dword2+4]
	mov	dword ptr [__mvproj_matrix],dword4
	mov	dword ptr [__mvproj_matrix+4],dword5
	mov	dword4,[dword2+8]
	mov	dword5,[dword2+12]
	mov	dword ptr [__mvproj_matrix+8],dword4
	mov	dword ptr [__mvproj_matrix+12],dword5
	mov	dword4,[dword2+16]
	mov	dword5,[dword2+20]
	mov	dword ptr [__mvproj_matrix+16],dword4
	mov	dword ptr [__mvproj_matrix+20],dword5
	mov	dword4,[dword2+24]
	mov	dword5,[dword2+28]
	mov	dword ptr [__mvproj_matrix+24],dword4
	mov	dword ptr [__mvproj_matrix+28],dword5
	mov	dword4,[dword2+32]
	mov	dword5,[dword2+36]
	mov	dword ptr [__mvproj_matrix+32],dword4
	mov	dword ptr [__mvproj_matrix+36],dword5
	mov	dword4,[dword2+40]
	mov	dword5,[dword2+44]
	mov	dword ptr [__mvproj_matrix+40],dword4
	mov	dword ptr [__mvproj_matrix+44],dword5
	mov	dword4,[dword2+48]
	mov	dword5,[dword2+52]
	mov	dword ptr [__mvproj_matrix+48],dword4
	mov	dword ptr [__mvproj_matrix+52],dword5
	mov	dword4,[dword2+56]
	mov	dword5,[dword2+60]
	mov	dword ptr [__mvproj_matrix+56],dword4
	mov	dword ptr [__mvproj_matrix+60],dword5
	destroy_stack_frame
	ret
_rasterizer_set_mvproj endp	

_rasterizer_set_color proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__color],dword3
	destroy_stack_frame
	ret
_rasterizer_set_color endp	

_rasterizer_set_texture proc
	create_stack_frame
	mov	dword3,[ebp+8]
	mov	dword ptr [__texture_data],dword3
	mov	dword6,[ebp+12]
	mov	dword ptr [__texture_width],dword6
	mov	dword9,[ebp+16]
	mov	dword ptr [__texture_height],dword9
	destroy_stack_frame
	ret
_rasterizer_set_texture endp	

__tex2d proc
	create_stack_frame
	mov	dword3,dword ptr [__texture_width]
	dec	dword3
	int2float	dword3
	fmul	dword ptr [ebp+8]
	float2int	dword5
	mov	[ebp-4],dword5
	mov	dword9,dword ptr [__texture_height]
	dec	dword9
	int2float	dword9
	fmul	dword ptr [ebp+12]
	float2int	dword11
	mov	[ebp-8],dword11
	mov	dword15,[ebp-8]
	imul	dword15,dword ptr [__texture_width]
	add	dword15,[ebp-4]
	sal	dword15,2
	add	dword15,dword ptr [__texture_data]
	return_value	dword ptr [dword15]
	destroy_stack_frame
	ret
__tex2d endp	

__rasterize_horiz_line proc
	create_stack_frame
	mov	dword3,dword ptr [__pitch]
	imul	dword3,[ebp+16]
	add	dword3,dword ptr [__videomem]
	mov	dword7,[ebp+8]
	sal	dword7,2
	add	dword3,dword7
	mov	[ebp-4],dword3
	mov	dword11,[ebp+12]
	sal	dword11,2
	add	dword11,[ebp-4]
	mov	dword15,[ebp+8]
	sal	dword15,2
	sub	dword11,dword15
	mov	[ebp-8],dword11
label0000:
	push_all
	push_arg	dword ptr [ebp+24],4
	push_arg	dword ptr [ebp+20],4
	call	__tex2d
	restore_stack	8
	pop_all
	read_retval	dword19
	mov	[ebp-12],dword19
	mov	dword23,[ebp-12]
	sar	dword23,24
	and	dword23,255
	mov	[ebp-40],dword23
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	dword31,[ebp-4]
	mov	dword33,[dword31]
	mov	[ebp-28],dword33
	mov	dword36,[ebp-28]
	and	dword36,65280
	sar	dword36,8
	mov	[ebp-32],dword36
	mov	dword41,[ebp-28]
	and	dword41,255
	mov	[ebp-36],dword41
	mov	dword45,[ebp-12]
	and	dword45,65280
	sar	dword45,8
	mov	[ebp-20],dword45
	mov	dword50,[ebp-12]
	and	dword50,255
	mov	[ebp-24],dword50
	fild	dword ptr [ebp-20]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-32]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword56
	mov	[ebp-20],dword56
	fild	dword ptr [ebp-24]
	fmul	dword ptr [ebp-44]
	fild	dword ptr [ebp-36]
	fld1
	fsub	dword ptr [ebp-44]
	fmulp
	faddp
	float2int	dword62
	mov	[ebp-24],dword62
	mov	dword66,[ebp-20]
	sal	dword66,8
	add	dword66,[ebp-24]
	mov	[ebp-16],dword66
	mov	dword70,[ebp-4]
	mov	dword72,[ebp-16]
	mov	[dword70],dword72
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	dword ptr [ebp-4],4
	mov	dword79,[ebp-4]
	cmp	dword79,[ebp-8]
	jl	label0000
label0002:
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__rasterize_horiz_line__unordered proc
	create_stack_frame
	mov	dword3,[ebp+8]
	cmp	dword3,[ebp+12]
	jg	label0000
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	push_arg	dword ptr [ebp+24],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+16],4
	push_arg	dword ptr [ebp+12],4
	push_arg	dword ptr [ebp+8],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0001
label0000:
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	push_arg	dword ptr [ebp+32],4
	push_arg	dword ptr [ebp+28],4
	push_arg	dword ptr [ebp+16],4
	push_arg	dword ptr [ebp+8],4
	push_arg	dword ptr [ebp+12],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0001:
	destroy_stack_frame
	ret
__rasterize_horiz_line__unordered endp	

__rasterize_triangle_1i proc
	create_stack_frame
	mov	dword3,[ebp+8]
	cmp	dword3,[ebp+12]
	jge	label0000
	mov	dword6,[ebp+16]
	cmp	dword6,[ebp+12]
	jle	label0001
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	mov	dword10,[ebp+24]
	push_arg	dword ptr [dword10+4],4
	mov	dword12,[ebp+24]
	push_arg	dword ptr [dword12],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+16],4
	push_arg	dword ptr [ebp+8],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0002
label0001:
	mov	dword18,[ebp+16]
	cmp	dword18,[ebp+8]
	jge	label0003
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	mov	dword22,[ebp+32]
	push_arg	dword ptr [dword22+4],4
	mov	dword24,[ebp+32]
	push_arg	dword ptr [dword24],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+12],4
	push_arg	dword ptr [ebp+16],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0004
label0003:
	push_all
	push_arg	dword ptr [ebp+40],4
	push_arg	dword ptr [ebp+36],4
	mov	dword31,[ebp+24]
	push_arg	dword ptr [dword31+4],4
	mov	dword33,[ebp+24]
	push_arg	dword ptr [dword33],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+12],4
	push_arg	dword ptr [ebp+8],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0004:
label0002:
	jmp	label0005
label0000:
	mov	dword39,[ebp+16]
	cmp	dword39,[ebp+12]
	jge	label0006
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_arg	sse1,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_arg	sse2,4
	mov	dword43,[ebp+32]
	push_arg	dword ptr [dword43+4],4
	mov	dword45,[ebp+32]
	push_arg	dword ptr [dword45],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+8],4
	push_arg	dword ptr [ebp+16],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0007
label0006:
	mov	dword51,[ebp+16]
	cmp	dword51,[ebp+8]
	jle	label0008
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_arg	sse3,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_arg	sse4,4
	mov	dword55,[ebp+28]
	push_arg	dword ptr [dword55+4],4
	mov	dword57,[ebp+28]
	push_arg	dword ptr [dword57],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+16],4
	push_arg	dword ptr [ebp+12],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0009
label0008:
	push_all
	fld	dword ptr [ebp+40]
	fldz
	fsubrp
	push_arg	sse5,4
	fld	dword ptr [ebp+36]
	fldz
	fsubrp
	push_arg	sse6,4
	mov	dword64,[ebp+28]
	push_arg	dword ptr [dword64+4],4
	mov	dword66,[ebp+28]
	push_arg	dword ptr [dword66],4
	push_arg	dword ptr [ebp+20],4
	push_arg	dword ptr [ebp+8],4
	push_arg	dword ptr [ebp+12],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0009:
label0007:
label0005:
	destroy_stack_frame
	ret
__rasterize_triangle_1i endp	

__rasterize_triangle_2i proc
	create_stack_frame
	mov	dword2,[ebp+8]
	add	dword2,4
	mov	dword5,[ebp+12]
	add	dword5,4
	mov	dword7,[dword2]
	cmp	dword7,[dword5]
	jle	label0000
	mov	dword10,[ebp+8]
	mov	[ebp-4],dword10
	mov	dword13,[ebp+12]
	mov	[ebp+8],dword13
	mov	dword16,[ebp-4]
	mov	[ebp+12],dword16
label0000:
	mov	dword18,[ebp+8]
	add	dword18,4
	mov	dword21,[ebp+16]
	add	dword21,4
	mov	dword23,[dword18]
	cmp	dword23,[dword21]
	jle	label0001
	mov	dword26,[ebp+8]
	mov	[ebp-4],dword26
	mov	dword29,[ebp+16]
	mov	[ebp+8],dword29
	mov	dword32,[ebp-4]
	mov	[ebp+16],dword32
label0001:
	mov	dword34,[ebp+12]
	add	dword34,4
	mov	dword37,[ebp+16]
	add	dword37,4
	mov	dword39,[dword34]
	cmp	dword39,[dword37]
	jle	label0002
	mov	dword42,[ebp+12]
	mov	[ebp-4],dword42
	mov	dword45,[ebp+16]
	mov	[ebp+12],dword45
	mov	dword48,[ebp-4]
	mov	[ebp+16],dword48
label0002:
	mov	dword50,[ebp+8]
	add	dword50,4
	mov	dword53,[ebp+16]
	add	dword53,4
	mov	dword55,[dword50]
	cmp	dword55,[dword53]
	jne	label0003
	mov	dword57,[ebp+8]
	add	dword57,4
	cmp	dword ptr [dword57],0
	jl	label0004
	mov	dword61,[ebp+8]
	add	dword61,4
	mov	dword64,[dword61]
	cmp	dword64,dword ptr [__height]
	jge	label0004
	push_all
	fldz
	push_arg	sse1,4
	fldz
	push_arg	sse2,4
	mov	dword66,8
	add	dword66,[ebp+16]
	push_arg	dword66,4
	mov	dword68,8
	add	dword68,[ebp+12]
	push_arg	dword68,4
	mov	dword70,8
	add	dword70,[ebp+8]
	push_arg	dword70,4
	mov	dword72,[ebp+8]
	add	dword72,4
	push_arg	dword ptr [dword72],4
	mov	dword75,[ebp+16]
	push_arg	dword ptr [dword75],4
	mov	dword77,[ebp+12]
	push_arg	dword ptr [dword77],4
	mov	dword79,[ebp+8]
	push_arg	dword ptr [dword79],4
	call	__rasterize_triangle_1i
	restore_stack	36
	pop_all
label0004:
	destroy_stack_frame
	ret
label0003:
	mov	dword81,[ebp+8]
	add	dword81,4
	mov	dword84,[dword81]
	mov	[ebp-16],dword84
label0005:
label0006:
	mov	dword86,[ebp+12]
	add	dword86,4
	mov	dword89,[dword86]
	cmp	dword89,[ebp-16]
	jle	label0007
	mov	dword91,[ebp+8]
	add	dword91,4
	mov	dword94,[ebp-16]
	sub	dword94,[dword91]
	mov	dword96,[ebp+12]
	mov	dword98,[ebp+8]
	mov	dword99,[dword96]
	sub	dword99,[dword98]
	imul	dword94,dword99
	mov	dword101,[ebp+12]
	add	dword101,4
	mov	dword104,[ebp+8]
	add	dword104,4
	mov	dword106,[dword101]
	sub	dword106,[dword104]
	mov	eax,dword94
	cdq
	idiv	dword106
	mov	dword108,[ebp+8]
	add	eax,[dword108]
	mov	[ebp-8],eax
	mov	dword111,[ebp+8]
	add	dword111,4
	mov	dword114,[ebp-16]
	sub	dword114,[dword111]
	mov	dword116,[ebp+16]
	mov	dword118,[ebp+8]
	mov	dword119,[dword116]
	sub	dword119,[dword118]
	imul	dword114,dword119
	mov	dword121,[ebp+16]
	add	dword121,4
	mov	dword124,[ebp+8]
	add	dword124,4
	mov	dword126,[dword121]
	sub	dword126,[dword124]
	mov	eax,dword114
	cdq
	idiv	dword126
	mov	dword128,[ebp+8]
	add	eax,[dword128]
	mov	[ebp-12],eax
	mov	dword131,[ebp+8]
	add	dword131,4
	mov	dword134,[ebp-16]
	sub	dword134,[dword131]
	int2float	dword134
	mov	dword136,[ebp+12]
	mov	dword138,[ebp+8]
	fld	dword ptr [dword136+8]
	fsub	dword ptr [dword138+8]
	fmulp
	mov	dword140,[ebp+12]
	add	dword140,4
	mov	dword143,[ebp+8]
	add	dword143,4
	mov	dword145,[dword140]
	sub	dword145,[dword143]
	int2float	dword145
	fdivp
	mov	dword147,[ebp+8]
	fadd	dword ptr [dword147+8]
	fstp	dword ptr [ebp-20]
	mov	dword150,[ebp+8]
	add	dword150,4
	mov	dword153,[ebp-16]
	sub	dword153,[dword150]
	int2float	dword153
	mov	dword155,[ebp+16]
	mov	dword157,[ebp+8]
	fld	dword ptr [dword155+8]
	fsub	dword ptr [dword157+8]
	fmulp
	mov	dword159,[ebp+16]
	add	dword159,4
	mov	dword162,[ebp+8]
	add	dword162,4
	mov	dword164,[dword159]
	sub	dword164,[dword162]
	int2float	dword164
	fdivp
	mov	dword166,[ebp+8]
	fadd	dword ptr [dword166+8]
	fstp	dword ptr [ebp-28]
	mov	dword169,[ebp+8]
	add	dword169,4
	mov	dword172,[ebp-16]
	sub	dword172,[dword169]
	int2float	dword172
	mov	dword174,8
	add	dword174,[ebp+12]
	add	dword174,4
	mov	dword177,8
	add	dword177,[ebp+8]
	add	dword177,4
	fld	dword ptr [dword174]
	fsub	dword ptr [dword177]
	fmulp
	mov	dword180,[ebp+12]
	add	dword180,4
	mov	dword183,[ebp+8]
	add	dword183,4
	mov	dword185,[dword180]
	sub	dword185,[dword183]
	int2float	dword185
	fdivp
	mov	dword187,8
	add	dword187,[ebp+8]
	add	dword187,4
	fadd	dword ptr [dword187]
	fstp	dword ptr [ebp-24]
	mov	dword191,[ebp+8]
	add	dword191,4
	mov	dword194,[ebp-16]
	sub	dword194,[dword191]
	int2float	dword194
	mov	dword196,8
	add	dword196,[ebp+16]
	add	dword196,4
	mov	dword199,8
	add	dword199,[ebp+8]
	add	dword199,4
	fld	dword ptr [dword196]
	fsub	dword ptr [dword199]
	fmulp
	mov	dword202,[ebp+16]
	add	dword202,4
	mov	dword205,[ebp+8]
	add	dword205,4
	mov	dword207,[dword202]
	sub	dword207,[dword205]
	int2float	dword207
	fdivp
	mov	dword209,8
	add	dword209,[ebp+8]
	add	dword209,4
	fadd	dword ptr [dword209]
	fstp	dword ptr [ebp-32]
	mov	dword214,[ebp-12]
	sub	dword214,[ebp-8]
	int2float	dword214
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	dword220,[ebp-12]
	sub	dword220,[ebp-8]
	int2float	dword220
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40],4
	push_arg	dword ptr [ebp-36],4
	push_arg	dword ptr [ebp-32],4
	push_arg	dword ptr [ebp-28],4
	push_arg	dword ptr [ebp-24],4
	push_arg	dword ptr [ebp-20],4
	push_arg	dword ptr [ebp-16],4
	push_arg	dword ptr [ebp-12],4
	push_arg	dword ptr [ebp-8],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	inc	dword ptr [ebp-16]
	jmp	label0006
label0007:
	mov	dword235,[ebp+12]
	add	dword235,4
	mov	dword238,[ebp+8]
	add	dword238,4
	mov	dword240,[dword235]
	sub	dword240,[dword238]
	mov	dword242,[ebp+16]
	mov	dword244,[ebp+8]
	mov	dword245,[dword242]
	sub	dword245,[dword244]
	imul	dword240,dword245
	mov	dword247,[ebp+16]
	add	dword247,4
	mov	dword250,[ebp+8]
	add	dword250,4
	mov	dword252,[dword247]
	sub	dword252,[dword250]
	mov	eax,dword240
	cdq
	idiv	dword252
	mov	dword254,[ebp+8]
	add	eax,[dword254]
	mov	[ebp-12],eax
	mov	dword257,[ebp+12]
	add	dword257,4
	mov	dword260,[ebp+8]
	add	dword260,4
	mov	dword262,[dword257]
	sub	dword262,[dword260]
	int2float	dword262
	mov	dword264,[ebp+16]
	mov	dword266,[ebp+8]
	fld	dword ptr [dword264+8]
	fsub	dword ptr [dword266+8]
	fmulp
	mov	dword268,[ebp+16]
	add	dword268,4
	mov	dword271,[ebp+8]
	add	dword271,4
	mov	dword273,[dword268]
	sub	dword273,[dword271]
	int2float	dword273
	fdivp
	mov	dword275,[ebp+8]
	fadd	dword ptr [dword275+8]
	fstp	dword ptr [ebp-28]
	mov	dword278,[ebp+12]
	add	dword278,4
	mov	dword281,[ebp+8]
	add	dword281,4
	mov	dword283,[dword278]
	sub	dword283,[dword281]
	int2float	dword283
	mov	dword285,8
	add	dword285,[ebp+16]
	add	dword285,4
	mov	dword288,8
	add	dword288,[ebp+8]
	add	dword288,4
	fld	dword ptr [dword285]
	fsub	dword ptr [dword288]
	fmulp
	mov	dword291,[ebp+16]
	add	dword291,4
	mov	dword294,[ebp+8]
	add	dword294,4
	mov	dword296,[dword291]
	sub	dword296,[dword294]
	int2float	dword296
	fdivp
	mov	dword298,8
	add	dword298,[ebp+8]
	add	dword298,4
	fadd	dword ptr [dword298]
	fstp	dword ptr [ebp-32]
	mov	dword302,[ebp+12]
	fld	dword ptr [ebp-28]
	fsub	dword ptr [dword302+8]
	mov	dword305,[ebp+12]
	mov	dword307,[ebp-12]
	sub	dword307,[dword305]
	int2float	dword307
	fdivp
	fstp	dword ptr [ebp-36]
	mov	dword310,8
	add	dword310,[ebp+12]
	add	dword310,4
	fld	dword ptr [ebp-32]
	fsub	dword ptr [dword310]
	mov	dword314,[ebp+12]
	mov	dword316,[ebp-12]
	sub	dword316,[dword314]
	int2float	dword316
	fdivp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40],4
	push_arg	dword ptr [ebp-36],4
	mov	dword321,8
	add	dword321,[ebp+12]
	add	dword321,4
	push_arg	dword ptr [dword321],4
	mov	dword324,[ebp+12]
	push_arg	dword ptr [dword324+8],4
	push_arg	dword ptr [ebp-32],4
	push_arg	dword ptr [ebp-28],4
	mov	dword328,[ebp+12]
	add	dword328,4
	push_arg	dword ptr [dword328],4
	mov	dword331,[ebp+12]
	push_arg	dword ptr [dword331],4
	push_arg	dword ptr [ebp-12],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	mov	dword334,[ebp+12]
	add	dword334,4
	mov	dword336,1
	add	dword336,[dword334]
	mov	[ebp-16],dword336
label0008:
label0009:
	mov	dword339,[ebp+16]
	add	dword339,4
	mov	dword342,[dword339]
	cmp	dword342,[ebp-16]
	jle	label000a
	mov	dword344,[ebp+12]
	add	dword344,4
	mov	dword347,[ebp-16]
	sub	dword347,[dword344]
	mov	dword349,[ebp+16]
	mov	dword351,[ebp+12]
	mov	dword352,[dword349]
	sub	dword352,[dword351]
	imul	dword347,dword352
	mov	dword354,[ebp+16]
	add	dword354,4
	mov	dword357,[ebp+12]
	add	dword357,4
	mov	dword359,[dword354]
	sub	dword359,[dword357]
	mov	eax,dword347
	cdq
	idiv	dword359
	mov	dword361,[ebp+12]
	add	eax,[dword361]
	mov	[ebp-8],eax
	mov	dword364,[ebp+8]
	add	dword364,4
	mov	dword367,[ebp-16]
	sub	dword367,[dword364]
	mov	dword369,[ebp+16]
	mov	dword371,[ebp+8]
	mov	dword372,[dword369]
	sub	dword372,[dword371]
	imul	dword367,dword372
	mov	dword374,[ebp+16]
	add	dword374,4
	mov	dword377,[ebp+8]
	add	dword377,4
	mov	dword379,[dword374]
	sub	dword379,[dword377]
	mov	eax,dword367
	cdq
	idiv	dword379
	mov	dword381,[ebp+8]
	add	eax,[dword381]
	mov	[ebp-12],eax
	mov	dword384,[ebp+12]
	add	dword384,4
	mov	dword387,[ebp-16]
	sub	dword387,[dword384]
	int2float	dword387
	mov	dword389,[ebp+16]
	mov	dword391,[ebp+12]
	fld	dword ptr [dword389+8]
	fsub	dword ptr [dword391+8]
	fmulp
	mov	dword393,[ebp+16]
	add	dword393,4
	mov	dword396,[ebp+12]
	add	dword396,4
	mov	dword398,[dword393]
	sub	dword398,[dword396]
	int2float	dword398
	fdivp
	mov	dword400,[ebp+12]
	fadd	dword ptr [dword400+8]
	fstp	dword ptr [ebp-20]
	mov	dword403,[ebp+8]
	add	dword403,4
	mov	dword406,[ebp-16]
	sub	dword406,[dword403]
	int2float	dword406
	mov	dword408,[ebp+16]
	mov	dword410,[ebp+8]
	fld	dword ptr [dword408+8]
	fsub	dword ptr [dword410+8]
	fmulp
	mov	dword412,[ebp+16]
	add	dword412,4
	mov	dword415,[ebp+8]
	add	dword415,4
	mov	dword417,[dword412]
	sub	dword417,[dword415]
	int2float	dword417
	fdivp
	mov	dword419,[ebp+8]
	fadd	dword ptr [dword419+8]
	fstp	dword ptr [ebp-28]
	mov	dword422,[ebp+12]
	add	dword422,4
	mov	dword425,[ebp-16]
	sub	dword425,[dword422]
	int2float	dword425
	mov	dword427,8
	add	dword427,[ebp+16]
	add	dword427,4
	mov	dword430,8
	add	dword430,[ebp+12]
	add	dword430,4
	fld	dword ptr [dword427]
	fsub	dword ptr [dword430]
	fmulp
	mov	dword433,[ebp+16]
	add	dword433,4
	mov	dword436,[ebp+12]
	add	dword436,4
	mov	dword438,[dword433]
	sub	dword438,[dword436]
	int2float	dword438
	fdivp
	mov	dword440,8
	add	dword440,[ebp+12]
	add	dword440,4
	fadd	dword ptr [dword440]
	fstp	dword ptr [ebp-24]
	mov	dword444,[ebp+8]
	add	dword444,4
	mov	dword447,[ebp-16]
	sub	dword447,[dword444]
	int2float	dword447
	mov	dword449,8
	add	dword449,[ebp+16]
	add	dword449,4
	mov	dword452,8
	add	dword452,[ebp+8]
	add	dword452,4
	fld	dword ptr [dword449]
	fsub	dword ptr [dword452]
	fmulp
	mov	dword455,[ebp+16]
	add	dword455,4
	mov	dword458,[ebp+8]
	add	dword458,4
	mov	dword460,[dword455]
	sub	dword460,[dword458]
	int2float	dword460
	fdivp
	mov	dword462,8
	add	dword462,[ebp+8]
	add	dword462,4
	fadd	dword ptr [dword462]
	fstp	dword ptr [ebp-32]
	mov	dword467,[ebp-12]
	sub	dword467,[ebp-8]
	int2float	dword467
	fld	dword ptr [ebp-28]
	fsub	dword ptr [ebp-20]
	fdivrp
	fstp	dword ptr [ebp-36]
	mov	dword473,[ebp-12]
	sub	dword473,[ebp-8]
	int2float	dword473
	fld	dword ptr [ebp-32]
	fsub	dword ptr [ebp-24]
	fdivrp
	fstp	dword ptr [ebp-40]
	push_all
	push_arg	dword ptr [ebp-40],4
	push_arg	dword ptr [ebp-36],4
	push_arg	dword ptr [ebp-32],4
	push_arg	dword ptr [ebp-28],4
	push_arg	dword ptr [ebp-24],4
	push_arg	dword ptr [ebp-20],4
	push_arg	dword ptr [ebp-16],4
	push_arg	dword ptr [ebp-12],4
	push_arg	dword ptr [ebp-8],4
	call	__rasterize_horiz_line__unordered
	restore_stack	36
	pop_all
	inc	dword ptr [ebp-16]
	jmp	label0009
label000a:
	destroy_stack_frame
	ret
__rasterize_triangle_2i endp	

__clip_on_plain proc
	create_stack_frame
	mov	dword2,[ebp+8]
	mov	dword ptr [dword2+192],0
	mov	dword5,[ebp+12]
	mov	[ebp-4],dword5
	mov	dword8,[ebp+12]
	add	dword8,24
	mov	[ebp-8],dword8
label0000:
label0001:
	mov	dword12,[ebp+12]
	imul	dword13,[dword12+192],24
	mov	dword15,[ebp+12]
	add	dword15,dword13
	cmp	dword15,[ebp-8]
	jle	label0002
	push_all
	push_arg	dword ptr [ebp+16],4
	mov	dword19,[ebp-4]
	push_arg	dword19,4
	lea	dword20,[ebp-24]
	push_arg	dword20,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword22,[ebp-24]
	push_arg	dword22,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fstp	dword ptr [ebp-52]
	push_all
	push_arg	dword ptr [ebp+16],4
	mov	dword26,[ebp-8]
	push_arg	dword26,4
	lea	dword27,[ebp-24]
	push_arg	dword27,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword29,[ebp-24]
	push_arg	dword29,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fstp	dword ptr [ebp-56]
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	mov	dword33,[ebp+8]
	mov	dword34,[dword33+192]
	inc	dword ptr [dword33+192]
	imul	dword34,24
	mov	dword37,[ebp+8]
	add	dword37,dword34
	mov	dword39,[ebp-4]
	mov	dword40,[dword39]
	mov	dword41,[dword39+4]
	mov	[dword37],dword40
	mov	[dword37+4],dword41
	mov	dword40,[dword39+8]
	mov	dword41,[dword39+12]
	mov	[dword37+8],dword40
	mov	[dword37+12],dword41
	mov	dword40,[dword39+16]
	mov	dword41,[dword39+20]
	mov	[dword37+16],dword40
	mov	[dword37+20],dword41
label0003:
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jbe	label0006
	fldz
	fld	dword ptr [ebp-56]
	fucomip	st,st(1)
	fstp	st
	jb	label0005
label0006:
	fldz
	fld	dword ptr [ebp-56]
	fucomip	st,st(1)
	fstp	st
	jb	label0004
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jae	label0004
label0005:
	push_all
	mov	dword47,[ebp-4]
	push_arg	dword47,4
	push_arg	dword ptr [ebp+16],4
	lea	dword49,[ebp-24]
	push_arg	dword49,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	mov	dword51,[ebp-4]
	push_arg	dword51,4
	mov	dword53,[ebp-8]
	push_arg	dword53,4
	lea	dword54,[ebp-40]
	push_arg	dword54,4
	call	_vec4f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword56,[ebp-24]
	push_arg	dword56,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	push_all
	push_arg	dword ptr [ebp+20],4
	lea	dword58,[ebp-40]
	push_arg	dword58,4
	call	_vec4f_dot
	restore_stack	8
	pop_all
	read_retvalp
	fdivp
	fstp	dword ptr [ebp-60]
	push_all
	push_arg	dword ptr [ebp-60],4
	lea	dword61,[ebp-40]
	push_arg	dword61,4
	call	_vec4f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword62,[ebp-40]
	push_arg	dword62,4
	mov	dword64,[ebp-4]
	push_arg	dword64,4
	mov	dword66,[ebp+8]
	imul	dword67,[dword66+192],24
	mov	dword69,[ebp+8]
	add	dword69,dword67
	push_arg	dword69,4
	call	_vec4f_add
	restore_stack	12
	pop_all
	push_all
	mov	dword71,16
	add	dword71,[ebp-4]
	push_arg	dword71,4
	mov	dword73,16
	add	dword73,[ebp-8]
	push_arg	dword73,4
	lea	dword74,[ebp-48]
	push_arg	dword74,4
	call	_vec2f_subtract
	restore_stack	12
	pop_all
	push_all
	push_arg	dword ptr [ebp-60],4
	lea	dword76,[ebp-48]
	push_arg	dword76,4
	call	_vec2f_mul
	restore_stack	8
	pop_all
	push_all
	lea	dword77,[ebp-48]
	push_arg	dword77,4
	mov	dword79,16
	add	dword79,[ebp-4]
	push_arg	dword79,4
	mov	dword81,[ebp+8]
	imul	dword82,[dword81+192],24
	mov	dword84,[ebp+8]
	add	dword84,dword82
	add	dword84,16
	push_arg	dword84,4
	call	_vec2f_add
	restore_stack	12
	pop_all
	mov	dword87,[ebp+8]
	inc	dword ptr [dword87+192]
label0004:
	add	dword ptr [ebp-4],24
	add	dword ptr [ebp-8],24
	jmp	label0001
label0002:
	mov	dword91,[ebp+8]
	mov	dword92,[dword91+192]
	inc	dword ptr [dword91+192]
	imul	dword92,24
	mov	dword95,[ebp+8]
	add	dword95,dword92
	mov	dword97,[ebp+8]
	mov	dword98,[dword97]
	mov	dword99,[dword97+4]
	mov	[dword95],dword98
	mov	[dword95+4],dword99
	mov	dword98,[dword97+8]
	mov	dword99,[dword97+12]
	mov	[dword95+8],dword98
	mov	[dword95+12],dword99
	mov	dword98,[dword97+16]
	mov	dword99,[dword97+20]
	mov	[dword95+16],dword98
	mov	[dword95+20],dword99
	destroy_stack_frame
	ret
__clip_on_plain endp	

__clip_poligon proc
	create_stack_frame
	push_all
	lea	dword1,dword ptr [__clip_z_far_norm]
	push_arg	dword1,4
	lea	dword2,dword ptr [__clip_z_far_base]
	push_arg	dword2,4
	push_arg	dword ptr [ebp+8],4
	lea	dword4,[ebp-196]
	push_arg	dword4,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword5,dword ptr [__clip_z_near_norm]
	push_arg	dword5,4
	lea	dword6,dword ptr [__clip_z_near_base]
	push_arg	dword6,4
	lea	dword7,[ebp-196]
	push_arg	dword7,4
	push_arg	dword ptr [ebp+8],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword9,dword ptr [__clip_plane_left_norm]
	push_arg	dword9,4
	lea	dword10,dword ptr [__clip_plane_left_base]
	push_arg	dword10,4
	push_arg	dword ptr [ebp+8],4
	lea	dword12,[ebp-196]
	push_arg	dword12,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword13,dword ptr [__clip_plane_right_norm]
	push_arg	dword13,4
	lea	dword14,dword ptr [__clip_plane_right_base]
	push_arg	dword14,4
	lea	dword15,[ebp-196]
	push_arg	dword15,4
	push_arg	dword ptr [ebp+8],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword17,dword ptr [__clip_plane_top_norm]
	push_arg	dword17,4
	lea	dword18,dword ptr [__clip_plane_top_base]
	push_arg	dword18,4
	push_arg	dword ptr [ebp+8],4
	lea	dword20,[ebp-196]
	push_arg	dword20,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword21,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword21,4
	lea	dword22,dword ptr [__clip_plane_bottom_base]
	push_arg	dword22,4
	lea	dword23,[ebp-196]
	push_arg	dword23,4
	push_arg	dword ptr [ebp+8],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	mov	dword26,[ebp+8]
	cmp	dword ptr [dword26+192],1
	setg	byte1
	movzx	dword28,byte1
	return_value	dword28
	destroy_stack_frame
	ret
__clip_poligon endp	

__transform_to_screen_space proc
	create_stack_frame
	push_all
	lea	dword1,dword ptr [__viewport_matrix]
	push_arg	dword1,4
	push_arg	dword ptr [ebp+12],4
	lea	dword3,[ebp-16]
	push_arg	dword3,4
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	lea	dword4,[ebp-16]
	add	dword4,12
	fld1
	fdiv	dword ptr [dword4]
	fstp	dword ptr [ebp-20]
	fld	dword ptr [ebp-16]
	fmul	dword ptr [ebp-20]
	float2int	dword9
	mov	dword11,[ebp+8]
	mov	[dword11],dword9
	lea	dword12,[ebp-16]
	add	dword12,4
	fld	dword ptr [dword12]
	fmul	dword ptr [ebp-20]
	float2int	dword15
	mov	dword17,[ebp+8]
	mov	[dword17+4],dword15
	mov	dword19,[ebp+8]
	cmp	dword ptr [dword19],0
	jl	label0001
	mov	dword22,[ebp+8]
	mov	dword24,[dword22]
	cmp	dword24,dword ptr [__width]
	jge	label0001
	mov	dword26,[ebp+8]
	cmp	dword ptr [dword26+4],0
	jl	label0001
	mov	dword29,[ebp+8]
	mov	dword31,[dword29+4]
	cmp	dword31,dword ptr [__height]
	jl	label0000
label0001:
	mov	dword ptr ds:[0],0
label0000:
	destroy_stack_frame
	ret
__transform_to_screen_space endp	

__rasterize_polygon_4f proc
	create_stack_frame
	push_all
	push_arg	dword ptr [ebp+8],4
	call	__clip_poligon
	restore_stack	4
	pop_all
	read_retval	dword2
	cmp	dword2,0
	jne	label0000
	destroy_stack_frame
	ret
label0000:
	mov	dword4,[ebp+8]
	cmp	dword ptr [dword4+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword ptr [ebp-136],0
label0002:
label0003:
	mov	dword11,[ebp+8]
	mov	dword13,[dword11+192]
	cmp	dword13,[ebp-136]
	jle	label0004
	push_all
	mov	dword15,[ebp+8]
	imul	dword17,[ebp-136],24
	add	dword15,dword17
	push_arg	dword15,4
	lea	dword18,[ebp-132]
	mov	dword21,[ebp-136]
	sal	dword21,4
	add	dword18,dword21
	push_arg	dword18,4
	call	__transform_to_screen_space
	restore_stack	8
	pop_all
	lea	dword22,[ebp-132]
	mov	dword25,[ebp-136]
	sal	dword25,4
	add	dword22,dword25
	add	dword22,8
	mov	dword28,[ebp+8]
	imul	dword30,[ebp-136],24
	add	dword28,dword30
	add	dword28,16
	mov	dword32,[dword28]
	mov	dword33,[dword28+4]
	mov	[dword22],dword32
	mov	[dword22+4],dword33
	inc	dword ptr [ebp-136]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-136],2
label0005:
label0006:
	mov	dword38,[ebp+8]
	mov	dword40,[dword38+192]
	dec	dword40
	cmp	dword40,[ebp-136]
	jle	label0007
	push_all
	lea	dword42,[ebp-132]
	mov	dword45,[ebp-136]
	sal	dword45,4
	add	dword42,dword45
	push_arg	dword42,4
	mov	dword48,[ebp-136]
	dec	dword48
	sal	dword48,4
	lea	dword50,[ebp-132]
	add	dword50,dword48
	push_arg	dword50,4
	lea	dword51,[ebp-132]
	push_arg	dword51,4
	call	__rasterize_triangle_2i
	restore_stack	12
	pop_all
	inc	dword ptr [ebp-136]
	jmp	label0006
label0007:
	destroy_stack_frame
	ret
__rasterize_polygon_4f endp	

__transform_to_projection_space proc
	create_stack_frame
	push_all
	fld1
	push_arg	sse1,4
	mov	dword2,[ebp+12]
	push_arg	dword ptr [dword2+8],4
	mov	dword4,[ebp+12]
	push_arg	dword ptr [dword4+4],4
	mov	dword6,[ebp+12]
	push_arg	dword ptr [dword6],4
	lea	dword7,[ebp-16]
	push_arg	dword7,4
	call	_vec4f_assign
	restore_stack	20
	pop_all
	push_all
	lea	dword8,dword ptr [__mvproj_matrix]
	push_arg	dword8,4
	lea	dword9,[ebp-16]
	push_arg	dword9,4
	push_arg	dword ptr [ebp+8],4
	call	_matrix4f_transform
	restore_stack	12
	pop_all
	destroy_stack_frame
	ret
__transform_to_projection_space endp	

_rasterizer_triangle3f proc
	create_stack_frame
	push_all
	push_arg	dword ptr [ebp+8],4
	lea	dword2,[ebp-196]
	push_arg	dword2,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword3,[ebp-196]
	add	dword3,16
	mov	dword6,[ebp+20]
	mov	dword7,[dword6]
	mov	dword8,[dword6+4]
	mov	[dword3],dword7
	mov	[dword3+4],dword8
	push_all
	push_arg	dword ptr [ebp+12],4
	lea	dword10,[ebp-196]
	add	dword10,24
	push_arg	dword10,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword12,[ebp-196]
	add	dword12,24
	add	dword12,16
	mov	dword16,[ebp+24]
	mov	dword17,[dword16]
	mov	dword18,[dword16+4]
	mov	[dword12],dword17
	mov	[dword12+4],dword18
	push_all
	push_arg	dword ptr [ebp+16],4
	lea	dword20,[ebp-196]
	add	dword20,48
	push_arg	dword20,4
	call	__transform_to_projection_space
	restore_stack	8
	pop_all
	lea	dword22,[ebp-196]
	add	dword22,48
	add	dword22,16
	mov	dword26,[ebp+28]
	mov	dword27,[dword26]
	mov	dword28,[dword26+4]
	mov	[dword22],dword27
	mov	[dword22+4],dword28
	lea	dword29,[ebp-196]
	add	dword29,72
	mov	dword32,[ebp-196]
	mov	dword33,[ebp-192]
	mov	[dword29],dword32
	mov	[dword29+4],dword33
	mov	dword32,[ebp-188]
	mov	dword33,[ebp-184]
	mov	[dword29+8],dword32
	mov	[dword29+12],dword33
	mov	dword32,[ebp-180]
	mov	dword33,[ebp-176]
	mov	[dword29+16],dword32
	mov	[dword29+20],dword33
	lea	dword34,[ebp-196]
	add	dword34,192
	mov	dword ptr [dword34],4
	push_all
	lea	dword37,[ebp-196]
	push_arg	dword37,4
	call	__rasterize_polygon_4f
	restore_stack	4
	pop_all
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
