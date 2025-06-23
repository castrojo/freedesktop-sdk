kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/libtiff.bst
- components/jpeg.bst

variables:
  conf-local: >-
    --with-threads
    --with-tiff
    --with-jpeg

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblcms2.so'
  cpe:
    product: little_cms_color_engine
    ignored:
    - CVE-2016-10165

sources:
- kind: git_repo
  url: github:mm2/Little-CMS.git
  track: lcms2.*
  exclude:
  - lcms2.*rc*
  ref: lcms2.18-0-g35b57af4e1a4d6d7a40ba188f9f4efb7857ff511
