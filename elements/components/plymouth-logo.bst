kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
    - install -Dm644 -t "%{install-root}%{datadir}/pixmaps" freedesktop-sdk-40.png
    - install -Dm644 freedesktop-sdk-40.png "%{install-root}%{datadir}/plymouth/themes/spinner/watermark.png"
 
sources:
- kind: local
  path: files/plymouth/freedesktop-sdk-40.png
