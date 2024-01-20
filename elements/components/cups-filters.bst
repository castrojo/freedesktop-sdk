kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/avahi.bst
- components/ghostscript.bst
- components/mutool.bst

depends:
- components/dejavu-fonts.bst
- components/libppd.bst

variables:
  # There's a related Python script which opens files assuming no build-dir
  build-dir: ''
  conf-local: >-
    --without-rcdir
  # https://github.com/OpenPrinting/cups-filters/issues/512
  local_flags: "-std=c++17"

sources:
- kind: git_repo
  url: github:OpenPrinting/cups-filters.git
  track: '*.*.*'
  ref: 2.0.0-0-g2ddc72c47172b1b943fa9b228580d931edc9aa35
