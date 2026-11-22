# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: |
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS"

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  cpe:
    vendor: gnu

sources:
- kind: anitya
  project-id: 659
  url: ftp_gnu_org:ed/ed-{version}.tar.lz
  ref:
    version: 1.22.6
    sha256sum: 3f33b22135219c39c3c695f7b7171c2567d3e2a17c798c0a90607320cbb268f2
