# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/python3-minimal.bst

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
    product: international_components_for_unicode

# The git repsitory is unreliable as tags are force-pushed
# See https://github.com/sdispater/tomlkit/issues/322
sources:
- kind: tar
  url: github_files:unicode-org/icu/releases/download/release-78.3/icu4c-78.3-sources.tgz
  ref: 3a2e7a47604ba702f345878308e6fefeca612ee895cf4a5f222e7955fabfe0c0
  version-guess-pattern: '(\d+)_(\d+)'
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
