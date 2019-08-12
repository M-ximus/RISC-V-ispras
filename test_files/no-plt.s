	.text
	.file	"no-plt.ll"
	.globl	no_PLT_call             # -- Begin function no_PLT_call
	.p2align	2
	.type	no_PLT_call,@function
no_PLT_call:                            # @no_PLT_call
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)
	.cfi_offset ra, -8
.LBB0_1:                                # Label of block must be emitted
	auipc	a0, %got_pcrel_hi(global)
	ld	a0, %pcrel_lo(.LBB0_1)(a0)
	jalr	a0
	ld	ra, 8(sp)
	.cfi_restore ra
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	no_PLT_call, .Lfunc_end0-no_PLT_call
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
