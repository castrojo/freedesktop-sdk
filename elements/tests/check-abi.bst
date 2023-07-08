kind: script

build-depends:
- tests/check-abi-deps.bst
- filename: abi/abi-image.bst
  config:
    location: /new-image
- filename: abi/abi-image.bst
  junction: abi/freedesktop-sdk.bst
  config:
    location: /old-image

config:
  commands:
  - /utils/check-abi --new /new-image --old /old-image --archive-on-core --forward-compatible --suppressions /utils/check-abi-suppressions.json --abidiff-suppressions /utils/abidiff-suppressions.ini
