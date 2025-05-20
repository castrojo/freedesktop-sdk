kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: v1.5.1-0-gb4fa3e39a77fd65574fb5f899486795fc3d89bd9
