# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/file-source.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/gnu-config.bst

config:
  configure-commands:
    (<):
    - autoreconf -ivf
