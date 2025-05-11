kind: make

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-make.bst
- components/python3.bst
- components/which.bst
- components/rdfind.bst
- components/parallel.bst
- components/git-minimal.bst

variables:
  strip-binaries: ''

  make-args: >-
    PREFIX="%{prefix}"
    FIRMWAREDIR="%{indep-libdir}/firmware"

  make: ''
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install-xz dedup

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20250509-0-g788aadc8f73d93908cf8545b2fc770fb6580a3f2
