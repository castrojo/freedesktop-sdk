kind: script

build-depends:
- tests/check-abi-deps.bst
- abi/abi-image.bst
- abi/reference-abi-image.bst

config:
  commands:
  - /utils/check-abi --new /new-image --old /old-image --archive-on-core --forward-compatible --suppressions /utils/abidiff-suppressions.ini

  layout:
  - element: abi/abi-image.bst
    destination: /new-image
  - element: abi/reference-abi-image.bst
    destination: /old-image
  - element: tests/check-abi-deps.bst
    destination: /
