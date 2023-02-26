kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/glib.bst

public:
  bst:
    integration-commands:
    - |
      update-desktop-database

sources:
- kind: git_repo
  url: freedesktop:xdg/desktop-file-utils.git
  track: '*.*'
  ref: 0.26-0-g54cec012921e52eb66b6ee1a1f40f2e9c9849f7c
