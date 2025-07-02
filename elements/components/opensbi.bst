kind: make

build-depends:
- bootstrap-import.bst
- components/python3.bst

variables:
  make-args: >-
    O=build-generic
    PLATFORM=generic
  make-install: make -j1 %{make-args} 
    install_root_dir="%{install-root}%{prefix}" install

sources:
- kind: git_repo
  url: github:riscv/opensbi.git
  track: v*
  ref: v1.7-0-ga32a91069119e7a5aa31e6bc51d5e00860be3d80
