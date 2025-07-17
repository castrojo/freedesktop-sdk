kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/pkg-config.bst

depends:
- public-stacks/runtime-minimal.bst
- components/elfutils.bst
- components/zlib.bst

variables:
  command-subdir: src
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"

config:
  install-commands:
    (>):
    - rm %{install-root}%{libdir}/libbpf.a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libbpf.so'

sources:
- kind: git_repo
  url: github:libbpf/libbpf.git
  track: v*
  ref: v1.6.0-0-gda08818f4f3b6a8f6d15617184de9a6c34c5b642
