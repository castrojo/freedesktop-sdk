kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

config:
  configure-commands:
  - |
    mkdir "%{build-dir}"
    cd "%{build-dir}"
    ../icu4c/source/configure %{conf-args}

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
- kind: git_repo
  url: github:unicode-org/icu.git
  track: release-*
  exclude:
  - "release-*-rc"
  - "*-preview"
  - "*-alpha"
  - "*-beta"
  ref: release-74-1-0-g9f64d3f269014814058091bfe9982c42d59847a7
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
