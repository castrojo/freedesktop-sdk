kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/nasm.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/perl.bst
  type: build

variables:
  arch-options: ''
  (?):
  - target_arch == "x86_64":
      aom_target: x86_64
  - target_arch == "i686":
      aom_target: x86
  - target_arch == "arm":
      aom_target: arm
      arch-options: >-
        -DENABLE_NEON=NO
  - target_arch == "aarch64":
      aom_target: arm64
  - target_arch in ("ppc64le", "ppc64"):
      aom_target: ppc
  - target_arch == "riscv64":
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
  ref: v3.8.2-0-g615b5f541e4434aebd993036bc97ebc1a77ebc25
