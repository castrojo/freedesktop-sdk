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
      find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: freedesktop:gstreamer/orc.git
  track: '*.*.*'
  ref: 0.4.40-0-g6f6fa6f93a982c18314f772c328b46e169268b98

