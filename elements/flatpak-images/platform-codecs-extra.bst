kind: flatpak_image

build-depends:
- extensions/codecs-extra/ffmpeg.bst
- extensions/codecs-extra/libheif.bst
- extensions/codecs-extra/appdata.bst

(@):
- elements/extensions/codecs-extra/config.yml

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - devel
  metadata:
    Runtime:
      name: org.freedesktop.Platform.codecs-extra

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
