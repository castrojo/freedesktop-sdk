kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/ibus.bst
- components/wayland-protocols.bst

depends:
- bootstrap-import.bst
- components/libsamplerate.bst
- components/libdbus.bst
- components/libpulse.bst
- components/libxkbcommon.bst
- components/mesa-headers.bst
- components/wayland.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xcursor.bst

variables:
  cmake-local: >-
    -DSDL_ARTS=OFF
    -DSDL_ESD=OFF
    -DSDL_NAS=OFF
    -DSDL_ALSA=OFF
    -DSDL_OSS=OFF
    -DSDL_SNDIO=OFF
    -DSDL_WAYLAND=ON
    -DSDL_WAYLAND_SHARED=OFF
    -DSDL_RPATH=OFF
    -DSDL_STATIC=OFF

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
  track: release-2.24.*
  ref: release-2.24.2-0-g55b03c7493a7abed33cf803d1380a40fa8af903f

