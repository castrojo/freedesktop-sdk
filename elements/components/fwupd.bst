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

  # FIXME: consider adding dependencies for passim and all plugins
  meson-local: >-
    -Ddocs=enabled
    -Dplugin_msr=%{plugin_msr}
    -Dplugin_uefi_capsule=%{plugin_uefi_capsule}
    -Defi_binary=%{efi_binary}
    -Dpolkit=enabled
    -Dpassim=disabled
    -Dlaunchd=disabled
    -Dplugin_flashrom=disabled
    -Dplugin_amdgpu=disabled
    -Dplugin_logitech_bulkcontroller=false
    -Dplugin_modem_manager=false

sources:
- kind: git_repo
  url: github:fwupd/fwupd.git
  track: '*.*.*'
  ref: 1.9.12-0-gf58214e249efdfeacfce24bfab678f9920e7b46c
