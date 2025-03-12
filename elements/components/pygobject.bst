kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/patch.bst

depends:
- components/python3.bst
- components/gobject-introspection.bst
- components/libffi.bst
- components/pycairo.bst

variables:
  meson-local: >-
    -Dtests=false

config:
  configure-commands:
    (<):
    - patch -p1 -d subprojects/pythoncapi-compat -i ../packagefiles/pythoncapi-compat-meson.diff

sources:
- kind: git_repo
  url: gnome:pygobject.git
  track: '*.*[02468].*'
  ref: 3.52.1-0-ge3dee9719e7249acfa7e78a3bbae251301a134a4
- kind: git_repo
  url: github:python/pythoncapi-compat.git
  directory: subprojects/pythoncapi-compat
  ref: 2d18aecd7b2f549d38a13e27b682ea4966f37bd8
