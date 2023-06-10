kind: meson


build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst

depends:
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Duseroot=false

config:
  install-commands:
    (>):
    - rm -r "%{install-root}/etc/init.d"

public:
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
  ref: fuse-3.15.0-0-g6d08472ea47db895748d5ca7d3daf032c3fefcf8
- kind: patch
  path: patches/fuse3/gcc-11.patch
