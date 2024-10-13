kind: manual

build-depends:
- components/appstream-minimal.bst

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/metainfo" org.freedesktop.Platform.ffmpeg-full.metainfo.xml
  - |
    appstreamcli compose --components org.freedesktop.Platform.ffmpeg-full \
    --prefix %{prefix} --result-root %{install-root} \
    --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Platform.ffmpeg-full %{install-root}

sources:
- kind: local
  path: files/ffmpeg-full/org.freedesktop.Platform.ffmpeg-full.metainfo.xml

(@):
- elements/extensions/ffmpeg-full/config.yml
