kind: make

build-depends:
- public-stacks/buildsystem-make.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="lib/%{gcc_triplet}"

sources:
- kind: git_repo
  track: n*
  url: git_videolan:git/ffmpeg/nv-codec-headers.git
  ref: n13.0.19.0-0-ge844e5b26f46bb77479f063029595293aa8f812d
