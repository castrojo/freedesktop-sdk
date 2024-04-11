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
  ref: lcms2.15-0-gd0752309ff93f62be246ee9bf18338107f30d485
