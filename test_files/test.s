	.text
	.file	"test.c"
	.globl	g                       # -- Begin function g
	.p2align	2
	.type	g,@function
g:                                      # @g
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)
.LBB0_1:                                # %entry
                                        # Label of block must be emitted
	auipc	a0, %got_pcrel_hi(f)
	ld	a0, %pcrel_lo(.LBB0_1)(a0)
	jalr	a0
	negw	a0, a0
	ld	ra, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	g, .Lfunc_end0-g
                                        # -- End function

	.ident	"clang version 9.0.0 (https://github.com/llvm/llvm-project.git cb238de456ba2db699d969858eddbc0971c8592c)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
