kind: flatpak_image

config:
  directory: '%{datadir}/runtime/locale'
  exclude:
  - debug
  - docs
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Platform.Locale

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}

depends:
- filename: platform-image.bst
  type: build
