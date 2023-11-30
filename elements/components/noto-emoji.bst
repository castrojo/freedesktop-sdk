kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -m 0755 -d "%{install-root}/usr/share/fonts/noto-emoji"
    install -p -m 644 fonts/NotoColorEmoji.ttf "%{install-root}/usr/share/fonts/noto-emoji"

sources:
- kind: tar
  url: github_files:googlefonts/noto-emoji/archive/refs/tags/v2.042.tar.gz
  ref: b56bd2fa4029d0f057b66b742ac59af243dbc91067fed3eb4929dac762440fc9
