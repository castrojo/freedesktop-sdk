kind: stack
description: Collects things that will be put into Flatpak image

depends:
- flatpak-images/sdk.bst
- flatpak-images/sdk-debug.bst
- flatpak-images/sdk-docs.bst
- flatpak-images/sdk-locale.bst
- flatpak-images/sdk-arch-libs.bst
- flatpak-images/sdk-arch-libs-debug.bst
- flatpak-images/platform.bst
- flatpak-images/platform-locale.bst
- flatpak-images/platform-arch-libs.bst
- flatpak-images/platform-arch-libs-debug.bst
- flatpak-images/platform-ffmpeg-full.bst
- flatpak-images/clinfo.bst
- flatpak-images/glxinfo.bst
- flatpak-images/glxinfo-debug.bst
- flatpak-images/vulkaninfo.bst
- flatpak-images/vainfo.bst
- flatpak-images/vainfo-debug.bst
- flatpak-images/vdpauinfo.bst
- flatpak-images/mesa.bst
- flatpak-images/mesa-debug.bst

(?):
- target_arch == "x86_64":
    depends:
      (>):
      - flatpak-images/toolchain-aarch64.bst
      - flatpak-images/toolchain-arm.bst
      - flatpak-images/toolchain-i686.bst
- target_arch == "i686" or target_arch == "x86_64":
    depends:
      (>):
        - flatpak-images/platform-vaapi-intel.bst
