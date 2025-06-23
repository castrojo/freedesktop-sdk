kind: meson

(@):
- elements/extensions/include/app.yml
- include/_private/meson-recc.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
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
  ref: 2.23.0-0-g5896b6779d36f83bf483aff62da8aae30ba8d664
