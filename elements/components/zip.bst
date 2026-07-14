# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    -f unix/Makefile
    prefix=%{prefix}
    "CFLAGS_NOOPT=-I. -DUNIX $CFLAGS"
    generic_gcc

config:
  install-commands:
  - |
    install -m 755 -D -t "%{install-root}%{bindir}" zip zipcloak zipnote zipsplit
    install -m 644 -D -t "%{install-root}%{datadir}/man/man1" man/zip.1 man/zipcloak.1 man/zipnote.1 man/zipsplit.1

  - |
    %{install-extra}

public:
  cpe:
    vendor: 'info-zip'

sources:
- kind: tar
  url: sourceforge_download:infozip/zip30.tar.gz
  ref: f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369
  version-guess-pattern: 'zip(\d)(\d).tar.gz'
- kind: patch_queue
  path: patches/zip
