kind: meson
description: Glib

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/libffi.bst
- components/util-linux.bst
- components/pcre.bst
- components/python3.bst

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

  cpe:
    patches:
    - CVE-2023-32665
    - CVE-2023-29499
    - CVE-2023-32611
    - CVE-2023-32643
    - CVE-2023-32636

sources:
- kind: git_tag
  url: gnome:glib.git
  track: main
  track-extra:
  - glib-2-72
  match:
  - 2.72.*
  ref: 2.72.4-0-g6ed6303e40d6eaf80f2acfbfbcadbb169d156e9c
- kind: patch_queue
  path: patches/glib
