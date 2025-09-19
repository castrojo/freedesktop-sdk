kind: manual
description: |
  This element provides just the headers required to build
  Python. Because Bluez depends on Python, we cannot build Python without
  this element. Full elements is `components/bluez.bst`.

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{includedir}/bluetooth" lib/bluetooth/*.h

  - |
    %{install-extra}

(@): elements/include/bluez.yml
