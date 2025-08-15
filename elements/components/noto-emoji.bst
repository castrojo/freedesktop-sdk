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
  url: github_files:googlefonts/noto-emoji/archive/refs/tags/v2.047.tar.gz
  ref: 2cfaf5a427eb26334cdb30d98e4a0c005b660504a339249dc54373e566f09b50
