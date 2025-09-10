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
  ref: 0.25.6-0-g4f8213725ff45d1c69956a55d3f047b6c711d4a2
- kind: git_module
  path: subprojects/pkcs11-json
  url: github:p11-glue/pkcs11-json.git
  ref: f973d0f6acebbe7ab2f4ab027b5adb32b97a758a
