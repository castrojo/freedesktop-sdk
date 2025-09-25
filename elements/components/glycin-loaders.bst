kind: meson

(@):
- elements/include/glycin.yml

depends:
  (>):
  - components/gdk-pixbuf.bst

variables:
  license-element-name: glycin
  meson-extra: >-
    -Dauto_features=disabled
    -Dlibglycin=false
    -Dintrospection=false
    -Dcapi_docs=false
    -Dvapi=false
    -Dglycin-thumbnailer=true    
    -Dglycin-loaders=true

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/glycin"
    - "%{project_licensedir}/glycin/**"
