kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- bootstrap/grep.bst
- bootstrap/sed.bst

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
  ref: v1.5.0-0-g09b9e83102eb8ab9e540d36b4559c55f3bcdb95d
