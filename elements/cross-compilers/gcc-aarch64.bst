# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/cross-compilers/aarch64-vars.yml
- elements/cross-compilers/gcc-common.yml
- elements/include/gcc-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/autoconf2.69.bst
- components/flex.bst
- components/tar.bst
- components/texinfo.bst
- cross-compilers/standard-libs-aarch64.bst

depends:
- cross-compilers/binutils-aarch64.bst

variables:
  conf-arch: ''
