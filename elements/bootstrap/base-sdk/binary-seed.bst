kind: compose

(@):
- elements/bootstrap/include/base-sdk.yml

(?):
- bootstrap_build_arch == "x86_64":
    build-depends:
    - bootstrap/base-sdk/binary-seed-x86_64.bst
- bootstrap_build_arch == "aarch64":
    build-depends:
    - bootstrap/base-sdk/binary-seed-aarch64.bst
- bootstrap_build_arch == "ppc64le":
    build-depends:
    - bootstrap/base-sdk/binary-seed-ppc64le.bst
- bootstrap_build_arch == "riscv64":
    build-depends:
    - bootstrap/base-sdk/binary-seed-riscv64.bst

config:
  exclude:
    - filter
    - locale
  include-orphans: True
