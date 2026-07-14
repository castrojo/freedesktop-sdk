# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: snap_image

build-depends:
- snap-images/sdk-snap-image.bst
- snap-images/snap-extra-fs.bst

config:
  directory: "/"
  exclude:
  - debug
  - docs
  - locale
  - tests
  - shells

  metadata:
    name: "freedesktop-sdk-sdk-%{freedesktop-sdk-snap-branch}"
    version: "%{freedesktop-sdk-snap-branch}"
    summary: "Freedesktop SDK %{freedesktop-sdk-snap-branch} SDK for snap"
    description: >-
      The Freedesktop SDK project provides Platform and SDK runtimes
      for Flatpak apps and runtimes based on Freedesktop modules.  It
      was originally started as a Flatpak subproject to create a
      basic-neutral runtime. It is now a separate project, similar to
      what happened with the GNOME and KDE runtimes.  This runtime is
      provided to Snap in order run flatpak applications.
    type: base
    architectures:
    - "%{snap_arch}"
    grade: "%{snap_grade}"
    assumes:
    - snapd2.45
