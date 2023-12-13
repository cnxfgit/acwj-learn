	.text
	.file 1 "test.c"
# internal switch(expr) routine
# %rsi = switch table, %rax = expr
# from SubC: http://www.t3x.org/subc/

__switch:
        pushq   %rsi
        movq    %rdx, %rsi
        movq    %rax, %rbx
        cld
        lodsq
        movq    %rax, %rcx
__next:
        lodsq
        movq    %rax, %rdx
        lodsq
        cmpq    %rdx, %rbx
        jnz     __no
        popq    %rsi
        jmp     *%rax
__no:
        loop    __next
        lodsq
        popq    %rsi
        jmp     *%rax

L18:
	.byte	104
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	10
	.byte	0
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movq	%rsi, -12(%rbp)
	addq	$-16,%rsp
	pushq	%r10
	pushq	%r11
	pushq	%r12
	pushq	%r13
	leaq	L18(%rip), %r10
	movq	%r10, %rdi
	call	printf@PLT
	popq	%r13
	popq	%r12
	popq	%r11
	popq	%r10
	movq	%rax, %r10
	movq	$0, %r10
	movl	%r10d, %eax
	jmp	L17
L17:
	addq	$16,%rsp
	popq	%rbp
	ret
