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
  ref: v5.98.0-0-g479fe1a4051dc8cdd2a4e235a86c7dd41126ccbf
