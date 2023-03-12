kind: flatpak_image

config:
  directory: '%{datadir}/runtime/locale'
  exclude:
  - debug
  - docs

  metadata:
    Runtime:
      name: org.freedesktop.Platform.Locale

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}

depends:
- filename: platform-image.bst
  type: build
