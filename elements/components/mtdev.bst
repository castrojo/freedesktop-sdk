# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: anitya
  project-id: 8868
  url: tar_https:bitmath.org/code/mtdev/mtdev-{version}.tar.gz
  ref:
    version: 1.1.7
    sha256sum: a55bd02a9af4dd266c0042ec608744fff3a017577614c057da09f1f4566ea32c
