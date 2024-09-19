kind: autotools
description: GNU awk

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

(@): elements/bootstrap/include/target.yml

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
  ref: gawk-5.3.1-0-ge405f5487b66eadd24d303a27c312f16bcca2ca4
