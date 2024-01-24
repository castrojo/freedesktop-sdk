kind: autotools
description: zlib

depends:
- filename: bootstrap/zlib-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

variables:
  conf-args: |
    --prefix=%{prefix} \
    --sharedlibdir=%{libdir} \
    --libdir=%{libdir}

environment:
  CHOST: '%{triplet}'

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libz.so'
  cpe:
    patches:
    - CVE-2022-37434

sources:
- kind: git_tag
  url: github:madler/zlib.git
  track: master
  ref: v1.3.1-0-g51b7f2abdade71cd9bb0e7a373ef2610ec6f9daf
