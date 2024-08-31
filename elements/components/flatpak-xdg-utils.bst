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
  ref: 1.0.6-0-g05abdd7421688be5835a6b12f2b068086c38d4aa
