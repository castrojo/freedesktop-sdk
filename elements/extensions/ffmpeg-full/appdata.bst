kind: manual

build-depends:
- components/appstream-glib.bst

variables:
  app-id: org.freedesktop.Platform.ffmpeg-full

config:
  install-commands:
  - |
    install -Dm644 -t "%{install-root}%{ffmpeg-prefix}/share/appdata" org.freedesktop.Platform.ffmpeg-full.appdata.xml
    appstream-compose --basename="%{app-id}" --prefix=%{install-root}%{ffmpeg-prefix} --origin=flatpak "%{app-id}"


sources:
- kind: local
  path: files/ffmpeg-full/org.freedesktop.Platform.ffmpeg-full.appdata.xml

(@):
- elements/extensions/ffmpeg-full/config.yml
