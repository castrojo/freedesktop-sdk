kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrandr.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_C_FLAGS_RELEASE:STRING=-DNDEBUG \
    -DCMAKE_CXX_FLAGS_RELEASE:STRING=-DNDEBUG \
    -DBUILD_SHARED_LIBS:BOOL=ON \
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
  ref: 1.3.14-0-g92f59dcc52f73ce747f1cdc831579ed2546884aa
- kind: patch
  path: patches/graphite2/graphite2-1.2.0-cmakepath.patch
