kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:NixOS/patchelf.git
  track: master
  ref: 0.18.0-0-g99c24238981b7b1084313aca8f5c493bb46f302c
