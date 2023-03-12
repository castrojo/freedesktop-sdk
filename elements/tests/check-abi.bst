kind: script

build-depends:
- tests/check-abi-deps.bst
- filename: abi/abi-image.bst
  config:
    location: /new-image
- filename: abi/reference-abi-image.bst
  config:
    location: /old-image

config:
  commands:
  - /utils/check-abi --new /new-image --old /old-image --forward-compatible 1 --suppressions /utils/abidiff-suppressions.ini
