kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: 0.4.41-0-g96dfe82ae431d8e4e06b6092171e231d693a73b5

