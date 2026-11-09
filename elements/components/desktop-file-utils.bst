# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst

public:
  bst:
    integration-commands:
    - |
      if [ -d "%{datadir}/applications" ] || [ -d "${prefix}/local/share/applications" ]; then
        update-desktop-database
      fi

sources:
- kind: git_repo
  url: freedesktop:xdg/desktop-file-utils.git
  track: '*.*'
  ref: 0.29-0-g495012ddb82b1b97d4c80b51b95aa00eb07655e0
