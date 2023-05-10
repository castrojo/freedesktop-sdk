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
  ref: gawk-5.2.2-0-gb285b6b6a05e92af5c8814d5a475195a5c0ea81e
- kind: patch
  path: patches/gawk/fixes-for-linux-gen-insn-attr-x86.patch
