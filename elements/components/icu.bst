kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

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
  url: github_files:unicode-org/icu/releases/download/release-75-1/icu4c-75_1-src.tgz
  ref: cb968df3e4d2e87e8b11c49a5d01c787bd13b9545280fc6642f826527618caef
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
