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
- kind: tar
  url: github_files:unicode-org/icu/archive/refs/tags/release-73-2.tar.gz
  ref: c15f704e83c221c0680640a995d9db641f5b82098fb4b258a94b7d0561493c88
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
