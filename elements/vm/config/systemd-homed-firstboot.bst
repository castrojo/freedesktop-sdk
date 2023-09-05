kind: manual

depends:
- public-stacks/runtime-minimal.bst


config:
  install-commands:
  - |
    install -Dm 644 \
        -t "%{install-root}%{indep-libdir}/systemd/system-preset" \
        systemd-homed-firstboot.preset

sources:
- kind: local
  path: files/vm/systemd-homed
