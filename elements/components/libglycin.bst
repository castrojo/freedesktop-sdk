kind: meson

(@):
- elements/include/glycin.yml

variables:
  license-element-name: glycin
  meson-extra: >-
    -Dlibglycin=true
    -Dintrospection=true
    -Dcapi_docs=true
    -Dvapi=true
    -Dglycin-thumbnailer=false    
    -Dglycin-loaders=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libglycin-2.so'
    overlap-whitelist:
    - "%{project_licensedir}/glycin"
    - "%{project_licensedir}/glycin/**"
