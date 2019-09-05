	.text
	.file	"no-plt.ll"
	.globl	no_plt_call             # -- Begin function no_plt_call
	.p2align	2
	.type	no_plt_call,@function
no_plt_call:                            # @no_plt_call
# %bb.0:
	addi	sp, sp, -16
	sd	ra, 8(sp)
.LBB0_1:                                # Label of block must be emitted
	auipc	a0, %got_pcrel_hi(global)
	ld	a0, %pcrel_lo(.LBB0_1)(a0)
	jalr	a0
	ld	ra, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	no_plt_call, .Lfunc_end0-no_plt_call
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
