kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_HTML_DOCS:BOOL=OFF \
    -DBUILD_MAN_DOCS:BOOL=OFF \
    -DBUILD_QTHELP_DOCS:BOOL=OFF

sources:
- kind: git_tag
  url: github:KDE/extra-cmake-modules.git
  track: master
  exclude:
  - '*rc*'
  ref: v5.101.0-0-gf0ff8c0f7fbc2697a3ee87d2ab91c9844e020358
