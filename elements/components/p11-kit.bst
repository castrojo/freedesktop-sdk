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
  ref: 0.25.3-0-g917e02a3211dabbdea4b079cb598581dce84fda1
- kind: patch
  # applied in upstream git d49c92c8420db6ee4c88515bdb014f68f4d471d9
  path: patches/p11-kit/0001-import-object-Avoid-integer-truncation-on-32-bit-pla.patch
- kind: git_module
  path: subprojects/pkcs11-json
  url: github:p11-glue/pkcs11-json.git
  ref: f973d0f6acebbe7ab2f4ab027b5adb32b97a758a
