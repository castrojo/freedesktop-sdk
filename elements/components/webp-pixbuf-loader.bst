kind: meson

(@):
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/gdk-pixbuf.bst
- components/libwebp.bst

sources:
- kind: git_repo
  url: github:aruiz/webp-pixbuf-loader.git
  track: '*.*.*'
  ref: 0.2.7-0-g52232e4ba282b2fed68e8fcb4b5d45ed0eaa4ed3
