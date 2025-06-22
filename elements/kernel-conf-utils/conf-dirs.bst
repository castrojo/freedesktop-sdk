kind: manual
description: |
    This extracts mapping for config items to kernel source
    directories.

(@):
- elements/include/linux.yml

build-depends:
- public-stacks/runtime-minimal.bst
- components/findutils.bst
- components/grep.bst
- components/sed.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - |
    find ./ \( -name Documentation -prune \) -o \( -name "Kconfig*" -exec grep -EH '^(menu)?config ' {} ";" \) | \
        sed 's/:menuconfig /:config /;s,^[.]/\(.*\)/Kconfig[^:/]*:config \(.*\)$,\2:\1,' >configs.dir

  install-commands:
  - |
    install -Dm644 -t '%{install-root}' configs.dir
