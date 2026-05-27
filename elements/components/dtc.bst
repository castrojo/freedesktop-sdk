kind: make

depends:
- bootstrap-import.bst

build-depends:
- components/bison.bst
- components/flex.bst
- components/pkg-config.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
  make: make %{make-args}
  make-install: make %{make-args} DESTDIR="%{install-root}" -j1 install

config:
  configure-commands:
  - |
    sed -i "s/-Werror//g" Makefile

sources:
- kind: git_repo
  url: kernel:utils/dtc/dtc.git
  track: v*
  ref: v1.8.0-0-gb1337df19598b27efd8f90023b071e0aae7933db
