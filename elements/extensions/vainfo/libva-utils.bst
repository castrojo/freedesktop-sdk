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
  ref: 2.18.1-0-g38e2a657e8910677de6138f047e9e7525c88ed6c
