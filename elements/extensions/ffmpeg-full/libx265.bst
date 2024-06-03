kind: cmake

(@): elements/extensions/ffmpeg-full/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst

depends:
- bootstrap-import.bst

variables:
  conf-root: "source"

  cmake-local: >-
    -DLIB_INSTALL_DIR="%{prefix}"
    -DENABLE_SHARED=ON
    -DENABLE_CLI=OFF

config:
  install-commands:
    (>):
    - cp -ra "%{build-root}/%{build-dir}/"*.so* "%{install-root}%{prefix}"
    - find "%{install-root}%{prefix}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: git_https:bitbucket.org/multicoreware/x265_git.git
  track: '*.*'
  exclude:
  - "*rc*"
  ref: 3.6-0-gaa7f602f7592eddb9d87749be7466da005b556ee
