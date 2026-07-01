# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/gawk.bst
- components/asciidoc.bst
- components/xmlto.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtraceevent.so'

sources:
- kind: git_repo
  url: kernel:libs/libtrace/libtraceevent.git
  track: 'libtraceevent-*'
  ref: libtraceevent-1.9.0-0-g13701b5532e0c3295bf5670361692b0d0044228d
