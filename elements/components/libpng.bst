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
- kind: git_repo
  url: github:glennrp/libpng.git
  ref: v1.6.44-0-gf5e92d76973a7a53f517579bc95d61483bf108c0
- kind: patch
  path: patches/libpng/libpng-1.6.37-apng.patch
