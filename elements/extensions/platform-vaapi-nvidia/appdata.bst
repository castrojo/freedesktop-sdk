kind: manual

build-depends:
- components/appstream-minimal.bst
- public-stacks/runtime-gnu.bst

variables:
  prefix: "/usr/lib/%{gcc_triplet}/dri/nvidia-vaapi-driver"
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/metainfo" org.freedesktop.Platform.VAAPI.nvidia.metainfo.xml
  - appstreamcli validate --no-net "%{install-root}%{datadir}/metainfo/org.freedesktop.Platform.VAAPI.nvidia.metainfo.xml"
  - |
    appstreamcli compose --components org.freedesktop.Platform.VAAPI.nvidia \
    --prefix "/usr/lib/%{gcc_triplet}/dri/nvidia-vaapi-driver" --result-root %{install-root} \
    --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Platform.VAAPI.nvidia %{install-root}

sources:
- kind: local
  path: files/platform-vaapi-nvidia/org.freedesktop.Platform.VAAPI.nvidia.metainfo.xml
