kind: autotools

build-depends:
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename:  bootstrap/elfutils.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/elfutils.bst

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/debugedit-source.yml

variables:
  conf-local: >-
      ac_cv_func_malloc_0_nonnull=yes
      ac_cv_func_realloc_0_nonnull=yes

public:
  bst:
    split-rules:
      runtime: []
      devel:
      - /**
