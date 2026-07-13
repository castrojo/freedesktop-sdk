# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: flatpak_image

(@):
- elements/flatpak-images/include/platform-vars.yml

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
      name: org.freedesktop.Sdk
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    Environment:
      GI_TYPELIB_PATH: /app/lib/girepository-1.0
      GST_PLUGIN_SYSTEM_PATH: /app/lib/gstreamer-1.0:/usr/lib/extensions/gstreamer-1.0:%{libdir}/codecs-extra/lib/gstreamer-1.0:%{libdir}/gstreamer-1.0
      XDG_DATA_DIRS: /app/share:/usr/share:/usr/share/runtime/share:/run/host/user-share:/run/host/share
      ALSA_CONFIG_DIR: /usr/share/alsa
      ALSA_CONFIG_PATH: /usr/share/alsa/alsa-flatpak.conf
      __EGL_EXTERNAL_PLATFORM_CONFIG_DIRS: /etc/egl/egl_external_platform.d:/usr/%{lib}/GL/egl/egl_external_platform.d:/usr/share/egl/egl_external_platform.d
      PYTHONUSERBASE: /var/data/python

    Extension org.freedesktop.Platform.GL:
      # 1.4 is for Nvidia drivers
      versions: "%{branch};%{branch-extra};1.4"
      version: "1.4"
      directory: "%{lib}/GL"
      subdirectories: "true"
      no-autodownload: "true"
      autodelete: "false"
      add-ld-path: "lib"
      merge-dirs: "%{gl_merge_dirs}"
      download-if: "active-gl-driver"
      enable-if: "active-gl-driver"
      autoprune-unless: active-gl-driver

    Extension org.freedesktop.Platform.GL.Debug:
      # 1.4 is for Nvidia drivers
      versions: "%{branch};%{branch-extra};1.4"
      version: "1.4"
      directory: "lib/debug%{libdir}/GL"
      subdirectories: "true"
      no-autodownload: "true"
      merge-dirs: "%{gl_merge_dirs}"
      enable-if: "active-gl-driver"
      autoprune-unless: active-gl-driver

    Extension org.freedesktop.Platform.VulkanLayer:
      version: "%{branch}"
      directory: "lib/extensions/vulkan"
      subdirectories: "true"
      no-autodownload: "true"
      merge-dirs: "share/vulkan/implicit_layer.d;share/vulkan/explicit_layer.d;"

    Extension org.freedesktop.Sdk.Debug:
      directory: lib/debug
      autodelete: 'true'
      no-autodownload: 'true'

    Extension org.freedesktop.Sdk.Docs:
      directory: share/runtime/docs
      autodelete: 'true'
      no-autodownload: 'true'

    Extension org.freedesktop.Sdk.Locale:
      directory: share/runtime/locale
      autodelete: 'true'
      locale-subset: 'true'

    Extension org.freedesktop.Platform.Timezones:
      directory: share/zoneinfo

    Extension org.freedesktop.Platform.GStreamer:
      directory: lib/extensions/gstreamer-1.0
      subdirectories: 'true'
      no-autodownload: 'true'

    Extension org.freedesktop.Platform.Icontheme:
      directory: share/runtime/share/icons
      subdirectories: 'true'
      no-autodownload: 'true'
      version: '1.0'

    Extension org.gtk.Gtk3theme:
      directory: share/runtime/share/themes
      subdirectories: 'true'
      subdirectory-suffix: gtk-3.0
      no-autodownload: 'true'
      version: '3.22'
      download-if: active-gtk-theme

    Extension org.freedesktop.Sdk.Extension:
      subdirectories: 'true'
      directory: lib/sdk
      no-autodownload: 'true'
      add-ld-path: lib

    Extension org.freedesktop.Platform.codecs-extra:
      directory: '%{lib}/codecs-extra'
      version: "%{branch-extra}"
      add-ld-path: lib
      autodelete: 'true'

    Extension org.freedesktop.Platform.VAAPI.Intel:
      directory: '%{lib}/dri/intel-vaapi-driver'
      autodelete: 'false'
      no-autodownload: 'true'
      download-if: have-intel-gpu
      autoprune-unless: have-intel-gpu

    Extension org.freedesktop.Platform.VAAPI.nvidia:
      directory: '%{lib}/dri/nvidia-vaapi-driver'
      autodelete: 'false'
      no-autodownload: 'true'
      add-ld-path: lib
      download-if: have-kernel-module-nvidia
      autoprune-unless: have-kernel-module-nvidia

    Extension org.freedesktop.Platform.amd:
      directory: '%{lib}/dri/amd'
      autodelete: 'false'
      no-autodownload: 'true'
      add-ld-path: lib
      download-if: have-kernel-module-amdgpu
      autoprune-unless: have-kernel-module-amdgpu
      subdirectories: "true"

    (?):
    - target_arch == "x86_64":
        Extension org.freedesktop.Sdk.Compat.i386:
          directory: 'lib/i386-linux-gnu'
          autodelete: 'true'
          no-autodownload: 'true'
          add-ld-path: '.'

        Extension org.freedesktop.Sdk.Compat.i386.Debug:
          directory: 'lib/debug/usr/lib/i386-linux-gnu'
          autodelete: 'true'
          no-autodownload: 'true'

        Extension org.freedesktop.Sdk.Compat.aarch64:
          directory: 'lib/aarch64-linux-gnu'
          autodelete: 'true'
          no-autodownload: 'true'
          add-ld-path: '.'

        Extension org.freedesktop.Sdk.Compat.aarch64.Debug:
          directory: "lib/debug/usr/lib/aarch64-linux-gnu"
          autodelete: 'true'
          no-autodownload: 'true'

build-depends:
- sdk-image.bst
- components/fontconfig-flatpak-config.bst
- components/os-release.bst
- integration/sdk-integration.bst
- integration/app-debug-link.bst
- tests/check-static-libraries.bst
- tests/sdk-integration.bst
- flatpak-images/copy-ld-debug.bst
