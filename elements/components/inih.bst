kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Ddistro_install=true

public:
  cpe:
    version-match: '(?<=r)\d{2}'

sources:
- kind: git_repo
  url: github:benhoyt/inih.git
  track: r*
  ref: r58-0-g5cc5e2c24642513aaa5b19126aad42d0e4e0923e
