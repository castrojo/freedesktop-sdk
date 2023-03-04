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
  architecture: "arm64"
  ref: 1aeadc18bfb82ac5e079304ca94603e4828a2d4ee5048c12e431967fccbef3e8
