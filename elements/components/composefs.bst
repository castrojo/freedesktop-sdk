kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/go-md2man.bst

depends:
- bootstrap-import.bst
- components/openssl.bst
- components/fuse3.bst

sources:
- kind: git_repo
  url: github:containers/composefs.git
  track: v*
  ref: v1.0.6-0-g2b6560edbef259d1b1801599455cf2ab9c126f3f
