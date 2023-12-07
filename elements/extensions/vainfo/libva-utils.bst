kind: meson

(@): elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/libva.bst

variables:
  meson-local: |
    -Ddrm=true \
    -Dwayland=true \
    -Dx11=true

sources:
- kind: git_repo
  url: github:intel/libva-utils.git
  track: '*.*.*'
  ref: 2.20.1-0-g2ad888bb463dc9bfb3deb512ec9faf78f1d3bfa8
