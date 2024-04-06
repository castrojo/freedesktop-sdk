kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  autogen: |
    ./makeconf.sh

environment:
  MOUNT_FUSE_PATH: '%{sbindir}'

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 4755 "${sysroot}%{bindir}/fusermount"

  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfuse.so'
        - '%{libdir}/libulockmgr.so'

  cpe:
    vendor: fuse_project

sources:
- kind: git_repo
  url: github:libfuse/libfuse.git
  track: fuse_2_9_bugfix
  ref: fuse-2.9.9-3-g5a43d0f724c56f8836f3f92411e0de1b5f82db32
- kind: patch
  path: patches/fuse/fuse-kernel-h-clean-includes.patch
