kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- bootstrap/sed.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="lib/%{gcc_triplet}"

sources:
- kind: git_repo
  track: n*
  url: git_videolan:git/ffmpeg/nv-codec-headers.git
  ref: n12.2.72.0-0-gc69278340ab1d5559c7d7bf0edf615dc33ddbba7
