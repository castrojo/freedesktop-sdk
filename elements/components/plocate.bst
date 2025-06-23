kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/systemd.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/zstd.bst

config:
  install-commands:
    (>):
    - ln -sf plocate %{install-root}%{bindir}/locate

sources:
- kind: tar
  url: tar_https:plocate.sesse.net/download/plocate-1.1.23.tar.gz
  ref: 06bd3b284d5d077b441bef74edb0cc6f8e3f0a6f58b4c15ef865d3c460733783
