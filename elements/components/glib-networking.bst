kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libproxy.bst
- components/glib.bst
- components/gnutls.bst
- components/gsettings-desktop-schemas.bst
- components/ca-certificates.bst

variables:
  meson-local: |
    -Dlibproxy=enabled

sources:
- kind: git_repo
  url: gnome:glib-networking.git
  track: 2.*[02468].*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 2.90.1-0-gece5af2e7ffafe974c5c6ed6195000ff26a82aa5
