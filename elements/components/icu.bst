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
  ref: release-73-2-0-g680f521746a3bd6a86f25f25ee50a62d88b489cf
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
