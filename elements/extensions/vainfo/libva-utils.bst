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
  ref: 2.16.0-0-gcdf39e1e3da85a91ef53438c3b6a97e77dda96aa
