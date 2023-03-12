kind: flatpak_image

config:
  directory: '%{debugdir}'
  exclude:
  - docs
  - locale

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Debug

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

depends:
- filename: sdk-image.bst
  type: build
