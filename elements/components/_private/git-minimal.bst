# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/include/git.yml

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/_private/meson.bst
- components/_private/python3-minimal.bst
- components/expat.bst
- components/gcc.bst
- components/gettext.bst
- components/grep.bst
- components/ninja.bst
- components/openssl.bst
- components/pkg-config.bst
- components/sed.bst
- components/stripper.bst
- components/tar.bst

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/zlib-ng.bst

variables:
  meson-local: >-
    -Dauto_features=disabled
    -Dtests=false
    -Dcurl=disabled
    -Drust=disabled

config:
  install-commands:
  - |
    cd %{build-dir}
    install -m 755 -D -t "%{install-root}%{bindir}" git
  - |
    %{install-extra}

public:
  cpe:
    vendor: git-scm
