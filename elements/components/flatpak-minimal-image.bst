kind: compose

build-depends:
- components/flatpak-minimal.bst
- components/m4.bst

config:
  exclude:
  - devel
  - extra
  - static-blocklist
  - static-allowlist
  - vm-only
  integrate: false
