kind: meson


build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst

depends:
- components/systemd-libs.bst

variables:
  meson-local: >-
    -Duseroot=false

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 4755 "${sysroot}%{bindir}/fusermount3"

sources:
- kind: git_tag
  url: github:libfuse/libfuse.git
  track: master
  ref: fuse-3.15.1-0-g0b50e26c51d42b3d2a8e0f82c0c1a49f1b5594b5
- kind: patch
  path: patches/fuse3/gcc-11.patch
