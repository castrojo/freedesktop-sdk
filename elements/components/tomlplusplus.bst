kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:marzer/tomlplusplus.git
  track: v*
  ref: v3.4.0-0-g30172438cee64926dc41fdd9c11fb3ba5b2ba9de
