kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/vim.bst # provides xxd

depends:
- components/systemd.bst
- components/polkit.bst
- components/dbus.bst

config:
  install-commands:
    (>):
    - |
      sysusersdir="$(pkg-config --var sysusersdir systemd)"
      install -Dm644 -t "%{install-root}${sysusersdir}" rtkit.conf

sources:
- kind: git_repo
  url: github:heftig/rtkit.git
  track: v*
  ref: v0.13-0-gb9169402fe5e82d20efb754509eb0b191f214599
- kind: local
  path: files/rtkit/rtkit.conf
