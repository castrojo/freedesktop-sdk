kind: make

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-make.bst
- components/python3.bst
- components/which.bst
- components/rdfind.bst
- components/parallel.bst
- components/_private/git-minimal.bst

variables:
  license-files-extra: WHENCE MIT
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
  ref: 20260410-0-gdc85ccedc9c973682fbcf4d628ca61174bcc3120
