kind: flatpak_image

depends:
- filename: extensions/platform-hip/hip.bst
  type: build

config:
  directory: "%{libdir}/rocm"

  metadata:
    Runtime:
      name: org.freedesktop.Platform.HIP.AMD
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
 