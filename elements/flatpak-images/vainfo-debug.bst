kind: flatpak_image

(@):
- elements/extensions/include/app.yml

config:
  directory: '%{debugdir}%{libdir}'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.VaInfo.Debug

depends:
- filename: extensions/vainfo/libva-utils.bst
  type: build
