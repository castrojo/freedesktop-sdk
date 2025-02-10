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
- kind: git_repo
  url: github:mm2/Little-CMS.git
  track: lcms2.*
  exclude:
  - lcms2.*rc*
  ref: lcms2.17-0-g5176347635785e53ee5cee92328f76fda766ecc6
