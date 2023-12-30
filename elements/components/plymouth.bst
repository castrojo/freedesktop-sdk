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
- kind: git_tag
  url: freedesktop:plymouth/plymouth.git
  track: main
  ref: 23.360.11-0-gc835c7ff53aa25009b694fd66e9a6c55cbed670c
- kind: local
  path: files/plymouth/plymouthd.defaults
