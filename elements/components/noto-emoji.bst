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
  url: github_files:googlefonts/noto-emoji/archive/refs/tags/v2.038.tar.gz
  ref: 47d8b39733a1e82efced7dee96e30cb31d205b150dc3ca44d59abbb22d027195
