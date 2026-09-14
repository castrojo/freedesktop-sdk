kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
# systemd is needed to resolve unit install dir
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/zstd.bst

config:
  install-commands:
    (>):
    - ln -sf plocate %{install-root}%{bindir}/locate

sources:
- kind: anitya
  project-id: 188202
  url: tar_https:plocate.sesse.net/download/plocate-{version}.tar.gz
  ref:
    version: '1.1.23'
    sha256sum: 06bd3b284d5d077b441bef74edb0cc6f8e3f0a6f58b4c15ef865d3c460733783
