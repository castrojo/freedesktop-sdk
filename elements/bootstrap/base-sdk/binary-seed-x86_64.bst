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
  ref: 9ce06fa60a0f1f075dd27eba03813db44c423afe449e2250a308a81890b29a55
