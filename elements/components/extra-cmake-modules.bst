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
- kind: git_repo
  url: github:KDE/extra-cmake-modules.git
  track: v*
  exclude:
  - '*rc*'
  ref: v5.110.0-0-gebe092511d8986d1b4b244d59649bf8fa2834b7e
