kind: compose

build-depends:
- components/flatpak-minimal.bst

config:
  exclude:
  - devel
  - extra
  - static-blocklist
  - static-allowlist
  - vm-only
  integrate: false
