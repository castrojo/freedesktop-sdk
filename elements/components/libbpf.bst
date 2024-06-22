kind: make

depends:
- bootstrap-import.bst

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
  ref: v1.4.3-0-gf8c6e0393d4be665fc0b584266b2a1354a71835e
