# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/diffutils.bst
- components/cmake.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/help2man.bst
- components/liberation-fonts.bst
- components/polkit.bst
- components/python3-gi-docgen.bst
- components/python3-packaging.bst
- components/systemd.bst

depends:
- components/cairo.bst
- components/efivar.bst
- components/fwupd-efi-maybe.bst
- components/gcab.bst
- components/genpeimg.bst
- components/glib.bst
- components/gnu-efi-maybe.bst
- components/libcbor.bst
- components/libgudev.bst
- components/libjcat.bst
- components/libsmbios-maybe.bst
- components/libxmlb.bst
- components/pango.bst
- components/polkit.bst
- components/pycairo.bst
- components/pygobject.bst
- components/python3-pil.bst
- components/tpm2-tss.bst

variables:
  efi_binary: 'false'
  hsi: 'disabled'
  (?):
  - target_arch in ["i686", "x86_64", "aarch64", "loongarch64"]:
      efi_binary: 'true'
  - target_arch in ["i686", "x86_64"]:
      hsi: 'enabled'

  # FIXME: consider adding dependencies for passim and all plugins
  meson-local: >-
    -Ddocs=enabled
    -Defi_binary=%{efi_binary}
    -Dpolkit=enabled
    -Dpassim=disabled
    -Dplugin_modem_manager=disabled
    -Dvendor_ids_dir="%{datadir}/hwdata"
    -Dumockdev_tests=disabled
    -Dlibdrm=disabled
    -Dvalgrind=disabled
    -Dlibmnl=disabled
    -Dhsi=%{hsi}

sources:
- kind: git_repo
  url: github:fwupd/fwupd.git
  track: '*.*.*'
  ref: 2.1.6-0-g39073428dec74173d0a0ee4965b7372ffdf3dc1d
