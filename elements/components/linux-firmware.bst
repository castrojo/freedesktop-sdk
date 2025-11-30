kind: make

depends:
- bootstrap-import.bst

build-depends:
- bootstrap/make.bst
- components/python3.bst
- components/which.bst
- components/rdfind.bst
- components/parallel.bst
- components/git-minimal.bst

variables:
  license-files-extra: WHENCE MIT

  make-args: >-
    PREFIX="%{prefix}"
    FIRMWAREDIR="%{indep-libdir}/firmware"

  make: ''
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install-xz dedup

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20251125-0-g4ee5122b3f58e4c07951746c4425e2f4f42e860f
