kind: make

build-depends:
- components/pkg-config.bst

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
  track: v1.4.*
  ref: v1.4.7-0-gca72d0731f8c693bd98caba70d951fc0bfe20788
