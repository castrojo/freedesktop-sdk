kind: manual

depends:
- bootstrap-import.bst
- multiarch/multiarch-platform-arches.bst

variables:
  arches: ''
  (?):
  - target_arch == "x86_64":
      arches: >-
        i386-linux-gnu

  - target_arch == "aarch64":
      arches: >-
        arm-linux-gnueabihf

config:
  install-commands:
  - |
    mkdir -p %{install-root}%{indep-libdir}
    for i in %{arches}; do
      if [ "${i}" != "%{gcc_triplet}" ]; then
        ln -sr "%{install-root}/app/lib/${i}" "%{install-root}%{indep-libdir}/${i}"
      fi
    done
