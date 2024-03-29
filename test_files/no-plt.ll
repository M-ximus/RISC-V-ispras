; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -relocation-model=pic < %s \
; RUN:     | FileCheck -check-prefix=RV64 %s
; RUN: llc -mtriple=riscv32 -relocation-model=pic < %s \
; RUN:     | FileCheck -check-prefix=RV32 %s

declare void @global() nonlazybind

define void @no_plt_call() nounwind {
; RV64-LABEL: no_plt_call:
; RV64:       # %bb.0:
; RV64-NEXT:    addi sp, sp, -16
; RV64-NEXT:    sd ra, 8(sp)
; RV64-NEXT:  .LBB0_1: # Label of block must be emitted
; RV64-NEXT:    auipc a0, %got_pcrel_hi(global)
; RV64-NEXT:    ld a0, %pcrel_lo(.LBB0_1)(a0)
; RV64-NEXT:    jalr a0
; RV64-NEXT:    ld ra, 8(sp)
; RV64-NEXT:    addi sp, sp, 16
; RV64-NEXT:    ret
;
; RV32-LABEL: no_plt_call:
; RV32:       # %bb.0:
; RV32-NEXT:    addi sp, sp, -16
; RV32-NEXT:    sw ra, 12(sp)
; RV32-NEXT:  .LBB0_1: # Label of block must be emitted
; RV32-NEXT:    auipc a0, %got_pcrel_hi(global)
; RV32-NEXT:    lw a0, %pcrel_lo(.LBB0_1)(a0)
; RV32-NEXT:    jalr a0
; RV32-NEXT:    lw ra, 12(sp)
; RV32-NEXT:    addi sp, sp, 16
; RV32-NEXT:    ret
  call void @global()
  ret void
}
