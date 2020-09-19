kind: script

build-depends:
- tests/check-dev-files-deps.bst
- filename: platform-image.bst
  config:
    location: /sysroot

config:
  commands:
  - |
    %{bindir}/scan-for-dev-files.sh /sysroot > found_dev_files.txt

    set -e; if [ -s found_dev_files.txt ]; then
    echo "Found development files:" 1>&2
    sort -u found_dev_files.txt 1>&2
    false
    fi
