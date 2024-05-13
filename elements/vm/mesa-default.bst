kind: manual

build-depends:
- bootstrap-import.bst

runtime-depends:
- extensions/mesa/mesa.bst
- integration/ldconfig.bst

variables:
  ld_so_conf_d: "%{sysconfdir}/ld.so.conf.d"

config:
  install-commands:
  - |
    for i in vulkan/icd.d glvnd/egl_vendor.d OpenCL/vendors lib/dri \
             lib/d3d vulkan/explicit_layer.d vulkan/implicit_layer.d; do
      mkdir -p "%{install-root}%{libdir}/GL/$(dirname "${i}")"
      ln -rs "%{install-root}%{libdir}/GL/default/${i}" "%{install-root}%{libdir}/GL/${i}"
    done
  - |
    mkdir -p %{install-root}%{ld_so_conf_d}
    echo "%{libdir}/GL/default/lib" > %{install-root}%{ld_so_conf_d}/00_mesa.conf
