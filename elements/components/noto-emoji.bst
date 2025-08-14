kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -m 0755 -d "%{install-root}/usr/share/fonts/noto-emoji"
    install -p -m 644 fonts/NotoColorEmoji.ttf "%{install-root}/usr/share/fonts/noto-emoji"

  - |
    %{install-extra}

sources:
- kind: tar
  url: github_files:googlefonts/noto-emoji/archive/refs/tags/v2.048.tar.gz
  ref: e6396642172e3d5031bef5f381cc047a007588e73b26209ba1c47b3d1f8faa60
