kind: filter
description: |
  Core util-linux utilities.

  The utilities which are specific to operating systems and sysadmin tasks are
  in the separate `components/util-linux-full.bst` element.

build-depends:
- components/_private/util-linux-base.bst

runtime-depends:
- components/util-linux-manifest.bst
- components/util-linux-libs.bst
- public-stacks/runtime-minimal.bst
- components/libeconf.bst
- components/file.bst
- components/sqlite.bst

config:
  exclude:
  - libblkid
  - liblastlog2
  - libfdisk
  - libmount
  - libsmartcols
  - libuuid
  - vm-tools
  include-orphans: true

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/util-linux"
    - "%{project_licensedir}/util-linux/**"
