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
- kind: git_tag
  url: github:libfuse/libfuse.git
  track: master
  ref: fuse-3.11.0-0-ga56147d3cb269d64635408ab5588ad66eba43943
- kind: patch
  path: patches/fuse3/gcc-11.patch
