kind: manual

build-depends:
- components/appstream-minimal.bst
- public-stacks/runtime-gnu.bst

variables:
  prefix: "/usr/lib/%{gcc_triplet}/dri/intel-vaapi-driver"
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/metainfo" org.freedesktop.Platform.VAAPI.Intel.metainfo.xml
  - mkdir -p "%{install-root}%{prefix}/share"
  - appstreamcli validate --no-net "%{install-root}%{datadir}/metainfo/org.freedesktop.Platform.VAAPI.Intel.metainfo.xml"
  - |
    appstreamcli compose --components org.freedesktop.Platform.VAAPI.Intel \
    --prefix "%{prefix}" --result-root %{install-root} \
    --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Platform.VAAPI.Intel %{install-root}

sources:
- kind: local
  path: files/platform-vaapi-intel/org.freedesktop.Platform.VAAPI.Intel.metainfo.xml
