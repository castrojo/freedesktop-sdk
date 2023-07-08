kind: script

build-depends:
- utils/scan-for-dev-files.bst
- filename: platform-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    scan-for-dev-files /sysroot > found_dev_files.txt

    set -e; if [ -s found_dev_files.txt ]; then
    echo "Found development files:" 1>&2
    sort -u found_dev_files.txt 1>&2
    false
    fi
