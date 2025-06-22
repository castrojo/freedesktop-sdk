kind: make

(@):
- elements/include/linux.yml

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/flex.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/binutils.bst

variables:
  command-subdir: tools/bpf
  make-args: >-
    prefix="%{prefix}"
    sbindir="%{bindir}"
    -W runqslower

config:
  build-commands:
    (<):
    - |
      make -C bpftool %{make-args}

  install-commands:
    (>):
    - |
      mv "%{install-root}%{prefix}/sbin"/* "%{install-root}%{bindir}/"
      rmdir "%{install-root}%{prefix}/sbin"
