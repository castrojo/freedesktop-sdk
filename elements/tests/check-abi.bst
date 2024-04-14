kind: script

build-depends:
- tests/check-abi-deps.bst
- filename: abi/abi-image.bst
  config:
    location: /new-image
- filename: abi/abi-image.bst
  junction: abi/reference-abi.bst
  config:
    location: /old-image

config:
  commands:
  - check-abi --new /new-image --old /old-image --archive-on-core --forward-compatible --suppressions "%{datadir}/check-abi/check-abi-suppressions.json" --abidiff-suppressions "%{datadir}/check-abi/abidiff-suppressions.ini"
