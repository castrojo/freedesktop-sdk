kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Ddistro_install=true

sources:
- kind: git_tag
  url: github:benhoyt/inih.git
  track: master
  ref: r56-0-g5e1d9e2625842dddb3f9c086a50f22e4f45dfc2b
