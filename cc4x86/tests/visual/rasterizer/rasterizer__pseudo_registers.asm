
.686
.model flat
.xmm

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
___unnamed_double_0	dq	03f1a36e2eb1c432dh
public	___unnamed_double_0
___unnamed_float_1	dd	040000000h
public	___unnamed_float_1
___unnamed_float_2	dd	0bf800000h
public	___unnamed_float_2
___unnamed_float_3	dd	0437f0000h
public	___unnamed_float_3

.code

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
	fild	dword ptr [ebp+12]
	fild	dword ptr [ebp+16]
	fdivp
	fstp	dword ptr [ebp-32]
	fld	dword ptr [ebp+32]
	fstp	dword ptr [ebp-36]
	fld	dword ptr [ebp+28]
	fstp	dword ptr [ebp-40]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-44]
	lea	dword18,dword ptr [__mvproj_matrix]
	mov	[ebp-48],dword18
; start of inline function matrix4f_make_perspective
	fld	dword ptr [ebp-36]
	fmul	dword ptr [ebp-44]
	fstp	dword ptr [ebp-52]
	fld	dword ptr [ebp-52]
	fmul	dword ptr [ebp-32]
	fstp	dword ptr [ebp-56]
	mov	dword221,[ebp-48]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-56]
	fstp	dword ptr [dword221]
	mov	dword225,[ebp-48]
	fldz
	fstp	dword ptr [dword225+4]
	mov	dword227,[ebp-48]
	fldz
	fstp	dword ptr [dword227+8]
	mov	dword229,[ebp-48]
	fldz
	fstp	dword ptr [dword229+12]
	mov	dword231,[ebp-48]
	fldz
	fstp	dword ptr [dword231+16]
	mov	dword233,[ebp-48]
	fld	dword ptr [ebp-44]
	fdiv	dword ptr [ebp-52]
	fstp	dword ptr [dword233+20]
	mov	dword237,[ebp-48]
	fldz
	fstp	dword ptr [dword237+24]
	mov	dword239,[ebp-48]
	fldz
	fstp	dword ptr [dword239+28]
	mov	dword241,[ebp-48]
	fldz
	fstp	dword ptr [dword241+32]
	mov	dword243,[ebp-48]
	fldz
	fstp	dword ptr [dword243+36]
	mov	dword245,[ebp-48]
	fld	dword ptr [ebp-40]
	fsub	dword ptr [ebp-44]
	fdivr	dword ptr [ebp-40]
	fstp	dword ptr [dword245+40]
	mov	dword250,[ebp-48]
	fld1
	fstp	dword ptr [dword250+44]
	mov	dword252,[ebp-48]
	fldz
	fstp	dword ptr [dword252+48]
	mov	dword254,[ebp-48]
	fldz
	fstp	dword ptr [dword254+52]
	mov	dword256,[ebp-48]
	fld	dword ptr [ebp-44]
	fmul	dword ptr [ebp-40]
	fld	dword ptr [ebp-44]
	fsub	dword ptr [ebp-40]
	fdivp
	fstp	dword ptr [dword256+56]
	mov	dword262,[ebp-48]
	fldz
	fstp	dword ptr [dword262+60]
label0010:
; end of inline function matrix4f_make_perspective
	fld	dword ptr [ebp+28]
	fstp	dword ptr [ebp-60]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-64]
	fild	dword ptr [ebp+16]
	fstp	dword ptr [ebp-68]
	fild	dword ptr [ebp+12]
	fstp	dword ptr [ebp-72]
	lea	dword23,dword ptr [__viewport_matrix]
	mov	[ebp-76],dword23
; start of inline function matrix4f_make_viewport
	mov	dword265,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [dword265]
	mov	dword269,[ebp-76]
	fldz
	fstp	dword ptr [dword269+4]
	mov	dword271,[ebp-76]
	fldz
	fstp	dword ptr [dword271+8]
	mov	dword273,[ebp-76]
	fldz
	fstp	dword ptr [dword273+12]
	mov	dword275,[ebp-76]
	fldz
	fstp	dword ptr [dword275+16]
	mov	dword277,[ebp-76]
	fld	dword ptr [ebp-68]
	fldz
	fsubrp
	fld	dword ptr [___unnamed_float_1]
	fdivp
	fstp	dword ptr [dword277+20]
	mov	dword281,[ebp-76]
	fldz
	fstp	dword ptr [dword281+24]
	mov	dword283,[ebp-76]
	fldz
	fstp	dword ptr [dword283+28]
	mov	dword285,[ebp-76]
	fldz
	fstp	dword ptr [dword285+32]
	mov	dword287,[ebp-76]
	fldz
	fstp	dword ptr [dword287+36]
	mov	dword289,[ebp-76]
	fld	dword ptr [ebp-60]
	fsub	dword ptr [ebp-64]
	fstp	dword ptr [dword289+40]
	mov	dword293,[ebp-76]
	fldz
	fstp	dword ptr [dword293+44]
	mov	dword295,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-72]
	fstp	dword ptr [dword295+48]
	mov	dword299,[ebp-76]
	fld	dword ptr [___unnamed_float_1]
	fdivr	dword ptr [ebp-68]
	fstp	dword ptr [dword299+52]
	mov	dword303,[ebp-76]
	fld	dword ptr [ebp-64]
	fstp	dword ptr [dword303+56]
	mov	dword306,[ebp-76]
	fld1
	fstp	dword ptr [dword306+60]
label0011:
; end of inline function matrix4f_make_viewport
	fld1
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword25,dword ptr [__clip_z_near_base]
	mov	[ebp-28],dword25
; start of inline function vec4f_assign
	mov	dword59,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword59]
	mov	dword62,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword62+4]
	mov	dword65,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword65+8]
	mov	dword68,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword68+12]
label0004:
; end of inline function vec4f_assign
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
	fld1
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp-4]
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword32,dword ptr [__clip_z_near_norm]
	mov	[ebp-28],dword32
; start of inline function vec4f_assign
	mov	dword72,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword72]
	mov	dword75,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword75+4]
	mov	dword78,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword78+8]
	mov	dword81,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword81+12]
label0005:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp+28]
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword34,dword ptr [__clip_z_far_base]
	mov	[ebp-28],dword34
; start of inline function vec4f_assign
	mov	dword85,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword85]
	mov	dword88,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword88+4]
	mov	dword91,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword91+8]
	mov	dword94,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword94+12]
label0006:
; end of inline function vec4f_assign
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
	fld1
	fstp	dword ptr [ebp-12]
	fld	dword ptr [ebp-8]
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword41,dword ptr [__clip_z_far_norm]
	mov	[ebp-28],dword41
; start of inline function vec4f_assign
	mov	dword98,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword98]
	mov	dword101,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword101+4]
	mov	dword104,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword104+8]
	mov	dword107,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword107+12]
label0007:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	fstp	dword ptr [ebp-24]
	lea	dword44,dword ptr [__clip_plane_left_base]
	mov	[ebp-28],dword44
; start of inline function vec4f_assign
	mov	dword111,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword111]
	mov	dword114,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword114+4]
	mov	dword117,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword117+8]
	mov	dword120,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword120+12]
label0008:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fld1
	fstp	dword ptr [ebp-24]
	lea	dword45,dword ptr [__clip_plane_left_norm]
	mov	[ebp-28],dword45
; start of inline function vec4f_assign
	mov	dword124,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword124]
	mov	dword127,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword127+4]
	mov	dword130,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword130+8]
	mov	dword133,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword133+12]
label0009:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fild	dword ptr [ebp+12]
	fld1
	fdivrp
	fld1
	fsubrp
	fstp	dword ptr [ebp-24]
	lea	dword47,dword ptr [__clip_plane_right_base]
	mov	[ebp-28],dword47
; start of inline function vec4f_assign
	mov	dword137,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword137]
	mov	dword140,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword140+4]
	mov	dword143,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword143+8]
	mov	dword146,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword146+12]
label000a:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fldz
	fstp	dword ptr [ebp-20]
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-24]
	lea	dword49,dword ptr [__clip_plane_right_norm]
	mov	[ebp-28],dword49
; start of inline function vec4f_assign
	mov	dword150,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword150]
	mov	dword153,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword153+4]
	mov	dword156,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword156+8]
	mov	dword159,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword159+12]
label000b:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fild	dword ptr [ebp+16]
	fld1
	fdivrp
	fld	dword ptr [___unnamed_float_2]
	faddp
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword52,dword ptr [__clip_plane_top_base]
	mov	[ebp-28],dword52
; start of inline function vec4f_assign
	mov	dword163,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword163]
	mov	dword166,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword166+4]
	mov	dword169,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword169+8]
	mov	dword172,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword172+12]
label000c:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld1
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword53,dword ptr [__clip_plane_top_norm]
	mov	[ebp-28],dword53
; start of inline function vec4f_assign
	mov	dword176,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword176]
	mov	dword179,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword179+4]
	mov	dword182,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword182+8]
	mov	dword185,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword185+12]
label000d:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld1
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword54,dword ptr [__clip_plane_bottom_base]
	mov	[ebp-28],dword54
; start of inline function vec4f_assign
	mov	dword189,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword189]
	mov	dword192,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword192+4]
	mov	dword195,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword195+8]
	mov	dword198,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword198+12]
label000e:
; end of inline function vec4f_assign
	fld1
	fstp	dword ptr [ebp-12]
	fldz
	fstp	dword ptr [ebp-16]
	fld	dword ptr [___unnamed_float_2]
	fstp	dword ptr [ebp-20]
	fldz
	fstp	dword ptr [ebp-24]
	lea	dword56,dword ptr [__clip_plane_bottom_norm]
	mov	[ebp-28],dword56
; start of inline function vec4f_assign
	mov	dword202,[ebp-28]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword202]
	mov	dword205,[ebp-28]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword205+4]
	mov	dword208,[ebp-28]
	fld	dword ptr [ebp-16]
	fstp	dword ptr [dword208+8]
	mov	dword211,[ebp-28]
	fld	dword ptr [ebp-12]
	fstp	dword ptr [dword211+12]
label000f:
; end of inline function vec4f_assign
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

__rasterize_horiz_line proc
	create_stack_frame
	mov	dword106,[ebp+8]
	mov	dword101,dword ptr [__pitch]
	imul	dword101,[ebp+16]
	add	dword101,dword ptr [__videomem]
	mov	dword7,dword106
	sal	dword7,2
	add	dword101,dword7
	mov	dword104,[ebp+12]
	sal	dword104,2
	add	dword104,dword101
	mov	dword15,dword106
	sal	dword15,2
	sub	dword104,dword15
label0000:
	fld	dword ptr [ebp+24]
	fstp	dword ptr [ebp-48]
	fld	dword ptr [ebp+20]
	fstp	dword ptr [ebp-52]
; start of inline function _tex2d
	mov	dword83,dword ptr [__texture_width]
	dec	dword83
	int2float	dword83
	fmul	dword ptr [ebp-52]
	float2int	dword85
	mov	[ebp-56],dword85
	mov	dword89,dword ptr [__texture_height]
	dec	dword89
	int2float	dword89
	fmul	dword ptr [ebp-48]
	float2int	dword91
	mov	[ebp-60],dword91
	mov	dword95,[ebp-60]
	imul	dword95,dword ptr [__texture_width]
	add	dword95,[ebp-56]
	sal	dword95,2
	add	dword95,dword ptr [__texture_data]
	mov	dword99,[dword95]
	mov	[ebp-64],dword99
label0004:
; end of inline function _tex2d
	mov	dword102,[ebp-64]
	mov	dword23,dword102
	sar	dword23,24
	and	dword23,255
	mov	[ebp-40],dword23
	cmp	dword ptr [ebp-40],0
	je	label0003
	fild	dword ptr [ebp-40]
	fld	dword ptr [___unnamed_float_3]
	fdivp
	fstp	dword ptr [ebp-44]
	mov	dword103,[dword101]
	mov	dword36,dword103
	and	dword36,65280
	sar	dword36,8
	mov	[ebp-32],dword36
	mov	dword41,dword103
	and	dword41,255
	mov	[ebp-36],dword41
	mov	dword45,dword102
	and	dword45,65280
	sar	dword45,8
	mov	[ebp-20],dword45
	mov	dword50,dword102
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
	mov	dword105,[ebp-20]
	sal	dword105,8
	add	dword105,[ebp-24]
	mov	[dword101],dword105
label0003:
	fld	dword ptr [ebp+20]
	fadd	dword ptr [ebp+28]
	fstp	dword ptr [ebp+20]
	fld	dword ptr [ebp+24]
	fadd	dword ptr [ebp+32]
	fstp	dword ptr [ebp+24]
label0001:
	add	dword101,4
	cmp	dword101,dword104
	jl	label0000
label0002:
	destroy_stack_frame
	ret
__rasterize_horiz_line endp	

__clip_on_plain proc
	create_stack_frame
	mov	dword349,[ebp+8]
	mov	dword ptr [dword349+192],0
	mov	dword350,[ebp+12]
	mov	dword351,[ebp+12]
	add	dword351,24
label0000:
label0001:
	mov	dword12,[ebp+12]
	mov	dword14,[dword12+192]
	imul	dword14,24
	mov	dword16,[ebp+12]
	add	dword16,dword14
	cmp	dword16,dword351
	jle	label0002
	mov	dword161,[ebp+16]
	mov	[ebp-108],dword161
	mov	[ebp-112],dword350
	lea	dword21,[ebp-24]
	mov	[ebp-116],dword21
; start of inline function vec4f_subtract
	mov	dword164,[ebp-112]
	mov	dword166,[ebp-108]
	fld	dword ptr [dword164]
	fsub	dword ptr [dword166]
	mov	dword168,[ebp-116]
	fstp	dword ptr [dword168]
	mov	dword170,[ebp-112]
	mov	dword172,[ebp-108]
	fld	dword ptr [dword170+4]
	fsub	dword ptr [dword172+4]
	mov	dword174,[ebp-116]
	fstp	dword ptr [dword174+4]
	mov	dword176,[ebp-112]
	mov	dword178,[ebp-108]
	fld	dword ptr [dword176+8]
	fsub	dword ptr [dword178+8]
	mov	dword180,[ebp-116]
	fstp	dword ptr [dword180+8]
	mov	dword182,[ebp-112]
	mov	dword184,[ebp-108]
	fld	dword ptr [dword182+12]
	fsub	dword ptr [dword184+12]
	mov	dword186,[ebp-116]
	fstp	dword ptr [dword186+12]
label000b:
; end of inline function vec4f_subtract
	mov	dword264,[ebp+20]
	mov	[ebp-120],dword264
	lea	dword23,[ebp-24]
	mov	[ebp-124],dword23
; start of inline function vec4f_dot
	mov	dword267,[ebp-124]
	mov	dword269,[ebp-120]
	fld	dword ptr [dword267+4]
	fmul	dword ptr [dword269+4]
	mov	dword271,[ebp-124]
	mov	dword273,[ebp-120]
	fld	dword ptr [dword271]
	fmul	dword ptr [dword273]
	faddp
	mov	dword275,[ebp-124]
	mov	dword277,[ebp-120]
	fld	dword ptr [dword275+8]
	fmul	dword ptr [dword277+8]
	faddp
	mov	dword279,[ebp-124]
	mov	dword281,[ebp-120]
	fld	dword ptr [dword279+12]
	fmul	dword ptr [dword281+12]
	faddp
	fstp	dword ptr [ebp-128]
label000f:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-52]
	mov	dword187,[ebp+16]
	mov	[ebp-108],dword187
	mov	[ebp-112],dword351
	lea	dword28,[ebp-24]
	mov	[ebp-116],dword28
; start of inline function vec4f_subtract
	mov	dword190,[ebp-112]
	mov	dword192,[ebp-108]
	fld	dword ptr [dword190]
	fsub	dword ptr [dword192]
	mov	dword194,[ebp-116]
	fstp	dword ptr [dword194]
	mov	dword196,[ebp-112]
	mov	dword198,[ebp-108]
	fld	dword ptr [dword196+4]
	fsub	dword ptr [dword198+4]
	mov	dword200,[ebp-116]
	fstp	dword ptr [dword200+4]
	mov	dword202,[ebp-112]
	mov	dword204,[ebp-108]
	fld	dword ptr [dword202+8]
	fsub	dword ptr [dword204+8]
	mov	dword206,[ebp-116]
	fstp	dword ptr [dword206+8]
	mov	dword208,[ebp-112]
	mov	dword210,[ebp-108]
	fld	dword ptr [dword208+12]
	fsub	dword ptr [dword210+12]
	mov	dword212,[ebp-116]
	fstp	dword ptr [dword212+12]
label000c:
; end of inline function vec4f_subtract
	mov	dword282,[ebp+20]
	mov	[ebp-120],dword282
	lea	dword30,[ebp-24]
	mov	[ebp-124],dword30
; start of inline function vec4f_dot
	mov	dword285,[ebp-124]
	mov	dword287,[ebp-120]
	fld	dword ptr [dword285+4]
	fmul	dword ptr [dword287+4]
	mov	dword289,[ebp-124]
	mov	dword291,[ebp-120]
	fld	dword ptr [dword289]
	fmul	dword ptr [dword291]
	faddp
	mov	dword293,[ebp-124]
	mov	dword295,[ebp-120]
	fld	dword ptr [dword293+8]
	fmul	dword ptr [dword295+8]
	faddp
	mov	dword297,[ebp-124]
	mov	dword299,[ebp-120]
	fld	dword ptr [dword297+12]
	fmul	dword ptr [dword299+12]
	faddp
	fstp	dword ptr [ebp-128]
label0010:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fstp	dword ptr [ebp-56]
	fldz
	fld	dword ptr [ebp-52]
	fucomip	st,st(1)
	fstp	st
	jb	label0003
	mov	dword35,[dword349+192]
	inc	dword ptr [dword349+192]
	imul	dword35,24
	mov	dword38,dword349
	add	dword38,dword35
	mov	dword41,[dword350]
	mov	dword42,[dword350+4]
	mov	[dword38],dword41
	mov	[dword38+4],dword42
	mov	dword41,[dword350+8]
	mov	dword42,[dword350+12]
	mov	[dword38+8],dword41
	mov	[dword38+12],dword42
	mov	dword41,[dword350+16]
	mov	dword42,[dword350+20]
	mov	[dword38+16],dword41
	mov	[dword38+20],dword42
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
	mov	[ebp-108],dword350
	mov	dword213,[ebp+16]
	mov	[ebp-112],dword213
	lea	dword50,[ebp-24]
	mov	[ebp-116],dword50
; start of inline function vec4f_subtract
	mov	dword216,[ebp-112]
	mov	dword218,[ebp-108]
	fld	dword ptr [dword216]
	fsub	dword ptr [dword218]
	mov	dword220,[ebp-116]
	fstp	dword ptr [dword220]
	mov	dword222,[ebp-112]
	mov	dword224,[ebp-108]
	fld	dword ptr [dword222+4]
	fsub	dword ptr [dword224+4]
	mov	dword226,[ebp-116]
	fstp	dword ptr [dword226+4]
	mov	dword228,[ebp-112]
	mov	dword230,[ebp-108]
	fld	dword ptr [dword228+8]
	fsub	dword ptr [dword230+8]
	mov	dword232,[ebp-116]
	fstp	dword ptr [dword232+8]
	mov	dword234,[ebp-112]
	mov	dword236,[ebp-108]
	fld	dword ptr [dword234+12]
	fsub	dword ptr [dword236+12]
	mov	dword238,[ebp-116]
	fstp	dword ptr [dword238+12]
label000d:
; end of inline function vec4f_subtract
	mov	[ebp-108],dword350
	mov	[ebp-112],dword351
	lea	dword55,[ebp-40]
	mov	[ebp-116],dword55
; start of inline function vec4f_subtract
	mov	dword241,[ebp-112]
	mov	dword243,[ebp-108]
	fld	dword ptr [dword241]
	fsub	dword ptr [dword243]
	mov	dword245,[ebp-116]
	fstp	dword ptr [dword245]
	mov	dword247,[ebp-112]
	mov	dword249,[ebp-108]
	fld	dword ptr [dword247+4]
	fsub	dword ptr [dword249+4]
	mov	dword251,[ebp-116]
	fstp	dword ptr [dword251+4]
	mov	dword253,[ebp-112]
	mov	dword255,[ebp-108]
	fld	dword ptr [dword253+8]
	fsub	dword ptr [dword255+8]
	mov	dword257,[ebp-116]
	fstp	dword ptr [dword257+8]
	mov	dword259,[ebp-112]
	mov	dword261,[ebp-108]
	fld	dword ptr [dword259+12]
	fsub	dword ptr [dword261+12]
	mov	dword263,[ebp-116]
	fstp	dword ptr [dword263+12]
label000e:
; end of inline function vec4f_subtract
	mov	dword300,[ebp+20]
	mov	[ebp-120],dword300
	lea	dword57,[ebp-24]
	mov	[ebp-124],dword57
; start of inline function vec4f_dot
	mov	dword303,[ebp-124]
	mov	dword305,[ebp-120]
	fld	dword ptr [dword303+4]
	fmul	dword ptr [dword305+4]
	mov	dword307,[ebp-124]
	mov	dword309,[ebp-120]
	fld	dword ptr [dword307]
	fmul	dword ptr [dword309]
	faddp
	mov	dword311,[ebp-124]
	mov	dword313,[ebp-120]
	fld	dword ptr [dword311+8]
	fmul	dword ptr [dword313+8]
	faddp
	mov	dword315,[ebp-124]
	mov	dword317,[ebp-120]
	fld	dword ptr [dword315+12]
	fmul	dword ptr [dword317+12]
	faddp
	fstp	dword ptr [ebp-128]
label0011:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	mov	dword318,[ebp+20]
	mov	[ebp-120],dword318
	lea	dword59,[ebp-40]
	mov	[ebp-124],dword59
; start of inline function vec4f_dot
	mov	dword321,[ebp-124]
	mov	dword323,[ebp-120]
	fld	dword ptr [dword321+4]
	fmul	dword ptr [dword323+4]
	mov	dword325,[ebp-124]
	mov	dword327,[ebp-120]
	fld	dword ptr [dword325]
	fmul	dword ptr [dword327]
	faddp
	mov	dword329,[ebp-124]
	mov	dword331,[ebp-120]
	fld	dword ptr [dword329+8]
	fmul	dword ptr [dword331+8]
	faddp
	mov	dword333,[ebp-124]
	mov	dword335,[ebp-120]
	fld	dword ptr [dword333+12]
	fmul	dword ptr [dword335+12]
	faddp
	fstp	dword ptr [ebp-128]
label0012:
; end of inline function vec4f_dot
	fld	dword ptr [ebp-128]
	fdivp
	fstp	dword ptr [ebp-60]
	fld	dword ptr [ebp-60]
	fstp	dword ptr [ebp-132]
	lea	dword62,[ebp-40]
	mov	[ebp-136],dword62
; start of inline function vec4f_mul
	mov	dword338,[ebp-136]
	fld	dword ptr [dword338]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword338]
	mov	dword341,[ebp-136]
	fld	dword ptr [dword341+4]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword341+4]
	mov	dword344,[ebp-136]
	fld	dword ptr [dword344+8]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword344+8]
	mov	dword347,[ebp-136]
	fld	dword ptr [dword347+12]
	fmul	dword ptr [ebp-132]
	fstp	dword ptr [dword347+12]
label0013:
; end of inline function vec4f_mul
	lea	dword63,[ebp-40]
	mov	[ebp-96],dword63
	mov	[ebp-100],dword350
	mov	dword69,[dword349+192]
	imul	dword69,24
	mov	dword71,dword349
	add	dword71,dword69
	mov	[ebp-104],dword71
; start of inline function vec4f_add
	mov	dword138,[ebp-100]
	mov	dword140,[ebp-96]
	fld	dword ptr [dword138]
	fadd	dword ptr [dword140]
	mov	dword142,[ebp-104]
	fstp	dword ptr [dword142]
	mov	dword144,[ebp-100]
	mov	dword146,[ebp-96]
	fld	dword ptr [dword144+4]
	fadd	dword ptr [dword146+4]
	mov	dword148,[ebp-104]
	fstp	dword ptr [dword148+4]
	mov	dword150,[ebp-100]
	mov	dword152,[ebp-96]
	fld	dword ptr [dword150+8]
	fadd	dword ptr [dword152+8]
	mov	dword154,[ebp-104]
	fstp	dword ptr [dword154+8]
	mov	dword156,[ebp-100]
	mov	dword158,[ebp-96]
	fld	dword ptr [dword156+12]
	fadd	dword ptr [dword158+12]
	mov	dword160,[ebp-104]
	fstp	dword ptr [dword160+12]
label000a:
; end of inline function vec4f_add
	mov	dword73,16
	add	dword73,dword350
	mov	[ebp-76],dword73
	mov	dword75,16
	add	dword75,dword351
	mov	[ebp-80],dword75
	lea	dword76,[ebp-48]
	mov	[ebp-84],dword76
; start of inline function vec2f_subtract
	mov	dword118,[ebp-80]
	mov	dword120,[ebp-76]
	fld	dword ptr [dword118]
	fsub	dword ptr [dword120]
	mov	dword122,[ebp-84]
	fstp	dword ptr [dword122]
	mov	dword124,[ebp-80]
	mov	dword126,[ebp-76]
	fld	dword ptr [dword124+4]
	fsub	dword ptr [dword126+4]
	mov	dword128,[ebp-84]
	fstp	dword ptr [dword128+4]
label0008:
; end of inline function vec2f_subtract
	fld	dword ptr [ebp-60]
	fstp	dword ptr [ebp-88]
	lea	dword78,[ebp-48]
	mov	[ebp-92],dword78
; start of inline function vec2f_mul
	mov	dword131,[ebp-92]
	fld	dword ptr [dword131]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [dword131]
	mov	dword134,[ebp-92]
	fld	dword ptr [dword134+4]
	fmul	dword ptr [ebp-88]
	fstp	dword ptr [dword134+4]
label0009:
; end of inline function vec2f_mul
	lea	dword79,[ebp-48]
	mov	[ebp-64],dword79
	mov	dword81,16
	add	dword81,dword350
	mov	[ebp-68],dword81
	mov	dword85,[dword349+192]
	imul	dword85,24
	mov	dword87,dword349
	add	dword87,dword85
	add	dword87,16
	mov	[ebp-72],dword87
; start of inline function vec2f_add
	mov	dword105,[ebp-68]
	mov	dword107,[ebp-64]
	fld	dword ptr [dword105]
	fadd	dword ptr [dword107]
	mov	dword109,[ebp-72]
	fstp	dword ptr [dword109]
	mov	dword111,[ebp-68]
	mov	dword113,[ebp-64]
	fld	dword ptr [dword111+4]
	fadd	dword ptr [dword113+4]
	mov	dword115,[ebp-72]
	fstp	dword ptr [dword115+4]
label0007:
; end of inline function vec2f_add
	inc	dword ptr [dword349+192]
label0004:
	add	dword350,24
	add	dword351,24
	jmp	label0001
label0002:
	mov	dword95,[dword349+192]
	inc	dword ptr [dword349+192]
	imul	dword95,24
	mov	dword98,dword349
	add	dword98,dword95
	mov	dword101,[dword349]
	mov	dword102,[dword349+4]
	mov	[dword98],dword101
	mov	[dword98+4],dword102
	mov	dword101,[dword349+8]
	mov	dword102,[dword349+12]
	mov	[dword98+8],dword101
	mov	[dword98+12],dword102
	mov	dword101,[dword349+16]
	mov	dword102,[dword349+20]
	mov	[dword98+16],dword101
	mov	[dword98+20],dword102
	destroy_stack_frame
	ret
__clip_on_plain endp	

__transform_to_projection_space proc
	create_stack_frame
	mov	dword99,[ebp+12]
	fld1
	fstp	dword ptr [ebp-20]
	fld	dword ptr [dword99+8]
	fstp	dword ptr [ebp-24]
	fld	dword ptr [dword99+4]
	fstp	dword ptr [ebp-28]
	fld	dword ptr [dword99]
	fstp	dword ptr [ebp-32]
	lea	dword7,[ebp-16]
	mov	[ebp-36],dword7
; start of inline function vec4f_assign
	mov	dword13,[ebp-36]
	fld	dword ptr [ebp-32]
	fstp	dword ptr [dword13]
	mov	dword16,[ebp-36]
	fld	dword ptr [ebp-28]
	fstp	dword ptr [dword16+4]
	mov	dword19,[ebp-36]
	fld	dword ptr [ebp-24]
	fstp	dword ptr [dword19+8]
	mov	dword22,[ebp-36]
	fld	dword ptr [ebp-20]
	fstp	dword ptr [dword22+12]
label0000:
; end of inline function vec4f_assign
	mov	[ebp-40],(offset __mvproj_matrix)
	lea	dword9,[ebp-16]
	mov	[ebp-44],dword9
	mov	dword24,[ebp+8]
	mov	[ebp-48],dword24
; start of inline function matrix4f_transform
	mov	dword27,[ebp-44]
	mov	dword29,[ebp-40]
	fld	dword ptr [dword27+4]
	fmul	dword ptr [dword29+16]
	mov	dword31,[ebp-44]
	mov	dword33,[ebp-40]
	fld	dword ptr [dword31]
	fmul	dword ptr [dword33]
	faddp
	mov	dword35,[ebp-44]
	mov	dword37,[ebp-40]
	fld	dword ptr [dword35+8]
	fmul	dword ptr [dword37+32]
	faddp
	mov	dword39,[ebp-44]
	mov	dword41,[ebp-40]
	fld	dword ptr [dword39+12]
	fmul	dword ptr [dword41+48]
	faddp
	mov	dword43,[ebp-48]
	fstp	dword ptr [dword43]
	mov	dword45,[ebp-40]
	mov	dword47,[ebp-44]
	fld	dword ptr [dword47]
	fmul	dword ptr [dword45+4]
	mov	dword49,[ebp-44]
	mov	dword51,[ebp-40]
	fld	dword ptr [dword49+4]
	fmul	dword ptr [dword51+20]
	faddp
	mov	dword53,[ebp-44]
	mov	dword55,[ebp-40]
	fld	dword ptr [dword53+8]
	fmul	dword ptr [dword55+36]
	faddp
	mov	dword57,[ebp-44]
	mov	dword59,[ebp-40]
	fld	dword ptr [dword57+12]
	fmul	dword ptr [dword59+52]
	faddp
	mov	dword61,[ebp-48]
	fstp	dword ptr [dword61+4]
	mov	dword63,[ebp-40]
	mov	dword65,[ebp-44]
	fld	dword ptr [dword65]
	fmul	dword ptr [dword63+8]
	mov	dword67,[ebp-44]
	mov	dword69,[ebp-40]
	fld	dword ptr [dword67+4]
	fmul	dword ptr [dword69+24]
	faddp
	mov	dword71,[ebp-44]
	mov	dword73,[ebp-40]
	fld	dword ptr [dword71+8]
	fmul	dword ptr [dword73+40]
	faddp
	mov	dword75,[ebp-44]
	mov	dword77,[ebp-40]
	fld	dword ptr [dword75+12]
	fmul	dword ptr [dword77+56]
	faddp
	mov	dword79,[ebp-48]
	fstp	dword ptr [dword79+8]
	mov	dword81,[ebp-40]
	mov	dword83,[ebp-44]
	fld	dword ptr [dword83]
	fmul	dword ptr [dword81+12]
	mov	dword85,[ebp-44]
	mov	dword87,[ebp-40]
	fld	dword ptr [dword85+4]
	fmul	dword ptr [dword87+28]
	faddp
	mov	dword89,[ebp-44]
	mov	dword91,[ebp-40]
	fld	dword ptr [dword89+8]
	fmul	dword ptr [dword91+44]
	faddp
	mov	dword93,[ebp-44]
	mov	dword95,[ebp-40]
	fld	dword ptr [dword93+12]
	fmul	dword ptr [dword95+60]
	faddp
	mov	dword97,[ebp-48]
	fstp	dword ptr [dword97+12]
label0001:
; end of inline function matrix4f_transform
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
	lea	dword37,[ebp-196]
	mov	[ebp-200],dword37
; start of inline function _rasterize_polygon_4f
	mov	dword722,[ebp-200]
	mov	[ebp-464],dword722
; start of inline function _clip_poligon
	push_all
	lea	dword724,dword ptr [__clip_z_far_norm]
	push_arg	dword724,4
	lea	dword725,dword ptr [__clip_z_far_base]
	push_arg	dword725,4
	push_arg	dword ptr [ebp-464],4
	lea	dword727,[ebp-660]
	push_arg	dword727,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword728,dword ptr [__clip_z_near_norm]
	push_arg	dword728,4
	lea	dword729,dword ptr [__clip_z_near_base]
	push_arg	dword729,4
	lea	dword730,[ebp-660]
	push_arg	dword730,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword732,dword ptr [__clip_plane_left_norm]
	push_arg	dword732,4
	lea	dword733,dword ptr [__clip_plane_left_base]
	push_arg	dword733,4
	push_arg	dword ptr [ebp-464],4
	lea	dword735,[ebp-660]
	push_arg	dword735,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword736,dword ptr [__clip_plane_right_norm]
	push_arg	dword736,4
	lea	dword737,dword ptr [__clip_plane_right_base]
	push_arg	dword737,4
	lea	dword738,[ebp-660]
	push_arg	dword738,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword740,dword ptr [__clip_plane_top_norm]
	push_arg	dword740,4
	lea	dword741,dword ptr [__clip_plane_top_base]
	push_arg	dword741,4
	push_arg	dword ptr [ebp-464],4
	lea	dword743,[ebp-660]
	push_arg	dword743,4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	push_all
	lea	dword744,dword ptr [__clip_plane_bottom_norm]
	push_arg	dword744,4
	lea	dword745,dword ptr [__clip_plane_bottom_base]
	push_arg	dword745,4
	lea	dword746,[ebp-660]
	push_arg	dword746,4
	push_arg	dword ptr [ebp-464],4
	call	__clip_on_plain
	restore_stack	16
	pop_all
	mov	dword749,[ebp-464]
	cmp	dword ptr [dword749+192],1
	setg	byte8
	movzx	dword751,byte8
	mov	[ebp-664],dword751
label0028:
; end of inline function _clip_poligon
	mov	dword40,[ebp-664]
	cmp	dword40,0
	jne	label0000
	jmp	label002d
label0000:
	mov	dword42,[ebp-200]
	cmp	dword ptr [dword42+192],8
	jle	label0001
	mov	dword ptr ds:[0],0
label0001:
	mov	dword ptr [ebp-336],0
label0002:
label0003:
	mov	dword49,[ebp-200]
	mov	dword51,[dword49+192]
	cmp	dword51,[ebp-336]
	jle	label0004
	mov	dword53,[ebp-200]
	mov	dword56,[ebp-336]
	imul	dword56,24
	add	dword53,dword56
	mov	[ebp-668],dword53
	lea	dword57,[ebp-332]
	mov	dword60,[ebp-336]
	sal	dword60,4
	add	dword57,dword60
	mov	[ebp-672],dword57
; start of inline function _transform_to_screen_space
	lea	dword753,dword ptr [__viewport_matrix]
	mov	[ebp-696],dword753
	mov	dword786,[ebp-668]
	mov	[ebp-700],dword786
	lea	dword755,[ebp-688]
	mov	[ebp-704],dword755
; start of inline function matrix4f_transform
	mov	dword789,[ebp-700]
	mov	dword791,[ebp-696]
	fld	dword ptr [dword789+4]
	fmul	dword ptr [dword791+16]
	mov	dword793,[ebp-700]
	mov	dword795,[ebp-696]
	fld	dword ptr [dword793]
	fmul	dword ptr [dword795]
	faddp
	mov	dword797,[ebp-700]
	mov	dword799,[ebp-696]
	fld	dword ptr [dword797+8]
	fmul	dword ptr [dword799+32]
	faddp
	mov	dword801,[ebp-700]
	mov	dword803,[ebp-696]
	fld	dword ptr [dword801+12]
	fmul	dword ptr [dword803+48]
	faddp
	mov	dword805,[ebp-704]
	fstp	dword ptr [dword805]
	mov	dword807,[ebp-696]
	mov	dword809,[ebp-700]
	fld	dword ptr [dword809]
	fmul	dword ptr [dword807+4]
	mov	dword811,[ebp-700]
	mov	dword813,[ebp-696]
	fld	dword ptr [dword811+4]
	fmul	dword ptr [dword813+20]
	faddp
	mov	dword815,[ebp-700]
	mov	dword817,[ebp-696]
	fld	dword ptr [dword815+8]
	fmul	dword ptr [dword817+36]
	faddp
	mov	dword819,[ebp-700]
	mov	dword821,[ebp-696]
	fld	dword ptr [dword819+12]
	fmul	dword ptr [dword821+52]
	faddp
	mov	dword823,[ebp-704]
	fstp	dword ptr [dword823+4]
	mov	dword825,[ebp-696]
	mov	dword827,[ebp-700]
	fld	dword ptr [dword827]
	fmul	dword ptr [dword825+8]
	mov	dword829,[ebp-700]
	mov	dword831,[ebp-696]
	fld	dword ptr [dword829+4]
	fmul	dword ptr [dword831+24]
	faddp
	mov	dword833,[ebp-700]
	mov	dword835,[ebp-696]
	fld	dword ptr [dword833+8]
	fmul	dword ptr [dword835+40]
	faddp
	mov	dword837,[ebp-700]
	mov	dword839,[ebp-696]
	fld	dword ptr [dword837+12]
	fmul	dword ptr [dword839+56]
	faddp
	mov	dword841,[ebp-704]
	fstp	dword ptr [dword841+8]
	mov	dword843,[ebp-696]
	mov	dword845,[ebp-700]
	fld	dword ptr [dword845]
	fmul	dword ptr [dword843+12]
	mov	dword847,[ebp-700]
	mov	dword849,[ebp-696]
	fld	dword ptr [dword847+4]
	fmul	dword ptr [dword849+28]
	faddp
	mov	dword851,[ebp-700]
	mov	dword853,[ebp-696]
	fld	dword ptr [dword851+8]
	fmul	dword ptr [dword853+44]
	faddp
	mov	dword855,[ebp-700]
	mov	dword857,[ebp-696]
	fld	dword ptr [dword855+12]
	fmul	dword ptr [dword857+60]
	faddp
	mov	dword859,[ebp-704]
	fstp	dword ptr [dword859+12]
label002b:
; end of inline function matrix4f_transform
	lea	dword756,[ebp-688]
	add	dword756,12
	fld1
	fdiv	dword ptr [dword756]
	fstp	dword ptr [ebp-692]
	fld	dword ptr [ebp-688]
	fmul	dword ptr [ebp-692]
	float2int	dword761
	mov	dword763,[ebp-672]
	mov	[dword763],dword761
	lea	dword764,[ebp-688]
	add	dword764,4
	fld	dword ptr [dword764]
	fmul	dword ptr [ebp-692]
	float2int	dword767
	mov	dword769,[ebp-672]
	mov	[dword769+4],dword767
	mov	dword771,[ebp-672]
	cmp	dword ptr [dword771],0
	jl	label002a
	mov	dword774,[ebp-672]
	mov	dword776,[dword774]
	cmp	dword776,dword ptr [__width]
	jge	label002a
	mov	dword778,[ebp-672]
	cmp	dword ptr [dword778+4],0
	jl	label002a
	mov	dword781,[ebp-672]
	mov	dword783,[dword781+4]
	cmp	dword783,dword ptr [__height]
	jl	label0029
label002a:
	mov	dword ptr ds:[0],0
label0029:
label002c:
; end of inline function _transform_to_screen_space
	lea	dword61,[ebp-332]
	mov	dword64,[ebp-336]
	sal	dword64,4
	add	dword61,dword64
	add	dword61,8
	mov	dword67,[ebp-200]
	mov	dword70,[ebp-336]
	imul	dword70,24
	add	dword67,dword70
	add	dword67,16
	mov	dword72,[dword67]
	mov	dword73,[dword67+4]
	mov	[dword61],dword72
	mov	[dword61+4],dword73
	inc	dword ptr [ebp-336]
	jmp	label0003
label0004:
	mov	dword ptr [ebp-336],2
label0005:
label0006:
	mov	dword78,[ebp-200]
	mov	dword80,[dword78+192]
	dec	dword80
	cmp	dword80,[ebp-336]
	jle	label0007
	lea	dword82,[ebp-332]
	mov	dword85,[ebp-336]
	sal	dword85,4
	add	dword82,dword85
	mov	[ebp-340],dword82
	mov	dword88,[ebp-336]
	dec	dword88
	sal	dword88,4
	lea	dword90,[ebp-332]
	add	dword90,dword88
	mov	[ebp-344],dword90
	lea	dword91,[ebp-332]
	mov	[ebp-348],dword91
; start of inline function _rasterize_triangle_2i
	mov	dword95,[ebp-348]
	add	dword95,4
	mov	dword98,[ebp-344]
	add	dword98,4
	mov	dword100,[dword95]
	cmp	dword100,[dword98]
	jle	label0008
	mov	dword103,[ebp-348]
	mov	[ebp-352],dword103
	mov	dword106,[ebp-344]
	mov	[ebp-348],dword106
	mov	dword109,[ebp-352]
	mov	[ebp-344],dword109
label0008:
	mov	dword111,[ebp-348]
	add	dword111,4
	mov	dword114,[ebp-340]
	add	dword114,4
	mov	dword116,[dword111]
	cmp	dword116,[dword114]
	jle	label0009
	mov	dword119,[ebp-348]
	mov	[ebp-352],dword119
	mov	dword122,[ebp-340]
	mov	[ebp-348],dword122
	mov	dword125,[ebp-352]
	mov	[ebp-340],dword125
label0009:
	mov	dword127,[ebp-344]
	add	dword127,4
	mov	dword130,[ebp-340]
	add	dword130,4
	mov	dword132,[dword127]
	cmp	dword132,[dword130]
	jle	label000a
	mov	dword135,[ebp-344]
	mov	[ebp-352],dword135
	mov	dword138,[ebp-340]
	mov	[ebp-344],dword138
	mov	dword141,[ebp-352]
	mov	[ebp-340],dword141
label000a:
	mov	dword143,[ebp-348]
	add	dword143,4
	mov	dword146,[ebp-340]
	add	dword146,4
	mov	dword148,[dword143]
	cmp	dword148,[dword146]
	jne	label000b
	mov	dword150,[ebp-348]
	add	dword150,4
	cmp	dword ptr [dword150],0
	jl	label000c
	mov	dword154,[ebp-348]
	add	dword154,4
	mov	dword157,[dword154]
	cmp	dword157,dword ptr [__height]
	jge	label000c
	fldz
	fstp	dword ptr [ebp-428]
	fldz
	fstp	dword ptr [ebp-432]
	mov	dword159,8
	add	dword159,[ebp-340]
	mov	[ebp-436],dword159
	mov	dword161,8
	add	dword161,[ebp-344]
	mov	[ebp-440],dword161
	mov	dword163,8
	add	dword163,[ebp-348]
	mov	[ebp-444],dword163
	mov	dword165,[ebp-348]
	add	dword165,4
	mov	dword651,[dword165]
	mov	[ebp-448],dword651
	mov	dword168,[ebp-340]
	mov	dword650,[dword168]
	mov	[ebp-452],dword650
	mov	dword170,[ebp-344]
	mov	dword649,[dword170]
	mov	[ebp-456],dword649
	mov	dword172,[ebp-348]
	mov	dword648,[dword172]
	mov	[ebp-460],dword648
; start of inline function _rasterize_triangle_1i
	mov	dword655,[ebp-460]
	cmp	dword655,[ebp-456]
	jge	label001c
	mov	dword658,[ebp-452]
	cmp	dword658,[ebp-456]
	jle	label001d
	push_all
	push_arg	dword ptr [ebp-428],4
	push_arg	dword ptr [ebp-432],4
	mov	dword662,[ebp-444]
	push_arg	dword ptr [dword662+4],4
	mov	dword664,[ebp-444]
	push_arg	dword ptr [dword664],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-452],4
	push_arg	dword ptr [ebp-460],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label001e
label001d:
	mov	dword670,[ebp-452]
	cmp	dword670,[ebp-460]
	jge	label001f
	push_all
	push_arg	dword ptr [ebp-428],4
	push_arg	dword ptr [ebp-432],4
	mov	dword674,[ebp-436]
	push_arg	dword ptr [dword674+4],4
	mov	dword676,[ebp-436]
	push_arg	dword ptr [dword676],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-456],4
	push_arg	dword ptr [ebp-452],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0020
label001f:
	push_all
	push_arg	dword ptr [ebp-428],4
	push_arg	dword ptr [ebp-432],4
	mov	dword683,[ebp-444]
	push_arg	dword ptr [dword683+4],4
	mov	dword685,[ebp-444]
	push_arg	dword ptr [dword685],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-456],4
	push_arg	dword ptr [ebp-460],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0020:
label001e:
	jmp	label0021
label001c:
	mov	dword691,[ebp-452]
	cmp	dword691,[ebp-456]
	jge	label0022
	push_all
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	push_arg	sse61,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	push_arg	sse62,4
	mov	dword695,[ebp-436]
	push_arg	dword ptr [dword695+4],4
	mov	dword697,[ebp-436]
	push_arg	dword ptr [dword697],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-460],4
	push_arg	dword ptr [ebp-452],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0023
label0022:
	mov	dword703,[ebp-452]
	cmp	dword703,[ebp-460]
	jle	label0024
	push_all
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	push_arg	sse63,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	push_arg	sse64,4
	mov	dword707,[ebp-440]
	push_arg	dword ptr [dword707+4],4
	mov	dword709,[ebp-440]
	push_arg	dword ptr [dword709],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-452],4
	push_arg	dword ptr [ebp-456],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0025
label0024:
	push_all
	fld	dword ptr [ebp-428]
	fldz
	fsubrp
	push_arg	sse65,4
	fld	dword ptr [ebp-432]
	fldz
	fsubrp
	push_arg	sse66,4
	mov	dword716,[ebp-440]
	push_arg	dword ptr [dword716+4],4
	mov	dword718,[ebp-440]
	push_arg	dword ptr [dword718],4
	push_arg	dword ptr [ebp-448],4
	push_arg	dword ptr [ebp-460],4
	push_arg	dword ptr [ebp-456],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0025:
label0023:
label0021:
label0026:
; end of inline function _rasterize_triangle_1i
label000c:
	jmp	label0027
label000b:
	mov	dword174,[ebp-348]
	add	dword174,4
	mov	dword177,[dword174]
	mov	[ebp-364],dword177
label000d:
label000e:
	mov	dword179,[ebp-344]
	add	dword179,4
	mov	dword182,[dword179]
	cmp	dword182,[ebp-364]
	jle	label000f
	mov	dword184,[ebp-348]
	add	dword184,4
	mov	dword187,[ebp-364]
	sub	dword187,[dword184]
	mov	dword189,[ebp-344]
	mov	dword191,[ebp-348]
	mov	dword192,[dword189]
	sub	dword192,[dword191]
	imul	dword187,dword192
	mov	dword194,[ebp-344]
	add	dword194,4
	mov	dword197,[ebp-348]
	add	dword197,4
	mov	dword199,[dword194]
	sub	dword199,[dword197]
	cdq	dword200
	idiv	dword187,dword199
	mov	dword202,[ebp-348]
	add	dword187,[dword202]
	mov	[ebp-356],dword187
	mov	dword205,[ebp-348]
	add	dword205,4
	mov	dword208,[ebp-364]
	sub	dword208,[dword205]
	mov	dword210,[ebp-340]
	mov	dword212,[ebp-348]
	mov	dword213,[dword210]
	sub	dword213,[dword212]
	imul	dword208,dword213
	mov	dword215,[ebp-340]
	add	dword215,4
	mov	dword218,[ebp-348]
	add	dword218,4
	mov	dword220,[dword215]
	sub	dword220,[dword218]
	cdq	dword221
	idiv	dword208,dword220
	mov	dword223,[ebp-348]
	add	dword208,[dword223]
	mov	[ebp-360],dword208
	mov	dword226,[ebp-348]
	add	dword226,4
	mov	dword229,[ebp-364]
	sub	dword229,[dword226]
	int2float	dword229
	mov	dword231,[ebp-344]
	mov	dword233,[ebp-348]
	fld	dword ptr [dword231+8]
	fsub	dword ptr [dword233+8]
	fmulp
	mov	dword235,[ebp-344]
	add	dword235,4
	mov	dword238,[ebp-348]
	add	dword238,4
	mov	dword240,[dword235]
	sub	dword240,[dword238]
	int2float	dword240
	fdivp
	mov	dword242,[ebp-348]
	fadd	dword ptr [dword242+8]
	fstp	dword ptr [ebp-368]
	mov	dword245,[ebp-348]
	add	dword245,4
	mov	dword248,[ebp-364]
	sub	dword248,[dword245]
	int2float	dword248
	mov	dword250,[ebp-340]
	mov	dword252,[ebp-348]
	fld	dword ptr [dword250+8]
	fsub	dword ptr [dword252+8]
	fmulp
	mov	dword254,[ebp-340]
	add	dword254,4
	mov	dword257,[ebp-348]
	add	dword257,4
	mov	dword259,[dword254]
	sub	dword259,[dword257]
	int2float	dword259
	fdivp
	mov	dword261,[ebp-348]
	fadd	dword ptr [dword261+8]
	fstp	dword ptr [ebp-376]
	mov	dword264,[ebp-348]
	add	dword264,4
	mov	dword267,[ebp-364]
	sub	dword267,[dword264]
	int2float	dword267
	mov	dword269,8
	add	dword269,[ebp-344]
	add	dword269,4
	mov	dword272,8
	add	dword272,[ebp-348]
	add	dword272,4
	fld	dword ptr [dword269]
	fsub	dword ptr [dword272]
	fmulp
	mov	dword275,[ebp-344]
	add	dword275,4
	mov	dword278,[ebp-348]
	add	dword278,4
	mov	dword280,[dword275]
	sub	dword280,[dword278]
	int2float	dword280
	fdivp
	mov	dword282,8
	add	dword282,[ebp-348]
	add	dword282,4
	fadd	dword ptr [dword282]
	fstp	dword ptr [ebp-372]
	mov	dword286,[ebp-348]
	add	dword286,4
	mov	dword289,[ebp-364]
	sub	dword289,[dword286]
	int2float	dword289
	mov	dword291,8
	add	dword291,[ebp-340]
	add	dword291,4
	mov	dword294,8
	add	dword294,[ebp-348]
	add	dword294,4
	fld	dword ptr [dword291]
	fsub	dword ptr [dword294]
	fmulp
	mov	dword297,[ebp-340]
	add	dword297,4
	mov	dword300,[ebp-348]
	add	dword300,4
	mov	dword302,[dword297]
	sub	dword302,[dword300]
	int2float	dword302
	fdivp
	mov	dword304,8
	add	dword304,[ebp-348]
	add	dword304,4
	fadd	dword ptr [dword304]
	fstp	dword ptr [ebp-380]
	mov	dword309,[ebp-360]
	sub	dword309,[ebp-356]
	int2float	dword309
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	dword315,[ebp-360]
	sub	dword315,[ebp-356]
	int2float	dword315
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	fld	dword ptr [ebp-388]
	fstp	dword ptr [ebp-392]
	fld	dword ptr [ebp-384]
	fstp	dword ptr [ebp-396]
	fld	dword ptr [ebp-380]
	fstp	dword ptr [ebp-400]
	fld	dword ptr [ebp-376]
	fstp	dword ptr [ebp-404]
	fld	dword ptr [ebp-372]
	fstp	dword ptr [ebp-408]
	fld	dword ptr [ebp-368]
	fstp	dword ptr [ebp-412]
	mov	dword587,[ebp-364]
	mov	[ebp-416],dword587
	mov	dword586,[ebp-360]
	mov	[ebp-420],dword586
	mov	dword585,[ebp-356]
	mov	[ebp-424],dword585
; start of inline function _rasterize_horiz_line__unordered
	mov	dword591,[ebp-424]
	cmp	dword591,[ebp-420]
	jg	label0013
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-408],4
	push_arg	dword ptr [ebp-412],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-420],4
	push_arg	dword ptr [ebp-424],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0014
label0013:
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0014:
label0015:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-364]
	jmp	label000e
label000f:
	mov	dword330,[ebp-344]
	add	dword330,4
	mov	dword333,[ebp-348]
	add	dword333,4
	mov	dword335,[dword330]
	sub	dword335,[dword333]
	mov	dword337,[ebp-340]
	mov	dword339,[ebp-348]
	mov	dword340,[dword337]
	sub	dword340,[dword339]
	imul	dword335,dword340
	mov	dword342,[ebp-340]
	add	dword342,4
	mov	dword345,[ebp-348]
	add	dword345,4
	mov	dword347,[dword342]
	sub	dword347,[dword345]
	cdq	dword348
	idiv	dword335,dword347
	mov	dword350,[ebp-348]
	add	dword335,[dword350]
	mov	[ebp-360],dword335
	mov	dword353,[ebp-344]
	add	dword353,4
	mov	dword356,[ebp-348]
	add	dword356,4
	mov	dword358,[dword353]
	sub	dword358,[dword356]
	int2float	dword358
	mov	dword360,[ebp-340]
	mov	dword362,[ebp-348]
	fld	dword ptr [dword360+8]
	fsub	dword ptr [dword362+8]
	fmulp
	mov	dword364,[ebp-340]
	add	dword364,4
	mov	dword367,[ebp-348]
	add	dword367,4
	mov	dword369,[dword364]
	sub	dword369,[dword367]
	int2float	dword369
	fdivp
	mov	dword371,[ebp-348]
	fadd	dword ptr [dword371+8]
	fstp	dword ptr [ebp-376]
	mov	dword374,[ebp-344]
	add	dword374,4
	mov	dword377,[ebp-348]
	add	dword377,4
	mov	dword379,[dword374]
	sub	dword379,[dword377]
	int2float	dword379
	mov	dword381,8
	add	dword381,[ebp-340]
	add	dword381,4
	mov	dword384,8
	add	dword384,[ebp-348]
	add	dword384,4
	fld	dword ptr [dword381]
	fsub	dword ptr [dword384]
	fmulp
	mov	dword387,[ebp-340]
	add	dword387,4
	mov	dword390,[ebp-348]
	add	dword390,4
	mov	dword392,[dword387]
	sub	dword392,[dword390]
	int2float	dword392
	fdivp
	mov	dword394,8
	add	dword394,[ebp-348]
	add	dword394,4
	fadd	dword ptr [dword394]
	fstp	dword ptr [ebp-380]
	mov	dword398,[ebp-344]
	fld	dword ptr [ebp-376]
	fsub	dword ptr [dword398+8]
	mov	dword401,[ebp-344]
	mov	dword403,[ebp-360]
	sub	dword403,[dword401]
	int2float	dword403
	fdivp
	fstp	dword ptr [ebp-384]
	mov	dword406,8
	add	dword406,[ebp-344]
	add	dword406,4
	fld	dword ptr [ebp-380]
	fsub	dword ptr [dword406]
	mov	dword410,[ebp-344]
	mov	dword412,[ebp-360]
	sub	dword412,[dword410]
	int2float	dword412
	fdivp
	fstp	dword ptr [ebp-388]
	fld	dword ptr [ebp-388]
	fstp	dword ptr [ebp-392]
	fld	dword ptr [ebp-384]
	fstp	dword ptr [ebp-396]
	mov	dword417,8
	add	dword417,[ebp-344]
	add	dword417,4
	fld	dword ptr [dword417]
	fstp	dword ptr [ebp-400]
	mov	dword420,[ebp-344]
	fld	dword ptr [dword420+8]
	fstp	dword ptr [ebp-404]
	fld	dword ptr [ebp-380]
	fstp	dword ptr [ebp-408]
	fld	dword ptr [ebp-376]
	fstp	dword ptr [ebp-412]
	mov	dword424,[ebp-344]
	add	dword424,4
	mov	dword608,[dword424]
	mov	[ebp-416],dword608
	mov	dword427,[ebp-344]
	mov	dword607,[dword427]
	mov	[ebp-420],dword607
	mov	dword606,[ebp-360]
	mov	[ebp-424],dword606
; start of inline function _rasterize_horiz_line__unordered
	mov	dword612,[ebp-424]
	cmp	dword612,[ebp-420]
	jg	label0016
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-408],4
	push_arg	dword ptr [ebp-412],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-420],4
	push_arg	dword ptr [ebp-424],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label0017
label0016:
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label0017:
label0018:
; end of inline function _rasterize_horiz_line__unordered
	mov	dword430,[ebp-344]
	add	dword430,4
	mov	dword432,1
	add	dword432,[dword430]
	mov	[ebp-364],dword432
label0010:
label0011:
	mov	dword435,[ebp-340]
	add	dword435,4
	mov	dword438,[dword435]
	cmp	dword438,[ebp-364]
	jle	label0012
	mov	dword440,[ebp-344]
	add	dword440,4
	mov	dword443,[ebp-364]
	sub	dword443,[dword440]
	mov	dword445,[ebp-340]
	mov	dword447,[ebp-344]
	mov	dword448,[dword445]
	sub	dword448,[dword447]
	imul	dword443,dword448
	mov	dword450,[ebp-340]
	add	dword450,4
	mov	dword453,[ebp-344]
	add	dword453,4
	mov	dword455,[dword450]
	sub	dword455,[dword453]
	cdq	dword456
	idiv	dword443,dword455
	mov	dword458,[ebp-344]
	add	dword443,[dword458]
	mov	[ebp-356],dword443
	mov	dword461,[ebp-348]
	add	dword461,4
	mov	dword464,[ebp-364]
	sub	dword464,[dword461]
	mov	dword466,[ebp-340]
	mov	dword468,[ebp-348]
	mov	dword469,[dword466]
	sub	dword469,[dword468]
	imul	dword464,dword469
	mov	dword471,[ebp-340]
	add	dword471,4
	mov	dword474,[ebp-348]
	add	dword474,4
	mov	dword476,[dword471]
	sub	dword476,[dword474]
	cdq	dword477
	idiv	dword464,dword476
	mov	dword479,[ebp-348]
	add	dword464,[dword479]
	mov	[ebp-360],dword464
	mov	dword482,[ebp-344]
	add	dword482,4
	mov	dword485,[ebp-364]
	sub	dword485,[dword482]
	int2float	dword485
	mov	dword487,[ebp-340]
	mov	dword489,[ebp-344]
	fld	dword ptr [dword487+8]
	fsub	dword ptr [dword489+8]
	fmulp
	mov	dword491,[ebp-340]
	add	dword491,4
	mov	dword494,[ebp-344]
	add	dword494,4
	mov	dword496,[dword491]
	sub	dword496,[dword494]
	int2float	dword496
	fdivp
	mov	dword498,[ebp-344]
	fadd	dword ptr [dword498+8]
	fstp	dword ptr [ebp-368]
	mov	dword501,[ebp-348]
	add	dword501,4
	mov	dword504,[ebp-364]
	sub	dword504,[dword501]
	int2float	dword504
	mov	dword506,[ebp-340]
	mov	dword508,[ebp-348]
	fld	dword ptr [dword506+8]
	fsub	dword ptr [dword508+8]
	fmulp
	mov	dword510,[ebp-340]
	add	dword510,4
	mov	dword513,[ebp-348]
	add	dword513,4
	mov	dword515,[dword510]
	sub	dword515,[dword513]
	int2float	dword515
	fdivp
	mov	dword517,[ebp-348]
	fadd	dword ptr [dword517+8]
	fstp	dword ptr [ebp-376]
	mov	dword520,[ebp-344]
	add	dword520,4
	mov	dword523,[ebp-364]
	sub	dword523,[dword520]
	int2float	dword523
	mov	dword525,8
	add	dword525,[ebp-340]
	add	dword525,4
	mov	dword528,8
	add	dword528,[ebp-344]
	add	dword528,4
	fld	dword ptr [dword525]
	fsub	dword ptr [dword528]
	fmulp
	mov	dword531,[ebp-340]
	add	dword531,4
	mov	dword534,[ebp-344]
	add	dword534,4
	mov	dword536,[dword531]
	sub	dword536,[dword534]
	int2float	dword536
	fdivp
	mov	dword538,8
	add	dword538,[ebp-344]
	add	dword538,4
	fadd	dword ptr [dword538]
	fstp	dword ptr [ebp-372]
	mov	dword542,[ebp-348]
	add	dword542,4
	mov	dword545,[ebp-364]
	sub	dword545,[dword542]
	int2float	dword545
	mov	dword547,8
	add	dword547,[ebp-340]
	add	dword547,4
	mov	dword550,8
	add	dword550,[ebp-348]
	add	dword550,4
	fld	dword ptr [dword547]
	fsub	dword ptr [dword550]
	fmulp
	mov	dword553,[ebp-340]
	add	dword553,4
	mov	dword556,[ebp-348]
	add	dword556,4
	mov	dword558,[dword553]
	sub	dword558,[dword556]
	int2float	dword558
	fdivp
	mov	dword560,8
	add	dword560,[ebp-348]
	add	dword560,4
	fadd	dword ptr [dword560]
	fstp	dword ptr [ebp-380]
	mov	dword565,[ebp-360]
	sub	dword565,[ebp-356]
	int2float	dword565
	fld	dword ptr [ebp-376]
	fsub	dword ptr [ebp-368]
	fdivrp
	fstp	dword ptr [ebp-384]
	mov	dword571,[ebp-360]
	sub	dword571,[ebp-356]
	int2float	dword571
	fld	dword ptr [ebp-380]
	fsub	dword ptr [ebp-372]
	fdivrp
	fstp	dword ptr [ebp-388]
	fld	dword ptr [ebp-388]
	fstp	dword ptr [ebp-392]
	fld	dword ptr [ebp-384]
	fstp	dword ptr [ebp-396]
	fld	dword ptr [ebp-380]
	fstp	dword ptr [ebp-400]
	fld	dword ptr [ebp-376]
	fstp	dword ptr [ebp-404]
	fld	dword ptr [ebp-372]
	fstp	dword ptr [ebp-408]
	fld	dword ptr [ebp-368]
	fstp	dword ptr [ebp-412]
	mov	dword629,[ebp-364]
	mov	[ebp-416],dword629
	mov	dword628,[ebp-360]
	mov	[ebp-420],dword628
	mov	dword627,[ebp-356]
	mov	[ebp-424],dword627
; start of inline function _rasterize_horiz_line__unordered
	mov	dword633,[ebp-424]
	cmp	dword633,[ebp-420]
	jg	label0019
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-408],4
	push_arg	dword ptr [ebp-412],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-420],4
	push_arg	dword ptr [ebp-424],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
	jmp	label001a
label0019:
	push_all
	push_arg	dword ptr [ebp-392],4
	push_arg	dword ptr [ebp-396],4
	push_arg	dword ptr [ebp-400],4
	push_arg	dword ptr [ebp-404],4
	push_arg	dword ptr [ebp-416],4
	push_arg	dword ptr [ebp-424],4
	push_arg	dword ptr [ebp-420],4
	call	__rasterize_horiz_line
	restore_stack	28
	pop_all
label001a:
label001b:
; end of inline function _rasterize_horiz_line__unordered
	inc	dword ptr [ebp-364]
	jmp	label0011
label0012:
label0027:
; end of inline function _rasterize_triangle_2i
	inc	dword ptr [ebp-336]
	jmp	label0006
label0007:
label002d:
; end of inline function _rasterize_polygon_4f
	destroy_stack_frame
	ret
_rasterizer_triangle3f endp	

end
