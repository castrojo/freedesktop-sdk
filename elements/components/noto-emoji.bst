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
  url: github_files:googlefonts/noto-emoji/archive/refs/tags/v2.051.tar.gz
  ref: 04f3d1e5605edebebac00a7a0becb390a4a3ead015066905b27935b30c18e745
