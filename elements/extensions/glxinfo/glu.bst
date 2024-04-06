kind: meson

(@): elements/extensions/include/app.yml

depends:
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/mesa-headers.bst
  type: build

sources:
- kind: git_repo
  url: freedesktop:mesa/glu.git
  track: glu-*
  ref: glu-9.0.3-0-ga2b96c7bba8db8fec3e02fb4227a7f7b02cabad1
