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
  architecture: "ppc64le"
  ref: 2c5959a4716dbd6cca2c9d1a9b743a8b20cf2680a7092fed3a65a400a0bb601b
