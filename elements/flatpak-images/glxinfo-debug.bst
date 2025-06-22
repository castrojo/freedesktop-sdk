kind: flatpak_image

variables:
  lib: lib
  prefix: /app

config:
  directory: '%{debugdir}%{libdir}'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GlxInfo.Debug

build-depends:
- extensions/glxinfo/mesa-demos.bst
