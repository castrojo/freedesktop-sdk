kind: manual

(@):
- elements/extensions/include/app.yml

build-depends:
- components/appstream-minimal.bst
- public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/metainfo" org.freedesktop.Platform.ClInfo.metainfo.xml
  - appstreamcli validate --no-net "%{install-root}%{datadir}/metainfo/org.freedesktop.Platform.ClInfo.metainfo.xml"
  - |
    appstreamcli compose --components org.freedesktop.Platform.ClInfo \
    --prefix %{prefix} --result-root %{install-root} \
    --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Platform.ClInfo %{install-root}

sources:
- kind: local
  path: files/clinfo/org.freedesktop.Platform.ClInfo.metainfo.xml
