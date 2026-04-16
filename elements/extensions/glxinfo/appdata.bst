# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/extensions/include/app.yml

build-depends:
- public-stacks/runtime-gnu.bst
- components/appstream-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/metainfo" org.freedesktop.Platform.GlxInfo.metainfo.xml
  - appstreamcli validate --no-net "%{install-root}%{datadir}/metainfo/org.freedesktop.Platform.GlxInfo.metainfo.xml"
  - |
    appstreamcli compose --components org.freedesktop.Platform.GlxInfo \
    --prefix %{prefix} --result-root %{install-root} \
    --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Platform.GlxInfo %{install-root}

sources:
- kind: local
  path: files/glxinfo/org.freedesktop.Platform.GlxInfo.metainfo.xml
