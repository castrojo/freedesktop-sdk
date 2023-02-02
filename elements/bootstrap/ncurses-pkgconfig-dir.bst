kind: script

build-depends:
- bootstrap/base-sdk/binary-seed.bst


(@):
- elements/bootstrap/include/target.yml

config:
  commands:
  - mkdir -p %{install-root}%{libdir}/pkgconfig
