kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xrandr.bst
- components/wayland.bst

variables:
  cmake-local: >-
    -DCMAKE_C_FLAGS_RELEASE:STRING=-DNDEBUG
    -DCMAKE_CXX_FLAGS_RELEASE:STRING=-DNDEBUG
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DBUILD_TESTING:BOOL=OFF
    -DGRAPHITE2_COMPARE_RENDERER=OFF

config:
  install-commands:
    (>):
    - |
      install -d -m755 "%{install-root}%{libdir}"
      for pattern in '*.so' '*.so.*' 'pkgconfig' 'graphite2'; do
        mv "%{install-root}%{prefix}/lib"/${pattern} "%{install-root}%{libdir}"
      done
      rm "%{install-root}%{prefix}/lib"/*.la

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgraphite2.so'
        - '%{libdir}/graphite2/*.cmake'

sources:
- kind: git_repo
  url: github:silnrsi/graphite.git
  track: '*.*.*'
  ref: 1.3.15-0-gca8d821e60a15b6c24e404c9086992c975d8e1cf
- kind: patch
  path: patches/graphite2/graphite2-1.2.0-cmakepath.patch
