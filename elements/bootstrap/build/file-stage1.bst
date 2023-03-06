kind: autotools

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/gnu-config.bst

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/file-source.yml

config:
  configure-commands:
    (<):
      - autoreconf -ivf
