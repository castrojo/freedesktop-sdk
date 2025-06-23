kind: meson

(@):
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- (@): include/_private/gcc-for-recc.yml

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
  ref: 2.80.1-0-g1417a8dd98c46c208853c5ed95de61c384acea21
