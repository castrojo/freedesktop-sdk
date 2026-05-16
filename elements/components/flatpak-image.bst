kind: compose

build-depends:
- components/flatpak.bst
- components/m4.bst

config:
  exclude:
  - doc
  - debug
  - devel
  - extra
  - static-blocklist
  - static-allowlist
  - vm-only
  integrate: false
