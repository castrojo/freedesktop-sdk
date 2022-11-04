kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libtiff.bst
- filename: components/jpeg.bst

variables:
  conf-local: |
    --with-threads \
    --with-tiff \
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
- kind: git_tag
  url: github:mm2/Little-CMS.git
  track: master
  match:
  - lcms2.*
  exclude:
  - lcms2.*rc*
  ref: lcms2.14-0-ge88d9bcad79b7ebf6b97ebd634af31ed23c1b910
