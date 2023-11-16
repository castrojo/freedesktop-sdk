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
- components/libsoup.bst
- components/gcab.bst
- components/efivar.bst
- components/tpm2-tss.bst
- components/cairo.bst
- components/pygobject.bst
- components/genpeimg.bst
- components/pango.bst
- components/polkit.bst
- components/protobuf-c.bst
- components/pycairo.bst
- components/python3-pil.bst
- components/libsmbios-maybe.bst
- components/gnu-efi-maybe.bst

variables:
  plugin_msr: 'disabled'
  plugin_uefi_capsule: 'disabled'
  efi_binary: 'false'
  (?):
  - target_arch in ["arm", "aarch64"]:
      plugin_uefi_capsule: 'enabled'
      efi_binary: 'true'
  - target_arch in ["i686", "x86_64"]:
      plugin_msr: 'enabled'
      plugin_uefi_capsule: 'enabled'
      efi_binary: 'true'

  meson-local: >-
    -Dauto_features=disabled
    -Ddocs=enabled
    -Dplugin_msr=%{plugin_msr}
    -Dplugin_uefi_capsule=%{plugin_uefi_capsule}
    -Defi_binary=%{efi_binary}
    -Dpolkit=enabled

sources:
- kind: git_tag
  url: github:fwupd/fwupd.git
  track: main
  ref: 1.9.8-0-gf1579ab4e5996c59687a1c4d7ac1f6d48f0cb8f9
