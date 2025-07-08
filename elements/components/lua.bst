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
  make: make %{make-args}
  make-install: make -j1 install %{make-args}

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
  url: tar_https:www.lua.org/ftp/lua-5.4.8.tar.gz
  ref: 4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae
- kind: local
  path: files/lua/lua.pc.in
