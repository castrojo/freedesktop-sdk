# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/dbus-base.bst

runtime-depends:
- components/dbus-tools.bst
- components/libapparmor.bst
- components/libdbus.bst

config:
  exclude:
  - dbus-libs
  - dbus-tools
  include-orphans: true

public:
  initial-script:
    # This code gets messagebus's group id from /etc/groups and then sets it to dbus-daemon-launch-helper
    # We are not doing a simple grep so not to add an extra dependency
    script: |
      #!/bin/bash
      sysroot="${1}"
      file="${sysroot}%{libexecdir}/dbus-daemon-launch-helper"
      etc_group="${sysroot}/etc/group"
      if [ -f "$file" -a -f "$etc_group" ]; then
        groupid=
        while IFS=: read -r name _ gid _; do
          if [ "$name" = "messagebus" ]; then
            groupid="$gid"
            break
          fi
        done < "$etc_group"

        if [ -n "$groupid" ]; then
            chown "0:${groupid}" "$file"
            chmod 4750 "$file"
        fi
      fi
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/dbus"
    - "%{project_licensedir}/dbus/**"
