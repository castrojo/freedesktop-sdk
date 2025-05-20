kind: flatpak_image

build-depends:
- extensions/mesa/mesa-extra.bst
- extensions/mesa/mesa-extra-metainfo.bst

(@):
- elements/extensions/mesa/config.yml

config:
  directory: "%{prefix}"
  exclude:
    - debug
    - docs
    - locale
    - devel
    - tests
    - shells

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GL.default
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      priority: -10
