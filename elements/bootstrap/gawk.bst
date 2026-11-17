kind: autotools
description: GNU awk

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}"/gawk-*

    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_repo
  url: savannah:gawk.git
  track: gawk-*
  exclude:
  - '*-docs'
  ref: gawk-5.4.2-0-gfbf218a5c15705b108d38a78804f2fe52175e6c7
- kind: patch
  path: patches/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch
