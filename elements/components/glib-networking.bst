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
  track: 2.78.*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 2.78.1-0-gff3ed94057edfd2e4d4c45c5e53e5b41d19fad6a
