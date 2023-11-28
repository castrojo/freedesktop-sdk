kind: flatpak_image

(@):
- elements/flatpak-images/include/platform-vars.yml

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - docs
  - locale

  metadata:
    Runtime:
      name: org.freedesktop.Platform
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    Environment:
      GI_TYPELIB_PATH: /app/lib/girepository-1.0
      GST_PLUGIN_SYSTEM_PATH: /app/lib/gstreamer-1.0:/usr/lib/extensions/gstreamer-1.0:%{libdir}/gstreamer-1.0
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

    Extension org.freedesktop.Platform.Locale:
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

    Extension org.freedesktop.Platform.VAAPI.Intel:
      directory: '%{lib}/dri/intel-vaapi-driver'
      autodelete: 'false'
      no-autodownload: 'true'
      add-ld-path: lib
      download-if: have-intel-gpu
      autoprune-unless: have-intel-gpu

    Extension org.freedesktop.Platform.openh264:
      directory: '%{lib}/openh264'
      versions: '%{openh264-version}beta;%{openh264-version}'
      version: '%{openh264-version}'
      add-ld-path: extra
      autodelete: 'true'

build-depends:
- platform-image.bst
- components/fontconfig-flatpak-config.bst
- components/os-release.bst
- integration/platform-integration.bst
- tests/check-dev-files.bst
- tests/check-rpath.bst
- tests/platform-integration.bst
