# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

variables:
  (@):
  - include/repo_branches.yml
  release-limit: "1"
  strip-binaries: ''
  license-element-name: "freedesktop-sdk"

build-depends:
- components/flatpak-minimal-image.bst

config:
  build-commands:
  - |
    for i in *.in; do
      m4 -D__RUNTIME_BRANCH__="%{freedesktop-sdk-flatpak-branch}" \
      "${i}" >"$(basename "${i}" .in)"
    done
    for metainfo in *.metainfo.xml; do
      appstreamcli news-to-metainfo --limit %{release-limit} NEWS.yml "${metainfo}"
    done

  install-commands:
  - |
    mkdir -p "%{install-root}%{indep-libdir}"
    install os-release "%{install-root}%{indep-libdir}"
    mkdir -p "%{install-root}%{sysconfdir}"
    ln -s "$(realpath --relative-to="%{install-root}%{sysconfdir}" "%{install-root}%{indep-libdir}/os-release")" %{install-root}%{sysconfdir}/os-release
    install issue "%{install-root}%{sysconfdir}"
    install issue.net "%{install-root}%{sysconfdir}"
    mkdir -p "%{install-root}%{datadir}/metainfo"
    install org.freedesktop.Platform.metainfo.xml "%{install-root}%{datadir}/metainfo"
    install org.freedesktop.Sdk.metainfo.xml "%{install-root}%{datadir}/metainfo"
    appstreamcli validate --no-net "%{install-root}%{datadir}/metainfo/org.freedesktop.Platform.metainfo.xml"
    appstreamcli validate --no-net "%{install-root}%{datadir}/metainfo/org.freedesktop.Sdk.metainfo.xml"
    appstreamcli compose --components=org.freedesktop.Platform --result-root=%{install-root} --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Platform  %{install-root}
    appstreamcli compose --components=org.freedesktop.Sdk --result-root=%{install-root} --data-dir %{install-root}%{flatpak_xmldir} --origin=org.freedesktop.Sdk %{install-root}

  - |
    %{install-extra}

sources:
- kind: local
  path: files/os-release
- kind: local
  path: NEWS.yml
- kind: local
  path: LICENSE
