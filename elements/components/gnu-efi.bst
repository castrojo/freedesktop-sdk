kind: make

depends:
- filename: bootstrap-import.bst

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
  ref: 4.0.2-0-g1fee8ab566ce91b9cbab9f2c85db96566d79063b
