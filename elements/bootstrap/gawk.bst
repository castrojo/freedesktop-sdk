kind: autotools
description: GNU awk

depends:
- filename: bootstrap/gawk-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}"/gawk-*

    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: savannah:gawk.git
  track: master
  track-extra:
  - gawk-5.2-stable
  exclude:
  - '*-docs'
  ref: gawk-5.2.0-0-g7eacf279a6ff4bff560ff49a8a2a9c531658096c
- kind: patch
  path: patches/gawk/fixes-for-linux-gen-insn-attr-x86.patch
