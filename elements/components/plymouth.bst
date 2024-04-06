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
  ref: 24.004.60-0-gd6e6366d622962dce02d8c7e4ab814f54a202509
- kind: local
  path: files/plymouth/plymouthd.defaults
