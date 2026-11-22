# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoctor.bst
- components/asciidoc.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/e2fsprogs.bst
- components/kmod.bst

runtime-depends:
- components/cpio.bst
- components/gawk.bst


variables:
  # This project documents it doesn't support build-dir
  build-dir: ''
  lib: 'lib'

sources:
- kind: git_repo
  url: github:dracut-ng/dracut-ng.git
  track: '[0-9]*'
  ref: 113-0-g091b134733d685677745dd36b4acbe1a52a2c50c
  version-guess-pattern: '(\d+)'
