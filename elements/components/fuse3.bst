kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

runtime-depends:
- components/util-linux-full.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Duseroot=false
    -Dexamples=false
    -Dtests=false

config:
  install-commands:
    (>):
    - rm -r "%{install-root}/etc/init.d"

public:
  bst:
    integration-commands:
    - |
      [ -f "%{bindir}/fusermount" ] || ln -s fusermount3 "%{bindir}/fusermount"
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 4755 "${sysroot}%{bindir}/fusermount3"
  cpe:
    vendor: fuse_project
    name: fuse

sources:
- kind: git_repo
  url: github:libfuse/libfuse.git
  track: fuse-*
  exclude:
  - "*rc*"
  ref: fuse-3.17.4-0-gddcb1a075995500bd6c91327a1dfcee346acd075
- kind: patch
  path: patches/fuse3/gcc-11.patch
