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
  ref: fuse-3.14.0-0-g3f65bb699cd2f0afe2b9519c39d29922229f2168
- kind: patch
  path: patches/fuse3/gcc-11.patch
