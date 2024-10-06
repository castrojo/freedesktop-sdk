kind: manual

build-depends:
- public-stacks/runtime-minimal.bst

config:
  install-commands:
  - install -d "%{install-root}%{debugdir}"
  - ln -sr "%{install-root}/app/lib/debug" "%{install-root}%{debugdir}/app"

public:
  bst:
    split-rules:
      debug: []
