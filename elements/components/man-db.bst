kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst
- components/systemd.bst

depends:
- bootstrap-import.bst
- components/less.bst
- components/groff.bst
- components/libpipeline.bst
- components/gzip.bst
- components/lzip.bst
- components/util-linux.bst

variables:
  conf-local: >-
    --disable-cache-owner

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/man-db/man-db-2.13.1.tar.xz
  ref: 8afebb6f7eb6bb8542929458841f5c7e6f240e30c86358c1fbcefbea076c87d9
