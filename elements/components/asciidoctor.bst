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
  track: v*
  ref: v2.0.22-0-g360e6f1251e9992be9fec52eb9cc8e70708ab610
