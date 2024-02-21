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
  ref: v2.0.21-0-g1ec651ddcf4d2cb49576e7cc62c17ec33f8aa5c1
