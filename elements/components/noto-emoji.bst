kind: manual

depends:
- bootstrap-import.bst

variables:
  license-files-extra: fonts/LICENSE

config:
  install-commands:
  - |
    install -m 0755 -d "%{install-root}/usr/share/fonts/noto-emoji"
    install -p -m 644 fonts/NotoColorEmoji.ttf "%{install-root}/usr/share/fonts/noto-emoji"

  - |
    %{install-extra}

sources:
- kind: tar
  url: github:googlefonts/noto-emoji/archive/refs/tags/v2.034.tar.gz
  ref: a5af92ba8e297e447562d7bdb11453fa40be6d88655e4a647976f0c9be4245ab
