	.text
	.file	"test.c"
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)
.LBB0_1:                                # %entry
                                        # Label of block must be emitted
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.LBB0_1)
.LBB0_2:                                # %entry
                                        # Label of block must be emitted
	auipc	a1, %got_pcrel_hi(puts)
	ld	a1, %pcrel_lo(.LBB0_2)(a1)
	jalr	a1
	mv	a0, zero
	ld	ra, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Yees"
	.size	.L.str, 5


	.ident	"clang version 9.0.0 (https://github.com/llvm/llvm-project.git cb238de456ba2db699d969858eddbc0971c8592c)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
