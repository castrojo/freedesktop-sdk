kind: meson
description: Glib

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/libffi.bst
- components/util-linux.bst
- components/python3.bst

runtime-depends:
- components/python3-setuptools.bst

variables:
  meson-local: >-
    -Dselinux=disabled
    -Dgtk_doc=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{datadir}/glib-2.0/codegen'
        - '%{datadir}/glib-2.0/codegen/**'
        - '%{bindir}/glib-compile-resources'
        - '%{bindir}/glib-genmarshal'
        - '%{bindir}/glib-gettextize'
        - '%{bindir}/glib-mkenums'
        - '%{bindir}/gdbus-codegen'
        - '%{bindir}/gobject-query'
        - '%{bindir}/gresource'
        - '%{bindir}/gtester*'
        - '%{libdir}/libglib-2.0.so'
        - '%{libdir}/libgmodule-2.0.so'
        - '%{libdir}/libgobject-2.0.so'
        - '%{libdir}/libgio-2.0.so'
        - '%{libdir}/libgthread-2.0.so'
        - '%{libdir}/glib-2.0/include'
        - '%{libdir}/glib-2.0/include/**'

    integration-commands:
    - |
      glib-compile-schemas %{datadir}/glib-2.0/schemas

    - |
      if [ -d "%{libdir}/gio/modules" ]; then
        gio-querymodules "%{libdir}/gio/modules"
      fi

sources:
- kind: git_repo
  url: gnome:glib.git
  track: 2.*[02468].*
  ref: 2.78.3-0-g03f7c1fbf3a3784cb4c3604f83ca3645e9225577
- kind: git_module
  path: subprojects/gvdb
  url: gnome:gvdb.git
  ref: 0854af0fdb6d527a8d1999835ac2c5059976c210
