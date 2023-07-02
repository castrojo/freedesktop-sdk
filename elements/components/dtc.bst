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
  ref: v1.7.0-0-g039a99414e778332d8f9c04cbd3072e1dcc62798
