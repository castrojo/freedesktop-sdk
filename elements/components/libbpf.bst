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
  ref: v1.6.3-0-g3b4f0ef5a6fa247ce1958d909c0e85e760249840
