kind: script

build-depends:
- bootstrap/base-sdk/base-sdk.bst


(@):
- elements/bootstrap/include/target.yml

config:
  commands:
  - mkdir -p %{install-root}%{libdir}/pkgconfig
