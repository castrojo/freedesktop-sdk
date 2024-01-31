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
  ref: v1.6.42-0-g35d9f5ea523cb4f9d677af4705e00ddd185ed10e
- kind: patch
  path: patches/libpng/libpng-1.6.37-apng.patch
