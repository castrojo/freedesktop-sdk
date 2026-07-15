# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-setuptools.bst
- components/swig.bst

depends:
- components/cryptsetup.bst
- components/glib.bst
- components/gpgme.bst
- components/nss.bst
- components/python3.bst

variables:
  conf-local: >-
    --without-python
    --with-python3

sources:
- kind: git_repo
  url: pagure:volume_key.git
  track: volume_key-*
  ref: volume_key-0.3.12-0-gf56614199726ba1897d8687f0927535693b6603f
