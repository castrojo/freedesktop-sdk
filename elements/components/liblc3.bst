kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblc3.so'

sources:
- kind: git_repo
  url: github:google/liblc3.git
  track: v*
  ref: v1.1.1-0-g73bbc00245d9874ef3e8bc8ef6476e6fee9f42aa
