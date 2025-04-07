kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Ddistro_install=true

public:
  cpe:
    version-match: '(?<=r)\d{2}'

sources:
- kind: git_repo
  url: github:benhoyt/inih.git
  track: r*
  ref: r59-0-g23acf2dd5af5287b0f170908c607560ab3995dae
