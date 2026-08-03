# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/findutils.bst
- components/perl.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    DESTDIR="%{install-root}" ./install_dicts.py */dictionaries.xcu

  - |
    ln -s hunspell "%{install-root}%{datadir}/myspell"

  - |
    %{install-extra}
    DIR="%{install-root}%{project_licensedir}/dictionaries"
    mkdir -p "$DIR"
    find . \( -iname "readme*" -o -iname "copying*" -o -iname "licen*" \) \
      -exec cp --parents -t "$DIR" {} +

sources:
- kind: git_repo
  url: git_https:git.libreoffice.org/dictionaries.git
  track: libreoffice-*
  exclude:
  - '*branch-point*'
  - '*-android'
  - '*alpha*'
  - '*beta*'
  - '*macfix*'
  - "*android*"
  ref: libreoffice-26.8.0.2-0-g3324dee0a221a5cb67525c533216d33b0aed08e9
- kind: local
  path: files/dictionaries/install_dicts.py
- kind: local
  path: files/dictionaries/th_gen_idx.pl
