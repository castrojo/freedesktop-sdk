kind: manual

depends:
- components/ruby.bst

config:
  build-commands:
  - |
    gem build

  install-commands:
  - |
    gemdir=$(gem environment gemdir)
    gem install asciidoctor-*.gem --install-dir "%{install-root}${gemdir}"
    mkdir -p "%{install-root}%{bindir}"
    ln -sr "%{install-root}${gemdir}/bin/asciidoctor" "%{install-root}%{bindir}/asciidoctor"

sources:
- kind: git_repo
  url: github:asciidoctor/asciidoctor.git
  track: v*.*.*
  ref: v2.0.20-0-ge559f0db61f5ad1446602253e0543568ff662bc8
