kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/docbook-xml.bst

depends:
- bootstrap-import.bst
- components/pango.bst
- components/gtk3.bst
- components/libdrm.bst
- components/libevdev.bst
- components/plymouth-logo.bst
- components/systemd.bst

variables:
  meson-local: >-
    -Dlogo="%{datadir}/pixmaps/freedesktop-sdk-40.png"

config:
  install-commands:
    (>):
    - |
      install -Dm644 -t "%{install-root}%{datadir}/plymouth" plymouthd.defaults
sources:
- kind: git_repo
  url: freedesktop:plymouth/plymouth.git
  track: '*.*.*'
  ref: 26.134.222-0-gd15928a8e06c217aad0f2e3579df23fec93dc009
- kind: local
  path: files/plymouth/plymouthd.defaults
