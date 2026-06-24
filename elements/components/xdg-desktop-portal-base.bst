kind: meson

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/git.bst
- components/flatpak-minimal.bst
- components/fontconfig.bst
- components/fuse3.bst
- components/geoclue-libs.bst
- components/glib.bst
- components/pipewire.bst
- components/libgudev.bst
- components/sed.bst

variables:
  meson-local: >-
    -Dtests=disabled
    -Ddocumentation=disabled
    -Dman-pages=disabled

public:
  bst:
    split-rules:
      interfaces:
      - "%{datadir}/pkgconfig/*.pc"
      - "%{datadir}/dbus-1/interfaces"
      - "%{datadir}/dbus-1/interfaces/org.freedesktop.portal*"
      xdp-license:
      - "%{project_licensedir}"
      - "%{project_licensedir}/**"
  cpe:
    product: xdg-desktop-portal


config:
  configure-commands:
    (<):
    - |
      set -eu

      WRAP_FILE="%{build-root}/subprojects/libglnx.wrap"
      test -f "$WRAP_FILE"

      LIBGLNX_REV_NEEDED=$(sed -n 's/^revision[[:space:]]*=[[:space:]]*//p' "$WRAP_FILE")
      LIBGLNX_REV_FOUND=$(git -C subprojects/libglnx rev-parse HEAD)

      if [ "$LIBGLNX_REV_NEEDED" != "$LIBGLNX_REV_FOUND" ]; then
        echo "Error: libglnx revision mismatch!"
        echo "Needed: $LIBGLNX_REV_NEEDED"
        echo "Found:  $LIBGLNX_REV_FOUND"
        exit 1
      fi

sources:
- kind: git_repo
  url: github:flatpak/xdg-desktop-portal.git
  track: '1.*[02468].*'
  ref: 1.22.1-0-g1d20fadc304f6601452b5db65ed91197dba77041
- kind: git_repo
  url: gnome:libglnx.git
  ref: ff64d52116ae74f0d25e24f089db28921ea171ff
  directory: subprojects/libglnx
- kind: git_repo
  url: gnome:gvdb.git
  ref: c6f2359cc1d00f16e0a0e2527fa0bc1882b8b5ab
  directory: subprojects/gvdb
