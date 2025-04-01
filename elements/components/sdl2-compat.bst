kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst
- components/sdl3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/xorg-proto-xorgproto.bst
- components/mesa-headers.bst
- components/xorg-lib-x11.bst

variables:
  cmake-local: >-
    -DSDL2COMPAT_TESTS:BOOL=OFF

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/SDL2"
      mv "%{install-root}%{includedir}/SDL2/SDL_config.h" "%{install-root}%{includedir}/%{gcc_triplet}/SDL2/SDL_config.h"
      sed -i 's,\(# *include *\)"\(SDL_[^"]*\)",\1<SDL2/\2>,' "%{install-root}%{includedir}/%{gcc_triplet}/SDL2/SDL_config.h"
      sed -i 's,^Cflags: \(.*\),Cflags: -I%{includedir}/%{gcc_triplet}/SDL2 \1,' "%{install-root}%{libdir}/pkgconfig/sdl2-compat.pc"
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
      #elif defined(__loongarch__) && defined(__loongarch_double_float)
      # include "loongarch64-linux-gnu/SDL2/SDL_config.h"
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
  url: github:libsdl-org/sdl2-compat.git
  track: release-*
  ref: release-2.32.54-0-g005c6b27eb323ec3fc4c1a36da2c049d9acaded9
