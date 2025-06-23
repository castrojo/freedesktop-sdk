kind: meson

(@):
- elements/extensions/include/app.yml
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/mesa-headers.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/xorg-lib-xi.bst

sources:
- kind: git_repo
  url: freedesktop:mesa/glu.git
  track: glu-*
  ref: glu-9.0.3-0-ga2b96c7bba8db8fec3e02fb4227a7f7b02cabad1
