kind: flatpak_image

build-depends:
- extensions/mesa/mesa.bst

(@):
- elements/extensions/mesa/config.yml

config:
  directory: '%{debugdir}%{prefix}'
  include:
  - debug

  metadata:
    Runtime:
      name: org.freedesktop.Platform.GL.Debug.default
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
