kind: make

build-depends:
- public-stacks/buildsystem-make.bst
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
  ref: v1.2-0-g6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8
