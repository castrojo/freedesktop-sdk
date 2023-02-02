kind: autotools

depends:
- filename: bootstrap/base-sdk/binary-seed.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/file-source.yml

config:
  configure-commands:
    (<):
      - autoreconf -ivf
