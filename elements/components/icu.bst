kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- components/python3.bst

config:
  configure-commands:
  - |
    mkdir "%{build-dir}"
    cd "%{build-dir}"
    ../source/configure %{conf-args}

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
    version-match: '(\d+)_(\d+)'
    product: international_components_for_unicode

# The git repsitory is unreliable as tags are force-pushed
# See https://github.com/sdispater/tomlkit/issues/322
sources:
- kind: tar
  url: github_files:unicode-org/icu/releases/download/release-74-1/icu4c-74_1-src.tgz
  ref: 86ce8e60681972e60e4dcb2490c697463fcec60dd400a5f9bffba26d0b52b8d0
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
