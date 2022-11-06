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
  ref: v1.6.38-0-g0a158f3506502dfa23edfc42790dfaed82efba17
- kind: patch
  path: patches/libpng/libpng-1.6.37-apng.patch
