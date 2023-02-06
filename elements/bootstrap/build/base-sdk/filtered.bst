kind: filter

(@):
- elements/bootstrap/include/build.yml

(?):
- bootstrap_build_arch == "x86_64":
    build-depends:
    - bootstrap/build/base-sdk/image-x86_64.bst
- bootstrap_build_arch == "aarch64":
    build-depends:
    - bootstrap/build/base-sdk/image-aarch64.bst

config:
  exclude:
    - filter
  include-orphans: True

sandbox:
  build-arch: '%{sandbox_arch}'

public:
  bst:
    integration-commands:
    - |
      mv /usr/etc /etc
