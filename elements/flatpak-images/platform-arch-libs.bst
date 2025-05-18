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
      name: org.freedesktop.Platform.Compat.%{flatpak_arch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}

build-depends:
- platform-image.bst
- integration/compat-gl-dir.bst
- integration/compat-vaapi-dir.bst
