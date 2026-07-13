# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

(@):
- elements/snap-images/snap-common.yml

build-depends:
- components/squashfs-tools.bst
- filename: snap-images/sdk.bst
  config:
    location: '%{build-root}'

variables:
  snap-target: sdk.snap
