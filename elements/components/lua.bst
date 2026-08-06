kind: make

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

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
  url: tar_https:www.lua.org/ftp/lua-5.5.1.tar.gz
  ref: 1c4b4068d67061f2a2231ad2b5422e77acea1487ea9890f6320af614f4373dce
- kind: local
  path: files/lua/lua.pc.in
