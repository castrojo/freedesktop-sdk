kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

variables:
  conf-root: "%{build-root}/icu4c/source"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/icu-config'
        - '%{libdir}/libicudata.so'
        - '%{libdir}/libicui18n.so'
        - '%{libdir}/libicuio.so'
        - '%{libdir}/libicutest.so'
        - '%{libdir}/libicutu.so'
        - '%{libdir}/libicuuc.so'
        - '%{libdir}/icu'
        - '%{libdir}/icu/**'

  cpe:
    version-match: '(\d+)-(\d+)'
    product: international_components_for_unicode

sources:
- kind: git_tag
  url: github:unicode-org/icu.git
  use-lfs: false
  track: main
  track-extra:
  - maint/maint-64
  exclude:
  - "release-*-rc"
  - "*-preview"
  - "*-alpha"
  - "*-beta"
  match:
  - "release-*"
  ref: release-71-1-0-gc205e7ee49a7086a28b9c275fcfdac9ca3dc815d
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
