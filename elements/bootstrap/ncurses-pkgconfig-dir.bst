kind: script

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst

config:
  commands:
  - mkdir -p %{install-root}%{libdir}/pkgconfig
