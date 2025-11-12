kind: flatpak_image

(@):
- elements/extensions/include/app.yml

config:
  directory: '%{debugdir}%{libdir}'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.VaInfo.Debug

build-depends:
- extensions/vainfo/libva-utils.bst
