kind: manual

(@):
- flatpak-version.yml

variables:
  (@):
  - include/repo_branches.yml

build-depends:
- bootstrap-import.bst
- components/m4.bst
- components/appstream-minimal.bst

config:
  build-commands:
  - |
    for i in *.in; do
      m4 -D__RUNTIME_VERSION__="%{runtime-version}" \
      -D__RUNTIME_VERSION_DATE__="%{runtime-version-date}" \
      -D__RUNTIME_BRANCH__="%{freedesktop-sdk-flatpak-branch}" \
      "${i}" >"$(basename "${i}" .in)"
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
    install org.freedesktop.Platform.appdata.xml "%{install-root}%{datadir}/metainfo"
    install org.freedesktop.Sdk.appdata.xml "%{install-root}%{datadir}/metainfo"
    appstreamcli compose --components=org.freedesktop.Platform --result-root=%{install-root} --data-dir %{install-root}%{flatpak_xmldir} --origin=flatpak %{install-root}
    appstreamcli compose --components=org.freedesktop.Sdk --result-root=%{install-root} --data-dir %{install-root}%{flatpak_xmldir} --origin=flatpak %{install-root}

sources:
- kind: local
  path: files/os-release

