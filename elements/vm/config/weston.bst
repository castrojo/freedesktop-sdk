kind: manual

depends:
- public-stacks/runtime-gnu.bst
- components/weston.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dm644 -t "%{install-root}%{indep-libdir}/systemd/system" weston.service
    install -Dm644 -t "%{install-root}%{indep-libdir}/systemd/system" create-weston-user.service
    install -Dm644 -t "%{install-root}%{sysconfdir}/xdg/weston" weston.ini
    install -Dm644 weston.preset "%{install-root}%{indep-libdir}/systemd/system-preset/50-weston.preset"
    install -Dm644 -t "%{install-root}%{datadir}/weston" freedesktop-sdk-logo.png

sources:
- kind: local
  path: files/vm/weston-config
