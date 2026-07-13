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
  ref: 0.28-0-gbc403b7e9ea4847b1590c41eb1581aa3f1d24b36
