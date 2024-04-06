kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/genpeimg.bst
- components/gnu-efi.bst

sources:
- kind: git_repo
  url: github:fwupd/fwupd-efi.git
  track: '*.*'
  ref: 1.4-0-geb79ba8d3c35549f023a9d5fd2fe4c1c70c084d2
