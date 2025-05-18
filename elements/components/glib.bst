kind: meson
description: Glib

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection-base.bst
- components/glib-stage1.bst
- components/python3-gi-docgen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libffi.bst
- components/util-linux.bst
- components/python3.bst
- components/python3-packaging.bst

runtime-depends:
- components/elfutils.bst

variables:
  meson-local: >-
    -Dselinux=disabled
    -Dman-pages=disabled
    -Ddocumentation=false
    -Ddtrace=disabled
    -Dsystemtap=disabled
    -Dglib_debug=disabled
    -Dsysprof=disabled

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
        - '%{datadir}/glib-2.0/gdb'
        - '%{datadir}/glib-2.0/gdb/**'
        - '%{datadir}/glib-2.0/valgrind'
        - '%{datadir}/glib-2.0/valgrind/**'
        - '%{datadir}/gobject-introspection-1.0'
        - '%{datadir}/gobject-introspection-1.0/**'
        - '%{libdir}/libgirepository-2.0.so'

    integration-commands:
    - |
      glib-compile-schemas %{datadir}/glib-2.0/schemas

    - |
      if [ -d "%{libdir}/gio/modules" ]; then
        gio-querymodules "%{libdir}/gio/modules"
      fi

(@):
- elements/include/glib-source.yml
