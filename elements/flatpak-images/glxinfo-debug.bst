kind: flatpak_image

(@):
- elements/extensions/include/app.yml

config:
  directory: '%{debugdir}%{libdir}'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GlxInfo.Debug

depends:
- filename: extensions/glxinfo/mesa-demos.bst
  type: build
