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

sources:
- kind: git_tag
  url: github:mm2/Little-CMS.git
  ref: lcms2.12-0-g924a020d09bfe468c665467caf24aadeb41ff77c
