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
        - '%{libdir}/libidn2.so'

sources:
- kind: anitya
  project-id: 5597
  url: ftp_gnu_org:libidn/libidn2-{version}.tar.gz
  ref:
    version: 2.3.8
    sha256sum: f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a
