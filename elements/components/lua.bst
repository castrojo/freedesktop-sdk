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
  url: tar_https:www.lua.org/ftp/lua-5.4.6.tar.gz
  ref: 7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88
- kind: local
  path: files/lua/lua.pc.in
