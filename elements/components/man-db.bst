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

public:
  bst:
    split-rules:
      (@): include/_private/exclude-systemd.yml

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/man-db/man-db-2.11.2.tar.xz
  ref: cffa1ee4e974be78646c46508e6dd2f37e7c589aaab2938cc1064f058fef9f8d
