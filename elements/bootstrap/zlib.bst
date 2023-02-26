kind: autotools
description: zlib

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

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
- kind: git_repo
  url: github:madler/zlib.git
  track: v*
  ref: v1.2.12-0-g21767c654d31d2dccdde4330529775c6c5fd5389
- kind: patch
  path: patches/zlib/Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
- kind: patch
  path: patches/zlib/Fix-extra-field-processing-bug-that-dereferences-NUL.patch
