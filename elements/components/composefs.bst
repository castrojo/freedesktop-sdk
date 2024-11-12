kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/go-md2man.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst
- components/fuse3.bst

config:
  install-commands:
    (>):
    - find "%{install-root}" -name "lib*.a" -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}'
        - '%{bindir}/**'
        - '%{libdir}/libcomposefs.so'

sources:
- kind: git_repo
  url: github:containers/composefs.git
  track: v*
  ref: v1.0.7-0-g3d14726283ce973adc12e4617cd1e3e702f7f05e
