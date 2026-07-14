# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script
description: |
    This compares Debian and Fedora kernel configuration. Find common
    items.  See which of those common items are missing in Freedesktop
    SDK.

build-depends:
- kernel-conf-utils/fedora-config.bst
- kernel-conf-utils/debian-config.bst
- kernel-conf-utils/conf-dirs.bst
- components/grep.bst
- components/linux.bst
- components/sed.bst
- public-stacks/runtime-minimal.bst

config:
  commands:
  # Find missing configuration items
  - |
    grep '^CONFIG_' </debian-config | sed 's/=[ym]$/=yes_or_mod/' | sort >debian-config-sorted
    grep '^CONFIG_' </fedora-config | sed 's/=[ym]$/=yes_or_mod/' | sort >fedora-config-sorted
    comm -12 debian-config-sorted fedora-config-sorted >common
    grep '^CONFIG_' </boot/config | sed 's/=[ym]$/=yes_or_mod/' | sort >fdsdk-config-sorted
    comm -13 fdsdk-config-sorted common >missing-in-fdsdk

  # Map them by kernel source directory
  - |
    for conf in $(cat missing-in-fdsdk); do
      conf="${conf%=*}"
      conf="${conf#CONFIG_}"
      if ! grep "^${conf}:" /configs.dir >>missing-with-dir.txt; then
        echo "${conf}:unknown" >>missing-with-dir.txt
      fi
    done

  # Sort them
  - |
    sed 's/\(.*\):\(.*\)/\2:\1/' missing-with-dir.txt | sort >'%{install-root}/missing.txt'
