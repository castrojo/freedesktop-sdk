# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: snap_image

build-depends:
- extensions/glxinfo/mesa-demos.bst
- snap-images/glxinfo-wrapper.bst

variables:
  lib: lib
  prefix: /app

config:
  directory: "/"
  include:
  - app
  exclude:
  - debug
  - devel
  - tests
  - shells
  include-orphans: False

  metadata:
    name: "freedesktop-sdk-glxinfo-%{freedesktop-sdk-snap-branch}"
    version: "%{freedesktop-sdk-snap-branch}"
    summary: "glxinfo for Freedesktop SDK %{freedesktop-sdk-snap-branch}"
    description: >-
      glxinfo provides information on available OpenGL devices. This
      is targeted to run on Freedesktop SDK runtime.  This application
      is meant for troubleshooting issues with OpenGL when using
      Freedesktop SDK runtime.
    type: app
    base: "freedesktop-sdk-runtime-%{freedesktop-sdk-snap-branch}"
    architectures:
    - "%{snap_arch}"
    confinement: strict
    grade: "%{snap_grade}"
    apps:
      glxinfo:
        command: glxinfo-wrapper
        plugs:
        - x11
        - opengl
        - wayland
    layout:
      /var/app:
        bind: $SNAP/app
