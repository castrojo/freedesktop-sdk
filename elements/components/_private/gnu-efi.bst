kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

environment:
  # https://sourceforge.net/p/gnu-efi/bugs/33/
  LDFLAGS: "-z relro -z now --as-needed"

variables:
  # gnu-efi requires disabling of the stack protector.
  target_flags_stack_protector_strong: ''
  make-args: >-
    INSTALLROOT='%{install-root}'
    LIBDIR='%{libdir}'
    PREFIX='%{prefix}'

sources:
- kind: git_repo
  url: github:ncroxon/gnu-efi.git
  track: '*.*.*'
  ref: 4.0.3-0-gc6a12f30a5cf3c5a92678def8fafd20a9fb5b1a9
