kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/libpng-config'
        - '%{bindir}/libpng16-config'
        - '%{libdir}/libpng.so'
        - '%{libdir}/libpng16.so'

sources:
- kind: git_tag
  url: github:glennrp/libpng.git
  track: libpng16
  ref: v1.6.41-0-gba980b8f0cfbc270ba1c4a663455e2fe8bad91d2
- kind: patch
  path: patches/libpng/libpng-1.6.37-apng.patch
