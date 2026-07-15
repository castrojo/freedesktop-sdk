# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst
- components/nasm.bst
- components/perl.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  arch-options: ''
  (?):
  - target_arch == "x86_64":
      aom_target: x86_64
  - target_arch == "i686":
      aom_target: x86
  - target_arch == "aarch64":
      aom_target: arm64
  - target_arch in ("ppc64le", "ppc64"):
      aom_target: ppc
  - target_arch in ("riscv64", "loongarch64"):
      aom_target: generic

  cmake-local: >-
    -DAOM_TARGET_CPU="%{aom_target}"
    -DENABLE_DOCS=NO
    -DENABLE_NASM=YES
    -DBUILD_SHARED_LIBS=YES
    -DENABLE_EXAMPLES=NO
    -DENABLE_TESTDATA=NO
    -DENABLE_TESTS=NO
    %{arch-options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libaom.so"

sources:
- kind: git_repo
  url: git_https:aomedia.googlesource.com/aom.git
  track: v*.*.*
  exclude:
  - "*-rc*"
  ref: v3.14.1-0-g03087864cf4bea6abb0d28f95cf7843511413d8f
- kind: patch
  path: patches/aom/disable-aom-static.patch
