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
  make-args: >-
    PREFIX="%{prefix}"
    FIRMWAREDIR="%{indep-libdir}/firmware"

  make: ''
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install-xz dedup

sources:
- kind: git_repo
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: '[0-9]*'
  ref: 20250311-0-gb69d4b74c98611d4c1bdd1d1a767791b451a3f38
