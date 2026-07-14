# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/cross-compilers/riscv64-vars.yml
- elements/cross-compilers/gcc-common.yml
- elements/include/gcc-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- cross-compilers/standard-libs-riscv64.bst
- components/autoconf2.69.bst
- components/flex.bst
- components/tar.bst
- components/texinfo.bst

depends:
- cross-compilers/binutils-riscv64.bst

variables:
  conf-arch: ''
