kind: script

build-depends:
- components/libabigail.bst
- components/python3.bst
- abi/abi-image.bst
- tests/utils.bst
- abi/reference-abi-image.bst

config:
  commands:
  - /utils/check-abi --new /new-image --old /old-image --archive-on-abort --forward-compatible 1 --suppressions /utils/abidiff-suppressions.ini

  layout:
  - element: abi/abi-image.bst
    destination: /new-image
  - element: abi/reference-abi-image.bst
    destination: /old-image
  - element: components/libabigail.bst
    destination: /
  - element: components/python3.bst
    destination: /
  - element: tests/utils.bst
    destination: /utils
