kind: make

build-depends:
- bootstrap-import.bst
- components/python3.bst

variables:
  make-args: >-
    O=build-generic
    PLATFORM=generic
  make-install: make -j1 %{make-args} install_root_dir="%{install-root}%{prefix}" install

sources:
- kind: git_repo
  url: github:riscv/opensbi.git
  track: v*
  ref: v1.8-0-ge7fa66c2160ec139de1853a00f669c09320a9256
