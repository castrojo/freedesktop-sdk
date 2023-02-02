kind: manual

depends:
- filename: bootstrap/base-sdk/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

- filename: bootstrap/build/debugedit-build.bst
  type: runtime
- filename: bootstrap/build/dwz-build.bst
  type: runtime

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
