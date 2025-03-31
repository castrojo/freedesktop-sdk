kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst
- components/cmake.bst
- components/polkit.bst
- components/python3-gi-docgen.bst
- components/python3-packaging.bst
- components/help2man.bst
- components/liberation-fonts.bst

depends:
- components/fwupd-efi-maybe.bst
- components/glib.bst
- components/libgudev.bst
- components/libxmlb.bst
- components/libjcat.bst
- components/libarchive.bst
- components/gcab.bst
- components/efivar.bst
- components/tpm2-tss.bst
- components/cairo.bst
- components/pygobject.bst
- components/genpeimg.bst
- components/pango.bst
- components/polkit.bst
- components/pycairo.bst
- components/python3-pil.bst
- components/libsmbios-maybe.bst
- components/gnu-efi-maybe.bst

variables:
  efi_binary: 'false'
  (?):
  - target_arch in ["i686", "x86_64", "arm", "aarch64"]:
      efi_binary: 'true'

  # FIXME: consider adding dependencies for passim and all plugins
  meson-local: >-
    -Ddocs=enabled
    -Defi_binary=%{efi_binary}
    -Dpolkit=enabled
    -Dpassim=disabled
    -Dplugin_flashrom=disabled
    -Dplugin_logitech_bulkcontroller=disabled
    -Dplugin_modem_manager=disabled
    -Dvendor_ids_dir="%{datadir}/hwdata"
    -Dumockdev_tests=disabled
    -Dlibdrm=disabled
    -Dvalgrind=disabled

sources:
- kind: git_repo
  url: github:fwupd/fwupd.git
  track: '*.*.*'
  ref: 2.0.7-0-g3259059db765f6dedb51021eba08e9ce813d5ae9
