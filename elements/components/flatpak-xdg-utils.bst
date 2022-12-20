kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst

sources:
- kind: git_repo
  url: github:flatpak/flatpak-xdg-utils.git
  track: '*.*.*'
  ref: 1.0.5-0-g5ba39872f81bf8d98d58c5f8acb86604645be468
