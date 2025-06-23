kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Ddocs=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfribidi.so'

sources:
- kind: git_repo
  url: github:fribidi/fribidi.git
  track: v*.*.*
  ref: v1.0.16-0-g68162babff4f39c4e2dc164a5e825af93bda9983
