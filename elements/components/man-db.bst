kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flex.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/less.bst
- components/groff.bst
- components/libpipeline.bst
- components/libseccomp.bst
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
  url: tar_https:download-mirror.savannah.gnu.org/releases/man-db/man-db-2.12.1.tar.xz
  ref: ddee249daeb78cf92bab794ccd069cc8b575992265ea20e239e887156e880265
