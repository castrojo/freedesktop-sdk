kind: filter
description: |
  util-linux utilities for operating systems.

  The programs that are useful in container runtimes are in the
  `components/util-linux.bst` element.

build-depends:
- components/_private/util-linux-base.bst

runtime-depends:
- components/util-linux.bst
- components/util-linux-libs-full.bst
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
    overlap-whitelist:
    - "%{project_licensedir}/util-linux"
    - "%{project_licensedir}/util-linux/**"
