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
  ref: v1.6.43-0-ged217e3e601d8e462f7fd1e04bed43ac42212429
- kind: patch
  path: patches/libpng/libpng-1.6.37-apng.patch
