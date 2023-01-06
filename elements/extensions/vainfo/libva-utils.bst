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
- kind: git_tag
  url: github:intel/libva-utils.git
  track: v2.16-branch
  track-extra:
  # Attempt to predict the next branchpoint.
  - v2.17-branch
  ref: 2.17.0-0-g42c02a6a37b1bfce91a7f15c898750f2ee9e3d6a
