kind: flatpak_image

config:
  directory: '%{libdir}'
  exclude:
  - debug
  - docs
  - locale
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Compat.%{flatpak_arch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

build-depends:
- sdk-image.bst
- multiarch/multiarch-sdk-gl-link.bst
