kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/ibus.bst
- components/pipewire.bst
- components/wayland-protocols.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libsamplerate.bst
- components/libdbus.bst
- components/libdecor.bst
- components/libpulse.bst
- components/libxkbcommon.bst
- components/mesa-headers.bst
- components/wayland.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xcursor.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DSDL_TEST_LIBRARY:BOOL=OFF
    -DSDL_TESTS:BOOL=OFF
    -DSDL_EXAMPLES:BOOL=OFF
    -DSDL_ALSA:BOOL=OFF
    -DSDL_OSS:BOOL=OFF
    -DSDL_SNDIO:BOOL=OFF
    -DSDL_WAYLAND:BOOL=ON
    -DSDL_WAYLAND_SHARED:BOOL=OFF
    -DSDL_RPATH:BOOL=OFF
    -DSDL_WAYLAND_LIBDECOR=ON
    -DSDL_PIPEWIRE_SHARED:BOOL=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL3.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL.git
  track: release-*
  ref: release-3.2.8-0-gf6864924f76e1a0b4abaefc76ae2ed22b1a8916e
