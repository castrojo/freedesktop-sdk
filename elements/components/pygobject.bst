kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
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
  ref: 3.52.2-0-g5980a0923af57d493c72b0c83a0eef6de366f423
- kind: git_repo
  url: github:python/pythoncapi-compat.git
  directory: subprojects/pythoncapi-compat
  ref: 2d18aecd7b2f549d38a13e27b682ea4966f37bd8
