kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -d "%{install-root}%{debugdir}"
  - ln -sr "%{install-root}/app/lib/debug" "%{install-root}%{debugdir}/app"

public:
  bst:
    split-rules:
      debug: []
