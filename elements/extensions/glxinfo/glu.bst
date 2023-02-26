kind: autotools

(@): elements/extensions/include/app.yml

depends:
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/mesa-headers.bst
  type: build

sources:
- kind: git_repo
  url: freedesktop:mesa/glu.git
  track: glu-*
  ref: glu-9.0.2-0-gcbbff8857e49c5e4615e2f8e21dd18cc6317c252
