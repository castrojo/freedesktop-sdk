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
- kind: git_repo
  url: freedesktop:dbus/dbus-python.git
  track: dbus-python-*
  ref: dbus-python-1.5.1-0-g3036add0105162cf7ca40b1bc8020e47fab7434d
