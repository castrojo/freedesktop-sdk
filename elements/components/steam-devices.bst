kind: manual

build-depends:
- components/pkg-config.bst

depends:
- components/systemd.bst

config:
  install-commands:
  - |
    udevdir="$(pkg-config --variable udevdir udev)"
    install -Dm644 -t "%{install-root}${udevdir}/rules.d" *.rules

sources:
- kind: git_repo
  url: github:ValveSoftware/steam-devices
  track: v*
  ref: v1.0.0.61-0-g0563be5d6ccda6efa615fd00c46c13f7961a3b5a
