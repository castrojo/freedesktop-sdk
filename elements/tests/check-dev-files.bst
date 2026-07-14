# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- filename: platform-image.bst
  config:
    location: /sysroot

- utils/scan-for-dev-files.bst

config:
  commands:
  - |
    scan-for-dev-files /sysroot > found_dev_files.txt

    set -e; if [ -s found_dev_files.txt ]; then
    echo "Found development files:" 1>&2
    sort -u found_dev_files.txt 1>&2
    false
    fi
