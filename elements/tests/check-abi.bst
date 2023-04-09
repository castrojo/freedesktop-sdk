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
  - /utils/check-abi --new /new-image --old /old-image --archive-on-abort --forward-compatible 1 --suppressions /utils/abidiff-suppressions.ini
