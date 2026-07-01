# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgdbm.so'

sources:
- kind: tar
  url: ftp_gnu_org:gdbm/gdbm-1.26.tar.gz
  ref: 6a24504a14de4a744103dcb936be976df6fbe88ccff26065e54c1c47946f4a5e
