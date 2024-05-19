kind: autotools

build-depends:
- components/gtk-doc.bst
- components/python3-dbusmock.bst
- components/yelp-tools.bst
- public-stacks/buildsystem-autotools.bst

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst

variables:
  conf-local: >-
    --disable-gir-doc

sources:
- kind: git_repo
  url: github:endlessm/eos-metrics.git
  track: Release_*
  ref: Release_6.0.0-0-g893939f7be0996b3244dfcdf08aadc5accac8801
