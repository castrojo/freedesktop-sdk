# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst


sources:
- kind: git_repo
  url: github:RedHatProductSecurity/cvss
  track: 'v*'
  ref: v3.6-0-g2f149099257ae06b98cef252efc440bddafe61e5
