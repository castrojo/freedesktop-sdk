kind: import
description: Import the base freedesktop SDK

(@):
- elements/bootstrap/include/base-sdk.yml
- elements/bootstrap/base-sdk/binary-seed-integration.yml
- elements/bootstrap/base-sdk/binary-seed-split-rules.yml

sources:
- kind: docker
  (@):
  - elements/bootstrap/base-sdk/binary-seed-source.yml
  architecture: "riscv64"
  ref: 8dcf40566b63eea8e77e4631c9bd39ff2ee1cc349f32adc74e70b98db9a5d205
