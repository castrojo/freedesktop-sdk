kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/gtk-doc.bst
  type: build

variables:
  meson-local: >-
    -Dorc-test=disabled
    -Dexamples=disabled
    -Dbenchmarks=disabled
    -Dtests=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/orc'
        - '%{libdir}/liborc-0.4.so'

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

sources:
- kind: git_repo
  url: freedesktop:gstreamer/orc.git
  track: '*.*.*'
  ref: 0.4.38-0-gf071d3a14f28c7c5acff5ff0b5a67ecd3f785ef3

