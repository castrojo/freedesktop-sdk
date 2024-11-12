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
  ref: v1.4.6-0-gfdf402b384cc42ce29bb9e27011633be3cbafe1e
