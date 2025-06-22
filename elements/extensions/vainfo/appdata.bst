kind: manual

(@):
- elements/extensions/include/app.yml

build-depends:
- components/appstream-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/metainfo" org.freedesktop.Platform.VaInfo.metainfo.xml
  - appstreamcli validate --no-net "%{install-root}%{datadir}/metainfo/org.freedesktop.Platform.VaInfo.metainfo.xml"
  - |
    appstreamcli compose --components org.freedesktop.Platform.VaInfo \
    --prefix %{prefix} --result-root %{install-root} \
    --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Platform.VaInfo %{install-root}

sources:
- kind: local
  path: files/vainfo/org.freedesktop.Platform.VaInfo.metainfo.xml
