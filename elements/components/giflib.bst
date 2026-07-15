# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/buildsystem-make.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/xmlto.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  config: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
    BINDIR="%{bindir}"
    INCDIR="%{includedir}"
    MANDIR="%{mandir}"

config:
  build-commands:
  - |
    make %{config}

  install-commands:
  - |
    make install %{config} DESTDIR="%{install-root}"

  - |
    rm "%{install-root}%{libdir}/libgif.a"

  - |
    %{install-extra}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgif.so'

sources:
- kind: git_repo
  url: sourceforge_git:giflib/code.git
  track: '*.*.*'
  ref: 6.1.3-0-gedff4aed17f857442ab0cac31566572ba08f93d3
