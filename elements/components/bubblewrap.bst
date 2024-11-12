kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libcap.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: github:projectatomic/bubblewrap.git
  track: v*
  ref: v0.11.0-0-g9ca3b05ec787acfb4b17bed37db5719fa777834f
