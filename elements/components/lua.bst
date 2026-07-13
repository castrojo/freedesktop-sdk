# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  local_flags: -fPIC
  make-args: >-
    MYCFLAGS="${CFLAGS}"
    INSTALL_TOP='%{install-root}%{prefix}'
    INSTALL_LIB='%{install-root}%{libdir}'

config:
  build-commands:
    (>):
    - make %{make-args} pc > lua.pc
    - cat lua.pc.in >> lua.pc

  install-commands:
    (>):
    - install -Dm644 -t '%{install-root}%{libdir}/pkgconfig' lua.pc

sources:
- kind: tar
  url: tar_https:www.lua.org/ftp/lua-5.5.0.tar.gz
  ref: 57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d
- kind: local
  path: files/lua/lua.pc.in
