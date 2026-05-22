kind: make

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-make.bst
- components/python3.bst
- components/which.bst
- components/rdfind.bst
- components/parallel.bst
- components/zstd.bst
- components/_private/git-minimal.bst

environment:
  MAX_JOBS: '%{max-jobs}'
environment-nocache:
- MAX_JOBS

variables:
  license-files-extra: WHENCE MIT
  strip-binaries: ''

  make-args: >-
    PREFIX="%{prefix}"
    FIRMWAREDIR="%{indep-libdir}/firmware"
    NUM_JOBS="$MAX_JOBS"

  make: ''
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install-zst dedup

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20260519-0-gd962a6a309b78778f458dc94713845eee105be14
