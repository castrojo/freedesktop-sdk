kind: make

build-depends:
- bootstrap-import.bst
- components/python3.bst

variables:
  make-args: >-
    O=build-generic
    PLATFORM=generic
  make-install: make -j1 %{make-args} install_root_dir="%{install-root}%{prefix}"
    install

sources:
- kind: git_repo
  url: github:riscv/opensbi.git
  track: v*
  ref: v1.6-0-gbd613dd92113f683052acfb23d9dc8ba60029e0a
