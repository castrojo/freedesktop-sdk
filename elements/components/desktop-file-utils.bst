kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/glib.bst

public:
  bst:
    integration-commands:
    - |
      update-desktop-database

sources:
- kind: git_repo
  url: freedesktop:xdg/desktop-file-utils.git
  track: '*.*'
  ref: 0.27-0-g2470d73f93d02b354ecbee7c2f02a83efaae84d8
