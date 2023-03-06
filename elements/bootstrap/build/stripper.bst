kind: manual

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/base-sdk/xz.bst
- bootstrap/build/debugedit-build.bst
- bootstrap/build/dwz-build.bst

(@):
- elements/bootstrap/include/build.yml

config:
  build-commands:
  - |
    make

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" freedesktop-sdk-stripper

sources:
- kind: local
  path: files/stripper
