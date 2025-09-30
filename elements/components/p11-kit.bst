kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/libtasn1.bst
- components/libffi.bst

variables:
  meson-local: >-
    -Dsystemd=disabled
    -Dbash_completion=disabled
    -Dtrust_paths=%{sysconfdir}/pki/ca-trust/source:%{datadir}/pki/ca-trust-source

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libp11-kit.so'

sources:
- kind: git_repo
  url: github:p11-glue/p11-kit.git
  track: '*.*.*'
  ref: 0.25.10-0-g90dba4ded391c6232a78ee14db0da76efda7b1c3
- kind: git_module
  path: subprojects/pkcs11-json
  url: github:p11-glue/pkcs11-json.git
  ref: 923a0022ca2d9f74291444d27bd0d8f95da9d8ba
