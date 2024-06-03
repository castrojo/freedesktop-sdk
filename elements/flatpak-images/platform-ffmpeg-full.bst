kind: flatpak_image

build-depends:
- extensions/ffmpeg-full/ffmpeg.bst
- extensions/ffmpeg-full/libheif.bst
- extensions/ffmpeg-full/appdata.bst

(@):
- elements/extensions/ffmpeg-full/config.yml

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - devel
  metadata:
    Runtime:
      name: org.freedesktop.Platform.ffmpeg-full

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
