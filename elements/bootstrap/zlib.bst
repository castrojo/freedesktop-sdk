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
  ref: v1.2.13-0-g04f42ceca40f73e2978b50e93806c2a18c1281fc
