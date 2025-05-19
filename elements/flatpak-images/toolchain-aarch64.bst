kind: flatpak_image

depends:
- filename: cross-compilers/gcc-aarch64.bst
  type: build
- filename: cross-compilers/binutils-aarch64.bst
  type: build

(@):
- elements/cross-compilers/aarch64-vars.yml

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - docs
  - locale
  - tests
  - shells

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Extension.toolchain-%{cross_gcc_arch}
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
