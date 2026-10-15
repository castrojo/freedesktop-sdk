# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script
description: |
  ## Kernel comparison utility

  <kernel-conf-utils/compare.bst> produces a `missing.txt` file.

  Each line in this file represents a Linux kernel configuration option
  that is enabled in both Debian and Fedora,
  but is completely missing or explicitly disabled the Freedkesktop-SDK Linux kernel

  ### Usage

  1. Track the Debian and Fedora kernel elements
    - `bst source track kernel-conf-utils/debian-config.bst kernel-conf-utils/fedora-config.bst`
    - This should be done every time you use this element.
  2. Build the utility element, to generate its results.
    `bst build kernel-conf-utils/compare.bst`
  3. Checkout and view the results
    `bst artifact checkout kernel-conf-utils/compare.bst`
  4. Use the information to update the Freedesktop-SDK config in <files/linux/fdsdk-config.sh>
  5. Remove the refs from the debian and fedora kernel elements, as you should track every time.
    - `git restore elements/kernel-conf-utils/debian-config.bst elements/kernel-conf-utils/fedora-config.bst`

build-depends:
- public-stacks/runtime-gnu.bst
- components/grep.bst
- components/linux.bst
- components/sed.bst
- kernel-conf-utils/conf-dirs.bst
- kernel-conf-utils/debian-config.bst
- kernel-conf-utils/fedora-config.bst

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
