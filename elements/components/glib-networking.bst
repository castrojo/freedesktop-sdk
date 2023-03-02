kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/libproxy.bst
- filename: components/glib.bst
- filename: components/gnutls.bst
- filename: components/gsettings-desktop-schemas.bst
- filename: components/ca-certificates.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Dlibproxy=enabled

public:
  bst:
    split-rules:
      (@): include/_private/exclude-systemd.yml

sources:
- kind: git_repo
  url: gnome:glib-networking.git
  track: 2.*[02468].*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 2.74.0-0-gd17632fe495c573612dd69e982a0c49af2952178
