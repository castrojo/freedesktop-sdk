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
        - '%{libdir}/libunistring.so'

sources:
- kind: anitya
  project-id: 1747
  url: ftp_gnu_org:libunistring/libunistring-{version}.tar.xz
  ref:
    version: 1.5
    sha256sum: fe89007a8a414ae4790b816b86859e877d3ab135db3c37f06541ff7e85ac344b
  provenance:
    source-repo: https://https.git.savannah.gnu.org/git/libunistring.git
