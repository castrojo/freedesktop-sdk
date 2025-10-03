kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/grep.bst
- components/patch.bst

depends:
- components/python3.bst
- components/gobject-introspection.bst
- components/libffi.bst
- components/pycairo.bst

variables:
  meson-local: >-
    -Dtests=false

config:
  configure-commands:
    (<):
    - |
      set -eu
      PYCAPI_COMPAT_REV_NEEDED=$(grep '^revision=' %{build-root}/subprojects/pythoncapi-compat.wrap| cut -d'=' -f2)
      PYCAPI_COMPAT_REV_FOUND=$(git -C subprojects/pythoncapi-compat rev-parse HEAD)
      if [ "$PYCAPI_COMPAT_REV_NEEDED" != "$PYCAPI_COMPAT_REV_FOUND" ]; then
        echo "Error: PYCAPI_COMPAT revision mismatch!"
        echo "Needed: $PYCAPI_COMPAT_REV_NEEDED"
        echo "Found:  $PYCAPI_COMPAT_REV_FOUND"
        exit 1
      fi
    - patch -p1 -d subprojects/pythoncapi-compat -i ../packagefiles/pythoncapi-compat-meson.diff

sources:
- kind: git_repo
  url: gnome:pygobject.git
  track: '*.*[02468].*'
  ref: 3.54.3-0-g5e61c052bef1894c0b66fc4f8ad7d0121ab5d950
- kind: git_repo
  url: github:python/pythoncapi-compat.git
  directory: subprojects/pythoncapi-compat
  ref: 632d1aa0c4be6c67498d6b97630ddd7d7eb0f90a
