kind: filter

build-depends:
- components/util-linux-base.bst

runtime-depends:
- components/util-linux.bst
- components/libcap-ng.bst

config:
  include:
  - vm-tools
  include-orphans: false

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      for i in mount umount; do
        chmod 4755 "${sysroot}%{bindir}/${i}"
      done
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfdisk.so'
