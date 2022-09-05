kind: script

build-depends:
- test/check-abi-deps.bst
- filename: abi/desktop-abi-image.bst
  config:
    layout: /new-image
- filename: abi/reference-abi-image.bst
  config:
    layout: /old-image

config:
  commands:
  - /utils/check-abi --new /new-image --old /old-image --forward-compatible 1 --suppressions /utils/abidiff-suppressions.ini
