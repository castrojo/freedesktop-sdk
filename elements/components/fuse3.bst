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
  ref: fuse-3.13.0-0-g9acd183460656bffa6672e85a413b5b4f80bce5e
- kind: patch
  path: patches/fuse3/gcc-11.patch
