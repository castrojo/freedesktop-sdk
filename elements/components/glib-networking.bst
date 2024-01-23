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
- kind: git_tag
  url: gnome:glib-networking.git
  track: master
  track-extra:
  - glib-2-70
  match:
  - 2.72.*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 2.72.0-0-g8b3c602894fef3acea44b180658122c1c8ae7bf4
