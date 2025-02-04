kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: v1.1.2-0-g48bbd3eacd36e99a57317a0a4867002e0b09e183
