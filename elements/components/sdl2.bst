kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/ibus.bst
- components/pipewire.bst
- components/wayland-protocols.bst

depends:
- bootstrap-import.bst
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
    -DSDL_ARTS:BOOL=OFF
    -DSDL_ESD:BOOL=OFF
    -DSDL_NAS:BOOL=OFF
    -DSDL_ALSA:BOOL=OFF
    -DSDL_OSS:BOOL=OFF
    -DSDL_SNDIO:BOOL=OFF
    -DSDL_WAYLAND:BOOL=ON
    -DSDL_WAYLAND_SHARED:BOOL=OFF
    -DSDL_RPATH:BOOL=OFF
    -DSDL_WAYLAND_LIBDECOR=ON
    -DSDL_PIPEWIRE_SHARED:BOOL=ON

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/SDL2"
      mv "%{install-root}%{includedir}/SDL2/SDL_config.h" "%{install-root}%{includedir}/%{gcc_triplet}/SDL2/SDL_config.h"
      sed -i 's,\(# *include *\)"\(SDL_[^"]*\)",\1<SDL2/\2>,' "%{install-root}%{includedir}/%{gcc_triplet}/SDL2/SDL_config.h"
      sed -i 's,^Cflags: \(.*\),Cflags: -I%{includedir}/%{gcc_triplet}/SDL2 \1,' "%{install-root}%{libdir}/pkgconfig/sdl2.pc"
      sed -i 's,\(-I%{includedir}/SDL2\),-I%{includedir}/%{gcc_triplet}/SDL2 \1,' "%{install-root}%{bindir}/sdl2-config"

    - |
      cat >>%{install-root}%{libdir}/cmake/SDL2/sdl2-config.cmake <<EOF
      list(INSERT SDL2_INCLUDE_DIRS 0 "%{includedir}/%{gcc_triplet}/SDL2")
      EOF

    - |
      cat <<EOF >"%{install-root}%{includedir}/SDL2/SDL_config.h"
      #if defined(__x86_64__)
      # include "x86_64-linux-gnu/SDL2/SDL_config.h"
      #elif defined(__i386__)
      # include "i386-linux-gnu/SDL2/SDL_config.h"
      #elif defined(__aarch64__)
      # include "aarch64-linux-gnu/SDL2/SDL_config.h"
      #elif defined(__arm__)
      # include "arm-linux-gnueabihf/SDL2/SDL_config.h"
      #elif defined(__powerpc64__)
      # include "powerpc64le-linux-gnu/SDL2/SDL_config.h"
      #elif defined(__riscv) && (__riscv_xlen == 64)
      # include "riscv64-linux-gnu/SDL2/SDL_config.h"
      #else
      # error "Unknown cross-compiler"
      #endif
      EOF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/sdl2-config'
        - '%{libdir}/libSDL2.so'
        - '%{libdir}/libSDL2-2.0.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL.git
  track: release-*
  ref: release-2.30.0-0-g859844eae358447be8d66e6da59b6fb3df0ed778
