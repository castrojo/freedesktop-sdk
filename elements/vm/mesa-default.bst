# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/flatpak-images/include/platform-vars.yml

build-depends:
- public-stacks/runtime-gnu.bst

runtime-depends:
- extensions/mesa/mesa.bst
- integration/ldconfig.bst

variables:
  ld_so_conf_d: "%{sysconfdir}/ld.so.conf.d"
  strip-binaries: ''

config:
  install-commands:
  - |
    paths="%{gl_merge_dirs}"
    OLDIFS="$IFS"
    IFS=';'
    for i in $paths; do
      mkdir -pv "%{install-root}%{libdir}/GL/$(dirname "${i}")"
      ln -rvs "%{install-root}%{libdir}/GL/default/${i}" "%{install-root}%{libdir}/GL/${i}"
    done
    IFS="$OLDIFS"
  - |
    mkdir -p %{install-root}%{ld_so_conf_d}
    echo "%{libdir}/GL/default/lib" > %{install-root}%{ld_so_conf_d}/00_mesa.conf
