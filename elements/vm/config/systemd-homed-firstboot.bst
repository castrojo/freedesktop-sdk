kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm 644 \
        -t "%{install-root}%{indep-libdir}/systemd/system-preset" \
        systemd-homed-firstboot.preset

sources:
- kind: local
  path: files/vm/systemd-homed
