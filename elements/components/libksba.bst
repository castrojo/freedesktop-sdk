# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libgpg-error.bst

variables:
  conf-local: |
    --enable-maintainer-mode

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/ksba-config'
        - '%{libdir}/libksba.so'

sources:
- kind: git_repo
  url: github:gpg/libksba.git
  track: libksba-*
  ref: libksba-1.9.1-0-g7434e5c28cb299388d93ac030cf77753d1ccdf78
