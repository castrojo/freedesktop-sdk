# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst

depends:
- components/python3.bst

runtime-depends:
# System tzdata needed for python std zoneinfo
- components/tzdata.bst

variables:
  strip-binaries: ''

config:
  configure-commands:
  - |
    python3 scripts/download_import_cldr.py

sources:
- kind: git_repo
  url: github:python-babel/babel.git
  track: v*.*.*
  ref: v2.19.0-0-g351b14508b0bdeeeb7b0feea92d768a753e1487d
- kind: patch
  path: patches/python3-babel/0001-Relax-hatchling-build-system-constraint.patch
# Requirement set in scripts/download_import_cldr.py
- kind: remote
  url: tar_https:unicode.org/Public/cldr/49/cldr-common-49.zip
  ref: 78403d8d6fb1fed6e208bf9001bf5be00bb5abfd9f8110dae062bf49309d6a89
  directory: cldr
  filename: cldr-common-49.zip
- kind: remote
  url: tar_https:unicode.org/Public/cldr/49/cldr-exemplars-delta-49.zip
  ref: 431005849467937da777c8ee70009a8d45042fcd5a25e9e5b432b50d081d8c67
  directory: cldr
  filename: cldr-exemplars-delta-49.zip
