kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/python3.bst
- components/libdbus.bst
- components/glib.bst

variables:
  meson-local: >-
    -Dtests=false

config:
  install-commands:
    (>):
    - python3 -m compileall -o 0 -o 1 -o 2 "%{install-root}"

sources:
- kind: pypi
  name: dbus-python
  ref:
    sha256sum: ad67819308618b5069537be237f8e68ca1c7fcc95ee4a121fe6845b1418248f8
    suffix: c1/d3/6be85a9c772d6ebba0cc3ab37390dd6620006dcced758667e0217fb13307/dbus-python-1.3.2.tar.gz
