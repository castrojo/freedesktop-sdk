kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst
- components/git-minimal.bst
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
    %{arch-options}

config:
  install-commands:
    (>):
    - |
      rm '%{install-root}%{libdir}/libaom.a'

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
  ref: v3.13.1-0-gd772e334cc724105040382a977ebb10dfd393293
