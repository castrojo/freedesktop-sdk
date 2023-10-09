kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst

public:
  bst:
    integration-commands:
    - |
      update-desktop-database

sources:
- kind: git_tag
  url: freedesktop:xdg/desktop-file-utils.git
  track: master
  ref: 0.27-0-g2470d73f93d02b354ecbee7c2f02a83efaae84d8
