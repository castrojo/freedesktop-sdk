kind: cmake

build-depends:
- components/cmake.bst

depends:
- bootstrap-import.bst

variables:
  generator: Unix Makefiles

sources:
- kind: git_repo
  url: github:ninja-build/ninja.git
  track: v*
  ref: v1.12.1-0-g2daa09ba270b0a43e1929d29b073348aa985dfaa
