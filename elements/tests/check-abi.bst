kind: script

build-depends:
- test/check-abi-deps.bst
- abi/desktop-abi-image.bst
- abi/reference-abi-image.bst

config:
  commands:
  - /utils/check-abi --new /new-image --old /old-image --forward-compatible 1 --suppressions /utils/abidiff-suppressions.ini

  layout:
  - element: abi/desktop-abi-image.bst
    destination: /new-image
  - element: abi/reference-abi-image.bst
    destination: /old-image
  - element: tests/check-abi-deps.bst
    destination: /
