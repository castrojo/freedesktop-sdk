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
  ref: 0.26.1-0-g49ccc27a1e433d6128d40a43c7ecc4624b0dbfde
- kind: git_module
  path: subprojects/pkcs11-json
  url: github:p11-glue/pkcs11-json.git
  ref: 6d56219d6cd640f3629fb621b01068d7e768efc6
