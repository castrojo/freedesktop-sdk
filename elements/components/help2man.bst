# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gettext.bst
- components/perl.bst

sources:
- kind: anitya
  project-id: 1309
  url: ftp_gnu_org:help2man/help2man-{version}.tar.xz
  ref:
    version: 1.49.3
    sha256sum: 4d7e4fdef2eca6afe07a2682151cea78781e0a4e8f9622142d9f70c083a2fd4f
