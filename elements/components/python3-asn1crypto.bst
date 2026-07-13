# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:wbond/asn1crypto.git
  track: "*.*.*"
  ref: 1.5.1-0-g835365ca6744c7afee793f050faf0a91ddb140b7
