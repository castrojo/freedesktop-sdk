# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson
description: |
  GLib, low-level core library used as a basis by GTK, GNOME and others.

  Note that GLib includes some development tooling written in Python.
  To avoid including CPython in all systems, we don't include it in the
  runtime-depends list.

(@):
- elements/include/glib-source.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/glib-stage1.bst
- components/_private/gobject-introspection-base.bst
- components/python3-gi-docgen.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libffi.bst
# GIO uses libmount
- components/util-linux-libs.bst

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
        - '%{datadir}/glib-2.0/dtds'
        - '%{datadir}/glib-2.0/dtds/**'
        - '%{datadir}/glib-2.0/schemas/gschema.dtd'
        - '%{datadir}/glib-2.0/gettext/po/Makefile.in.in'
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
