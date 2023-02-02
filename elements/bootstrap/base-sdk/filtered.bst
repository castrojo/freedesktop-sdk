kind: filter

(@):
- elements/bootstrap/include/build.yml

(?):
- bootstrap_build_arch == "x86_64":
    depends:
    - filename: bootstrap/base-sdk/binary-seed-x86_64.bst
      type: build
- bootstrap_build_arch == "aarch64":
    depends:
    - filename: bootstrap/base-sdk/binary-seed-aarch64.bst
      type: build

config:
  exclude:
    - filter
  include-orphans: True

public:
  bst:
    integration-commands:
    - |
      mv /usr/etc /etc
