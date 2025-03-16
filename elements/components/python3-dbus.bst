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
    sha256sum: 991666e498f60dbf3e49b8b7678f5559b8a65034fdf61aae62cdecdb7d89c770
    suffix: 
      ff/24/63118050c7dd7be04b1ccd60eab53fef00abe844442e1b6dec92dae505d6/dbus-python-1.4.0.tar.gz
