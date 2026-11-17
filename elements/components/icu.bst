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

# The git repository is unreliable as tags are force-pushed
# See https://github.com/sdispater/tomlkit/issues/322
sources:
- kind: anitya
  project-id: 379847
  url: github_files:unicode-org/icu/releases/download/release-{version}/icu4c-{version}-sources.tgz
  ref:
    version: 79.1
    sha256sum: 06fa63ecb521048f8082f12ad988f6b678d90cbd88aafce24cbc94902b191d99
- kind: patch
  path: patches/icu/icu-fix-shared-linking.patch
