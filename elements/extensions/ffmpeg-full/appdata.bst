kind: manual

build-depends:
- components/appstream-minimal.bst

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{libdir}/ffmpeg/share/metainfo" org.freedesktop.Platform.ffmpeg-full.appdata.xml
  - |
    appstreamcli compose --components org.freedesktop.Platform.ffmpeg-full \
    --prefix %{libdir}/ffmpeg --result-root %{install-root} \
    --data-dir %{install-root}%{flatpak_xmldir} --origin=flatpak %{install-root}

sources:
- kind: local
  path: files/ffmpeg-full/org.freedesktop.Platform.ffmpeg-full.appdata.xml

(@):
- elements/extensions/ffmpeg-full/config.yml
