kind: meson_recc

build-depends:
- public-stacks/buildsystem-meson.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

variables:
  meson-local: >-
    -Ddistro_install=true

sources:
- kind: git_repo
  url: github:benhoyt/inih.git
  track: r*
  ref: r62-0-g26254ee9de7681f8825433415443e7116ff24b98
  version-guess-pattern: '(?<=r)\d{2}'
