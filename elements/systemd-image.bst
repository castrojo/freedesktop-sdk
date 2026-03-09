kind: compose

build-depends:
- components/systemd.bst
- components/linux.bst
- components/dbus.bst
- components/linux-pam.bst
- components/os-release.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - locale
  - extra
  - tests
