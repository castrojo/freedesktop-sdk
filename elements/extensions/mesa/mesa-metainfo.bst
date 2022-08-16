kind: manual

build-depends:
- components/appstream-glib.bst
- components/git-minimal.bst
- components/m4.bst

variables:
  app-id: >-
    org.freedesktop.Platform.GL.default
    org.freedesktop.Platform.GL32.default

config:
  install-commands:
  - |
    set -e
    appdata_dir=%{install-root}%{datadir}/appdata
    mkdir -p ${appdata_dir}
    CURRENT_REF=$(git describe --match mesa-*)
    TIMESTAMP=$(git log -1 --format="%at" ${CURRENT_REF})
    VERSION_DATE=$(date -d @"$TIMESTAMP" -Idate)
    for app_id in %{app-id}
    do
      m4 -D__VERSION__=${CURRENT_REF} -D__VERSION_DATE__=${VERSION_DATE} \
      -D__APP_ID__=${app_id} \
      appdata.template > ${appdata_dir}/${app_id}.appdata.xml
      appstream-compose --basename ${app_id} \
      --prefix=%{install-root}%{prefix} --origin=flatpak ${app_id}
    done

(@):
- elements/extensions/mesa/config.yml
- elements/extensions/mesa/mesa-sources.yml
