kind: meson-recc

build-depends:
- public-stacks/buildsystem-meson.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/wayland.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: freedesktop:wayland/wayland-protocols.git
  track: '*.*'
  ref: 1.47-0-g88223018d1b578d0d8869866da66d9608e05f928
