# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  build-dir: ''

config:
  configure-commands:
    (<):
    - |
      cat <<EOF >configure.local
      PREFIX=%{prefix}
      SBINDIR=%{bindir}
      LN="ln -s"
      EOF

sources:
- kind: tar
  url: tar_https:mdocml.bsd.lv/snapshots/mandoc-1.14.6.tar.gz
  ref: 8bf0d570f01e70a6e124884088870cbed7537f36328d512909eb10cd53179d9c
