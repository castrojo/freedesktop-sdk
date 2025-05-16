kind: cmake

(@): elements/extensions/codecs-extra/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst
- components/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-root: "source"

  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DLIB_INSTALL_DIR="%{libdir}"
    -DENABLE_SHARED=ON
    -DENABLE_CLI=OFF

config:
  install-commands:
    (>):
    - find "%{install-root}%{prefix}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: git_https:bitbucket.org/multicoreware/x265_git.git
  track: '*.*'
  exclude:
  - "*rc*"
  ref: 4.1-0-g1d117bed4747758b51bd2c124d738527e30392cb
- kind: patch
  path: patches/libx265/cmakev4.patch
- kind: patch
  path: patches/libx265/cstdint.patch
