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
  architecture: "amd64"
  ref: de8341047d671c4768898b926160876cf2a4892c14c25f3843e3307fdb022965
