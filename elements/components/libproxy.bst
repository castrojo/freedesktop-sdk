kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: |
    -DINCLUDE_INSTALL_DIR:PATH=%{includedir} \
    -DLIB_INSTALL_DIR:PATH=%{libdir} \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DMODULE_INSTALL_DIR=%{libdir}/libproxy/0.4.11/modules \
    -DWITH_PERL=OFF \
    -DWITH_GNOME3=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libproxy.so'
        - '%{datadir}/cmake'
        - '%{datadir}/cmake/**'

sources:
- kind: git_repo
  url: github:libproxy/libproxy.git
  track: '*.*.*'
  ref: 0.5.2-0-ge4f467b05c8adf25e5a2d5464914fc7e92bb7990
