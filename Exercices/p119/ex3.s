	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"ex3.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"x = %d, y = %d, z = %d, t = %d\012\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #12
	push	{r4, r5, r6, lr}
	ldr	r5, .L4
	ldrb	r4, [r5, #4]	@ zero_extendqisi2
	ldr	r6, .L4+4
	add	r4, r4, #1
	and	r4, r4, #255
	sub	sp, sp, #8
	strb	r4, [r5, #4]
	ldr	r0, [r6]
	add	r4, r4, #12
	str	r3, [r5]
	bl	printf
	str	r4, [sp]
	ldrb	r3, [r5, #4]	@ zero_extendqisi2
	ldr	r2, [r5]
	ldr	r1, [r6, #4]
	ldr	r0, .L4+8
	bl	printf
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC0
	.size	main, .-main
	.global	mesg
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Hello World!\012\000"
	.global	y
	.global	x
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	mesg, %object
	.size	mesg, 4
mesg:
	.word	.LC1
	.type	x, %object
	.size	x, 4
x:
	.word	34
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	y, %object
	.size	y, 4
y:
	.space	4
	.type	z.0, %object
	.size	z.0, 1
z.0:
	.space	1
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
