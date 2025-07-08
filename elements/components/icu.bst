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
  url: github_files:unicode-org/icu/releases/download/release-77-1/icu4c-77_1-src.tgz
  ref: 588e431f77327c39031ffbb8843c0e3bc122c211374485fa87dc5f3faff24061
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
