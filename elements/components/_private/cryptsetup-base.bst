# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/lvm2-stage1.bst
- components/asciidoctor.bst
- components/json-c.bst
- components/openssl.bst
- components/popt.bst
- components/pwquality.bst
- components/util-linux-libs.bst

variables:
  conf-local: >-
    --enable-pwquality
    --disable-ssh-token
    --with-tmpfilesdir="%{indep-libdir}/tmpfiles.d"

public:
  cpe:
    product: cryptsetup

sources:
- kind: git_repo
  url: gitlab:cryptsetup/cryptsetup.git
  track: v*
  exclude:
  - '*rc*'
  ref: v2.8.9-0-g25d1fb4892b0390dba18a044342a8f4b18f03068
