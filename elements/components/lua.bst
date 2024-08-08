kind: make

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  local_flags: -fPIC
  make-args: >-
    PLAT=linux-readline
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
  url: tar_https:www.lua.org/ftp/lua-5.4.7.tar.gz
  ref: 9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30
- kind: local
  path: files/lua/lua.pc.in
