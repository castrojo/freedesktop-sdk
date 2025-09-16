kind: manual

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: fonts/LICENSE
  strip-binaries: ''

config:
  install-commands:
  - |
    install -Dpm 644 fonts/NotoColorEmoji.ttf "%{install-root}%{datadir}/fonts/noto-emoji"

  - |
    %{install-extra}

sources:
- kind: tar
  url: github_files:googlefonts/noto-emoji/archive/refs/tags/v2.051.tar.gz
  ref: 04f3d1e5605edebebac00a7a0becb390a4a3ead015066905b27935b30c18e745
