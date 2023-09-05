kind: manual

build-depends:
- public-stacks/buildsystem-make.bst
- bootstrap/sed.bst

depends:
- public-stacks/runtime-minimal.bst

config:
  build-commands:
  - |
    make -f supported-locales.mk SUPPORTED

  install-commands:
  - |
    install -D -m0644 SUPPORTED "%{install-root}%{datadir}/i18n/SUPPORTED"

(@):
- elements/bootstrap/include/glibc-source.yml

sources:
  (>):
  - kind: local
    path: files/supported-locales.mk
