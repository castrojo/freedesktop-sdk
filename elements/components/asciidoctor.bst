kind: manual

depends:
- components/ruby.bst

variables:
  strip-binaries: ''

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

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:asciidoctor/asciidoctor.git
  track: v*.*.*
  ref: v2.0.25-0-g96fc8314e63356a759000a123962aac70c0b90e9
