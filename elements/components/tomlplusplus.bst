kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:marzer/tomlplusplus.git
  track: v*
  ref: v3.4.0-0-g30172438cee64926dc41fdd9c11fb3ba5b2ba9de
