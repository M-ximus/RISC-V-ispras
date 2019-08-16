# RISC-V-ispras

[RISCV] Support NonLazyBind(-fno-plt) in Clang

It's patch for handling -fno-plt. We need to load call address from shared library without PLT(from GOT). We can gain performance by reduction of jumps, but it starts longer.
