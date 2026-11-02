# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/_private/systemd-stage1.bst
- components/doxygen.bst

depends:
- components/libgcrypt.bst
- components/json-c.bst
- components/curl.bst
- components/openssl.bst
# Uses libuuid only
- components/util-linux-libs.bst

variables:
  conf-local: >-
    --runstatedir=/run
    --with-sysusersdir="$(pkg-config --variable=sysusersdir systemd)"
    --with-tmpfilesdir="$(pkg-config --variable=tmpfilesdir systemd)"
    --with-udevrulesdir="$(pkg-config --variable=udevdir udev)/rules.d"

sources:
- kind: git_repo
  url: github:tpm2-software/tpm2-tss.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 4.2.1-0-g624f6ab3b4f277c18ac6d96054e15705f1f066c8
