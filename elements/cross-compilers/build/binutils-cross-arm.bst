kind: autotools
description: GNU Binutils for ARM cross-compiler

(@):
- elements/cross-compilers/arm-vars.yml
- elements/cross-compilers/build/cross-tools.yml
- elements/cross-compilers/build/binutils-cross-common.yml

variables:
  target_gcc_triplet: "%{cross_gcc_triplet}"
  target_triplet: "%{cross_triplet}"
