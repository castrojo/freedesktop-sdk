kind: manual

(@):
- elements/extensions/codecs-extra/config.yml

build-depends:
- components/appstream-minimal.bst
- public-stacks/runtime-gnu.bst

variables:
  app-id: org.freedesktop.Platform.codecs-extra
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/metainfo" org.freedesktop.Platform.codecs-extra.metainfo.xml
  - appstreamcli validate --no-net "%{install-root}%{datadir}/metainfo/org.freedesktop.Platform.codecs-extra.metainfo.xml"
  - |
    appstreamcli compose --components org.freedesktop.Platform.codecs-extra \
    --prefix %{prefix} --result-root %{install-root} \
    --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Platform.codecs-extra %{install-root}

sources:
- kind: local
  path: files/codecs-extra/org.freedesktop.Platform.codecs-extra.metainfo.xml
