kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Ddistro_install=true

sources:
- kind: git_repo
  url: github:benhoyt/inih.git
  track: r*
  ref: r61-0-g3eda303b34610adc0554bdea08d02a25668c774c
